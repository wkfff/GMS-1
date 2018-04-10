unit uDBCreate;

interface

uses
  System.SysUtils, System.Classes,Winapi.ActiveX,Data.Win.ADODB;

type
  TdmDBCreate = class(TDataModule)
    { Private declarations }
  public
    { Public declarations }
    Function AlterTB_ACademyAttend_UpdateTime_Add : Boolean;
    Function AlterTB_ACCESSCARDMODE_CARDMODENAME3_Add : Boolean;
    Function AlterTB_ACCESSCARDMODE_CARDMODENAME_Change : Boolean;
    Function AlterTB_ACCESSCONTROLTYPE_CONTROLTYPECODENAME3_Add : Boolean;
    Function AlterTB_ACCESSCONTROLTYPE_CONTROLTYPECODENAME_Change : Boolean;
    Function AlterTB_ACCESSDOORMODE_DOORMODENAME3_Add : Boolean;
    Function AlterTB_ACCESSDOORMODE_DOORMODENAME_Change : Boolean;
    Function AlterTB_ACCESSEVENT_ATSUMMARY_Add : Boolean;
    function AlterTB_ACCESSEVENT_CONTROLTYPECODE_LanguageTypeChange:Boolean;
    Function AlterTB_ACCESSEVENT_EMNAME_Change : Boolean;
    Function AlterTB_ACCESSEVENT_PRINTNO_Add : Boolean;
    Function AlterTB_ACCESSEVENT_RELAY_Add : Boolean;
    Function AlterTB_ACCESSEVENT_TELNUM_Add : Boolean;
    Function AlterTB_ACCESSPERMITCODE_PERMITCODENAME3_Add : Boolean;
    Function AlterTB_ACCESSPERMITCODE_PERMITCODENAME_Change : Boolean;
    Function AlterTB_ADMIN_Email_Add : Boolean;
    Function AlterTB_ADMIN_EMGROUPCODE_Add : Boolean;
    Function AlterTB_ADMIN_ENCODER_Add : Boolean;
    Function AlterTB_ADMIN_ETC_Add : Boolean;
    Function AlterTB_ADMIN_Handphone_Add : Boolean;
    Function AlterTB_ADMIN_USERNAME_Change : Boolean;
    Function AlterTB_ADMINGRADECODE_GRADECODENAME_Change : Boolean;
    Function AlterTB_ALARMDEVICETYPE_ALARMDEVICETYPENAME_Change : Boolean;
    Function AlterTB_ALARMEVENT_CHECKMSG_Change : Boolean;
    Function AlterTB_ALARMEVENTSTATECODE_EVENTSTATECODENAME3_Add : Boolean;
    Function AlterTB_ALARMEVENTSTATECODE_EVENTSTATECODENAME_Change : Boolean;
    Function AlterTB_ALARMEVENTSTATEGROUP_NAME3_Add : Boolean;
    Function AlterTB_ALARMEVENTSTATEGROUP_NAME_Change : Boolean;
    Function AlterTB_ALARMEVENTSTATEPCCODE_EVENTSTATEPCCODENAME3_Add : Boolean;
    Function AlterTB_ALARMEVENTSTATEPCCODE_EVENTSTATEPCCODENAME_Change : Boolean;
    Function AlterTB_ALARMMODECODE_ARMMODENAME3_Add : Boolean;
    Function AlterTB_ALARMMODECODE_ARMMODENAME_Change : Boolean;
    Function AlterTB_ALARMPORTSTATE_PORTSTATENAME3_Add : Boolean;
    Function AlterTB_ALARMPORTSTATE_PORTSTATENAME_Change : Boolean;
    Function AlterTB_ArmArea_ARMAREANAME_Change : Boolean;
    Function AlterTB_ATTENDCODE_CODENAME_Change : Boolean;
    Function AlterTB_ATTENDINOUTCODE_NAME_Change : Boolean;
    Function AlterTB_ATTENDEVENT_RELAY_Add : Boolean;
    Function AlterTB_ATTENDEVENT_USER_Add : Boolean;
    Function AlterTB_ATTENDFILEFORMAT_GUBUN_Add : Boolean;
    Function AlterTB_ATTENDPOSITION_AP_ATSTARTBUTTON_Change: Boolean;
    Function AlterTB_ATTENDPOSITION_AP_ATOFFBUTTON_Change: Boolean;
    Function AlterTB_ATTENDPOSITION_AP_INOUTDEVICETYPE_Change: Boolean;
    Function AlterTB_ATTENDPOSITION_AP_WORKOUTBUTTON_Change: Boolean;
    Function AlterTB_ATTENDPOSITION_AP_WORKINBUTTON_Change: Boolean;
    Function AlterTB_ATTENDPOSITION_NAME_Change : Boolean;
    Function AlterTB_ATTENDWORKTYPE_NAME_Change : Boolean;
    Function AlterTB_ATTENDEVENT_EMNAME_Change : Boolean;
    Function AlterTB_ATTENDEVENTLIST_EMNAME_Change : Boolean;
    Function AlterTB_BUILDINGCODE_BUILDINGNAME_Change : Boolean;
    Function AlterTB_CARD_CardPrintNo_Add : Boolean;
    Function AlterTB_CARDGUBUN_CARDGUBUNNAME_Change : Boolean;
    Function AlterTB_CARDPERMITCOMPANYGROUP_APPROVE_Add :Boolean;
    Function AlterTB_CARDPERMITEMPLOYEECODE_APPROVE_Add :Boolean;
    Function AlterTB_CARDPERMITEMPLOYEEGROUP_APPROVE_Add :Boolean;
    Function AlterTB_CARDPERMIT_APPROVE_Add : Boolean;
    Function AlterTB_CARDPERMIT_CP_MEMLOAD_Add : Boolean;
    Function AlterTB_CARDPERMIT_PASSWD_Add : Boolean;
    Function AlterTB_CARDPRINTLIST_Ix01 : Boolean;
    Function AlterTB_CARDSTATE_STATECODENAME3_Add : Boolean;
    Function AlterTB_CARDSTATE_STATECODENAME_Change : Boolean;
    Function AlterTB_CCTV_NAME_Change : Boolean;
    Function AlterTB_CertificateCode_HOMEPAGE_Add : Boolean;
    Function AlterTB_CertificateReceipt_GRADE_Add : Boolean;
    Function AlterTB_COMPANYCODE_AutoPermitDelete_Add : Boolean;
    Function AlterTB_COMPANYCODE_CompanyNAME_Change : Boolean;
    Function AlterTB_COMPANYCODE_RelayCompanyCode_Add : Boolean;
    Function AlterTB_CurriculumCode_MON_Add: Boolean;
    Function AlterTB_CurriculumCode_TUE_Add: Boolean;
    Function AlterTB_CurriculumCode_WED_Add: Boolean;
    Function AlterTB_CurriculumCode_THU_Add: Boolean;
    Function AlterTB_CurriculumCode_FRI_Add: Boolean;
    Function AlterTB_CurriculumCode_SAT_Add: Boolean;
    Function AlterTB_CurriculumCode_SUN_Add: Boolean;
    Function AlterTB_DECODER_DIRECTPORT_Add : Boolean;
    Function AlterTB_DECODER_FTPPort_Add : Boolean;
    Function AlterTB_DEVICE_ARMAREAUSE_Add : Boolean;
    Function AlterTB_DEVICE_DEVICEHANGE_Add : Boolean;
    Function AlterTB_DEVICE_DEVICENAME_Change : Boolean;
    Function AlterTB_DOOR_AntiGroupCode_Add : Boolean;
    Function AlterTB_DOOR_AntiNo_Add : Boolean;
    Function AlterTB_DOOR_ATType_Add : Boolean;
    Function AlterTB_DOOR_DoorMemo_Add : Boolean;
    Function AlterTB_DOOR_DOORNAME_Change : Boolean;
    Function AlterTB_DOOR_OPENDOORALARM_Add : Boolean;
    Function AlterTB_DOOR_DOOROPENSTATE_Add : Boolean;
    Function AlterTB_DOOR_DOTIME_Add : Boolean;
    Function AlterTB_DOOR_FDType_Add : Boolean;
    Function AlterTB_DOOR_LASTACCESSCARD_Add : Boolean;
    Function AlterTB_DOOR_LASTACCESSTIME_Add : Boolean;
    Function AlterTB_DOOR_LTSTATE_Add : Boolean;
    Function AlterTB_DOOR_LASTLDTIME_Add : Boolean;
    Function AlterTB_DOOR_MEMLOAD_Add : Boolean;
    Function AlterTB_DOOR_RelayID_Add : Boolean;
    Function AlterTB_DOOR_RelayIDChange_Add : Boolean;
    Function AlterTB_DOORGUBUN_NAME_Change : Boolean;
    Function AlterTB_DOORRCV_DOORSCHUSE_Add : Boolean;
    Function AlterTB_DOORTELEVENT_USERNAME_Add : Boolean;
    Function AlterTB_EMPLOYEE_ACMON_Add : Boolean;
    Function AlterTB_EMPLOYEE_ACTUE_Add : Boolean;
    Function AlterTB_EMPLOYEE_ACWED_Add : Boolean;
    Function AlterTB_EMPLOYEE_ACTHU_Add : Boolean;
    Function AlterTB_EMPLOYEE_ACFRI_Add : Boolean;
    Function AlterTB_EMPLOYEE_ACSAT_Add : Boolean;
    Function AlterTB_EMPLOYEEe_ACSUN_Add : Boolean;
    Function AlterTB_EMPLOYEE_APPROVEMSG_Add : Boolean;
    Function AlterTB_EMPLOYEE_APPROVEUSERID_Add : Boolean;
    Function AlterTB_EMPLOYEE_APPROVE_Add : Boolean;
    Function AlterTB_EMPLOYEE_BIRTHDAY_Add : Boolean;
    Function AlterTB_EMPLOYEE_CARDUSE_Add : Boolean;
    Function AlterTB_EMPLOYEE_CGNUM_Add : Boolean;
    Function AlterTB_EMPLOYEE_EMAIL_Add : Boolean;
    Function AlterTB_EMPLOYEE_EMNAME_Change : Boolean;
    Function AlterTB_EMPLOYEE_GRADE_Add : Boolean;
    Function AlterTB_EMPLOYEE_KEY_Add : Boolean;
    Function AlterTB_EMPLOYEE_MEMLOAD_Add : Boolean;
    Function AlterTB_EMPLOYEE_LASTPAYMONTH_Add : Boolean;
    Function AlterTB_EMPLOYEE_PAYMENTDAY_Add : Boolean;
    Function AlterTB_EMPLOYEE_REGUSERID_Add : Boolean;
    Function AlterTB_EMPLOYEE_RelayUse_Add : Boolean;
    Function AlterTB_EMPLOYEE_RelayCode_Add : Boolean; //AreaCode 입력 받자
    Function AlterTB_EMPLOYEE_RelayDate_Add : Boolean;
    Function AlterTB_EMPLOYEE_SCHOOL_Add : Boolean;
    Function AlterTB_EMPLOYEE_TuitionOFF_Add : Boolean;
    Function AlterTB_EMPLOYEEGROUPCODE_AutoPermitDelete_Add : Boolean;
    Function AlterTB_EMPLOYEEGROUPCODE_GROUPCODENAME_Change : Boolean;
    Function AlterTB_EMPLOYEEGUBUN_GUBUNCODENAME_Change : Boolean;
    Function AlterTB_EMPLOYEEGUBUN_RelayCode_Add : Boolean;
    Function AlterTB_EMPLOYEEHIS_EMNAME_Change : Boolean;
    Function AlterTB_EMPLOYEESTATECODE_STATECODENAME_Change : Boolean;
    Function AlterTB_FINGERDEVICE_BUILDINGCODE_Add : Boolean;
    Function AlterTB_FINGERDEVICE_CHANGE_Add : Boolean;
    Function AlterTB_FINGERDEVICE_FINGERDEVICEID_Add : Boolean;
    Function AlterTB_FINGERDEVICE_DEVICENAME_Change : Boolean;
    Function AlterTB_FIREGROUP_GROUPCODENAME_Change : Boolean;
    Function AlterTB_FOODCODE_NAME_Change : Boolean;
    Function AlterTB_FOODCODE_InitTime_Add : Boolean;
    Function AlterTB_FOODEVENT_CARDNO_Add : Boolean;
    Function AlterTB_FOODEVENT_EMNAME_Change : Boolean;
    Function AlterTB_FOODEVENT_FDSUMMARY_Add : Boolean;
    Function AlterTB_FOODEVENT_FGCODE_Add : Boolean;
    Function AlterTB_FOODEVENT_RELAYUSE_Add : Boolean;
    Function AlterTB_FOODTYPE_FDTYPENAME_Change : Boolean;
    Function AlterTB_FOODTYPE_YesterDayTime_Add : Boolean;
    Function AlterTB_FORMMESSAGE_MESSAGENAME3_Add : Boolean;
    Function AlterTB_FORMMESSAGE_MESSAGENAME_Change : Boolean;
    Function AlterTB_FORMMESSAGE_MESSAGENAME1_Change : Boolean;
    Function AlterTB_FORMNAME_NAME3_Add : Boolean;
    Function AlterTB_FORMNAME_NAME_Change : Boolean;
    Function AlterTB_GUESTLIST_AREACODE_Add : Boolean;
    Function AlterTB_HOLIDAY_HONAME3_Add : Boolean;
    Function AlterTB_HOLIDAY_HONAME_Change : Boolean;
    Function AlterTB_HOLIDAY_HOTYPE_Add : Boolean;
    Function AlterTB_HOLIDAYDEVICE_HOTYPE_Add : Boolean;
    Function AlterTB_NODE_ADDDate_Add:Boolean;
    Function AlterTB_NODE_ADDR_Add : Boolean;
    Function AlterTB_NODE_BUILDINGCODE_Add : Boolean;
    Function AlterTB_NODE_DEVICETYPE_Add : Boolean;
    Function AlterTB_NODE_DECODERNO_Add : Boolean;
    Function AlterTB_NODE_DECORDERNOCHANGE_Add : Boolean;
    Function AlterTB_NODE_DELETE_Add : Boolean;
    Function AlterTB_NODE_LASTNETSTATE_Add : Boolean;
    Function AlterTB_NODE_LASTNETTIME_Add :Boolean;
    Function AlterTB_NODE_MEMLOAD_Add : Boolean;
    Function AlterTB_NODE_NODENAME_Change : Boolean;
    Function AlterTB_NODE_OLDDECORDERNO_Add : Boolean;
    Function AlterTB_NODE_TELNUM_Add : Boolean;
    Function AlterTB_NODEDEVICETYPECODE_PGTYPE_Add : Boolean;
    Function AlterTB_POSICODE_POSICODENAME_Change : Boolean;
    Function AlterTB_Reader_BuildingCode_Add : Boolean;
    Function AlterTB_Reader_FGCODE_Add : Boolean;
    Function AlterTB_Reader_NAME_CHANGE : Boolean;
    Function AlterTB_READERBUILDINGPOSITIONCODE_BUILDINGPOSITIONCODENAME3_Add : Boolean;
    Function AlterTB_READERBUILDINGPOSITIONCODE_BUILDINGPOSITIONCODENAME_Change : Boolean;
    Function AlterTB_READERDOORPOSITIONCODE_DOORPOSITIONCODENAME3_Add : Boolean;
    Function AlterTB_READERDOORPOSITIONCODE_DOORPOSITIONCODENAME_Change : Boolean;
    Function AlterTB_SYSTEMLOG_CARDNO_Change : Boolean;
    Function AlterTB_SYSTEMLOG_LOGDATA_Change : Boolean;
    Function AlterTB_ZONEEXTENTION_EXTENTIONNAME_Change : Boolean;
    Function AlterTB_ZONE_ZONENAME_Change : Boolean;
  public
    Function CreateTB_ACademyAttend : Boolean;
    Function CreateTB_ACademyAttendMakeupLesson : Boolean;
    Function CreateTB_ACademyAttendSummary : Boolean;
    Function CreateTB_AcademySMSMessage : Boolean;
    Function CreateTB_AcademySMSSend : Boolean;
    Function CreateTB_ACCESSCARDMODE:Boolean;
    Function CreateTB_ACCESSCONTROLTYPE:Boolean;
    Function CreateTB_ACCESSDOORMODE:Boolean;
    Function CreateTB_ACCESSEVENT:Boolean;
    Function CreateTB_ACCESSEVENT_Ix01:Boolean;
    Function CreateTB_ACCESSPERMITCODE:Boolean;
    Function CreateTB_ADMIN:Boolean;
    Function CreateTB_ADMINBUILDING:Boolean;
    Function CreateTB_ADMINDEVICE:Boolean;
    Function CreateTB_ADMINGRADECODE:Boolean;
    Function CreateTB_ADMINGRADEPROGRAM:Boolean;
    Function CreateTB_ADMINWORKLOG:Boolean;
    Function CreateTB_ALARMEVENT:Boolean;
    Function CreateTB_ALARMDEVICETYPE:Boolean;
    Function CreateTB_ALARMEVENTOPERMODECHANGE:Boolean;
    Function CreateTB_ALARMEVENTSTATECODE:Boolean;
    Function CreateTB_ALARMEVENTSTATEGROUP:Boolean;
    Function CreateTB_ALARMEVENTSTATEPCCODE:Boolean;
    Function CreateTB_ALARMMODECODE:Boolean;
    Function CreateTB_ALARMPORTSTATE:Boolean;
    Function CreateTB_AntiGroupCode:Boolean;
    Function CreateTB_ARMAREA:Boolean;
    Function CreateTB_ATTENDCODE : Boolean;
    Function CreateTB_ATTENDEVENT : Boolean;
    Function CreateTB_ATTENDEVENTLIST : Boolean;
    Function CreateTB_ATTENDFILEFORMAT : Boolean;
    Function CreateTB_ATTENDINOUTCODE : Boolean;
    Function CreateTB_ATTENDPOSITION : Boolean;
    Function CreateTB_ATTENDWORKTYPE:Boolean;
    Function CreateTB_BMSCONFIG:Boolean;
    Function CreateTB_BUILDINGCODE:Boolean;
    Function CreateTB_BUILDINGMAP:Boolean;
    Function CreateTB_CARD:Boolean;
    Function CreateTB_CARD_DeleteTrigger:Boolean;
    Function CreateTB_CARDBUTTONEVENTSTAT:Boolean;
    Function CreateTB_CARDDELETEEVENT : Boolean;
    Function CreateTB_CARDDELETEHISTORY : Boolean;
    Function CreateTB_CARDFTPDOWNLIST:Boolean;
    Function CreateTB_CARDGUBUN:Boolean;
    Function CreateTB_CARDHIS:Boolean;
    Function CreateTB_CARDHIS_Ix01:Boolean;
    Function CreateTB_CARDPERMIT:Boolean;
    Function CreateTB_CARDPERMIT_Ix01 : Boolean;
    Function CreateTB_CARDPERMIT_Ix02 : Boolean;
    Function CreateTB_CARDPERMIT_Ix03 : Boolean;
    Function CreateTB_CARDPERMITCOMPANYGROUP:Boolean;
    Function CreateTB_CARDPERMITCOMPANYGROUP_Ix01:Boolean;
    Function CreateTB_CARDPERMITEMPLOYEECODE:Boolean;
    Function CreateTB_CARDPERMITEMPLOYEECODE_Ix01 : Boolean;
    Function CreateTB_CARDPERMITEMPLOYEECODE_Ix02 : Boolean;
    Function CreateTB_CARDPERMITEMPLOYEECODE_Ix03 : Boolean;
    Function CreateTB_CARDPERMITEMPLOYEECODE_Ix04 : Boolean;
    Function CreateTB_CARDPERMITEMPLOYEECODE_Ix05 : Boolean;
    Function CreateTB_CARDPERMITEMPLOYEEGROUP:Boolean;
    Function CreateTB_CARDPRINTLIST:Boolean;
    Function CreateTB_CARDSTATE:Boolean;
    Function CreateTB_CCTV:Boolean;
    Function CreateTB_CERTIFICATECLASSCODE : Boolean;
    Function CreateTB_CertificateCode : Boolean;
    Function CreateTB_CertificateID : Boolean;
    Function CreateTB_CertificateReceipt : Boolean;
    Function CreateTB_CertificatePassGrade : Boolean;
    Function CreateTB_CertificatePlan : Boolean;
    Function CreateTB_CLIENTSOCKET:Boolean;
    Function CreateTB_COMPANYCODE:Boolean;
    Function CreateTB_COMPANYCODEHIS:Boolean;
    Function CreateTB_CONFIG:Boolean;
    Function CreateTB_consultinglist:Boolean;
    Function CreateTB_consultinggroupphonenum:Boolean;
    Function CreateTB_CurriculumCode : Boolean;
    Function CreateTB_DECODER:Boolean;
    Function CreateTB_DEVICE:Boolean;
    Function CreateTB_DEVICERCV:Boolean;
    Function CreateTB_DOOR:Boolean;
    Function CreateTB_DOOR_Ix01 : Boolean;
    Function CreateTB_DOORGUBUN:Boolean;
    Function CreateTB_DOORRCV:Boolean;
    Function CreateTB_DOORSCHEDULE:Boolean;
    Function CreateTB_DOORSTATECODE:Boolean;
    Function CreateTB_DOORSTATEEVENT:Boolean;
    Function CreateTB_DOORTELEVENT:Boolean;   //전화출입이력 테이블
    Function CreateTB_EMPLOYEE:Boolean;
    Function CreateTB_EMPLOYEE_Ix01:Boolean;
    Function CreateTB_EMPLOYEE_Ix02:Boolean;
    Function CreateTB_EMPLOYEE_Ix03:Boolean;
    Function CreateTB_EMPLOYEEDEVICETIMECODE:Boolean;
    Function CreateTB_EMPLOYEEFINGER:Boolean;
    Function CreateTB_EMPLOYEEGROUPCODE:Boolean;
    Function CreateTB_EMPLOYEEGUBUN:Boolean;
    Function CreateTB_EMPLOYEEHIS:Boolean;
    Function CreateTB_EMPLOYEELecture:Boolean;
    Function CreateTB_EMPLOYEELectureHIS:Boolean;
    Function CreateTB_EMPLOYEESTATECODE:Boolean;
    Function CreateTB_FINGERAPPROVALNUM:Boolean;
    Function CreateTB_FINGERDEVICE:Boolean;
    Function CreateTB_FINGERDEVICECARD:Boolean;
    Function CreateTB_FIREGROUP:Boolean;
    Function CreateTB_FOODCODE : Boolean;
    Function CreateTB_FOODCODECOUNT : Boolean;
    Function CreateTB_FOODEVENT : Boolean;
    Function CreateTB_FOODGROUP : Boolean;
    Function CreateTB_FOODOUTCOUNT : Boolean;
    Function CreateTB_FOODTYPE : Boolean;
    Function CreateTB_FORMCRITICAL:Boolean;
    Function CreateTB_FORMMESSAGE:Boolean;
    Function CreateTB_FORMNAME:Boolean;
    Function CreateTB_GUESTEVENT:Boolean;
    Function CreateTB_GUESTLIST:Boolean;
    Function CreateTB_HOLIDAY:Boolean;
    Function CreateTB_HOLIDAYDEVICE:Boolean;
    Function CreateTB_LectureClassCode : Boolean;
    Function CreateTB_LecturePayment : Boolean;
    Function CreateTB_LecturePaymentSummary : Boolean;
    Function CreateTB_NODE:Boolean;
    Function CreateTB_NODEDEVICETYPECODE : Boolean;
    Function CreateTB_NODERCV:Boolean;
    Function CreateTB_POSICODE:Boolean;
    Function CreateTB_READER:Boolean;
    Function CreateTB_READERBUILDINGPOSITIONCODE:Boolean;
    Function CreateTB_READERDOORPOSITIONCODE:Boolean;
    Function CreateTB_READERRCV:Boolean;
    Function CreateTB_SETTINGINFO:Boolean;
    Function CreateTB_SYSTEMLOG:Boolean;
    Function CreateTB_TIMECODE:Boolean;
    Function CreateTB_TIMECODEDEVICE:Boolean;
    Function CreateTB_Tuition : Boolean;    //수강료 테이블
    Function CreateTB_TuitionOFF : Boolean; //수강료할인 테이블
    Function CreateTB_ZONE:Boolean;
    Function CreateTB_ZONEEXTENTION:Boolean;
    Function CreateTB_ZONEEXTENTIONRCV:Boolean;
    Function CreateTB_ZONERCV:Boolean;
    Function CreateVW_APPROV_LABOR:Boolean; //연동 테이블
    Function CreateVW_APPROV_LABOR_Ix01 : Boolean;

  end;

