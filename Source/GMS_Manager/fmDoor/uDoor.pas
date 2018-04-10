﻿unit uDoor;

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
  con_LocalDoorImageIndex = 7;
  con_LocalDoorSelectImageIndex = 8;

type
  TfmDoor = class(TfmASubForm)
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
    N1: TMenuItem;
    mn_Crop: TMenuItem;
    mn_Past: TMenuItem;
    pm_Building: TPopupMenu;
    pm_BuildingPast: TMenuItem;
    pan_DoorMangement: TAdvSmoothPanel;
    pan_DoorSearch: TAdvSmoothPanel;
    lb_NodeName: TAdvSmoothLabel;
    cmb_Node: TAdvComboBox;
    sg_Door: TAdvStringGrid;
    tv_buildingCode: TTreeView;
    pan_Building: TAdvSmoothPanel;
    tv_buildingName: TTreeView;
    pan_DoorGubun: TAdvSmoothPanel;
    cmb_DoorGubun: TAdvComboBox;
    lb_DoorGubun1: TAdvSmoothLabel;
    N2: TMenuItem;
    mn_ScheduleUse: TMenuItem;
    pm_SchedulUse: TMenuItem;
    pm_SchedulNotUse: TMenuItem;
    mn_DeviceInfo: TMenuItem;
    N4: TMenuItem;
    mn_TimecodeUse: TMenuItem;
    pm_TimeCodeNotUse: TMenuItem;
    pm_TimeCodeUse: TMenuItem;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    btn_DoorPosition: TAdvGlowButton;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_WorkType: TLabel;
    lb_Name: TAdvSmoothLabel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    btn_SelectBuildingPosition: TAdvGlowButton;
    btn_SelectDoorGubun: TAdvGlowButton;
    btn_DoorClose: TAdvGlowButton;
    btn_BuildingSelect: TAdvGlowButton;
    btn_BuildingCancel: TAdvGlowButton;
    btn_DoorGubunApply: TAdvGlowButton;
    btn_DoorGubunCancel: TAdvGlowButton;
    lb_DoorSearch: TLabel;
    lb_Building: TLabel;
    lb_DoorGubun: TLabel;
    AdvGlowButton1: TAdvGlowButton;
    mem_DoorMemo: TMemo;
    lb_EtcCode: TAdvSmoothLabel;
    ed_RelayCode: TAdvEdit;
    lb_DoorMemo: TAdvSmoothLabel;
    btn_Antipass: TAdvGlowButton;
    pan_AntiGroup: TAdvSmoothPanel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    Label1: TLabel;
    cmb_AntipassGroup: TAdvComboBox;
    btn_AntipassSave: TAdvGlowButton;
    btn_AntipassCancel: TAdvGlowButton;
    btn_AntiGroupAdd: TAdvGlowButton;
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
    procedure mn_CropClick(Sender: TObject);
    procedure mn_PastClick(Sender: TObject);
    procedure btn_DoorPositionClick(Sender: TObject);
    procedure cmb_NodeChange(Sender: TObject);
    procedure btn_DoorCloseClick(Sender: TObject);
    procedure sg_DoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_SelectBuildingPositionClick(Sender: TObject);
    procedure btn_BuildingCancelClick(Sender: TObject);
    procedure btn_BuildingSelectClick(Sender: TObject);
    procedure btn_SelectDoorGubunClick(Sender: TObject);
    procedure btn_DoorGubunCancelClick(Sender: TObject);
    procedure btn_DoorGubunApplyClick(Sender: TObject);
    procedure pm_SchedulNotUseClick(Sender: TObject);
    procedure pm_TimeCodeNotUseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_AntipassClick(Sender: TObject);
    procedure btn_AntipassCancelClick(Sender: TObject);
    procedure btn_AntipassSaveClick(Sender: TObject);
    procedure btn_AntiGroupAddClick(Sender: TObject);
  private
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stAllName : string;
    L_stOrgRelayCode : string;
    L_stWork : string;
    L_stMoveCode : string;
    L_nDoorCheckCount : integer;
    NodeCodeList : TStringList;
    AntipassCodeList : TStringList;
    DoorGubunCodeList : TStringList;
    procedure FormNameSetting;
    procedure FontSetting;
    procedure SearchList(aCode:string);
    procedure SearchDoorNode(aNodeNo:string);
  private
    { Private declarations }
    procedure MoveDoorViewSeq(aTargetCode,aOrgCode:string);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmDoor: TfmDoor;

