﻿unit uEmployee;

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
  Vcl.Imaging.pngimage,DateUtils, AdvProgressBar,Winapi.ShellAPI, AdvCombo;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmEmployee = class(TfmASubForm)
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
    lb_EmployeeName: TAdvSmoothLabel;
    ed_Name: TAdvEdit;
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
    ed_ImageFile: TAdvEdit;
    OpenDialog1: TOpenDialog;
    ed_SearchName: TAdvEdit;
    lb_EtcDetail: TAdvSmoothLabel;
    pm_Employee: TPopupMenu;
    pm_EmUpdate: TMenuItem;
    pm_EmDelete: TMenuItem;
    ed_SerchSelectCompanyCode: TAdvEdit;
    ed_OldEmCode: TAdvEdit;
    chk_FingerUse: TAdvOfficeCheckBox;
    lb_EmployeeState: TAdvSmoothLabel;
    cmb_EmState: TComboBox;
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
    lb_EmployeeCaption: TLabel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    pan_Company: TAdvSmoothPanel;
    lb_CompanyManager: TLabel;
    tv_MCompany: TTreeView;
    tv_MCompanyCode: TTreeView;
    btn_CompanySelect: TAdvGlowButton;
    btn_BuildingCancel: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    btn_CompanyNameSelect: TAdvGlowButton;
    tv_AddCompanyName: TTreeView;
    lb_SearchCount1: TAdvSmoothLabel;
    lb_SearchCount: TAdvSmoothLabel;
    lb_Count1: TAdvSmoothLabel;
    pan_progress: TAdvSmoothPanel;
    ProgressBar1: TProgressBar;
    lb_ProgressCount: TAdvSmoothLabel;
    btn_Excel: TAdvGlowButton;
    SaveDialog1: TSaveDialog;
    ProgressBar2: TProgressBar;
    pan_Message: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    AdvProgressBar1: TAdvProgressBar;
    btn_AccessConfirm: TAdvGlassButton;
    btn_EmployeeDelete: TAdvGlowButton;
    SearchTimer: TTimer;
    AdvSmoothLabel1: TAdvSmoothLabel;
    ed_SearchPhone: TAdvEdit;
    lb_birthday: TAdvSmoothLabel;
    dt_birthday: TDateTimePicker;
    AdvSmoothLabel4: TAdvSmoothLabel;
    ed_SchoolName: TAdvEdit;
    AdvSmoothLabel5: TAdvSmoothLabel;
    ed_grade: TAdvEdit;
    AdvSmoothLabel6: TAdvSmoothLabel;
    ed_Email: TAdvEdit;
    pan_Finger: TAdvToolPanel;
    lb_FingerMessage: TLabel;
    AdvPanel1: TAdvPanel;
    FingerImage: TImage;
    btn_FingerSave: TAdvGlassButton;
    btn_FingerCancel: TAdvGlassButton;
    rg_tuitionOff: TAdvOfficeRadioGroup;
    btn_LectureRegist: TAdvGlowButton;
    pan_LectureRegist: TAdvSmoothPanel;
    Label1: TLabel;
    AdvSmoothPanel4: TAdvSmoothPanel;
    btn_LectureRegistSave: TAdvGlowButton;
    btn_LectureRegistCancel: TAdvGlowButton;
    AdvGlowButton4: TAdvGlowButton;
    AdvSmoothPanel3: TAdvSmoothPanel;
    Label2: TLabel;
    tv_LectureClassName: TTreeView;
    tv_LectureClassCode: TTreeView;
    AdvSmoothPanel5: TAdvSmoothPanel;
    Label3: TLabel;
    sg_LectureCode: TAdvStringGrid;
    ed_SerchSelectLectureClassCode: TAdvEdit;
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
    procedure sg_CardCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure dt_IndateChange(Sender: TObject);
    procedure dt_OutDateChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_PositionSearchClick(Sender: TObject);
    procedure cmb_EmpGubunSearchClick(Sender: TObject);
    procedure sg_EmployeeListResize(Sender: TObject);
    procedure pm_EmUpdateClick(Sender: TObject);
    procedure sg_EmployeeListDblClick(Sender: TObject);
    procedure sg_PermitDoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure pm_EmDeleteClick(Sender: TObject);
    procedure btn_EmployeeAddClick(Sender: TObject);
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
    procedure btn_BuildingCancelClick(Sender: TObject);
    procedure btn_CompanySelectClick(Sender: TObject);
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
    procedure btn_EmployeeDeleteClick(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure ListResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_SearchNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_LectureRegistClick(Sender: TObject);
    procedure btn_LectureRegistCancelClick(Sender: TObject);
    procedure btn_LectureRegistSaveClick(Sender: TObject);
    procedure tv_LectureClassNameClick(Sender: TObject);
    procedure sg_LectureCodeCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
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
    L_stEmHandPhoneCaption : string;
    L_stEmNameCaption : string;
    L_stCardNoCaption : string;
    L_stFingerTemplate1_1 : string;
    L_stFingerTemplate1_2 : string;
    L_stWork : string;
    L_nSelectCol : integer;
    L_nPageListMaxCount : integer;
    L_nBuildingNotPermitDoorCount : integer;     //빌딩별 미등록 권한 출입문
    L_nBuildingPermitDoorCount : integer;        //빌딩별 등록 권한 출입문
    L_nBuildingNotPermitArmAreaCount : integer;  //빌딩별 미등록 권한 방범구역
    L_nBuildingPermitArmAreaCount : integer;
    L_nUpdateEmStateIndex : integer;
    L_nPermitArmAreaCheckCount : integer;           //삭제시 방범구역 선택 갯수
    L_nLectureCodeCheckCount : integer;
    L_nNotPermitArmAreaCheckCount : integer;        //등록시 방범구역 선택 갯수
    L_nPermitDoorCheckCount : integer;           //삭제시 출입문 선택 갯수
    L_nNotPermitDoorCheckCount : integer;        //등록시 출입문 선택 갯수
    L_nEmployeeCheckCount : integer;             //
    L_bVisitEditMode : Boolean;
    L_bEmployeeGradeChange : Boolean;
    L_bFingerImageUpdate : Boolean;
    L_bFingerUse : Boolean;
    CardGubunCodeList :TStringList;
    CardSearchStateCodeList :TStringList;
    CardStateCodeList :TStringList;
    EmployeeGubunCodeList : TStringList;
    EmployeeGubunSearchCodeList : TStringList;
    EmployeeStateCodeList : TStringList;
    PosiCodeList : TStringList;
    PosiSearchCodeList : TStringList;
    WorkCardGubunCodeList :TStringList;
    WorkCardStateCodeList :TStringList;
    AddCardNoList : TStringList; //추가되는 카드번호 리스트를 가지고 있자
    ChangeCardNoList : TStringList; //변경되는 카드번호 리스트를 가지고 있자
    DeleteCardNoList : TStringList; //삭제 카드 리스트를 가지고 있자
    BuildingArmAreaCodeList : TStringList; //빌딩별 방범구역 코드 리스트를 가지고 있자.
    BuildingDoorCodeList : TStringList; //빌딩별 출입문 코드 리스트를 가지고 있자.
    TuitionOffCodeList : TStringList;
    function Check_FormCritical(var aBlankName:string):Boolean;
    procedure FormNameSetting;
    procedure SearhAddEmployee(aEmSeq:string); //추가시 타 시스템에서 이미 사용하고 있는 사원이면 정보를 읽어 와서 뿌려줌
    procedure SearchEmployeeList(aCode:string;aTopRow:integer = 0);
    procedure SearchLectureList(aCode:string;aTopRow:integer = 0);
    procedure EmployeeLectureRegist(aEmSeq:string);
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
    L_bFormClose : Boolean;
    L_bSearchBreak : Boolean;
    L_bSearchEnd : Boolean;
    FFingerDeviceType: Boolean;
    FFingerDeviceID: integer;
    FFingerUserID: String;
    FFingerEMSeq: integer;
    FFingerDeviceSeq: integer;
    FFingerDeviceIP: string;
    { Private declarations }
    procedure employeePanelClear;
    procedure LoadTuitionOffCode;
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
  public
    property FingerDeviceID : integer read FFingerDeviceID write FFingerDeviceID;
    property FingerDeviceSeq : integer read FFingerDeviceSeq write FFingerDeviceSeq;
    property FingerDeviceIP : string read FFingerDeviceIP write FFingerDeviceIP;
    property FingerUserID : String read FFingerUserID write FFingerUserID;
    property FingerEMSeq : integer read FFingerEMSeq write FFingerEMSeq;
  end;

var
  fmEmployee: TfmEmployee;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uEmployeeRelay,
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
  uSupremaFinger,
  uFingerVariable,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmEmployee.AdvGlowButton3Click(Sender: TObject);
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

procedure TfmEmployee.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmEmployee.btn_AccessConfirmClick(Sender: TObject);
begin
  inherited;
  L_bSearchBreak := True;
  Pan_Message.Visible := False;

end;

procedure TfmEmployee.btn_BuildingCancelClick(Sender: TObject);
begin
  inherited;
  AdvSmoothPanel2.Enabled := True;
  List.Enabled := True;
  pan_Company.Visible := False;
end;

procedure TfmEmployee.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Emcode.Visible := False;
end;

procedure TfmEmployee.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmEmployee.btn_CompanyManageClick(Sender: TObject);
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

procedure TfmEmployee.btn_CompanyNameSelectClick(Sender: TObject);
begin
  inherited;
  tv_AddCompanyName.Visible := Not tv_AddCompanyName.Visible;
  tv_AddCompanyName.Top := btn_CompanyNameSelect.Top + btn_CompanyNameSelect.Height;
  L_bEmployeeGradeChange := True;
end;

procedure TfmEmployee.btn_CompanySelectClick(Sender: TObject);
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
          dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(cells[14,i],'CO_COMPANYCODE',stCompanyCode);
          dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(cells[14,i],'EM_MEMLOAD','N');
          dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(cells[14,i],con_ComWorkType_UPDATE);
        end;
        ProgressBar1.Position := i;
        lb_ProgressCount.Caption.Text := inttostr(i) + '/' + inttostr(Rowcount - 1);
        Application.ProcessMessages;
      end;
    end;

    AdvSmoothPanel2.Enabled := True;
    List.Enabled := True;
    pan_Company.Visible := False;
    if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
  Finally
    pan_progress.Visible := False;
  End;

end;

procedure TfmEmployee.btn_EmployeeAddClick(Sender: TObject);
begin
  inherited;
  pm_EmployeeAddClick(pm_EmployeeAdd);
end;

procedure TfmEmployee.btn_EmployeeDeleteClick(Sender: TObject);
begin
  inherited;
  pm_EmDeleteClick(pm_EmDelete);

end;

procedure TfmEmployee.btn_ExcelClick(Sender: TObject);
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

procedure TfmEmployee.btn_FingerCancelClick(Sender: TObject);
begin
  inherited;
  L_bFingerImageUpdate := False;
  if FileExists(G_stExeFolder + '\Temp.bmp') then DeleteFile(G_stExeFolder + '\Temp.bmp');
  chk_FingerUse.Checked := False;
  pan_Finger.Visible := False;
end;

procedure TfmEmployee.btn_FingerSaveClick(Sender: TObject);
begin
  inherited;
  L_bFingerImageUpdate := True;
  chk_FingerUse.Checked := True;
  L_bFingerUse := True;
  pan_Finger.Visible := False;
end;

procedure TfmEmployee.btn_LectureRegistCancelClick(Sender: TObject);
begin
  inherited;
  pan_LectureRegist.Visible := False;
end;

procedure TfmEmployee.btn_LectureRegistClick(Sender: TObject);
begin
  inherited;
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage(dmFormMessage.GetMessage('NOTSELECTEMPLOYEE'));
    Exit;
  end;


  LoadLectureClassTreeView('',tv_LectureClassName,tv_LectureClassCode,con_LocalCompanyImageIndex);
  tv_LectureClassName.Items[0].Selected := True;
  tv_LectureClassNameClick(self);


  pan_LectureRegist.Visible := True;

end;

procedure TfmEmployee.btn_LectureRegistSaveClick(Sender: TObject);
var
  i,j:integer;
  bCheckState : Boolean;
  stEmSeq : string;
begin
  inherited;
  if L_nLectureCodeCheckCount < 1 then
  begin
    showmessage('수강신청 강의를 선택하여 주세요.');
    Exit;
  end;
  Try
    with sg_EmployeeList do
    begin
      ProgressBar1.Max := RowCount - 1;
      ProgressBar1.Position := 0;
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          stEmSeq := cells[14,i];
          EmployeeLectureRegist(stEmSeq);
        end;
        ProgressBar1.Position := i;
        lb_ProgressCount.Caption.Text := inttostr(i) + '/' + inttostr(Rowcount - 1);
        Application.ProcessMessages;
      end;
    end;

    AdvSmoothPanel2.Enabled := True;
    List.Enabled := True;
    pan_Company.Visible := False;
    SearchEmployeeList('');
  Finally
  End;
  pan_LectureRegist.Visible := False;

end;

procedure TfmEmployee.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

procedure TfmEmployee.btn_SaveClick(Sender: TObject);
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
  stCardNo,stCardGubun,stCardState : string;
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
  stTemp : string;
  stTemp1,stTemp2,stTemp3,stTemp4,stTemp5:string;
  stEmpcode : string;
  stEmail,stSchoolName,stGrade,stTuitionOFF:string;
  nResult : UF_RET_CODE;
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

  btn_Save.Enabled := False;
  Pan_Emcode.Enabled := False;

  if L_stWork = 'ADD' then
  begin
    if FingerEmSeq = -1 then
      stEmSeq := dmDBFunction.GetNextTB_EMPLOYEE_EmSeq
    else stEmSeq := inttostr(FingerEmSeq);
  end else
  begin
    stEmSeq := ed_emSeq.Text;
    if L_nUpdateEmStateIndex <> cmb_EmState.ItemIndex then bGradeUpdate := True; //사원 상태가 변경 되면 권한도 변경 되는것이다.
  end;
  stCompanyCode := ed_SelectCompanyCode.Text;
  stEmCode := '';
  stEmName := ed_Name.Text;
  stPosiCode := '0';
  if stPosiCode = '' then stPosiCode := '0';

  stGubunCode := '0';
  if stGubunCode = '' then stGubunCode := '0';
  stACType := '1';

  stATType := '1';

  stFdType := '1';

  stEmGroupCode := '0';
  stCardGroupType := '3';
  if cmb_EmState.ItemIndex > -1 then
    stEmStateCode := EmployeeStateCodeList.Strings[cmb_EmState.ItemIndex];
  if Not isDigit(stEmStateCode) then stEmStateCode := '1';
  if Not isDigit(stAWCode) then stAWCode := '1';


  if chk_FingerUse.Checked then stFingerUse := '1'
  else stFingerUse := '0';

  stEmail := ed_Email.Text;
  stSchoolName := ed_SchoolName.Text ;
  stGrade:= ed_grade.Text;
  stTuitionOFF := inttostr(rg_tuitionOff.ItemIndex);

  if DeleteCardNoList.Count > 0 then
  begin
    for i := 0 to DeleteCardNoList.Count - 1 do
    begin
      bGradeUpdate := True;
      stCardNo:= DeleteCardNoList.strings[i];
      dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(stCardNo);   //왜 삭제 처리를 안하지? 권한삭제 처리로 바꿈 20160824
      dmDBInsert.InsertIntoTB_CARDHIS_CopyCard(stCardNo,stCardNo,con_ComWorkType_DELETE); //삭제 전 카드 입력 이력 남기자.
      dmDBUpdate.UpdateTB_FINGERDEVICECARD_CardStop(stCardNo);
      dmDBDelete.DeleteTB_CARD_CARDNO(stCardNo);

      L_bEmployeeGradeChange := True;

    end;
  end;

  DeleteCardNoList.Clear;
  ChangeCardNoList.Clear;
  AddCardNoList.Clear;

  if L_stWork = 'ADD' then
  begin
    if FingerUserID = '' then
    begin
      stPositionNum := dmDBFunction.GetNextTB_CARD_PositionNum;
    end else
    begin
      stPositionNum :=FingerUserID;
    end;
    stRelayID := dmDBFunction.GetNextTB_CARD_RelayID;
    if chk_FingerUse.Checked then
    begin
      stFingerCardNo := dmDBFunction.GetTB_CARD_FingerCardNo(stPositionNum);      //Finger Card 한장 등록 하자.

      dmDBInsert.InsertIntoTB_CARD_Value(stFingerCardNo,'1','0',stPositionNum,stRelayID,'0',stEmSeq);
    end;

    dmDBInsert.InsertIntoTB_EMPLOYEE_Academy(stEmSeq,stEmName,stCompanyCode,stGubunCode,
               ed_CompanyPhone.Text,ed_Handphone.Text,ed_EtcInfo.Text,FormatDateTime('yyyymmdd',dt_birthday.Date),FormatDateTime('yyyymmdd',dt_Indate.Date),
               FormatDateTime('yyyymmdd',dt_Outdate.Date),'1','1',stFdType,stEmGroupCode,stCardGroupType,stFingerUse,stEmStateCode,stAWCode,stCardUse,stEmail,stSchoolName,stGrade,stTuitionOFF);

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
        //dmDBCardPermit.EmployeeCardAllPermit(stEmSeq,con_ComLogTYPE_DOOR,'0','Y');
      end;
      if G_nCardDefaultArmPermitType = 1 then  //전체권한을 가지고 시작 하는 경우 이면
      begin
        dmDBCardPermit.EmployeeCardAllPermit(stEmSeq,con_ComLogTYPE_ARMAREA,'1','N');
      end else
      begin
        //dmDBCardPermit.EmployeeCardAllPermit(stEmSeq,con_ComLogTYPE_ARMAREA,'0','Y');
      end;;
    end else
    begin
      dmDBCardPermit.EmployeeGradeChange_Process(stEmSeq,stCompanyCode,stEmGroupCode,stCardGroupType,True);
    end;

    fmMain.FORMCHANGE(con_FormBMOSEMPLOYEE,'');
  end else if L_stWork = 'UPDATE' then
  begin
    if DeleteCardNoList.Count > 0 then  //수정 작업 할때만 삭제 처리 하면 됨
    begin
      for i := 0 to DeleteCardNoList.Count - 1 do
      begin
        bGradeUpdate := True;
        stCardNo := DeleteCardNoList.Strings[i];
        //권한 삭제
        dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(stCardNo);
        //여기는 삭제 카드 처리 하는곳
        dmDBInsert.InsertIntoTB_CARDHIS_CopyCard(stCardNo,stCardNo,con_ComWorkType_DELETE); //삭제 전 카드 입력 이력 남기자.
        dmDBUpdate.UpdateTB_FINGERDEVICECARD_CardStop(stCardNo);
        dmDBDelete.deleteTB_CARD_CARDNO(stCardNo);
        L_bEmployeeGradeChange := True;
      end;
    end;
    if chk_FingerUse.Checked then
    begin
      if FingerUserID = '' then
      begin
        stPositionNum := dmDBFunction.GetNextTB_CARD_PositionNum;
      end else
      begin
        stPositionNum :=FingerUserID;
      end;
      stFingerCardNo := dmDBFunction.GetTB_CARD_FingerCardNo(stPositionNum);      //Finger Card 한장 등록 하자.
      //지문카드 없으면 Insert 있으면 등록상태 확인하여 처리
      if dmDBFunction.CheckTB_CARD_FingerCard(stEmSeq,stFingerCard,stFingerCardState) = 1 then
      begin
        if stFingerCardState <> '1' then  //등록상태가 아니면
        begin
          bGradeUpdate := True;
          dmDBUpdate.UpdateTB_CARD_Field_StringValue(stFingerCard,'CA_STATECODE','1');
        end;
        stFingerCardNo := stFingerCard; //지문 카드 있으면 그 카드로 변경
      end else
      begin
        bGradeUpdate := True;
        stRelayID := dmDBFunction.GetNextTB_CARD_RelayID;
        //stFingerCardNo := dmDBFunction.GetTB_CARD_FingerCardNo(stPositionNum);      //Finger Card 한장 등록 하자.
        if dmDBFunction.CheckTB_CARD_CARDNO(stFingerCardNo,stTemp1,stTemp2,stTemp3,stTemp4) = 1 then //stCardType,stEmSeq,stEmCode,stEmName) then
        begin
          dmDBUpdate.UpdateTB_CARD_Field_StringValue(stFingerCardNo,'CA_STATECODE','1');
          dmDBUpdate.UpdateTB_CARD_Field_StringValue(stFingerCardNo,'EM_SEQ',stEmSeq);
          dmDBUpdate.UpdateTB_CARD_Field_StringValue(stFingerCardNo,'CA_POSITIONNUM',stPositionNum);
          dmDBUpdate.UpdateTB_CARD_Field_StringValue(stFingerCardNo,'CA_RELAYID',stRelayID);
        end else
        begin
          dmDBInsert.InsertIntoTB_CARD_Value(stFingerCardNo,'1','0',stPositionNum,stRelayID,'0',stEmSeq);
        end;
      end;

    end else
    begin
      //지문카드 있으면 정지
      if G_bFingerDeleteUse then
      begin
        if dmDBFunction.CheckTB_CARD_FingerCard(stEmSeq,stFingerCard,stFingerCardState) = 1 then
        begin
          bGradeUpdate := True;
          dmDBUpdate.UpdateTB_CARD_Field_StringValue(stFingerCard,'CA_STATECODE','3'); //정지
        end;
      end;
    end;
    //변경된 내역 저장
    dmDBUpdate.UpdateTB_EMPLOYEE_Academy(stEmSeq,stEmName,stCompanyCode,stGubunCode,
               ed_CompanyPhone.Text,ed_Handphone.Text,ed_EtcInfo.Text,FormatDateTime('yyyymmdd',dt_birthday.Date),FormatDateTime('yyyymmdd',dt_Indate.Date),
               FormatDateTime('yyyymmdd',dt_Outdate.Date),'1','1',stFdType,stEmGroupCode,stCardGroupType,stFingerUse,stEmStateCode,stAWCode,stCardUse,stEmail,stSchoolName,stGrade,stTuitionOFF);
    dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_UPDATE); //사원정보 InSert 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음

    if L_bEmployeeGradeChange or bGradeUpdate then
    begin
      if stCardGroupType = '3' then  //개인별 권한 작업이면
      begin
        dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N'); //해당 사번의 권한 적용 부분을 재 작업 - 삭제된 카드가 있거나 추가된 카드가 있으므로
        dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(stEmSeq,'','','','','N');
      end else
      begin
        dmDBCardPermit.EmployeeGradeChange_Process(stEmSeq,stCompanyCode,stEmGroupCode,stCardGroupType,True);
      end;
    end;
    fmMain.FORMCHANGE(con_FormBMOSEMPLOYEE,'');
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
    //여기서 지문 다운로드 하자...  stFingerCard L_stFingerTemplate1_1
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
      //Exit;
    end;
    nResult := dmSupremaFinger.SendFingerTemplate(stFingerCardNo,stPositionNum,L_stFingerTemplate1_1,L_stFingerTemplate1_2,'','',FormatDateTime('yyyymmdd',dt_Outdate.Date));
    if (nResult <> UF_RET_SUCCESS) then
    begin
      showmessage('지문등록 실패');
    end;


  end else
  begin
    if bGradeUpdate then dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(stEmSeq,'N'); //카드 추가 삭제 부분이 있으면 지문리더에도 재전송 하자.
  end;

  if G_bAttendDedicateDoorUse then
  begin
    dmDBCardPermit.EmployeeAttendDoorGradePermitAdd(stEmSeq,con_ComLogTYPE_DOOR,'1','N');
  end;

  //무조건 재작업 하자.   성현지문 연동 후 권한 재작업 해야 다운로드 된다.
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N'); //해당 사번의 권한 적용 부분을 재 작업 - 삭제된 카드가 있거나 추가된 카드가 있으므로
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(stEmSeq,'','','','','N');

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
//  dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_MEMLOAD','N');  //서버에서 메모리 로딩하자.
  dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);

