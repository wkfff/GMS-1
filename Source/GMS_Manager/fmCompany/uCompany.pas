﻿unit uCompany;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls, AdvSmoothTabPager, Vcl.ImgList,
  AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers, AdvAppStyler, AdvPanel,
  AdvOfficePager, AdvGlowButton, AdvOfficePagerStylers;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmCompany = class(TForm)
    MenuImageList16: TImageList;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvPanel1: TAdvPanel;
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    tv_CompanyList: TTreeView;
    tv_CompanyCode: TTreeView;
    Pan_Companycode: TAdvSmoothPanel;
    ed_CompanyName: TAdvEdit;
    ed_SelectCode: TAdvEdit;
    pan_emPermitAdmin: TAdvSmoothPanel;
    pan_PositionInfo: TAdvSmoothPanel;
    lb_EmGradePositionName: TAdvSmoothLabel;
    lb_EmGradeName: TAdvSmoothLabel;
    ed_SelectBuildingName: TAdvEdit;
    btn_BuildingNameSelect: TAdvGlassButton;
    ed_SelectBuildingCode: TAdvEdit;
    btn_emGradeComplete: TAdvGlassButton;
    ed_GradeCompanyCode: TAdvEdit;
    ed_GradeCompanyName: TAdvEdit;
    tp_Grade: TAdvSmoothTabPager;
    tab_DoorPermit: TAdvSmoothTabPage;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    pan_NotPermitDoor: TAdvSmoothPanel;
    pan_NotPermitDoorCount: TAdvSmoothPanel;
    lb_DoorNotPermitCountName: TAdvSmoothLabel;
    lb_NotPermitDoorCount: TAdvSmoothLabel;
    sg_NotPermitDoor: TAdvStringGrid;
    pan_PermitAction: TAdvSmoothPanel;
    btn_PermitDoorAdd: TAdvGlassButton;
    btn_PermitDoorDelete: TAdvGlassButton;
    pan_PermitDoor: TAdvSmoothPanel;
    pan_DoorPermitCount: TAdvSmoothPanel;
    lb_DoorPermitCountName: TAdvSmoothLabel;
    lb_PermitDoorCount: TAdvSmoothLabel;
    sg_PermitDoor: TAdvStringGrid;
    tp_Grade1: TAdvSmoothTabPage;
    tp_Grade2: TAdvSmoothTabPage;
    tp_Grade3: TAdvSmoothTabPage;
    tab_AlarmPermit: TAdvSmoothTabPage;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    pan_NotPermitAlarmArea: TAdvSmoothPanel;
    AdvSmoothPanel5: TAdvSmoothPanel;
    lb_ArmAreaNotPermitCountName: TAdvSmoothLabel;
    lb_NotPermitArmAreaCount: TAdvSmoothLabel;
    sg_NotPermitAlarm: TAdvStringGrid;
    AdvSmoothPanel6: TAdvSmoothPanel;
    btn_PermitArmAreaAdd: TAdvGlassButton;
    btn_PermitArmAreaDelete: TAdvGlassButton;
    pan_PermitAlarmArea: TAdvSmoothPanel;
    AdvSmoothPanel8: TAdvSmoothPanel;
    lb_ArmAreaPermitCountName: TAdvSmoothLabel;
    lb_PermitArmAreaCount: TAdvSmoothLabel;
    sg_PermitAlarm: TAdvStringGrid;
    tv_buildingCode: TTreeView;
    tv_buildingName: TTreeView;
    AdvPanelStyler1: TAdvPanelStyler;
    AdvOfficePager1: TAdvOfficePager;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvOfficePage1: TAdvOfficePage;
    ImageListNew16: TImageList;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    btn_Add: TAdvGlowButton;
    btn_Update: TAdvGlowButton;
    btn_Delete: TAdvGlowButton;
    lb_List: TLabel;
    lb_WorkType: TLabel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    lb_CompanyName: TAdvSmoothLabel;
    pm_Work: TPopupMenu;
    pm_ChiledCodeAdd: TMenuItem;
    pm_UpdateCode: TMenuItem;
    pm_DeleteCode: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure menuTabChange(Sender: TObject);
    procedure tv_CompanyListClick(Sender: TObject);
    procedure pm_ChiledCodeAddClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_CompanyNameKeyPress(Sender: TObject; var Key: Char);
    procedure pm_DeleteCodeClick(Sender: TObject);
    procedure tv_CompanyListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tv_CompanyListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tv_CompanyListDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_emGradeCompleteClick(Sender: TObject);
    procedure pm_CompanyGradeClick(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure btn_BuildingNameSelectClick(Sender: TObject);
    procedure sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitDoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_PermitDoorAddClick(Sender: TObject);
    procedure btn_PermitArmAreaAddClick(Sender: TObject);
    procedure btn_PermitArmAreaDeleteClick(Sender: TObject);
    procedure btn_PermitDoorDeleteClick(Sender: TObject);
    procedure pm_ParentCompanyGradeClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure ListResize(Sender: TObject);
  private
    BuildingArmAreaCodeList : TStringList; //빌딩별 방범구역 코드 리스트를 가지고 있자.
    BuildingDoorCodeList : TStringList; //빌딩별 출입문 코드 리스트를 가지고 있자.
    GradeArmAreaCodeList : TStringList;
    GradeDoorCodeList : TStringList;
    NotGradeArmAreaCodeList : TStringList; //방범권한이 없는 방범리스트
    NotGradeDoorCodeList : TStringList;  //출입권한이 없는 리스트
    L_nPermitArmAreaCheckCount : integer;           //삭제시 방범구역 선택 갯수
    L_nNotPermitArmAreaCheckCount : integer;        //등록시 방범구역 선택 갯수
    L_nPermitDoorCheckCount : integer;           //삭제시 출입문 선택 갯수
    L_nNotPermitDoorCheckCount : integer;        //등록시 출입문 선택 갯수
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
  private
//    procedure CompanyGradeToEmployeeGrade;

    procedure LoadBuildingAlarmAll(aBuildingCode:string;sgList:TAdvStringGrid); //전체 출입문을 리스트에 추가 하자
    procedure LoadBuildingDoorAll(aBuildingCode:string;sgList:TAdvStringGrid); //전체 출입문을 리스트에 추가 하자
    procedure LoadPermitAlarm(aBuildingCode,aCompanyCode:string);
    procedure LoadPermitCompanyArmArea(aBuildingCode,aCompanyCode:string);
    procedure LoadPermitCompanyDoor(aBuildingCode,aCompanyCode:string);
    procedure LoadPermitDoor(aBuildingCode,aCompanyCode:string);

    procedure NotPermitArmAreaListAdd(aArmAreaName,aNodeNo,aEcuID,aExtendID,aArmAreaNo,aArmAreaCode,aArmAreaView:string);
    procedure NotPermitArmAreaListDelete(aArmAreaCode:string);
    procedure NotPermitDoorListAdd(aDoorName,aNodeNo,aEcuID,aExtendID,aDoorNo,aDoorCode,aDoorView:string);
    procedure NotPermitDoorListDelete(aDoorCode:string);

    procedure PermitArmAreaListAdd(aArmAreaName,aNodeNo,aEcuID,aExtendID,aArmAreaNo,aArmAreaCode,aArmAreaView:string);
    procedure PermitArmAreaListDelete(aArmAreaCode:string);
    procedure PermitDoorListAdd(aDoorName,aNodeNo,aEcuID,aExtendID,aDoorNo,aDoorCode,aDoorView:string);
    procedure PermitDoorListDelete(aDoorCode:string);

    procedure FormNameSetting;
    procedure FontSetting;
    function ChangeCompanyCode(aOrgCode,aCode,aDeepSeq,aViewSeq:string):Boolean;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  private
    { Private declarations }
  public
    IsInsertGrade : Boolean;
    IsUpdateGrade : Boolean;
    IsDeleteGrade : Boolean;
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmCompany: TfmCompany;

implementation
uses
  uCommonFunction,
  uComboBoxCodeLoad,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBCardPermit,
  uDBDelete,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBSelect,
  uDBUpdate,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmCompany.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmCompany.btn_AddClick(Sender: TObject);
begin
  pm_ChiledCodeAddClick(pm_ChiledCodeAdd);
end;

procedure TfmCompany.btn_BuildingNameSelectClick(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := True;
  tv_buildingName.Left := btn_BuildingNameSelect.Left;
  tv_buildingName.Top := btn_BuildingNameSelect.Top + btn_BuildingNameSelect.Height;
end;

procedure TfmCompany.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Companycode.Visible := False;
end;

procedure TfmCompany.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCompany.btn_DeleteClick(Sender: TObject);
begin
  pm_DeleteCodeClick(pm_DeleteCode);
end;

procedure TfmCompany.btn_emGradeCompleteClick(Sender: TObject);
begin
  inherited;
  pan_emPermitAdmin.Visible := False;
end;

procedure TfmCompany.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmCompany.btn_PermitArmAreaAddClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
begin
  inherited;
(*  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_PermitArmAreaAdd.Caption,[rfReplaceAll]);
  if L_nNotPermitArmAreaCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  with sg_NotPermitAlarm do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBCardPermit.CompanyArmAreaPermitAdd(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'O' + ed_GradeCompanyCode.Text,Cells[5,i],con_ComLogTYPE_ARMAREA,L_stMenuID + '(' + Caption + '):Permit Add');

        PermitArmAreaListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
        NotPermitArmAreaListDelete(Cells[6,i]);
      end;
    end;
  end;
  dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(ed_GradeCompanyCode.Text,'N'); //자회사 코드의 데이터도 모두 적용 'N' 상태로 해야 됨
  CompanyGradeToEmployeeGrade;
*)
end;

procedure TfmCompany.btn_PermitArmAreaDeleteClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
begin
  inherited;
(*  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_PermitArmAreaDelete.Caption,[rfReplaceAll]);
  if L_nPermitArmAreaCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  with sg_PermitAlarm do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBCardPermit.CompanyArmAreaPermitDelete(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'O' + ed_GradeCompanyCode.Text,Cells[5,i],con_ComLogTYPE_ARMAREA,L_stMenuID + '(' + Caption + '):Permit Delete');

        NotPermitArmAreaListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
        PermitArmAreaListDelete(Cells[6,i]);
      end;
    end;
  end;
  dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(ed_GradeCompanyCode.Text,'N'); //자회사 코드의 데이터도 모두 적용 'N' 상태로 해야 됨
  CompanyGradeToEmployeeGrade;
*)
end;

