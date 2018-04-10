﻿unit uDBFormName;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmFormName = class(TDataModule)
  private
    { Private declarations }
    function GetTableFormNameVersion:integer;
    function FormTable_0001_VersionMake:Boolean;
    function FormTable_0002_VersionMake:Boolean;
    function FormTable_0003_VersionMake:Boolean;
    function FormTable_0004_VersionMake:Boolean;
    function FormTable_0005_VersionMake:Boolean;
    function FormTable_0006_VersionMake:Boolean;
    function FormTable_0007_VersionMake:Boolean;
    function FormTable_0008_VersionMake:Boolean;
    function FormTable_0009_VersionMake:Boolean;
    function FormTable_0010_VersionMake:Boolean;
    function FormTable_0011_VersionMake:Boolean;
    function FormTable_0012_VersionMake:Boolean;
    function FormTable_0013_VersionMake:Boolean;
    function FormTable_0014_VersionMake:Boolean;
    function FormTable_0015_VersionMake:Boolean;
    function FormTable_0016_VersionMake:Boolean;
    function FormTable_0017_VersionMake:Boolean;
    function FormTable_0018_VersionMake:Boolean;
    function FormTable_0019_VersionMake:Boolean;
    function FormTable_0020_VersionMake:Boolean;
    function FormTable_0021_VersionMake:Boolean;
    function FormTable_0022_VersionMake:Boolean;
    function FormTable_0023_VersionMake:Boolean;
    function FormTable_0024_VersionMake:Boolean;
    function FormTable_0025_VersionMake:Boolean;
    function FormTable_0026_VersionMake:Boolean;
    function FormTable_0027_VersionMake:Boolean;
    function FormTable_0028_VersionMake:Boolean;
  public
    { Public declarations }
    Function FormNameVersionCheck:Boolean;
  end;

var
  dmFormName: TdmFormName;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
uses
  uDataBase,
  uDBInsert,
  uDBUpdate;

{$R *.dfm}

{ TdmFormName }

function TdmFormName.FormNameVersionCheck: Boolean;
var
  nTableVersion : integer;
begin
  result := False;
  nTableVersion := GetTableFormNameVersion;
  if nTableVersion < 1 then FormTable_0001_VersionMake;
  if nTableVersion < 2 then FormTable_0002_VersionMake;
  if nTableVersion < 3 then FormTable_0003_VersionMake;
  if nTableVersion < 4 then FormTable_0004_VersionMake;
  if nTableVersion < 5 then FormTable_0005_VersionMake;
  if nTableVersion < 6 then FormTable_0006_VersionMake;
  if nTableVersion < 7 then FormTable_0007_VersionMake;
  if nTableVersion < 8 then FormTable_0008_VersionMake;
  if nTableVersion < 9 then FormTable_0009_VersionMake;
  if nTableVersion < 10 then FormTable_0010_VersionMake;
  if nTableVersion < 11 then FormTable_0011_VersionMake;
  if nTableVersion < 12 then FormTable_0012_VersionMake;
  if nTableVersion < 13 then FormTable_0013_VersionMake;
  if nTableVersion < 14 then FormTable_0014_VersionMake;
  if nTableVersion < 15 then FormTable_0015_VersionMake;
  if nTableVersion < 16 then FormTable_0016_VersionMake;
  if nTableVersion < 17 then FormTable_0017_VersionMake;
  if nTableVersion < 18 then FormTable_0018_VersionMake;
  if nTableVersion < 19 then FormTable_0019_VersionMake;
  if nTableVersion < 20 then FormTable_0020_VersionMake;
  if nTableVersion < 21 then FormTable_0021_VersionMake;
  if nTableVersion < 22 then FormTable_0022_VersionMake;
  if nTableVersion < 23 then FormTable_0023_VersionMake;
  if nTableVersion < 24 then FormTable_0024_VersionMake;
  if nTableVersion < 25 then FormTable_0025_VersionMake;
  if nTableVersion < 26 then FormTable_0026_VersionMake;
  if nTableVersion < 27 then FormTable_0027_VersionMake;
  if nTableVersion < 28 then FormTable_0028_VersionMake;

  result := True;

end;