//  dmDBDelete.DeleteTB_CARD_GARBAGE;

  Pan_Emcode.Enabled := True;
  btn_Save.Enabled := True;
  Pan_Emcode.Visible := False;
  SearchEmployeeList(stEmSeq,sg_EmployeeList.TopRow);
end;

procedure TfmEmployee.btn_SaveMouseEnter(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clYellow;
end;

procedure TfmEmployee.btn_SaveMouseLeave(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clGray;
end;

procedure TfmEmployee.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchEmployeeList('');
end;

procedure TfmEmployee.CardRegistEvent(aCardNo: string);
begin

end;

function TfmEmployee.Check_FormCritical(var aBlankName: string): Boolean;
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
        if FindField('FC_CRITICALID').AsInteger = 2 then
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

procedure TfmEmployee.chk_FingerUseClick(Sender: TObject);
var
  nResult : UF_RET_CODE;
  i,j : integer;
  nLen : integer;
  TempStringList : TStringList;
  stMessage : string;
begin
  inherited;
  if Not chk_FingerUse.Checked then
  begin
    if L_bFingerUse then
    begin
        stMessage := dmFormMessage.GetMessage('FINGERDELETE');
        if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDOK)  then
        begin
          L_bFingerUse := False;
        end
        else chk_FingerUse.Checked := True;
    end;
    Exit;
  end;
  
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

procedure TfmEmployee.chk_IncludeCardNumClick(Sender: TObject);
begin
  inherited;
  if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
end;

procedure TfmEmployee.cmb_EmpGubunSearchClick(Sender: TObject);
begin
  inherited;
  if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
end;

procedure TfmEmployee.cmb_PositionSearchClick(Sender: TObject);
begin
  inherited;
  if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
end;

procedure TfmEmployee.dt_IndateChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True;  //유효기간 변경시 카드데이터 재전송
end;

procedure TfmEmployee.dt_OutDateChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True; //유효기간 변경시 카드데이터 재전송
end;

procedure TfmEmployee.ed_CompanyNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;
end;

procedure TfmEmployee.ed_SearchNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  //if Key = #13 then
  begin
    //SearchEmployeeList('');
  end;
  SearchEmployeeList('');
end;

procedure TfmEmployee.EmployeeLectureRegist(aEmSeq: string);
var
  i,j:integer;
  bCheckState : Boolean;
  stLectureSeq : string;
  stRegType : string;
begin
  inherited;
  Try
    with sg_LectureCode do
    begin
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          stLectureSeq := cells[11,i];
          if dmDBFunction.CheckTB_EMPLOYEELecture_Key(aEmSeq,stLectureSeq,stRegType)=1 then
          begin
            if (stRegType <> '1') then
            begin
              dmDBUpdate.UpdateTB_EMPLOYEELecture_Field_IntValue(aEmSeq,stLectureSeq,'EL_STATE','1');
              dmDBUpdate.UpdateTB_EMPLOYEELecture_Field_StringValue(aEmSeq,stLectureSeq,'EL_REGDATE',formatDateTime('yyyymmdd',now));
              dmDBUpdate.UpdateTB_EMPLOYEELecture_Field_StringValue(aEmSeq,stLectureSeq,'EL_PAYDATE',formatDateTime('dd',now));
              dmDBInsert.InsertIntoTB_EMPLOYEELectureHIS_Value(aEmSeq,stLectureSeq,formatDateTime('yyyymmdd',now),formatDateTime('dd',now),'1','','');
            end;
          end else
          begin
            dmDBInsert.InsertIntoTB_EMPLOYEELecture_Value(aEmSeq,stLectureSeq,formatDateTime('yyyymmdd',now),formatDateTime('dd',now),'1','','');
            dmDBInsert.InsertIntoTB_EMPLOYEELectureHIS_Value(aEmSeq,stLectureSeq,formatDateTime('yyyymmdd',now),formatDateTime('dd',now),'1','','');
          end;

        end;
        Application.ProcessMessages;
      end;
    end;
  Finally
  End;

end;

procedure TfmEmployee.employeePanelClear;
begin
  L_bEmployeeGradeChange := False;
  L_bFingerImageUpdate := False;

  ed_emSeq.Text := '';
  ed_CompanyName.Text := '';
  ed_OldEmCode.Text := '';
  ed_Name.Text := '';
  ed_Handphone.Text := '';
  ed_CompanyPhone.Text := '';
  ed_EtcInfo.Text := '';
  dt_birthday.Date := Now;
  ed_Email.Text := '';
  ed_SchoolName.Text := '';
  ed_grade.Text := '';
  dt_Indate.Date := Now;
  dt_OutDate.Date :=  EncodeDateTime(9999,
                                             12,
                                             31,
                                             0,0,0,0);
  chk_FingerUse.Checked := False;
  AddCardNoList.Clear;
  ChangeCardNoList.Clear;
  DeleteCardNoList.Clear;
  Image1.Picture.Graphic := Nil;
  ed_ImageFile.Text := '';

  if cmb_EmState.Items.Count > 0 then cmb_EmState.ItemIndex := 0;

  LoadTuitionOffCode;

end;

(*
function TfmEmployee.EmployeePermitToCardDeviceLoad(aNodeNo, aEcuID,
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
                         stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8)then result := False;
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
          if FindField('CP_PERMIT').AsString ='1' then stPermit := '1';
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
          if FindField('CP_PERMIT').AsString ='1' then stPermit := '1';
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
                     stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8)then result := False;
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


procedure TfmEmployee.FingerTimerTimer(Sender: TObject);
begin
  inherited;
  lb_FingerMessage.Visible := Not lb_FingerMessage.Visible;
end;

procedure TfmEmployee.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmEmployee.FormChangeEvent(aNumber: integer);
var
  stSelectCode1 : string;
  stSelectCode2 : string;
  nIndex : integer;
begin
  case aNumber of
    con_FormBMOSCOMPANYCODE : begin
        LoadCompanyTreeView('',tv_List,tv_Code,con_LocalCompanyImageIndex,'',True);
        LoadCompanyTreeView('',tv_AddCompanyName,tv_AddCompanyCode,con_LocalCompanyImageIndex,'',True);
    end;
    con_FormBMOSBUILDINGCODE : begin
//      LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
    end;
    con_FormBMOSPOSICODE : begin

    end;
    con_FormBMOSEMPLOYEEGUBUN : begin
    end;

  end;
end;

procedure TfmEmployee.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dmSupremaFinger.Connected then
  begin
    dmSupremaFinger.SocketOPEN := False;
  end;
  //dmSupremaFinger.Free;
  L_bFormClose := True;
  L_bSearchBreak := True;
  Delay(1000);

  PosiCodeList.Free;
  PosiSearchCodeList.Free;
  EmployeeGubunCodeList.Free;
  EmployeeGubunSearchCodeList.Free;
  EmployeeStateCodeList.Free;
  CardGubunCodeList.Free;
  WorkCardGubunCodeList.Free;
  WorkCardStateCodeList.Free;
  AddCardNoList.Free;
  ChangeCardNoList.Free;
  CardStateCodeList.Free;
  CardSearchStateCodeList.Free;
  DeleteCardNoList.Free;
  BuildingDoorCodeList.Free;
  BuildingArmAreaCodeList.Free;
  TuitionOffCodeList.Free;

  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'FALSE');

  Action := caFree;
