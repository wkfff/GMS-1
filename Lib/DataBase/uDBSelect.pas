unit uDBSelect;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmDBSelect = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    Function SelectTB_ACCESSEVENT_AccessHistoryReport(aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aNodeNo,aEcuID,aDoorNo,aCompanyCode,aPosiCode,aCardState,aEmGubun,aEtcType,aEtcName:string;aTimeType:integer=0):string;
    Function SelectTB_ACCESSEVENT_AccessReport(aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aNodeNo,aEcuID,aDoorNo,aCompanyCode,aPosiCode,aCardState,aEmGubun,aEtcType,aEtcName:string;aTimeType:integer=0;aAccessPermitCode:string=''):string;
    Function SelectTB_ACCESSEVENT_ArmAreaAccessReport(aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aNodeNo,aEcuID,aArmAreaNo,aCompanyCode,aPosiCode,aCardState,aEmGubun,aEtcType,aEtcName:string;aTimeType:integer=0):string;
    Function SelectTB_ACCESSEVENT_ATCHECK:string;
    Function SelectTB_ACCESSEVENT_ATSUMMARY : string;
    Function SelectTB_ACCESSEVENT_ATWork(aStartAccessInsertTime:string):string;
    Function SelectTB_ACCESSEVENT_FoodWork(aStartAccessInsertTime:string):string;
    Function SelectTB_ADMIN_UserName(aUserName:string):string;
    Function SelectTB_ADMINDEVICE_ArmArea(aUserID,aBuildingCode,aType:string):string;
    Function SelectTB_ADMINDEVICE_Door(aUserID,aBuildingCode,aType:string):string;
    Function SelectTB_ADMINGRADECODE_Name(aName:string):string;
    Function SelectTB_ADMINGRADEPROGRAM_GradeProgram(aAdminClassCode,aProgramGroupCode,aMenuGroupCode:string):string;
    Function SelectTB_ADMINGRADEPROGRAM_NotGradeProgram(aAdminClassCode,aProgramGroupCode,aMenuGroupCode:string):string;
    Function SelectTB_ALARMEVENT_AlarmReport(aStartDate, aStartTime,aEndDate,aEndTime,aBuildingCode, aNodeNo, aEcuID, aArmAreaNo, aArmMode,aAlarmEventGroup, aAlarmEventPCCode, aAlarmDeviceType, aAlarmConfirm :string;aTimeType:integer=0;aSearchDateType:integer = 0):string;
    Function SelectTB_ALARMEVENT_ArmAreaScurityEvent(aNodeNo,aEcuID,aArmAreaNo,aInsertTime:string):string;
    Function SelectTB_ALARMEVENT_BuildingScurityEvent(aBuildingCode,aInsertTime:string):string;
    Function SelectTB_ALARMEVENT_ScurityEvent(aInsertTime:string):string;
    Function SelectTB_ALARMEVENTSTATEPCCODE_All:string;
    Function SelectTB_ANTIGROUPCODE_Name(aName:string):string;
    Function SelectTB_ARMAREA_AdminArmArea(aUserID:string;aBuildingCode:string='';aNameSort:Boolean=False):string;
    Function SelectTB_ARMAREA_AdminBuilding(aUserID:string;aBuildingCode:string='';aNameSort:Boolean=False):string;
    Function SelectTB_ARMAREA_BuildingCode(aBuildingCode:string;aSearchName:string=''):string;
    Function SelectTB_ARMAREA_CompanyNotPermitCode(aBuildingCode,aCompanyCode:string):string;
    Function SelectTB_ARMAREA_CompanyPermit(aCompanyCode:string):string;
    Function SelectTB_ARMAREA_CompanyPermit_II(aBuildingCode,aCompanyCode:string):string;
    Function SelectTB_ARMAREA_EmGroupNotPermitCode(aBuildingCode,aEmGroupCode:string):string;
    Function SelectTB_ARMAREA_EmGroupPermit(aEmGroupCode:string):string;
    Function SelectTB_ARMAREA_EmGroupPermit_II(aBuildingCode,aEmGroupCode:string):string;
    Function SelectTB_ARMAREA_EmployeePermit(aBuildingCode,aEmSeq:string;aSearchName:string=''):string;
    Function SelectTB_ARMAREA_EmSeqPermit(aEmSeq:string):string;
    Function SelectTB_ARMAREA_MasterAll(aBuildingCode:string='';aNameSort:Boolean=False):string;
    Function SelectTB_ATTENDEVENT_AttendReport(aStartDate,aEndDate, aCompanyCode,aPosiCode, aEmpGubun, aEtcType, aEtcName:string):string;
    Function SelectTB_BUILDINGCODE_All:string;
    Function SelectTB_BUILDINGCODE_Group(aBuildingCode:string):string;
    Function SelectTB_CARD_EmSeq(aEmSeq:string):string;
    Function SelectTB_CARD_NotUsedCard(aDate:string;aNullLastDate:Boolean):string;
    Function SelectTB_CARDBUTTONEVENTSTAT_Report(aStartDate, aEndDate, aBuildingCode,aDoorName:string):string;
    Function SelectTB_CARDPERMIT_PASSWD(aBuildingCode,aNodeName:string):string;
    function SelectTB_CARDPERMITEMPLOYEECODE_GradeReport(aBuildingCode,aNodeNo,aEcuID,aDoorNo,aCompanyCode,aPosiCode,aCardState,aEmGubun,aEtcType,aEtcName,aEmGroupCode:string;aTimeType:integer=0;aNotpermit:Boolean=False;aGradeType:string='0'):string;
    Function SelectTB_CCTV_All:string;
    Function SelectTB_CCTV_BuildingCode(aBuildingCode:string):string;
    Function SelectTB_CCTV_Name(aName:string):string;
    Function SelectTB_Decoder_Name(aName:string):string;
    Function SelectTB_DEVICE_BuildingCode(aBuildingCode:string):string;
    Function SelectTB_DEVICE_BuildingEmCodeLike(aBuildingCode,aEmSeq:string):string;
    Function SelectTB_DEVICE_BuildingFTPState(aBuildingCode:string):string;
    Function SelectTB_DEVICE_DeviceVersion(aNodeNo,aEcuID:string;aBuildingCode:string=''):string;
    Function SelectTB_DEVICE_List(aNodeNo,aEcuID:string):string;
    Function SelectTB_DOOR_AdminBuilding(aUserID:string;aBuildingCode:string='';aDoorNameSort:Boolean=False):string;
    Function SelectTB_DOOR_AdminDoor(aUserID:string;aBuildingCode:string='';aDoorNameSort:Boolean=False):string;
    Function SelectTB_DOOR_AntiPass:string;
    Function SelectTB_DOOR_BuildingCode(aBuildingCode:string;aLike:Boolean = False;aSearchName:string=''):string;
    Function SelectTB_DOOR_CompanyNotPermitCode(aBuildingCode,aCompanyCode:string):string;
    Function SelectTB_Door_CompanyPermit(aCompanyCode:string):string;
    Function SelectTB_Door_CompanyPermit_II(aBuildingCode,aCompanyCode:string):string;
    Function SelectTB_DOOR_DoorEvenetLastCard(aBuildingCode:string;aReportType:integer):string;
    Function SelectTB_DOOR_EmGroupNotPermitCode(aBuildingCode,aEmGroupCode:string):string;
    Function SelectTB_Door_EmGroupPermit(aEmGroupCode:string):string;
    Function SelectTB_Door_EmGroupPermit_II(aBuildingCode,aEmGroupCode:string):string;
    Function SelectTB_Door_EmployeePermit(aBuildingCode,aEmSeq:string;aSearchName:string=''):string;
    Function SelectTB_Door_EmSeqPermit(aEmSeq:string):string;
    Function SelectTB_DOOR_MasterAll(aBuildingCode:string='';aDoorNameSort:Boolean=False):string;
    Function SelectTB_DOOR_Name(aBuildingCode,aName:string):string;
    Function SelectTB_DOOR_ScheduleDoorName(aBuildingCode,aName:string):string;
    Function SelectTB_DOORTELEVENT_AccessReport(aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aNodeNo,aEcuID,aDoorNo,aCompanyName,aEmName:string;aTimeType:integer=0):string;
    Function SelectTB_DOORSCHEDULE_DoorNo(aNodeNo,aEcuID,aDoorNo:string):string;
    Function SelectTB_DOORSTATEEVENT_Report(aStartDate, aStartTime,aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID, aDoorNo:string;aTimeType:integer=0):string;
    Function SelectTB_EMPLOYE_EtcType(aCompanyCode,aPosiCode,aEmployeeGubun,aEtcType,aEtcName:string):string;
    Function SelectTB_EMPLOYE_Value(aCompanyCode,aPosiCode,aEmSeq,aEmCode,aEmName,aEmGubun,aEmHandPhone,aEmCompanyPhone,aEtcInfo,aInDate,aOutDate,aACType,aATType,aFDTyep:string;aCardInclude:Boolean=False;aNotCardReg:string='';aNotFpReg:string='';aCardNo:string='';aCardGubun:string='';aEmGradeType:string='';aCardState:string='';aCompanyGradeSearch:Boolean=True):string;
    Function SelectTB_EMPLOYEEDEVICETIMECODE_BuildingEmSeq(aBuildingCode,aEmSeq:string):string;
    Function SelectTB_FINGERDEVICE_Name(aName:string):string;
    Function SelectTB_FINGERDEVICE_LikeValue(aBuildingCode, aReaderIP,aReaderName:string):string;
    Function SelectTB_FIREGROUP_Name(aName:string):string;
    Function SelectTB_FOODEVENT_FoodReport(aStartDate,aEndDate, aCompanyCode,aPosiCode, aEmpGubun, aEtcType, aEtcName,aFdType,aFoodCode:string;aBuildingCode:string='0';stFoodGroup:string=''):string;
    Function SelectTB_FOODEVENT_FoodDepartStateReport(aStartDate,aEndDate, aCompanyCode,aFdType:string):string;
    Function SelectTB_FOODEVENT_FoodStateReport(aStartDate,aEndDate, aCompanyCode,aPosiCode, aEmpGubun, aEtcType, aEtcName,aFdType:string):string;
    Function SelectTB_FOODEVENT_Summary(aSummary:string):string;
    Function SelectTB_FOODGROUP_Name(aName:string):string;
    Function SelectTB_FOODTYPE_Name(aName:string):string;
    Function SelectTB_FORMCRITICAL_GubunCode(aGubun:string):string;
    Function SelectTB_FORMMESSAGE_All : string;
    Function SelectTB_FORMNAME_All:string;
    Function SelectTB_Holiday_Year(aYear:string):string;
    Function SelectTB_NODE_Name(aBuildingCode,aName:string;aNodeIP:string=''):string;
    Function SelectTB_READER_Device(aNodeNo,aEcuID:string):string;
    Function SelectTB_READER_FoodMasterAll:string;
    Function SelectTB_SYSTEMLOG_ArmAreaManagementReport(aStartDate, aStartTime,aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID, aArmAreaNo:string;aTimeType:integer=0):string;
    Function SelectTB_SYSTEMLOG_CardManagementReport(aStartDate, aStartTime,aEndDate, aEndTime, aCompanyCode, aPosiCode, aEmpGubun, aEtcType,aEtcName:string;aTimeType:integer=0):string;
    Function SelectTB_SYSTEMLOG_DoorManagementReport(aStartDate, aStartTime,aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID, aDoorNo:string;aTimeType:integer=0):string;
    Function SelectTB_TIMECODEDEVICE_Device(aNodeNo,aEcuID:string):string;
    Function SelectTB_ZONE_BuildingCode(aBuildingCode:string;aSearchName:string=''):string;
  end;

var
  dmDBSelect: TdmDBSelect;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmDBSelect }

function TdmDBSelect.SelectTB_ACCESSEVENT_AccessHistoryReport(aStartDate,
  aStartTime, aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID, aDoorNo,
  aCompanyCode, aPosiCode, aCardState, aEmGubun, aEtcType, aEtcName: string;
  aTimeType: integer): string;
var
  stSql : string;
