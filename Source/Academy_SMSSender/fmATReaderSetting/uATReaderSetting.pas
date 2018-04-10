﻿unit uATReaderSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, W7Classes, W7Panels, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvSmoothPanel, Vcl.ExtCtrls, AdvSmoothLabel,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvToolBtn,ADODB,ActiveX, uSubForm, CommandArray,Winapi.WinSpool,System.iniFiles,
  AdvGroupBox, FolderDialog, AdvGlassButton, AdvGlowButton, ToolPanels, AdvCombo,
  Vcl.Menus, AdvTabSet, AdvPageControl, Vcl.ComCtrls, AdvOfficePager,
  Vcl.Imaging.pngimage, AdvOfficePagerStylers, AdvAppStyler;

type
  TfmATReaderSetting = class(TfmASubForm)
    Image1: TImage;
    BodyPanel: TW7Panel;
    menuTab: TAdvOfficeTabSet;
    Config: TAdvSmoothPanel;
    FolderDialog1: TFolderDialog;
    ATConfig: TAdvSmoothPanel;
    panATCode: TAdvToolPanel;
    Label9: TLabel;
    sg_Reader: TAdvStringGrid;
    cmb_Node: TAdvComboBox;
    Label1: TLabel;
    cmb_Ecu: TAdvComboBox;
    AdvGroupBox1: TAdvGroupBox;
    Label2: TLabel;
    cmb_AtUse: TAdvComboBox;
    cmb_AtType: TAdvComboBox;
    Label3: TLabel;
    btn_Save: TAdvGlassButton;
    AdvOfficePager1: TAdvOfficePager;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvOfficePage1: TAdvOfficePage;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    procedure menuTabChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure cmb_NodeChange(Sender: TObject);
    procedure cmb_EcuChange(Sender: TObject);
    procedure sg_ReaderClick(Sender: TObject);
    procedure sg_ReaderCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
  private
    { Private declarations }
    APCodeList : TStringList;
    NodeCodeList : TStringList;
    DeviceCodeList : TStringList;
    L_nReaderCheckCount : integer;
    Function FormClear:Boolean;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  private
    { Private declarations }
    procedure SearchReader(aReaderNo:string);
  public
    { Public declarations }
    procedure Form_Close;
  end;

var
  fmATReaderSetting: TfmATReaderSetting;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBDelete,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormVariable,
  uDBFormMessage,
  uDBSelect;

{$R *.dfm}



procedure TfmATReaderSetting.cmb_EcuChange(Sender: TObject);
begin
  inherited;
  SearchReader('');

end;

procedure TfmATReaderSetting.cmb_NodeChange(Sender: TObject);
begin
  inherited;
  if cmb_Node.ItemIndex > -1 then
     LoadDevice(NodeCodeList.Strings[cmb_Node.ItemIndex], DeviceCodeList,TComboBox(cmb_Ecu),True,'전체');
  SearchReader('');

end;

function TfmATReaderSetting.FormClear: Boolean;
begin
end;

procedure TfmATReaderSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(con_FormAFSATReader);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;

  APCodeList.Free;
  NodeCodeList.Free;
  DeviceCodeList.Free;

  Action := caFree;
end;

procedure TfmATReaderSetting.FormCreate(Sender: TObject);
begin
  //Height := 420;
  APCodeList := TStringList.Create;
  NodeCodeList := TStringList.Create;
  DeviceCodeList := TStringList.Create;


  LoadNode(NodeCodeList,TComboBox(cmb_Node),True,'전체');
  cmb_Node.ItemIndex := 0;
  LoadDevice(NodeCodeList.Strings[cmb_Node.ItemIndex], DeviceCodeList,TComboBox(cmb_Ecu),True,'전체');
  cmb_AtUse.ItemIndex := 1;
  LoadAttendPosition(APCodeList,TComboBox(cmb_AtType),False);
  if cmb_AtType.Items.Count > 0 then cmb_AtType.ItemIndex := 0;

  SearchReader('');
end;


procedure TfmATReaderSetting.FormResize(Sender: TObject);
begin
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

end;

procedure TfmATReaderSetting.FormShow(Sender: TObject);
var
  stComPort : string;
  nIndex : integer;
begin
  top := 0;
  Left := 0;
  Width := BodyPanel.Width;

  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(con_FormAFSATReader);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;

end;

procedure TfmATReaderSetting.Form_Close;
begin
  Close;
end;


