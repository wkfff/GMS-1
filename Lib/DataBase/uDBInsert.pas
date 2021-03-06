unit uDBInsert;

interface

uses
  System.SysUtils, System.Classes,Vcl.Clipbrd,JclMime;

type
  TdmDBInsert = class(TDataModule)
  private
    { Private declarations }
  public

    { Public declarations }
    Function InsertIntoTB_ACademyAttendMakeupLesson_Value(aDate,aEmSeq,aSeq,aMaktLessonTime:string):Boolean;
    Function InsertIntoTB_ACademyAttendSummary_Value(aDate,aEmSeq,aInTime,aOutTime,aType:string):Boolean;
    Function InsertIntoTB_ACademyAttend_Value(aDate,aEmSeq,aInTime,aOutTime,aInOperator,aOutOperator:string):Boolean;
    Function InsertIntoTB_CertificatePassGrade_Value(aCode,aName:string):Boolean;
    Function InsertIntoTB_AcademySMSMessage_Value(aGubun,aAtGubun,aMessage:string):Boolean;
    function InsertIntoTB_ACademySMSSend_Value(aDate,aEmSeq,aGubun,aAtGubun,aPhoneNum,aSMSMessage,aSendState,aInsertDate:string):Boolean;
    Function InsertIntoTB_ACCESSCARDMODE_All(aCardMode,aCardModeName1,aCardModeName2:string;aCardModeName3:string=''):Boolean;
    Function InsertIntoTB_ACCESSCONTROLTYPE_All(aControlType,aControlTypeName1,aControlTypeName2:string;aControlTypeName3:string=''):Boolean;
    Function InsertIntoTB_ACCESSDOORMODE_All(aDoorMode,aDoorModeName1,aDoorModeName2:string;aDoorModeName3:string=''):Boolean;
    Function InsertIntoTB_ACCESSEVENT_All(aDate,aTime,aNodeNo,aEcuID,aExtendID,aDoorNo,aCardNo,aReaderNo,aButton,aDoorPosition,aBuildingPosition,aControlType,
                   aDoorMode,aCardMode,aPermitCode,aArmAreaNo,aCompanyCode,aEmSeq,aEmCode,aEmName,aUserID,aInserTime,aATCheck,aFDCheck:string;aPrintNo:string=''):Boolean;
    Function InsertIntoTB_ACCESSPERMITCODE_All(aPermitCode,aPermitCodeName1,aPermitCodeName2:string;aPermitCodeName3:string=''):Boolean;
    Function InsertIntoTB_ADMIN_Academy(aUserID,aUserPw,aUserName,aMaster,aAdminClassCode,aCompanyCode,aBuildingCode,aBuildingType,aEmGroupCode,aHandPhone,aEmail,aEtc:string):Boolean;
    Function InsertIntoTB_ADMIN_All(aUserID,aUserPw,aUserName,aMaster,aAdminClassCode,aCompanyCode,aBuildingCode,aBuildingType,aEmGroupCode:string):Boolean;
    Function InsertIntoTB_ADMINDEVICE_Value(aUserID,aTYPE_DOOR,aNodeNo,aECUID,aExtendID,aNo:string):Boolean;
    Function InsertIntoTB_ADMINGRADE_All(aCode,aName:string):Boolean;
    Function InsertIntoTB_ADMINGRADEPROGRAM_Value(aGradeCode,aProgramGubun,aProgramID,aMenuGubun,aInsert,aUpdate,aDelete,aUserID,aTime:string):Boolean;
    Function InsertIntoTB_ADMINWORKLOG_All(aDate,aTime,aPcIP,aUserID,aFormCode,aType,aNodeNo,aEcuID,aExtendID,aNumber,aCardNo,aLogData:string):Boolean;
    Function InsertIntoTB_ALARMDEVICETYPE_All(aCode,aName:string):Boolean;
    Function InsertIntoTB_ALARMEVENT_All(aDate,aTime,aNodeNo,aEcuID,aExtendID,aMsgNo,aAlarmDeviceType,aSubAddr,aArmAreaNo,aArmMode,aPortNo,aPortState,
                   aEventStateCode,aEventPCCode,aOperator,aArmModeChange,aView,aSound,aColor,aInsertTime:string):Boolean;
    Function InsertIntoTB_ALARMEVENTOPERMODECHANGE_All(aOperator,aAlarmState,aChangeCode:string):Boolean;
    Function InsertIntoTB_ALARMEVENTSTATECODE_All(aCode,aCodeName1,aCodeName2,aDevice,aArmType,aZonState,aOper:string;aCodeName3:string=''):Boolean;
    Function InsertIntoTB_ALARMEVENTSTATEGROUP_All(aCode,aCodeName1,aCodeName2:string;aCodeName3:string=''):Boolean;
    Function InsertIntoTB_ALARMEVENTSTATEPCCODE_All(aCode,aCodeName1,aCodeName2,aAlarmCode,aAlarmGroupCode,aModeChange,aView,aSound,aColor:string;aCodeName3:string=''):Boolean;
    Function InsertIntoTB_ALARMMODECODE_All(aCode,aCodeName1,aCodeName2:string;aCodeName3:string=''):Boolean;
    Function InsertIntoTB_ALARMPORTSTATE_All(aCode,aCodeName1,aCodeName2:string;aCodeName3:string=''):Boolean;
    Function InsertIntoTB_ANTIGROUPCODE_All(aCode,aName,aAntiNo: string):Boolean;
    Function InsertIntoTB_ARMAREA_DeviceARMAREAInit(aNodeNo,aEcuID,aArmAreaNo,aArmAreaName:string;aArmAreaUse:string='0';aArmAreaView:string='0';aBuildingCode:string='0' ):Boolean;
    Function InsertIntoTB_ATTENDCODE_VALUE(aAWCode,aCode,aName,aYesterDayTime,aWorkStartTime,aWorkEndTime,aInFromTime,aInToTime,aExtendTime,aNightTime,aNormalAdd,aEarlyAdd,aJigakAdd,aJotaeAdd,aExtendAdd,aNightAdd,
             aSWorkStartTime,aSWorkEndTime,aSInFromTime,aSInToTime,aSExtendTime,aSNightTime,aSNormalAdd,aSEarlyAdd,aSJigakAdd,aSJotaeAdd,aSExtendAdd,aSNightAdd,
             aHWorkStartTime,aHWorkEndTime,aHInFromTime,aHInToTime,aHExtendTime,aHNightTime,aHNormalAdd,aHEarlyAdd,aHJigakAdd,aHJotaeAdd,aHExtendAdd,aHNightAdd,aOutRange,aSoutRange,aHoutRange:string ):Boolean;
    Function InsertIntoTB_ATTENDEVENT_InWork(aDate, aEmSeq,aEmCode,aEmName, aCompanyCode, aAWCode, aATCode, aWeekCode, aWorkStartTime,aWorkEndTime, aInWorkTime, aInWorkCount:string):Boolean;
    Function InsertIntoTB_ATTENDEVENT_OutWork(aDate, aEmSeq,aEmCode,aEmName, aCompanyCode, aAWCode, aATCode, aWeekCode, aWorkStartTime,aWorkEndTime, aOutWorkTime, aOutWorkCount:string):Boolean;
    Function InsertIntoTB_ATTENDEVENT_WorkIn(aDate,aEmSeq,aEmCode,aEmName,aCompanyCode,aAWCode,aATCode,aWeekCode,aWorkStartTime,aWorkEndTime,aATInTime,aATINResult,aWorkCount,aJiGakCount:string):Boolean;
    Function InsertIntoTB_ATTENDEVENT_WorkOut(aDate, aEmSeq,aEmCode,aEmName, aCompanyCode, aAWCode, aATCode, aWeekCode, aWorkStartTime,aWorkEndTime, aOutTime, aOutResult,aBeforWorkMM,aWorkMM,aExtendWorkMM,aNightWorkMM,aBeforWorkCount,aWorkCount,aJotaeCount,aExtendWorkCount,aNightWorkCount:string):Boolean;
    Function InsertIntoTB_ATTENDEVENTLIST_Work(aDate,aEmSeq,aInOutType,aEmCode,aEmName, aCompanyCode, aInResult, aInTime,aNodeNo,aEcuID,aExtendID,aDoorNo,aReaderNo,aBUTTON,aDeviceType:string):Boolean;
    Function InsertIntoTB_ATTENDFILEFORMAT_Value(aSeq,aUse,aName,aLen,aChar,aDateFormat,aFrontRear,aWorkIn,aWorkOut,aBusinessIn,aBusinessOut:string):Boolean;
    Function InsertIntoTB_ATTENDINOUTCODE_Value(aCode,aInoutType,aResultType,aName,aSystem:string):Boolean;
    Function InsertIntoTB_ATTENDPOSITION_VALUE(aCode,aName,aDeviceType,aStartButton,aOffButton, aInoutDeviceType, aWorkOutButton, aWorkInButton:string ):Boolean;
    Function InsertIntoTB_ATTENDWORKTYPE_VALUE(aCode,aName,aNotBackupType,aSaturdayType,aFixATType:string ):Boolean;
    Function InsertIntoTB_BMSCONFIG_All(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aDetail:string=''):Boolean;
    Function InsertIntoTB_BUILDINGCODE_All(aCode,aCodeName,aSeq,aUsed,aViewSeq:string):Boolean;
    Function InsertIntoTB_BUILDINGMAP_Code(aBuildingCode,aType,aDeepSeq:string):Boolean;
    Function InsertIntoTB_CARD_Value(aCardNo,aCardState,aCardGubun,aPositionNum,aRelayID,aGradeUse,aEmSeq:string;aCardPrintNo:string=''):Boolean;
    Function InsertIntoTB_CARDBUTTONEVENTSTAT_Init(aDate,aNodeNo,aEcuID,aExtendID,aDoorNo:string):Boolean;
    Function InsertIntoTB_CARDDELETEEVENT_Complete(aYear,aWeekDay,aWeek,aData:string):Boolean;
    Function InsertIntoTB_CARDDELETEHISTORY_Value(aDate,aEmSeq,aOldDate,aNewDate:string):Boolean;
    Function InsertIntoTB_CARDFTPDOWNLIST_Value(aNodeNo,aEcuID,aProgress,aRcvAck,aRetryCount:string):Boolean;
    Function InsertIntoTB_CARDGUBUN_All(aCode,aCodeName,aRelayType:string):Boolean;
    Function InsertIntoTB_CARDHIS_CopyCard(aCardNo,aOldCardNo,aWorkMode:string):Boolean;
    Function InsertIntoTB_CARDPERMIT_CardChange(aNewCardNo,aOldCard:string):Boolean;
    Function InsertIntoTB_CARDPERMIT_DeviceAddCardNo(aNodeNo,aEcuID:string;aDoorPermit,aArmPermitType:integer):Boolean;
    Function InsertIntoTB_CARDPERMIT_DoorPermit(aNodeNo,aEcuID,aExtendID,aCardNo,aDoorNo:string):Boolean;
    Function InsertIntoTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,aExtendID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
               aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8:string;aPassword:string='';aCardType:string='1'):Boolean;
    Function InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE(aCompanyCode,aNodeNo,aEcuID,aExtendID,aType,aNumber,aPermit,aDeep,aApply:string):Boolean;
    Function InsertIntoTB_CARDPERMITCOMPANYGROUP_LikeCompanyArmAreaPermitAdd(aCompanyCode, aNodeNo, aEcuID,aExtendID, aArmAreaNo:string):Boolean;
    Function InsertIntoTB_CARDPERMITCOMPANYGROUP_LikeCompanyDoorPermitAdd(aCompanyCode, aNodeNo, aEcuID,aExtendID, aDoorNo:string):Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEECODE_ATTypeAdd:Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAllArmAreaToEmCode(aEmSeq,aPermit,aApply:string):Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAllDoorToEmCode(aEmSeq,aPermit,aApply:string):Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAttendDoorToEmCode(aNodeNo, aEcuID,aDoorNo,aPermit,aApply:string):Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAttendEmCodeToDoor(aEmSeq,aPermit,aApply:string):Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyFoodDoorToEmCode(aNodeNo, aEcuID,aDoorNo,aPermit,aApply:string):Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyFoodEmCodeToDoor(aEmSeq,aPermit,aApply:string):Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEECODE_FDTypeAdd:Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber,aPermit,aApply,aEmApprove:string):Boolean;
    // Function 모듈에서 처리    Function InsertIntoTB_CARDPERMITEMPLOYEECODE_AllEmployeeCode(aNodeNo,aEcuID,aExtendID,aType,aNumber,aPermit,aDeep,aApply:string):Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE(aEmGroupCode,aNodeNo,aEcuID,aExtendID,aType,aNumber,aPermit,aDeep,aApply:string):Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEEGROUP_LikeEmGroupArmAreaPermitAdd(aEmGroupCode, aNodeNo, aEcuID,aExtendID, aArmAreaNo:string):Boolean;
    Function InsertIntoTB_CARDPERMITEMPLOYEEGROUP_LikeEmGroupDoorPermitAdd(aEmGroupCode, aNodeNo, aEcuID,aExtendID, aDoorNo:string):Boolean;
    Function InsertIntoTB_CARDPRINTLIST_Value(aPrintNo,aCardNo:string):Boolean;
    Function InsertIntoTB_CARDSTATE_All(aCode,aCodeName1,aCodeName2:string;aCodeName3:string=''):Boolean;
    Function InsertIntoTB_CCTV_Value(aCCTVNo,aCCTVIp,aCCTVName,aCCTVPort,aUserID,aUserPW:string):Boolean;
    Function InsertIntoTB_CERTIFICATECLASSCODE_Value(aCode,aName,aSeq,aUsed,aViewSeq:string):Boolean;
    Function InsertIntoTB_CertificateCode_Value(aSeq,aName,aClassCode,aCertificateAmt,aOrganize,aIssuAmt,aMasterAmt,aHompage:string):Boolean;
    Function InsertIntoTB_CertificateID_Value(aCertificateCode,aEmSeq,aCertificateID,aCertificatePW:string):Boolean;
    Function InsertIntoTB_CertificatePlan_Value(aCode,aDate,aSeq,aFromDate,aToDate,aResultDate:string):Boolean;
    Function InsertIntoTB_CertificateReceipt_Value(aCode,aDate,aEmSeq,aRegistDate,aRAmt,aIssu,aIssuAmt,aMasterIssu,aMasterIssuAmt,aPass:string):Boolean;
    Function InsertIntoTB_COMPANYCODE_All(aCode,aCodeName,aSeq,aUsed,aViewSeq:string;aRelayCompanyCode:string=''):Boolean;
    Function InsertIntoTB_CONFIG_All(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aDetail:string=''):Boolean;
    Function InsertIntoTB_consultinggroupphonenum_Value(aHandphone,aCgNum:string):Boolean;
    Function InsertIntoTB_consultinglist_Value(aDate,aGroupNum,aPhone,aMemo:string):Boolean;
    Function InsertIntoTB_CurriculumCode_Value(aLectureSeq,aName,aLectureClassCode,aBookName,aBookAmt,aMonth,aGubun,aMainTeacher,aSubTeacher,aTime,aSun,aMon,aTue,aWed,aThu,aFri,aSat:string ):Boolean;
    Function InsertIntoTB_DECODER_ALL(aDecoderNo,aDecoderSockType,aDecoderName,aDecoderIP,aDevicePort,aControlPort,aFTPPort,aDirectPort:string ):Boolean;
    Function InsertIntoTB_DEVICE_DeviceInit(aNodeNo,aEcuID,aExtendNo,aDeviceName:string;aUse:string='0';aBuildingCode:string='0' ):Boolean;
    Function InsertIntoTB_DEVICERCV_DeviceInit(aNodeNo,aEcuID,aExtendNo:string ):Boolean;
    Function InsertIntoTB_DOOR_DeviceDoorInit(aNodeNo,aEcuID,aDoorNo,aDoorName:string;aDoorUse:string='0';aDoorView:string='0';aDoorMemo:string='';aBuildingCode:string='0' ):Boolean;
    Function InsertIntoTB_DOORGUBUN_Value(aCode,aName:string):Boolean;
    Function InsertIntoTB_DOORRCV_DeviceDoorInit(aNodeNo,aEcuID,aDoorNo:string ):Boolean;
    function InsertIntoTB_DOORSCHEDULE_All(aNodeNo,aECUID,aDOORNO,aDayCode,a1Time,a2Time,a3Time,a4Time,a5Time,a1Mode,a2Mode,a3Mode,a4Mode,a5Mode,aRcvAck:string):Boolean;
    function InsertIntoTB_DOORSTATECODE(aCode,aCodeName:string):Boolean;
    function InsertIntoTB_DOORSTATEEVENT_Value(aDate, aTime, aNodeNo, aEcuID,aExtendID,aDoorNo,aDS,aInsertTime:string):Boolean;
    Function InsertIntoTB_DOORTELEVENT_Password(aDate, aTime, aNodeNo, aEcuID,aExtendID, aDoorNo,aPassword:string):Boolean;
    Function InsertIntoTB_DOORTELEVENT_TelNumber(aDate, aTime, aNodeNo, aEcuID,aExtendID, aDoorNo,aTelNumber:string):Boolean;
    Function InsertIntoTB_EMPLOYEE_Academy(aEmSeq,aEmName,aCompanyCode,aGubunCode,aCompanyPhone,ahandPhone,aEmninfo,aBirthday,
             aRegDate,aEndDate,aACType,aATType,aFdType,aEmGroupCode,aGradeType,aFingerUse,aEmStateCode,aAWCode,aCardUse,aEmail,aSchoolName,aGrade,aTuitionOFF,aPaymentday,aCgNum,aKey,
             aMon,aTue,aWed,aThu,aFri,aSat,aSun:string):Boolean;
    Function InsertIntoTB_EMPLOYEE_Value(aEmSeq,aEmCode,aEmName,aCompanyCode,aPosiCode,aGubunCode,aCompanyPhone,aHomePhone,ahandPhone,aEmninfo,
             aRegDate,aEndDate,aACType,aATType,aFdType,aEmGroupCode,aGradeType,aFingerUse,aEmStateCode,aAWCode,aCardUse:string;aRelayUse:string='0';aRelayDate:string='';aRelayCode:string='';aEmApprove:string= '1'):Boolean;
    Function InsertIntoTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq,aNodeNo,aEcuID,aTimeCodeUse,aTimeGroup,aTime1,aTime2,aTime3,aTime4,aWeek:string):Boolean;
    Function InsertIntoTB_EMPLOYEEFINGER_Template(aEmSeq,aFingerSeq,aFingerTemplate1_1,aFingerTemplate1_2,aFingerTemplate2_1,aFingerTemplate2_2,aFingerTemplate3_1,aFingerTemplate3_2:string):Boolean;
    Function InsertIntoTB_EMPLOYEEGROUPCODE_All(aCode,aName,aSeq,aUsed,aViewSeq:string):Boolean;
    Function InsertIntoTB_EMPLOYEEGUBUN_Value(aCode,aName,aViewSeq:string;aRelayCode:string=''):Boolean;
    Function InsertIntoTB_EMPLOYEEHIS_CopyEmployee(aEmSeq,aWorkMode:string):Boolean;
    Function InsertIntoTB_EMPLOYEELecture_Value(aEmSeq,aLectureSeq,aRegDate,aPayDate,aRegType,aEndDate,aLASTPAYDATE:string):Boolean;
    Function InsertIntoTB_EMPLOYEELectureHIS_Value(aEmSeq,aLectureSeq,aRegDate,aPayDate,aRegType,aEndDate,aLASTPAYDATE:string):Boolean;
    Function InsertIntoTB_EMPLOYEESTATECODE_Value(aCode,aName,aState:string):Boolean;
    Function InsertIntoTB_FINGERAPPROVALNUM_Value(aFingerUserID,aFingerDeviceID,aEmSeq,aDeviceIP:string):Boolean;
    Function InsertIntoTB_FINGERDEVICE_Value(aFnSeq,aDeviceIP,aDeviceName,aPort,aDeviceType,aCPType,aNodeNo,aEcuID,aExtendID,aDoorNo,aFingerDeviceID:string;aBuildingCode:string='0'):Boolean;
    Function InsertIntoTB_FINGERDEVICECARD_Value(aFnSeq,aCardPOSITIONNUM,aEMSEQ,aPermit,aSend:string):Boolean;
    Function InsertIntoTB_FIREGROUP_All(aCode,aName:string):Boolean;
    Function InsertIntoTB_FOODCODE_Value(aFdType,aFdCode,aFdName,aStartTime,aEndTime,aAmt,aFoodOutTime:string):Boolean;
    Function InsertIntoTB_FOODCODECOUNT_Value(aDate,aFDTYPE,aFOCODE,aCount:string):Boolean;
    Function InsertIntoTB_FOODGROUP_Value(aCode,aName:string):Boolean;
    Function InsertIntoTB_FOODEVENT_Value(aDate,aTime,aEmSeq,aNodeNo,aEcuId,aReaderNo,aExtendID,aDoorNo,aFdType,aFoCode,aEmCode,aEmName,aCompanyCode,aPermitCode,aAmt,aFGCODE:string;aCardNo:string=''):Boolean;
    Function InsertIntoTB_FOODOUTCOUNT_Value(aFDDate,aFdType,aFdCode,aFCCount:string):Boolean;
    Function InsertIntoTB_FOODTYPE_Value(aFdType,aName:string;aFdYesterTime: string='0400'):Boolean;
    Function InsertIntoTB_FORMCRITICAL_Value(aCode,aMenuType,aName,aCriticalType:string):Boolean;
    Function InsertIntoTB_FORMMESSAGE_All(aCode,aName1,aName2:string;aName3:string=''):Boolean;
    Function InsertIntoTB_FORMNAME_All(aProgramGubun,aMenuGubun,aMenuGroup,aCode,aName1,aName2,aView:string;aName3:string=''):Boolean;
    Function InsertIntoTB_GUESTEVENT_Value(aDate,aTime,aNodeNo,aEcuID,aExtendID,aDoorNo,aCardNo,aReaderNo,aButton,aDoorPosition,aBuildingPosition,aControlType,
                   aDoorMode,aCardMode,aPermitCode,aArmAreaNo,aVisitDate,aEmCode:string):Boolean;
    Function InsertIntoTB_GUESTLIST_Value(aGlDate,aEmSeq,aGlCode,aGlName,aGlFromTime,aGlToTime,aCompanyName,aHandPhone,aCardNo,aChange,aWorkFlag,aAreaCode:string):Boolean;
    Function InsertIntoTB_HOLIDAY_All(aDay,aAcUse,aAtUse,aName1,aName2:string;aName3:string=''):Boolean;
    Function InsertIntoTB_HOLIDAY_Value(aDay,aName,aAcUse,aAtUse,aHoType:string):Boolean;
    Function InsertIntoTB_LectureClassCode_Value(aCode,aName,aSeq,aUsed,aViewSeq:string):Boolean;
    Function InsertIntoTB_LecturePayment(aEMSEQ,aLPMONTH,aLPLECTUREAMT,aTOCODE,aTOAMT,aLPCARDTYPE,aLPAMT,aLPPayDate,aLPMEMO:string):Boolean;
    Function InsertIntoTB_LecturePaymentSummary_Value(aMonth,aEMSeq,aType,aDate:string):Boolean;
    Function InsertIntoTB_NODE_NodeIp(aNodeNo,aSockType,aDeviceID,aNodeIP,aNodeName,aNodeDeviceType,aServerNo:string;aBuildingCode:string='0';aTelNumber:string='';aAddr:string='';aAddDate:string=''):Boolean;
    Function InsertIntoTB_NODEDEVICETYPECODE_All(aNodeDeviceTypeCode,aName1,aName2,aName3,aPgType:string):Boolean;
    Function InsertIntoTB_NODERCV_NodeIp(aNodeNo:string):Boolean;
    Function InsertIntoTB_POSICODE_DefaultValue(aCode,aName,aCompanyCode,aViewSeq:string):Boolean;
    Function InsertIntoTB_READER_ReaderInit(aNodeNo,aEcuID,aReaderNo:string;aBuildingCode:string='0' ):Boolean;
    Function InsertIntoTB_READERRCV_ReaderInit(aNodeNo,aEcuID,aReaderNo:string ):Boolean;
    Function InsertIntoTB_READERBUILDINGPOSITIONCODE_All(aCode,aName1,aName2:string;aName3:string=''):Boolean;
    Function InsertIntoTB_READERDOORPOSITIONCODE_All(aCode,aName1,aName2:string;aName3:string=''):Boolean;
    Function InsertIntoTB_SYSTEMLOG_All(aDate,aTime,aClientIP,aOperator,aNodeNo,aEcuID,aCardNo,aNumber,aType,aLogData:string):Boolean;
    Function InsertIntoTB_SETTINGINFO_All(aTableName,aFieldName,aNodeNo,aEcuID,aExtendID,aSubNo,aValue:string):Boolean;
    Function InsertIntoTB_TIMECODE_CodeInit(aBuildingCode,aCode:string):Boolean;
    Function InsertIntoTB_TIMECODE_Building(aBuildingCode,aGroup,aTime1,aTime2,aTime3,aTime4,aApply:string):Boolean;
    Function InsertIntoTB_TIMECODE_BuildingChildAll(aBuildingCode,aGroup,aTime1,aTime2,aTime3,aTime4,aApply:string):Boolean;
    Function InsertIntoTB_TIMECODEDEVICE_BuildingChildAllDevice(aBuildingCode,aGroup,aTime1,aTime2,aTime3,aTime4,aChange:string):Boolean;
    Function InsertIntoTB_TIMECODEDEVICE_BuildingDevice(aBuildingCode,aGroup,aTime1,aTime2,aTime3,aTime4,aChange:string):Boolean;
    Function InsertIntoTB_TIMECODEDEVICE_TimeCodeToDevice(aNodeNo,aEcuID,aBuildingCode:string):Boolean;
    Function InsertIntoTB_Tuition_Value(aSeq,aCompanyCode,aLectureAmt:string):Boolean;
    Function InsertIntoTB_TuitionOFFCode_Value(aCode,aName,aGubun,aValue:string):Boolean;
    Function InsertIntoTB_TIMECODEDEVICE_Value(aNodeNo,aEcuID,aGroup,aTime1,aTime2,aTime3,aTime4,aSend:string):Boolean;
    Function InsertIntoTB_ZONE_ZoneInit(aNodeNo,aEcuID,aExtNo,aZoneNo,aZoneName:string;aBuildingCode:string='0'):Boolean;
    Function InsertIntoTB_ZONEEXTENTION_ZoneInit(aNodeNo,aEcuID,aExtNo,aName,aType:string):Boolean;
    Function InsertIntoTB_ZONERCV_ZoneInit(aNodeNo,aEcuID,aExtNo,aZoneNo:string):Boolean;
  end;

