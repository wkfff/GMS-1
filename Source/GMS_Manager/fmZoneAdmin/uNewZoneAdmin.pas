﻿unit uNewZoneAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, AdvOfficeTabSetStylers, AdvToolBar,
  AdvToolBarStylers, AdvCombo, AdvGlowButton, AdvOfficePager, AdvAppStyler,
  AdvOfficePagerStylers, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

const
  con_LocalBuildingImageIndex = 1;
  con_LocalArmAreaImageIndex = 8;

type
  TfmNewZoneAdmin = class(TfmASubForm)
    pm_Work: TPopupMenu;
    pm_UpdateCode: TMenuItem;
    MenuImageList16: TImageList;
    pan_zoneMangement: TAdvSmoothPanel;
    pan_DoorSearch: TAdvSmoothPanel;
    cmb_Node: TAdvComboBox;
    sg_Zone: TAdvStringGrid;
    tv_buildingCode: TTreeView;
    pan_Building: TAdvSmoothPanel;
    tv_buildingName: TTreeView;
    N1: TMenuItem;
    mn_Crop: TMenuItem;
    pm_Building: TPopupMenu;
    pm_BuildingPast: TMenuItem;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_DoorSearch: TLabel;
    lb_NodeName: TAdvSmoothLabel;
    btn_SelectBuildingPosition: TAdvGlowButton;
    lb_Building: TLabel;
    btn_BuildingSelect: TAdvGlowButton;
    btn_BuildingCancel: TAdvGlowButton;
    pm_AddZone: TMenuItem;
    N2: TMenuItem;
    Pan_Workcode: TAdvSmoothPanel;
    lb_WorkType: TLabel;
    lb_name: TAdvSmoothLabel;
    ed_Name: TAdvEdit;
    ed_SelectCode: TAdvEdit;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    lb_Ecuid: TAdvSmoothLabel;
    cmb_EcuID: TAdvComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_NameKeyPress(Sender: TObject; var Key: Char);
    procedure pm_DeleteCodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmb_NodeChange(Sender: TObject);
    procedure sg_ZoneCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_SelectBuildingPositionClick(Sender: TObject);
    procedure btn_BuildingCancelClick(Sender: TObject);
    procedure btn_BuildingSelectClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure sg_ZoneDblClick(Sender: TObject);
    procedure pan_zoneMangementResize(Sender: TObject);
    procedure cmb_EcuIDChange(Sender: TObject);
  private
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    L_stMoveCode : string;
    L_stAllName : string;
    L_nZoneCheckCount : integer;
    NodeCodeList : TStringList;
    EcuIDList : TStringList;
    procedure FormNameSetting;
    procedure FontSetting;
    procedure SearchZoneNode(aNodeNo,aEcuID:string);
  private
    { Private declarations }
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmNewZoneAdmin: TfmNewZoneAdmin;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uFormFunction,
  uCommonVariable,
  uFormVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmNewZoneAdmin.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmNewZoneAdmin.btn_BuildingCancelClick(Sender: TObject);
begin
  inherited;
  pan_Building.Visible := False;
  sg_Zone.Enabled := True;
  cmb_Node.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;

end;

procedure TfmNewZoneAdmin.btn_BuildingSelectClick(Sender: TObject);
var
  stMessage : string;
  stBuildingCode : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if tv_buildingName.Selected = nil then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_BuildingSelect.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stBuildingCode := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  with sg_Zone do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBUpdate.UpdateTB_ZONE_Field_StringValue(Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],'BC_BUILDINGCODE',stBuildingCode);
        dmDBUpdate.UpdateTB_ZONE_Field_StringValue(Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],'ZN_NAMECHANGE','1');
      end;
    end;
  end;

  pan_Building.Visible := False;
  sg_Zone.Enabled := True;
  cmb_Node.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  cmb_NodeChange(self);
end;

procedure TfmNewZoneAdmin.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := False;
end;