end;

procedure TfmEmployee.FormCreate(Sender: TObject);
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
  CardGubunCodeList := TStringList.Create;
  WorkCardGubunCodeList := TStringList.Create;
  WorkCardStateCodeList := TStringList.Create;
  AddCardNoList := TStringList.Create;
  ChangeCardNoList:= TStringList.Create;
  CardStateCodeList := TStringList.Create;
  CardSearchStateCodeList := TStringList.Create;
  DeleteCardNoList := TStringList.Create;
  BuildingDoorCodeList := TStringList.Create;
  BuildingArmAreaCodeList := TStringList.Create;

  TuitionOffCodeList := TStringList.Create;
  FontSetting;
  L_bSearchEnd := True;
  //dmSupremaFinger := TdmSupremaFinger.Create(nil);

end;

procedure TfmEmployee.FormGradeRefresh;
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

procedure TfmEmployee.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmEmployee.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    if Pan_Emcode.Visible then rg_tuitionOff.ItemIndex := -1;
  end;

end;

procedure TfmEmployee.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('0','2','COMMONCOMPANYLIST');//소속 dmFormFunction.GetFormName('0','2','COMMONLIST01');
  pm_EmployeeAdd.Caption := dmFormFunction.GetFormName('0','2','COMMONADD');
  btn_EmployeeAdd.Caption := dmFormFunction.GetFormName('0','2','COMMONADD');
  btn_Excel.Caption := dmFormFunction.GetFormName('0','2','BUTTONFILESAVE002');
  btn_EmployeeDelete.Caption := dmFormFunction.GetFormName('0','2','COMMONDELETE');
  pm_EmDelete.Caption := dmFormFunction.GetFormName('0','2','COMMONDELETE');


  lb_EmployeeList.Caption := dmFormFunction.GetFormName('2','2','BM3_011List');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  L_stDeleteCaption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stCardNoCaption := dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER');
  pm_EmUpdate.Caption := dmFormFunction.GetFormName('0','2','COMMONUPDATE');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');
  btn_CompanyNameSelect.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH002');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  lb_CompanyName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');

  sg_EmployeeList.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  sg_EmployeeList.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  sg_EmployeeList.Cells[3,0] := '생년월일';
  sg_EmployeeList.Cells[4,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  sg_EmployeeList.Cells[5,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  sg_EmployeeList.Cells[6,0]:= '이메일';
  sg_EmployeeList.Cells[7,0]:= '학교명';
  sg_EmployeeList.Cells[8,0]:= '학년';
  sg_EmployeeList.Cells[9,0]:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  sg_EmployeeList.Cells[10,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEINDATE');
  sg_EmployeeList.Cells[11,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEOUTDATE');
  sg_EmployeeList.Cells[12,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEESTATE');
  sg_EmployeeList.Cells[13,0] := '할인코드';
  sg_EmployeeList.Cells[14,0] := '학생순번';
  sg_EmployeeList.Cells[15,0]:= '분류코드';
  L_stEmCodeCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  lb_EmployeeName.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  L_stEmNameCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  lb_HandPhone.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  L_stEmHandPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  lb_CompanyPhone.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  L_stEmCompanyPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  lb_etcInfo.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  L_stEmEtcCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  lb_Indate.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEINDATE');
  lb_OutDate.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEOUTDATE');
  lb_EmployeeState.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEESTATE');
  chk_FingerUse.Caption := dmFormFunction.GetFormName('0','2','COMMONFINGER');
  pan_Finger.Caption := dmFormFunction.GetFormName('0','2','COMMONFINGER');
  lb_FingerMessage.Caption := dmFormFunction.GetFormMessage('FINGERSENSOR');
  Panel1.Caption := dmFormFunction.GetFormMessage('CLICKPICTURE');
  btn_FingerSave.Caption :=dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_FingerCancel.Caption :=dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  btn_CompanySelect.Caption :=dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
  btn_BuildingCancel.Caption :=dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_Count1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  lb_SearchCount1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
end;

procedure TfmEmployee.FormResize(Sender: TObject);
begin
  inherited;
  Pan_Emcode.Left := (Width div 2) - (Pan_Emcode.Width div 2);
  Pan_Emcode.top := (Height div 2) - (Pan_Emcode.Height div 2) - 30;

  pan_LectureRegist.Left := (Width div 2) - (pan_LectureRegist.Width div 2);
  pan_LectureRegist.top := (Height div 2) - (pan_LectureRegist.Height div 2) - 30;


  pan_progress.Left := (Width div 2) - (pan_progress.Width div 2);
  pan_progress.Top := (Height div 2) - (pan_progress.Height div 2);

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

  pan_Message.Left := (Width div 2) - (pan_Message.Width div 2);
  pan_Message.Top := (Height div 2) - (pan_Message.Height div 2);

  pan_EmployeeListResize(pan_EmployeeList);

end;

procedure TfmEmployee.FormSearchEnable(aEnabled: Boolean);
begin
  tv_List.Enabled := aEnabled;
  ed_SearchName.Enabled := aEnabled;
  btn_Search.Enabled := aEnabled;
  btn_CompanyManage.Enabled := aEnabled;
end;

procedure TfmEmployee.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'TRUE');

  LoadCompanyTreeView('',tv_List,tv_Code,con_LocalCompanyImageIndex,'',True);
  LoadCompanyTreeView('',tv_AddCompanyName,tv_AddCompanyCode,con_LocalCompanyImageIndex,'',True);
  tv_List.Items[0].Selected := True;
  tv_ListClick(self);
  if L_bFormClose or G_bApplicationTerminate then Exit;

  pan_AddWorkResize(self);
  Image1.Align := alClient;
  tv_AddCompanyName.Left := btn_CompanyNameSelect.Left;

  LoadEmployeeStateCode(EmployeeStateCodeList,cmb_EmState,False);

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
//  if G_nReportSearchType = 1 then SearchEmployeeList('');  //tv_ListClick 에서 먼저 조회 함
end;

procedure TfmEmployee.Form_Close;
begin
  Close;
end;

procedure TfmEmployee.Image1Click(Sender: TObject);
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

function TfmEmployee.JpegStartsInBlob(PicField: TBlobField): integer;
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

procedure TfmEmployee.ListResize(Sender: TObject);
begin
  inherited;
  tv_List.Height := List.Height - tv_List.Top - 30;
  tv_List.Width := List.Width - (tv_List.Left * 2);

end;

procedure TfmEmployee.LoadBuildingAlarmAll(aBuildingCode: string;
  sgList: TAdvStringGrid);
begin

end;

procedure TfmEmployee.LoadBuildingDoorAll(aBuildingCode: string;
  sgList: TAdvStringGrid);
begin

end;

procedure TfmEmployee.LoadPermitAlarm(aBuildingCode, aEmSeq: string);
begin

end;

procedure TfmEmployee.LoadPermitDoor(aBuildingCode, aEmSeq: string);
begin

end;

procedure TfmEmployee.LoadTuitionOffCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  rg_tuitionOff.Items.Clear;
  TuitionOffCodeList.Clear;
  stSql := 'Select * from TB_TuitionOFF ';
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
        Exit;
      End;
      if recordCount < 1 then Exit;
      while Not Eof do
      begin
        rg_tuitionOff.Items.Add(FindField('TO_NAME').AsString);
        TuitionOffCodeList.Add(FindField('TO_CODE').AsString);
        Next;
      end;

      rg_tuitionOff.Height := ((recordcount div 4) + 1) * 40;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmEmployee.NotPermitArmAreaListAdd(aArmAreaName, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aArmAreaCode, aArmAreaView: string);
begin

end;

procedure TfmEmployee.NotPermitArmAreaListDelete(aArmAreaCode: string);
begin

end;

procedure TfmEmployee.NotPermitDoorListAdd(aDoorName, aNodeNo, aEcuID,
  aExtendID, aDoorNo, aDoorCode, aDoorView: string);
begin

end;

procedure TfmEmployee.NotPermitDoorListDelete(aDoorCode: string);
begin
end;

procedure TfmEmployee.pan_AddWorkResize(Sender: TObject);
begin
  inherited;
  btn_Save.Left := (pan_AddWork.Width div 2) - btn_Save.Width - 5;
  btn_Save.Top := (pan_AddWork.Height div 2) - (btn_Save.Height div 2);
  btn_Cancel.Left := (pan_AddWork.Width div 2) + 5;
  btn_Cancel.Top := (pan_AddWork.Height div 2) - (btn_Cancel.Height div 2);
end;

procedure TfmEmployee.Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfmEmployee.Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TfmEmployee.Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = FALSE 설정
//    MouseDowning := False;
end;

procedure TfmEmployee.pan_emPermitAdminMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);

end;

procedure TfmEmployee.pan_EmployeeListResize(Sender: TObject);
begin
  inherited;
  sg_EmployeeList.Width := pan_EmployeeList.Width - sg_EmployeeList.Left - 20;
  sg_EmployeeList.Height := pan_EmployeeList.Height - sg_EmployeeList.Top - 50;

end;

procedure TfmEmployee.pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmEmployee.pan_PositionInfoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
(* ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
 *)
end;

procedure TfmEmployee.PermitArmAreaListAdd(aArmAreaName, aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aArmAreaCode, aArmAreaView: string);
begin

end;

procedure TfmEmployee.PermitDoorListAdd(aDoorName, aNodeNo, aEcuID, aExtendID,
  aDoorNo, aDoorCode, aDoorView: string);
begin

end;

procedure TfmEmployee.pm_EmDeleteClick(Sender: TObject);
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
          stEmSeq := Cells[14,i];
          if isDigit(stEmSeq) then
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
        ProgressBar1.Position := i;
        lb_ProgressCount.Caption.Text := inttostr(i) + '/' + inttostr(Rowcount - 1);
        Application.ProcessMessages;
      end;
    end;

  Finally
    pan_progress.Visible := False;
  End;
  SearchEmployeeList('');
end;

procedure TfmEmployee.pm_EmployeeAddClick(Sender: TObject);
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
  ed_CompanyName.Text := tv_List.Selected.Text;

  nIndex := EmployeeStateCodeList.IndexOf('1');
  if nIndex < 0 then  nIndex := 0;

  cmb_EmState.ItemIndex := nIndex;
  FingerEMSeq := -1;
  FingerUserID := '';

  L_stWork := 'ADD';
end;

procedure TfmEmployee.pm_EmUpdateClick(Sender: TObject);
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
  if sg_EmployeeList.Cells[14,sg_EmployeeList.Row] = '' then Exit;
  employeePanelClear;
  Pan_Emcode.Visible := True;
  lb_EmployeeCaption.Caption := pm_EmUpdate.Caption;
  with sg_EmployeeList do
  begin
    ed_emSeq.Text := Cells[14,Row];
    ed_SelectCompanyCode.Text := Cells[15,Row];
    ed_CompanyName.Text := Cells[2,Row];
    ed_Name.Text := Cells[1,Row];
    ed_Handphone.Text := Cells[4,Row];
    ed_CompanyPhone.Text := Cells[5,Row];
    ed_Email.Text := cells[6,Row];
    ed_SchoolName.Text := cells[7,Row];
    ed_grade.Text := cells[8,Row];
    ed_EtcInfo.Text := cells[9,Row];
    if isDigit(cells[13,Row]) then rg_tuitionOff.ItemIndex := strtoint(cells[13,Row]);

    stDate := Cells[3,Row];
    stDate := stringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := stringReplace(stDate,':','',[rfReplaceAll]);
    stDate := stringReplace(stDate,'','',[rfReplaceAll]);
    if isDate(copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2)) then
       dt_birthday.Date :=  EncodeDateTime(strtoint(copy(stDate,1,4)),
                                             strtoint(copy(stDate,5,2)),
                                             strtoint(copy(stDate,7,2)),
                                             0,0,0,0)
       //strtoDate(MakeDatetimeStr(Cells[8,Row]))
    else dt_birthday.Date := now;

    stDate := Cells[10,Row];
    stDate := stringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := stringReplace(stDate,':','',[rfReplaceAll]);
    stDate := stringReplace(stDate,'','',[rfReplaceAll]);
    if isDate(copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2)) then
       dt_Indate.Date :=  EncodeDateTime(strtoint(copy(stDate,1,4)),
                                             strtoint(copy(stDate,5,2)),
                                             strtoint(copy(stDate,7,2)),
                                             0,0,0,0)
       //strtoDate(MakeDatetimeStr(Cells[8,Row]))
    else dt_Indate.Date := now;

    stDate := Cells[11,Row];
    stDate := stringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := stringReplace(stDate,':','',[rfReplaceAll]);
    stDate := stringReplace(stDate,'','',[rfReplaceAll]);
    if isDate(copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2)) then
       dt_OutDate.Date := EncodeDateTime(strtoint(copy(stDate,1,4)),
                                             strtoint(copy(stDate,5,2)),
                                             strtoint(copy(stDate,7,2)),
                                             0,0,0,0)
                                             //strtoDate(MakeDatetimeStr(Cells[9,Row]))
    else dt_OutDate.Date := strtoDate('9999-12-31');



    if Cells[16,Row] = '1' then chk_FingerUse.Checked := True
    else chk_FingerUse.Checked := False;
    L_bFingerUse := chk_FingerUse.Checked;

    nIndex := EmployeeStateCodeList.IndexOf(Cells[12,Row]);
    cmb_EmState.ItemIndex := nIndex;
    L_nUpdateEmStateIndex := nIndex;
  end;
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
  //여기서 카드 데이터 로딩 하자.
  L_stWork := 'UPDATE';
  ed_CompanyName.SetFocus;
