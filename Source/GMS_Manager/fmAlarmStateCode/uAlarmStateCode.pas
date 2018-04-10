﻿unit uAlarmStateCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, AdvOfficeTabSetStylers, AdvCombo,
  AdvToolBar, AdvToolBarStylers, AdvGlowButton, AdvOfficePager,
  AdvOfficePagerStylers, AdvAppStyler, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  AdvOfficeButtons;

const
  con_LocalBuildingImageIndex = 1;
  con_LocalArmAreaImageIndex = 8;
  con_LocalSelectArmAreaImageIndex = 9;

type
  TfmAlarmStateCode = class(TfmASubForm)
    BodyPanel: TW7Panel;
    MenuImageList16: TImageList;
    pan_ArmAreaMangement: TAdvSmoothPanel;
    pan_DoorSearch: TAdvSmoothPanel;
    lb_AlarmGroupName: TAdvSmoothLabel;
    cmb_AlarmGroup: TAdvComboBox;
    sg_AlarmPCCode: TAdvStringGrid;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_caption: TLabel;
    btn_ArmAreaClose: TAdvGlowButton;
    btn_SelectSetting: TAdvGlowButton;
    AdvSmoothPanel1: TAdvSmoothPanel;
    lb_AlarmCode: TAdvSmoothLabel;
    ed_AlarmPCCode: TAdvEdit;
    lb_AlarmName: TAdvSmoothLabel;
    ed_AlarmEventName: TAdvEdit;
    chk_AlarmEventSound: TAdvOfficeCheckBox;
    chk_alarmEventView: TAdvOfficeCheckBox;
    lb_AlarmEventColor: TAdvSmoothLabel;
    pan_AlarmColor: TPanel;
    btn_Save: TAdvGlowButton;
    pan_Setting: TAdvSmoothPanel;
    lb_AlarmCodeSetting: TLabel;
    btn_AlarmCodeSettingCancel: TAdvGlowButton;
    btn_AlarmCodeApply: TAdvGlowButton;
    chk_AlarmViewChange: TAdvOfficeCheckBox;
    cmb_AlarmViewUse: TAdvComboBox;
    chk_AlarmEventSoundChange: TAdvOfficeCheckBox;
    cmb_AlarmEventSoundUse: TAdvComboBox;
    chk_AlarmEventColorChange: TAdvOfficeCheckBox;
    Pan_AllColor: TPanel;
    ColorDialog1: TColorDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_AlarmPCCodeCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_AlarmGroupChange(Sender: TObject);
    procedure sg_AlarmPCCodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_SelectSettingClick(Sender: TObject);
    procedure btn_AlarmCodeSettingCancelClick(Sender: TObject);
    procedure btn_AlarmCodeApplyClick(Sender: TObject);
    procedure pan_AlarmColorClick(Sender: TObject);
    procedure Pan_AllColorClick(Sender: TObject);
  private
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    L_stMoveCode : string;
    L_stAllName : string;
    L_nArmAreaCheckCount : integer;
    cmbCCTVCodeList : TStringList;
    AlarmGroupCodeList : TStringList;
    procedure FormNameSetting;
    procedure FontSetting;
    procedure SearchAlarmPCCode(aAlarmGroup:string;aAlarmCode:string='';aTopRow:integer=0);
  private
    { Private declarations }
    procedure MoveArmAreaViewSeq(aTargetCode,aOrgCode:string);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmAlarmStateCode: TfmAlarmStateCode;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBSelect,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormUtil,
  uComboBoxCodeLoad,
  uMain;
{$R *.dfm}

procedure TfmAlarmStateCode.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmAlarmStateCode.btn_AlarmCodeApplyClick(Sender: TObject);
var
  bCheckState : Boolean;
  i : integer;
  stCode : string;
  stAlarmGroup : string;
begin
  inherited;
  with sg_AlarmPCCode do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        stCode := Cells[1,i];
        if chk_AlarmViewChange.Checked then dmDBUpdate.UpdateTB_ALARMEVENTSTATEPCCODE_Field_StringValue(stCode,'AP_VIEW',inttostr(cmb_AlarmViewUse.ItemIndex));
        if chk_AlarmEventSoundChange.Checked then dmDBUpdate.UpdateTB_ALARMEVENTSTATEPCCODE_Field_StringValue(stCode,'AP_SOUND',inttostr(cmb_AlarmEventSoundUse.ItemIndex));
        if chk_AlarmEventColorChange.Checked then dmDBUpdate.UpdateTB_ALARMEVENTSTATEPCCODE_Field_IntValue(stCode,'AP_COLOR',inttostr(Pan_AllColor.Color));
      end;
    end;
  end;
  pan_Setting.Visible := False;
  stAlarmGroup := '';
  if cmb_AlarmGroup.ItemIndex > 0 then stAlarmGroup := AlarmGroupCodeList.Strings[cmb_AlarmGroup.ItemIndex];
  SearchAlarmPCCode(stAlarmGroup,ed_AlarmPCCode.Text,sg_AlarmPCCode.TopRow);