function TdmFormName.FormTable_0001_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','FORMNAME_VER','1','폼테이블 버젼');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM1_0','프로그램','Program','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM1_1','로그인','LogIn','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM1_2','로그아웃','LogOut','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM1_3','종료','Exit','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM1_01','프로그램정보','Program Information','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM1_02','Version','Version','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM2_0','기본설정','Basic Setting','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM2_01','노드관리','Node','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM2_02','기기설정','Device Setting','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM2_03','CCTV설정','CCTV Setting','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM3_0','운영관리','Access Manager','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM3_011','장비통신현황','Device State Monitoring','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM3_012','PC통신현황','PC State Monitoring','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','0','BM1_0','프로그램','Program','0');   //모니터링
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM1_1','로그인','LogIn','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM1_2','로그아웃','LogOut','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM1_3','종료','Exit','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM1_01','프로그램정보','Program Information','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM1_02','Version','Version','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','0','BM2_0','기본설정','Basic Setting','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM2_01','코드관리','Code','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_011','소속코드','Comapany','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_012','위치코드','Building','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_013','직위코드','Jobtitle','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_014','공휴일','Holiday','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_015','타임코드','Time Code','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM2_02','기기관리','Device','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_021','출입문','Door','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_022','방범구역','ArmArea','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM2_03','맵관리','Map','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_031','위치맵','Building Map','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_032','방범맵','ArmArea Map','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_033','출입맵','Door Map','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','0','BM3_0','운영관리','Management','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM3_01','시스템운영','System Mangement','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_010','카드발급','CardCreate','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_011','사원관리','Employee','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_012','모니터링','Monitoring','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_013','방범모니터링','Security Monitoring','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_014','통합모니터링','Integrate Monitoring','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_015','Server통신','Server Monitoring','1');
  //dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_016','출입시간','Access Time','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM3_02','제어','Device Control','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_021','상태조회','Device State','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_022','화재복구','Fire Recovery','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_023','데몬재시작','DAEMON RESTART','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','0','BM4_0','보고서','Report','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM4_01','출입','ACCESS','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_011','출입보고서','ACCESS Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_012','이력보고서','History Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_013','알람보고서','Alarm Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_014','방범구역별 출입보고서','ArmArea Access Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_015','출입문 운영보고서','Door Management Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_016','기기버젼정보','Device Version Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_017','근태보고서','Attend Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','0','BM5_0','관리자','Manager','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM5_01','관리자','Manager','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM5_011','등급코드','Grade Code','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM5_0112','등급코드권한','Grade Code Permit','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM5_012','관리자ID','Manger ID','1');

  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_011pm001','소속코드추가','ChildCode Add','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_012pm001','위치코드추가','ChildCode Add','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_013pm001','직위코드추가','Jobtitle Add','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_014pm001','직원구분코드추가','EmployeeClass Add','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_015pm001','사원그룹코드추가','EmployeeGroup Add','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_021btn001','출입문일괄관리','Door Mangement','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_022btn001','방범구역위치관리','Arm Area Building','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_011pm001','사원추가','Add','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_011pm002','개인별권한관리','Employee Permit Admin','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_011pm003','기본권한관리적용','Basic Permit Apply','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_011pm004','사원삭제','Delete','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_011cap001','카드관리','Card Management','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012cap001','모니터링','Monitoring','0');

  dmDBInsert.InsertIntoTB_FORMNAME_All('0','0','0','2','출입시스템','ACCESS SYSTEM','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','0','0','3','근태시스템','ATTEND SYSTEM','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','0','0','4','식수시스템','FOOD SYSTEM','0');

  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONADD001','추가','ADD','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONAPPLY','적용','APPLY','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONCLEAR001','화면지움','CLEAR','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONCOMPLETE001','작업완료','APPLY','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONDEL001','삭제','DELETE','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONFILESAVE001','파일저장','FILE SAVE','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONMENU001','닫기','Close','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONMENU002','관리','Management','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONMENU003','추가','Add','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONMENU004','이전','Previous','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONMENU005','모니터링','Monitoring','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONPERMITADD001','권한추가','Add','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONPERMITDELETE001','권한삭제','Delete','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONPLAY001','시작','START','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONPLAY002','중지','STOP','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONSAVE001','저장','SAVE','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONSEARCH001','조회','SEARCH','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONSEARCH002','선택','SEARCH','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONUPDATE001','수정','UPDATE','0');

  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALLNAME','전체','ALL','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONACCESS','출입','Access','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONACCESSCONTROLTYPE','조작타입코드','Access Control Type','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONACCESSCONTROLTYPENAME','조작타입명','Access Control Type','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONACCESSDATE','출입날짜','Access Date','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONACCESSPERMITCODE','출입승인코드','Access PermitCode','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONACCESSPERMITNAME','출입승인상태','Access Permit State','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONACCESSTIME','출입시간','Access Date','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONADD','추가','Add','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONADMINGRADENAME','관리자등급','Manager Grade','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMCODE','알람코드','Alarm Event Code','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMCODENAME','알람내용','Alarm Code Name','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMCONFIRMNAME','조치내역','Alarm Event Confirm','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMCONFIRMID','확인자','Confirm ID','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMCONFIRMTIME','확인시간','Confirm Time','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMDATE','날짜','Alarm Date','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMDEVICENO','기기번호','Device Number','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMDEVICETYPE','기기타입','Device Type','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMOPER','Operator','Alarm Operator','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMTIME','시간','Alarm Time','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMZONENAME','존명칭','Zone Name','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMZONENO','존번호','Zone Number','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMZONESTATE','존상태','Zone STATE','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONARMAREA','방범구역','Security Area','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONARMAREANAME','방범구역명','Security Area Name','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONARMAREANOTPERMIT','미등록방범구역','Not Permission ArmArea','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONARMAREAREPERMIT','등록방범구역','Permission ArmArea','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONARMAREAPERMITADMIN','방범권한관리','Security privileges','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONARMEVENTGROUP','경보그룹','Alarm Event Group','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONARMEVENTTYPE','경보종류','Alarm Event Type','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONARMMODE','방범모드','Security Arm Mode','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATINRESULT','출근상태','Attend In State','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATINTIME','출근시간','Attend In Time','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATOUTRESULT','퇴근상태','Attend Out State','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATOUTTIME','퇴근시간','Attend Out Time','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATTEND','근태','Attend','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATTENDCODE','근태코드','Attend Code','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATTENDDATE','근태날짜','Attend Date','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATTENDTYPE','근태타입','Attend Type','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATWORKEDEXTIME','연장근무시간','Worked Time','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATWORKEDNHTIME','야간근무시간','Worked Time','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATWORKEDTIME','근무시간','Worked Time','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATWORKINTIME','복귀시간','Attend Return Time','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONATWORKOUTTIME','외출시간','Attend Outing Time','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONBUILDING','위치','Building','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONBUILDINGINFO','위치정보','Building Information','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONBUILDINGNAME','위치명','Building Name','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONBUTTON','버튼','Button','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCARD','카드','Card','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCARDSTATE','카드상태','Card State','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCARDTYPE','카드종류','CardType','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCARDNUMBER','카드번호','CardNumber','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCOMPANY','소속','Company','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCOMPANYNAME','소속명','Department Name','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCONTROLERID','컨트롤러ID','Controler ID','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDATE','날짜','Date','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDELETE','삭제','DELETE','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDEVICE','컨트롤러','Device','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDEVICECOUNT','컨트롤러갯수','Device Count','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDEVICENAME','컨트롤러명','Device','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDEVICETYPE','기기종류','Device Type','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDEVICEVER','기기버젼','Device Version','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDOOR','출입문','Door','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDOORMEMO','메모','MEMO','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDOORNAME','출입문명','Door Name','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDOORNOTPERMIT','미등록출입문','Not Permission Door','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDOORPERMITADMIN','출입권한관리','Access privileges','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDOORREGPERMIT','등록출입문','Permission Door','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDOORRELAYCODE','연동코드','RelayCode','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEEAUTOCODE','자동생성','Auto Employee Code','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEECODE','사번','Employee Code','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEECOMPANYPHONE','사내전화번호','CompanyPhone','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEEETCINFO','기타사원정보','Other Info','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEEGUBUN','직원구분','Employee Class','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEEGROUP','권한그룹','Employee Group','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEEHANDPHONE','핸드폰','HandPhone','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEEINDATE','입사일','Entry Date','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEENAME','이름','Employee Name','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEEOUTDATE','퇴사일','Leaving Date','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEEPOSI','직위','Job title','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEEPOSINAME','직위명','Job title Name','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMPLOYEESTATE','재직상태','Employee State','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONETCNAME','기타','Other','0');  //조회 항목
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODNAME','식수','FOOD','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONHOLIDAYNAME','공휴일','HOLIDAY','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONLIST01','리스트','LIST','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONMANGEDETAIL','운영내역','Management Detail','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONMANGERID','운영자ID','Management ID','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONMANGERNAME','운영자명','Management NAME','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONMANGERPW','운영자비밀번호','Management Password','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONMASTER','마스터','Master','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONMENUGROUP','메뉴그룹','Menu Group','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONNODENAME01','노드명','Node Name','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONNODECMD01','명령어','COMMAND','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONNODEMSG01','MSGNO','MSGNO','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONNODEVER01','VER','VER','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONNODEDATA01','DATA','DATA','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONNODEIP01','노드아이피','Node IP','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONNODELIST02','노드추가','Node Add','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONNODELIST03','노드수정','Node Update','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONPCIP','PCIP','PCIP','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONPROGRAMNAME','프로그램','Program','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONPROGRAMGROUP','프로그램그룹','Program Group','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONREADER','카드리더','Card Reader','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONREADERNO','리더번호','Reader Number','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONREADERPOSI','리더위치','Reader Position','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONREGNOTPROGRAM','미등록프로그램','Not Permit Program ','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONREGPROGRAM','등록프로그램','Permit Program','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSEARCHCOUNT01','조회건수','Count','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIME','시간','TIME','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIME01','시간','TIME','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTXRX01','TX/RX','TX/RX','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMECODE','타임코드','TIMECODE','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEDOORUSE','타임코드사용유무','ACCESSTIME USE','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEGROUP','타임그룹','ACCESSTIME GROUP','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEWEEK','주간','ACCESSTIME WEEK','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEWEEKSUN','일','SUN','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEWEEKMON','월','MON','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEWEEKTUE','화','TUE','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEWEEKWED','수','WED','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEWEEKTHU','목','THU','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEWEEKFRI','금','FRI','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEWEEKSAT','토','SAT','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONUPDATE','수정','UPDATE','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONYEAR','년도','YEAER','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONZONENAME','존명칭','ZONE NAME','0');
end;

