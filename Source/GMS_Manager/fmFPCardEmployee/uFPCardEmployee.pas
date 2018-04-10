﻿unit uFPCardEmployee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls, AdvSplitter, AdvPanel, Vcl.ImgList,
  AdvOfficeButtons, AdvGroupBox,Data.DB,Vcl.Imaging.jpeg, AdvSmoothTabPager,
  ToolPanels, AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers,
  AdvGlowButton, AdvOfficePager, AdvAppStyler, AdvOfficePagerStylers,
  Vcl.Imaging.pngimage,DateUtils, AdvProgressBar;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmFPCardEmployee = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    tv_List: TTreeView;
    tv_Code: TTreeView;
    pm_Work: TPopupMenu;
    AdvSplitter1: TAdvSplitter;
    AdvSmoothPanel1: TAdvSmoothPanel;
    pan_EmployeeList: TAdvSmoothPanel;
    AdvSmoothPanel2: TAdvSmoothPanel;
    sg_EmployeeList: TAdvStringGrid;
    MenuImageList16: TImageList;
    pm_EmployeeAdd: TMenuItem;
    Pan_Emcode: TAdvSmoothPanel;
    lb_CompanyName: TAdvSmoothLabel;
    ed_CompanyName: TAdvEdit;
    ed_emSeq: TAdvEdit;
    lb_EmCode: TAdvSmoothLabel;
    ed_EmCode: TAdvEdit;
    lb_EmployeeName: TAdvSmoothLabel;
    ed_Name: TAdvEdit;
    lb_Position: TAdvSmoothLabel;
    cmb_PosiName: TComboBox;
    lb_EmployeeGubun: TAdvSmoothLabel;
    cmb_EmpGubun: TComboBox;
    lb_HandPhone: TAdvSmoothLabel;
    ed_Handphone: TAdvEdit;
    ed_CompanyPhone: TAdvEdit;
    lb_CompanyPhone: TAdvSmoothLabel;
    ed_EtcInfo: TAdvEdit;
    lb_etcInfo: TAdvSmoothLabel;
    Panel1: TPanel;
    lb_InDate: TAdvSmoothLabel;
    lb_OutDate: TAdvSmoothLabel;
    dt_Indate: TDateTimePicker;
    dt_OutDate: TDateTimePicker;
    pan_AddWork: TAdvSmoothPanel;
    Image1: TImage;
    ed_SelectCompanyCode: TAdvEdit;
    tv_AddCompanyCode: TTreeView;
    chk_AddAutoEmpCode: TAdvOfficeCheckBox;
    chk_Attend: TAdvOfficeCheckBox;
    chk_Food: TAdvOfficeCheckBox;
    gb_Card: TAdvGroupBox;
    cmb_CardGubun: TComboBox;
    ed_RegCardNo: TAdvEdit;
    gb_EmployeeGroup: TAdvGroupBox;
    lb_EmployeeGroupCode: TAdvSmoothLabel;
    ed_CardGroupName: TAdvEdit;
    cmb_RegType: TComboBox;
    ed_CardGroupCode: TAdvEdit;
    ed_ImageFile: TAdvEdit;
    OpenDialog1: TOpenDialog;
    cmb_PositionSearch: TComboBox;
    lb_PositionSearch: TAdvSmoothLabel;
    lb_EmployeeGubunSearch: TAdvSmoothLabel;
    cmb_EmpGubunSearch: TComboBox;
    ed_etcSearch: TAdvEdit;
    lb_EtcDetail: TAdvSmoothLabel;
    lb_EtcSearch: TAdvSmoothLabel;
    cmb_EtcSearch: TComboBox;
    pm_Employee: TPopupMenu;
    pm_EmUpdate: TMenuItem;
    pm_EmDelete: TMenuItem;
    ed_SerchSelectCompanyCode: TAdvEdit;
    pm_EmployeeGradeAdmin: TMenuItem;
    N2: TMenuItem;
    pm_GroupPermit: TMenuItem;
    pan_emPermitAdmin: TAdvSmoothPanel;
    ed_OldEmCode: TAdvEdit;
    chk_FingerUse: TAdvOfficeCheckBox;
    lb_CardGrade: TAdvSmoothLabel;
    cmb_EmCardGradeType: TComboBox;
    tv_AddEmGroupCode: TTreeView;
    pan_FingerCard: TPanel;
    lb_EmployeeState: TAdvSmoothLabel;
    cmb_EmState: TComboBox;
    lb_EmpType: TAdvSmoothLabel;
    cmb_AWCode: TComboBox;
    pan_Finger: TAdvToolPanel;
    lb_FingerMessage: TLabel;
    AdvPanel1: TAdvPanel;
    FingerImage: TImage;
    btn_FingerSave: TAdvGlassButton;
    btn_FingerCancel: TAdvGlassButton;
    pan_EmGroup: TAdvSmoothPanel;
    tv_EmGroup: TTreeView;
    tv_EmGroupCode: TTreeView;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_EmployeeList: TLabel;
    btn_Search: TAdvGlowButton;
    btn_EmployeeAdd: TAdvGlowButton;
    btn_CompanyManage: TAdvGlowButton;
    btn_GroupManage: TAdvGlowButton;
    lb_EmployeeCaption: TLabel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    tv_AddEmGroupName: TTreeView;
    pan_Company: TAdvSmoothPanel;
    lb_CompanyManager: TLabel;
    tv_MCompany: TTreeView;
    tv_MCompanyCode: TTreeView;
    btn_CompanySelect: TAdvGlowButton;
    btn_BuildingCancel: TAdvGlowButton;
    btn_EmGroupSelect: TAdvGlowButton;
    btn_EmGroupCancel: TAdvGlowButton;
    lb_EMGroup: TLabel;
    lb_EmGradePositionName: TAdvSmoothLabel;
    ed_SelectBuildingName: TAdvEdit;
    lb_EmGradeName: TAdvSmoothLabel;
    ed_emGradeName: TAdvEdit;
    ed_emGradeSeq: TAdvEdit;
    btn_emGradeComplete: TAdvGlassButton;
    ed_SelectBuildingCode: TAdvEdit;
    lb_emgradecaption: TLabel;
    btn_BuildingNameSelect: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    tv_buildingCode: TTreeView;
    PageControl1: TPageControl;
    tab_DoorPermit: TTabSheet;
    Splitter2: TSplitter;
    Splitter1: TSplitter;
    pan_NotPermitDoor: TAdvSmoothPanel;
    pan_NotPermitDoorCount: TAdvSmoothPanel;
    sg_NotPermitDoor: TAdvStringGrid;
    pan_PermitAction: TAdvSmoothPanel;
    pan_PermitDoor: TAdvSmoothPanel;
    pan_DoorPermitCount: TAdvSmoothPanel;
    sg_PermitDoor: TAdvStringGrid;
    tab_AlarmPermit: TTabSheet;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    pan_NotPermitAlarmArea: TAdvSmoothPanel;
    AdvSmoothPanel5: TAdvSmoothPanel;
    sg_NotPermitAlarm: TAdvStringGrid;
    AdvSmoothPanel6: TAdvSmoothPanel;
    pan_PermitAlarmArea: TAdvSmoothPanel;
    AdvSmoothPanel8: TAdvSmoothPanel;
    sg_PermitAlarm: TAdvStringGrid;
    lb_NotDoorPermit: TLabel;
    lb_PermitDoor: TLabel;
    lb_NotPermitAlarmArea: TLabel;
    lb_PermitAlarmArea: TLabel;
    tv_buildingName: TTreeView;
    AdvGlowButton2: TAdvGlowButton;
    btn_CompanyNameSelect: TAdvGlowButton;
    btn_PositionAdd: TAdvGlowButton;
    btn_EmployeeGubunAdd: TAdvGlowButton;
    btn_CardGroupSelect: TAdvGlowButton;
    tv_AddCompanyName: TTreeView;
    btn_CardAdd: TAdvGlowButton;
    lb_SearchCount1: TAdvSmoothLabel;
    lb_SearchCount: TAdvSmoothLabel;
    lb_Count1: TAdvSmoothLabel;
    lb_NotPermitDoorCount: TAdvSmoothLabel;
    AdvSmoothLabel4: TAdvSmoothLabel;
    lb_DoorPermitCountName: TAdvSmoothLabel;
    lb_PermitDoorCount: TAdvSmoothLabel;
    lb_Count2: TAdvSmoothLabel;
    lb_DoorNotPermitCountName: TAdvSmoothLabel;
    lb_ArmAreaNotPermitCountName: TAdvSmoothLabel;
    lb_NotPermitArmAreaCount: TAdvSmoothLabel;
    AdvSmoothLabel8: TAdvSmoothLabel;
    lb_ArmAreaPermitCountName: TAdvSmoothLabel;
    lb_PermitArmAreaCount: TAdvSmoothLabel;
    AdvSmoothLabel9: TAdvSmoothLabel;
    btn_PermitArmAreaAdd: TAdvGlowButton;
    btn_PermitArmAreaDelete: TAdvGlowButton;
    btn_PermitDoorAdd: TAdvGlowButton;
    btn_PermitDoorDelete: TAdvGlowButton;
    pan_progress: TAdvSmoothPanel;
    ProgressBar1: TProgressBar;
    lb_ProgressCount: TAdvSmoothLabel;
    btn_Excel: TAdvGlowButton;
    SaveDialog1: TSaveDialog;
    chk_IncludeCardNum: TAdvOfficeCheckBox;
    AdvGlowButton3: TAdvGlowButton;
    ProgressBar2: TProgressBar;
    pan_Message: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    AdvProgressBar1: TAdvProgressBar;
    btn_AccessConfirm: TAdvGlassButton;
    btn_ValidDateManage: TAdvGlowButton;
    pan_ValidDateManage: TAdvSmoothPanel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    TreeView2: TTreeView;
    btn_ValidSave: TAdvGlowButton;
    btn_ValidCancel: TAdvGlowButton;
    dt_ValidDate: TDateTimePicker;
    btn_EmployeeDelete: TAdvGlowButton;
    btn_CardDelete: TAdvGlowButton;
    lb_ValidDateCaption: TAdvSmoothLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tv_ListClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_CompanyNameKeyPress(Sender: TObject; var Key: Char);
    procedure tv_ListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tv_ListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure pan_EmployeeListResize(Sender: TObject);
    procedure pm_EmployeeAddClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pan_AddWorkResize(Sender: TObject);
    procedure btn_SaveMouseEnter(Sender: TObject);
    procedure btn_SaveMouseLeave(Sender: TObject);
    procedure btn_CompanyNameSelectClick(Sender: TObject);
    procedure tv_AddCompanyNameDblClick(Sender: TObject);
    procedure btn_PositionAddClick(Sender: TObject);
    procedure btn_EmployeeGubunAddClick(Sender: TObject);
    procedure chk_AddAutoEmpCodeClick(Sender: TObject);
    procedure sg_CardCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure btn_CardAddClick(Sender: TObject);
    procedure btn_CardGroupSelectClick(Sender: TObject);
    procedure dt_IndateChange(Sender: TObject);
    procedure dt_OutDateChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure cmb_EtcSearchChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_PositionSearchClick(Sender: TObject);
    procedure cmb_EmpGubunSearchClick(Sender: TObject);
    procedure ed_etcSearchChange(Sender: TObject);
    procedure sg_EmployeeListResize(Sender: TObject);
    procedure pm_EmUpdateClick(Sender: TObject);
    procedure sg_EmployeeListDblClick(Sender: TObject);
    procedure pm_EmployeeGradeAdminClick(Sender: TObject);
    procedure btn_emGradeCompleteClick(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure pan_NotPermitDoorResize(Sender: TObject);
    procedure pan_PermitDoorResize(Sender: TObject);
    procedure pan_NotPermitAlarmAreaResize(Sender: TObject);
    procedure pan_PermitAlarmAreaResize(Sender: TObject);
    procedure btn_PermitDoorDeleteClick(Sender: TObject);
    procedure sg_PermitDoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_PermitDoorAddClick(Sender: TObject);
    procedure btn_PermitArmAreaAddClick(Sender: TObject);
    procedure btn_PermitArmAreaDeleteClick(Sender: TObject);
    procedure btn_BuildingNameSelectClick(Sender: TObject);
    procedure sg_EmployeeListClick(Sender: TObject);
    procedure pm_EmDeleteClick(Sender: TObject);
    procedure ed_EmCodeExit(Sender: TObject);
    procedure btn_EmployeeAddClick(Sender: TObject);
    procedure pm_GroupPermitClick(Sender: TObject);
    procedure cmb_EmCardGradeTypeChange(Sender: TObject);
    procedure tv_AddEmGroupNameDblClick(Sender: TObject);
    procedure chk_FingerUseClick(Sender: TObject);
    procedure btn_FingerCancelClick(Sender: TObject);
    procedure FingerTimerTimer(Sender: TObject);
    procedure btn_FingerSaveClick(Sender: TObject);
    procedure Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sg_EmployeeListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_CompanyManageClick(Sender: TObject);
    procedure btn_GroupManageClick(Sender: TObject);
    procedure btn_BuildingCancelClick(Sender: TObject);
    procedure btn_CompanySelectClick(Sender: TObject);
    procedure btn_EmGroupCancelClick(Sender: TObject);
    procedure btn_EmGroupSelectClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_emPermitAdminMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_PositionInfoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_ExcelClick(Sender: TObject);
    procedure chk_IncludeCardNumClick(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure btn_AccessConfirmClick(Sender: TObject);
    procedure btn_ValidDateManageClick(Sender: TObject);
    procedure btn_ValidCancelClick(Sender: TObject);
    procedure btn_ValidSaveClick(Sender: TObject);
    procedure ed_etcSearchKeyPress(Sender: TObject; var Key: Char);
    procedure btn_EmployeeDeleteClick(Sender: TObject);
    procedure btn_CardDeleteClick(Sender: TObject);
  private
    DragOrigin: TPoint;
    MouseDowning : BOOLEAN;
  private
    L_stMenuID : string;
    L_stAllName : string;
    L_stButtonCloseCaption : string;
    L_stDeleteCaption : string;
    L_stEmCodeCaption : string;
    L_stEmCompanyPhoneCaption : string;
    L_stEmEtcCaption : string;
    L_stCardNoCaption : string;
    L_stEmHandPhoneCaption : string;
    L_stEmNameCaption : string;
    L_stFingerTemplate1_1 : string;
    L_stFingerTemplate1_2 : string;
    L_stSelectCardNo : string;
    L_stWork : string;
    L_nSelectCol : integer;
    L_nPageListMaxCount : integer;
    L_nBuildingNotPermitDoorCount : integer;     //빌딩별 미등록 권한 출입문
    L_nBuildingPermitDoorCount : integer;        //빌딩별 등록 권한 출입문
    L_nBuildingNotPermitArmAreaCount : integer;  //빌딩별 미등록 권한 방범구역
    L_nBuildingPermitArmAreaCount : integer;
    L_nUpdateEmStateIndex : integer;
    L_nPermitArmAreaCheckCount : integer;           //삭제시 방범구역 선택 갯수
    L_nNotPermitArmAreaCheckCount : integer;        //등록시 방범구역 선택 갯수
    L_nPermitDoorCheckCount : integer;           //삭제시 출입문 선택 갯수
    L_nNotPermitDoorCheckCount : integer;        //등록시 출입문 선택 갯수
    L_nEmployeeCheckCount : integer;             //
    L_bVisitEditMode : Boolean;
    L_bEmployeeGradeChange : Boolean;
    L_bFingerImageUpdate : Boolean;
    CardGubunCodeList :TStringList;
    CardStateCodeList :TStringList;
    EmployeeGubunCodeList : TStringList;
    EmployeeGubunSearchCodeList : TStringList;
    EmployeeStateCodeList : TStringList;
    AttendWorkTypeCodeList : TStringList;
    PosiCodeList : TStringList;
    PosiSearchCodeList : TStringList;
    WorkCardGubunCodeList :TStringList;
    WorkCardStateCodeList :TStringList;
    AddCardNoList : TStringList; //추가되는 카드번호 리스트를 가지고 있자
    ChangeCardNoList : TStringList; //변경되는 카드번호 리스트를 가지고 있자
    FingerCardNoDupList : TStringList; //지문카드 중복에 따른 지문카드 재 작업을 해야 됨
    DeleteCardNoList : TStringList; //삭제 카드 리스트를 가지고 있자
    BuildingArmAreaCodeList : TStringList; //빌딩별 방범구역 코드 리스트를 가지고 있자.
    BuildingDoorCodeList : TStringList; //빌딩별 출입문 코드 리스트를 가지고 있자.
    function Check_FormCritical(var aBlankName:string):Boolean;
    procedure FormNameSetting;
    procedure SearhAddEmployee(aEmSeq:string); //추가시 타 시스템에서 이미 사용하고 있는 사원이면 정보를 읽어 와서 뿌려줌
    procedure SearchEmployeeList(aCode:string;aTopRow:integer = 0);
//    procedure SearchEmGroupList(aCode:string);
//    procedure SearchMEmGroupList(aCode:string);
    procedure LoadBuildingAlarmAll(aBuildingCode:string;sgList:TAdvStringGrid); //전체 출입문을 리스트에 추가 하자
    procedure LoadBuildingDoorAll(aBuildingCode:string;sgList:TAdvStringGrid); //전체 출입문을 리스트에 추가 하자
    procedure LoadPermitDoor(aBuildingCode,aEmSeq:string);
    procedure LoadPermitAlarm(aBuildingCode,aEmSeq:string);
    procedure NotPermitArmAreaListAdd(aArmAreaName,aNodeNo,aEcuID,aExtendID,aArmAreaNo,aArmAreaCode,aArmAreaView:string);
    procedure NotPermitArmAreaListDelete(aArmAreaCode:string);
    procedure NotPermitDoorListAdd(aDoorName,aNodeNo,aEcuID,aExtendID,aDoorNo,aDoorCode,aDoorView:string);
    procedure NotPermitDoorListDelete(aDoorCode:string);
    procedure PermitArmAreaListAdd(aArmAreaName,aNodeNo,aEcuID,aExtendID,aArmAreaNo,aArmAreaCode,aArmAreaView:string);
    procedure PermitDoorListAdd(aDoorName,aNodeNo,aEcuID,aExtendID,aDoorNo,aDoorCode,aDoorView:string);
  private
    L_bSearchEnd : Boolean;
    { Private declarations }
    procedure CardAdd(aButton:Boolean);
    procedure employeePanelClear;
//    Function EmployeePermitToCardDeviceLoad(aNodeNo,aEcuID,aEmSeq:string):Boolean;

    procedure ViewTimeGroupCode(aTimeGroup:string);
    function JpegStartsInBlob(PicField:TBlobField):integer;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure SKGasCardMapping(aFile:string);
  public
    { Public declarations }
    procedure FormSearchEnable(aEnabled:Boolean);
    procedure Form_Close;
    procedure FontSetting;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
    procedure CardRegistEvent(aCardNo:string);
    procedure RegistTempDB(G_stCardRegisterIP:string);
  end;

var
  fmFPCardEmployee: TfmFPCardEmployee;

implementation
uses
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
  uDBDelete,
  uDBCardPermit,
  uDBSelect,
  uEmployeeRelay,
  uSupremaFinger,
  uFingerVariable,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmFPCardEmployee.ed_etcSearchChange(Sender: TObject);
begin
  inherited;
  if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
end;

procedure TfmFPCardEmployee.ed_etcSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    SearchEmployeeList('');
  end;

end;

procedure TfmFPCardEmployee.btn_emGradeCompleteClick(Sender: TObject);
begin
  inherited;
  pan_emPermitAdmin.Visible := False;
  SearchEmployeeList(ed_emGradeSeq.Text,sg_EmployeeList.TopRow);
end;

procedure TfmFPCardEmployee.AdvGlowButton3Click(Sender: TObject);
var
  stFile : string;
begin
  inherited;
  OpenDialog1.DefaultExt:= 'csv';
  OpenDialog1.Filter := 'csv files (*.csv)|*.csv';
  if OpenDialog1.Execute then
  begin
    stFile :=  OpenDialog1.FileName;
    SKGasCardMapping(stFile);
  end;

end;

procedure TfmFPCardEmployee.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmFPCardEmployee.btn_AccessConfirmClick(Sender: TObject);
begin
  inherited;
  L_bSearchEnd := True;
  Pan_Message.Visible := False;

end;

procedure TfmFPCardEmployee.btn_BuildingCancelClick(Sender: TObject);
begin
  inherited;
  AdvSmoothPanel2.Enabled := True;
  List.Enabled := True;
  pan_Company.Visible := False;
end;

procedure TfmFPCardEmployee.btn_BuildingNameSelectClick(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := True;
  tv_buildingName.Left := btn_BuildingNameSelect.Left;
  tv_buildingName.Top := btn_BuildingNameSelect.Top + btn_BuildingNameSelect.Height;
end;

procedure TfmFPCardEmployee.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Emcode.Visible := False;
end;

procedure TfmFPCardEmployee.btn_CardAddClick(Sender: TObject);
begin
  inherited;
  CardAdd(True);
end;

procedure TfmFPCardEmployee.btn_CardDeleteClick(Sender: TObject);
var
  stMessage : string;
  stEmSeq : string;
  stSql : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage(dmFormMessage.GetMessage('NOTSELECTEMPLOYEE'));
    Exit;
  end;
  stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',btn_CardDelete.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  Try
    pan_progress.Visible := True;
    with sg_EmployeeList do
    begin
      ProgressBar1.Max := RowCount - 1;
      ProgressBar1.Position := 0;
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          stEmSeq := Cells[16,i];
          if isDigit(stEmSeq) then
          begin
            if dmDBFunction.GetTB_CARD_CardCount(stEmSeq) > 1 then
            begin
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(cells[32,Row]);
              dmDBUpdate.UpdateTB_FINGERDEVICECARD_CardStop(cells[32,Row]);
              dmDBDelete.DeleteTB_CARD_Key(cells[32,Row]);
            end else
            begin
              dmDBCardPermit.CardPermitDelete(stEmSeq);
              dmDBUpdate.UpdateTB_FINGERDEVICECARD_EmSeqStop(stEmSeq);
              dmDBDelete.DeleteTB_CARD_EmSeq(stEmSeq);
              dmDBUpdate.UpdateTB_EMPLOYEE_Field_IntValue(stEmSeq,'EM_CARDUSE','0');
            end;
          end;
        end;
        ProgressBar1.Position := i;
        lb_ProgressCount.Caption.Text := inttostr(i) + '/' + inttostr(Rowcount - 1);
        Application.ProcessMessages;
      end;
    end;
    fmMain.FORMCARDDOWNLOADExecute;

  Finally
    pan_progress.Visible := False;
  End;
  SearchEmployeeList('');
end;

procedure TfmFPCardEmployee.btn_CardGroupSelectClick(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True;
  tv_AddEmGroupName.Left := gb_EmployeeGroup.Left + gb_EmployeeGroup.Width - tv_AddEmGroupName.Width;
  tv_AddEmGroupName.top := gb_EmployeeGroup.top - tv_AddEmGroupName.Height - 10;

  tv_AddEmGroupName.Visible := Not tv_AddEmGroupName.Visible;
end;

procedure TfmFPCardEmployee.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmFPCardEmployee.btn_CompanyManageClick(Sender: TObject);
begin
  inherited;
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage(dmFormMessage.GetMessage('NOTSELECTEMPLOYEE'));
    Exit;
  end;

  AdvSmoothPanel2.Enabled := False;
  List.Enabled := False;
  pan_Company.Left := btn_CompanyManage.Left + btn_CompanyManage.Width + 20 - (pan_Company.Width );
  pan_Company.Top := btn_CompanyManage.Top - pan_Company.Height - 20;
  lb_CompanyManager.Caption := btn_CompanyManage.Caption;
  //pan_Company.Top := btn_CompanyManage.Top - pan_Company.Height - 20;
  pan_Company.Visible := True;
  LoadCompanyTreeView('',tv_MCompany,tv_MCompanyCode,con_LocalCompanyImageIndex);
end;

procedure TfmFPCardEmployee.btn_CompanyNameSelectClick(Sender: TObject);
begin
  inherited;
  tv_AddCompanyName.Visible := Not tv_AddCompanyName.Visible;
  tv_AddCompanyName.Top := btn_CompanyNameSelect.Top + btn_CompanyNameSelect.Height;
  L_bEmployeeGradeChange := True;
  tv_buildingName.Top := btn_CompanyNameSelect.Top + btn_CompanyNameSelect.Height;
  tv_buildingName.Left := btn_CompanyNameSelect.Left;
end;

procedure TfmFPCardEmployee.btn_CompanySelectClick(Sender: TObject);
var
  stMessage : string;
  stCompanyCode : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if tv_MCompany.Selected = nil then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_CompanySelect.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  Try
    pan_progress.Visible := True;
    stCompanyCode := tv_MCompanyCode.Items.Item[tv_MCompany.Selected.AbsoluteIndex].Text;
    with sg_EmployeeList do
    begin
      ProgressBar1.Max := RowCount - 1;
      ProgressBar1.Position := 0;
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(cells[16,i],'CO_COMPANYCODE',stCompanyCode);
          dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(cells[16,i],'EM_MEMLOAD','N');
          if cells[21,i] = '1' then  //소속별 권한 이면
          begin
            dmDBCardPermit.EmployeeGradeChange_Process(cells[16,i],stCompanyCode,cells[20,i],cells[21,i]);
          end;
          dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(cells[16,i],con_ComWorkType_UPDATE);
        end;
        ProgressBar1.Position := i;
        lb_ProgressCount.Caption.Text := inttostr(i) + '/' + inttostr(Rowcount - 1);
        Application.ProcessMessages;
      end;
    end;
    fmMain.FORMCARDDOWNLOADExecute;

    AdvSmoothPanel2.Enabled := True;
    List.Enabled := True;
    pan_Company.Visible := False;
    if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
  Finally
    pan_progress.Visible := False;
  End;

end;

procedure TfmFPCardEmployee.btn_EmGroupCancelClick(Sender: TObject);
begin
  inherited;
  AdvSmoothPanel2.Enabled := True;
  List.Enabled := True;
  pan_EmGroup.Visible := False;

end;

procedure TfmFPCardEmployee.btn_EmGroupSelectClick(Sender: TObject);
var
  stMessage : string;
  stEmGroupCode : string;
  i : integer;
  bCheckState : Boolean;
  bGroupGrade : Boolean;
begin
  inherited;
  if tv_EmGroup.Selected = nil then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_EmGroupSelect.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  bGroupGrade := False;
  if (Application.MessageBox(PChar(dmFormMessage.GetMessage('CARDGROUPCHANGE')),'Information',MB_OKCANCEL) = IDOK)  then bGroupGrade := True;
  if bGroupGrade then
  begin
    if (Application.MessageBox(PChar(dmFormMessage.GetMessage('CARDGROUPCHANGEGRADE')),'Information',MB_OKCANCEL) = IDCANCEL) then bGroupGrade := False;
  end;

  Try
    pan_progress.Visible := True;
    stEmGroupCode := tv_EmGroupCode.Items.Item[tv_EmGroup.Selected.AbsoluteIndex].Text;
    with sg_EmployeeList do
    begin
      ProgressBar1.Max := RowCount - 1;
      ProgressBar1.Position := 0;
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(cells[16,i],'EM_GROUPCODE',stEmGroupCode);
          if bGroupGrade then dmDBUpdate.UpdateTB_EMPLOYEE_Field_IntValue(cells[16,i],'EM_GRADETYPE','2');
          dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(cells[16,i],'EM_MEMLOAD','N');

          if bGroupGrade or (cells[21,i] = '2') then  //그룹별 권한 이면
          begin
            dmDBCardPermit.EmployeeGradeChange_Process(cells[16,i],cells[17,i],stEmGroupCode,'2');
          end;
          dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(cells[16,i],con_ComWorkType_UPDATE);
        end;
        ProgressBar1.Position := i;
        lb_ProgressCount.Caption.Text := inttostr(i) + '/' + inttostr(Rowcount - 1);
        Application.ProcessMessages;
      end;
    end;
    fmMain.FORMCARDDOWNLOADExecute;

    AdvSmoothPanel2.Enabled := True;
    List.Enabled := True;
    pan_EmGroup.Visible := False;
    if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
  Finally
    pan_progress.Visible := False;
  End;

end;

procedure TfmFPCardEmployee.btn_EmployeeAddClick(Sender: TObject);
begin
  inherited;
  pm_EmployeeAddClick(pm_EmployeeAdd);
end;

procedure TfmFPCardEmployee.btn_EmployeeDeleteClick(Sender: TObject);
begin
  inherited;
  pm_EmDeleteClick(pm_EmDelete);
end;

procedure TfmFPCardEmployee.btn_EmployeeGubunAddClick(Sender: TObject);
begin
  inherited;
  fmMain.FormShowEvent(con_FormBMOSEMPLOYEEGUBUN,TRUE);

end;

procedure TfmFPCardEmployee.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  aFileName : string;
  stTitle : string;
begin
  btn_Excel.Enabled := False;
  aFileName:=Caption;
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      if fileexists(stSaveFileName) then
        deletefile(stSaveFileName);
      Try
        sg_EmployeeList.SaveToXLS(stSaveFileName);
      Except
        sg_EmployeeList.SaveToCSV(stSaveFileName);
      End;
    end;
  end;
  btn_Excel.Enabled := True;

end;

procedure TfmFPCardEmployee.btn_FingerCancelClick(Sender: TObject);
begin
  inherited;
  L_bFingerImageUpdate := False;
  if FileExists(G_stExeFolder + '\Temp.bmp') then DeleteFile(G_stExeFolder + '\Temp.bmp');
  chk_FingerUse.Checked := False;
  pan_Finger.Visible := False;
end;

procedure TfmFPCardEmployee.btn_FingerSaveClick(Sender: TObject);
begin
  inherited;
  L_bFingerImageUpdate := True;
  chk_FingerUse.Checked := True;
  pan_Finger.Visible := False;
end;

procedure TfmFPCardEmployee.btn_GroupManageClick(Sender: TObject);
begin
  inherited;
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage(dmFormMessage.GetMessage('NOTSELECTEMPLOYEE'));
    Exit;
  end;

  AdvSmoothPanel2.Enabled := False;
  List.Enabled := False;

  pan_EmGroup.Left := btn_GroupManage.Left + btn_GroupManage.Width + 20 - (pan_EmGroup.Width);
  pan_EmGroup.Top := btn_GroupManage.Top - pan_EmGroup.Height - 20;
  pan_EmGroup.Visible := True;
  lb_EMGroup.Caption := btn_GroupManage.Caption;
  LoadEmployeeGroupTreeView('',tv_EmGroup,tv_EmGroupCode,con_LocalEmployeeImageIndex);
//  SearchMEmGroupList('');
end;

procedure TfmFPCardEmployee.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

procedure TfmFPCardEmployee.btn_PermitArmAreaAddClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
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
        dmDBCardPermit.EmployeeArmAreaPermitAdd(ed_emGradeSeq.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
        dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(ed_emGradeSeq.Text,'EM_GRADETYPE','3'); //카드 권한이 개별 그룹으로 변경 됨
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'E' + ed_emGradeSeq.Text,Cells[5,i],con_ComLogTYPE_ARMAREA,L_stMenuID + '(' + Caption + '):Permit Add');

        PermitArmAreaListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
        if RowCount > 2 then RemoveRows(i,1)
        else GridInit(sg_NotPermitAlarm,2,2,True);
      end;
    end;
  end;
  fmMain.FORMCARDDOWNLOADExecute;
end;

procedure TfmFPCardEmployee.btn_PermitArmAreaDeleteClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
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
        dmDBCardPermit.EmployeeArmAreaPermitDelete(ed_emGradeSeq.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
        dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(ed_emGradeSeq.Text,'EM_GRADETYPE','3'); //카드 권한이 개별 그룹으로 변경 됨
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'E' + ed_emGradeSeq.Text,Cells[5,i],con_ComLogTYPE_ARMAREA,L_stMenuID + '(' + Caption + '):Permit Delete');

        NotPermitArmAreaListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
        if RowCount > 2 then RemoveRows(i,1)
        else GridInit(sg_PermitAlarm,2,2,True);
      end;
    end;
  end;
  fmMain.FORMCARDDOWNLOADExecute;

end;

procedure TfmFPCardEmployee.btn_PermitDoorAddClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
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
        dmDBCardPermit.EmployeeDoorPermitAdd(ed_emGradeSeq.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
        dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(ed_emGradeSeq.Text,'EM_GRADETYPE','3'); //카드 권한이 개별 그룹으로 변경 됨
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'E' + ed_emGradeSeq.Text,Cells[5,i],con_ComLogTYPE_DOOR,L_stMenuID + '(' + Caption + '):Permit Add');

        PermitDoorListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
        if RowCount > 2 then RemoveRows(i,1)
        else GridInit(sg_NotPermitDoor,2,2,True);
      end;
    end;
  end;

end;

procedure TfmFPCardEmployee.btn_PermitDoorDeleteClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
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
        dmDBCardPermit.EmployeeDoorPermitDelete(ed_emGradeSeq.Text,Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i]);
        dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(ed_emGradeSeq.Text,'EM_GRADETYPE','3'); //카드 권한이 개별 그룹으로 변경 됨
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,Cells[2,i],Cells[3,i],'E' + ed_emGradeSeq.Text,Cells[5,i],con_ComLogTYPE_DOOR,L_stMenuID + '(' + Caption + '):Permit Delete');

        NotPermitDoorListAdd(Cells[1,i],Cells[2,i],Cells[3,i],Cells[4,i],Cells[5,i],Cells[6,i],Cells[7,i]);
        if RowCount > 2 then RemoveRows(i,1)
        else GridInit(sg_PermitDoor,2,2,True);
      end;
    end;
  end;

end;

procedure TfmFPCardEmployee.btn_PositionAddClick(Sender: TObject);
begin
  inherited;
  fmMain.FormShowEvent(con_FormBMOSPOSICODE,TRUE);

end;

procedure TfmFPCardEmployee.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stParentCode : string;
  stEmCode,stEmName,stEmStateCode : string;
  stEmSeq,stCompanyCode,stPosiCode,stGubunCode : string;
  stACType,stATType,stFdType : string;
  stEmGroupCode : string;
  stFingerCardNo : string;
  stOldCardNo : string;
  i : integer;
  stTempEmSeq,stTempEmCode,stTempEmName : string;
  stCardGubun,stCardState : string;
  nIndex : integer;
  stPositionNum : string;
  stRelayID : string;
  stCardGroupType : string; //카드 권한 그룹 타입
  stAWCode : string;
{  stTimeCodeUse : string;
  stTimeGroup : string;
  stTime1 : string;
  stTime2 : string;
  stTime3 : string;
  stTime4 : string;
  stWeekCode : string; }
  stFingerUse : string;
  stFingerCard,stFingerCardState : string;
  TempAdoQuery : TADOQuery;
  stSql : string;
  bGradeUpdate : Boolean;
  stCardUse : string;
  stCardType : string;
  stTemp,stTemp1,stTemp2 : string;
  stCardNo : string;
begin
  inherited;
  stCardUse := '0';
  bGradeUpdate := False;
  if Trim(ed_CompanyName.Text) = '' then
  begin
    stMessage := dmFormMessage.GetMessage('BLANKFIELD');
    stMessage := StringReplace(stMessage,'$WORK',lb_CompanyName.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;

  if Not Check_FormCritical(stTemp) then
  begin
    stMessage := dmFormMessage.GetMessage('BLANKFIELD');
    stMessage := StringReplace(stMessage,'$WORK',stTemp,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  //if ed_RegCardNo.Text <> '' then CardAdd(False);

  btn_Save.Enabled := False;
  Pan_Emcode.Enabled := False;

  if L_stWork = 'EMPLOYEEADD' then
  begin
    stEmSeq := dmDBFunction.GetNextTB_EMPLOYEE_EmSeq;
  end else
  begin
    stEmSeq := ed_emSeq.Text;
    if L_nUpdateEmStateIndex <> cmb_EmState.ItemIndex then bGradeUpdate := True; //사원 상태가 변경 되면 권한도 변경 되는것이다.
  end;
  stCompanyCode := ed_SelectCompanyCode.Text;
  stEmCode := ed_EmCode.Text;
  stEmName := ed_Name.Text;
  if cmb_PosiName.ItemIndex > -1 then
    stPosiCode := PosiCodeList.Strings[cmb_PosiName.ItemIndex]
  else stPosiCode := '0';
  if stPosiCode = '' then stPosiCode := '0';

  if cmb_EmpGubun.ItemIndex > -1 then
    stGubunCode := EmployeeGubunCodeList.Strings[cmb_EmpGubun.ItemIndex]
  else stGubunCode := '0';
  if stGubunCode = '' then stGubunCode := '0';
  stACType := '1';

  if G_nBMSType = 3 then chk_Attend.Checked := True;
  if chk_Attend.Checked then stATType := '1'
  else stATType := '0';

  if G_nBMSType = 4 then chk_Food.Checked := True;
  if chk_Food.Checked then stFdType := '1'
  else stFdType := '0';

  stEmGroupCode := ed_CardGroupCode.Text;
  if stEmGroupCode = '' then stEmGroupCode := '0';
  stCardGroupType := inttostr(cmb_EmCardGradeType.ItemIndex + 1);
  if cmb_EmState.ItemIndex > -1 then
    stEmStateCode := EmployeeStateCodeList.Strings[cmb_EmState.ItemIndex];
  if Not isDigit(stEmStateCode) then stEmStateCode := '1';
  if cmb_AWCode.ItemIndex > -1 then stAWCode := AttendWorkTypeCodeList.Strings[cmb_AWCode.ItemIndex];
  if Not isDigit(stAWCode) then stAWCode := '1';

  if chk_FingerUse.Checked then stFingerUse := '1'
  else stFingerUse := '0';
  stCardGubun := '0'; //지문전용카드로 인식하자

  if L_bFingerImageUpdate then  //슈프리마 지문리더기로 지문을 등록한경우
  begin
    if ed_RegCardNo.Text = '' then ed_RegCardNo.Text := dmDBFunction.GetTB_CARD_FingerCardNo;
  end;

  if ed_RegCardNo.Text <> '' then ed_RegCardNo.Text := FillCharString(ed_RegCardNo.Text,'*',16,False);
  stCardState := '1';
  stCardUse := '0';


  if L_stWork = 'EMPLOYEEADD' then
  begin
    if ed_RegCardNo.Text <> '' then
    begin
      bGradeUpdate := True;
      if dmDBFunction.checkTB_CARD_CARDNO(ed_RegCardNo.Text,stCardType,stTemp,stTemp1,stTemp2) = 1 then
      begin
        dmDBUpdate.UpdateTB_CARD_Value(ed_RegCardNo.Text,stCardState,stCardGubun,stEmSeq);
      end else
      begin
        stPositionNum := dmDBFunction.GetNextTB_CARD_PositionNum;
        stRelayID := dmDBFunction.GetNextTB_CARD_RelayID;
        dmDBInsert.InsertIntoTB_CARD_Value(ed_RegCardNo.Text,stCardState,stCardGubun,stPositionNum,stRelayID,'0',stEmSeq);
        dmDBInsert.InsertIntoTB_CARDHIS_CopyCard(ed_RegCardNo.Text,ed_RegCardNo.Text,con_ComWorkType_INSERT); //카드 입력 이력 남기자.
      end;
      stCardUse := '1';
      if (G_nSystmRelayUse = 1) and (G_nSystmRelayCustomerNo = 2) then dmEmployeeRelay.CardInfoSKChungcheongRelay(ed_emcode.text,ed_name.Text,ed_RegCardNo.Text);
    end;
  end else
  begin
    if ed_RegCardNo.Text <> L_stSelectCardNo then
    begin
      bGradeUpdate := True;
      if L_stSelectCardNo <> '' then
      begin
        dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(L_stSelectCardNo);   //카드를 삭제 한 경우이다.
        dmDBUpdate.UpdateTB_FINGERDEVICECARD_CardStop(L_stSelectCardNo);
        dmDBDelete.DeleteTB_CARD_CARDNO(L_stSelectCardNo);
      end;
      if ed_RegCardNo.Text <> '' then
      begin
        if dmDBFunction.checkTB_CARD_CARDNO(ed_RegCardNo.Text,stCardType,stTemp,stTemp1,stTemp2) = 1 then
        begin
          dmDBUpdate.UpdateTB_CARD_Value(ed_RegCardNo.Text,stCardState,stCardGubun,stEmSeq);
        end else
        begin
          stPositionNum := dmDBFunction.GetNextTB_CARD_PositionNum;
          stRelayID := dmDBFunction.GetNextTB_CARD_RelayID;
          dmDBInsert.InsertIntoTB_CARD_Value(ed_RegCardNo.Text,stCardState,stCardGubun,stPositionNum,stRelayID,'0',stEmSeq);
          dmDBInsert.InsertIntoTB_CARDHIS_CopyCard(ed_RegCardNo.Text,L_stSelectCardNo,con_ComWorkType_INSERT); //카드 입력 이력 남기자.
        end;
        stCardUse := '1';
        if (G_nSystmRelayUse = 1) and (G_nSystmRelayCustomerNo = 2) then dmEmployeeRelay.CardInfoSKChungcheongRelay(stEmCode,stEmName,ed_RegCardNo.Text);
      end;

    end;
  end;
  if ed_RegCardNo.Text <> '' then stCardUse := '1';
  if DeleteCardNoList.Count > 0 then
  begin
    for i := 0 to DeleteCardNoList.Count - 1 do
    begin
      bGradeUpdate := True;
      stCardNo:= DeleteCardNoList.strings[i];
      dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(stCardNo);
      dmDBUpdate.UpdateTB_FINGERDEVICECARD_CardStop(stCardNo);
      dmDBDelete.DeleteTB_CARD_Key(stCardNo);
    end;
  end;


  DeleteCardNoList.Clear;
  ChangeCardNoList.Clear;
  AddCardNoList.Clear;
  FingerCardNoDupList.Clear;

  if L_stWork = 'EMPLOYEEADD' then
  begin
    (*stPositionNum := dmDBFunction.GetNextTB_CARD_PositionNum;
    stRelayID := dmDBFunction.GetNextTB_CARD_RelayID;
    if chk_FingerUse.Checked then
    begin
      if ed_RegCardNo.Text = '' then stFingerCardNo := dmDBFunction.GetTB_CARD_FingerCardNo      //Finger Card 한장 등록 하자.
      else stFingerCardNo := ed_RegCardNo.Text;

      dmDBInsert.InsertIntoTB_CARD_Value(stFingerCardNo,'1','0',stPositionNum,stRelayID,'0',stEmSeq);
    end;
    *)

    dmDBInsert.InsertIntoTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stGubunCode,
               ed_CompanyPhone.Text,'',ed_Handphone.Text,ed_EtcInfo.Text,FormatDateTime('yyyymmdd',dt_Indate.Date),
               FormatDateTime('yyyymmdd',dt_Outdate.Date),'1',stATType,stFdType,stEmGroupCode,stCardGroupType,stFingerUse,stEmStateCode,stAWCode,stCardUse,'0');
    dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_INSERT); //사원정보 InSert 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음
    //여기서 권한 작업 하자  - Insert 시에는 무조건 권한 작업
    if stCardGroupType = '3' then  //개인별 권한 작업이면
    begin
      dmDBDelete.deleteTB_CARDPERMITEMPLOYEECODE_EMCODEAll(stEmSeq);  //해당 사원 코드로 권한이 있으면 문제 있는 것임
      if G_nCardDefaultDoorPermitType = 1 then  //전체권한을 가지고 시작 하는 경우 이면
      begin
        dmDBCardPermit.EmployeeCardAllPermit(stEmSeq,con_ComLogTYPE_DOOR,'1','N');
      end else
      begin
      //  dmDBCardPermit.EmployeeCardAllPermit(stEmSeq,con_ComLogTYPE_DOOR,'0','Y');
      end;
      if G_nCardDefaultArmPermitType = 1 then  //전체권한을 가지고 시작 하는 경우 이면
      begin
        dmDBCardPermit.EmployeeCardAllPermit(stEmSeq,con_ComLogTYPE_ARMAREA,'1','N');
      end else
      begin
      //  dmDBCardPermit.EmployeeCardAllPermit(stEmSeq,con_ComLogTYPE_ARMAREA,'0','Y');
      end;;
    end else
    begin
      dmDBCardPermit.EmployeeGradeChange_Process(stEmSeq,stCompanyCode,stEmGroupCode,stCardGroupType,True);
    end;

    fmMain.FORMCHANGE(con_FormBMOSFPCARDEMPLOYEE,'');
  end else if L_stWork = 'EMPLOYEEUPDATE' then
  begin

    //변경된 내역 저장
    dmDBUpdate.UpdateTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stGubunCode,
               ed_CompanyPhone.Text,'',ed_Handphone.Text,ed_EtcInfo.Text,FormatDateTime('yyyymmdd',dt_Indate.Date),
               FormatDateTime('yyyymmdd',dt_Outdate.Date),'1',stATType,stFdType,stEmGroupCode,stCardGroupType,stFingerUse,stEmStateCode,stAWCode,True,stCardUse);
    dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_UPDATE); //사원정보 InSert 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음

    if L_bEmployeeGradeChange or bGradeUpdate then
    begin
      //여기서 권한 재작업 하자.
      if stCardGroupType <> '3' then  //개인별 권한 작업이 아니면
      begin
        dmDBCardPermit.EmployeeGradeChange_Process(stEmSeq,stCompanyCode,stEmGroupCode,stCardGroupType,True);
      end;
      (*if stCardGroupType = '3' then  //개인별 권한 작업이면
      begin
        dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N'); //해당 사번의 권한 적용 부분을 재 작업 - 삭제된 카드가 있거나 추가된 카드가 있으므로
        dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(stEmSeq,'','','','','N');
      end else
      begin
        dmDBCardPermit.EmployeeGradeChange_Process(stEmSeq,stCompanyCode,stEmGroupCode,stCardGroupType,bGradeUpdate);
      end;*)
    end;
    //무조건 재작업 하자.  -- 작업이 안되는 경우 발생해서 재작업 됨
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N'); //해당 사번의 권한 적용 부분을 재 작업 - 삭제된 카드가 있거나 추가된 카드가 있으므로
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(stEmSeq,'','','','','N');
    fmMain.FORMCHANGE(con_FormBMOSFPCARDEMPLOYEE,'');
  end;

  if FileExists(ed_ImageFile.Text) then  //이미지 파일 삽입
  begin
    if (G_nDBType = MSSQL) or (G_nDBType = MDB)  then
    begin
      stSql := 'Update TB_EMPLOYEE Set ';
      stSql := stSql + 'EM_IMAGE = :EM_IMAGE ';
      stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND EM_SEQ = ' + stEmSeq + '';
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
          Parameters.ParamByName( 'EM_IMAGE' ).LoadFromFile( ed_ImageFile.Text, ftGraphic );
          Try
            ExecSQL;
          Except
            Exit;
          End;
        end;
      Finally
        TempAdoQuery.EnableControls;
        TempAdoQuery.Free;
        CoUninitialize;
      End;
    end else if G_nDBType = POSTGRESQL then
    begin
      stSql := 'Update TB_EMPLOYEE Set ';
      stSql := stSql + 'EM_IMAGE = lo_import(''' + stringReplace(ed_ImageFile.Text,'\','\\',[rfReplaceAll]) + ''') ' ;
      stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND EM_SEQ = ' + stEmSeq + '';
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
            ExecSQL;
          Except
            Exit;
          End;
        end;
      Finally
        TempAdoQuery.EnableControls;
        TempAdoQuery.Free;
        CoUninitialize;
      End;
    end;
  end;

  if G_bAttendDedicateDoorUse then
  begin
    if chk_Attend.Checked then dmDBCardPermit.EmployeeAttendDoorGradePermitAdd(stEmSeq,con_ComLogTYPE_DOOR,'1','N')
    else dmDBCardPermit.EmployeeAttendDoorGradePermitAdd(stEmSeq,con_ComLogTYPE_DOOR,'0','N');
  end;

  if G_bFoodDedicateDoorUse then
  begin
    if chk_Food.Checked then dmDBCardPermit.EmployeeFoodDoorGradePermitAdd(stEmSeq,con_ComLogTYPE_DOOR,'1','N')
    else dmDBCardPermit.EmployeeFoodDoorGradePermitAdd(stEmSeq,con_ComLogTYPE_DOOR,'0','N');

  end;


  if L_bFingerImageUpdate then  //슈프리마 지문리더기로 지문을 등록한경우
  begin
    if dmDBFunction.CheckTB_EMPLOYEEFINGER_Value(stEmSeq,'1') < 1 then
    begin
      dmDBInsert.InsertIntoTB_EMPLOYEEFINGER_Template(stEmSeq,'1',L_stFingerTemplate1_1,L_stFingerTemplate1_2,'','','','');
    end else
    begin
      dmDBUpdate.UpdateTB_EMPLOYEEFINGER_Template(stEmSeq,'1',L_stFingerTemplate1_1,L_stFingerTemplate1_2,'','','','');
    end;
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(stEmSeq,'N');
  end else
  begin
    if bGradeUpdate then dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(stEmSeq,'N'); //카드 추가 삭제 부분이 있으면 지문리더에도 재전송 하자.
  end;

  if FileExists(G_stExeFolder + '\Temp.bmp') then  //이미지 파일 삽입
  begin
    if (G_nDBType = MSSQL) or (G_nDBType = MDB)  then
    begin
      stSql := 'Update TB_EMPLOYEEFINGER Set ';
      stSql := stSql + 'EF_IMAGE1 = :EM_IMAGE ';
      stSql := stSql + ' where EM_SEQ = ' + stEmSeq + ' ';
      stSql := stSql + ' AND EF_SEQ = 1 ';
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
          Parameters.ParamByName( 'EM_IMAGE' ).LoadFromFile( G_stExeFolder + '\Temp.bmp', ftGraphic );
          Try
            ExecSQL;
          Except
            Exit;
          End;
        end;
      Finally
        TempAdoQuery.EnableControls;
        TempAdoQuery.Free;
        CoUninitialize;
      End;
      if FileExists(G_stExeFolder + '\Temp.bmp') then DeleteFile(G_stExeFolder + '\Temp.bmp');
    end else if G_nDBType = POSTGRESQL then
    begin
      stSql := 'Update TB_EMPLOYEEFINGER Set ';
      stSql := stSql + 'EF_IMAGE1 = lo_import(''' + stringReplace(G_stExeFolder + '\Temp.bmp','\','\\',[rfReplaceAll]) + ''') ' ;
      stSql := stSql + ' where EM_SEQ = ' + stEmSeq + ' ';
      stSql := stSql + ' AND EF_SEQ = 1 ';
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
            ExecSQL;
          Except
            Exit;
          End;
        end;
      Finally
        TempAdoQuery.EnableControls;
        TempAdoQuery.Free;
        CoUninitialize;
      End;
    end;
  end;
  dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_MEMLOAD','N');  //서버에서 메모리 로딩하자.
  dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);
  fmMain.FORMCARDDOWNLOADExecute;

  Pan_Emcode.Enabled := True;
  btn_Save.Enabled := True;
  Pan_Emcode.Visible := False;
  SearchEmployeeList(stEmSeq,sg_EmployeeList.TopRow);