end;

procedure TfmAlarmStateCode.btn_AlarmCodeSettingCancelClick(Sender: TObject);
begin
  inherited;
  pan_Setting.Visible := False;
end;

procedure TfmAlarmStateCode.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmAlarmStateCode.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmAlarmStateCode.btn_SaveClick(Sender: TObject);
var
  stEventView : string;
  stEventSound : string;
  stAlarmGroup : string;
begin
  inherited;
  stEventView := '0';
  if chk_alarmEventView.Checked then stEventView := '1';
  stEventSound := '0';
  if chk_AlarmEventSound.Checked then stEventSound := '1';

  dmDBUpdate.UpdateTB_ALARMEVENTSTATEPCCODE_Field_StringValue(ed_AlarmPCCode.Text,'AP_EVENTSTATEPCCODENAME' + inttostr(G_nFormLanguageType),ed_AlarmEventName.Text );
  dmDBUpdate.UpdateTB_ALARMEVENTSTATEPCCODE_Field_StringValue(ed_AlarmPCCode.Text,'AP_VIEW',stEventView);
  dmDBUpdate.UpdateTB_ALARMEVENTSTATEPCCODE_Field_StringValue(ed_AlarmPCCode.Text,'AP_SOUND',stEventSound);
  dmDBUpdate.UpdateTB_ALARMEVENTSTATEPCCODE_Field_IntValue(ed_AlarmPCCode.Text,'AP_COLOR',inttostr(pan_AlarmColor.Color));

  stAlarmGroup := '';
  if cmb_AlarmGroup.ItemIndex > 0 then stAlarmGroup := AlarmGroupCodeList.Strings[cmb_AlarmGroup.ItemIndex];
  SearchAlarmPCCode(stAlarmGroup,ed_AlarmPCCode.Text,sg_AlarmPCCode.TopRow);

end;

procedure TfmAlarmStateCode.btn_SelectSettingClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if L_nArmAreaCheckCount < 1 then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_SelectSetting.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  pan_Setting.Visible := True;
end;

procedure TfmAlarmStateCode.cmb_AlarmGroupChange(Sender: TObject);
var
  stAlarmGroup : string;
begin
  inherited;
  stAlarmGroup := '';
  if cmb_AlarmGroup.ItemIndex > 0 then stAlarmGroup := AlarmGroupCodeList.Strings[cmb_AlarmGroup.ItemIndex];
  SearchAlarmPCCode(stAlarmGroup);

end;

procedure TfmAlarmStateCode.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
  *)
end;

procedure TfmAlarmStateCode.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmAlarmStateCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cmbCCTVCodeList.Free;
  AlarmGroupCodeList.Free;

  fmMain.FORMENABLE(con_FormBMOSALARMSTATECODE,'FALSE');

  Action := caFree;
end;

procedure TfmAlarmStateCode.FormCreate(Sender: TObject);
begin
  inherited;
  if G_nFormLanguageType = 1 then
  begin
//    ed_name.ImeMode := imSHanguel;//imHanguel;
//    ed_name.ImeName := '';
  end else if G_nFormLanguageType = 2 then
  begin
//    ed_name.ImeMode := imAlpha;
//    ed_name.ImeName := '';
  end;


  cmbCCTVCodeList := TStringList.Create;
  AlarmGroupCodeList := TStringList.Create;

  FontSetting;
end;

procedure TfmAlarmStateCode.FormGradeRefresh;
begin

end;