procedure TfmCompany.btn_PermitDoorAddClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
begin
  inherited;
(*  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_PermitDoorAdd.Caption,[rfReplaceAll]);
  if L_nNotPermitDoorCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  with sg_NotPermitDoor do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBCardPermit.CompanyDoorPermitAdd(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'O' + ed_GradeCompanyCode.Text,Cells[5,i],con_ComLogTYPE_DOOR,L_stMenuID + '(' + Caption + '):Permit Add');

        PermitDoorListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
        NotPermitDoorListDelete(Cells[6,i]);
      end;
    end;
  end;
  dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(ed_GradeCompanyCode.Text,'N'); //자회사 코드의 데이터도 모두 적용 'N' 상태로 해야 됨
  CompanyGradeToEmployeeGrade;
*)
end;

procedure TfmCompany.btn_PermitDoorDeleteClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
begin
  inherited;
(*  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_PermitDoorDelete.Caption,[rfReplaceAll]);
  if L_nPermitDoorCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  with sg_PermitDoor do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBCardPermit.CompanyDoorPermitDelete(ed_GradeCompanyCode.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'O' + ed_GradeCompanyCode.Text,Cells[5,i],con_ComLogTYPE_DOOR,L_stMenuID + '(' + Caption + '):Permit Delete');

        NotPermitDoorListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
        PermitDoorListDelete(Cells[6,i]);
      end;
    end;
  end;
  dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(ed_GradeCompanyCode.Text,'N'); //자회사 코드의 데이터도 모두 적용 'N' 상태로 해야 됨
  CompanyGradeToEmployeeGrade;
*)
end;

procedure TfmCompany.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stParentCode : string;
  stCode,stDeepSeq,stViewSeq : string;