procedure TfmNewZoneAdmin.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmNewZoneAdmin.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmNewZoneAdmin.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stParentCode : string;
  stCode : string;
  stNodeNo,stEcuID,stExtendID,stZoneNo: string;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  if Trim(ed_Name.Text) = '' then
  begin
    stMessage := dmFormMessage.GetMessage('BLANKFIELD');
    stMessage := StringReplace(stMessage,'$WORK',lb_Name.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  if L_stWork = 'SELECTCODEUPDATE' then
  begin
    stCode := ed_SelectCode.Text;
    Delete(stCode,1,1);
    stNodeNo := copy(stCode,1,G_nNodeCodeLength);
    stEcuID := copy(stCode,1 + G_nNodeCodeLength,2);
    stExtendID := copy(stCode,1 + G_nNodeCodeLength + 2,2);
    stExtendID := inttostr(strtoint(stExtendID));
    stZoneNo := copy(stCode,1 + G_nNodeCodeLength + 2 + 2,1);
    dmDBUpdate.UpdateTB_Zone_Field_StringValue(stNodeNo,stEcuID,stExtendID,stZoneNo,'ZN_ZONENAME',ed_Name.Text);
    dmDBUpdate.UpdateTB_Zone_Field_StringValue(stNodeNo,stEcuID,stExtendID,stZoneNo,'ZN_NAMECHANGE','1');
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stZoneNo, con_ComLogTYPE_ZONE, L_stMenuID + '(' + Caption + '): Change');
    fmMain.FORMCHANGE(con_FormBMOSZONECODE,'');
    //SearchList(ed_SelectCode.Text);
  end;
  Pan_Workcode.visible := False;
  cmb_NodeChange(cmb_Node);
end;

procedure TfmNewZoneAdmin.btn_SelectBuildingPositionClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if L_nZoneCheckCount < 1 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_SelectBuildingPosition.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  pan_Building.Visible := True;
  lb_Building.Caption := btn_SelectBuildingPosition.Caption;
  sg_Zone.Enabled := False;
  cmb_Node.Enabled := False;
  btn_SelectBuildingPosition.Enabled := False;
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
end;

procedure TfmNewZoneAdmin.cmb_EcuIDChange(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
begin
  inherited;
  if cmb_Node.ItemIndex > -1 then stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
  if cmb_EcuID.ItemIndex > -1 then stEcuID := copy(EcuIDList.Strings[cmb_EcuID.ItemIndex],G_nNodeCodeLength + 1,2);
  SearchZoneNode(stNodeNo,stEcuID);

end;

procedure TfmNewZoneAdmin.cmb_NodeChange(Sender: TObject);
var
  stNodeNo : string;
begin
  inherited;
  stNodeNo := '';
  if cmb_Node.ItemIndex > -1 then stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
  LoadDevice(stNodeNo,EcuIDList,TComboBox(cmb_EcuID),False);
  cmb_EcuIDChange(cmb_EcuID);


end;

procedure TfmNewZoneAdmin.ed_NameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;
end;

procedure TfmNewZoneAdmin.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmNewZoneAdmin.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmNewZoneAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  NodeCodeList.Free;
  EcuIDList.Free;
  fmMain.FORMENABLE(con_FormBMOSZONECODE,'FALSE');

  Action := caFree;
end;

procedure TfmNewZoneAdmin.FormCreate(Sender: TObject);
begin
  inherited;
  if G_nFormLanguageType = 1 then
  begin
    ed_name.ImeMode := imSHanguel;//imHanguel;
    ed_name.ImeName := '';
  end else if G_nFormLanguageType = 2 then
  begin
    ed_name.ImeMode := imAlpha;
    ed_name.ImeName := '';
  end;

  NodeCodeList := TStringList.Create;
  EcuIDList := TStringList.Create;
  FontSetting;
  LoadNode(NodeCodeList,TComboBox(cmb_Node),False,L_stAllName);
  cmb_NodeChange(self);
end;

procedure TfmNewZoneAdmin.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
//  pm_DeleteCode.Enabled := IsDeleteGrade;
  pm_UpdateCode.Enabled := IsUpdateGrade;
end;

procedure TfmNewZoneAdmin.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmNewZoneAdmin.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  pm_AddZone.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  pm_UpdateCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_Name.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONZONENAME');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  lb_NodeName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  with sg_Zone do
  begin
    cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONZONENAME');
    cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  end;
  btn_SelectBuildingPosition.Caption := dmFormFunction.GetFormName('0','2','COMMONZONEBUILDING');
  btn_BuildingSelect.Caption := dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
  btn_BuildingCancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  mn_Crop.Caption := dmFormFunction.GetFormName('0','2','COMCUT');
  pm_BuildingPast.Caption := dmFormFunction.GetFormName('0','2','COMPASTE');
end;

procedure TfmNewZoneAdmin.FormResize(Sender: TObject);
begin
  inherited;

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;


  Pan_Workcode.Left := (Width div 2) - (Pan_Workcode.Width div 2);
  Pan_Workcode.top := (Height div 2) - (Pan_Workcode.Height div 2);

  pan_ZoneMangement.Left := (Width div 2) - (pan_ZoneMangement.Width div 2);
  pan_ZoneMangement.top := (Height div 2) - (pan_ZoneMangement.Height div 2) - 30;

  if Windowstate = wsMaximized then
  begin
    //btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

end;

procedure TfmNewZoneAdmin.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSZONECODE,'TRUE');


