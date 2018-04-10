﻿unit uZoneAdmin;

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
  TfmZoneAdmin = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    tv_List: TTreeView;
    tv_Code: TTreeView;
    pm_Work: TPopupMenu;
    pm_UpdateCode: TMenuItem;
    Pan_Workcode: TAdvSmoothPanel;
    ed_Name: TAdvEdit;
    ed_SelectCode: TAdvEdit;
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
    lb_List: TLabel;
    btn_Position: TAdvGlowButton;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    lb_WorkType: TLabel;
    lb_name: TAdvSmoothLabel;
    lb_DoorSearch: TLabel;
    lb_NodeName: TAdvSmoothLabel;
    btn_ZoneClose: TAdvGlowButton;
    btn_SelectBuildingPosition: TAdvGlowButton;
    lb_Building: TLabel;
    btn_BuildingSelect: TAdvGlowButton;
    btn_BuildingCancel: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    pm_AddZone: TMenuItem;
    N2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tv_ListClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_NameKeyPress(Sender: TObject; var Key: Char);
    procedure pm_DeleteCodeClick(Sender: TObject);
    procedure tv_ListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tv_ListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tv_ListDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_PositionClick(Sender: TObject);
    procedure mn_CropClick(Sender: TObject);
    procedure mn_PastClick(Sender: TObject);
    procedure cmb_NodeChange(Sender: TObject);
    procedure sg_ZoneCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_ZoneCloseClick(Sender: TObject);
    procedure btn_SelectBuildingPositionClick(Sender: TObject);
    procedure btn_BuildingCancelClick(Sender: TObject);
    procedure btn_BuildingSelectClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
  private
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    L_stMoveCode : string;
    L_stAllName : string;
    L_nZoneCheckCount : integer;
    NodeCodeList : TStringList;
    procedure FormNameSetting;
    procedure FontSetting;
    procedure SearchList(aCode:string);
    procedure SearchZoneNode(aNodeNo:string);
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
  fmZoneAdmin: TfmZoneAdmin;

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

procedure TfmZoneAdmin.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmZoneAdmin.btn_BuildingCancelClick(Sender: TObject);
begin
  inherited;
  pan_Building.Visible := False;
  sg_Zone.Enabled := True;
  cmb_Node.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_ZoneClose.Enabled := True;

end;

procedure TfmZoneAdmin.btn_BuildingSelectClick(Sender: TObject);
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
  btn_ZoneClose.Enabled := True;
  cmb_NodeChange(self);
end;

procedure TfmZoneAdmin.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := False;
end;

procedure TfmZoneAdmin.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmZoneAdmin.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmZoneAdmin.btn_PositionClick(Sender: TObject);
begin
  inherited;
  pan_zoneMangement.Visible := True;
  pan_zoneMangement.Caption.Text := btn_Position.Caption;
  lb_DoorSearch.Caption := btn_Position.Caption;
  LoadNode(NodeCodeList,TComboBox(cmb_Node),True,L_stAllName);
  cmb_NodeChange(self);
  btn_Position.Enabled := False;

end;

procedure TfmZoneAdmin.btn_SaveClick(Sender: TObject);
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
    tv_List.Items.Item[tv_List.Selected.AbsoluteIndex].Text := ed_Name.Text;
    tv_List.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSZONECODE,'');
    //SearchList(ed_SelectCode.Text);
  end;


  Pan_Workcode.Visible := False;
end;

procedure TfmZoneAdmin.btn_SelectBuildingPositionClick(Sender: TObject);
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
  btn_ZoneClose.Enabled := False;
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
end;

procedure TfmZoneAdmin.btn_ZoneCloseClick(Sender: TObject);
begin
  inherited;
  pan_zoneMangement.Visible := False;
  btn_Position.Enabled := True;
  SearchList('');

end;

procedure TfmZoneAdmin.cmb_NodeChange(Sender: TObject);
var
  stNodeNo : string;
begin
  inherited;
  stNodeNo := '';
  if cmb_Node.ItemIndex > 0 then stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
  SearchZoneNode(stNodeNo);


end;

procedure TfmZoneAdmin.ed_NameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;
end;

procedure TfmZoneAdmin.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmZoneAdmin.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmZoneAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  NodeCodeList.Free;
  fmMain.FORMENABLE(con_FormBMOSZONECODE,'FALSE');

  Action := caFree;