function TdmFormName.FormTable_0002_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_018','식수보고서','Food Report','1');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','2');

end;

function TdmFormName.FormTable_0003_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_017','소속별권한','Company Permission','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_018','그룹별권한','GROUP Permission','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_019','출입시간','Access Time','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_020','출입문스케줄','Door Schedule','1');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','3');

end;

function TdmFormName.FormTable_0004_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODDATE','날짜','DATE','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODTIME','시간','TIME','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODDOOR','식수위치','DOOR','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODTYPE','식수타입','FOOD TYPE','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODGUBUN','식수구분','FOOD CODE','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODAMT','식수금액','FOODAMT','0');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','4');
end;

function TdmFormName.FormTable_0005_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODBREAK','조식','BREAK','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODLUNCH','중식','LUNCH','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODDINNER','석식','DINNER','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODMIDNIGHT','야식','MIDNIGHT','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODTOT','합계','Total','0');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','5');
end;

function TdmFormName.FormTable_0006_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONCANCEL001','취소','CANCEL','0');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','6');
end;

function TdmFormName.FormTable_0007_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_011','소속코드를 등록/수정/삭제 할 수 있습니다.','Management Company Code','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_016','직원구분','Employee Class','1');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','7');
end;

function TdmFormName.FormTable_0008_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_017','그룹코드','Group Code','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_016pm001','직원구분코드 추가','Add Employee Class','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_017pm001','그룹코드 추가','Add Group Code','0');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','8');
end;