procedure TfmATReaderSetting.menuTabChange(Sender: TObject);
begin
  if menuTab.ActiveTabIndex = 0 then //Ȩ
  begin
    if menuTab.AdvOfficeTabs.Items[0].Caption = '닫기' then Close
    else
    begin
      menuTab.ActiveTabIndex := 1;
      menuTabChange(self);
    end;
  end else if menuTab.ActiveTabIndex = 1 then
  begin
    menuTab.AdvOfficeTabs.Items[0].Caption := '닫기';
    config.Visible := True;
    config.Align := alClient;
    AtConfig.Visible := True;
    AtConfig.Align := alClient;
  end else if menuTab.ActiveTabIndex = 2 then
  begin
    menuTab.AdvOfficeTabs.Items[0].Caption := '닫기';
    config.Visible := True;
    config.Align := alClient;
    AtConfig.Visible := False;
  end;
end;



procedure TfmATReaderSetting.SearchReader(aReaderNo: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  GridInit(sg_Reader,5,2,True);
  stNodeNo := '';
  stEcuID := '';
  if cmb_Node.ItemIndex > 0 then stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
  if cmb_Ecu.ItemIndex > 0 then stEcuID := DeviceCodeList.Strings[cmb_Ecu.ItemIndex];
  if stEcuID <> '' then
  begin
    stNodeNo := copy(stEcuID,1,G_nNodeCodeLength);
    stEcuID := copy(stEcuID,1 + G_nNodeCodeLength,2);
  end;

  stSql := dmDBSelect.SelectTB_READER_Device(stNodeNo,stEcuID);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then
      begin
        Exit;
      end;

      sg_Reader.RowCount := recordCount + 1;
      nRow := 1;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        with sg_Reader do
        begin
          AddCheckBox(0,nRow,False,False);
          Cells[0,nRow] := '  ' + FindField('ND_NODENAME').AsString;
          Cells[1,nRow] := FindField('DE_ECUID').AsString;
          Cells[2,nRow] := FindField('RE_READERNO').AsString;
          if FindField('RE_ATTYPE').AsString = '1' then Cells[3,nRow] := '사용'
          else Cells[3,nRow] := '미사용';
          Cells[4,nRow] := FindField('AP_NAME').AsString;
          Cells[5,nRow] := FindField('ND_NODENO').AsString;
          Cells[6,nRow] := FindField('RE_ATTYPE').AsString;
          Cells[7,nRow] := FindField('AP_CODE').AsString;

          if (FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('RE_READERNO').AsString)  = aReaderNo then
          begin
            SelectRows(nRow,1);
          end;

        end;
        Application.ProcessMessages;
        inc(nRow);
        Next;
      end;
      sg_ReaderClick(self);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmATReaderSetting.sg_ReaderCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nReaderCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nReaderCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nReaderCheckCount := L_nReaderCheckCount + 1
    else L_nReaderCheckCount := L_nReaderCheckCount - 1 ;
  end;

end;

procedure TfmATReaderSetting.sg_ReaderClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfmATReaderSetting.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmATReaderSetting.btn_addClick(Sender: TObject);
begin
  inherited;
  menutab.ActiveTabIndex := 2;
  menutabChange(self);
end;


procedure TfmATReaderSetting.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmATReaderSetting.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmATReaderSetting.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stNodeNo,stEcuID,stReaderNo : string;
  stAttendPositionCode : string;
begin
  inherited;

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_Save.Caption,[rfReplaceAll]);
  if L_nReaderCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  if cmb_AtType.ItemIndex > -1 then
    stAttendPositionCode := APCodeList.Strings[cmb_AtType.ItemIndex];
  if Not isDigit(stAttendPositionCode) then stAttendPositionCode := '1';

  with sg_Reader do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        stNodeNo := cells[5,i];
        stEcuID := cells[1,i];
        stReaderNo := cells[2,i];
        dmDBUpdate.UpdateTB_READER_Field_StringValue(stNodeNo,stEcuID,'0',stReaderNo,'RE_ATTYPE',inttostr(cmb_AtUse.ItemIndex));
        dmDBUpdate.UpdateTB_READER_Field_IntValue(stNodeNo,stEcuID,'0',stReaderNo,'AP_CODE',stAttendPositionCode);
      end;
    end;
  end;
  SearchReader('');

end;

initialization
  RegisterClass(TfmATReaderSetting);
Finalization
  UnRegisterClass(TfmATReaderSetting);

end.
