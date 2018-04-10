unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvAppStyler, Vcl.ImgList,
  AdvShapeButton, AdvToolBar, AdvGlowButton, AdvToolBarStylers,uSubForm,
  AdvPreviewMenu, AdvPreviewMenuStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, Vcl.ExtCtrls,System.IniFiles,Data.DB, Data.Win.ADODB,Winapi.ActiveX,
  System.Win.Registry,Winapi.ShellAPI;

type
  TfmMain = class(TAdvToolBarForm)
    MenuEnableImageList32: TImageList;
    MenuDisableImageList32: TImageList;
    KTTMenuEnableImageList: TImageList;
    KTTMenuDisableImageList: TImageList;
    AdvFormStyler1: TAdvFormStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    at_Menu: TAdvToolBarPager;
    ApBasicAdmin: TAdvPage;
    mn_CodeAdmin: TAdvToolBar;
    mn_0222: TAdvGlowButton;
    ApManager: TAdvPage;
    ApReport: TAdvPage;
    at_ArmAreaReport: TAdvToolBar;
    AdvToolBar8: TAdvToolBar;
    mn_0411: TAdvGlowButton;
    mn_0412: TAdvGlowButton;
    apAttend: TAdvPage;
    AdvToolBar2: TAdvToolBar;
    mn_absentReport: TAdvGlowButton;
    mn_AttendReport: TAdvGlowButton;
    ap_Other: TAdvPage;
    AdvToolBar9: TAdvToolBar;
    btn_PaymentList: TAdvGlowButton;
    mn_NotPayList: TAdvGlowButton;
    btn_NameChange: TAdvGlowButton;
    mn_Relay: TAdvToolBar;
    mn_0611: TAdvGlowButton;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    AdvShapeButton1: TAdvShapeButton;
    mn_0221: TAdvGlowButton;
    AdvToolBar1: TAdvToolBar;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    mn_0321: TAdvGlowButton;
    mn_0323: TAdvGlowButton;
    AdvToolBar4: TAdvToolBar;
    mn_0211: TAdvGlowButton;
    AdvToolBar5: TAdvToolBar;
    mn_0414: TAdvGlowButton;
    mn_0421: TAdvGlowButton;
    mn_0422: TAdvGlowButton;
    AdvPage1: TAdvPage;
    AdvToolBar3: TAdvToolBar;
    mn7_021: TAdvGlowButton;
    mn7_022: TAdvGlowButton;
    AdvToolBar6: TAdvToolBar;
    mn7_011: TAdvGlowButton;
    mn7_012: TAdvGlowButton;
    mn7_013: TAdvGlowButton;
    AdvToolBar7: TAdvToolBar;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    mn_0312: TAdvGlowButton;
    mn_AttendManager: TAdvGlowButton;
    StartMenu: TAdvPreviewMenu;
    ImageList2: TImageList;
    AdvPreviewMenuOfficeStyler2: TAdvPreviewMenuOfficeStyler;
    sb_Status: TAdvOfficeStatusBar;
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    Image1: TImage;
    mn_0311: TAdvGlowButton;
    mn_0322: TAdvGlowButton;
    Timer1: TTimer;
    mn_MonthAtReport: TAdvGlowButton;
    mn_0415: TAdvGlowButton;
    mn_0413: TAdvGlowButton;
    AdvPage2: TAdvPage;
    AdvToolBar10: TAdvToolBar;
    btn_RemoteControl: TAdvGlowButton;
    btn_Upgrade: TAdvGlowButton;
    mn_0231: TAdvGlowButton;
    AdvToolBar11: TAdvToolBar;
    mn7_031: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure mn_0321Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StartMenuMenuItems3Click(Sender: TObject);
    procedure StartMenuMenuItems1Click(Sender: TObject);
    procedure StartMenuMenuItems2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mn_0211MouseEnter(Sender: TObject);
    procedure mn_0312Click(Sender: TObject);
    procedure mn_0231Click(Sender: TObject);
    procedure mn_0311Click(Sender: TObject);
    procedure mn_0211Click(Sender: TObject);
    procedure mn_0221Click(Sender: TObject);
    procedure mn_0222Click(Sender: TObject);
    procedure mn_0322Click(Sender: TObject);
    procedure mn_0323Click(Sender: TObject);
    procedure mn_0411Click(Sender: TObject);
    procedure mn_0412Click(Sender: TObject);
    procedure mn_0413Click(Sender: TObject);
    procedure mn_0414Click(Sender: TObject);
    procedure mn_0415Click(Sender: TObject);
    procedure mn_AttendManagerClick(Sender: TObject);
    procedure mn_AttendReportClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mn_absentReportClick(Sender: TObject);
    procedure mn_0611Click(Sender: TObject);
    procedure mn_MonthAtReportClick(Sender: TObject);
    procedure btn_PaymentListClick(Sender: TObject);
    procedure mn_NotPayListClick(Sender: TObject);
    procedure btn_RemoteControlClick(Sender: TObject);
    procedure btn_UpgradeClick(Sender: TObject);
  private
    L_stAdminGradeCode : string;
    FPrivileges: String;
    FLogined: Boolean;
    FNowDate: String;
    { Private declarations }
    Function AcademyAttendSummary(aDate:string):Boolean;
    Function AcademyLecturePaymentSummary(aDate:string):Boolean;
    Function AcademyTable_0001_VersionMake:Boolean;
    Function AcademyTable_0002_VersionMake:Boolean;
    Function AcademyTable_0003_VersionMake:Boolean;
    Function AcademyTable_0004_VersionMake:Boolean;
    Function AcademyTable_0005_VersionMake:Boolean;
    Function AcademyTable_0006_VersionMake:Boolean;
    Function Check_AcademyTabel:Boolean;
    Function ChildFormClose(aFormNumber:integer):Boolean;
    Function FormChangeEvent(aFormNumber,aFormName:integer):Boolean;  //여기서 해당하는 폼 전체에 데이터 전송 해 주자
    Function GetAcademyTableVersion:integer;
    Function GetClientConfig:Boolean;
    Function MDIForm(FormName:string):TForm;
    Function MDIFormAllClose:Boolean;
    Function MDIChildGradeShow(FormName,FormCaption:String;aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean):Boolean;
    procedure SetLogined(const Value: Boolean);
    procedure SetPrivileges(const Value: String);
    procedure TravelAdvPageEnable(oControl:TAdvPage;ProgIDs:String);
    Procedure TravelToolBarPagerEnable(oControl:TAdvToolBarPager;ProgIDs:String);
    procedure SetNowDate(const Value: String);
  public
    { Public declarations }
    procedure FORMCHANGE(aName:integer;aValue:string);
    procedure FORMENABLE(aName:integer;aValue:string);
    procedure FORMSTATUSMSG(aIndex:integer;aMessage:string);
  published
    Property Logined : Boolean read FLogined write  SetLogined; //프로퍼티를 생성함으로 Logined라는 변수가 바뀌면 SetLogined 라는 함수가 실행됨
    Property Privileges : String read FPrivileges write SetPrivileges;
    Property NowDate : String read FNowDate write SetNowDate;
  end;