function TdmFormName.FormTable_0009_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_023','존관리','Zone','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONZONEBUILDING','존 위치관리','Zone Building','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_012Name','소속','Company','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCOMPANYLIST','소속 리스트','Company List','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_011List','사원 리스트','Employee List','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONGROUPLIST','그룹 리스트','Group List','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_017_01','선택된소속권한','Company Permission','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_018_01','선택된그룹권한','Group Permission','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_024','카드권한조회','Card Permission','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_015List','서버통신현황','PC State','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONFILESAVE002','엑셀','Excel','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM5_012List','관리자 리스트','Admin List','0');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','9');
end;

function TdmFormName.FormTable_0010_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('4','1','1','BM3_01','시스템운영','System Mangement','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('4','1','2','BM3_011','사원관리','Employee','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('4','1','2','BM3_012','식수리더설정','Food Reader','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('4','1','2','BM3_013','식수관제','Food Monitoring','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('4','1','2','BM3_015','Server통신','Server Monitoring','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('4','1','2','BM3_021','상태조회','Device State','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('4','1','2','BM3_023','데몬재시작','DAEMON RESTART','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('4','1','2','BM3_030','식수보고서','Food Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('4','1','2','BM3_031','식수통계보고서','Food Statistics','1');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','10');
end;

function TdmFormName.FormTable_0011_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','0','BM6_0','기타','Other','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','1','BM6_01','사원연동','Employee Work','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM6_02','환경설정','Config','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM6_03','원격지원','RemoteSupport','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM6_04','업그레이드','Upgrade','0');

  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONLOGIN','로그인','Login','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONUSERID','사용자ID','USER ID','0'); //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONUSERPW','사용자PW','USER PW','0'); //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCONFIRM','확인','Confirm','0');        //공통

  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012Caption','모니터링','Monitoring','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012AccessMonitor','출입모니터링','Access Monitoring','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012AlarmMonitor','방범모니터링','Alarm Monitoring','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012Controler','컨트롤러상태','Device State','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DoorState','출입문상태','Door State','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012AlarmState','방범구역상태','Alarm State','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012Example','범례','Example','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012NodeState','노드상태','Node','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DeviceState','기기상태','Device','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012NDisCon','끊김','DisConnect','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012NCon','연결','Connect','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012NPartCon','부분연결','Connect','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DDisCon','끊김','DisConnect','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DCon','연결','Connect','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DOOROPEN','개방','DoorOpen','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DOORPM','운영-Positive','DoorClose-Positive','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DOORNM','운영-Negative','DoorClose-Negative','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DOORLOCK','폐쇄','DoorLock','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DOORMODE','출입문모드','Door Mode','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DoorOState','열림상태','DoorOpen State','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DoorCState','닫힘상태','DoorClose State','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DoorTimeOver','장시간열림','time Over','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DoorFire','화재열림','Fire','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012NodeIP','Node IP','Node IP','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DeviceID','DeviceID','DeviceID','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DoorID','DoorID','DoorID','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DoorPosition','위치','Building','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DisArmMode','해제모드','DisArm Mode','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012ArmMode','경계모드','Arm Mode','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012Alarm','알람발생','Alarm','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012ArmEvent','알람이벤트','Alarm Event','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012DoorInfo','출입문정보','Door Info','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012ArmAreaInfo','방범구역정보','ArmArea Info','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012ArmAreaPosition','위치','Building','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012ArmAreaTel','전화번호','TelNumber','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012ArmAreaMemo','메모','Memo','0','메모');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012AccessEvent','출입이벤트','AccessEvent','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012AccessAlarm','장비이상발생이벤트','DeviceAlarmEvent','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012ArmModeChange','모드변경','Mode Change','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_012AEAccessTime','출입시간','AccessTime','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALARMCONTENT','이상발생내용','Alarm Content','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONARMAREANO','방범구역번호','ArmArea No','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONPORTNO','포트번호','Port','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDEVICELIST','컨트롤러리스트','Device List','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIME02','타임','TIME','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSELECTBUILDING','선택된위치 ','Select Position ','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONGROUP','그룹','GROUP','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONHH','시','H','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONMM','분','M','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_014_01','기본공휴일','Basic','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDOORGUBUN','출입문구분','Door Group','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_021_01','출입문위치관리','Door Building','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_021_02','출입문구분관리','Door Group','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_022List','방범구역리스트','Arm Area','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_022_01','방범구역위치관리','Arm Area Building','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCCTV','CCTV','CCTV','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM2_023List','존리스트','Zone Area','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONBUILDINGLIST','빌딩리스트','Building List','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONLINEWIDTH','라인굵기','Line Width','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCARDREAD','카드읽기','Reading Card','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFINGER','지문','Finger','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCARDGRADE','카드권한','Card Permission','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_011_01','일괄소속관리','Company Change','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_011_02','일괄그룹관리','Group Change','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','2','0','BM3_011_03','일괄유효기간관리','Validate Change','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCOUNT','건','','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONPERSONGRADE','개인별권한','Person Permission','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSELECTEMP','현재선택된사원','Select Employee','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCONTROLERTIME','컨트롤러 출입시간','Access Time','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDOORLIST','출입문리스트','Door List','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONREGSCHEDULE','스케줄등록','Regist Schedule','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONWEEKSCHEDULE','평일스케줄','Week Schedule','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSATSCHEDULE','토요일스케줄','Saturday Schedule','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSUNSCHEDULE','일요일스케줄','Sunday Schedule','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONHOLSCHEDULE','공휴일스케줄','Holiday Schedule','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTIMEINIT','시간초기화','Time Initialize','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALLCLOSE','전체운영모드','All Close','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALLOPEN','전체개방모드','All Open','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONALLLOCK','전체폐쇄모드','All LOCK','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSECTION','구간','Section','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONDOORMODE','출입문모드','Door Mode','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCLOSEMODE','운영모드','Close Mode','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONOPENMODE','개방모드','Open Mode','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONLOCKMODE','폐쇄모드','LOCK Mode','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONREPORT','보고서','Report','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','BUTTONSEARCHOPTION','조회옵션','Option','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONPRINT','출력','Print','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEMSEQ','사번순서','Seq','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONACCPERMIT','출입권한','Door Permission','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSEND','전송상태','Door Sended','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFINGERSEND','지문전송상태','Finger Sended','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM6_05','명칭변경','Change Name','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','2','COMMONNAMETYPE','명칭타입','Name Type','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','2','COMMONFORMNAME','폼명칭','Form Name','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','2','COMMONFORMMESSAGE','폼메시지','Form Message','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','2','COMMONSEARCHDATE','조회기간','Search Date','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_019','방범구역 운영보고서','ArmArea Management Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_020','식수통계보고서','Food Statistics','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGALARMSET','방범설정','Alarm Setting','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGACCESSSET','출입설정','Access Setting','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGMONISET','모니터링설정','Monitoring Setting','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGREGPORTSET','등록기포트설정','Reader Port Setting','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGALARM','알람데이터','Alarm','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGALARMEVENT','방범 이상시 알람 발생','Security alarm abnormal','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGZONEDETECTION','존 감지시 메시지표시','Prompt detection zone','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGALARMFILE','알람파일','Alarm File','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGALARMCOUNT','알람발생횟수','Alarm Count','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGALARMCNTTXT','회(0회 입력시 무제한 반복)','(0 - Repeat unlimited)','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGACCESSEVENT','출입이벤트','Access Event','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGACCESSFIRE','화재 발생시 이벤트 발생','Event of fire occurs','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGLONGOPEN','장시간열림시 알람 발생','Event of Long Time Door Open','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGCARDMODE','카드모드사용유무','Card Mode','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGLOGINSTART','로그인시모니터링시작','The start of the monitor at login','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGMONITORTYPE','모니터링타입','Monitoring Type','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGBUILDINGVIEW','빌딩표시','View Building','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGCARDTYPE','등록기타입','Regist Type','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGCARDPORT','등록기포트','Regist Port','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCONFIGCARDIP','등록기IP','Regist IP','0');


  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','11');
end;

function TdmFormName.FormTable_0012_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOOROPEN','출입문열기','출입문열기','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMJAVARAOPEN','자바라열기','자바라열기','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMJAVARACLOSE','자바라닫기','자바라닫기','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOORPOSI','Positive','Positive','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOORNEGA','Negative','Negative','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOORCARDMODE','카드모드','CardMode','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOORSTATESEARCH','출입문상태조회','출입문상태조회','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMSCREEN','화면','Screen','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMBIGICON','큰아이콘','Large Icon','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMSMALLICON','작은아이콘','Small Icon','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMALARMCONFIRM','알람확인','알람확인','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMARMSTATESEARCH','방범구역상태조회','방범구역상태조회','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDEVICEINFO','기기정보','기기정보','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOORSCHUSE','스케줄사용유무','스케줄사용유무','0');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','12');

end;

function TdmFormName.FormTable_0013_VersionMake: Boolean;
var
  stSql : string;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCUT','잘라내기','CROP','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMPASTE','붙여넣기','Paste','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMNOTUSE','사용안함','Not Use','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMUSE','사용함','Use','0');

  stSql := ' Update A Set ';
  stSql := stSql + ' A.FN_NAME2 = B.FN_NAME2 ,';
  stSql := stSql + ' A.FN_NAME3 = B.FN_NAME3 ';
  stSql := stSql + ' From TB_FORMNAME A,';
  stSql := stSql + ' ( select FN_NAME2,FN_NAME3 from TB_FORMNAME where FN_PROGRAMGUBUN = ''2'' and FN_NAMECODE = ''BM4_020'' ';
  stSql := stSql + ' ) B ';
  stSql := stSql + ' WHERE FN_PROGRAMGUBUN = ''4'' and FN_NAMECODE = ''BM3_031'' ';
  dmDataBase.ProcessExecSQL(stSql);

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','13');
end;

function TdmFormName.FormTable_0014_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMCARDNOCOPY','카드번호복사','CARD NUMBER Copy','0');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','14');
end;

