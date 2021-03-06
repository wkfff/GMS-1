unit uBuildingAlarmConfirm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvGlassButton, Vcl.StdCtrls, AdvSmoothPanel, AdvGroupBox, uSubForm,
  CommandArray, Vcl.ComCtrls, AdvProgr,ActiveX,ADODB, AdvToolBar,
  AdvToolBarStylers, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvAppStyler,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, AdvGlowButton;

type
  TfmBuildingAlarmConfirm = class(TfmASubForm)
    Pan_Workcode: TAdvSmoothPanel;
    Label3: TLabel;
    Memo1: TMemo;
    sg_AlarmEvent: TAdvStringGrid;
    AdvProgress1: TAdvProgress;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure sg_AlarmEventCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FFormTYPE: String;
    FSearchID: String;
    FSave: Boolean;
    { Private declarations }
    procedure LoadAlarmEvent;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure FontSetting;
  public
    { Public declarations }
    property FormTYPE : String read FFormTYPE write FFormTYPE;
    property SearchID : String read FSearchID write FSearchID;
    property Save : Boolean read FSave write FSave;
  end;

var
  fmBuildingAlarmConfirm: TfmBuildingAlarmConfirm;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBSelect,
  uDBUpdate,
  uFormVariable,
  uFormDeviceState,
  uFormFunction,
  uFormUtil,
  uPCClient;
{$R *.dfm}

procedure TfmBuildingAlarmConfirm.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmBuildingAlarmConfirm.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmBuildingAlarmConfirm.btn_SaveClick(Sender: TObject);
var
  bChkState : boolean;
  nLoop : integer;
  stTime : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stMsgNo : string;
begin
  inherited;
  if Memo1.Text = '' then
  begin
    showmessage('조치내역을 입력 하세요.');
    Exit;
  end;
  AdvProgress1.Visible := True;
  AdvProgress1.Max := sg_AlarmEvent.RowCount - 1;
  with sg_AlarmEvent do
  begin
    for nLoop := 1 to RowCount - 1 do   //체크되어 있는 알람을 모두 확인 함.
    begin
      AdvProgress1.Position := nLoop;
      GetCheckBoxState(0,nLoop, bChkState);
      if bChkState then  //체크 되어 있으면
      begin
        if Cells[10,nLoop] = '' then continue;
        if Cells[2,nLoop] = '' then continue;
        if Cells[11,nLoop] = '' then continue;
        if Cells[12,nLoop] = '' then continue;
        stTime := Cells[12,nLoop];
        stTime := stringReplace(stTime,'-','',[rfReplaceAll]);
        stTime := stringReplace(stTime,':','',[rfReplaceAll]);
        stTime := stringReplace(stTime,' ','',[rfReplaceAll]);

        stNodeNo := Cells[10,nLoop];
        stEcuID := Cells[2,nLoop];
        stExtendID := Cells[13,nLoop];
        stMsgNo := Cells[11,nLoop];
        dmDBUpdate.UpdateTB_ALARMEVENT_Confirm(copy(stTime,1,8), copy(stTime,9,6),
                stNodeNo, stEcuID, stExtendID, stMsgNo, '1', Memo1.Text, formatDateTime('yyyymmddhhnnsszzz',now),
                GetLocalIPAddr);

        Save := True;
      end;
    end;
    AdvProgress1.Visible := False;
  end;
  memo1.Text := '';
  LoadAlarmEvent;
end;

procedure TfmBuildingAlarmConfirm.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmBuildingAlarmConfirm.FormCreate(Sender: TObject);
begin
  inherited;
  FontSetting;
end;

procedure TfmBuildingAlarmConfirm.FormShow(Sender: TObject);
begin
  LoadAlarmEvent;
end;

procedure TfmBuildingAlarmConfirm.LoadAlarmEvent;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  nIndex : integer;
  stNodeIP : string;
  stAlarmAreaName : string;
  stAlarmDeviceTypeName : string;
  stAlarmModeName : string;
  stNodeNo,stEcuID,stArmAreaNo : string;
begin
  GridInit(sg_AlarmEvent,13,2,True);

  if FormTYPE = 'BUILDING' then stSql := dmDBSelect.SelectTB_ALARMEVENT_BuildingScurityEvent(SearchID,FormatDateTime('yyyymmddhhnnsszzz',now-5))
  else
  begin
    stNodeNo := copy(SearchID,1,G_nNodeCodeLength);
    stEcuID := copy(SearchID,1 + G_nNodeCodeLength , 2);
    stArmAreaNo := copy(SearchID,1 + G_nNodeCodeLength + 2,1);
    if Not isDigit(stNodeNo) then Exit;
    if Not isDigit(stArmAreaNo) then Exit;

    stSql := dmDBSelect.SelectTB_ALARMEVENT_ArmAreaScurityEvent(stNodeNo,stEcuID,stArmAreaNo,FormatDateTime('yyyymmddhhnnsszzz',now-5));
  end;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;
      nRow := 1;
      sg_AlarmEvent.RowCount := RecordCount + 1;
      while Not Eof do
      begin
        with sg_AlarmEvent do
        begin
          stArmAreaNo := FindField('AR_ARMAREANO').AsString;
          if Not isDigit(stArmAreaNo) then stArmAreaNo := '0'
          else stArmAreaNo := inttostr(strtoint(stArmAreaNo));

          nIndex := PCClientSocketList.IndexOf(FindField('ND_DECODERNO').AsString);
          //nIndex := G_MonitoringNodeList.Indexof(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength));
          if nIndex > -1 then
          begin
            stNodeIP := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeIP(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength));
            stAlarmAreaName := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaName,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,stArmAreaNo);
          end;
          stAlarmDeviceTypeName := dmFormFunction.GetAlarmDeviceTypeName(FindField('AL_ALARMDEVICETYPE').AsString);
          stAlarmModeName := dmFormFunction.GetAlarmModeName(FindField('AM_ARMMODECODE').AsString);

          Cells[0,nRow] := MakeDatetimeStr(FindField('AE_DATE').AsString + FindField('AE_TIME').AsString);
          Cells[1,nRow] := stNodeIP;
          Cells[2,nRow] := FindField('DE_ECUID').AsString;
          Cells[3,nRow] := FindField('AR_ARMAREANO').AsString;
          Cells[4,nRow] := stAlarmAreaName;
          Cells[5,nRow] := stAlarmDeviceTypeName;
          Cells[6,nRow] := FindField('AE_SUBADDR').AsString;
          Cells[7,nRow] := stAlarmModeName;
          Cells[8,nRow] := FindField('ZN_ZONENO').AsString;
          Cells[9,nRow] := FindField('AP_EVENTSTATEPCCODENAME').AsString;
          Cells[10,nRow] := FindField('ND_NODENO').AsString;
          Cells[11,nRow] := FindField('AE_MSGNO').AsString;
          Cells[12,nRow] := FindField('AE_DATE').AsString + FindField('AE_TIME').AsString;
          Cells[13,nRow] := FindField('DE_EXTENDID').AsString ;
          if isDigit(FindField('AP_COLOR').AsString) then
            RowColor[nRow] := strtoint(FindField('AP_COLOR').AsString);
          AddCheckBox(0,nRow,False,False);
        end;
        nRow := nRow + 1;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmBuildingAlarmConfirm.sg_AlarmEventCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

end;

end.