begin

  stSql := ' Select a.AE_DATE,a.AE_TIME,c.BC_BUILDINGNAME as BUILDINGNAME1,d.BC_BUILDINGNAME as BUILDINGNAME2,e.BC_BUILDINGNAME as BUILDINGNAME3, ';
  stSql := stSql + ' b.DO_DOORNAME,';
  if G_nReportCompanyStep > 0 then stSql := stSql + ' f.CO_COMPANYNAME as COMPANYNAME1,';
  if G_nReportCompanyStep > 1 then stSql := stSql + ' g.CO_COMPANYNAME as COMPANYNAME2,';
  if G_nReportCompanyStep > 2 then stSql := stSql + ' h.CO_COMPANYNAME as COMPANYNAME3, ';
  if G_nReportCompanyStep > 3 then stSql := stSql + ' p.CO_COMPANYNAME as COMPANYNAME4, ';
  if G_nReportCompanyStep > 4 then stSql := stSql + ' q.CO_COMPANYNAME as COMPANYNAME5, ';
  if G_nReportCompanyStep > 5 then stSql := stSql + ' r.CO_COMPANYNAME as COMPANYNAME6, ';
  if G_nReportCompanyStep > 6 then stSql := stSql + ' s.CO_COMPANYNAME as COMPANYNAME7, ';
  stSql := stSql + ' j.PO_POSICODENAME,a.EM_CODE,a.EM_NAME,a.CA_CARDNO,a.RE_READERNO,k.RP_DOORPOSITIONCODENAME' + inttostr(G_nFormLanguageType) + ' as DOORPOSITIONCODENAME,'  ;
  stSql := stSql + ' l.AE_CONTROLTYPECODENAME' + inttostr(G_nFormLanguageType) + ' as CONTROLTYPECODENAME,';
  stSql := stSql + ' a.AP_PERMITCODE,m.AP_PERMITCODENAME' + inttostr(G_nFormLanguageType) + ' as PERMITCODENAME,';
  stSql := stSql + ' o.CA_CARDGUBUNNAME,i.EM_GRADETYPE,i.EM_HANDPHONE,i.EM_COMPANYPHONE,i.EM_EMINFO,a.AE_BUTTON,a.AE_CONTROLTYPECODE ';
  stSql := stSql + ' FROM TB_ACCESSEVENT a ';
  if (aNodeNo = '') and (aBuildingCode = '0') then stSql := stSql + ' Left Join TB_DOOR b '
  else stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE ';
  stSql := stSql + ' AND c.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE e ';
  stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE ';
  stSql := stSql + ' AND e.BC_DEEPSEQ = 3 ) ';
  if G_nReportCompanyStep > 0 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE f ';
    stSql := stSql + ' ON(a.GROUP_CODE = f.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = f.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = f.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength ) + ') = f.CO_COMPANYCODE ';
    stSql := stSql + ' AND f.CO_DEEPSEQ = 1 ) ';
  end;
  if G_nReportCompanyStep > 1 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE g ';
    stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = g.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = g.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = g.CO_COMPANYCODE ';
    stSql := stSql + ' AND g.CO_DEEPSEQ = 2 ) ';
  end;
  if G_nReportCompanyStep > 2 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE h ';
    stSql := stSql + ' ON(a.GROUP_CODE = h.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = h.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = h.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = h.CO_COMPANYCODE ';
    stSql := stSql + ' AND h.CO_DEEPSEQ = 3 ) ';
  end;
  if G_nReportCompanyStep > 3 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE p ';
    stSql := stSql + ' ON(a.GROUP_CODE = p.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE ';
    stSql := stSql + ' AND p.CO_DEEPSEQ = 4 ) ';
  end;
  if G_nReportCompanyStep > 4 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE q ';
    stSql := stSql + ' ON(a.GROUP_CODE = q.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE ';
    stSql := stSql + ' AND q.CO_DEEPSEQ = 5 ) ';
  end;
  if G_nReportCompanyStep > 5 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE r ';
    stSql := stSql + ' ON(a.GROUP_CODE = r.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE ';
    stSql := stSql + ' AND r.CO_DEEPSEQ = 6 ) ';
  end;
  if G_nReportCompanyStep > 6 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE s ';
    stSql := stSql + ' ON(a.GROUP_CODE = s.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(a.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(a.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE ';
    stSql := stSql + ' AND s.CO_DEEPSEQ = 7 ) ';
  end;
  stSql := stSql + ' Left Join TB_EMPLOYEE i ';
  stSql := stSql + ' ON(a.EM_SEQ = i.EM_SEQ)';
  stSql := stSql + ' Left Join TB_POSICODE j ';
  stSql := stSql + ' ON(i.GROUP_CODE = j.GROUP_CODE ';
  stSql := stSql + ' AND i.PO_POSICODE = j.PO_POSICODE )';
  stSql := stSql + ' Left Join TB_READERDOORPOSITIONCODE k ';
  stSql := stSql + ' ON(a.GROUP_CODE = k.GROUP_CODE ';
  stSql := stSql + ' AND a.RP_DOORPOSITIONCODE = k.RP_DOORPOSITIONCODE )';
  stSql := stSql + ' Left Join TB_ACCESSCONTROLTYPE l ';
  stSql := stSql + ' ON(a.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND a.AE_CONTROLTYPECODE = l.AE_CONTROLTYPECODE )';
  stSql := stSql + ' Left Join TB_ACCESSPERMITCODE m ';
  stSql := stSql + ' ON(a.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND a.AP_PERMITCODE = m.AP_PERMITCODE )';
  stSql := stSql + ' Left Join TB_CARD n ';
  stSql := stSql + ' ON(a.GROUP_CODE = n.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = n.CA_CARDNO )';
  stSql := stSql + ' Left Join TB_CARDGUBUN o ';
  stSql := stSql + ' ON(n.GROUP_CODE = o.GROUP_CODE ';
  stSql := stSql + ' AND n.CA_CARDGUBUN = o.CA_CARDGUBUN )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.AE_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.AE_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.AE_DATE + a.AE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.AE_DATE || a.AE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aNodeNo = '' then
  begin
    if aBuildingCode <> '0' then stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
    if aDoorNo <> '' then stSql := stSql + ' AND a.DO_DOORNO = ' + aDoorNo + ' ';
  end;
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND a.EM_NAME Like N''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND a.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND i.EM_COMPANYPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //핸드폰
          stSql := stSql + ' AND i.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //카드번호
          stSql := stSql + ' AND a.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //기타
          stSql := stSql + ' AND i.EM_EMINFO Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '0' then stSql := stSql + ' AND a.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND i.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardState <> '' then stSql := stSql + ' AND n.CA_STATECODE = ''' + aCardState + ''' ';
    if aEmGubun <> '' then stSql := stSql + ' AND i.EM_GUBUNCODE = ''' + aEmGubun + ''' ';
  end;
  stSql := stSql + ' order by a.AE_DATE,a.AE_TIME ';
  result := stSql;

end;

function TdmDBSelect.SelectTB_ACCESSEVENT_AccessReport(aStartDate, aStartTime,
  aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID, aDoorNo, aCompanyCode,
  aPosiCode, aCardState, aEmGubun, aEtcType, aEtcName: string;
  aTimeType:integer=0;aAccessPermitCode:string=''): string;
var
  stSql : string;
begin
  if (aCompanyCode = '') then aCompanyCode := '0';

  stSql := ' Select a.AE_DATE,a.AE_TIME,c.BC_BUILDINGNAME as BUILDINGNAME1,d.BC_BUILDINGNAME as BUILDINGNAME2,e.BC_BUILDINGNAME as BUILDINGNAME3, ';
  stSql := stSql + ' b.DO_DOORNAME,';
  if G_nReportCompanyStep > 0 then stSql := stSql + ' h.CO_COMPANYNAME as COMPANYNAME1,';
  if G_nReportCompanyStep > 1 then stSql := stSql + ' i.CO_COMPANYNAME as COMPANYNAME2,';
  if G_nReportCompanyStep > 2 then stSql := stSql + ' j.CO_COMPANYNAME as COMPANYNAME3, ';
  if G_nReportCompanyStep > 3 then stSql := stSql + ' p.CO_COMPANYNAME as COMPANYNAME4, ';
  if G_nReportCompanyStep > 4 then stSql := stSql + ' q.CO_COMPANYNAME as COMPANYNAME5, ';
  if G_nReportCompanyStep > 5 then stSql := stSql + ' r.CO_COMPANYNAME as COMPANYNAME6, ';
  if G_nReportCompanyStep > 6 then stSql := stSql + ' s.CO_COMPANYNAME as COMPANYNAME7, ';
  stSql := stSql + ' k.PO_POSICODENAME,g.EM_CODE,g.EM_NAME,g.EM_GRADETYPE,a.CA_CARDNO,a.RE_READERNO,l.RP_DOORPOSITIONCODENAME' + inttostr(G_nFormLanguageType) + ' as DOORPOSITIONCODENAME,'  ;
  stSql := stSql + ' m.AE_CONTROLTYPECODENAME' + inttostr(G_nFormLanguageType) + ' as CONTROLTYPECODENAME,';
  stSql := stSql + ' a.AP_PERMITCODE,n.AP_PERMITCODENAME' + inttostr(G_nFormLanguageType) + ' as PERMITCODENAME,';
  stSql := stSql + ' o.CA_CARDGUBUNNAME,g.EM_HANDPHONE,g.EM_COMPANYPHONE,g.EM_EMINFO,a.AE_BUTTON,a.AE_CONTROLTYPECODE ';
  stSql := stSql + ' FROM TB_ACCESSEVENT a ';
  if (aNodeNo = '') and (aBuildingCode = '0') then stSql := stSql + ' Left Join TB_DOOR b '
  else stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE ';
  stSql := stSql + ' AND c.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE e ';
  stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE ';
  stSql := stSql + ' AND e.BC_DEEPSEQ = 3 ) ';
  stSql := stSql + ' Left Join TB_CARD f ';
  stSql := stSql + ' ON(a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = f.CA_CARDNO )';

  if ((aEtcType = '4') or (aEtcName = '')) and (aCompanyCode = '0') then stSql := stSql + ' Left Join TB_EMPLOYEE g '
  else stSql := stSql + ' Inner Join TB_EMPLOYEE g ';
  stSql := stSql + ' ON(f.EM_SEQ = g.EM_SEQ)';
  if G_nReportCompanyStep > 0 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE h ';
    stSql := stSql + ' ON(g.GROUP_CODE = h.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = h.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = h.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength ) + ') = h.CO_COMPANYCODE ';
    stSql := stSql + ' AND h.CO_DEEPSEQ = 1 ) ';
  end;
  if G_nReportCompanyStep > 1 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE i ';
    stSql := stSql + ' ON(g.GROUP_CODE = i.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = i.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = i.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = i.CO_COMPANYCODE ';
    stSql := stSql + ' AND i.CO_DEEPSEQ = 2 ) ';
  end;
  if G_nReportCompanyStep > 2 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE j ';
    stSql := stSql + ' ON(g.GROUP_CODE = j.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = j.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = j.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = j.CO_COMPANYCODE ';
    stSql := stSql + ' AND j.CO_DEEPSEQ = 3 ) ';
  end;
  if G_nReportCompanyStep > 3 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE p ';
    stSql := stSql + ' ON(g.GROUP_CODE = p.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE ';
    stSql := stSql + ' AND p.CO_DEEPSEQ = 4 ) ';
  end;
  if G_nReportCompanyStep > 4 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE q ';
    stSql := stSql + ' ON(g.GROUP_CODE = q.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE ';
    stSql := stSql + ' AND p.CO_DEEPSEQ = 5 ) ';
  end;
  if G_nReportCompanyStep > 5 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE r ';
    stSql := stSql + ' ON(g.GROUP_CODE = r.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE ';
    stSql := stSql + ' AND r.CO_DEEPSEQ = 6 ) ';
  end;
  if G_nReportCompanyStep > 6 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE s ';
    stSql := stSql + ' ON(g.GROUP_CODE = s.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE ';
    stSql := stSql + ' AND s.CO_DEEPSEQ = 7 ) ';
  end;
  stSql := stSql + ' Left Join TB_POSICODE k ';
  stSql := stSql + ' ON(g.GROUP_CODE = k.GROUP_CODE ';
  stSql := stSql + ' AND g.PO_POSICODE = k.PO_POSICODE )';
  stSql := stSql + ' Left Join TB_READERDOORPOSITIONCODE l ';
  stSql := stSql + ' ON(a.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND a.RP_DOORPOSITIONCODE = l.RP_DOORPOSITIONCODE )';
  stSql := stSql + ' Left Join TB_ACCESSCONTROLTYPE m ';
  stSql := stSql + ' ON(a.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND a.AE_CONTROLTYPECODE = m.AE_CONTROLTYPECODE )';
  stSql := stSql + ' Left Join TB_ACCESSPERMITCODE n ';
  stSql := stSql + ' ON(a.GROUP_CODE = n.GROUP_CODE ';
  stSql := stSql + ' AND a.AP_PERMITCODE = n.AP_PERMITCODE )';
  stSql := stSql + ' Left Join TB_CARDGUBUN o ';
  stSql := stSql + ' ON(f.GROUP_CODE = o.GROUP_CODE ';
  stSql := stSql + ' AND f.CA_CARDGUBUN = o.CA_CARDGUBUN )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if (aCompanyCode <> '0') then stSql := stSql + ' AND g.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.AE_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.AE_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.AE_DATE + a.AE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.AE_DATE || a.AE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aNodeNo = '' then
  begin
    if aBuildingCode <> '0' then stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
    if aDoorNo <> '' then stSql := stSql + ' AND a.DO_DOORNO = ' + aDoorNo + ' ';
  end;
  if aAccessPermitCode <> '' then stSql := stSql + ' AND a.AP_PERMITCODE = ''' + aAccessPermitCode + ''' ';
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND g.EM_NAME Like N''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND g.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND g.EM_COMPANYPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //핸드폰
          stSql := stSql + ' AND g.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //카드번호
          stSql := stSql + ' AND a.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //기타
          stSql := stSql + ' AND g.EM_EMINFO Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aPosiCode <> '' then stSql := stSql + ' AND g.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardState <> '' then stSql := stSql + ' AND f.CA_STATECODE = ''' + aCardState + ''' ';
    if aEmGubun <> '' then stSql := stSql + ' AND g.EM_GUBUNCODE = ''' + aEmGubun + ''' ';
  end;
  stSql := stSql + ' order by a.AE_DATE,a.AE_TIME ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_ACCESSEVENT_ArmAreaAccessReport(aStartDate,
  aStartTime, aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID, aArmAreaNo,
  aCompanyCode, aPosiCode, aCardState, aEmGubun, aEtcType, aEtcName: string;
  aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := ' Select a.AE_DATE,a.AE_TIME,c.BC_BUILDINGNAME as BUILDINGNAME1,d.BC_BUILDINGNAME as BUILDINGNAME2,e.BC_BUILDINGNAME as BUILDINGNAME3, ';
  stSql := stSql + ' b.AR_ARMAREANAME,';
  if G_nReportCompanyStep > 0 then stSql := stSql + ' h.CO_COMPANYNAME as COMPANYNAME1,';
  if G_nReportCompanyStep > 1 then stSql := stSql + ' i.CO_COMPANYNAME as COMPANYNAME2,';
  if G_nReportCompanyStep > 2 then stSql := stSql + ' j.CO_COMPANYNAME as COMPANYNAME3, ';
  if G_nReportCompanyStep > 3 then stSql := stSql + ' p.CO_COMPANYNAME as COMPANYNAME4, ';
  if G_nReportCompanyStep > 4 then stSql := stSql + ' q.CO_COMPANYNAME as COMPANYNAME5, ';
  if G_nReportCompanyStep > 5 then stSql := stSql + ' r.CO_COMPANYNAME as COMPANYNAME6, ';
  if G_nReportCompanyStep > 6 then stSql := stSql + ' s.CO_COMPANYNAME as COMPANYNAME7, ';
  stSql := stSql + ' k.PO_POSICODENAME,g.EM_CODE,g.EM_NAME,a.CA_CARDNO,a.RE_READERNO,l.RP_DOORPOSITIONCODENAME' + inttostr(G_nFormLanguageType) + ' as DOORPOSITIONCODENAME,'  ;
  stSql := stSql + ' m.AE_CONTROLTYPECODENAME' + inttostr(G_nFormLanguageType) + ' as CONTROLTYPECODENAME,';
  stSql := stSql + ' a.AP_PERMITCODE,n.AP_PERMITCODENAME' + inttostr(G_nFormLanguageType) + ' as PERMITCODENAME,';
  stSql := stSql + ' o.CA_CARDGUBUNNAME,g.EM_HANDPHONE,g.EM_COMPANYPHONE,g.EM_EMINFO,a.AE_BUTTON,a.AE_CONTROLTYPECODE ';
  stSql := stSql + ' FROM TB_ACCESSEVENT a ';
  if (aNodeNo = '') and (aBuildingCode = '0') then stSql := stSql + ' Left Join TB_ARMAREA b '
  else stSql := stSql + ' Inner Join TB_ArmArea b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND a.AR_ARMAREANO = b.AR_ARMAREANO ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE ';
  stSql := stSql + ' AND c.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE e ';
  stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE ';
  stSql := stSql + ' AND e.BC_DEEPSEQ = 3 ) ';
  stSql := stSql + ' Left Join TB_CARD f ';
  stSql := stSql + ' ON(a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = f.CA_CARDNO )';
  if (aEtcName = '') and (aCompanyCode = '0') then stSql := stSql + ' Left Join TB_EMPLOYEE g '
  else stSql := stSql + ' Inner Join TB_EMPLOYEE g ';
  stSql := stSql + ' ON(f.EM_SEQ = g.EM_SEQ)';
  if G_nReportCompanyStep > 0 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE h ';
    stSql := stSql + ' ON(g.GROUP_CODE = h.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = h.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = h.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength ) + ') = h.CO_COMPANYCODE ';
    stSql := stSql + ' AND h.CO_DEEPSEQ = 1 ) ';
  end;
  if G_nReportCompanyStep > 1 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE i ';
    stSql := stSql + ' ON(g.GROUP_CODE = i.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = i.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = i.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = i.CO_COMPANYCODE ';
    stSql := stSql + ' AND i.CO_DEEPSEQ = 2 ) ';
  end;
  if G_nReportCompanyStep > 2 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE j ';
    stSql := stSql + ' ON(g.GROUP_CODE = j.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = j.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = j.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = j.CO_COMPANYCODE ';
    stSql := stSql + ' AND j.CO_DEEPSEQ = 3 ) ';
  end;
  if G_nReportCompanyStep > 3 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE p ';
    stSql := stSql + ' ON(g.GROUP_CODE = p.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE ';
    stSql := stSql + ' AND p.CO_DEEPSEQ = 4 ) ';
  end;
  if G_nReportCompanyStep > 4 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE q ';
    stSql := stSql + ' ON(g.GROUP_CODE = q.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE ';
    stSql := stSql + ' AND q.CO_DEEPSEQ = 5 ) ';
  end;
  if G_nReportCompanyStep > 5 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE r ';
    stSql := stSql + ' ON(g.GROUP_CODE = r.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE ';
    stSql := stSql + ' AND r.CO_DEEPSEQ = 6 ) ';
  end;
  if G_nReportCompanyStep > 6 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE s ';
    stSql := stSql + ' ON(g.GROUP_CODE = r.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(g.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(g.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE ';
    stSql := stSql + ' AND s.CO_DEEPSEQ = 7 ) ';
  end;
  stSql := stSql + ' Left Join TB_POSICODE k ';
  stSql := stSql + ' ON(g.GROUP_CODE = k.GROUP_CODE ';
  stSql := stSql + ' AND g.PO_POSICODE = k.PO_POSICODE )';
  stSql := stSql + ' Left Join TB_READERDOORPOSITIONCODE l ';
  stSql := stSql + ' ON(a.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND a.RP_DOORPOSITIONCODE = l.RP_DOORPOSITIONCODE )';
  stSql := stSql + ' Left Join TB_ACCESSCONTROLTYPE m ';
  stSql := stSql + ' ON(a.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND a.AE_CONTROLTYPECODE = m.AE_CONTROLTYPECODE )';
  stSql := stSql + ' Left Join TB_ACCESSPERMITCODE n ';
  stSql := stSql + ' ON(a.GROUP_CODE = n.GROUP_CODE ';
  stSql := stSql + ' AND a.AP_PERMITCODE = n.AP_PERMITCODE )';
  stSql := stSql + ' Left Join TB_CARDGUBUN o ';
  stSql := stSql + ' ON(f.GROUP_CODE = o.GROUP_CODE ';
  stSql := stSql + ' AND f.CA_CARDGUBUN = o.CA_CARDGUBUN )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.AE_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.AE_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.AE_DATE + a.AE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.AE_DATE || a.AE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aNodeNo = '' then
  begin
    if aBuildingCode <> '0' then stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
    if aArmAreaNo <> '' then stSql := stSql + ' AND a.AR_ARMAREANO = ' + aArmAreaNo + ' ';
  end;
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND g.EM_NAME Like N''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND g.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND g.EM_COMPANYPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //핸드폰
          stSql := stSql + ' AND g.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //카드번호
          stSql := stSql + ' AND a.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //기타
          stSql := stSql + ' AND g.EM_EMINFO Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '0' then stSql := stSql + ' AND g.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND g.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardState <> '' then stSql := stSql + ' AND f.CA_STATECODE = ''' + aCardState + ''' ';
    if aEmGubun <> '' then stSql := stSql + ' AND g.EM_GUBUNCODE = ''' + aEmGubun + ''' ';
  end;
  stSql := stSql + ' order by a.AE_DATE,a.AE_TIME ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_ACCESSEVENT_ATCHECK: string;
var
  stSql : string;
begin
  stSql := ' Select a.* from TB_ACCESSEVENT a ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.EM_SEQ = b.EM_SEQ ';
  stSql := stSql + ' AND b.EM_ATUSE = ''1'' ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AE_ATCHECK = ''N'' ';  //집계 안된 내역을 모두 가져 오자

  result := stSql;
end;

function TdmDBSelect.SelectTB_ACCESSEVENT_ATSUMMARY: string;
var
  stSql : string;
begin
  stSql := ' Select a.* from TB_ACCESSEVENT a ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.EM_SEQ = b.EM_SEQ ';
  stSql := stSql + ' AND b.EM_ATUSE = ''1'' ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AE_ATSUMMARY = ''R'' ';  //집계 안된 내역을 모두 가져 오자

  result := stSql;

end;

function TdmDBSelect.SelectTB_ACCESSEVENT_ATWork(
  aStartAccessInsertTime: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.* from TB_ACCESSEVENT a ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.EM_SEQ = b.EM_SEQ ';
  stSql := stSql + ' AND b.EM_ATUSE = ''1'' ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  //stSql := stSql + ' AND a.AE_ATCHECK = ''N'' ';  //전체 모두 가져 오자
  if aStartAccessInsertTime <> '' then stSql := stSql + ' AND a.AE_INSERTTIME > ''' + aStartAccessInsertTime + ''' ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_ACCESSEVENT_FoodWork(
  aStartAccessInsertTime: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.RE_FDTYPE,b.FG_CODE from TB_ACCESSEVENT a ';
  stSql := stSql + ' Inner Join TB_READER b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.RE_READERNO = b.RE_READERNO ';
  stSql := stSql + ' AND b.RE_FDTYPE <> ''0'') ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aStartAccessInsertTime <> '' then stSql := stSql + ' AND a.AE_INSERTTIME > ''' + aStartAccessInsertTime + ''' ';
  stSql := stSql + ' order by a.AE_INSERTTIME';
  result := stSql;

end;

function TdmDBSelect.SelectTB_ADMINDEVICE_ArmArea(aUserID, aBuildingCode,
  aType: string): string;
var
  stSql : string;
begin
  stSql := 'Select b.* from TB_ADMINDEVICE a ';
  stSql := stSql + ' Inner Join TB_ARMAREA b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.AG_NO = b.AR_ARMAREANO  ';
  stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'') ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';
  stSql := stSql + ' AND a.AG_TYPE = ''' + aType + ''' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ADMINDEVICE_Door(aUserID, aBuildingCode,
  aType: string): string;
var
  stSql : string;
begin
  stSql := 'Select b.* from TB_ADMINDEVICE a ';
  stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.AG_NO = b.DO_DOORNO  ';
  stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'') ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';
  stSql := stSql + ' AND a.AG_TYPE = ''' + aType + ''' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ADMINGRADECODE_Name(aName: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_ADMINGRADECODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AG_GRADECODENAME Like ''' + aName + '%'' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ADMINGRADEPROGRAM_GradeProgram(aAdminClassCode,
  aProgramGroupCode, aMenuGroupCode: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.FN_PROGRAMGUBUN,a.FN_MENUGUBUN,a.FN_MENUGROUP,a.FN_NAMECODE,a.FN_NAME' + inttostr(G_nFormLanguageType) + ' as NAME,b.AG_INSERT,b.AG_UPDATE,b.AG_DELETE from TB_FORMNAME a';
  stSql := stSql + ' Inner Join TB_ADMINGRADEPROGRAM b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.FN_PROGRAMGUBUN = b.FN_PROGRAMGUBUN ';
  stSql := stSql + ' AND a.FN_NAMECODE = b.FN_NAMECODE  ';
  stSql := stSql + ' AND b.AG_GRADECODE = ''' + aAdminClassCode + ''' )';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.FN_VIEW = ''1'' ';
  stSql := stSql + ' AND a.FN_MENUGROUP = ''2'' '; //프로그램 메뉴그룹만 선택
  if aProgramGroupCode <> '' then stSql := stSql + ' AND a.FN_PROGRAMGUBUN = ''' + aProgramGroupCode + ''' ';
  if aMenuGroupCode <> '' then
  begin
    stSql := stSql + ' AND a.FN_NAMECODE Like ''' + aMenuGroupCode + '%'' ';
  end;
  stSql := stSql + ' Order by a.FN_NAMECODE ';


  result := stSql;
end;