function TdmFormName.FormTable_0015_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_021','근태관리','Attend Mangement','1','考勤管理');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSS','초','S','0','秒');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','15');
end;

function TdmFormName.FormTable_0016_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_022','근태집계','Attend Summary','1','考勤集計');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','2','COMMONDATETERM','기간','Date','0','期間');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','16');
end;

function TdmFormName.FormTable_0017_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','2','COMMONATSUMMARY','집계','Summary','0','集計');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','17');
end;

function TdmFormName.FormTable_0018_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM2_04','ANTIPASS GROUP','ANTIPASS GROUP','0','ANTIPASS GROUP');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONANTIGROUP','ANTIPASSGROUP','ANTIPASSGROUP','0','ANTIPASSGROUP');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','18');
end;

function TdmFormName.FormTable_0019_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCARDINC','카드번호포함','Include CardNo','0','Include CardNo');        //공통
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','19');
end;

function TdmFormName.FormTable_0020_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSEQ','순서','SEQ','0','SEQ');        //공통
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','20');
end;

function TdmFormName.FormTable_0021_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMOCONGIG','모니터링환경설정','Monitoring Config','0','Monitoring Config');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMLOGINMONISTART','로그인후모니터링시작','MonitoringStart after Login','0','MonitoringStart after Login');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONITYPE','모니터링타입','Monitoring Type','0','Monitoring Type');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONIAUTOSTART','자동시작','AutoStart','0','AutoStart');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONINOTSTART','시작안함','Not Start','0','Not Start');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONMONITORING','범용모니터링','Common Type','0','Common Type');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONMAPMONITORING','맵타입','Map Type','0','Map Type');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','21');
end;