end;

procedure TfmFPCardEmployee.btn_SaveMouseEnter(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clYellow;
end;

procedure TfmFPCardEmployee.btn_SaveMouseLeave(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clGray;
end;

procedure TfmFPCardEmployee.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchEmployeeList('');
end;

procedure TfmFPCardEmployee.btn_ValidCancelClick(Sender: TObject);
begin
  inherited;
  pan_ValidDateManage.Visible := False;
  List.Enabled := True;
end;

procedure TfmFPCardEmployee.btn_ValidDateManageClick(Sender: TObject);
begin
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage(dmFormMessage.GetMessage('NOTSELECTEMPLOYEE'));
    Exit;
  end;

  List.Enabled := False;
  lb_ValidDateCaption.Caption.Text := btn_ValidDateManage.Caption;
  //pan_Company.Top := btn_CompanyManage.Top - pan_Company.Height - 20;
  pan_ValidDateManage.Visible := True;
  dt_ValidDate.Date := now;
end;

procedure TfmFPCardEmployee.btn_ValidSaveClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stValidDate : string;
begin
  inherited;

  stValidDate := FormatDateTime('yyyymmdd',dt_ValidDate.Date);

  Try
    pan_progress.Visible := True;
    with sg_EmployeeList do
    begin
      ProgressBar1.Max := RowCount - 1;
      ProgressBar1.Position := 0;
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(cells[16,i],'EM_ENDDATE',stValidDate);
          dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(cells[16,i],'EM_MEMLOAD','N');

          dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(cells[16,i],'N');//이부분은 꼭 필요함 통신서버에서 권한 변경 체크하기 위함
          dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(cells[16,i],'N');
          dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(cells[16,i],con_ComWorkType_UPDATE);
        end;
        ProgressBar1.Position := i;
        lb_ProgressCount.Caption.Text := inttostr(i) + '/' + inttostr(Rowcount - 1);
        Application.ProcessMessages;
      end;
    end;
    fmMain.FORMCARDDOWNLOADExecute;

    AdvSmoothPanel2.Enabled := True;
    List.Enabled := True;
    pan_ValidDateManage.Visible := False;
    SearchEmployeeList('');
  Finally
    pan_progress.Visible := False;
  End;
end;

procedure TfmFPCardEmployee.CardAdd(aButton: Boolean);
var
  stCardType,stEmSeq,stEmCode,stEmName : string;
  stFingerCardNo : string;
  stOldCardNo : string;
  stMessage : string;
  nRow : integer;
  nIndex : integer;
  i : integer;
  stCardNo : string;
  nResult : UF_RET_CODE;
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  inherited;
  if aButton then
  begin
    if G_nCardRegisterType = 1 then
    begin
      Try
        if Not dmSupremaFinger.Connected then
        begin
          dmSupremaFinger.DeviceIP := G_stCardRegisterIP;
          dmSupremaFinger.DevicePort := strtoint(G_stCardRegisterFingerPort);
          dmSupremaFinger.SocketOPEN := True;
        end;
        if Not dmSupremaFinger.Connected then
        begin
          showmessage(dmFormMessage.GetMessage('FINGERREADEROPENFAIL'));
          chk_FingerUse.Checked := False;
          Exit;
        end;
        pan_FingerCard.Caption := dmFormMessage.GetMessage('CARDTAGREADER');
        pan_FingerCard.Visible := True;
        Application.ProcessMessages;
        nResult := dmSupremaFinger.GetReadCardNo(stCardNo);
        dmSupremaFinger.SocketOPEN := False;
        if nResult = UF_RET_SUCCESS then
        begin
          if ed_RegCardNo.Text <> stCardNo then
          begin
            if ed_RegCardNo.Text <> '' then
            begin
              nIndex := DeleteCardNoList.IndexOf(ed_RegCardNo.Text);
              if nIndex < 0 then DeleteCardNoList.Add(ed_RegCardNo.Text);  //카드 삭제처리 할것
            end;
          end;
          ed_RegCardNo.Text := stCardNo;
          pan_FingerCard.Visible := False;
        end else
        begin
          showmessage(dmFormMessage.GetMessage('CARDREADFAILED'));
          pan_FingerCard.Visible := False;
          dmSupremaFinger.SocketOPEN := False;
          Exit;
        end;
      Finally

      End;

    end;
  end;
  cmb_RegType.ItemIndex := 0;
  if ed_RegCardNo.Text = '' then Exit;
  if Length(ed_RegCardNo.Text) < 8 then Exit;
  ed_RegCardNo.Text := FillCharString(ed_RegCardNo.Text,'*',16,False);

//  if G_nCardNoType = 0 then ed_RegCardNo.Text := ed_RegCardNo.Text //시리얼 카드
//  else if G_nCardNoType = 1 then ed_RegCardNo.Text := FillCharString(ed_RegCardNo.Text,'*',16)  //16바이트 카드
//  else if G_nCardNoType = 2 then ed_RegCardNo.Text := ed_RegCardNo.Text + '0**';//KT사옥타입

  if dmDBFunction.checkTB_CARD_CARDNO(ed_RegCardNo.Text,stCardType,stEmSeq,stEmCode,stEmName) = 1 then
  begin
    if isdigit(stEmSeq) and (ed_emSeq.Text <> stEmSeq) then
    begin
      stMessage := dmFormMessage.GetMessage('CARDDUP');
      stMessage := stringReplace(stMessage,'$EMCODE',stEmCode,[rfReplaceAll]);
      stMessage := stringReplace(stMessage,'$NAME',stEmName,[rfReplaceAll]);
      if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then
      begin
        ed_RegCardNo.Text := L_stSelectCardNo;
        Exit;
      end;
    end;
  end;

  L_bEmployeeGradeChange := True;   //추가되면 권한 작업 재정리 해 줘야 함
end;

procedure TfmFPCardEmployee.CardRegistEvent(aCardNo: string);
var
  nIndex : integer;
begin
  if Pan_Emcode.Visible then
  begin
    if ed_RegCardNo.Text <> aCardNo then
    begin
      if ed_RegCardNo.Text <> '' then
      begin
        nIndex := DeleteCardNoList.IndexOf(ed_RegCardNo.Text);
        if nIndex < 0 then DeleteCardNoList.Add(ed_RegCardNo.Text);  //카드 삭제처리 할것
      end;
    end;
    ed_RegCardNo.Text := aCardNo;
  end;
end;

function TfmFPCardEmployee.Check_FormCritical(var aBlankName: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := True;
  stSql := 'Select * from TB_FORMCRITICAL where FC_MENUTYPE = ''EMPLOYEE'' AND FC_CRITICALTYPE = 1 ';  //필수항목 인 것만 로딩 하자.
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
      if recordCount < 1 then Exit;
      result := False;
      while Not Eof do
      begin
        if FindField('FC_CRITICALID').AsInteger = 1 then
        begin
          if Trim(ed_EmCode.Text) = '' then
          begin
            aBlankName := lb_EmCode.Caption.Text;
            Exit;
          end;
        end else if FindField('FC_CRITICALID').AsInteger = 2 then
        begin
          if Trim(ed_Name.Text) = '' then
          begin
            aBlankName := lb_EmployeeName.Caption.Text;
            Exit;
          end;
        end else if FindField('FC_CRITICALID').AsInteger = 3 then
        begin
          if Trim(ed_Handphone.Text) = '' then
          begin
            aBlankName := lb_HandPhone.Caption.Text;
            Exit;
          end;
        end else if FindField('FC_CRITICALID').AsInteger = 4 then
        begin
          if Trim(ed_CompanyPhone.Text) = '' then
          begin
            aBlankName := lb_CompanyPhone.Caption.Text;
            Exit;
          end;
        end else if FindField('FC_CRITICALID').AsInteger = 5 then
        begin
          if Trim(ed_EtcInfo.Text) = '' then
          begin
            aBlankName := lb_etcInfo.Caption.Text;
            Exit;
          end;
        end;
        Next;
      end;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFPCardEmployee.chk_AddAutoEmpCodeClick(Sender: TObject);
begin
  inherited;
  if chk_AddAutoEmpCode.Checked then
    ed_EmCode.Text := dmDBFunction.GetNextTB_EMPLOYEE_EmployeeCode;
end;

procedure TfmFPCardEmployee.chk_FingerUseClick(Sender: TObject);
var
  nResult : UF_RET_CODE;
  i,j : integer;
  nLen : integer;
begin
  inherited;
  if chk_FingerUse.Checked then
  begin
    if G_nCardRegisterType = 1 then
    begin
      //슈프리마 지문리더 사용하는 곳이다. 지문등록하러 가자.
      if Not dmSupremaFinger.Connected then
      begin
        dmSupremaFinger.DeviceIP := G_stCardRegisterIP;
        dmSupremaFinger.DevicePort := strtoint(G_stCardRegisterFingerPort);
        dmSupremaFinger.SocketOPEN := True;
      end;
      if Not dmSupremaFinger.Connected then
      begin
        showmessage(dmFormMessage.GetMessage('FINGERREADEROPENFAIL'));
        chk_FingerUse.Checked := False;
        Exit;
      end;
      FingerImage.Picture := nil;
      pan_Finger.Visible := True;
      btn_FingerSave.Enabled := False;
      lb_FingerMessage.Caption := dmFormMessage.GetMessage('FINGERSENSOR');
      Application.ProcessMessages;
      Delay(20);
      L_stFingerTemplate1_1 := '';
      L_stFingerTemplate1_2 := '';
      for i := 0 to 3 do
      begin
        nResult := dmSupremaFinger.GetFingerTemplate(1,L_stFingerTemplate1_1);
        nLen := Length(L_stFingerTemplate1_1);
        if nResult = UF_RET_SUCCESS then
        begin
          lb_FingerMessage.Caption := dmFormMessage.GetMessage('TRYAGAINFINGER');
          Application.ProcessMessages;
          Delay(20);
          for j := 0 to 3 do
          begin
            nResult := dmSupremaFinger.GetFingerTemplate(2,L_stFingerTemplate1_2);
            if nResult = UF_RET_SUCCESS then
            begin
              if FileExists(G_stExeFolder + '\Temp.bmp') then DeleteFile(G_stExeFolder + '\Temp.bmp');
              nResult := dmSupremaFinger.GetFingerImage(G_stExeFolder + '\Temp.bmp');
              if FileExists(G_stExeFolder + '\Temp.bmp') then
                FingerImage.Picture.LoadFromFile(G_stExeFolder + '\Temp.bmp');
              break;
            end else
            begin
              lb_FingerMessage.Caption := dmFormMessage.GetMessage('FINGERSAVEFAILED');
              Application.ProcessMessages;
              Delay(20);
            end;
          end;
          break;
        end else
        begin
          lb_FingerMessage.Caption := dmFormMessage.GetMessage('FINGERSAVEFAILED');
          Application.ProcessMessages;
          Delay(20);
        end;
      end;
      dmSupremaFinger.SocketOPEN := False;
      if nResult <> UF_RET_SUCCESS then
      begin
        showmessage(dmFormMessage.GetMessage('FINGERSAVEFAILED'));
        chk_FingerUse.Checked := False;
        pan_Finger.Visible := False;
        Exit;
      end;
      lb_FingerMessage.Visible := True;
      lb_FingerMessage.Caption := dmFormMessage.GetMessage('FINGERSAVESUCCESS');
      btn_FingerSave.Enabled := True;
    end;
  end;
end;

procedure TfmFPCardEmployee.chk_IncludeCardNumClick(Sender: TObject);
begin
  inherited;
  if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
end;

procedure TfmFPCardEmployee.cmb_EmCardGradeTypeChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True;
  if cmb_EmCardGradeType.ItemIndex = 1 then gb_EmployeeGroup.Visible := True
  else gb_EmployeeGroup.Visible := False;
end;

procedure TfmFPCardEmployee.cmb_EmpGubunSearchClick(Sender: TObject);
begin
  inherited;
  if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
end;

procedure TfmFPCardEmployee.cmb_EtcSearchChange(Sender: TObject);
begin
  inherited;
  lb_EtcDetail.Caption.Text := cmb_EtcSearch.Text;
  ed_etcSearch.Text := '';
end;

procedure TfmFPCardEmployee.cmb_PositionSearchClick(Sender: TObject);
begin
  inherited;
  if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
end;

procedure TfmFPCardEmployee.dt_IndateChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True;  //유효기간 변경시 카드데이터 재전송
end;

procedure TfmFPCardEmployee.dt_OutDateChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True; //유효기간 변경시 카드데이터 재전송
end;

procedure TfmFPCardEmployee.ed_CompanyNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;
end;

procedure TfmFPCardEmployee.ed_EmCodeExit(Sender: TObject);
var
  stEmSeq,stACType,stATType,stFDType,stEmName,stValidDate : string;
  stMessage : string;
begin
  inherited;
  if ed_OldEmCode.Text = ed_EmCode.Text  then Exit; //사번이 변경 되지 않은 경우

  if dmDBFunction.checkTB_EMPLOYEE_EMCODE_Variable(ed_EmCode.Text,stEmSeq,stACType,stATType,stFDType,stEmName,stValidDate) = 1 then
  begin
    if stEmSeq <> ed_emSeq.Text then
    begin
      if L_stWork = 'EMPLOYEEADD' then
      begin
        if ((G_nBMSType = 2) and (stACType = '1')) or ((G_nBMSType = 3) and (stATType = '1')) or ((G_nBMSType = 4) and (stFDType = '1')) then
        begin
          stMessage := stringReplace(dmFormMessage.GetMessage('EMCODEDUP'),'$NAME',stEmName,[rfReplaceAll]);
          if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then
          begin
            ed_EmCode.Text := '';
            Exit;
          end;
        end else
        begin
          stMessage := stringReplace(dmFormMessage.GetMessage('EMCODEDUPSYSTEM'),'$NAME',stEmName,[rfReplaceAll]);
          if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDOK)  then
          begin
            SearhAddEmployee(stEmSeq);
            L_stWork := 'EMPLOYEEUPDATE';
            Exit;
          end;
        end;
      end else
      begin
        stMessage := stringReplace(dmFormMessage.GetMessage('EMCODEDUP'),'$NAME',stEmName,[rfReplaceAll]);
        if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then
        begin
          ed_EmCode.Text := ed_OldEmCode.Text;
          Exit;
        end;
      end;
    end;

  end;

end;

procedure TfmFPCardEmployee.employeePanelClear;
begin
  L_bEmployeeGradeChange := False;
  L_bFingerImageUpdate := False;
  L_stSelectCardNo := '';

  ed_emSeq.Text := '';
  ed_CompanyName.Text := '';
  ed_EmCode.Text := '';
  ed_OldEmCode.Text := '';
  ed_Name.Text := '';
  cmb_PosiName.ItemIndex := 0;
  cmb_EmpGubun.ItemIndex := 0;
  ed_Handphone.Text := '';
  ed_CompanyPhone.Text := '';
  ed_EtcInfo.Text := '';
  dt_Indate.Date := Now;
  dt_OutDate.Date :=  EncodeDateTime(9999,
                                             12,
                                             31,
                                             0,0,0,0);
  chk_Attend.Checked := True;
  chk_Food.Checked := True;
  chk_FingerUse.Checked := False;
  AddCardNoList.Clear;
  ChangeCardNoList.Clear;
  FingerCardNoDupList.Clear;
  DeleteCardNoList.Clear;
  Image1.Picture.Graphic := Nil;
  ed_ImageFile.Text := '';

  if cmb_CardGubun.Items.Count > 0 then cmb_CardGubun.ItemIndex := 0;
  if cmb_RegType.Items.Count > 0 then cmb_RegType.ItemIndex := 0;
  if cmb_EmState.Items.Count > 0 then cmb_EmState.ItemIndex := 0;
  if cmb_AWCode.Items.Count > 0 then cmb_AWCode.ItemIndex := 0;

{  rg_TimeGroup.ItemIndex := 0;
  pan_Time.Visible := False;
  chk_TimeGroup.Checked[0] := False;
  chk_TimeGroup.Checked[1] := False;
  chk_TimeGroup.Checked[2] := False;
  chk_TimeGroup.Checked[3] := False;
  chk_WeekGroup.Checked[0] := True;
  chk_WeekGroup.Checked[1] := True;
  chk_WeekGroup.Checked[2] := True;
  chk_WeekGroup.Checked[3] := True;
  chk_WeekGroup.Checked[4] := True;
  chk_WeekGroup.Checked[5] := True;
  chk_WeekGroup.Checked[6] := True;
}
  chk_AddAutoEmpCode.Enabled := True;
end;

(*
function TfmFPCardEmployee.EmployeePermitToCardDeviceLoad(aNodeNo, aEcuID,
  aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stOldCardNo : string;
  stNodeNo : string;
  nIndex : integer;
  bNodeSetting : Boolean;
  stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8 : string;
  stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8:string;
begin

  result := False;
  stSql := ' Select ';
  stSql := stSql + ' a.EM_SEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CP_TYPE,f.EM_STATE,';
  stSql := stSql + ' a.CP_NUMBER,a.CP_PERMIT,b.CA_CARDNO,b.CA_STATECODE,b.CA_POSITIONNUM, ';
  stSql := stSql + ' c.EM_CODE,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ACUSE,c.EM_ATUSE,c.EM_FDUSE,';
  stSql := stSql + ' e.EM_TIMECODEUSE,e.TC_GROUP,e.TC_TIME1,e.TC_TIME2,e.TC_TIME3,e.TC_TIME4,e.TC_WEEKCODE,c.EM_REGDATE,c.EM_ENDDATE ';
  stSql := stSql + ' from TB_CARDPERMITEMPLOYEECODE a ';
  stSql := stSql + ' INNER Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = c.EM_SEQ) ';
  stSql := stSql + ' Inner Join TB_DEVICE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID  ';
  stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEDEVICETIMECODE e ';
  stSql := stSql + ' ON(a.EM_SEQ = e.EM_SEQ ';
  stSql := stSql + ' AND a.ND_NODENO = e.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = e.DE_ECUID ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEESTATECODE f ';
  stSql := stSql + ' ON(c.EM_STATECODE = f.EM_STATECODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' Order by b.CA_CARDNO';

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
      result := True;
      if recordcount < 1 then Exit;

      stOldCardNo := '';
      stPermit := '0';
      stDoor1:= '0';
      stDoor2:= '0';
      stDoor3:= '0';
      stDoor4:= '0';
      stDoor5:= '0';
      stDoor6:= '0';
      stDoor7:= '0';
      stDoor8:= '0';
      stArmArea0:= '0';
      stArmArea1:= '0';
      stArmArea2:= '0';
      stArmArea3:= '0';
      stArmArea4:= '0';
      stArmArea5:= '0';
      stArmArea6:= '0';
      stArmArea7:= '0';
      stArmArea8:= '0';



      First;
      bNodeSetting := True;
      while Not Eof do
      begin
        stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
        if stOldCardNo <> '' then  //카드번호가 변경 된 경우
        begin
          if stOldCardNo <> FindField('CA_CARDNO').AsString then
          begin
            //여기에서 TB_CARDPERMIT 테이블에 인서트 하자.
            if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',stOldCardNo) = 1 then
            begin
              if Not dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',stOldCardNo,
                         stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                         stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8) then result := False;
            end else
            begin
              if Not dmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',stOldCardNo,
                         stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                         stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8) then result := False;
            end;
            stOldCardNo := FindField('CA_CARDNO').AsString;
            stPermit := '0';
            stDoor1:= '0';
            stDoor2:= '0';
            stDoor3:= '0';
            stDoor4:= '0';
            stDoor5:= '0';
            stDoor6:= '0';
            stDoor7:= '0';
            stDoor8:= '0';
            stArmArea0:= '0';
            stArmArea1:= '0';
            stArmArea2:= '0';
            stArmArea3:= '0';
            stArmArea4:= '0';
            stArmArea5:= '0';
            stArmArea6:= '0';
            stArmArea7:= '0';
            stArmArea8:= '0';
            bNodeSetting := True;
          end;
        end;
        if FindField('CP_TYPE').AsString = '1' then //락 타입
        begin
          if FindField('CP_NUMBER').AsString = '1' then  stDoor1:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '2' then  stDoor2:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '3' then  stDoor3:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '4' then  stDoor4:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '5' then  stDoor5:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '6' then  stDoor6:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '7' then  stDoor7:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '8' then  stDoor8:= FindField('CP_PERMIT').AsString;
          if FindField('CP_PERMIT').AsString = '1' then stPermit := '1';
          bNodeSetting := False;
        end else if FindField('CP_TYPE').AsString = '2' then   //방번구역
        begin
          if FindField('CP_NUMBER').AsString = '0' then  stArmArea0:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '1' then  stArmArea1:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '2' then  stArmArea2:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '3' then  stArmArea3:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '4' then  stArmArea4:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '5' then  stArmArea5:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '6' then  stArmArea6:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '7' then  stArmArea7:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '8' then  stArmArea8:= FindField('CP_PERMIT').AsString;
          if FindField('CP_PERMIT').AsString = '1' then stPermit := '1';
          bNodeSetting := False;
        end;
        stOldCardNo := FindField('CA_CARDNO').AsString;
        Application.ProcessMessages;
        Next;
      end;
      if Not bNodeSetting then    //마지막 셋팅 안한게 있으면 셋팅 하자.
      begin
        if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString) = 1 then
        begin
          if Not dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString,
                     stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                     stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8) then result := False;
        end else
        begin
          if Not dmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString,
                     stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                     stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8) then result := False;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;
