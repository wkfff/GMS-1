unit uDBUpdate;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmDBUpdate = class(TDataModule)
    { Private declarations }
  public
    { Public declarations }
    Function UpdateTB_ACCESSEVENT_Field_StringValue(aDate,aTime,aNodeNo,aEcuID,aExtendID,aDoorNo,aCardNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_ACCESSEVENT_TelNumber(aDate,aTime,aNodeNo,aEcuID,aData:string):Boolean;
    Function UpdateTB_ADMIN_Field_StringValue(aUserID,aFieldName,aData:string):Boolean;
    Function UpdateTB_ADMINGRADECODE_Field_StringValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_ADMINGRADEPROGRAM_Field_StringValue(aGradeCode,aProgramGubun,aMenuID,aFieldName,aData:string):Boolean;
    Function UpdateTB_ALARMEVENT_Confirm(aAlarmDate,aAlarmTime,aNodeNo,aEcuID,aExtendID,aMsgNo,aCheckOk,aCheckMsg,aCheckTime,aPCIP:string):Boolean;
    Function UpdateTB_ANTIGROUPCODE_Field_IntegerValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_ANTIGROUPCODE_Field_StringValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_ARMAREA_DefaultNodeArmAreaName(aNodeNo,aNodeName:string):Boolean;
    Function UpdateTB_ARMAREA_Field_IntValue(aNodeNo,aEcuID,aExtendID,aArmAreaNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_ARMAREA_Field_StringValue(aNodeNo,aEcuID,aExtendID,aArmAreaNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_ARMAREA_TelphoneOfficeArmAreaName(aNodeNo,aNodeName:string):Boolean;
    Function UpdateTB_ARMAREA_ViewSeqInc(aViewSeq:string):Boolean;
    Function UpdateTB_ATTENDCODE_VALUE(aAWCode,aCode,aName,aYesterDayTime,aWorkStartTime,aWorkEndTime,aInFromTime,aInToTime,aExtendTime,aNightTime,aNormalAdd,aEarlyAdd,aJigakAdd,aJotaeAdd,aExtendAdd,aNightAdd,
             aSWorkStartTime,aSWorkEndTime,aSInFromTime,aSInToTime,aSExtendTime,aSNightTime,aSNormalAdd,aSEarlyAdd,aSJigakAdd,aSJotaeAdd,aSExtendAdd,aSNightAdd,
             aHWorkStartTime,aHWorkEndTime,aHInFromTime,aHInToTime,aHExtendTime,aHNightTime,aHNormalAdd,aHEarlyAdd,aHJigakAdd,aHJotaeAdd,aHExtendAdd,aHNightAdd,aOutRange,aSoutRange,aHoutRange:string ):Boolean;
    Function UpdateTB_ATTENDEVENT_InWork(aDate,aEmSeq,aInWorkTime,aInWorkCount:string):Boolean;
    Function UpdateTB_ATTENDEVENT_OutWork(aDate, aEmSeq,aOutWorkTime,aOutWorkCount:string):Boolean;
    Function UpdateTB_ATTENDEVENT_WorkIn(aDate,aEmSeq,aEmCode,aEmName,aCompanyCode,aAWCode,aATCode,aWeekCode,aWorkStartTime,aWorkEndTime,aATInTime,aATINResult,aWorkCount,aJiGakCount:string):Boolean;
    Function UpdateTB_ATTENDEVENT_WorkOut(aDate, aEmSeq,aEmCode,aEmName, aCompanyCode, aAWCode, aATCode, aWeekCode, aWorkStartTime,aWorkEndTime, aOutTime, aOutResult,aBeforWorkMM,aWorkMM,aExtendWorkMM,aNightWorkMM,aBeforWorkCount,aWorkCount,aJotaeCount,aExtendWorkCount,aNightWorkCount:string):Boolean;
    Function UpdateTB_ATTENDEVENTLIST_Work(aDate,aEmSeq,aInOutType,aEmCode,aEmName, aCompanyCode, aInResult, aInTime,aNodeNo,aEcuID,aExtendID,aDoorNo,aReaderNo,aBUTTON,aDeviceType:string):Boolean;
    Function UpdateTB_ATTENDPOSITION_VALUE(aCode,aName,aDeviceType,aStartButton,aOffButton, aInoutDeviceType, aWorkOutButton, aWorkInButton:string ):Boolean;
    Function UpdateTB_ATTENDWORKTYPE_VALUE(aCode,aName,aNotBackupType,aSaturdayType,aFixATType:string ):Boolean;
    Function UpdateTB_BMSCONFIG_Value(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aDetail:string=''):Boolean;
    Function UpdateTB_BUILDINGCODE_Field_StringValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARD_Field_IntValue(aCardNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARD_Field_StringValue(aCardNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARD_Value(aCardNo,aCardState,aCardGubun,aEmSeq:string;aCardPrintNo:string=''):Boolean;
    Function UpdateTB_CARDBUTTONEVENTSTAT_Field_CountAdd(aDate,aNodeNo,aEcuID,aExtendID,aDoorNo,aFieldName:string):Boolean;
    Function UpdateTB_CARDDELETEEVENT_Complete(aYear,aWeekDay,aWeek,aData:string):Boolean;
    Function UpdateTB_CARDFTPDOWNLIST_Field_StringValue(aNodeNo,aEcuID,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARDFTPDOWNLIST_Value(aNodeNo,aEcuID,aProgress,aRcvAck,aRetryCount:string):Boolean;
    Function UpdateTB_CARDPERMIT_AllRCVACK(aOldState,aNewState:string;aDecoderNo:string=''):Boolean;
    Function UpdateTB_CARDPERMIT_CARDRCVACK(aNodeNo,aEcuID,aExtendID,aCardNo,aRcvAck:string):Boolean;
    Function UpdateTB_CARDPERMIT_CARDRCVACKSUSCECCESS(aNodeNo,aEcuID,aExtendID,aCardNo,aRcvAck:string):Boolean;
    Function UpdateTB_CARDPERMIT_CardStop(aCardNo:string):Boolean;
    Function UpdateTB_CARDPERMIT_Field_IntValue(aNodeNo,aEcuID,aExtendID,aCardNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARDPERMIT_Field_StringValue(aNodeNo,aEcuID,aExtendID,aCardNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARDPERMIT_AllMEMLOAD(aMemLoad:string):Boolean;
    Function UpdateTB_CARDPERMIT_MEMLOAD(aOldMemLoad,aNewMemLoad:string;aNodeNo:string='';aEcuID:string=''):Boolean;
    Function UpdateTB_CARDPERMIT_DeviceResend(aNodeNo,aEcuID:string):Boolean;  //카드권한 재전송
    Function UpdateTB_CARDPERMIT_NodeRCVACK(aNodeNo,aOldState,aNewState:string):Boolean;
    Function UpdateTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,aExtendID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
               aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8:string;aPassword:string='';aCardType:string=''):Boolean;
    Function UpdateTB_CARDPERMITCOMPANYGROUP_CompanyCodeApply(aCompanyCode,aData:string):Boolean; //자회사코드도 변경 여부를 처리 하도록
    Function UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(aCompanyCode,aData:string):Boolean; //자회사코드도 변경 여부를 처리 하도록
    Function UpdateTB_CARDPERMITCOMPANYGROUP_Field_IntValue(aCompanyCode,aNodeNo,aEcuID,aExtendID,aType,aNumber,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,aNodeNo,aEcuID,aExtendID,aType,aNumber,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_ATTypeAdd :Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_ATNotTypeDelete:Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_AttendEmSeqApply(aEmSeq,aApply:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_CopyAttendDoorToEmCode(aNodeNo, aEcuID,aDoorNo,aApply:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_CopyAttendEmCodeToDoor(aEmSeq,aPermit,aApply:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_CopyFoodDoorToEmCode(aNodeNo, aEcuID,aDoorNo,aApply:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_CopyFoodEmCodeToDoor(aEmSeq,aPermit,aApply:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_DeviceResend(aNodeNo,aEcuID:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_DeviceToFingerApply(aNodeNo,aEcuID,aExtendID,aType,aNumber,aData:string;aPermit:string=''):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(aEmSeq,aApply:string;aNodeNo:string='';aEcuID:string='';aEmApprove:string=''):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,aOldApply,aNewApply:string;aNodeNo:string='';aEcuID:string=''):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(aEM_SEQ,aFingerApply:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(aEM_SEQ,aNODENO,aECUID,aCP_TYPE,aCP_NUMBER,aFingerApply:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_FoodEmSeqApply(aEmSeq,aApply:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_FDTypeAdd :Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_FDNotTypeDelete:Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_FINGERAPPLYChange(aOldState,aNewState:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_FINGERNotEmployeeAPPLYChange(aOldState,aNewState:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_FINGERUseAPPLYChange(aOldState,aNewState:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_PermitStop(aEmSeq,aType:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber,aPermit,aApply,aEmApprove:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEEGROUP_EmGroupCodeApply(aEmGroupCode,aData:string):Boolean; //자식코드도 변경 여부를 처리 하도록
    Function UpdateTB_CARDPERMITEMPLOYEEGROUP_EmGroupLikeApply(aEmGroupCode,aData:string):Boolean; //자식코드도 변경 여부를 처리 하도록
    Function UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_IntValue(aEmGroupCode,aNodeNo,aEcuID,aExtendID,aType,aNumber,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(aEmGroupCode,aNodeNo,aEcuID,aExtendID,aType,aNumber,aFieldName,aData:string):Boolean;
    Function UpdateTB_CCTV_Field_StringValue(aCCTVNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_COMPANYCODE_Field_IntValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_COMPANYCODE_Field_StringValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_CONFIG_Field_StringValue(aGroup,aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_Decoder_Value(aDecoderNo,aServerName,aSocketType,aDecoderIP,aMonitoringServerPort,aControlerServerPort,aFTPPort:string):Boolean;
    Function UpdateTB_DEVICE_DefaultNodeDeviceName(aNodeNo,aNodeName:string):Boolean;
    Function UpdateTB_DEVICE_DeviceUse(aNodeNo,aEcuID,aExtendID,aUse:string):Boolean;
    Function UpdateTB_DEVICE_Field_IntValue(aNodeNo,aEcuID,aExtendID,aFieldName,aData:string):Boolean;
    Function UpdateTB_DEVICE_Field_StringValue(aNodeNo,aEcuID,aExtendID,aFieldName,aData:string):Boolean;
    Function UpdateTB_DEVICE_TelphoneOfficeDeviceName(aNodeNo,aNodeName:string):Boolean;
    Function UpdateTB_DEVICERCV_Field_StringValue(aNodeNo,aEcuID,aExtendID,aFieldName,aData:string):Boolean;
    Function UpdateTB_DEVICERCV_TIMECODEUSEAllChange(aOldType,aNewType:string;aDecoderNo:string=''):Boolean;
    Function UpdateTB_DOOR_AllField_StringValue(aFieldName,aData:string):Boolean;
    Function UpdateTB_DOOR_DefaultNodeDoorName(aNodeNo,aNodeName:string):Boolean;
    Function UpdateTB_DOOR_DOORSettingInfoValue(aNodeNo,aEcuID,aExtendID,aDoorNo,aCardMode,aDoorMode,aControlTime,aLongOpenTime,aScheduleUse,aDoorState,aAntiNo,aLongOpenAlarm,aLockType,aFireOpen,aDSOpenState,aRemoteDisArmDoorOpen:string):Boolean;
    Function UpdateTB_DOOR_Field_IntValue(aNodeNo,aEcuID,aExtendID,aDoorNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_DOOR_Field_StringValue(aNodeNo,aEcuID,aExtendID,aDoorNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_DOOR_TelphoneOfficeDoorName(aNodeNo,aNodeName:string):Boolean;
    function UpdateTB_DOOR_ViewSeqInc(aViewSeq:string):Boolean;
    Function UpdateTB_DOORRCV_Field_StringValue(aNodeNo,aEcuID,aExtendID,aDoorNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_DOORRCV_AllRcvAck(aFieldName,aOldState,aNewState:string;aDecoderNo:string=''):Boolean;
    function UpdateTB_DOORSCHEDULE_All(aNodeNo,aECUID,aDOORNO,aDayCode,a1Time,a2Time,a3Time,a4Time,a5Time,a1Mode,a2Mode,a3Mode,a4Mode,a5Mode,aRcvAck:string):Boolean;
    function UpdateTB_DOORSCHEDULE_DoorReceive(aNodeNo,aECUID,aDOORNO,aRcvAck:string):Boolean;
    Function UpdateTB_DOORSCHEDULE_Field_StringValue(aNodeNo,aEcuID,aExtendID,aDoorNo,aDayCode,aFieldName,aData:string):Boolean;
    function UpdateTB_DOORSCHEDULE_SendStatus(aOldState,aNewState:string;aDecoderNo:string=''):Boolean;
    function UpdateTB_DOORTELEVENT_Field_StringValue(aDate, aTime, aNodeNo, aEcuID,aExtendID, aDoorNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_EMPLOYEE_Field_IntValue(aEMSeq,aFieldName,aData:string):Boolean;
    Function UpdateTB_EMPLOYEE_Field_StringValue(aEMSeq,aFieldName,aData:string):Boolean;
    Function UpdateTB_EMPLOYEE_ALLMEMLOAD(aMemLoad:string):Boolean;
    Function UpdateTB_EMPLOYEE_Value(aEmSeq,aEmCode,aEmName,aCompanyCode,aPosiCode,aGubunCode,aCompanyPhone,aHomePhone,ahandPhone,aEmninfo,
             aRegDate,aEndDate,aACType,aATType,aFdType,aEmGroupCode,aGradeType,aFingerUse,aEmStateCode,aAWCode:string;aAll:Boolean;aCardUse:string;
             aRelayUse:string='0';aRelayDate:string='';aRelayCode:string='';aEmApprove:string=''):Boolean;
    Function UpdateTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq,aNodeNo,aEcuID,aTimeCodeUse,aTimeGroup,aTime1,aTime2,aTime3,aTime4,aWeek:string):Boolean;
    Function UpdateTB_EMPLOYEEFINGER_Field_StringValue(aEmSeq,aFingerSeq,aFieldName,aData:string):Boolean;
    Function UpdateTB_EMPLOYEEFINGER_Template(aEmSeq,aFingerSeq,aFingerTemplate1_1,aFingerTemplate1_2,aFingerTemplate2_1,aFingerTemplate2_2,aFingerTemplate3_1,aFingerTemplate3_2:string):Boolean;
    Function UpdateTB_EMPLOYEEGROUPCODE_Field_IntValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_EMPLOYEEGROUPCODE_Field_StringValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_EMPLOYEEGUBUN_Field_IntValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_EMPLOYEEGUBUN_Field_StringValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_EMPLOYEEGUBUN_ViewSeqInc(aViewSeq:string):Boolean;
    Function UpdateTB_FINGERDEVICE_Value(aFnSeq,aDeviceIP,aDeviceName,aPort,aDeviceType,aCPType,aNodeNo,aEcuID,aExtendID,aDoorNo:string):Boolean;
    Function UpdateTB_FINGERDEVICECARD_Field_StringValue(aFnSeq,aCardPOSITIONNUM,aFieldName,aData:string):Boolean;
    Function UpdateTB_FINGERDEVICECARD_Resend(aFnSeq:string):Boolean;
    Function UpdateTB_FINGERDEVICECARD_Value(aFnSeq,aCardPOSITIONNUM,aEMSEQ,aPermit,aSend:string):Boolean;
    Function UpdateTB_FIREGROUP_Field_StringValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_FOODCODE_VALUE(aFdType,aCode,aName,aStartTime,aEndTime,aAmt,aFoodOutTime : string):Boolean;
    Function UpdateTB_FOODCODECOUNT_AddCount(aDATE,aFDTYPE,aFOCODE:string):Boolean;
    Function UpdateTB_FOODEVENT_Field_StringValue(aFEDATE,aFETIME,aEMSEQ,aNDNODENO,aDEECUID,aREREADERNO,aFieldName,aData:string):Boolean;
    Function UpdateTB_FOODEVENT_Summary_Ready:Boolean;
    Function UpdateTB_FOODGROUP_Field_StringValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_FOODOUTCOUNT_AddCount(aFdDate,aFdType,aFdCode:string):Boolean;
    Function UpdateTB_FOODOUTCOUNT_Field_IntValue(aFdDate,aFdType,aFdCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_FOODOUTCOUNT_Field_StringValue(aFdDate,aFdType,aFdCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_FOODTYPE_Field_StringValue(aFdType,aFieldName,aData:string):Boolean;
    Function UpdateTB_FORMCRITICAL_Field_IntValue(aID,aFieldName,aData:string):Boolean;
    Function UpdateTB_FORMMESSAGE_Name(aMESSAGECODE,aName:string):Boolean;
    Function UpdateTB_FORMNAME_Name(aPROGRAMGUBUN,aNAMECODE,aMENUGUBUN,aMENUGROUP,aName:string):Boolean;
    Function UpdateTB_GUESTLIST_Field_IntValue(aGlSeq,aFieldName,aValue:string):Boolean;
    Function UpdateTB_GUESTLIST_Field_StringValue(aGlSeq,aFieldName,aValue:string):Boolean;
    Function UpdateTB_GUESTLIST_Value(aGlSeq,aEmName,aStartDate,aEndDate,aCompanyName,aHandPhone,aChangeFlag:string):Boolean;
    Function UpdateTB_HOLIDAY_Value(aDate,aName,aACType,aATType,aHoType:string):Boolean;
    Function UpdateTB_HOLIDAY_Field_IntValue(aDate,aFieldName,aValue:string):Boolean;
    Function UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(aYear,aStatus,aSendStatus:string;aDecoderNo:string=''):Boolean;
    Function UpdateTB_HOLIDAYDEVICE_DayDelete(aDate:string):Boolean; //해당날짜의 특정일을 삭제 하는 기능
    Function UpdateTB_HOLIDAYDEVICE_DaySendStatus(aNodeNo,aEcuID,aDay,aUse,aSendStatus:string):Boolean;
    Function UpdateTB_HOLIDAYDEVICE_DeviceYearSendStatus(aNodeNo,aEcuID,aYear,aSendStatus:string):Boolean;
    Function UpdateTB_HOLIDAYDEVICE_Field_IntValue(aNodeNo,aEcuID,aDate,aFieldName,aData:string):Boolean;
    Function UpdateTB_HOLIDAYDEVICE_Field_StringValue(aNodeNo,aEcuID,aDate,aFieldName,aData:string):Boolean;
    function UpdateTB_NODE_AllMemLoadInit(aState:string):Boolean;
    Function UpdateTB_NODE_Field_IntValue(aNodeNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_NODE_Field_StringValue(aNodeNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_NODE_NodeIP(aNodeNo,aNodeIp,aNodeName,aServerNo:string;aDeviceType:string=''):Boolean;
    Function UpdateTB_NODE_TelphoneOfficeNodeIP(aNodeNo,aNodeIp,aNodeName,aDeviceType,aServerNo,aBuildingCode,aTelNumber,aAddr,aAddDate:string):Boolean;
    Function UpdateTB_NODERCV_Field_StringValue(aNodeNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_POSICODE_Field_StringValue(aPosiCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_READER_DefaultNodeReaderName(aNodeNo,aNodeName:string):Boolean;
    Function UpdateTB_READER_Field_IntValue(aNodeNo,aEcuID,aExtendID,aReaderNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_READER_Field_StringValue(aNodeNo,aEcuID,aExtendID,aReaderNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_READERRCV_AllRCVACK(aFieldName,aOldState,aNewState:string;aDecoderNo:string=''):Boolean;
    Function UpdateTB_READERRCV_Field_StringValue(aNodeNo,aEcuID,aExtendID,aReaderNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_TIMECODEDEVICE_Field_StringValue(aNodeNo,aEcuID,aFieldName,aData:string):Boolean;
    Function UpdateTB_TIMECODEDEVICE_SendStatus(aOldState,aNewState:string;aDecoderNo:string=''):Boolean;
    Function UpdateTB_ZONE_DefaultNodeZoneName(aNodeNo,aNodeName:string):Boolean;
    Function UpdateTB_ZONE_Field_IntValue(aNodeNo,aEcuID,aExtendID,aZoneNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_ZONE_Field_StringValue(aNodeNo,aEcuID,aExtendID,aZoneNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_ZONE_TelphoneOfficeZoneName(aNodeNo,aNodeName:string):Boolean;
    Function UpdateTB_ZONERCV_Field_StringValue(aNodeNo,aEcuID,aExtendID,aZoneNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_ZONEEXTENTION_Field_StringValue(aNodeNo,aEcuID,aExtendID,aFieldName,aData:string):Boolean;
    Function UpdateTB_ZONEEXTENTIONRCV_Field_StringValue(aNodeNo,aEcuID,aExtendID,aFieldName,aData:string):Boolean;
    Function UpdateVW_APPROVE_LABOR_Field_StringValue(aJUMIN_NO,aFieldName,aData:string):Boolean;
  end;

var
  dmDBUpdate: TdmDBUpdate;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
uses
  uCommonVariable,
  uCommonFunction,
  uDataBase;

{$R *.dfm}

{ TdmDBUpdate }

function TdmDBUpdate.UpdateTB_ACCESSEVENT_Field_StringValue(aDate, aTime,
  aNodeNo, aEcuID, aExtendID, aDoorNo, aCardNo, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'EM_NAME' then stSql := 'Update TB_ACCESSEVENT set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_ACCESSEVENT set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AE_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_ACCESSEVENT_TelNumber(aDate, aTime, aNodeNo,
  aEcuID, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ACCESSEVENT set AE_TELNUM = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AE_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AE_CONTROLTYPECODE = ''P'' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ADMINGRADECODE_Field_StringValue(aCode,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'AG_GRADECODENAME' then stSql := 'Update TB_ADMINGRADECODE set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_ADMINGRADECODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AG_GRADECODE = ''' + aCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ADMINGRADEPROGRAM_Field_StringValue(aGradeCode,aProgramGubun,aMenuID,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ADMINGRADEPROGRAM set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AG_GRADECODE = ''' + aGradeCode + ''' ';
  stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + aProgramGubun + ''' ';
  stSql := stSql + ' AND FN_NAMECODE = ''' + aMenuID + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_ADMIN_Field_StringValue(aUserID, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'AD_USERNAME' then stSql := 'Update TB_ADMIN set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_ADMIN set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AD_USERID = ''' + aUserID + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ALARMEVENT_Confirm(aAlarmDate, aAlarmTime,
  aNodeNo, aEcuID, aExtendID, aMsgNo, aCheckOk, aCheckMsg, aCheckTime,
  aPCIP: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ALARMEVENT set ';
  stSql := stSql + ' AE_CHECKOK = ''' + aCheckOk + ''', ';
  stSql := stSql + ' AE_CHECKMSG = N''' + aCheckMsg + ''', ';
  stSql := stSql + ' AD_USERID = ''' + G_stAdminUserID + ''', ';
  stSql := stSql + ' AE_CHECKTIME = ''' + aCheckTime + ''', ';
  stSql := stSql + ' AE_PCIP = ''' + aPCIP + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AE_DATE = ''' + aAlarmDate + ''' ';
  stSql := stSql + ' AND AE_TIME = ''' + aAlarmTime + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND AE_MSGNO = ''' + aMsgNo + ''' ';
  dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ANTIGROUPCODE_Field_IntegerValue(aCode,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ANTIGROUPCODE set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AG_CODE = ' + aCode + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ANTIGROUPCODE_Field_StringValue(aCode, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ANTIGROUPCODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AG_CODE = ' + aCode + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ARMAREA_DefaultNodeArmAreaName(aNodeNo,
  aNodeName: string): Boolean;
var
  stSql : string;
begin
    if (G_nDBType = MSSQL)  then
    begin
      stSql := ' Update TB_ARMAREA set AR_ARMAREANAME = N''' + aNodeName + ''' + ''_'' + DE_ECUID + ''_'' + CAST(AR_ARMAREANO AS varchar(2)) '
    end else if (G_nDBType = MDB)  then
    begin
      stSql := ' Update TB_ARMAREA set AR_ARMAREANAME = ''' + aNodeName + ''' + ''_'' + DE_ECUID + ''_'' + String(AR_ARMAREANO) '
    end else  stSql := ' Update TB_ARMAREA set AR_ARMAREANAME = ''' + aNodeName + ''' || ''_'' || DE_ECUID || ''_'' || CAST(AR_ARMAREANO AS VARCHAR(2))';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND ( AR_NAMECHANGE is null or AR_NAMECHANGE = ''0'' ) ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ARMAREA_Field_IntValue(aNodeNo, aEcuID, aExtendID,
  aArmAreaNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ARMAREA set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND AR_ARMAREANO = ' + aArmAreaNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aArmAreaNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'AR_ARMAREANAME' then stSql := 'Update TB_ARMAREA set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_ARMAREA set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND AR_ARMAREANO = ' + aArmAreaNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ARMAREA_TelphoneOfficeArmAreaName(aNodeNo,
  aNodeName: string): Boolean;
var
  stSql : string;
begin
    stSql := ' Update TB_ARMAREA set AR_ARMAREANAME = N''' + aNodeName + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''00'' ' ;
    stSql := stSql + ' AND AR_ARMAREANO = 0 '  ;

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ARMAREA_ViewSeqInc(aViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ARMAREA set AR_VIEWSEQ = AR_VIEWSEQ + 1 ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AR_VIEWSEQ >= ' + aViewSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ATTENDCODE_VALUE(aAWCode, aCode, aName,
  aYesterDayTime, aWorkStartTime, aWorkEndTime, aInFromTime, aInToTime,
  aExtendTime, aNightTime, aNormalAdd, aEarlyAdd, aJigakAdd, aJotaeAdd,
  aExtendAdd, aNightAdd, aSWorkStartTime, aSWorkEndTime, aSInFromTime,
  aSInToTime, aSExtendTime, aSNightTime, aSNormalAdd, aSEarlyAdd, aSJigakAdd,
  aSJotaeAdd, aSExtendAdd, aSNightAdd, aHWorkStartTime, aHWorkEndTime,
  aHInFromTime, aHInToTime, aHExtendTime, aHNightTime, aHNormalAdd, aHEarlyAdd,
  aHJigakAdd, aHJotaeAdd, aHExtendAdd, aHNightAdd, aOutRange, aSoutRange,
  aHoutRange: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_ATTENDCODE Set ';
  stSql := stSql + ' AT_CODENAME = N''' + aName + ''',';
  stSql := stSql + ' AT_YESTERDAYTIME = ''' + aYesterDayTime + ''',';
  stSql := stSql + ' AT_WORKSTARTTIME = ''' + aWorkStartTime + ''',';
  stSql := stSql + ' AT_WORKENDTIME = ''' + aWorkEndTime + ''',';
  stSql := stSql + ' AT_INFROMTIME = ''' + aInFromTime + ''',';
  stSql := stSql + ' AT_INTOTIME = ''' + aInToTime + ''',';
  stSql := stSql + ' AT_EXTENDTIME = ''' + aExtendTime + ''',';
  stSql := stSql + ' AT_NIGHTTIME = ''' + aNightTime + ''',';
  stSql := stSql + ' AT_NORMALADD = ''' + aNormalAdd + ''',';
  stSql := stSql + ' AT_EARLYADD = ''' + aEarlyAdd + ''',';
  stSql := stSql + ' AT_JIGAKADD = ''' + aJigakAdd + ''',';
  stSql := stSql + ' AT_JOTAEADD = ''' + aJotaeAdd + ''',';
  stSql := stSql + ' AT_EXTENDADD = ''' + aExtendAdd + ''',';
  stSql := stSql + ' AT_NIGHTADD = ''' + aNightAdd + ''',';
  stSql := stSql + ' AT_SWORKSTARTTIME = ''' + aSWorkStartTime + ''',';
  stSql := stSql + ' AT_SWORKENDTIME = ''' + aSWorkEndTime + ''',';
  stSql := stSql + ' AT_SINFROMTIME = ''' + aSInFromTime + ''',';
  stSql := stSql + ' AT_SINTOTIME = ''' + aSInToTime + ''',';
  stSql := stSql + ' AT_SEXTENDTIME = ''' + aSExtendTime + ''',';
  stSql := stSql + ' AT_SNIGHTTIME = ''' + aSNightTime + ''',';
  stSql := stSql + ' AT_SNORMALADD = ''' + aSNormalAdd + ''',';
  stSql := stSql + ' AT_SEARLYADD = ''' + aSEarlyAdd + ''',';
  stSql := stSql + ' AT_SJIGAKADD = ''' + aSJigakAdd + ''',';
  stSql := stSql + ' AT_SJOTAEADD = ''' + aSJotaeAdd + ''',';
  stSql := stSql + ' AT_SEXTENDADD = ''' + aSExtendAdd + ''',';
  stSql := stSql + ' AT_SNIGHTADD = ''' + aSNightAdd + ''',';
  stSql := stSql + ' AT_HWORKSTARTTIME = ''' + aHWorkStartTime + ''',';
  stSql := stSql + ' AT_HWORKENDTIME = ''' + aHWorkEndTime + ''',';
  stSql := stSql + ' AT_HINFROMTIME = ''' + aHInFromTime + ''',';
  stSql := stSql + ' AT_HINTOTIME = ''' + aHInToTime + ''',';
  stSql := stSql + ' AT_HEXTENDTIME = ''' + aHExtendTime + ''',';
  stSql := stSql + ' AT_HNIGHTTIME = ''' + aHNightTime + ''',';
  stSql := stSql + ' AT_HNORMALADD = ''' + aHNormalAdd + ''',';
  stSql := stSql + ' AT_HEARLYADD = ''' + aHEarlyAdd + ''',';
  stSql := stSql + ' AT_HJIGAKADD = ''' + aHJigakAdd + ''',';
  stSql := stSql + ' AT_HJOTAEADD = ''' + aHJotaeAdd + ''',';
  stSql := stSql + ' AT_HEXTENDADD = ''' + aHExtendAdd + ''',';
  stSql := stSql + ' AT_HNIGHTADD = ''' + aHNightAdd + ''',';
  stSql := stSql + ' AT_OUTRANGE = ''' + aOutRange + ''',';
  stSql := stSql + ' AT_SOUTRANGE = ''' + aSoutRange + ''',';
  stSql := stSql + ' AT_HOUTRANGE = ''' + aHoutRange + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AW_CODE = ' + aAWCode + ' ';
  stSql := stSql + ' AND AT_ATCODE = ' + aCode + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_ATTENDEVENTLIST_Work(aDate, aEmSeq, aInOutType,
  aEmCode, aEmName, aCompanyCode, aInResult, aInTime, aNodeNo, aEcuID,
  aExtendID, aDoorNo, aReaderNo, aBUTTON, aDeviceType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATTENDEVENTLIST Set ';
  stSql := stSql + ' EM_CODE = N''' + aEmCode + ''',';
  stSql := stSql + ' EM_NAME = N''' + aEmName + ''',';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + ' AC_RESULTCODE = ' + aInResult + ',';
  stSql := stSql + ' AE_INTIME = ''' + aInTime + ''',';
  stSql := stSql + ' ND_NODENO = ' + aNodeNo + ',';
  stSql := stSql + ' DE_ECUID = ''' + aEcuID + ''',';
  stSql := stSql + ' DE_EXTENDID = ' + aExtendID + ',';
  stSql := stSql + ' DO_DOORNO = ' + aDoorNo + ',';
  stSql := stSql + ' RE_READERNO = ' + aReaderNo + ',';
  stSql := stSql + ' AE_BUTTON = ''' + aBUTTON + ''', ';
  stSql := stSql + ' AP_DEVICETYPE = ' + aDeviceType + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND AC_INOUTTYPE = ' + aInOutType + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ATTENDEVENT_InWork(aDate, aEmSeq, aInWorkTime,
  aInWorkCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATTENDEVENT Set ';
  stSql := stSql + ' AE_ATWORKINTIME = ''' + aInWorkTime + ''',';
  stSql := stSql + ' AE_ATWORKINCOUNT = ' + aInWorkCount + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ATTENDEVENT_OutWork(aDate, aEmSeq, aOutWorkTime,
  aOutWorkCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATTENDEVENT Set ';
  stSql := stSql + ' AE_ATWORKOUTTIME = ''' + aOutWorkTime + ''',';
  stSql := stSql + ' AE_ATWORKOUTCOUNT = ' + aOutWorkCount + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ATTENDEVENT_WorkIn(aDate, aEmSeq, aEmCode,
  aEmName, aCompanyCode, aAWCode, aATCode, aWeekCode, aWorkStartTime,
  aWorkEndTime, aATInTime, aATINResult, aWorkCount,
  aJiGakCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATTENDEVENT Set ';
  stSql := stSql + ' EM_CODE = N''' + aEmCode + ''',';
  stSql := stSql + ' EM_NAME = N''' + aEmName + ''',';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + ' AW_CODE = ' + aAWCode + ',';
  stSql := stSql + ' AT_ATCODE = ' + aATCode + ',';
  stSql := stSql + ' AE_WEEKCODE = ' + aWeekCode + ',';
  stSql := stSql + ' AE_WORKSTARTTIME = ''' + aWorkStartTime + ''',';
  stSql := stSql + ' AE_WORKENDTIME = ''' + aWorkEndTime + ''',';
  stSql := stSql + ' AE_ATINTIME = ''' + aATInTime + ''',';
  stSql := stSql + ' AE_ATINRESULT = ' + aATINResult + ',';
  stSql := stSql + ' AE_WORKCOUNT = ' + aWorkCount + ', ';
  stSql := stSql + ' AE_JIGAKCOUNT = ' + aJiGakCount + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ATTENDEVENT_WorkOut(aDate, aEmSeq, aEmCode,
  aEmName, aCompanyCode, aAWCode, aATCode, aWeekCode, aWorkStartTime,
  aWorkEndTime, aOutTime, aOutResult,aBeforWorkMM,aWorkMM,aExtendWorkMM,aNightWorkMM, aBeforWorkCount, aWorkCount, aJotaeCount,aExtendWorkCount,aNightWorkCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATTENDEVENT Set ';
  stSql := stSql + ' EM_CODE = N''' + aEmCode + ''',';
  stSql := stSql + ' EM_NAME = N''' + aEmName + ''',';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + ' AW_CODE = ' + aAWCode + ',';
  stSql := stSql + ' AT_ATCODE = ' + aATCode + ',';
  stSql := stSql + ' AE_WEEKCODE = ' + aWeekCode + ',';
  stSql := stSql + ' AE_WORKSTARTTIME = ''' + aWorkStartTime + ''',';
  stSql := stSql + ' AE_WORKENDTIME = ''' + aWorkEndTime + ''',';
  stSql := stSql + ' AE_ATOUTTIME = ''' + aOutTime + ''',';
  stSql := stSql + ' AE_ATOUTRESULT = ' + aOutResult + ',';
  stSql := stSql + ' AE_BEFORWORKMM = ' + aBeforWorkMM + ',';
  stSql := stSql + ' AE_WORKMM = ' + aWorkMM + ',';
  stSql := stSql + ' AE_EXTENDWORKMM = ' + aExtendWorkMM + ',';
  stSql := stSql + ' AE_NIGHTWORKMM = ' + aNightWorkMM + ',';
  stSql := stSql + ' AE_BEFORWORKCOUNT = ' + aBeforWorkCount + ', ';
  stSql := stSql + ' AE_WORKCOUNT = ' + aWorkCount + ', ';
  stSql := stSql + ' AE_JOTAECOUNT = ' + aJotaeCount + ', ';
  stSql := stSql + ' AE_EXTENDWORKCOUNT = ' + aExtendWorkCount + ', ';
  stSql := stSql + ' AE_NIGHTWORKCOUNT = ' + aNightWorkCount + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ATTENDPOSITION_VALUE(aCode, aName, aDeviceType,
  aStartButton, aOffButton, aInoutDeviceType, aWorkOutButton,
  aWorkInButton: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATTENDPOSITION Set';
  stSql := stSql + ' AP_NAME = N''' + aName + ''', ';
  stSql := stSql + ' AP_DEVICETYPE = ''' + aDeviceType + ''', ';
  stSql := stSql + ' AP_ATSTARTBUTTON = ''' + aStartButton + ''', ';
  stSql := stSql + ' AP_ATOFFBUTTON = ''' + aOffButton + ''', ';
  stSql := stSql + ' AP_INOUTDEVICETYPE = ''' + aInoutDeviceType + ''', ';
  stSql := stSql + ' AP_WORKOUTBUTTON = ''' + aWorkOutButton + ''', ';
  stSql := stSql + ' AP_WORKINBUTTON = ''' + aWorkInButton + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AP_CODE = ' + aCode + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ATTENDWORKTYPE_VALUE(aCode, aName, aNotBackupType,
  aSaturdayType, aFixATType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATTENDWORKTYPE Set ';
  stSql := stSql + ' AW_NAME = N''' + aName + ''',';
  stSql := stSql + ' AW_NOTBACKUPTYPE = ''' + aNotBackupType + ''', ';
  stSql := stSql + ' AW_SATURDAYTYPE = ''' + aSaturdayType + ''',';
  stSql := stSql + ' AW_FIXATTYPE = ''' + aFixATType + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AW_CODE = ' + aCode + '';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_BMSCONFIG_Value(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE, aDetail: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_BMSCONFIG set ';
  stSql := stSql + ' BC_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  if aDetail <> '' then
  begin
    stSql := stSql + ',';
    stSql := stSql + 'BC_CONFIGDETAIL = N''' + aDetail + ''' ';
  end;
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND BC_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_BUILDINGCODE_Field_StringValue(aCode, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'BC_BUILDINGNAME' then  stSql := 'Update TB_BUILDINGCODE set ' + aFieldName + ' = N''' + aData + ''' '
  else
    stSql := 'Update TB_BUILDINGCODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_BUILDINGCODE = ''' + aCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDBUTTONEVENTSTAT_Field_CountAdd(aDate, aNodeNo,
  aEcuID, aExtendID, aDoorNo, aFieldName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDBUTTONEVENTSTAT set ' + aFieldName + ' = ' + aFieldName + ' + 1 ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CB_DAY = ''' + aDate + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDDELETEEVENT_Complete(aYear, aWeekDay, aWeek,
  aData: string): Boolean;
var
  stSql : string;
  stFieldName : string;
begin
  if Not isDigit(aWeek) then Exit;

  case strtoint(aWeek) of
    1 : begin
      stFieldName := 'CD_SUN';
    end;
    2 : begin
      stFieldName := 'CD_MON';
    end;
    3 : begin
      stFieldName := 'CD_TUE';
    end;
    4 : begin
      stFieldName := 'CD_WED';
    end;
    5 : begin
      stFieldName := 'CD_THU';
    end;
    6 : begin
      stFieldName := 'CD_FRI';
    end;
    7 : begin
      stFieldName := 'CD_SAT';
    end;
  end;

  stSql := 'Update TB_CARDDELETEEVENT set ' + stFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CD_YEAR = ''' + aYear + ''' ';
  stSql := stSql + ' AND CD_WEEK = ''' + aWeekDay + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDFTPDOWNLIST_Field_StringValue(aNodeNo, aEcuID,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDFTPDOWNLIST set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + '''';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + '';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + '''';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDFTPDOWNLIST_Value(aNodeNo, aEcuID, aProgress,
  aRcvAck, aRetryCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDFTPDOWNLIST Set ';
  stSql := stSql + ' CF_SENDPROGRESS = ''' + aProgress + ''',';
  stSql := stSql + ' CF_RCVACK = ''' + aRcvAck + ''',';
  stSql := stSql + ' CF_RETRYCNT = ' + aRetryCount + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + '''';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + '';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + '''';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyCodeApply(
  aCompanyCode, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITCOMPANYGROUP set CP_APPLY = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_CompanyLikeApply(
  aCompanyCode, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITCOMPANYGROUP set CP_APPLY = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_IntValue(
  aCompanyCode, aNodeNo, aEcuID, aExtendID, aType, aNumber, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITCOMPANYGROUP set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aNodeNo <> '' then stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  if aExtendID <> '' then stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  if aType <> '' then stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' '; //aType 1.출입,2.방범
  if aNumber <> '' then stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_StringValue(aCompanyCode,
  aNodeNo, aEcuID, aExtendID, aType, aNumber, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITCOMPANYGROUP set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' '; //aType 1.출입,2.방범
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;


function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_ATNotTypeDelete: Boolean;
var
  stSql : string;
begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = ''0'' ,';
    stSql := stSql + ' a.CP_APPLY = ''N'', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' ( select aa.*,bb.EM_SEQ from (select * from TB_DOOR';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
    stSql := stSql + ' AND DO_FDTYPE = ''1'' ) aa';   //식수전용 출입문
    stSql := stSql + ' Inner Join ( select * from TB_EMPLOYEE ';
    stSql := stSql + ' Where EM_ATUSE = ''0'' ) bb ';
    stSql := stSql + ' ON(aa.GROUP_CODE = bb.GROUP_CODE) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
    stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO ';
    stSql := stSql + ' AND a.CP_PERMIT <> ''0'' ';
    stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_AttendEmSeqApply(aEmSeq,
  aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A Set ';
  stSql := stSql + ' a.CP_APPLY = ''' + aApply + ''' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
  stSql := stSql + ' ( select * from TB_DOOR';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
  stSql := stSql + ' AND DO_ATTYPE = ''1'' ) B';   //근태전용 출입문
  stSql := stSql + ' WHERE a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
  stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO ';
  stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_ATTypeAdd: Boolean;
var
  stSql : string;
begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = ''1'' ,';
    stSql := stSql + ' a.CP_APPLY = ''N'', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' ( select aa.*,bb.EM_SEQ from (select * from TB_DOOR';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
    stSql := stSql + ' AND DO_ATTYPE = ''1'' ) aa';   //근태전용 출입문
    stSql := stSql + ' Inner Join ( select * from TB_EMPLOYEE ';
    stSql := stSql + ' Where EM_FDUSE = ''1'' ) bb ';
    stSql := stSql + ' ON(aa.GROUP_CODE = bb.GROUP_CODE) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
    stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO ';
    stSql := stSql + ' AND a.CP_PERMIT <> ''1'' ';
    stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_CopyAttendDoorToEmCode(
  aNodeNo, aEcuID,aDoorNo, aApply: string): Boolean;
var
  stSql : string;
begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = b.EM_ATUSE ,';
    stSql := stSql + ' a.CP_APPLY = ''' + aApply + ''', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''' + aApply + ''' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select * from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    //stSql := stSql + ' AND EM_ATUSE = ''1'' ';  //근태 사용 하는 경우의 데이터만 넣자.
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + '';
    stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.DE_EXTENDID = 0 ';
    stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
    stSql := stSql + ' AND a.CP_NUMBER = ' + aDoorNo + ' ';
    stSql := stSql + ' AND a.CP_PERMIT <> b.EM_ATUSE ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_CopyAttendEmCodeToDoor(
  aEmSeq, aPermit, aApply: string): Boolean;
var
  stSql : string;
begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = ''' + aPermit + ''' ,';
    stSql := stSql + ' a.CP_APPLY = ''' + aApply + ''', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''' + aApply + ''' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select * from TB_DOOR ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
    stSql := stSql + ' AND DO_ATTYPE = ''1'' ';   //긑내전용 출입문
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = ' + aEmSeq + ' ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
    stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO ';
    stSql := stSql + ' AND a.CP_PERMIT <> ''' + aPermit + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_CopyFoodDoorToEmCode(
  aNodeNo, aEcuID,aDoorNo, aApply: string): Boolean;
var
  stSql : string;
begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = b.EM_FDUSE ,';    //식수사용 유무를 권한으로 하자
    stSql := stSql + ' a.CP_APPLY = ''' + aApply + ''', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''' + aApply + ''' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select * from TB_EMPLOYEE ';
    //stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    //stSql := stSql + ' AND EM_FDUSE = ''1'' ';  //식수 사용 하는 경우의 데이터만 넣자.
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = b.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + '';
    stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.DE_EXTENDID = 0 ';
    stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
    stSql := stSql + ' AND a.CP_NUMBER = ' + aDoorNo + ' ';
    stSql := stSql + ' AND a.CP_PERMIT <> b.EM_FDUSE ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_CopyFoodEmCodeToDoor(
  aEmSeq, aPermit, aApply: string): Boolean;
var
  stSql : string;
begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = ''' + aPermit + ''' ,';
    stSql := stSql + ' a.CP_APPLY = ''' + aApply + ''', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''' + aApply + ''' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' (select * from TB_DOOR ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
    stSql := stSql + ' AND DO_FDTYPE = ''1'' ';   //근태전용 출입문
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.EM_SEQ = ' + aEmSeq + ' ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
    stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO ';
    stSql := stSql + ' AND a.CP_PERMIT <> ''' + aPermit + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_DeviceResend(aNodeNo,
  aEcuID: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_APPLY = ''N'', ';
  stSql := stSql + ' CP_FINGERAPPLY = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_DeviceToFingerApply(
  aNodeNo, aEcuID, aExtendID, aType, aNumber, aData: string;aPermit:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_FINGERAPPLY = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' '; //aType 1.출입,2.방범
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';
  if aPermit <> '' then stSql := stSql + ' AND CP_PERMIT = ''' + aPermit + ''' ';


  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(
  aEM_SEQ, aFingerApply: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_FINGERAPPLY = ''' + aFingerApply + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEM_SEQ + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(aEmSeq,
  aApply: string;aNodeNo:string='';aEcuID:string='';aEmApprove:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_APPLY = ''' + aApply + ''' ';
  if isDigit(aEmApprove) then stSql := stSql + ' ,EM_APPROVE = ' + aEmApprove + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  if aEcuID <> '' then
  begin
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  end;

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,
  aOldApply, aNewApply: string;aNodeNo:string='';aEcuID:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_APPLY = ''' + aNewApply + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND CP_APPLY = ''' + aOldApply + ''' ';
  stSql := stSql + ' AND EM_APPROVE = 1 ';   //승인 난 건에 한해서 작업 하자.
  if aEcuID <> '' then
  begin
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  end;

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(aEM_SEQ,aNODENO,aECUID,aCP_TYPE,aCP_NUMBER,aFingerApply: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_FINGERAPPLY = ''' + aFingerApply + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEM_SEQ + ' ';
  if isDigit(aNODENO) then stSql := stSql + ' AND ND_NODENO = ' + aNODENO + ' ';
  if aECUID <> '' then stSql := stSql + ' AND DE_ECUID = ''' + aECUID + ''' ';
  if aCP_TYPE <> '' then stSql := stSql + ' AND CP_TYPE = ''' + aCP_TYPE + ''' ';
  if isDigit(aCP_NUMBER) then stSql := stSql + ' AND CP_NUMBER = ' + aCP_NUMBER + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FDNotTypeDelete: Boolean;
var
  stSql : string;
begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = ''0'' ,';
    stSql := stSql + ' a.CP_APPLY = ''N'', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' ( select aa.*,bb.EM_SEQ from (select * from TB_DOOR';
    stSql := stSql + ' Where DO_FDTYPE = ''1'' ';
    stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
    stSql := stSql + ' AND GROUP_CODE = ''' + G_stGroupCode + ''' ) aa';   //식수전용 출입문
    stSql := stSql + ' Inner Join ( select * from TB_EMPLOYEE ';
    stSql := stSql + ' Where EM_FDUSE = ''0'' ) bb ';
    stSql := stSql + ' ON(aa.GROUP_CODE = bb.GROUP_CODE) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
    stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO ';
    stSql := stSql + ' AND a.CP_PERMIT <> ''0'' ';
    stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FDTypeAdd: Boolean;
var
  stSql : string;
begin
    stSql := ' Update A Set ';
    stSql := stSql + ' a.CP_PERMIT = ''1'' ,';
    stSql := stSql + ' a.CP_APPLY = ''N'', ';
    stSql := stSql + ' a.CP_FINGERAPPLY = ''N'' ';
    stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
    stSql := stSql + ' ( select aa.*,bb.EM_SEQ from (select * from TB_DOOR';
    stSql := stSql + ' Where DO_FDTYPE = ''1'' ';
    stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
    stSql := stSql + ' AND GROUP_CODE = ''' + G_stGroupCode + ''' ) aa';   //식수전용 출입문
    stSql := stSql + ' Inner Join ( select * from TB_EMPLOYEE ';
    stSql := stSql + ' Where EM_FDUSE = ''1'' ) bb ';
    stSql := stSql + ' ON(aa.GROUP_CODE = bb.GROUP_CODE) ';
    stSql := stSql + ' ) B ';
    stSql := stSql + ' WHERE a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
    stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO ';
    stSql := stSql + ' AND a.CP_PERMIT <> ''1'' ';
    stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue(aEmSeq,
  aNodeNo, aEcuID, aExtendID, aType, aNumber, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aEmSeq <> '' then stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  if aNodeNo <> '' then stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  if aExtendID <> '' then stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  if aType <> '' then stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' '; //aType 1.출입,2.방범
  if aNumber <> '' then stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,
  aNodeNo, aEcuID, aExtendID, aType, aNumber, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' '; //aType 1.출입,2.방범
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FINGERAPPLYChange(
  aOldState, aNewState: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update top (100) TB_CARDPERMITEMPLOYEECODE set CP_FINGERAPPLY = ''' + aNewState + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CP_FINGERAPPLY = ''' + aOldState + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FINGERNotEmployeeAPPLYChange(
  aOldState, aNewState: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update top (100) A  set A.CP_FINGERAPPLY = ''' + aNewState + ''' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A ';
  stSql := stSql + ' Where A.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND A.CP_FINGERAPPLY = ''' + aOldState + ''' ';
  stSql := stSql + ' AND A.CP_APPLY = ''Y'' ';       //20160211 카드권한 적용된건에 대해서만 지문권한 작업하자. 카드권한 적용되기 전에 지문 권한 적용되어 매칭이 안되는 경우발생
  stSql := stSql + ' AND NOT EXISTS ( select EM_SEQ from TB_EMPLOYEE B where A.EM_SEQ = B.EM_SEQ) ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FINGERUseAPPLYChange(
  aOldState, aNewState: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update top (100) A  set A.CP_FINGERAPPLY = ''' + aNewState + ''' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A ';
  stSql := stSql + ' INNER JOIN ( select * from TB_EMPLOYEE where EM_FINGERUSE = ''1'' OR EM_CARDUSE = 1 ) B ';
  stSql := stSql + ' ON(A.EM_SEQ = B.EM_SEQ) ';
  stSql := stSql + ' Where A.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND A.CP_FINGERAPPLY = ''' + aOldState + ''' ';
  stSql := stSql + ' AND A.CP_APPLY = ''Y'' ';       //20160211 카드권한 적용된건에 대해서만 지문권한 작업하자. 카드권한 적용되기 전에 지문 권한 적용되어 매칭이 안되는 경우발생

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FoodEmSeqApply(aEmSeq,
  aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update A Set ';
  stSql := stSql + ' a.CP_APPLY = ''' + aApply + ''' ';
  stSql := stSql + ' From TB_CARDPERMITEMPLOYEECODE A,';
  stSql := stSql + ' ( select * from TB_DOOR';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
  stSql := stSql + ' AND DO_FDTYPE = ''1'' ) B';   //식수전용 출입문
  stSql := stSql + ' WHERE a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
  stSql := stSql + ' AND a.CP_TYPE = ''1'' ';
  stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO ';
  stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;


function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_PermitStop(
  aEmSeq,aType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_PERMIT = ''0'', ';
  stSql := stSql + ' CP_APPLY = ''N'', ';
  stSql := stSql + ' CP_FINGERAPPLY = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' '; //aType 1.출입,2.방범
  stSql := stSql + ' AND CP_PERMIT <> ''0'' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq, aNodeNo,
  aEcuID, aExtendID, aType, aNumber, aPermit, aApply,aEmApprove: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + ' CP_APPLY = ''' + aApply + ''', ';
  stSql := stSql + ' CP_FINGERAPPLY = ''' + aApply + ''' ';
  if Isdigit(aEmApprove) then stSql := stSql + ' ,EM_APPROVE = ' + aEmApprove + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' ';
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_EmGroupCodeApply(
  aEmGroupCode, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEEGROUP set CP_APPLY = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ''' + aEmGroupCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_EmGroupLikeApply(
  aEmGroupCode, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEEGROUP set CP_APPLY = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE Like ''' + aEmGroupCode + '%'' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_IntValue(
  aEmGroupCode, aNodeNo, aEcuID, aExtendID, aType, aNumber, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEEGROUP set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aEmGroupCode <> '' then stSql := stSql + ' AND EM_GROUPCODE = ''' + aEmGroupCode + ''' ';
  if aNodeNo <> '' then stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  if aExtendID <> '' then stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  if aType <> '' then stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' '; //aType 1.출입,2.방범
  if aNumber <> '' then stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_StringValue(
  aEmGroupCode, aNodeNo, aEcuID, aExtendID, aType, aNumber, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEEGROUP set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ''' + aEmGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' '; //aType 1.출입,2.방범
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_AllMEMLOAD(aMemLoad: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMIT set ';
  stSql := stSql + ' CP_MEMLOAD = ''' + aMemLoad + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_AllRCVACK(aOldState,
  aNewState: string;aDecoderNo:string=''): Boolean;
var
  stSql : string;
begin
  if aDecoderNo = '' then
  begin
    stSql := 'Update TB_CARDPERMIT set ';
    stSql := stSql + ' CP_RCVACK = ''' + aNewState + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND CP_RCVACK = ''' + aOldState + ''' ';
  end else
  begin
    stSql := 'Update TB_CARDPERMIT set ';
    stSql := stSql + ' TB_CARDPERMIT.CP_RCVACK = ''' + aNewState + ''' ';
    stSql := stSql + ' FROM (select * from TB_NODE where ND_DECODERNO = ' + aDecoderNo + ') A ';
    stSql := stSql + ' Where TB_CARDPERMIT.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND TB_CARDPERMIT.ND_NODENO = A.ND_NODENO ';
    stSql := stSql + ' AND TB_CARDPERMIT.CP_RCVACK = ''' + aOldState + ''' ';
  end;

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_CARDRCVACK(aNodeNo, aEcuID, aExtendID,
  aCardNo, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMIT set ';
  stSql := stSql + ' CP_RCVACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_CARDRCVACKSUSCECCESS(aNodeNo, aEcuID,
  aExtendID, aCardNo, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  //수신 성공한 경우에만...
  stSql := 'Update TB_CARDPERMIT set ';
  stSql := stSql + ' CP_RCVACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND CP_RCVACK <> ''N'' ';   //전송한 후에 모니터링에서 권한 변경 한 경우에는 업데이트 하지 말자...

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_CardStop(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMIT set ';
  stSql := stSql + ' CP_PERMIT = ''0'', ';
  stSql := stSql + ' CP_RCVACK = ''N'', ';
  stSql := stSql + ' CP_MEMLOAD = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_DeviceResend(aNodeNo,
  aEcuID: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMIT set ';
  stSql := stSql + ' CP_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_Field_IntValue(aNodeNo, aEcuID,
  aExtendID, aCardNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMIT set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aNodeNo <> '' then stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  if aExtendID <> '' then stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  if aCardNo <> '' then stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aCardNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMIT set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_MEMLOAD(aOldMemLoad,
  aNewMemLoad: string;aNodeNo:string='';aEcuID:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMIT set CP_MEMLOAD = ''' + aNewMemLoad + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aOldMemLoad <> '' then stSql := stSql + ' AND CP_MEMLOAD = ''' + aOldMemLoad + ''' ';
  if aEcuID <> '' then
  begin
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + '';
    stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + '''';
  end;

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_NodeRCVACK(aNodeNo, aOldState,
  aNewState: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if isDigit(aNodeNo) then
  begin
    stSql := 'Update TB_CARDPERMIT set ';
    stSql := stSql + ' CP_RCVACK = ''' + aNewState + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND CP_RCVACK = ''' + aOldState + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    result := dmDataBase.ProcessExecSQL(stSql);

  end;


end;

function TdmDBUpdate.UpdateTB_CARDPERMIT_VALUE(aNodeNo, aEcuID, aExtendID,
  aCardNo, aPermit, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6, aDoor7,
  aDoor8, aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4, aArmArea5,
  aArmArea6, aArmArea7, aArmArea8:string;aPassword:string='';aCardType:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMIT set ';
  stSql := stSql + ' CP_PERMIT = ''' + aPermit + ''', ';
  stSql := stSql + ' CP_DOOR1 = ''' + aDoor1 + ''', ';
  stSql := stSql + ' CP_DOOR2 = ''' + aDoor2 + ''', ';
  stSql := stSql + ' CP_DOOR3 = ''' + aDoor3 + ''', ';
  stSql := stSql + ' CP_DOOR4 = ''' + aDoor4 + ''', ';
  stSql := stSql + ' CP_DOOR5 = ''' + aDoor5 + ''', ';
  stSql := stSql + ' CP_DOOR6 = ''' + aDoor6 + ''', ';
  stSql := stSql + ' CP_DOOR7 = ''' + aDoor7 + ''', ';
  stSql := stSql + ' CP_DOOR8 = ''' + aDoor8 + ''', ';
  stSql := stSql + ' CP_ARMAREA0 = ''' + aArmArea0 + ''', ';
  stSql := stSql + ' CP_ARMAREA1 = ''' + aArmArea1 + ''', ';
  stSql := stSql + ' CP_ARMAREA2 = ''' + aArmArea2 + ''', ';
  stSql := stSql + ' CP_ARMAREA3 = ''' + aArmArea3 + ''', ';
  stSql := stSql + ' CP_ARMAREA4 = ''' + aArmArea4 + ''', ';
  stSql := stSql + ' CP_ARMAREA5 = ''' + aArmArea5 + ''', ';
  stSql := stSql + ' CP_ARMAREA6 = ''' + aArmArea6 + ''', ';
  stSql := stSql + ' CP_ARMAREA7 = ''' + aArmArea7 + ''', ';
  stSql := stSql + ' CP_ARMAREA8 = ''' + aArmArea8 + ''', ';
  stSql := stSql + ' CP_RCVACK = ''N'', ';
  stSql := stSql + ' CP_MEMLOAD = ''N'' ';
  if aPassword <> '' then stSql := stSql + ', CP_PASSWD = ''' + aPassword + '''  ';
  if aCardType <> '' then stSql := stSql + ', CP_CARDTYPE = ''' + aCardType + '''  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARD_Field_IntValue(aCardNo, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARD_Field_StringValue(aCardNo, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CARD_Value(aCardNo, aCardState, aCardGubun,
  aEmSeq: string;aCardPrintNo:string=''): Boolean;
var
  stSql : string;
  stUpdateTime : string;
begin
  stUpdateTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  stSql := 'Update TB_CARD set ';
  if aCardState <> '' then stSql := stSql + ' CA_STATECODE = ''' + aCardState + ''',';
  if aCardGubun <> '' then stSql := stSql + ' CA_CARDGUBUN = ' + aCardGubun + ',';
  if aEmSeq <> '' then stSql := stSql + ' EM_SEQ = ' + aEmSeq + ',';
  if aCardPrintNo <> '' then stSql := stSql + ' CA_PRINTNO = ''' + aCardPrintNo + ''',';

  stSql := stSql + ' CA_UPDATETIME = ''' + stUpdateTime + ''',';
  stSql := stSql + ' AD_USERID = ''' + G_stAdminUserID + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CCTV_Field_StringValue(aCCTVNo, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'CT_NAME' then stSql := 'Update TB_CCTV set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_CCTV set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CT_NO = ' + aCCTVNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_COMPANYCODE_Field_IntValue(aCode, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_COMPANYCODE set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_COMPANYCODE_Field_StringValue(aCode, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if UpperCase(aFieldName) = 'CO_COMPANYNAME' then
    stSql := 'Update TB_COMPANYCODE set ' + aFieldName + ' = N''' + aData + ''' '
  else
    stSql := 'Update TB_COMPANYCODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_CONFIG_Field_StringValue(aGroup, aCode,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if UpperCase(aFieldName) = 'CO_CONFIGDETAIL' then stSql := 'Update TB_CONFIG set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_CONFIG set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aGroup + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_Decoder_Value(aDecoderNo, aServerName,
  aSocketType, aDecoderIP, aMonitoringServerPort,
  aControlerServerPort,aFTPPort: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_Decoder set ND_DECODERSOCKTYPE = ' + aSocketType + ', ';
  stSql := stSql + ' ND_DECODERNAME = N''' + aServerName + ''', ';
  stSql := stSql + ' ND_DECODERIP = ''' + aDecoderIP + ''', ';
  stSql := stSql + ' ND_DECODERDEVICEPORT = ' + aControlerServerPort + ', ';
  stSql := stSql + ' ND_DECODERCONTROLPORT = ' + aMonitoringServerPort + ', ';
  stSql := stSql + ' ND_DECORDERFTPPORT = ' + aFTPPort + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_DECODERNO = ' + aDecoderNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICERCV set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DEVICERCV_TIMECODEUSEAllChange(aOldType,
  aNewType: string;aDecoderNo:string=''): Boolean;
var
  stSql : string;
begin
  if aDecoderNo = '' then
  begin
    stSql := 'Update TB_DEVICERCV set DE_TIMECODEUSE = ''' + aNewType + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND DE_TIMECODEUSE = ''' + aOldType + ''' ';
  end else
  begin
    stSql := 'Update TB_DEVICERCV set TB_DEVICERCV.DE_TIMECODEUSE = ''' + aNewType + ''' ';
    stSql := stSql + ' FROM (select * from TB_NODE where ND_DECODERNO = ' + aDecoderNo + ') A ';
    stSql := stSql + ' Where TB_DEVICERCV.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND TB_DEVICERCV.ND_NODENO = A.ND_NODENO ';
    stSql := stSql + ' AND TB_DEVICERCV.DE_TIMECODEUSE = ''' + aOldType + ''' ';
  end;

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DEVICE_DefaultNodeDeviceName(aNodeNo,
  aNodeName: string): Boolean;
var
  stSql : string;
begin
    if (G_nDBType = MSSQL)  then
    begin
      stSql := ' Update TB_DEVICE set DE_DEVICENAME = N''' + aNodeName + ''' + ''_'' + DE_ECUID + ''_'' + CAST(DE_EXTENDID AS varchar(2)) '
    end else if (G_nDBType = MDB)  then
    begin
      stSql := ' Update TB_DEVICE set DE_DEVICENAME = ''' + aNodeName + ''' + ''_'' + DE_ECUID + ''_'' + String(DE_EXTENDID) '
    end else  stSql := ' Update TB_DEVICE set DE_DEVICENAME = ''' + aNodeName + ''' || ''_'' || DE_ECUID || ''_'' || CAST(DE_EXTENDID AS VARCHAR(2))';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND ( DE_NAMECHANGE is null or DE_NAMECHANGE = ''0'' ) ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DEVICE_DeviceUse(aNodeNo, aEcuID,aExtendID,
  aUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICE set DE_DEVICEUSE = ''' + aUse + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DEVICE_Field_IntValue(aNodeNo, aEcuID, aExtendID,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICE set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DEVICE_Field_StringValue(aNodeNo,aEcuID,aExtendID, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if UpperCase(aFieldName) = 'DE_DEVICENAME' then stSql := 'Update TB_DEVICE set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_DEVICE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aNodeNo <> '' then stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  if aExtendID <> '' then stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DEVICE_TelphoneOfficeDeviceName(aNodeNo,
  aNodeName: string): Boolean;
var
  stSql : string;
begin
    stSql := ' Update TB_DEVICE set DE_DEVICENAME = N''' + aNodeName + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''00'' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOORRCV_AllRcvAck(aFieldName,aOldState, aNewState,
  aDecoderNo: string): Boolean;
var
  stSql : string;
begin
  if aDecoderNo = '' then
  begin
    stSql := 'Update TB_DOORRCV set ' + aFieldName + ' = ''' + aNewState + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ' + aFieldName + ' = ''' + aOldState + ''' ';
  end else
  begin
    stSql := 'Update TB_DOORRCV set TB_DOORRCV.' + aFieldName + ' = ''' + aNewState + ''' ';
    stSql := stSql + ' FROM (select * from TB_NODE where ND_DECODERNO = ' + aDecoderNo + ') A ';
    stSql := stSql + ' Where TB_DOORRCV.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND TB_DOORRCV.ND_NODENO = A.ND_NODENO ';
    stSql := stSql + ' AND TB_DOORRCV.' + aFieldName + ' = ''' + aOldState + ''' ';
  end;

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aDoorNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if aData = 'Y' then
  begin
    stSql := 'Update TB_DOORRCV set ' + aFieldName + ' = ''' + aData + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
    if aDoorNo <> '' then stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
    stSql := stSql + ' AND ' + aFieldName + ' <> ''N'' '; //다른 곳에서 수신상태가 N으로 바뀐 경우에는 Y로 설정하면 안된다.
  end else
  begin
    stSql := 'Update TB_DOORRCV set ' + aFieldName + ' = ''' + aData + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
    if aDoorNo <> '' then stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  end;

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOORSCHEDULE_All(aNodeNo, aECUID, aDOORNO,
  aDayCode, a1Time, a2Time, a3Time, a4Time, a5Time, a1Mode, a2Mode, a3Mode,
  a4Mode, a5Mode, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DOORSCHEDULE set ';
  stSql := stSql + ' DS_TIME1 = ''' + a1Time + ''',';
  stSql := stSql + ' DS_TIME2 = ''' + a2Time + ''',';
  stSql := stSql + ' DS_TIME3 = ''' + a3Time + ''',';
  stSql := stSql + ' DS_TIME4 = ''' + a4Time + ''',';
  stSql := stSql + ' DS_TIME5 = ''' + a5Time + ''',';
  stSql := stSql + ' DS_TIMEMODE1 = ''' + a1Mode + ''',';
  stSql := stSql + ' DS_TIMEMODE2 = ''' + a2Mode + ''',';
  stSql := stSql + ' DS_TIMEMODE3 = ''' + a3Mode + ''',';
  stSql := stSql + ' DS_TIMEMODE4 = ''' + a4Mode + ''',';
  stSql := stSql + ' DS_TIMEMODE5 = ''' + a5Mode + ''',';
  stSql := stSql + ' DS_UPDATETIME = ''' + FormatDateTime('yyyymmddhhnnss',Now) + ''',';
  stSql := stSql + ' AD_USERID = ''' + G_stAdminUserID + ''',';
  stSql := stSql + ' DS_DEVICESYNC = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  stSql := stSql + ' AND DS_DAYCODE = ''' + aDayCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOORSCHEDULE_DoorReceive(aNodeNo, aECUID, aDOORNO,
  aRcvAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DOORSCHEDULE set ';
  stSql := stSql + ' DS_DEVICESYNC = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  if aDoorNo <> '' then stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
//  stSql := stSql + ' AND DS_DAYCODE = ''' + aDayCode + ''' ';
  if aRcvAck = 'Y' then stSql := stSql + ' AND DS_DEVICESYNC <> ''N'' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOORSCHEDULE_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aDoorNo, aDayCode, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DOORSCHEDULE set ';
  stSql := stSql + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';
  stSql := stSql + ' AND DS_DAYCODE = ''' + aDayCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOORSCHEDULE_SendStatus(aOldState,
  aNewState: string;aDecoderNo:string=''): Boolean;
var
  stSql : string;
begin
  if aDecoderNo = '' then
  begin
    stSql := ' Update TB_DOORSCHEDULE set ';
    stSql := stSql + ' DS_DEVICESYNC = ''' + aNewState + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND DS_DEVICESYNC = ''' + aOldState + ''' ';
  end else
  begin
    stSql := ' Update TB_DOORSCHEDULE set ';
    stSql := stSql + ' TB_DOORSCHEDULE.DS_DEVICESYNC = ''' + aNewState + ''' ';
    stSql := stSql + ' FROM (select * from TB_NODE where ND_DECODERNO = ' + aDecoderNo + ') A ';
    stSql := stSql + ' Where TB_DOORSCHEDULE.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND TB_DOORSCHEDULE.ND_NODENO = A.ND_NODENO ';
    stSql := stSql + ' AND TB_DOORSCHEDULE.DS_DEVICESYNC = ''' + aOldState + ''' ';

  end;

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOORTELEVENT_Field_StringValue(aDate, aTime,
  aNodeNo, aEcuID, aExtendID, aDoorNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DOORTELEVENT set ';
  stSql := stSql + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND DE_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_DOOR_AllField_StringValue(aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if UpperCase(aFieldName) = 'DO_DOORNAME' then stSql := 'Update TB_DOOR set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_DOOR set ' + aFieldName + ' = ''' + aData + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_DOOR_DefaultNodeDoorName(aNodeNo,
  aNodeName: string): Boolean;
var
  stSql : string;
begin
    if (G_nDBType = MSSQL)  then
    begin
      stSql := ' Update TB_DOOR set DO_DOORNAME = ''' + aNodeName + ''' + ''_'' + DE_ECUID + ''_'' + CAST(DO_DOORNO AS varchar(2)) '
    end else if (G_nDBType = MDB)  then
    begin
      stSql := ' Update TB_DOOR set DO_DOORNAME = ''' + aNodeName + ''' + ''_'' + DE_ECUID + ''_'' + String(DO_DOORNO) '
    end else  stSql := ' Update TB_DOOR set DO_DOORNAME = ''' + aNodeName + ''' || ''_'' || DE_ECUID || ''_'' || CAST(DO_DOORNO AS VARCHAR(2))';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND ( DO_NAMECHANGE is null or DO_NAMECHANGE = ''0'' ) ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOOR_DOORSettingInfoValue(aNodeNo, aEcuID,aExtendID,
  aDoorNo, aCardMode, aDoorMode, aControlTime, aLongOpenTime, aScheduleUse,
  aDoorState, aAntiNo, aLongOpenAlarm, aLockType, aFireOpen, aDSOpenState,
  aRemoteDisArmDoorOpen: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DOOR set DO_CONTROLTIME = ''' + aControlTime + ''', ';
  stSql := stSql + ' DO_LONGOPENTIME = ''' + aLongOpenTime + ''', ';
  stSql := stSql + ' DO_LONGOPENALARM = ''' + aLongOpenAlarm + ''', ';
  stSql := stSql + ' DO_DOORSTATE = ''' + aDoorState + ''', ';
  if aScheduleUse <> '' then stSql := stSql + ' DO_SCHEDULEUSE = ''' + aScheduleUse + ''', ';
  stSql := stSql + ' DO_FIREDOOROPEN = ''' + aFireOpen + ''', ';
  stSql := stSql + ' DO_LOCKTYPE = ''' + aLockType + ''', ';
  stSql := stSql + ' DO_DSOPENSTATE = ''' + aDSOpenState + ''', ';
  stSql := stSql + ' DO_REMOTEDISARMDOOROPEN = ''' + aRemoteDisArmDoorOpen + ''', ';
  stSql := stSql + ' AG_ANTINO = ' + aAntiNo + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOOR_Field_IntValue(aNodeNo, aEcuID, aExtendID,
  aDoorNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DOOR set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOOR_Field_StringValue(aNodeNo, aEcuID, aExtendID,
  aDoorNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'DO_DOORNAME' then stSql := 'Update TB_DOOR set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_DOOR set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aNodeNo <> '' then stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  if aExtendID <> '' then stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  if aDoorNo <> '' then stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOOR_TelphoneOfficeDoorName(aNodeNo,
  aNodeName: string): Boolean;
var
  stSql : string;
begin
    stSql := ' Update TB_DOOR set DO_DOORNAME = ''' + aNodeName + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''00'' ';
    stSql := stSql + ' AND DO_DOORNO = 1 ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_DOOR_ViewSeqInc(aViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DOOR set DO_VIEWSEQ = DO_VIEWSEQ + 1 ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DO_VIEWSEQ >= ' + aViewSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq, aNodeNo,
  aEcuID, aTimeCodeUse, aTimeGroup, aTime1, aTime2, aTime3, aTime4,
  aWeek: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEEDEVICETIMECODE set  EM_TIMECODEUSE = ''' + aTimeCodeUse + ''' ' ;
  stSql := stSql + ',TC_GROUP = ''' + aTimeGroup + ''' ';
  stSql := stSql + ',TC_TIME1 = ''' + aTime1 + ''' ';
  stSql := stSql + ',TC_TIME2 = ''' + aTime2 + ''' ';
  stSql := stSql + ',TC_TIME3 = ''' + aTime3 + ''' ';
  stSql := stSql + ',TC_TIME4 = ''' + aTime4 + ''' ';
  stSql := stSql + ',TC_WEEKCODE = ''' + aWeek + ''' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_EMPLOYEEFINGER_Field_StringValue(aEmSeq,
  aFingerSeq, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEEFINGER set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND EF_SEQ = ' + aFingerSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_EMPLOYEEFINGER_Template(aEmSeq, aFingerSeq,
  aFingerTemplate1_1, aFingerTemplate1_2, aFingerTemplate2_1,
  aFingerTemplate2_2, aFingerTemplate3_1, aFingerTemplate3_2: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEEFINGER set ';
  stSql := stSql + ' EF_TEMPLATE1_1 = ''' + aFingerTemplate1_1 + ''',';
  stSql := stSql + ' EF_TEMPLATE1_2 = ''' + aFingerTemplate1_2 + ''',';
  stSql := stSql + ' EF_TEMPLATE2_1 = ''' + aFingerTemplate2_1 + ''',';
  stSql := stSql + ' EF_TEMPLATE2_2 = ''' + aFingerTemplate2_2 + ''',';
  stSql := stSql + ' EF_TEMPLATE3_1 = ''' + aFingerTemplate3_1 + ''',';
  stSql := stSql + ' EF_TEMPLATE3_2 = ''' + aFingerTemplate3_2 + ''' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND EF_SEQ = ' + aFingerSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_EMPLOYEEGROUPCODE_Field_IntValue(aCode,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEEGROUPCODE set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ' + aCode + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_EMPLOYEEGROUPCODE_Field_StringValue(aCode,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'EM_GROUPCODENAME' then stSql := 'Update TB_EMPLOYEEGROUPCODE set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_EMPLOYEEGROUPCODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ' + aCode + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_EMPLOYEEGUBUN_Field_IntValue(aCode, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GUBUNCODE = ' + aCode + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_EMPLOYEEGUBUN_Field_StringValue(aCode, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'EM_GUBUNCODENAME' then stSql := 'Update TB_EMPLOYEEGUBUN set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_EMPLOYEEGUBUN set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GUBUNCODE = ' + aCode + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_EMPLOYEEGUBUN_ViewSeqInc(
  aViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEEGUBUN set EM_VIEWSEQ = EM_VIEWSEQ + 1 ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_VIEWSEQ >= ' + aViewSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_EMPLOYEE_ALLMEMLOAD(aMemLoad: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set EM_MEMLOAD = ''' + aMemLoad + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_EMPLOYEE_Field_IntValue(aEMSeq, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set ' + aFieldName + ' = ' + aData + ' ';
  if aEMSeq <> '' then stSql := stSql + ' Where EM_SEQ = ' + aEMSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(aEMSeq, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if (Uppercase(aFieldName) = 'EM_NAME') or (Uppercase(aFieldName) = 'EM_EMINFO') then
    stSql := 'Update TB_EMPLOYEE set ' + aFieldName + ' = N''' + aData + ''' '
  else
    stSql := 'Update TB_EMPLOYEE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEMSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_EMPLOYEE_Value(aEmSeq, aEmCode, aEmName,
  aCompanyCode, aPosiCode, aGubunCode, aCompanyPhone, aHomePhone, ahandPhone,
  aEmninfo, aRegDate, aEndDate, aACType, aATType, aFdType, aEmGroupCode,
  aGradeType,aFingerUse,aEmStateCode,aAWCode: string;aAll:Boolean;aCardUse:string;
  aRelayUse:string='0';aRelayDate:string='';aRelayCode:string='';aEmApprove:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE Set ';
  stSql := stSql + ' EM_CODE = N''' + aEmCode + '''';
  if aAll then
  begin
    stSql := stSql + ', EM_NAME = N''' + aEmName + ''' ';
    stSql := stSql + ', CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    stSql := stSql + ', PO_POSICODE = ' + aPosiCode + ' ';
    stSql := stSql + ', EM_GUBUNCODE = ' + aGubunCode + ' ';
    stSql := stSql + ', EM_COMPANYPHONE = N''' + aCompanyPhone + ''' ';
    stSql := stSql + ', EM_HOMEPHONE = ''' + aHomePhone + ''' ';
    stSql := stSql + ', EM_HANDPHONE = ''' + ahandPhone + ''' ';
    stSql := stSql + ', EM_EMINFO = N''' + aEmninfo + ''' ';
    stSql := stSql + ', EM_REGDATE = ''' + aRegDate + ''' ';
    stSql := stSql + ', EM_ENDDATE = ''' + aEndDate + ''' ';
    stSql := stSql + ', EM_ACUSE = ''' + aACType + ''' ';
    stSql := stSql + ', EM_ATUSE = ''' + aATType + ''' ';
    stSql := stSql + ', EM_FDUSE = ''' + aFdType + ''' ';
    stSql := stSql + ', EM_GROUPCODE = ''' + aEmGroupCode + ''' ';
    stSql := stSql + ', EM_GRADETYPE = ' + aGradeType + ' ';
    stSql := stSql + ', EM_FINGERUSE = ''' + aFingerUse + ''' ';
    stSql := stSql + ', EM_STATECODE = ' + aEmStateCode + ' ';
    stSql := stSql + ', AW_CODE = ' + aAWCode + ' ';
    //if Not isDigit(aCardUse) then aCardUse := '0';
    if aCardUse <> '' then stSql := stSql + ', EM_CARDUSE = ' + aCardUse + ' ';
    stSql := stSql + ', EM_RELAYUSE = ' + aRelayUse + ' ';
    stSql := stSql + ', EM_RELAYDATE = ''' + aRelayDate + ''' ';
    stSql := stSql + ', EM_RELAYCODE = ''' + aRelayCode + ''' ';
    if isDigit(aEmApprove) then stSql := stSql + ', EM_APPROVE = ' + aEmApprove + ' ';
  end else
  begin
    if aEmName <> ''  then stSql := stSql + ', EM_NAME = N''' + aEmName + ''' ';
    if aCompanyCode <> ''  then stSql := stSql + ', CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    if aPosiCode <> ''  then stSql := stSql + ', PO_POSICODE = ' + aPosiCode + ' ';
    if aGubunCode <> ''  then stSql := stSql + ', EM_GUBUNCODE = ' + aGubunCode + ' ';
    if aCompanyPhone <> ''  then stSql := stSql + ', EM_COMPANYPHONE = N''' + aCompanyPhone + ''' ';
    if aHomePhone <> ''  then stSql := stSql + ', EM_HOMEPHONE = ''' + aHomePhone + ''' ';
    if ahandPhone <> ''  then stSql := stSql + ', EM_HANDPHONE = ''' + ahandPhone + ''' ';
    if aEmninfo <> ''  then stSql := stSql + ', EM_EMINFO = N''' + aEmninfo + ''' ';
    if aRegDate <> ''  then stSql := stSql + ', EM_REGDATE = ''' + aRegDate + ''' ';
    if aEndDate <> ''  then stSql := stSql + ', EM_ENDDATE = ''' + aEndDate + ''' ';
    if aACType <> ''  then stSql := stSql + ', EM_ACUSE = ''' + aACType + ''' ';
    if aATType <> ''  then stSql := stSql + ', EM_ATUSE = ''' + aATType + ''' ';
    if aFdType <> ''  then stSql := stSql + ', EM_FDUSE = ''' + aFdType + ''' ';
    if aEmGroupCode <> ''  then stSql := stSql + ', EM_GROUPCODE = ''' + aEmGroupCode + ''' ';
    if aGradeType <> ''  then stSql := stSql + ', EM_GRADETYPE = ' + aGradeType + ' ';
  {  if aTimeCodeUse <> ''  then stSql := stSql + ', EM_TIMECODEUSE = ''' + aTimeCodeUse + ''' ';
    if aTimeGroup <> ''  then stSql := stSql + ', TC_GROUP = ''' + aTimeGroup + ''' ';
    if aTime1 <> ''  then stSql := stSql + ', TC_TIME1 = ''' + aTime1 + ''' ';
    if aTime2 <> ''  then stSql := stSql + ', TC_TIME2 = ''' + aTime2 + ''' ';
    if aTime3 <> ''  then stSql := stSql + ', TC_TIME3 = ''' + aTime3 + ''' ';
    if aTime4 <> ''  then stSql := stSql + ', TC_TIME4 = ''' + aTime4 + ''' ';
    if aWeekCode <> ''  then stSql := stSql + ', TC_WEEKCODE = ''' + aWeekCode + ''' ';}
    if aFingerUse <> ''  then stSql := stSql + ', EM_FINGERUSE = ''' + aFingerUse + ''' ';
    if aEmStateCode <> ''  then stSql := stSql + ', EM_STATECODE = ' + aEmStateCode + ' ';
    if aAWCode <> ''  then stSql := stSql + ', AW_CODE = ' + aAWCode + ' ';
    if aCardUse <> '' then stSql := stSql + ', EM_CARDUSE = ' + aCardUse + ' ';
    if aRelayUse <> '' then stSql := stSql + ', EM_RELAYUSE = ' + aRelayUse + ' ';
    if aRelayDate <> '' then stSql := stSql + ', EM_RELAYDATE = ''' + aRelayDate + ''' ';
    if aRelayCode <> '' then stSql := stSql + ', EM_RELAYCODE = ''' + aRelayCode + ''' ';
    if isDigit(aEmApprove) then stSql := stSql + ', EM_APPROVE = ' + aEmApprove + ' ';
  end;
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FINGERDEVICECARD_Field_StringValue(aFnSeq,
  aCardPOSITIONNUM, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FINGERDEVICECARD set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ = ' + aFnSeq + ' ';
  stSql := stSql + ' AND CA_POSITIONNUM = ' + aCardPOSITIONNUM + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FINGERDEVICECARD_Resend(aFnSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FINGERDEVICECARD set FD_SEND = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ = ' + aFnSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_FINGERDEVICECARD_Value(aFnSeq, aCardPOSITIONNUM,
  aEMSEQ,aPermit, aSend: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FINGERDEVICECARD set ';
  stSql := stSql + ' EM_SEQ = ' + aEMSEQ + ',';
  stSql := stSql + ' CP_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + ' FD_SEND = ''' + aSend + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ = ' + aFnSeq + ' ';
  stSql := stSql + ' AND CA_POSITIONNUM = ' + aCardPOSITIONNUM + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_FINGERDEVICE_Value(aFnSeq, aDeviceIP, aDeviceName,
  aPort, aDeviceType, aCPType, aNodeNo, aEcuID, aExtendID,
  aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FINGERDEVICE set ';
  stSql := stSql + ' FN_DEVICEIP = ''' + aDeviceIP + ''',';
  stSql := stSql + ' FN_DEVICENAME = N''' + aDeviceName + ''',';
  if aPort <> '' then stSql := stSql + ' FN_DEVICEPORT = ''' + aPort + ''',';
  stSql := stSql + ' FN_DEVICETYPE = ' + aDeviceType + ',';
  stSql := stSql + ' CP_TYPE = ''' + aCPType + ''',';
  stSql := stSql + ' ND_NODENO = ' + aNodeNo + ',';
  stSql := stSql + ' DE_ECUID = ''' + aEcuID + ''',';
  stSql := stSql + ' DE_EXTENDID = ' + aExtendID + ',';
  stSql := stSql + ' DO_DOORNO = ' + aDoorNo + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ = ' + aFnSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FIREGROUP_Field_StringValue(aCode, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if (Uppercase(aFieldName) = 'FG_GROUPCODENAME') then stSql := 'Update TB_FIREGROUP set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_FIREGROUP set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FG_GROUPCODE = ''' + aCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FOODCODECOUNT_AddCount(aDATE, aFDTYPE,
  aFOCODE: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODCODECOUNT set FC_COUNT = FC_COUNT + 1 ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FC_DATE = ''' + aDATE + ''' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + aFDTYPE + ''' ';
  stSql := stSql + ' AND FO_CODE = ' + aFOCODE + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FOODCODE_VALUE(aFdType, aCode, aName, aStartTime,
  aEndTime, aAmt,aFoodOutTime: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODCODE set FO_NAME = N''' + aName + ''' ';
  if isDigit(aStartTime) then stSql := stSql + ' ,FO_STARTTIME = ''' + aStartTime + ''' ';
  if isDigit(aEndTime) then stSql := stSql + ' ,FO_ENDTIME = ''' + aEndTime + ''' ';
  if isDigit(aAmt) then stSql := stSql + ' ,FO_AMT = ' + aAmt + ' ';
  if isDigit(aFoodOutTime) then stSql := stSql + ' ,FO_INITTIME = ''' + aFoodOutTime + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + aFdType + ''' ';
  stSql := stSql + ' AND FO_CODE = ' + aCode + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_FOODEVENT_Field_StringValue(aFEDATE, aFETIME,
  aEMSEQ, aNDNODENO, aDEECUID, aREREADERNO, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODEVENT set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FE_DATE = ''' + aFEDATE + ''' ';
  stSql := stSql + ' AND FE_TIME = ''' + aFETIME + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEMSEQ + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNDNODENO + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aDEECUID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ' + aREREADERNO + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FOODEVENT_Summary_Ready: Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODEVENT set FE_FDSUMMARY = ''R'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND (FE_FDSUMMARY is Null OR FE_FDSUMMARY = ''N'' )';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FOODGROUP_Field_StringValue(aCode, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODGROUP set ' + aFieldName + ' = N''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FG_CODE = ' + aCode + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FOODOUTCOUNT_AddCount(aFdDate, aFdType,
  aFdCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODOUTCOUNT set FC_COUNT = FC_COUNT + 1 ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FC_DATE = ''' + aFdDate + ''' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + aFdType + ''' ';
  stSql := stSql + ' AND FO_CODE = ''' + aFdCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FOODOUTCOUNT_Field_IntValue(aFdDate, aFdType,
  aFdCode, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODOUTCOUNT set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FC_DATE = ''' + aFdDate + ''' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + aFdType + ''' ';
  stSql := stSql + ' AND FO_CODE = ''' + aFdCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FOODOUTCOUNT_Field_StringValue(aFdDate,aFdType,aFdCode,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODOUTCOUNT set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FC_DATE = ''' + aFdDate + ''' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + aFdType + ''' ';
  stSql := stSql + ' AND FO_CODE = ''' + aFdCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FOODTYPE_Field_StringValue(aFdType, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if (Uppercase(aFieldName) = 'RE_FDTYPENAME') then stSql := 'Update TB_FOODTYPE set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_FOODTYPE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + aFdType + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FORMCRITICAL_Field_IntValue(aID, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FORMCRITICAL set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FC_CRITICALID = ' + aID + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FORMMESSAGE_Name(aMESSAGECODE,
  aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_FORMMESSAGE set FM_MESSAGENAME' + inttostr(G_nFormLanguageType) + ' = N''' + aName + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FM_MESSAGECODE = ''' + aMESSAGECODE + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_FORMNAME_Name(aPROGRAMGUBUN, aNAMECODE,
  aMENUGUBUN, aMENUGROUP, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_FORMNAME set FN_NAME' + inttostr(G_nFormLanguageType) + ' = N''' + aName + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + aPROGRAMGUBUN + ''' ';
  stSql := stSql + ' AND FN_NAMECODE = ''' + aNAMECODE + ''' ';
  stSql := stSql + ' AND FN_MENUGUBUN = ' + aMENUGUBUN + ' ';
  stSql := stSql + ' AND FN_MENUGROUP = ' + aMENUGROUP + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_GUESTLIST_Field_IntValue(aGlSeq, aFieldName,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_GUESTLIST set ' + aFieldName + ' = ' + aValue + ' ';
  stSql := stSql + ' Where GL_SEQ = ' + aGlSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_GUESTLIST_Field_StringValue(aGlSeq, aFieldName,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_GUESTLIST set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' Where GL_SEQ = ' + aGlSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_GUESTLIST_Value(aGlSeq, aEmName, aStartDate,
  aEndDate, aCompanyName, aHandPhone, aChangeFlag: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_GUESTLIST set GL_NAME = N''' + aEmName + ''', ';
  stSql := stSql + ' GL_FROMTIME = ''' + aStartDate + ''', ';
  stSql := stSql + ' GL_TOTIME = ''' + aEndDate + ''', ';
  stSql := stSql + ' GL_COMPANYNAME = N''' + aCompanyName + ''', ';
  stSql := stSql + ' GL_TELNUMBER = ''' + aHandPhone + ''', ';
  stSql := stSql + ' GL_CHANGEFLAG = ''' + aChangeFlag + ''' ';
  stSql := stSql + ' Where GL_SEQ = ' + aGlSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(aYear,aStatus,
  aSendStatus: string;aDecoderNo:string=''): Boolean;
var
  stSql : string;
begin
  if aDecoderNo = '' then
  begin
    stSql := 'Update TB_HOLIDAYDEVICE set HD_SEND = ''' + aSendStatus + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    if aStatus <> '' then stSql := stSql + ' AND HD_SEND = ''' + aStatus + ''' ';
    if G_nDBTYPE = FIREBIRD then
      stSql := stSql + ' AND SUBSTRING(HO_DAY from 1 for 4) = ''' + aYear + ''' '
    else if G_nDBTYPE = MDB then
      stSql := stSql + ' AND Left(HO_DAY,1,4) = ''' + aYear + ''' '
    else if G_nDBTYPE = Postgresql then
      stSql := stSql + ' AND substr(HO_DAY,1,4) = ''' + aYear + ''' '
    else
      stSql := stSql + ' AND SUBSTRING(HO_DAY,1,4) = ''' + aYear + ''' ';
  end else
  begin
    stSql := 'Update TB_HOLIDAYDEVICE set TB_HOLIDAYDEVICE.HD_SEND = ''' + aSendStatus + ''' ';
    stSql := stSql + ' FROM (select * from TB_NODE where ND_DECODERNO = ' + aDecoderNo + ') A ';
    stSql := stSql + ' Where TB_HOLIDAYDEVICE.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND TB_HOLIDAYDEVICE.ND_NODENO = A.ND_NODENO ';
    if aStatus <> '' then stSql := stSql + ' AND TB_HOLIDAYDEVICE.HD_SEND = ''' + aStatus + ''' ';
    if G_nDBTYPE = FIREBIRD then
      stSql := stSql + ' AND SUBSTRING(TB_HOLIDAYDEVICE.HO_DAY from 1 for 4) = ''' + aYear + ''' '
    else if G_nDBTYPE = MDB then
      stSql := stSql + ' AND Left(TB_HOLIDAYDEVICE.HO_DAY,1,4) = ''' + aYear + ''' '
    else if G_nDBTYPE = Postgresql then
      stSql := stSql + ' AND substr(TB_HOLIDAYDEVICE.HO_DAY,1,4) = ''' + aYear + ''' '
    else
      stSql := stSql + ' AND SUBSTRING(TB_HOLIDAYDEVICE.HO_DAY,1,4) = ''' + aYear + ''' ';

  end;

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_HOLIDAYDEVICE_DayDelete(aDate: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_HOLIDAYDEVICE set HD_USE = ''0'', ';
  stSql := stSql + ' HD_SEND = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND HO_DAY = ''' + aDate + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_HOLIDAYDEVICE_DaySendStatus(aNodeNo, aEcuID, aDay,
  aUse, aSendStatus: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_HOLIDAYDEVICE set HD_SEND = ''' + aSendStatus + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND HO_DAY = ''' + aDay + ''' ';
  stSql := stSql + ' AND HD_USE = ''' + aUse + ''' ';
  if aSendStatus = 'Y' then
  begin
    stSql := stSql + ' AND HD_SEND <> ''N'' ';
  end;

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_HOLIDAYDEVICE_DeviceYearSendStatus(aNodeNo,
  aEcuID, aYear, aSendStatus: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_HOLIDAYDEVICE set HD_SEND = ''' + aSendStatus + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  if G_nDBTYPE = FIREBIRD then
    stSql := stSql + ' AND SUBSTRING(HO_DAY from 1 for 4) = ''' + aYear + ''' '
  else if G_nDBTYPE = MDB then
    stSql := stSql + ' AND Left(HO_DAY,1,4) = ''' + aYear + ''' '
  else if G_nDBTYPE = Postgresql then
    stSql := stSql + ' AND substr(HO_DAY,1,4) = ''' + aYear + ''' '
  else
    stSql := stSql + ' AND SUBSTRING(HO_DAY,1,4) = ''' + aYear + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_HOLIDAYDEVICE_Field_IntValue(aNodeNo, aEcuID,
  aDate, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_HOLIDAYDEVICE set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aNodeNo <> '' then stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  if aDate <> '' then stSql := stSql + ' AND HO_DAY = ''' + aDate + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_HOLIDAYDEVICE_Field_StringValue(aNodeNo, aEcuID,
  aDate, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_HOLIDAYDEVICE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND HO_DAY = ''' + aDate + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_HOLIDAY_Field_IntValue(aDate, aFieldName,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_HOLIDAY set ' + aFieldName + ' = ' + aValue + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aDate <> '' then stSql := stSql + ' AND HO_DAY = ''' + aDate + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_HOLIDAY_Value(aDate, aName, aACType,
  aATType,aHoType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_HOLIDAY set HO_NAME' + inttostr(G_nFormLanguageType) + ' = N''' + aName + ''', ';
  stSql := stSql + ' HO_ACUSE = ''' + aACType + ''',';
  stSql := stSql + ' HO_ATUSE = ''' + aATType + ''',';
  stSql := stSql + ' HO_TYPE = ' + aHoType + '';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND HO_DAY = ''' + aDate + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_NODERCV_Field_StringValue(aNodeNo, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_NODERCV set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_NODE_AllMemLoadInit(aState: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_NODE set ND_MEMLOAD = ''' + aState + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_NODE_Field_IntValue(aNodeNo, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_NODE set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_NODE_Field_StringValue(aNodeNo, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin

  if (Uppercase(aFieldName) = 'ND_NODENAME') then stSql := 'Update TB_NODE set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_NODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_NODE_NodeIP(aNodeNo, aNodeIp,
  aNodeName,aServerNo: string;aDeviceType:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_NODE set ' ;
  if aNodeName <> '' then stSql := stSql + ' ND_NODENAME = ''' + aNodeName + ''', ';
  stSql := stSql + ' ND_NODEIP = ''' + aNodeIp + '''  ';
  if isDigit(aServerNo) then stSql := stSql + ' ,ND_DECODERNO = ' + aServerNo + '  ';
  stSql := stSql + ' ,ND_MEMLOAD = ''N'' ';
  if isDigit(aDeviceType) then stSql := stSql + ' ,ND_DEVICETYPE = ' + aDeviceType + '  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_NODE_TelphoneOfficeNodeIP(aNodeNo, aNodeIp,
  aNodeName, aDeviceType, aServerNo, aBuildingCode, aTelNumber, aAddr,
  aAddDate: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_NODE set ND_NODENAME = ''' + aNodeName + ''', ';
  stSql := stSql + ' ND_NODEIP = ''' + aNodeIp + '''  ';
  stSql := stSql + ' ,ND_DEVICETYPE = ' + aDeviceType + '  ';
  stSql := stSql + ' ,ND_DECODERNO = ' + aServerNo + '  ';
  stSql := stSql + ' ,BC_BUILDINGCODE = ''' + aBuildingCode + '''  ';
  stSql := stSql + ' ,ND_TELNUM = ''' + aTelNumber + '''  ';
  stSql := stSql + ' ,ND_ADDR = ''' + aAddr + '''  ';
  stSql := stSql + ' ,ND_ADDDATE = ''' + aAddDate + '''  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_POSICODE_Field_StringValue(aPosiCode, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'PO_POSICODENAME' then stSql := 'Update TB_POSICODE set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_POSICODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ''' + aPosiCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_READERRCV_AllRCVACK(aFieldName, aOldState,
  aNewState, aDecoderNo: string): Boolean;
var
  stSql : string;
begin
  if aDecoderNo = '' then
  begin
    stSql := 'Update TB_READERRCV set ' + aFieldName + ' = ''' + aNewState + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ' + aFieldName + ' = ''' + aOldState + ''' ';
  end else
  begin
    stSql := 'Update TB_READERRCV set TB_READERRCV.' + aFieldName + ' = ''' + aNewState + ''' ';
    stSql := stSql + ' FROM (select * from TB_NODE where ND_DECODERNO = ' + aDecoderNo + ') A ';
    stSql := stSql + ' Where TB_READERRCV.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND TB_READERRCV.ND_NODENO = A.ND_NODENO ';
    stSql := stSql + ' AND TB_READERRCV.' + aFieldName + ' = ''' + aOldState + ''' ';
  end;

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_READERRCV_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aReaderNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_READERRCV set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND RE_READERNO = ' + aReaderNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_READER_DefaultNodeReaderName(aNodeNo,
  aNodeName: string): Boolean;
var
  stSql : string;
begin
    if (G_nDBType = MSSQL)  then
    begin
      stSql := ' Update TB_READER set RE_READERNAME = N''' + aNodeName + ''' + ''_'' + DE_ECUID + ''_'' + CAST(RE_READERNO AS varchar(2)) '
    end else if (G_nDBType = MDB)  then
    begin
      stSql := ' Update TB_READER set RE_READERNAME = ''' + aNodeName + ''' + ''_'' + DE_ECUID + ''_'' + String(RE_READERNO) '
    end else  stSql := ' Update TB_READER set RE_READERNAME = ''' + aNodeName + ''' || ''_'' || DE_ECUID || ''_'' || CAST(RE_READERNO AS VARCHAR(2))';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND ( RE_NAMECHANGE is null or RE_NAMECHANGE = ''0'' ) ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_READER_Field_IntValue(aNodeNo, aEcuID, aExtendID,
  aReaderNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_READER set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND RE_READERNO = ' + aReaderNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_READER_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aReaderNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if (Uppercase(aFieldName) = 'RE_READERNAME') then stSql := 'Update TB_READER set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_READER set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND RE_READERNO = ' + aReaderNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;


function TdmDBUpdate.UpdateTB_TIMECODEDEVICE_Field_StringValue(aNodeNo, aEcuID,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_TIMECODEDEVICE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_TIMECODEDEVICE_SendStatus(aOldState,
  aNewState: string;aDecoderNo:string=''): Boolean;
var
  stSql : string;
begin
  if aDecoderNo = '' then
  begin
    stSql := ' Update TB_TIMECODEDEVICE set ';
    stSql := stSql + ' TC_SEND = ''' + aNewState + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND TC_SEND = ''' + aOldState + ''' ';
  end else
  begin
    stSql := ' Update TB_TIMECODEDEVICE set ';
    stSql := stSql + ' TB_TIMECODEDEVICE.TC_SEND = ''' + aNewState + ''' ';
    stSql := stSql + ' FROM (select * from TB_NODE where ND_DECODERNO = ' + aDecoderNo + ') A ';
    stSql := stSql + ' Where TB_TIMECODEDEVICE.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND TB_TIMECODEDEVICE.ND_NODENO = A.ND_NODENO ';
    stSql := stSql + ' AND TB_TIMECODEDEVICE.TC_SEND = ''' + aOldState + ''' ';
  end;

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ZONEEXTENTIONRCV_Field_StringValue(aNodeNo,
  aEcuID, aExtendID, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ZONEEXTENTIONRCV set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ZONEEXTENTION_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin

  if (Uppercase(aFieldName) = 'ZE_EXTENTIONNAME') then stSql := 'Update TB_ZONEEXTENTION set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_ZONEEXTENTION set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBUpdate.UpdateTB_ZONERCV_Field_StringValue(aNodeNo, aEcuID,
  aExtendID, aZoneNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ZONERCV set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND ZN_ZONENO = ' + aZoneNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ZONE_DefaultNodeZoneName(aNodeNo,
  aNodeName: string): Boolean;
var
  stSql : string;
begin
    if (G_nDBType = MSSQL)  then
    begin
      stSql := ' Update TB_ZONE set ZN_ZONENAME = N''' + aNodeName + ''' + ''_'' + DE_ECUID + ''_'' + CAST(DE_EXTENDID AS varchar(2)) + ''_'' + CAST(ZN_ZONENO AS varchar(2)) '
    end else if (G_nDBType = MDB)  then
    begin
      stSql := ' Update TB_ZONE set ZN_ZONENAME = ''' + aNodeName + ''' + ''_'' + DE_ECUID + ''_'' + String(DE_EXTENDID) + ''_'' + String(ZN_ZONENO) '
    end else  stSql := ' Update TB_ZONE set ZN_ZONENAME = ''' + aNodeName + ''' || ''_'' || DE_ECUID || ''_'' || CAST(DE_EXTENDID AS VARCHAR(2)) || ''_'' || CAST(ZN_ZONENO AS VARCHAR(2))';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND ( ZN_NAMECHANGE is null or ZN_NAMECHANGE = ''0'' ) ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ZONE_Field_IntValue(aNodeNo, aEcuID, aExtendID,
  aZoneNo, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ZONE set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND ZN_ZONENO = ' + aZoneNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ZONE_Field_StringValue(aNodeNo, aEcuID, aExtendID,aZoneNo,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if Uppercase(aFieldName) = 'ZN_ZONENAME' then stSql := 'Update TB_ZONE set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_ZONE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND ZN_ZONENO = ' + aZoneNo + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateTB_ZONE_TelphoneOfficeZoneName(aNodeNo,
  aNodeName: string): Boolean;
var
  stSql : string;
begin
    if (G_nDBType = MSSQL)  then
    begin
      stSql := ' Update TB_ZONE set ZN_ZONENAME = N''' + aNodeName + ''' + ''_'' + CAST(DE_EXTENDID AS varchar(2)) + ''_'' + CAST(ZN_ZONENO AS varchar(2)) '
    end else if (G_nDBType = MDB)  then
    begin
      stSql := ' Update TB_ZONE set ZN_ZONENAME = ''' + aNodeName + ''' + ''_'' + String(DE_EXTENDID) + ''_'' + String(ZN_ZONENO) '
    end else  stSql := ' Update TB_ZONE set ZN_ZONENAME = ''' + aNodeName + ''' || ''_'' || CAST(DE_EXTENDID AS VARCHAR(2)) || ''_'' || CAST(ZN_ZONENO AS VARCHAR(2))';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND ( ZN_NAMECHANGE is null or ZN_NAMECHANGE = ''0'' ) ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBUpdate.UpdateVW_APPROVE_LABOR_Field_StringValue(aJUMIN_NO,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update VW_APPROVE_LABOR set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where JUMIN_NO = ''' + aJUMIN_NO + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

end.