var
  dmDBInsert: TdmDBInsert;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDataModule1 }

function TdmDBInsert.InsertIntoTB_ACademyAttendMakeupLesson_Value(aDate, aEmSeq,
  aSeq, aMaktLessonTime: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ACademyAttendMakeupLesson (';
  stSql := stSql + ' AS_DATE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' AM_SEQ,';
  stSql := stSql + ' AM_TIME,';
  stSql := stSql + ' AM_INSERTTIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aSeq + ', ';
  stSql := stSql + '' + aMaktLessonTime + ', ';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ACademyAttendSummary_Value(aDate, aEmSeq,
  aInTime, aOutTime, aType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ACademyAttendSummary (';
  stSql := stSql + ' AS_DATE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' AS_INTIME,';
  stSql := stSql + ' AS_OUTTIME,';
  stSql := stSql + ' AS_ATTYPE,';
  stSql := stSql + ' AS_UPDATETIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + aInTime + ''', ';
  stSql := stSql + '''' + aOutTime + ''', ';
  stSql := stSql + '' + aType + ', ';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ACademyAttend_Value(aDate, aEmSeq, aInTime,
  aOutTime, aInOperator, aOutOperator: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ACademyAttend (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AA_DATE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' AA_INTIME,';
  stSql := stSql + ' AA_OUTTIME,';
  stSql := stSql + ' AA_INOPERATOR,';
  stSql := stSql + ' AA_OUTOPERATOR, ';
  stSql := stSql + ' AA_UpdateTime) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + aInTime + ''', ';
  stSql := stSql + '''' + aOutTime + ''', ';
  stSql := stSql + '''' + aInOperator + ''', ';
  stSql := stSql + '''' + aOutOperator + ''', ';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_AcademySMSMessage_Value(aGubun, aAtGubun,
  aMessage: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_AcademySMSMessage (';
  stSql := stSql + ' AM_GUBUN,';
  stSql := stSql + ' AM_ATGUBUN,';
  stSql := stSql + ' AM_MESSAGE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aGubun + ', ';
  stSql := stSql + '' + aAtGubun + ', ';
  stSql := stSql + '''' + aMessage + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ACademySMSSend_Value(aDate, aEmSeq, aGubun,
  aAtGubun, aPhoneNum, aSMSMessage, aSendState, aInsertDate: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ACademySMSSend (';
  stSql := stSql + ' AS_DATE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' AS_GUBUN,';
  stSql := stSql + ' AS_ATGUBUN,';
  stSql := stSql + ' AS_TELNUM,';
  stSql := stSql + ' AS_MESSAGE,';
  stSql := stSql + ' AS_SENDSTATE,';
  stSql := stSql + ' AS_INSERTTIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aGubun + ', ';
  stSql := stSql + '' + aAtGubun + ', ';
  stSql := stSql + '''' + aPhoneNum + ''', ';
  stSql := stSql + '''' + aSMSMessage + ''', ';
  stSql := stSql + '''' + aSendState + ''', ';
  stSql := stSql + '''' + aInsertDate + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_ACCESSCARDMODE_All(aCardMode,aCardModeName1,aCardModeName2: string;aCardModeName3:string=''): Boolean;
var
  stSql : string;
begin
  if aCardModeName3 = '' then aCardModeName3 := aCardModeName2;

  stSql := 'Insert Into TB_ACCESSCARDMODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AE_CARDMODE,';
  stSql := stSql + ' AE_CARDMODENAME1, ';
  stSql := stSql + ' AE_CARDMODENAME2, ';
  stSql := stSql + ' AE_CARDMODENAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCardMode + ''', ';
  stSql := stSql + 'N''' + aCardModeName1 + ''', ';
  stSql := stSql + 'N''' + aCardModeName2 + ''', ';
  stSql := stSql + 'N''' + aCardModeName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ACCESSCONTROLTYPE_All(aControlType,aControlTypeName1,aControlTypeName2: string;aControlTypeName3:string=''): Boolean;
var
  stSql : string;
begin
  if aControlTypeName3 = '' then aControlTypeName3 := aControlTypeName2;

  stSql := 'Insert Into TB_ACCESSCONTROLTYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AE_CONTROLTYPECODE,';
  stSql := stSql + ' AE_CONTROLTYPECODENAME1, ';
  stSql := stSql + ' AE_CONTROLTYPECODENAME2, ';
  stSql := stSql + ' AE_CONTROLTYPECODENAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aControlType + ''', ';
  stSql := stSql + 'N''' + aControlTypeName1 + ''', ';
  stSql := stSql + 'N''' + aControlTypeName2 + ''', ';
  stSql := stSql + 'N''' + aControlTypeName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ACCESSDOORMODE_All(aDoorMode,aDoorModeName1,aDoorModeName2: string;aDoorModeName3:string=''): Boolean;
var
  stSql : string;
begin
  if aDoorModeName3 = '' then aDoorModeName3 := aDoorModeName2;

  stSql := 'Insert Into TB_ACCESSDOORMODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AE_DOORMODE,';
  stSql := stSql + ' AE_DOORMODENAME1, ';
  stSql := stSql + ' AE_DOORMODENAME2, ';
  stSql := stSql + ' AE_DOORMODENAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDoorMode + ''', ';
  stSql := stSql + 'N''' + aDoorModeName1 + ''', ';
  stSql := stSql + 'N''' + aDoorModeName2 + ''', ';
  stSql := stSql + 'N''' + aDoorModeName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ACCESSEVENT_All(aDate, aTime, aNodeNo, aEcuID,
  aExtendID, aDoorNo, aCardNo, aReaderNo, aButton, aDoorPosition,
  aBuildingPosition, aControlType, aDoorMode, aCardMode, aPermitCode,
  aArmAreaNo, aCompanyCode, aEmSeq,aEmCode, aEmName, aUserID,
  aInserTime,aATCheck,aFDCheck: string;aPrintNo:string=''): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aArmAreaNo) then aArmAreaNo := '0';
  if Not isDigit(aEmSeq) then aEmSeq := '0';


  stSql := 'Insert Into TB_ACCESSEVENT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AE_DATE,';
  stSql := stSql + ' AE_TIME,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' RE_READERNO,';
  stSql := stSql + ' AE_BUTTON,';
  stSql := stSql + ' RP_DOORPOSITIONCODE,';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODE,';
  stSql := stSql + ' AE_CONTROLTYPECODE,';
  stSql := stSql + ' AE_DOORMODE,';
  stSql := stSql + ' AE_CARDMODE,';
  stSql := stSql + ' AP_PERMITCODE,';
  stSql := stSql + ' AR_ARMAREANO,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_SEQ, ';
  stSql := stSql + ' EM_CODE, ';
  stSql := stSql + ' EM_NAME, ';
  stSql := stSql + ' AD_USERID, ';
  stSql := stSql + ' AE_ATCHECK, ';
  stSql := stSql + ' AE_FDCHECK, ';
  stSql := stSql + ' CA_PRINTNO, ';
  stSql := stSql + ' AE_INSERTTIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '' + aDoorNo + ', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '' + aReaderNo + ', ';
  stSql := stSql + '''' + aButton + ''', ';
  stSql := stSql + '''' + aDoorPosition + ''', ';
  stSql := stSql + '''' + aBuildingPosition + ''', ';
  stSql := stSql + '''' + aControlType + ''', ';
  stSql := stSql + '''' + aDoorMode + ''', ';
  stSql := stSql + '''' + aCardMode + ''', ';
  stSql := stSql + '''' + aPermitCode + ''', ';
  stSql := stSql + '' + aArmAreaNo + ', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + 'N''' + aEmCode + ''', ';
  stSql := stSql + 'N''' + aEmName + ''', ';
  stSql := stSql + '''' + aUserID + ''', ';
  stSql := stSql + '''' + aATCheck + ''', ';
  stSql := stSql + '''' + aFDCheck + ''', ';
  stSql := stSql + '''' + aPrintNo + ''', ';
  stSql := stSql + '''' + aInserTime + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All(aPermitCode,aPermitCodeName1,aPermitCodeName2: string;aPermitCodeName3:string=''): Boolean;
var
  stSql : string;
begin
  if aPermitCodeName3 = '' then aPermitCodeName3 := aPermitCodeName2;

  stSql := 'Insert Into TB_ACCESSPERMITCODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AP_PERMITCODE,';
  stSql := stSql + ' AP_PERMITCODENAME1, ';
  stSql := stSql + ' AP_PERMITCODENAME2, ';
  stSql := stSql + ' AP_PERMITCODENAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aPermitCode + ''', ';
  stSql := stSql + 'N''' + aPermitCodeName1 + ''', ';
  stSql := stSql + 'N''' + aPermitCodeName2 + ''', ';
  stSql := stSql + 'N''' + aPermitCodeName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ADMINDEVICE_Value(aUserID, aTYPE_DOOR,
  aNodeNo, aECUID, aExtendID, aNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ADMINDEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' AG_TYPE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' AG_NO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aUserID + ''', ';
  stSql := stSql + '''' + aTYPE_DOOR + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aECUID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '' + aNo + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ADMINGRADEPROGRAM_Value(aGradeCode,
  aProgramGubun, aProgramID, aMenuGubun, aInsert, aUpdate, aDelete, aUserID,
  aTime: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ADMINGRADEPROGRAM (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AG_GRADECODE,';
  stSql := stSql + ' FN_PROGRAMGUBUN,';
  stSql := stSql + ' FN_NAMECODE,';
  stSql := stSql + ' FN_MENUGUBUN,';
  stSql := stSql + ' AG_INSERT,';
  stSql := stSql + ' AG_UPDATE,';
  stSql := stSql + ' AG_DELETE, ';
  stSql := stSql + ' AD_USERID, ';
  stSql := stSql + ' AG_UPDATETIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aGradeCode + ''', ';
  stSql := stSql + '''' + aProgramGubun + ''', ';
  stSql := stSql + '''' + aProgramID + ''', ';
  stSql := stSql + '''' + aMenuGubun + ''', ';
  stSql := stSql + '''' + aInsert + ''', ';
  stSql := stSql + '''' + aUpdate + ''', ';
  stSql := stSql + '''' + aDelete + ''', ';
  stSql := stSql + '''' + aUserID + ''', ';
  stSql := stSql + '''' + aTime + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ADMINGRADE_All(aCode, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ADMINGRADECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AG_GRADECODE,';
  stSql := stSql + ' AG_GRADECODENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aName + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ADMINWORKLOG_All(aDate, aTime, aPcIP, aUserID,
  aFormCode, aType, aNodeNo, aEcuID, aExtendID, aNumber, aCardNo,
  aLogData: string): Boolean;
var
  stSql : string;
begin
  //stSql := ' SET IDENTITY_INSERT  TB_ADMINWORKLOG ON ';
  //result := dmDataBase.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_ADMINWORKLOG (';
  stSql := stSql + ' AW_DATE,';
  stSql := stSql + ' AW_TIME,';
  stSql := stSql + ' AW_PCIP,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' AW_FORMCODE, ';
  stSql := stSql + ' AW_TYPE, ';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID, ';
  stSql := stSql + ' AW_NUMBER, ';
  stSql := stSql + ' CA_CARDNO, ';
  stSql := stSql + ' AW_LOGDATA) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '''' + aPcIP + ''', ';
  stSql := stSql + '''' + aUserID + ''', ';
  stSql := stSql + '''' + aFormCode + ''', ';
  stSql := stSql + '''' + aType + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '' + aNumber + ', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aLogData + ''') ';
  result := dmDataBase.ProcessExecSQL(stSql);
  //stSql := ' SET IDENTITY_INSERT TB_ADMINWORKLOG OFF ';
  //result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ADMIN_Academy(aUserID, aUserPw, aUserName,
  aMaster, aAdminClassCode, aCompanyCode, aBuildingCode, aBuildingType,
  aEmGroupCode, aHandPhone, aEmail, aEtc: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ADMIN (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' AD_USERPW, ';
  stSql := stSql + ' AD_USERNAME, ';
  stSql := stSql + ' AD_MASTER, ';
  stSql := stSql + ' AG_GRADECODE, ';
  stSql := stSql + ' CO_COMPANYCODE, ';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + ' EM_GROUPCODE, ';
  stSql := stSql + ' AD_BUILDINGTYPE, ';
  stSql := stSql + ' AD_HANDPHONE, ';
  stSql := stSql + ' AD_EMAIL, ';
  stSql := stSql + ' AD_ETC) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aUserID + ''', ';
  stSql := stSql + '''' + aUserPw + ''', ';
  stSql := stSql + 'N''' + aUserName + ''', ';
  stSql := stSql + '''' + aMaster + ''', ';
  stSql := stSql + '''' + aAdminClassCode + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aEmGroupCode + ''', ';
  stSql := stSql + '''' + aBuildingType + ''', ';
  stSql := stSql + '''' + aHandPhone + ''', ';
  stSql := stSql + '''' + aEmail + ''', ';
  stSql := stSql + '''' + aEtc + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ADMIN_All(aUserID, aUserPw, aUserName,
  aMaster, aAdminClassCode, aCompanyCode,aBuildingCode, aBuildingType,aEmGroupCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ADMIN (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' AD_USERPW, ';
  stSql := stSql + ' AD_USERNAME, ';
  stSql := stSql + ' AD_MASTER, ';
  stSql := stSql + ' AG_GRADECODE, ';
  stSql := stSql + ' CO_COMPANYCODE, ';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + ' EM_GROUPCODE, ';
  stSql := stSql + ' AD_BUILDINGTYPE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aUserID + ''', ';
  stSql := stSql + '''' + aUserPw + ''', ';
  stSql := stSql + 'N''' + aUserName + ''', ';
  stSql := stSql + '''' + aMaster + ''', ';
  stSql := stSql + '''' + aAdminClassCode + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aEmGroupCode + ''', ';
  stSql := stSql + '''' + aBuildingType + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All(aCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ALARMDEVICETYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AL_ALARMDEVICETYPE,';
  stSql := stSql + ' AL_ALARMDEVICETYPENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aName + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ALARMEVENTOPERMODECHANGE_All(aOperator,
  aAlarmState, aChangeCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ALARMEVENTOPERMODECHANGE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AM_OPERCODE,';
  stSql := stSql + ' AM_ALARMSTATECODE, ';
  stSql := stSql + ' AM_ALARMCHANGECODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aOperator + ''', ';
  stSql := stSql + '''' + aAlarmState + ''', ';
  stSql := stSql + '''' + aChangeCode + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All(aCode, aCodeName1,
  aCodeName2,aDevice,aArmType,aZonState,aOper: string;aCodeName3:string=''): Boolean;
var
  stSql : string;
begin
  if aCodeName3 = '' then aCodeName3 := aCodeName2;

  stSql := 'Insert Into TB_ALARMEVENTSTATECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AE_EVENTSTATECODE,';
  stSql := stSql + ' AE_EVENTSTATECODENAME1, ';
  stSql := stSql + ' AE_EVENTSTATECODENAME2, ';
  stSql := stSql + ' AE_EVENTSTATECODENAME3, ';
  stSql := stSql + ' AE_DEVICE, ';
  stSql := stSql + ' AE_ARMTYPE, ';
  stSql := stSql + ' AE_ZONESTATE, ';
  stSql := stSql + ' AE_OPER) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aCodeName1 + ''', ';
  stSql := stSql + 'N''' + aCodeName2 + ''', ';
  stSql := stSql + 'N''' + aCodeName3 + ''', ';
  stSql := stSql + '''' + aDevice + ''', ';
  stSql := stSql + '''' + aArmType + ''', ';
  stSql := stSql + '''' + aZonState + ''', ';
  stSql := stSql + '''' + aOper + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ALARMEVENTSTATEGROUP_All(aCode, aCodeName1,
  aCodeName2: string;aCodeName3:string=''): Boolean;
var
  stSql : string;
begin
  if aCodeName3 = '' then aCodeName3 := aCodeName2;

  stSql := 'Insert Into TB_ALARMEVENTSTATEGROUP (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AG_ALARMGROUPCODE,';
  stSql := stSql + ' AG_NAME1, ';
  stSql := stSql + ' AG_NAME2, ';
  stSql := stSql + ' AG_NAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aCodeName1 + ''', ';
  stSql := stSql + 'N''' + aCodeName2 + ''', ';
  stSql := stSql + 'N''' + aCodeName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All(aCode, aCodeName1,
  aCodeName2, aAlarmCode,aAlarmGroupCode,aModeChange, aView, aSound, aColor: string;aCodeName3:string=''): Boolean;
var
  stSql : string;
begin
  if aCodeName3 = '' then aCodeName3 := aCodeName2;

  stSql := 'Insert Into TB_ALARMEVENTSTATEPCCODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AP_EVENTSTATEPCCODE,';
  stSql := stSql + ' AP_EVENTSTATEPCCODENAME1, ';
  stSql := stSql + ' AP_EVENTSTATEPCCODENAME2, ';
  stSql := stSql + ' AP_EVENTSTATEPCCODENAME3, ';
  stSql := stSql + ' AE_EVENTSTATECODE, ';
  stSql := stSql + ' AG_ALARMGROUPCODE, ';
  stSql := stSql + ' AP_MODECHANGE, ';
  stSql := stSql + ' AP_VIEW, ';
  stSql := stSql + ' AP_SOUND, ';
  stSql := stSql + ' AP_COLOR) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aCodeName1 + ''', ';
  stSql := stSql + 'N''' + aCodeName2 + ''', ';
  stSql := stSql + 'N''' + aCodeName3 + ''', ';
  stSql := stSql + '''' + aAlarmCode + ''', ';
  stSql := stSql + '' + aAlarmGroupCode + ', ';
  stSql := stSql + '''' + aModeChange + ''', ';
  stSql := stSql + '''' + aView + ''', ';
  stSql := stSql + '''' + aSound + ''', ';
  stSql := stSql + '' + aColor + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ALARMEVENT_All(aDate, aTime, aNodeNo, aEcuID,
  aExtendID, aMsgNo, aAlarmDeviceType, aSubAddr, aArmAreaNo, aArmMode, aPortNo,
  aPortState, aEventStateCode, aEventPCCode, aOperator,aArmModeChange,
  aView,aSound,aColor,aInsertTime: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ALARMEVENT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AE_DATE,';
  stSql := stSql + ' AE_TIME, ';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID, ';
  stSql := stSql + ' AE_MSGNO, ';
  stSql := stSql + ' AL_ALARMDEVICETYPE, ';
  stSql := stSql + ' AE_SUBADDR, ';
  stSql := stSql + ' AR_ARMAREANO, ';
  stSql := stSql + ' AM_ARMMODECODE, ';
  stSql := stSql + ' ZN_ZONENO, ';
  stSql := stSql + ' AP_PORTSTATE, ';
  stSql := stSql + ' AE_EVENTSTATECODE, ';
  stSql := stSql + ' AP_EVENTSTATEPCCODE, ';
  stSql := stSql + ' AE_OPERATOR, ';
  stSql := stSql + ' AP_MODECHANGE, ';
  stSql := stSql + ' AP_VIEW, ';
  stSql := stSql + ' AP_SOUND, ';
  stSql := stSql + ' AP_COLOR, ';
  stSql := stSql + ' AE_INSERTTIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aMsgNo + ''', ';
  stSql := stSql + '''' + aAlarmDeviceType + ''', ';
  stSql := stSql + '''' + aSubAddr + ''', ';
  stSql := stSql + '' + aArmAreaNo + ', ';
  stSql := stSql + '''' + aArmMode + ''', ';
  stSql := stSql + '' + aPortNo + ', ';
  stSql := stSql + '''' + aPortState + ''', ';
  stSql := stSql + '''' + aEventStateCode + ''', ';
  stSql := stSql + '''' + aEventPCCode + ''', ';
  stSql := stSql + '''' + aOperator + ''', ';
  stSql := stSql + '''' + aArmModeChange + ''', ';
  stSql := stSql + '''' + aView + ''', ';
  stSql := stSql + '''' + aSound + ''', ';
  stSql := stSql + '' + aColor + ', ';
  stSql := stSql + '''' + aInsertTime + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_ALARMMODECODE_All(aCode, aCodeName1,
  aCodeName2: string;aCodeName3:string=''): Boolean;
var
  stSql : string;
begin
  if aCodeName3 = '' then aCodeName3 := aCodeName2;

  stSql := 'Insert Into TB_ALARMMODECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AM_ARMMODECODE,';
  stSql := stSql + ' AM_ARMMODENAME1, ';
  stSql := stSql + ' AM_ARMMODENAME2, ';
  stSql := stSql + ' AM_ARMMODENAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aCodeName1 + ''', ';
  stSql := stSql + 'N''' + aCodeName2 + ''', ';
  stSql := stSql + 'N''' + aCodeName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ALARMPORTSTATE_All(aCode, aCodeName1,
  aCodeName2: string;aCodeName3:string=''): Boolean;
var
  stSql : string;
begin
  if aCodeName3 = '' then aCodeName3 := aCodeName2;

  stSql := 'Insert Into TB_ALARMPORTSTATE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AP_PORTSTATE,';
  stSql := stSql + ' AP_PORTSTATENAME1, ';
  stSql := stSql + ' AP_PORTSTATENAME2, ';
  stSql := stSql + ' AP_PORTSTATENAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aCodeName1 + ''', ';
  stSql := stSql + 'N''' + aCodeName2 + ''', ';
  stSql := stSql + 'N''' + aCodeName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ANTIGROUPCODE_All(aCode, aName,
  aAntiNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ANTIGROUPCODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AG_CODE,';
  stSql := stSql + ' AG_NAME,';
  stSql := stSql + ' AG_ANTINO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '' + aAntiNo + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ARMAREA_DeviceARMAREAInit(aNodeNo, aEcuID,
  aArmAreaNo, aArmAreaName: string;aArmAreaUse:string='0';aArmAreaView:string='0';aBuildingCode:string='0'): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ARMAREA (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' AR_ARMAREANO,';
  stSql := stSql + ' AR_ARMAREAUSE,';
  stSql := stSql + ' AR_VIEW,';
  stSql := stSql + ' AR_ARMAREANAME, ';
  stSql := stSql + ' BC_BUILDINGCODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aArmAreaNo + ',';
  stSql := stSql + '''' + aArmAreaUse + ''', ';
  stSql := stSql + '''' + aArmAreaView + ''', ';
  stSql := stSql + 'N''' + aArmAreaName + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ATTENDCODE_VALUE(aAWCode, aCode, aName,aYesterDayTime, aWorkStartTime,
  aWorkEndTime, aInFromTime, aInToTime, aExtendTime, aNightTime, aNormalAdd,
  aEarlyAdd, aJigakAdd, aJotaeAdd, aExtendAdd, aNightAdd, aSWorkStartTime,
  aSWorkEndTime, aSInFromTime, aSInToTime, aSExtendTime, aSNightTime,
  aSNormalAdd, aSEarlyAdd, aSJigakAdd, aSJotaeAdd, aSExtendAdd, aSNightAdd,
  aHWorkStartTime, aHWorkEndTime, aHInFromTime, aHInToTime, aHExtendTime,
  aHNightTime, aHNormalAdd, aHEarlyAdd, aHJigakAdd, aHJotaeAdd, aHExtendAdd,
  aHNightAdd, aOutRange, aSoutRange, aHoutRange: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATTENDCODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AW_CODE,';
  stSql := stSql + ' AT_ATCODE,';
  stSql := stSql + ' AT_CODENAME,';
  stSql := stSql + ' AT_YESTERDAYTIME,';
  stSql := stSql + ' AT_WORKSTARTTIME,';
  stSql := stSql + ' AT_WORKENDTIME,';
  stSql := stSql + ' AT_INFROMTIME,';
  stSql := stSql + ' AT_INTOTIME,';
  stSql := stSql + ' AT_EXTENDTIME,';
  stSql := stSql + ' AT_NIGHTTIME,';
  stSql := stSql + ' AT_NORMALADD,';
  stSql := stSql + ' AT_EARLYADD,';
  stSql := stSql + ' AT_JIGAKADD,';
  stSql := stSql + ' AT_JOTAEADD,';
  stSql := stSql + ' AT_EXTENDADD,';
  stSql := stSql + ' AT_NIGHTADD,';
  stSql := stSql + ' AT_SWORKSTARTTIME,';
  stSql := stSql + ' AT_SWORKENDTIME,';
  stSql := stSql + ' AT_SINFROMTIME,';
  stSql := stSql + ' AT_SINTOTIME,';
  stSql := stSql + ' AT_SEXTENDTIME,';
  stSql := stSql + ' AT_SNIGHTTIME,';
  stSql := stSql + ' AT_SNORMALADD,';
  stSql := stSql + ' AT_SEARLYADD,';
  stSql := stSql + ' AT_SJIGAKADD,';
  stSql := stSql + ' AT_SJOTAEADD,';
  stSql := stSql + ' AT_SEXTENDADD,';
  stSql := stSql + ' AT_SNIGHTADD,';
  stSql := stSql + ' AT_HWORKSTARTTIME,';
  stSql := stSql + ' AT_HWORKENDTIME,';
  stSql := stSql + ' AT_HINFROMTIME,';
  stSql := stSql + ' AT_HINTOTIME,';
  stSql := stSql + ' AT_HEXTENDTIME,';
  stSql := stSql + ' AT_HNIGHTTIME,';
  stSql := stSql + ' AT_HNORMALADD,';
  stSql := stSql + ' AT_HEARLYADD,';
  stSql := stSql + ' AT_HJIGAKADD,';
  stSql := stSql + ' AT_HJOTAEADD,';
  stSql := stSql + ' AT_HEXTENDADD,';
  stSql := stSql + ' AT_HNIGHTADD,';
  stSql := stSql + ' AT_OUTRANGE,';
  stSql := stSql + ' AT_SOUTRANGE,';
  stSql := stSql + ' AT_HOUTRANGE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aAWCode + ',';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aYesterDayTime + ''',';
  stSql := stSql + '''' + aWorkStartTime + ''',';
  stSql := stSql + '''' + aWorkEndTime + ''',';
  stSql := stSql + '''' + aInFromTime + ''',';
  stSql := stSql + '''' + aInToTime + ''',';
  stSql := stSql + '''' + aExtendTime + ''',';
  stSql := stSql + '''' + aNightTime + ''',';
  stSql := stSql + '''' + aNormalAdd + ''',';
  stSql := stSql + '''' + aEarlyAdd + ''',';
  stSql := stSql + '''' + aJigakAdd + ''',';
  stSql := stSql + '''' + aJotaeAdd + ''',';
  stSql := stSql + '''' + aExtendAdd + ''',';
  stSql := stSql + '''' + aNightAdd + ''',';
  stSql := stSql + '''' + aSWorkStartTime + ''',';
  stSql := stSql + '''' + aSWorkEndTime + ''',';
  stSql := stSql + '''' + aSInFromTime + ''',';
  stSql := stSql + '''' + aSInToTime + ''',';
  stSql := stSql + '''' + aSExtendTime + ''',';
  stSql := stSql + '''' + aSNightTime + ''',';
  stSql := stSql + '''' + aSNormalAdd + ''',';
  stSql := stSql + '''' + aSEarlyAdd + ''',';
  stSql := stSql + '''' + aSJigakAdd + ''',';
  stSql := stSql + '''' + aSJotaeAdd + ''',';
  stSql := stSql + '''' + aSExtendAdd + ''',';
  stSql := stSql + '''' + aSNightAdd + ''',';
  stSql := stSql + '''' + aHWorkStartTime + ''',';
  stSql := stSql + '''' + aHWorkEndTime + ''',';
  stSql := stSql + '''' + aHInFromTime + ''',';
  stSql := stSql + '''' + aHInToTime + ''',';
  stSql := stSql + '''' + aHExtendTime + ''',';
  stSql := stSql + '''' + aHNightTime + ''',';
  stSql := stSql + '''' + aHNormalAdd + ''',';
  stSql := stSql + '''' + aHEarlyAdd + ''',';
  stSql := stSql + '''' + aHJigakAdd + ''',';
  stSql := stSql + '''' + aHJotaeAdd + ''',';
  stSql := stSql + '''' + aHExtendAdd + ''',';
  stSql := stSql + '''' + aHNightAdd + ''',';
  stSql := stSql + '''' + aOutRange + ''',';
  stSql := stSql + '''' + aSoutRange + ''',';
  stSql := stSql + '''' + aHoutRange + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_ATTENDEVENTLIST_Work(aDate, aEmSeq,
  aInOutType, aEmCode, aEmName, aCompanyCode, aInResult, aInTime, aNodeNo,
  aEcuID, aExtendID, aDoorNo, aReaderNo, aBUTTON, aDeviceType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATTENDEVENTLIST (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AT_DATE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' AC_INOUTTYPE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' AC_RESULTCODE,';
  stSql := stSql + ' AE_INTIME,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' RE_READERNO, ';
  stSql := stSql + ' AE_BUTTON, ';
  stSql := stSql + ' AP_DEVICETYPE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aInOutType + ', ';
  stSql := stSql + 'N''' + aEmCode + ''',';
  stSql := stSql + 'N''' + aEmName + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '' + aInResult + ',';
  stSql := stSql + '''' + aInTime + ''',';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '' + aExtendID + ',';
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '' + aReaderNo + ',';
  stSql := stSql + '''' + aBUTTON + ''', ';
  stSql := stSql + '''' + aDeviceType + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ATTENDEVENT_InWork(aDate, aEmSeq, aEmCode,
  aEmName, aCompanyCode, aAWCode, aATCode, aWeekCode, aWorkStartTime,
  aWorkEndTime, aInWorkTime, aInWorkCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATTENDEVENT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AT_DATE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' AW_CODE,';
  stSql := stSql + ' AT_ATCODE,';
  stSql := stSql + ' AE_WEEKCODE,';
  stSql := stSql + ' AE_WORKSTARTTIME,';
  stSql := stSql + ' AE_WORKENDTIME,';
  stSql := stSql + ' AE_ATWORKINTIME,';
  stSql := stSql + ' AE_ATWORKINCOUNT) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + 'N''' + aEmCode + ''', ';
  stSql := stSql + 'N''' + aEmName + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '' + aAWCode + ',';
  stSql := stSql + '' + aATCode + ',';
  stSql := stSql + '' + aWeekCode + ',';
  stSql := stSql + '''' + aWorkStartTime + ''',';
  stSql := stSql + '''' + aWorkEndTime + ''',';
  stSql := stSql + '''' + aInWorkTime + ''',';
  stSql := stSql + '' + aInWorkCount + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_ATTENDEVENT_OutWork(aDate, aEmSeq, aEmCode,
  aEmName, aCompanyCode, aAWCode, aATCode, aWeekCode, aWorkStartTime,
  aWorkEndTime, aOutWorkTime, aOutWorkCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATTENDEVENT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AT_DATE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' AW_CODE,';
  stSql := stSql + ' AT_ATCODE,';
  stSql := stSql + ' AE_WEEKCODE,';
  stSql := stSql + ' AE_WORKSTARTTIME,';
  stSql := stSql + ' AE_WORKENDTIME,';
  stSql := stSql + ' AE_ATWORKOUTTIME,';
  stSql := stSql + ' AE_ATWORKOUTCOUNT) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + 'N''' + aEmCode + ''', ';
  stSql := stSql + 'N''' + aEmName + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '' + aAWCode + ',';
  stSql := stSql + '' + aATCode + ',';
  stSql := stSql + '' + aWeekCode + ',';
  stSql := stSql + '''' + aWorkStartTime + ''',';
  stSql := stSql + '''' + aWorkEndTime + ''',';
  stSql := stSql + '''' + aOutWorkTime + ''',';
  stSql := stSql + '' + aOutWorkCount + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_ATTENDEVENT_WorkIn(aDate, aEmSeq, aEmCode,
  aEmName, aCompanyCode, aAWCode, aATCode, aWeekCode, aWorkStartTime,
  aWorkEndTime, aATInTime, aATINResult, aWorkCount,aJiGakCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATTENDEVENT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AT_DATE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' AW_CODE,';
  stSql := stSql + ' AT_ATCODE,';
  stSql := stSql + ' AE_WEEKCODE,';
  stSql := stSql + ' AE_WORKSTARTTIME,';
  stSql := stSql + ' AE_WORKENDTIME,';
  stSql := stSql + ' AE_ATINTIME,';
  stSql := stSql + ' AE_ATINRESULT,';
  stSql := stSql + ' AE_WORKCOUNT, ';
  stSql := stSql + ' AE_JIGAKCOUNT) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + 'N''' + aEmCode + ''', ';
  stSql := stSql + 'N''' + aEmName + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '' + aAWCode + ',';
  stSql := stSql + '' + aATCode + ',';
  stSql := stSql + '' + aWeekCode + ',';
  stSql := stSql + '''' + aWorkStartTime + ''',';
  stSql := stSql + '''' + aWorkEndTime + ''',';
  stSql := stSql + '''' + aATInTime + ''',';
  stSql := stSql + '' + aATINResult + ',';
  stSql := stSql + '' + aWorkCount + ', ';
  stSql := stSql + '' + aJiGakCount + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_ATTENDEVENT_WorkOut(aDate, aEmSeq, aEmCode,
  aEmName, aCompanyCode, aAWCode, aATCode, aWeekCode, aWorkStartTime,
  aWorkEndTime, aOutTime, aOutResult, aBeforWorkMM, aWorkMM, aExtendWorkMM,
  aNightWorkMM, aBeforWorkCount, aWorkCount, aJotaeCount, aExtendWorkCount,
  aNightWorkCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATTENDEVENT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AT_DATE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' AW_CODE,';
  stSql := stSql + ' AT_ATCODE,';
  stSql := stSql + ' AE_WEEKCODE,';
  stSql := stSql + ' AE_WORKSTARTTIME,';
  stSql := stSql + ' AE_WORKENDTIME,';
  stSql := stSql + ' AE_ATOUTTIME,';
  stSql := stSql + ' AE_ATOUTRESULT,';
  stSql := stSql + ' AE_BEFORWORKMM,';
  stSql := stSql + ' AE_WORKMM,';
  stSql := stSql + ' AE_EXTENDWORKMM,';
  stSql := stSql + ' AE_NIGHTWORKMM,';
  stSql := stSql + ' AE_BEFORWORKCOUNT, ';
  stSql := stSql + ' AE_WORKCOUNT, ';
  stSql := stSql + ' AE_JIGAKCOUNT, ';
  stSql := stSql + ' AE_EXTENDWORKCOUNT, ';
  stSql := stSql + ' AE_NIGHTWORKCOUNT ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + 'N''' + aEmCode + ''', ';
  stSql := stSql + 'N''' + aEmName + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '' + aAWCode + ',';
  stSql := stSql + '' + aATCode + ',';
  stSql := stSql + '' + aWeekCode + ',';
  stSql := stSql + '''' + aWorkStartTime + ''',';
  stSql := stSql + '''' + aWorkEndTime + ''',';
  stSql := stSql + '''' + aOutTime + ''',';
  stSql := stSql + '' + aOutResult + ',';
  stSql := stSql + '' + aBeforWorkMM + ',';
  stSql := stSql + '' + aWorkMM + ',';
  stSql := stSql + '' + aExtendWorkMM + ',';
  stSql := stSql + '' + aNightWorkMM + ',';
  stSql := stSql + '' + aBeforWorkCount + ',';
  stSql := stSql + '' + aWorkCount + ',';
  stSql := stSql + '' + aJotaeCount + ',';
  stSql := stSql + '' + aExtendWorkCount + ',';
  stSql := stSql + '' + aNightWorkCount + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_ATTENDFILEFORMAT_Value(aSeq, aUse, aName,
  aLen, aChar, aDateFormat, aFrontRear, aWorkIn, aWorkOut, aBusinessIn,
  aBusinessOut: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATTENDFILEFORMAT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AF_SEQ,';
  stSql := stSql + ' AF_USE, ';
  stSql := stSql + ' AF_FIELDNAME, ';
  stSql := stSql + ' AF_LENGTH, ';
  stSql := stSql + ' AF_FILLCHAR, ';
  stSql := stSql + ' AF_DATEFORMATE, ';
  stSql := stSql + ' AF_FRONTREAR, ';
  stSql := stSql + ' AF_WORKINTYPE, ';
  stSql := stSql + ' AF_WORKOUTTYPE, ';
  stSql := stSql + ' AF_BUSINESSOUTTYPE, ';
  stSql := stSql + ' AF_BUSINESSINTYPE )';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aSeq + ', ';
  stSql := stSql + '' + aUse + ', ';
  stSql := stSql + '''' + aName + ''', ';
  stSql := stSql + '' + aLen + ', ';
  stSql := stSql + '''' + aChar + ''', ';
  stSql := stSql + '''' + aDateFormat + ''', ';
  stSql := stSql + '' + aFrontRear + ', ';
  stSql := stSql + '''' + aWorkIn + ''', ';
  stSql := stSql + '''' + aWorkOut + ''', ';
  stSql := stSql + '''' + aBusinessIn + ''', ';
  stSql := stSql + '''' + aBusinessOut + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value(aCode, aInoutType,
  aResultType, aName, aSystem: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATTENDINOUTCODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AC_RESULTCODE,';
  stSql := stSql + ' AC_INOUTTYPE, ';
  stSql := stSql + ' AC_RESULTTYPE, ';
  stSql := stSql + ' AC_NAME, ';
  stSql := stSql + ' AC_SYSTEM )';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + '' + aInoutType + ', ';
  stSql := stSql + '' + aResultType + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aSystem + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ATTENDPOSITION_VALUE(aCode,
  aName,aDeviceType, aStartButton,
  aOffButton, aInoutDeviceType, aWorkOutButton, aWorkInButton : string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATTENDPOSITION (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AP_CODE,';
  stSql := stSql + ' AP_NAME, ';
  stSql := stSql + ' AP_DEVICETYPE, ';
  stSql := stSql + ' AP_ATSTARTBUTTON, ';
  stSql := stSql + ' AP_ATOFFBUTTON, ';
  stSql := stSql + ' AP_INOUTDEVICETYPE, ';
  stSql := stSql + ' AP_WORKOUTBUTTON, ';
  stSql := stSql + ' AP_WORKINBUTTON )';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aDeviceType + ''',';
  stSql := stSql + '''' + aStartButton + ''',';
  stSql := stSql + '''' + aOffButton + ''',';
  stSql := stSql + '''' + aInoutDeviceType + ''',';
  stSql := stSql + '''' + aWorkOutButton + ''',';
  stSql := stSql + '''' + aWorkInButton + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ATTENDWORKTYPE_VALUE(aCode, aName,aNotBackupType,
  aSaturdayType, aFixATType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATTENDWORKTYPE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AW_CODE,';
  stSql := stSql + ' AW_NAME,';
  stSql := stSql + ' AW_NOTBACKUPTYPE, ';
  stSql := stSql + ' AW_SATURDAYTYPE,';
  stSql := stSql + ' AW_FIXATTYPE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aNotBackupType + ''',';
  stSql := stSql + '''' + aSaturdayType + ''',';
  stSql := stSql + '''' + aFixATType + ''')';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_BMSCONFIG_All(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE, aDetail: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_BMSCONFIG (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' BC_CONFIGGROUP,';
  stSql := stSql + ' BC_CONFIGCODE,';
  stSql := stSql + ' BC_CONFIGVALUE,';
  stSql := stSql + ' BC_CONFIGDETAIL) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCONFIGGROUP + ''', ';
  stSql := stSql + '''' + aCONFIGCODE + ''', ';
  stSql := stSql + '''' + aCONFIGVALUE + ''',';
  stSql := stSql + '''' + aDetail + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_BUILDINGCODE_All(aCode, aCodeName, aSeq,
  aUsed, aViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_BUILDINGCODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' BC_BUILDINGNAME, ';
  stSql := stSql + ' BC_DEEPSEQ, ';
  stSql := stSql + ' BC_CODEUSE, ';
  stSql := stSql + ' BC_VIEWSEQ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aCodeName + ''', ';
  stSql := stSql + '' + aSeq + ', ';
  stSql := stSql + '''' + aUsed + ''', ';
  stSql := stSql + '' + aViewSeq + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_BUILDINGMAP_Code(aBuildingCode,aType,
  aDeepSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_BUILDINGMAP (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' BM_TYPE,';
  stSql := stSql + ' BC_DEEPSEQ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '' + aType + ', ';
  stSql := stSql + '' + aDeepSeq + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDBUTTONEVENTSTAT_Init(aDate, aNodeNo,
  aEcuID, aExtendID, aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDBUTTONEVENTSTAT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CB_DAY,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DO_DOORNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '' + aDoorNo + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDDELETEEVENT_Complete(aYear, aWeekDay,
  aWeek, aData: string): Boolean;
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

  stSql := ' Insert Into TB_CARDDELETEEVENT( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CD_YEAR,';
  stSql := stSql + ' CD_WEEK,';
  stSql := stSql + ' ' + stFieldName + ')' ;
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aYear + ''', ';
  stSql := stSql + '' + aWeekDay + ', ';
  stSql := stSql + '''' + aData + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDDELETEHISTORY_Value(aDate, aEmSeq,
  aOldDate, aNewDate: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDDELETEHISTORY (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CH_DATE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' CH_OLDENDDATE,';
  stSql := stSql + ' CH_NEWENDDATE,';
  stSql := stSql + ' CH_INSERTDATE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + aOldDate + ''', ';
  stSql := stSql + '''' + aNewDate + ''', ';
  stSql := stSql + '''' + formatDateTime('yyyymmddhhnnsszzz',now) + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDFTPDOWNLIST_Value(aNodeNo, aEcuID,
  aProgress, aRcvAck, aRetryCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDFTPDOWNLIST (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' CF_SENDPROGRESS,';
  stSql := stSql + ' CF_RCVACK,';
  stSql := stSql + ' CF_RETRYCNT) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '''' + aProgress + ''', ';
  stSql := stSql + '''' + aRcvAck + ''', ';
  stSql := stSql + '' + aRetryCount + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDGUBUN_All(aCode, aCodeName,
  aRelayType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDGUBUN (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CA_CARDGUBUN,';
  stSql := stSql + ' CA_CARDGUBUNNAME,';
  stSql := stSql + ' CA_RELAYTYPE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aCodeName + ''', ';
  stSql := stSql + '' + aRelayType + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDHIS_CopyCard(aCardNo, aOldCardNo,
  aWorkMode: string): Boolean;
var
  stSql : string;
  stInsertTime : string;
begin
  stInsertTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  //stSql := ' SET IDENTITY_INSERT  TB_CARDHIS ON ';
  //result := dmDataBase.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_CARDHIS( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CA_OLDCARDNO,';
  stSql := stSql + ' CA_STATECODE,';
  stSql := stSql + ' CA_CARDGUBUN,';
  stSql := stSql + ' CA_POSITIONNUM,';
  stSql := stSql + ' CA_RELAYID,';
  stSql := stSql + ' CA_GRADEUSE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' CA_LASTUSEDATE,';
  stSql := stSql + ' CA_UPDATETIME,';
  stSql := stSql + ' CA_WORKMODE,';
  stSql := stSql + ' CA_INSERTTIME,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' CA_PCIP)';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + '''' + aOldCardNo + ''',';
  stSql := stSql + ' CA_STATECODE,';
  stSql := stSql + ' CA_CARDGUBUN,';
  stSql := stSql + ' CA_POSITIONNUM,';
  stSql := stSql + ' CA_RELAYID,';
  stSql := stSql + ' CA_GRADEUSE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' CA_LASTUSEDATE,';
  stSql := stSql + ' CA_UPDATETIME,';
  stSql := stSql + '''' + aWorkMode + ''',';
  stSql := stSql + '''' + stInsertTime + ''',';
  stSql := stSql + '''' + G_stAdminUserID + ''',';
  stSql := stSql + '''' + GetLocalIPAddr + '''  ';
  stSql := stSql + ' From TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + '''';
  result := dmDataBase.ProcessExecSQL(stSql);
  //stSql := ' SET IDENTITY_INSERT  TB_CARDHIS OFF ';
  //result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_GRADE(aCompanyCode,
  aNodeNo, aEcuID,aExtendID, aType, aNumber, aPermit, aDeep, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDPERMITCOMPANYGROUP (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID, ';
  stSql := stSql + ' CP_TYPE, ';
  stSql := stSql + ' CP_NUMBER, ';
  stSql := stSql + ' CP_PERMIT, ';
  stSql := stSql + ' CO_DEEPSEQ, ';
  stSql := stSql + ' CP_APPLY) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aType + ''', ';
  stSql := stSql + '' + aNumber + ', ';
  stSql := stSql + '''' + aPermit + ''', ';
  stSql := stSql + '' + aDeep + ', ';
  stSql := stSql + '''' + aApply + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_LikeCompanyArmAreaPermitAdd(
  aCompanyCode, aNodeNo, aEcuID, aExtendID, aArmAreaNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDPERMITCOMPANYGROUP (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID, ';
  stSql := stSql + ' CP_TYPE, ';
  stSql := stSql + ' CP_NUMBER, ';
  stSql := stSql + ' CP_PERMIT, ';
  stSql := stSql + ' CO_DEEPSEQ, ';
  stSql := stSql + ' CP_APPLY) ';
  stSql := stSql + ' Select ';
  stSql := stSql + ' A.GROUP_CODE,';
  stSql := stSql + ' A.CO_COMPANYCODE , ';
  stSql := stSql + ' ' + aNodeNo + ',';
  stSql := stSql + ' ''' + aEcuID + ''',';
  stSql := stSql + ' ' + aExtendID + ',';
  stSql := stSql + ' ''2'',';
  stSql := stSql + ' ' + aArmAreaNo + ',';
  stSql := stSql + ' ''1'',';
  stSql := stSql + ' A.CO_DEEPSEQ , ';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' From TB_COMPANYCODE A ';
  stSql := stSql + ' Where A.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND A.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  stSql := stSql + ' AND NOT EXISTS ( ';
  stSql := stSql + ' SELECT * FROM TB_CARDPERMITCOMPANYGROUP B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = A.GROUP_CODE ';
  stSql := stSql + ' AND B.CO_COMPANYCODE = A.CO_COMPANYCODE ';
  stSql := stSql + ' AND B.ND_NODENO = ' + aNodeNo + ' ' ;
  stSql := stSql + ' AND B.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND B.CP_TYPE = ''2''  ';
  stSql := stSql + ' AND B.CP_NUMBER = ' + aArmAreaNo + '   ';
  stSql := stSql + ' )';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITCOMPANYGROUP_LikeCompanyDoorPermitAdd(
  aCompanyCode, aNodeNo, aEcuID, aExtendID, aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDPERMITCOMPANYGROUP (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID, ';
  stSql := stSql + ' CP_TYPE, ';
  stSql := stSql + ' CP_NUMBER, ';
  stSql := stSql + ' CP_PERMIT, ';
  stSql := stSql + ' CO_DEEPSEQ, ';
  stSql := stSql + ' CP_APPLY) ';
  stSql := stSql + ' Select ';
  stSql := stSql + ' A.GROUP_CODE,';
  stSql := stSql + ' A.CO_COMPANYCODE , ';
  stSql := stSql + ' ' + aNodeNo + ',';
  stSql := stSql + ' ''' + aEcuID + ''',';
  stSql := stSql + ' ' + aExtendID + ',';
  stSql := stSql + ' ''1'',';
  stSql := stSql + ' ' + aDoorNo + ',';
  stSql := stSql + ' ''1'',';
  stSql := stSql + ' A.CO_DEEPSEQ , ';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' From TB_COMPANYCODE A ';
  stSql := stSql + ' Where A.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND A.CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  stSql := stSql + ' AND NOT EXISTS ( ';
  stSql := stSql + ' SELECT * FROM TB_CARDPERMITCOMPANYGROUP B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = A.GROUP_CODE ';
  stSql := stSql + ' AND B.CO_COMPANYCODE = A.CO_COMPANYCODE ';
  stSql := stSql + ' AND B.ND_NODENO = ' + aNodeNo + ' ' ;
  stSql := stSql + ' AND B.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND B.CP_TYPE = ''1''  ';
  stSql := stSql + ' AND B.CP_NUMBER = ' + aDoorNo + ')   ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

{
function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_AllEmployeeCode(
  aNodeNo, aEcuID,aExtendID, aType, aNumber, aPermit, aDeep, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDPERMITCOMPANYGROUP (';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID, ';
  stSql := stSql + ' CP_TYPE, ';
  stSql := stSql + ' CP_NUMBER, ';
  stSql := stSql + ' CP_PERMIT, ';
  stSql := stSql + ' CO_DEEPSEQ, ';
  stSql := stSql + ' CP_APPLY) ';
  stSql := stSql + ' Select ';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + ' EM_SEQ, ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aType + ''', ';
  stSql := stSql + '' + aNumber + ', ';
  stSql := stSql + '''' + aPermit + ''', ';
  stSql := stSql + '' + aDeep + ', ';
  stSql := stSql + '''' + aApply + '''  ';
  stSql := stSql + ' From TB_EMPLOYEE ';

  result := dmDataBase.ProcessExecSQL(stSql);
end; }

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_ATTypeAdd: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' AA.GROUP_CODE,';
  stSql := stSql + ' AA.EM_SEQ,';
  stSql := stSql + ' AA.ND_NODENO,';
  stSql := stSql + ' AA.DE_ECUID,';
  stSql := stSql + ' AA.DE_EXTENDID,';
  stSql := stSql + '''1'',';    //출입문타입 1 방범구역 타입 2
  stSql := stSql + ' AA.DO_DOORNO,';
  stSql := stSql + '''1'',';    //출입권한 부여
  stSql := stSql + '''N'', ';    //권한 부여 처리 안함
  stSql := stSql + '''N'' ';    //권한 부여 처리 안함
  stSql := stSql + ' From ( select a.*,c.EM_SEQ from (select * from TB_DOOR where DO_ATTYPE = ''1'') a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID  ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Inner Join (select * from TB_EMPLOYEE where EM_ATUSE = ''1'') c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE) )AA';
  stSql := stSql + ' Where AA.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE BB ';
  stSql := stSql + ' WHERE BB.GROUP_CODE = AA.GROUP_CODE ';
  stSql := stSql + ' AND BB.EM_SEQ = AA.EM_SEQ ';
  stSql := stSql + ' AND BB.ND_NODENO = AA.ND_NODENO' ;
  stSql := stSql + ' AND BB.DE_ECUID = AA.DE_ECUID  ';
  stSql := stSql + ' AND BB.CP_TYPE = ''1''  ';
  stSql := stSql + ' AND BB.CP_NUMBER = AA.DO_DOORNO)   ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAllArmAreaToEmCode(
  aEmSeq,aPermit,aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ''+ aEmSeq +',';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + '''2'',';    //출입문타입 1 방범구역 타입 2
  stSql := stSql + 'AR_ARMAREANO,';
  stSql := stSql + '''' + aPermit + ''',';    //출입권한 부여
  stSql := stSql + '''' + aApply +''', ';    //권한 부여 처리 안함
  stSql := stSql + '''' + aApply +''' ';    //권한 부여 처리 안함
//  stSql := stSql + ' From TB_ARMAREA ';
  stSql := stSql + ' From ( select a.* from TB_ARMAREA a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID  ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
//  stSql := stSql + ' AND AR_ARMAREAUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAllDoorToEmCode(
  aEmSeq,aPermit,aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' aa.GROUP_CODE,';
  stSql := stSql + ''+ aEmSeq +',';
  stSql := stSql + 'aa.ND_NODENO,';
  stSql := stSql + 'aa.DE_ECUID,';
  stSql := stSql + 'aa.DE_EXTENDID,';
  stSql := stSql + '''1'',';    //출입문타입 1 방범구역 타입 2
  stSql := stSql + 'aa.DO_DOORNO,';
  stSql := stSql + '''' + aPermit + ''',';    //출입권한 부여
  stSql := stSql + '''' + aApply + ''', ';    //권한 부여 처리 안함
  stSql := stSql + '''' + aApply + ''' ';    //권한 부여 처리 안함
  stSql := stSql + ' From ( select a.* from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID  ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  //stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
  if G_bAttendDedicateDoorUse then stSql := stSql + ' AND (a.DO_ATTYPE <> ''1'' or a.DO_ATTYPE is null) ';
  if G_bFoodDedicateDoorUse then stSql := stSql + ' AND (a.DO_FDTYPE <> ''1'' or a.DO_FDTYPE is null) ';
  stSql := stSql + ') aa ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAttendDoorToEmCode(
  aNodeNo, aEcuID,aDoorNo, aPermit, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '0,';
  stSql := stSql + '''1'',';    //출입문타입 1 방범구역 타입 2
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aPermit + ''',';    //출입권한 부여
  stSql := stSql + '''' + aApply + ''', ';    //권한 부여 처리 안함
  stSql := stSql + '''' + aApply + ''' ';    //권한 부여 처리 안함
  stSql := stSql + ' From TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_ATUSE = ''1'' ';  //근태 사용자는 넣자.
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = TB_EMPLOYEE.GROUP_CODE ';
  stSql := stSql + ' AND B.EM_SEQ = TB_EMPLOYEE.EM_SEQ ';
  stSql := stSql + ' AND B.ND_NODENO = ' + aNodeNo + '' ;
  stSql := stSql + ' AND B.DE_ECUID = ''' + aEcuID + '''  ';
  stSql := stSql + ' AND B.DE_EXTENDID = 0  ';
  stSql := stSql + ' AND B.CP_TYPE = ''1''  ';
  stSql := stSql + ' AND B.CP_NUMBER = ' + aDoorNo + ')   ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyAttendEmCodeToDoor(
  aEmSeq, aPermit, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ''+ aEmSeq +',';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + '''1'',';    //출입문타입 1 방범구역 타입 2
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + '''' + aPermit + ''',';    //출입권한 부여
  stSql := stSql + '''' + aApply + ''', ';    //권한 부여 처리 안함
  stSql := stSql + '''' + aApply + ''' ';    //권한 부여 처리 안함
  stSql := stSql + ' From TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
  stSql := stSql + ' AND DO_ATTYPE = ''1'' ';   //근태전용 출입문
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = TB_DOOR.GROUP_CODE ';
  stSql := stSql + ' AND B.ND_NODENO = TB_DOOR.ND_NODENO ';
  stSql := stSql + ' AND B.DE_ECUID = TB_DOOR.DE_ECUID  ';
  stSql := stSql + ' AND B.DE_EXTENDID = TB_DOOR.DE_EXTENDID  ';
  stSql := stSql + ' AND B.CP_TYPE = ''1''  ';
  stSql := stSql + ' AND B.CP_NUMBER = TB_DOOR.DO_DOORNO  ';
  stSql := stSql + ' AND B.EM_SEQ = ' + aEmSeq + ')   ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyFoodDoorToEmCode(
  aNodeNo, aEcuID,aDoorNo, aPermit, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '0,';
  stSql := stSql + '''1'',';    //출입문타입 1 방범구역 타입 2
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aPermit + ''',';    //출입권한 부여
  stSql := stSql + '''' + aApply + ''', ';    //권한 부여 처리 안함
  stSql := stSql + '''' + aApply + ''' ';    //권한 부여 처리 안함
  stSql := stSql + ' From TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_FDUSE = ''1'' ';  //식수 사용자는 넣자.
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = TB_EMPLOYEE.GROUP_CODE ';
  stSql := stSql + ' AND B.EM_SEQ = TB_EMPLOYEE.EM_SEQ ';
  stSql := stSql + ' AND B.ND_NODENO = ' + aNodeNo + '' ;
  stSql := stSql + ' AND B.DE_ECUID = ''' + aEcuID + '''  ';
  stSql := stSql + ' AND B.DE_EXTENDID = 0  ';
  stSql := stSql + ' AND B.CP_TYPE = ''1''  ';
  stSql := stSql + ' AND B.CP_NUMBER = ' + aDoorNo + ')   ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_CopyFoodEmCodeToDoor(
  aEmSeq, aPermit, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ''+ aEmSeq +',';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + '''1'',';    //출입문타입 1 방범구역 타입 2
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + '''' + aPermit + ''',';    //출입권한 부여
  stSql := stSql + '''' + aApply + ''', ';    //권한 부여 처리 안함
  stSql := stSql + '''' + aApply + ''' ';    //권한 부여 처리 안함
  stSql := stSql + ' From TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DO_DOORUSE = ''1'' ';  //출입문 사용 하는 경우의 데이터만 넣자.
  stSql := stSql + ' AND DO_FDTYPE = ''1'' ';   //식수전용 출입문
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = TB_DOOR.GROUP_CODE ';
  stSql := stSql + ' AND B.ND_NODENO = TB_DOOR.ND_NODENO ';
  stSql := stSql + ' AND B.DE_ECUID = TB_DOOR.DE_ECUID  ';
  stSql := stSql + ' AND B.DE_EXTENDID = TB_DOOR.DE_EXTENDID  ';
  stSql := stSql + ' AND B.CP_TYPE = ''1''  ';
  stSql := stSql + ' AND B.CP_NUMBER = TB_DOOR.DO_DOORNO  ';
  stSql := stSql + ' AND B.EM_SEQ = ' + aEmSeq + ')   ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_FDTypeAdd: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' AA.GROUP_CODE,';
  stSql := stSql + ' AA.EM_SEQ,';
  stSql := stSql + ' AA.ND_NODENO,';
  stSql := stSql + ' AA.DE_ECUID,';
  stSql := stSql + ' AA.DE_EXTENDID,';
  stSql := stSql + '''1'',';    //출입문타입 1 방범구역 타입 2
  stSql := stSql + ' AA.DO_DOORNO,';
  stSql := stSql + '''1'',';    //출입권한 부여
  stSql := stSql + '''N'', ';    //권한 부여 처리 안함
  stSql := stSql + '''N'' ';    //권한 부여 처리 안함
  stSql := stSql + ' From ( select a.*,c.EM_SEQ from (select * from TB_DOOR where DO_FDTYPE = ''1'' AND DO_DOORUSE = ''1'') a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID  ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' inner Join (select * from TB_EMPLOYEE where EM_FDUSE = ''1'') c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE) )AA';
  stSql := stSql + ' Where AA.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_CARDPERMITEMPLOYEECODE BB ';
  stSql := stSql + ' WHERE BB.GROUP_CODE = AA.GROUP_CODE ';
  stSql := stSql + ' AND BB.EM_SEQ = AA.EM_SEQ ';
  stSql := stSql + ' AND BB.ND_NODENO = AA.ND_NODENO' ;
  stSql := stSql + ' AND BB.DE_ECUID = AA.DE_ECUID  ';
  stSql := stSql + ' AND BB.CP_TYPE = ''1''  ';
  stSql := stSql + ' AND BB.CP_NUMBER = AA.DO_DOORNO)   ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq, aNodeNo,
  aEcuID, aExtendID, aType, aNumber, aPermit, aApply,aEmApprove: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  if isDigit(aEmApprove) then stSql := stSql + 'EM_APPROVE,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY ) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + ''+ aEmSeq +',';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '' + aExtendID + ',';
  stSql := stSql + '''' + aType + ''',';    //출입문타입 1 방범구역 타입 2
  stSql := stSql + '' + aNumber + ',';
  stSql := stSql + '''' + aPermit + ''',';    //권한 부여
  if isDigit(aEmApprove) then stSql := stSql + '' + aEmApprove + ',';
  stSql := stSql + '''' + aApply + ''', ';
  stSql := stSql + '''' + aApply + ''') ';    //권한 부여 처리 여부

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_GRADE(aEmGroupCode,
  aNodeNo, aEcuID,aExtendID, aType, aNumber, aPermit, aDeep, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDPERMITEMPLOYEEGROUP (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_GROUPCODE,';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID, ';
  stSql := stSql + ' CP_TYPE, ';
  stSql := stSql + ' CP_NUMBER, ';
  stSql := stSql + ' CP_PERMIT, ';
  stSql := stSql + ' EM_DEEPSEQ, ';
  stSql := stSql + ' CP_APPLY) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aEmGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aType + ''', ';
  stSql := stSql + '' + aNumber + ', ';
  stSql := stSql + '''' + aPermit + ''', ';
  stSql := stSql + '' + aDeep + ', ';
  stSql := stSql + '''' + aApply + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_LikeEmGroupArmAreaPermitAdd(
  aEmGroupCode, aNodeNo, aEcuID, aExtendID, aArmAreaNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDPERMITEMPLOYEEGROUP (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_GROUPCODE,';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID, ';
  stSql := stSql + ' CP_TYPE, ';
  stSql := stSql + ' CP_NUMBER, ';
  stSql := stSql + ' CP_PERMIT, ';
  stSql := stSql + ' CO_DEEPSEQ, ';
  stSql := stSql + ' CP_APPLY) ';
  stSql := stSql + ' Select ';
  stSql := stSql + ' A.GROUP_CODE,';
  stSql := stSql + ' A.EM_GROUPCODE , ';
  stSql := stSql + ' ' + aNodeNo + ',';
  stSql := stSql + ' ''' + aEcuID + ''',';
  stSql := stSql + ' ' + aExtendID + ',';
  stSql := stSql + ' ''2'',';
  stSql := stSql + ' ' + aArmAreaNo + ',';
  stSql := stSql + ' ''1'',';
  stSql := stSql + ' A.EM_DEEPSEQ , ';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' From TB_EMPLOYEEGROUPCODE A ';
  stSql := stSql + ' Where A.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND A.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' ';
  stSql := stSql + ' AND NOT EXISTS ( ';
  stSql := stSql + ' SELECT * FROM TB_CARDPERMITEMPLOYEEGROUP B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = A.GROUP_CODE ';
  stSql := stSql + ' AND B.EM_GROUPCODE = A.EM_GROUPCODE ';
  stSql := stSql + ' AND B.ND_NODENO = ' + aNodeNo + ' ' ;
  stSql := stSql + ' AND B.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND B.CP_TYPE = ''2''  ';
  stSql := stSql + ' AND B.CP_NUMBER = ' + aArmAreaNo + ')   ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEEGROUP_LikeEmGroupDoorPermitAdd(
  aEmGroupCode, aNodeNo, aEcuID, aExtendID, aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDPERMITEMPLOYEEGROUP (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_GROUPCODE,';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID, ';
  stSql := stSql + ' CP_TYPE, ';
  stSql := stSql + ' CP_NUMBER, ';
  stSql := stSql + ' CP_PERMIT, ';
  stSql := stSql + ' CO_DEEPSEQ, ';
  stSql := stSql + ' CP_APPLY) ';
  stSql := stSql + ' Select ';
  stSql := stSql + ' A.GROUP_CODE,';
  stSql := stSql + ' A.EM_GROUPCODE , ';
  stSql := stSql + ' ' + aNodeNo + ',';
  stSql := stSql + ' ''' + aEcuID + ''',';
  stSql := stSql + ' ' + aExtendID + ',';
  stSql := stSql + ' ''1'',';
  stSql := stSql + ' ' + aDoorNo + ',';
  stSql := stSql + ' ''1'',';
  stSql := stSql + ' A.EM_DEEPSEQ , ';
  stSql := stSql + ' ''N'' ';
  stSql := stSql + ' From TB_EMPLOYEEGROUPCODE A ';
  stSql := stSql + ' Where A.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND A.EM_GROUPCODE Like ''' + aEmGroupCode + '%'' ';
  stSql := stSql + ' AND NOT EXISTS ( ';
  stSql := stSql + ' SELECT * FROM TB_CARDPERMITEMPLOYEEGROUP B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = A.GROUP_CODE ';
  stSql := stSql + ' AND B.EM_GROUPCODE = A.EM_GROUPCODE ';
  stSql := stSql + ' AND B.ND_NODENO = ' + aNodeNo + ' ' ;
  stSql := stSql + ' AND B.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND B.CP_TYPE = ''1''  ';
  stSql := stSql + ' AND B.CP_NUMBER = ' + aDoorNo + ')   ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMIT_CardChange(aNewCardNo,
  aOldCard: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMIT(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_DOOR1,';
  stSql := stSql + ' CP_DOOR2,';
  stSql := stSql + ' CP_DOOR3,';
  stSql := stSql + ' CP_DOOR4,';
  stSql := stSql + ' CP_DOOR5,';
  stSql := stSql + ' CP_DOOR6,';
  stSql := stSql + ' CP_DOOR7,';
  stSql := stSql + ' CP_DOOR8,';
  stSql := stSql + ' CP_ARMAREA0,';
  stSql := stSql + ' CP_ARMAREA1,';
  stSql := stSql + ' CP_ARMAREA2,';
  stSql := stSql + ' CP_ARMAREA3,';
  stSql := stSql + ' CP_ARMAREA4,';
  stSql := stSql + ' CP_ARMAREA5,';
  stSql := stSql + ' CP_ARMAREA6,';
  stSql := stSql + ' CP_ARMAREA7,';
  stSql := stSql + ' CP_ARMAREA8,';
  stSql := stSql + ' CP_RCVACK , ';
  stSql := stSql + ' CP_MEMLOAD ) ';
  stSql := stSql + ' Select ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + '''' + aNewCardNo + ''',';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_DOOR1,';
  stSql := stSql + ' CP_DOOR2,';
  stSql := stSql + ' CP_DOOR3,';
  stSql := stSql + ' CP_DOOR4,';
  stSql := stSql + ' CP_DOOR5,';
  stSql := stSql + ' CP_DOOR6,';
  stSql := stSql + ' CP_DOOR7,';
  stSql := stSql + ' CP_DOOR8,';
  stSql := stSql + ' CP_ARMAREA0,';
  stSql := stSql + ' CP_ARMAREA1,';
  stSql := stSql + ' CP_ARMAREA2,';
  stSql := stSql + ' CP_ARMAREA3,';
  stSql := stSql + ' CP_ARMAREA4,';
  stSql := stSql + ' CP_ARMAREA5,';
  stSql := stSql + ' CP_ARMAREA6,';
  stSql := stSql + ' CP_ARMAREA7,';
  stSql := stSql + ' CP_ARMAREA8,';
  stSql := stSql + '''N'', ';
  stSql := stSql + '''N'' ';
  stSql := stSql + ' From TB_CARDPERMIT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aOldCard + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMIT_DeviceAddCardNo(aNodeNo,
  aEcuID: string; aDoorPermit, aArmPermitType: integer): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMIT(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_DOOR1,';
  stSql := stSql + ' CP_DOOR2,';
  stSql := stSql + ' CP_DOOR3,';
  stSql := stSql + ' CP_DOOR4,';
  stSql := stSql + ' CP_DOOR5,';
  stSql := stSql + ' CP_DOOR6,';
  stSql := stSql + ' CP_DOOR7,';
  stSql := stSql + ' CP_DOOR8,';
  stSql := stSql + ' CP_ARMAREA0,';
  stSql := stSql + ' CP_ARMAREA1,';
  stSql := stSql + ' CP_ARMAREA2,';
  stSql := stSql + ' CP_ARMAREA3,';
  stSql := stSql + ' CP_ARMAREA4,';
  stSql := stSql + ' CP_ARMAREA5,';
  stSql := stSql + ' CP_ARMAREA6,';
  stSql := stSql + ' CP_ARMAREA7,';
  stSql := stSql + ' CP_ARMAREA8,';
  stSql := stSql + ' CP_RCVACK , ';
  stSql := stSql + ' CP_MEMLOAD ) ';
  stSql := stSql + ' Select ';
  stSql := stSql + ' GROUP_CODE ,';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + ' 0,';
  stSql := stSql + ' CA_CARDNO,';
  if (aDoorPermit = 1) or (aArmPermitType = 1) then
  begin
    stSql := stSql + ' ''1'',';
  end else
  begin
    stSql := stSql + ' ''0'',';
  end;
  if (aDoorPermit = 1) then
  begin
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
  end else
  begin
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
  end;
  if (aArmPermitType = 1) then
  begin
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
    stSql := stSql + ' ''1'',';
  end else
  begin
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
    stSql := stSql + ' ''0'',';
  end;
  stSql := stSql + '''N'', ';
  stSql := stSql + '''N'' ';
  stSql := stSql + ' From (select a.* from TB_CARD a  ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ';
  stSql := stSql + ' AND b.EM_ACUSE = ''1'') ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_STATECODE = ''1'' ';     //등록된 모든 카드의 권한 부여

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMIT_DoorPermit(aNodeNo, aEcuID,
  aExtendID, aCardNo, aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMIT(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_DOOR' + aDoorNo + ',';
  stSql := stSql + ' CP_RCVACK,';
  stSql := stSql + ' CP_MEMLOAD , ';
  stSql := stSql + ' CP_CARDTYPE ) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''1'', ';
  stSql := stSql + '''1'', ';
  stSql := stSql + '''N'' , ';
  stSql := stSql + '''N'' , ';
  stSql := stSql + '''1'' ) ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(aNodeNo, aEcuID, aExtendID,
  aCardNo, aPermit, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6, aDoor7,
  aDoor8, aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4, aArmArea5,
  aArmArea6, aArmArea7, aArmArea8:string;aPassword:string='';aCardType:string='1'): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMIT(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_DOOR1,';
  stSql := stSql + ' CP_DOOR2,';
  stSql := stSql + ' CP_DOOR3,';
  stSql := stSql + ' CP_DOOR4,';
  stSql := stSql + ' CP_DOOR5,';
  stSql := stSql + ' CP_DOOR6,';
  stSql := stSql + ' CP_DOOR7,';
  stSql := stSql + ' CP_DOOR8,';
  stSql := stSql + ' CP_ARMAREA0,';
  stSql := stSql + ' CP_ARMAREA1,';
  stSql := stSql + ' CP_ARMAREA2,';
  stSql := stSql + ' CP_ARMAREA3,';
  stSql := stSql + ' CP_ARMAREA4,';
  stSql := stSql + ' CP_ARMAREA5,';
  stSql := stSql + ' CP_ARMAREA6,';
  stSql := stSql + ' CP_ARMAREA7,';
  stSql := stSql + ' CP_ARMAREA8,';
  stSql := stSql + ' CP_RCVACK,';
  stSql := stSql + ' CP_MEMLOAD , ';
  stSql := stSql + ' CP_PASSWD , ';
  stSql := stSql + ' CP_CARDTYPE ) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aPermit + ''', ';
  stSql := stSql + '''' + aDoor1 + ''', ';
  stSql := stSql + '''' + aDoor2 + ''', ';
  stSql := stSql + '''' + aDoor3 + ''', ';
  stSql := stSql + '''' + aDoor4 + ''', ';
  stSql := stSql + '''' + aDoor5 + ''', ';
  stSql := stSql + '''' + aDoor6 + ''', ';
  stSql := stSql + '''' + aDoor7 + ''', ';
  stSql := stSql + '''' + aDoor8 + ''', ';
  stSql := stSql + '''' + aArmArea0 + ''', ';
  stSql := stSql + '''' + aArmArea1 + ''', ';
  stSql := stSql + '''' + aArmArea2 + ''', ';
  stSql := stSql + '''' + aArmArea3 + ''', ';
  stSql := stSql + '''' + aArmArea4 + ''', ';
  stSql := stSql + '''' + aArmArea5 + ''', ';
  stSql := stSql + '''' + aArmArea6 + ''', ';
  stSql := stSql + '''' + aArmArea7 + ''', ';
  stSql := stSql + '''' + aArmArea8 + ''', ';
  stSql := stSql + '''N'' , ';
  stSql := stSql + '''N'' , ';
  stSql := stSql + '''' + aPassword + ''' , ';
  stSql := stSql + '''' + aCardType + ''' ) ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_CARDPRINTLIST_Value(aPrintNo,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDPRINTLIST (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CA_PRINTNO,';
  stSql := stSql + ' CA_CARDNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aPrintNo + ''', ';
  stSql := stSql + '''' + aCardNo + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARDSTATE_All(aCode, aCodeName1,
  aCodeName2: string;aCodeName3:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARDSTATE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CA_STATECODE,';
  stSql := stSql + ' CA_STATECODENAME1, ';
  stSql := stSql + ' CA_STATECODENAME2, ';
  stSql := stSql + ' CA_STATECODENAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aCodeName1 + ''', ';
  stSql := stSql + 'N''' + aCodeName2 + ''', ';
  stSql := stSql + 'N''' + aCodeName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CARD_Value(aCardNo, aCardState, aCardGubun,
  aPositionNum, aRelayID, aGradeUse, aEmSeq: string;aCardPrintNo:string=''): Boolean;
var
  stSql : string;
  stUpdateTime : string;
begin
  stUpdateTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  stSql := 'Insert Into TB_CARD (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CA_STATECODE, ';
  stSql := stSql + ' CA_CARDGUBUN, ';
  stSql := stSql + ' CA_POSITIONNUM, ';
  stSql := stSql + ' CA_RELAYID, ';
  stSql := stSql + ' CA_GRADEUSE, ';
  stSql := stSql + ' EM_SEQ, ';
  if aCardPrintNo <> '' then stSql := stSql + ' CA_PRINTNO, ';
  stSql := stSql + ' CA_LASTUSEDATE, ';
  stSql := stSql + ' CA_UPDATETIME, ';
  stSql := stSql + ' AD_USERID) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aCardState + ''', ';
  stSql := stSql + '' + aCardGubun + ', ';
  stSql := stSql + '' + aPositionNum + ', ';
  stSql := stSql + '' + aRelayID + ', ';
  stSql := stSql + '''' + aGradeUse + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  if aCardPrintNo <> '' then stSql := stSql + '''' + aCardPrintNo + ''', ';
  stSql := stSql + '''' + copy(stUpdateTime,1,8) + ''', ';
  stSql := stSql + '''' + stUpdateTime + ''', ';
  stSql := stSql + '''' + G_stAdminUserID + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CCTV_Value(aCCTVNo, aCCTVIp, aCCTVName,
  aCCTVPort, aUserID, aUserPW: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CCTV (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CT_NO,';
  stSql := stSql + ' CT_NAME, ';
  stSql := stSql + ' CT_IP, ';
  stSql := stSql + ' CT_PORT, ';
  stSql := stSql + ' CT_USERID, ';
  stSql := stSql + ' CT_USERPW) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCCTVNo + ', ';
  stSql := stSql + '''' + aCCTVIp + ''', ';
  stSql := stSql + 'N''' + aCCTVName + ''', ';
  stSql := stSql + '''' + aCCTVPort + ''', ';
  stSql := stSql + '''' + aUserID + ''', ';
  stSql := stSql + '''' + aUserPW + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CERTIFICATECLASSCODE_Value(aCode, aName, aSeq,
  aUsed, aViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CERTIFICATECLASSCODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CC_CODE,';
  stSql := stSql + ' CC_CODENAME, ';
  stSql := stSql + ' CC_DEEPSEQ, ';
  stSql := stSql + ' CC_CODEUSE, ';
  stSql := stSql + ' CC_VIEWSEQ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '' + aSeq + ', ';
  stSql := stSql + '''' + aUsed + ''', ';
  stSql := stSql + '' + aViewSeq + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CertificateCode_Value(aSeq, aName, aClassCode,
  aCertificateAmt, aOrganize, aIssuAmt, aMasterAmt,aHompage: string): Boolean;
var
  stSql : string;
begin
  if Not isdigit(aCertificateAmt) then aCertificateAmt := '0';
  if Not isdigit(aIssuAmt) then aIssuAmt := '0';
  if Not isdigit(aMasterAmt) then aMasterAmt := '0';

  stSql := 'Insert Into TB_CertificateCode (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CF_CODE,';
  stSql := stSql + ' CF_NAME, ';
  stSql := stSql + ' CC_CODE, ';
  stSql := stSql + ' CF_AMT, ';
  stSql := stSql + ' CF_ORGANIZER,';
  stSql := stSql + ' CF_CERTIISSUAMT,';
  stSql := stSql + ' CF_MASTERAMT, ';
  stSql := stSql + ' CF_HOMEPAGE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aSeq + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aClassCode + ''', ';
  stSql := stSql + '' + aCertificateAmt + ', ';
  stSql := stSql + '''' + aOrganize + ''', ';
  stSql := stSql + '' + aIssuAmt + ', ';
  stSql := stSql + '' + aMasterAmt + ', ';
  stSql := stSql + '''' + aHompage + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CertificateID_Value(aCertificateCode, aEmSeq,
  aCertificateID, aCertificatePW: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CertificateID (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CF_CODE,';
  stSql := stSql + ' EM_SEQ, ';
  stSql := stSql + ' CI_ID, ';
  stSql := stSql + ' CI_PW) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCertificateCode + ', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + aCertificateID + ''', ';
  stSql := stSql + '''' + aCertificatePW + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CertificatePassGrade_Value(aCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CertificatePassGrade (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CG_CODE,';
  stSql := stSql + ' CG_NAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + '''' + aName + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CertificatePlan_Value(aCode, aDate, aSeq,
  aFromDate, aToDate, aResultDate: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CertificatePlan (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CF_CODE,';
  stSql := stSql + ' CP_DATE, ';
  stSql := stSql + ' CP_SEQ, ';
  stSql := stSql + ' CP_RECEIPTFROM, ';
  stSql := stSql + ' CP_RECEIPTTO,';
  stSql := stSql + ' CP_RESULTDATE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '' + aSeq + ', ';
  stSql := stSql + '''' + aFromDate + ''', ';
  stSql := stSql + '''' + aToDate + ''', ';
  stSql := stSql + '''' + aResultDate + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CertificateReceipt_Value(aCode, aDate, aEmSeq,
  aRegistDate, aRAmt, aIssu, aIssuAmt,aMasterIssu,aMasterIssuAmt,aPass: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CertificateReceipt (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CF_CODE,';
  stSql := stSql + ' CP_DATE, ';
  stSql := stSql + ' EM_SEQ, ';
  stSql := stSql + ' CR_DATE, ';
  stSql := stSql + ' CR_RECEIPTAMT,';
  stSql := stSql + ' CR_CertificateIssu,';
  stSql := stSql + ' CR_CertificateIssuAMT, ';
  stSql := stSql + ' CR_CertificateMasterIssu, ';
  stSql := stSql + ' CR_CertificateMasterIssuAMT, ';
  stSql := stSql + ' CR_CertificatePass) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + aRegistDate + ''', ';
  stSql := stSql + '' + aRAmt + ', ';
  stSql := stSql + '' + aIssu + ', ';
  stSql := stSql + '' + aIssuAmt + ', ';
  stSql := stSql + '' + aMasterIssu + ', ';
  stSql := stSql + '' + aMasterIssuAmt + ', ';
  stSql := stSql + '' + aPass + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_COMPANYCODE_All(aCode, aCodeName, aSeq,
  aUsed,aViewSeq: string;aRelayCompanyCode:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_COMPANYCODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_COMPANYNAME, ';
  stSql := stSql + ' CO_DEEPSEQ, ';
  stSql := stSql + ' CO_CODEUSE, ';
  stSql := stSql + ' CO_RELAYCOMPANYCODE,';
  stSql := stSql + ' CO_VIEWSEQ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aCodeName + ''', ';
  stSql := stSql + '' + aSeq + ', ';
  stSql := stSql + '''' + aUsed + ''', ';
  stSql := stSql + '''' + aRelayCompanyCode + ''', ';
  stSql := stSql + '' + aViewSeq + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CONFIG_All(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE, aDetail: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CONFIG (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_CONFIGGROUP,';
  stSql := stSql + ' CO_CONFIGCODE,';
  stSql := stSql + ' CO_CONFIGVALUE,';
  stSql := stSql + ' CO_CONFIGDETAIL) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCONFIGGROUP + ''', ';
  stSql := stSql + '''' + aCONFIGCODE + ''', ';
  stSql := stSql + '''' + aCONFIGVALUE + ''',';
  stSql := stSql + 'N''' + aDetail + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_consultinggroupphonenum_Value(aHandphone,
  aCgNum: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aCgNum) then aCgNum := '0';

  stSql := 'Insert Into TB_consultinggroupphonenum (';
  stSql := stSql + ' cg_phonenumber,';
  stSql := stSql + ' cg_num)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aHandphone + ''', ';
  stSql := stSql + '' + aCgNum + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_consultinglist_Value(aDate, aGroupNum, aPhone,
  aMemo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_consultinglist (';
  stSql := stSql + ' cg_date,';
  stSql := stSql + ' cg_num, ';
  stSql := stSql + ' cg_phonenumber,';
  stSql := stSql + ' cg_memo)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '' + aGroupNum + ', ';
  stSql := stSql + '''' + aPhone + ''', ';
  stSql := stSql + '''' + aMemo + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_CurriculumCode_Value(aLectureSeq, aName,
  aLectureClassCode, aBookName,aBookAmt, aMonth, aGubun, aMainTeacher, aSubTeacher,
  aTime, aSun,aMon,aTue,aWed,aThu,aFri,aSat: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aBookAmt) then aBookAmt := '0';
  if Not isDigit(aMonth) then aMonth := '0';

  stSql := 'Insert Into TB_CurriculumCode (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CC_CODE,';
  stSql := stSql + ' CC_NAME, ';
  stSql := stSql + ' LC_CODE,';
  stSql := stSql + ' CC_BOOKNAME,';
  stSql := stSql + ' CC_BOOKAMT,';
  stSql := stSql + ' CC_MONTH,';
  stSql := stSql + ' CC_GUBUN,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' AD_SUBUSERID,';
  stSql := stSql + ' CC_HH,';
  stSql := stSql + ' CC_SUN,';
  stSql := stSql + ' CC_MON,';
  stSql := stSql + ' CC_TUE,';
  stSql := stSql + ' CC_WED,';
  stSql := stSql + ' CC_THU,';
  stSql := stSql + ' CC_FRI,';
  stSql := stSql + ' CC_SAT)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aLectureSeq + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aLectureClassCode + ''', ';
  stSql := stSql + 'N''' + aBookName + ''', ';
  stSql := stSql + '' + aBookAmt + ', ';
  stSql := stSql + '' + aMonth + ', ';
  stSql := stSql + '' + aGubun + ', ';
  stSql := stSql + '''' + aMainTeacher + ''', ';
  stSql := stSql + '''' + aSubTeacher + ''', ';
  stSql := stSql + '' + aTime + ', ';
  stSql := stSql + '''' + aSun + ''', ';
  stSql := stSql + '''' + aMon + ''', ';
  stSql := stSql + '''' + aTue + ''', ';
  stSql := stSql + '''' + aWed + ''', ';
  stSql := stSql + '''' + aThu + ''', ';
  stSql := stSql + '''' + aFri + ''', ';
  stSql := stSql + '''' + aSat + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DECODER_ALL(aDecoderNo, aDecoderSockType,
  aDecoderName, aDecoderIP, aDevicePort, aControlPort,aFTPPort,aDirectPort: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DECODER (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_DECODERNO,';
  stSql := stSql + ' ND_DECODERSOCKTYPE, ';
  stSql := stSql + ' ND_DECODERNAME,';
  stSql := stSql + ' ND_DECODERIP,';
  stSql := stSql + ' ND_DECODERDEVICEPORT,';
  stSql := stSql + ' ND_DECODERCONTROLPORT,';
  stSql := stSql + ' ND_DECORDERFTPPORT,';
  stSql := stSql + ' ND_DIRECTPORT)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aDecoderNo + ', ';
  stSql := stSql + '' + aDecoderSockType + ', ';
  stSql := stSql + 'N''' + aDecoderName + ''', ';
  stSql := stSql + '''' + aDecoderIP + ''', ';
  stSql := stSql + '' + aDevicePort + ', ';
  stSql := stSql + '' + aControlPort + ', ';
  stSql := stSql + '' + aFTPPort + ', ';
  stSql := stSql + '' + aDirectPort + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DEVICERCV_DeviceInit(aNodeNo, aEcuID,aExtendNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DEVICERCV (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendNo + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DEVICE_DeviceInit(aNodeNo, aEcuID,aExtendNo,
  aDeviceName: string;aUse:string='0';aBuildingCode:string='0'): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DE_DEVICENAME, ';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + ' DE_DEVICEUSE ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendNo + ', ';
  stSql := stSql + 'N''' + aDeviceName + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aUse + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DOORGUBUN_Value(aCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DOORGUBUN (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DG_CODE,';
  stSql := stSql + ' DG_NAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DOORRCV_DeviceDoorInit(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DOORRCV (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DO_DOORNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '''' + aDoorNo + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DOORSCHEDULE_All(aNodeNo, aECUID, aDOORNO,
  aDayCode, a1Time, a2Time, a3Time, a4Time, a5Time, a1Mode, a2Mode, a3Mode,
  a4Mode, a5Mode, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_DOORSCHEDULE (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + 'DS_DAYCODE,';
  stSql := stSql + 'DS_TIME1,';
  stSql := stSql + 'DS_TIME2,';
  stSql := stSql + 'DS_TIME3,';
  stSql := stSql + 'DS_TIME4,';
  stSql := stSql + 'DS_TIME5,';
  stSql := stSql + 'DS_TIMEMODE1,';
  stSql := stSql + 'DS_TIMEMODE2,';
  stSql := stSql + 'DS_TIMEMODE3,';
  stSql := stSql + 'DS_TIMEMODE4,';
  stSql := stSql + 'DS_TIMEMODE5,';
  stSql := stSql + 'DS_UPDATETIME,';
  stSql := stSql + 'AD_USERID,';
  stSql := stSql + 'DS_DEVICESYNC )';
  stSql := stSql + ' values (';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '0,';
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aDayCode + ''',';
  stSql := stSql + '''' + a1Time + ''',';
  stSql := stSql + '''' + a2Time + ''',';
  stSql := stSql + '''' + a3Time + ''',';
  stSql := stSql + '''' + a4Time + ''',';
  stSql := stSql + '''' + a5Time + ''',';
  stSql := stSql + '''' + a1Mode + ''',';
  stSql := stSql + '''' + a2Mode + ''',';
  stSql := stSql + '''' + a3Mode + ''',';
  stSql := stSql + '''' + a4Mode + ''',';
  stSql := stSql + '''' + a5Mode + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + '''' + G_stAdminUserID + ''',';
  stSql := stSql + '''' + aRcvAck + ''' ) ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DOORSTATECODE(aCode,
  aCodeName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DOORSTATECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DOORSTATE,';
  stSql := stSql + ' DE_DOORSTATENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + '''' + aCodeName + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DOORSTATEEVENT_Value(aDate, aTime, aNodeNo,
  aEcuID, aExtendID, aDoorNo, aDS, aInsertTime: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DOORSTATEEVENT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DATE,';
  stSql := stSql + ' DE_TIME,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' DE_DOORSTATE,';
  stSql := stSql + ' DE_INSERTTIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ',';
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aDS + ''', ';
  stSql := stSql + '''' + aInsertTime + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DOORTELEVENT_Password(aDate, aTime, aNodeNo,
  aEcuID, aExtendID, aDoorNo, aPassword: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DOORTELEVENT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DATE,';
  stSql := stSql + ' DE_TIME,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' DE_PASSWORD) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ',';
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aPassword + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DOORTELEVENT_TelNumber(aDate, aTime, aNodeNo,
  aEcuID, aExtendID, aDoorNo, aTelNumber: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DOORTELEVENT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' DE_DATE,';
  stSql := stSql + ' DE_TIME,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' DE_TELNUMBER) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ',';
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aTelNumber + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_DOOR_DeviceDoorInit(aNodeNo, aEcuID, aDoorNo,
  aDoorName: string;aDoorUse:string='0';aDoorView:string='0';aDoorMemo:string='';aBuildingCode:string='0'): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DOOR (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' DO_DOORUSE,';
  stSql := stSql + ' DO_VIEW,';
  stSql := stSql + ' DO_DOORNAME, ';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + ' DO_MEMO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aDoorUse + ''', ';
  stSql := stSql + '''' + aDoorView + ''', ';
  stSql := stSql + 'N''' + aDoorName + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aDoorMemo + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq, aNodeNo,
  aEcuID, aTimeCodeUse, aTimeGroup, aTime1, aTime2, aTime3, aTime4,
  aWeek: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEEDEVICETIMECODE (';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' EM_TIMECODEUSE,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_WEEKCODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '''' + aTimeCodeUse + ''', ';
  stSql := stSql + '''' + aTimeGroup + ''', ';
  stSql := stSql + '''' + aTime1 + ''', ';
  stSql := stSql + '''' + aTime2 + ''', ';
  stSql := stSql + '''' + aTime3 + ''', ';
  stSql := stSql + '''' + aTime4 + ''', ';
  stSql := stSql + '''' + aWeek + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_EMPLOYEEFINGER_Template(aEmSeq, aFingerSeq,
  aFingerTemplate1_1, aFingerTemplate1_2, aFingerTemplate2_1,
  aFingerTemplate2_2, aFingerTemplate3_1, aFingerTemplate3_2: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEEFINGER(';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' EF_SEQ,';
  stSql := stSql + ' EF_TEMPLATE1_1, ';
  stSql := stSql + ' EF_TEMPLATE1_2, ';
  stSql := stSql + ' EF_TEMPLATE2_1, ';
  stSql := stSql + ' EF_TEMPLATE2_2, ';
  stSql := stSql + ' EF_TEMPLATE3_1, ';
  stSql := stSql + ' EF_TEMPLATE3_2) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aFingerSeq + ', ';
  stSql := stSql + '''' + aFingerTemplate1_1 + ''', ';
  stSql := stSql + '''' + aFingerTemplate1_2 + ''', ';
  stSql := stSql + '''' + aFingerTemplate2_1 + ''', ';
  stSql := stSql + '''' + aFingerTemplate2_2 + ''', ';
  stSql := stSql + '''' + aFingerTemplate3_1 + ''', ';
  stSql := stSql + '''' + aFingerTemplate3_2 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_EMPLOYEEGROUPCODE_All(aCode, aName,
  aSeq,aUsed,aViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEEGROUPCODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_GROUPCODE,';
  stSql := stSql + ' EM_GROUPCODENAME, ';
  stSql := stSql + ' EM_DEEPSEQ, ';
  stSql := stSql + ' EM_CODEUSE, ';
  stSql := stSql + ' EM_VIEWSEQ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '' + aSeq + ', ';
  stSql := stSql + '''' + aUsed + ''', ';
  stSql := stSql + '' + aViewSeq + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_EMPLOYEEGUBUN_Value(aCode, aName,
  aViewSeq: string;aRelayCode:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEEGUBUN(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_GUBUNCODE,';
  stSql := stSql + ' EM_GUBUNCODENAME, ';
  stSql := stSql + ' EM_VIEWSEQ, ';
  stSql := stSql + ' EM_RELAYCODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '' + aViewSeq + ', ';
  stSql := stSql + '''' + aRelayCode + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(aEmSeq,
  aWorkMode: string): Boolean;
var
  stSql : string;
  stInsertTime : string;
begin
  stInsertTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  //stSql := ' SET IDENTITY_INSERT  TB_EMPLOYEEHIS ON ';
  //result := dmDataBase.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_EMPLOYEEHIS( ';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' EM_GUBUNCODE,';
  stSql := stSql + ' EM_COMPANYPHONE,';
  stSql := stSql + ' EM_HOMEPHONE,';
  stSql := stSql + ' EM_HANDPHONE,';
  stSql := stSql + ' EM_EMINFO,';
  stSql := stSql + ' EM_REGDATE,';
  stSql := stSql + ' EM_ENDDATE,';
  stSql := stSql + ' EM_ACUSE,';
  stSql := stSql + ' EM_ATUSE,';
  stSql := stSql + ' EM_FDUSE,';
  stSql := stSql + ' EM_GROUPCODE,';
  stSql := stSql + ' EM_GRADETYPE,';
  stSql := stSql + ' EM_WORKMODE,';
  stSql := stSql + ' EM_INSERTTIME,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' EM_PCIP ) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' EM_GUBUNCODE,';
  stSql := stSql + ' EM_COMPANYPHONE,';
  stSql := stSql + ' EM_HOMEPHONE,';
  stSql := stSql + ' EM_HANDPHONE,';
  stSql := stSql + ' EM_EMINFO,';
  stSql := stSql + ' EM_REGDATE,';
  stSql := stSql + ' EM_ENDDATE,';
  stSql := stSql + ' EM_ACUSE,';
  stSql := stSql + ' EM_ATUSE,';
  stSql := stSql + ' EM_FDUSE,';
  stSql := stSql + ' EM_GROUPCODE,';
  stSql := stSql + ' EM_GRADETYPE,';
  stSql := stSql + '''' + aWorkMode + ''',';
  stSql := stSql + '''' + stInsertTime + ''',';
  stSql := stSql + '''' + G_stAdminUserID + ''',';
  stSql := stSql + '''' + GetLocalIPAddr + '''  ';
  stSql := stSql + ' From TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + '';
  result := dmDataBase.ProcessExecSQL(stSql);

  //stSql := ' SET IDENTITY_INSERT  TB_EMPLOYEEHIS OFF ';
  //result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_EMPLOYEELectureHIS_Value(aEmSeq, aLectureSeq,
  aRegDate,aPayDate, aRegType, aEndDate, aLASTPAYDATE: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEELectureHIS(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' CC_CODE,';
  stSql := stSql + ' EL_REGDATE,';
  stSql := stSql + ' EL_PAYDATE,';
  stSql := stSql + ' EL_STATE,';
  stSql := stSql + ' EL_ENDDATE,';
  stSql := stSql + ' EL_LASTPAYDATE, ';
  stSql := stSql + ' EL_INSERTDATE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aLectureSeq + ', ';
  stSql := stSql + '''' + aRegDate + ''', ';
  stSql := stSql + '''' + aPayDate + ''', ';
  stSql := stSql + '' + aRegType + ', ';
  stSql := stSql + '''' + aEndDate + ''', ';
  stSql := stSql + '''' + aLASTPAYDATE + ''', ';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_EMPLOYEELecture_Value(aEmSeq, aLectureSeq,
  aRegDate,aPayDate, aRegType, aEndDate, aLASTPAYDATE: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEELecture(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' CC_CODE,';
  stSql := stSql + ' EL_REGDATE,';
  stSql := stSql + ' EL_PAYDATE,';
  stSql := stSql + ' EL_STATE,';
  stSql := stSql + ' EL_ENDDATE,';
  stSql := stSql + ' EL_LASTPAYDATE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aLectureSeq + ', ';
  stSql := stSql + '''' + aRegDate + ''', ';
  stSql := stSql + '''' + aPayDate + ''', ';
  stSql := stSql + '' + aRegType + ', ';
  stSql := stSql + '''' + aEndDate + ''', ';
  stSql := stSql + '''' + aLASTPAYDATE + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_EMPLOYEESTATECODE_Value(aCode, aName,
  aState: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEESTATECODE(';
  stSql := stSql + ' EM_STATECODE,';
  stSql := stSql + ' EM_STATECODENAME,';
  stSql := stSql + ' EM_STATE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aState + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_EMPLOYEE_Academy(aEmSeq, aEmName,
  aCompanyCode, aGubunCode, aCompanyPhone, ahandPhone, aEmninfo, aBirthday,
  aRegDate, aEndDate, aACType, aATType, aFdType, aEmGroupCode, aGradeType,
  aFingerUse, aEmStateCode, aAWCode, aCardUse, aEmail, aSchoolName, aGrade,
  aTuitionOFF,aPaymentday,aCgNum,aKey,aMon,aTue,aWed,aThu,aFri,aSat,aSun: string): Boolean;
var
  stSql : string;
begin
  if Not isdigit(aPaymentday) then aPaymentday := '0';
  if Not isDigit(aCgNum) then aCgNum := '0';

  stSql := 'Insert Into TB_EMPLOYEE(';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_GUBUNCODE,';
  stSql := stSql + ' EM_COMPANYPHONE,';
  stSql := stSql + ' EM_HANDPHONE,';
  stSql := stSql + ' EM_EMINFO,';
  stSql := stSql + ' EM_REGDATE,';
  stSql := stSql + ' EM_ENDDATE,';
  stSql := stSql + ' EM_ACUSE,';
  stSql := stSql + ' EM_ATUSE,';
  stSql := stSql + ' EM_FDUSE,';
  stSql := stSql + ' EM_GROUPCODE,';
  stSql := stSql + ' EM_GRADETYPE, ';
  stSql := stSql + ' EM_FINGERUSE, ';
  stSql := stSql + ' EM_STATECODE, ';
  stSql := stSql + ' AW_CODE, ';
  stSql := stSql + ' EM_CARDUSE, ';
  stSql := stSql + ' EM_BIRTHDAY, ';
  stSql := stSql + ' EM_EMAIL, ';
  stSql := stSql + ' EM_SCHOOL, ';
  stSql := stSql + ' EM_GRADE, ';
  stSql := stSql + ' TO_CODE, ';
  stSql := stSql + ' EM_PAYMENTDAY, ';
  stSql := stSql + ' CG_NUM, ';
  stSql := stSql + ' EM_KEY, ';
  stSql := stSql + ' EM_ACMON, ';
  stSql := stSql + ' EM_ACTUE, ';
  stSql := stSql + ' EM_ACWED, ';
  stSql := stSql + ' EM_ACTHU, ';
  stSql := stSql + ' EM_ACFRI, ';
  stSql := stSql + ' EM_ACSAT, ';
  stSql := stSql + ' EM_ACSUN) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + 'N''' + aEmName + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '' + aGubunCode + ', ';
  stSql := stSql + 'N''' + aCompanyPhone + ''', ';
  stSql := stSql + '''' + ahandPhone + ''', ';
  stSql := stSql + 'N''' + aEmninfo + ''', ';
  stSql := stSql + '''' + aRegDate + ''', ';
  stSql := stSql + '''' + aEndDate + ''', ';
  stSql := stSql + '''' + aACType + ''', ';
  stSql := stSql + '''' + aATType + ''', ';
  stSql := stSql + '''' + aFdType + ''', ';
  stSql := stSql + '''' + aEmGroupCode + ''', ';
  stSql := stSql + '' + aGradeType + ', ';
  stSql := stSql + '''' + aFingerUse + ''', ';
  stSql := stSql + '' + aEmStateCode + ', ';
  stSql := stSql + '' + aAWCode + ', ';
  stSql := stSql + '' + aCardUse + ', ';
  stSql := stSql + '''' + aBirthday + ''', ';
  stSql := stSql + '''' + aEmail + ''', ';
  stSql := stSql + '''' + aSchoolName + ''', ';
  stSql := stSql + '''' + aGrade + ''', ';
  stSql := stSql + '' + aTuitionOFF + ', ';
  stSql := stSql + '' + aPaymentday + ', ';
  stSql := stSql + '' + aCgNum + ', ';
  stSql := stSql + '''' + MimeEncodeString(aKey) + ''', ';
  stSql := stSql + '''' + aMon + ''', ';
  stSql := stSql + '''' + aTue + ''', ';
  stSql := stSql + '''' + aWed + ''', ';
  stSql := stSql + '''' + aThu + ''', ';
  stSql := stSql + '''' + aFri + ''', ';
  stSql := stSql + '''' + aSat + ''', ';
  stSql := stSql + '''' + aSun + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_EMPLOYEE_Value(aEmSeq, aEmCode, aEmName,
  aCompanyCode, aPosiCode, aGubunCode, aCompanyPhone, aHomePhone, ahandPhone,
  aEmninfo, aRegDate, aEndDate, aACType,aATType, aFdType, aEmGroupCode,
  aGradeType,aFingerUse,aEmStateCode,aAWCode,aCardUse:string;aRelayUse:string='0';
  aRelayDate:string='';aRelayCode:string='';aEmApprove:string= '1'): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEE(';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' EM_GUBUNCODE,';
  stSql := stSql + ' EM_COMPANYPHONE,';
  stSql := stSql + ' EM_HOMEPHONE,';
  stSql := stSql + ' EM_HANDPHONE,';
  stSql := stSql + ' EM_EMINFO,';
  stSql := stSql + ' EM_REGDATE,';
  stSql := stSql + ' EM_ENDDATE,';
  stSql := stSql + ' EM_ACUSE,';
  stSql := stSql + ' EM_ATUSE,';
  stSql := stSql + ' EM_FDUSE,';
  stSql := stSql + ' EM_GROUPCODE,';
  stSql := stSql + ' EM_GRADETYPE, ';
{  stSql := stSql + ' EM_TIMECODEUSE, ';
  stSql := stSql + ' TC_GROUP, ';
  stSql := stSql + ' TC_TIME1, ';
  stSql := stSql + ' TC_TIME2, ';
  stSql := stSql + ' TC_TIME3, ';
  stSql := stSql + ' TC_TIME4, ';
  stSql := stSql + ' TC_WEEKCODE, '; }
  stSql := stSql + ' EM_FINGERUSE, ';
  stSql := stSql + ' EM_STATECODE, ';
  stSql := stSql + ' AW_CODE, ';
  stSql := stSql + ' EM_CARDUSE, ';
  stSql := stSql + ' EM_RELAYUSE, ';
  stSql := stSql + ' EM_RELAYDATE, ';
  stSql := stSql + ' EM_RELAYCODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + 'N''' + aEmCode + ''', ';
  stSql := stSql + 'N''' + aEmName + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '' + aPosiCode + ', ';
  stSql := stSql + '' + aGubunCode + ', ';
  stSql := stSql + 'N''' + aCompanyPhone + ''', ';
  stSql := stSql + '''' + aHomePhone + ''', ';
  stSql := stSql + '''' + ahandPhone + ''', ';
  stSql := stSql + 'N''' + aEmninfo + ''', ';
  stSql := stSql + '''' + aRegDate + ''', ';
  stSql := stSql + '''' + aEndDate + ''', ';
  stSql := stSql + '''' + aACType + ''', ';
  stSql := stSql + '''' + aATType + ''', ';
  stSql := stSql + '''' + aFdType + ''', ';
  stSql := stSql + '''' + aEmGroupCode + ''', ';
  stSql := stSql + '' + aGradeType + ', ';
{  stSql := stSql + '''' + aTimeCodeUse + ''', ';
  stSql := stSql + '''' + aTimeGroup + ''', ';
  stSql := stSql + '''' + aTime1 + ''', ';
  stSql := stSql + '''' + aTime2 + ''', ';
  stSql := stSql + '''' + aTime3 + ''', ';
  stSql := stSql + '''' + aTime4 + ''', ';
  stSql := stSql + '''' + aWeekCode + ''', ';   }
  stSql := stSql + '''' + aFingerUse + ''', ';
  stSql := stSql + '' + aEmStateCode + ', ';
  stSql := stSql + '' + aAWCode + ', ';
  stSql := stSql + '' + aCardUse + ', ';
  stSql := stSql + '' + aRelayUse + ', ';
  stSql := stSql + '''' + aRelayDate + ''', ';
  stSql := stSql + '''' + aRelayCode + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FINGERAPPROVALNUM_Value(aFingerUserID,
  aFingerDeviceID,aEmSeq,aDeviceIP: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FINGERAPPROVALNUM(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FN_DEVICESEQ,';
  stSql := stSql + ' CA_POSITIONNUM,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' FD_SEND,';
  stSql := stSql + ' FN_DEVICEIP,';
  stSql := stSql + ' FD_INSERTTIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aFingerDeviceID + ', ';
  stSql := stSql + '' + aFingerUserID + ', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''N'', ';
  stSql := stSql + '''' + aDeviceIP + ''', ';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',now) + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FINGERDEVICECARD_Value(aFnSeq,
  aCardPOSITIONNUM, aEMSEQ, aPermit,aSend: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FINGERDEVICECARD(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FN_DEVICESEQ,';
  stSql := stSql + ' CA_POSITIONNUM,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' FD_SEND) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aFnSeq + ', ';
  stSql := stSql + '' + aCardPOSITIONNUM + ', ';
  stSql := stSql + '' + aEMSEQ + ', ';
  stSql := stSql + '''' + aPermit + ''', ';
  stSql := stSql + '''' + aSend + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FINGERDEVICE_Value(aFnSeq, aDeviceIP,
  aDeviceName, aPort, aDeviceType, aCPType, aNodeNo, aEcuID, aExtendID,
  aDoorNo,aFingerDeviceID: string;aBuildingCode:string='0'): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FINGERDEVICE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FN_DEVICESEQ,';
  stSql := stSql + ' FN_DEVICEIP,';
  stSql := stSql + ' FN_DEVICENAME,';
  stSql := stSql + ' FN_DEVICEPORT,';
  stSql := stSql + ' FN_DEVICETYPE,';
  stSql := stSql + ' CP_TYPE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DO_DOORNO, ';
  stSql := stSql + ' FN_FINGERDEVICEID, ';
  stSql := stSql + ' BC_BUILDINGCODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aFnSeq + ', ';
  stSql := stSql + '''' + aDeviceIP + ''', ';
  stSql := stSql + 'N''' + aDeviceName + ''', ';
  stSql := stSql + '''' + aPort + ''', ';
  stSql := stSql + '' + aDeviceType + ', ';
  stSql := stSql + '''' + aCPType + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '' + aDoorNo + ', ';
  stSql := stSql + '' + aFingerDeviceID + ', ';
  stSql := stSql + '''' + aBuildingCode + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FIREGROUP_All(aCode, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FIREGROUP(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FG_GROUPCODE,';
  stSql := stSql + ' FG_GROUPCODENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aName + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FOODCODECOUNT_Value(aDate, aFDTYPE, aFOCODE,
  aCount: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aCount) then aCount := '0';

  stSql := 'Insert Into TB_FOODCODECOUNT(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FC_DATE,';
  stSql := stSql + ' RE_FDTYPE,';
  stSql := stSql + ' FO_CODE,';
  stSql := stSql + ' FC_COUNT) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aFDTYPE + ''', ';
  stSql := stSql + '' + aFOCODE + ', ';
  stSql := stSql + '' + aCount + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FOODCODE_Value(aFdType, aFdCode, aFdName,
  aStartTime, aEndTime, aAmt,aFoodOutTime: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aAmt) then aAmt := '0';

  stSql := 'Insert Into TB_FOODCODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' RE_FDTYPE,';
  stSql := stSql + ' FO_CODE,';
  stSql := stSql + ' FO_NAME,';
  stSql := stSql + ' FO_STARTTIME,';
  stSql := stSql + ' FO_ENDTIME,';
  stSql := stSql + ' FO_AMT, ';
  stSql := stSql + ' FO_INITTIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aFdType + ''', ';
  stSql := stSql + '' + aFdCode + ', ';
  stSql := stSql + 'N''' + aFdName + ''', ';
  stSql := stSql + '''' + aStartTime + ''', ';
  stSql := stSql + '''' + aEndTime + ''', ';
  stSql := stSql + '' + aAmt + ', ';
  stSql := stSql + '''' + aFoodOutTime + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FOODEVENT_Value(aDate, aTime, aEmSeq, aNodeNo,
  aEcuId, aReaderNo, aExtendID, aDoorNo, aFdType, aFoCode,aEmCode, aEmName,
  aCompanyCode, aPermitCode, aAmt,aFGCODE: string;aCardNo:string=''): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aEmSeq) then aEmSeq := '0';
  if Not isDigit(aAmt) then aAmt := '0';
  if Not isDigit(aFGCODE) then aFGCODE := '0';


  stSql := 'Insert Into TB_FOODEVENT(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FE_DATE,';
  stSql := stSql + ' FE_TIME,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' RE_READERNO,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' RE_FDTYPE,';
  stSql := stSql + ' FO_CODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' AP_PERMITCODE,';
  stSql := stSql + ' FO_AMT,';
  stSql := stSql + ' FG_CODE,';
  if aCardNo <> '' then stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' FE_INSERTTIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuId + ''', ';
  stSql := stSql + '' + aReaderNo + ', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '' + aDoorNo + ', ';
  stSql := stSql + '''' + aFdType + ''', ';
  stSql := stSql + '' + aFoCode + ', ';
  stSql := stSql + 'N''' + aEmCode + ''', ';
  stSql := stSql + 'N''' + aEmName + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aPermitCode + ''', ';
  stSql := stSql + '' + aAmt + ', ';
  stSql := stSql + '' + aFGCODE + ', ';
  if aCardNo <> '' then stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FOODGROUP_Value(aCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FOODGROUP(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FG_CODE,';
  stSql := stSql + ' FG_NAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FOODOUTCOUNT_Value(aFDDate, aFdType, aFdCode,
  aFCCount: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FOODOUTCOUNT(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FC_DATE,';
  stSql := stSql + ' RE_FDTYPE,';
  stSql := stSql + ' FO_CODE,';
  stSql := stSql + ' FC_COUNT) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aFDDate + ''', ';
  stSql := stSql + '''' + aFdType + ''', ';
  stSql := stSql + '''' + aFdCode + ''', ';
  stSql := stSql + '' + aFCCount + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_FOODTYPE_Value(aFdType,
  aName:string;aFdYesterTime: string='0400'): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FOODTYPE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' RE_FDTYPE,';
  stSql := stSql + ' RE_FDTYPENAME, ';
  stSql := stSql + ' FT_YESTERDAYTIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aFdType + ''', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aFdYesterTime + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FORMCRITICAL_Value(aCode, aMenuType, aName,
  aCriticalType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FORMCRITICAL(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FC_CRITICALID,';
  stSql := stSql + ' FC_MENUTYPE, ';
  stSql := stSql + ' FC_MENUNAME1, ';
  stSql := stSql + ' FC_MENUNAME2, ';
  stSql := stSql + ' FC_MENUNAME3, ';
  stSql := stSql + ' FC_CRITICALTYPE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + '''' + aMenuType + ''', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '' + aCriticalType + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FORMMESSAGE_All(aCode, aName1,
  aName2: string;aName3:string=''): Boolean;
var
  stSql : string;
begin
  if aName3 = '' then aName3 := aName2;

  stSql := 'Insert Into TB_FORMMESSAGE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FM_MESSAGECODE,';
  stSql := stSql + ' FM_MESSAGENAME1,';
  stSql := stSql + ' FM_MESSAGENAME2, ';
  stSql := stSql + ' FM_MESSAGENAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aName1 + ''', ';
  stSql := stSql + 'N''' + aName2 + ''', ';
  stSql := stSql + 'N''' + aName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_FORMNAME_All(aProgramGubun, aMenuGubun,aMenuGroup, aCode,
  aName1, aName2,aView: string;aName3:string=''): Boolean;
var
  stSql : string;
begin
  if aName3 = '' then aName3 := aName2;

  stSql := 'Insert Into TB_FORMNAME(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FN_PROGRAMGUBUN,';
  stSql := stSql + ' FN_MENUGUBUN,';
  stSql := stSql + ' FN_MENUGROUP,';
  stSql := stSql + ' FN_NAMECODE,';
  stSql := stSql + ' FN_NAME1,';
  stSql := stSql + ' FN_NAME2, ';
  stSql := stSql + ' FN_NAME3, ';
  stSql := stSql + ' FN_VIEW) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aProgramGubun + ''', ';
  stSql := stSql + '' + aMenuGubun + ', ';
  stSql := stSql + '' + aMenuGroup + ', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aName1 + ''', ';
  stSql := stSql + 'N''' + aName2 + ''', ';
  stSql := stSql + 'N''' + aName3 + ''', ';
  stSql := stSql + '''' + aView + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_GUESTEVENT_Value(aDate, aTime, aNodeNo,
  aEcuID, aExtendID, aDoorNo, aCardNo, aReaderNo, aButton, aDoorPosition,
  aBuildingPosition, aControlType, aDoorMode, aCardMode, aPermitCode,
  aArmAreaNo, aVisitDate, aEmCode: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aArmAreaNo) then aArmAreaNo := '0';

  stSql := 'Insert Into TB_GUESTEVENT (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AE_DATE,';
  stSql := stSql + ' AE_TIME,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' RE_READERNO,';
  stSql := stSql + ' AE_BUTTON,';
  stSql := stSql + ' RP_DOORPOSITIONCODE,';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODE,';
  stSql := stSql + ' AE_CONTROLTYPECODE,';
  stSql := stSql + ' AE_DOORMODE,';
  stSql := stSql + ' AE_CARDMODE,';
  stSql := stSql + ' AP_PERMITCODE,';
  stSql := stSql + ' AR_ARMAREANO,';
  stSql := stSql + ' GL_DATE, ';
  stSql := stSql + ' GL_CODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '' + aDoorNo + ', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '' + aReaderNo + ', ';
  stSql := stSql + '''' + aButton + ''', ';
  stSql := stSql + '''' + aDoorPosition + ''', ';
  stSql := stSql + '''' + aBuildingPosition + ''', ';
  stSql := stSql + '''' + aControlType + ''', ';
  stSql := stSql + '''' + aDoorMode + ''', ';
  stSql := stSql + '''' + aCardMode + ''', ';
  stSql := stSql + '''' + aPermitCode + ''', ';
  stSql := stSql + '' + aArmAreaNo + ', ';
  stSql := stSql + '''' + aVisitDate + ''', ';
  stSql := stSql + '''' + aEmCode + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_GUESTLIST_Value(aGlDate,aEmSeq, aGlCode, aGlName,
  aGlFromTime, aGlToTime, aCompanyName, aHandPhone, aCardNo, aChange, aWorkFlag,aAreaCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_GUESTLIST(';
  stSql := stSql + ' EM_SEQ ,';
  stSql := stSql + ' GL_DATE  , ';
  stSql := stSql + ' GL_CODE ,';
  stSql := stSql + ' GL_NAME,';
  stSql := stSql + ' GL_FROMTIME ,';
  stSql := stSql + ' GL_TOTIME,';
  stSql := stSql + ' GL_COMPANYNAME ,';
  stSql := stSql + ' GL_TELNUMBER , ';
  stSql := stSql + ' GL_CARDNO , ';
//  stSql := stSql + ' GL_APPGATENIGHT, ';
  stSql := stSql + ' GL_CHANGEFLAG , ';
  stSql := stSql + ' GL_WORKFLAG , ';
  stSql := stSql + ' GL_AREACODE , ';
  stSql := stSql + ' GL_UPDATETIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + aGlDate + ''', ';
  stSql := stSql + '''' + aGlCode + ''', ';
  stSql := stSql + 'N''' + aGlName + ''', ';
  stSql := stSql + '''' + aGlFromTime + ''', ';
  stSql := stSql + '''' + aGlToTime + ''', ';
  stSql := stSql + 'N''' + aCompanyName + ''', ';
  stSql := stSql + '''' + aHandPhone + ''', ';
  stSql := stSql + '''' + aCardNo + ''', ';
//  stSql := stSql + '''' + aAppGateNight + ''', ';
  stSql := stSql + '''' + aChange + ''', ';
  stSql := stSql + '' + aWorkFlag + ', ';
  stSql := stSql + '''' + aAreaCode + ''', ';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_HOLIDAY_All(aDay, aAcUse, aAtUse, aName1,
  aName2: string;aName3:string=''): Boolean;
var
  stSql : string;
begin
  if aName3 = '' then aName3 := aName2;
  stSql := 'Insert Into TB_HOLIDAY(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' HO_DAY,';
  stSql := stSql + ' HO_ACUSE,';
  stSql := stSql + ' HO_ATUSE,';
  stSql := stSql + ' HO_NAME1,';
  stSql := stSql + ' HO_NAME2, ';
  stSql := stSql + ' HO_NAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDay + ''', ';
  stSql := stSql + '''' + aAcUse + ''', ';
  stSql := stSql + '''' + aAtUse + ''', ';
  stSql := stSql + 'N''' + aName1 + ''', ';
  stSql := stSql + 'N''' + aName2 + ''', ';
  stSql := stSql + 'N''' + aName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_HOLIDAY_Value(aDay, aName, aAcUse,
  aAtUse,aHoType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_HOLIDAY(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' HO_DAY,';
  stSql := stSql + ' HO_ACUSE,';
  stSql := stSql + ' HO_ATUSE,';
  stSql := stSql + ' HO_TYPE,';
  stSql := stSql + ' HO_NAME' + inttostr(G_nFormLanguageType) + ') ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDay + ''', ';
  stSql := stSql + '''' + aAcUse + ''', ';
  stSql := stSql + '''' + aAtUse + ''', ';
  stSql := stSql + '' + aHoType + ', ';
  stSql := stSql + 'N''' + aName+ ''' ) ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_LectureClassCode_Value(aCode, aName, aSeq,
  aUsed, aViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_LectureClassCode(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' LC_CODE,';
  stSql := stSql + ' LC_CODENAME, ';
  stSql := stSql + ' LC_DEEPSEQ, ';
  stSql := stSql + ' LC_CODEUSE, ';
  stSql := stSql + ' LC_VIEWSEQ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '' + aSeq + ', ';
  stSql := stSql + '''' + aUsed + ''', ';
  stSql := stSql + '' + aViewSeq + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_LecturePayment(aEMSEQ, aLPMONTH,aLPLECTUREAMT,aTOCODE,aTOAMT, aLPCARDTYPE,aLPAMT,
  aLPPayDate, aLPMEMO: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_LecturePayment(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' LP_MONTH, ';
  stSql := stSql + ' LP_LECTUREAMT,'; //수강료
  stSql := stSql + ' TO_CODE,';       //할인코드
  stSql := stSql + ' TO_AMT,';       //할인금액
  stSql := stSql + ' LP_CARDTYPE, ';
  stSql := stSql + ' LP_AMT, ';
  stSql := stSql + ' LP_PayDate, ';
  stSql := stSql + ' LP_MEMO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aEMSEQ + ', ';
  stSql := stSql + '''' + aLPMONTH + ''', ';
  stSql := stSql + '' + aLPLECTUREAMT + ', ';
  stSql := stSql + '' + aTOCODE + ', ';
  stSql := stSql + '' + aTOAMT + ', ';
  stSql := stSql + '' + aLPCARDTYPE + ', ';
  stSql := stSql + '' + aLPAMT + ', ';
  stSql := stSql + '''' + aLPPayDate + ''', ';
  stSql := stSql + '''' + aLPMEMO + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_LecturePaymentSummary_Value(aMonth, aEMSeq,
  aType, aDate: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_LecturePaymentSummary(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' LP_MONTH,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' LP_PaymentType,';
  stSql := stSql + ' LP_PayDate) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aMonth + ''', ';
  stSql := stSql + '' + aEMSeq + ', ';
  stSql := stSql + '' + aType + ', ';
  stSql := stSql + '''' + aDate + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_NODEDEVICETYPECODE_All(aNodeDeviceTypeCode,
  aName1, aName2, aName3,aPgType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_NODEDEVICETYPECODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_DEVICETYPE,';
  stSql := stSql + ' ND_DEVICETYPENAME1,';
  stSql := stSql + ' ND_DEVICETYPENAME2,';
  stSql := stSql + ' ND_DEVICETYPENAME3, ';
  stSql := stSql + ' ND_PGTYPE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeDeviceTypeCode + ', ';
  stSql := stSql + 'N''' + aName1 + ''', ';
  stSql := stSql + 'N''' + aName2 + ''', ';
  stSql := stSql + 'N''' + aName3 + ''', ';
  stSql := stSql + '' + aPgType + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_NODERCV_NodeIp(aNodeNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_NODERCV(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_NODE_NodeIp(aNodeNo,aSockType,aDeviceID,
  aNodeIP,aNodeName,aNodeDeviceType,aServerNo: string;aBuildingCode:string='0';aTelNumber:string='';aAddr:string='';aAddDate:string=''): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aNodeDeviceType) then aNodeDeviceType := '0';
  if Not isDigit(aServerNo) then aServerNo := '1';

  stSql := 'Insert Into TB_NODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' ND_SOCKETTYPE,';
  stSql := stSql + ' ND_DEVICEID,';
  stSql := stSql + ' ND_NODEIP,';
  stSql := stSql + ' ND_NODENAME,';
  stSql := stSql + ' ND_DEVICETYPE,';
  stSql := stSql + ' ND_DECODERNO,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' ND_TELNUM,';
  stSql := stSql + ' ND_ADDR ,';
  stSql := stSql + ' ND_ADDDATE,';
  stSql := stSql + ' ND_MEMLOAD )';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aSockType + ''', ';
  stSql := stSql + '''' + aDeviceID + ''', ';
  stSql := stSql + '''' + aNodeIP + ''', ';
  stSql := stSql + 'N''' + aNodeName + ''', ';
  stSql := stSql + '' + aNodeDeviceType + ', ';
  stSql := stSql + '' + aServerNo + ', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aTelNumber + ''', ';
  stSql := stSql + '''' + aAddr + ''', ';
  stSql := stSql + '''' + aAddDate + ''', ';
  stSql := stSql + '''N'') ';
  ClipBoard.SetTextBuf(PChar(stSql));

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_POSICODE_DefaultValue(aCode, aName,
  aCompanyCode,aViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_POSICODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' PO_POSICODENAME,';
  stSql := stSql + ' CO_COMPANYCODE, ';
  stSql := stSql + ' PO_VIEWSEQ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '' + aViewSeq + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_READERBUILDINGPOSITIONCODE_All(aCode, aName1,
  aName2: string;aName3:string=''): Boolean;
var
  stSql : string;
begin
  if aName3 = '' then aName3 := aName2;

  stSql := 'Insert Into TB_READERBUILDINGPOSITIONCODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODE,';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODENAME1,';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODENAME2, ';
  stSql := stSql + ' RP_BUILDINGPOSITIONCODENAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aName1 + ''', ';
  stSql := stSql + 'N''' + aName2 + ''', ';
  stSql := stSql + 'N''' + aName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_READERDOORPOSITIONCODE_All(aCode, aName1,
  aName2: string;aName3:string=''): Boolean;
var
  stSql : string;
begin
  if aName3 = '' then aName3 := aName2;
  stSql := 'Insert Into TB_READERDOORPOSITIONCODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' RP_DOORPOSITIONCODE,';
  stSql := stSql + ' RP_DOORPOSITIONCODENAME1,';
  stSql := stSql + ' RP_DOORPOSITIONCODENAME2, ';
  stSql := stSql + ' RP_DOORPOSITIONCODENAME3) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aCode + ''', ';
  stSql := stSql + 'N''' + aName1 + ''', ';
  stSql := stSql + 'N''' + aName2 + ''', ';
  stSql := stSql + 'N''' + aName3 + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_READERRCV_ReaderInit(aNodeNo, aEcuID,
  aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_READERRCV (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' RE_READERNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aReaderNo + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_READER_ReaderInit(aNodeNo, aEcuID, aReaderNo: string;aBuildingCode:string='0'): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_READER (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' RE_READERNO, ';
  stSql := stSql + ' BC_BUILDINGCODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aReaderNo + ', ';
  stSql := stSql + '''' + aBuildingCode + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_SETTINGINFO_All(aTableName, aFieldName,
  aNodeNo, aEcuID, aExtendID, aSubNo, aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_SETTINGINFO (';      //기기정보변경테이블
  stSql := stSql + ' SI_TABLENAME,';
  stSql := stSql + ' SI_FIELDNAME,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' SI_SUBNO,';
  stSql := stSql + ' SI_VALUE,';
  stSql := stSql + ' SI_INSERTTIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aTableName + ''', ';
  stSql := stSql + '''' + aFieldName + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aSubNo + ''', ';
  stSql := stSql + 'N''' + aValue + ''', ';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_SYSTEMLOG_All(aDate, aTime, aClientIP,
  aOperator, aNodeNo, aEcuID, aCardNo, aNumber, aType, aLogData:string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_SYSTEMLOG (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' SY_DATE,';
  stSql := stSql + ' SY_TIME,';
  stSql := stSql + ' SY_CLIENTIP,';
  stSql := stSql + ' SY_OPERATOR,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' SY_NUMBER,';
  stSql := stSql + ' SY_TYPE,';
  stSql := stSql + ' SY_LOGDATA) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '''' + aClientIP + ''', ';
  stSql := stSql + '''' + aOperator + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aNumber + ''', ';
  stSql := stSql + '''' + aType + ''', ';
  stSql := stSql + 'N''' + aLogData + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_TIMECODEDEVICE_BuildingChildAllDevice(
  aBuildingCode, aGroup, aTime1, aTime2, aTime3, aTime4,
  aChange: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TIMECODEDEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_SEND )';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE, ';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' ''' + aGroup + ''',';
  stSql := stSql + ' ''' + aTime1 + ''',';
  stSql := stSql + ' ''' + aTime2 + ''',';
  stSql := stSql + ' ''' + aTime3 + ''',';
  stSql := stSql + ' ''' + aTime4 + ''', ';
  stSql := stSql + ' ''' + aChange + ''' ';
  stSql := stSql + ' from TB_DEVICE ';
  stSql := stSql + ' Where BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  stSql := stSql + ' AND DE_EXTENDID = 0';
  stSql := stSql + ' AND DE_TIMECODETYPE = 0';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_TIMECODEDEVICE_BuildingDevice(aBuildingCode,
  aGroup, aTime1, aTime2, aTime3, aTime4, aChange: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TIMECODEDEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_SEND )';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE, ';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' ''' + aGroup + ''',';
  stSql := stSql + ' ''' + aTime1 + ''',';
  stSql := stSql + ' ''' + aTime2 + ''',';
  stSql := stSql + ' ''' + aTime3 + ''',';
  stSql := stSql + ' ''' + aTime4 + ''', ';
  stSql := stSql + ' ''' + aChange + ''' ';
  stSql := stSql + ' from TB_DEVICE ';
  stSql := stSql + ' Where BC_BUILDINGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = 0';
  stSql := stSql + ' AND DE_TIMECODETYPE = 0';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_TIMECODEDEVICE_TimeCodeToDevice(aNodeNo,
  aEcuID,aBuildingCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TIMECODEDEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4 )';
  stSql := stSql + ' select ';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4 ';
  stSql := stSql + ' from TB_TIMECODE ';
  stSql := stSql + ' Where BC_BUILDINGCODE = ''' + aBuildingCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_TIMECODEDEVICE_Value(aNodeNo, aEcuID, aGroup,
  aTime1, aTime2, aTime3, aTime4, aSend: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TIMECODEDEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_SEND )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '''' + aGroup + ''', ';
  stSql := stSql + '''' + aTime1 + ''', ';
  stSql := stSql + '''' + aTime2 + ''', ';
  stSql := stSql + '''' + aTime3 + ''', ';
  stSql := stSql + '''' + aTime4 + ''', ';
  stSql := stSql + '''' + aSend + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_TIMECODE_Building(aBuildingCode, aGroup,
  aTime1, aTime2, aTime3, aTime4, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TIMECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_APPLY )';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aGroup + ''', ';
  stSql := stSql + '''' + aTime1 + ''', ';
  stSql := stSql + '''' + aTime2 + ''', ';
  stSql := stSql + '''' + aTime3 + ''', ';
  stSql := stSql + '''' + aTime4 + ''', ';
  stSql := stSql + '''' + aApply + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_TIMECODE_BuildingChildAll(aBuildingCode,
  aGroup, aTime1, aTime2, aTime3, aTime4, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TIMECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_APPLY )';
  stSql := stSql + ' Select';
  stSql := stSql + ' GROUP_CODE, ';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + '''' + aGroup + ''', ';
  stSql := stSql + '''' + aTime1 + ''', ';
  stSql := stSql + '''' + aTime2 + ''', ';
  stSql := stSql + '''' + aTime3 + ''', ';
  stSql := stSql + '''' + aTime4 + ''', ';
  stSql := stSql + '''' + aApply + ''' ';
  stSql := stSql + ' FROM TB_BUILDINGCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_TIMECODE_CodeInit(aBuildingCode,aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TIMECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' TC_GROUP )';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aCode + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_TuitionOFFCode_Value(aCode, aName, aGubun,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TuitionOFF (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' TO_CODE,';
  stSql := stSql + ' TO_NAME,';
  stSql := stSql + ' TO_GUBUN,';
  stSql := stSql + ' TO_VALUE )';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + '''' + aName + ''', ';
  stSql := stSql + '' + aGubun + ', ';
  stSql := stSql + '' + aValue + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_Tuition_Value(aSeq, aCompanyCode,
  aLectureAmt: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_Tuition (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CC_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' TU_VALUE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aSeq + ', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '' + aLectureAmt + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

function TdmDBInsert.InsertIntoTB_ZONEEXTENTION_ZoneInit(aNodeNo, aEcuID,
  aExtNo, aName,aType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ZONEEXTENTION (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' ZE_EXTENTIONNAME,';
  stSql := stSql + ' ZE_TYPE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtNo + ',';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aType + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ZONERCV_ZoneInit(aNodeNo, aEcuID, aExtNo,
  aZoneNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ZONERCV(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' ZN_ZONENO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtNo + ',';
  stSql := stSql + '' + aZoneNo + ') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmDBInsert.InsertIntoTB_ZONE_ZoneInit(aNodeNo, aEcuID, aExtNo,
  aZoneNo, aZoneName: string;aBuildingCode:string='0'): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ZONE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' ZN_ZONENO,';
  stSql := stSql + ' ZN_ZONENAME, ';
  stSql := stSql + ' BC_BUILDINGCODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtNo + ',';
  stSql := stSql + '' + aZoneNo + ',';
  stSql := stSql + 'N''' + aZoneName + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''') ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

end.