implementation
uses
  uAntiGroupCode,
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormUtil,
  uMain,
  uPCClient,
  uServerClientVariable;
{$R *.dfm}

procedure TfmDoor.AdvStrinGridSetAllCheck(Sender: TObject; bchkState: Boolean);
var
  i : integer;
begin
  for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmDoor.btn_AntiGroupAddClick(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  fmAntiGroupcode := TfmAntiGroupcode.Create(nil);
  fmAntiGroupcode.ShowModal;
  fmAntiGroupcode.Free;
  nIndex := cmb_AntipassGroup.ItemIndex;
  LoadAntipassGroupCode(AntipassCodeList,TcomboBox(cmb_AntipassGroup),True,'사용안함');
  if cmb_AntipassGroup.Items.Count > nIndex  then cmb_AntipassGroup.ItemIndex := nIndex;

end;

procedure TfmDoor.btn_AntipassCancelClick(Sender: TObject);
begin
  inherited;
  pan_AntiGroup.Visible := False;
end;

procedure TfmDoor.btn_AntipassClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if L_nDoorCheckCount < 1 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_Antipass.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  pan_AntiGroup.Visible := True;
  sg_Door.Enabled := False;
  cmb_Node.Enabled := False;
  btn_SelectBuildingPosition.Enabled := False;
  btn_SelectDoorGubun.Enabled := False;
  btn_DoorClose.Enabled := False;
  LoadAntipassGroupCode(AntipassCodeList,TcomboBox(cmb_AntipassGroup),True,'사용안함');
end;

procedure TfmDoor.btn_AntipassSaveClick(Sender: TObject);
var
  stMessage : string;
  stAntipassCode : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if cmb_AntipassGroup.ItemIndex < 0 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_AntipassSave.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stAntipassCode := AntipassCodeList.Strings[cmb_AntipassGroup.ItemIndex];
  with sg_Door do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBUpdate.UpdateTB_DOOR_Field_IntValue(cells[5,i],cells[6,i],cells[7,i],cells[8,i],'AG_CODE',stAntipassCode);
        dmDBUpdate.UpdateTB_DOOR_Field_StringValue(cells[5,i],cells[6,i],cells[7,i],cells[8,i],'DO_MEMLOAD','N');
      end;
    end;
  end;

  pan_AntiGroup.Visible := False;
  sg_Door.Enabled := True;
  cmb_Node.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;
  btn_DoorClose.Enabled := True;
  cmb_NodeChange(self);
end;

procedure TfmDoor.btn_BuildingCancelClick(Sender: TObject);
begin
  inherited;

  pan_Building.Visible := False;
  sg_Door.Enabled := True;
  cmb_Node.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;
  btn_DoorClose.Enabled := True;
end;

procedure TfmDoor.btn_BuildingSelectClick(Sender: TObject);
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
  with sg_Door do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBUpdate.UpdateTB_DOOR_Field_StringValue(Cells[5,i],Cells[6,i],Cells[7,i],Cells[8,i],'BC_BUILDINGCODE',stBuildingCode);
        dmDBUpdate.UpdateTB_DOOR_Field_StringValue(Cells[5,i],Cells[6,i],Cells[7,i],Cells[8,i],'DO_NAMECHANGE','1');
      end;
    end;
  end;

  pan_Building.Visible := False;
  sg_Door.Enabled := True;
  cmb_Node.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;
  btn_DoorClose.Enabled := True;
  cmb_NodeChange(self);
end;

procedure TfmDoor.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := False;
end;

procedure TfmDoor.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmDoor.btn_DoorCloseClick(Sender: TObject);
begin
  inherited;
  pan_DoorMangement.Visible := False;
  btn_DoorPosition.Enabled := True;
  SearchList('');
end;

procedure TfmDoor.btn_DoorGubunApplyClick(Sender: TObject);
var
  stMessage : string;
  stDoorGubunCode : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if cmb_DoorGubun.ItemIndex < 0 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_DoorGubunApply.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stDoorGubunCode := DoorGubunCodeList.Strings[cmb_DoorGubun.ItemIndex];
  with sg_Door do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBUpdate.UpdateTB_DOOR_Field_StringValue(Cells[5,i],Cells[6,i],Cells[7,i],Cells[8,i],'DG_CODE',stDoorGubunCode);
      end;
    end;
  end;

  pan_DoorGubun.Visible := False;
  sg_Door.Enabled := True;
  cmb_Node.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;
  btn_DoorClose.Enabled := True;
  cmb_NodeChange(self);
end;

procedure TfmDoor.btn_DoorGubunCancelClick(Sender: TObject);
begin
  inherited;

  pan_DoorGubun.Visible := False;
  sg_Door.Enabled := True;
  cmb_Node.Enabled := True;
  btn_SelectBuildingPosition.Enabled := True;
  btn_SelectDoorGubun.Enabled := True;
  btn_DoorClose.Enabled := True;

end;

procedure TfmDoor.btn_DoorPositionClick(Sender: TObject);
begin
  inherited;
  pan_DoorMangement.Visible := True;
  //pan_DoorMangement.Caption.Text := btn_DoorPosition.Caption;
  lb_DoorSearch.Caption := btn_DoorPosition.Caption;
  LoadNode(NodeCodeList,TComboBox(cmb_Node),True,L_stAllName);
  cmb_NodeChange(self);
  btn_DoorPosition.Enabled := False;
end;

procedure TfmDoor.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmDoor.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stParentCode : string;
  stCode : string;
  stNodeNo,stEcuID,stExtendID,stDoorNo: string;
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
    stDoorNo := copy(stCode,1 + G_nNodeCodeLength + 2 + 2,1);
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_DOORNAME',ed_Name.Text);
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_MEMO',mem_DoorMemo.Text);
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_NAMECHANGE','1');
    if L_stOrgRelayCode <> ed_RelayCode.Text then
    begin
      dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_RELAYID',ed_RelayCode.Text);
      dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_RELAYIDCHANGE','Y');
    end;

    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stDoorNo, con_ComLogTYPE_DOOR, L_stMenuID + '(' + Caption + '): Change');
    tv_List.Items.Item[tv_List.Selected.AbsoluteIndex].Text := ed_Name.Text;
    tv_List.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSDOORCODE,'');
    //SearchList(ed_SelectCode.Text);
  end;


  Pan_Workcode.Visible := False;