*)

procedure TfmFPCardEmployee.FingerTimerTimer(Sender: TObject);
begin
  inherited;
  lb_FingerMessage.Visible := Not lb_FingerMessage.Visible;
end;

procedure TfmFPCardEmployee.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmFPCardEmployee.FormChangeEvent(aNumber: integer);
var
  stSelectCode1 : string;
  stSelectCode2 : string;
  nIndex : integer;
begin
  case aNumber of
    con_FormBMOSCOMPANYCODE : begin
        LoadCompanyTreeView('',tv_List,tv_Code,con_LocalCompanyImageIndex);
        LoadCompanyTreeView('',tv_AddCompanyName,tv_AddCompanyCode,con_LocalCompanyImageIndex);
    end;
    con_FormBMOSBUILDINGCODE : begin
      LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
    end;
    con_FormBMOSPOSICODE : begin
      if cmb_PosiName.ItemIndex > -1 then
        stSelectCode1 := PosiCodeList.Strings[cmb_PosiName.ItemIndex];
      LoadPosiCode(copy(ed_SelectCompanyCode.Text,1,1+G_nCompanyCodeLength),PosiCodeList,cmb_PosiName);
      nIndex := PosiCodeList.IndexOf(stSelectCode1);
      if nIndex > -1 then cmb_PosiName.ItemIndex := nIndex;

      if cmb_PositionSearch.ItemIndex > -1 then
        stSelectCode2 := PosiSearchCodeList.Strings[cmb_PositionSearch.ItemIndex];
      LoadPosiCode(copy(ed_SelectCompanyCode.Text,1,1+G_nCompanyCodeLength),PosiSearchCodeList,cmb_PositionSearch,True,L_stAllName);
      nIndex := PosiSearchCodeList.IndexOf(stSelectCode2);
      if nIndex > -1 then cmb_PositionSearch.ItemIndex := nIndex;
    end;
    con_FormBMOSEMPLOYEEGUBUN : begin
      if cmb_EmpGubun.ItemIndex > -1 then
        stSelectCode1 := EmployeeGubunCodeList.Strings[cmb_EmpGubun.ItemIndex];
      LoadEmployeeGubunCode(EmployeeGubunCodeList,cmb_EmpGubun);
      nIndex := EmployeeGubunCodeList.IndexOf(stSelectCode1);
      if nIndex > -1 then cmb_EmpGubun.ItemIndex := nIndex;
      if cmb_EmpGubunSearch.ItemIndex > -1 then
        stSelectCode2 := EmployeeGubunSearchCodeList.Strings[cmb_EmpGubunSearch.ItemIndex];
      LoadEmployeeGubunCode(EmployeeGubunSearchCodeList,cmb_EmpGubunSearch,True,L_stAllName);
      nIndex := EmployeeGubunSearchCodeList.IndexOf(stSelectCode2);
      if nIndex > -1 then cmb_EmpGubunSearch.ItemIndex := nIndex;
    end;

  end;
