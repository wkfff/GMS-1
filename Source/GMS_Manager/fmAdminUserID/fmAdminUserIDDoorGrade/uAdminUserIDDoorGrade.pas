unit uAdminUserIDDoorGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ExtCtrls,
  AdvEdit,ADODB, uSubForm, CommandArray,ActiveX, AdvObj, AdvEdBtn,
  AdvSmoothLabel, Vcl.ImgList, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvToolBar, AdvToolBarStylers, Vcl.Imaging.pngimage;


const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmAdminUserIDDoorGrade = class(TfmASubForm)
    Panel3: TPanel;
    PageControl1: TPageControl;
    DoorTab: TTabSheet;
    AlarmTab: TTabSheet;
    StatusBar1: TStatusBar;
    Panel6: TPanel;
    sg_Door: TAdvStringGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    sg_GradeDoor: TAdvStringGrid;
    Panel9: TPanel;
    Panel10: TPanel;
    sg_Alarm: TAdvStringGrid;
    Panel11: TPanel;
    sg_GradeAlarm: TAdvStringGrid;
    btn_DoorGradeInsert: TSpeedButton;
    btn_DoorGradeDelete: TSpeedButton;
    btn_AlarmGradeInsert: TSpeedButton;
    btn_AlarmGradeDelete: TSpeedButton;
    Panel18: TPanel;
    Edit1: TEdit;
    ed_userid: TEdit;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    lb_BuildingName: TAdvSmoothLabel;
    eb_BuildingName: TAdvEditBtn;
    tv_buildingName: TTreeView;
    tv_buildingCode: TTreeView;
    ed_BuildingCode: TEdit;
    MenuImageList16: TImageList;
    btn_Close: TSpeedButton;
    Panel1: TPanel;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btn_DepartGradeInsertClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btn_DoorGradeDeleteClick(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
  private
    { Private declarations }
    AcBuildingCodeList : TStringList;
    AcFloorCodeList : TStringList;
    AcAreaCodeList : TStringList;
    PtBuildingCodeList : TStringList;
    PtFloorCodeList : TStringList;
    PtAreaCodeList : TStringList;
    FdBuildingCodeList : TStringList;
    FdFloorCodeList : TStringList;
    FdAreaCodeList : TStringList;

    CheckCount : integer;  //현재 체크되어 있는 사용자수

    procedure FormNameSet;
    procedure FontSetting;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure DoorSearch;
    procedure AlarmSearch;
    procedure DoorCodeSearch(aBuildingCode:string;sg:TAdvStringGrid);
    procedure DoorGradeSearch(aBuildingCode,aUserID:string;sg:TAdvStringGrid);
    procedure AlarmCodeSearch(aBuildingCode:string;sg:TAdvStringGrid);
    procedure AlarmGradeSearch(aBuildingCode,aUserID:string;sg:TAdvStringGrid);
    procedure InsertDoorGrade;
    procedure InsertAlarmGrade;
    procedure DeleteDoorGrade;
    procedure DeleteAlarmGrade;
  public
    { Public declarations }
    WorkCode : integer;   //0 : 회사권한 1: 출입문 제어권한 2:방범문 제어권한
  end;

var
  fmAdminUserIDDoorGrade: TfmAdminUserIDDoorGrade;

implementation

uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBDelete,
  uDBFunction,
  uDBInsert,
  uDBSelect,
  uFormVariable,
  uFormUtil;
{$R *.dfm}

procedure TfmAdminUserIDDoorGrade.FormCreate(Sender: TObject);
begin
  AcBuildingCodeList := TStringList.Create;
  AcFloorCodeList := TStringList.Create;
  AcAreaCodeList := TStringList.Create;
  PtBuildingCodeList := TStringList.Create;
  PtFloorCodeList := TStringList.Create;
  PtAreaCodeList := TStringList.Create;
  FdBuildingCodeList := TStringList.Create;
  FdFloorCodeList := TStringList.Create;
  FdAreaCodeList := TStringList.Create;
  CheckCount := 0;
  FontSetting;
end;

procedure TfmAdminUserIDDoorGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AcBuildingCodeList.Free;
  AcFloorCodeList.Free;
  AcAreaCodeList.Free;
  PtBuildingCodeList.Free;
  PtFloorCodeList.Free;
  PtAreaCodeList.Free;
  FdBuildingCodeList.Free;
  FdFloorCodeList.Free;
  FdAreaCodeList.Free;

end;


procedure TfmAdminUserIDDoorGrade.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);