end;

procedure TfmDoor.btn_SelectBuildingPositionClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if L_nDoorCheckCount < 1 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_SelectBuildingPosition.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  pan_Building.Visible := True;
  lb_Building.Caption := btn_SelectBuildingPosition.Caption;
  sg_Door.Enabled := False;
  cmb_Node.Enabled := False;
  btn_SelectBuildingPosition.Enabled := False;
  btn_SelectDoorGubun.Enabled := False;
  btn_DoorClose.Enabled := False;
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
end;

procedure TfmDoor.btn_SelectDoorGubunClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if L_nDoorCheckCount < 1 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_SelectBuildingPosition.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  pan_DoorGubun.Visible := True;
  lb_DoorGubun.Caption := btn_SelectDoorGubun.Caption;
  sg_Door.Enabled := False;
  cmb_Node.Enabled := False;
  btn_SelectBuildingPosition.Enabled := False;
  btn_SelectDoorGubun.Enabled := False;
  btn_DoorClose.Enabled := False;
  LoadDoorGubun(DoorGubunCodeList,TcomboBox(cmb_DoorGubun),False);
end;

procedure TfmDoor.cmb_NodeChange(Sender: TObject);
var
  stNodeNo : string;
begin
  inherited;
  stNodeNo := '';
  if cmb_Node.ItemIndex > 0 then stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
  SearchDoorNode(stNodeNo);

end;

procedure TfmDoor.ed_NameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl,True,True);
    Key := #0;
    //btn_SaveClick(self);
  end;
end;

procedure TfmDoor.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
  *)
end;

procedure TfmDoor.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmDoor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  NodeCodeList.Free;
  DoorGubunCodeList.Free;
  AntipassCodeList.Free;
  fmMain.FORMENABLE(con_FormBMOSDOORCODE,'FALSE');

  Action := caFree;