begin
  inherited;
  if Trim(ed_CompanyName.Text) = '' then
  begin
    stMessage := dmFormMessage.GetMessage('BLANKFIELD');
    stMessage := StringReplace(stMessage,'$WORK',lb_CompanyName.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  {
  if dmDBFunction.CheckTB_COMPANYCODE_CompanyName(ed_CompanyName.Text) = 1 then
  begin
    stMessage := dmFormMessage.GetMessage('DBDATADUP');
    stMessage := StringReplace(stMessage,'$WORK',lb_CompanyName.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;  }

  if L_stWork = 'CHILDCODEADD' then
  begin
    stParentCode := ed_SelectCode.Text;
    dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stParentCode,stCode,stDeepSeq,stViewSeq);
    dmDBInsert.InsertIntoTB_COMPANYCODE_All(stCode,ed_CompanyName.Text,stDeepSeq,'1',stViewSeq);
    if G_nMonitoringType <> 1 then
    begin
      stMessage := dmFormMessage.GetMessage('PARENTGRADECOPY');
      //여기에서 권한 복사하자.
      if (Application.MessageBox(pchar(stMessage),'Information',MB_OKCANCEL) = IDOK) then
      begin
        dmDBDelete.DeleteTB_CARDPERMITCOMPANYGROUP_CompanyCode(stCode); //혹시 생성되는 코드의 권한이 있으면 모두 삭제
        dmDBFunction.CopyTB_CARDPERMITCOMPANYGROUP_ChiledCode(stParentCode,stCode,stDeepSeq);
        dmDBCardPermit.CompanyGradeToEmployeeGrade;
      end;
    end;

    LoadCompanyTreeView(stParentCode,tv_CompanyList,tv_CompanyCode,con_LocalCompanyImageIndex);
    tv_CompanyList.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSCOMPANYCODE,'');
  end else if L_stWork = 'EXTCODEADD' then
  begin
    stParentCode := copy(ed_SelectCode.Text,1,Length(ed_SelectCode.Text) - G_nCompanyCodeLength);
    dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stParentCode,stCode,stDeepSeq,stViewSeq);
    dmDBInsert.InsertIntoTB_COMPANYCODE_All(stCode,ed_CompanyName.Text,stDeepSeq,'1',stViewSeq);
    if G_nMonitoringType <> 1 then
    begin
      stMessage := dmFormMessage.GetMessage('PARENTGRADECOPY');
      //여기에서 권한 복사하자.
      if (Application.MessageBox(pchar(stMessage),'Information',MB_OKCANCEL) = IDOK) then
      begin
        dmDBDelete.DeleteTB_CARDPERMITCOMPANYGROUP_CompanyCode(stCode); //혹시 생성되는 코드의 권한이 있으면 모두 삭제
        dmDBFunction.CopyTB_CARDPERMITCOMPANYGROUP_ChiledCode(stParentCode,stCode,stDeepSeq);
        dmDBCardPermit.CompanyGradeToEmployeeGrade;
      end;
    end;
    LoadCompanyTreeView(stParentCode,tv_CompanyList,tv_CompanyCode,con_LocalCompanyImageIndex);
    tv_CompanyList.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSCOMPANYCODE,'');
  end else if L_stWork = 'SELECTCODEUPDATE' then
  begin
    stCode := ed_SelectCode.Text;
    dmDBUpdate.UpdateTB_COMPANYCODE_Field_StringValue(stCode,'CO_COMPANYNAME',ed_CompanyName.Text);
    tv_CompanyList.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text := ed_CompanyName.Text;
    tv_CompanyList.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSCOMPANYCODE,'');
    //SearchList(stCode);
  end;

  Pan_Companycode.Visible := False;
end;

procedure TfmCompany.btn_UpdateClick(Sender: TObject);
begin
  pm_UpdateCodeClick(pm_UpdateCode);
end;

function TfmCompany.ChangeCompanyCode(aOrgCode, aCode, aDeepSeq,
  aViewSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stChildCode,stDeepSeq,stViewSeq : string;
  stOrgDeepSeq : string;
begin
  stOrgDeepSeq := dmDBFunction.GetTB_COMPANYCODE_CurrentDeepSeq(aOrgCode);
  stSql := ' Update TB_COMPANYCODE Set ';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCode + ''',';
  stSql := stSql + ' CO_DEEPSEQ = ' + aDeepSeq + ',';
  stSql := stSql + ' CO_VIEWSEQ = ' + aViewSeq + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

  //여기서 회사코드별 카드권한 테이블 변경
  stSql := ' Update TB_CARDPERMITCOMPANYGROUP set CO_COMPANYCODE = ''' + aCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);

  //여기서 사원테이블 정보를 변경 하자
  stSql := ' Update TB_EMPLOYEE set CO_COMPANYCODE = ''' + aCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'Select * from TB_COMPANYCODE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE Like ''' + aOrgCode + '%'' ';
    stSql := stSql + ' AND CO_DEEPSEQ = ' + inttostr(strtoint(stOrgDeepSeq) + 1) + '';
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
      while Not Eof do
      begin
        dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(aCode,stChildCode,stDeepSeq,stViewSeq); //신규 코드가 부모가 됨
        ChangeCompanyCode(FindField('CO_COMPANYCODE').AsString,stChildCode,stDeepSeq,stViewSeq);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;
(*
procedure TfmCompany.CompanyGradeToEmployeeGrade;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stCompanyCode : string;
begin
  stSql := ' Select CO_DEEPSEQ,CO_COMPANYCODE ';
  stSql := stSql + ' from TB_CARDPERMITCOMPANYGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CP_APPLY <> ''Y'' ';
  stSql := stSql + ' GROUP BY CO_DEEPSEQ,CO_COMPANYCODE ';
  stSql := stSql + ' Order by CO_DEEPSEQ,CO_COMPANYCODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        stCompanyCode := FindField('CO_COMPANYCODE').AsString;
        if dmDBCardPermit.CompanyGradeToEmployeeEachApply(stCompanyCode) then
           dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyCodeApply(stCompanyCode,'Y');
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;
*)

procedure TfmCompany.ed_CompanyNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;
end;

procedure TfmCompany.FontSetting;
begin
//  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
//  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
//  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
//  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
//  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
end;

procedure TfmCompany.FormActivate(Sender: TObject);
begin
  WindowState := wsNormal;
end;

procedure TfmCompany.FormChangeEvent(aNumber: integer);
begin
  case aNumber of
    con_FormBMOSBUILDINGCODE : begin
      LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
    end;
  end;

end;

procedure TfmCompany.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  BuildingDoorCodeList.Free;
  BuildingArmAreaCodeList.Free;
  GradeArmAreaCodeList.Free;
  GradeDoorCodeList.Free;
  NotGradeArmAreaCodeList.Free; //방범권한이 없는 방범리스트
  NotGradeDoorCodeList.Free;  //출입권한이 없는 리스트

  fmMain.FORMENABLE(con_FormBMOSCOMPANYCODE,'FALSE');

  Action := caFree;
end;

procedure TfmCompany.FormCreate(Sender: TObject);
begin
  inherited;
  if G_nFormLanguageType = 1 then
  begin
    ed_CompanyName.ImeMode := imSHanguel;// imHanguel;
    ed_CompanyName.ImeName := '';
  end else if G_nFormLanguageType = 2 then
  begin
    ed_CompanyName.ImeMode := imAlpha;
    ed_CompanyName.ImeName := '';
  end;
  BuildingDoorCodeList := TStringList.Create;
  BuildingArmAreaCodeList := TStringList.Create;
  GradeArmAreaCodeList := TStringList.Create;
  GradeDoorCodeList := TStringList.Create;
  NotGradeArmAreaCodeList := TStringList.Create; //방범권한이 없는 방범리스트
  NotGradeDoorCodeList := TStringList.Create;  //출입권한이 없는 리스트
  FontSetting;