function TdmFormName.FormTable_0022_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONNODENO','노드번호','Node No','0','Node No');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONEXTENDNO','확장기번호','Extend No','0','Extend No');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','22');
end;

function TdmFormName.FormTable_0023_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOOROPENMODEOPEN','개방모드출입문열림','Open Mode Door Open','0','Open Mode Door Open');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOOROPENMODECLOSE','개방모드출입문닫힘','Open Mode Door Close','0','Open Mode Door Close');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOORCLOSEMODEOPEN','운영모드출입문열림','Close Mode Door Open','0','Close Mode Door Open');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOORCLOSEMODECLOSE','운영모드출입문닫힘','Close Mode Door Close','0','Close Mode Door Close');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOORLOCKMODEOPEN','폐쇄모드출입문열림','Lock Mode Door Open','0','Lock Mode Door Open');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMDOORLOCKMODECLOSE','폐쇄모드출입문닫힘','Lock Mode Door Close','0','Lock Mode Door Close');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','23');
end;

function TdmFormName.FormTable_0024_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFOODGROUP','식수그룹','FOOD GROUP','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('1','1','0','BM2_05','서버관리','Server Manager','0');
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSERVERNAME','서버명칭','Server Name','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSERVERIP','서버IP','Server IP','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSERVERID','서버아이디','Server ID','0');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','24');