var
  fmMain: TfmMain;

implementation

uses
  uAdminUserID,
  uAttendAbsentReport,
  uAttendManager,
  uAttendMonthReport,
  uAttendReport,
  uCertificateClass,
  uCertificateCode,
  uCertificatePlan,
  uCertificateReceipt,
  uCertificateReceiptSearch,
  uClientConfig,
  uCompany,
  uCommonVariable,
  uDataBase,
  uDataBaseConfig,
  uDBCreate,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uEmployee,
  uEmployeeNotPaymentList,
  uEmployeePayment,
  uEmployeePaymentList,
  uFormVariable,
  uLectureClassCode,
  uLectureCode,
  uLectureManager,
  uLectureList,
  uLogin,
  uDBFormMessage,
  uTuitionOFF;

{$R *.dfm}

function TfmMain.AcademyAttendSummary(aDate: string): Boolean;
var
  stSql : string;
  TempQuery :TADOQuery; 
  aNowDate : TDateTime;
begin
  aNowDate := StrtoDate(copy(aDate,1,4) + '-' + copy(aDate,5,2) + '-' + copy(aDate,7,2) );
  //전체 학생을 모두 입력 하자.
  stSql := ' Insert Into TB_ACademyAttendSummary( ';
  stSql := stSql + ' AS_DATE ,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' AS_INTIME,'; //출석시간
  stSql := stSql + ' AS_OUTTIME,'; //퇴실시간
  stSql := stSql + ' AS_ATTYPE,'; //출석타입   -1.해당없음,0.미등원,1.등원,2.보강 완료
  stSql := stSql + ' AS_UPDATETIME ) '; //업데이트 시간
  stSql := stSql + ' select ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ''''',';
  stSql := stSql + ''''',';
  stSql := stSql + '-1,';
  stSql := stSql + ''''' ';
  stSql := stSql + ' From TB_EMPLOYEE A ';
  stSql := stSql + ' Where A.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND A.EM_STATECODE = 1';
  stSql := stSql + ' AND NOT EXISTS ( ';
  stSql := stSql + ' SELECT * FROM TB_ACademyAttendSummary B ';
  stSql := stSql + ' WHERE B.EM_SEQ = A.EM_SEQ ';
  stSql := stSql + ' AND B.AS_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' )';
  
  result := dmDataBase.ProcessExecSQL(stSql);

  //오늘 수업가능한 학생을 미등원 상태로 바꿔 놓자.

  stSql := ' Update A Set A.AS_ATTYPE = 0 '; 
  stSql := stSql + ' From TB_ACademyAttendSummary A,';
  stSql := stSql + ' ( select aa.* from TB_EMPLOYEELecture aa ';
(*  stSql := stSql + ' INNER Join TB_CurriculumCode bb ';
  stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
  stSql := stSql + ' AND aa.CC_CODE = bb.CC_CODE  ';
  if DayOfWeek(aNowDate) = 1 then stSql := stSql + ' AND bb.CC_SUN = ''1'' '
  else if DayOfWeek(aNowDate) = 2 then stSql := stSql + ' AND bb.CC_MON = ''1'' '
  else if DayOfWeek(aNowDate) = 3 then stSql := stSql + ' AND bb.CC_TUE = ''1'' '
  else if DayOfWeek(aNowDate) = 4 then stSql := stSql + ' AND bb.CC_WED = ''1'' '
  else if DayOfWeek(aNowDate) = 5 then stSql := stSql + ' AND bb.CC_THU = ''1'' '
  else if DayOfWeek(aNowDate) = 6 then stSql := stSql + ' AND bb.CC_FRI = ''1'' '
  else if DayOfWeek(aNowDate) = 7 then stSql := stSql + ' AND bb.CC_SAT = ''1'' ';
  stSql := stSql + ') ';
*)
  stSql := stSql + ' INNER Join TB_EMPLOYEE bb ';
  stSql := stSql + ' ON (aa.GROUP_CODE = bb.GROUP_CODE ';
  stSql := stSql + ' AND aa.EM_SEQ = bb.EM_SEQ  ';
  if DayOfWeek(aNowDate) = 1 then stSql := stSql + ' AND bb.EM_ACSUN = ''1'' '
  else if DayOfWeek(aNowDate) = 2 then stSql := stSql + ' AND bb.EM_ACMON = ''1'' '
  else if DayOfWeek(aNowDate) = 3 then stSql := stSql + ' AND bb.EM_ACTUE = ''1'' '
  else if DayOfWeek(aNowDate) = 4 then stSql := stSql + ' AND bb.EM_ACWED = ''1'' '
  else if DayOfWeek(aNowDate) = 5 then stSql := stSql + ' AND bb.EM_ACTHU = ''1'' '
  else if DayOfWeek(aNowDate) = 6 then stSql := stSql + ' AND bb.EM_ACFRI = ''1'' '
  else if DayOfWeek(aNowDate) = 7 then stSql := stSql + ' AND bb.EM_ACSAT = ''1'' ';
  stSql := stSql + ') ';
  stSql := stSql + ' where aa.EL_STATE = 1 ';
  stSql := stSql + ') B';
  stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
  stSql := stSql + ' AND A.AS_ATTYPE = -1 ';
  
  result := dmDataBase.ProcessExecSQL(stSql);
  
end;

function TfmMain.AcademyLecturePaymentSummary(aDate: string): Boolean;
var
  stSql : string;
  TempQuery :TADOQuery;
begin
  //전체 학생을 모두 입력 하자.
  stSql := ' Insert Into TB_LecturePaymentSummary( ';
  stSql := stSql + ' LP_MONTH ,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' LP_PaymentType)'; //수납타입 -1.해당없음,0.미수납,1.수납,2.부분수납
  stSql := stSql + ' select ';
  stSql := stSql + '''' + copy(aDate,1,6) + ''',';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' 0 ';
  stSql := stSql + ' From TB_EMPLOYEE A ';
  stSql := stSql + ' Where A.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND A.EM_STATECODE = 1';
  stSql := stSql + ' AND NOT EXISTS ( ';
  stSql := stSql + ' SELECT * FROM TB_LecturePaymentSummary B ';
  stSql := stSql + ' WHERE B.EM_SEQ = A.EM_SEQ ';
  stSql := stSql + ' AND B.LP_MONTH = ''' + copy(aDate,1,6) + ''' ';
  stSql := stSql + ' )';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TfmMain.AcademyTable_0001_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_ADMIN_Handphone_Add;
  dmDBCreate.AlterTB_ADMIN_Email_Add;
  dmDBCreate.AlterTB_ADMIN_ETC_Add;
  dmDBCreate.AlterTB_EMPLOYEE_BIRTHDAY_Add;
  dmDBCreate.AlterTB_EMPLOYEE_EMAIL_Add;
  dmDBCreate.AlterTB_EMPLOYEE_GRADE_Add;
  dmDBCreate.AlterTB_EMPLOYEE_SCHOOL_Add;
  dmDBCreate.AlterTB_EMPLOYEE_TuitionOFF_Add;

  dmDBCreate.CreateTB_CurriculumCode;    //강의코드
  dmDBCreate.CreateTB_EMPLOYEELecture;   //수강테이블
  dmDBCreate.CreateTB_EMPLOYEELectureHIS;   //수강이력테이블
  dmDBCreate.CreateTB_LectureClassCode;  //강의분류
  dmDBCreate.CreateTB_Tuition;      //수강료
  dmDBCreate.CreateTB_TuitionOFF;   //수강할인코드

  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','0','AC2_0','기본설정','Basic Setting','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC2_01','강사관리','Teacher','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC2_011','강사관리','Teacher','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC2_02','코드관리','Code','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC2_021','강의분류','Lecture Class','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC2_022','강의코드','Lecture Code','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC2_03','환경설정','Config','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC2_031','환경설정','Config','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','0','AC3_0','학생관리','Student','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC3_01','학생분류','Student Class','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC3_011','할인코드','Sale Code','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC3_012','학생분류','Student Class','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC3_02','학생관리','Student Manager','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC3_021','학생관리','Student Manager','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC3_022','수강관리','Enrolment','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC3_023','수강신청현황','Enrolment','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','0','AC4_0','자격증관리','certificate','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC4_01','자격증관리','certificate','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC4_011','자격증분류','certificate Class','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC4_012','자격증관리','certificate Manager','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC4_013','자격증접수','Receipt certificate','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC4_014','자격증연간계획','Annual plan','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC4_015','자격증응시내역/합격여부','certificate apply','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC4_02','월별내역','Month','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC4_021','월별자격증응시자','certificate Monthly List','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC4_022','월별자격증발급내역','certificate Issued','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','0','AC5_0','출결관리','Attended','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC5_01','출결관리','Attended','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC5_011','출결관리','Attended','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC5_012','출석현황보고서','Attendance Status','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC5_013','미등원현황','Not Attendance','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','0','AC6_0','수납관리','Storage management','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC6_01','수납관리','Storage management','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC6_011','수납관리','Storage management','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC6_02','수납현황','Storage List','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC6_021','수강료납부현황','Storage List','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC6_022','전체미납현황','Not Storage List','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC6_023','학생별미납현황','Not Storage List','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','0','AC7_0','문자관리','Message management','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC7_01','문자관리','Message management','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC7_011','공지메시지','Notice Message','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC7_012','수납메시지','Storage Message','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC7_013','메시지보내기','Send Message','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','1','AC7_02','문자내역','Message List','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC7_021','메시지관리','Message management','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All(inttostr(G_nBMSType),'1','2','AC7_022','메시지발송내역','Send Message List','1');

  dmDBInsert.InsertIntoTB_ADMINGRADE_All('1','강사');
  dmDBInsert.InsertIntoTB_LectureClassCode_Value('0','분류전체','0','1','0'); //최초그룹코드는 조회 없이 초기 권한 부분때문에 임의로 생성함

  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONCOMPANY','2','0','학생분류');        //공통
  dmDBUpdate.UpdateTB_COMPANYCODE_Field_StringValue('0','CO_COMPANYNAME','학생분류전체'); //최초회사코드는 조회 없이 초기 권한 부분때문에 임의로 생성함
  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONCOMPANYLIST','2','0','학생분류');        //공통
  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONCOMPANYNAME','2','0','학생분류');        //공통
  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONEMPLOYEESTATE','2','0','재원상태');        //공통

  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONEMPLOYEEINDATE','2','0','등록일');
  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONEMPLOYEEOUTDATE','2','0','퇴원일');
  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONEMPLOYEEHANDPHONE','2','0','학생핸드폰');
  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONEMPLOYEECOMPANYPHONE','2','0','부모핸드폰');
  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONEMPLOYEEETCINFO','2','0','주소');

  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONMANGERNAME','2','0','강사명');
  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONMANGERID','2','0','강사아이디');
  dmDBUpdate.UpdateTB_FORMNAME_Name('0','COMMONMANGERPW','2','0','비밀번호');

  dmDBUpdate.UpdateTB_FORMMESSAGE_Name('NOTSELECTEMPLOYEE','학생을 선택 하셔야 합니다.');



  dmDBUpdate.UpdateTB_EMPLOYEESTATECODE_Field_StringValue('1','EM_STATECODENAME','재원');
  dmDBUpdate.UpdateTB_EMPLOYEESTATECODE_Field_StringValue('2','EM_STATECODENAME','퇴원');




  dmDBInsert.InsertIntoTB_CONFIG_All('ACADEMY','TABLE_VER','1','테이블 버젼정보');

end;

function TfmMain.AcademyTable_0002_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_CertificateCode;    //자격증코드
  dmDBCreate.CreateTB_LecturePayment;
  dmDBCreate.CreateTB_CERTIFICATECLASSCODE;
  dmDBCreate.CreateTB_CertificateID;
  dmDBCreate.CreateTB_CertificateReceipt;
  dmDBCreate.CreateTB_CertificatePlan;
  dmDBCreate.CreateTB_consultinglist;
  dmDBCreate.CreateTB_consultinggroupphonenum;

  dmDBCreate.AlterTB_EMPLOYEE_PAYMENTDAY_Add;
  dmDBCreate.AlterTB_EMPLOYEE_LASTPAYMONTH_Add;
  dmDBCreate.AlterTB_EMPLOYEE_CGNUM_Add;
  dmDBCreate.AlterTB_EMPLOYEE_KEY_Add;
  dmDBCreate.AlterTB_CertificateCode_HOMEPAGE_Add;
  dmDBCreate.AlterTB_CurriculumCode_MON_Add;
  dmDBCreate.AlterTB_CurriculumCode_TUE_Add;
  dmDBCreate.AlterTB_CurriculumCode_WED_Add;
  dmDBCreate.AlterTB_CurriculumCode_THU_Add;
  dmDBCreate.AlterTB_CurriculumCode_FRI_Add;
  dmDBCreate.AlterTB_CurriculumCode_SAT_Add;
  dmDBCreate.AlterTB_CurriculumCode_SUN_Add;


  dmDBInsert.InsertIntoTB_CERTIFICATECLASSCODE_Value('0','분류전체','0','1','0');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('ACADEMY','TABLE_VER','CO_CONFIGVALUE','2');
end;

function TfmMain.AcademyTable_0003_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_ACademyAttend;    //학원근태테이블
  dmDBCreate.CreateTB_ACademyAttendMakeupLesson; //보강처리테이블
  dmDBCreate.CreateTB_ACademyAttendSummary;
  dmDBCreate.CreateTB_AcademySMSMessage;  //sms전송테이블
  dmDBCreate.CreateTB_AcademySMSSend ;
  dmDBCreate.CreateTB_CertificatePassGrade;  //자격증등급테이블
  dmDBCreate.CreateTB_LecturePaymentSummary;

  dmDBCreate.AlterTB_CertificateReceipt_GRADE_Add;
    
  dmDBInsert.InsertIntoTB_AcademySMSMessage_Value('1','1','$NAME 학생이 등원하였습니다.');
  dmDBInsert.InsertIntoTB_AcademySMSMessage_Value('1','2','$NAME 학생이 하원하였습니다.');
  dmDBInsert.InsertIntoTB_CertificatePassGrade_Value('1','A등급');
  dmDBInsert.InsertIntoTB_CertificatePassGrade_Value('2','B등급');
  dmDBInsert.InsertIntoTB_CertificatePassGrade_Value('3','C등급');
  dmDBInsert.InsertIntoTB_CertificatePassGrade_Value('4','D등급');
  dmDBInsert.InsertIntoTB_CertificatePassGrade_Value('5','E등급');

  dmDBInsert.InsertIntoTB_CONFIG_All('ACADEMY','ATSUMMARY',formatdateTime('yyyymmdd',now-1),'집계마지막일자');
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('ACADEMY','TABLE_VER','CO_CONFIGVALUE','3');
end;

function TfmMain.AcademyTable_0004_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('ACADEMY','ATTEND','1','학원근태사용유무');
  dmDBCreate.AlterTB_ACademyAttend_UpdateTime_Add;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('ACADEMY','TABLE_VER','CO_CONFIGVALUE','4');
end;

function TfmMain.AcademyTable_0005_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_EMPLOYEE_ACMON_Add;
  dmDBCreate.AlterTB_EMPLOYEE_ACTUE_Add;
  dmDBCreate.AlterTB_EMPLOYEE_ACWED_Add;
  dmDBCreate.AlterTB_EMPLOYEE_ACTHU_Add;
  dmDBCreate.AlterTB_EMPLOYEE_ACFRI_Add;
  dmDBCreate.AlterTB_EMPLOYEE_ACSAT_Add;
  dmDBCreate.AlterTB_EMPLOYEEe_ACSUN_Add;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('ACADEMY','TABLE_VER','CO_CONFIGVALUE','5');
end;

function TfmMain.AcademyTable_0006_VersionMake: Boolean;
begin

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('ACADEMY','TABLE_VER','CO_CONFIGVALUE','6');
end;

procedure TfmMain.btn_PaymentListClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployeePaymentList',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployeePaymentList');
  if fmTemp <> nil then
  begin
    TfmEmployeePaymentList(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmployeePaymentList(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmployeePaymentList(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmployeePaymentList(fmTemp).FormGradeRefresh;
    TfmEmployeePaymentList(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;


end;

procedure TfmMain.btn_RemoteControlClick(Sender: TObject);
var
  regKey : TRegistry;
  stPath : string;
  stUrl : string;
begin
//  ShellExecute(0, 'open', pchar('http://zeron.co.kr/help'), '','', SW_Normal);
//  MDIChildShow('TfmRemoteSupport');
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_CURRENT_USER;
    if (not regKey.KeyExists('\Software\Zeron\Seetrol')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;

      ShellExecute(0, 'open', pchar(ExtractFileDir(Application.ExeName) + '\seetrol_Setup.exe'),'','', SW_Normal);

      Exit;
    end;
    regKey.OpenKey ('\Software\Zeron\Seetrol',False);
    stPath := regKey.ReadString('path');
    if stPath = '' then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      ShellExecute(0, 'open', pchar(ExtractFileDir(Application.ExeName) + '\seetrol_Setup.exe'),'','', SW_Normal);
      Exit;
    end;
    ShellExecute(0, 'open', pchar(stPath + 'SeetrolClient.exe'), pchar('-' + formatdateTime('yyyymmddhhnnsszzz',now) + ' -zeron.co.kr -8081 -8082 -8083 -auto'),'', SW_Normal);
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY 해제
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY 해제
     regKey.Free;
end;

procedure TfmMain.btn_UpgradeClick(Sender: TObject);
begin
  if Not FileExists(G_stExeFolder + '\Academy_Manager_Update\SmartUpdate.exe') then
  begin
    showmessage('Not Install ' + btn_Upgrade.Caption + ' Tools');
    Exit;
  end;

  ShellExecute(0, 'open', pchar(G_stExeFolder + '\Academy_Manager_Update\SmartUpdate.exe'),'','', SW_Normal);
  //MyRunDosCommand(G_stExeFolder + '\Bmos\SmartUpdate.exe',False,False);
  Close;

end;

function TfmMain.Check_AcademyTabel: Boolean;
var
  nTableVersion : integer;
begin
  result := False;
  nTableVersion := GetAcademyTableVersion;
  if nTableVersion < 1 then AcademyTable_0001_VersionMake;
  if nTableVersion < 2 then AcademyTable_0002_VersionMake;
  if nTableVersion < 3 then AcademyTable_0003_VersionMake;
  if nTableVersion < 4 then AcademyTable_0004_VersionMake;
  if nTableVersion < 5 then AcademyTable_0005_VersionMake;

end;

function TfmMain.ChildFormClose(aFormNumber: integer): Boolean;
var
  fmTemp : TForm;
begin
  case aFormNumber of
    con_FormBMOSEMPLOYEE : begin
//      fmTemp := MDIForm('TfmRemoteControl');
//      if fmTemp <> nil then TfmEmployee(fmTemp).Form_Close;
    end;

  end;
end;

procedure TfmMain.FORMCHANGE(aName: integer; aValue: string);
var
  i : integer;
begin
  inherited;
  for i := 0 to HIGH(G_bFormEnabled) do
  begin
    if G_bFormEnabled[i] then FormChangeEvent(i,aName);
  end;

end;

function TfmMain.FormChangeEvent(aFormNumber, aFormName: integer): Boolean;
var
  fmTemp : TForm;
begin
(*
  case aFormNumber of
    con_FormBMOSACCESSHISREPORT : begin
      fmTemp := MDIForm('TfmAccessHisReport');
      if fmTemp <> nil then TfmAccessHisReport(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSACCESSREPORT : begin
      fmTemp := MDIForm('TfmAccessReport');
      if fmTemp <> nil then TfmAccessReport(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSARMAREACODE : begin
      fmTemp := MDIForm('TfmArmArea');
      if fmTemp <> nil then TfmArmArea(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSBUILDINGCODE : begin
      fmTemp := MDIForm('TfmBuilding');
      if fmTemp <> nil then TfmBuilding(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSBUTTONEVENTREPORT : begin
      fmTemp := MDIForm('TfmButtonEventReport');
      if fmTemp <> nil then TfmButtonEventReport(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSCARDREGESTFORM : begin
      fmTemp := MDIForm('TfmEmployeeCardCreate');
      if fmTemp <> nil then TfmEmployeeCardCreate(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSCOMPANYCODE : begin
      fmTemp := MDIForm('TfmCompany');
      if fmTemp <> nil then TfmCompany(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSDOORCODE : begin
      fmTemp := MDIForm('TfmDoorList');
      if fmTemp <> nil then TfmDoorList(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSEMPLOYEE : begin
      fmTemp := MDIForm('TfmEmployee');
      if fmTemp <> nil then TfmEmployee(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSFPCARDEMPLOYEE : begin
      fmTemp := MDIForm('TfmEmployee');
      if fmTemp <> nil then TfmEmployee(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSKTEMPLOYEE : begin
      fmTemp := MDIForm('TfmFPCardEmployee');
      if fmTemp <> nil then TfmFPCardEmployee(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSPOSICODE : begin
      fmTemp := MDIForm('TfmPosiCode');
      if fmTemp <> nil then TfmPosiCode(fmTemp).FormChangeEvent(aFormName);
    end;
  end; *)
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Logined := False;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('DataBase Connected Fail');
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;
  G_nBMSType := 5;
  Check_AcademyTabel;
  dmDBCreate.CreateTB_AcademySMSMessage; //SMS 메시지 테이블
  dmDBCreate.CreateTB_AcademySMSSend ; //sms전송테이블
  dmDBCreate.CreateTB_ACademyAttendSummary;
  dmDBCreate.CreateTB_ACademyAttendMakeupLesson; //보강처리테이블
  dmDBCreate.CreateTB_CertificatePassGrade;     //자격증등급테이블
  dmDBCreate.CreateTB_LecturePayment;
  dmDBCreate.CreateTB_LecturePaymentSummary;

  dmDBCreate.AlterTB_CertificateReceipt_GRADE_Add;
  
  dmDBInsert.InsertIntoTB_AcademySMSMessage_Value('1','1','$NAME 학생이 등원하였습니다.');
  dmDBInsert.InsertIntoTB_AcademySMSMessage_Value('1','2','$NAME 학생이 하원하였습니다.');
  dmDBInsert.InsertIntoTB_CertificatePassGrade_Value('1','A등급');
  dmDBInsert.InsertIntoTB_CertificatePassGrade_Value('2','B등급');
  dmDBInsert.InsertIntoTB_CertificatePassGrade_Value('3','C등급');
  dmDBInsert.InsertIntoTB_CertificatePassGrade_Value('4','D등급');
  dmDBInsert.InsertIntoTB_CertificatePassGrade_Value('5','E등급');

  dmDBInsert.InsertIntoTB_CONFIG_All('ACADEMY','ATSUMMARY',formatdateTime('yyyymmdd',now-1),'집계마지막일자');

  GetClientConfig;
  at_Menu.ActivePage := ApManager;
end;

procedure TfmMain.FORMENABLE(aName: integer; aValue: string);
var
  bValue : Boolean;
begin
  Try
    if UpperCase(aValue) = 'TRUE' then bValue := True
    else bValue := False;

    G_bFormEnabled[aName] := bValue;   //해당 폼

  Except
    Exit;
  End;
end;

procedure TfmMain.FormResize(Sender: TObject);
var
  nImageHight : integer;
  nImageWidth : integer;
begin
  sb_Status.Panels[0].Width := 150;
  sb_Status.Panels[2].Width := 100;
  sb_Status.Panels[3].Width := 100;
  sb_Status.Panels[2].Width := Width - 350;

  nImageWidth := 1919;
  nImageHight := 928;

  Image1.Width := Width;
  Image1.Height := nImageHight * width div nImageWidth;

  Image1.Top := at_Menu.Height + (Height - at_Menu.Height - sb_Status.Height) div 2 - (Image1.Height div 2);
  Image1.Left := 0;

end;

procedure TfmMain.FormShow(Sender: TObject);
var
  stLogoFile : string;
  stAttendSummaryDate:string;
  dtAtSummaryDate : TDate;
begin
  Logined := False;
  Privileges := '';
  stLogoFile := G_stExeFolder + '\Logo.JPG';
  if FileExists(stLogoFile) then
    Image1.Picture.LoadFromFile(stLogoFile);

  stAttendSummaryDate := dmDBFunction.GetTB_CONFIG_Value('ACADEMY','ATSUMMARY');
  dtAtSummaryDate := strtoDate(copy(stAttendSummaryDate,1,4) + '-' + copy(stAttendSummaryDate,5,2) + '-' + copy(stAttendSummaryDate,7,2) );

  while(formatDateTime('yyyymmdd',dtAtSummaryDate) < formatDateTime('yyyymmdd',now) ) do
  begin
    AcademyAttendSummary(formatDateTime('yyyymmdd',dtAtSummaryDate));
    
    dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('ACADEMY','ATSUMMARY','CO_CONFIGVALUE',formatDateTime('yyyymmdd',dtAtSummaryDate));

    dtAtSummaryDate := dtAtSummaryDate + 1; //다음날 처리
  end;
  NowDate := FormatDateTime('yyyymmdd',now);
  Timer1.Enabled := True;
end;

procedure TfmMain.FORMSTATUSMSG(aIndex: integer; aMessage: string);
begin
  sb_Status.Panels[aIndex].Text := aMessage;
end;

function TfmMain.GetAcademyTableVersion: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''ACADEMY'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''TABLE_VER'' ';
  with dmDataBase.ADOTempQuery do
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
    Try
      result := strtoint(FindField('CO_CONFIGVALUE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TfmMain.GetClientConfig: Boolean;
var
  ini_fun : TiniFile;
begin
  G_nCardRegisterType := 1;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MIAMS.INI');
    with ini_fun do
    begin
      //G_nCardRegisterType := ReadInteger('Config','CardRegType',0);  //0.일반등록기,1.슈프리마지문등록기
      G_stCardRegisterIP := ReadString('Config','CardRegIP','');
      G_stCardRegisterFingerPort := ReadString('Config','CardFingerRegPort','1471');
    end;
  Finally
    ini_fun.free;
  End;
end;

function TfmMain.MDIChildGradeShow(FormName, FormCaption: String; aInsertGrade,
  aUpdateGrade, aDeleteGrade: Boolean): Boolean;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := False;
  tmpClass := FindClass(FormName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if G_bApplicationTerminate then Exit;

      if Screen.Forms[i].ClassNameIs(FormName) then
      begin
        Screen.Forms[i].Show;
        result := True;
        Exit;
      end;
    end;

    if G_bApplicationTerminate then Exit;
    if Not G_bApplicationTerminate then tmpFormClass := TFormClass(tmpClass);
    if Not G_bApplicationTerminate then tmpForm := tmpFormClass.Create(Self);
    if Not G_bApplicationTerminate then tmpForm.Caption := FormCaption;
    if Not G_bApplicationTerminate then TfmASubForm(tmpForm).IsInsertGrade := aInsertGrade;
    if Not G_bApplicationTerminate then TfmASubForm(tmpForm).IsUpdateGrade := aUpdateGrade;
    if Not G_bApplicationTerminate then TfmASubForm(tmpForm).IsDeleteGrade := aDeleteGrade;
    if Not G_bApplicationTerminate then tmpForm.Show;
    result := True;
  end;
end;

function TfmMain.MDIForm(FormName: string): TForm;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        result := Screen.Forms[i];
        Exit;
      end;
    end;
  end;
end;

Function TfmMain.MDIFormAllClose:Boolean;
var
  i : integer;
begin
  for i := 0 to HIGH(G_bFormEnabled) do
  begin
    if G_bFormEnabled[i] then ChildFormClose(i);
  end;
end;

procedure TfmMain.mn_0211Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAdminUserID',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAdminUserID');
  if fmTemp <> nil then
  begin
    TfmAdminUserID(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAdminUserID(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAdminUserID(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAdminUserID(fmTemp).FormGradeRefresh;
    TfmAdminUserID(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_0211MouseEnter(Sender: TObject);
var
  stMessage : string;
begin
  stMessage := dmFormMessage.GetMessage('WORKEXCUTE');
  stMessage := stringReplace(stMessage,'$WORK',TAdvGlowButton(Sender).Caption,[rfReplaceAll]);
  FORMSTATUSMSG(2,stMessage);

end;

procedure TfmMain.mn_0221Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmLectureClassCode',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmLectureClassCode');
  if fmTemp <> nil then
  begin
    TfmLectureClassCode(fmTemp).IsInsertGrade := bInsertGrade;
    TfmLectureClassCode(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmLectureClassCode(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmLectureClassCode(fmTemp).FormGradeRefresh;
    TfmLectureClassCode(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_0222Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmLectureCode',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmLectureCode');
  if fmTemp <> nil then
  begin
    TfmLectureCode(fmTemp).IsInsertGrade := bInsertGrade;
    TfmLectureCode(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmLectureCode(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmLectureCode(fmTemp).FormGradeRefresh;
    TfmLectureCode(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_0231Click(Sender: TObject);
begin
  fmClientConfig := TfmClientConfig.create(self);
  fmClientConfig.ShowModal;
  fmClientConfig.Free;
  GetClientConfig;
end;

procedure TfmMain.mn_0311Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmTuitionOFF',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmTuitionOFF');
  if fmTemp <> nil then
  begin
    TfmTuitionOFF(fmTemp).IsInsertGrade := bInsertGrade;
    TfmTuitionOFF(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmTuitionOFF(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmTuitionOFF(fmTemp).FormGradeRefresh;
    TfmTuitionOFF(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_0312Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCompany',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmCompany');
  if fmTemp <> nil then
  begin
    TfmCompany(fmTemp).IsInsertGrade := bInsertGrade;
    TfmCompany(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmCompany(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmCompany(fmTemp).FormGradeRefresh;
    TfmCompany(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_0321Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployee',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployee');
  if fmTemp <> nil then
  begin
    TfmEmployee(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmployee(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmployee(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmployee(fmTemp).FormGradeRefresh;
    TfmEmployee(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_0322Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmLectureManager',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmLectureManager');
  if fmTemp <> nil then
  begin
    TfmLectureManager(fmTemp).IsInsertGrade := bInsertGrade;
    TfmLectureManager(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmLectureManager(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmLectureManager(fmTemp).FormGradeRefresh;
    TfmLectureManager(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_0323Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmLectureList',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmLectureList');
  if fmTemp <> nil then
  begin
    TfmLectureList(fmTemp).IsInsertGrade := bInsertGrade;
    TfmLectureList(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmLectureList(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmLectureList(fmTemp).FormGradeRefresh;
    TfmLectureList(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_0411Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmcertificateClass',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmcertificateClass');
  if fmTemp <> nil then
  begin
    TfmcertificateClass(fmTemp).IsInsertGrade := bInsertGrade;
    TfmcertificateClass(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmcertificateClass(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmcertificateClass(fmTemp).FormGradeRefresh;
    TfmcertificateClass(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_0412Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCertificateCode',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmCertificateCode');
  if fmTemp <> nil then
  begin
    TfmCertificateCode(fmTemp).IsInsertGrade := bInsertGrade;
    TfmCertificateCode(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmCertificateCode(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmCertificateCode(fmTemp).FormGradeRefresh;
    TfmCertificateCode(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_0413Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCertificateReceipt',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmCertificateReceipt');
  if fmTemp <> nil then
  begin
    TfmCertificateReceipt(fmTemp).IsInsertGrade := bInsertGrade;
    TfmCertificateReceipt(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmCertificateReceipt(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmCertificateReceipt(fmTemp).FormGradeRefresh;
    TfmCertificateReceipt(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_0414Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCertificatePlan',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmCertificatePlan');
  if fmTemp <> nil then
  begin
    TfmCertificatePlan(fmTemp).IsInsertGrade := bInsertGrade;
    TfmCertificatePlan(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmCertificatePlan(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmCertificatePlan(fmTemp).FormGradeRefresh;
    TfmCertificatePlan(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_0415Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCertificateReceiptSearch',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmCertificateReceiptSearch');
  if fmTemp <> nil then
  begin
    TfmCertificateReceiptSearch(fmTemp).IsInsertGrade := bInsertGrade;
    TfmCertificateReceiptSearch(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmCertificateReceiptSearch(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmCertificateReceiptSearch(fmTemp).FormGradeRefresh;
    TfmCertificateReceiptSearch(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_0611Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployeePayment',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployeePayment');
  if fmTemp <> nil then
  begin
    TfmEmployeePayment(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmployeePayment(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmployeePayment(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmployeePayment(fmTemp).FormGradeRefresh;
    TfmEmployeePayment(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
 
end;

procedure TfmMain.mn_absentReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAttendAbsentReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAttendAbsentReport');
  if fmTemp <> nil then
  begin
    TfmAttendAbsentReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAttendAbsentReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAttendAbsentReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAttendAbsentReport(fmTemp).FormGradeRefresh;
    TfmAttendAbsentReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_AttendManagerClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAttendManager',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAttendManager');
  if fmTemp <> nil then
  begin
    TfmAttendManager(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAttendManager(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAttendManager(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAttendManager(fmTemp).FormGradeRefresh;
    TfmAttendManager(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_AttendReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAttendReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAttendReport');
  if fmTemp <> nil then
  begin
    TfmAttendReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAttendReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAttendReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAttendReport(fmTemp).FormGradeRefresh;
    TfmAttendReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_MonthAtReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAttendMonthReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAttendMonthReport');
  if fmTemp <> nil then
  begin
    TfmAttendMonthReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAttendMonthReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAttendMonthReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAttendMonthReport(fmTemp).FormGradeRefresh;
    TfmAttendMonthReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_NotPayListClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployeeNotPaymentList',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployeeNotPaymentList');
  if fmTemp <> nil then
  begin
    TfmEmployeeNotPaymentList(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmployeeNotPaymentList(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmployeeNotPaymentList(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmployeeNotPaymentList(fmTemp).FormGradeRefresh;
    TfmEmployeeNotPaymentList(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.SetLogined(const Value: Boolean);
var
  i : integer;
begin
//  if FLogined = Value then Exit;

  FLogined := Value;

  if Not Value then
  begin
    MDIFormAllClose;
    FORMSTATUSMSG(2,dmFormMessage.GetMessage('LOGOUTMESSAGE'));
  end else
  begin
    FORMSTATUSMSG(2,dmFormMessage.GetMessage('LOGINMESSAGE'));
  end;

  if G_bApplicationTerminate then Exit;


  StartMenu.MenuItems.Items[1].Enabled := Not Value;
  StartMenu.MenuItems.Items[2].Enabled := Value;

end;

procedure TfmMain.SetNowDate(const Value: String);
begin
  if FNowDate = Value then Exit;

  FNowDate := Value;
  AcademyAttendSummary(Value);
  AcademyLecturePaymentSummary(Value);

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('ACADEMY','ATSUMMARY','CO_CONFIGVALUE',Value);
end;

procedure TfmMain.SetPrivileges(const Value: String);
begin
  FPrivileges := Value;
  TravelToolBarPagerEnable(at_Menu,Value); //메뉴 Enable
end;

procedure TfmMain.StartMenuMenuItems1Click(Sender: TObject);
begin
  TLogin.GetObject.ShowLoginDlg(inttostr(G_nBMSType));
  G_stAdminUserID := TLogin.GetObject.UserID;
  G_stAdminUserName := TLogin.GetObject.UserName;
  L_stAdminGradeCode := Trim(TLogin.GetObject.Grade);
  Privileges :=TLogin.GetObject.ProgIDs; //권한설정
  Logined := TLogin.GetObject.Logined;
  FORMSTATUSMSG(0,G_stAdminUserName);
end;

procedure TfmMain.StartMenuMenuItems2Click(Sender: TObject);
begin
  Logined:= False;
  Privileges := '';
end;

procedure TfmMain.StartMenuMenuItems3Click(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  NowDate := FormatDateTime('yyyymmdd',now);
end;

procedure TfmMain.TravelAdvPageEnable(oControl: TAdvPage; ProgIDs: String);
var
  Loop : Integer;
  stName : string;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    if oControl.Controls[Loop] <> nil then
    begin
      Try
        stName := oControl.Controls[Loop].Name;
        if oControl.Controls[Loop].Tag = 1 then
        begin
          if Pos(oControl.Controls[Loop].Hint,ProgIDs) > 0 then oControl.Controls[Loop].Enabled := True
          else oControl.Controls[Loop].Enabled := False;
        end;
        Try
          if copy(stName,1,length('AdvToolBarSeparator')) <> 'AdvToolBarSeparator' then
            TravelAdvPageEnable(TAdvPage(oControl.Controls[Loop]), ProgIDs);
        Except
          continue;
        End;
      Except
        Exit;
      End;
    end;
  end;
end;

procedure TfmMain.TravelToolBarPagerEnable(oControl: TAdvToolBarPager;
  ProgIDs: String);
var
  Loop : Integer;
  stName : string;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    stName := oControl.Controls[Loop].Name;
    if oControl.Controls[Loop].Tag = 1 then
    begin
      if Pos(oControl.Controls[Loop].Hint,ProgIDs) > 0 then oControl.Controls[Loop].Enabled := True
      else oControl.Controls[Loop].Enabled := False;
    end;
    Try
      TravelAdvPageEnable(TAdvPage(oControl.Controls[Loop]), ProgIDs);
    Except
      continue;
    End;

  end;
end;

end.