procedure TfmAlarmStateCode.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmAlarmStateCode.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_caption.Caption := dmFormFunction.GetFormName('3','1','BM2_0153');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  lb_AlarmGroupName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONALARMGROUP');
  with sg_AlarmPCCode do
  begin
    cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONALARMEVENTCODE');
    cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONALARMEVENTNAME');
    cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONALARMGROUP');
    cells[4,0] := dmFormFunction.GetFormName('0','2','COMMONALARMVIEW');
    cells[5,0] := dmFormFunction.GetFormName('0','2','COMMONALARMSOUND');
    cells[6,0] := dmFormFunction.GetFormName('0','2','COMMONALARMCOLOR');
  end;
  btn_SelectSetting.Caption := dmFormFunction.GetFormName('0','2','COMMONSELECTSETTING');
  lb_AlarmCodeSetting.Caption := dmFormFunction.GetFormName('0','2','COMMONSELECTSETTING');
  lb_AlarmCode.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONALARMEVENTCODE');
  lb_AlarmName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONALARMEVENTNAME');
  chk_alarmEventView.Caption := dmFormFunction.GetFormName('0','2','COMMONALARMVIEW');
  chk_AlarmEventSound.Caption := dmFormFunction.GetFormName('0','2','COMMONALARMSOUND');
  lb_AlarmEventColor.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONALARMCOLOR');
  chk_AlarmViewChange.Caption := dmFormFunction.GetFormName('0','2','COMMONALARMVIEWCHANGE');
  chk_AlarmEventSoundChange.Caption := dmFormFunction.GetFormName('0','2','COMMONALARMSOUNDCHANGE');
  chk_AlarmEventColorChange.Caption := dmFormFunction.GetFormName('0','2','COMMONALARMCOLORCHANGE');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  cmb_AlarmViewUse.Items.Clear;
  cmb_AlarmViewUse.Items.Add(dmFormFunction.GetFormName('0','2','COMNOTUSE'));
  cmb_AlarmViewUse.Items.Add(dmFormFunction.GetFormName('0','2','COMUSE'));
  cmb_AlarmViewUse.ItemIndex := 0;
  cmb_AlarmEventSoundUse.Items.Clear;
  cmb_AlarmEventSoundUse.Items.Add(dmFormFunction.GetFormName('0','2','COMNOTUSE'));
  cmb_AlarmEventSoundUse.Items.Add(dmFormFunction.GetFormName('0','2','COMUSE'));
  cmb_AlarmEventSoundUse.ItemIndex := 0;
end;

procedure TfmAlarmStateCode.FormResize(Sender: TObject);
begin
  inherited;

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  pan_ArmAreaMangement.Left := (Width div 2) - (pan_ArmAreaMangement.Width div 2);
  pan_ArmAreaMangement.top := (Height div 2) - (pan_ArmAreaMangement.Height div 2) - 30;

  if Windowstate = wsMaximized then
  begin
    //btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;
  pan_Setting.Left := (Width div 2) - (pan_Setting.Width div 2);
  pan_Setting.top := (Height div 2) - (pan_Setting.Height div 2);
end;

procedure TfmAlarmStateCode.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  LoadAlarmGroup(AlarmGroupCodeList,TComboBox(cmb_AlarmGroup),True,L_stAllName);
  cmb_AlarmGroupChange(cmb_AlarmGroup);
  fmMain.FORMENABLE(con_FormBMOSALARMSTATECODE,'TRUE');

end;

procedure TfmAlarmStateCode.Form_Close;
begin
  Close;
end;


procedure TfmAlarmStateCode.MoveArmAreaViewSeq(aTargetCode, aOrgCode: string);
var
  stTargetNodeNo : string;
  stTargetEcuID : string;
  stTargetExtendID : string;
  stTargetArmAreaNo : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stArmAreaNo : string;
  stBuildingCode : string;
  stViewSeq : string;
begin
  stTargetNodeNo := copy(aTargetCode,2,G_nNodeCodeLength);
  stTargetEcuID := copy(aTargetCode,2 + G_nNodeCodeLength,2);
  stTargetExtendID := copy(aTargetCode,2 + G_nNodeCodeLength + 2,2);
  stTargetExtendID := inttostr(strtoint(stTargetExtendID));
  stTargetArmAreaNo := copy(aTargetCode,2 + G_nNodeCodeLength + 2 + 2,1);

  stBuildingCode := dmDBFunction.GetTB_ARMAREA_BuildingCode(stTargetNodeNo,stTargetEcuID,stTargetArmAreaNo);

  stNodeNo := copy(aOrgCode,2,G_nNodeCodeLength);
  stEcuID := copy(aOrgCode,2 + G_nNodeCodeLength,2);
  stExtendID := copy(aOrgCode,2 + G_nNodeCodeLength + 2,2);
  stExtendID := inttostr(strtoint(stExtendID));
  stArmAreaNo := copy(aOrgCode,2 + G_nNodeCodeLength + 2 + 2,1);
  dmDBUpdate.UpdateTB_ArmArea_Field_StringValue(stNodeNo,stEcuID,stExtendID,stArmAreaNo,'BC_BUILDINGCODE',stBuildingCode);
  dmDBUpdate.UpdateTB_ArmArea_Field_StringValue(stNodeNo,stEcuID,stExtendID,stArmAreaNo,'AR_NAMECHANGE','1');


  stViewSeq := dmDBFunction.GetTB_ARMAREA_ViewSeq(stTargetNodeNo,stTargetEcuID,stTargetArmAreaNo);
  dmDBUpdate.UpdateTB_ARMAREA_ViewSeqInc(stViewSeq);   //현재 조회순서에서 증가 시킴
  dmDBUpdate.UpdateTB_ArmArea_Field_StringValue(stNodeNo,stEcuID,stExtendID,stArmAreaNo,'AR_VIEWSEQ',stViewSeq); //빌딩코드 변경처리