end;

procedure TfmDoor.FormCreate(Sender: TObject);
begin
  inherited;
  if G_nFormLanguageType = 1 then
  begin
    ed_name.ImeMode := imSHanguel; // imHanguel;
    ed_name.ImeName := '';
  end else if G_nFormLanguageType = 2 then
  begin
    ed_name.ImeMode := imAlpha;
    ed_name.ImeName := '';
  end;
  tv_Code.Left := -400;
  NodeCodeList := TStringList.Create;
  DoorGubunCodeList := TStringList.Create;
  AntipassCodeList := TStringList.Create;
  FontSetting;
  if ( G_nSystmRelayUse = 1 ) and (G_nSystmRelayCustomerNo = 2) then //증평인 경우 연동 코드를 입력 하자.
  begin
    lb_EtcCode.Visible := True;
    ed_RelayCode.Visible := True;
  end else
  begin
    lb_EtcCode.Visible := False;
    ed_RelayCode.Visible := False;
  end;
end;

procedure TfmDoor.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
//  pm_DeleteCode.Enabled := IsDeleteGrade;
  pm_UpdateCode.Enabled := IsUpdateGrade;
end;

procedure TfmDoor.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmDoor.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('2','1','BM2_021');//dmFormFunction.GetFormName('0','2','COMMONLIST01');
  btn_DoorPosition.Caption := dmFormFunction.GetFormName('2','2','BM2_021btn001');
  pm_UpdateCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_Name.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  lb_EtcCode.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORRELAYCODE');
  lb_DoorMemo.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORMEMO');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  lb_NodeName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  with sg_Door do
  begin
    cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
    cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
    cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
    cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONDOORGUBUN');
    cells[4,0] := 'AntiPass';
  end;
  btn_SelectBuildingPosition.Caption := dmFormFunction.GetFormName('2','2','BM2_021_01');
  btn_SelectDoorGubun.Caption := dmFormFunction.GetFormName('2','2','BM2_021_02');
  lb_DoorGubun1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORGUBUN');
  btn_DoorGubunApply.Caption := dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
  btn_BuildingSelect.Caption := dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
  btn_DoorGubunCancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  btn_BuildingCancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');

  mn_Crop.Caption := dmFormFunction.GetFormName('0','2','COMCUT');
  mn_Past.Caption := dmFormFunction.GetFormName('0','2','COMPASTE');
  mn_ScheduleUse.Caption := dmFormFunction.GetFormName('0','2','COMDOORSCHUSE');
  pm_SchedulNotUse.Caption := dmFormFunction.GetFormName('0','2','COMNOTUSE');
  pm_SchedulUse.Caption := dmFormFunction.GetFormName('0','2','COMUSE');
  mn_TimecodeUse.Caption := dmFormFunction.GetFormName('0','2','COMMONTIMEDOORUSE');
  pm_TimeCodeNotUse.Caption := dmFormFunction.GetFormName('0','2','COMNOTUSE');
  pm_TimeCodeUse.Caption := dmFormFunction.GetFormName('0','2','COMUSE');
  mn_DeviceInfo.Caption := dmFormFunction.GetFormName('0','2','COMDEVICEINFO');
  pm_BuildingPast.Caption := dmFormFunction.GetFormName('0','2','COMPASTE');
end;

procedure TfmDoor.FormResize(Sender: TObject);
begin
  inherited;
  tv_List.Height := Height - tv_List.Top - 30;

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  tv_List.Height := List.Height - tv_List.Top - 30;
  tv_List.Width := List.Width - (tv_List.Left * 2);

  Pan_Workcode.Left := (Width div 2) - (Pan_Workcode.Width div 2);
  Pan_Workcode.top := (Height div 2) - (Pan_Workcode.Height div 2);

  pan_DoorMangement.Left := (Width div 2) - (pan_DoorMangement.Width div 2);
  pan_DoorMangement.top := (Height div 2) - (pan_DoorMangement.Height div 2) - 30;

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

procedure TfmDoor.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSDOORCODE,'TRUE');

  SearchList('');

end;