end;

procedure TfmCompany.FormGradeRefresh;
begin
  Try
    if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
    btn_Add.Enabled := IsInsertGrade;
    pm_ChiledCodeAdd.Enabled := IsInsertGrade;
    btn_Delete.Enabled := False;
    pm_DeleteCode.Enabled := IsDeleteGrade;
    btn_Update.Enabled := IsUpdateGrade;
    pm_UpdateCode.Enabled := IsUpdateGrade;
  Except
    Exit;
  End;
end;

procedure TfmCompany.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmCompany.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('2','1','BM2_011');//dmFormFunction.GetFormName('0','2','COMMONLIST01');
  pm_ChiledCodeAdd.Caption := dmFormFunction.GetFormName('2','2','BM2_011pm001');
  btn_Add.Caption := dmFormFunction.GetFormName('2','2','BM2_011pm001');
  pm_DeleteCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  btn_Delete.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  pm_UpdateCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Update.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_CompanyName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');

end;

procedure TfmCompany.FormResize(Sender: TObject);
begin
  inherited;
//  BodyPanel.Left := 0;
//  BodyPanel.Top := 0;
//  BodyPanel.Height := Height - menuTab.Height;
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
  ListResize(List);
end;

procedure TfmCompany.FormShow(Sender: TObject);
begin
  inherited;
  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSCOMPANYCODE,'TRUE');
  WindowState := wsMaximized;

//  menuTab.ActiveTabIndex := 1;
  menuTabChange(self);
  LoadCompanyTreeView('',tv_CompanyList,tv_CompanyCode,con_LocalCompanyImageIndex);
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  FormResize(self);
end;

procedure TfmCompany.Form_Close;
begin
  Close;
end;

procedure TfmCompany.ListResize(Sender: TObject);
begin
  tv_CompanyList.Height := BodyPanel.Height - tv_CompanyList.Top - 30;
  tv_CompanyList.Width := BodyPanel.Width - (tv_CompanyList.Left * 2);

  Pan_Companycode.Left := (Width div 2) - (Pan_Companycode.Width div 2);
  Pan_Companycode.top := (Height div 2) - (Pan_Companycode.Height div 2);
end;