end;

procedure TfmAlarmStateCode.pan_AlarmColorClick(Sender: TObject);
begin
  inherited;
  ColorDialog1.Color := pan_AlarmColor.Color;
  if ColorDialog1.Execute then
  begin
    pan_AlarmColor.Color := ColorDialog1.Color;
  end;
end;

procedure TfmAlarmStateCode.Pan_AllColorClick(Sender: TObject);
begin
  inherited;
  ColorDialog1.Color := Pan_AllColor.Color;
  if ColorDialog1.Execute then
  begin
    Pan_AllColor.Color := ColorDialog1.Color;
  end;

end;

procedure TfmAlarmStateCode.SearchAlarmPCCode(aAlarmGroup: string;aAlarmCode:string='';aTopRow:integer=0);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_AlarmPCCode,7,2,true);
  stSql := ' Select a.AP_EVENTSTATEPCCODE,a.AP_EVENTSTATEPCCODENAME' + inttostr(G_nFormLanguageType) + ' as EVENTNAME,a.AP_VIEW,a.AP_SOUND,a.AP_COLOR,b.AG_NAME' + inttostr(G_nFormLanguageType) + ' as GROUPNAME from TB_ALARMEVENTSTATEPCCODE a ';
  stSql := stSql + ' Inner Join TB_ALARMEVENTSTATEGROUP b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';   //컨트롤러 사용중인거에서
  stSql := stSql + ' AND a.AG_ALARMGROUPCODE = b.AG_ALARMGROUPCODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aAlarmGroup <> '' then stSql := stSql + ' and a.AG_ALARMGROUPCODE = ''' + aAlarmGroup + ''' ';

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
      with sg_AlarmPCCode do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('AP_EVENTSTATEPCCODE').AsString;
          cells[2,nRow] := FindField('EVENTNAME').AsString;
          cells[3,nRow] := FindField('GROUPNAME').AsString;
          cells[4,nRow] := FindField('AP_VIEW').AsString;
          cells[5,nRow] := FindField('AP_SOUND').AsString;
          cells[6,nRow] := FindField('AP_COLOR').AsString;

          if aAlarmCode = cells[1,nRow] then SelectRows(nRow,1);

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow <> 0 then TopRow := aTopRow;
      end;
      sg_AlarmPCCodeClick(sg_AlarmPCCode);
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlarmStateCode.sg_AlarmPCCodeCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nArmAreaCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nArmAreaCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nArmAreaCheckCount := L_nArmAreaCheckCount + 1
    else L_nArmAreaCheckCount := L_nArmAreaCheckCount - 1 ;
  end;

end;

procedure TfmAlarmStateCode.sg_AlarmPCCodeClick(Sender: TObject);
begin
  inherited;
  with sg_AlarmPCCode do
  begin
    if Not isDigit(cells[6,Row]) then Exit;

    ed_AlarmPCCode.Text := cells[1,Row];
    ed_AlarmEventName.Text := cells[2,Row];
    if cells[4,Row]='1' then chk_alarmEventView.Checked := True
    else chk_alarmEventView.Checked := False;
    if cells[5,Row]='1' then chk_AlarmEventSound.Checked := True
    else chk_AlarmEventSound.Checked := False;
    pan_AlarmColor.Color := strtoint(cells[6,Row]);
  end;
//
end;

initialization
  RegisterClass(TfmAlarmStateCode);
Finalization
  UnRegisterClass(TfmAlarmStateCode);

end.