procedure TfmDoor.Form_Close;
begin
  Close;
end;

procedure TfmDoor.mn_CropClick(Sender: TObject);
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
  if copy(L_stMoveCode,1,1) <> 'D' then
  begin
    L_stMoveCode := '';
    Exit;
  end;
  tv_List.Selected.ImageIndex := con_LocalDoorSelectImageIndex;
  mn_Crop.Visible := False;
  mn_Past.Visible := True;
end;

procedure TfmDoor.mn_PastClick(Sender: TObject);
var
  stBuildingCode : string;
  stSql : string;
  stNodeNo,stEcuID,stExtendID,stDoorNo:string;
  stMessage : string;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',mn_Past.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  stBuildingCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stBuildingCode,1,1) = 'D' then //옮기려는 위치가 출입문이면 조회순서 변경 후 빠져 나가자
  begin
    if copy(L_stMoveCode,1,1) <> 'D' then Exit; //대상이 출입문이 아니면 빠져 나가자.
    MoveDoorViewSeq(stBuildingCode,L_stMoveCode);
    SearchList(L_stMoveCode);
    Exit;
  end;
  if copy(L_stMoveCode,1,1) <> 'D' then Exit;
  stNodeNo := copy(L_stMoveCode,2,G_nNodeCodeLength);
  stEcuID := copy(L_stMoveCode,2 + G_nNodeCodeLength,2);
  stExtendID := copy(L_stMoveCode,2 + G_nNodeCodeLength + 2,2);
  stExtendID := inttostr(strtoint(stExtendID));
  stDoorNo := copy(L_stMoveCode,2 + G_nNodeCodeLength + 2 + 2,1);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'BC_BUILDINGCODE',stBuildingCode);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_NAMECHANGE','1');

  SearchList(L_stMoveCode);
end;

procedure TfmDoor.MoveDoorViewSeq(aTargetCode, aOrgCode: string);
var
  stTargetNodeNo : string;
  stTargetEcuID : string;
  stTargetExtendID : string;
  stTargetDoorNo : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stBuildingCode : string;
  stViewSeq : string;
begin
  stTargetNodeNo := copy(aTargetCode,2,G_nNodeCodeLength);
  stTargetEcuID := copy(aTargetCode,2 + G_nNodeCodeLength,2);
  stTargetExtendID := copy(aTargetCode,2 + G_nNodeCodeLength + 2,2);
  stTargetExtendID := inttostr(strtoint(stTargetExtendID));
  stTargetDoorNo := copy(aTargetCode,2 + G_nNodeCodeLength + 2 + 2,1);

  stBuildingCode := dmDBFunction.GetTB_Door_BuildingCode(stTargetNodeNo,stTargetEcuID,stTargetDoorNo);

  stNodeNo := copy(aOrgCode,2,G_nNodeCodeLength);
  stEcuID := copy(aOrgCode,2 + G_nNodeCodeLength,2);
  stExtendID := copy(aOrgCode,2 + G_nNodeCodeLength + 2,2);
  stExtendID := inttostr(strtoint(stExtendID));
  stDoorNo := copy(aOrgCode,2 + G_nNodeCodeLength + 2 + 2,1);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'BC_BUILDINGCODE',stBuildingCode); //빌딩코드 변경처리
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_NAMECHANGE','1');

  stViewSeq := dmDBFunction.GetTB_Door_ViewSeq(stTargetNodeNo,stTargetEcuID,stTargetDoorNo);
  dmDBUpdate.UpdateTB_DOOR_ViewSeqInc(stViewSeq);   //현재 조회순서에서 증가 시킴
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_VIEWSEQ',stViewSeq); //출입문변경처리
end;

procedure TfmDoor.pm_DeleteCodeClick(Sender: TObject);
var
  stMessage : string;
  stCode : string;
  stSql : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
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
  stDoorNo := copy(stCode,2 + G_nNodeCodeLength + 2 + 2,1);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_DOORUSE','0');
  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stDoorNo, con_ComLogTYPE_DOOR, L_stMenuID + '(' + Caption + '): Delete');
  SearchList(stCode);
end;

procedure TfmDoor.pm_SchedulNotUseClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  stCode : string;
  stMessage : string;