end;

procedure TfmFPCardEmployee.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dmSupremaFinger.Connected then
  begin
    dmSupremaFinger.SocketOPEN := False;
  end;
  //dmSupremaFinger.Free;

  PosiCodeList.Free;
  PosiSearchCodeList.Free;
  EmployeeGubunCodeList.Free;
  EmployeeGubunSearchCodeList.Free;
  EmployeeStateCodeList.Free;
  AttendWorkTypeCodeList.Free;
  CardGubunCodeList.Free;
  WorkCardGubunCodeList.Free;
  WorkCardStateCodeList.Free;
  AddCardNoList.Free;
  ChangeCardNoList.Free;
  CardStateCodeList.Free;
  FingerCardNoDupList.Free;
  DeleteCardNoList.Free;
  BuildingDoorCodeList.Free;
  BuildingArmAreaCodeList.Free;

  fmMain.FORMENABLE(con_FormBMOSFPCARDEMPLOYEE,'FALSE');

  Action := caFree;
end;

procedure TfmFPCardEmployee.FormCreate(Sender: TObject);
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
  PosiCodeList := TStringList.Create;
  PosiSearchCodeList := TStringList.Create;
  EmployeeGubunCodeList:= TStringList.Create;
  EmployeeGubunSearchCodeList := TStringList.Create;
  EmployeeStateCodeList := TStringList.Create;
  AttendWorkTypeCodeList := TStringList.Create;
  CardGubunCodeList := TStringList.Create;
  WorkCardGubunCodeList := TStringList.Create;
  WorkCardStateCodeList := TStringList.Create;
  AddCardNoList := TStringList.Create;
  ChangeCardNoList:= TStringList.Create;
  CardStateCodeList := TStringList.Create;
  FingerCardNoDupList := TStringList.Create;
  DeleteCardNoList := TStringList.Create;
  BuildingDoorCodeList := TStringList.Create;
  BuildingArmAreaCodeList := TStringList.Create;
  FontSetting;
  //dmSupremaFinger := TdmSupremaFinger.Create(nil);