procedure TfmCompany.LoadBuildingAlarmAll(aBuildingCode: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stAlarmAreaCode : string;
begin
  dmFormFunction.GridInit(sgList,2,2,true);
  BuildingArmAreaCodeList.Clear;
  NotGradeArmAreaCodeList.Clear;
  GradeArmAreaCodeList.Clear;

  stSql := dmDBSelect.SelectTB_ARMAREA_BuildingCode(aBuildingCode);
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
      with sgList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('AR_ARMAREANAME').AsString;
          cells[2,nRow] := FindField('ND_NODENO').AsString;
          cells[3,nRow] := FindField('DE_ECUID').AsString;
          cells[4,nRow] := FindField('DE_EXTENDID').AsString;
          cells[5,nRow] := FindField('AR_ARMAREANO').AsString;
          stAlarmAreaCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('AR_ARMAREANO').AsString;
          if BuildingArmAreaCodeList.IndexOf(stAlarmAreaCode) < 0 then BuildingArmAreaCodeList.Add(stAlarmAreaCode);
          if NotGradeArmAreaCodeList.IndexOf(stAlarmAreaCode) < 0 then NotGradeArmAreaCodeList.Add(stAlarmAreaCode);

          cells[6,nRow] := stAlarmAreaCode;
          cells[7,nRow] := FindField('AR_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
        lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',NotGradeArmAreaCodeList.Count)+' ';
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCompany.LoadBuildingDoorAll(aBuildingCode: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  dmFormFunction.GridInit(sgList,2,2,true);
  BuildingDoorCodeList.Clear;
  NotGradeDoorCodeList.Clear;
  GradeDoorCodeList.Clear;

  stSql := dmDBSelect.SelectTB_DOOR_BuildingCode(aBuildingCode,True);
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
      with sgList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('DO_DOORNAME').AsString;
          cells[2,nRow] := FindField('ND_NODENO').AsString;
          cells[3,nRow] := FindField('DE_ECUID').AsString;
          cells[4,nRow] := FindField('DE_EXTENDID').AsString;
          cells[5,nRow] := FindField('DO_DOORNO').AsString;
          stDoorCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('DO_DOORNO').AsString;
          if BuildingDoorCodeList.IndexOf(stDoorCode) < 0 then BuildingDoorCodeList.Add(stDoorCode);
          if NotGradeDoorCodeList.IndexOf(stDoorCode) < 0 then NotGradeDoorCodeList.Add(stDoorCode);

          cells[6,nRow] := stDoorCode;
          cells[7,nRow] := FindField('DO_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
        lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',NotGradeDoorCodeList.Count)+' ';
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCompany.LoadPermitAlarm(aBuildingCode, aCompanyCode: string);
var
  stCompanyCode : string;
  i : integer;
begin
  dmFormFunction.GridInit(sg_PermitAlarm,2,2,true);

  if aCompanyCode = '' then Exit;
  stCompanyCode := '0';
  LoadPermitCompanyArmArea(aBuildingCode,stCompanyCode);    //전체 소속의 권한 조회
  if Length(aCompanyCode) < 2  then  Exit;

  i := 1;
  while stCompanyCode <> aCompanyCode do
  begin
    if Length(stCompanyCode) > Length(aCompanyCode) then Exit; //혹시 무한 루프 도는것을 방지
    stCompanyCode := copy(aCompanyCode,1,1 + (G_nCompanyCodeLength * i));
    LoadPermitCompanyArmArea(aBuildingCode,stCompanyCode);
    i := i + 1;
  end;

end;

procedure TfmCompany.LoadPermitCompanyArmArea(aBuildingCode,
  aCompanyCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stArmAreaCode : string;
begin
  stSql := dmDBSelect.SelectTB_ArmArea_CompanyPermit(aCompanyCode);
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
      if recordcount < 1 then
      begin
        lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',GradeArmAreaCodeList.Count)+' ';
        Exit;
      end;
      nRow := 1;
      while Not Eof do
      begin
        stArmAreaCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('AR_ARMAREANO').AsString;
        if BuildingArmAreaCodeList.IndexOf(stArmAreaCode) > -1 then   //해당 빌딩 구역이면서
        begin
          if FindField('CP_PERMIT').AsString = '1' then
          begin
            //권한 등록
            if GradeArmAreaCodeList.IndexOf(stArmAreaCode) < 0 then
            begin
              PermitArmAreaListAdd(FindField('AR_ARMAREANAME').AsString, FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, FindField('DE_EXTENDID').AsString,
                                FindField('AR_ARMAREANO').AsString, stArmAreaCode, FindField('AR_VIEWSEQ').AsString);
            end;
            if NotGradeArmAreaCodeList.IndexOf(stArmAreaCode) > -1 then
            begin
              NotPermitArmAreaListDelete(stArmAreaCode);
            end;
          end else
          begin
            //권한 삭제
            if GradeArmAreaCodeList.IndexOf(stArmAreaCode) > -1 then
            begin
              //권한 리스트에서 삭제
              PermitArmAreaListDelete(stArmAreaCode);
            end;
            if NotGradeArmAreaCodeList.IndexOf(stArmAreaCode) < 0 then
            begin
              //미등록 권한 리스트에 Add
              NotPermitArmAreaListAdd(FindField('AR_ARMAREANAME').AsString, FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, FindField('DE_EXTENDID').AsString,
                                FindField('AR_ARMAREANO').AsString, stArmAreaCode, FindField('AR_VIEWSEQ').AsString);
            end;

          end;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCompany.LoadPermitCompanyDoor(aBuildingCode, aCompanyCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  stSql := dmDBSelect.SelectTB_Door_CompanyPermit(aCompanyCode);
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
      if recordcount < 1 then
      begin
        lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',GradeDoorCodeList.Count)+' ';
        Exit;
      end;
      nRow := 1;
      while Not Eof do
      begin
        stDoorCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('DO_DOORNO').AsString;
        if BuildingDoorCodeList.IndexOf(stDoorCode) > -1 then   //해당 빌딩 구역이면서
        begin
          if FindField('CP_PERMIT').AsString = '1' then
          begin
            //권한 등록
            if GradeDoorCodeList.IndexOf(stDoorCode) < 0 then
            begin
              PermitDoorListAdd(FindField('DO_DOORNAME').AsString, FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, FindField('DE_EXTENDID').AsString,
                                FindField('DO_DOORNO').AsString, stDoorCode, FindField('DO_VIEWSEQ').AsString);
            end;
            if NotGradeDoorCodeList.IndexOf(stDoorCode) > -1 then
            begin
              NotPermitDoorListDelete(stDoorCode);
            end;
          end else
          begin
            //권한 삭제
            if GradeDoorCodeList.IndexOf(stDoorCode) > -1 then
            begin
              //권한 리스트에서 삭제
              PermitDoorListDelete(stDoorCode);
            end;
            if NotGradeDoorCodeList.IndexOf(stDoorCode) < 0 then
            begin
              //미등록 권한 리스트에 Add
              NotPermitDoorListAdd(FindField('DO_DOORNAME').AsString, FindField('ND_NODENO').AsString, FindField('DE_ECUID').AsString, FindField('DE_EXTENDID').AsString,
                                FindField('DO_DOORNO').AsString, stDoorCode, FindField('DO_VIEWSEQ').AsString);
            end;

          end;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCompany.LoadPermitDoor(aBuildingCode, aCompanyCode: string);
var
  stCompanyCode : string;
  i : integer;
begin
  dmFormFunction.GridInit(sg_PermitDoor,2,2,true);

  if aCompanyCode = '' then Exit;
  stCompanyCode := '0';
  LoadPermitCompanyDoor(aBuildingCode,stCompanyCode);    //전체 소속의 권한 조회
  if Length(aCompanyCode) < 2  then  Exit;

  i := 1;
  while stCompanyCode <> aCompanyCode do
  begin
    if Length(stCompanyCode) > Length(aCompanyCode) then Exit; //혹시 무한 루프 도는것을 방지
    stCompanyCode := copy(aCompanyCode,1,1 + (G_nCompanyCodeLength * i));
    LoadPermitCompanyDoor(aBuildingCode,stCompanyCode);
    i := i + 1;
  end;
end;

procedure TfmCompany.menuTabChange(Sender: TObject);
begin
  inherited;
(*  if menuTab.ActiveTabIndex = 0 then //Ȩ
  begin
    if menuTab.AdvOfficeTabs.Items[0].Caption = L_stButtonCloseCaption then Close
    else
    begin
      menuTab.ActiveTabIndex := 1;
      menuTabChange(self);
    end;
  end;  *)
end;

procedure TfmCompany.pm_CompanyGradeClick(Sender: TObject);
begin
  inherited;
  pan_emPermitAdmin.Visible := True;
  ed_GradeCompanyCode.Text := tv_CompanyCode.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  ed_GradeCompanyName.Text := tv_CompanyList.Selected.Text; // tv_CompanyList.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text
  tp_Grade.ActivePageIndex := 0;
  tv_buildingNameDblClick(self);
end;

procedure TfmCompany.NotPermitArmAreaListAdd(aArmAreaName, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aArmAreaCode, aArmAreaView: string);
var
  i : integer;
  bAdd : Boolean;
  nRow : integer;
  nIndex : integer;
begin
  bAdd := False;
  with sg_NotPermitAlarm do
  begin
    if RowCount = 2 then
    begin
      if Cells[6,Row] = '' then
      begin
        nRow := 1;
        AddCheckBox(0,nRow,False,False);
        cells[1,nRow] := aArmAreaName;
        cells[2,nRow] := aNodeNo;
        cells[3,nRow] := aEcuID;
        cells[4,nRow] := aExtendID;
        cells[5,nRow] := aArmAreaNo;
        cells[6,nRow] := aArmAreaCode;
        cells[7,nRow] := aArmAreaView;
        bAdd := True;
      end;
    end;
    if Not bAdd then
    begin
      for i := 1 to RowCount - 1 do
      begin
        if strtoint(cells[7,i]) = strtoint(aArmAreaView) then
        begin
          if cells[6,i] > aArmAreaCode then
          begin
            InsertRows(i,1);
            AddCheckBox(0,i,False,False);
            cells[1,i] := aArmAreaName;
            cells[2,i] := aNodeNo;
            cells[3,i] := aEcuID;
            cells[4,i] := aExtendID;
            cells[5,i] := aArmAreaNo;
            cells[6,i] := aArmAreaCode;
            cells[7,i] := aArmAreaView;
            bAdd := True;
            break;
          end;
        end else if strtoint(cells[7,i]) > strtoint(aArmAreaView) then
        begin
          InsertRows(i,1);
          AddCheckBox(0,i,False,False);
          cells[1,i] := aArmAreaName;
          cells[2,i] := aNodeNo;
          cells[3,i] := aEcuID;
          cells[4,i] := aExtendID;
          cells[5,i] := aArmAreaNo;
          cells[6,i] := aArmAreaCode;
          cells[7,i] := aArmAreaView;
          bAdd := True;
          break;
         end;
      end;
    end;
    if Not bAdd then
    begin
      //중간에 삽입 하지 못한 경우 마지막에 추가
      AddRow;
      nRow := RowCount - 1;
      AddCheckBox(0,nRow,False,False);
      cells[1,nRow] := aArmAreaName;
      cells[2,nRow] := aNodeNo;
      cells[3,nRow] := aEcuID;
      cells[4,nRow] := aExtendID;
      cells[5,nRow] := aArmAreaNo;
      cells[6,nRow] := aArmAreaCode;
      cells[7,nRow] := aArmAreaView;
    end;
  end;
  if NotGradeArmAreaCodeList.IndexOf(aArmAreaCode) < 0 then NotGradeArmAreaCodeList.Add(aArmAreaCode);
  lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',NotGradeArmAreaCodeList.Count)+' ';
end;

procedure TfmCompany.NotPermitArmAreaListDelete(aArmAreaCode: string);
var
  i : integer;
  nIndex : integer;
begin
  for i := 1 to sg_NotPermitAlarm.RowCount - 1 do
  begin
    if sg_NotPermitAlarm.Cells[6,i] = aArmAreaCode then
    begin
      if sg_NotPermitAlarm.RowCount > 2 then sg_NotPermitAlarm.RemoveRows(i,1)
      else dmFormFunction.GridInit(sg_NotPermitAlarm,2,2,True);
      break;
    end;
  end;

  nIndex := NotGradeArmAreaCodeList.IndexOf(aArmAreaCode);
  if nIndex > -1 then NotGradeArmAreaCodeList.Delete(nIndex);
  lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',NotGradeArmAreaCodeList.Count)+' ';
end;

procedure TfmCompany.NotPermitDoorListAdd(aDoorName, aNodeNo, aEcuID, aExtendID,
  aDoorNo, aDoorCode, aDoorView: string);
var
  i : integer;
  bAdd : Boolean;
  nRow : integer;
begin
  bAdd := False;
  with sg_NotPermitDoor do
  begin
    if RowCount = 2 then
    begin
      if Cells[6,Row] = '' then
      begin
        nRow := 1;
        AddCheckBox(0,nRow,False,False);
        cells[1,nRow] := aDoorName;
        cells[2,nRow] := aNodeNo;
        cells[3,nRow] := aEcuID;
        cells[4,nRow] := aExtendID;
        cells[5,nRow] := aDoorNo;
        cells[6,nRow] := aDoorCode;
        cells[7,nRow] := aDoorView;
        bAdd := True;
      end;
    end;
    if Not bAdd then
    begin
      for i := 1 to RowCount - 1 do
      begin
        if strtoint(cells[7,i]) = strtoint(aDoorView) then
        begin
          if cells[6,i] > aDoorCode then
          begin
            InsertRows(i,1);
            AddCheckBox(0,i,False,False);
            cells[1,i] := aDoorName;
            cells[2,i] := aNodeNo;
            cells[3,i] := aEcuID;
            cells[4,i] := aExtendID;
            cells[5,i] := aDoorNo;
            cells[6,i] := aDoorCode;
            cells[7,i] := aDoorView;
            bAdd := True;
            break;
          end;
        end else if strtoint(cells[7,i]) > strtoint(aDoorView) then
        begin
          InsertRows(i,1);
          AddCheckBox(0,i,False,False);
          cells[1,i] := aDoorName;
          cells[2,i] := aNodeNo;
          cells[3,i] := aEcuID;
          cells[4,i] := aExtendID;
          cells[5,i] := aDoorNo;
          cells[6,i] := aDoorCode;
          cells[7,i] := aDoorView;
          bAdd := True;
          break;
         end;
      end;
    end;
    if Not bAdd then
    begin
      //중간에 삽입 하지 못한 경우 마지막에 추가
      AddRow;
      nRow := RowCount - 1;
      AddCheckBox(0,nRow,False,False);
      cells[1,nRow] := aDoorName;
      cells[2,nRow] := aNodeNo;
      cells[3,nRow] := aEcuID;
      cells[4,nRow] := aExtendID;
      cells[5,nRow] := aDoorNo;
      cells[6,nRow] := aDoorCode;
      cells[7,nRow] := aDoorView;
    end;
  end;
  if NotGradeDoorCodeList.IndexOf(aDoorCode) < 0 then NotGradeDoorCodeList.Add(aDoorCode);
  lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',NotGradeDoorCodeList.Count)+' ';
end;

procedure TfmCompany.NotPermitDoorListDelete(aDoorCode: string);
var
  i : integer;
  nIndex : integer;
begin
  for i := 1 to sg_NotPermitDoor.RowCount - 1 do
  begin
    if sg_NotPermitDoor.Cells[6,i] = aDoorCode then
    begin
      if sg_NotPermitDoor.RowCount > 2 then sg_NotPermitDoor.RemoveRows(i,1)
      else dmFormFunction.GridInit(sg_NotPermitDoor,2,2,True);
      break;
    end;
  end;

  nIndex := NotGradeDoorCodeList.IndexOf(aDoorCode);
  if nIndex > -1 then NotGradeDoorCodeList.Delete(nIndex);
  lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',NotGradeDoorCodeList.Count)+' ';
end;

procedure TfmCompany.PermitArmAreaListAdd(aArmAreaName, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aArmAreaCode, aArmAreaView: string);
var
  i : integer;
  bAdd : Boolean;
  nRow : integer;
  nIndex : integer;
begin
  bAdd := False;
  with sg_PermitAlarm do
  begin
    if RowCount = 2 then
    begin
      if Cells[6,Row] = '' then
      begin
        nRow := 1;
        AddCheckBox(0,nRow,False,False);
        cells[1,nRow] := aArmAreaName;
        cells[2,nRow] := aNodeNo;
        cells[3,nRow] := aEcuID;
        cells[4,nRow] := aExtendID;
        cells[5,nRow] := aArmAreaNo;
        cells[6,nRow] := aArmAreaCode;
        cells[7,nRow] := aArmAreaView;
        bAdd := True;
      end;
    end;
    if Not bAdd then
    begin
      for i := 1 to RowCount - 1 do
      begin
        if strtoint(cells[7,i]) = strtoint(aArmAreaView) then
        begin
          if cells[6,i] > aArmAreaCode then
          begin
            InsertRows(i,1);
            AddCheckBox(0,i,False,False);
            cells[1,i] := aArmAreaName;
            cells[2,i] := aNodeNo;
            cells[3,i] := aEcuID;
            cells[4,i] := aExtendID;
            cells[5,i] := aArmAreaNo;
            cells[6,i] := aArmAreaCode;
            cells[7,i] := aArmAreaView;
            bAdd := True;
            break;
          end;
        end else if strtoint(cells[7,i]) > strtoint(aArmAreaView) then
        begin
          InsertRows(i,1);
          AddCheckBox(0,i,False,False);
          cells[1,i] := aArmAreaName;
          cells[2,i] := aNodeNo;
          cells[3,i] := aEcuID;
          cells[4,i] := aExtendID;
          cells[5,i] := aArmAreaNo;
          cells[6,i] := aArmAreaCode;
          cells[7,i] := aArmAreaView;
          bAdd := True;
          break;
         end;
      end;
    end;
    if Not bAdd then
    begin
      //중간에 삽입 하지 못한 경우 마지막에 추가
      AddRow;
      nRow := RowCount - 1;
      AddCheckBox(0,nRow,False,False);
      cells[1,nRow] := aArmAreaName;
      cells[2,nRow] := aNodeNo;
      cells[3,nRow] := aEcuID;
      cells[4,nRow] := aExtendID;
      cells[5,nRow] := aArmAreaNo;
      cells[6,nRow] := aArmAreaCode;
      cells[7,nRow] := aArmAreaView;
    end;
  end;
  if GradeArmAreaCodeList.IndexOf(aArmAreaCode) < 0 then GradeArmAreaCodeList.Add(aArmAreaCode);
  lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',GradeArmAreaCodeList.Count)+' ';
end;

procedure TfmCompany.PermitArmAreaListDelete(aArmAreaCode: string);
var
  i : integer;
  nIndex : integer;
begin
  for i := 1 to sg_PermitAlarm.RowCount - 1 do
  begin
    if sg_PermitAlarm.Cells[6,i] = aArmAreaCode then
    begin
      if sg_PermitAlarm.RowCount > 2 then sg_PermitAlarm.RemoveRows(i,1)
      else dmFormFunction.GridInit(sg_PermitAlarm,2,2,True);
      break;
    end;
  end;

  nIndex := GradeArmAreaCodeList.IndexOf(aArmAreaCode);
  if nIndex > -1 then GradeArmAreaCodeList.Delete(nIndex);
  lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',GradeArmAreaCodeList.Count)+' ';
end;

procedure TfmCompany.PermitDoorListAdd(aDoorName, aNodeNo, aEcuID, aExtendID,
  aDoorNo, aDoorCode, aDoorView: string);
var
  i : integer;
  bAdd : Boolean;
  nRow : integer;
begin
  bAdd := False;
  with sg_PermitDoor do
  begin
    if RowCount = 2 then
    begin
      if Cells[6,Row] = '' then
      begin
        nRow := 1;
        AddCheckBox(0,nRow,False,False);
        cells[1,nRow] := aDoorName;
        cells[2,nRow] := aNodeNo;
        cells[3,nRow] := aEcuID;
        cells[4,nRow] := aExtendID;
        cells[5,nRow] := aDoorNo;
        cells[6,nRow] := aDoorCode;
        cells[7,nRow] := aDoorView;
        bAdd := True;
      end;
    end;
    if Not bAdd then
    begin
      for i := 1 to RowCount - 1 do
      begin
        if strtoint(cells[7,i]) = strtoint(aDoorView) then
        begin
          if cells[6,i] > aDoorCode then
          begin
            InsertRows(i,1);
            AddCheckBox(0,i,False,False);
            cells[1,i] := aDoorName;
            cells[2,i] := aNodeNo;
            cells[3,i] := aEcuID;
            cells[4,i] := aExtendID;
            cells[5,i] := aDoorNo;
            cells[6,i] := aDoorCode;
            cells[7,i] := aDoorView;
            bAdd := True;
            break;
          end;
        end else if strtoint(cells[7,i]) > strtoint(aDoorView) then
        begin
          InsertRows(i,1);
          AddCheckBox(0,i,False,False);
          cells[1,i] := aDoorName;
          cells[2,i] := aNodeNo;
          cells[3,i] := aEcuID;
          cells[4,i] := aExtendID;
          cells[5,i] := aDoorNo;
          cells[6,i] := aDoorCode;
          cells[7,i] := aDoorView;
          bAdd := True;
          break;
         end;
      end;
    end;
    if Not bAdd then
    begin
      //중간에 삽입 하지 못한 경우 마지막에 추가
      AddRow;
      nRow := RowCount - 1;
      AddCheckBox(0,nRow,False,False);
      cells[1,nRow] := aDoorName;
      cells[2,nRow] := aNodeNo;
      cells[3,nRow] := aEcuID;
      cells[4,nRow] := aExtendID;
      cells[5,nRow] := aDoorNo;
      cells[6,nRow] := aDoorCode;
      cells[7,nRow] := aDoorView;
    end;
  end;
  if GradeDoorCodeList.IndexOf(aDoorCode) < 0 then GradeDoorCodeList.Add(aDoorCode);
  lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',GradeDoorCodeList.Count)+' ';
end;

procedure TfmCompany.PermitDoorListDelete(aDoorCode: string);
var
  i : integer;
  nIndex : integer;
begin
  for i := 1 to sg_PermitDoor.RowCount - 1 do
  begin
    if sg_PermitDoor.Cells[6,i] = aDoorCode then
    begin
      if sg_PermitDoor.RowCount > 2 then sg_PermitDoor.RemoveRows(i,1)
      else dmFormFunction.GridInit(sg_PermitDoor,2,2,True);
      break;
    end;
  end;

  nIndex := GradeDoorCodeList.IndexOf(aDoorCode);
  if nIndex > -1 then GradeDoorCodeList.Delete(nIndex);
  lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',GradeDoorCodeList.Count)+' ';
end;

procedure TfmCompany.pm_ChiledCodeAddClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_CompanyList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',btn_Add.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  Pan_Companycode.Visible := True;
  lb_WorkType.Caption := btn_Add.Caption;
  ed_SelectCode.Text := tv_CompanyCode.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  L_stWork := 'CHILDCODEADD';
  ed_CompanyName.Text := '';
  ed_CompanyName.SetFocus;
end;

procedure TfmCompany.pm_DeleteCodeClick(Sender: TObject);
var
  stMessage : string;
  stCode : string;
  stSql : string;
begin
  inherited;
  if tv_CompanyList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;

  stCode := tv_CompanyCode.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  if dmDBFunction.CheckTB_EMPLOYEE_CompanyCodeLike(stCode) = 1 then
  begin
    showmessage(dmFormMessage.GetMessage('COMPANYEXISTEMPLOYEE'));
    Exit;
  end;


  stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;

  (*stSql := ' Update TB_COMPANYCODE set CO_CODEUSE = ''0'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE LIKE ''' + stCode + '%'' ';
  dmDataBase.ProcessExecSQL(stSql);
  *)
  dmDBDelete.DeleteTB_COMPANYCODE_LikeCode(stCode);
  dmDBDelete.DeleteTB_CARDPERMITCOMPANYGROUP_LikeCode(stCode); //소속권한 삭제 하자

//  dmDBUpdate.UpdateTB_COMPANYCODE_Field_StringValue(stCode,'CO_CODEUSE','0');
  LoadCompanyTreeView(stCode,tv_CompanyList,tv_CompanyCode,con_LocalCompanyImageIndex);
end;

procedure TfmCompany.pm_ParentCompanyGradeClick(Sender: TObject);
var
  stCompanyCode : string;
  stParentCompanyCode : string;
  stMessage : string;
begin
  inherited;
(*  stCompanyCode := tv_CompanyCode.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  if stCompanyCode = '0' then Exit;
  stMessage := dmFormMessage.GetMessage('PARENTCOMPNYGRADE');//stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  stParentCompanyCode := copy(stCompanyCode,1,Length(stCompanyCode) - G_nCompanyCodeLength);
  dmDBDelete.DeleteTB_CARDPERMITCOMPANYGROUP_CompanyCode(stCompanyCode);
  dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(stParentCompanyCode,'N'); //자회사 코드의 데이터도 모두 적용 'N' 상태로 해야 됨
  CompanyGradeToEmployeeGrade;
*)

end;

procedure TfmCompany.pm_UpdateCodeClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_CompanyList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_UpdateCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  Pan_Companycode.Visible := True;
  lb_WorkType.Caption := pm_UpdateCode.Caption;
  ed_SelectCode.Text := tv_CompanyCode.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  ed_CompanyName.Text := tv_CompanyList.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  L_stWork := 'SELECTCODEUPDATE';
  ed_CompanyName.SetFocus;
end;

procedure TfmCompany.sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nNotPermitArmAreaCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nNotPermitArmAreaCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nNotPermitArmAreaCheckCount := L_nNotPermitArmAreaCheckCount + 1
    else L_nNotPermitArmAreaCheckCount := L_nNotPermitArmAreaCheckCount - 1 ;
  end;

end;

procedure TfmCompany.sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nNotPermitDoorCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nNotPermitDoorCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nNotPermitDoorCheckCount := L_nNotPermitDoorCheckCount + 1
    else L_nNotPermitDoorCheckCount := L_nNotPermitDoorCheckCount - 1 ;
  end;

end;

procedure TfmCompany.sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nPermitArmAreaCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nPermitArmAreaCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nPermitArmAreaCheckCount := L_nPermitArmAreaCheckCount + 1
    else L_nPermitArmAreaCheckCount := L_nPermitArmAreaCheckCount - 1 ;
  end;

end;

procedure TfmCompany.sg_PermitDoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nPermitDoorCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nPermitDoorCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nPermitDoorCheckCount := L_nPermitDoorCheckCount + 1
    else L_nPermitDoorCheckCount := L_nPermitDoorCheckCount - 1 ;
  end;

end;

procedure TfmCompany.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_SelectBuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  ed_SelectBuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  if ed_GradeCompanyCode.Text = '' then Exit;
  L_nPermitArmAreaCheckCount := 0;           //삭제시 방범구역 선택 갯수
  L_nNotPermitArmAreaCheckCount := 0;        //등록시 방범구역 선택 갯수
  L_nPermitDoorCheckCount := 0;           //삭제시 출입문 선택 갯수
  L_nNotPermitDoorCheckCount := 0;        //등록시 출입문 선택 갯수

  dmFormFunction.GridInit(sg_NotPermitDoor,2,2,true);
  dmFormFunction.GridInit(sg_PermitDoor,2,2,true);
  dmFormFunction.GridInit(sg_NotPermitAlarm,2,2,true);   //그리드 초기화
  dmFormFunction.GridInit(sg_PermitAlarm,2,2,true);

  LoadBuildingDoorAll(ed_SelectBuildingCode.Text,sg_NotPermitDoor); //전체 출입문을 리스트에 추가 하자
  LoadBuildingAlarmAll(ed_SelectBuildingCode.Text,sg_NotPermitAlarm); //전체 방범구역을 리스트에 추가 하자

  LoadPermitDoor(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text);
  LoadPermitAlarm(ed_SelectBuildingCode.Text,ed_GradeCompanyCode.Text);

end;

procedure TfmCompany.tv_CompanyListClick(Sender: TObject);
begin
  inherited;
  if tv_CompanyList.Selected = nil then Exit;

  if tv_CompanyList.Selected.AbsoluteIndex = 0 then
  begin
    pm_DeleteCode.Visible := False;
    btn_Delete.Enabled := False;
  end else
  begin
    //pm_ExtendCodeAdd.Visible := True;
    pm_DeleteCode.Visible := True;
    btn_Delete.Enabled := IsDeleteGrade;
  end;
end;

procedure TfmCompany.tv_CompanyListDblClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(Sender);
end;

procedure TfmCompany.tv_CompanyListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stTargetParentCode : string;
  stCode : string;
  stDeepSeq,stViewSeq : string;
  stSql : string;
begin
  inherited;
  if Sender = Source then
  begin
    with TTreeView(Sender) do
    begin
      dropItem :=GetNodeAt(X,Y);
      currentItem := Selected;
      if currentItem.AbsoluteIndex = 0 then Exit;
      stTargetParentCode := tv_CompanyCode.Items[dropItem.AbsoluteIndex].Text;
      stOrgCode := tv_CompanyCode.Items[currentItem.AbsoluteIndex].Text;
      if copy(stTargetParentCode,1,Length(stOrgCode)) = stOrgCode then Exit; //자신의 하위디렉토리로 갈수는 없다
      dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stTargetParentCode,stCode,stDeepSeq,stViewSeq);
      ChangeCompanyCode(stOrgCode,stCode,stDeepSeq,stViewSeq);
    end;
  end;
  LoadCompanyTreeView(stCode,tv_CompanyList,tv_CompanyCode,con_LocalCompanyImageIndex);
end;

procedure TfmCompany.tv_CompanyListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_CompanyList;

end;

initialization
  RegisterClass(TfmCompany);
Finalization
  UnRegisterClass(TfmCompany);

end.