end;

procedure TfmZoneAdmin.FormCreate(Sender: TObject);
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

  tv_Code.Left := -400;
  NodeCodeList := TStringList.Create;
  FontSetting;
end;

procedure TfmZoneAdmin.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
//  pm_DeleteCode.Enabled := IsDeleteGrade;
  pm_UpdateCode.Enabled := IsUpdateGrade;
end;

procedure TfmZoneAdmin.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmZoneAdmin.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  lb_List.Caption := dmFormFunction.GetFormName('2','2','BM2_023List');//dmFormFunction.GetFormName('0','2','COMMONLIST01');
  btn_Position.Caption := dmFormFunction.GetFormName('0','2','COMMONZONEBUILDING');
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

procedure TfmZoneAdmin.FormResize(Sender: TObject);
begin
  inherited;
  tv_List.Height := Height - tv_List.Top - 30;

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  tv_List.Height := List.Height - tv_List.Top - 30;
  tv_List.Width := List.Width - (tv_List.Left * 2);

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

procedure TfmZoneAdmin.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSZONECODE,'TRUE');

  SearchList('');

end;

procedure TfmZoneAdmin.Form_Close;
begin
  Close;
end;

procedure TfmZoneAdmin.mn_CropClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',mn_Crop.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  L_stMoveCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(L_stMoveCode,1,1) <> 'Z' then
  begin
    L_stMoveCode := '';
    Exit;
  end;
  mn_Crop.Visible := False;
end;

procedure TfmZoneAdmin.mn_PastClick(Sender: TObject);
var
  stBuildingCode : string;
  stSql : string;
  stNodeNo,stEcuID,stExtendID,stZoneNo:string;
  stMessage : string;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_BuildingPast.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  stBuildingCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(L_stMoveCode,1,1) <> 'Z' then Exit;
  if copy(stBuildingCode,1,1) = 'Z' then Exit; //옮기려는 위치가 존이면 빠져 나가자

  stNodeNo := copy(L_stMoveCode,2,G_nNodeCodeLength);
  stEcuID := copy(L_stMoveCode,2 + G_nNodeCodeLength,2);
  stExtendID := copy(L_stMoveCode,2 + G_nNodeCodeLength + 2,2);
  stExtendID := inttostr(strtoint(stExtendID));
  stZoneNo := copy(L_stMoveCode,2 + G_nNodeCodeLength + 2 + 2,1);
  dmDBUpdate.UpdateTB_ZONE_Field_StringValue(stNodeNo,stEcuID,stExtendID,stZoneNo,'BC_BUILDINGCODE',stBuildingCode);
  dmDBUpdate.UpdateTB_ZONE_Field_StringValue(stNodeNo,stEcuID,stExtendID,stZoneNo,'ZN_NAMECHANGE','1');

  SearchList(L_stMoveCode);

end;

procedure TfmZoneAdmin.pm_DeleteCodeClick(Sender: TObject);
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
  stClientIP:= GetLocalIPAddr;
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
end;

procedure TfmZoneAdmin.pm_UpdateCodeClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_UpdateCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  ed_SelectCode.Text := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(ed_SelectCode.Text,1,1) <> 'Z' then Exit;

  Pan_Workcode.Visible := True;
  lb_WorkType.Caption := pm_UpdateCode.Caption;
  ed_Name.Text := tv_List.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  L_stWork := 'SELECTCODEUPDATE';
  ed_Name.SetFocus;
end;

procedure TfmZoneAdmin.SearchList(aCode: string);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
  stArmAreaAllCode : string;
begin
  L_stMoveCode := '';

  mn_Crop.Visible := True;
  popupmenu := nil;

  aTreeView := tv_List;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := tv_Code;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  LoadBuildingTreeView('',tv_List,tv_code,0);