end;

procedure TfmAdminUserIDDoorGrade.FormActivate(Sender: TObject);
var
  stBuildingCode:string;
  stFloorCode : string;
begin
  FormNameSet;
  Panel18.Caption := Caption;
end;

procedure TfmAdminUserIDDoorGrade.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAdminUserIDDoorGrade.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmAdminUserIDDoorGrade.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := DoorTab;

  if Not G_bIsMaster then
  begin
    if IsInsertGrade then
    begin
      btn_DoorGradeInsert.Enabled := True;
      btn_AlarmGradeInsert.Enabled := True;
    end else
    begin
      btn_DoorGradeInsert.Enabled := False;
      btn_AlarmGradeInsert.Enabled := False;
    end;
    if IsDeleteGrade then
    begin
      btn_DoorGradeDelete.Enabled := True;
      btn_AlarmGradeDelete.Enabled := True;
    end else
    begin
      btn_DoorGradeDelete.Enabled := False;
      btn_AlarmGradeDelete.Enabled := False;
    end;
  end;
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);
end;


procedure TfmAdminUserIDDoorGrade.CheckBoxClick(Sender: TObject; ACol, ARow: Integer;
  State: Boolean);
var
  bchkState : Boolean;
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    (Sender as TAdvStringGrid).GetCheckBoxState(0,0, bchkState);
    AdvStrinGridSetAllCheck(Sender,bchkState);
  end;
end;