end;

function TdmFormName.FormTable_0025_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_012','위치코드를 등록/수정/삭제 할 수 있습니다.','Management Building Code','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_013','직위코드를 등록/수정/삭제 할 수 있습니다.','Management JobTitle Code','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_014','스케줄 사용에 따른 공휴일을 등록/수정/삭제 할 수 있습니다.','Management Holiday','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_015','출입카드의 타임구간의 시간을 등록/수정/삭제 할 수 있습니다.','Management TimeCode','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_016','직원구분코드를 등록/수정/삭제 할 수 있습니다.','Management Employee Class','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_017','그룹코드를 등록/수정/삭제 할 수 있습니다.','Management Group Code','0');        //공통

  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_021','출입문을 등록/수정/삭제 할 수 있습니다.','Management Door','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_022','방범구역을 등록/수정/삭제 할 수 있습니다.','Management Arm Area','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_023','존을 등록/수정/삭제 할 수 있습니다.','Management Zone','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_024',' 분기국사 관리','Management Office','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_024','분기국사를 등록/수정/삭제 할 수 있습니다..','Management Office','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM2_025','리더전화번호','Management Telephone Number','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_025','리더전화번호를 등록/수정/삭제 할 수 있습니다.','Management Telephone Number','0');        //공통

  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_031','빌딩맵을 등록/수정/삭제 할 수 있습니다.','Management Building Map','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_032','방범맵을 등록/수정/삭제 할 수 있습니다.','Management ArmArea Map','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM2_033','출입맵을 등록/수정/삭제 할 수 있습니다.','Management Door Map','0');        //공통

  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_011','사원정보를 등록/수정/삭제 할 수 있습니다.','Management Employee','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_012','출입문 모니터링을 할 수 있습니다.','Monitoring','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_013','방범구역 모니터링을 할 수 있습니다.','Monitoring','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_014','통합 모니터링을 할 수 있습니다.','Monitoring','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_015','서버와 통신상태를 모니터링 할 수 있습니다.','Monitoring','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_017','소속별 권한을 등록/수정/삭제 할 수 있습니다.','Management Company Grade','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_018','그룹별 권한을 등록/수정/삭제 할 수 있습니다.','Management Group Grade','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_019','출입시간을 등록/수정/삭제 할 수 있습니다.','Management Access Time','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_020','출입문 스케줄을 관리 할 수 있습니다.','Management Door Schedule','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_021','상태 재전송을 요청합니다.','Refresh State','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_022','화재복구 신호를 전송합니다.','Fire Recovery','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_023','통신서버를 재시작합니다.','Restart DeviceServer','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_024','출입권한을 조회 할 수 있습니다.','Search Door Grade','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_025','비밀번호','PassWord','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_025','비밀번호를 등록/수정/삭제 할 수 있습니다.','Search Door Grade','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_101','식수리더','Food Reader','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_101','식수리더를 등록/수정/삭제 할 수 있습니다.','Food Reader','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_102','식수모니터링','Food Monitoring','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_102','식수상태를 모니터링 할 수 있습니다.','Food Monitoring','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_105','부서통계보고서','Food Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_105','부서통계보고서를 조회합니다.','Food Report','0');        //공통

  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_011','출입보고서를 조회합니다.','Access Event Report','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_012','출입이력보고서를 조회합니다.','Access Event Report','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_013','방범구역 알람내역을 조회합니다.','Alarm Event Report','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_014','방범구역별 출입내역을 조회합니다.','Access Event Report','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_015','출입문 운영내역을 조회합니다.','Door Manager Report','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_016','기기 버젼정보를 조회합니다.','Device Version Report','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_017','근태 정보를 조회합니다.','Attend Report','0');        //공통