begin
  Try
    if tv_List.Selected = nil then Exit;
(*    if Not dmPCClient.Connected then
    begin
      stMessage := dmFormMessage.GetMessage('SERVERDISCONNECTWORK');
      stMessage := stringReplace(stMessage,'$DATA',dmFormFunction.GetFormName('0','2','COMDOORSCHUSE'),[rfReplaceAll]);
      showmessage(stMessage);
      Exit;
    end;
*)
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
    if copy(stCode,1,1) = 'D' then
    begin
      stNodeNo := copy(stCode,2,G_nNodeCodeLength);
      stEcuID := copy(stCode,2 + G_nNodeCodeLength,2);
      stExtendID := copy(stCode,2 + G_nNodeCodeLength + 2,2);
      stDoorNo := copy(stCode,2 + G_nNodeCodeLength + 2 + 2,1);
      dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_SCHEDULEUSE',inttostr(TMenuItem(Sender).Tag));
      dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_DOORSCHUSE','N');
      dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_SETTINGINFO','N');   //이건 굳이 처리 할 필요 없다.  'N'으로 변경시 컨트롤러에서 출입문 정보를 수신하여 전송
      //stDoorNo := FillZeroNumber(strtoint(stDoorNo),2);
      //stSendData := stDoorNo + inttostr(TMenuItem(Sender).Tag);
      //dmPCClient.SendPacket('C',SCDOOR,'S',stNodeNo,stEcuID,stSendData);
      dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,'스케줄' + TMenuItem(Sender).Caption);
    end else
    begin
      showmessage(dmFormMessage.GetMessage('SELECTDEVICENOTDOOR'));
      Exit;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;

end;

procedure TfmDoor.pm_TimeCodeNotUseClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  stCode : string;
  stMessage : string;
begin
  Try
    if tv_List.Selected = nil then Exit;
(*    if Not dmPCClient.Connected then
    begin
      stMessage := dmFormMessage.GetMessage('SERVERDISCONNECTWORK');
      stMessage := stringReplace(stMessage,'$DATA',dmFormFunction.GetFormName('0','2','COMMONTIMEDOORUSE'),[rfReplaceAll]);
      showmessage(stMessage);
      Exit;
    end;
*)
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
    if copy(stCode,1,1) = 'D' then
    begin
      stNodeNo := copy(stCode,2,G_nNodeCodeLength);
      stEcuID := copy(stCode,2 + G_nNodeCodeLength,2);
      stExtendID := copy(stCode,2 + G_nNodeCodeLength + 2,2);
      stDoorNo := copy(stCode,2 + G_nNodeCodeLength + 2 + 2,1);
      dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_TIMECODEUSE',inttostr(TMenuItem(Sender).Tag));
      dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(stNodeNo,stEcuID,'0','DE_TIMECODEUSE','U');
(*      stDoorNo := FillZeroNumber(strtoint(stDoorNo),2);
      stSendData := stDoorNo + inttostr(TMenuItem(Sender).Tag);
      dmPCClient.SendPacket('C',SCDOOR,'T',stNodeNo,stEcuID,stSendData);
*)
      dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,'타임코드' + TMenuItem(Sender).Caption);
    end else
    begin
      showmessage(dmFormMessage.GetMessage('SELECTDEVICENOTDOOR'));
      Exit;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;

end;

procedure TfmDoor.pm_UpdateCodeClick(Sender: TObject);
var
  stMessage : string;
  stTemp : string;
  stNodeNo : string;
  stExtendID : string;
  stEcuID : string;
  stDoorNo : string;
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
  if copy(ed_SelectCode.Text,1,1) <> 'D' then Exit;
  stTemp := ed_SelectCode.Text;
  Delete(stTemp,1,1);
  stNodeNo := copy(stTemp,1,G_nNodeCodeLength);
  stEcuID := copy(stTemp,1 + G_nNodeCodeLength,2);
  stExtendID := copy(stTemp,1 + G_nNodeCodeLength + 2,2);
  stDoorNo := copy(stTemp,1 + G_nNodeCodeLength + 2 + 2,1);

  Pan_Workcode.Visible := True;
  lb_WorkType.Caption := pm_UpdateCode.Caption;
  ed_Name.Text := tv_List.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  mem_DoorMemo.Text := dmDBFunction.GetTB_Door_DoorMemo(stNodeNo,stEcuID,stDoorNo);
  ed_RelayCode.Text := dmDBFunction.GetTB_Door_RelayNo(stNodeNo,stEcuID,stDoorNo);
  L_stOrgRelayCode := ed_RelayCode.Text;
  L_stWork := 'SELECTCODEUPDATE';
  ed_Name.SetFocus;