end;

procedure TfmFPCardEmployee.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then tv_List.PopupMenu := pm_Work
  else tv_List.PopupMenu := nil;
  if IsUpdateGrade or IsDeleteGrade then sg_EmployeeList.PopupMenu := pm_Employee
  else sg_EmployeeList.PopupMenu := nil;
  pm_EmployeeAdd.Enabled := IsInsertGrade;
  btn_EmployeeAdd.Enabled := IsInsertGrade;
  pm_EmDelete.Enabled := IsDeleteGrade;
  pm_EmUpdate.Enabled := IsUpdateGrade;
end;

procedure TfmFPCardEmployee.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmFPCardEmployee.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('0','2','COMMONCOMPANYLIST');//소속 dmFormFunction.GetFormName('0','2','COMMONLIST01');
  pm_EmployeeAdd.Caption := dmFormFunction.GetFormName('2','2','BM3_011pm001');
  btn_EmployeeAdd.Caption := dmFormFunction.GetFormName('2','2','BM3_011pm001');
  btn_Excel.Caption := dmFormFunction.GetFormName('0','2','BUTTONFILESAVE002');
  chk_IncludeCardNum.Caption := dmFormFunction.GetFormName('0','2','COMMONCARDINC');
  btn_EmployeeDelete.Caption := dmFormFunction.GetFormName('2','2','BM3_011pm004');
  pm_EmDelete.Caption := dmFormFunction.GetFormName('2','2','BM3_011pm004');

  pm_EmployeeGradeAdmin.Caption := dmFormFunction.GetFormName('2','2','BM3_011pm002');
  pm_GroupPermit.Caption := dmFormFunction.GetFormName('2','2','BM3_011pm003');
  gb_Card.Caption := dmFormFunction.GetFormName('2','2','BM3_011cap001');
  lb_EmployeeList.Caption := dmFormFunction.GetFormName('2','2','BM3_011List');
  btn_PositionAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  btn_EmployeeGubunAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  if G_nCardRegisterType = 1 then
    btn_CardAdd.Caption := dmFormFunction.GetFormName('0','2','COMMONCARDREAD')
  else
    btn_CardAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  btn_emGradeComplete.Caption := dmFormFunction.GetFormName('0','2','BUTTONCOMPLETE001');
//  pm_EmDelete.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  L_stDeleteCaption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  btn_PermitDoorAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITADD001');
  btn_PermitArmAreaAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITADD001');
  btn_PermitDoorDelete.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITDELETE001');
  btn_PermitArmAreaDelete.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITDELETE001');
  pm_EmUpdate.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');
  btn_CompanyNameSelect.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH002');
  btn_BuildingNameSelect.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH002');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  sg_NotPermitAlarm.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONARMAREA');
  sg_PermitAlarm.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONARMAREA');
  lb_NotPermitAlarmArea.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREANOTPERMIT');
  tab_AlarmPermit.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREAPERMITADMIN');
  lb_PermitAlarmArea.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREAREPERMIT');
  chk_Attend.Caption := dmFormFunction.GetFormName('0','2','COMMONATTEND');