(*  aNode := aTreeView.Items.Add(nil,'Nothing');
  vTreeView.Items.AddChild(nil,'0');

  stSql := ' select * from TB_BUILDINGCODE ';
  stSql := stSql + ' Where Group_Code = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_CODEUSE = ''1'' ';
  stSql := stSql + ' AND BC_DEEPSEQ = 1 ';
  stSql := stSql + ' Order by BC_DEEPSEQ,BC_VIEWSEQ ';
*)
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      (*
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        aNode := aTreeView.Items.Add(nil,FindField('BC_BUILDINGNAME').AsString);
        vTreeView.Items.AddChild(nil,FindField('BC_BUILDINGCODE').AsString);
        aNode.Expanded := True;
        Next;
      end; *)
      stSql := ' Select a.* from TB_ZONE a ';
      stSql := stSql + ' Inner Join TB_ZONEEXTENTION b ';
      stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';   //컨트롤러 사용중인거에서
      stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
      stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
      stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
      stSql := stSql + ' AND b.ZE_TYPE = ''1'' ) ';
      stSql := stSql + ' Inner Join TB_DEVICE c ';
      stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';   //컨트롤러 사용중인거에서
      stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
      stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
      stSql := stSql + ' AND c.DE_DEVICEUSE = ''1'') ';
      stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' Order by a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.ZN_ZONENO ';

      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if RecordCount < 1 then Exit;
      While Not Eof do
      begin
        stParentCode := FindField('BC_BUILDINGCODE').AsString;
        if Trim(stParentCode) = '' then stParentCode := '0';
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,FindField('ZN_ZONENAME').AsString);
            cNode.ImageIndex := con_LocalArmAreaImageIndex;
            cNode.SelectedIndex := con_LocalArmAreaImageIndex;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            stArmAreaAllCode := 'Z' + FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString  + FillZeroNumber(FindField('DE_EXTENDID').AsInteger,2) + FindField('ZN_ZONENO').AsString;
            vNode3:= vTreeView.Items.AddChild(vNode2,stArmAreaAllCode);
          end;
          bNode.Expanded := True;
          vNode1.Expanded := True;
          if aCode = stArmAreaAllCode  then
          begin
            if cNode <> nil then cNode.Selected := True;
          end;
        end;
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  tv_List.SetFocus;
end;

procedure TfmZoneAdmin.SearchZoneNode(aNodeNo: string);
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

procedure TfmZoneAdmin.sg_ZoneCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmZoneAdmin.tv_ListClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if tv_List.Selected = nil then Exit;

  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) = 'Z' then
  begin
    popupmenu := pm_Work;
  end else
  begin
    popupmenu := pm_Building;
    if L_stMoveCode = '' then pm_BuildingPast.Enabled := False
    else pm_BuildingPast.Enabled := True;
  end;
end;

procedure TfmZoneAdmin.tv_ListDblClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(self);
end;

procedure TfmZoneAdmin.tv_ListDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stBuildingCode : string;
  stCode : string;
  stDeepSeq,stViewSeq : string;
  stSql : string;
  stNodeNo,stEcuID,stExtendID,stZoneNo:string;
begin
  inherited;
  if Sender = Source then
  begin
    with TTreeView(Sender) do
    begin
      dropItem :=GetNodeAt(X,Y);
      currentItem := Selected;
      if currentItem.AbsoluteIndex = 0 then Exit;   //루트디렉토리가 움직일수는 없다
      stBuildingCode := tv_Code.Items[dropItem.AbsoluteIndex].Text;
      if copy(stBuildingCode,1,1) = 'Z' then Exit; //옮기려는 위치가 존이면 빠져 나가자
      stOrgCode := tv_Code.Items[currentItem.AbsoluteIndex].Text;
      if copy(stOrgCode,1,1) <> 'Z' then Exit;
      stNodeNo := copy(stOrgCode,2,G_nNodeCodeLength);
      stEcuID := copy(stOrgCode,2 + G_nNodeCodeLength,2);
      stExtendID := copy(stOrgCode,2 + G_nNodeCodeLength + 2,2);
      stExtendID := inttostr(strtoint(stExtendID));
      stZoneNo := copy(stOrgCode,2 + G_nNodeCodeLength + 2 + 2,1);
      dmDBUpdate.UpdateTB_ZONE_Field_StringValue(stNodeNo,stEcuID,stExtendID,stZoneNo,'BC_BUILDINGCODE',stBuildingCode);
      dmDBUpdate.UpdateTB_ZONE_Field_StringValue(stNodeNo,stEcuID,stExtendID,stZoneNo,'ZN_NAMECHANGE','1');

    end;
  end;
  SearchList(stCode);
end;

procedure TfmZoneAdmin.tv_ListDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_List;
end;

initialization
  RegisterClass(TfmZoneAdmin);
Finalization
  UnRegisterClass(TfmZoneAdmin);

end.