end;

procedure TfmEmployee.RegistTempDB(G_stCardRegisterIP: string);
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


procedure TfmEmployee.SearchEmployeeList(aCode: string; aTopRow: integer);
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
  stCardState : string;
begin
  L_nEmployeeCheckCount := 0;
  L_bSearchBreak := True;
  FingerUserID := '';

  while Not L_bSearchEnd do
  begin
    SearchTimer.Enabled := True;
    Exit;
  end;
  L_bSearchBreak := False;
  L_bSearchEnd := False;
  btn_Excel.Enabled := False;
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

  GridInit(sg_EmployeeList,11,2,True);

  stCompanyCode := ed_SerchSelectCompanyCode.Text;
  if stCompanyCode = '' then stCompanyCode := '0';



  stSql := ' Select a.EM_FINGERUSE,a.EM_CARDUSE,a.EM_SEQ,a.EM_CODE,a.EM_NAME,a.CO_COMPANYCODE,a.PO_POSICODE,a.EM_EMAIL,';
  stSql := stSql + ' a.EM_GUBUNCODE,a.EM_COMPANYPHONE,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_EMINFO,a.EM_BIRTHDAY,a.EM_SCHOOL,';
  stSql := stSql + ' a.EM_REGDATE,a.EM_ENDDATE,a.EM_ACUSE,a.EM_ATUSE,a.EM_FDUSE,a.EM_GROUPCODE,a.EM_STATECODE,a.TO_CODE,a.EM_GRADE,';
  stSql := stSql + ' a.EM_GRADETYPE,a.AW_CODE,b.CO_COMPANYNAME,c.PO_POSICODENAME,d.EM_GUBUNCODENAME,e.EM_GROUPCODENAME ';
  stSql := stSql + ' , g.CO_COMPANYNAME as COMPANYNAME1,h.CO_COMPANYNAME as COMPANYNAME2,i.CO_COMPANYNAME as COMPANYNAME3 ';
  stSql := stSql + ' From TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_COMPANYCODE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ) ';
  stSql := stSql + ' Left Join TB_POSICODE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.PO_POSICODE = c.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEGUBUN d ';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_GUBUNCODE = d.EM_GUBUNCODE ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEGROUPCODE e ';
  stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_GROUPCODE = e.EM_GROUPCODE ) ';
  stSql := stSql + ' Left Join (select * from TB_COMPANYCODE where CO_DEEPSEQ = 1) g ';
  stSql := stSql + ' ON (a.GROUP_CODE = g.GROUP_CODE ) ';
  stSql := stSql + ' AND ( SUBSTRING(a.CO_COMPANYCODE,1,' + inttostr(1 + G_nCompanyCodeLength) + ') = SUBSTRING(g.CO_COMPANYCODE ,1,' + inttostr(1 + G_nCompanyCodeLength) + ') ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join (select * from TB_COMPANYCODE where CO_DEEPSEQ = 2) h ';
  stSql := stSql + ' ON (a.GROUP_CODE = h.GROUP_CODE ) ';
  stSql := stSql + ' AND ( SUBSTRING(a.CO_COMPANYCODE,1,' + inttostr(1 + (G_nCompanyCodeLength * 2)) + ') = SUBSTRING(h.CO_COMPANYCODE ,1,' + inttostr(1 + (G_nCompanyCodeLength * 2)) + ') ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join (select * from TB_COMPANYCODE where CO_DEEPSEQ = 3) i ';
  stSql := stSql + ' ON (a.GROUP_CODE = i.GROUP_CODE ) ';
  stSql := stSql + ' AND ( SUBSTRING(a.CO_COMPANYCODE,1,' + inttostr(1 + (G_nCompanyCodeLength * 3)) + ') = SUBSTRING(i.CO_COMPANYCODE ,1,' + inttostr(1 + (G_nCompanyCodeLength * 3)) + ') ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE Like ''' + stCompanyCode + '%'' ';
  if ed_SearchName.Text <> '' then
    stSql := stSql + ' AND a.EM_NAME Like N''%' + ed_SearchName.Text + '%'' ';
  if ed_SearchPhone.Text <> '' then
    stSql := stSql + ' AND (a.EM_HANDPHONE Like ''%' + ed_SearchPhone.Text + '%'' OR a.EM_COMPANYPHONE Like ''%' + ed_SearchPhone.Text + '%'' ) ';

  Try
    if (G_nFormEnable = 1) then FormSearchEnable(False);
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

      pan_Message.Visible := G_bDataLoadingView;
      AdvProgressBar1.Max := recordcount;
      AdvProgressBar1.Position := 0;
      with sg_EmployeeList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          if L_bSearchBreak then
          begin
            Exit;
          end;
          if L_bFormClose or G_bApplicationTerminate then Exit;

          AddCheckBox(0,nRow,False,False);

          cells[1,nRow] := FindField('EM_NAME').AsString;        //학생 이름
          cells[2,nRow] := FindField('CO_COMPANYNAME').AsString; //학생 분류
          cells[3,nRow] := FindField('EM_BIRTHDAY').AsString;    //생년월일
          cells[4,nRow] := FindField('EM_HANDPHONE').AsString;   //핸드폰
          cells[5,nRow] := FindField('EM_COMPANYPHONE').AsString;//부모핸드폰
          cells[6,nRow] := FindField('EM_EMAIL').AsString;//이메일
          cells[7,nRow] := FindField('EM_SCHOOL').AsString;//학교명
          cells[8,nRow] := FindField('EM_GRADE').AsString;//학년
          cells[9,nRow] := FindField('EM_EMINFO').AsString;//주소
          cells[10,nRow] := FindField('EM_REGDATE').AsString;  //등록일
          cells[11,nRow] := FindField('EM_ENDDATE').AsString;  //퇴원일
          cells[12,nRow] := FindField('EM_STATECODE').AsString; //재원상태코드
          cells[13,nRow] := FindField('TO_CODE').AsString;      //할인코드
          cells[14,nRow] := FindField('EM_SEQ').AsString;       //사원코드
          cells[15,nRow] := FindField('CO_COMPANYCODE').AsString;  //분류코드
          cells[16,nRow] := FindField('EM_FINGERUSE').AsString;    //지문사용유무
          if FindField('EM_SEQ').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

          if FindField('EM_STATECODE').AsString <> '1' then RowColor[nRow] := clRed; //퇴사 또는 휴직 처리 된 인원

          nRow := nRow + 1;
          if G_bDataLoadingView then AdvProgressBar1.Position := nRow;
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
      end;

    end;
  Finally
    L_bSearchEnd := True;
    FormSearchEnable(True);
    pan_Message.Visible := False;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmEmployee.SearchLectureList(aCode: string; aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stLectureClassCode : string;
begin

  GridInit(sg_LectureCode,2,2,True);

  stLectureClassCode := ed_SerchSelectLectureClassCode.Text;
  if stLectureClassCode = '' then stLectureClassCode := '0';



  stSql := ' Select a.*,b.AD_USERNAME as MAINTEACHEAR,c.LC_CODENAME,d.AD_USERNAME as SUBTEACHEAR ';
  stSql := stSql + ' From TB_CurriculumCode a';
  stSql := stSql + ' Left Join TB_ADMIN b ';
  stSql := stSql + ' ON(a.AD_USERID = b.AD_USERID) ';
  stSql := stSql + ' Left Join TB_LectureClassCode c ';
  stSql := stSql + ' ON(a.LC_CODE = c.LC_CODE) ';
  stSql := stSql + ' Left Join TB_ADMIN d ';
  stSql := stSql + ' ON(a.AD_SUBUSERID = d.AD_USERID) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.LC_CODE Like ''' + stLectureClassCode + '%'' ';


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

      with sg_LectureCode do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          if L_bSearchBreak then
          begin
            Exit;
          end;
          if L_bFormClose or G_bApplicationTerminate then Exit;

          AddCheckBox(0,nRow,False,False);

          cells[1,nRow] := FindField('CC_NAME').AsString;        //과정명
          cells[2,nRow] := FindField('LC_CODENAME').AsString;        //분류명
          cells[3,nRow] := FindField('CC_BOOKNAME').AsString; //사용교재
          cells[4,nRow] := FindField('CC_BOOKAMT').AsString;    //교재비
          cells[5,nRow] := FindField('CC_MONTH').AsString;   //교육개월수
          if FindField('CC_GUBUN').AsInteger = 0 then cells[6,nRow] := '일반'
          else if FindField('CC_GUBUN').AsInteger = 1 then cells[6,nRow] := '특강'
          else cells[6,nRow] := FindField('CC_GUBUN').AsString;//일반/특강
          cells[7,nRow] := FindField('MAINTEACHEAR').AsString;//강사
          cells[8,nRow] := FindField('SUBTEACHEAR').AsString;//보조강사
          cells[9,nRow] := FindField('CC_HH').AsString;//교육시간
          cells[10,nRow] := FindField('CC_WEEK').AsString;//요일
          cells[11,nRow] := FindField('CC_CODE').AsString;//과정코드
          cells[12,nRow] := FindField('LC_CODE').AsString;  //분류코드
          cells[13,nRow] := FindField('CC_GUBUN').AsString;  //일반/특강코드
          cells[14,nRow] := FindField('AD_USERID').AsString;  //주강사코드
          cells[15,nRow] := FindField('AD_SUBUSERID').AsString;  //보조강사코드
          if FindField('CC_CODE').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          if G_bDataLoadingView then AdvProgressBar1.Position := nRow;
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
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmEmployee.SearchTimerTimer(Sender: TObject);
begin
  inherited;
  SearchTimer.Enabled := False;
  SearchEmployeeList('');
end;

(*
procedure TfmEmployee.SearchMEmGroupList(aCode: string);
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

procedure TfmEmployee.SearhAddEmployee(aEmSeq: string);
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
      ed_CompanyName.Text := FindField('CO_COMPANYNAME').AsString;
      ed_Name.Text :=  FindField('EM_NAME').AsString;
      ed_Handphone.Text := FindField('EM_HANDPHONE').AsString;
      ed_CompanyPhone.Text := FindField('EM_COMPANYPHONE').AsString;
      ed_EtcInfo.Text := FindField('EM_EMINFO').AsString;
      dt_Indate.Date := strtoDate(MakeDatetimeStr(FindField('EM_REGDATE').AsString));
      dt_OutDate.Date := strtoDate(MakeDatetimeStr(FindField('EM_ENDDATE').AsString));

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

procedure TfmEmployee.sg_CardCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;

end;

procedure TfmEmployee.sg_EmployeeListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if Not L_bSearchEnd then
  begin
    sg_EmployeeList.SetCheckBoxState(ACol,ARow,Not State);
    Exit;
  end;
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

procedure TfmEmployee.sg_EmployeeListDblClick(Sender: TObject);
begin
  inherited;
  pm_EmUpdateClick(self);
end;

procedure TfmEmployee.sg_EmployeeListResize(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := sg_EmployeeList.Height div sg_EmployeeList.DefaultRowHeight;
end;

procedure TfmEmployee.sg_LectureCodeCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nLectureCodeCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nLectureCodeCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nLectureCodeCheckCount := L_nLectureCodeCheckCount + 1
    else L_nLectureCodeCheckCount := L_nLectureCodeCheckCount - 1 ;
  end;

end;

procedure TfmEmployee.sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployee.sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployee.sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployee.sg_PermitDoorCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmEmployee.SKGasCardMapping(aFile: string);
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

procedure TfmEmployee.tv_AddCompanyNameDblClick(Sender: TObject);
begin
  inherited;
  ed_SelectCompanyCode.Text := tv_AddCompanyCode.Items.Item[tv_AddCompanyName.Selected.AbsoluteIndex].Text;
  ed_CompanyName.Text := tv_AddCompanyName.Selected.Text;
  tv_AddCompanyName.Visible := False;
end;

procedure TfmEmployee.tv_LectureClassNameClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if tv_LectureClassName.Selected = nil then Exit;

  stCode := tv_LectureClassCode.Items.Item[tv_LectureClassName.Selected.AbsoluteIndex].Text;

  //if ed_SerchSelectLectureClassCode.Text <> stCode then
  begin
    ed_SerchSelectLectureClassCode.Text := stCode;
    SearchLectureList('');
  end;

end;

procedure TfmEmployee.tv_ListClick(Sender: TObject);
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
    if ed_SerchSelectCompanyCode.Text <> stCode then
    begin
      ed_SerchSelectCompanyCode.Text := stCode;
      if G_nEmployeeSearchType = 1 then SearchEmployeeList('');
    end;
  end;
end;

procedure TfmEmployee.tv_ListDragDrop(Sender, Source: TObject; X,
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

procedure TfmEmployee.tv_ListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_List;

end;

procedure TfmEmployee.ViewTimeGroupCode(aTimeGroup: string);
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
  RegisterClass(TfmEmployee);
Finalization
  UnRegisterClass(TfmEmployee);

end.