//  pan_PositionInfo.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGINFO');
  lb_EmGradePositionName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  lb_CompanyName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  sg_EmployeeList.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '1';
  sg_EmployeeList.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '2';
  sg_EmployeeList.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '3';
  sg_EmployeeList.Cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  sg_EmployeeList.Cells[4,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSI');
  sg_EmployeeList.Cells[5,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  sg_EmployeeList.Cells[6,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  sg_EmployeeList.Cells[7,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGUBUN');
  sg_EmployeeList.Cells[8,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  sg_EmployeeList.Cells[9,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  sg_EmployeeList.Cells[10,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  sg_EmployeeList.Cells[11,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEINDATE');
  sg_EmployeeList.Cells[12,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEOUTDATE');
  sg_EmployeeList.Cells[13,0] := dmFormFunction.GetFormName('0','2','COMMONATTEND');
  sg_EmployeeList.Cells[14,0] := dmFormFunction.GetFormName('0','2','COMMONFOODNAME');
  sg_EmployeeList.Cells[15,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGROUP');
  sg_EmployeeList.Cells[30,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEESTATE');
  sg_EmployeeList.Cells[32,0] := dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER'); //카드번호
  sg_NotPermitDoor.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDOOR');
  sg_PermitDoor.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDOOR');
  lb_PermitDoor.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORREGPERMIT');
  lb_NotDoorPermit.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORNOTPERMIT');
  tab_DoorPermit.Caption  := dmFormFunction.GetFormName('0','2','COMMONDOORPERMITADMIN');
  lb_EmCode.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  L_stEmCodeCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  lb_EmployeeName.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  L_stEmNameCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  lb_EmGradeName.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  lb_Position.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSI');
  lb_PositionSearch.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSI');
  lb_EmployeeGubun.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGUBUN');
  lb_EmployeeGubunSearch.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGUBUN');
  lb_EmployeeGroupCode.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGROUP');
  lb_HandPhone.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  L_stEmHandPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  lb_CompanyPhone.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  L_stEmCompanyPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  lb_etcInfo.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  L_stEmEtcCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  L_stCardNoCaption := dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER');
  lb_Indate.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEINDATE');
  lb_OutDate.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEOUTDATE');
  chk_AddAutoEmpCode.Caption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEAUTOCODE');
  lb_EmployeeState.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEESTATE');
  lb_EtcSearch.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONETCNAME');
  chk_Food.Caption := dmFormFunction.GetFormName('0','2','COMMONFOODNAME');
  lb_DoorNotPermitCountName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  lb_DoorPermitCountName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  lb_ArmAreaNotPermitCountName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  lb_ArmAreaPermitCountName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  chk_FingerUse.Caption := dmFormFunction.GetFormName('0','2','COMMONFINGER');
  pan_Finger.Caption := dmFormFunction.GetFormName('0','2','COMMONFINGER');
  lb_FingerMessage.Caption := dmFormFunction.GetFormMessage('FINGERSENSOR');
  Panel1.Caption := dmFormFunction.GetFormMessage('CLICKPICTURE');
  lb_EmpType.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONATTENDTYPE');
  lb_CardGrade.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCARDGRADE');
  lb_EmployeeGroupCode.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONGROUP');
  btn_CardGroupSelect.Caption :=dmFormFunction.GetFormName('0','2','BUTTONSEARCH002');
  btn_FingerSave.Caption :=dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_FingerCancel.Caption :=dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  btn_CompanySelect.Caption :=dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
  btn_BuildingCancel.Caption :=dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  btn_EmGroupSelect.Caption :=dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
  btn_EmGroupCancel.Caption :=dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  btn_CompanyManage.Caption :=dmFormFunction.GetFormName('2','2','BM3_011_01');
  btn_GroupManage.Caption := dmFormFunction.GetFormName('2','2','BM3_011_02');
  btn_ValidDateManage.Caption := dmFormFunction.GetFormName('2','2','BM3_011_03');
  lb_Count1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  lb_Count2.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  lb_SearchCount1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');

  cmb_EtcSearch.Items.Clear;
  cmb_EtcSearch.Items.Add(L_stEmCodeCaption);
  cmb_EtcSearch.Items.Add(L_stEmNameCaption);
  cmb_EtcSearch.Items.Add(L_stEmHandPhoneCaption);
  cmb_EtcSearch.Items.Add(L_stEmCompanyPhoneCaption);
  cmb_EtcSearch.Items.Add(L_stEmEtcCaption);
  cmb_EtcSearch.Items.Add(L_stCardNoCaption);
  cmb_EtcSearch.ItemIndex := 1;
  lb_EtcDetail.Caption.Text := cmb_EtcSearch.Text;

  LoadCardGrade(cmb_EmCardGradeType);
end;

procedure TfmFPCardEmployee.FormResize(Sender: TObject);
begin
  inherited;
  Pan_Emcode.Left := (Width div 2) - (Pan_Emcode.Width div 2);
  Pan_Emcode.top := (Height div 2) - (Pan_Emcode.Height div 2) - 30;

  pan_emPermitAdmin.Left := (Width div 2) - (pan_emPermitAdmin.Width div 2);
  pan_emPermitAdmin.top := (Height div 2) - (pan_emPermitAdmin.Height div 2) - 30;

  pan_progress.Left := (Width div 2) - (pan_progress.Width div 2);
  pan_progress.Top := (Height div 2) - (pan_progress.Height div 2);

  tv_List.Height := List.Height - tv_List.Top - 30;
  tv_List.Width := List.Width - (tv_List.Left * 2);

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

  btn_PermitDoorAdd.Top := (pan_PermitAction.Height div 2) - btn_PermitDoorAdd.Height - 5;
  btn_PermitDoorDelete.Top := (pan_PermitAction.Height div 2) + 5;
  btn_PermitArmAreaAdd.Top := (pan_PermitAction.Height div 2) - btn_PermitArmAreaAdd.Height - 5;
  btn_PermitArmAreaDelete.Top := (pan_PermitAction.Height div 2) + 5;

  pan_Message.Left := (Width div 2) - (pan_Message.Width div 2);
  pan_Message.Top := (Height div 2) - (pan_Message.Height div 2);

  pan_ValidDateManage.Left := (Width div 2) - (pan_ValidDateManage.Width div 2);
  pan_ValidDateManage.Top := (Height div 2) - (pan_ValidDateManage.Height div 2);

  pan_EmployeeListResize(pan_EmployeeList);
end;

procedure TfmFPCardEmployee.FormSearchEnable(aEnabled: Boolean);
begin
  cmb_PositionSearch.Enabled := aEnabled;
  cmb_EtcSearch.Enabled := aEnabled;
  tv_List.Enabled := aEnabled;
  cmb_EmpGubunSearch.Enabled := aEnabled;
  ed_etcSearch.Enabled := aEnabled;
  btn_Search.Enabled := aEnabled;
end;

procedure TfmFPCardEmployee.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSFPCARDEMPLOYEE,'TRUE');

  LoadCompanyTreeView('',tv_List,tv_Code,con_LocalCompanyImageIndex);
  LoadCompanyTreeView('',tv_AddCompanyName,tv_AddCompanyCode,con_LocalCompanyImageIndex);
  tv_List.Items[0].Selected := True;
  tv_ListClick(self);
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingName.Items[0].Selected := True;

  LoadEmployeeGroupTreeView('',tv_AddEmGroupName,tv_AddEmGroupCode,con_LocalEmployeeImageIndex);
  LoadEmployeeGroupTreeView('',tv_EmGroup,tv_EmGroupCode,con_LocalEmployeeImageIndex);
//  SearchEmGroupList('');
  tv_AddEmGroupName.Items[0].Selected := True;
  tv_AddEmGroupNameDblClick(self);

  pan_AddWorkResize(self);
  Image1.Align := alClient;
  tv_AddCompanyName.Left := btn_CompanyNameSelect.Left;

  LoadEmployeeGubunCode(EmployeeGubunCodeList,cmb_EmpGubun);
  LoadEmployeeGubunCode(EmployeeGubunSearchCodeList,cmb_EmpGubunSearch,True,L_stAllName);
  LoadEmployeeStateCode(EmployeeStateCodeList,cmb_EmState,False);
  LoadAttendWorkType(AttendWorkTypeCodeList,cmb_AWCode,False);


  LoadPosiCode('0',PosiSearchCodeList,cmb_PositionSearch,True,L_stAllName);

  LoadCardGubun(CardGubunCodeList,cmb_CardGubun,False);
  LoadCardState(CardStateCodeList,cmb_RegType,False);
  L_bVisitEditMode := True;


  pan_Finger.Left := (Pan_Emcode.Width div 2) - (pan_Finger.Width div 2);
  pan_Finger.top := (Pan_Emcode.Height div 2) - (pan_Finger.Height div 2);
  pan_Finger.Visible := False;

  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Enabled := False;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');
//  if G_nReportSearchType = 1 then SearchEmployeeList('');   //tv_ListClick 에서 한번 조회 함
end;

procedure TfmFPCardEmployee.Form_Close;
begin
  Close;
end;

procedure TfmFPCardEmployee.Image1Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.Title:= dmFormMessage.GetMessage('EMPLOYEEIMAGE');
  OpenDialog1.DefaultExt:= 'Jpg';
  OpenDialog1.Filter := 'Jpg files (*.Jpg)|*.Jpg';
  if OpenDialog1.Execute then
  begin
    ed_ImageFile.Text :=  OpenDialog1.FileName;
    if FileExists(ed_ImageFile.Text) then
    Image1.Picture.LoadFromFile(ed_ImageFile.Text);
  end;
end;

function TfmFPCardEmployee.JpegStartsInBlob(PicField: TBlobField): integer;
var
  bS : TADOBlobStream;
  buffer : Word;
  hx : string;
begin
  Result := -1;
  bS := TADOBlobStream.Create(PicField, bmRead);
  try
    while (Result = -1) and
      (bS.Position + 1 < bS.Size) do
    begin
      bS.ReadBuffer(buffer, 1);
      hx:=IntToHex(buffer, 2);
      if hx = 'FF' then begin
        bS.ReadBuffer(buffer, 1);
        hx:=IntToHex(buffer, 2);
        if hx = 'D8' then Result := bS.Position - 2
        else if hx = 'FF' then
        bS.Position := bS.Position-1;
      end; //if
    end; //while
  finally
    bS.Free
  end; //try
end;

procedure TfmFPCardEmployee.LoadBuildingAlarmAll(aBuildingCode: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stAlarmAreaCode : string;
begin
  GridInit(sgList,2,2,true);
  BuildingArmAreaCodeList.Clear;

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
      L_nBuildingNotPermitArmAreaCount := recordCount;
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
          cells[6,nRow] := stAlarmAreaCode;
          cells[7,nRow] := FindField('AR_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
        lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',L_nBuildingNotPermitArmAreaCount)+' ';
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFPCardEmployee.LoadBuildingDoorAll(aBuildingCode: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  GridInit(sgList,2,2,true);
  BuildingDoorCodeList.Clear;

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
      L_nBuildingNotPermitDoorCount := recordCount;
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
          cells[6,nRow] := stDoorCode;
          cells[7,nRow] := FindField('DO_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
        lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',L_nBuildingNotPermitDoorCount)+' ';
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFPCardEmployee.LoadPermitAlarm(aBuildingCode, aEmSeq: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stArmAreaCode : string;
begin
  GridInit(sg_PermitAlarm,2,2,true);
  L_nBuildingPermitArmAreaCount := 0;
  stSql := dmDBSelect.SelectTB_ArmArea_EmSeqPermit(aEmSeq);
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
        lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',L_nBuildingPermitArmAreaCount)+' ';
        Exit;
      end;
      with sg_PermitAlarm do
      begin
        nRow := 1;
        while Not Eof do
        begin
          stArmAreaCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('AR_ARMAREANO').AsString;
          if BuildingArmAreaCodeList.IndexOf(stArmAreaCode) > -1 then
          begin
            if cells[2,nRow] <> '' then
            begin
              AddRow;
              nRow := nRow + 1;
            end;
            AddCheckBox(0,nRow,False,False);
            cells[1,nRow] := FindField('AR_ARMAREANAME').AsString;
            cells[2,nRow] := FindField('ND_NODENO').AsString;
            cells[3,nRow] := FindField('DE_ECUID').AsString;
            cells[4,nRow] := FindField('DE_EXTENDID').AsString;
            cells[5,nRow] := FindField('AR_ARMAREANO').AsString;
            cells[6,nRow] := stArmAreaCode;
            cells[7,nRow] := FindField('AR_VIEWSEQ').AsString;
            //여기서 미등록 방범구역 정보 삭제...
            NotPermitArmAreaListDelete(stArmAreaCode);
            L_nBuildingPermitArmAreaCount := L_nBuildingPermitArmAreaCount + 1;
          end;
          Next;
        end;
        lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',L_nBuildingPermitArmAreaCount)+' ';
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFPCardEmployee.LoadPermitDoor(aBuildingCode, aEmSeq: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  GridInit(sg_PermitDoor,2,2,true);
  L_nBuildingPermitDoorCount := 0;
  stSql := dmDBSelect.SelectTB_Door_EmSeqPermit(aEmSeq);
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
        lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',L_nBuildingPermitDoorCount)+' ';
        Exit;
      end;
      with sg_PermitDoor do
      begin
        nRow := 1;
        while Not Eof do
        begin
          stDoorCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('DO_DOORNO').AsString;
          if BuildingDoorCodeList.IndexOf(stDoorCode) > -1 then
          begin
            if cells[2,nRow] <> '' then
            begin
              AddRow;
              nRow := nRow + 1;
            end;
            AddCheckBox(0,nRow,False,False);
            cells[1,nRow] := FindField('DO_DOORNAME').AsString;
            cells[2,nRow] := FindField('ND_NODENO').AsString;
            cells[3,nRow] := FindField('DE_ECUID').AsString;
            cells[4,nRow] := FindField('DE_EXTENDID').AsString;
            cells[5,nRow] := FindField('DO_DOORNO').AsString;
            cells[6,nRow] := stDoorCode;
            cells[7,nRow] := FindField('DO_VIEWSEQ').AsString;
            //여기서 미등록 출입문 정보 삭제...
            NotPermitDoorListDelete(stDoorCode);
            L_nBuildingPermitDoorCount := L_nBuildingPermitDoorCount + 1;
          end;
          Next;
        end;
        lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',L_nBuildingPermitDoorCount)+' ';
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFPCardEmployee.pm_EmployeeGradeAdminClick(Sender: TObject);
begin
  inherited;
  pan_emPermitAdmin.Visible := True;
  ed_emGradeSeq.Text := sg_EmployeeList.Cells[16,sg_EmployeeList.Row];
  ed_emGradeName.Text := sg_EmployeeList.Cells[6,sg_EmployeeList.Row];
  lb_emgradecaption.Caption := pm_EmployeeGradeAdmin.Caption;
  //tp_Grade.Align := alClient;
  PageControl1.ActivePageIndex := 0;
  tv_buildingNameDblClick(self);
end;

procedure TfmFPCardEmployee.NotPermitArmAreaListAdd(aArmAreaName, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aArmAreaCode, aArmAreaView: string);
var
  i : integer;
  bAdd : Boolean;
  nRow : integer;
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
  L_nBuildingNotPermitArmAreaCount := L_nBuildingNotPermitArmAreaCount + 1;
  lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',L_nBuildingNotPermitArmAreaCount)+' ';
  L_nBuildingPermitArmAreaCount := L_nBuildingPermitArmAreaCount - 1;
  lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',L_nBuildingPermitArmAreaCount)+' ';
end;

procedure TfmFPCardEmployee.NotPermitArmAreaListDelete(aArmAreaCode: string);
var
  i : integer;
begin
  with sg_NotPermitAlarm do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if Cells[6,i] = aArmAreaCode then
      begin
        if RowCount > 2 then RemoveRows(i,1)
        else GridInit(sg_NotPermitAlarm,2,2,True);
        L_nBuildingNotPermitArmAreaCount := L_nBuildingNotPermitArmAreaCount - 1;
        break;
      end;
    end;
  end;
  lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',L_nBuildingNotPermitArmAreaCount)+' ';
end;

procedure TfmFPCardEmployee.NotPermitDoorListAdd(aDoorName, aNodeNo, aEcuID,
  aExtendID, aDoorNo, aDoorCode, aDoorView: string);
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
  L_nBuildingNotPermitDoorCount := L_nBuildingNotPermitDoorCount + 1;
  lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',L_nBuildingNotPermitDoorCount)+' ';
  L_nBuildingPermitDoorCount := L_nBuildingPermitDoorCount - 1;
  lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',L_nBuildingPermitDoorCount)+' ';
end;

procedure TfmFPCardEmployee.NotPermitDoorListDelete(aDoorCode: string);
var
  i : integer;
begin
  for i := 1 to sg_NotPermitDoor.RowCount - 1 do
  begin
    if sg_NotPermitDoor.Cells[6,i] = aDoorCode then
    begin
      if sg_NotPermitDoor.RowCount > 2 then sg_NotPermitDoor.RemoveRows(i,1)
      else GridInit(sg_NotPermitDoor,2,2,True);
      L_nBuildingNotPermitDoorCount := L_nBuildingNotPermitDoorCount - 1;
      break;
    end;
  end;
  lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',L_nBuildingNotPermitDoorCount)+' ';
end;

procedure TfmFPCardEmployee.pan_AddWorkResize(Sender: TObject);
begin
  inherited;
  btn_Save.Left := (pan_AddWork.Width div 2) - btn_Save.Width - 5;
  btn_Save.Top := (pan_AddWork.Height div 2) - (btn_Save.Height div 2);
  btn_Cancel.Left := (pan_AddWork.Width div 2) + 5;
  btn_Cancel.Top := (pan_AddWork.Height div 2) - (btn_Cancel.Height div 2);
end;

procedure TfmFPCardEmployee.Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
(*    if (Button = mbLeft) and (MouseDowning = False) then
    begin
        // DRAG POINT 저장
        DragOrigin := Point (X,Y);
        // MOUSE DOWN = TRUE 설정
        MouseDowning := True;
    end;
*)
end;

procedure TfmFPCardEmployee.Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
(*  inherited;
    // MOUSE DOWN = TRUE CHECK
    if (MouseDowning = True) then
    begin
        // IMAGE TOP 위치 설정
        (Sender as TAdvSmoothPanel).Top := (Sender as TAdvSmoothPanel).Top + Y - DragOrigin.Y;
        // IMAGE LEFT 위치 설정
        (Sender as TAdvSmoothPanel).Left := (Sender as TAdvSmoothPanel).Left + X - DragOrigin.X;
    end;
 *)
end;

procedure TfmFPCardEmployee.Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = FALSE 설정
//    MouseDowning := False;
end;

procedure TfmFPCardEmployee.pan_emPermitAdminMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);

end;

procedure TfmFPCardEmployee.pan_EmployeeListResize(Sender: TObject);
begin
  inherited;
  sg_EmployeeList.Width := pan_EmployeeList.Width - sg_EmployeeList.Left - 20;
  sg_EmployeeList.Height := pan_EmployeeList.Height - sg_EmployeeList.Top - 50;

  // btn_CompanyManage.Left := ( pan_EmployeeList.Width div 2 ) - 5 - btn_CompanyManage.Width;
  // btn_GroupManage.Left  := ( pan_EmployeeList.Width div 2 ) + 5;

  btn_GroupManage.Left := sg_EmployeeList.Left + sg_EmployeeList.Width - btn_GroupManage.Width;
  btn_CompanyManage.Left  := btn_GroupManage.Left - btn_CompanyManage.Width - 10;
  btn_ValidDateManage.Left := btn_CompanyManage.Left - btn_ValidDateManage.Width - 10;

end;

procedure TfmFPCardEmployee.pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmFPCardEmployee.pan_NotPermitAlarmAreaResize(Sender: TObject);
begin
  inherited;
  sg_NotPermitAlarm.Width := pan_NotPermitAlarmArea.Width - sg_NotPermitAlarm.Left - 20;
end;

procedure TfmFPCardEmployee.pan_NotPermitDoorResize(Sender: TObject);
begin
  inherited;
  sg_NotPermitDoor.Width := pan_NotPermitDoor.Width - sg_NotPermitDoor.Left - 20;
end;

procedure TfmFPCardEmployee.pan_PermitAlarmAreaResize(Sender: TObject);
begin
  inherited;
  sg_PermitAlarm.Width := pan_PermitAlarmArea.Width - sg_PermitAlarm.Left - 20;
end;

procedure TfmFPCardEmployee.pan_PermitDoorResize(Sender: TObject);
begin
  inherited;
  sg_PermitDoor.Width := pan_PermitDoor.Width - sg_PermitDoor.Left - 20;
end;

procedure TfmFPCardEmployee.pan_PositionInfoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
(* ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
 *)
end;

procedure TfmFPCardEmployee.PermitArmAreaListAdd(aArmAreaName, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aArmAreaCode, aArmAreaView: string);
var
  i : integer;
  bAdd : Boolean;
  nRow : integer;
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
  L_nBuildingNotPermitArmAreaCount := L_nBuildingNotPermitArmAreaCount - 1;
  lb_NotPermitArmAreaCount.Caption.Text := FormatFloat('#,##0',L_nBuildingNotPermitArmAreaCount)+'';
  L_nBuildingPermitArmAreaCount := L_nBuildingPermitArmAreaCount + 1;
  lb_PermitArmAreaCount.Caption.Text := FormatFloat('#,##0',L_nBuildingPermitArmAreaCount)+'';
end;

procedure TfmFPCardEmployee.PermitDoorListAdd(aDoorName, aNodeNo, aEcuID, aExtendID,
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
  L_nBuildingNotPermitDoorCount := L_nBuildingNotPermitDoorCount - 1;
  lb_NotPermitDoorCount.Caption.Text := FormatFloat('#,##0',L_nBuildingNotPermitDoorCount)+'';
  L_nBuildingPermitDoorCount := L_nBuildingPermitDoorCount + 1;
  lb_PermitDoorCount.Caption.Text := FormatFloat('#,##0',L_nBuildingPermitDoorCount)+'';
end;

procedure TfmFPCardEmployee.pm_EmDeleteClick(Sender: TObject);
var
  stMessage : string;
  stEmSeq : string;
  stSql : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage(dmFormMessage.GetMessage('NOTSELECTEMPLOYEE'));
    Exit;
  end;
  stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',pm_EmDelete.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  Try
    pan_progress.Visible := True;
    with sg_EmployeeList do
    begin
      ProgressBar1.Max := RowCount - 1;
      ProgressBar1.Position := 0;
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          stEmSeq := Cells[16,i];
          if isDigit(stEmSeq) then
          begin
            if dmDBFunction.GetTB_CARD_CardCount(stEmSeq) > 1 then
            begin
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(cells[32,Row]);
              dmDBUpdate.UpdateTB_FINGERDEVICECARD_CardStop(cells[32,Row]);
              dmDBDelete.DeleteTB_CARD_Key(cells[32,Row]);
            end else
            begin
              dmDBCardPermit.EmployeePermitAllDelete(stEmSeq); //사원 전체권한 삭제
              //dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_ACUSE','0');
              //dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_ATUSE','0');
              //dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_FDUSE','0');
              dmDBDelete.DeleteTB_EMPLOYEE_EmSeq(stEmSeq);
              dmDBDelete.DeleteTB_EMPLOYEEDEVICETIMECODE_EmSeq(stEmSeq);
              dmDBDelete.DeleteTB_EMPLOYEEFINGER_EmSeq(stEmSeq);
              dmDBUpdate.UpdateTB_FINGERDEVICECARD_EmSeqStop(stEmSeq);
              dmDBDelete.DeleteTB_CARD_EmSeq(stEmSeq);

              dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);
            end;
          end;
        end;
        ProgressBar1.Position := i;
        lb_ProgressCount.Caption.Text := inttostr(i) + '/' + inttostr(Rowcount - 1);
        Application.ProcessMessages;
      end;
    end;
    fmMain.FORMCARDDOWNLOADExecute;

  Finally
    pan_progress.Visible := False;
  End;
  SearchEmployeeList('');
(*var
  stMessage : string;
  stEmSeq : string;
  stSql : string;
begin
  inherited;
  with sg_EmployeeList do
  begin
    if Cells[16,Row] = '' then Exit;
    stEmSeq := Cells[16,Row];
  end;
  stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',pm_EmDelete.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  dmDBCardPermit.EmployeePermitAllDelete(stEmSeq); //사원 전체권한 삭제
  dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_ACUSE','0');
  dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_ATUSE','0');
  dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_FDUSE','0');
  dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);
  SearchEmployeeList('');
  *)
end;

procedure TfmFPCardEmployee.pm_EmployeeAddClick(Sender: TObject);
var
  stMessage : string;
  nIndex : integer;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_EmployeeAdd.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  employeePanelClear;
  Pan_Emcode.Visible := True;
  lb_EmployeeCaption.Caption := pm_EmployeeAdd.Caption;
  ed_SelectCompanyCode.Text := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  LoadPosiCode(copy(ed_SelectCompanyCode.Text,1,1+G_nCompanyCodeLength) ,PosiCodeList,cmb_PosiName);
  ed_CompanyName.Text := tv_List.Selected.Text;
  cmb_EmCardGradeType.ItemIndex := G_nCardDefaultGroupType - 1;
  if chk_AddAutoEmpCode.Checked then
    ed_EmCode.Text := dmDBFunction.GetNextTB_EMPLOYEE_EmployeeCode;
  if cmb_CardGubun.Items.Count > 0 then cmb_CardGubun.ItemIndex := 0;

  nIndex := EmployeeStateCodeList.IndexOf('1');
  if nIndex < 0 then  nIndex := 0;

  cmb_EmState.ItemIndex := nIndex;

  L_stWork := 'EMPLOYEEADD';
end;

procedure TfmFPCardEmployee.pm_EmUpdateClick(Sender: TObject);
var
  stMessage : string;
  nIndex : integer;
  stTemp : string;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stDate : string;
  stEmCodeImage : string;
begin
  inherited;
  if sg_EmployeeList.Cells[16,sg_EmployeeList.Row] = '' then Exit;
  employeePanelClear;
  Pan_Emcode.Visible := True;
  lb_EmployeeCaption.Caption := pm_EmUpdate.Caption;
  with sg_EmployeeList do
  begin
    ed_emSeq.Text := Cells[16,Row];
    ed_SelectCompanyCode.Text := Cells[17,Row];
    LoadPosiCode(copy(ed_SelectCompanyCode.Text,1,1+G_nCompanyCodeLength) ,PosiCodeList,cmb_PosiName);
    if isDigit(cells[21,Row]) then  cmb_EmCardGradeType.ItemIndex := strtoint(cells[21,Row]) - 1;
    if cmb_EmCardGradeType.ItemIndex = 1 then gb_EmployeeGroup.Visible := True
    else gb_EmployeeGroup.Visible := False;
    ed_CompanyName.Text := Cells[3,Row];
    ed_EmCode.Text := Cells[5,Row];
    ed_OldEmCode.Text := Cells[5,Row];
    ed_Name.Text := Cells[6,Row];
    nIndex := PosiCodeList.IndexOf(cells[18,Row]);
    cmb_PosiName.ItemIndex := nIndex;
    nIndex := EmployeeGubunCodeList.IndexOf(cells[19,Row]);
    cmb_EmpGubun.ItemIndex := nIndex;
    ed_Handphone.Text := Cells[8,Row];
    ed_CompanyPhone.Text := Cells[9,Row];
    ed_EtcInfo.Text := cells[10,Row];
    stDate := Cells[11,Row];
    stDate := stringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := stringReplace(stDate,':','',[rfReplaceAll]);
    stDate := stringReplace(stDate,'','',[rfReplaceAll]);
    if isDate(stDate) then
       dt_Indate.Date :=  EncodeDateTime(strtoint(copy(stDate,1,4)),
                                             strtoint(copy(stDate,5,2)),
                                             strtoint(copy(stDate,7,2)),
                                             0,0,0,0)
       //strtoDate(MakeDatetimeStr(Cells[8,Row]))
    else dt_Indate.Date := now;

    stDate := Cells[12,Row];
    stDate := stringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := stringReplace(stDate,':','',[rfReplaceAll]);
    stDate := stringReplace(stDate,'','',[rfReplaceAll]);
    if isDate(stDate) then
       dt_OutDate.Date := EncodeDateTime(strtoint(copy(stDate,1,4)),
                                             strtoint(copy(stDate,5,2)),
                                             strtoint(copy(stDate,7,2)),
                                             0,0,0,0)
                                             //strtoDate(MakeDatetimeStr(Cells[9,Row]))
    else dt_OutDate.Date := strtoDate('9999-12-31');
    if Cells[13,Row] = '1' then chk_Attend.Checked := True
    else chk_Attend.Checked := False;
    if Cells[14,Row] = '1' then chk_Food.Checked := True
    else chk_Food.Checked := False;
    ed_CardGroupName.Text := cells[15,Row];
    ed_CardGroupCode.Text := cells[20,Row];

 {   if cells[19,Row] = '1' then
    begin
      rg_TimeGroup.ItemIndex := strtoint(Cells[20,Row]) + 1;
    end else
    begin
      rg_TimeGroup.ItemIndex := 0;
    end;
    rg_TimeGroupClick(Self);
    if Cells[21,Row] = '1' then chk_TimeGroup.Checked[0] := True
    else chk_TimeGroup.Checked[0] := False;
    if Cells[22,Row] = '1' then chk_TimeGroup.Checked[1] := True
    else chk_TimeGroup.Checked[1] := False;
    if Cells[23,Row] = '1' then chk_TimeGroup.Checked[2] := True
    else chk_TimeGroup.Checked[2] := False;
    if Cells[24,Row] = '1' then chk_TimeGroup.Checked[3] := True
    else chk_TimeGroup.Checked[3] := False;

    stTemp := cells[25,Row];
    if stTemp <> '' then
    begin
      if stTemp[7] = '1' then chk_WeekGroup.Checked[0] := True
      else chk_WeekGroup.Checked[0] := False;
      if stTemp[6] = '1' then chk_WeekGroup.Checked[1] := True
      else chk_WeekGroup.Checked[1] := False;
      if stTemp[5] = '1' then chk_WeekGroup.Checked[2] := True
      else chk_WeekGroup.Checked[2] := False;
      if stTemp[4] = '1' then chk_WeekGroup.Checked[3] := True
      else chk_WeekGroup.Checked[3] := False;
      if stTemp[3] = '1' then chk_WeekGroup.Checked[4] := True
      else chk_WeekGroup.Checked[4] := False;
      if stTemp[2] = '1' then chk_WeekGroup.Checked[5] := True
      else chk_WeekGroup.Checked[5] := False;
      if stTemp[1] = '1' then chk_WeekGroup.Checked[6] := True
      else chk_WeekGroup.Checked[6] := False;
    end;   }
    if Cells[29,Row] = '1' then chk_FingerUse.Checked := True
    else chk_FingerUse.Checked := False;

    nIndex := EmployeeStateCodeList.IndexOf(Cells[30,Row]);
    cmb_EmState.ItemIndex := nIndex;
    L_nUpdateEmStateIndex := nIndex;
    nIndex := AttendWorkTypeCodeList.IndexOf(Cells[31,Row]);

    ed_RegCardNo.Text := Cells[32,Row];
    L_stSelectCardNo := Cells[32,Row];

    cmb_AWCode.ItemIndex := nIndex;
  end;
  //여기서 이미지 로딩 하자.
  if (G_nSystmRelayUse = 1) and (G_nSystmRelayCustomerNo = 2) then
  begin
    stEmCodeImage := 'P:\' + ed_EmCode.Text + '.bmp';
    stEmCodeImage := StringReplace(stEmCodeImage,'-','',[rfReplaceAll]);
  end;
  if FileExists(stEmCodeImage) then
  begin
    Try
      Image1.Picture.LoadFromFile(stEmCodeImage);
    Except
      CopyFile(PChar(stEmCodeImage), PChar(G_stExeFolder + '\Temp\' + ed_EmCode.Text + '.jpg'), False);
      Image1.Picture.LoadFromFile(G_stExeFolder + '\Temp\' + ed_EmCode.Text + '.jpg');
    End;
  end else
  begin
    Try
      MapJpg := TJpegImage.Create;
      MapStream := TMemoryStream.Create;
      if G_nDBType = POSTGRESQL then
      begin
        DeleteFile(G_stExeFolder + '\1.jpg');
        stSql := ' SELECT lo_export(TB_EMPLOYEE.EM_IMAGE, ' + G_stExeFolder + '\1.jpg' + ') From TB_EMPLOYEE ' ;
        stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
        stSql := stSql + ' AND EM_SEQ = ' + ed_emSeq.Text + ' ';
      end else
      begin
        stSql := ' select * from TB_EMPLOYEE ' ;
        stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
        stSql := stSql + ' AND EM_SEQ = ' + ed_emSeq.Text + ' ';
      end;

      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

        if RecordCount > 0 then
        begin
          if Not FindField('EM_IMAGE').IsNull then
          begin
            if G_nDBType = POSTGRESQL then
            begin
              if FileExists(G_stExeFolder + '\1.jpg') then
                Image1.Picture.LoadFromFile(G_stExeFolder + '\1.jpg');
            end else
            begin
              JPEGLoadFromDB(FieldByName('EM_IMAGE'), Image1);
            end;

          end;
        end;
      end;
    Finally
      TempAdoQuery.Free;
      CoUninitialize;
      MapJpg.Free;
      MapStream.Free;
    End;
  end;
  //여기서 카드 데이터 로딩 하자.
  chk_AddAutoEmpCode.Enabled := False;
  L_stWork := 'EMPLOYEEUPDATE';
  ed_CompanyName.SetFocus;
end;

procedure TfmFPCardEmployee.pm_GroupPermitClick(Sender: TObject);
begin
  inherited;
  dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(sg_EmployeeList.Cells[16,sg_EmployeeList.Row],'EM_GRADETYPE','1'); //원래 그룹으로 환원 시킴
  dmDBCardPermit.EmployeeGradeChange_Process(sg_EmployeeList.Cells[16,sg_EmployeeList.Row],sg_EmployeeList.cells[17,sg_EmployeeList.Row],sg_EmployeeList.cells[18,sg_EmployeeList.Row],'1');   //권한재작업
  dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(sg_EmployeeList.Cells[16,sg_EmployeeList.Row],con_ComWorkType_UPDATE); //변경이력 남기자.
  SearchEmployeeList(sg_EmployeeList.Cells[16,sg_EmployeeList.Row]);
end;

procedure TfmFPCardEmployee.RegistTempDB(G_stCardRegisterIP: string);
var
  stSql : string;
begin
  stSql := ' Delete From TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''TEMP'' ';
  stSql := stSql + ' and CO_CONFIGCODE = ''FINGERIP'' ';
  dmDataBase.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_CONFIG( CO_CONFIGGROUP,CO_CONFIGCODE,CO_CONFIGVALUE ) ';
  stSql := stSql + ' Values(''TEMP'',''FINGERIP'','''+ G_stCardRegisterIP + ''')';
  dmDataBase.ProcessExecSQL(stSql);

end;

(*
procedure TfmEmployee.SearchCompanyList(aCode: string);
var
  aTreeView,aTreeView1 : TTreeview;
  vTreeView,vTreeView1 : TTreeview;
  aNode,bNode,cNode : TTreeNode;
  aNode1,bNode1,cNode1 : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  vdNode1,vdNode2,vdNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
  stEmployeeAllCode : string;
begin
  aTreeView := tv_List;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := tv_Code;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  aTreeView1 := tv_AddCompanyName;
  aTreeView1.ReadOnly:= True;
  aTreeView1.Items.Clear;
  vTreeView1 := tv_AddCompanyCode;
  vTreeView1.ReadOnly := True;
  vTreeView1.Items.Clear;


  stSql := ' Select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_CODEUSE = ''1'' ';
  stSql := stSql + ' Order by CO_DEEPSEQ,CO_VIEWSEQ ';
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
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        if FindField('CO_DEEPSEQ').AsInteger = 0 then
        begin
          aNode := aTreeView.Items.Add(nil,FindField('CO_COMPANYNAME').AsString);
          vTreeView.Items.AddChild(nil,FindField('CO_COMPANYCODE').AsString);
          aNode.Expanded := True;

          aNode1 := aTreeView1.Items.Add(nil,FindField('CO_COMPANYNAME').AsString);
          vTreeView1.Items.AddChild(nil,FindField('CO_COMPANYCODE').AsString);
          aNode1.Expanded := True;
        end else
        begin
          nDeepSeq := FindField('CO_DEEPSEQ').AsInteger;
          stParentCode := copy(FindField('CO_COMPANYCODE').AsString,1,1 + ((nDeepSeq - 1) * G_nCompanyCodeLength) );
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,FindField('CO_COMPANYNAME').AsString);
              cNode.ImageIndex := con_LocalCompanyImageIndex;
              cNode.SelectedIndex := con_LocalCompanyImageIndex;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then
            begin
              vNode3:= vTreeView.Items.AddChild(vNode2,FindField('CO_COMPANYCODE').AsString);
            end;
            bNode.Expanded := True;
            vNode1.Expanded := True;
            if aCode = FindField('CO_COMPANYCODE').AsString  then
            begin
              if cNode <> nil then cNode.Selected := True;
            end;

          end;
          vdNode1:= GetNodeByText(vTreeView1,stParentCode,True);
          if vdNode1 <> nil then
          begin
            bNode1 := aTreeView1.Items.Item[vdNode1.AbsoluteIndex];
            if bNode1 <> nil then
            begin
              cNode1:= aTreeView1.Items.AddChild(bNode1,FindField('CO_COMPANYNAME').AsString);
              cNode1.ImageIndex := con_LocalCompanyImageIndex;
              cNode1.SelectedIndex := con_LocalCompanyImageIndex;
            end;
            vdNode2:= vTreeView1.Items.Item[vdNode1.AbsoluteIndex];
            if vdNode2 <> nil then
            begin
              vdNode3:= vTreeView1.Items.AddChild(vdNode2,FindField('CO_COMPANYCODE').AsString);
            end;
            bNode1.Expanded := True;
            vdNode1.Expanded := True;
          end;
        end;
        Next;
      end;
      Exit; //트리 구조에는 소속 정보만 넣자
      if G_nEmployeeSearchType <> 1 then Exit;
      stSql := ' Select * from TB_EMPLOYEE ';
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' Order by EM_NAME ';
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
        stParentCode := FindField('CO_COMPANYCODE').AsString;
        if Trim(stParentCode) = '' then stParentCode := '0';
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,FindField('EM_NAME').AsString);
            cNode.ImageIndex := con_LocalEmployeeImageIndex;
            cNode.SelectedIndex := con_LocalEmployeeImageIndex;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            stEmployeeAllCode := 'E' + FindField('EM_SEQ').AsString;
            vNode3:= vTreeView.Items.AddChild(vNode2,stEmployeeAllCode);
          end;
          bNode.Expanded := True;
          vNode1.Expanded := True;
          if aCode = stEmployeeAllCode  then
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

procedure TfmFPCardEmployee.SearchEmGroupList(aCode: string);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  adTreeView : TTreeview;
  vdTreeView : TTreeview;
  aNode,bNode,cNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  adNode,bdNode,cdNode : TTreeNode;
  vdNode1,vdNode2,vdNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
  stEmployeeAllCode : string;
begin
  aTreeView := tv_AddEmGroupName;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := tv_AddEmGroupCode;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  adTreeView := tv_EmGroup;
  adTreeView.ReadOnly:= True;
  adTreeView.Items.Clear;
  vdTreeView := tv_EmGroupCode;
  vdTreeView.ReadOnly := True;
  vdTreeView.Items.Clear;


  stSql := ' Select * from TB_EMPLOYEEGROUPCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_CODEUSE = ''1'' ';
  stSql := stSql + ' Order by EM_DEEPSEQ,EM_VIEWSEQ ';
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
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        if FindField('EM_DEEPSEQ').AsInteger = 0 then
        begin
          aNode := aTreeView.Items.Add(nil,FindField('EM_GROUPCODENAME').AsString);
          aNode.ImageIndex := con_LocalEmployeeImageIndex;
          aNode.SelectedIndex := con_LocalEmployeeImageIndex;
          vTreeView.Items.AddChild(nil,FindField('EM_GROUPCODE').AsString);
          aNode.Expanded := True;

          adNode := adTreeView.Items.Add(nil,FindField('EM_GROUPCODENAME').AsString);
          adNode.ImageIndex := con_LocalEmployeeImageIndex;
          adNode.SelectedIndex := con_LocalEmployeeImageIndex;
          vdTreeView.Items.AddChild(nil,FindField('EM_GROUPCODE').AsString);
          adNode.Expanded := True;
        end else
        begin
          nDeepSeq := FindField('EM_DEEPSEQ').AsInteger;
          stParentCode := copy(FindField('EM_GROUPCODE').AsString,1,1 + ((nDeepSeq - 1) * G_nEmployeeGroupLength) );
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,FindField('EM_GROUPCODENAME').AsString);
              cNode.ImageIndex := con_LocalEmployeeImageIndex;
              cNode.SelectedIndex := con_LocalEmployeeImageIndex;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then
            begin
              vNode3:= vTreeView.Items.AddChild(vNode2,FindField('EM_GROUPCODE').AsString);
            end;
            bNode.Expanded := True;
            vNode1.Expanded := True;
            if aCode = FindField('EM_GROUPCODE').AsString  then
            begin
              if cNode <> nil then cNode.Selected := True;
            end;
          end;
          vdNode1:= GetNodeByText(vdTreeView,stParentCode,True);
          if vdNode1 <> nil then
          begin
            bdNode := adTreeView.Items.Item[vdNode1.AbsoluteIndex];
            if bdNode <> nil then
            begin
              cdNode:= aTreeView.Items.AddChild(bdNode,FindField('EM_GROUPCODENAME').AsString);
              cdNode.ImageIndex := con_LocalEmployeeImageIndex;
              cdNode.SelectedIndex := con_LocalEmployeeImageIndex;
            end;
            vdNode2:= vdTreeView.Items.Item[vdNode1.AbsoluteIndex];
            if vdNode2 <> nil then
            begin
              vdNode3:= vdTreeView.Items.AddChild(vdNode2,FindField('EM_GROUPCODE').AsString);
            end;
            bdNode.Expanded := True;
            vdNode1.Expanded := True;
            if aCode = FindField('EM_GROUPCODE').AsString  then
            begin
              if cdNode <> nil then cdNode.Selected := True;
            end;
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
*)

procedure TfmFPCardEmployee.SearchEmployeeList(aCode: string; aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stCompanyCode : string;
  stPosiCode : string;
  stEmployeeGubun : string;
  stEmCode : string;
  stEmName : string;
  stEmHandPhone : string;
  stEmCompanyPhone : string;
  stEtcInfo : string;
  stCardNo : string;
begin
  L_bSearchEnd := False;
  btn_Excel.Enabled := False;
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

  GridInit(sg_EmployeeList,19,2,True);

  stCompanyCode := ed_SerchSelectCompanyCode.Text;
  if stCompanyCode = '' then stCompanyCode := '0';

  stPosiCode := '';
  if cmb_PositionSearch.ItemIndex > 0 then stPosiCode := PosiSearchCodeList.Strings[cmb_PositionSearch.ItemIndex];

  stEmployeeGubun := '';
  if cmb_EmpGubunSearch.ItemIndex > 0 then stEmployeeGubun := EmployeeGubunSearchCodeList.Strings[cmb_EmpGubunSearch.ItemIndex];

  stEmCode := '';
  if cmb_EtcSearch.Text = L_stEmCodeCaption  then stEmCode := ed_etcSearch.Text;

  stEmName := '';
  if cmb_EtcSearch.Text = L_stEmNameCaption  then stEmName := ed_etcSearch.Text;

  stEmHandPhone := '';
  if cmb_EtcSearch.Text = L_stEmHandPhoneCaption  then stEmHandPhone := ed_etcSearch.Text;

  stEmCompanyPhone := '';
  if cmb_EtcSearch.Text = L_stEmCompanyPhoneCaption  then stEmCompanyPhone := ed_etcSearch.Text;

  stEtcInfo := '';
  if cmb_EtcSearch.Text = L_stEmEtcCaption  then stEtcInfo := ed_etcSearch.Text;

  stCardNo := '';
  if cmb_EtcSearch.Text = L_stCardNoCaption  then stCardNo := ed_etcSearch.Text;

  if G_nBMSType = 2 then
    stSql := dmDBSelect.SelectTB_EMPLOYE_Value(stCompanyCode,stPosiCode,'',stEmCode,stEmName,stEmployeeGubun,stEmHandPhone,stEmCompanyPhone,stEtcInfo,'','','1','','',True,'','',stCardNo)  //출입타입
  else if G_nBMSType = 3 then
    stSql := dmDBSelect.SelectTB_EMPLOYE_Value(stCompanyCode,stPosiCode,'',stEmCode,stEmName,stEmployeeGubun,stEmHandPhone,stEmCompanyPhone,stEtcInfo,'','','','1','',True,'','',stCardNo)  //근태타입
  else if G_nBMSType = 4 then
    stSql := dmDBSelect.SelectTB_EMPLOYE_Value(stCompanyCode,stPosiCode,'',stEmCode,stEmName,stEmployeeGubun,stEmHandPhone,stEmCompanyPhone,stEtcInfo,'','','','','1',True,'','',stCardNo)  //식수타입
  ;
  Try
    FormSearchEnable(False);
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
      lb_SearchCount.Caption.Text := FormatFloat('#,##0',recordCount);
      if recordcount < 1 then Exit;

      btn_Excel.Enabled := True;
      if Not FileExists(G_stExeFolder + '\Excel-a.png') then
      begin
        ExcelEnImage.Picture.SaveToFile(G_stExeFolder + '\Excel-a.png');
      end;
      btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-a.png');

      pan_Message.Visible := True;
      AdvProgressBar1.Max := recordcount;
      AdvProgressBar1.Position := 0;

      with sg_EmployeeList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          if L_bSearchEnd then Exit;
          AddCheckBox(0,nRow,False,False);

          cells[0,nRow] := '  ' + FindField('COMPANYNAME1').AsString;
          cells[1,nRow] := FindField('COMPANYNAME2').AsString;
          cells[2,nRow] := FindField('COMPANYNAME3').AsString;
          cells[3,nRow] := FindField('CO_COMPANYNAME').AsString;
          cells[4,nRow] := FindField('PO_POSICODENAME').AsString;
          cells[5,nRow] := FindField('EM_CODE').AsString;
          cells[6,nRow] := FindField('EM_NAME').AsString;
          cells[7,nRow] := FindField('EM_GUBUNCODENAME').AsString;
          cells[8,nRow] := FindField('EM_HANDPHONE').AsString;
          cells[9,nRow] := FindField('EM_COMPANYPHONE').AsString;
          cells[10,nRow] := FindField('EM_EMINFO').AsString;
          cells[11,nRow] := FindField('EM_REGDATE').AsString;
          cells[12,nRow] := FindField('EM_ENDDATE').AsString;
          cells[13,nRow] := FindField('EM_ATUSE').AsString;
          cells[14,nRow] := FindField('EM_FDUSE').AsString;
          cells[15,nRow] := FindField('EM_GROUPCODENAME').AsString;
          cells[16,nRow] := FindField('EM_SEQ').AsString;
          cells[17,nRow] := FindField('CO_COMPANYCODE').AsString;
          cells[18,nRow] := FindField('PO_POSICODE').AsString;
          cells[19,nRow] := FindField('EM_GUBUNCODE').AsString;
          cells[20,nRow] := FindField('EM_GROUPCODE').AsString;
          cells[21,nRow] := FindField('EM_GRADETYPE').AsString;
{          cells[19,nRow] := FindField('EM_TIMECODEUSE').AsString;
          cells[20,nRow] := FindField('TC_GROUP').AsString;
          cells[21,nRow] := FindField('TC_TIME1').AsString;
          cells[22,nRow] := FindField('TC_TIME2').AsString;
          cells[23,nRow] := FindField('TC_TIME3').AsString;
          cells[24,nRow] := FindField('TC_TIME4').AsString;
          cells[25,nRow] := FindField('TC_WEEKCODE').AsString;   }
          cells[29,nRow] := FindField('EM_FINGERUSE').AsString;
          cells[30,nRow] := FindField('EM_STATECODE').AsString;
          cells[31,nRow] := FindField('AW_CODE').AsString;
          //if chk_IncludeCardNum.Checked then
             cells[32,nRow] := FindField('CA_CARDNO').AsString;
          if FindField('EM_SEQ').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;
(*          if FindField('EM_GRADETYPE').AsString = '3' then RowColor[nRow] := G_nColorEmployee //$00EACAB6     //개인별
          else if FindField('EM_GRADETYPE').AsString = '2' then RowColor[nRow] := G_nColorEmGroup //$00EACAB6  //그룹별
          else RowColor[nRow] := G_nColorCompany; *)
          if FindField('EM_CARDUSE').AsString <> '1' then RowColor[nRow] := G_nColorEmployee //$00EACAB6     //개인별
          else if FindField('EM_FINGERUSE').AsString <> '1' then RowColor[nRow] := G_nColorEmGroup //$00EACAB6  //그룹별
          else RowColor[nRow] := G_nColorCompany;

          if FindField('EM_STATECODE').AsString <> '1' then RowColor[nRow] := clRed; //퇴사 또는 휴직 처리 된 인원


          nRow := nRow + 1;
          AdvProgressBar1.Position := nRow;
          Application.ProcessMessages;
          Next;
        end;
        if aTopRow = 0 then
        begin
          if Row > (L_nPageListMaxCount - 1) then TopRow := Row - L_nPageListMaxCount;
        end else
        begin
          TopRow := aTopRow;
        end;
        //if chk_IncludeCardNum.Checked then
        sg_EmployeeList.ColWidths[32] := 120;
      end;

    end;
  Finally
    pan_Message.Visible := False;
    FormSearchEnable(True);
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;
(*
procedure TfmFPCardEmployee.SearchMEmGroupList(aCode: string);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
  stEmployeeAllCode : string;
begin
  aTreeView := tv_EmGroup;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := tv_EmGroupCode;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;


  stSql := ' Select * from TB_EMPLOYEEGROUPCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_CODEUSE = ''1'' ';
  stSql := stSql + ' Order by EM_DEEPSEQ,EM_VIEWSEQ ';
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
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        if FindField('EM_DEEPSEQ').AsInteger = 0 then
        begin
          aNode := aTreeView.Items.Add(nil,FindField('EM_GROUPCODENAME').AsString);
          aNode.ImageIndex := con_LocalEmployeeImageIndex;
          aNode.SelectedIndex := con_LocalEmployeeImageIndex;
          vTreeView.Items.AddChild(nil,FindField('EM_GROUPCODE').AsString);
          aNode.Expanded := True;

        end else
        begin
          nDeepSeq := FindField('EM_DEEPSEQ').AsInteger;
          stParentCode := copy(FindField('EM_GROUPCODE').AsString,1,1 + ((nDeepSeq - 1) * G_nEmployeeGroupLength) );
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,FindField('EM_GROUPCODENAME').AsString);
              cNode.ImageIndex := con_LocalEmployeeImageIndex;
              cNode.SelectedIndex := con_LocalEmployeeImageIndex;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then
            begin
              vNode3:= vTreeView.Items.AddChild(vNode2,FindField('EM_GROUPCODE').AsString);
            end;
            bNode.Expanded := True;
            vNode1.Expanded := True;
            if aCode = FindField('EM_GROUPCODE').AsString  then
            begin
              if cNode <> nil then cNode.Selected := True;
            end;
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
  tv_EmGroup.SetFocus;
end;
*)

procedure TfmFPCardEmployee.SearhAddEmployee(aEmSeq: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
begin
  employeePanelClear;
  stSql := dmDBSelect.SelectTB_EMPLOYE_Value('','',aEmseq,'','','','','','','','','','','');
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
      ed_emSeq.Text := FindField('EM_SEQ').AsString;
      ed_SelectCompanyCode.Text := FindField('CO_COMPANYCODE').AsString;
      ed_OldEmCode.Text := FindField('EM_CODE').AsString;
      if isDigit(FindField('EM_GRADETYPE').AsString) then cmb_EmCardGradeType.ItemIndex := strtoint(FindField('EM_GRADETYPE').AsString) - 1
      else cmb_EmCardGradeType.ItemIndex := 0;
      if cmb_EmCardGradeType.ItemIndex = 1 then gb_EmployeeGroup.Visible := True
      else gb_EmployeeGroup.Visible := False;
      ed_CompanyName.Text := FindField('CO_COMPANYNAME').AsString;
      ed_EmCode.Text := FindField('EM_CODE').AsString;
      ed_Name.Text :=  FindField('EM_NAME').AsString;
      cmb_PosiName.ItemIndex := PosiCodeList.IndexOf(FindField('PO_POSICODE').AsString);
      cmb_EmpGubun.ItemIndex := EmployeeGubunCodeList.IndexOf(FindField('EM_GUBUNCODE').AsString);
      ed_Handphone.Text := FindField('EM_HANDPHONE').AsString;
      ed_CompanyPhone.Text := FindField('EM_COMPANYPHONE').AsString;
      ed_EtcInfo.Text := FindField('EM_EMINFO').AsString;
      dt_Indate.Date := strtoDate(MakeDatetimeStr(FindField('EM_REGDATE').AsString));
      dt_OutDate.Date := strtoDate(MakeDatetimeStr(FindField('EM_ENDDATE').AsString));
      if FindField('EM_ATUSE').AsString = '1' then chk_Attend.Checked := True
      else chk_Attend.Checked := False;
      if FindField('EM_FDUSE').AsString = '1' then chk_Food.Checked := True
      else chk_Food.Checked := False;
      ed_CardGroupName.Text := FindField('EM_GROUPCODENAME').AsString;
      ed_CardGroupCode.Text := FindField('EM_GROUPCODE').AsString;
{      if FindField('EM_TIMECODEUSE').AsString = '1' then
      begin
        rg_TimeGroup.ItemIndex := strtoint(FindField('TC_GROUP').AsString) + 1;
      end else
      begin
        rg_TimeGroup.ItemIndex := 0;
      end;
      rg_TimeGroupClick(Self);
      if FindField('TC_TIME1').AsString = '1' then chk_TimeGroup.Checked[0] := True
      else chk_TimeGroup.Checked[0] := False;
      if FindField('TC_TIME2').AsString = '1' then chk_TimeGroup.Checked[1] := True
      else chk_TimeGroup.Checked[1] := False;
      if FindField('TC_TIME3').AsString = '1' then chk_TimeGroup.Checked[2] := True
      else chk_TimeGroup.Checked[2] := False;
      if FindField('TC_TIME4').AsString = '1' then chk_TimeGroup.Checked[3] := True
      else chk_TimeGroup.Checked[3] := False;

      stTemp := FindField('TC_WEEKCODE').AsString;
      if stTemp <> '' then
      begin
        if stTemp[7] = '1' then chk_WeekGroup.Checked[0] := True
        else chk_WeekGroup.Checked[0] := False;
        if stTemp[6] = '1' then chk_WeekGroup.Checked[1] := True
        else chk_WeekGroup.Checked[1] := False;
        if stTemp[5] = '1' then chk_WeekGroup.Checked[2] := True
        else chk_WeekGroup.Checked[2] := False;
        if stTemp[4] = '1' then chk_WeekGroup.Checked[3] := True
        else chk_WeekGroup.Checked[3] := False;
        if stTemp[3] = '1' then chk_WeekGroup.Checked[4] := True
        else chk_WeekGroup.Checked[4] := False;
        if stTemp[2] = '1' then chk_WeekGroup.Checked[5] := True
        else chk_WeekGroup.Checked[5] := False;
        if stTemp[1] = '1' then chk_WeekGroup.Checked[6] := True
        else chk_WeekGroup.Checked[6] := False;
      end;  }
      //여기서 이미지 로딩 하자.
      Try
        MapJpg := TJpegImage.Create;
        MapStream := TMemoryStream.Create;
        if G_nDBType = POSTGRESQL then
        begin
          DeleteFile(G_stExeFolder + '\1.jpg');
          stSql := ' SELECT lo_export(TB_EMPLOYEE.EM_IMAGE, ' + G_stExeFolder + '\1.jpg' + ') From TB_EMPLOYEE ' ;
          stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
          stSql := stSql + ' AND EM_SEQ = ' + ed_emSeq.Text + ' ';
        end else
        begin
          stSql := ' select * from TB_EMPLOYEE ' ;
          stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
          stSql := stSql + ' AND EM_SEQ = ' + ed_emSeq.Text + ' ';
        end;

        with TempAdoQuery do
        begin
          Close;
          Sql.Clear;
          Sql.Text := stSql;
          Try
            Open;
          Except
            Exit;
          End;

          if RecordCount > 0 then
          begin
            if Not FindField('EM_IMAGE').IsNull then
            begin
              if G_nDBType = POSTGRESQL then
              begin
                if FileExists(G_stExeFolder + '\1.jpg') then
                  Image1.Picture.LoadFromFile(G_stExeFolder + '\1.jpg');
              end else
              begin
                JPEGLoadFromDB(FieldByName('EM_IMAGE'), Image1);
              end;
            end;
          end;
        end;
      Finally

      End;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFPCardEmployee.sg_CardCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;

end;

procedure TfmFPCardEmployee.sg_EmployeeListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nEmployeeCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nEmployeeCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nEmployeeCheckCount := L_nEmployeeCheckCount + 1
    else L_nEmployeeCheckCount := L_nEmployeeCheckCount - 1 ;
  end;

end;

procedure TfmFPCardEmployee.sg_EmployeeListClick(Sender: TObject);
begin
  inherited;
  with sg_EmployeeList do
  begin
    if Cells[21,Row] = '3' then  pm_GroupPermit.Visible := True //개별 권한 이면
    else pm_GroupPermit.Visible := False;
  end;
end;

procedure TfmFPCardEmployee.sg_EmployeeListDblClick(Sender: TObject);
begin
  inherited;
  pm_EmUpdateClick(self);
end;

procedure TfmFPCardEmployee.sg_EmployeeListResize(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := sg_EmployeeList.Height div sg_EmployeeList.DefaultRowHeight;
end;

procedure TfmFPCardEmployee.sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmFPCardEmployee.sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmFPCardEmployee.sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmFPCardEmployee.sg_PermitDoorCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmFPCardEmployee.SKGasCardMapping(aFile: string);
var
  CardList : TStringList;
  i : integer;
  stEmCode : string;
  stCardNo : string;
  stCardType,stCardEmSeq,stCardEmCode,stEmName : string;
  stEmSeq : string;
  stPositionNum : string;
  stRelayID : string;
  stCompanyCode,stEmGroupCode,stCardGroupType : string;
begin
  CardList := TStringList.Create;
  CardList.LoadFromFile(aFile);
  ProgressBar2.Max := CardList.Count - 1;
  for i := 0 to CardList.Count - 1 do
  begin
    ProgressBar2.Position := i;
    stEmCode := FindCharCopy(CardList.Strings[i],0,',');
    stCardNo := FindCharCopy(CardList.Strings[i],1,',');
    if dmDBFunction.CheckTB_CARD_CARDNO(stCardNo,stCardType,stCardEmSeq,stCardEmCode,stEmName) = 0  then
    begin
      dmDBFunction.GetTB_EMPLOYEE_EmSeq(stEmCode,stEmSeq,stCompanyCode,stEmGroupCode,stCardGroupType);
      if isDigit(stEmSeq) then
      begin
        stPositionNum := dmDBFunction.GetNextTB_CARD_PositionNum;
        stRelayID := dmDBFunction.GetNextTB_CARD_RelayID;
        dmDBInsert.InsertIntoTB_CARD_Value(stCardNo,'1','1',stPositionNum,stRelayID,'0',stEmSeq);
        dmDBInsert.InsertIntoTB_CARDHIS_CopyCard(stCardNo,stCardNo,con_ComWorkType_INSERT); //카드 입력 이력 남기자.
        if stCardGroupType = '3' then  //개인별 권한 작업이면
        begin
          dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N'); //해당 사번의 권한 적용 부분을 재 작업 - 삭제된 카드가 있거나 추가된 카드가 있으므로
          dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(stEmSeq,'','','','','N');
        end else
        begin
          dmDBCardPermit.EmployeeGradeChange_Process(stEmSeq,stCompanyCode,stEmGroupCode,stCardGroupType,True);
        end;
        dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);
      end;

    end;
  end;


end;

procedure TfmFPCardEmployee.tv_AddCompanyNameDblClick(Sender: TObject);
begin
  inherited;
  ed_SelectCompanyCode.Text := tv_AddCompanyCode.Items.Item[tv_AddCompanyName.Selected.AbsoluteIndex].Text;
  ed_CompanyName.Text := tv_AddCompanyName.Selected.Text;
  tv_AddCompanyName.Visible := False;
  LoadPosiCode(copy(ed_SelectCompanyCode.Text,1,1+G_nCompanyCodeLength),PosiCodeList,cmb_PosiName);
end;

procedure TfmFPCardEmployee.tv_AddEmGroupNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_AddEmGroupName.Selected = nil then tv_AddEmGroupName.items[0].Selected := True;

  ed_CardGroupCode.Text := tv_AddEmGroupCode.Items.Item[tv_AddEmGroupName.Selected.AbsoluteIndex].Text;
  ed_CardGroupName.Text := tv_AddEmGroupName.Selected.Text;
  tv_AddEmGroupName.Visible := False;
//
end;

procedure TfmFPCardEmployee.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_SelectBuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  ed_SelectBuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  if ed_emGradeSeq.Text = '' then Exit;
  L_nBuildingNotPermitDoorCount := 0;     //빌딩별 미등록 권한 출입문
  L_nBuildingPermitDoorCount := 0;        //빌딩별 등록 권한 출입문
  L_nBuildingNotPermitArmAreaCount := 0;  //빌딩별 미등록 권한 방범구역
  L_nBuildingPermitArmAreaCount := 0;
  L_nPermitArmAreaCheckCount := 0;           //삭제시 방범구역 선택 갯수
  L_nNotPermitArmAreaCheckCount := 0;        //등록시 방범구역 선택 갯수
  L_nPermitDoorCheckCount := 0;           //삭제시 출입문 선택 갯수
  L_nNotPermitDoorCheckCount := 0;        //등록시 출입문 선택 갯수

  GridInit(sg_NotPermitDoor,2,2,true);
  GridInit(sg_PermitDoor,2,2,true);
  GridInit(sg_NotPermitAlarm,2,2,true);   //그리드 초기화
  GridInit(sg_PermitAlarm,2,2,true);

  LoadBuildingDoorAll(ed_SelectBuildingCode.Text,sg_NotPermitDoor); //전체 출입문을 리스트에 추가 하자
  LoadBuildingAlarmAll(ed_SelectBuildingCode.Text,sg_NotPermitAlarm); //전체 방범구역을 리스트에 추가 하자

  LoadPermitDoor(ed_SelectBuildingCode.Text,ed_emGradeSeq.Text);
  LoadPermitAlarm(ed_SelectBuildingCode.Text,ed_emGradeSeq.Text);

end;

procedure TfmFPCardEmployee.tv_ListClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if tv_List.Selected = nil then Exit;

  tv_List.PopupMenu := pm_Work;

  lb_EmployeeList.Caption := tv_List.Selected.Text;

  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;

  if copy(stCode,1,1) = 'E' then
  begin
    pm_EmployeeAdd.Visible := False;       //팝업 메뉴 활성화
  end else
  begin
    pm_EmployeeAdd.Visible := True;
    ed_SerchSelectCompanyCode.Text := stCode;
    LoadPosiCode(copy(ed_SelectCompanyCode.Text,1,1+G_nCompanyCodeLength),PosiSearchCodeList,cmb_PositionSearch,True,L_stAllName);
    if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
  end;
end;

procedure TfmFPCardEmployee.tv_ListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stCompanyCode : string;
  stEmSeq : string;
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
      if currentItem.AbsoluteIndex = 0 then Exit;   //루트디렉토리가 움직일수는 없다
      stCompanyCode := tv_Code.Items[dropItem.AbsoluteIndex].Text;
      if copy(stCompanyCode,1,1) = 'E' then Exit; //옮기려는 위치가 사원정보이면 빠져 나가자
      stOrgCode := tv_Code.Items[currentItem.AbsoluteIndex].Text;
      if copy(stOrgCode,1,1) <> 'E' then Exit;
      stEmSeq := stOrgCode;
      Delete(stEmSeq,1,1);
      dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'CO_COMPANYCODE',stCompanyCode);
      dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_MEMLOAD','N');  //서버에서 메모리 로딩하자.
    end;
  end;
  LoadCompanyTreeView('',tv_List,tv_Code,con_LocalCompanyImageIndex);
  LoadCompanyTreeView('',tv_AddCompanyName,tv_AddCompanyCode,con_LocalCompanyImageIndex);

end;

procedure TfmFPCardEmployee.tv_ListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_List;

end;

procedure TfmFPCardEmployee.ViewTimeGroupCode(aTimeGroup: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'Select * from TB_TIMECODE ';
  stSql := stSql + ' Where TC_GROUP = ''' + aTimeGroup + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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
      if recordcount < 1 then Exit;
{      chk_TimeGroup.Items.Clear;
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME1').AsString,1,2) + ':' + copy(FindField('TC_TIME1').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME1').AsString,5,2) + ':' + copy(FindField('TC_TIME1').AsString,7,2));
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME2').AsString,1,2) + ':' + copy(FindField('TC_TIME2').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME2').AsString,5,2) + ':' + copy(FindField('TC_TIME2').AsString,7,2));
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME3').AsString,1,2) + ':' + copy(FindField('TC_TIME3').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME3').AsString,5,2) + ':' + copy(FindField('TC_TIME3').AsString,7,2));
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME4').AsString,1,2) + ':' + copy(FindField('TC_TIME4').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME4').AsString,5,2) + ':' + copy(FindField('TC_TIME4').AsString,7,2));

}
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

initialization
  RegisterClass(TfmFPCardEmployee);
Finalization
  UnRegisterClass(TfmFPCardEmployee);

end.