var
  dmDBCreate: TdmDBCreate;

implementation
uses
  uDataBase,
  uCommonFunction,
  uCommonVariable;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmDBCreate }

function TdmDBCreate.AlterTB_ACademyAttend_UpdateTime_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACademyAttend ADD AA_UpdateTime varchar(17) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ACCESSCARDMODE_CARDMODENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSCARDMODE ADD AE_CARDMODENAME3 nvarchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ACCESSCARDMODE_CARDMODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSCARDMODE ALTER COLUMN AE_CARDMODENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ACCESSCARDMODE ALTER COLUMN AE_CARDMODENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ACCESSCONTROLTYPE_CONTROLTYPECODENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSCONTROLTYPE ADD AE_CONTROLTYPECODENAME3 nvarchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ACCESSCONTROLTYPE_CONTROLTYPECODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSCONTROLTYPE ALTER COLUMN AE_CONTROLTYPECODENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ACCESSCONTROLTYPE ALTER COLUMN AE_CONTROLTYPECODENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ACCESSDOORMODE_DOORMODENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDOORMODE ADD AE_DOORMODENAME3 nvarchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ACCESSDOORMODE_DOORMODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDOORMODE ALTER COLUMN AE_DOORMODENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ACCESSDOORMODE ALTER COLUMN AE_DOORMODENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ACCESSEVENT_ATSUMMARY_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD AE_ATSUMMARY CHAR(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ACCESSEVENT_CONTROLTYPECODE_LanguageTypeChange: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE <> MSSQL then Exit;
  stSql := 'ALTER TABLE TB_ACCESSEVENT ';
  stSql := stSql + ' ALTER COLUMN AE_CONTROLTYPECODE TYPE char(1) COLLATE Korean_Wansung_CS_AS';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'COLLATE Korean_Wansung_CS_AS','',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'COLLATE Korean_Wansung_CS_AS','',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
    stSql := StringReplace(stSql,'COLLATE Korean_Wansung_CS_AS','',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ACCESSEVENT_EMNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ALTER COLUMN EM_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;


function TdmDBCreate.AlterTB_ACCESSEVENT_PRINTNO_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD CA_PRINTNO varchar(50) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ACCESSEVENT_RELAY_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD AE_RELAY char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ACCESSEVENT_TELNUM_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD AE_TELNUM varchar(20) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ACCESSPERMITCODE_PERMITCODENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSPERMITCODE ADD AP_PERMITCODENAME3 nvarchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ACCESSPERMITCODE_PERMITCODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSPERMITCODE ALTER COLUMN AP_PERMITCODENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ACCESSPERMITCODE ALTER COLUMN AP_PERMITCODENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ADMINGRADECODE_GRADECODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMINGRADECODE ALTER COLUMN AG_GRADECODENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ADMIN_Email_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD AD_EMAIL varchar(50) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ADMIN_EMGROUPCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD EM_GROUPCODE varchar(50) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ADMIN_ENCODER_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD AD_ENCODER char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ADMIN_ETC_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD AD_ETC varchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ADMIN_Handphone_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD AD_HANDPHONE varchar(50) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ADMIN_USERNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ALTER COLUMN AD_USERNAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ALARMDEVICETYPE_ALARMDEVICETYPENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICETYPE ALTER COLUMN AL_ALARMDEVICETYPENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ALARMEVENTSTATECODE_EVENTSTATECODENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENTSTATECODE ADD AE_EVENTSTATECODENAME3 nvarchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ALARMEVENTSTATECODE_EVENTSTATECODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENTSTATECODE ALTER COLUMN AE_EVENTSTATECODENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ALARMEVENTSTATECODE ALTER COLUMN AE_EVENTSTATECODENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ALARMEVENTSTATEGROUP_NAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENTSTATEGROUP ADD AG_NAME3 nvarchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ALARMEVENTSTATEGROUP_NAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENTSTATEGROUP ALTER COLUMN AG_NAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ALARMEVENTSTATEGROUP ALTER COLUMN AG_NAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ALARMEVENTSTATEPCCODE_EVENTSTATEPCCODENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENTSTATEPCCODE ADD AP_EVENTSTATEPCCODENAME3 nvarchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ALARMEVENTSTATEPCCODE_EVENTSTATEPCCODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENTSTATEPCCODE ALTER COLUMN AP_EVENTSTATEPCCODENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ALARMEVENTSTATEPCCODE ALTER COLUMN AP_EVENTSTATEPCCODENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ALARMEVENT_CHECKMSG_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AE_CHECKMSG TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ALARMMODECODE_ARMMODENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMMODECODE ADD AM_ARMMODENAME3 nvarchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ALARMMODECODE_ARMMODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMMODECODE ALTER COLUMN AM_ARMMODENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ALARMMODECODE ALTER COLUMN AM_ARMMODENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ALARMPORTSTATE_PORTSTATENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMPORTSTATE ADD AP_PORTSTATENAME3 nvarchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ALARMPORTSTATE_PORTSTATENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMPORTSTATE ALTER COLUMN AP_PORTSTATENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ALARMPORTSTATE ALTER COLUMN AP_PORTSTATENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ArmArea_ARMAREANAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ArmArea ALTER COLUMN AR_ARMAREANAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ATTENDCODE_CODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDCODE ALTER COLUMN AT_CODENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ATTENDEVENTLIST_EMNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDEVENTLIST ALTER COLUMN EM_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ATTENDEVENT_EMNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDEVENT ALTER COLUMN EM_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ATTENDEVENT_RELAY_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDEVENT ADD AE_RELAY CHAR(1) DEFAULT ''N'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATTENDEVENT_USER_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDEVENT ADD AE_ATTYPEUSER VARCHAR(30) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  stSql := 'ALTER TABLE TB_ATTENDEVENT ADD AE_INUSER VARCHAR(30) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ATTENDEVENT ADD AE_WORKOUTUSER VARCHAR(30) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ATTENDEVENT ADD AE_WORKINUSER VARCHAR(30) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_ATTENDEVENT ADD AE_OUTUSER VARCHAR(30) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATTENDFILEFORMAT_GUBUN_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDFILEFORMAT ADD AF_GUBUN integer ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATTENDINOUTCODE_NAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDINOUTCODE ALTER COLUMN AC_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATTENDPOSITION_AP_ATOFFBUTTON_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDPOSITION ALTER COLUMN AP_ATOFFBUTTON TYPE varchar(30)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATTENDPOSITION_AP_ATSTARTBUTTON_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDPOSITION ALTER COLUMN AP_ATSTARTBUTTON TYPE varchar(30)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATTENDPOSITION_AP_INOUTDEVICETYPE_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDPOSITION ALTER COLUMN AP_INOUTDEVICETYPE TYPE varchar(30)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATTENDPOSITION_AP_WORKINBUTTON_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDPOSITION ALTER COLUMN AP_WORKINBUTTON TYPE varchar(30)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATTENDPOSITION_AP_WORKOUTBUTTON_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDPOSITION ALTER COLUMN AP_WORKOUTBUTTON TYPE varchar(30)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATTENDPOSITION_NAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDPOSITION ALTER COLUMN AP_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATTENDWORKTYPE_NAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATTENDWORKTYPE ALTER COLUMN AW_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_BUILDINGCODE_BUILDINGNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_BUILDINGCODE ALTER COLUMN BC_BUILDINGNAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_CARDGUBUN_CARDGUBUNNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARDGUBUN ALTER COLUMN CA_CARDGUBUNNAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARDPERMITCOMPANYGROUP_APPROVE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARDPERMITCOMPANYGROUP ADD EM_APPROVE integer default 1  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARDPERMITEMPLOYEECODE_APPROVE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARDPERMITEMPLOYEECODE ADD EM_APPROVE integer default 1  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARDPERMITEMPLOYEEGROUP_APPROVE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARDPERMITEMPLOYEEGROUP ADD EM_APPROVE integer default 1  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARDPERMIT_APPROVE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARDPERMIT ADD EM_APPROVE integer default 1  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARDPERMIT_CP_MEMLOAD_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARDPERMIT ADD CP_MEMLOAD char(1) DEFAULT ''N'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARDPERMIT_PASSWD_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARDPERMIT ADD CP_PASSWD varchar(10) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

  stSql := 'ALTER TABLE TB_CARDPERMIT ADD CP_CARDTYPE char(1) DEFAULT ''1'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARDPRINTLIST_Ix01: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDPRINTLIST_Ix01 ON TB_CARDPRINTLIST(CA_CARDNO)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARDSTATE_STATECODENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARDSTATE ADD CA_STATECODENAME3 nvarchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARDSTATE_STATECODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARDSTATE ALTER COLUMN CA_STATECODENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_CARDSTATE ALTER COLUMN CA_STATECODENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_CARD_CardPrintNo_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARD ADD CA_PRINTNO varchar(50) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_CCTV_NAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CCTV ALTER COLUMN CT_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_CertificateCode_HOMEPAGE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CertificateCode ADD CF_HOMEPAGE varchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CertificateReceipt_GRADE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CertificateReceipt ADD CG_CODE integer ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_COMPANYCODE_AutoPermitDelete_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_COMPANYCODE ADD CO_AUTOPERMITDELETE integer DEFAULT 0 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_COMPANYCODE_CompanyNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_COMPANYCODE ALTER COLUMN CO_COMPANYNAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_COMPANYCODE_RelayCompanyCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_COMPANYCODE ADD CO_RELAYCOMPANYCODE varchar(30)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CurriculumCode_FRI_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CurriculumCode ADD CC_FRI char(1)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CurriculumCode_MON_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CurriculumCode ADD CC_MON char(1)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_CurriculumCode_SAT_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CurriculumCode ADD CC_SAT char(1)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_CurriculumCode_SUN_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CurriculumCode ADD CC_SUN char(1)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_CurriculumCode_THU_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CurriculumCode ADD CC_THU char(1)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_CurriculumCode_TUE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CurriculumCode ADD CC_TUE char(1)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_CurriculumCode_WED_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CurriculumCode ADD CC_WED char(1)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_DECODER_DIRECTPORT_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DECODER ADD ND_DIRECTPORT integer ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_DECODER_FTPPort_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DECODER ADD ND_DECORDERFTPPORT integer ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_DEVICE_ARMAREAUSE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICE ADD DE_ARMAREAUSECHANGE char(1) DEFAULT ''Y'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;


function TdmDBCreate.AlterTB_DEVICE_DEVICEHANGE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICE ADD DE_DEVICEHANGE char(1) DEFAULT ''Y'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DEVICE_DEVICENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICE ALTER COLUMN DE_DEVICENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_DOORGUBUN_NAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOORGUBUN ALTER COLUMN DG_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_DOORRCV_DOORSCHUSE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOORRCV ADD DO_DOORSCHUSE CHAR(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOORTELEVENT_USERNAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOORTELEVENT ADD DE_INSERTUSERNAME varchar(100) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_AntiGroupCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD AG_CODE INTEGER DEFAULT 0 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_AntiNo_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD AG_ANTINO INTEGER DEFAULT 0 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_ATType_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_ATTYPE CHAR(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_DoorMemo_Add: Boolean;
var
  stSql : string;
begin

  stSql := 'ALTER TABLE TB_DOOR ADD DO_MEMO varchar(max) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar(max)','varchar(10485760)',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_DOORNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ALTER COLUMN DO_DOORNAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_DOOR_DOOROPENSTATE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_DOOROPENSTATE CHAR(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_DOOR_DOTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_DOTIME varchar(14) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_DOOR_FDType_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_FDTYPE CHAR(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_LASTACCESSCARD_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_LASTACCESSCARD VARCHAR(30) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_LASTACCESSTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_LASTACCESSTIME VARCHAR(14) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_LASTLDTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_LASTLDTIME varchar(17) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_LTSTATE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_LTSTATE varchar(2) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_MEMLOAD_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_MEMLOAD char(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;


function TdmDBCreate.AlterTB_DOOR_OPENDOORALARM_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_OPENDOORALARM char(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_RelayIDChange_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_RELAYIDCHANGE char(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_DOOR_RelayID_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_RELAYID integer NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEEe_ACSUN_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_ACSUN char(1) DEFAULT ''0'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEEGROUPCODE_AutoPermitDelete_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEEGROUPCODE ADD EM_AUTOPERMITDELETE integer DEFAULT 0 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEEGROUPCODE_GROUPCODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEEGROUPCODE ALTER COLUMN EM_GROUPCODENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEEGUBUN_GUBUNCODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEEGUBUN ALTER COLUMN EM_GUBUNCODENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEEGUBUN_RelayCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEEGUBUN ADD EM_RELAYCODE varchar(30) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEEHIS_EMNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEEHIS ALTER COLUMN EM_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

  stSql := 'ALTER TABLE TB_EMPLOYEEHIS ALTER COLUMN EM_EMINFO TYPE nvarchar(200)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEESTATECODE_STATECODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEESTATECODE ALTER COLUMN EM_STATECODENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_ACFRI_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_ACFRI char(1) DEFAULT ''0'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_ACMON_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_ACMON char(1) DEFAULT ''0'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_ACSAT_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_ACSAT char(1) DEFAULT ''0'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_ACTHU_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_ACTHU char(1) DEFAULT ''0'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_ACTUE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_ACTUE char(1) DEFAULT ''0'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_ACWED_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_ACWED char(1) DEFAULT ''0'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_APPROVEMSG_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_APPROVEMSG varchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_APPROVEUSERID_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_APPROVEUSERID varchar(50) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_APPROVE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_APPROVE integer default 1  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_BIRTHDAY_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_BIRTHDAY varchar(8)  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_CARDUSE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_CARDUSE integer default 0  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_CGNUM_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD CG_NUM integer default 0  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_EMAIL_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_EMAIL varchar(50)  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_EMNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ALTER COLUMN EM_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_EMPLOYEE ALTER COLUMN EM_EMINFO TYPE nvarchar(200)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_GRADE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_GRADE varchar(50) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_KEY_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_KEY varchar(30) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_LASTPAYMONTH_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_LASTPAYMONTH varchar(6) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_MEMLOAD_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_MEMLOAD CHAR(1) DEFAULT ''N'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_PAYMENTDAY_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_PAYMENTDAY integer ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_REGUSERID_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_REGUSERID varchar(50) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_RelayCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_RELAYCODE varchar(30) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_RelayDate_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_RELAYDATE varchar(17) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_RelayUse_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_RELAYUSE integer default 0  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_SCHOOL_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_SCHOOL varchar(50)  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_EMPLOYEE_TuitionOFF_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD TO_CODE integer  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FINGERDEVICE_BUILDINGCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FINGERDEVICE ADD BC_BUILDINGCODE varchar(50) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_FINGERDEVICE_CHANGE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FINGERDEVICE ADD FN_CHANGE char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FINGERDEVICE_DEVICENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FINGERDEVICE ALTER COLUMN FN_DEVICENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_FINGERDEVICE_FINGERDEVICEID_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FINGERDEVICE ADD FN_FINGERDEVICEID integer ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FIREGROUP_GROUPCODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FIREGROUP ALTER COLUMN FG_GROUPCODENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_FOODCODE_InitTime_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODCODE ADD FO_INITTIME varchar(4) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FOODCODE_NAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODCODE ALTER COLUMN FO_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_FOODEVENT_CARDNO_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODEVENT ADD CA_CARDNO varchar(30) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_FOODEVENT_EMNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODEVENT ALTER COLUMN EM_NAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FOODEVENT_FDSUMMARY_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODEVENT ADD FE_FDSUMMARY CHAR(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_FOODEVENT_FGCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODEVENT ADD FG_CODE Integer';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_FOODEVENT_RELAYUSE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODEVENT ADD FG_RELAYUSE CHAR(1)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_FOODTYPE_FDTYPENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODTYPE ALTER COLUMN RE_FDTYPENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FOODTYPE_YesterDayTime_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODTYPE ADD FT_YESTERDAYTIME varchar(4) DEFAULT ''0400'' ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FORMMESSAGE_MESSAGENAME1_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FORMMESSAGE ALTER COLUMN FM_MESSAGENAME1 TYPE nvarchar(300)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_FORMMESSAGE ALTER COLUMN FM_MESSAGENAME2 TYPE nvarchar(300)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_FORMMESSAGE ALTER COLUMN FM_MESSAGENAME3 TYPE nvarchar(300)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FORMMESSAGE_MESSAGENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FORMMESSAGE ADD FM_MESSAGENAME3 nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FORMMESSAGE_MESSAGENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FORMMESSAGE ALTER COLUMN FM_MESSAGENAME1 TYPE nvarchar(100)';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_FORMMESSAGE ALTER COLUMN FM_MESSAGENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FORMNAME_NAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FORMNAME ADD FN_NAME3 nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_FORMNAME_NAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FORMNAME ALTER COLUMN FN_NAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_FORMNAME ALTER COLUMN FN_NAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_GUESTLIST_AREACODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_GUESTLIST ADD GL_AREACODE varchar(2)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_HOLIDAYDEVICE_HOTYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_HOLIDAYDEVICE ADD HO_TYPE integer DEFAULT 3 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_HOLIDAY_HONAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_HOLIDAY ADD HO_NAME3 nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_HOLIDAY_HONAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_HOLIDAY ALTER COLUMN HO_NAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_HOLIDAY ALTER COLUMN HO_NAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_HOLIDAY_HOTYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_HOLIDAY ADD HO_TYPE integer DEFAULT 3 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODEDEVICETYPECODE_PGTYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODEDEVICETYPECODE ADD ND_PGTYPE integer DEFAULT 2 NOT NULL';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_NODE_ADDDate_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_ADDDATE varchar(8) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODE_ADDR_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_ADDR varchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODE_BUILDINGCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD BC_BUILDINGCODE varchar(50) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODE_DECODERNO_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_DECODERNO integer DEFAULT 1 NOT NULL';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODE_DECORDERNOCHANGE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_DECODERNOCHANGE char(1)';   //서버 번호가 변경 되면 'Y'로 바뀐다.
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODE_DELETE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_DELETE CHAR(1) DEFAULT ''N'' NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODE_DEVICETYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_DEVICETYPE Integer ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;


function TdmDBCreate.AlterTB_NODE_LASTNETSTATE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_LASTNETSTATE varchar(2)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODE_LASTNETTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_LASTNETTIME varchar(17)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODE_MEMLOAD_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_MEMLOAD CHAR(1) DEFAULT ''N'' NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODE_NODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ALTER COLUMN ND_NODENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_NODE_OLDDECORDERNO_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_OLDDECORDERNO integer ';       //서버 번호가 변경 기존의 서버 번호를 기록한다.
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_NODE_TELNUM_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_NODE ADD ND_TELNUM varchar(30) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_POSICODE_POSICODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_POSICODE ALTER COLUMN PO_POSICODENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_READERBUILDINGPOSITIONCODE_BUILDINGPOSITIONCODENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READERBUILDINGPOSITIONCODE ADD RP_BUILDINGPOSITIONCODENAME3 nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_READERBUILDINGPOSITIONCODE_BUILDINGPOSITIONCODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READERBUILDINGPOSITIONCODE ALTER COLUMN RP_BUILDINGPOSITIONCODENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_READERBUILDINGPOSITIONCODE ALTER COLUMN RP_BUILDINGPOSITIONCODENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_READERDOORPOSITIONCODE_DOORPOSITIONCODENAME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READERDOORPOSITIONCODE ADD RP_DOORPOSITIONCODENAME3 nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_READERDOORPOSITIONCODE_DOORPOSITIONCODENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READERDOORPOSITIONCODE ALTER COLUMN RP_DOORPOSITIONCODENAME1 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER TABLE TB_READERDOORPOSITIONCODE ALTER COLUMN RP_DOORPOSITIONCODENAME2 TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_Reader_BuildingCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD BC_BUILDINGCODE varchar(50) DEFAULT ''0'' NOT NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;


function TdmDBCreate.AlterTB_Reader_FGCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD FG_CODE Integer';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_Reader_NAME_CHANGE: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ALTER COLUMN RE_READERNAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_SYSTEMLOG_CARDNO_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_SYSTEMLOG ALTER COLUMN CA_CARDNO TYPE varchar(50)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_SYSTEMLOG_LOGDATA_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_SYSTEMLOG ALTER COLUMN SY_LOGDATA TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ZONEEXTENTION_EXTENTIONNAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONEEXTENTION ALTER COLUMN ZE_EXTENTIONNAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ZONE_ZONENAME_Change: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONE ALTER COLUMN ZN_ZONENAME TYPE nvarchar(100)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'CHAR','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := StringReplace(stSql,'TYPE','',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;


function TdmDBCreate.CreateTB_ACademyAttend: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ACademyAttend (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AA_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stSql + ' AA_INTIME varchar(14),'; //출석시간
  stSql := stSql + ' AA_OUTTIME varchar(14),'; //퇴실시간
  stSql := stSql + ' AA_INOPERATOR varchar(50),'; //출석체크아이디
  stSql := stSql + ' AA_OUTOPERATOR varchar(50),'; //퇴실체크아이디
  stSql := stSql + ' AA_UpdateTime varchar(17),'; //수정시간
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AA_DATE,EM_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ACademyAttendMakeupLesson: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ACademyAttendMakeupLesson (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AS_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stSql + ' AM_SEQ integer NOT NULL,'; //보강처리 순번
  stSql := stSql + ' AM_TIME integer,'; //보강 처리 시간
  stSql := stSql + ' AM_INTIME varchar(14),'; //퇴실시간
  stSql := stSql + ' AM_OUTTIME varchar(14),'; //퇴실시간
  stSql := stSql + ' AM_INSERTTIME varchar(17),'; //입력 시간
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AS_DATE,EM_SEQ,AM_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ACademyAttendSummary: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ACademyAttendSummary (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AS_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stSql + ' AS_INTIME varchar(14),'; //출석시간
  stSql := stSql + ' AS_OUTTIME varchar(14),'; //퇴실시간
  stSql := stSql + ' AS_ATTYPE integer,'; //출석타입   -1.해당없음,0.미등원,1.등원,2.보강중,3.보강완료
  stSql := stSql + ' AS_UPDATETIME varchar(17),'; //업데이트 시간
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AS_DATE,EM_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_AcademySMSMessage: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_AcademySMSMessage (';
  stSql := stsql + ' AM_GUBUN integer NOT NULL,'; //1.출결,2.학부모공지
  stSql := stsql + ' AM_ATGUBUN integer NOT NULL,'; //1.출석,2.퇴실
  stSql := stSql + ' AM_MESSAGE varchar(200),'; //전송메시지
  stSql := stSql + ' PRIMARY KEY (AM_GUBUN,AM_ATGUBUN) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;


function TdmDBCreate.CreateTB_AcademySMSSend: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_AcademySMSSend (';
  stSql := stSql + ' AS_SEQ int IDENTITY NOT NULL, ';
  stSql := stSql + ' AS_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stsql + ' AS_GUBUN integer NOT NULL,'; //1.출결,2.학부모공지
  stSql := stsql + ' AS_ATGUBUN integer NOT NULL,'; //1.출석,2.퇴실
  stSql := stSql + ' AS_TELNUM varchar(14),'; //전송번호
  stSql := stSql + ' AS_MESSAGE varchar(200),'; //전송메시지
  stSql := stSql + ' AS_SENDSTATE char(1),'; //전송상태
  stSql := stSql + ' AS_INSERTTIME varchar(17),'; //입력시간
  stSql := stSql + ' PRIMARY KEY (AS_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ACCESSCARDMODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ACCESSCARDMODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AE_CARDMODE char(1) NOT NULL,';
  stSql := stSql + ' AE_CARDMODENAME1 nvarchar(100),';
  stSql := stSql + ' AE_CARDMODENAME2 nvarchar(100),';
  stSql := stSql + ' AE_CARDMODENAME3 nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AE_CARDMODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'nvarchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ACCESSCONTROLTYPE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ACCESSCONTROLTYPE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  if G_nDBTYPE = MSSQL then stSql := stSql + ' AE_CONTROLTYPECODE char(1) COLLATE Korean_Wansung_CS_AS NOT NULL,'
  else stSql := stSql + ' AE_CONTROLTYPECODE char(1) NOT NULL,';
  stSql := stSql + ' AE_CONTROLTYPECODENAME1 nvarchar(100),';
  stSql := stSql + ' AE_CONTROLTYPECODENAME2 nvarchar(100),';
  stSql := stSql + ' AE_CONTROLTYPECODENAME3 nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AE_CONTROLTYPECODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ACCESSDOORMODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ACCESSDOORMODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AE_DOORMODE char(1) NOT NULL,';
  stSql := stSql + ' AE_DOORMODENAME1 nvarchar(100),';
  stSql := stSql + ' AE_DOORMODENAME2 nvarchar(100),';
  stSql := stSql + ' AE_DOORMODENAME3 nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AE_DOORMODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ACCESSEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ACCESSEVENT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AE_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' AE_TIME varchar(6) NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' DO_DOORNO integer NOT NULL,';
  stSql := stSql + ' CA_CARDNO varchar(30) NOT NULL,';
  stSql := stSql + ' RE_READERNO integer default 0 NOT NULL,';
  stSql := stSql + ' AE_BUTTON char(1) ,';
  stSql := stSql + ' RP_DOORPOSITIONCODE char(1) ,';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODE char(1) ,';
  if G_nDBTYPE = MSSQL then stSql := stSql + ' AE_CONTROLTYPECODE char(1) COLLATE Korean_Wansung_CS_AS ,'
  else stSql := stSql + ' AE_CONTROLTYPECODE char(1) ,';
  stSql := stSql + ' AE_DOORMODE char(1) ,';
  stSql := stSql + ' AE_CARDMODE char(1) ,';
  stSql := stSql + ' AP_PERMITCODE char(1) ,';
  stSql := stSql + ' AR_ARMAREANO integer,';
  stSql := stSql + ' CO_COMPANYCODE varchar(50) ,';
  stSql := stSql + ' EM_SEQ integer,';
  stSql := stSql + ' EM_CODE nvarchar(60),';
  stSql := stSql + ' EM_NAME nvarchar(100),';
  stSql := stSql + ' AD_USERID varchar(30),';
  stSql := stSql + ' AE_INSERTTIME varchar(17),';
  stSql := stSql + ' AE_ATCHECK char(1) default ''N'' NOT NULL,';
  stSql := stSql + ' AE_FDCHECK char(1) default ''N'' NOT NULL,';
  stSql := stSql + ' AE_ATSUMMARY char(1),';
  stSql := stSql + ' AE_TELNUM varchar(20),';
  stSql := stSql + ' CA_PRINTNO varchar(50),';
  stSql := stSql + ' AE_RELAY char(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AE_DATE,AE_TIME,ND_NODENO,DE_ECUID,DE_EXTENDID,DO_DOORNO,CA_CARDNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessEventExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ACCESSEVENT_Ix01: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_ACCESSEVENT_Ix01 ON TB_ACCESSEVENT(AE_RELAY)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ACCESSPERMITCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ACCESSPERMITCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AP_PERMITCODE char(1) NOT NULL,';
  stSql := stSql + ' AP_PERMITCODENAME1 nvarchar(100),';
  stSql := stSql + ' AP_PERMITCODENAME2 nvarchar(100),';
  stSql := stSql + ' AP_PERMITCODENAME3 nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AP_PERMITCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ADMIN: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ADMIN (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AD_USERID varchar(30) NOT NULL,';
  stSql := stSql + ' AD_USERPW varchar(30) ,';
  stSql := stSql + ' AD_USERNAME nvarchar(100),';
  stSql := stSql + ' AD_MASTER char(1),';
  stSql := stSql + ' AG_GRADECODE varchar(3),';
  stSql := stSql + ' CO_COMPANYCODE varchar(50) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' BC_BUILDINGCODE varchar(50) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' AD_BUILDINGTYPE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' EM_GROUPCODE varchar(50) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AD_USERID) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ADMINBUILDING: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ADMINBUILDING (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AD_USERID varchar(30) NOT NULL,';
  stSql := stSql + ' BC_BUILDINGCODE varchar(50) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AD_USERID,BC_BUILDINGCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ADMINDEVICE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ADMINDEVICE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AD_USERID varchar(30) NOT NULL,';
  stSql := stSql + ' AG_TYPE char(1) NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer ,';
  stSql := stSql + ' AG_NO integer NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AD_USERID,AG_TYPE,ND_NODENO,DE_ECUID,DE_EXTENDID,AG_NO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;


function TdmDBCreate.CreateTB_ADMINGRADECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ADMINGRADECODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AG_GRADECODE varchar(3) NOT NULL,';
  stSql := stSql + ' AG_GRADECODENAME nvarchar(100) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AG_GRADECODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ADMINGRADEPROGRAM: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ADMINGRADEPROGRAM (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AG_GRADECODE varchar(3) NOT NULL,';
  stSql := stSql + ' FN_PROGRAMGUBUN char(1) NOT NULL,';
  stSql := stSql + ' FN_NAMECODE varchar(30) NOT NULL,';
  stSql := stSql + ' FN_MENUGUBUN integer NOT NULL,';
  stSql := stSql + ' AG_INSERT char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' AG_UPDATE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' AG_DELETE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' AD_USERID varchar(30) ,';
  stSql := stSql + ' AG_UPDATETIME varchar(17) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AG_GRADECODE,FN_PROGRAMGUBUN,FN_NAMECODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ADMINWORKLOG: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ADMINWORKLOG(';
  stSql := stSql + ' SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' AW_DATE varchar(8),';
  stSql := stSql + ' AW_TIME varchar(6),';
  stSql := stSql + ' AW_PCIP varchar(30),';
  stSql := stSql + ' AD_USERID varchar(30),';
  stSql := stSql + ' AW_FORMCODE varchar(30),';
  stSql := stSql + ' AW_TYPE integer,';
  stSql := stSql + ' ND_NODENO integer,';
  stSql := stSql + ' DE_ECUID varchar(2) ,';
  stSql := stSql + ' DE_EXTENDID integer,';
  stSql := stSql + ' AW_NUMBER integer,';
  stSql := stSql + ' CA_CARDNO varchar(30),';
  stSql := stSql + ' AW_LOGDATA varchar(100),';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
  if G_nDBTYPE = FireBird then
  begin
    stSql := 'CREATE SEQUENCE GEN_TB_ADMINWORKLOG_ID ';
    dmDataBase.ProcessExecSQL(stSql);

    stSql := 'CREATE OR ALTER TRIGGER TB_ADMINWORKLOG_BI FOR TB_ADMINWORKLOG ';
    stSql := stSql + ' ACTIVE BEFORE INSERT POSITION 0 ';
    stSql := stSql + ' AS ';
    stSql := stSql + ' BEGIN ';
    stSql := stSql + '   IF (NEW.SEQ IS NULL) THEN ';
    stSql := stSql + '     NEW.SEQ = GEN_ID(GEN_TB_ADMINWORKLOG_ID,1); ';
    stSql := stSql + ' END ';
    dmDataBase.ProcessExecSQL(stSql);
  end;
end;

function TdmDBCreate.CreateTB_ALARMDEVICETYPE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMDEVICETYPE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AL_ALARMDEVICETYPE varchar(2) NOT NULL,';
  stSql := stSql + ' AL_ALARMDEVICETYPENAME nvarchar(100) ,';
 stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AL_ALARMDEVICETYPE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ALARMEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMEVENT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AE_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' AE_TIME varchar(6) NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' AE_MSGNO char(1) NOT NULL,';
  stSql := stSql + ' AL_ALARMDEVICETYPE varchar(2) ,';
  stSql := stSql + ' AE_SUBADDR varchar(2) ,';
  stSql := stSql + ' AR_ARMAREANO integer ,';
  stSql := stSql + ' AM_ARMMODECODE char(1) ,';
  stSql := stSql + ' ZN_ZONENO integer ,';
  stSql := stSql + ' AP_PORTSTATE char(1) ,';
  stSql := stSql + ' AE_EVENTSTATECODE varchar(2) ,';
  stSql := stSql + ' AP_EVENTSTATEPCCODE varchar(10) ,';
  stSql := stSql + ' AE_OPERATOR varchar(30) ,';
  stSql := stSql + ' AP_MODECHANGE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' AP_VIEW char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' AP_SOUND char(1),';
  stSql := stSql + ' AP_COLOR integer default 16777215,';   //흰색
  stSql := stSql + ' AE_INSERTTIME varchar(17) ,';
  stSql := stSql + ' AE_CHECKOK char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' AE_CHECKMSG nvarchar(100),';
  stSql := stSql + ' AD_USERID varchar(30) ,';
  stSql := stSql + ' AE_CHECKTIME varchar(17) ,';
  stSql := stSql + ' AE_PCIP varchar(34) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AE_DATE,AE_TIME,ND_NODENO,DE_ECUID,DE_EXTENDID,AE_MSGNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ALARMEVENTOPERMODECHANGE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMEVENTOPERMODECHANGE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AM_OPERCODE varchar(30) NOT NULL,';
  stSql := stSql + ' AM_ALARMSTATECODE varchar(2),';
  stSql := stSql + ' AM_ALARMCHANGECODE varchar(2),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AM_OPERCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ALARMEVENTSTATECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMEVENTSTATECODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AE_EVENTSTATECODE varchar(2) NOT NULL,';
  stSql := stSql + ' AE_EVENTSTATECODENAME1 nvarchar(100),';
  stSql := stSql + ' AE_EVENTSTATECODENAME2 nvarchar(100),';
  stSql := stSql + ' AE_EVENTSTATECODENAME3 nvarchar(100),';
  stSql := stSql + ' AE_DEVICE char(1),';
  stSql := stSql + ' AE_ARMTYPE char(1),';
  stSql := stSql + ' AE_ZONESTATE char(1),';
  stSql := stSql + ' AE_OPER char(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AE_EVENTSTATECODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ALARMEVENTSTATEGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMEVENTSTATEGROUP (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AG_ALARMGROUPCODE integer NOT NULL,';
  stSql := stSql + ' AG_NAME1 nvarchar(100) ,';
  stSql := stSql + ' AG_NAME2 nvarchar(100) ,';
  stSql := stSql + ' AG_NAME3 nvarchar(100) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AG_ALARMGROUPCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ALARMEVENTSTATEPCCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMEVENTSTATEPCCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AP_EVENTSTATEPCCODE varchar(10) NOT NULL,';
  stSql := stSql + ' AP_EVENTSTATEPCCODENAME1 nvarchar(100),';
  stSql := stSql + ' AP_EVENTSTATEPCCODENAME2 nvarchar(100),';
  stSql := stSql + ' AP_EVENTSTATEPCCODENAME3 nvarchar(100),';
  stSql := stSql + ' AE_EVENTSTATECODE varchar(2),';
  stSql := stSql + ' AG_ALARMGROUPCODE integer ,';
  stSql := stSql + ' AP_MODECHANGE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' AP_VIEW char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' AP_SOUND char(1),';
  stSql := stSql + ' AP_COLOR integer default 16777215,';   //흰색
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AP_EVENTSTATEPCCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ALARMMODECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMMODECODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AM_ARMMODECODE char(1) NOT NULL,';
  stSql := stSql + ' AM_ARMMODENAME1 nvarchar(100) ,';
  stSql := stSql + ' AM_ARMMODENAME2 nvarchar(100) ,';
  stSql := stSql + ' AM_ARMMODENAME3 nvarchar(100) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AM_ARMMODECODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ALARMPORTSTATE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMPORTSTATE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AP_PORTSTATE char(1) NOT NULL,';
  stSql := stSql + ' AP_PORTSTATENAME1 nvarchar(100) ,';
  stSql := stSql + ' AP_PORTSTATENAME2 nvarchar(100) ,';
  stSql := stSql + ' AP_PORTSTATENAME3 nvarchar(100) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AP_PORTSTATE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_AntiGroupCode: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ANTIGROUPCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AG_CODE integer NOT NULL,';
  stSql := stSql + ' AG_NAME nvarchar(50),';
  stSql := stSql + ' AG_ANTINO integer ,';          //출입문에 설정되는 AntipassNo
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AG_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ARMAREA: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ARMAREA (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' AR_ARMAREANO integer NOT NULL,';
  stSql := stSql + ' AR_ARMAREAUSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' AR_ARMAREANAME nvarchar(100),';
  stSql := stSql + ' AR_TELNO varchar(30),';
  stSql := stSql + ' AR_MEMO varchar(100),';
  stSql := stSql + ' BC_BUILDINGCODE varchar(50) DEFAULT ''0'' NOT NULL ,';
  stSql := stSql + ' AR_NAMECHANGE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' AR_VIEW char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' AR_VIEWSEQ integer DEFAULT 1 NOT NULL,';
  stSql := stSql + ' AR_ARMAREAUSECHANGE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CT_NO integer ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID,AR_ARMAREANO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ATTENDCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ATTENDCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AW_CODE integer NOT NULL,';
  stSql := stSql + ' AT_ATCODE integer NOT NULL,';
  stSql := stSql + ' AT_CODENAME nvarchar(100),';
  stSql := stSql + ' AT_YESTERDAYTIME varchar(4),';
  stSql := stSql + ' AT_WORKSTARTTIME varchar(4),';
  stSql := stSql + ' AT_WORKENDTIME varchar(4),';
  stSql := stSql + ' AT_INFROMTIME varchar(4),';
  stSql := stSql + ' AT_INTOTIME varchar(4),';
  stSql := stSql + ' AT_EXTENDTIME varchar(4),';
  stSql := stSql + ' AT_NIGHTTIME varchar(4),';
  stSql := stSql + ' AT_NORMALADD varchar(4),';
  stSql := stSql + ' AT_EARLYADD varchar(4),';
  stSql := stSql + ' AT_JIGAKADD varchar(4),';
  stSql := stSql + ' AT_JOTAEADD varchar(4),';
  stSql := stSql + ' AT_EXTENDADD varchar(4),';
  stSql := stSql + ' AT_NIGHTADD varchar(4),';
  stSql := stSql + ' AT_SWORKSTARTTIME varchar(4),';
  stSql := stSql + ' AT_SWORKENDTIME varchar(4),';
  stSql := stSql + ' AT_SINFROMTIME varchar(4),';
  stSql := stSql + ' AT_SINTOTIME varchar(4),';
  stSql := stSql + ' AT_SEXTENDTIME varchar(4),';
  stSql := stSql + ' AT_SNIGHTTIME varchar(4),';
  stSql := stSql + ' AT_SNORMALADD varchar(4),';
  stSql := stSql + ' AT_SEARLYADD varchar(4),';
  stSql := stSql + ' AT_SJIGAKADD varchar(4),';
  stSql := stSql + ' AT_SJOTAEADD varchar(4),';
  stSql := stSql + ' AT_SEXTENDADD varchar(4),';
  stSql := stSql + ' AT_SNIGHTADD varchar(4),';
  stSql := stSql + ' AT_HWORKSTARTTIME varchar(4),';
  stSql := stSql + ' AT_HWORKENDTIME varchar(4),';
  stSql := stSql + ' AT_HINFROMTIME varchar(4),';
  stSql := stSql + ' AT_HINTOTIME varchar(4),';
  stSql := stSql + ' AT_HEXTENDTIME varchar(4),';
  stSql := stSql + ' AT_HNIGHTTIME varchar(4),';
  stSql := stSql + ' AT_HNORMALADD varchar(4),';
  stSql := stSql + ' AT_HEARLYADD varchar(4),';
  stSql := stSql + ' AT_HJIGAKADD varchar(4),';
  stSql := stSql + ' AT_HJOTAEADD varchar(4),';
  stSql := stSql + ' AT_HEXTENDADD varchar(4),';
  stSql := stSql + ' AT_HNIGHTADD varchar(4),';
  stSql := stSql + ' AT_OUTRANGE varchar(4) DEFAULT ''0000'' NOT NULL,';
  stSql := stSql + ' AT_SOUTRANGE varchar(4) DEFAULT ''0000'' NOT NULL,';
  stSql := stSql + ' AT_HOUTRANGE varchar(4) DEFAULT ''0000'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AW_CODE,AT_ATCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_ATTENDEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ATTENDEVENT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AT_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stSql + ' EM_CODE nvarchar(60) ,';
  stSql := stSql + ' EM_NAME nvarchar(100) ,';
  stSql := stSql + ' CO_COMPANYCODE varchar(30) ,';
  stSql := stSql + ' AW_CODE integer,';
  stSql := stSql + ' AT_ATCODE integer,';
  stSql := stSql + ' AE_WEEKCODE char(1),';  //요일
  stSql := stSql + ' AE_WORKSTARTTIME varchar(4),';
  stSql := stSql + ' AE_WORKENDTIME varchar(4),';
  stSql := stSql + ' AE_ATINTIME varchar(14),'; //출근시간
  stSql := stSql + ' AE_ATOUTTIME varchar(14),'; //퇴근시간
  stSql := stSql + ' AE_ATWORKOUTTIME varchar(14),'; //외출근시간
  stSql := stSql + ' AE_ATWORKINTIME varchar(14),'; //복귀시간
  stSql := stSql + ' AE_ATINRESULT integer,';         //출근상태
  stSql := stSql + ' AE_ATOUTRESULT integer,';         //퇴근상태
  stSql := stSql + ' AE_BEFORWORKMM integer DEFAULT 0 NOT NULL,';        //작업 시작 전 근무시간
  stSql := stSql + ' AE_WORKMM integer DEFAULT 0 NOT NULL,';             //근무시간
  stSql := stSql + ' AE_EXTENDWORKMM integer DEFAULT 0 NOT NULL,';             //연장근무시간
  stSql := stSql + ' AE_NIGHTWORKMM integer DEFAULT 0 NOT NULL,';             //야간근무시간
  stSql := stSql + ' AE_BEFORWORKCOUNT integer DEFAULT 0 NOT NULL,';        //작업 시작 전 근무유무
  stSql := stSql + ' AE_WORKCOUNT integer DEFAULT 0 NOT NULL,';             //근무유무
  stSql := stSql + ' AE_EXTENDWORKCOUNT integer DEFAULT 0 NOT NULL,';        //연장 근무유무
  stSql := stSql + ' AE_NIGHTWORKCOUNT integer DEFAULT 0 NOT NULL,';         //야간 근무유무
  stSql := stSql + ' AE_JIGAKCOUNT integer DEFAULT 0 NOT NULL,';             //지각 유무
  stSql := stSql + ' AE_JOTAECOUNT integer DEFAULT 0 NOT NULL,';             //조퇴 유무
  stSql := stSql + ' AE_ATWORKOUTCOUNT integer DEFAULT 0 NOT NULL,';         //외출 유무
  stSql := stSql + ' AE_ATWORKINCOUNT integer DEFAULT 0 NOT NULL,';         //복귀 유무
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AT_DATE,EM_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ATTENDEVENTLIST: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ATTENDEVENTLIST (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AT_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stSql + ' AC_INOUTTYPE integer NOT NULL,';    //1.출근,2.퇴근
  stSql := stSql + ' EM_CODE nvarchar(60) ,';
  stSql := stSql + ' EM_NAME nvarchar(100) ,';
  stSql := stSql + ' CO_COMPANYCODE varchar(30) ,';
  stSql := stSql + ' AC_RESULTCODE integer,';
  stSql := stSql + ' AE_INTIME varchar(14),';
  stSql := stSql + ' ND_NODENO integer ,';
  stSql := stSql + ' DE_ECUID varchar(2) ,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' DO_DOORNO integer ,';
  stSql := stSql + ' RE_READERNO integer ,';
  stSql := stSql + ' AE_BUTTON char(1) ,';
  stSql := stSql + ' AP_DEVICETYPE char(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AT_DATE,EM_SEQ,AC_INOUTTYPE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_ATTENDFILEFORMAT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ATTENDFILEFORMAT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AF_SEQ Integer NOT NULL,';
  stSql := stSql + ' AF_USE Integer,';
  stSql := stSql + ' AF_FIELDNAME nvarchar(60) ,';
  stSql := stSql + ' AF_LENGTH Integer ,';
  stSql := stSql + ' AF_FILLCHAR char(1) ,';
  stSql := stSql + ' AF_DATEFORMATE nvarchar(60) ,';
  stSql := stSql + ' AF_FRONTREAR Integer ,';  //앞0,뒤1
  stSql := stSql + ' AF_WORKINTYPE varchar(2) ,';  //출근타입
  stSql := stSql + ' AF_WORKOUTTYPE varchar(2) ,';  //퇴근타입
  stSql := stSql + ' AF_BUSINESSOUTTYPE varchar(2) ,';  //외출타입
  stSql := stSql + ' AF_BUSINESSINTYPE varchar(2) ,';  //복귀타입
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AF_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_ATTENDINOUTCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ATTENDINOUTCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_RESULTCODE integer NOT NULL,';
  stSql := stSql + ' AC_INOUTTYPE integer NOT NULL,';    //1.출근,2.퇴근
  stSql := stSql + ' AC_RESULTTYPE integer NOT NULL,';   //1.출근,2.지각,3.결근,4.조기출근,1.퇴근,2.조퇴,3.연장근무,4.야근
  stSql := stSql + ' AC_NAME nvarchar(100),';
  stSql := stSql + ' AC_SYSTEM char(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_RESULTCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ATTENDPOSITION: Boolean; //근태지역테이블
var
  stSql : string;
begin
  stSql := 'Create Table TB_ATTENDPOSITION (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AP_CODE integer NOT NULL,';
  stSql := stSql + ' AP_NAME nvarchar(100) NOT NULL,';
  stSql := stSql + ' AP_DEVICETYPE char(1),';
  stSql := stSql + ' AP_ATSTARTBUTTON char(1),';
  stSql := stSql + ' AP_ATOFFBUTTON char(1),';
  stSql := stSql + ' AP_INOUTDEVICETYPE char(1),';
  stSql := stSql + ' AP_WORKOUTBUTTON char(1),';
  stSql := stSql + ' AP_WORKINBUTTON char(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AP_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ATTENDWORKTYPE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ATTENDWORKTYPE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AW_CODE integer NOT NULL,';
  stSql := stSql + ' AW_NAME nvarchar(100) NOT NULL,';
  stSql := stSql + ' AW_NOTBACKUPTYPE char(1),';
  stSql := stSql + ' AW_SATURDAYTYPE char(1),';
  stSql := stSql + ' AW_FIXATTYPE char(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AW_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_BMSCONFIG: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_BMSCONFIG (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' BC_CONFIGGROUP varchar(20) NOT NULL,';
  stSql := stSql + ' BC_CONFIGCODE varchar(20) NOT NULL,';
  stSql := stSql + ' BC_CONFIGVALUE varchar(30),';
  stSql := stSql + ' BC_CONFIGDETAIL nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,BC_CONFIGGROUP,BC_CONFIGCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_BUILDINGCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_BUILDINGCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' BC_BUILDINGCODE varchar(50) NOT NULL,';
  stSql := stSql + ' BC_BUILDINGNAME nvarchar(100),';
  stSql := stSql + ' BC_CODEUSE char(1),';
  stSql := stSql + ' BC_DEEPSEQ integer,';
  stSql := stSql + ' BC_VIEWSEQ integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,BC_BUILDINGCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_BUILDINGMAP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_BUILDINGMAP (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' BC_BUILDINGCODE varchar(50) NOT NULL,';
  stSql := stSql + ' BM_TYPE integer DEFAULT 1 NOT NULL,';
  stSql := stSql + ' BC_DEEPSEQ integer,';
  stSql := stSql + ' BM_MAP image,';
  stSql := stSql + ' BM_MAPINFO varbinary(MAX),';
  stSql := stSql + ' BM_DOORMAP image,';
  stSql := stSql + ' BM_DOORMAPINFO varbinary(MAX),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,BC_BUILDINGCODE,BM_TYPE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','OLEObject',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARD: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARD (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CA_CARDNO varchar(30) NOT NULL,';
  stSql := stSql + ' CA_STATECODE char(1),';
  stSql := stSql + ' CA_CARDGUBUN integer,';
  stSql := stSql + ' CA_POSITIONNUM integer,';
  stSql := stSql + ' CA_RELAYID integer,';
  stSql := stSql + ' CA_GRADEUSE char(1),';
  stSql := stSql + ' EM_SEQ integer,';
  stSql := stSql + ' CA_LASTUSEDATE varchar(8),';
  stSql := stSql + ' CA_UPDATETIME varchar(17),';
  stSql := stSql + ' AD_USERID varchar(30),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CA_CARDNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDBUTTONEVENTSTAT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDBUTTONEVENTSTAT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CB_DAY varchar(8) NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer NOT NULL,';
  stSql := stSql + ' DO_DOORNO integer NOT NULL,';
  stSql := stSql + ' CB_CARDEVENT integer DEFAULT 0,';
  stSql := stSql + ' CB_BUTTONEVENT integer DEFAULT 0,';
  stSql := stSql + ' CB_TELEVENT integer DEFAULT 0,';
  stSql := stSql + ' CB_FIREEVENT integer DEFAULT 0,';
  stSql := stSql + ' CB_REMOTEEVENT integer DEFAULT 0,';
  stSql := stSql + ' CB_SCHEDULEEVENT integer DEFAULT 0,';
  stSql := stSql + ' CB_ETCEVENT integer DEFAULT 0,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CB_DAY,ND_NODENO,DE_ECUID,DE_EXTENDID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDDELETEEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDDELETEEVENT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CD_YEAR varchar(4) NOT NULL,';
  stSql := stSql + ' CD_WEEK integer NOT NULL,';
  stSql := stSql + ' CD_MON char(1),';
  stSql := stSql + ' CD_TUE char(1),';
  stSql := stSql + ' CD_WED char(1),';
  stSql := stSql + ' CD_THU char(1),';
  stSql := stSql + ' CD_FRI char(1),';
  stSql := stSql + ' CD_SAT char(1),';
  stSql := stSql + ' CD_SUN char(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CD_YEAR,CD_WEEK) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDDELETEHISTORY: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDDELETEHISTORY (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CH_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stSql + ' CH_OLDENDDATE varchar(8),';
  stSql := stSql + ' CH_NEWENDDATE varchar(8),';
  stSql := stSql + ' CH_INSERTDATE varchar(17),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CH_DATE,EM_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDFTPDOWNLIST: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDFTPDOWNLIST (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2),';
  stSql := stSql + ' CF_SENDPROGRESS varchar(3),';
  stSql := stSql + ' CF_RCVACK char(1),';
  stSql := stSql + ' CF_RETRYCNT integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDGUBUN: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDGUBUN (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CA_CARDGUBUN integer NOT NULL,';
  stSql := stSql + ' CA_CARDGUBUNNAME nvarchar(100),';
  stSql := stSql + ' CA_RELAYTYPE integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CA_CARDGUBUN) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDHIS: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDHIS (';
  stSql := stSql + ' SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' GROUP_CODE varchar(10) ,';
  stSql := stSql + ' CA_CARDNO varchar(30) NOT NULL,';
  stSql := stSql + ' CA_OLDCARDNO varchar(30) NOT NULL,';
  stSql := stSql + ' CA_STATECODE char(1),';
  stSql := stSql + ' CA_CARDGUBUN integer,';
  stSql := stSql + ' CA_POSITIONNUM integer,';
  stSql := stSql + ' CA_RELAYID integer,';
  stSql := stSql + ' CA_GRADEUSE char(1),';
  stSql := stSql + ' EM_SEQ integer,';
  stSql := stSql + ' CA_LASTUSEDATE varchar(8),';
  stSql := stSql + ' CA_UPDATETIME varchar(17),';
  stSql := stSql + ' CA_WORKMODE char(1),';
  stSql := stSql + ' CA_INSERTTIME varchar(17),';
  stSql := stSql + ' AD_USERID varchar(30),';
  stSql := stSql + ' CA_PCIP varchar(30),';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

  if G_nDBTYPE = FireBird then
  begin
    stSql := 'CREATE SEQUENCE GEN_TB_CARDHIS_ID ';
    dmDataBase.ProcessExecSQL(stSql);

    stSql := 'CREATE OR ALTER TRIGGER TB_CARDHIS_BI FOR TB_CARDHIS ';
    stSql := stSql + ' ACTIVE BEFORE INSERT POSITION 0 ';
    stSql := stSql + ' AS ';
    stSql := stSql + ' BEGIN ';
    stSql := stSql + '   IF (NEW.SEQ IS NULL) THEN ';
    stSql := stSql + '     NEW.SEQ = GEN_ID(GEN_TB_CARDHIS_ID,1); ';
    stSql := stSql + ' END ';
    dmDataBase.ProcessExecSQL(stSql);
  end;

end;

function TdmDBCreate.CreateTB_CARDHIS_Ix01: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDHIS_Ix01 ON TB_CARDHIS(CA_INSERTTIME)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDPERMIT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDPERMIT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' CA_CARDNO varchar(30) NOT NULL,';
  stSql := stSql + ' CP_PERMIT char(1),';
  stSql := stSql + ' CP_DOOR1 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_DOOR2 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_DOOR3 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_DOOR4 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_DOOR5 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_DOOR6 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_DOOR7 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_DOOR8 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_ARMAREA0 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_ARMAREA1 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_ARMAREA2 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_ARMAREA3 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_ARMAREA4 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_ARMAREA5 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_ARMAREA6 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_ARMAREA7 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_ARMAREA8 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' CP_RCVACK char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID,CA_CARDNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDPERMITCOMPANYGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDPERMITCOMPANYGROUP (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(50) NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' CP_TYPE char(1) NOT NULL,';
  stSql := stSql + ' CP_NUMBER integer NOT NULL,';
  stSql := stSql + ' CP_PERMIT char(1) ,';
  stSql := stSql + ' CO_DEEPSEQ integer,';
  stSql := stSql + ' CP_APPLY char(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CO_COMPANYCODE,ND_NODENO,DE_ECUID,DE_EXTENDID,CP_TYPE,CP_NUMBER) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDPERMITCOMPANYGROUP_Ix01: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDPERMITCOMPANYGROUP_Ix01 ON TB_CARDPERMITCOMPANYGROUP(GROUP_CODE,CO_COMPANYCODE)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDPERMITEMPLOYEECODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' CP_TYPE char(1) NOT NULL,';
  stSql := stSql + ' CP_NUMBER integer NOT NULL,';
  stSql := stSql + ' CP_PERMIT char(1) ,';
  stSql := stSql + ' CP_APPLY char(1),';
  stSql := stSql + ' CP_FINGERAPPLY char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,EM_SEQ,ND_NODENO,DE_ECUID,DE_EXTENDID,CP_TYPE,CP_NUMBER) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE_Ix01: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDPERMITEMPLOYEECODE_Ix01 ON TB_CARDPERMITEMPLOYEECODE(CP_APPLY)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE_Ix02: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDPERMITEMPLOYEECODE_Ix02 ON TB_CARDPERMITEMPLOYEECODE(CP_FINGERAPPLY)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE_Ix03: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDPERMITEMPLOYEECODE_Ix03 ON TB_CARDPERMITEMPLOYEECODE(EM_SEQ,ND_NODENO,DE_ECUID,DE_EXTENDID,CP_TYPE,CP_NUMBER,CP_PERMIT)';
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE_Ix04: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDPERMITEMPLOYEECODE_Ix04 ON TB_CARDPERMITEMPLOYEECODE(CP_PERMIT,CP_APPLY)';
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE_Ix05: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDPERMITEMPLOYEECODE_Ix05 ON TB_CARDPERMITEMPLOYEECODE(GROUP_CODE,EM_SEQ)';
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_CARDPERMITEMPLOYEEGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDPERMITEMPLOYEEGROUP(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_GROUPCODE varchar(50) NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' CP_TYPE char(1) NOT NULL,';
  stSql := stSql + ' CP_NUMBER integer NOT NULL,';
  stSql := stSql + ' CP_PERMIT char(1) ,';
  stSql := stSql + ' EM_DEEPSEQ integer,';
  stSql := stSql + ' CP_APPLY char(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,EM_GROUPCODE,ND_NODENO,DE_ECUID,DE_EXTENDID,CP_TYPE,CP_NUMBER) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDPERMIT_Ix01: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDPERMIT_Ix01 ON TB_CARDPERMIT(CP_MEMLOAD)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDPERMIT_Ix02: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDPERMIT_Ix02 ON TB_CARDPERMIT(CP_RCVACK)';
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_CARDPERMIT_Ix03: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_CARDPERMIT_Ix03 ON TB_CARDPERMIT(CA_CARDNO)';
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_CARDPRINTLIST: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDPRINTLIST(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CA_PRINTNO varchar(50) NOT NULL,';
  stSql := stSql + ' CA_CARDNO varchar(30) NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CA_PRINTNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARDSTATE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDSTATE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CA_STATECODE char(1) NOT NULL,';
  stSql := stSql + ' CA_STATECODENAME1 nvarchar(100),';
  stSql := stSql + ' CA_STATECODENAME2 nvarchar(100),';
  stSql := stSql + ' CA_STATECODENAME3 nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CA_STATECODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CARD_DeleteTrigger: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Trigger TB_CARD_Delete on TB_CARD';
  stSql := stSql + ' for  Delete';
  stSql := stSql + ' AS';
  stSql := stSql + ' declare @CA_POSITIONNUM integer';
  stSql := stSql + ' declare @CA_CARDNO varchar(30)';
  stSql := stSql + ' select @CA_POSITIONNUM = CA_POSITIONNUM,@CA_CARDNO = CA_CARDNO from deleted';
  stSql := stSql + ' update TB_FINGERDEVICECARD set CP_PERMIT = ''0'',FD_SEND=''N''';
  stSql := stSql + ' where CA_POSITIONNUM = @CA_POSITIONNUM  ';
  stSql := stSql + ' update TB_CARDPERMIT set CP_PERMIT = ''0'',CP_RCVACK=''N''';
  stSql := stSql + ' where CA_CARDNO = @CA_CARDNO  ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CCTV: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CCTV(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CT_NO int  NOT NULL,';
  stSql := stSql + ' CT_NAME varchar(50),';
  stSql := stSql + ' CT_IP varchar(30),';
  stSql := stSql + ' CT_PORT varchar(10),';
  stSql := stSql + ' CT_USERID varchar(10),';
  stSql := stSql + ' CT_USERPW varchar(10),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CT_NO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;


function TdmDBCreate.CreateTB_CERTIFICATECLASSCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CERTIFICATECLASSCODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CC_CODE varchar(30) NOT NULL,';
  stSql := stSql + ' CC_CODENAME nvarchar(100),';
  stSql := stSql + ' CC_DEEPSEQ integer,';
  stSql := stSql + ' CC_CODEUSE char(1),';
  stSql := stSql + ' CC_VIEWSEQ integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CC_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CertificateCode: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CertificateCode(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CF_CODE integer NOT NULL,';
  stSql := stSql + ' CF_NAME nvarchar(50) ,';
  stSql := stSql + ' CC_CODE varchar(30) ,'; //자격증분류코드
  stSql := stSql + ' CF_AMT integer,';       //응시료
  stSql := stSql + ' CF_ORGANIZER varchar(100),';         //시행자
  stSql := stSql + ' CF_CERTIISSUAMT Integer,';     //자격증발급비
  stSql := stSql + ' CF_MASTERAMT Integer,';   //마스터자격증발급비
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CF_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;


function TdmDBCreate.CreateTB_CertificateID: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CertificateID(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CF_CODE integer NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stSql + ' CI_ID varchar(50),';
  stSql := stSql + ' CI_PW varchar(50),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CF_CODE,EM_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CertificatePassGrade: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CertificatePassGrade(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CG_CODE integer NOT NULL,';
  stSql := stSql + ' CG_NAME varchar(100) NOT NULL,'; //자격증등급명
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CG_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CertificatePlan: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CertificatePlan(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CF_CODE integer NOT NULL,';
  stSql := stSql + ' CP_DATE varchar(8) NOT NULL,'; //자격증 시험일자.
  stSql := stSql + ' CP_SEQ integer ,';      //회차
  stSql := stSql + ' CP_RECEIPTFROM varchar(8) ,'; //자격증 접수기간.
  stSql := stSql + ' CP_RECEIPTTO varchar(8) ,'; //자격증 접수기간.
  stSql := stSql + ' CP_RESULTDATE varchar(8) ,'; //결과발표일
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CF_CODE,CP_DATE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CertificateReceipt: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CertificateReceipt(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CF_CODE integer NOT NULL,';
  stSql := stSql + ' CP_DATE varchar(8) NOT NULL,'; //자격증 시험일자.
  stSql := stSql + ' EM_SEQ integer ,';      //학생
  stSql := stSql + ' CR_DATE varchar(8) NOT NULL,'; //접수일자
  stSql := stSql + ' CR_RECEIPTAMT integer ,'; //응시료 납부현황
  stSql := stSql + ' CR_CertificateIssu integer ,'; //자격증 발급신청
  stSql := stSql + ' CR_CertificateIssuAMT integer ,'; //자격증 발급료 납부현황
  stSql := stSql + ' CR_CertificateMasterIssu integer ,'; //마스터 자격증 발급신청
  stSql := stSql + ' CR_CertificateMasterIssuAMT integer ,'; //마스터 자격증 발급료 납부현황
  stSql := stSql + ' CR_CertificatePass integer ,'; //합격유무
  stSql := stSql + ' CG_CODE integer ,'; //합격등급 1.A,2.B,3.C,4.D
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CF_CODE,CP_DATE,EM_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CLIENTSOCKET: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CLIENTSOCKET(';
  stSql := stSql + ' SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' CS_GUBUN varchar(2),';
  if G_nDBTYPE = MDB then stSql := stSql + ' CS_DATA memo,'
  else
    stSql := stSql + ' CS_DATA varchar(1024),';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

  if G_nDBTYPE = FireBird then
  begin
    stSql := 'CREATE SEQUENCE GEN_TB_CLIENTSOCKET_ID ';
    dmDataBase.ProcessExecSQL(stSql);

    stSql := 'CREATE OR ALTER TRIGGER TB_CLIENTSOCKET_BI FOR TB_CLIENTSOCKET ';
    stSql := stSql + ' ACTIVE BEFORE INSERT POSITION 0 ';
    stSql := stSql + ' AS ';
    stSql := stSql + ' BEGIN ';
    stSql := stSql + '   IF (NEW.SEQ IS NULL) THEN ';
    stSql := stSql + '     NEW.SEQ = GEN_ID(GEN_TB_CLIENTSOCKET_ID,1); ';
    stSql := stSql + ' END ';
    dmDataBase.ProcessExecSQL(stSql);
  end;

end;

function TdmDBCreate.CreateTB_COMPANYCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_COMPANYCODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(50) NOT NULL,';
  stSql := stSql + ' CO_COMPANYNAME nvarchar(100),';
  stSql := stSql + ' CO_DEEPSEQ integer,';
  stSql := stSql + ' CO_CODEUSE char(1),';
  stSql := stSql + ' CO_VIEWSEQ integer,';
  stSql := stSql + ' CO_RELAYCOMPANYCODE varchar(30), ';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CO_COMPANYCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_COMPANYCODEHIS: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_COMPANYCODEHIS(';
  stSql := stSql + ' CO_HISSEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CO_OLDCOMPANYCODE varchar(30),';
  stSql := stSql + ' CO_OLDCOMPANYNAME nvarchar(100),';
  stSql := stSql + ' CO_OLDDEEPSEQ integer,';
  stSql := stSql + ' CO_NEWCOMPANYCODE varchar(30),';
  stSql := stSql + ' CO_NEWCOMPANYNAME nvarchar(100),';
  stSql := stSql + ' CO_NEWDEEPSEQ integer,';
  stSql := stSql + ' CO_WORKMODE char(1),';
  stSql := stSql + ' AD_USERID varchar(30),';
  stSql := stSql + ' CO_PCIP varchar(30),';
  stSql := stSql + ' CO_UPDATETIME varchar(17),';
  stSql := stSql + ' PRIMARY KEY (CO_HISSEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

  if G_nDBTYPE = FireBird then
  begin
    stSql := 'CREATE SEQUENCE GEN_TB_COMPANYCODEHIS_ID ';
    dmDataBase.ProcessExecSQL(stSql);

    stSql := 'CREATE OR ALTER TRIGGER TB_COMPANYCODEHIS_BI FOR TB_COMPANYCODEHIS ';
    stSql := stSql + ' ACTIVE BEFORE INSERT POSITION 0 ';
    stSql := stSql + ' AS ';
    stSql := stSql + ' BEGIN ';
    stSql := stSql + '   IF (NEW.CO_HISSEQ IS NULL) THEN ';
    stSql := stSql + '     NEW.CO_HISSEQ = GEN_ID(GEN_TB_COMPANYCODEHIS_ID,1); ';
    stSql := stSql + ' END ';
    dmDataBase.ProcessExecSQL(stSql);
  end;

end;

function TdmDBCreate.CreateTB_CONFIG: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CONFIG(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CO_CONFIGGROUP varchar(20) NOT NULL,';
  stSql := stSql + ' CO_CONFIGCODE varchar(30) NOT NULL,';
  stSql := stSql + ' CO_CONFIGVALUE varchar(50),';
  stSql := stSql + ' CO_CONFIGDETAIL nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CO_CONFIGGROUP,CO_CONFIGCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_consultinggroupphonenum: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_consultinggroupphonenum(';
  stSql := stSql + ' cg_phonenumber varchar(30) NOT NULL,';
  stSql := stSql + ' cg_num integer NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (cg_phonenumber) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_consultinglist: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_consultinglist(';
  stSql := stSql + ' cg_seq int IDENTITY NOT NULL,';
  stSql := stSql + ' cg_date varchar(8) NOT NULL,';
  stSql := stSql + ' cg_num integer,';
  stSql := stSql + ' cg_phonenumber varchar(30),';
  stSql := stSql + ' cg_memo varchar(max),';
  stSql := stSql + ' PRIMARY KEY (cg_seq) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_CurriculumCode: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CurriculumCode(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CC_CODE integer NOT NULL,';
  stSql := stSql + ' CC_NAME nvarchar(50) ,';
  stSql := stSql + ' LC_CODE varchar(30) ,';
  stSql := stSql + ' CC_BOOKNAME nvarchar(100) ,';
  stSql := stSql + ' CC_BOOKAMT integer,';
  stSql := stSql + ' CC_MONTH Integer,';  //교육기간
  stSql := stSql + ' CC_GUBUN Integer,';
  stSql := stSql + ' AD_USERID varchar(30),';   //주강사
  stSql := stSql + ' AD_SUBUSERID varchar(30),';//보조강사
  stSql := stSql + ' CC_HH Integer,';  //교육시간
  stSql := stSql + ' CC_WEEK varchar(7),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CC_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_DECODER: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DECODER(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_DECODERNO integer NOT NULL,';
  stSql := stSql + ' ND_DECODERSOCKTYPE integer DEFAULT 1 NOT NULL,';  //1 Decoder -> Device
  stSql := stSql + ' ND_DECODERNAME nvarchar(50) ,';
  stSql := stSql + ' ND_DECODERIP varchar(50),';
  stSql := stSql + ' ND_DECODERDEVICEPORT Integer,';
  stSql := stSql + ' ND_DECODERCONTROLPORT Integer,';
  stSql := stSql + ' ND_DECORDERFTPPORT Integer,';
  stSql := stSql + ' ND_DIRECTPORT Integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_DECODERNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_DEVICE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DEVICE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' DE_DEVICEUSE char(1) default ''0'' NOT NULL,';
  stSql := stSql + ' DE_DEVICENAME nvarchar(100),';
//  stSql := stSql + ' DE_DEVICETYPE char(1),';
  stSql := stSql + ' DE_DEVICEVER varchar(50),';
  stSql := stSql + ' DE_DEVICECODE varchar(30) default '' '',';
  stSql := stSql + ' DE_DOOR2RELAY char(1),';
  stSql := stSql + ' DE_WATCHACPOWER char(1),';
  stSql := stSql + ' DE_ARMOUTDELAY integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' DE_ARMINDELAY integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' DE_ARMRELAY char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_CARDREADERTYPE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_EMZONELAMP char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_EMZONESIREN char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_ZONELAMPONTIME integer DEFAULT 10 NOT NULL,';
  stSql := stSql + ' DE_ZONESIRENONTIME integer DEFAULT 1 NOT NULL,';
  stSql := stSql + ' DE_ARMAREAUSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_JAEJUNGDELAYUSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_JAVARAARMCLOSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_JAVARADISARMOPEN char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_JAVARASERVERARMCLOSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_JAVARASERVERDISARMOPEN char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_JAVARAAUTOCLOSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_JAVARTYPEUSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_VIEWSEQ integer,';
  stSql := stSql + ' DE_ACTYPE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' DE_PTTYPE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' BC_BUILDINGCODE varchar(50) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_MAPUSE char(1),';
  stSql := stSql + ' DE_MAPTOTWIDTH integer,';
  stSql := stSql + ' DE_MAPTOTHEIGHT integer,';
  stSql := stSql + ' DE_MAPCURLEFT integer,';
  stSql := stSql + ' DE_MAPCURTOP integer,';
  stSql := stSql + ' DE_NAMECHANGE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DE_TIMECODESKILL char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' DE_TIMECODETYPE integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_DEVICERCV: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DEVICERCV(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' DE_DEVICEVER char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_DEVICECODE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_DOOR2RELAY char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_SYSTEMINFO char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_ARMRELAY char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_CARDREADERTYPE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_EMZONELAMP char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_ZONELAMPONTIME char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_ZONESIRENONTIME char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_ARMAREAUSE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_DOORARMAREA char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_DEVICEEXTENTION char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_JAEJUNGDELAYUSE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_JAVARAARMCLOSE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_JAVARAAUTOCLOSE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_CARDREADERNETWORK char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_EXTENTIONNETWORK char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DE_TIMECODEUSE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_DOOR: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOOR(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' DO_DOORNO integer NOT NULL,';
  stSql := stSql + ' DO_DOORNAME nvarchar(100),';
  stSql := stSql + ' DO_DOORUSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DO_DOORTYPE char(1) DEFAULT ''9'' NOT NULL,';
  //stSql := stSql + ' DO_CARDMODE char(1) DEFAULT ''0'' NOT NULL,';
  //stSql := stSql + ' DO_DOORMODE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DO_CONTROLTIME varchar(10) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DO_LONGOPENTIME varchar(10) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DO_LONGOPENALARM char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DO_DOORSTATE char(1) DEFAULT ''9'' NOT NULL,';
  stSql := stSql + ' DO_SCHEDULEUSE char(1) DEFAULT ''9'' NOT NULL,';
  stSql := stSql + ' DO_FIREDOOROPEN char(1) DEFAULT ''9'' NOT NULL,';
  stSql := stSql + ' DO_LOCKTYPE varchar(2) DEFAULT ''9'' NOT NULL,';
  stSql := stSql + ' DO_DSOPENSTATE char(1) DEFAULT ''9'' NOT NULL,';
  stSql := stSql + ' DO_REMOTEDISARMDOOROPEN char(1) DEFAULT ''9'' NOT NULL,';
  stSql := stSql + ' AR_ARMAREANO integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' DO_DEADBOLTDSCHECKUSE char(1) DEFAULT ''9'' NOT NULL,';
  stSql := stSql + ' DO_DEADBOLTDSCHECKTIME varchar(2) DEFAULT ''9'' NOT NULL,';
  stSql := stSql + ' DO_ARMDSCHECK char(1) DEFAULT ''9'' NOT NULL,';
  stSql := stSql + ' BC_BUILDINGCODE varchar(50) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DO_VIEW char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' DO_VIEWSEQ integer DEFAULT 1 NOT NULL,';
  stSql := stSql + ' DO_NAMECHANGE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DO_TIMECODEUSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DG_CODE integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' DO_ATTYPE char(1) NULL,';
  stSql := stSql + ' DO_FDTYPE char(1) NULL,';
  stSql := stSql + ' AG_ANTINO integer NULL,';
  stSql := stSql + ' AG_CODE integer NULL,';
  stSql := stSql + ' DO_LTSTATE varchar(2) NULL,';
  stSql := stSql + ' DO_MEMO varchar(max) NULL,';
  stSql := stSql + ' DO_RELAYID integer NULL,';
  stSql := stSql + ' DO_RELAYIDCHANGE char(1) NULL,';
  //  stSql := stSql + ' DO_DOORUSECHANGE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar(max)','varchar(10485760)',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_DOORGUBUN: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOORGUBUN(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' DG_CODE integer NOT NULL,';
  stSql := stSql + ' DG_NAME nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,DG_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_DOORRCV: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOORRCV(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' DO_DOORNO integer NOT NULL,';
  stSql := stSql + ' DO_SETTINGINFO char(1) DEFAULT ''N'' NOT NULL,'; //설정정보 조회

  stSql := stSql + ' DO_DEADBOLTDSCHECKUSE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DO_DEADBOLTDSCHECKTIME char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DO_ARMDSCHECK char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DO_HOLIDAY char(1) DEFAULT ''Y'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_DOORSCHEDULE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOORSCHEDULE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' DO_DOORNO integer NOT NULL,';
  stSql := stSql + ' DS_DAYCODE char(1) NOT NULL,';
  stSql := stSql + ' DS_TIME1 varchar(4) DEFAULT ''0500'' NOT NULL,';
  stSql := stSql + ' DS_TIMEMODE1 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DS_TIME2 varchar(4) DEFAULT ''1200'' NOT NULL,';
  stSql := stSql + ' DS_TIMEMODE2 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DS_TIME3 varchar(4) DEFAULT ''1300'' NOT NULL,';
  stSql := stSql + ' DS_TIMEMODE3 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DS_TIME4 varchar(4) DEFAULT ''1600'' NOT NULL,';
  stSql := stSql + ' DS_TIMEMODE4 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DS_TIME5 varchar(4) DEFAULT ''0000'' NOT NULL,';
  stSql := stSql + ' DS_TIMEMODE5 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' DS_DEVICESYNC char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' DS_UPDATETIME varchar(14) ,';
  stSql := stSql + ' AD_USERID varchar(30) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID,DO_DOORNO,DS_DAYCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_DOORSTATECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOORSTATECODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' DE_DOORSTATE varchar(2) NOT NULL,';
  stSql := stSql + ' DE_DOORSTATENAME varchar(100)  NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,DE_DOORSTATE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_DOORSTATEEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOORSTATEEVENT(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' DE_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' DE_TIME varchar(6) NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' DO_DOORNO integer NOT NULL,';
  stSql := stSql + ' DE_DOORSTATE varchar(2) NULL,';
  stSql := stSql + ' DE_INSERTTIME varchar(14) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,DE_DATE,DE_TIME,ND_NODENO,DE_ECUID,DE_EXTENDID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_DOORTELEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOORTELEVENT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' DE_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' DE_TIME varchar(6) NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' DO_DOORNO integer NOT NULL,';
  stSql := stSql + ' DE_TELNUMBER varchar(30) NULL,';   //열어준 전화번호
  stSql := stSql + ' DE_PASSWORD varchar(30) NULL,';   //열어준 비밀번호
  stSql := stSql + ' DE_ACCESSNAME varchar(50) NULL,';  //출입자명
  stSql := stSql + ' DE_ACCESSCOMPANY varchar(50) NULL,';  //출입자소속
  stSql := stSql + ' DE_ACCESSTEL varchar(30) NULL,';  //출입자전화번호
  stSql := stSql + ' DE_ACCESSMEMO varchar(max) NULL,';  //기타 특이사항
  stSql := stSql + ' DE_INSERTUSERID varchar(30) NULL,';  //입력자 아이디
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,DE_DATE,DE_TIME,ND_NODENO,DE_ECUID,DE_EXTENDID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar(max)','varchar(10485760)',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessEventExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_DOOR_Ix01: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_DOOR_Ix01 ON TB_DOOR(DO_RELAYIDCHANGE)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_EMPLOYEE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEE(';
  stSql := stSql + ' EM_SEQ int NOT NULL,';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_CODE nvarchar(60),';
  stSql := stSql + ' EM_NAME nvarchar(100),';
  stSql := stSql + ' CO_COMPANYCODE varchar(50),';
  stSql := stSql + ' PO_POSICODE integer,';
  stSql := stSql + ' EM_GUBUNCODE Integer,';
  stSql := stSql + ' EM_STATECODE Integer,';
  stSql := stSql + ' EM_COMPANYPHONE nvarchar(100),';
  stSql := stSql + ' EM_HOMEPHONE varchar(30),';
  stSql := stSql + ' EM_HANDPHONE varchar(30),';
  stSql := stSql + ' EM_EMINFO nvarchar(100),';
  stSql := stSql + ' EM_REGDATE varchar(8),';
  stSql := stSql + ' EM_ENDDATE varchar(8),';
  stSql := stSql + ' EM_IMAGE image,';
  stSql := stSql + ' EM_ACUSE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' EM_ATUSE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' EM_FDUSE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' EM_FINGERUSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' EM_GROUPCODE varchar(30),';
  stSql := stSql + ' EM_GRADETYPE integer,';
  stSql := stSql + ' AW_CODE integer DEFAULT 1 NOT NULL,';
  stSql := stSql + ' EM_CARDUSE integer default 0 ,';
  stSql := stSql + ' EM_MEMLOAD CHAR(1) DEFAULT ''N'' ,';
  stSql := stSql + ' EM_RELAYUSE integer default 0 ,';
  stSql := stSql + ' EM_RELAYCODE varchar(30) ,';
  stSql := stSql + ' EM_RELAYDATE varchar(17) ,';
{  stSql := stSql + ' EM_TIMECODEUSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_GROUP char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_TIME1 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_TIME2 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_TIME3 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_TIME4 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_WEEKCODE varchar(7) DEFAULT ''0000000'' NOT NULL,';  }
  stSql := stSql + ' EM_APPROVE integer default 1,';
  stSql := stSql + ' PRIMARY KEY (EM_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_EMPLOYEEDEVICETIMECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEEDEVICETIMECODE(';
  stSql := stSql + ' EM_SEQ int NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' EM_TIMECODEUSE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_GROUP char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_TIME1 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_TIME2 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_TIME3 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_TIME4 char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_WEEKCODE varchar(7) DEFAULT ''0000000'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (EM_SEQ,ND_NODENO,DE_ECUID) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_EMPLOYEEFINGER: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEEFINGER(';
  stSql := stSql + ' EM_SEQ int NOT NULL,';
  stSql := stSql + ' EF_SEQ int NOT NULL,';
  stSql := stSql + ' EF_FINGERID varchar(10) ,';
  stSql := stSql + ' EF_IMAGE1 image,';
  stSql := stSql + ' EF_IMAGE2 image,';
  stSql := stSql + ' EF_IMAGE3 image,';
  stSql := stSql + ' EF_TEMPLATE1_1 varchar(max),';
  stSql := stSql + ' EF_TEMPLATE1_2 varchar(max),';
  stSql := stSql + ' EF_TEMPLATE2_1 varchar(max),';
  stSql := stSql + ' EF_TEMPLATE2_2 varchar(max),';
  stSql := stSql + ' EF_TEMPLATE3_1 varchar(max),';
  stSql := stSql + ' EF_TEMPLATE3_2 varchar(max),';
  stSql := stSql + ' PRIMARY KEY (EM_SEQ,EF_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar(max)','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar(max)','varchar(10485760)',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar(max)','varchar(8190)',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_EMPLOYEEGROUPCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEEGROUPCODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_GROUPCODE varchar(30) NOT NULL,';
  stSql := stSql + ' EM_GROUPCODENAME nvarchar(100),';
  stSql := stSql + ' EM_DEEPSEQ integer,';
  stSql := stSql + ' EM_CODEUSE char(1),';
  stSql := stSql + ' EM_VIEWSEQ integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,EM_GROUPCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_EMPLOYEEGUBUN: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEEGUBUN(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_GUBUNCODE integer NOT NULL,';
  stSql := stSql + ' EM_GUBUNCODENAME nvarchar(100),';
  stSql := stSql + ' EM_VIEWSEQ integer DEFAULT 1 NOT NULL,';
  stSql := stSql + ' EM_RELAYCODE varchar(30),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,EM_GUBUNCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_EMPLOYEEHIS: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEEHIS(';
  stSql := stSql + ' SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_CODE nvarchar(60),';
  stSql := stSql + ' EM_NAME nvarchar(100),';
  stSql := stSql + ' CO_COMPANYCODE varchar(50),';
  stSql := stSql + ' PO_POSICODE integer,';
  stSql := stSql + ' EM_GUBUNCODE varchar(3),';
  stSql := stSql + ' EM_COMPANYPHONE nvarchar(100),';
  stSql := stSql + ' EM_HOMEPHONE varchar(30),';
  stSql := stSql + ' EM_HANDPHONE varchar(30),';
  stSql := stSql + ' EM_EMINFO varchar(100),';
  stSql := stSql + ' EM_REGDATE varchar(8),';
  stSql := stSql + ' EM_ENDDATE varchar(8),';
  stSql := stSql + ' EM_ACUSE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' EM_ATUSE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' EM_FDUSE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' EM_GROUPCODE varchar(30),';
  stSql := stSql + ' EM_GRADETYPE integer,';
  stSql := stSql + ' EM_WORKMODE char(1),';
  stSql := stSql + ' EM_INSERTTIME varchar(17),';
  stSql := stSql + ' AD_USERID varchar(30),';
  stSql := stSql + ' EM_PCIP varchar(30),';
  stSql := stSql + ' EM_RELAY1 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' EM_RELAY2 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' EM_RELAY3 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' EM_RELAY4 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

  if G_nDBTYPE = FireBird then
  begin
    stSql := 'CREATE SEQUENCE GEN_TB_EMPLOYEEHIS_ID ';
    dmDataBase.ProcessExecSQL(stSql);

    stSql := 'CREATE OR ALTER TRIGGER TB_EMPLOYEEHIS_BI FOR TB_EMPLOYEEHIS ';
    stSql := stSql + ' ACTIVE BEFORE INSERT POSITION 0 ';
    stSql := stSql + ' AS ';
    stSql := stSql + ' BEGIN ';
    stSql := stSql + '   IF (NEW.SEQ IS NULL) THEN ';
    stSql := stSql + '     NEW.SEQ = GEN_ID(GEN_TB_EMPLOYEEHIS_ID,1); ';
    stSql := stSql + ' END ';
    dmDataBase.ProcessExecSQL(stSql);
  end;
end;

function TdmDBCreate.CreateTB_EMPLOYEELecture: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEELecture(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';    //사원순번
  stSql := stSql + ' CC_CODE integer NOT NULL,';   //강의코드
  stSql := stSql + ' EL_REGDATE varchar(8),';
  stSql := stSql + ' EL_PAYDATE varchar(2),';      //결제일
  stSql := stSql + ' EL_STATE integer,';           //1.등록,2.정지,3.종료
  stSql := stSql + ' EL_ENDDATE varchar(8),';       //종료일
  stSql := stSql + ' EL_LASTPAYDATE varchar(8),';       //최종결제일
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,EM_SEQ,CC_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_EMPLOYEELectureHIS: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEELectureHIS(';
  stSql := stSql + ' SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';    //사원순번
  stSql := stSql + ' CC_CODE integer NOT NULL,';   //강의코드
  stSql := stSql + ' EL_REGDATE varchar(8),';
  stSql := stSql + ' EL_PAYDATE varchar(2),';      //결제일
  stSql := stSql + ' EL_STATE integer,';           //1.등록,2.정지,3.종료
  stSql := stSql + ' EL_ENDDATE varchar(8),';       //종료일
  stSql := stSql + ' EL_LASTPAYDATE varchar(8),';       //최종결제일
  stSql := stSql + ' EL_INSERTDATE varchar(17),';       //입력일
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_EMPLOYEESTATECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEESTATECODE(';
  stSql := stSql + ' EM_STATECODE int NOT NULL,';
  stSql := stSql + ' EM_STATECODENAME nvarchar(100),';
  stSql := stSql + ' EM_STATE char(1),';
  stSql := stSql + ' PRIMARY KEY (EM_STATECODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_EMPLOYEE_Ix01: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_EMPLOYEE_Ix01 ON TB_EMPLOYEE(GROUP_CODE,CO_COMPANYCODE,EM_ACUSE,EM_GRADETYPE)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_EMPLOYEE_Ix02: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_EMPLOYEE_Ix02 ON TB_EMPLOYEE(GROUP_CODE,EM_GROUPCODE,EM_ACUSE,EM_GRADETYPE)';
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_EMPLOYEE_Ix03: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index TB_EMPLOYEE_Ix03 ON TB_EMPLOYEE(GROUP_CODE,CO_COMPANYCODE,EM_ACUSE,EM_GRADETYPE)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_FINGERAPPROVALNUM: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FINGERAPPROVALNUM(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FN_DEVICESEQ integer NOT NULL,';
  stSql := stSql + ' CA_POSITIONNUM integer NOT NULL,';
  stSql := stSql + ' EM_SEQ integer,';
  stSql := stSql + ' FD_SEND char(1),';
  stSql := stSql + ' FN_DEVICEIP varchar(30),';
  stSql := stSql + ' FD_INSERTTIME varchar(17),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FN_DEVICESEQ,CA_POSITIONNUM) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_FINGERDEVICE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FINGERDEVICE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FN_DEVICESEQ integer NOT NULL,';
  stSql := stSql + ' FN_DEVICEIP varchar(30),';
  stSql := stSql + ' FN_DEVICENAME nvarchar(100),';
  stSql := stSql + ' FN_DEVICEPORT varchar(5),';
  stSql := stSql + ' FN_DEVICETYPE integer,';
  stSql := stSql + ' CP_TYPE char(1) DEFAULT ''1'' NOT NULL,';  //'1'.출입문,'2'.방범구역
  stSql := stSql + ' ND_NODENO integer ,';
  stSql := stSql + ' DE_ECUID varchar(2) ,';
  stSql := stSql + ' DE_EXTENDID integer ,';
  stSql := stSql + ' DO_DOORNO integer ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FN_DEVICESEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_FINGERDEVICECARD: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FINGERDEVICECARD(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FN_DEVICESEQ integer NOT NULL,';
  stSql := stSql + ' CA_POSITIONNUM integer NOT NULL,';
  stSql := stSql + ' EM_SEQ integer ,';
  stSql := stSql + ' CP_PERMIT char(1),';
  stSql := stSql + ' FD_SEND char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FN_DEVICESEQ,CA_POSITIONNUM) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_FIREGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FIREGROUP(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FG_GROUPCODE varchar(3) NOT NULL,';
  stSql := stSql + ' FG_GROUPCODENAME nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FG_GROUPCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_FOODCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FOODCODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' RE_FDTYPE char(1) NOT NULL,';
  stSql := stSql + ' FO_CODE integer Not Null,';
  stSql := stSql + ' FO_NAME nvarchar(100),';
  stSql := stSql + ' FO_STARTTIME varchar(4),';
  stSql := stSql + ' FO_ENDTIME varchar(4),';
  stSql := stSql + ' FO_INITTIME varchar(4),';
  stSql := stSql + ' FO_AMT integer default 0 Not Null,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,RE_FDTYPE,FO_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_FOODCODECOUNT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FOODCODECOUNT(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FC_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' RE_FDTYPE char(1) NOT NULL,';
  stSql := stSql + ' FO_CODE integer Not Null,';
  stSql := stSql + ' FC_COUNT integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FC_DATE,RE_FDTYPE,FO_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_FOODEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FOODEVENT(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FE_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' FE_TIME varchar(6) NOT NULL,';
  stSql := stSql + ' EM_SEQ integer NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' RE_READERNO integer NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer ,';
  stSql := stSql + ' DO_DOORNO integer,';
  stSql := stSql + ' RE_FDTYPE char(1) ,';
  stSql := stSql + ' FO_CODE integer ,';
  stSql := stSql + ' EM_CODE nvarchar(60) ,';
  stSql := stSql + ' EM_NAME varchar(100),';
  stSql := stSql + ' CO_COMPANYCODE varchar(30) ,';
  stSql := stSql + ' AP_PERMITCODE char(1),';
  stSql := stSql + ' FO_AMT integer default 0 Not Null,';
  stSql := stSql + ' FE_INSERTTIME varchar(17),';
  stSql := stSql + ' FG_CODE integer,';
  stSql := stSql + ' FE_FDSUMMARY char(1),';
  stSql := stSql + ' CA_CARDNO varchar(30),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FE_DATE,FE_TIME,EM_SEQ,ND_NODENO,DE_ECUID,RE_READERNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_FOODGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FOODGROUP(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FG_CODE integer Not Null,';
  stSql := stSql + ' FG_NAME nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FG_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_FOODOUTCOUNT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FOODOUTCOUNT(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FC_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' RE_FDTYPE char(1) NOT NULL,';
  stSql := stSql + ' FO_CODE char(1) NOT NULL,';
  stSql := stSql + ' FC_COUNT integer,';
  stSql := stSql + ' FC_INSERTTIME varchar(17),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FC_DATE,RE_FDTYPE,FO_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_FOODTYPE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FOODTYPE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' RE_FDTYPE char(1) NOT NULL,';
  stSql := stSql + ' RE_FDTYPENAME nvarchar(100) ,';
  stSql := stSql + ' FT_YESTERDAYTIME varchar(4) DEFAULT ''0400'',';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,RE_FDTYPE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_FORMCRITICAL: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FORMCRITICAL(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FC_CRITICALID integer NOT NULL,';
  stSql := stSql + ' FC_MENUTYPE varchar(20),';
  stSql := stSql + ' FC_MENUNAME1 nvarchar(100),';
  stSql := stSql + ' FC_MENUNAME2 nvarchar(100),';
  stSql := stSql + ' FC_MENUNAME3 nvarchar(100),';
  stSql := stSql + ' FC_CRITICALTYPE integer DEFAULT 0,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FC_CRITICALID) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_FORMMESSAGE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FORMMESSAGE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FM_MESSAGECODE varchar(30) NOT NULL,';
  stSql := stSql + ' FM_MESSAGENAME1 nvarchar(100),';
  stSql := stSql + ' FM_MESSAGENAME2 nvarchar(100),';
  stSql := stSql + ' FM_MESSAGENAME3 nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FM_MESSAGECODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_FORMNAME: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FORMNAME(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FN_PROGRAMGUBUN char(1) NOT NULL,';
  stSql := stSql + ' FN_NAMECODE varchar(30) NOT NULL,';
  stSql := stSql + ' FN_MENUGUBUN integer NOT NULL,';
  stSql := stSql + ' FN_MENUGROUP integer NOT NULL,';
  stSql := stSql + ' FN_NAME1 nvarchar(100),';
  stSql := stSql + ' FN_NAME2 nvarchar(100),';
  stSql := stSql + ' FN_NAME3 nvarchar(100),';
  stSql := stSql + ' FN_VIEW char(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FN_PROGRAMGUBUN,FN_NAMECODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_GUESTEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_GUESTEVENT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AE_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' AE_TIME varchar(6) NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' DO_DOORNO integer NOT NULL,';
  stSql := stSql + ' CA_CARDNO varchar(30) NOT NULL,';
  stSql := stSql + ' RE_READERNO integer default 0 NOT NULL,';
  stSql := stSql + ' AE_BUTTON char(1) ,';
  stSql := stSql + ' RP_DOORPOSITIONCODE char(1) ,';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODE char(1) ,';
  if G_nDBTYPE = MSSQL then stSql := stSql + ' AE_CONTROLTYPECODE char(1) COLLATE Korean_Wansung_CS_AS ,'
  else stSql := stSql + ' AE_CONTROLTYPECODE char(1) ,';
  stSql := stSql + ' AE_DOORMODE char(1) ,';
  stSql := stSql + ' AE_CARDMODE char(1) ,';
  stSql := stSql + ' AP_PERMITCODE char(1) ,';
  stSql := stSql + ' AR_ARMAREANO integer,';
  stSql := stSql + ' CO_COMPANYNAME varchar(100) ,';
  stSql := stSql + ' GL_DATE varchar(8),';
  stSql := stSql + ' GL_CODE nvarchar(60),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AE_DATE,AE_TIME,ND_NODENO,DE_ECUID,DE_EXTENDID,DO_DOORNO,CA_CARDNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessEventExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_GUESTLIST: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_GUESTLIST(';
  stSql := stSql + ' GL_SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' EM_SEQ int NULL,';
  stSql := stSql + ' GL_DATE varchar(8) NULL,';  //방문날짜
  stSql := stSql + ' GL_CODE varchar(50) NULL,';  //방문객 코드
  stSql := stSql + ' GL_NAME nvarchar(100) ,';
  stSql := stSql + ' GL_FROMTIME varchar(14) NULL,';  //사용가능시간yyyymmddhhnnss 조건
  stSql := stSql + ' GL_TOTIME varchar(14) NULL,';
  stSql := stSql + ' GL_COMPANYNAME nvarchar(100),';
  stSql := stSql + ' GL_TELNUMBER varchar(15),';
  stSql := stSql + ' GL_CARDNO varchar(30),';
//  stSql := stSql + ' GL_APPGATE varchar(max),';
//  stSql := stSql + ' GL_APPGATENIGHT varchar(max),';
  stSql := stSql + ' GL_CHANGEFLAG char(1),';
  stSql := stSql + ' GL_WORKFLAG integer,';
  stSql := stSql + ' GL_INTIME varchar(6),';
  stSql := stSql + ' GL_OUTTIME varchar(6),';
  stSql := stSql + ' GL_UPDATETIME varchar(17),';
  stSql := stSql + ' GL_AREACODE varchar(2), ';
  stSql := stSql + ' PRIMARY KEY (GL_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_HOLIDAY: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_HOLIDAY(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' HO_DAY varchar(8) NOT NULL,';
  stSql := stSql + ' HO_ACUSE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' HO_ATUSE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' HO_NAME1 nvarchar(100),';
  stSql := stSql + ' HO_NAME2 nvarchar(100),';
  stSql := stSql + ' HO_NAME3 nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,HO_DAY) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_HOLIDAYDEVICE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_HOLIDAYDEVICE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' HO_DAY varchar(8) NOT NULL,';
  stSql := stSql + ' HD_USE char(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' HD_SEND char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,HO_DAY) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_LectureClassCode: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_LectureClassCode(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' LC_CODE varchar(30) NOT NULL,';
  stSql := stSql + ' LC_CODENAME nvarchar(100),';
  stSql := stSql + ' LC_DEEPSEQ integer,';
  stSql := stSql + ' LC_CODEUSE char(1),';
  stSql := stSql + ' LC_VIEWSEQ integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,LC_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_LecturePayment: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_LecturePayment(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' LP_SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' EM_SEQ integer,';
  stSql := stSql + ' LP_MONTH varchar(6),'; //결제월
  stSql := stSql + ' LP_LECTUREAMT integer,'; //수강료
  stSql := stSql + ' TO_CODE integer,';       //할인코드
  stSql := stSql + ' TO_AMT integer,';       //할인금액
  stSql := stSql + ' LP_CARDTYPE integer,';       //카드현금구분
  stSql := stSql + ' LP_AMT integer,';               //결제금액
  stSql := stSql + ' LP_PayDate varchar(8),';        //결제일
  stSql := stSql + ' LP_MEMO varchar(max),';        //비고
  stSql := stSql + ' PRIMARY KEY (LP_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_LecturePaymentSummary: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_LecturePaymentSummary(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' LP_MONTH varchar(6),'; //결제월
  stSql := stSql + ' EM_SEQ integer,';
  stSql := stSql + ' LP_PaymentType integer, ' ; //수납타입 -1.해당없음,0.미수납,1.수납,2.부분수납
  stSql := stSql + ' LP_PayDate varchar(8),';        //결제일
  stSql := stSql + ' PRIMARY KEY (LP_MONTH,EM_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_NODE: Boolean;
var
  stSql : string;
  i : integer;
  stTemp : string;
begin
  stTemp := '1';
  for i := 1 to 63 do stTemp := stTemp + '0';

  stSql := 'Create Table TB_NODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' ND_SOCKETTYPE char DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' ND_DEVICEID varchar(10) ,';
  stSql := stSql + ' ND_NODENAME varchar(100) ,';
  stSql := stSql + ' ND_NODEIP varchar(30) NOT NULL,';
  stSql := stSql + ' ND_NODESUBNET varchar(30) ,';
  stSql := stSql + ' ND_NODEPORT varchar(10) DEFAULT ''3000'' NOT NULL,';
  stSql := stSql + ' ND_NODEGATE varchar(30) ,';
  stSql := stSql + ' ND_KTTSYSTEMID varchar(10),';
  stSql := stSql + ' ND_KTTTELNUMBER1 varchar(30) ,';
  stSql := stSql + ' ND_KTTTELNUMBER2 varchar(30) ,';
  stSql := stSql + ' ND_KTTREMOTEARMRINGCOUNT integer DEFAULT 10 NOT NULL,';
  stSql := stSql + ' ND_KTTREMOTEDISARMRINGCOUNT integer DEFAULT 10 NOT NULL,';
  stSql := stSql + ' ND_KTTCDMAUSE char(1) ,';
  stSql := stSql + ' ND_KTTCDMAIP varchar(30) ,';
  stSql := stSql + ' ND_KTTCDMAPORT varchar(10),';
  stSql := stSql + ' ND_KTTCDMACHECKTIME varchar(20) DEFAULT ''30'' NOT NULL,';
  stSql := stSql + ' ND_KTTCDMARSSI varchar(20) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' ND_KTTCDMAMIN varchar(20),';
  stSql := stSql + ' ND_KTTCDMAMUX varchar(20),';
  stSql := stSql + ' ND_DVRUSE char(1),';
  stSql := stSql + ' ND_DVRIP varchar(30) ,';
  stSql := stSql + ' ND_DVRPORT varchar(10) DEFAULT ''3003'' NOT NULL,';
  stSql := stSql + ' ND_ARMEXTENTIONGUBUN char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' ND_ARMEXTENTIONMAINTOLOCAL varchar(100) DEFAULT ''' + stTemp + ''' NOT NULL,';
  stSql := stSql + ' ND_ARMEXTENTIONMAINFROMLOCAL varchar(100) DEFAULT ''' + stTemp + ''' NOT NULL,';
  stSql := stSql + ' FG_GROUPCODE varchar(3) ,';
  stSql := stSql + ' ND_DECODERNO integer DEFAULT 1 NOT NULL,';   //접속할 데코더 번호
  stSql := stSql + ' ND_LASTNETSTATE varchar(2),';                //노드의 최종 접속 상태 'NR'을 생성 할 것인지 여부
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_NODEDEVICETYPECODE: Boolean;
var
  stSql : string;
  i : integer;
begin
  stSql := 'Create Table TB_NODEDEVICETYPECODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_DEVICETYPE integer NOT NULL,';
  stSql := stSql + ' ND_DEVICETYPENAME1 nvarchar(100),';
  stSql := stSql + ' ND_DEVICETYPENAME2 nvarchar(100),';
  stSql := stSql + ' ND_DEVICETYPENAME3 nvarchar(100),';
  stSql := stSql + ' ND_PGTYPE integer DEFAULT 0 NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_DEVICETYPE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_NODERCV: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_NODERCV(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' ND_ECUUSE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_NODEIP char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_NODESUBNET char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_NODEPORT char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_NODEGATE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_KTTSYSTEMID char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_KTTTELNUMBER char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_KTTREMOTERINGCOUNT char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_KTTCDMAUSE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_KTTCDMADATA char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_DVRUSE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_DVRDATA char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_ARMEXTENTIONMAINTOLOCAL char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' ND_ARMEXTENTIONMAINFROMLOCAL char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_POSICODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_POSICODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' PO_POSICODE integer NOT NULL,';
  stSql := stSql + ' PO_POSICODENAME nvarchar(100) ,';
  stSql := stSql + ' CO_COMPANYCODE varchar(50) ,';
  stSql := stSql + ' PO_VIEWSEQ integer DEFAULT 1 NOT NULL ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,PO_POSICODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_READER: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_READER(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' RE_READERNO integer NOT NULL,';
  stSql := stSql + ' RE_READERUSE char(1) default ''0'' NOT NULL ,';
  stSql := stSql + ' RE_READERNAME nvarchar(100) ,';
  stSql := stSql + ' RE_READERTYPE integer default 0 NOT NULL ,';
  stSql := stSql + ' RE_READERDOOR integer default 0 NOT NULL,';
  stSql := stSql + ' RP_DOORPOSITIONCODE char(1) default ''0'' NOT NULL,';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODE char(1) default ''0'' NOT NULL,';
  stSql := stSql + ' AR_ARMAREANO integer default 0 NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTELSKILL char(1) default ''0'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL0 varchar(30) ,';
  stSql := stSql + ' RE_CARDREADERTEL1 varchar(30) ,';
  stSql := stSql + ' RE_CARDREADERTEL2 varchar(30) ,';
  stSql := stSql + ' RE_CARDREADERTEL3 varchar(30) ,';
  stSql := stSql + ' RE_CARDREADERTEL4 varchar(30) ,';
  stSql := stSql + ' RE_CARDREADERTEL5 varchar(30) ,';
  stSql := stSql + ' RE_CARDREADERTEL6 varchar(30) ,';
  stSql := stSql + ' RE_CARDREADERTEL7 varchar(30) ,';
  stSql := stSql + ' RE_CARDREADERTEL8 varchar(30) ,';
  stSql := stSql + ' RE_CARDREADERTEL9 varchar(30) ,';
  stSql := stSql + ' RE_CARDREADERCALLTIME varchar(10) default ''180'' NOT NULL,';
  stSql := stSql + ' RE_READERVERSION nvarchar(100) ,';
  stSql := stSql + ' RE_ATTYPE char(1) default ''0'' NOT NULL,';
  stSql := stSql + ' RE_FDTYPE char(1) default ''0'' NOT NULL,';
  stSql := stSql + ' RE_NAMECHANGE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' AP_CODE integer DEFAULT 1 NOT NULL,';  //근태지역코드
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID,RE_READERNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_READERBUILDINGPOSITIONCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_READERBUILDINGPOSITIONCODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODE char(1) NOT NULL,';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODENAME1 nvarchar(100),';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODENAME2 nvarchar(100),';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODENAME3 nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,RP_BUILDINGPOSITIONCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_READERDOORPOSITIONCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_READERDOORPOSITIONCODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' RP_DOORPOSITIONCODE char(1) NOT NULL,';
  stSql := stSql + ' RP_DOORPOSITIONCODENAME1 nvarchar(100),';
  stSql := stSql + ' RP_DOORPOSITIONCODENAME2 nvarchar(100),';
  stSql := stSql + ' RP_DOORPOSITIONCODENAME3 nvarchar(100),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,RP_DOORPOSITIONCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_READERRCV: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_READERRCV(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' RE_READERNO integer NOT NULL,';
  stSql := stSql + ' RE_ReaderSETTINGINFO char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTELSKILL char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL0 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL1 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL2 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL3 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL4 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL5 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL6 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL7 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL8 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERTEL9 char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_CARDREADERCALLTIME char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_READERVERSION char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_ATTYPE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' RE_FDTYPE char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID,RE_READERNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_SETTINGINFO: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_SETTINGINFO(';
  stSql := stSql + ' SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' SI_TABLENAME varchar(50),';
  stSql := stSql + ' SI_FIELDNAME varchar(50),';
  stSql := stSql + ' ND_NODENO integer,';
  stSql := stSql + ' DE_ECUID varchar(2),';
  stSql := stSql + ' DE_EXTENDID integer,';
  stSql := stSql + ' SI_SUBNO varchar(2),';
  stSql := stSql + ' SI_VALUE nvarchar(100),';
  stSql := stSql + ' SI_INSERTTIME varchar(17),';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

  if G_nDBTYPE = FireBird then
  begin
    stSql := 'CREATE SEQUENCE GEN_TB_SETTINGINFO_ID ';
    dmDataBase.ProcessExecSQL(stSql);

    stSql := 'CREATE OR ALTER TRIGGER TB_SETTINGINFO_BI FOR TB_SETTINGINFO ';
    stSql := stSql + ' ACTIVE BEFORE INSERT POSITION 0 ';
    stSql := stSql + ' AS ';
    stSql := stSql + ' BEGIN ';
    stSql := stSql + '   IF (NEW.SEQ IS NULL) THEN ';
    stSql := stSql + '     NEW.SEQ = GEN_ID(GEN_TB_SETTINGINFO_ID,1); ';
    stSql := stSql + ' END ';
    dmDataBase.ProcessExecSQL(stSql);
  end;
end;

function TdmDBCreate.CreateTB_SYSTEMLOG: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_SYSTEMLOG(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' SY_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' SY_TIME varchar(6) NOT NULL,';
  stSql := stSql + ' SY_CLIENTIP varchar(50) NOT NULL,';
  stSql := stSql + ' SY_OPERATOR varchar(30) NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' CA_CARDNO varchar(20) NOT NULL,';
  stSql := stSql + ' SY_NUMBER varchar(2) NOT NULL,';
  stSql := stSql + ' SY_TYPE varchar(2),';
  stSql := stSql + ' SY_LOGDATA nvarchar(100) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,SY_DATE,SY_TIME,SY_CLIENTIP,SY_OPERATOR,ND_NODENO,DE_ECUID,CA_CARDNO,SY_NUMBER) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_TIMECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_TIMECODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' BC_BUILDINGCODE varchar(50) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' TC_GROUP char(1) NOT NULL,';
  stSql := stSql + ' TC_TIME1 varchar(8) default ''00000000'' NOT NULL,';
  stSql := stSql + ' TC_TIME2 varchar(8) default ''00000000'' NOT NULL,';
  stSql := stSql + ' TC_TIME3 varchar(8) default ''00000000'' NOT NULL,';
  stSql := stSql + ' TC_TIME4 varchar(8) default ''00000000'' NOT NULL,';
  stSql := stSql + ' TC_APPLY char(1) default ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,BC_BUILDINGCODE,TC_GROUP) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_TIMECODEDEVICE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_TIMECODEDEVICE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' TC_GROUP char(1) NOT NULL,';
  stSql := stSql + ' TC_TIME1 varchar(8) default ''00000000'' NOT NULL,';
  stSql := stSql + ' TC_TIME2 varchar(8) default ''00000000'' NOT NULL,';
  stSql := stSql + ' TC_TIME3 varchar(8) default ''00000000'' NOT NULL,';
  stSql := stSql + ' TC_TIME4 varchar(8) default ''00000000'' NOT NULL,';
//  stSql := stSql + ' TC_CHANGE char(1) default ''1'' NOT NULL,';
  stSql := stSql + ' TC_SEND char(1) default ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,TC_GROUP) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_Tuition: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_Tuition(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CC_CODE integer NOT NULL,';     //강의코드
  stSql := stSql + ' CO_COMPANYCODE varchar(50) NOT NULL,';         //분류(학생/성인)
  stSql := stSql + ' TU_VALUE integer ,';            //수강료
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CC_CODE,CO_COMPANYCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_TuitionOFF: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_TuitionOFF(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' TO_CODE integer NOT NULL,';     //할인코드
  stSql := stSql + ' TO_NAME varchar(50) ,';         //할인코드명
  stSql := stSql + ' TO_GUBUN integer default 0 NOT NULL,';  //0.비율,1.정액
  stSql := stSql + ' TO_VALUE integer ,';            //할인
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,TO_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ZONE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ZONE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' ZN_ZONENO integer NOT NULL,';
  stSql := stSql + ' ZN_ZONEUSE char(1) default ''1'' NOT NULL ,';
  stSql := stSql + ' ZN_ZONENAME nvarchar(100) ,';
  stSql := stSql + ' ZN_ZONETYPE integer default 0 NOT NULL ,';
  stSql := stSql + ' AE_EVENTSTATECODE varchar(2) ,';
  stSql := stSql + ' ZN_ZONEDELAY char(1) default ''0'' NOT NULL,';
  stSql := stSql + ' ZN_ZONESENSETIME varchar(5) default ''400'' NOT NULL,';
  stSql := stSql + ' ZN_ZONERECOVERY char(1) default ''0'' NOT NULL,';
  stSql := stSql + ' ZN_ALARMEVENTTYPE char(1) default ''0'' NOT NULL,';
  stSql := stSql + ' AR_ARMAREANO integer default 0 NOT NULL,';
  stSql := stSql + ' ZN_NAMECHANGE char(1) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' BC_BUILDINGCODE varchar(50),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID,ZN_ZONENO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ZONEEXTENTION: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ZONEEXTENTION(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' ZE_EXTENTIONNAME nvarchar(100) ,';
  stSql := stSql + ' ZE_TYPE char(1) default ''0'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ZONEEXTENTIONRCV: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ZONEEXTENTIONRCV(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' ZE_ZONEINFO char(1) default ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_ZONERCV: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ZONERCV(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ND_NODENO integer NOT NULL,';
  stSql := stSql + ' DE_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DE_EXTENDID integer default 0 NOT NULL,';
  stSql := stSql + ' ZN_ZONENO integer NOT NULL,';
  stSql := stSql + ' ZN_SETTING char(1) DEFAULT ''N'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ND_NODENO,DE_ECUID,DE_EXTENDID,ZN_ZONENO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateVW_APPROV_LABOR: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE VW_APPROVE_LABOR( ';
  stSql := stSql + '	JUMIN_NO varchar(20) NOT NULL,';
  stSql := stSql + '	LBR_NAME varchar(40) NULL,';
  stSql := stSql + '	TAG varchar(10) NOT NULL,';
  stSql := stSql + '	APP_FROM varchar(14) NULL,';
  stSql := stSql + '	APP_TO varchar(8) NOT NULL,';
  stSql := stSql + '	LS_CODE varchar(1) NULL,';
  stSql := stSql + '	LS_GBN varchar(8) NULL,';
  stSql := stSql + '	CO_CODE varchar(8) NULL,';
  stSql := stSql + '	CO_NAME nvarchar(200) NULL,';
  stSql := stSql + '	ADDR varchar(100) NOT NULL,';
  stSql := stSql + '	HEIGHT varchar(3) NOT NULL,';
  stSql := stSql + '	WEIGHT varchar(3) NOT NULL,';
  stSql := stSql + '	JIKWI varchar(15) NULL,';
  stSql := stSql + '	TEL varchar(100) NULL,';
  stSql := stSql + '	CHG_DATE varchar(8000) NULL,';
  stSql := stSql + '	DEL_YN varchar(1) NOT NULL,';
  stSql := stSql + '	APP_GATE varchar(max) NULL,';
  stSql := stSql + '	APP_GATE_NIGHT varchar(max) NULL,';
  stSql := stSql + '	APP_YN varchar(1) NOT NULL,';
  stSql := stSql + '	PHOTO_PATH varchar(8000) NULL,';
  stSql := stSql + '	CAUSE_CODE varchar(3) NULL,';
  stSql := stSql + '	CAUSE_DESC varchar(112) NULL,';
  stSql := stSql + '	CONST_CODE varchar(5) NOT NULL,';
  stSql := stSql + '	CONST_NAME varchar(50) NULL,';
  stSql := stSql + '	CARD_NO varchar(10) NULL,';
  stSql := stSql + '	IO_AREA varchar(30) NULL,';
  stSql := stSql + '	BIRTH varchar(20) NULL,';
  stSql := stSql + '	AREA_CD varchar(2) NULL,';
  stSql := stSql + '	OLD_JUMINNO varchar(200) NULL,';
  stSql := stSql + '	CHANGE_FLAG varchar(1) NULL, ';
  stSql := stSql + '	WORK_FLAG varchar(1) NULL ';
//  stSql := stSql + '	WORK_FLAG varchar(1) NULL, ';
//  stSql := stSql + '  PRIMARY KEY (JUMIN_NO) ';        //PK 삭제
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = PostGresql then
  begin
    stSql := StringReplace(stSql,'nvarchar','varchar',[rfReplaceAll]);
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar(max)','varchar(10485760)',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateVW_APPROV_LABOR_Ix01: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Index VW_APPROV_LABOR_Ix01 ON VW_APPROVE_LABOR(CHANGE_FLAG)';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

end.