procedure TfmAdminUserIDDoorGrade.btn_DepartGradeInsertClick(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode : string;
  stCompanyCode : string;
  stJijumCode : string;
begin

  if PageControl1.ActivePage  = DoorTab then
  begin
    InsertDoorGrade;
    DoorGradeSearch(ed_BuildingCode.Text,ed_Userid.text,sg_GradeDoor);
  end else if PageControl1.ActivePage  = AlarmTab then
  begin
    InsertAlarmGrade;
    AlarmGradeSearch(ed_BuildingCode.Text,ed_Userid.text,sg_GradeAlarm);
  end;

end;

procedure TfmAdminUserIDDoorGrade.btn_DoorGradeDeleteClick(Sender: TObject);
begin
  if PageControl1.ActivePage  = DoorTab then
  begin
    DeleteDoorGrade;
    DoorGradeSearch(ed_BuildingCode.Text,ed_Userid.text,sg_GradeDoor);
  end else if PageControl1.ActivePage  = AlarmTab then
  begin
    DeleteAlarmGrade;
    AlarmGradeSearch(ed_BuildingCode.Text,ed_Userid.text,sg_GradeAlarm);
  end;
end;

procedure TfmAdminUserIDDoorGrade.AlarmSearch;
begin

  AlarmCodeSearch(ed_BuildingCode.Text,sg_Alarm);

  AlarmGradeSearch(ed_BuildingCode.Text,ed_Userid.text,sg_GradeAlarm);

end;

procedure TfmAdminUserIDDoorGrade.DoorSearch;
begin
  DoorCodeSearch(ed_BuildingCode.text,sg_Door);

  DoorGradeSearch(ed_BuildingCode.text,ed_Userid.text,sg_GradeDoor);
end;


procedure TfmAdminUserIDDoorGrade.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := Panel31.Top + eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := Panel31.Left + eb_BuildingName.Left;

end;

procedure TfmAdminUserIDDoorGrade.DoorCodeSearch(aBuildingCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg,1,2,True);

  if aBuildingCode = '' then aBuildingCode := '0';

  stSql := dmDBSelect.SelectTB_DOOR_BuildingCode(aBuildingCode,True);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;

      First;

      with sg do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('DO_DOORNAME').AsString;
          cells[1,nRow] := FindField('ND_NODENO').AsString;
          cells[2,nRow] := FindField('DE_ECUID').AsString;
          cells[3,nRow] := FindField('DO_DOORNO').AsString;
          cells[4,nRow] := FindField('BC_BUILDINGCODE').AsString;
          AddCheckBox(0,nRow,False,False);

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAdminUserIDDoorGrade.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage.Name  = 'DoorTab' then DoorSearch
  else if PageControl1.ActivePage.Name  = 'AlarmTab' then    AlarmSearch;
end;

procedure TfmAdminUserIDDoorGrade.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  DoorCodeSearch(ed_BuildingCode.Text,sg_Door);
  DoorGradeSearch(ed_BuildingCode.Text,ed_Userid.text,sg_GradeDoor);
  AlarmCodeSearch(ed_BuildingCode.Text,sg_Alarm);
  AlarmGradeSearch(ed_BuildingCode.Text,ed_Userid.text,sg_GradeAlarm);
end;

procedure TfmAdminUserIDDoorGrade.DoorGradeSearch(aBuildingCode, aUserID: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg,1,2,True);
  if Trim(aUserID) = '' then Exit;

  stSql := dmDBSelect.SelectTB_ADMINDEVICE_Door(aUserID,aBuildingCode,con_ComLogTYPE_DOOR);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;

      First;
      with sg do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('DO_DOORNAME').AsString;
          cells[1,nRow] := FindField('ND_NODENO').AsString;
          cells[2,nRow] := FindField('DE_ECUID').AsString;
          cells[3,nRow] := FindField('DO_DOORNO').AsString;
          AddCheckBox(0,nRow,False,False);

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAdminUserIDDoorGrade.AlarmCodeSearch(aBuildingCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg,1,2,True);

  if aBuildingCode = '' then aBuildingCode := '0';

  stSql := dmDBSelect.SelectTB_ARMAREA_BuildingCode(aBuildingCode);
  
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;

      First;
      with sg do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('AR_ARMAREANAME').AsString;
          cells[1,nRow] := FindField('ND_NODENO').AsString;
          cells[2,nRow] := FindField('DE_ECUID').AsString;
          cells[3,nRow] := FindField('AR_ARMAREANO').AsString;
          cells[4,nRow] := FindField('BC_BUILDINGCODE').AsString;
          AddCheckBox(0,nRow,False,False);
        
          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAdminUserIDDoorGrade.AlarmGradeSearch(aBuildingCode, aUserID: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg,1,2,True);

  if Trim(aUserID) = '' then Exit;

  stSql := dmDBSelect.SelectTB_ADMINDEVICE_ArmArea(aUserID,aBuildingCode,con_ComLogTYPE_ARMAREA);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;

      First;
      with sg do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('AR_ARMAREANAME').AsString;
          cells[1,nRow] := FindField('ND_NODENO').AsString;
          cells[2,nRow] := FindField('DE_ECUID').AsString;
          cells[2,nRow] := FindField('AR_ARMAREANO').AsString;
          AddCheckBox(0,nRow,False,False);

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAdminUserIDDoorGrade.InsertAlarmGrade;
var
  UserLoop,AlarmLoop : integer;
  bchkState : Boolean;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stUserID : string;
begin
  stUserID := ed_userid.Text;
  for AlarmLoop := 1 to sg_Alarm.RowCount - 1 do
  begin
    sg_Alarm.GetCheckBoxState(0,AlarmLoop, bchkState);
    if bChkState then //경비구역이 체크 되어 있으면 해당 경비구역 Insert;
    begin
      stNodeNo := sg_Alarm.Cells[1,AlarmLoop];
      stEcuID := sg_Alarm.Cells[2,AlarmLoop];
      stArmAreaNo := sg_Alarm.Cells[3,AlarmLoop];
      dmDBInsert.InsertIntoTB_ADMINDEVICE_Value(stUserID,con_ComLogTYPE_ARMAREA,stNodeNo,stECUID,'0',stArmAreaNo);
    end;
  end;
end;

procedure TfmAdminUserIDDoorGrade.InsertDoorGrade;
var
  UserLoop,DoorLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNo : string;
  stUserID : string;
begin
  stUserID := ed_userid.Text;
  for DoorLoop := 1 to sg_Door.RowCount - 1 do
  begin
    sg_Door.GetCheckBoxState(0,DoorLoop, bchkState);
    if bChkState then //출입문이 체크 되어 있으면 해당 출입문 Insert;
    begin
      stNodeNo := sg_Door.Cells[1,DoorLoop];
      stECUID := sg_Door.Cells[2,DoorLoop];
      stDoorNo := sg_Door.Cells[3,DoorLoop];
      dmDBInsert.InsertIntoTB_ADMINDEVICE_Value(stUserID,con_ComLogTYPE_DOOR,stNodeNo,stECUID,'0',stDoorNo);
    end;
  end;
end;

procedure TfmAdminUserIDDoorGrade.DeleteAlarmGrade;
var
  AlarmLoop : integer;
  bchkState : Boolean;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
begin
    for AlarmLoop := 1 to sg_GradeAlarm.RowCount - 1 do
    begin
      sg_GradeAlarm.GetCheckBoxState(0,AlarmLoop, bchkState);
      if bChkState then //방범구역가 체크 되어 있으면 해당 권한 삭제
      begin
        stNodeNo  := sg_GradeAlarm.Cells[1,AlarmLoop];
        stEcuID  := sg_GradeAlarm.Cells[2,AlarmLoop];
        stArmAreaNo := sg_GradeAlarm.Cells[3,AlarmLoop];
        dmDBDelete.DeleteTB_ADMINDEVICE_DoorGrade(Trim(ed_Userid.Text),con_ComLogTYPE_ARMAREA,stNodeNo,stECUID,'0',stArmAreaNo);
      end;
    end;

end;

procedure TfmAdminUserIDDoorGrade.DeleteDoorGrade;
var
  DoorLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNo : string;
begin
    for DoorLoop := 1 to sg_GradeDoor.RowCount - 1 do
    begin
      sg_GradeDoor.GetCheckBoxState(0,DoorLoop, bchkState);
      if bChkState then //부서코드가 체크 되어 있으면 해당 권한 삭제
      begin
        stNodeNo  := sg_GradeDoor.Cells[1,DoorLoop];
        stECUID  := sg_GradeDoor.Cells[2,DoorLoop];
        stDoorNo   := sg_GradeDoor.Cells[3,DoorLoop];
        dmDBDelete.DeleteTB_ADMINDEVICE_DoorGrade(Trim(ed_Userid.Text),con_ComLogTYPE_DOOR,stNodeNo,stECUID,'0',stDoorNo);
      end;
    end;
end;


procedure TfmAdminUserIDDoorGrade.FormNameSet;
begin
{  lb_BuildingCode1.Caption := G_stFormName901;
  lb_FloorCode1.Caption := G_stFormName911;
  lb_AreaCode1.Caption := G_stFormName921;
  lb_BuildingCode2.Caption := G_stFormName901;
  lb_FloorCode2.Caption := G_stFormName911;
  lb_AreaCode2.Caption := G_stFormName921;
  lb_BuildingCode3.Caption := G_stFormName901;
  lb_FloorCode3.Caption := G_stFormName911;
  lb_AreaCode3.Caption := G_stFormName921;
 }

end;

end.