end;

procedure TfmDoor.SearchDoorNode(aNodeNo: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_Door,5,2,true);
  stSql := ' Select a.*,c.BC_BUILDINGNAME,d.DG_NAME,e.AG_NAME from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';   //컨트롤러 사용중인거에서
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND b.DE_EXTENDID = 0 ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE = c.BC_BUILDINGCODE ) ';
  stSql := stSql + ' Left Join TB_DOORGUBUN d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.DG_CODE = d.DG_CODE ) ';
  stSql := stSql + ' Left Join TB_ANTIGROUPCODE e ';
  stSql := stSql + ' ON(a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.AG_CODE = e.AG_CODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if isDigit(aNodeNo) then stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ ';
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
      with sg_Door do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('DO_DOORNAME').AsString;
          cells[2,nRow] := FindField('BC_BUILDINGNAME').AsString;
          cells[3,nRow] := FindField('DG_NAME').AsString;
          cells[4,nRow] := FindField('AG_NAME').AsString;
          cells[5,nRow] := FindField('ND_NODENO').AsString;
          cells[6,nRow] := FindField('DE_ECUID').AsString;
          cells[7,nRow] := FindField('DE_EXTENDID').AsString;
          cells[8,nRow] := FindField('DO_DOORNO').AsString;
          cells[9,nRow] := FindField('AG_CODE').AsString;

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

procedure TfmDoor.SearchList(aCode: string);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
  stDoorAllCode : string;
begin
  L_stMoveCode := '';
  mn_Crop.Visible := True;
  mn_Past.Visible := False;
  popupmenu := nil;

  aTreeView := tv_List;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := tv_Code;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  stSql := ' Select * from TB_BUILDINGCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_CODEUSE = ''1'' ';
  stSql := stSql + ' Order by BC_DEEPSEQ,BC_VIEWSEQ ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        if FindField('BC_DEEPSEQ').AsInteger = 0 then
        begin
          aNode := aTreeView.Items.Add(nil,FindField('BC_BUILDINGNAME').AsString);
          vTreeView.Items.AddChild(nil,FindField('BC_BUILDINGCODE').AsString);
          aNode.Expanded := True;
        end else
        begin
          nDeepSeq := FindField('BC_DEEPSEQ').AsInteger;
          stParentCode := copy(FindField('BC_BUILDINGCODE').AsString,1,1 + ((nDeepSeq - 1) * G_nBuildingCodeLength) );
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,FindField('BC_BUILDINGNAME').AsString);
              cNode.ImageIndex := con_LocalBuildingImageIndex;
              cNode.SelectedIndex := con_LocalBuildingImageIndex;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then
            begin
              vNode3:= vTreeView.Items.AddChild(vNode2,FindField('BC_BUILDINGCODE').AsString);
            end;
            bNode.Expanded := True;
            vNode1.Expanded := True;
          end;
        end;
        Next;
      end;
      stSql := ' Select a.* from TB_DOOR a ';
      stSql := stSql + ' Inner Join TB_DEVICE b ';
      stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';   //컨트롤러 사용중인거에서
      stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
      stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
      stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
      stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
      stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
      stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
      stSql := stSql + ' Order by a.DO_VIEWSEQ ';

      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
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
            cNode:= aTreeView.Items.AddChild(bNode,FindField('DO_DOORNAME').AsString);
            cNode.ImageIndex := con_LocalDoorImageIndex;
            cNode.SelectedIndex := con_LocalDoorImageIndex;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            stDoorAllCode := 'D' + FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString  + FillZeroNumber(FindField('DE_EXTENDID').AsInteger,2) + FindField('DO_DOORNO').AsString;
            vNode3:= vTreeView.Items.AddChild(vNode2,stDoorAllCode);
          end;
          bNode.Expanded := True;
          vNode1.Expanded := True;
          if aCode = stDoorAllCode  then
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