//  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_103','식수보고서','Food Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_018','식수보고서를 조회합니다.','Food Report','0');        //공통
//  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_104','식수통계보고서','Food Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_020','식수통계보고서를 조회합니다.','Food Report','0');        //공통

  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM5_011','관리자등급코드를 등록/수정/삭제 할 수 있습니다.','Grade Code Manager','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM5_0112','관리자등급권한을 등록/수정/삭제 할 수 있습니다.','Grade Code Manager','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM5_012','관리자아이디를 등록/수정/삭제 할 수 있습니다.','User ID','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM5_021','노드관리','Node','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM5_021','노드를 등록/수정/삭제 할 수 있습니다.','Node Manager','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM5_022','서버관리','Server','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM5_022','서버를 등록/수정/삭제 할 수 있습니다.','Server Manager','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM5_023','컨트롤러관리','Controler','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM5_023','컨트롤러를 등록/수정/삭제 할 수 있습니다.','Controler Manager','0');        //공통

  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM6_01','사원정보연동환경을 설정할 수 있습니다.','Relay Config','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM6_02','프로그램 환경을 설정할 수 있습니다.','Program Config','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM6_03','원격지원 요청을 합니다.','Remote Service','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM6_04','프로그램 업그레이드를 진행 합니다.','Program Upgrade','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM6_05','명칭변경을 수행 합니다.','Name Change','0');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','25');
end;

function TdmFormName.FormTable_0026_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_026','사원신청','Employee Regist','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_026','사원신청을 할 수 있습니다.','Employee Regist','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM3_027','사원승인','Employee Approve','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM3_027','사원승인을 할 수 있습니다.','Employee Approve','0');        //공통

  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM5_013','필수항목관리','Critical Item','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM5_013','필수항목을 설정 할 수 있습니다.','Critical Item','0');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','26');
end;

function TdmFormName.FormTable_0027_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_023','출입/퇴실통계 보고서','Card/Button Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_023','출입/퇴실통계 내역을 조회합니다.','Card/Button Report','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_024','출입문상태 보고서','Door State Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_024','출입문상태 내역을 조회합니다.','Door State Report','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('2','1','2','BM4_025','이상발생 보고서','Door Alarm Report','1');
  dmDBInsert.InsertIntoTB_FORMNAME_All('3','1','0','BM4_025','이상발생 내역을 조회합니다.','Door Alarm Report','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONTEL','전화','TELEPHONE','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONFIRE','화재','FIRE','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONREMOTE','원격','REMOTE','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONSCHEDULE','스케줄','Schedule','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONCBRATIO','출입/버튼비율','Card/Button Ratio','0');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','27');
end;

function TdmFormName.FormTable_0028_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONLASTEMNAME','최종출입자','LastAccess','0');        //공통
  dmDBInsert.InsertIntoTB_FORMNAME_All('0','2','0','COMMONLASTCARD','최종출입카드','LastAccess','0');        //공통

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FORMNAME_VER','CO_CONFIGVALUE','28');
end;

function TdmFormName.GetTableFormNameVersion: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''FORMNAME_VER'' ';
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

end.