function TdmDBSelect.SelectTB_ADMINGRADEPROGRAM_NotGradeProgram(aAdminClassCode,
  aProgramGroupCode, aMenuGroupCode: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.FN_PROGRAMGUBUN,a.FN_MENUGUBUN,a.FN_MENUGROUP,a.FN_NAMECODE,a.FN_NAME' + inttostr(G_nFormLanguageType) + ' as NAME from TB_FORMNAME a';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.FN_VIEW = ''1'' ';
  stSql := stSql + ' AND a.FN_MENUGROUP = ''2'' '; //프로그램 메뉴그룹만 선택
  if aProgramGroupCode <> '' then stSql := stSql + ' AND a.FN_PROGRAMGUBUN = ''' + aProgramGroupCode + ''' ';
  if aMenuGroupCode <> '' then
  begin
    stSql := stSql + ' AND a.FN_NAMECODE Like ''' + aMenuGroupCode + '%'' ';
  end;
  stSql := stSql + ' AND FN_NAMECODE NOT IN ( ';
  stSql := stSql + ' Select FN_NAMECODE ';
  stSql := stSql + ' From TB_ADMINGRADEPROGRAM ';
  stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AG_GRADECODE = ''' + aAdminClassCode + ''' ';
  stSql := stSql + ' AND FN_PROGRAMGUBUN = a.FN_PROGRAMGUBUN ';
  stSql := stSql + ') ';
  stSql := stSql + ' Order by a.FN_NAMECODE ';


  result := stSql;
end;

function TdmDBSelect.SelectTB_ADMIN_UserName(aUserName: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_ADMIN ';
  stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AD_USERNAME Like ''' + aUserName + '%'' ';
  stSql := stSql + ' Order by AD_USERID ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ALARMEVENTSTATEPCCODE_All: string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_ALARMEVENTSTATEPCCODE ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ALARMEVENT_AlarmReport(aStartDate, aStartTime,
  aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID, aArmAreaNo, aArmMode,
  aAlarmEventGroup, aAlarmEventPCCode, aAlarmDeviceType, aAlarmConfirm: string;
  aTimeType: integer= 0;aSearchDateType:integer = 0): string;
var
  stSql : string;
begin
  stSql := ' Select a.AE_DATE,a.AE_TIME,c.BC_BUILDINGNAME as BUILDINGNAME1,d.BC_BUILDINGNAME as BUILDINGNAME2,e.BC_BUILDINGNAME as BUILDINGNAME3, ';
  stSql := stSql + ' b.AR_ARMAREANAME,f.AM_ARMMODENAME' + inttostr(G_nFormLanguageType) + ' as ARMMODENAME,';
  stSql := stSql + ' g.AL_ALARMDEVICETYPENAME,a.AE_SUBADDR,a.ZN_ZONENO,h.ZN_ZONENAME,';
  stSql := stSql + ' i.AP_PORTSTATENAME' + inttostr(G_nFormLanguageType) + ' as PORTSTATENAME,a.AE_EVENTSTATECODE,';
  stSql := stSql + ' j.AP_EVENTSTATEPCCODENAME' + inttostr(G_nFormLanguageType) + ' as EVENTSTATEPCCODENAME,';
  stSql := stSql + ' a.AE_OPERATOR,l.EM_CODE,l.EM_NAME,a.AE_CHECKMSG,a.AD_USERID,a.AE_CHECKTIME ';
  stSql := stSql + ' From TB_ALARMEVENT a ';
  stSql := stSql + ' Left Join TB_ARMAREA b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.AR_ARMAREANO = b.AR_ARMAREANO ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE ';
  stSql := stSql + ' AND c.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE e ';
  stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE ';
  stSql := stSql + ' AND e.BC_DEEPSEQ = 3 ) ';
  stSql := stSql + ' Left Join TB_ALARMMODECODE f ';
  stSql := stSql + ' ON(a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.AM_ARMMODECODE = f.AM_ARMMODECODE ) ';
  stSql := stSql + ' Left Join TB_ALARMDEVICETYPE g ';
  stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_ALARMDEVICETYPE = g.AL_ALARMDEVICETYPE ) ';
  stSql := stSql + ' Left Join TB_ZONE h ';
  stSql := stSql + ' ON(a.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = h.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = h.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = h.DE_EXTENDID ';
  stSql := stSql + ' AND a.ZN_ZONENO = h.ZN_ZONENO ) ';
  stSql := stSql + ' Left Join TB_ALARMPORTSTATE i ';
  stSql := stSql + ' ON(a.GROUP_CODE = i.GROUP_CODE ';
  stSql := stSql + ' AND a.AP_PORTSTATE = i.AP_PORTSTATE) ';
  stSql := stSql + ' Left Join TB_ALARMEVENTSTATEPCCODE j ';
  stSql := stSql + ' ON(a.GROUP_CODE = j.GROUP_CODE ';
  stSql := stSql + ' AND a.AP_EVENTSTATEPCCODE = j.AP_EVENTSTATEPCCODE) ';
  stSql := stSql + ' Left Join TB_CARD k ';
  stSql := stSql + ' ON(a.GROUP_CODE = k.GROUP_CODE ';
  stSql := stSql + ' AND a.AE_OPERATOR = k.CA_CARDNO) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE l ';
  stSql := stSql + ' ON(k.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND k.EM_SEQ = l.EM_SEQ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aSearchDateType = 0 then  //기기시간
  begin
    if aTimeType = 0 then
    begin
      stSql := stSql + ' AND a.AE_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
      stSql := stSql + ' AND a.AE_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
    end else
    begin
      if G_nDBType = MSSQL then stSql := stSql + ' AND a.AE_DATE + a.AE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
      else stSql := stSql + ' AND a.AE_DATE || a.AE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
    end;
  end else if aSearchDateType = 1 then //PC입력시간
  begin
    stSql := stSql + ' AND a.AE_INSERTTIME BETWEEN ''' + aStartDate + aStartTime + '000'' AND ''' + aEndDate + aEndTime + '999'' '
  end;

  if aNodeNo = '' then
  begin
    if aBuildingCode <> '0' then stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
    if aArmAreaNo <> '' then stSql := stSql + ' AND a.AR_ARMAREANO = ' + aArmAreaNo + ' ';
  end;
  if aArmMode <> '' then stSql := stSql + ' AND a.AM_ARMMODECODE = ''' + aArmMode + ''' ';
  if aAlarmEventPCCode <> '' then stSql := stSql + ' AND a.AP_EVENTSTATEPCCODE = ''' + aAlarmEventPCCode + ''' '
  else if aAlarmEventGroup <> '' then stSql := stSql + ' AND j.AG_ALARMGROUPCODE = ' + aAlarmEventGroup + ' ';
  if aAlarmDeviceType <> '' then stSql := stSql + ' AND a.AL_ALARMDEVICETYPE = ''' + aAlarmDeviceType + ''' ';
  if aAlarmConfirm <> '' then stSql := stSql + ' AND a.AE_CHECKMSG Like ''%' + aAlarmConfirm + '%'' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ALARMEVENT_ArmAreaScurityEvent(aNodeNo, aEcuID,
  aArmAreaNo, aInsertTime: string): string;
var
  stSql : string;
begin
  stSql := ' select a.*,b.AE_EVENTSTATECODENAME,c.AP_EVENTSTATEPCCODENAME,d.ND_DECODERNO from tb_alarmevent a ';
  stSql := stSql + ' Left Join (select AE_EVENTSTATECODE,AE_EVENTSTATECODENAME' + inttostr(G_nFormLanguageType) + ' as AE_EVENTSTATECODENAME From TB_ALARMEVENTSTATECODE ) b ';
  stSql := stSql + ' ON (a.AE_EVENTSTATECODE = b.AE_EVENTSTATECODE ) ';
  stSql := stSql + ' Left Join (select AP_EVENTSTATEPCCODE,AP_EVENTSTATEPCCODENAME' + inttostr(G_nFormLanguageType) + ' as AP_EVENTSTATEPCCODENAME From TB_ALARMEVENTSTATEPCCODE ) c ';
  stSql := stSql + ' ON (a.AP_EVENTSTATEPCCODE = c.AP_EVENTSTATEPCCODE ) ';
  stSql := stSql + ' Inner Join TB_NODE d ';
  stSql := stSql + ' ON(a.ND_NODENO = d.ND_NODENO) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND a.AR_ARMAREANO = ' + aArmAreaNo + ' ';
  stSql := stSql + ' AND a.AE_INSERTTIME > ''' + aInsertTime + ''' ';
  stSql := stSql + ' AND a.AE_CHECKOK = ''0'' ';
  stSql := stSql + ' AND a.AP_VIEW = ''1'' ';
  //stSql := stSql + ' AND a.AP_SOUND = ''1'' ';
  stSql := stSql + ' AND a.AP_MODECHANGE <> ''1'' ';
  stSql := stSql + ' Order by a.AE_INSERTTIME ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_ALARMEVENT_BuildingScurityEvent(aBuildingCode,
  aInsertTime: string): string;
var
  stSql : string;
begin
  stSql := ' select a.*,b.AE_EVENTSTATECODENAME,c.AP_EVENTSTATEPCCODENAME,e.ND_DECODERNO from tb_alarmevent a ';
  stSql := stSql + ' Left Join (select AE_EVENTSTATECODE,AE_EVENTSTATECODENAME' + inttostr(G_nFormLanguageType) + ' as AE_EVENTSTATECODENAME From TB_ALARMEVENTSTATECODE ) b ';
  stSql := stSql + ' ON (a.AE_EVENTSTATECODE = b.AE_EVENTSTATECODE ) ';
  stSql := stSql + ' Left Join (select AP_EVENTSTATEPCCODE,AP_EVENTSTATEPCCODENAME' + inttostr(G_nFormLanguageType) + ' as AP_EVENTSTATEPCCODENAME From TB_ALARMEVENTSTATEPCCODE ) c ';
  stSql := stSql + ' ON (a.AP_EVENTSTATEPCCODE = c.AP_EVENTSTATEPCCODE ) ';
  stSql := stSql + ' Inner Join TB_ARMAREA d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
  stSql := stSql + ' AND a.AR_ARMAREANO = d.AR_ARMAREANO ';
  stSql := stSql + ' AND d.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ) ';
  stSql := stSql + ' Inner Join TB_NODE e ';
  stSql := stSql + ' ON(a.ND_NODENO = e.ND_NODENO) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AE_INSERTTIME > ''' + aInsertTime + ''' ';
  stSql := stSql + ' AND a.AE_CHECKOK = ''0'' ';
  stSql := stSql + ' AND a.AP_VIEW = ''1'' ';
  //stSql := stSql + ' AND a.AP_SOUND = ''1'' ';
  stSql := stSql + ' AND a.AP_MODECHANGE <> ''1'' ';
  stSql := stSql + ' Order by a.AE_INSERTTIME ';
  result := stSql;

end;

function TdmDBSelect.SelectTB_ALARMEVENT_ScurityEvent(aInsertTime: string): string;
var
  stSql : string;
begin
  stSql := ' select top 500 a.*,b.AE_EVENTSTATECODENAME,c.AP_EVENTSTATEPCCODENAME,d.ND_DECODERNO from tb_alarmevent a ';
  stSql := stSql + ' Left Join (select AE_EVENTSTATECODE,AE_EVENTSTATECODENAME' + inttostr(G_nFormLanguageType) + ' as AE_EVENTSTATECODENAME From TB_ALARMEVENTSTATECODE ) b ';
  stSql := stSql + ' ON (a.AE_EVENTSTATECODE = b.AE_EVENTSTATECODE ) ';
  stSql := stSql + ' Left Join (select AP_EVENTSTATEPCCODE,AP_EVENTSTATEPCCODENAME' + inttostr(G_nFormLanguageType) + ' as AP_EVENTSTATEPCCODENAME From TB_ALARMEVENTSTATEPCCODE ) c ';
  stSql := stSql + ' ON (a.AP_EVENTSTATEPCCODE = c.AP_EVENTSTATEPCCODE ) ';
  stSql := stSql + ' Inner Join TB_NODE d ';
  stSql := stSql + ' ON (a.ND_NODENO = d.ND_NODENO ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AE_INSERTTIME > ''' + aInsertTime + ''' ';
  stSql := stSql + ' AND a.AE_CHECKOK = ''0'' ';
  stSql := stSql + ' AND a.AP_VIEW = ''1'' ';
  stSql := stSql + ' AND a.AP_MODECHANGE <> ''1'' ';
  stSql := stSql + ' Order by a.AE_INSERTTIME ';
  result := stSql;

end;

function TdmDBSelect.SelectTB_ANTIGROUPCODE_Name(aName: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_ANTIGROUPCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aName <> '' then stSql := stSql + ' AND AG_NAME = ''' + aName + ''' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_AdminArmArea(aUserID: string;aBuildingCode:string='';aNameSort:Boolean=False): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME from ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_ARMAREA a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO )';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_ADMINDEVICE ';
    stSql := stSql + ' where AD_USERID = ''' + aUserID + ''' ';
    stSql := stSql + ' AND AG_TYPE = ''2'' )  d ';
    stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = d.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = d.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = d.DE_EXTENDID) ';
    stSql := stSql + ' AND (a.AR_ARMAREANO = d.AG_NO) ';
    stSql := stSql + ' )';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
  end else
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME from ';
    stSql := stSql + ' TB_ARMAREA a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' Inner Join TB_ADMINDEVICE d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = d.DE_EXTENDID ';
    stSql := stSql + ' AND a.AR_ARMAREANO = d.AG_NO ';
    stSql := stSql + ' AND d.AD_USERID = ''' + aUserID + ''' ';
    stSql := stSql + ' AND d.AG_TYPE = ''2'' ';
    stSql := stSql + ')';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
  end;
  if aBuildingCode <> '' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  if aNameSort then stSql := stSql + ' Order by a.AR_ARMAREANAME,a.AR_VIEWSEQ,a.BC_BUILDINGCODE,a.ND_NODENO,a.DE_ECUID,a.AR_ARMAREANO '
  else stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.AR_ARMAREANO ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_AdminBuilding(aUserID: string;aBuildingCode:string='';aNameSort:Boolean=False): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME from ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_ARMAREA a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO )';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_ADMIN where AD_USERID = ''' + aUserID + ''')  d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE) ';
    stSql := stSql + ' AND (a.BC_BUILDINGCODE Like d.BC_BUILDINGCODE + ''%'') ';
    stSql := stSql + ' )';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_VIEW = ''1'' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
  end else
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME from ';
    stSql := stSql + ' TB_ARMAREA a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' Inner Join TB_ADMIN d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND a.BC_BUILDINGCODE Like d.BC_BUILDINGCODE + ''%'' '
    else if G_nDBType = POSTGRESQL then stSql := stSql + ' AND a.BC_BUILDINGCODE Like d.BC_BUILDINGCODE || ''%'' ';
    stSql := stSql + ' AND d.AD_USERID = ''' + aUserID + ''' ';
    stSql := stSql + ')';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_VIEW = ''1'' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
  end;
  if aBuildingCode <> '' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  if aNameSort then stSql := stSql + ' Order by a.AR_ARMAREANAME,a.AR_VIEWSEQ,a.BC_BUILDINGCODE,a.ND_NODENO,a.DE_ECUID,a.AR_ARMAREANO '
  else stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.AR_ARMAREANO ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_BuildingCode(
  aBuildingCode: string;aSearchName:string=''): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select ';
    stSql := stSql + ' a.ND_NODENO,';
    stSql := stSql + ' a.DE_ECUID,';
    stSql := stSql + ' a.DE_EXTENDID,';
    stSql := stSql + ' a.AR_ARMAREANO,';
    stSql := stSql + ' a.AR_ARMAREAUSE,';
    stSql := stSql + ' a.AR_ARMAREANAME,';
    stSql := stSql + ' a.BC_BUILDINGCODE,';
    stSql := stSql + ' a.AR_VIEWSEQ,c.ND_DECODERNO ';
    stSql := stSql + ' From TB_ARMAREA a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' Inner Join TB_NODE c';
    stSql := stSql + ' ON(a.ND_NODENO = c.ND_NODENO ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aBuildingCode <> '' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
    if aSearchName <> '' then stSql := stSql + ' AND a.AR_ARMAREANAME Like ''%' + aSearchName + '%'' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
    stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  end else
  begin
    stSql := ' Select ';
    stSql := stSql + ' a.ND_NODENO,';
    stSql := stSql + ' a.DE_ECUID,';
    stSql := stSql + ' a.DE_EXTENDID,';
    stSql := stSql + ' a.AR_ARMAREANO,';
    stSql := stSql + ' a.AR_ARMAREAUSE,';
    stSql := stSql + ' a.AR_ARMAREANAME,';
    stSql := stSql + ' a.BC_BUILDINGCODE,';
    stSql := stSql + ' a.AR_VIEWSEQ,c.ND_DECODERNO  ';
    stSql := stSql + ' From TB_ARMAREA a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Inner Join TB_NODE c';
    stSql := stSql + ' ON(a.ND_NODENO = c.ND_NODENO ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aBuildingCode <> '' then  stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
    if aSearchName <> '' then stSql := stSql + ' AND a.AR_ARMAREANAME Like ''%' + aSearchName + '%'' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
    stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  end;
  result := stSql;

end;


function TdmDBSelect.SelectTB_ARMAREA_CompanyNotPermitCode(aBuildingCode,
  aCompanyCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.* ';
  stSql := stSql + ' From (select * from TB_ARMAREA ';
  stSql := stSql + ' where  BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  stSql := stSql + ' AND AR_ARMAREAUSE = ''1'' ';
  stSql := stSql + ' AND AR_VIEW = ''1'' ';
  stSql := stSql + ' ) a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Where Not Exists( select * from  TB_CARDPERMITCOMPANYGROUP c ';
  stSql := stSql + ' where a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
  stSql := stSql + ' AND a.AR_ARMAREANO = c.CP_NUMBER ';
  stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_ARMAREA + ''' ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
  stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_CompanyPermit(
  aCompanyCode: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.AR_ARMAREANAME, ';
    stSql := stSql + 'a.AR_ARMAREAUSE, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'c.CP_PERMIT, ';
    stSql := stSql + 'a.AR_VIEWSEQ ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_ARMAREA a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_CARDPERMITCOMPANYGROUP  ';
    stSql := stSql + ' Where CP_TYPE = '''+ con_ComLogTYPE_ARMAREA +''' ';
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ) c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO ) ';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID ) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = c.DE_EXTENDID ) ';
    stSql := stSql + ' AND (a.AR_ARMAREANO = c.CP_NUMBER) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
    stSql := stSql + ' AND a.AR_VIEW = ''1'' ';
    stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  end else
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.AR_ARMAREANAME, ';
    stSql := stSql + 'a.AR_ARMAREAUSE, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'c.CP_PERMIT, ';
    stSql := stSql + 'a.AR_VIEWSEQ ';
    stSql := stSql + ' From TB_ARMAREA a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
    stSql := stSql + ' AND a.AR_ARMAREANO = c.CP_NUMBER ';
    stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_ARMAREA + ''' ';
    stSql := stSql + ' AND c.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
    stSql := stSql + ' AND a.AR_VIEW = ''1'' ';
    stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_CompanyPermit_II(aBuildingCode,
  aCompanyCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.*, ';
  stSql := stSql + 'c.CP_PERMIT ';
  stSql := stSql + ' From ( select * from TB_ARMAREA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AR_ARMAREAUSE = ''1'' ';
  stSql := stSql + ' AND AR_VIEW = ''1'' ';
  stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ) a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
  stSql := stSql + ' AND a.AR_ARMAREANO = c.CP_NUMBER ';
  stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_ARMAREA + ''' ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
  stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_EmGroupNotPermitCode(aBuildingCode,
  aEmGroupCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.* ';
  stSql := stSql + ' From (select * from TB_ARMAREA ';
  stSql := stSql + ' where  BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  stSql := stSql + ' AND AR_ARMAREAUSE = ''1'' ';
  stSql := stSql + ' AND AR_VIEW = ''1'' ';
  stSql := stSql + ' ) a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Where Not Exists( select * from  TB_CARDPERMITEMPLOYEEGROUP c ';
  stSql := stSql + ' where a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
  stSql := stSql + ' AND a.AR_ARMAREANO = c.CP_NUMBER ';
  stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_ARMAREA + ''' ';
  stSql := stSql + ' AND c.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
  stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_EmGroupPermit(
  aEmGroupCode: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.AR_ARMAREANAME, ';
    stSql := stSql + 'a.AR_ARMAREAUSE, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'c.CP_PERMIT, ';
    stSql := stSql + 'a.AR_VIEWSEQ ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_ARMAREA a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_CARDPERMITEMPLOYEEGROUP  ';
    stSql := stSql + ' Where CP_TYPE = '''+ con_ComLogTYPE_ARMAREA +''' ';
    stSql := stSql + ' AND EM_GROUPCODE = ''' + aEmGroupCode + ''' ) c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO ) ';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID ) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = c.DE_EXTENDID ) ';
    stSql := stSql + ' AND (a.AR_ARMAREANO = c.CP_NUMBER) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
    stSql := stSql + ' AND a.AR_VIEW = ''1'' ';
    stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  end else
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.AR_ARMAREANAME, ';
    stSql := stSql + 'a.AR_ARMAREAUSE, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'c.CP_PERMIT, ';
    stSql := stSql + 'a.AR_VIEWSEQ ';
    stSql := stSql + ' From TB_ARMAREA a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
    stSql := stSql + ' AND a.AR_ARMAREANO = c.CP_NUMBER ';
    stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_ARMAREA + ''' ';
    stSql := stSql + ' AND c.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
    stSql := stSql + ' AND a.AR_VIEW = ''1'' ';
    stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_EmGroupPermit_II(aBuildingCode,
  aEmGroupCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.*, ';
  stSql := stSql + 'c.CP_PERMIT ';
  stSql := stSql + ' From ( select * from TB_ARMAREA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AR_ARMAREAUSE = ''1'' ';
  stSql := stSql + ' AND AR_VIEW = ''1'' ';
  stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ) a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
  stSql := stSql + ' AND a.AR_ARMAREANO = c.CP_NUMBER ';
  stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_ARMAREA + ''' ';
  stSql := stSql + ' AND c.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
  stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_EmployeePermit(aBuildingCode,
  aEmSeq: string;aSearchName:string=''): string;
var
  stSql : string;
begin
  stSql := 'Select a.*, ';
  stSql := stSql + 'c.CP_PERMIT ';
  stSql := stSql + ' From ( select * from TB_ARMAREA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AR_ARMAREAUSE = ''1'' ';
  stSql := stSql + ' AND AR_VIEW = ''1'' ';
  if aSearchName <> '' then stSql := stSql + ' AND a.AR_ARMAREANAME Like ''%' + aSearchName + '%'' ';
  stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ) a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEECODE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
  stSql := stSql + ' AND a.AR_ARMAREANO = c.CP_NUMBER ';
  stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_ARMAREA + ''' ';
  stSql := stSql + ' AND c.EM_SEQ = ' + aEmSeq + ' ) ';
  stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_EmSeqPermit(aEmSeq: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.AR_ARMAREANAME, ';
    stSql := stSql + 'a.AR_ARMAREAUSE, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'a.AR_VIEWSEQ ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_ARMAREA a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_CARDPERMITEMPLOYEECODE  ';
    stSql := stSql + ' Where CP_TYPE = '''+ con_ComLogTYPE_ARMAREA +''' ';
    stSql := stSql + ' AND CP_PERMIT = ''1'' ';
    stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ) c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO ) ';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID ) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = c.DE_EXTENDID ) ';
    stSql := stSql + ' AND (a.AR_ARMAREANO = c.CP_NUMBER) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
    stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  end else
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.AR_ARMAREANAME, ';
    stSql := stSql + 'a.AR_ARMAREAUSE, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'a.AR_VIEWSEQ ';
    stSql := stSql + ' From TB_ARMAREA a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEECODE c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
    stSql := stSql + ' AND a.AR_ARMAREANO = c.CP_NUMBER ';
    stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_ARMAREA + ''' ';
    stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
    stSql := stSql + ' AND c.EM_SEQ = ' + aEmSeq + ' ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
    stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.AR_ARMAREANO ';
  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_ARMAREA_MasterAll(aBuildingCode:string='';aNameSort:Boolean=False): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME from ';
    stSql := stSql + '( ';
    stSql := stSql + ' TB_ARMAREA a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ') ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO )';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_VIEW = ''1'' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
  end else
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME from ';
    stSql := stSql + ' TB_ARMAREA a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.AR_VIEW = ''1'' ';
    stSql := stSql + ' AND a.AR_ARMAREAUSE = ''1'' ';
  end;
  if aBuildingCode <> '' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  if aNameSort then   stSql := stSql + ' Order by a.AR_ARMAREANAME,a.AR_VIEWSEQ,a.BC_BUILDINGCODE,a.ND_NODENO,a.DE_ECUID,a.AR_ARMAREANO '
  else  stSql := stSql + ' Order by a.AR_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.AR_ARMAREANO ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ATTENDEVENT_AttendReport(aStartDate, aEndDate,
  aCompanyCode, aPosiCode, aEmpGubun, aEtcType, aEtcName: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.AT_DATE,';
  if G_nReportCompanyStep > 0 then stSql := stSql + ' c.CO_COMPANYNAME as COMPANYNAME1,';
  if G_nReportCompanyStep > 1 then stSql := stSql + ' d.CO_COMPANYNAME as COMPANYNAME2,';
  if G_nReportCompanyStep > 2 then stSql := stSql + ' e.CO_COMPANYNAME as COMPANYNAME3, ';
  if G_nReportCompanyStep > 3 then stSql := stSql + ' p.CO_COMPANYNAME as COMPANYNAME4, ';
  if G_nReportCompanyStep > 4 then stSql := stSql + ' q.CO_COMPANYNAME as COMPANYNAME5, ';
  if G_nReportCompanyStep > 5 then stSql := stSql + ' r.CO_COMPANYNAME as COMPANYNAME6, ';
  if G_nReportCompanyStep > 6 then stSql := stSql + ' s.CO_COMPANYNAME as COMPANYNAME7, ';
  stSql := stSql + ' f.PO_POSICODENAME,a.EM_SEQ,a.EM_CODE,a.EM_NAME,a.AW_CODE,h.AW_NAME,a.AT_ATCODE,i.AT_CODENAME,'  ;
  stSql := stSql + ' a.AE_ATTYPEUSER,a.AE_INUSER,a.AE_WORKOUTUSER,a.AE_WORKINUSER,a.AE_OUTUSER,'  ;
  stSql := stSql + ' a.AE_ATINTIME,a.AE_ATWORKOUTTIME,a.AE_ATWORKINTIME,a.AE_ATOUTTIME,j.AC_NAME as AT_INRESULT,k.AC_NAME as AT_OUTRESULT,'  ;
  stSql := stSql + ' a.AE_WORKMM,AE_EXTENDWORKMM,AE_NIGHTWORKMM '  ;
  stSql := stSql + ' FROM TB_ATTENDEVENT a ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.EM_SEQ = b.EM_SEQ)';
  if G_nReportCompanyStep > 0 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE ';
    stSql := stSql + ' AND c.CO_DEEPSEQ = 1 ) ';
  end;
  if G_nReportCompanyStep > 1 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE d ';
    stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE ';
    stSql := stSql + ' AND d.CO_DEEPSEQ = 2 ) ';
  end;
  if G_nReportCompanyStep > 2 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE e ';
    stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE ';
    stSql := stSql + ' AND e.CO_DEEPSEQ = 3 ) ';
  end;
  if G_nReportCompanyStep > 3 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE p ';
    stSql := stSql + ' ON(b.GROUP_CODE = p.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE ';
    stSql := stSql + ' AND p.CO_DEEPSEQ = 4 ) ';
  end;
  if G_nReportCompanyStep > 4 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE q ';
    stSql := stSql + ' ON(b.GROUP_CODE = q.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE ';
    stSql := stSql + ' AND q.CO_DEEPSEQ = 5 ) ';
  end;
  if G_nReportCompanyStep > 5 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE r ';
    stSql := stSql + ' ON(b.GROUP_CODE = r.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE ';
    stSql := stSql + ' AND r.CO_DEEPSEQ = 6 ) ';
  end;
  if G_nReportCompanyStep > 6 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE s ';
    stSql := stSql + ' ON(b.GROUP_CODE = s.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE ';
    stSql := stSql + ' AND s.CO_DEEPSEQ = 7 ) ';
  end;
  stSql := stSql + ' Left Join TB_POSICODE f ';
  stSql := stSql + ' ON(b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE )';
  if aEtcName <> '' then
  begin
    if aEtcType = '4' then
    begin
      stSql := stSql + ' Inner Join TB_CARD g ';
      stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
      stSql := stSql + ' AND a.EM_SEQ = g.EM_SEQ ) ';
    end;
  end;
  stSql := stSql + ' Left Join TB_ATTENDWORKTYPE h ';
  stSql := stSql + ' ON(a.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND a.AW_CODE = h.AW_CODE )';
  stSql := stSql + ' Left Join TB_ATTENDCODE i ';
  stSql := stSql + ' ON(a.GROUP_CODE = i.GROUP_CODE ';
  stSql := stSql + ' AND a.AW_CODE = i.AW_CODE ';
  stSql := stSql + ' AND a.AT_ATCODE = i.AT_ATCODE )';
  stSql := stSql + ' Left Join TB_ATTENDINOUTCODE j ';
  stSql := stSql + ' ON(a.GROUP_CODE = j.GROUP_CODE ';
  stSql := stSql + ' AND a.AE_ATINRESULT = j.AC_RESULTCODE )';
  stSql := stSql + ' Left Join TB_ATTENDINOUTCODE k ';
  stSql := stSql + ' ON(a.GROUP_CODE = k.GROUP_CODE ';
  stSql := stSql + ' AND a.AE_ATOUTRESULT = k.AC_RESULTCODE )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AT_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
  stSql := stSql + ' AND b.EM_ATUSE = ''1'' ';
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND b.EM_NAME Like N''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND b.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND b.EM_COMPANYPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //핸드폰
          stSql := stSql + ' AND b.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //카드번호
          stSql := stSql + ' AND g.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //기타
          stSql := stSql + ' AND b.EM_EMINFO Like N''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '0' then stSql := stSql + ' AND b.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND b.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aEmpGubun <> '' then stSql := stSql + ' AND b.EM_GUBUNCODE = ''' + aEmpGubun + ''' ';
  end;
  stSql := stSql + ' order by a.AT_DATE,a.CO_COMPANYCODE,a.EM_CODE ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_BUILDINGCODE_All: string;
var
  stSql : string;
begin
  stSql := ' select * From TB_BUILDINGCODE ';
  stSql := stSql + ' Where BC_CODEUSE = ''1'' ';
  if G_nDBType = MSSQL then stSql := stSql + ' AND len(BC_BUILDINGCODE) = ' + inttostr(1 + G_nBuildingCodeLength * G_nBuildingStep) + ' '
  else if G_nDBType = MDB then stSql := stSql + ' AND len(BC_BUILDINGCODE) = ' + inttostr(1 + G_nBuildingCodeLength * G_nBuildingStep) + ' '
  else if G_nDBType = PostGresql then stSql := stSql + ' AND length(BC_BUILDINGCODE) = ' + inttostr(1 + G_nBuildingCodeLength * G_nBuildingStep) + ' '
  else stSql := stSql + ' AND length(BC_BUILDINGCODE) = ' + inttostr(1 + G_nBuildingCodeLength * G_nBuildingStep) + ' ';
  stSql := stSql + ' Order by BC_VIEWSEQ,BC_BUILDINGCODE ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_BUILDINGCODE_Group(aBuildingCode: string): string;
var
  stSql : string;
  nBuildingStep : integer;
begin
  nBuildingStep := Length(aBuildingCode) div G_nBuildingCodeLength;
  stSql := ' select * From TB_BUILDINGCODE ';
  stSql := stSql + ' Where BC_CODEUSE = ''1'' ';
  stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  if G_nDBType = MSSQL then stSql := stSql + ' AND len(BC_BUILDINGCODE) = ' + inttostr(1 + G_nBuildingCodeLength * (nBuildingStep + 1)) + ' '
  else if G_nDBType = MDB then stSql := stSql + ' AND len(BC_BUILDINGCODE) = ' + inttostr(1 + G_nBuildingCodeLength * (nBuildingStep + 1)) + ' '
  else if G_nDBType = PostGresql then stSql := stSql + ' AND length(BC_BUILDINGCODE) = ' + inttostr(1 + G_nBuildingCodeLength * (nBuildingStep + 1)) + ' '
  else stSql := stSql + ' AND length(BC_BUILDINGCODE) = ' + inttostr(1 + G_nBuildingCodeLength * (nBuildingStep + 1)) + ' ';
  stSql := stSql + ' Order by BC_VIEWSEQ,BC_BUILDINGCODE ';

  result := stSql;

end;

function TdmDBSelect.SelectTB_CARDBUTTONEVENTSTAT_Report(aStartDate, aEndDate,
  aBuildingCode, aDoorName: string): string;
var
  stSql : string;
begin
  stSql := ' select a.DO_DOORNAME,b.BC_BUILDINGNAME as BUILDINGNAME1,c.BC_BUILDINGNAME as BUILDINGNAME2,d.BC_BUILDINGNAME as BUILDINGNAME3, ';
  stSql := stSql + ' e.ND_NODENO,e.DE_ECUID,e.DE_EXTENDID,e.DO_DOORNO,e.CB_CARDEVENT,';
  stSql := stSql + ' e.CB_BUTTONEVENT,e.CB_TELEVENT,e.CB_FIREEVENT,e.CB_REMOTEEVENT,e.CB_SCHEDULEEVENT,e.CB_ETCEVENT ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = b.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = b.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = b.BC_BUILDINGCODE ';
  stSql := stSql + ' AND b.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = c.BC_BUILDINGCODE ';
  stSql := stSql + ' AND c.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 3 ) ';
  stSql := stSql + ' Left Join ( select ND_NODENO,DE_ECUID,DE_EXTENDID,DO_DOORNO,sum(CB_CARDEVENT) as CB_CARDEVENT,';
  stSql := stSql + ' sum(CB_BUTTONEVENT) as CB_BUTTONEVENT,sum(CB_TELEVENT) as CB_TELEVENT,sum(CB_FIREEVENT) as CB_FIREEVENT,';
  stSql := stSql + ' sum(CB_REMOTEEVENT) as CB_REMOTEEVENT,sum(CB_SCHEDULEEVENT) as CB_SCHEDULEEVENT,sum(CB_ETCEVENT) as CB_ETCEVENT ';
  stSql := stSql + ' from TB_CARDBUTTONEVENTSTAT where CB_DAY BETWEEN ''' + aStartDate + ''' and ''' + aEndDate + ''' ';
  stSql := stSql + ' Group by ND_NODENO,DE_ECUID,DE_EXTENDID,DO_DOORNO) e';
  stSql := stSql + ' ON(a.ND_NODENO = e.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = e.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = e.DE_EXTENDID ';
  stSql := stSql + ' AND a.DO_DOORNO = e.DO_DOORNO ) ';
  stSql := stSql + ' Where a.BC_BUILDINGCODE like ''' + aBuildingCode + '%'' ';
  if aDoorName <> '' then stSql := stSql + ' AND a.DO_DOORNAME like ''%' + aDoorName + '%'' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_CARDPERMITEMPLOYEECODE_GradeReport(aBuildingCode,
  aNodeNo, aEcuID, aDoorNo, aCompanyCode, aPosiCode, aCardState, aEmGubun,
  aEtcType, aEtcName,aEmGroupCode: string; aTimeType: integer=0;aNotpermit:Boolean=False;aGradeType:string='0'): string;
var
  stSql : string;
begin
  stSql := ' select a.EM_SEQ,g.EM_CODE,g.EM_NAME,f.CA_CARDNO,o.CA_CARDGUBUNNAME,b.DO_DOORNAME,a.CP_PERMIT,a.CP_APPLY,k.FD_SEND as CP_FINGERAPPLY,i.CP_RCVACK ';
  stSql := stSql + ' FROM (select * from TB_CARDPERMITEMPLOYEECODE where CP_TYPE = ''1'') a ';
  stSql := stSql + ' Inner Join ';
  stSql := stSql + ' (select aa.* from TB_DOOR aa ';
  stSql := stSql +'   Inner Join TB_DEVICE bb ';
  stSql := stSql + '  ON(aa.ND_NODENO = bb.ND_NODENO ';
  stSql := stSql + '  AND aa.DE_ECUID = bb.DE_ECUID ';
  stSql := stSql + '  AND aa.DE_EXTENDID = bb.DE_EXTENDID ';
  stSql := stSql + '  AND bb.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + '  Where aa.DO_VIEW = ''1'' ';
  stSql := stSql + '  AND aa.DO_DOORUSE = ''1'' ';
  stSql := stSql + ' ) b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO )';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.BC_BUILDINGCODE = c.BC_BUILDINGCODE )';
  stSql := stSql + ' Left Join TB_CARD f ';
  stSql := stSql + ' ON(a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = f.EM_SEQ ';
  stSql := stSql + ' AND f.CA_STATECODE = ''1''  )';
  if (aEtcName = '') and (aCompanyCode = '0') and (aEmGroupCode = '0') and (aGradeType = '0') then stSql := stSql + ' Left Join TB_EMPLOYEE g '
  else stSql := stSql + ' Inner Join TB_EMPLOYEE g ';
  stSql := stSql + ' ON(a.EM_SEQ = g.EM_SEQ ';
  if aEmGroupCode <> '0' then
  begin
    stSql := stSql + ' AND g.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' ';
    stSql := stSql + ' AND g.EM_GRADETYPE = ''2'' ';
  end;
  if aGradeType <> '0' then
  begin
    stSql := stSql + ' AND g.EM_GRADETYPE = ' + aGradeType + ' ';
  end;
  stSql := stSql + ' AND g.EM_ACUSE = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANYCODE h ';
  stSql := stSql + ' ON(g.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND g.CO_COMPANYCODE = h.CO_COMPANYCODE )';
  stSql := stSql + ' Left Join TB_CARDPERMIT i ' ;
  stSql := stSql + ' ON(a.GROUP_CODE = i.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = i.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = i.DE_ECUID ';
  stSql := stSql + ' AND f.CA_CARDNO = i.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_FINGERDEVICE j ';
  stSql := stSql + ' ON(a.GROUP_CODE = j.GROUP_CODE ';
  stSql := stSql + ' AND a.CP_TYPE = j.CP_TYPE ';
  stSql := stSql + ' AND a.ND_NODENO = j.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = j.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = j.DE_EXTENDID ';
  stSql := stSql + ' AND a.CP_NUMBER = j.DO_DOORNO) ';
  stSql := stSql + ' Left Join TB_FINGERDEVICECARD k ';
  stSql := stSql + ' ON(j.GROUP_CODE = k.GROUP_CODE ';
  stSql := stSql + ' AND j.FN_DEVICESEQ = k.FN_DEVICESEQ ';
  stSql := stSql + ' AND a.EM_SEQ = k.EM_SEQ )';
  stSql := stSql + ' Left Join TB_CARDGUBUN o ';
  stSql := stSql + ' ON(f.GROUP_CODE = o.GROUP_CODE ';
  stSql := stSql + ' AND f.CA_CARDGUBUN = o.CA_CARDGUBUN )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if Not aNotpermit then stSql := stSql + ' AND a.CP_PERMIT = ''1'' ';
  if aNodeNo = '' then
  begin
    if aBuildingCode <> '0' then stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
    if aDoorNo <> '' then stSql := stSql + ' AND a.CP_NUMBER = ' + aDoorNo + ' ';
  end;
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND g.EM_NAME Like N''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND g.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND g.EM_COMPANYPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //핸드폰
          stSql := stSql + ' AND g.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //카드번호
          stSql := stSql + ' AND f.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //기타
          stSql := stSql + ' AND g.EM_EMINFO Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '0' then stSql := stSql + ' AND g.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND g.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardState <> '' then stSql := stSql + ' AND f.CA_STATECODE = ''' + aCardState + ''' ';
    if aEmGubun <> '' then stSql := stSql + ' AND g.EM_GUBUNCODE = ''' + aEmGubun + ''' ';
  end;
  stSql := stSql + ' order by a.EM_SEQ ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_CARDPERMIT_PASSWD(aBuildingCode,aNodeName: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.CP_PASSWD,b.CP_RCVACK from TB_NODE a ';
  stSql := stSql + ' Left Join TB_CARDPERMIT b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO  ';
  stSql := stSql + ' AND b.DE_ECUID = ''00'' ';
  stSql := stSql + ' AND b.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND b.CP_CARDTYPE = ''0'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.ND_DELETE <> ''Y'' ';
  if aBuildingCode <> '' then stSql := stSql + ' and a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  if aNodeName <> '' then stSql := stSql + ' and a.ND_NODENAME Like ''%' + aNodeName + '%'' ';
  stSql := stSql + ' order by a.ND_NODENAME ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_CARD_EmSeq(aEmSeq: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := 'Select a.CA_CARDNO,a.CA_STATECODE,a.CA_CARDGUBUN,a.CA_POSITIONNUM,a.CA_RELAYID,a.CA_LASTUSEDATE,a.CA_PRINTNO, ';
    stSql := stSql + ' b.CA_STATECODENAME' + inttostr(G_nFormLanguageType) + ' as CARDSTATENAME,CA_CARDGUBUNNAME ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_CARD a  ';
    stSql := stSql + ' Left Join TB_CARDSTATE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.CA_STATECODE = b.CA_STATECODE ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join TB_CARDGUBUN c ';
    stSql := stSql + ' ON( a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.CA_CARDGUBUN = c.CA_CARDGUBUN ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
    stSql := stSql + ' AND a.CA_CARDGUBUN <> 0 '; //지문 카드는 조회 하지 말자.
  end else
  begin
    stSql := 'Select a.CA_CARDNO,a.CA_STATECODE,a.CA_CARDGUBUN,a.CA_POSITIONNUM,a.CA_RELAYID,a.CA_LASTUSEDATE,a.CA_PRINTNO, ';
    stSql := stSql + ' b.CA_STATECODENAME' + inttostr(G_nFormLanguageType) + ' as CARDSTATENAME,CA_CARDGUBUNNAME ';
    stSql := stSql + ' from TB_CARD a  ';
    stSql := stSql + ' Left Join TB_CARDSTATE b ';
    stSql := stSql + ' ON( a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CA_STATECODE = b.CA_STATECODE ) ';
    stSql := stSql + ' Left Join TB_CARDGUBUN c ';
    stSql := stSql + ' ON( a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.CA_CARDGUBUN = c.CA_CARDGUBUN ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
    stSql := stSql + ' AND a.CA_CARDGUBUN <> 0 '; //지문 카드는 조회 하지 말자.
    stSql := stSql + ' AND a.CA_STATECODE <> ''0'' '; //등록상태가 삭제코드면 조회 하지 말자.
  end;

  result := stSql;
end;

function TdmDBSelect.SelectTB_CARD_NotUsedCard(aDate: string;aNullLastDate:Boolean): string;
var
  stSql : string;
begin
  stSql := ' Select b.EM_FINGERUSE,b.EM_CARDUSE,b.EM_SEQ,b.EM_CODE,b.EM_NAME,b.CO_COMPANYCODE,b.PO_POSICODE,';
  stSql := stSql + ' b.EM_GUBUNCODE,b.EM_COMPANYPHONE,b.EM_HOMEPHONE,b.EM_HANDPHONE,b.EM_EMINFO,';
  stSql := stSql + ' b.EM_REGDATE,b.EM_ENDDATE,b.EM_ACUSE,b.EM_ATUSE,b.EM_FDUSE,b.EM_GROUPCODE,b.EM_STATECODE,';
  stSql := stSql + ' b.EM_GRADETYPE,b.AW_CODE,f.PO_POSICODENAME,g.EM_GUBUNCODENAME,h.EM_GROUPCODENAME, ';
  if G_nReportCompanyStep > 0 then stSql := stSql + ' c.CO_COMPANYNAME as COMPANYNAME1,';
  if G_nReportCompanyStep > 1 then stSql := stSql + ' d.CO_COMPANYNAME as COMPANYNAME2,';
  if G_nReportCompanyStep > 2 then stSql := stSql + ' e.CO_COMPANYNAME as COMPANYNAME3, ';
  if G_nReportCompanyStep > 3 then stSql := stSql + ' p.CO_COMPANYNAME as COMPANYNAME4, ';
  if G_nReportCompanyStep > 4 then stSql := stSql + ' q.CO_COMPANYNAME as COMPANYNAME5, ';
  if G_nReportCompanyStep > 5 then stSql := stSql + ' r.CO_COMPANYNAME as COMPANYNAME6, ';
  if G_nReportCompanyStep > 6 then stSql := stSql + ' s.CO_COMPANYNAME as COMPANYNAME7, ';
  stSql := stSql + ' a.CA_CARDNO,a.CA_LASTUSEDATE,t.CA_CARDGUBUNNAME ';
  stSql := stSql + ' from TB_CARD a';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.EM_SEQ = b.EM_SEQ) ';
  if G_nReportCompanyStep > 0 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE ';
    stSql := stSql + ' AND c.CO_DEEPSEQ = 1 ) ';
  end;
  if G_nReportCompanyStep > 1 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE d ';
    stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2) + ') = d.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2) + ') = d.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 2) + ') = d.CO_COMPANYCODE ';
    stSql := stSql + ' AND d.CO_DEEPSEQ = 2 ) ';
  end;
  if G_nReportCompanyStep > 2 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE e ';
    stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3) + ') = e.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3) + ') = e.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 3) + ') = e.CO_COMPANYCODE ';
    stSql := stSql + ' AND e.CO_DEEPSEQ = 3 ) ';
  end;
  if G_nReportCompanyStep > 3 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE p ';
    stSql := stSql + ' ON(b.GROUP_CODE = p.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 4) + ') = p.CO_COMPANYCODE ';
    stSql := stSql + ' AND p.CO_DEEPSEQ = 4 ) ';
  end;
  if G_nReportCompanyStep > 4 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE q ';
    stSql := stSql + ' ON(b.GROUP_CODE = q.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 5) + ') = q.CO_COMPANYCODE ';
    stSql := stSql + ' AND q.CO_DEEPSEQ = 5 ) ';
  end;
  if G_nReportCompanyStep > 5 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE r ';
    stSql := stSql + ' ON(b.GROUP_CODE = r.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 6) + ') = r.CO_COMPANYCODE ';
    stSql := stSql + ' AND r.CO_DEEPSEQ = 6 ) ';
  end;
  if G_nReportCompanyStep > 6 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE s ';
    stSql := stSql + ' ON(b.GROUP_CODE = s.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 7) + ') = s.CO_COMPANYCODE ';
    stSql := stSql + ' AND s.CO_DEEPSEQ = 7 ) ';
  end;
  stSql := stSql + ' Left Join TB_POSICODE f ';
  stSql := stSql + ' ON (b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEGUBUN g ';
  stSql := stSql + ' ON (b.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND b.EM_GUBUNCODE = g.EM_GUBUNCODE ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEGROUPCODE h ';
  stSql := stSql + ' ON (b.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND b.EM_GROUPCODE = h.EM_GROUPCODE ) ';
  stSql := stSql + ' Left Join TB_CARDGUBUN t ';
  stSql := stSql + ' ON(a.GROUP_CODE = t.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDGUBUN = t.CA_CARDGUBUN )';
  stSql := stSql + ' Where  ( a.CA_LASTUSEDATE < ''' + aDate + ''' ';
  if aNullLastDate then stSql := stSql + ' OR  a.CA_LASTUSEDATE is null ';
  stSql := stSql + ' ) ';


  result := stSql;
end;

function TdmDBSelect.SelectTB_CCTV_All: string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_CCTV ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_CCTV_BuildingCode(aBuildingCode: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select ';
    stSql := stSql + ' b.BC_BUILDINGCODE,';
    stSql := stSql + ' a.CT_NO,';
    stSql := stSql + ' a.CT_NAME,';
    stSql := stSql + ' a.CT_IP,';
    stSql := stSql + ' a.CT_PORT ';
    stSql := stSql + ' From TB_CCTV a ';
    stSql := stSql + ' Inner Join (select GROUP_CODE,BC_BUILDINGCODE,CT_NO From TB_ARMAREA where AR_ARMAREAUSE = ''1'' group by GROUP_CODE,BC_BUILDINGCODE,CT_NO)  b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.CT_NO = b.CT_NO) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aBuildingCode <> '' then stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
    stSql := stSql + ' Order by a.CT_NO';
  end else
  begin
    stSql := ' Select ';
    stSql := stSql + ' b.BC_BUILDINGCODE,';
    stSql := stSql + ' a.CT_NO,';
    stSql := stSql + ' a.CT_NAME,';
    stSql := stSql + ' a.CT_IP,';
    stSql := stSql + ' a.CT_PORT ';
    stSql := stSql + ' From TB_CCTV  a ';
    stSql := stSql + ' Inner Join (select GROUP_CODE,BC_BUILDINGCODE,CT_NO From TB_ARMAREA where AR_ARMAREAUSE = ''1'' group by GROUP_CODE,BC_BUILDINGCODE,CT_NO)  b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.CT_NO = b.CT_NO) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aBuildingCode <> '' then  stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
    stSql := stSql + ' Order by a.CT_NO';
  end;
  result := stSql;

end;

function TdmDBSelect.SelectTB_CCTV_Name(aName: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_CCTV ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aName <> '' then stSql := stSql + ' and CT_NAME Like ''' + aName + '%'' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_Decoder_Name(aName: string): string;
var
  stSql : string;
begin
  stSql := ' Select * From TB_DECODER ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aName <> '' then stSql := stSql + ' AND ND_DECODERNAME Like ''%' + aName + '%'' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_DEVICE_BuildingCode(
  aBuildingCode: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.ND_NODEIP from TB_DEVICE a ';
  stSql := stSql + ' Left Join TB_NODE b ';
  stSql := stSql + ' ON(a.ND_NODENO = b.ND_NODENO)';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.DE_DEVICEUSE = ''1'' ';
  stSql := stSql + ' AND a.DE_EXTENDID = 0 ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_DEVICE_BuildingEmCodeLike(
  aBuildingCode,aEmSeq: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.EM_TIMECODEUSE,b.TC_GROUP,b.TC_TIME1,b.TC_TIME2,b.TC_TIME3,b.TC_TIME4,b.TC_WEEKCODE from TB_DEVICE a ';
  stSql := stSql + ' Left Join (select * from TB_EMPLOYEEDEVICETIMECODE where EM_SEQ = ' + aEmSeq + ') b ';
  stSql := stSql + ' On (a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.DE_DEVICEUSE = ''1'' ';
  stSql := stSql + ' AND a.DE_EXTENDID = 0 ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_DEVICE_BuildingFTPState(
  aBuildingCode: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.ND_NODEIP,c.CF_SENDPROGRESS from TB_DEVICE a ';
  stSql := stSql + ' Left Join TB_NODE b ';
  stSql := stSql + ' ON(a.ND_NODENO = b.ND_NODENO)';
  stSql := stSql + ' Left Join TB_CARDFTPDOWNLIST c ';
  stSql := stSql + ' ON(a.ND_NODENO = c.ND_NODENO';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.DE_DEVICEUSE = ''1'' ';
  stSql := stSql + ' AND a.DE_EXTENDID = 0 ';
  if aBuildingCode <> '0' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  result := stSql;

end;

function TdmDBSelect.SelectTB_DEVICE_DeviceVersion(aNodeNo,
  aEcuID: string;aBuildingCode:string=''): string;
var
  stSql : string;
begin
  stSql := 'select b.ND_NODEIP,b.ND_NODENAME,a.ND_NODENO,a.DE_ECUID,a.DE_DEVICENAME,a.DE_DEVICEVER from TB_DEVICE a ';
  stSql := stSql + ' Inner Join TB_NODE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.DE_DEVICEUSE = ''1'' ';
  if isDigit(aNodeNo) then
  begin
    stSql := stSql + ' AND a.ND_NODENO = ' + inttostr(strtoint(aNodeNo)) + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '0')  then
      stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';

  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_DEVICE_List(aNodeNo, aEcuID: string): string;
var
  stSql : string;
begin
  stSql := 'select a.* from TB_DEVICE a ';
  stSql := stSql + ' Inner Join TB_NODE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.DE_DEVICEUSE = ''1'' ';
  if isDigit(aNodeNo) then
    stSql := stSql + ' AND a.ND_NODENO = ' + inttostr(strtoint(aNodeNo)) + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' Order by a.ND_NODENO,a.DE_ECUID ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_DOORSCHEDULE_DoorNo(aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_DOORSCHEDULE ';
  stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = 0 ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  stSql := stSql + ' Order By DS_DAYCODE ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_DOORSTATEEVENT_Report(aStartDate, aStartTime,
  aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID, aDoorNo: string;
  aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := ' select a.*,b.DO_DOORNAME,b.BC_BUILDINGCODE,c.DE_DOORSTATENAME,d.BC_BUILDINGNAME as BUILDINGNAME1,e.BC_BUILDINGNAME as BUILDINGNAME2,f.BC_BUILDINGNAME as BUILDINGNAME3 from TB_DOORSTATEEVENT a ';
  stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON(a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
  stSql := stSql + ' Left Join TB_DOORSTATECODE c ';
  stSql := stSql + ' ON(a.DE_DOORSTATE = c.DE_DOORSTATE ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE e ';
  stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = e.BC_BUILDINGCODE ';
  stSql := stSql + ' AND e.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE f ';
  stSql := stSql + ' ON(b.GROUP_CODE = f.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = f.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = f.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = f.BC_BUILDINGCODE ';
  stSql := stSql + ' AND f.BC_DEEPSEQ = 3 ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.DE_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.DE_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.DE_DATE + a.DE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.DE_DATE || a.DE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if isDigit(aDoorNo) then
  begin
    stSql := stSql + ' AND a.ND_NODENO = ' +aNodeNo + ' ';
    stSql := stSql + ' AND a.DE_ECUID = ''' +aEcuID + ''' ';
    stSql := stSql + ' AND a.DO_DOORNO = ' +aDoorNo + ' ';
  end else
  begin
    stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' +aBuildingCode + '%'' ';
  end;

  result := stSql;
end;

function TdmDBSelect.SelectTB_DOORTELEVENT_AccessReport(aStartDate, aStartTime,
  aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID, aDoorNo, aCompanyName,
  aEmName: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := ' Select a.DE_DATE,a.DE_TIME,c.BC_BUILDINGNAME as BUILDINGNAME1,d.BC_BUILDINGNAME as BUILDINGNAME2,e.BC_BUILDINGNAME as BUILDINGNAME3, ';
  stSql := stSql + ' b.DO_DOORNAME,a.DE_TELNUMBER,a.DE_PASSWORD,a.DE_ACCESSNAME,a.DE_ACCESSCOMPANY,a.DE_ACCESSTEL,a.DE_ACCESSMEMO,a.DE_INSERTUSERNAME ';
  stSql := stSql + ' FROM TB_DOORTELEVENT a ';
  stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE ';
  stSql := stSql + ' AND c.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE e ';
  stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE ';
  stSql := stSql + ' AND e.BC_DEEPSEQ = 3 ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.DE_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.DE_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.DE_DATE + a.DE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.DE_DATE || a.DE_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aNodeNo = '' then
  begin
    if aBuildingCode <> '0' then stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
    if aDoorNo <> '' then stSql := stSql + ' AND a.DO_DOORNO = ' + aDoorNo + ' ';
  end;
  if aCompanyName <> '' then stSql := stSql + ' AND a.DE_ACCESSCOMPANY Like ''%' + aCompanyName + '%'' ';
  if aEmName <> '' then stSql := stSql + ' AND a.DE_ACCESSNAME Like ''%' + aEmName + '%'' ';

  stSql := stSql + ' order by a.DE_DATE,a.DE_TIME ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_DOOR_AdminBuilding(aUserID: string;aBuildingCode:string='';aDoorNameSort:Boolean=False): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME,e.ND_DECODERNO from ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO )';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_ADMIN where AD_USERID = ''' + aUserID + ''')  d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE) ';
    stSql := stSql + ' AND (a.BC_BUILDINGCODE Like d.BC_BUILDINGCODE + ''%'') ';
    stSql := stSql + ' )';
    stSql := stSql + ' Inner Join TB_NODE e';
    stSql := stSql + ' ON(a.ND_NODENO = e.ND_NODENO ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  end else
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME,e.ND_DECODERNO from ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' Inner Join TB_ADMIN d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND a.BC_BUILDINGCODE Like d.BC_BUILDINGCODE + ''%'' '
    else if G_nDBType = POSTGRESQL then stSql := stSql + ' AND a.BC_BUILDINGCODE Like d.BC_BUILDINGCODE || ''%'' ';
    stSql := stSql + ' AND d.AD_USERID = ''' + aUserID + ''' ';
    stSql := stSql + ')';
    stSql := stSql + ' Inner Join TB_NODE e';
    stSql := stSql + ' ON(a.ND_NODENO = e.ND_NODENO ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  end;
  if aBuildingCode <> '' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  if aDoorNameSort then stSql := stSql + ' Order by a.DO_DOORNAME,a.DO_VIEWSEQ,a.BC_BUILDINGCODE,a.ND_NODENO,a.DE_ECUID,a.DO_DOORNO '
  else stSql := stSql + ' Order by a.DO_VIEWSEQ,a.BC_BUILDINGCODE,a.ND_NODENO,a.DE_ECUID,a.DO_DOORNO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_DOOR_AdminDoor(aUserID: string;aBuildingCode:string='';aDoorNameSort:Boolean=False): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME from ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO )';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_ADMINDEVICE ';
    stSql := stSql + ' where AD_USERID = ''' + aUserID + ''' ';
    stSql := stSql + ' AND AG_TYPE = ''1'' )  d ';
    stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = d.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = d.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = d.DE_EXTENDID) ';
    stSql := stSql + ' AND (a.DO_DOORNO = d.AG_NO) ';
    stSql := stSql + ' )';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  end else
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME from ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' Inner Join TB_ADMINDEVICE d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = d.DE_EXTENDID ';
    stSql := stSql + ' AND a.DO_DOORNO = d.AG_NO ';
    stSql := stSql + ' AND d.AD_USERID = ''' + aUserID + ''' ';
    stSql := stSql + ' AND d.AG_TYPE = ''1'' ';
    stSql := stSql + ')';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  end;
  if aBuildingCode <> '' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  if aDoorNameSort then stSql := stSql + ' Order by a.DO_DOORNAME,a.DO_VIEWSEQ,a.BC_BUILDINGCODE,a.ND_NODENO,a.DE_ECUID,a.DO_DOORNO '
  else stSql := stSql + ' Order by a.DO_VIEWSEQ,a.BC_BUILDINGCODE,a.ND_NODENO,a.DE_ECUID,a.DO_DOORNO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_DOOR_AntiPass: string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select a.*,b.AG_NAME from ';
    stSql := stSql + '( ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Left Join TB_ANTIGROUPCODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.AG_CODE = b.AG_CODE) ';
    stSql := stSql + ') ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  end else
  begin
    stSql := ' Select a.*,b.AG_NAME from ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Left Join TB_ANTIGROUPCODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE  ';
    stSql := stSql + ' AND a.AG_CODE = b.AG_CODE) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  end;
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DO_DOORNO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_DOOR_BuildingCode(aBuildingCode: string;aLike:Boolean = False;aSearchName:string=''): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'a.DO_VIEWSEQ, ';
    stSql := stSql + 'c.ND_DECODERNO ';
    stSql := stSql + ' From TB_DOOR a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' Inner Join TB_NODE c ';
    stSql := stSql + ' ON (a.ND_NODENO = c.ND_NODENO) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aLike then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' '
    else stSql := stSql + ' AND a.BC_BUILDINGCODE = ''' + aBuildingCode + ''' ';
    if aSearchName <> '' then stSql := stSql + ' AND a.DO_DOORNAME Like ''%' + aSearchName + '%'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    if G_bAttendDedicateDoorUse then stSql := stSql + ' AND ( a.DO_ATTYPE <> ''1'' or a.DO_ATTYPE is null) ';
    if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (a.DO_FDTYPE <> ''1'' or a.DO_FDTYPE is null) ';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end else
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'a.DO_VIEWSEQ, ';
    stSql := stSql + 'c.ND_DECODERNO ';
    stSql := stSql + ' From TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Inner Join TB_NODE c ';
    stSql := stSql + ' ON (a.ND_NODENO = c.ND_NODENO) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aLike then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' '
    else stSql := stSql + ' AND a.BC_BUILDINGCODE = ''' + aBuildingCode + ''' ';
    if aSearchName <> '' then stSql := stSql + ' AND a.DO_DOORNAME Like ''%' + aSearchName + '%'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (a.DO_ATTYPE <> ''1'' or a.DO_ATTYPE is null)';
    if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (a.DO_FDTYPE <> ''1'' or a.DO_FDTYPE is null)';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_DOOR_CompanyNotPermitCode(aBuildingCode,
  aCompanyCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.* ';
  stSql := stSql + ' From (select * from TB_DOOR ';
  stSql := stSql + ' where  BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  stSql := stSql + ' AND DO_DOORUSE = ''1'' ';
  stSql := stSql + ' AND DO_VIEW = ''1'' ';
  if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (DO_ATTYPE <> ''1'' or DO_ATTYPE is null)';
  if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (DO_FDTYPE <> ''1'' or DO_FDTYPE is null)';
  stSql := stSql + ' ) a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Where Not Exists( select * from  TB_CARDPERMITCOMPANYGROUP c ';
  stSql := stSql + ' where a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
  stSql := stSql + ' AND a.DO_DOORNO = c.CP_NUMBER ';
  stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_Door_CompanyPermit(aCompanyCode: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'c.CP_PERMIT, ';
    stSql := stSql + 'a.DO_VIEWSEQ ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_CARDPERMITCOMPANYGROUP  ';
    stSql := stSql + ' Where CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ) c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO ) ';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID ) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = c.DE_EXTENDID ) ';
    stSql := stSql + ' AND (a.DO_DOORNO = c.CP_NUMBER) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (a.DO_ATTYPE <> ''1'' or a.DO_ATTYPE is null)';
    if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (a.DO_FDTYPE <> ''1'' or a.DO_FDTYPE is null)';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end else
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'c.CP_PERMIT, ';
    stSql := stSql + 'a.DO_VIEWSEQ ';
    stSql := stSql + ' From TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
    stSql := stSql + ' AND a.DO_DOORNO = c.CP_NUMBER ';
    stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
    stSql := stSql + ' AND c.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (a.DO_ATTYPE <> ''1'' or a.DO_ATTYPE is null)';
    if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (a.DO_FDTYPE <> ''1'' or a.DO_FDTYPE is null)';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_Door_CompanyPermit_II(aBuildingCode,
  aCompanyCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.*, ';
  stSql := stSql + 'c.CP_PERMIT ';
  stSql := stSql + ' From ( select * from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DO_DOORUSE = ''1'' ';
  stSql := stSql + ' AND DO_VIEW = ''1'' ';
  if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (DO_ATTYPE <> ''1'' or DO_ATTYPE is null)';
  if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (DO_FDTYPE <> ''1'' or DO_FDTYPE is null)';
  stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ) a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Inner Join TB_CARDPERMITCOMPANYGROUP c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
  stSql := stSql + ' AND a.DO_DOORNO = c.CP_NUMBER ';
  stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = ''' + aCompanyCode + ''' ) ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_DOOR_DoorEvenetLastCard(aBuildingCode: string;
  aReportType: integer): string;
var
  stSql : string;
begin
  stSql := ' Select a.ND_NODENO,a.DE_ECUID,a.DO_LASTACCESSCARD,c.BC_BUILDINGNAME as BUILDINGNAME1,d.BC_BUILDINGNAME as BUILDINGNAME2,e.BC_BUILDINGNAME as BUILDINGNAME3, ';
  stSql := stSql + 'a.DO_DOORNO,a.DO_DOORNAME,g.ND_NODEIP,g.ND_LASTNETSTATE,g.ND_LASTNETSTATE,b.EM_SEQ,f.EM_CODE,f.EM_NAME,f.EM_HANDPHONE,a.DO_LASTLDTIME,g.ND_LASTNETTIME, ';
  stSql := stSql + 'a.DO_LASTACCESSTIME,a.DO_DOTIME ';
  stSql := stSql + ' From TB_DOOR a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.DO_LASTACCESSCARD = b.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE f ';
  stSql := stSql + ' ON ( b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.EM_SEQ = f.EM_SEQ ) ';
  stSql := stSql + ' Inner Join TB_NODE g ';
  stSql := stSql + ' ON ( a.GROUP_CODE = g.GROUP_CODE ';
  stSql := stsql + ' AND a.ND_NODENO = g.ND_NODENO ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE ';
  stSql := stSql + ' AND c.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE e ';
  stSql := stSql + ' ON(a.GROUP_CODE = e.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE ';
  stSql := stSql + ' AND e.BC_DEEPSEQ = 3 ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  if aReportType = 0 then  //네트웍단선
  begin
    stSql := stSql + ' AND g.ND_LASTNETSTATE = ''NF'' ';
  end else if aReportType = 1 then //1.출입문열림상태,
  begin
    stSql := stSql + ' AND g.ND_LASTNETSTATE <> ''NF'' ';
    stSql := stSql + ' AND a.DO_DOOROPENSTATE = ''O'' ';
  end else if aReportType = 2 then //2.출입문장시간열림
  begin
    stSql := stSql + ' AND g.ND_LASTNETSTATE <> ''NF'' ';
    stSql := stSql + ' AND (a.DO_DOOROPENSTATE = ''T'' OR a.DO_DOOROPENSTATE = ''D'') ';
  end;

  result := stSql;
end;

function TdmDBSelect.SelectTB_DOOR_EmGroupNotPermitCode(aBuildingCode,
  aEmGroupCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.* ';
  stSql := stSql + ' From (select * from TB_DOOR ';
  stSql := stSql + ' where  BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  stSql := stSql + ' AND DO_DOORUSE = ''1'' ';
  stSql := stSql + ' AND DO_VIEW = ''1'' ';
  if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (DO_ATTYPE <> ''1'' or DO_ATTYPE is null)';
  if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (DO_FDTYPE <> ''1'' or DO_FDTYPE is null)';
  stSql := stSql + ' ) a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Where Not Exists( select * from  TB_CARDPERMITEMPLOYEEGROUP c ';
  stSql := stSql + ' where a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
  stSql := stSql + ' AND a.DO_DOORNO = c.CP_NUMBER ';
  stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
  stSql := stSql + ' AND c.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_Door_EmGroupPermit(aEmGroupCode: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'c.CP_PERMIT, ';
    stSql := stSql + 'a.DO_VIEWSEQ ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_CARDPERMITEMPLOYEEGROUP  ';
    stSql := stSql + ' Where CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
    stSql := stSql + ' AND EM_GROUPCODE = ''' + aEmGroupCode + ''' ) c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO ) ';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID ) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = c.DE_EXTENDID ) ';
    stSql := stSql + ' AND (a.DO_DOORNO = c.CP_NUMBER) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (a.DO_ATTYPE <> ''1'' or a.DO_ATTYPE is null)';
    if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (a.DO_FDTYPE <> ''1'' or a.DO_FDTYPE is null)';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end else
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'c.CP_PERMIT, ';
    stSql := stSql + 'a.DO_VIEWSEQ ';
    stSql := stSql + ' From TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
    stSql := stSql + ' AND a.DO_DOORNO = c.CP_NUMBER ';
    stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
    stSql := stSql + ' AND c.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (a.DO_ATTYPE <> ''1'' or a.DO_ATTYPE is null)';
    if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (a.DO_FDTYPE <> ''1'' or a.DO_FDTYPE is null)';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_Door_EmGroupPermit_II(aBuildingCode,
  aEmGroupCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.*, ';
  stSql := stSql + 'c.CP_PERMIT ';
  stSql := stSql + ' From ( select * from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DO_DOORUSE = ''1'' ';
  stSql := stSql + ' AND DO_VIEW = ''1'' ';
  if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (DO_ATTYPE <> ''1'' or DO_ATTYPE is null)';
  if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (DO_FDTYPE <> ''1'' or DO_FDTYPE is null)';
  stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ) a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEEGROUP c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
  stSql := stSql + ' AND a.DO_DOORNO = c.CP_NUMBER ';
  stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
  stSql := stSql + ' AND c.EM_GROUPCODE = ''' + aEmGroupCode + ''' ) ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  result := stSql;

end;

function TdmDBSelect.SelectTB_Door_EmployeePermit(aBuildingCode,
  aEmSeq: string;aSearchName:string=''): string;
var
  stSql : string;
begin
  stSql := 'Select a.*, ';
  stSql := stSql + 'c.CP_PERMIT ';
  stSql := stSql + ' From ( select * from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DO_DOORUSE = ''1'' ';
  stSql := stSql + ' AND DO_VIEW = ''1'' ';
  if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (DO_ATTYPE <> ''1'' or DO_ATTYPE is null)';
  if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (DO_FDTYPE <> ''1'' or DO_FDTYPE is null)';
  if aSearchName <> '' then stSql := stSql + ' AND DO_DOORNAME Like ''%' + aSearchName + '%'' ';
  stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ) a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEECODE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
  stSql := stSql + ' AND a.DO_DOORNO = c.CP_NUMBER ';
  stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
  stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
  stSql := stSql + ' AND c.EM_SEQ = ' + aEmSeq + ' ) ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  result := stSql;

end;

function TdmDBSelect.SelectTB_Door_EmSeqPermit(aEmSeq: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'a.DO_VIEWSEQ ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join (select * from TB_CARDPERMITEMPLOYEECODE  ';
    stSql := stSql + ' Where CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
    stSql := stSql + ' AND CP_PERMIT = ''1'' ';
    stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ) c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO ) ';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID ) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = c.DE_EXTENDID ) ';
    stSql := stSql + ' AND (a.DO_DOORNO = c.CP_NUMBER) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end else
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'a.DO_VIEWSEQ ';
    stSql := stSql + ' From TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Inner Join TB_CARDPERMITEMPLOYEECODE c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID ';
    stSql := stSql + ' AND a.DO_DOORNO = c.CP_NUMBER ';
    stSql := stSql + ' AND c.CP_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
    stSql := stSql + ' AND c.CP_PERMIT = ''1'' ';
    stSql := stSql + ' AND c.EM_SEQ = ' + aEmSeq + ' ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_DOOR_MasterAll(aBuildingCode:string='';aDoorNameSort:Boolean=False): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME from ';
    stSql := stSql + '( ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ') ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_EXTENDID = 0 and DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND (a.ND_NODENO = c.ND_NODENO )';
    stSql := stSql + ' AND (a.DE_ECUID = c.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = c.DE_EXTENDID) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  end else
  begin
    stSql := ' Select a.*,b.ND_NODEIP,b.ND_NODENAME,b.ND_DECODERNO,c.DE_DEVICENAME from ';
    stSql := stSql + ' TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' Inner Join (select * from TB_DEVICE where DE_EXTENDID = 0 and DE_DEVICEUSE = ''1'' ) c ';
    stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = c.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = c.DE_EXTENDID) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  end;
  if aBuildingCode <> '' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  if aDoorNameSort then   stSql := stSql + ' Order by a.DO_DOORNAME,a.DO_VIEWSEQ,a.BC_BUILDINGCODE,a.ND_NODENO,a.DE_ECUID,a.DO_DOORNO '
  else  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.BC_BUILDINGCODE,a.ND_NODENO,a.DE_ECUID,a.DO_DOORNO ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_DOOR_Name(aBuildingCode, aName: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'a.DO_VIEWSEQ ';
    stSql := stSql + ' From TB_DOOR a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aBuildingCode <> '' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
    if aName <> '' then stSql := stSql + ' AND a.DO_DOORNAME Like ''' + aName + '%'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end else
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'a.DO_VIEWSEQ ';
    stSql := stSql + ' From TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aBuildingCode <> '' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
    if aName <> '' then stSql := stSql + ' AND a.DO_DOORNAME Like ''' + aName + '%'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_DOOR_ScheduleDoorName(aBuildingCode,
  aName: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'a.DO_VIEWSEQ ';
    stSql := stSql + ' From TB_DOOR a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
    if aName <> '' then stSql := stSql + ' AND a.DO_DOORNAME Like ''' + aName + '%'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' AND a.DO_SCHEDULEUSE = ''1'' ';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end else
  begin
    stSql := 'Select ';
    stSql := stSql + 'a.ND_NODENO, ';
    stSql := stSql + 'a.DE_ECUID, ';
    stSql := stSql + 'a.DE_EXTENDID, ';
    stSql := stSql + 'a.DO_DOORNO, ';
    stSql := stSql + 'a.DO_DOORNAME, ';
    stSql := stSql + 'a.DO_DOORUSE, ';
    stSql := stSql + 'a.DO_DOORTYPE, ';
    stSql := stSql + 'a.DO_CONTROLTIME, ';
    stSql := stSql + 'a.DO_LONGOPENTIME, ';
    stSql := stSql + 'a.DO_LONGOPENALARM, ';
    stSql := stSql + 'a.DO_DOORSTATE, ';
    stSql := stSql + 'a.DO_SCHEDULEUSE, ';
    stSql := stSql + 'a.DO_FIREDOOROPEN, ';
    stSql := stSql + 'a.DO_LOCKTYPE, ';
    stSql := stSql + 'a.DO_DSOPENSTATE, ';
    stSql := stSql + 'a.DO_REMOTEDISARMDOOROPEN, ';
    stSql := stSql + 'a.AR_ARMAREANO, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKUSE, ';
    stSql := stSql + 'a.DO_DEADBOLTDSCHECKTIME, ';
    stSql := stSql + 'a.DO_ARMDSCHECK, ';
    stSql := stSql + 'a.BC_BUILDINGCODE, ';
    stSql := stSql + 'a.DO_VIEWSEQ ';
    stSql := stSql + ' From TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
    if aName <> '' then stSql := stSql + ' AND a.DO_DOORNAME Like ''' + aName + '%'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' AND a.DO_SCHEDULEUSE = ''1'' ';
    stSql := stSql + ' Order by a.DO_VIEWSEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.DO_DOORNO ';
  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_EMPLOYEEDEVICETIMECODE_BuildingEmSeq(
  aBuildingCode, aEmSeq: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.* from TB_EMPLOYEEDEVICETIMECODE a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stsql + ' On ( a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  stSql := stSql + ' order by a.ND_NODENO,a.DE_ECUID ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_EMPLOYE_EtcType(aCompanyCode, aPosiCode,
  aEmployeeGubun, aEtcType, aEtcName: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select a.EM_FINGERUSE,a.EM_SEQ,a.EM_CODE,a.EM_NAME,a.CO_COMPANYCODE,a.PO_POSICODE,';
    stSql := stSql + ' a.EM_GUBUNCODE,a.EM_COMPANYPHONE,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_EMINFO,';
    stSql := stSql + ' a.EM_REGDATE,a.EM_ENDDATE,a.EM_ACUSE,a.EM_ATUSE,a.EM_FDUSE,a.EM_GROUPCODE,';
    stSql := stSql + ' a.EM_GRADETYPE,b.CO_COMPANYNAME,c.PO_POSICODENAME,d.EM_GUBUNCODENAME,e.EM_GROUPCODENAME ';
    stSql := stSql + ' From ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' select * from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aEtcName <> '' then
    begin
      case aEtcType[1] of
        '0' : begin  //이름
            stSql := stSql + ' AND EM_NAME Like N''' + aEtcName + '%'' ';
        end;
        '1' : begin  //사번
            stSql := stSql + ' AND EM_CODE Like ''' + aEtcName + '%'' ';
        end;
        '2' : begin  //사내전화번호
            stSql := stSql + ' AND EM_COMPANYPHONE Like ''' + aEtcName + '%'' ';
        end;
        '3' : begin  //핸드폰
            stSql := stSql + ' AND EM_HANDPHONE Like ''' + aEtcName + '%'' ';
        end;
        '5' : begin  //기타
            stSql := stSql + ' AND EM_EMINFO Like ''' + aEtcName + '%'' ';
        end;
      end;
    end else
    begin
      if aCompanyCode <> '0' then stSql := stSql + ' AND a.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
      if aPosiCode <> '' then stSql := stSql + ' AND a.PO_POSICODE = ' + aPosiCode + ' ';
      if aEmployeeGubun <> '' then stSql := stSql + ' AND a.EM_GUBUNCODE = ' + aEmployeeGubun + ' ';
    end;
    stSql := stSql + ' ) a';
    stSql := stSql + ' Left Join TB_COMPANYCODE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ) ';
    stSql := stSql + ' AND ( a.CO_COMPANYCODE = b.CO_COMPANYCODE ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join TB_POSICODE c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND ( a.PO_POSICODE = c.PO_POSICODE ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEEGUBUN d ';
    stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ) ';
    stSql := stSql + ' AND ( a.EM_GUBUNCODE = d.EM_GUBUNCODE ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEEGROUPCODE e ';
    stSql := stSql + ' ON ( a.GROUP_CODE = e.GROUP_CODE ) ';
    stSql := stSql + ' AND ( a.EM_GROUPCODE = e.EM_GROUPCODE ) ';
  end else
  begin
    stSql := ' Select a.EM_FINGERUSE,a.EM_SEQ,a.EM_CODE,a.EM_NAME,a.CO_COMPANYCODE,a.PO_POSICODE,';
    stSql := stSql + ' a.EM_GUBUNCODE,a.EM_COMPANYPHONE,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_EMINFO,';
    stSql := stSql + ' a.EM_REGDATE,a.EM_ENDDATE,a.EM_ACUSE,a.EM_ATUSE,a.EM_FDUSE,a.EM_GROUPCODE,';
    stSql := stSql + ' a.EM_GRADETYPE,b.CO_COMPANYNAME,c.PO_POSICODENAME,d.EM_GUBUNCODENAME,e.EM_GROUPCODENAME ';
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
    stSql := stSql + ' Left Join TB_CARD f ';
    stSql := stSql + ' ON (a.GROUP_CODE = f.GROUP_CODE ';
    stSql := stSql + ' AND a.EM_GROUPCODE = f.EM_SEQ ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aEtcName <> '' then
    begin
      case aEtcType[1] of
        '0' : begin  //이름
            stSql := stSql + ' AND a.EM_NAME Like N''' + aEtcName + '%'' ';
        end;
        '1' : begin  //사번
            stSql := stSql + ' AND a.EM_CODE Like ''' + aEtcName + '%'' ';
        end;
        '2' : begin  //사내전화번호
            stSql := stSql + ' AND a.EM_COMPANYPHONE Like ''' + aEtcName + '%'' ';
        end;
        '3' : begin  //핸드폰
            stSql := stSql + ' AND a.EM_HANDPHONE Like ''' + aEtcName + '%'' ';
        end;
        '4' : begin  //카드번호
            stSql := stSql + ' AND f.CA_CARDNO Like ''' + aEtcName + '%'' ';
        end;
        '5' : begin  //기타
            stSql := stSql + ' AND a.EM_EMINFO Like ''' + aEtcName + '%'' ';
        end;
      end;
    end else
    begin
      if aCompanyCode <> '0' then stSql := stSql + ' AND a.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
      if aPosiCode <> '' then stSql := stSql + ' AND a.PO_POSICODE = ' + aPosiCode + ' ';
      if aEmployeeGubun <> '' then stSql := stSql + ' AND a.EM_GUBUNCODE = ' + aEmployeeGubun + ' ';
    end;

  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_EMPLOYE_Value(aCompanyCode, aPosiCode,aEmSeq, aEmCode,
  aEmName, aEmGubun, aEmHandPhone, aEmCompanyPhone, aEtcInfo, aInDate, aOutDate,
  aACType, aATType, aFDTyep: string;aCardInclude:Boolean=False;aNotCardReg:string='';
  aNotFpReg:string='';aCardNo:string='';aCardGubun:string='';aEmGradeType:string='';
  aCardState:string='';aCompanyGradeSearch:Boolean=True): string;
var
  stSql : string;
  bCompanyCodeSearch : Boolean;
begin
  if aEmGradeType = '0' then aEmGradeType := '';
  bCompanyCodeSearch := True;
  if Not aCompanyGradeSearch then
  begin
    if (aEmSeq <> '') or (aEmCode <> '') or (aEmName <> '') or (aEmHandPhone <> '') or (aCardNo <> '')  then bCompanyCodeSearch := False;
  end;

  if G_nDBType = MDB then
  begin
    stSql := ' Select a.EM_FINGERUSE,a.EM_CARDUSE,a.EM_SEQ,a.EM_CODE,a.EM_NAME,a.CO_COMPANYCODE,a.PO_POSICODE,';
    stSql := stSql + ' a.EM_GUBUNCODE,a.EM_COMPANYPHONE,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_EMINFO,';
    stSql := stSql + ' a.EM_REGDATE,a.EM_ENDDATE,a.EM_ACUSE,a.EM_ATUSE,a.EM_FDUSE,a.EM_GROUPCODE,a.EM_STATECODE,';
    stSql := stSql + ' a.EM_GRADETYPE,a.AW_CODE,b.CO_COMPANYNAME,c.PO_POSICODENAME,d.EM_GUBUNCODENAME,e.EM_GROUPCODENAME ';
    stSql := stSql + ' , g.CO_COMPANYNAME as COMPANYNAME1,h.CO_COMPANYNAME as COMPANYNAME2,i.CO_COMPANYNAME as COMPANYNAME3 ';
    if aCardInclude or (aCardNo <> '') then stSql := stSql + ',f.CA_CARDNO ';
    stSql := stSql + ' From ';
    if aCardInclude then stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' select * from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aEmGradeType <> '' then stSql := stSql + ' AND EM_GRADETYPE = ' + aEmGradeType + ' ';
    if aNotCardReg = '1' then stSql := stSql + ' AND (EM_CARDUSE <> ''1'' or EM_CARDUSE is NULL) '
    else if aNotCardReg = '0' then stSql := stSql + ' AND EM_CARDUSE = ''1'' ';
    if aNotFpReg = '1' then stSql := stSql + ' AND (EM_FINGERUSE <> ''1'' or EM_FINGERUSE is NULL) ';
    if bCompanyCodeSearch and (aCompanyCode <> '') then
      stSql := stSql + ' AND CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
    if aPosiCode <> '' then
      stSql := stSql + ' AND PO_POSICODE = ' + aPosiCode + ' ';
    if aEmSeq <> '' then
      stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
    if aEmCode <> '' then
      stSql := stSql + ' AND EM_CODE Like ''' + aEmCode + '%'' ';
    if aEmName <> '' then
      stSql := stSql + ' AND EM_NAME Like N''' + aEmName + '%'' ';
    if aEmGubun <> '' then
      stSql := stSql + ' AND EM_GUBUNCODE = ' + aEmGubun + ' ';
    if aEmHandPhone <> '' then
      stSql := stSql + ' AND EM_HANDPHONE Like ''%' + aEmHandPhone + '%'' ';
    if aEmCompanyPhone <> '' then
      stSql := stSql + ' AND EM_COMPANYPHONE Like ''%' + aEmCompanyPhone + '%'' ';
    if aEtcInfo <> '' then
      stSql := stSql + ' AND EM_EMINFO Like ''' + aEtcInfo + '%'' ';
    if aInDate <> '' then
      stSql := stSql + ' AND EM_REGDATE = ''' + aInDate + ''' ';
    if aOutDate <> '' then
      stSql := stSql + ' AND EM_ENDDATE = ''' + aOutDate + ''' ';
    if aACType <> '' then
      stSql := stSql + ' AND EM_ACUSE = ''' + aACType + ''' ';
    if aATType <> '' then
      stSql := stSql + ' AND EM_ATUSE = ''' + aATType + ''' ';
    if aFDTyep <> '' then
      stSql := stSql + ' AND EM_FDUSE = ''' + aFDTyep + ''' ';
    stSql := stSql + ' ) a';
    stSql := stSql + ' Left Join TB_COMPANYCODE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ) ';
    stSql := stSql + ' AND ( a.CO_COMPANYCODE = b.CO_COMPANYCODE ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join TB_POSICODE c ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ) ';
    stSql := stSql + ' AND ( a.PO_POSICODE = c.PO_POSICODE ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEEGUBUN d ';
    stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ) ';
    stSql := stSql + ' AND ( a.EM_GUBUNCODE = d.EM_GUBUNCODE ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEEGROUPCODE e ';
    stSql := stSql + ' ON ( a.GROUP_CODE = e.GROUP_CODE ) ';
    stSql := stSql + ' AND ( a.EM_GROUPCODE = e.EM_GROUPCODE ) ';
    if aCardInclude or (aCardNo <> '') or (aCardState <> '') then
    begin
      stSql := stSql + ' ) ';
      if (aCardNo <> '') or (aCardState <> '') then
      begin
        stSql := stSql + ' Inner Join (select * from TB_CARD ';
        if (aCardNo <> '') then stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' '
        else stSql := stSql + ' where CA_STATECODE = ''' + aCardState + ''' ';
        stSql := stSql + ' )f ';
      end else
      begin
        if aCardGubun = '' then stSql := stSql + ' Left Join (select * from TB_CARD where CA_STATECODE = ''1''  AND CA_CARDGUBUN <> 0 )f '
        else stSql := stSql + ' Left Join (select * from TB_CARD where CA_STATECODE = ''1''  AND CA_CARDGUBUN = ' + aCardGubun + ' )f ';
      end;
      stSql := stSql + ' ON ( a.EM_SEQ = f.EM_SEQ ) ';
    end;
    stSql := stSql + ' Left Join (select * from TB_COMPANYCODE where CO_DEEPSEQ = 1) g ';
    stSql := stSql + ' ON (a.GROUP_CODE = g.GROUP_CODE ) ';
    stSql := stSql + ' AND ( Mid(a.CO_COMPANYCODE,1,' + inttostr(1 + G_nCompanyCodeLength) + ') = Mid(g.CO_COMPANYCODE ,1,' + inttostr(1 + G_nCompanyCodeLength) + ') ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join (select * from TB_COMPANYCODE where CO_DEEPSEQ = 2) h ';
    stSql := stSql + ' ON (a.GROUP_CODE = h.GROUP_CODE ) ';
    stSql := stSql + ' AND ( Mid(a.CO_COMPANYCODE,1,' + inttostr(1 + (G_nCompanyCodeLength * 2)) + ') = Mid(h.CO_COMPANYCODE ,1,' + inttostr(1 + (G_nCompanyCodeLength * 2)) + ') ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join (select * from TB_COMPANYCODE where CO_DEEPSEQ = 3) i ';
    stSql := stSql + ' ON (a.GROUP_CODE = i.GROUP_CODE ) ';
    stSql := stSql + ' AND ( Mid(a.CO_COMPANYCODE,1,' + inttostr(1 + (G_nCompanyCodeLength * 3)) + ') = Mid(i.CO_COMPANYCODE ,1,' + inttostr(1 + (G_nCompanyCodeLength * 3)) + ') ';
    stSql := stSql + ' ) ';
  end else if G_nDBType = MSSQL then
  begin
    stSql := ' Select a.EM_FINGERUSE,a.EM_CARDUSE,a.EM_SEQ,a.EM_CODE,a.EM_NAME,a.CO_COMPANYCODE,a.PO_POSICODE,';
    stSql := stSql + ' a.EM_GUBUNCODE,a.EM_COMPANYPHONE,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_EMINFO,';
    stSql := stSql + ' a.EM_REGDATE,a.EM_ENDDATE,a.EM_ACUSE,a.EM_ATUSE,a.EM_FDUSE,a.EM_GROUPCODE,a.EM_STATECODE,';
    stSql := stSql + ' a.EM_GRADETYPE,a.AW_CODE,b.CO_COMPANYNAME,c.PO_POSICODENAME,d.EM_GUBUNCODENAME,e.EM_GROUPCODENAME ';
    stSql := stSql + ' , g.CO_COMPANYNAME as COMPANYNAME1,h.CO_COMPANYNAME as COMPANYNAME2,i.CO_COMPANYNAME as COMPANYNAME3 ';
    if aCardInclude or (aCardNo <> '') then stSql := stSql + ',f.CA_CARDNO ';
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
    if aCardInclude or (aCardNo <> '') or (aCardState <> '')  then
    begin
      if (aCardNo <> '') or (aCardState <> '') then
      begin
        stSql := stSql + ' Inner Join (select * from TB_CARD ';
        if (aCardNo <> '') then stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' '
        else stSql := stSql + ' where CA_STATECODE = ''' + aCardState + ''' ';
        stSql := stSql + ' )f ';
      end else
      begin
        if aCardGubun = '' then stSql := stSql + ' Left Join (select * from TB_CARD where CA_STATECODE = ''1''  AND CA_CARDGUBUN <> 0 )f '
        else stSql := stSql + ' Left Join (select * from TB_CARD where CA_STATECODE = ''1''  AND CA_CARDGUBUN = ' + aCardGubun + ' )f ';
//      stSql := stSql + ' Left Join (select * from TB_CARD where CA_STATECODE = ''1'' AND CA_CARDGUBUN <> 0) f ';
      end;
      stSql := stSql + ' ON ( a.EM_SEQ = f.EM_SEQ )  ';
    end;
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
    if aEmGradeType <> '' then stSql := stSql + ' AND a.EM_GRADETYPE = ' + aEmGradeType + ' ';
    if aNotCardReg = '1' then stSql := stSql + ' AND (a.EM_CARDUSE <> ''1'' or a.EM_CARDUSE is NULL) '
    else if aNotCardReg = '0' then stSql := stSql + ' AND EM_CARDUSE = ''1'' ';
    if aNotFpReg = '1' then stSql := stSql + ' AND (a.EM_FINGERUSE <> ''1'' or a.EM_FINGERUSE is NULL) ';
    if bCompanyCodeSearch and (aCompanyCode <> '') then
      stSql := stSql + ' AND a.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
    if aPosiCode <> '' then
      stSql := stSql + ' AND a.PO_POSICODE = ' + aPosiCode + ' ';
    if aEmSeq <> '' then
      stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
    if aEmCode <> '' then
      stSql := stSql + ' AND a.EM_CODE Like ''' + aEmCode + '%'' ';
    if aEmName <> '' then
      stSql := stSql + ' AND a.EM_NAME Like N''%' + aEmName + '%'' ';
    if aEmGubun <> '' then
      stSql := stSql + ' AND a.EM_GUBUNCODE = ' + aEmGubun + ' ';
    if aEmHandPhone <> '' then
      stSql := stSql + ' AND a.EM_HANDPHONE Like ''' + aEmHandPhone + '%'' ';
    if aEmCompanyPhone <> '' then
      stSql := stSql + ' AND a.EM_COMPANYPHONE Like ''' + aEmCompanyPhone + '%'' ';
    if aEtcInfo <> '' then
      stSql := stSql + ' AND a.EM_EMINFO Like ''' + aEtcInfo + '%'' ';
    if aInDate <> '' then
      stSql := stSql + ' AND a.EM_REGDATE = ''' + aInDate + ''' ';
    if aOutDate <> '' then
      stSql := stSql + ' AND a.EM_ENDDATE = ''' + aOutDate + ''' ';
    if aACType <> '' then
      stSql := stSql + ' AND a.EM_ACUSE = ''' + aACType + ''' ';
    if aATType <> '' then
      stSql := stSql + ' AND a.EM_ATUSE = ''' + aATType + ''' ';
    if aFDTyep <> '' then
      stSql := stSql + ' AND a.EM_FDUSE = ''' + aFDTyep + ''' ';
  end else if G_nDBType = PostGresql then
  begin
    stSql := ' Select a.EM_FINGERUSE,a.EM_CARDUSE,a.EM_SEQ,a.EM_CODE,a.EM_NAME,a.CO_COMPANYCODE,a.PO_POSICODE,';
    stSql := stSql + ' a.EM_GUBUNCODE,a.EM_COMPANYPHONE,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_EMINFO,';
    stSql := stSql + ' a.EM_REGDATE,a.EM_ENDDATE,a.EM_ACUSE,a.EM_ATUSE,a.EM_FDUSE,a.EM_GROUPCODE,a.EM_STATECODE,';
    stSql := stSql + ' a.EM_GRADETYPE,a.AW_CODE,b.CO_COMPANYNAME,c.PO_POSICODENAME,d.EM_GUBUNCODENAME,e.EM_GROUPCODENAME ';
    stSql := stSql + ' , g.CO_COMPANYNAME as COMPANYNAME1,h.CO_COMPANYNAME as COMPANYNAME2,i.CO_COMPANYNAME as COMPANYNAME3 ';
    if aCardInclude or (aCardNo <> '') then stSql := stSql + ',f.CA_CARDNO ';
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
    if aCardInclude or (aCardNo <> '') or (aCardState <> '')  then
    begin
      if (aCardNo <> '') or (aCardState <> '') then
      begin
        stSql := stSql + ' Inner Join (select * from TB_CARD ';
        if (aCardNo <> '') then stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' '
        else stSql := stSql + ' where CA_STATECODE = ''' + aCardState + ''' ';
        stSql := stSql + ' )f ';
      end else
      begin
        if aCardGubun = '' then stSql := stSql + ' Left Join (select * from TB_CARD where CA_STATECODE = ''1''  AND CA_CARDGUBUN <> 0 )f '
        else stSql := stSql + ' Left Join (select * from TB_CARD where CA_STATECODE = ''1''  AND CA_CARDGUBUN = ' + aCardGubun + ' )f ';
//      stSql := stSql + ' Left Join (select * from TB_CARD where CA_STATECODE = ''1'' AND CA_CARDGUBUN <> 0) f ';
      end;
      stSql := stSql + ' ON ( a.EM_SEQ = f.EM_SEQ )  ';
    end;
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
    if aEmGradeType <> '' then stSql := stSql + ' AND a.EM_GRADETYPE = ' + aEmGradeType + ' ';
    if aNotCardReg = '1' then stSql := stSql + ' AND (a.EM_CARDUSE <> ''1'' or a.EM_CARDUSE is NULL) '
    else if aNotCardReg = '0' then stSql := stSql + ' AND EM_CARDUSE = ''1'' ';
    if aNotFpReg = '1' then stSql := stSql + ' AND (a.EM_FINGERUSE <> ''1'' or a.EM_FINGERUSE is NULL) ';
    if bCompanyCodeSearch and (aCompanyCode <> '') then
      stSql := stSql + ' AND a.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
    if aPosiCode <> '' then
      stSql := stSql + ' AND a.PO_POSICODE = ' + aPosiCode + ' ';
    if aEmSeq <> '' then
      stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
    if aEmCode <> '' then
      stSql := stSql + ' AND a.EM_CODE Like ''' + aEmCode + '%'' ';
    if aEmName <> '' then
      stSql := stSql + ' AND a.EM_NAME Like N''%' + aEmName + '%'' ';
    if aEmGubun <> '' then
      stSql := stSql + ' AND a.EM_GUBUNCODE = ' + aEmGubun + ' ';
    if aEmHandPhone <> '' then
      stSql := stSql + ' AND a.EM_HANDPHONE Like ''' + aEmHandPhone + '%'' ';
    if aEmCompanyPhone <> '' then
      stSql := stSql + ' AND a.EM_COMPANYPHONE Like ''' + aEmCompanyPhone + '%'' ';
    if aEtcInfo <> '' then
      stSql := stSql + ' AND a.EM_EMINFO Like ''' + aEtcInfo + '%'' ';
    if aInDate <> '' then
      stSql := stSql + ' AND a.EM_REGDATE = ''' + aInDate + ''' ';
    if aOutDate <> '' then
      stSql := stSql + ' AND a.EM_ENDDATE = ''' + aOutDate + ''' ';
    if aACType <> '' then
      stSql := stSql + ' AND a.EM_ACUSE = ''' + aACType + ''' ';
    if aATType <> '' then
      stSql := stSql + ' AND a.EM_ATUSE = ''' + aATType + ''' ';
    if aFDTyep <> '' then
      stSql := stSql + ' AND a.EM_FDUSE = ''' + aFDTyep + ''' ';
  end;
  result := stSql;
end;

function TdmDBSelect.SelectTB_FINGERDEVICE_LikeValue(aBuildingCode, aReaderIP,aReaderName: string): string;
var
  stSql : string;
begin
  if aBuildingCode = '' then aBuildingCode := '0';

  stSql := ' Select * from TB_FINGERDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aBuildingCode <> '0' then stSql := stSql + ' and BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  if aReaderIP <> '' then stSql := stSql + ' and FN_DEVICEIP Like ''' + aReaderIP + '%'' ';
  if aReaderName <> '' then stSql := stSql + ' and FN_DEVICENAME Like ''' + aReaderName + '%'' ';

  result := stSql;

end;

function TdmDBSelect.SelectTB_FINGERDEVICE_Name(aName: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_FINGERDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aName <> '' then stSql := stSql + ' and FN_DEVICENAME Like ''' + aName + '%'' ';

  result := stSql;

end;

function TdmDBSelect.SelectTB_FIREGROUP_Name(aName: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_FIREGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aName <> '' then stSql := stSql + ' and FG_GROUPCODENAME Like ''' + aName + '%'' ';

  result := stSql;

end;

function TdmDBSelect.SelectTB_FOODEVENT_FoodDepartStateReport(aStartDate,
  aEndDate, aCompanyCode, aFdType: string): string;
var
  stSql : string;
begin

  stSql := ' Select c.CO_COMPANYNAME as COMPANYNAME1,';
  //stSql := stSql + ' d.CO_COMPANYNAME as COMPANYNAME2,e.CO_COMPANYNAME as COMPANYNAME3, ';
  //stSql := stSql + ' f.PO_POSICODENAME,b.EM_CODE,b.EM_NAME,';
  stSql := stSql + ' sum(a.FO_BREAK) as FO_BREAK,sum(a.FO_LUNCH) as FO_LUNCH,sum(a.FO_DINNER) as FO_DINNER,';
  stSql := stSql + ' sum(a.FO_MIDNIGHT) as FO_MIDNIGHT,sum(a.TOT) as TOT,sum(a.FO_FOODAMT) as FO_FOODAMT,h.RE_FDTYPENAME '  ;
  stSql := stSql + ' From  ';
  stSql := stSql + ' (select aa.GROUP_CODE,aa.EM_SEQ,aa.RE_FDTYPE,  ';             // a Start
  stSql := stSql + ' SUM(aa.FO_BREAK) as FO_BREAK,   ';
  stSql := stSql + ' SUM(aa.FO_LUNCH) as FO_LUNCH,  ';
  stSql := stSql + ' SUM(aa.FO_DINNER) as FO_DINNER,  ';
  stSql := stSql + ' SUM(aa.FO_MIDNIGHT) as FO_MIDNIGHT,  ';
  stSql := stSql + ' SUM(aa.TOT) as TOT,    ';
  stSql := stSql + ' SUM(aa.FO_AMT) as FO_FOODAMT ';
  stSql := stSql + ' From  ';
  stSql := stSql + ' ( select GROUP_CODE,EM_SEQ,RE_FDTYPE,  ';   //aa Start
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN FO_CODE = 1 THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_BREAK,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN FO_CODE = 2 THEN 1   ';
  stSql := stSql + ' ELSE 0 END as FO_LUNCH,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN FO_CODE = 3 THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_DINNER,  ';
  stSql := stSql + ' CASE   ';
  stSql := stSql + ' WHEN FO_CODE = 4 THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_MIDNIGHT,  ';
  stSql := stSql + ' 1 as TOT,   ';
  stSql := stSql + ' FO_AMT ';
  stSql := stSql + ' from  ';
  stSql := stSql + ' TB_FOODEVENT ';
  stSql := stSql + ' Where FE_DATE BETWEEN ''' + aStartDate + ''' ';
  stSql := stSql + ' AND ''' + aEndDate + ''' ';
  if aFdType <> '' then stSql := stSql + ' AND RE_FDTYPE = ''' + aFdType + ''' ';
  stSql := stSql + ' ) aa   ';
  stSql := stSql + ' GROUP BY aa.GROUP_CODE,aa.EM_SEQ,aa.RE_FDTYPE   ';
  stSql := stSql + ' ) a   ';
  stSql := stSql + ' Left Join ';
  stSql := stSql + ' TB_EMPLOYEE b ';
  stSql := stSql + ' ON( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ) ';
  stSql := stSql + ' Left Join TB_COMPANYCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_DEEPSEQ = 1 ) ';
(*  stSql := stSql + ' Left Join TB_COMPANYCODE d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND d.CO_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_COMPANYCODE e ';
  stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND e.CO_DEEPSEQ = 3 ) ';
  stSql := stSql + ' Left Join TB_POSICODE f ';
  stSql := stSql + ' ON(b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE )';
*)
  stSql := stSql + ' Left Join TB_FOODTYPE h ';
  stSql := stSql + ' ON(a.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND a.RE_FDTYPE = h.RE_FDTYPE )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aCompanyCode <> '0' then stSql := stSql + ' AND b.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  stSql := stSql + ' GROUP BY c.CO_COMPANYNAME,h.RE_FDTYPENAME ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_FOODEVENT_FoodReport(aStartDate, aEndDate,
  aCompanyCode, aPosiCode, aEmpGubun, aEtcType, aEtcName,aFdType,aFoodCode: string;aBuildingCode:string='0';stFoodGroup:string=''): string;
var
  stSql : string;
begin
  stSql := ' Select a.FE_DATE,a.FE_TIME,';
  if G_nReportCompanyStep > 0 then stSql := stSql + ' c.CO_COMPANYNAME as COMPANYNAME1,';
  if G_nReportCompanyStep > 1 then stSql := stSql + ' d.CO_COMPANYNAME as COMPANYNAME2,';
  if G_nReportCompanyStep > 2 then stSql := stSql + ' e.CO_COMPANYNAME as COMPANYNAME3, ';
  if G_nReportCompanyStep > 3 then stSql := stSql + ' p.CO_COMPANYNAME as COMPANYNAME4, ';
  if G_nReportCompanyStep > 4 then stSql := stSql + ' q.CO_COMPANYNAME as COMPANYNAME5, ';
  if G_nReportCompanyStep > 5 then stSql := stSql + ' r.CO_COMPANYNAME as COMPANYNAME6, ';
  if G_nReportCompanyStep > 6 then stSql := stSql + ' s.CO_COMPANYNAME as COMPANYNAME7, ';
  stSql := stSql + ' f.PO_POSICODENAME,b.EM_CODE,b.EM_NAME,a.FO_AMT,h.RE_FDTYPENAME,i.FO_NAME,j.DO_DOORNAME,l.FG_NAME'  ;
  stSql := stSql + ' FROM TB_FOODEVENT a ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.EM_SEQ = b.EM_SEQ ) ';
  //stSql := stSql + ' AND b.EM_FDUSE = ''1'' ) ';
  stSql := stSql + ' Inner Join TB_READER k ';
  stSql := stSql + ' ON(a.GROUP_CODE = k.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = k.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = k.DE_ECUID ';
  stSql := stSql + ' AND a.RE_READERNO = k.RE_READERNO ';
  stSql := stSql + ' and k.DE_EXTENDID = 0) ';
  //stSql := stSql + ' AND k.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'') ';
  if G_nReportCompanyStep > 0 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE ';
    stSql := stSql + ' AND c.CO_DEEPSEQ = 1 ) ';
  end;
  if G_nReportCompanyStep > 1 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE d ';
    stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE ';
    stSql := stSql + ' AND d.CO_DEEPSEQ = 2 ) ';
  end;
  if G_nReportCompanyStep > 2 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE e ';
    stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE ';
    stSql := stSql + ' AND e.CO_DEEPSEQ = 3 ) ';
  end;
  if G_nReportCompanyStep > 3 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE p ';
    stSql := stSql + ' ON(b.GROUP_CODE = p.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE ';
    stSql := stSql + ' AND p.CO_DEEPSEQ = 4 ) ';
  end;
  if G_nReportCompanyStep > 4 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE q ';
    stSql := stSql + ' ON(b.GROUP_CODE = q.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE ';
    stSql := stSql + ' AND q.CO_DEEPSEQ = 5 ) ';
  end;
  if G_nReportCompanyStep > 5 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE r ';
    stSql := stSql + ' ON(b.GROUP_CODE = r.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE ';
    stSql := stSql + ' AND r.CO_DEEPSEQ = 6 ) ';
  end;
  if G_nReportCompanyStep > 6 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE s ';
    stSql := stSql + ' ON(b.GROUP_CODE = s.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE ';
    stSql := stSql + ' AND s.CO_DEEPSEQ = 7 ) ';
  end;
  stSql := stSql + ' Left Join TB_POSICODE f ';
  stSql := stSql + ' ON(b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE )';
  if aEtcName <> '' then
  begin
    if aEtcType = '4' then
    begin
      stSql := stSql + ' Inner Join TB_CARD g ';
      stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
      stSql := stSql + ' AND a.EM_SEQ = g.EM_SEQ ) ';
    end;
  end;
  stSql := stSql + ' Left Join TB_FOODTYPE h ';
  stSql := stSql + ' ON(a.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND a.RE_FDTYPE = h.RE_FDTYPE )';
  stSql := stSql + ' Left Join TB_FOODCODE i ';
  stSql := stSql + ' ON(a.GROUP_CODE = i.GROUP_CODE ';
  stSql := stSql + ' AND a.RE_FDTYPE = i.RE_FDTYPE ';
  stSql := stSql + ' AND a.FO_CODE = i.FO_CODE ) ';
  stSql := stSql + ' Left Join TB_DOOR j ';
  stSql := stSql + ' ON(a.GROUP_CODE = j.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = j.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = j.DE_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = j.DO_DOORNO ) ';
  stSql := stSql + ' Left Join TB_FOODGROUP l ';
  stSql := stSql + ' ON(a.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND a.FG_CODE = l.FG_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.FE_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
  if aFdType <> '' then stSql := stSql + ' AND a.RE_FDTYPE = ''' + aFdType + ''' ';
  if aFoodCode <> '' then stSql := stSql + ' AND a.FO_CODE = ' + aFoodCode + ' ';
  if (stFoodGroup <> '') and (stFoodGroup <> '0') then stSql := stSql + ' AND a.FG_CODE = ' + stFoodGroup + ' ';


  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND b.EM_NAME Like N''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND b.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND b.EM_COMPANYPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //핸드폰
          stSql := stSql + ' AND b.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //카드번호
          stSql := stSql + ' AND g.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //기타
          stSql := stSql + ' AND b.EM_EMINFO Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '0' then stSql := stSql + ' AND b.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND b.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aEmpGubun <> '' then stSql := stSql + ' AND b.EM_GUBUNCODE = ''' + aEmpGubun + ''' ';
  end;
  stSql := stSql + ' order by a.FE_DATE,a.FE_TIME,a.CO_COMPANYCODE,a.EM_CODE ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_FOODEVENT_FoodStateReport(aStartDate, aEndDate,
  aCompanyCode, aPosiCode, aEmpGubun, aEtcType, aEtcName,
  aFdType: string): string;
var
  stSql : string;
begin

  stSql := ' Select ';
  if G_nReportCompanyStep > 0 then stSql := stSql + ' c.CO_COMPANYNAME as COMPANYNAME1,';
  if G_nReportCompanyStep > 1 then stSql := stSql + ' d.CO_COMPANYNAME as COMPANYNAME2,';
  if G_nReportCompanyStep > 2 then stSql := stSql + ' e.CO_COMPANYNAME as COMPANYNAME3, ';
  if G_nReportCompanyStep > 3 then stSql := stSql + ' p.CO_COMPANYNAME as COMPANYNAME4, ';
  if G_nReportCompanyStep > 4 then stSql := stSql + ' q.CO_COMPANYNAME as COMPANYNAME5, ';
  if G_nReportCompanyStep > 5 then stSql := stSql + ' r.CO_COMPANYNAME as COMPANYNAME6, ';
  if G_nReportCompanyStep > 6 then stSql := stSql + ' s.CO_COMPANYNAME as COMPANYNAME7, ';
  stSql := stSql + ' f.PO_POSICODENAME,b.EM_CODE,b.EM_NAME,a.FO_BREAK,a.FO_LUNCH,a.FO_DINNER,a.FO_MIDNIGHT,a.TOT,a.FO_FOODAMT,h.RE_FDTYPENAME '  ;
  stSql := stSql + ' From  ';
  stSql := stSql + ' (select aa.GROUP_CODE,aa.EM_SEQ,aa.RE_FDTYPE,  ';             // a Start
  stSql := stSql + ' SUM(aa.FO_BREAK) as FO_BREAK,   ';
  stSql := stSql + ' SUM(aa.FO_LUNCH) as FO_LUNCH,  ';
  stSql := stSql + ' SUM(aa.FO_DINNER) as FO_DINNER,  ';
  stSql := stSql + ' SUM(aa.FO_MIDNIGHT) as FO_MIDNIGHT,  ';
  stSql := stSql + ' SUM(aa.TOT) as TOT,    ';
  stSql := stSql + ' SUM(aa.FO_AMT) as FO_FOODAMT ';
  stSql := stSql + ' From  ';
  stSql := stSql + ' ( select GROUP_CODE,EM_SEQ,RE_FDTYPE,  ';   //aa Start
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN FO_CODE = 1 THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_BREAK,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN FO_CODE = 2 THEN 1   ';
  stSql := stSql + ' ELSE 0 END as FO_LUNCH,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN FO_CODE = 3 THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_DINNER,  ';
  stSql := stSql + ' CASE   ';
  stSql := stSql + ' WHEN FO_CODE = 4 THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_MIDNIGHT,  ';
  stSql := stSql + ' 1 as TOT,   ';
  stSql := stSql + ' FO_AMT ';
  stSql := stSql + ' from  ';
  stSql := stSql + ' TB_FOODEVENT ';
  stSql := stSql + ' Where FE_DATE BETWEEN ''' + aStartDate + ''' ';
  stSql := stSql + ' AND ''' + aEndDate + ''' ';
  if aFdType <> '' then stSql := stSql + ' AND RE_FDTYPE = ''' + aFdType + ''' ';
  stSql := stSql + ' ) aa   ';
  stSql := stSql + ' GROUP BY aa.GROUP_CODE,aa.EM_SEQ,aa.RE_FDTYPE   ';
  stSql := stSql + ' ) a   ';
  stSql := stSql + ' Left Join ';
  stSql := stSql + ' TB_EMPLOYEE b ';
  stSql := stSql + ' ON( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ) ';
  if G_nReportCompanyStep > 0 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength ) + ') = c.CO_COMPANYCODE ';
    stSql := stSql + ' AND c.CO_DEEPSEQ = 1 ) ';
  end;
  if G_nReportCompanyStep > 1 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE d ';
    stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 2 ) + ') = d.CO_COMPANYCODE ';
    stSql := stSql + ' AND d.CO_DEEPSEQ = 2 ) ';
  end;
  if G_nReportCompanyStep > 2 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE e ';
    stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 3 ) + ') = e.CO_COMPANYCODE ';
    stSql := stSql + ' AND e.CO_DEEPSEQ = 3 ) ';
  end;
  if G_nReportCompanyStep > 3 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE p ';
    stSql := stSql + ' ON(b.GROUP_CODE = p.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 4 ) + ') = p.CO_COMPANYCODE ';
    stSql := stSql + ' AND p.CO_DEEPSEQ = 4 ) ';
  end;
  if G_nReportCompanyStep > 4 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE q ';
    stSql := stSql + ' ON(b.GROUP_CODE = q.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 5 ) + ') = q.CO_COMPANYCODE ';
    stSql := stSql + ' AND q.CO_DEEPSEQ = 5 ) ';
  end;
  if G_nReportCompanyStep > 5 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE r ';
    stSql := stSql + ' ON(b.GROUP_CODE = r.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 6 ) + ') = r.CO_COMPANYCODE ';
    stSql := stSql + ' AND r.CO_DEEPSEQ = 6 ) ';
  end;
  if G_nReportCompanyStep > 6 then
  begin
    stSql := stSql + ' Left Join TB_COMPANYCODE s ';
    stSql := stSql + ' ON(b.GROUP_CODE = s.GROUP_CODE ';
    if G_nDBType = MSSQL then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = POSTGRESQL then
      stSql := stSql + ' AND substr(b.CO_COMPANYCODE,1,' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE '
    else if G_nDBType = FIREBIRD then
      stSql := stSql + ' AND substring(b.CO_COMPANYCODE From 1 for ' + inttostr( 1 + G_nCompanyCodeLength * 7 ) + ') = s.CO_COMPANYCODE ';
    stSql := stSql + ' AND s.CO_DEEPSEQ = 7 ) ';
  end;
  stSql := stSql + ' Left Join TB_POSICODE f ';
  stSql := stSql + ' ON(b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE )';
  if aEtcName <> '' then
  begin
    if aEtcType = '4' then
    begin
      stSql := stSql + ' Inner Join TB_CARD g ';
      stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
      stSql := stSql + ' AND a.EM_SEQ = g.EM_SEQ ) ';
    end;
  end;
  stSql := stSql + ' Left Join TB_FOODTYPE h ';
  stSql := stSql + ' ON(a.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND a.RE_FDTYPE = h.RE_FDTYPE )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND b.EM_NAME Like N''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND b.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND b.EM_COMPANYPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //핸드폰
          stSql := stSql + ' AND b.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //카드번호
          stSql := stSql + ' AND g.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //기타
          stSql := stSql + ' AND b.EM_EMINFO Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '0' then stSql := stSql + ' AND b.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND b.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aEmpGubun <> '' then stSql := stSql + ' AND b.EM_GUBUNCODE = ''' + aEmpGubun + ''' ';
  end;

  result := stSql;
end;

function TdmDBSelect.SelectTB_FOODEVENT_Summary(aSummary: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_FOODEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aSummary <> '' then stSql := stSql + ' and FE_FDSUMMARY = ''' + aSummary + ''' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_FOODGROUP_Name(aName: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_FOODGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aName <> '' then stSql := stSql + ' and FG_NAME Like ''' + aName + '%'' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_FOODTYPE_Name(aName: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_FOODTYPE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aName <> '' then stSql := stSql + ' and RE_FDTYPENAME Like ''' + aName + '%'' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_FORMCRITICAL_GubunCode(aGubun: string): string;
var
  stSql : string;
begin
  stSql := ' Select FC_CRITICALID,FC_MENUTYPE,FC_MENUNAME' + inttostr(G_nFormLanguageType) + ' as NAME,FC_CRITICALTYPE  from TB_FORMCRITICAL ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aGubun <> '' then stSql := stSql + ' AND FC_MENUTYPE = ''' + aGubun + ''' ';
  stSql := stSql + ' Order by FC_CRITICALID ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_FORMMESSAGE_All: string;
var
  stSql : string;
begin
  stSql := ' Select FM_MESSAGECODE,FM_MESSAGENAME' + inttostr(G_nFormLanguageType) + ' as NAME  from TB_FORMMESSAGE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' Order by NAME ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_FORMNAME_All: string;
var
  stSql : string;
begin
  stSql := ' Select FN_PROGRAMGUBUN,FN_NAMECODE,FN_MENUGUBUN,FN_MENUGROUP,FN_NAME' + inttostr(G_nFormLanguageType) + ' as NAME  from TB_FORMNAME ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' Order by NAME ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_Holiday_Year(aYear: string): string;
var
  stSql : string;
begin
  stSql := ' Select HO_DAY,HO_ACUSE,HO_ATUSE,HO_TYPE,HO_NAME' + inttostr(G_nFormLanguageType) + ' as NAME from TB_HOLIDAY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND SUBSTRING(HO_DAY,1,4) = ''' + aYear + ''' '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND SUBSTR(HO_DAY,1,4) = ''' + aYear + ''' '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND SUBSTRING(HO_DAY From 1 for 4) = ''' + aYear + ''' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_NODE_Name(aBuildingCode,aName: string;aNodeIP:string=''): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.FG_GROUPCODENAME,c.BC_BUILDINGNAME as BUILDINGNAME1,d.BC_BUILDINGNAME as BUILDINGNAME2,e.BC_BUILDINGNAME as BUILDINGNAME3 from TB_NODE a ';
  stSql := stSql + ' Left Join TB_FIREGROUP b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.FG_GROUPCODE = b.FG_GROUPCODE ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE ';
  stSql := stSql + ' AND c.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE e ';
  stSql := stSql + ' ON(a.GROUP_CODE = e.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(a.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(a.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 3 ) + ') = e.BC_BUILDINGCODE ';
  stSql := stSql + ' AND e.BC_DEEPSEQ = 3 ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.ND_DELETE <> ''Y'' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '0') then
  begin
    stSql := stSql + ' and a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  end;
  if aName <> '' then stSql := stSql + ' and a.ND_NODENAME Like ''%' + aName + '%'' ';
  if aNodeIP <> '' then stSql := stSql + ' and a.ND_NODEIP Like ''%' + aNodeIP + '%'' ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_READER_Device(aNodeNo, aEcuID: string): string;
var
  stSql : string;
begin
  stSql := 'Select ';
  stSql := stSql + ' a.*,c.ND_NODENAME,d.AP_NAME,e.RE_FDTYPENAME,f.BC_BUILDINGNAME,g.FG_NAME ';
  stSql := stSql + ' From TB_READER a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Inner Join TB_NODE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO )';
  stSql := stSql + ' Left Join TB_ATTENDPOSITION d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AP_CODE = d.AP_CODE ) ';
  stSql := stSql + ' Left Join TB_FOODTYPE e ';
  stSql := stSql + ' ON(a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.RE_FDTYPE = e.RE_FDTYPE ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE f ';
  stSql := stSql + ' ON(a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE = f.BC_BUILDINGCODE ) ';
  stSql := stSql + ' Left Join TB_FOODGROUP g ';
  stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND a.FG_CODE = g.FG_CODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aNodeNo <> '' then stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  //stSql := stSql + ' AND a.RE_READERUSE = ''1'' ';
  stSql := stSql + ' Order by a.ND_NODENO,a.DE_ECUID,a.RE_READERUSE ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_READER_FoodMasterAll: string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.RE_FDTYPENAME,b.FT_YESTERDAYTIME,c.FO_CODE,c.FO_NAME,c.FO_STARTTIME,c.FO_ENDTIME,c.FO_AMT,c.FO_INITTIME from TB_READER a';
  stSql := stSql + ' inner Join TB_FOODTYPE b ';
  stSql := stSql + ' ON ( a.RE_FDTYPE = b.RE_FDTYPE ) ';
  stSql := stSql + ' inner Join TB_FOODCODE c ';
  stSql := stSql + ' ON ( a.RE_FDTYPE = c.RE_FDTYPE ) ';
  stSql := stSql + ' Where a.RE_FDTYPE <> ''0'' ';
  result := stSql;
end;

function TdmDBSelect.SelectTB_SYSTEMLOG_ArmAreaManagementReport(aStartDate,
  aStartTime, aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID,
  aArmAreaNo: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.AR_ARMAREANAME,c.BC_BUILDINGNAME from TB_SYSTEMLOG a ';
  stSql := stSql + ' Inner Join TB_ARMAREA b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  if G_nDBType = MSSQL then
  begin
    stSql := stSql + ' AND CONVERT(INT,a.SY_NUMBER) = b.AR_ARMAREANO  ';
  end else
  begin
    stSql := stSql + ' AND CAST(a.SY_NUMBER AS INT) = b.AR_ARMAREANO  ';
  end;
  stSql := stSql + ') ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.BC_BUILDINGCODE = c.BC_BUILDINGCODE ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.SY_TYPE = ''' + con_ComLogTYPE_ARMAREA + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.SY_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.SY_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.SY_DATE + a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.SY_DATE || a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aArmAreaNo = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  end else
  begin
    stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo ;
    stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.SY_NUMBER = ''' + aArmAreaNo + ''' ';
  end;

  stSql := stSql + ' order by a.SY_DATE,a.SY_TIME ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_SYSTEMLOG_CardManagementReport(aStartDate,
  aStartTime, aEndDate, aEndTime, aCompanyCode, aPosiCode, aEmpGubun, aEtcType,
  aEtcName: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.DO_DOORNAME,c.BC_BUILDINGNAME from TB_SYSTEMLOG a ';
  stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  if G_nDBType = MSSQL then
  begin
    stSql := stSql + ' AND CONVERT(INT,a.SY_NUMBER) = b.DO_DOORNO  ';
  end else
  begin
    stSql := stSql + ' AND CAST(a.SY_NUMBER AS INT) = b.DO_DOORNO  ';
  end;
  stSql := stSql + ') ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.BC_BUILDINGCODE = c.BC_BUILDINGCODE ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.SY_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.SY_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.SY_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.SY_DATE + a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.SY_DATE || a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;

  stSql := stSql + ' order by a.SY_DATE,a.SY_TIME ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_SYSTEMLOG_DoorManagementReport(aStartDate,
  aStartTime, aEndDate, aEndTime, aBuildingCode, aNodeNo, aEcuID,
  aDoorNo: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.DO_DOORNAME,c.BC_BUILDINGNAME from TB_SYSTEMLOG a ';
  stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  if G_nDBType = MSSQL then
  begin
    stSql := stSql + ' AND CONVERT(INT,a.SY_NUMBER) = b.DO_DOORNO  ';
  end else
  begin
    stSql := stSql + ' AND CAST(a.SY_NUMBER AS INT) = b.DO_DOORNO  ';
  end;
  stSql := stSql + ') ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.BC_BUILDINGCODE = c.BC_BUILDINGCODE ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.SY_TYPE = ''' + con_ComLogTYPE_DOOR + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.SY_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.SY_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.SY_DATE + a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.SY_DATE || a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aDoorNo = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  end else
  begin
    stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo ;
    stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.SY_NUMBER = ''' + aDoorNo + ''' ';
  end;

  stSql := stSql + ' order by a.SY_DATE,a.SY_TIME ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_TIMECODEDEVICE_Device(aNodeNo,
  aEcuID: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_TIMECODEDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' order by ND_NODENO,DE_ECUID ';

  result := stSql;
end;

function TdmDBSelect.SelectTB_ZONE_BuildingCode(aBuildingCode,
  aSearchName: string): string;
var
  stSql : string;
begin
  if G_nDBType = MDB then
  begin
    stSql := ' Select ';
    stSql := stSql + ' a.ND_NODENO,';
    stSql := stSql + ' a.DE_ECUID,';
    stSql := stSql + ' a.DE_EXTENDID,';
    stSql := stSql + ' a.ZN_ZONENO,';
    stSql := stSql + ' a.ZN_ZONEUSE,';
    stSql := stSql + ' a.ZN_ZONENAME,';
    stSql := stSql + ' a.BC_BUILDINGCODE,';
    stSql := stSql + ' c.ND_DECODERNO ';
    stSql := stSql + ' From TB_ZONE a ';
    stSql := stSql + ' Inner Join ( select * from TB_DEVICE where DE_DEVICEUSE = ''1'' ) b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = b.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = b.DE_EXTENDID) ';
    stSql := stSql + ' Inner Join TB_NODE c';
    stSql := stSql + ' ON(a.ND_NODENO = c.ND_NODENO ) ';
    stSql := stSql + ' Inner Join ( select * from TB_ZONEEXTENTION where ZE_TYPE = ''1'' ) d ';
    stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = d.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = d.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = d.DE_EXTENDID) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aBuildingCode <> '' then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
    if aSearchName <> '' then stSql := stSql + ' AND a.ZN_ZONENAME Like ''%' + aSearchName + '%'' ';
    stSql := stSql + ' AND a.ZN_ZONEUSE = ''1'' ';
    stSql := stSql + ' Order by a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.ZN_ZONENO ';
  end else
  begin
    stSql := ' Select ';
    stSql := stSql + ' a.ND_NODENO,';
    stSql := stSql + ' a.DE_ECUID,';
    stSql := stSql + ' a.DE_EXTENDID,';
    stSql := stSql + ' a.ZN_ZONENO,';
    stSql := stSql + ' a.ZN_ZONEUSE,';
    stSql := stSql + ' a.ZN_ZONENAME,';
    stSql := stSql + ' a.BC_BUILDINGCODE,';
    stSql := stSql + ' c.ND_DECODERNO  ';
    stSql := stSql + ' From TB_ZONE a ';
    stSql := stSql + ' Inner Join TB_DEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
    stSql := stSql + ' Inner Join TB_NODE c';
    stSql := stSql + ' ON(a.ND_NODENO = c.ND_NODENO ) ';
    stSql := stSql + ' Inner Join ( select * from TB_ZONEEXTENTION where ZE_TYPE = ''1'' ) d ';
    stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE) ';
    stSql := stSql + ' AND (a.ND_NODENO = d.ND_NODENO) ';
    stSql := stSql + ' AND (a.DE_ECUID = d.DE_ECUID) ';
    stSql := stSql + ' AND (a.DE_EXTENDID = d.DE_EXTENDID) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aBuildingCode <> '' then  stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
    if aSearchName <> '' then stSql := stSql + ' AND a.ZN_ZONENAME Like ''%' + aSearchName + '%'' ';
    stSql := stSql + ' AND a.ZN_ZONEUSE = ''1'' ';
    stSql := stSql + ' Order by a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.ZN_ZONENO ';
  end;
  result := stSql;
end;

end.