procedure TfmDoor.sg_DoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
  State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nDoorCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nDoorCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nDoorCheckCount := L_nDoorCheckCount + 1
    else L_nDoorCheckCount := L_nDoorCheckCount - 1 ;
  end;

end;

procedure TfmDoor.tv_ListClick(Sender: TObject);
var
  stCode : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDoorNo : string;
  stScheduleUse : string;
  stTimeCodeUse : string;
  stNodeName : string;
begin
  inherited;
  if tv_List.Selected = nil then Exit;

  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;

  if copy(stCode,1,1) = 'D' then
  begin
    popupmenu := pm_Work;
    stNodeNo := copy(stCode,2,G_nNodeCodeLength);
    stEcuID := copy(stCode,2 + G_nNodeCodeLength,2);
    stExtendID := copy(stCode,2 + G_nNodeCodeLength + 2,2);
    stDoorNo := copy(stCode,2 + G_nNodeCodeLength + 2 + 2,1);
    stScheduleUse := dmDBFunction.GetTB_DOOR_ScheduleUse(stNodeNo,stEcuID,stDoorNo);
    if stScheduleUse = '0'  then
    begin
      pm_SchedulNotUse.Checked := True;
      pm_SchedulUse.Checked := False;
    end else if stScheduleUse = '1' then
    begin
      pm_SchedulNotUse.Checked := False;
      pm_SchedulUse.Checked := True;
    end else
    begin
      pm_SchedulNotUse.Checked := False;
      pm_SchedulUse.Checked := False;
    end;
    stTimeCodeUse := dmDBFunction.GetTB_DOOR_TimeCodeUse(stNodeNo,stEcuID,stDoorNo);
    if stTimeCodeUse = '0'  then
    begin
      pm_TimeCodeNotUse.Checked := True;
      pm_TimeCodeUse.Checked := False;
    end else if stTimeCodeUse = '1' then
    begin
      pm_TimeCodeNotUse.Checked := False;
      pm_TimeCodeUse.Checked := True;
    end else
    begin
      pm_TimeCodeNotUse.Checked := False;
      pm_TimeCodeUse.Checked := False;
    end;

    stNodeName := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
    mn_DeviceInfo.Caption := stNodeName + ':' + stEcuID + '-' + stDoorNo;
  end else
  begin
    if L_stMoveCode = '' then popupmenu := nil
    else popupmenu := pm_Building;
  end;
end;

procedure TfmDoor.tv_ListDblClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(self);
end;

procedure TfmDoor.tv_ListDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stBuildingCode : string;
  stDeepSeq,stViewSeq : string;
  stSql : string;
  stNodeNo,stEcuID,stExtendID,stDoorNo:string;
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
      stOrgCode := tv_Code.Items[currentItem.AbsoluteIndex].Text;
      if copy(stBuildingCode,1,1) = 'D' then //옮기려는 위치가 출입문이면 조회순서 변경 후 빠져 나가자
      begin
        if copy(stOrgCode,1,1) <> 'D' then Exit; //대상이 출입문이 아니면 빠져 나가자.
        MoveDoorViewSeq(stBuildingCode,stOrgCode);
        SearchList(stOrgCode);
        Exit;
      end;
      if copy(stOrgCode,1,1) <> 'D' then Exit;
      stNodeNo := copy(stOrgCode,2,G_nNodeCodeLength);
      stEcuID := copy(stOrgCode,2 + G_nNodeCodeLength,2);
      stExtendID := copy(stOrgCode,2 + G_nNodeCodeLength + 2,2);
      stExtendID := inttostr(strtoint(stExtendID));
      stDoorNo := copy(stOrgCode,2 + G_nNodeCodeLength + 2 + 2,1);
      dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'BC_BUILDINGCODE',stBuildingCode);
      dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_NAMECHANGE','1');
    end;
  end;
  SearchList(stOrgCode);
end;

procedure TfmDoor.tv_ListDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_List;
end;

initialization
  RegisterClass(TfmDoor);
Finalization
  UnRegisterClass(TfmDoor);

end.