end;

procedure TfmNewZoneAdmin.Form_Close;
begin
  Close;
end;

procedure TfmNewZoneAdmin.pan_zoneMangementResize(Sender: TObject);
begin
  inherited;
  sg_Zone.Height := pan_zoneMangement.Height - pan_DoorSearch.Height - btn_SelectBuildingPosition.Height - 20;
  btn_SelectBuildingPosition.Top :=  pan_DoorSearch.Height + sg_Zone.Height + 10;
end;

procedure TfmNewZoneAdmin.pm_DeleteCodeClick(Sender: TObject);
var
  stMessage : string;
  stCode : string;
  stSql : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stArmAreaNo : string;
  stTime : string;
  stClientIP : string;
begin
  inherited;
(*  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
//    stMessage := stringReplace(stMessage,'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
//  stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  stNodeNo := copy(stCode,2,G_nNodeCodeLength);
  stEcuID := copy(stCode,2 + G_nNodeCodeLength,2);
  stExtendID := copy(stCode,2 + G_nNodeCodeLength + 2,2);
  stArmAreaNo := copy(stCode,2 + G_nNodeCodeLength + 2 + 2,1);
  dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,stExtendID,stArmAreaNo,'AR_ARMAREAUSE','0');
  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stArmAreaNo, con_ComLogTYPE_ARMAREA, L_stMenuID + '(' + Caption + '): Delete');
//  dmDBUpdate.UpdateTB_COMPANYCODE_Field_StringValue(stCode,'CO_CODEUSE','0');
  SearchList(stCode);
*)
end;

procedure TfmNewZoneAdmin.pm_UpdateCodeClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  ed_SelectCode.Text := 'Z' + FillZeroStrNum(sg_Zone.Cells[3,sg_Zone.row],G_nNodeCodeLength) + sg_Zone.Cells[4,sg_Zone.row] + FillZeroStrNum(sg_Zone.Cells[5,sg_Zone.row],2) + sg_Zone.Cells[6,sg_Zone.row];
  if copy(ed_SelectCode.Text,1,1) <> 'Z' then Exit;

  Pan_Workcode.Visible := True;
  lb_WorkType.Caption := pm_UpdateCode.Caption;
  ed_Name.Text := sg_Zone.Cells[1,sg_Zone.row];
  L_stWork := 'SELECTCODEUPDATE';
  ed_Name.SetFocus;
end;


procedure TfmNewZoneAdmin.SearchZoneNode(aNodeNo,aEcuID: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_Zone,4,2,true);
  stSql := ' Select a.*,d.BC_BUILDINGNAME from TB_ZONE a ';
  stSql := stSql + ' Inner Join TB_ZONEEXTENTION b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';   //컨트롤러 사용중인거에서
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.ZE_TYPE <> ''0'' ) ';
  stSql := stSql + ' Inner Join TB_DEVICE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';   //컨트롤러 사용중인거에서
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND c.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE = d.BC_BUILDINGCODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if isDigit(aNodeNo) then stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' Order by a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.ZN_ZONENO ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      with sg_Zone do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('ZN_ZONENAME').AsString;
          cells[2,nRow] := FindField('BC_BUILDINGNAME').AsString;
          cells[3,nRow] := FindField('ND_NODENO').AsString;
          cells[4,nRow] := FindField('DE_ECUID').AsString;
          cells[5,nRow] := FindField('DE_EXTENDID').AsString;
          cells[6,nRow] := FindField('ZN_ZONENO').AsString;

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmNewZoneAdmin.sg_ZoneCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nZoneCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nZoneCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nZoneCheckCount := L_nZoneCheckCount + 1
    else L_nZoneCheckCount := L_nZoneCheckCount - 1 ;
  end;

end;

procedure TfmNewZoneAdmin.sg_ZoneDblClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(self);
end;

initialization
  RegisterClass(TfmNewZoneAdmin);
Finalization
  UnRegisterClass(TfmNewZoneAdmin);

end.
