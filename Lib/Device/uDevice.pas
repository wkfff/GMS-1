unit uDevice;

interface

uses
  System.SysUtils, System.Classes,Windows,Forms,Vcl.ExtCtrls,
  uNode,uDeviceVariable,ADODB,ActiveX;

const MAXDEVICERCVCOUNT = 200;

type
  TDevice = Class(TComponent)
  private
    L_bDeviceResponseChecking : Boolean;
    L_bDeviceResponse: Array [0..100] of Boolean;     //기기 설정 정보 응답 여부
    L_bDeviceTimeCodeResponse: Array [0..1] of Boolean;     //DeviceTimeCode
    L_cDeviceRCVSTATE: Array [0..MAXDEVICERCVCOUNT] of char;     //수신상태
    L_arrDeviceTimeCode: Array [0..1] of string;     //DeviceTimeCode
    L_nDeviceDoorStateCheckSeq : integer;      // 출입문 상태 체크 순서
    L_nCardDownLoadCardSeq : integer;          //카드 다운로드 순서
    L_nCardDownLoadCount : integer;            //카드 다운로드카운터
    L_nLastPacketDupCount : integer;
    L_bAutoCardDownLoading : Boolean;
    L_bAutoCarddownLoadRCV : Boolean;          //카드 다운로드 데이터 수신 여부
    L_bCardSendCompleteClear : Boolean;        //전송 완료 카드 메모리 지움
    L_bDestroy : Boolean;                      //폼 Free
    L_bFTPCardDownLoading : Boolean;           //FTP카드데이터 다운로드 중일때는 일반 카드 다운로드 하지 말자.
    L_bFTPCardReceiv : Boolean;                //FTP 카드 데이터 전송 상태 수신 유무
    L_stCardDownLoadData : string;             //현재 카드 다운로드 데이터
    L_stLastPacketData : string;
    AntiGroupList : TStringList;               //출입문 AntiGroup List 적재 DisConnect/Connect시 해당 AntiGroup 리스트에 DisConnect 정보 알려 주기 위함
    DeviceArmAreaList : TStringList;
    DeviceDoorList : TStringList;
    DeviceReaderList : TStringList;
    DeviceZoneList : TStringList;
    DeviceZoneExtentionList : TStringList; //존확장기 리스트
    DeviceCardList : TStringList;  //카드 데이터 리스트
    DeviceCardFirstList : TStringList;  //먼저 전송 할 카드 데이터 리스트
    FTPCardDownLoadCheckTimer : TTimer;
    procedure FTPCardDownLoadCheckTimerTimer(Sender:TObject);
    procedure DeviceAlarmStateClear;
    procedure DeviceDoorStateClear;
    function LoadCardPermit(aCardNo:string):integer;
  private
    procedure AddDoorNo(aDoorNo:string);
    function DeviceTimeCodeResponseCheck(aIndex,aDelay:integer):Boolean;
    function DeviceResponseCheck(aIndex,aDelay:integer):Boolean;
    procedure DeviceInformationSend(aInformationType: integer);
    procedure DeviceInformationCheck(aInformationType: integer);
    procedure SendPacket(aCmd:Char;aMsgNo:char;aDeviceVer, aData: String;aPriority:integer=0);
  private
    //컨트롤러 수신 전문 분석
    Function RcvDeviceAccessEventProcess(aECUID,aDeviceVer,aMsgNo,aRealData:string):Boolean; //출입 이벤트
    Function RcvDeviceTelEventProcess(aECUID,aDeviceVer,aMsgNo,aRealData:string):Boolean; //전화 비밀번호
    procedure RcvDeviceArmAreaUse(aEcuId,aDeviceVer,aRealData:string); //방범구역 사용유무 체크
    procedure RcvDeviceArmEXTENTIONMainFromLocal(aECUID,aDeviceVer, aRealData:string);
    procedure RcvDeviceArmEXTENTIONMainToLocal(aECUID,aDeviceVer, aRealData:string);
    procedure RcvDeviceArmRelay(aEcuId,aDeviceVer,aRealData:string); //경해릴레이
    procedure RcvDeviceCardReaderType(aECUID,aDeviceVer, aRealData:string); //카드리더 타입 조회
    procedure RcvDeviceCardReaderNetworkStateCheck(aEcuId,aDeviceVer,aMsgNo,aRealData:string); //카드리더 통신상태 체크
    procedure RcvDeviceCardReaderVersion(aEcuId,aDeviceVer,aMsgNo,aRealData:string); //카드리더 버젼조회
    procedure RcvDeviceCardRegProcess(aECUID,aDeviceVer,aMsgNo,aRealData:string);     //카드 등록 데이터
    procedure RcvDeviceCode(aECUID,aDeviceVer, aRealData:string); //기기코드 수신 처리
    procedure RcvDeviceDoor2RelayType(aECUID,aDeviceVer, aRealData:string);  //릴레이2 타입
    procedure RcvDeviceDoorArmArea(aEcuID,aDeviceVer,aRealData:string); //출입문방범구역
    procedure RcvDeviceDoorTimeCodeUse(aECUID,aDeviceVer, aRealData:string); //출입문 타임코드사용유무 수신
    procedure RcvDeviceDVRDATA(aEcuId,aDeviceVer,aRealData:string); //DVR 데이터 수신 처리
    procedure RcvDeviceDVRUse(aEcuId,aDeviceVer,aRealData:string); //DVR 사용유무 수신 처리
    procedure RcvDeviceEcuType(aECUID,aDeviceVer, aRealData:string);
    procedure RcvDeviceEcuUsedData(aECUID,aDeviceVer, aRealData:string); //컨트롤러 사용정보
    procedure RcvDeviceEMZONELampSiren(aECUID,aDeviceVer, aRealData:string); //비상존 램프 ON/OFF 수신 처리
    procedure RcvDeviceExtentionUsedData(aECUID,aDeviceVer, aRealData:string); //
    procedure RcvDeviceExtentionZoneData(aECUID,aDeviceVer, aRealData:string); //존확장기 존정보
    procedure RcvDeviceFireRecovery(aECUID,aDeviceVer, aRealData:string);      //화재복구
    procedure RcvDeviceFTPDownLoadState(aECUID,aDeviceVer, aRealData:string);  //FTP DownLoad
    procedure RcvDeviceID(aECUID,aDeviceVer, aRealData:string);               //컨트롤러 ID
    procedure RcvDeviceJaejungDelayUse(aECUID,aDeviceVer, aRealData:string); //재중시 딜레이존 사용유무
    procedure RcvDeviceJavaraArmClose(aECUID,aDeviceVer, aRealData:string); //경계시 자바라 닫힘
    procedure RcvDeviceJavaraAutoClose(aECUID,aDeviceVer, aRealData:string); //자바라 자동 닫힘 사용유무
    procedure RcvDeviceKTTCDMAData(aEcuId,aDeviceVer,aRealData:string); //CDMA데이터 수신 처리
    procedure RcvDeviceKTTCDMAUse(aEcuId,aDeviceVer,aRealData:string); //CDMA사용유무 수신 처리
    procedure RcvDeviceKTTRemoteRingCount(aECUID,aDeviceVer, aRealData:string); //KTT원격 경해 링카운트 수신 처리
    procedure RcvDeviceKTTSystemId(aECUID,aDeviceVer, aRealData:string); //KTT SystemID 수신 처리
    procedure RcvDeviceKTTTelNumber(aECUID,aDeviceVer, aRealData:string); //KTT TelNumber 수신 처리
    procedure RcvDeviceLampOnTime(aECUID,aDeviceVer, aRealData:string); //Lamp On Time 수신 처리
    procedure RcvDeviceNetworkState(aEcuId,aDeviceVer,aRealData:string); //cs00 에 의해 컨트롤러 Network 수신 처리
    procedure RcvDeviceSirenOnTime(aECUID,aDeviceVer, aRealData:string); //Siren On Time 수신 처리
    procedure RcvDeviceSystemInforMation(aEcuID,aDeviceVer,aRealData:string); //시스템 정보 수신 처리
    procedure RcvDeviceTimeCodeRegProcess(aECUID,aDeviceVer,aMsgNo,aRealData:string); //TimeCode등록
    procedure RcvDeviceVersion(aECUID,aDeviceVer, aRealData:string); //기기버젼 정보 수신 처리
    procedure RcvDeviceZoneExtentionNetworkCheck(aEcuId,aDeviceVer,aMsgNo,aRealData:string);
    procedure RcvDeviceZoneInformation(aECUID,aDeviceVer, aRealData:string); //컨트롤러 존정보
  private
    //출입문,리더,존의 이벤트 수신부
    procedure ArmAreaPacket(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);

    procedure CardPermitChange(Sender: TObject;  aNodeNo : integer;aEcuID,aCardNo,aPermit,aDoorPermit,aArmAreaPermit,aTimeCodeUse,aTimeCodeGroup,aTimeData,aWeekCode:string);
    procedure CardRcvAckChange(Sender: TObject;  aNodeNo : integer;aEcuID,aCardNo,aRcvAck:string;aPermit:Boolean);

    procedure CardReaderPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);

    procedure CurrentDoorState(Sender: TObject;  aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aCardMode,aDoorMode,aDoorState,aLockState,aDoorFire:string);

    procedure DeviceReceiveTypeChage(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string;aRcvInfoType:integer; aData: string);

    procedure DoorHolidaySend(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure DoorPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure DoorLongTimeOpenEvent(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);

    procedure ZONEEXTENDTYPEChange(Sender: TObject;  aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure ZonePacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);

    function SetDeviceIDArmAreaInformation(aCmd:integer;aSubNo, aValue:string):Boolean;
    function SetDeviceIDCardReaderInformation(aCmd:integer;aSubNo, aValue:string):Boolean;
    function SetDeviceIDDoorInformation(aCmd:integer;aSubNo, aValue:string):Boolean;
    function SetDeviceIDExtentionInformation(aCmd:integer;aSubNo,aValue:string):Boolean;
    function SetDeviceIDZoneInformation(aCmd:integer;aExtendID,aZoneNo, aValue:string):Boolean; //존정보
    function SetDeviceRcvIDArmAreaInformation(aCmd:integer;aSubNo, aValue:string):Boolean;
    function SetDeviceRcvIDCardReaderInformation(aCmd:integer;aSubNo, aValue:string):Boolean;
    function SetDeviceRcvIDDoorInformation(aCmd:integer;aSubNo, aValue:string):Boolean;
    function SetDeviceRcvIDExtentionInformation(aCmd:integer;aSubNo, aValue:string):Boolean;
    function SetDeviceRcvIDZoneInformation(aCmd:integer;aExtendID,aZoneNo, aValue:string):Boolean; //존정보
  private
    FDeviceConnected: TConnectedState;
    FDeviceNode: TNode;
    FDeviceUse: Boolean;
    FReciveStateChange: Boolean;
    FEcuID: string;
    FOnReceiveTypeChage: TReceiveTypeChange;
    FDEVICESYSTEMINFORMATIONRCV: string;
    FDEVICESIRENONTIMERCV: string;
    FDEVICEVERRCV: string;
    FDEVICEJAEJUNGDELAYUSERCV: string;
    FDEVICEARMAREAUSERCV: string;
    FDEVICEDEVICEEXTENTIONUSERCV: string;
    FDEVICEEMZONELAMPRCV: string;
    FDEVICECODERCV: string;
    FDEVICEDOOR2RELAYRCV: string;
    FDEVICELAMPONTIMERCV: string;
    FDEVICEJAVARAARMCLOSERCV: string;
    FDEVICECARDREADERTYPERCV: string;
    FDEVICEARMRELAYRCV: string;
    FDEVICEJAVARAAUTOCLOSERCV: string;
    FSIRENONTIME: integer;
    FARMOUTDELAY: integer;
    FJAEJUNGDELAYUSE: string;
    FARMAREAUSE: string;
    FARMAREASKILL: Boolean;
    FDEVICETYPE: string;
    FDEVICEEXTENTIONUSE: string;
    FEMZONELAMP: string;
    FJAEJUNGSKILL: Boolean;
    FARMINDELAY: integer;
    FDOOR2RELAY: string;
    FARMEXTENTIONGUBUN: string;
    FLAMPONTIME: integer;
    FJAVARAARMCLOSE: string;
    FCARDREADERTYPE: string;
    FARMRELAY: string;
    FDEVICEVER: string;
    FJAVARAAUTOCLOSE: string;
    FDEVICENAME: string;
    FDEVICECODE: string;
    FARMEXTENTIONDATA: string;
    FEMZONESIREN: string;
    FJAVARATYPEUSE: string;
    FWATCHACPOWER: string;
    FOnDeviceConnected: TDeviceConnect;
    FOnDeviceUsed: TDeviceUsed;
    FOnReceiveDeviceNetworkState: TReceiveTypeChange;
    FOnDeviceReceiveDataEvent: TReceiveTypeChange;
    FCardType: string;
    FDVRSkill: string;
    FMaxReaderCount: integer;
    FMaxDoorCount: integer;
    FCARDREADERTELSkill: Boolean;
    FOnDeviceKTTTelNumberChange: TDevicePacket;
    FMaxZonePortCount: integer;
    FDeviceScheduleSkill: Boolean;
    FDeviceJavaraScheduleSkill: Boolean;
    FMaxCardCount: integer;
    FArmExtentionSkill: Boolean;
    FDOOR2RELAYSKILL: Boolean;
    FDEVICEDOORARMAREARCV: string;
    FOnZONEEXTENDTYPEChange: TZoneExtentionPacket;
    FJAVARADISARMOPEN: string;
    FJAVARASERVERARMCLOSE: string;
    FJAVARASERVERDISARMOPEN: string;
    FInfoInitialize: Boolean;
    FOnCardPermitChange: TCardPermitPacket;
    FCurrentArmDoorStateCheckRCV: string;
    FArmAreaStateRCV: Boolean;
    FDoorStateRCV: Boolean;
    FOnCurrentAlarmEvent: TAlarmEvent;
    FOnCurrentDoorState: TDoorStatePacket;
    FCardDownloadRCV: Boolean;
    FOnDeviceCardAccessEvent: TDeviceCardAccessEvent;
    FOnCardRcvAckChange: TCardRcvPacket;
    FFTPCardDownLoadFail: Boolean;
    FFTPCardDownLoadEnd: Boolean;
    FFireEvent: Boolean;
    FOnDevicePacketChange: TDevicePacket;
    FOnDoorPacketChange: TDoorPacket;
    FOnCardReaderPacketChange: TCardReaderPacket;
    FOnCardReaderUseChange: TCardReaderPacket;
    FDEVICECARDREADERNETWORKRcv: string;
    FOnZonePacketChange: TZonePacket;
    FDEVICEExtentionNetworkRCV: string;
    FExtendSkill: Boolean;
    FOnArmAreaPacketChange: TArmAreaPacket;
    FTimeCodeSkill: Boolean;
    FDEVICEHOLIDAYRCV: string;
    FDEVICETIMECODERCV: string;
    FDEVICETIMECODEUSERCV: string;
    FFTPSkill: Boolean;
    FSecuritySkill: Boolean;
    FOnCardPermitLoading: TCardPermitLoading;
    FFTPFirst: Boolean;
    FOnEmployeePermit: TNotifyReceive;
    FOnCardPermit: TNotifyReceive;
    FOnAntiPassDataEvent: TAntiPassEvent;
    FOnDoorHolidaySend: TDoorPacket;
    procedure SetDeviceConnected(const Value: TConnectedState);
    procedure SetDeviceNode(const Value: TNode);
    procedure SetReciveStateChange(const Value: Boolean);
    procedure SetDEVICEARMAREAUSERCV(const Value: string);
    procedure SetDEVICEARMRELAYRCV(const Value: string);
    procedure SetDEVICECARDREADERTYPERCV(const Value: string);
    procedure SetDEVICECODERCV(const Value: string);
    procedure SetDEVICEDEVICEEXTENTIONUSERCV(const Value: string);
    procedure SetDEVICEDOOR2RELAYRCV(const Value: string);
    procedure SetDEVICEEMZONELAMPRCV(const Value: string);
    procedure SetDEVICEJAEJUNGDELAYUSERCV(const Value: string);
    procedure SetDEVICEJAVARAARMCLOSERCV(const Value: string);
    procedure SetDEVICEJAVARAAUTOCLOSERCV(const Value: string);
    procedure SetDEVICEVERRCV(const Value: string);
    procedure SetDEVICESYSTEMINFORMATIONRCV(const Value: string);
    procedure SetDEVICELAMPONTIMERCV(const Value: string);
    procedure SetDEVICESIRENONTIMERCV(const Value: string);
    procedure SetARMAREASKILL(const Value: Boolean);
    procedure SetARMAREAUSE(const Value: string);
    procedure SetARMEXTENTIONDATA(const Value: string);
    procedure SetARMEXTENTIONGUBUN(const Value: string);
    procedure SetARMINDELAY(const Value: integer);
    procedure SetARMOUTDELAY(const Value: integer);
    procedure SetARMRELAY(const Value: string);
    procedure SetCARDREADERTYPE(const Value: string);
    procedure SetDEVICECODE(const Value: string);
    procedure SetDEVICEEXTENTIONUSE(const Value: string);
    procedure SetDEVICETYPE(const Value: string);
    procedure SetDEVICEVER(const Value: string);
    procedure SetDOOR2RELAY(const Value: string);
    procedure SetEMZONELAMP(const Value: string);
    procedure SetEMZONESIREN(const Value: string);
    procedure SetJAEJUNGDELAYUSE(const Value: string);
    procedure SetJAEJUNGSKILL(const Value: Boolean);
    procedure SetJAVARAARMCLOSE(const Value: string);
    procedure SetJAVARAAUTOCLOSE(const Value: string);
    procedure SetJAVARATYPEUSE(const Value: string);
    procedure SetWATCHACPOWER(const Value: string);
    procedure SetLAMPONTIME(const Value: integer);
    procedure SetSIRENONTIME(const Value: integer);
    procedure SetDeviceUse(const Value: Boolean);
    procedure SetCardType(const Value: string);
    procedure SetDVRSkill(const Value: string);
    procedure SetCARDREADERTELSkill(const Value: Boolean);
    procedure SetDOOR2RELAYSKILL(const Value: Boolean);
    procedure SetDEVICEDOORARMAREARCV(const Value: string);
    procedure SetDeviceJavaraScheduleSkill(const Value: Boolean);
    procedure SetJAVARADISARMOPEN(const Value: string);
    procedure SetJAVARASERVERARMCLOSE(const Value: string);
    procedure SetJAVARASERVERDISARMOPEN(const Value: string);
    procedure SetCurrentArmDoorStateCheckRCV(const Value: string);
    procedure SetArmAreaStateRCV(const Value: Boolean);
    procedure SetDoorStateRCV(const Value: Boolean);
    procedure SetFTPCardDownLoadEnd(const Value: Boolean);
    procedure SetFireEvent(const Value: Boolean);
    procedure SetNodeToArmAreaUse(aArmAreaNo, aValue: string);
    procedure SetDEVICECARDREADERNETWORKRcv(const Value: string);
    procedure SetDEVICEExtentionNetworkRCV(const Value: string);
    procedure SetArmExtentionSkill(const Value: Boolean);
    procedure SetTimeCodeSkill(const Value: Boolean);
    procedure SetDEVICETIMECODERCV(const Value: string);
    procedure SetDEVICETIMECODEUSERCV(const Value: string);
    procedure SetFTPCardDownLoadFail(const Value: Boolean);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure AutoCardDownloadStart;
    procedure CardSendCompleteListClear;
    procedure DeviceReciveCheck;
    procedure DeviceCurrentArmDoorStateCheck;
    procedure ReceiveStateClear;
    procedure EXTENDTYPEChange(aEXTENDID:integer;aValue:string);
    function ServerDoorControl(aReaderNo, aDoorNo, aATButton, aCardNo,aAuth, aVoice:string):integer;
  public
    function GetDeviceDoorState(aDoorNo:string;var aCardMode,aDoorMode,aDoorState,aLockState,aDoorFire:string):Boolean;
    function GetDeviceDoorStateResend(aDoorNo:string):Boolean;
    function GetDeviceToArmAreaCount:integer;
    function GetDeviceToArmAreaName(aIndex:integer):string;
    function GetDeviceToArmAreaIDInformation(aCmd:integer;aSubNo:string):string;
    function GetDeviceToArmAreaIndexMode(aIndex,alength:integer):string;
    function GetDeviceToCardReaderIndexArmAreaNo(aIndex:integer):integer;
    function GetDeviceToCardReaderCount:integer;
    function GetDeviceToCardReaderIndexDoorNo(aIndex:integer):integer;
    function GetDeviceToCardReaderIndexState(aIndex,alength:integer):string;
    function GetDeviceToCardReaderIndexUse(aIndex:integer):Boolean;
    function GetDeviceToDoorCount:integer;
    function GetDeviceToCardReaderIDBuildingPosition(aReaderNo:string):string;
    function GetDeviceToCardReaderIDDoorPosition(aReaderNo:string):string;
    function GetDeviceToCardReaderIDType(aReaderNo:string):string;
    function GetDeviceToDoorIDInformation(aCmd:integer;aDoorNo:string):string;
    function GetDeviceToDoorIndexInformation(aCmd,aSubIndex:integer):string;
    function GetDeviceToDoorIndexState(aIndex,alength:integer):string;
    function GetDeviceToExtentionCount:integer;
    function GetDeviceToExtentionIDInformation(aCmd:integer;aExtendNo:string):string;
    function GetDeviceToExtentionIndexUse(aIndex:integer):string;
    function GetDeviceToExtentionIndexZoneArmArea(aIndex,aZoneNo:integer):integer;
    function GetDeviceToExtentionIndexZoneCount(aIndex:integer):integer;
    function GetDeviceToExtentionIndexZoneName(aIndex,aZoneNo:integer):string;
    function GetDeviceToZoneIDArmArea(aExtendID,aZoneNo:string):string;
    function GetDeviceToZoneIDDelayUse(aExtendID,aZoneNo:string):string;
    function GetDeviceToZoneIDRecovery(aExtendID,aZoneNo:string):string;
    function GetDeviceToZoneIDType(aExtendID,aZoneNo:string):string;
    function GetExtendToZoneInformation(aEXTENDID:integer):string;
  public
    function SetDeviceIDSubInformation(aSubType,aCmd:integer;aSubNo,aValue:string):Boolean;  //기기정보
    function SetDeviceRcvIDSubInformation(aSubType,aCmd:integer;aSubNo,aValue:string):Boolean;  //기기정보
    function SetDeviceTimeCode(aValue:string):Boolean; //타임코드데이터
    function SetHoliday(aDay,aValue:string):Boolean; //공휴일 설정
    function HolidayClear: Boolean;
    //초기 DB에서 읽어서 설정 하는 부분

    procedure SetNodeToCardPermitExcute(aCardNo,aRcvAck:string);
    procedure SetNodeToCardPermitInitialize(aCardNo,aCardPermit,aCardState,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
          aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8,aRcvAck,aPositionNum,
          aTimeCodeUse,aTCGroup,aTime1,aTime2,aTime3,aTime4,aTCWeekCode,aRegDate,aEndDate,aEmState:string;aSendType:integer=0);
    procedure SetNodeToCardPermitSetting(aCardNo, aPermit,aCardState, aType, aNumber, aPositionNum,
          aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3,aTime4, aWeekCode,aRegDate,aEndDate,aEmState:string);

  public
    //장비 수신 처리
    procedure ReceiveDeviceAlarmData(aECUID,aDeviceVer:string;aMsgNo,aCmd:char;aRealData:string);       //'A'알람데이터
    procedure ReceiveDeviceRegDataProcess(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);       //'i'
    procedure ReceiveDeviceRemoteDataProcess(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDeviceAccessDataProcess(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDeviceFirmwareProcess(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDeviceFirmwareProcess2(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDeviceBroadCastProcess(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDeviceErrorDataProcess(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDevicePTMonitoringProcess(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDeviceMessageProcess(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDeviceGageMonitor(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
  published
    property ReciveStateChange : Boolean read FReciveStateChange write SetReciveStateChange; //수신 상태 변경 여부
  published
    property InfoInitialize : Boolean Read FInfoInitialize write FInfoInitialize;
    Property DeviceNode: TNode Read FDeviceNode write SetDeviceNode;
    property EcuID : string read FEcuID write FEcuID;                //확장기 번호
    property DeviceUse : Boolean read FDeviceUse write SetDeviceUse; //기기사용유무
    property DEVICECODE : string read FDEVICECODE write SetDEVICECODE;  //기기코드 예)ACC-503
    property DEVICECONNECTED : TConnectedState read FDeviceConnected write SetDeviceConnected;
    //기기상태 프로퍼티
    property ARMAREASKILL : Boolean read FARMAREASKILL write SetARMAREASKILL;   //방범구역 기능 유무
    property ARMAREAUSE : string read FARMAREAUSE write SetARMAREAUSE;          //방범구역 사용유무
    property ARMEXTENTIONDATA : string read FARMEXTENTIONDATA write SetARMEXTENTIONDATA;
    property ARMEXTENTIONGUBUN : string read FARMEXTENTIONGUBUN write SetARMEXTENTIONGUBUN;
    property ARMEXTENTIONSKILL : Boolean read FArmExtentionSkill write SetArmExtentionSkill;  //경계부가기능 유무
    property ARMINDELAY : integer read FARMINDELAY write SetARMINDELAY;
    property ARMOUTDELAY : integer read FARMOUTDELAY write SetARMOUTDELAY;
    property ARMRELAY : string read FARMRELAY write SetARMRELAY;                      //경해접점릴레이 동작방법
    property CARDREADERTELSkill : Boolean read FCARDREADERTELSkill write SetCARDREADERTELSkill;
    property CARDREADERTYPE : string read FCARDREADERTYPE write SetCARDREADERTYPE;   //카드리더 타입,지문리더 등
    property CARDTYPE : string read FCardType write SetCardType;                     //카드타입 범용,16자리 등
    property DEVICEEXTENTIONUSE : string read FDEVICEEXTENTIONUSE write SetDEVICEEXTENTIONUSE;
    property DEVICENAME : string read FDEVICENAME write FDEVICENAME;
    property DEVICEJavaraScheduleSkill : Boolean read FDeviceJavaraScheduleSkill write SetDeviceJavaraScheduleSkill;
    property DEVICEScheduleSkill : Boolean read FDeviceScheduleSkill write FDeviceScheduleSkill;
    property DEVICETYPE : string read FDEVICETYPE write SetDEVICETYPE;
    property DEVICEVER : string read FDEVICEVER write SetDEVICEVER;
    property DOOR2RELAY : string read FDOOR2RELAY write SetDOOR2RELAY;
    property DOOR2RELAYSKILL : Boolean read FDOOR2RELAYSKILL write SetDOOR2RELAYSKILL;
    property EMZONELAMP : string read FEMZONELAMP write SetEMZONELAMP;
    property EMZONESIREN : string read FEMZONESIREN write SetEMZONESIREN;
    property ExtendSkill : Boolean read FExtendSkill write FExtendSkill;
    property FTPSkill : Boolean read FFTPSkill write FFTPSkill;
    property FTPFirst : Boolean read FFTPFirst write FFTPFirst;
    property LAMPONTIME : integer read FLAMPONTIME write SetLAMPONTIME;
    property MaxCardCount : integer read FMaxCardCount write FMaxCardCount;
    property MaxDoorCount : integer read FMaxDoorCount write FMaxDoorCount;
    property MaxReaderCount : integer read FMaxReaderCount write FMaxReaderCount;
    property MaxZonePortCount : integer read FMaxZonePortCount write FMaxZonePortCount;
    property JAEJUNGSKILL : Boolean read FJAEJUNGSKILL write SetJAEJUNGSKILL;
    property JAEJUNGDELAYUSE : string read FJAEJUNGDELAYUSE write SetJAEJUNGDELAYUSE;
    property JAVARAARMCLOSE : string read FJAVARAARMCLOSE write SetJAVARAARMCLOSE;
    property JAVARAAUTOCLOSE : string read FJAVARAAUTOCLOSE write SetJAVARAAUTOCLOSE;
    property JAVARADISARMOPEN : string read FJAVARADISARMOPEN write SetJAVARADISARMOPEN;  //해제시 자바라 열림
    property JAVARASERVERARMCLOSE : string read FJAVARASERVERARMCLOSE write SetJAVARASERVERARMCLOSE; //로컬 경계시 자바라 닫힘
    property JAVARASERVERDISARMOPEN : string read FJAVARASERVERDISARMOPEN write SetJAVARASERVERDISARMOPEN; //로컬 해제시 자바라 열림
    property JAVARATYPEUSE : string read FJAVARATYPEUSE write SetJAVARATYPEUSE;
    property SecuritySkill : Boolean read FSecuritySkill write FSecuritySkill;
    property SIRENONTIME : integer read FSIRENONTIME write SetSIRENONTIME;
    property TimeCodeSkill : Boolean read FTimeCodeSkill write SetTimeCodeSkill;
    property WATCHACPOWER : string read FWATCHACPOWER write SetWATCHACPOWER;

    property FireEvent : Boolean read FFireEvent write SetFireEvent;
    property FTPCardDownLoadEnd :Boolean read FFTPCardDownLoadEnd write SetFTPCardDownLoadEnd;
    property FTPCardDownLoadFail :Boolean read FFTPCardDownLoadFail write SetFTPCardDownLoadFail;

  published
    //수신상태 프로퍼티
    property DEVICEARMRELAYRCV : string read FDEVICEARMRELAYRCV write SetDEVICEARMRELAYRCV ;  //경해접점릴레이
    property DEVICEARMAREAUSERCV : string read FDEVICEARMAREAUSERCV write SetDEVICEARMAREAUSERCV ;  //방범구역사용유무
    property DEVICECARDREADERNETWORKRcv : string read FDEVICECARDREADERNETWORKRcv write SetDEVICECARDREADERNETWORKRcv ; //카드리더 통신상태 체크
    property DEVICECARDREADERTYPERCV : string read FDEVICECARDREADERTYPERCV write SetDEVICECARDREADERTYPERCV ;  //카드리더타입
    property DEVICECODERCV : string read FDEVICECODERCV write SetDEVICECODERCV ;  //기기코드
    property DEVICEDEVICEEXTENTIONUSERCV : string read FDEVICEDEVICEEXTENTIONUSERCV write SetDEVICEDEVICEEXTENTIONUSERCV ;  //존확장기사용유무
    property DEVICEDOOR2RELAYRCV : string read FDEVICEDOOR2RELAYRCV write SetDEVICEDOOR2RELAYRCV ;  //출입문2릴레이타입
    property DEVICEDOORARMAREARCV : string read FDEVICEDOORARMAREARCV write SetDEVICEDOORARMAREARCV;   //출입문 방범구역 정보
    property DEVICEEMZONELAMPRCV : string read FDEVICEEMZONELAMPRCV write SetDEVICEEMZONELAMPRCV ;  //비상존램프
    property DEVICEExtentionNetworkRCV : string read FDEVICEExtentionNetworkRCV write SetDEVICEExtentionNetworkRCV;
    property DEVICEJAEJUNGDELAYUSERCV : string read FDEVICEJAEJUNGDELAYUSERCV write SetDEVICEJAEJUNGDELAYUSERCV ;  //재중지연시간사용유무
    property DEVICEJAVARAARMCLOSERCV : string read FDEVICEJAVARAARMCLOSERCV write SetDEVICEJAVARAARMCLOSERCV ;  //자바라경계시자동닫힘유무
    property DEVICEJAVARAAUTOCLOSERCV : string read FDEVICEJAVARAAUTOCLOSERCV write SetDEVICEJAVARAAUTOCLOSERCV ;  //자바리자동닫힘사용유무
    property DEVICESYSTEMINFORMATIONRCV : string read FDEVICESYSTEMINFORMATIONRCV write SetDEVICESYSTEMINFORMATIONRCV ;  //시스템정보
    property DEVICEVERRCV : string read FDEVICEVERRCV write SetDEVICEVERRCV ;  //기기버젼
    property DEVICELAMPONTIMERCV : string read FDEVICELAMPONTIMERCV write SetDEVICELAMPONTIMERCV ;  //램프On시간
    property DEVICESIRENONTIMERCV : string read FDEVICESIRENONTIMERCV write SetDEVICESIRENONTIMERCV ;  //사이렌On시간
    property DEVICETIMECODERCV : string read FDEVICETIMECODERCV write SetDEVICETIMECODERCV;
    property DEVICETIMECODEUSERCV : string read FDEVICETIMECODEUSERCV write SetDEVICETIMECODEUSERCV; //출입문 타임코드사용유무
    property CurrentArmDoorStateCheckRCV : string read FCurrentArmDoorStateCheckRCV write SetCurrentArmDoorStateCheckRCV;  //현재 출입문,방범상태 조회 유무'Y'.조회 완료,'N'조회 실패
    property ArmAreaStateRCV : Boolean read FArmAreaStateRCV write SetArmAreaStateRCV;
    property DoorStateRCV : Boolean read FDoorStateRCV write SetDoorStateRCV;
    property CardDownloadRCV : Boolean read FCardDownloadRCV write FCardDownLoadRcv;
  published
    property OnAntiPassDataEvent : TAntiPassEvent read FOnAntiPassDataEvent write FOnAntiPassDataEvent;               //데이터 수신
    //방범구역 이벤트 발생
    property OnArmAreaPacketChange : TArmAreaPacket read FOnArmAreaPacketChange write FOnArmAreaPacketChange;
    //카드데이터 이벤트 발생
    property OnCardPermitChange : TCardPermitPacket read FOnCardPermitChange write FOnCardPermitChange;
    property OnCardPermitLoading : TCardPermitLoading read FOnCardPermitLoading write FOnCardPermitLoading;
    property OnCardRcvAckChange : TCardRcvPacket read FOnCardRcvAckChange write FOnCardRcvAckChange;
    //카드리더 이벤트 발생
    property OnCardReaderPacketChange : TCardReaderPacket read FOnCardReaderPacketChange write FOnCardReaderPacketChange;

    property OnCardReaderUseChange: TCardReaderPacket read FOnCardReaderUseChange write FOnCardReaderUseChange;
    //현재 상태 이벤트 변경 발생
    property OnCurrentAlarmEvent: TAlarmEvent read FOnCurrentAlarmEvent write FOnCurrentAlarmEvent;
    property OnCurrentDoorState : TDoorStatePacket read FOnCurrentDoorState write FOnCurrentDoorState;
    //컨트롤러 이벤트 발생
    property OnDevicePacketChange : TDevicePacket read FOnDevicePacketChange write FOnDevicePacketChange;

    property OnDeviceCardAccessEvent : TDeviceCardAccessEvent read FOnDeviceCardAccessEvent write FOnDeviceCardAccessEvent;
    ProPerty OnDeviceConnected : TDeviceConnect read FOnDeviceConnected Write FOnDeviceConnected;
    ProPerty OnDeviceUsed : TDeviceUsed read FOnDeviceUsed Write FOnDeviceUsed;
    //출입문 이벤트 발생
    property OnDoorPacketChange :TDoorPacket read FOnDoorPacketChange write FOnDoorPacketChange;
    property OnDoorHolidaySend :TDoorPacket read FOnDoorHolidaySend write FOnDoorHolidaySend;

    property OnDeviceReceiveDataEvent : TReceiveTypeChange read FOnDeviceReceiveDataEvent write FOnDeviceReceiveDataEvent;               //데이터 수신

    property OnCardPermit : TNotifyReceive read FOnCardPermit write FOnCardPermit;
    property OnEmployeePermit : TNotifyReceive read FOnEmployeePermit write FOnEmployeePermit;
    property OnReceiveTypeChage : TReceiveTypeChange read FOnReceiveTypeChage write FOnReceiveTypeChage;

    property OnZONEEXTENDTYPEChange :TZoneExtentionPacket read FOnZONEEXTENDTYPEChange write FOnZONEEXTENDTYPEChange;
    property OnZonePacketChange : TZonePacket read FOnZonePacketChange write FOnZonePacketChange;
  public
    { Public declarations }
    //컨트롤러 정보 조회
    function DeviceArmAreaStateCheck(aArmArea:integer = 0;aDelay:Boolean=True) : Boolean; //방범구역 상태 체크
    function DeviceArmAreaUseCheck(aDelay:Boolean=True) : Boolean; //방범구역 사용유무체크
    function DeviceArmAreaUseSetting(aDelay:Boolean=True) : Boolean; //방범구역 사용유무 설정
    function DeviceARMEXTENTIONMAINFromLOCALCheck(aDelay:Boolean=True) : Boolean;
    function DeviceARMEXTENTIONMAINTOLOCALCheck(aDelay:Boolean=True) : Boolean;
    function DeviceARMRELAYCheck(aDelay:Boolean=True) : Boolean; //경해접점 체크
    function DeviceARMRELAYSetting(aDelay:Boolean=True) : Boolean;
    function DeviceCardReaderNetworkCheck(aDelay:Boolean=True) : Boolean; //카드리더 통신상태 체크
    function DeviceCardReaderTypeCheck(aDelay:Boolean=True) : Boolean; //카드리더 타입 체크
    function DeviceCardReaderTypeSetting(aDelay:Boolean=True) : Boolean; //카드리더 타입 설정
    function DeviceCodeCheck(aDelay:Boolean=True) : Boolean; //컨트롤러 기기코드 체크
    function DeviceDoor2RelayCheck(aDelay:Boolean=True) : Boolean; //컨트롤러 Door2RelayCheck
    function DeviceDoor2RelaySetting(aDelay:Boolean=True) : Boolean; //Door2Relay Setting
    function DeviceDoorArmAreaCheck(aDelay:Boolean=True) : Boolean; //출입문방범구역 체크
    function DeviceDoorArmAreaSetting(aDelay:Boolean=True) : Boolean;
    function DeviceDVRDataCheck(aDelay:Boolean=True) : Boolean; //DVR Data 체크
    function DeviceDVRUseCheck(aDelay:Boolean=True) : Boolean;  //DVR 사용유무 체크
    function DeviceECUUseCheck(aDelay:Boolean=True) : Boolean;  //ECU 사용유무 체크
    function DeviceEmZoneLampSirenCheck(aDelay:Boolean=True) : Boolean; //비상존 사이렌랰프 On/Off 체크
    function DeviceExtentionNetworkCheck(aDelay:Boolean=True) : Boolean; //존확장기 통신 체크
    function DeviceExtentionTypeCheck(aDelay:Boolean=True) : Boolean;  //존확장기 타입 체크
    function DeviceExtentionTypeSetting(aDelay:Boolean=True) : Boolean;
    function DeviceIDCheck(aDelay:Boolean=True) : Boolean;   //컨트롤러 아이디 조회
    function DeviceJaejungDelayUseCheck(aDelay:Boolean=True) : Boolean; //재중시 딜레이존 사용유무
    function DeviceJaejungDelayUseSetting(aDelay:Boolean=True) : Boolean;
    function DeviceJavaraArmCloseCheck(aDelay:Boolean=True) : Boolean; //경계시 자바라 닫힘 체크
    function DeviceJavaraArmCloseSetting(aDelay:Boolean=True) : Boolean;
    function DeviceJavaraAutoCloseCheck(aDelay:Boolean=True) : Boolean; //자바라 자동닫힘 체크
    function DeviceJavaraAutoCloseSetting(aDelay:Boolean=True) : Boolean;
    function DeviceKTTCDMADATACheck(aDelay:Boolean=True) : Boolean; //CDMA 정보 체크
    function DeviceKTTCDMAUSECheck(aDelay:Boolean=True) : Boolean; //CDMA사용유무 체크
    function DeviceKTTRingCountCheck(aDelay:Boolean=True) : Boolean; // KTT원격경해제 링카운트 체크
    function DeviceKTTSystemIDCheck(aDelay:Boolean=True) : Boolean; //KTT관제시스템아이디 체크
    function DeviceKTTTelNumberCheck(aNo:string;aDelay:Boolean=True) : Boolean; //KTT관제시스템아이디 체크
    function DeviceLampOnTimeCheck(aDelay:Boolean=True) : Boolean; //LampOn Time 체크
    function DeviceNetworkCheck(aDelay:Boolean=True) : Boolean; //컨트롤러 통신 체크
    function DeviceSIRENOnTimeCheck(aDelay:Boolean=True) : Boolean; //Siren On Time Check
    function DeviceSystemInformationCheck(aDelay:Boolean=True) : Boolean; //컨트롤러 시스템 정보 체크
    function DeviceSystemInformationSetting(aDelay:Boolean=True) : Boolean;
    function DeviceTimeCodeDataSetting(aDelay:Boolean=True) : Boolean;
    function DeviceDoorTimeCodeUseCheck(aDelay:Boolean=True) : Boolean;
    function DeviceDoorTimeCodeUseSetting(aDelay:Boolean=True):Boolean;
    function DeviceTimeCodeGroupSetting(aIndex:integer;aDelay:Boolean=True) : Boolean;
    function DeviceVersionCheck(aDelay:Boolean=True) : Boolean; //컨트롤러 버젼 체크
  public
    function RegistDeviceARMEXTENTIONMAINFromLOCAL(aARMEXTENTIONMAINFROMLOCAL:string;aDelay:Boolean=True) : Boolean;
    function RegistDeviceARMEXTENTIONMAINTOLOCAL(aARMEXTENTIONMAINTOLOCAL:string;aDelay:Boolean=True) : Boolean;
    function RegistDeviceDVRData(aDVRIP,aDVRPORT:string;aDelay:Boolean=True) : Boolean;
    function RegistDeviceDVRUse(aDVRUSE:string;aDelay:Boolean=True) : Boolean;
    function RegistDeviceECUUse(aEcuUseData:string;aDelay:Boolean=True) : Boolean;
    function RegistDeviceID(aDeviceID:string;aDelay:Boolean=True):Boolean;     //컨트롤러 ID 등록
    function RegistDeviceKTTCDMADATA(aKTTCDMAMIN,aKTTCDMAMUX,aKTTCDMAIP,aKTTCDMAPORT,aKTTCDMACHECKTIME,aKTTCDMARSSI:string;aDelay:Boolean=True) : Boolean;
    function RegistDeviceKTTCDMAUSE(aKTTCDMAUSE:string;aDelay:Boolean=True) : Boolean;
    function RegistDeviceKTTRingCount(aKTTREMOTEARMRINGCOUNT,aKTTREMOTEDISARMRINGCOUNT:string;aDelay:Boolean=True) : Boolean;
    function RegistDeviceKTTSystemID(aKTTSYSTEMID:string;aDelay:Boolean=True) : Boolean;
    function RegistDeviceKTTTelNumber(aNo,aKTTTELNUMBER:string;aDelay:Boolean=True) : Boolean;
  public
    function DeviceCardAllResend : Boolean;  //카드 권한 재전송
    function DeviceFTPCardDataCreate(var aFTPCardFileName:string) : Boolean;  //FTP 카드 데이터 생성
    function DeviceFTPCardDownLoadStart : Boolean;
    function DeviceReset: Boolean; //컨트롤러 리셋
    function TimeSync(aDelay:Boolean = True) : Boolean; //시간동기화
  End;

  TdmDevice = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDevice: TdmDevice;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  uAlarmEventStateCode,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDeviceArmArea,
  uDeviceCard,
  uDeviceReader,
  uDeviceZone,
  uDeviceZoneExtention,
  uDeviceDoor,
  uDevicePacket,
  FileInfo;

{$R *.dfm}



{ TDevice }

procedure TDevice.AddDoorNo(aDoorNo: string);
var
  oDeviceDoor : TDeviceDoor;
begin
  oDeviceDoor := TDeviceDoor.Create(nil);
  oDeviceDoor.DoorNo := strtoint(aDoorNo);
  oDeviceDoor.Device := self;
  oDeviceDoor.AntiGroupCode := '0';
  oDeviceDoor.onCurrentDoorState := CurrentDoorState;
  oDeviceDoor.OnDoorPacketChange := DoorPacketChange;
  oDeviceDoor.OnDoorHolidaySend := DoorHolidaySend;
  oDeviceDoor.OnReceiveTypeChage := DeviceReceiveTypeChage;
  oDeviceDoor.OnDoorLongTimeOpenEvent := DoorLongTimeOpenEvent;
  oDeviceDoor.CurrentDoorStateCheckRCV := False;
  DeviceDoorList.AddObject(aDoorNo,oDeviceDoor);
end;

procedure TDevice.ArmAreaPacket(Sender: TObject; aCmd, aNodeNo: integer; aEcuID,
  aExtendID, aNumber, aData: string);
begin
  Try
    if Assigned(FOnArmAreaPacketChange) then
    begin
      OnArmAreaPacketChange(self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.ArmAreaPacket');
  End;
end;

procedure TDevice.AutoCardDownloadStart;
var
  i : integer;
  bResult : Boolean;
  stSendData : string;
  nCardDownLoadDelay : integer;
  FirstTickCount : double;
  stNodeNo : string;
begin
  if (L_nCardDownLoadCount < 10) and L_bAutoCardDownLoading then    //일정 시간 이후에도 못들어 가면 무조건 진입하자.
  begin
    inc(L_nCardDownLoadCount);
    Exit;
  end;
  L_bAutoCardDownLoading := True;
  Try
    if G_bApplicationTerminate then Exit;
    if DEVICECONNECTED <> csConnected then
    begin
      if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadFail' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' Not DEVICECONNECTED');
      Exit;
    end;
    if L_bFTPCardDownLoading then
    begin
      if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadFail' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' L_bFTPCardDownLoading');
      Exit;  //FTP 카드데이터 다운로드 중에는 카드 전송 하지 말자.
    end;
    if L_bDestroy then
    begin
      if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadFail' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' L_bDestroy');
      Exit;
    end;
    if DeviceNode.NodeDestory then
    begin
      if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadFail' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' DeviceNode.NodeDestory');
      Exit;
    end;
    if CARDTYPE = '' then
    begin
      if G_nMonitoringType <> 1 then
      begin
        if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadFail' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' CARDTYPE');
        Exit; //CardType 확인 하지 못한 경우는 빠져 나가자...
      end else
      begin
        CARDTYPE := AUTOKT811;
      end;
    end;
    if L_bCardSendCompleteClear then
    begin
      if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadFail' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' L_bCardSendCompleteClear');
      Exit; //카드 정리중이면 빠져 나가자.
    end;
    if DeviceCode = '' then
    begin
      if G_nMonitoringType <> 1 then
      begin
        if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadFail' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' DeviceCode');
        Exit;   //DeviceCode = '' 이면 카드 다운로드 하지 말자.
      end else
      begin
        DeviceCode := 'ACC-100';
      end;
    end;


    Try
      stNodeNo := inttostr(DeviceNode.No);
      nCardDownLoadDelay := 1000; //1초 동안 수신 대기 하자.

      if DeviceCardFirstList.Count > 0 then
      begin
          //카드 태그 한 것 부터 전송하자.
          stSendData := dmDevicePacket.GetCardDataPacketData(CARDTYPE,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).CARDNO,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).PositionNum,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).CARDPERMIT,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).GetDoorPermit(MaxDoorCount),
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).GetArmAreaPermit,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).REGDATE,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).ENDDATE,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).GetTimeCodeUse,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).GetTimeCode,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).GetTimeGroup,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).GetWeekCode,
                                                             TDeviceCard(DeviceCardFirstList.Objects[0]).EMSTATE);

          L_stCardDownLoadData := TDeviceCard(DeviceCardFirstList.Objects[0]).CARDNO;
          TDeviceCard(DeviceCardFirstList.Objects[0]).free;    //카드 태그 한것은 먼저 삭제 하자.
          DeviceCardFirstList.Delete(0);
          L_bAutoCarddownLoadRCV := False;
          SendPacket('c',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stSendData ,2);
          if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadSending' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' ' + TDeviceCard(DeviceCardList.Objects[i]).CARDNO);
          Exit;
      end;

      inc(L_nCardDownLoadCount); //카운터 증가 시키자.

      if L_nCardDownLoadCardSeq > DeviceCardList.Count - 1 then L_nCardDownLoadCardSeq := 0;
      for i := L_nCardDownLoadCardSeq to DeviceCardList.Count - 1 do
      begin
        if (TDeviceCard(DeviceCardList.Objects[i]).RCVACK = 'N') OR (TDeviceCard(DeviceCardList.Objects[i]).RCVACK = 'R') then
        begin
          L_nCardDownLoadCount := 0;
          TDeviceCard(DeviceCardList.Objects[i]).RCVACK := 'S'; //Send 상태로 변경

          stSendData := dmDevicePacket.GetCardDataPacketData(CARDTYPE,
                                                             TDeviceCard(DeviceCardList.Objects[i]).CARDNO,
                                                             TDeviceCard(DeviceCardList.Objects[i]).PositionNum,
                                                             TDeviceCard(DeviceCardList.Objects[i]).CARDPERMIT,
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetDoorPermit(MaxDoorCount),
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetArmAreaPermit,
                                                             TDeviceCard(DeviceCardList.Objects[i]).REGDATE,
                                                             TDeviceCard(DeviceCardList.Objects[i]).ENDDATE,
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetTimeCodeUse,
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetTimeCode,
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetTimeGroup,
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetWeekCode,
                                                             TDeviceCard(DeviceCardList.Objects[i]).EMSTATE);

          L_stCardDownLoadData := TDeviceCard(DeviceCardList.Objects[i]).CARDNO;
          L_bAutoCarddownLoadRCV := False;
          SendPacket('c',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stSendData ,4);
          if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadSending' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' ' + TDeviceCard(DeviceCardList.Objects[i]).CARDNO);
(*        메인에서 타이머 돌리는 것 때문에 이부분에서 멈춤 현상 발생 됨
          FirstTickCount := GetTickCount + nCardDownLoadDelay;
          While Not L_bAutoCarddownLoadRCV do
          begin
            if G_bApplicationTerminate then Exit;
            if L_bDestroy then Exit;
            if DeviceNode.NodeDestory then Exit;
            sleep(1);
            Application.ProcessMessages;
            if GetTickCount > FirstTickCount then Break;
          end;  *)
          break;
        end else
        begin
          if L_nCardDownLoadCount > 10 then
          begin
            if TDeviceCard(DeviceCardList.Objects[i]).RCVACK = 'S' then
            begin
              TDeviceCard(DeviceCardList.Objects[i]).RCVACK := 'R';  //송신 중이면 재송신 하자.
              L_nCardDownLoadCount := 0; //한건을 재전송 하자.
              if G_bDebug then LogSave(G_stLogDirectory + '\CardDownloadSendClear' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' ' + TDeviceCard(DeviceCardList.Objects[i]).CARDNO);
            end;
          end;
          L_nCardDownLoadCardSeq := i;
        end;
      end;
      if L_nCardDownLoadCardSeq = DeviceCardList.Count - 1 then
      begin
        bResult := True;
        if G_bDebug then LogSave(G_stLogDirectory + '\CardSendCompleteListClear' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + inttostr(DeviceCardList.Count) );
        CardSendCompleteListClear; //전송 완료된 카드리스트는 삭제 하자. 2016.01.06 전송 카드 데이터를 많이 가지고 있지 않기 위해
        if DeviceCardList.Count > 0 then bResult := False;
        (*
        for i := 0 to DeviceCardList.Count - 1 do  //미전송 된 카드 데이터가 있는지 점검하자.
        begin
          if L_bDestroy then Exit;
          if DeviceNode.NodeDestory then Exit;
          if TDeviceCard(DeviceCardList.Objects[i]).RCVACK <> 'Y' then
          begin
            bResult := False;
            break;
          end;
        end; *)

        CardDownloadRCV := bResult;
      end;
      L_nCardDownLoadCardSeq := L_nCardDownLoadCardSeq + 1;
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','AutoCardDownloadStart(' + stNodeNo + ')');
      Exit;
    End;
  Finally
    if G_bDebug then LogSave(G_stLogDirectory + '\AutoCardDownLoading' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + ' Complete');
    L_bAutoCardDownLoading := False;
  End;
end;

procedure TDevice.CardPermitChange(Sender: TObject; aNodeNo: integer; aEcuID,aCardNo,
  aPermit, aDoorPermit, aArmAreaPermit, aTimeCodeUse, aTimeCodeGroup, aTimeData,
  aWeekCode: string);
begin
  Try
    if Assigned(FOnCardPermitChange) then
    begin
      OnCardPermitChange(Self,aNodeNo,aEcuID,aCardNo,aPermit,aDoorPermit,aArmAreaPermit,aTimeCodeUse,aTimeCodeGroup,aTimeData,aWeekCode);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.CardPermitChange');
  End;
end;

procedure TDevice.CardRcvAckChange(Sender: TObject; aNodeNo: integer; aEcuID,
  aCardNo, aRcvAck: string;aPermit:Boolean);
begin
  Try
    if Assigned(FOnCardRcvAckChange) then
    begin
      OnCardRcvAckChange(Self,aNodeNo,aEcuID,aCardNo,aRcvAck,aPermit);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.CardRcvAckChange');
  End;
end;

procedure TDevice.CardReaderPacketChange(Sender: TObject; aCmd,
  aNodeNo: integer; aEcuID, aExtendID, aNumber, aData: string);
begin
  Try
    if Assigned(FOnCardReaderPacketChange) then
    begin
      OnCardReaderPacketChange(self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.CardReaderPacketChange');
  End;
end;

procedure TDevice.CardSendCompleteListClear;
var
  i : integer;
  stTempNodNo : string;
  stPermit : string;
begin
  if L_bFTPCardDownLoading then Exit;  //FTP 카드데이터 다운로드 중에는 카드 전송 하지 말자.
  Try
    L_bCardSendCompleteClear := True;
    for i := DeviceCardList.Count - 1 downto 0 do  //미전송 된 카드 데이터가 있는지 점검하자.
    begin
      if L_bDestroy then Exit;
      if DeviceNode.NodeDestory then Exit;
      if TDeviceCard(DeviceCardList.Objects[i]).RCVACK = 'Y' then
      begin
        //파일로 처리 하자.
        stTempNodNo := FillZeroNumber(TNode(DeviceNode).NO,G_nNodeCodeLength);
        if TDeviceCard(DeviceCardList.Objects[i]).CARDPERMIT then stPermit := '1'
        else stPermit := '0';
        if FileAppend(G_stEventDataDir + '\CardRcvAck' + FormatDateTime('yyyymmddhhnnss',now) + stTempNodNo,stTempNodNo + ECUID + TDeviceCard(DeviceCardList.Objects[i]).CARDNO + stPermit ,False) then
        begin
          TDeviceCard(DeviceCardList.Objects[i]).Free;
          DeviceCardList.Delete(i);
          G_nDebugCardDownLoadCount := G_nDebugCardDownLoadCount - 1;
        end;
      end;
    end;

  Finally
    L_bCardSendCompleteClear := False;
  End;
end;

constructor TDevice.Create(AOwner: TComponent);
var
  i : integer;
begin
  inherited;
  Try
    FTPCardDownLoadCheckTimer := TTimer.Create(nil);
    FTPCardDownLoadCheckTimer.Interval := 30000;     //30초에 한번씩 체크
    FTPCardDownLoadCheckTimer.OnTimer := FTPCardDownLoadCheckTimerTimer;
    FTPCardDownLoadCheckTimer.Enabled := False;

    //InfoInitialize := True;
    DeviceConnected := csNothing;

    AntiGroupList := TStringList.Create;
    DeviceDoorList := TStringList.Create;
    DeviceArmAreaList := TStringList.Create;
    DeviceReaderList := TStringList.Create;
    DeviceZoneList := TStringList.Create;
    DeviceZoneExtentionList := TStringList.Create;
    DeviceCardList := TStringList.Create;  //카드 데이터 리스트
    DeviceCardFirstList := TStringList.Create;

    DOOR2RELAYSKILL := True;
    JAEJUNGSKILL := True;
    if G_nProgramType = 2 then ARMAREASKILL := True
    else ARMAREASKILL := False;
    DeviceJavaraScheduleSkill := True;
    ExtendSkill := True;
    if G_nProgramType = 2 then TimeCodeSkill := True
    else TimeCodeSkill := False;
    SecuritySkill := True;
    MaxDoorCount := 8;

    for i := 0 to High(L_bDeviceResponse) do
    begin
      L_bDeviceResponse[i] := False;
    end;
    HolidayClear;

    if G_nMonitoringType = 1 then  //분기국사는 방범구역 상태 체크하지 말자.
       ArmAreaStateRCV := True;  //초기화를 상태 수신으로 처리 후 Connect 시 상태 미수신으로 처리 하자.

    L_bDestroy := False;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.Create');
  End;
end;

procedure TDevice.CurrentDoorState(Sender: TObject; aNodeNo: integer; aEcuID,
  aExtendID, aNumber, aCardMode, aDoorMode, aDoorState, aLockState,
  aDoorFire: string);
begin
  Try
    if Assigned(FOnCurrentDoorState) then
    begin
      OnCurrentDoorState(self,aNodeNo,aEcuID,aExtendID,aNumber, aCardMode, aDoorMode, aDoorState, aLockState,aDoorFire);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.CurrentDoorState');
  End;

end;

destructor TDevice.Destroy;
var
  i : integer;
begin
  Try
    L_bDestroy := True;
    Delay(10);
    FTPCardDownLoadCheckTimer.Enabled := False;

    ReceiveStateClear;
    for i := DeviceDoorList.Count - 1 downto 0 do
    begin
      TDeviceDoor(DeviceDoorList.Objects[i]).Free;
    end;
    for i := DeviceArmAreaList.Count - 1 downto 0 do
    begin
      TDeviceArmArea(DeviceArmAreaList.Objects[i]).Free;
    end;
    for i := DeviceReaderList.Count - 1 downto 0 do
    begin
      TDeviceReader(DeviceReaderList.Objects[i]).Free;
    end;
    for i := DeviceZoneList.Count - 1 downto 0 do
    begin
      TDeviceZone(DeviceZoneList.Objects[i]).Free;
    end;
    for i := DeviceZoneExtentionList.Count - 1 downto 0 do
    begin
      TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).Free;
    end;
    for i := DeviceCardFirstList.Count - 1 downto 0 do
    begin
      TDeviceCard(DeviceCardFirstList.Objects[i]).Free;
    end;
    DeviceCardFirstList.Clear;

    for i := DeviceCardList.Count - 1 downto 0 do
    begin
//      if TDeviceCard(DeviceCardList.Objects[i]).RCVACK = 'S' then TDeviceCard(DeviceCardList.Objects[i]).RCVACK := 'N';   //DB저장 안되니까 필요 없다

      TDeviceCard(DeviceCardList.Objects[i]).Free;
    end;
    DeviceCardList.Clear;


    AntiGroupList.Free;
    DeviceArmAreaList.Free;
    DeviceDoorList.Free;
    DeviceReaderList.Free;
    DeviceZoneList.free;
    DeviceZoneExtentionList.Free;
    DeviceCardList.Free;
    DeviceCardFirstList.Free;

    FTPCardDownLoadCheckTimer.Free;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.Destroy');
  End;
  inherited;
end;

Function TDevice.RcvDeviceAccessEventProcess(aECUID, aDeviceVer, aMsgNo,
  aRealData: string):Boolean;
var
  stDoorNo : string;
  stReaderNo : string;
  stInOut : string;
  stTime : string;
  stCardMode : string;
  stDoorMode : string;
  stChangeState :string;
  stAccessResult : string;
  stDoorState : string;
  stATButton : string;

  nCardNoLen : integer;
  stCardNo : string;
  stExitButton : string;
  bExitButton : Boolean;

  nIndex : integer;
  nTempIndex : integer;
  stSendData : string;
  bCardReSending : Boolean;
  stArmAreaNo : string;
  nResult : integer;
  stCardAccessEvent : string;
  stTempNodeNo : string;
  stAntiGroup : string;

begin
  result := True;
  Try
    bExitButton := False;
    stDoorNo:=  aRealData[3];
    stReaderNo := aRealData[4];
    stInOut := aRealData[5];
    stTime  := '20' + copy(aRealData,6,12);
    stCardMode := aRealData[18]; //Posi/Nega
    stDoorMode:=  aRealData[19]; //운영/개방
    stChangeState := aRealData[20]; //변경사유 'C'.카드,'R'.원격제어,'P'.전화,'B'.퇴실버튼,'S'.스케줄,'F'.화재발생,'f'.원격화재,
    stAccessResult := aRealData[21]; //출입승인결과 'G'근태,1,2,3,A
    stDoorState:= aRealData[22]; //문상태  O:열림,C:닫힘
    stATButton:= aRealData[23]; //근태버튼
    stArmAreaNo := '0';
    stAntiGroup := '0';

    //이벤트 발생시 출입문 상태 체크
    nIndex := DeviceDoorList.IndexOf(stDoorNo);
    if nIndex < 0 then
    begin
      AddDoorNo(stDoorNo);
      nIndex := DeviceDoorList.IndexOf(stDoorNo);
    end;
    if nIndex > -1 then
    begin
      if stChangeState = 'S' then  //스케줄 제어 일때에는 출입문 상태 변경이 올라 오지 않음
      begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).CARDMODE := stCardMode;
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorMode := stDoorMode;
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorCurrentDSState := stDoorState;
        //TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorCurrentLSState := '';
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).CurrentDoorStateChangeAction;
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).CurrentDoorStateCheckRCV := False;  //스케줄 변경시에만 상태 체크하자.
      end;
      //TDeviceDoor(DeviceDoorList.Objects[nIndex]).CurrentDoorStateCheckRCV := False;   //이벤트 수신 할때마다 출입문 상태 조회를 하니 속도가 늦다.
      stAntiGroup := TDeviceDoor(DeviceDoorList.Objects[nIndex]).AntiGroupCode;
    end;

    nCardNoLen := 0;
    if isDigit(Copy(aRealData,24,2)) then nCardNoLen := strtoint(Copy(aRealData,24,2));
    if nCardNoLen = 0 then
    begin
      stCardNo:= copy(aRealData,26,8);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
      stCardNo:= DecodeCardNo(stCardNo,8,True);
      if stCardNo = '00000000' then bExitButton := True
      else
      begin
        nCardNoLen := 16;
        stCardNo := FillCharString(stCardNo,'*',16,False);
      end;
      if length(aRealData) >= (26 + 8 + 5) then stArmAreaNo := aRealData[26 + 8 + 5];

    end else
    begin
      stCardNo := copy(aRealData,26,nCardNoLen);
      if length(aRealData) >= (26 + nCardNoLen + 5) then stArmAreaNo := aRealData[26 + nCardNoLen + 5];

      if CARDTYPE = KT811 then   //KT사옥 프로그램 이면
      begin
        stCardNo := Hex2Ascii(stCardNo);
        if Length(stCardNo) > 10  then
        begin
          if stCardNo[10] = '*' then
          begin
            stCardNo := copy(stCardNo,1,8);
          end;
          if stCardNo = FillZeroNumber(0,11) then bExitButton := True; //KT사옥이면

        end;
        stCardNo := FillCharString(stCardNo,'*',16,False);
        nCardNoLen := 16;
      end;

      if stCardNo = FillZeroNumber(0,nCardNoLen) then bExitButton := True;
    end;

    if Not isdigit(stArmAreaNo) then stArmAreaNo := '0';

    if stInOut = 'S' then Exit;  //서버에서 승인이 난 경우

    if stCardMode = '2' then
    begin
      nTempIndex := AntiPassGroupList.IndexOf(stAntiGroup);
      if nTempIndex > -1 then
      begin
        if Assigned(FOnDeviceCardAccessEvent) then
        begin
          OnDeviceCardAccessEvent(Self,inttostr(TNode(DeviceNode).NO),EcuID,stDoorNo,stReaderNo,stInOut,stTime,
                            stCardMode,stDoorMode,stChangeState,stAccessResult,
                            stDoorState,stATButton,stCardNo,'A',stArmAreaNo,stAntiGroup);

          Exit;
        end;
      end;
    end;

    if bExitButton then
    begin
      stCardNo := FillCharString(stCardNo,'0',16,False);
      if Assigned(FOnDeviceCardAccessEvent) then
      begin
        OnDeviceCardAccessEvent(Self,inttostr(TNode(DeviceNode).NO),EcuID,stDoorNo,stReaderNo,stInOut,stTime,
                          stCardMode,stDoorMode,stChangeState,stAccessResult,
                          stDoorState,stATButton,stCardNo,'B',stArmAreaNo,stAntiGroup);
      end;
      if G_nAccessEventButtonSearch = 0 then //전체이력 남기는 경우
      begin
        Try
          if stArmAreaNo = '' then stArmAreaNo := '*';
          stTempNodeNo := FillZeroNumber(TNode(DeviceNode).NO,G_nNodeCodeLength);                                                                                                              //yyyymmddhhnnss                                                                                           //16자리
          stCardAccessEvent := stTempNodeNo + aEcuID + stDoorNo[1] + stReaderNo[1] + stInOut[1] + stTime + stCardMode[1] + stDoorMode[1] + stChangeState[1] + stAccessResult[1] + stDoorState[1] + stATButton[1] + stCardNo + 'B' + stArmAreaNo[1];
        Except
          result := False;
          LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceCardAccessEvent');
        End;
        if Not FileAppend(G_stEventDataDir + '\CardAccessEvent' + FormatDateTime('yyyymmddhhnnss',now) + stTempNodeNo,stCardAccessEvent,False) then
        begin
          result := False;
        end;

      end;
      Exit;
    end;

    (*
    nResult := 0;
    nIndex := DeviceCardList.IndexOf(stCardNo);
    if nIndex < 0 then
    begin
      if Assigned(FOnCardPermitLoading) then
      begin
        OnCardPermitLoading(Self,stCardNo);
      end;

      //if Not TNode(DeviceNode).CardLoadComplete then
      //begin
        nResult := LoadCardPermit(stCardNo);
      //end;
      nIndex := DeviceCardList.IndexOf(stCardNo);
       //여기도 나중에 처리하자.
    end;

    if nIndex < 0 then
    begin
      //권한이 없는 카드임
      if isDigit(stAccessResult) then  //승인이 된 경우
      begin
        //카드 삭제 즉시 전송
        stSendData := dmDevicePacket.GetCardDataPacketData(CARDTYPE,
                                                           stCardNo,
                                                           '0',
                                                           False, //권한삭제
                                                           '00000000',
                                                           '000000000',
                                                           '00000000',
                                                           '00000000',
                                                           '0',
                                                           '0000',
                                                           '0',
                                                           '0000000',
                                                           '2');

        if nResult <> -1 then SendPacket('c',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stSendData ,1);
      end;
      if stDoorNo = '0' then
      begin
        nTempIndex := DeviceReaderList.IndexOf(stReaderNo);
        if nTempIndex > -1 then
        begin
          stArmAreaNo := inttostr(TDeviceReader(DeviceReaderList.Objects[nTempIndex]).ArmAreaNo);
        end;
      end else
      begin
        nTempIndex := DeviceDoorList.IndexOf(stDoorNo);
        if nTempIndex > -1 then
        begin
          stArmAreaNo := inttostr(TDeviceDoor(DeviceDoorList.Objects[nTempIndex]).ARMAREANO);
        end;
      end;
    end else
    begin
      bCardReSending := False;
      case stAccessResult[1] of
        '1','2' : begin   //출입카드 승인
          if Not TDeviceCard(DeviceCardList.Objects[nIndex]).CheckValidDate(copy(stTime,1,8))  then bCardReSending := True
          else
          begin
            if Not TDeviceCard(DeviceCardList.Objects[nIndex]).CheckDoorPermit(stDoorNo) then bCardReSending := True;
          end;
          if TDeviceCard(DeviceCardList.Objects[nIndex]).EMSTATE <> '1' then bCardReSending := True; //퇴직상태면 재전송
          if stDoorNo = '0' then
          begin
            nTempIndex := DeviceReaderList.IndexOf(stReaderNo);
            if nTempIndex > -1 then
            begin
              stArmAreaNo := inttostr(TDeviceReader(DeviceReaderList.Objects[nTempIndex]).ArmAreaNo);
            end;
          end else
          begin
            nTempIndex := DeviceDoorList.IndexOf(stDoorNo);
            if nTempIndex > -1 then
            begin
              stArmAreaNo := inttostr(TDeviceDoor(DeviceDoorList.Objects[nTempIndex]).ARMAREANO);
            end;
          end;
        end;
        '3','4' : begin   //방범 경/해 승인
          if stDoorNo = '0' then
          begin
            nTempIndex := DeviceReaderList.IndexOf(stReaderNo);
            if nTempIndex > -1 then
            begin
              stArmAreaNo := inttostr(TDeviceReader(DeviceReaderList.Objects[nTempIndex]).ArmAreaNo);
            end;
          end else
          begin
            nTempIndex := DeviceDoorList.IndexOf(stDoorNo);
            if nTempIndex > -1 then
            begin
              stArmAreaNo := inttostr(TDeviceDoor(DeviceDoorList.Objects[nTempIndex]).ARMAREANO);
            end;
          end;
          if Not TDeviceCard(DeviceCardList.Objects[nIndex]).CheckValidDate(copy(stTime,1,8))  then bCardReSending := True
          else
          begin
            if stArmAreaNo <> '' then
            begin
              if Not TDeviceCard(DeviceCardList.Objects[nIndex]).CheckArmAreaPermit(stArmAreaNo) then bCardReSending := True;
            end;
          end;
          if TDeviceCard(DeviceCardList.Objects[nIndex]).EMSTATE <> '1' then bCardReSending := True; //퇴직상태면 재전송
        end;
        'A' : begin       //미등록 카드
          if TDeviceCard(DeviceCardList.Objects[nIndex]).CheckValidDate(copy(stTime,1,8))  and
             TDeviceCard(DeviceCardList.Objects[nIndex]).CARDPERMIT and
             (TDeviceCard(DeviceCardList.Objects[nIndex]).EMSTATE = '1') then bCardReSending := True; //등록된 카드면 재전송
        end;
        'B' : begin       //출입조작 권한 불가
          if TDeviceCard(DeviceCardList.Objects[nIndex]).CheckValidDate(copy(stTime,1,8))  and
             TDeviceCard(DeviceCardList.Objects[nIndex]).CheckDoorPermit(stDoorNo) and
             (TDeviceCard(DeviceCardList.Objects[nIndex]).EMSTATE = '1') then bCardReSending := True;
        end;
        'C' : begin       //방범조작 권한 불가
          if stDoorNo = '0' then
          begin
            nTempIndex := DeviceReaderList.IndexOf(stReaderNo);
            if nTempIndex > -1 then
            begin
              stArmAreaNo := inttostr(TDeviceReader(DeviceReaderList.Objects[nTempIndex]).ArmAreaNo);
            end;
          end else
          begin
            nTempIndex := DeviceDoorList.IndexOf(stDoorNo);
            if nTempIndex > -1 then
            begin
              stArmAreaNo := inttostr(TDeviceDoor(DeviceDoorList.Objects[nTempIndex]).ARMAREANO);
            end;
          end;
          if TDeviceCard(DeviceCardList.Objects[nIndex]).CheckValidDate(copy(stTime,1,8)) and
             (TDeviceCard(DeviceCardList.Objects[nIndex]).EMSTATE = '1')  then
          begin
            if stArmAreaNo <> '' then
            begin
              if TDeviceCard(DeviceCardList.Objects[nIndex]).CheckArmAreaPermit(stArmAreaNo) then bCardReSending := True;
            end;
          end;
        end;
        'D' : begin       //경계모드 출입 불가

        end;
        'E' : begin       //출입 제한 시간

        end;
        'F' : begin       //유효기간 만료
          if TDeviceCard(DeviceCardList.Objects[nIndex]).CheckValidDate(copy(stTime,1,8))  then bCardReSending := True;
        end;
        'G' : begin       //근태

        end;
        'H' : begin       //폐쇄모드출입불가

        end;
        'I' : begin       //구역 다름

        end;

        'J' : begin       //안티패스 출입불가

        end;
      end;
      if bCardReSending then
      begin
        stSendData := dmDevicePacket.GetCardDataPacketData(CARDTYPE,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).CARDNO,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).PositionNum,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).CARDPERMIT,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).GetDoorPermit(MaxDoorCount),
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).GetArmAreaPermit,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).REGDATE,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).ENDDATE,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).GetTimeCodeUse,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).GetTimeCode,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).GetTimeGroup,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).GetWeekCode,
                                                           TDeviceCard(DeviceCardList.Objects[nIndex]).EMSTATE);
        SendPacket('c',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stSendData ,1);
      end;

    end;  *)

    Try
      if stArmAreaNo = '' then stArmAreaNo := '*';
      stTempNodeNo := FillZeroNumber(TNode(DeviceNode).NO,G_nNodeCodeLength);                                                                                                              //yyyymmddhhnnss                                                                                           //16자리
      stCardAccessEvent := stTempNodeNo + aEcuID + stDoorNo[1] + stReaderNo[1] + stInOut[1] + stTime + stCardMode[1] + stDoorMode[1] + stChangeState[1] + stAccessResult[1] + stDoorState[1] + stATButton[1] + stCardNo + 'E' + stArmAreaNo[1];
    Except
      result := False;
      LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceCardAccessEvent');
    End;
    if Not FileAppend(G_stEventDataDir + '\CardAccessEvent' + FormatDateTime('yyyymmddhhnnss',now) + stTempNodeNo,stCardAccessEvent,False) then
    begin
      result := False;
    end;

    if Assigned(FOnDeviceCardAccessEvent) then
    begin
      OnDeviceCardAccessEvent(Self,inttostr(TNode(DeviceNode).NO),EcuID,stDoorNo,stReaderNo,stInOut,stTime,
                        stCardMode,stDoorMode,stChangeState,stAccessResult,
                        stDoorState,stATButton,stCardNo,'E',stArmAreaNo,stAntiGroup);
    end;

  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceAccessEventProcess');
  End;
end;

procedure TDevice.DeviceAlarmStateClear;
var
  i : integer;
begin
  Try
    for i := 0 to DeviceArmAreaList.Count - 1 do
    begin
      TDeviceArmArea(DeviceArmAreaList.Objects[i]).ArmAreaCurrentSecurityMode := '';
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceAlarmStateClear');
  End;
end;

function TDevice.DeviceArmAreaStateCheck(aArmArea:integer = 0;aDelay:Boolean = True): Boolean;
var
  stData : string;
  stArmArea : string;
  stTargetEcuID : string;
  i : integer;
begin
  if L_bDestroy then Exit;
  if DeviceNode.NodeDestory then Exit;
  Try
    stArmArea := '';
    for i := 0 to G_nDefaultArmAreaCount do
    begin
      if aArmArea = 0 then
      begin
        stArmArea := stArmArea + '1';
      end else
      begin
        if i = aArmArea  then stArmArea := stArmArea + '1'
        else stArmArea := stArmArea + '0';
      end;
    end;

    if ARMAREAUSE = '1' then //방범구역 사용중이면
    begin
      stTargetEcuID := ECUID;
      stData := 'rd01' + stArmArea;
    end else
    begin
      stTargetEcuID := '00';
      stData := 'RD00' + EcuID;
    end;

    L_bDeviceResponse[con_DeviceCmdArmAreaState] := False;

    if DeviceNode <> nil then
       DeviceNode.SendPacket(stTargetEcuID,'R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer,stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdArmAreaState,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceArmAreaStateCheck');
  End;
end;

function TDevice.DeviceArmAreaUseCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdArmAreaUse] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'fn02',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdArmAreaUse,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceArmAreaUseCheck');
  End;
end;

function TDevice.DeviceArmAreaUseSetting(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Try
    if ARMAREAUSE = '' then ARMAREAUSE := '0';

    stData := 'fn02' + ARMAREAUSE[1];
    L_bDeviceResponse[con_DeviceCmdArmAreaUse] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdArmAreaUse,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceArmAreaUseSetting');
  End;
end;

function TDevice.DeviceARMEXTENTIONMAINFromLOCALCheck(aDelay: Boolean): Boolean;
begin
  Try
    if ECUID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdARMEXTENTIONMAINFROMLOCAL] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'EX03',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceARMEXTENTIONMAINFromLOCALCheck');
  End;
end;

function TDevice.DeviceARMEXTENTIONMAINTOLOCALCheck(aDelay: Boolean): Boolean;
begin
  Try
    if ECUID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdARMEXTENTIONMAINTOLOCAL] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'EX04',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdARMEXTENTIONMAINTOLOCAL,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceARMEXTENTIONMAINTOLOCALCheck');
  End;
end;

function TDevice.DeviceARMRELAYCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdArmRelay] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'fn05',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdArmRelay,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceARMRELAYCheck');
  End;
end;

function TDevice.DeviceARMRELAYSetting(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Try
    stData := 'fn05';
    if ARMRELAY = '1'  then stData := stData + 'D'
    else stData := stData + 'A';

    L_bDeviceResponse[con_DeviceCmdArmRelay] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdArmRelay,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceARMRELAYSetting');
  End;
end;

function TDevice.DeviceCardAllResend: Boolean;
var
  i : integer;
begin
  Try
    result := True;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdFTPCardDownLoadEnd,'Y');
    end;

    if DeviceCardFirstList.Count > 0 then
    begin
      for i := 0 to DeviceCardFirstList.Count -1 do
      begin
        TDeviceCard(DeviceCardFirstList.Objects[i]).RCVACK := 'R';
      end;
    end;

    if DeviceCardList.Count < 1 then Exit;

    for i := 0 to DeviceCardList.Count -1 do
    begin
      TDeviceCard(DeviceCardList.Objects[i]).RCVACK := 'R';
    end;

  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceCardAllResend');
  End;
end;

function TDevice.DeviceCardReaderNetworkCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdCardReaderNetwork] := False;
    SendPacket('R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'cs01',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdCardReaderNetwork,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceCardReaderNetworkCheck');
  End;
end;

function TDevice.DeviceCardReaderTypeCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdCardReaderType] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'Ct00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdCardReaderType,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceCardReaderTypeCheck');
  End;
end;

function TDevice.DeviceCardReaderTypeSetting(aDelay: Boolean): Boolean;
var
  stCardReaderType : string;
  i : integer;
begin
  Try
    stCardReaderType := '';
    for i := 0 to DeviceReaderList.Count - 1 do
    begin
      stCardReaderType := stCardReaderType + inttostr(TDeviceReader(DeviceReaderList.Objects[i]).ReaderType)[1];
    end;

    if CARDREADERTYPE = '' then CARDREADERTYPE := '0';
    stCardReaderType := CARDREADERTYPE[1] + '0' + stCardReaderType;

    L_bDeviceResponse[con_DeviceCmdCardReaderType] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'Ct00' + stCardReaderType,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdCardReaderType,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceCardReaderTypeSetting');
  End;
end;

procedure TDevice.RcvDeviceCardRegProcess(aECUID, aDeviceVer, aMsgNo,
  aRealData: string);
var
  stCmd : string;
  stDoorNo : string;
  stCardType : string;
  nCardLen : integer;
  stCardNo : string;
  stExpireDate : string;
  stRegResult : string;
  stCardAuth : string;
  stTimeMode : string;
  stCardPositionNum : string;
  stAlarmAreaGrade : string;
  stDoorAreaGrade : string;
  stHex : string;
  stBinaryCode : string;
  i : integer;
  nIndex : integer;
begin
  Try
    stCmd := aRealData[1];

    stDoorNo   := Copy(aRealData,3,1);
    stCardType := Copy(aRealData,4,2);

    nCardLen := 0;
    if isDigit(Copy(aRealData,7,2)) then nCardLen := strtoint(Copy(aRealData,7,2));

    if nCardLen = 0 then //4Byte 고정
    begin
      stCardNo:= copy(aRealData,9,8);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
      stCardNo:= DecodeCardNo(stCardNo);
      stCardNo := dec2Hex(strtoint64(stCardNo),8);
      stCardNo := FillCharString(stCardNo,'*',16,False);
      nCardLen := 8;
    end else
    begin
      stCardNo := copy(aRealData,9,nCardLen);
      if CARDTYPE = KT811 then stCardNo := Hex2Ascii(stCardNo);
    end;

    if L_stCardDownLoadData = stCardNo then L_bAutoCarddownLoadRCV := True;
    while L_bCardSendCompleteClear do  //혹시 카드 정리 중이면 정리 끝날때까지 기다리자.
    begin
      sleep(1);
      Application.ProcessMessages;
    end;

    nIndex := DevicecardFirstList.IndexOf(stCardNo);
    if nIndex > -1 then
    begin
      if TDeviceCard(DevicecardFirstList.Objects[nIndex]).RCVACK = 'S' then TDeviceCard(DevicecardFirstList.Objects[nIndex]).RCVACK := 'Y';
    end;

    nIndex := DevicecardList.IndexOf(stCardNo);
    if nIndex > -1 then
    begin
      if TDeviceCard(DevicecardList.Objects[nIndex]).RCVACK = 'S' then TDeviceCard(DevicecardList.Objects[nIndex]).RCVACK := 'Y';
    end;

    stExpireDate := Copy(aRealData,9 + nCardLen ,6);
    stRegResult := copy(aRealData,9 + nCardLen + 6,1); //등록결과
    stCardAuth := copy(aRealData,9 + nCardLen + 7,1);  //카드권한
    stTimeMode := copy(aRealData,9 + nCardLen + 8,1);  //출입시간모드
    stCardPositionNum := '';
    stAlarmAreaGrade := '';
    stDoorAreaGrade := '';
    if Length(aRealData) > (9 + nCardLen + 8) then
      stCardPositionNum := copy(aRealData,9 + nCardLen + 9,5);  //위치정보
    if Length(aRealData) > (9 + nCardLen + 16) then
    begin
      stHex := ASCII2Hex(aRealData[9 + nCardLen + 14]);
      stBinaryCode := Hex2Binary(stHex);
      for i := 5 to 8 do
      begin
        if stBinaryCode[i] = '1' then stAlarmAreaGrade := stAlarmAreaGrade + '1'
        else stAlarmAreaGrade := stAlarmAreaGrade + '0';
      end;
      stHex := ASCII2Hex(aRealData[9 + nCardLen + 15]);
      stBinaryCode := Hex2Binary(stHex);
      for i := 5 to 8 do
      begin
        if stBinaryCode[i] = '1' then stAlarmAreaGrade := stAlarmAreaGrade + '1'
        else stAlarmAreaGrade := stAlarmAreaGrade + '0';
      end;
      stHex := ASCII2Hex(aRealData[9 + nCardLen + 16]);
      stBinaryCode := Hex2Binary(stHex);
      for i := 5 to 8 do
      begin
        if stBinaryCode[i] = '1' then stDoorAreaGrade := stDoorAreaGrade + '1'
        else stDoorAreaGrade := stDoorAreaGrade + '0';
      end;
      stHex := ASCII2Hex(aRealData[9 + nCardLen + 17]);
      stBinaryCode := Hex2Binary(stHex);
      for i := 5 to 8 do
      begin
        if stBinaryCode[i] = '1' then stDoorAreaGrade := stDoorAreaGrade + '1'
        else stDoorAreaGrade := stDoorAreaGrade + '0';
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceCardRegProcess');
  End;
end;

function TDevice.DeviceCodeCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdDeviceCode] := False;
    SendPacket('R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'VR01',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdDeviceCode,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceCodeCheck');
  End;
end;

procedure TDevice.DeviceCurrentArmDoorStateCheck;
var
  i : integer;
  bResult : Boolean;
begin
  if L_bDestroy then Exit;
  if DeviceNode.NodeDestory then Exit;
  Try
    if (G_nMonitoringType <> 1) and Not ArmAreaStateRCV then
    begin
      if SecuritySkill then
         DeviceArmAreaStateCheck;
    end;
    if Not DoorStateRCV then
    begin
      Try
        Try
          if L_nDeviceDoorStateCheckSeq > DeviceDoorList.Count - 1 then L_nDeviceDoorStateCheckSeq := 0;
          if L_nDeviceDoorStateCheckSeq < 0 then L_nDeviceDoorStateCheckSeq := 0;
          if Not TDeviceDoor(DeviceDoorList.Objects[L_nDeviceDoorStateCheckSeq]).CurrentDoorStateCheckRCV then
             TDeviceDoor(DeviceDoorList.Objects[L_nDeviceDoorStateCheckSeq]).DeviceDoorStateCheck
          else
          begin
            bResult := False;
            for i := 0 to DeviceDoorList.Count - 1 do
            begin
              if Not TDeviceDoor(DeviceDoorList.Objects[L_nDeviceDoorStateCheckSeq]).CurrentDoorStateCheckRCV then
              begin
                bResult := False;
                break;
              end;
              if i = DeviceDoorList.Count - 1 then bResult := True;
            end;
            DoorStateRCV := bResult;
          end;
        Except
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceCurrentArmDoorStateCheck');
        End;
      Finally
        L_nDeviceDoorStateCheckSeq := L_nDeviceDoorStateCheckSeq + 1;
      End;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceCurrentArmDoorStateCheck');
  End;
end;

function TDevice.DeviceDoor2RelayCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdDeviceDoor2RelayType] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'DL03',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdDeviceDoor2RelayType,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceDoor2RelayCheck');
  End;
end;

function TDevice.DeviceDoor2RelaySetting(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Try
    stData := FillZeroNumber(0,9);
    stData[3] := DOOR2RELAY[1];

    L_bDeviceResponse[con_DeviceCmdDeviceDoor2RelayType] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'DL03' + stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdDeviceDoor2RelayType,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceDoor2RelaySetting');
  End;
end;

function TDevice.DeviceDoorArmAreaCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdDeviceDoorArmArea] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'DL10**',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdDeviceDoorArmArea,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceDoorArmAreaCheck');
  End;

end;

function TDevice.DeviceDoorArmAreaSetting(aDelay: Boolean): Boolean;
var
  stData : string;
  i : integer;
begin
  Try
    stData := '';
    for i := 0 to con_MaxDoorCount - 1 do
    begin
      if i < (DeviceDoorList.Count) then
        stData := stData + ' ' + FillZeroNumber(TDeviceDoor(DeviceDoorList.Objects[i]).ARMAREANO,2)
      else stData := stData + ' ' + '01';
    end;

    L_bDeviceResponse[con_DeviceCmdDeviceDoorArmArea] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'DL10**' + stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdDeviceDoorArmArea,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceDoorArmAreaSetting');
  End;

end;

procedure TDevice.DeviceDoorStateClear;
var
  i : integer;
begin
  Try
    for i := 0 to DeviceDoorList.Count - 1 do
    begin
      TDeviceDoor(DeviceDoorList.Objects[i]).CARDMODE := '';
      TDeviceDoor(DeviceDoorList.Objects[i]).DOORMODE := '';
      TDeviceDoor(DeviceDoorList.Objects[i]).DoorCurrentDSState := '';
      TDeviceDoor(DeviceDoorList.Objects[i]).DoorCurrentLSState := '';
      TDeviceDoor(DeviceDoorList.Objects[i]).DoorCurrentFireEvent := '';
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceDoorStateClear');
  End;
end;

function TDevice.DeviceDoorTimeCodeUseCheck(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Try
    result := True;
    stData := '';

    stData := 'DL09*' +
              stData;

    L_bDeviceResponse[con_DeviceCmdTimeCodeUse] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdTimeCodeUse,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceDoorTimeCodeUseCheck');
  End;
end;

function TDevice.DeviceDoorTimeCodeUseSetting(aDelay: Boolean): Boolean;
var
  stData : string;
  i : integer;
begin
  Try
    result := True;
    stData := '';
    for i := 0 to con_MaxDoorCount - 1 do
    begin
      if i < DeviceDoorList.Count then
      begin
        if TDeviceDoor(DeviceDoorList.Objects[i]).TimeCodeUse <> '' then stData := stData + TDeviceDoor(DeviceDoorList.Objects[i]).TimeCodeUse[1]
        else stData := stData + '0';
      end else stData := stData + '0';
    end;

    stData := 'DL09*' +
              stData;

    L_bDeviceResponse[con_DeviceCmdTimeCodeUse] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdTimeCodeUse,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceDoorTimeCodeUseSetting');
  End;
end;

function TDevice.DeviceDVRDataCheck(aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdDVRIP] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'DV01',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdDVRIP,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceDVRDataCheck');
  End;

end;

function TDevice.DeviceDVRUseCheck(aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeivceCmdDVRUSE] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'DV00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeivceCmdDVRUSE,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceDVRUseCheck');
  End;
end;

function TDevice.DeviceECUUseCheck(aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdUseState] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'EX00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdUseState,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceECUUseCheck');
  End;
end;

function TDevice.DeviceEmZoneLampSirenCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdEMZONELAMP] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'RYEP',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdEMZONELAMP,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceEmZoneLampSirenCheck');
  End;
end;

function TDevice.DeviceExtentionNetworkCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdExtentionNetwork] := False;
    SendPacket('R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'cs03',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdExtentionNetwork,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceExtentionNetworkCheck');
  End;
end;

function TDevice.DeviceExtentionTypeCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdExtentionUse] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'EL00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdExtentionUse,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceExtentionTypeCheck');
  End;
end;

function TDevice.DeviceExtentionTypeSetting(aDelay: Boolean): Boolean;
var
  stData : string;
  i : integer;
begin
  Try
    stData := '0';
    for i := 1 to DeviceZoneExtentionList.Count - 1 do  //0은 본체임
    begin
      if TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).ZONEEXTENDTYPE = '' then TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).ZONEEXTENDTYPE := '0';
      stData := stData + TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).ZONEEXTENDTYPE[1];
    end;

    L_bDeviceResponse[con_DeviceCmdExtentionUse] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'EL00' + stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdExtentionUse,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceExtentionTypeSetting');
  End;
end;

function TDevice.DeviceFTPCardDataCreate(var aFTPCardFileName:string): Boolean;
var
  stNodeNo : string;
  stFileName : string;
  i,j : integer;
  stSendData : string;
  nCheckSum : integer;
  stCheckSum : string;
  stTemp : string;
begin
  Try
    result := False;
    stFileName := ExtractFileDir(Application.ExeName) + '\data';
    if Not DirectoryExists(stFileName) then
    begin
      if Not CreateDir(stFileName) then Exit;
    end;
    stNodeNo := FillZeroNumber(DeviceNode.No,G_nNodeCodeLength);
    stFileName := stFileName + '\' + stNodeNo + EcuID;

    if FileExists(stFileName) then
    begin
      if Not DeleteFile(PWideChar(stFileName)) then Exit;
    end;
    aFTPCardFileName := stFileName;

    for i := 0 to DeviceCardList.Count - 1 do
    begin
      if TDeviceCard(DeviceCardList.Objects[i]).CARDPERMIT then   //출입권한이 있는 경우에만
      begin
        TDeviceCard(DeviceCardList.Objects[i]).RCVACK := 'F';
        stSendData := dmDevicePacket.GetCardDataPacketData(CARDTYPE,
                                                             TDeviceCard(DeviceCardList.Objects[i]).CARDNO,
                                                             TDeviceCard(DeviceCardList.Objects[i]).PositionNum,
                                                             TDeviceCard(DeviceCardList.Objects[i]).CARDPERMIT,
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetDoorPermit(MaxDoorCount),
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetArmAreaPermit,
                                                             TDeviceCard(DeviceCardList.Objects[i]).REGDATE,
                                                             TDeviceCard(DeviceCardList.Objects[i]).ENDDATE,
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetTimeCodeUse,
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetTimeCode,
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetTimeGroup,
                                                             TDeviceCard(DeviceCardList.Objects[i]).GetWeekCode,
                                                             TDeviceCard(DeviceCardList.Objects[i]).EMSTATE);
        nCheckSum := 0;
        for j:= 1 to Length(stSendData) do
        begin
          nCheckSum := nCheckSum + Ord(stSendData[j]);
        end;
        if G_nProgramType = 1 then
        begin
          nCheckSum := nCheckSum + Ord(#$A7);
        end else if G_nProgramType = 2 then
        begin
          nCheckSum := nCheckSum + Ord(#$9E);
        end;

        stCheckSum := Dec2Hex(nCheckSum,2);
        if Length(stCheckSum) < 2 then stCheckSum := '0' + stCheckSum
        else if Length(stCheckSum) > 2 then stCheckSum := copy(stCheckSum,Length(stCheckSum) - 1,2);

        stSendData := stSendData + ',' + stCheckSum;
        FileAppend(stFileName,stSendData);
      end;
    end;
    for i := 0 to 300 do
    begin
      FileAppend(stFileName,'                                                              ');
      //파일 마지막 단에 TEMP 파일을 넣어서 세션 유지.
    end;
    result := True;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceFTPCardDataCreate');
  End;
end;

function TDevice.DeviceFTPCardDownLoadStart: Boolean;
var
  stFTPCardFileName : string;
  clFileInfo : TFileInfo;
  stSendData : string;
begin
  Try
    Try
      L_bFTPCardDownLoading := True;
      result := True;
      if FTPFirst then
      begin
        if Assigned(FOnEmployeePermit) then
        begin
          OnEmployeePermit(Self,TNode(DeviceNode).NO,EcuID);
        end;
        if Assigned(FOnCardPermit) then
        begin
          OnCardPermit(Self,TNode(DeviceNode).NO,EcuID);
        end;
      end;
      FTPFirst := False;
      if DeviceCardList.Count < 1 then
      begin
        FTPCardDownLoadEnd := True;
        Exit;  //다운로드 할 카드가 없으면 빠져 나감
      end;

      result := False;
      if  Not FTPSkill then
      begin
        FTPCardDownLoadEnd := True;
        //FTP 카드 다운로드 기능이 없다.
        result := DeviceCardAllResend;
        Exit;
      end;
      if G_nMonitoringType = 1 then
      begin
        FTPCardDownLoadEnd := True;
        //분기국사는 방화벽 때문에 FTP 타입이 지원 안됨
        result := DeviceCardAllResend;
        Exit;
      end;

      result := False;
      if Not DeviceFTPCardDataCreate(stFTPCardFileName) then Exit;
      if Not FileExists(stFTPCardFileName) then Exit;
      clFileInfo := TFileInfo.Create(stFTPCardFileName);
      stSendData := 'fp02';       //CardData(All Clear)
      stSendData := stSendData + '1'; //모니터링 유무(1: 모니터링,0:안함)
      stSendData := stSendData + '1'; //게이지 데이터 전송 유무

      stSendData := stSendData + 'pc' + ' ' + G_stDecoderServerIP;
      stSendData := stSendData + ' ' + inttostr(G_nDecoderFTPServerPort);
      stSendData := stSendData + ' zeron' ;
      stSendData := stSendData + ' zeronpass';
      stSendData := stSendData + ' ' + clFileInfo.FileName;
      stSendData := stSendData + ' ' + inttostr(clFileInfo.FileSize);
      clFileInfo.Free;
      SendPacket('R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'fp00' ,0);  //혹시라도 FTP 다운로드 중이면 정지 시키자.
      Delay(100);

      FTPCardDownLoadEnd := False;
      FTPCardDownLoadFail := False;
      SendPacket('R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stSendData ,2);

      L_bFTPCardReceiv := True;
      FTPCardDownLoadCheckTimer.Enabled := True;

      (*
      while Not (FTPCardDownLoadEnd or FTPCardDownLoadFail) do
      begin
        if G_bApplicationTerminate then Exit;
        if DeviceNode.NodeDestory then Exit;
        if L_bDestroy then Exit;
        Application.ProcessMessages;
        sleep(1);
      end;
      Result := FTPCardDownLoadEnd;

      FTPCardDownLoadCheckTimer.Enabled := False;
      *)
    Finally
      L_bFTPCardDownLoading := False;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceFTPCardDownLoadStart');
  End;
end;


function TDevice.DeviceIDCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdDeviceID] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer,'ID' + FillZeroNumber(0,G_nIDLength + 2),0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdDeviceID,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceIDCheck');
  End;
end;

procedure TDevice.DeviceInformationCheck(aInformationType: integer);   //기기정보조회
begin
  Try
    if DeviceNode.NodeDestory then Exit;
    if L_bDestroy then Exit;

    case aInformationType of
      con_DeviceCmdArmAreaUse : begin
        if Not ARMAREASKILL then
        begin
          DEVICEARMAREAUSERCV := 'Y';
          Exit;
        end;
        DEVICEARMAREAUSERCV := 'R';
        DeviceArmAreaUseCheck;
        if DEVICEARMAREAUSERCV = 'R' then DEVICEARMAREAUSERCV := 'Y';
      end;  //방범구역사용유무
      con_DeviceCmdArmRelay : begin
        DEVICEARMRELAYRCV := 'R';
        DeviceARMRELAYCheck;
        if DEVICEARMRELAYRCV = 'R' then DEVICEARMRELAYRCV := 'N';
      end;  //경해접점릴레이
      con_DeviceCmdCardReaderNetwork : begin   //카드리더 통신체크 --> 왜 하지 카드리더 사용유무 알려고?
        DEVICECARDREADERNETWORKRcv := 'R';
        DeviceCardReaderNetworkCheck;
        if DEVICECARDREADERNETWORKRcv = 'R' then DEVICECARDREADERNETWORKRcv := 'N';
      end;
      con_DeviceCmdCardReaderType : begin
        DEVICECARDREADERTYPERCV := 'R';
        DeviceCardReaderTypeCheck;
        if DEVICECARDREADERTYPERCV = 'R' then DEVICECARDREADERTYPERCV := 'N';
      end;  //카드리더타입
      con_DeviceCmdDeviceCode : begin
        DEVICECODERCV := 'R';
        DeviceCodeCheck;
        if DEVICECODERCV = 'R' then DEVICECODERCV := 'N';
      end;  //기기코드
      con_DeviceCmdDeviceDoorArmArea : begin
        DEVICEDOORARMAREARCV := 'R';
        DeviceDoorArmAreaCheck;
        if DEVICEDOORARMAREARCV = 'R' then DEVICEDOORARMAREARCV := 'N';
      end;  //출입문 방범구역
      con_DeviceCmdDeviceDoor2RelayType : begin
        DEVICEDOOR2RELAYRCV := 'R';
        DeviceDoor2RelayCheck;
        if DEVICEDOOR2RELAYRCV = 'R' then DEVICEDOOR2RELAYRCV := 'N';
      end;  //출입문2릴레이타입
      con_DeviceCmdEMZONELAMP : begin
        DEVICEEMZONELAMPRCV := 'R';
        DeviceEmZoneLampSirenCheck;
        if DEVICEEMZONELAMPRCV = 'R' then DEVICEEMZONELAMPRCV := 'N';
      end;  //비상존램프
      con_DeviceCmdExtentionNetwork : begin  //통신상태 체크
        DEVICEExtentionNetworkRCV := 'R';
        DeviceExtentionNetworkCheck;
        if DEVICEExtentionNetworkRCV = 'R' then DEVICEExtentionNetworkRCV := 'N'; //한번만 체크 하자.
      end;
      con_DeviceCmdExtentionUse : begin
        DEVICEDEVICEEXTENTIONUSERCV := 'R';
        DeviceExtentionTypeCheck;
        if DEVICEDEVICEEXTENTIONUSERCV = 'R' then DEVICEDEVICEEXTENTIONUSERCV := 'N';
      end;  //존확장기사용유무
      con_DeviceCmdJaeJungDelayUse : begin
        DEVICEJAEJUNGDELAYUSERCV := 'R';
        DeviceJaejungDelayUseCheck;
        if DEVICEJAEJUNGDELAYUSERCV = 'R' then DEVICEJAEJUNGDELAYUSERCV := 'N';
      end;  //재중지연시간사용유무
      con_DeviceCmdJAVARAARMCLOSE : begin
        DEVICEJAVARAARMCLOSERCV := 'R';
        DeviceJavaraArmCloseCheck;
        if DEVICEJAVARAARMCLOSERCV = 'R' then DEVICEJAVARAARMCLOSERCV := 'N';
      end;  //자바라경계시자동닫힘유무
      con_DeviceCmdJAVARAAUTOCLOSE : begin
        DEVICEJAVARAAUTOCLOSERCV := 'R';
        DeviceJavaraAutoCloseCheck;
        if DEVICEJAVARAAUTOCLOSERCV = 'R' then DEVICEJAVARAAUTOCLOSERCV := 'N';
      end;  //자바리자동닫힘사용유무
      con_DeviceCmdLAMPONTIME : begin
        DEVICELAMPONTIMERCV := 'R';
        DeviceLampOnTimeCheck;
        if DEVICELAMPONTIMERCV = 'R' then DEVICELAMPONTIMERCV := 'N';
      end;  //램프On시간
      con_DeviceCmdSIRENONTIME : begin
        DEVICESIRENONTIMERCV := 'R';
        DeviceSIRENOnTimeCheck;
        if DEVICESIRENONTIMERCV = 'R' then DEVICESIRENONTIMERCV := 'N';
      end;  //사이렌On시간
      con_DeviceCmdSystemInformation : begin
        DEVICESYSTEMINFORMATIONRCV := 'R';
        DeviceSystemInformationCheck;
        if DEVICESYSTEMINFORMATIONRCV = 'R' then DEVICESYSTEMINFORMATIONRCV := 'N';
      end;  //시스템정보
      con_DeviceCmdVER : begin
        DEVICEVERRCV := 'R';
        DeviceVersionCheck;
        if DEVICEVERRCV = 'R' then DEVICEVERRCV := 'N';
      end;  //기기버젼
      con_DeviceCmdTimeCodeSend : begin   //TimeCodeSend
        DEVICETIMECODERCV := 'Y';         //조회기능은 없다.
      end;
      con_DeviceCmdTimeCodeUse : begin  //출입문 시간코드 사용유무
        if Not TimeCodeSkill then //스케줄 기능이 없으면 전송하지 말자.
        begin
          DEVICETIMECODEUSERCV := 'Y'
        end else
        begin
          DEVICETIMECODEUSERCV := 'R';
          DeviceDoorTimeCodeUseCheck;
          if DEVICETIMECODEUSERCV = 'R' then DEVICETIMECODEUSERCV := 'N';
        end;
      end;

    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceInformationCheck');
  End;
end;

procedure TDevice.DeviceInformationSend(aInformationType: integer);   //기기정보등록
begin
  Try
    case aInformationType of
      con_DeviceCmdVER : begin
        DEVICEVERRCV := 'S';
      end;  //기기버젼
      con_DeviceCmdDeviceCode : begin
        DEVICECODERCV := 'S';
      end;  //기기코드
      con_DeviceCmdDeviceDoor2RelayType : begin
        DEVICEDOOR2RELAYRCV := 'S';
        DeviceDoor2RelaySetting;
        if DEVICEDOOR2RELAYRCV = 'S' then DEVICEDOOR2RELAYRCV := 'U';
      end;  //출입문2릴레이타입
      con_DeviceCmdSystemInformation : begin
        DEVICESYSTEMINFORMATIONRCV := 'S';
        DeviceSystemInformationSetting;
        if DEVICESYSTEMINFORMATIONRCV = 'S' then DEVICESYSTEMINFORMATIONRCV := 'U';
      end;  //AC정전 타입
      con_DeviceCmdArmRelay : begin
        DEVICEARMRELAYRCV := 'S';
        DeviceARMRELAYSetting;
        if DEVICEARMRELAYRCV = 'S' then DEVICEARMRELAYRCV := 'U';
      end;  //경해접점릴레이
      con_DeviceCmdCardReaderType : begin
        DEVICECARDREADERTYPERCV := 'S';
        DeviceCardReaderTypeSetting;
        if DEVICECARDREADERTYPERCV = 'S' then DEVICECARDREADERTYPERCV := 'U';
      end;  //카드리더타입
      con_DeviceCmdEMZONELAMP : begin
        DEVICEEMZONELAMPRCV := 'S';
      end;  //비상존램프
      con_DeviceCmdLAMPONTIME : begin
        DEVICELAMPONTIMERCV := 'S';
      end;  //램프On시간
      con_DeviceCmdSIRENONTIME : begin
        DEVICESIRENONTIMERCV := 'S';
      end;  //사이렌On시간
      con_DeviceCmdArmAreaUse : begin
        DEVICEARMAREAUSERCV := 'S';
        DeviceArmAreaUseSetting;
        if DEVICEARMAREAUSERCV = 'S' then DEVICEARMAREAUSERCV := 'U';
      end;  //방범구역사용유무
      con_DeviceCmdDeviceDoorArmArea : begin
        DEVICEDOORARMAREARCV := 'S';
        DeviceDoorArmAreaSetting;
        if DEVICEDOORARMAREARCV = 'S' then DEVICEDOORARMAREARCV := 'U';
      end;  //출입문 방범구역
      con_DeviceCmdExtentionUse : begin
        DEVICEDEVICEEXTENTIONUSERCV := 'S';
        DeviceExtentionTypeSetting;
        if DEVICEDEVICEEXTENTIONUSERCV = 'S' then DEVICEDEVICEEXTENTIONUSERCV := 'U';
      end;  //존확장기사용유무
      con_DeviceCmdJaeJungDelayUse : begin
        DEVICEJAEJUNGDELAYUSERCV := 'S';
        DeviceJaejungDelayUseSetting;
        if DEVICEJAEJUNGDELAYUSERCV = 'S' then DEVICEJAEJUNGDELAYUSERCV := 'U';
      end;  //재중지연시간사용유무
      con_DeviceCmdJAVARAARMCLOSE : begin
        DEVICEJAVARAARMCLOSERCV := 'S';
        DeviceJavaraArmCloseSetting;
        if DEVICEJAVARAARMCLOSERCV = 'S' then DEVICEJAVARAARMCLOSERCV := 'U';
      end;  //자바라경계시자동닫힘유무
      con_DeviceCmdJAVARAAUTOCLOSE : begin
        DEVICEJAVARAAUTOCLOSERCV := 'S';
        DeviceJavaraAutoCloseSetting;
        if DEVICEJAVARAAUTOCLOSERCV = 'S' then DEVICEJAVARAAUTOCLOSERCV := 'U';
      end;  //자바리자동닫힘사용유무
      con_DeviceCmdTimeCodeSend : begin   //TimeCodeSend
        if Not TimeCodeSkill then //스케줄 기능이 없으면 전송하지 말자.
        begin
          DEVICETIMECODERCV := 'Y'
        end else
        begin
          DEVICETIMECODERCV := 'S';
          DeviceTimeCodeDataSetting;
          if DEVICETIMECODERCV = 'S' then DEVICETIMECODERCV := 'U';
        end;
      end;
      con_DeviceCmdTimeCodeUse : begin  //출입문 시간코드 사용유무
        if Not TimeCodeSkill then //스케줄 기능이 없으면 전송하지 말자.
        begin
          DEVICETIMECODEUSERCV := 'Y'
        end else
        begin
          DEVICETIMECODEUSERCV := 'S';
          DeviceDoorTimeCodeUseSetting;
          if DEVICETIMECODEUSERCV = 'S' then DEVICETIMECODEUSERCV := 'U';
        end;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceInformationSend');
  End;
end;

function TDevice.DeviceJaejungDelayUseCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdJaeJungDelayUse] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'sy00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdJaeJungDelayUse,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceJaejungDelayUseCheck');
  End;
end;

function TDevice.DeviceJaejungDelayUseSetting(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Try
    if JAEJUNGDELAYUSE = '' then JAEJUNGDELAYUSE := '0';

    stData := 'sy00' + JAEJUNGDELAYUSE[1] ;
    L_bDeviceResponse[con_DeviceCmdJaeJungDelayUse] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdJaeJungDelayUse,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceJaejungDelayUseSetting');
  End;
end;

function TDevice.DeviceJavaraArmCloseCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdJAVARAARMCLOSE] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'DL0500',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdJAVARAARMCLOSE,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceJavaraArmCloseCheck');
  End;
end;

function TDevice.DeviceJavaraArmCloseSetting(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Try
    if JAVARAARMCLOSE = '' then JAVARAARMCLOSE := '0';

    L_bDeviceResponse[con_DeviceCmdJAVARAARMCLOSE] := False;
    stData := 'DL0500' +
            JAVARAARMCLOSE[1] +    //관제 원격경계시 닫힘(1)
            '0' +              //관제 원격해제시 열림(1)
            '0' +              //서버 원격경계시 닫힘(1)
            '0' ;              //서버 원격해제시 열림(1)

    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer,stData ,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdJAVARAARMCLOSE,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceJavaraArmCloseSetting');
  End;
end;

function TDevice.DeviceJavaraAutoCloseCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdJAVARAAUTOCLOSE] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'DL0700',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdJAVARAAUTOCLOSE,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceJavaraAutoCloseCheck');
  End;
end;

function TDevice.DeviceJavaraAutoCloseSetting(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Try
    if JAVARAAUTOCLOSE = '' then JAVARAAUTOCLOSE := '0';
    L_bDeviceResponse[con_DeviceCmdJAVARAAUTOCLOSE] := False;
    stData:= 'DL07' +                                     //MSG Code
            '00'+    //문번호
            JAVARAAUTOCLOSE[1] +    //자바라자동닫힘 미사용(0),사용(1)
            '1' +              //자바라 장시간 열림/복구 관제전송 미사용(0),사용(1)
            '3' +              //자동 닫힘 재시도 횟수
            '0000' ;           //자바라 닫힘 동작 완료 시간 (초)
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdJAVARAAUTOCLOSE,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceJavaraAutoCloseSetting');
  End;
end;

function TDevice.DeviceKTTCDMADATACheck(aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    if Not SecuritySkill then
    begin
      L_bDeviceResponse[con_DeviceCmdKttCDMADATA] := True;
      TNode(DeviceNode).KTTCDMADATARCV := 'Y' ;
      Exit;
    end;
    L_bDeviceResponse[con_DeviceCmdKttCDMADATA] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'WL02',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdKttCDMADATA,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceKTTCDMADATACheck');
  End;
end;

function TDevice.DeviceKTTCDMAUSECheck(aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    if Not SecuritySkill then
    begin
      L_bDeviceResponse[con_DeviceCmdKttCdmaUse] := True;
      TNode(DeviceNode).KTTCDMAUSERCV := 'Y';
      Exit;
    end;
    L_bDeviceResponse[con_DeviceCmdKttCdmaUse] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'WL00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdKttCdmaUse,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceKTTCDMAUSECheck');
  End;
end;

function TDevice.DeviceKTTRingCountCheck(aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    if Not SecuritySkill then
    begin
      L_bDeviceResponse[con_DeviceCmdKTTREMOTEARMRINGCOUNT] := True;
      TNode(DeviceNode).KTTREMOTERINGCOUNTRCV := 'Y';
      Exit;
    end;
    L_bDeviceResponse[con_DeviceCmdKTTREMOTEARMRINGCOUNT] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'Rc00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdKTTREMOTEARMRINGCOUNT,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceKTTRingCountCheck');
  End;
end;

function TDevice.DeviceKTTSystemIDCheck(aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdKTTSystemID] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'Id00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdKTTSystemID,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceKTTSystemIDCheck');
  End;
end;

function TDevice.DeviceKTTTelNumberCheck(aNo: string; aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    if Not isDigit(aNo) then Exit;
    L_bDeviceResponse[con_DeviceCmdKTTTelNumber1] := False;

    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'Tn00' + FillZeroNumber(strtoint(aNo),2),0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdKTTTelNumber1,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceKTTTelNumberCheck');
  End;
end;

function TDevice.DeviceLampOnTimeCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdLAMPONTIME] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'RYLP1110',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdLAMPONTIME,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceLampOnTimeCheck');
  End;
end;

function TDevice.DeviceNetworkCheck(aDelay:Boolean): Boolean;
begin
  Try
    if EcuID <> '00'  then Exit; //메인이 아닌 상태에서 컨트롤러 네트웍 상태 체크는 무의미함
    L_bDeviceResponse[con_DeviceCmdNetworkState] := False;
    SendPacket('R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'cs00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdNetworkState,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceNetworkCheck');
  End;
end;

procedure TDevice.DeviceReceiveTypeChage(Sender: TObject; aNodeNo: integer;
  aType, aEcuID, aExtendID, aNumber: string; aRcvInfoType: integer;
  aData: string);
begin
  Try
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,aNodeNo,aType,aEcuID,aExtendID,aNumber,aRcvInfoType,aData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceReceiveTypeChage');
  End;
end;

procedure TDevice.DeviceReciveCheck;
var
  i : integer;
  bReciveStateCheck : Boolean;
  nZoneExtendID : integer;
  nIndex : integer;
begin
  if G_bApplicationTerminate then Exit;
  if DEVICEVER = '' then DEVICEVERRCV := 'N';
  if DEVICECODE = '' then DEVICECODERCV := 'N';

  Try
    for i := 0 to HIGH(L_cDeviceRCVSTATE) do
    begin
      if (L_cDeviceRCVSTATE[i] = 'U') or (L_cDeviceRCVSTATE[i] = 'S') then  //변경된 건이 있으면 송신 하자....
      begin
        //L_cDeviceRCVSTATE[i] := 'N'; //변경된 건은 송신 하지 말고 재 수신 하자...(설정은 SKSP에서만 설정 하도록 함)
        DeviceInformationSend(i);
        Exit;
      end;
    end;
    for i := 0 to HIGH(L_cDeviceRCVSTATE) do
    begin
      if L_cDeviceRCVSTATE[i] = 'N' then  //상태를 수신할 건이 있으면 수신 체크 하자....
      begin
        DeviceInformationCheck(i);
        Exit;
      end;
    end;

    for i := 0 to DeviceDoorList.Count - 1 do  //출입문의 상태가 변경 또는 체크 할것이 있는지 확인하자
    begin
      if TDeviceDoor(DeviceDoorList.Objects[i]).ReciveStateChange then
      begin
        TDeviceDoor(DeviceDoorList.Objects[i]).DoorReciveCheck;
        ReciveStateChange := True;
        Exit;
      end;
    end;

    for i := 0 to DeviceReaderList.Count - 1 do  //리더의 상태가 변경 또는 체크 할것이 있는지 확인하자
    begin
      //if Not TDeviceReader(DeviceReaderList.Objects[i]).ReaderConnected then continue; //통신 단선이면 체크 하지 말자.
      if TDeviceReader(DeviceReaderList.Objects[i]).ReciveStateChange then
      begin
        TDeviceReader(DeviceReaderList.Objects[i]).ReaderReciveCheck;
        ReciveStateChange := True;
        Exit;
      end;
    end;

    for i := 0 to DeviceZoneList.Count - 1 do  //존의 상태가 변경 또는 체크 할것이 있는지 확인하자
    begin
      if isDigit(copy(DeviceZoneList.Strings[i],1,3)) then
      begin
        nZoneExtendID := strtoint(copy(DeviceZoneList.Strings[i],1,3));
        if nZoneExtendID <> 0 then continue; //존확장기의 존 정보는 존확장기에서 조회 할것
        //nIndex := DeviceZoneExtentionList.IndexOf(inttostr(nZoneExtendID));
        //if nIndex > -1 then
        //begin
          //if Not TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZoneExtendConnected then continue; //존확장기 통신 에러면 다음껄로 이동
          if TDeviceZone(DeviceZoneList.Objects[i]).ReciveStateChange then
          begin
            TDeviceZone(DeviceZoneList.Objects[i]).ZoneReciveCheck;
            ReciveStateChange := True;
            Exit;
          end;
      end;
    end;

    for i := 1 to DeviceZoneExtentionList.Count - 1 do  //존의 상태가 변경 또는 체크 할것이 있는지 확인하자
    begin
      if Not TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).ZoneExtendConnected then continue; //통신 단선이면 체크 하지 말자.
      if TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).ReciveStateChange then
      begin
        TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).ZoneExtentionReciveCheck;
        ReciveStateChange := True;
        Exit;
      end;
    end;

    //여기서는 수신상태 체크 하는 곳   ==> 수신이 안되면 여기서 멈춤 현상 발생
    bReciveStateCheck := False;
    for i := 0 to HIGH(L_cDeviceRCVSTATE) do
    begin
      if L_cDeviceRCVSTATE[i] <> 'Y' then
      begin
        bReciveStateCheck := True;
        break;
      end;
    end;
    if Not bReciveStateCheck then
    begin
      for i := 0 to DeviceDoorList.Count - 1 do  //출입문의 상태를 체크 할게 남아 있으면 계속 체크
      begin
        if TDeviceDoor(DeviceDoorList.Objects[i]).ReciveStateChange then
        begin
          bReciveStateCheck := True;
          break;
        end;
      end;
    end;
    if Not bReciveStateCheck then
    begin
      for i := 0 to DeviceReaderList.Count - 1 do  //리더의 상태를 체크 할게 남아 있으면 계속 체크
      begin
        //if Not TDeviceReader(DeviceReaderList.Objects[i]).ReaderConnected then continue; //통신 단선이면 체크 하지 말자.
        if TDeviceReader(DeviceReaderList.Objects[i]).ReciveStateChange then
        begin
          bReciveStateCheck := True;
          break;
        end;
      end;
    end;
    if Not bReciveStateCheck then
    begin
      for i := 0 to DeviceZoneList.Count - 1 do  //존의 상태가 변경 또는 체크 할것이 있는지 확인하자
      begin
        if isDigit(copy(DeviceZoneList.Strings[i],1,3)) then
        begin
          nZoneExtendID := strtoint(copy(DeviceZoneList.Strings[i],1,3));
          if nZoneExtendID <> 0 then continue; //존확장기의 존 정보는 존확장기에서 조회 할것
          if TDeviceZone(DeviceZoneList.Objects[i]).ReciveStateChange then
          begin
            bReciveStateCheck := True;
            break;
          end;
        end;
      end;
    end;
    if Not bReciveStateCheck then
    begin
      for i := 1 to DeviceZoneExtentionList.Count - 1 do  //존의 상태가 변경 또는 체크 할것이 있는지 확인하자
      begin
        if Not TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).ZoneExtendConnected then continue; //통신 단선이면 체크 하지 말자.
        if TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).ReciveStateChange then
        begin
          TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).ZoneExtentionReciveCheck;
          ReciveStateChange := True;
          Exit;
        end;
      end;
    end;
    ReciveStateChange := bReciveStateCheck; //전체 송신 했으면 False 로 변경 하자
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceReciveCheck');
    //RcvCheckTimer.Enabled := ReciveStateChange;  //수신상태를 변경 하면서 수행 됨
  End;
end;

function TDevice.DeviceReset: Boolean;
begin
  Try
    SendPacket('R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'RS00Reset',0);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceReset');
  End;
end;

function TDevice.DeviceResponseCheck(aIndex, aDelay: integer): Boolean;
var
  FirstTickCount : double;
begin
  Try
    L_bDeviceResponseChecking := True;
    Try
      FirstTickCount := GetTickCount + aDelay;
      While Not L_bDeviceResponse[aIndex] do
      begin
        if G_bApplicationTerminate then Exit;
        if L_bDestroy then Exit;
        if DeviceNode.NodeDestory then Exit;
        sleep(1);
        Application.ProcessMessages;
        //MyProcessMessage;
        if GetTickCount > FirstTickCount then Break;
      end;
      result := L_bDeviceResponse[aIndex];
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceResponseCheck');
    End;
  Finally
    L_bDeviceResponseChecking := False;
  End;
end;

function TDevice.DeviceSIRENOnTimeCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdSIRENONTIME] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'RYSI1110',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdSIRENONTIME,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceSIRENOnTimeCheck');
  End;
end;

function TDevice.DeviceSystemInformationCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdSystemInformation] := False;
    SendPacket('Q',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'SY00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdSystemInformation,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceSystemInformationCheck');
  End;
end;

function TDevice.DeviceSystemInformationSetting(aDelay: Boolean): Boolean;
var
  stData : string;
  i : integer;
begin
  Try
    if WATCHACPOWER = '' then WATCHACPOWER := '0';
    for i := 0 to DeviceDoorList.Count - 1 do
      if TDeviceDoor(DeviceDoorList.Objects[i]).DOORTYPE = '' then TDeviceDoor(DeviceDoorList.Objects[i]).DOORTYPE := '1';

    stData := 'SY00' +                                   // COMMAND
      WATCHACPOWER[1] +                                  // 정전감시여부
      FillZeroNumber(ARMOUTDELAY, 3) +          // 퇴실지연시간
      '2' +                                             // 예비
      TDeviceDoor(DeviceDoorList.Objects[0]).DOORTYPE[1];  // Door1
    if G_nMonitoringType <> 1 then stData := stData + TDeviceDoor(DeviceDoorList.Objects[1]).DOORTYPE[1]  // Door2
    else stData := stData + '0';
    stData := stData + SetSpaceLength('', 16) +                             // 위치명
      FillZeroNumber(ARMINDELAY, 3) +                      // 입실지연시간
      '0'  ;                                               // 관제 통신 방식(고정)

    if DeviceDoorList.Count > 2 then stData := stData + TDeviceDoor(DeviceDoorList.Objects[2]).DOORTYPE[1]  // Door3
    else stData := stData + '1';
    if DeviceDoorList.Count > 3 then stData := stData + TDeviceDoor(DeviceDoorList.Objects[3]).DOORTYPE[1]  // Door4
    else stData := stData + '1';
    if DeviceDoorList.Count > 4 then stData := stData + TDeviceDoor(DeviceDoorList.Objects[4]).DOORTYPE[1]  // Door5
    else stData := stData + '1';
    if DeviceDoorList.Count > 5 then stData := stData + TDeviceDoor(DeviceDoorList.Objects[5]).DOORTYPE[1]  // Door6
    else stData := stData + '1';
    if DeviceDoorList.Count > 6 then stData := stData + TDeviceDoor(DeviceDoorList.Objects[6]).DOORTYPE[1]  // Door7
    else stData := stData + '1';
    if DeviceDoorList.Count > 6 then stData := stData + TDeviceDoor(DeviceDoorList.Objects[7]).DOORTYPE[1]  // Door8
    else stData := stData + '1';

    L_bDeviceResponse[con_DeviceCmdSystemInformation] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stData,0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdSystemInformation,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log',inttostr(DeviceNode.No) + 'Device.DeviceSystemInformationSetting');
  End;
end;

function TDevice.DeviceTimeCodeDataSetting(aDelay: Boolean): Boolean;
var
  i : integer;
begin
  Try
    result := False;
    for i := Low(L_arrDeviceTimeCode) to High(L_arrDeviceTimeCode) do
    begin
      if Not DeviceTimeCodeGroupSetting(i) then Exit;
    end;
    if DEVICETIMECODERCV = 'S' then DEVICETIMECODERCV := 'Y';
    result := True;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceTimeCodeDataSetting');
  End;
end;

function TDevice.DeviceTimeCodeGroupSetting(aIndex: integer;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Try
    result := True;
    stData := L_arrDeviceTimeCode[aIndex];
    if stData = '' then Exit;

    stData := 'T00  ' +
              stData;

    L_bDeviceTimeCodeResponse[aIndex] := False; //
    SendPacket('c',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, stData,0);
    if aDelay then
      result := DeviceTimeCodeResponseCheck(aIndex,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceTimeCodeGroupSetting');
  End;
end;

function TDevice.DeviceTimeCodeResponseCheck(aIndex, aDelay: integer): Boolean;
var
  FirstTickCount : double;
begin
  Try
    FirstTickCount := GetTickCount + aDelay;
    While Not L_bDeviceTimeCodeResponse[aIndex] do
    begin
      if G_bApplicationTerminate then Exit;
      if L_bDestroy then Exit;
      if DeviceNode.NodeDestory then Exit;
      sleep(1);
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;
    end;
    result := L_bDeviceTimeCodeResponse[aIndex];
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceTimeCodeResponseCheck');
  End;
end;

function TDevice.DeviceVersionCheck(aDelay: Boolean): Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdVER] := False;
    SendPacket('R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'VR00',0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdVER,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DeviceVersionCheck');
  End;
end;

procedure TDevice.DoorHolidaySend(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnDoorHolidaySend) then
  begin
    OnDoorHolidaySend(self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;
end;

procedure TDevice.DoorLongTimeOpenEvent(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
var
  stAlarmData : string;
  stDeviceVer : string;
  stDeviceMsgNo : string;
begin
  if aData = '' then Exit;

  if G_bDoorLongTimeOpenEventUse then
  begin
    stDeviceVer := DeviceNode.GetDeviceVer;
    stDeviceMsgNo := DeviceNode.GetSendMsgNo;
    //stAlarmData := '058 ' + stDeviceVer + '0000000' + aEcuID + 'A' + stDeviceMsgNo + 'n'+ FormatDateTime('yyyymmddhhnnss',now) +'D' + aNumber[1] +'0000n' + G_stLongTimeStateCode + '*************B8';
    stAlarmData := 'n'+ FormatDateTime('yyyymmddhhnnss',now) +'DO' +'0' + aNumber[1] + '00n' + aData + '*******************B8';
    ReceiveDeviceAlarmData(aECUID,stDeviceVer,stDeviceMsgNo[1],'A',stAlarmData);
  end;
end;

procedure TDevice.DoorPacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
  Try
    if Assigned(FOnDoorPacketChange) then
    begin
      OnDoorPacketChange(self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.DoorPacketChange');
  End;
end;



procedure TDevice.EXTENDTYPEChange(aEXTENDID: integer; aValue: string);
var
  nIndex : integer;
begin
  Try
    if aEXTENDID = 0 then Exit;
    if (DeviceType = SKT100) or (DeviceType = SG100) then
      nIndex := DeviceDoorList.IndexOf(inttostr(aEXTENDID + 4)) //SKT 는  출입문 4개 사용
    else nIndex := DeviceDoorList.IndexOf(inttostr(aEXTENDID + 2));
    if nIndex < 0 then Exit;
    if aValue <> '0' then
      TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorUse := True
    else TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorUse := False;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.EXTENDTYPEChange');
  End;
end;

procedure TDevice.FTPCardDownLoadCheckTimerTimer(Sender: TObject);
begin
  if L_bDestroy then Exit;

  //여기서 FTP 카드 데이터 전송 상태를 체크 하자.
  if Not L_bFTPCardReceiv then FTPCardDownLoadFail := True;
  L_bFTPCardReceiv := False;

end;

function TDevice.GetDeviceDoorState(aDoorNo: string; var aCardMode, aDoorMode,
  aDoorState, aLockState, aDoorFire: string): Boolean;
var
  nIndex : integer;
begin
  result := False;
  nIndex := DeviceDoorList.IndexOf(aDoorNo);
  if nIndex < 0 then Exit;
  aCardMode := TDeviceDoor(DeviceDoorList.Objects[nIndex]).CARDMODE;
  aDoorMode := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorMode;
  aDoorState := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorCurrentDSState;
  aLockState := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorCurrentLSState;
  aDoorFire := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorCurrentFireEvent;

  result := True;
end;

function TDevice.GetDeviceDoorStateResend(aDoorNo: string): Boolean;
var
  nIndex : integer;
begin
  result := False;
  nIndex := DeviceDoorList.IndexOf(aDoorNo);
  if nIndex < 0 then Exit;
  TDeviceDoor(DeviceDoorList.Objects[nIndex]).CurrentDoorStateChange := True;
  TDeviceDoor(DeviceDoorList.Objects[nIndex]).CurrentDoorStateChangeAction;

  result := True;

end;

function TDevice.GetDeviceToArmAreaCount: integer;
begin
  Try
    result := DeviceArmAreaList.Count - 1;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToArmAreaCount');
  End;
end;

function TDevice.GetDeviceToArmAreaIDInformation(aCmd: integer;
  aSubNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := DeviceArmAreaList.IndexOf(aSubNo);
    if nIndex < 0 then Exit;
    case aCmd of
      con_ArmAreaCmdView : begin
        result := TDeviceArmArea(DeviceArmAreaList.Objects[nIndex]).ArmAreaView;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToArmAreaIDInformation');
  End;
end;

function TDevice.GetDeviceToArmAreaIndexMode(aIndex, alength: integer): string;
var
  stResult : string;
begin
  Try
    stResult := FillZeroNumber(0,alength);
    Try
      if aIndex > DeviceArmAreaList.Count - 1 then  Exit;
      if alength < 1 then Exit;
      if TDeviceArmArea(DeviceArmAreaList.Objects[aIndex]).ArmAreaCurrentSecurityMode = '' then stResult[1] := '*'
      else stResult[1] := TDeviceArmArea(DeviceArmAreaList.Objects[aIndex]).ArmAreaCurrentSecurityMode[1];
    Finally
      result := stResult;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToArmAreaIndexMode');
  End;
end;

function TDevice.GetDeviceToArmAreaName(aIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > DeviceArmAreaList.Count - 1 then  Exit;
    result := TDeviceArmArea(DeviceArmAreaList.Objects[aIndex]).ArmAreaName;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToArmAreaName');
  End;
end;

function TDevice.GetDeviceToCardReaderCount: integer;
begin
  Try
    result := DeviceReaderList.Count;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToCardReaderCount');
  End;
end;

function TDevice.GetDeviceToCardReaderIDBuildingPosition(
  aReaderNo: string): string;
var
  nIndex : integer;
begin
  Try
    if isDigit(aReaderNo) then aReaderNo := inttostr(strtoint(aReaderNo))
    else aReaderNo := '0';
    nIndex := DeviceReaderList.IndexOf(aReaderNo);
    if nIndex < -1 then Exit;
    result := TDeviceReader(DeviceReaderList.Objects[nIndex]).BuildingPositionCode;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToCardReaderIDBuildingPosition');
  End;
end;

function TDevice.GetDeviceToCardReaderIDDoorPosition(aReaderNo: string): string;
var
  nIndex : integer;
begin
  Try
    if isDigit(aReaderNo) then aReaderNo := inttostr(strtoint(aReaderNo))
    else aReaderNo := '0';
    nIndex := DeviceReaderList.IndexOf(aReaderNo);
    if nIndex < -1 then Exit;
    result := TDeviceReader(DeviceReaderList.Objects[nIndex]).DoorPositionCode;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToCardReaderIDDoorPosition');
  End;
end;

function TDevice.GetDeviceToCardReaderIDType(aReaderNo: string): string;
var
  nIndex : integer;
begin
  Try
    if isDigit(aReaderNo) then aReaderNo := inttostr(strtoint(aReaderNo))
    else aReaderNo := '0';
    nIndex := DeviceReaderList.IndexOf(aReaderNo);
    if nIndex < -1 then Exit;
    result := inttostr(TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderType);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToCardReaderIDType');
  End;
end;

function TDevice.GetDeviceToCardReaderIndexArmAreaNo(aIndex: integer): integer;
begin
  Try
    result := 0;
    if aIndex > DeviceReaderList.Count - 1 then  Exit;
    result := TDeviceReader(DeviceReaderList.Objects[aIndex]).ArmAreaNo;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToCardReaderIndexArmAreaNo');
  End;
end;

function TDevice.GetDeviceToCardReaderIndexDoorNo(aIndex: integer): integer;
begin
  Try
    result := 0;
    if aIndex > DeviceReaderList.Count - 1 then  Exit;
    if isDigit(TDeviceReader(DeviceReaderList.Objects[aIndex]).DoorNo) then
      result := strtoint(TDeviceReader(DeviceReaderList.Objects[aIndex]).DoorNo);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToCardReaderIndexDoorNo');
  End;
end;

function TDevice.GetDeviceToCardReaderIndexState(aIndex,
  alength: integer): string;
var
  stResult : string;
begin
  Try
    stResult := FillZeroNumber(0,alength);
    Try
      if aIndex > DeviceReaderList.Count - 1 then  Exit;
      if alength < 1 then Exit;
      if TDeviceReader(DeviceReaderList.Objects[aIndex]).ReaderConnected then stResult[1] := '1';
      if alength < 2 then Exit;
    Finally
      result := stResult;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToCardReaderIndexState');
  End;
end;

function TDevice.GetDeviceToCardReaderIndexUse(aIndex: integer): Boolean;
begin
  Try
    result := False;
    if aIndex > DeviceReaderList.Count - 1 then  Exit;
    result := TDeviceReader(DeviceReaderList.Objects[aIndex]).ReaderUse;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToCardReaderIndexUse');
  End;
end;

function TDevice.GetDeviceToDoorCount: integer;
begin
  Try
    result := DeviceDoorList.Count;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToDoorCount');
  End;
end;

function TDevice.GetDeviceToDoorIDInformation(aCmd: integer;
  aDoorNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := DeviceDoorList.IndexOf(aDoorNo);
    if nIndex < 0 then Exit;
    case aCmd of
      con_DoorCmdAntiNo : begin
        result := inttostr(TDeviceDoor(DeviceDoorList.Objects[nIndex]).AntiPassNo);
      end;
      con_DoorCmdARMDSCHECK : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).ARMDSCHECK;
      end;
      con_DoorCmdCONTROLTIME : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).CONTROLTIME;
      end;
      con_DoorCmdDeadBoltDSCHECKTIME : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DeadBoltDSCHECKTIME;
      end;
      con_DoorCmdDSOPENSTATE : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DSOPENSTATE;
      end;
      con_DoorCmdFIREDOOROPEN : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).FIREDOOROPEN;
      end;
      con_DoorCmdLOCKTYPE : begin
        result := inttostr(TDeviceDoor(DeviceDoorList.Objects[nIndex]).LOCKTYPE);
      end;
      con_DoorCmdLONGOPENALARM : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).LONGOPENALARM;
      end;
      con_DoorCmdLONGOPENTIME : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).LONGOPENTIME;
      end;
      con_DoorCmdSCHEDULEUSE : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).SCHEDULEUSE;
      end;
      con_DoorCmdTimeCodeUse : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).TimeCodeUse;
      end;
      con_DoorCmdType : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORTYPE;
      end;
      con_DoorCmdView : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORVIEW;
      end;
      con_DoorCurrentDSState : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorCurrentDSState;
      end;
      con_DoorCurrentCARDMode : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).CARDMODE;
      end;
      con_DoorCurrentFireEvent : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorCurrentFireEvent;
      end;
      con_DoorCurrentManagerMode : begin
        result := TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORMODE;
      end;
      con_DoorCurrentRcvState : begin
        if TDeviceDoor(DeviceDoorList.Objects[nIndex]).CurrentDoorStateCheckRCV then result := 'TRUE'
        else result := 'FALSE';
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToDoorIDInformation');
  End;
end;

function TDevice.GetDeviceToDoorIndexInformation(aCmd,
  aSubIndex: integer): string;
begin
  Try
    if aSubIndex > DeviceDoorList.Count - 1 then Exit;
    case aCmd of
      con_DoorCmdArmAreaNo : begin
        result := inttostr(TDeviceDoor(DeviceDoorList.Objects[aSubIndex]).ARMAREANO);
      end;
      con_DoorCmdArmAreaUse : begin
        if TDeviceDoor(DeviceDoorList.Objects[aSubIndex]).DOORTYPE = '1' then result := '0' //출입전용 인경우
        else result := '1';
      end;
      con_DoorCmdName : begin
        result := TDeviceDoor(DeviceDoorList.Objects[aSubIndex]).DOORNAME;
      end;
      con_DoorCmdUse : begin
        if TDeviceDoor(DeviceDoorList.Objects[aSubIndex]).DoorUse then result := '1'
        else result := '0';
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToDoorIndexInformation');
  End;
end;

function TDevice.GetDeviceToDoorIndexState(aIndex, alength: integer): string;
var
  stResult : string;
begin
  Try
    stResult := FillZeroNumber(0,alength);
    Try
      if aIndex > DeviceDoorList.Count - 1 then  Exit;
      if alength < 1 then Exit;
      if TDeviceDoor(DeviceDoorList.Objects[aIndex]).CARDMODE = '' then stResult[1] := '*'
      else stResult[1] := TDeviceDoor(DeviceDoorList.Objects[aIndex]).CARDMODE[1];
      if alength < 2 then Exit;
      if TDeviceDoor(DeviceDoorList.Objects[aIndex]).DOORMODE = '' then stResult[2] := '*'
      else stResult[2] := TDeviceDoor(DeviceDoorList.Objects[aIndex]).DOORMODE[1];
      if alength < 3 then Exit;
      if TDeviceDoor(DeviceDoorList.Objects[aIndex]).DoorCurrentDSState = '' then stResult[3] := '*'
      else stResult[3] := TDeviceDoor(DeviceDoorList.Objects[aIndex]).DoorCurrentDSState[1];
      if alength < 4 then Exit;
      if TDeviceDoor(DeviceDoorList.Objects[aIndex]).DoorCurrentLSState = '' then stResult[4] := '*'
      else stResult[4] := TDeviceDoor(DeviceDoorList.Objects[aIndex]).DoorCurrentLSState[1];
      if alength < 5 then Exit;
      if TDeviceDoor(DeviceDoorList.Objects[aIndex]).DoorCurrentFireEvent = '' then stResult[5] := '*'
      else stResult[5] := TDeviceDoor(DeviceDoorList.Objects[aIndex]).DoorCurrentFireEvent[1];
    Finally
      result := stResult;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToDoorIndexState');
  End;
end;


function TDevice.GetDeviceToExtentionCount: integer;
begin
  Try
    result := DeviceZoneExtentionList.Count;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToExtentionCount');
  End;
end;

function TDevice.GetDeviceToExtentionIDInformation(aCmd: integer;
  aExtendNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '0';
    nIndex := DeviceZoneExtentionList.IndexOf(aExtendNo);
    if nIndex < 0 then Exit;
    case aCmd of
      con_ExtentionCmdType : begin
        result := TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZONEEXTENDTYPE;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToExtentionIDInformation');
  End;
end;

function TDevice.GetDeviceToExtentionIndexUse(aIndex: integer): string;
begin
  Try
    result := '0';
    if aIndex > DeviceZoneExtentionList.Count - 1 then Exit;
    result := TDeviceZoneExtention(DeviceZoneExtentionList.Objects[aIndex]).ZONEEXTENDTYPE;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToExtentionIndexUse');
  End;
end;

function TDevice.GetDeviceToExtentionIndexZoneArmArea(aIndex,
  aZoneNo: integer): integer;
var
  nIndex : integer;
begin
  Try
    result := 0;
    nIndex := DeviceZoneList.IndexOf(FillZeroNumber(aIndex,3) + FillZeroNumber(aZoneNo,2));
    if nIndex < 0 then Exit;
    if isDigit(TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO) then
      result := strtoint(TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToExtentionIndexZoneArmArea');
  End;
end;

function TDevice.GetDeviceToExtentionIndexZoneCount(aIndex: integer): integer;
begin
  Try
    result := G_nDefaultZoneCount;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToExtentionIndexZoneCount');
  End;
end;

function TDevice.GetDeviceToExtentionIndexZoneName(aIndex,
  aZoneNo: integer): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := DeviceZoneList.IndexOf(FillZeroNumber(aIndex,3) + FillZeroNumber(aZoneNo,2));
    if nIndex < 0 then Exit;
    result := TDeviceZone(DeviceZoneList.Objects[nIndex]).ZoneName;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToExtentionIndexZoneName');
  End;
end;

function TDevice.GetDeviceToZoneIDArmArea(aExtendID, aZoneNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    if Not isDigit(aExtendID) then Exit;
    if Not isDigit(aZoneNo) then Exit;

    nIndex := DeviceZoneList.IndexOf(FillZeroNumber(strtoint(aExtendID),3) + FillZeroNumber(strtoint(aZoneNo),2));
    if nIndex < 0 then Exit;
    result := TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToZoneIDArmArea');
  End;
end;

function TDevice.GetDeviceToZoneIDDelayUse(aExtendID, aZoneNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    if Not isDigit(aExtendID) then Exit;
    if Not isDigit(aZoneNo) then Exit;

    nIndex := DeviceZoneList.IndexOf(FillZeroNumber(strtoint(aExtendID),3) + FillZeroNumber(strtoint(aZoneNo),2));
    if nIndex < 0 then Exit;
    result := TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONEDELAY;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToZoneIDDelayUse');
  End;
end;

function TDevice.GetDeviceToZoneIDRecovery(aExtendID, aZoneNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    if Not isDigit(aExtendID) then Exit;
    if Not isDigit(aZoneNo) then Exit;
    nIndex := DeviceZoneList.IndexOf(FillZeroNumber(strtoint(aExtendID),3) + FillZeroNumber(strtoint(aZoneNo),2));
    if nIndex < 0 then Exit;
    result := TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONERECOVERY;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToZoneIDRecovery');
  End;
end;

function TDevice.GetDeviceToZoneIDType(aExtendID, aZoneNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    if Not isDigit(aExtendID) then Exit;
    if Not isDigit(aZoneNo) then Exit;
    nIndex := DeviceZoneList.IndexOf(FillZeroNumber(strtoint(aExtendID),3) + FillZeroNumber(strtoint(aZoneNo),2));
    if nIndex < 0 then Exit;
    result := TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONETYPE;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetDeviceToZoneIDType');
  End;
end;

function TDevice.GetExtendToZoneInformation(aEXTENDID: integer): string;
var
  i : integer;
  nIndex : integer;
  stSendData : string;
  arrBitFunction : array [0..7] of char;
  stBitfunction : string;
begin
  Try
    stSendData := '';
    stBitfunction := '';
    for i := 1 to 8 do
    begin
      FillChar(arrBitFunction, 8, '0');
      nIndex := DeviceZoneList.IndexOf(FillZeroNumber(aEXTENDID,3) + FillZeroNumber(i,2)) ;
      if nIndex > -1 then
      begin
        if Length(TDeviceZone(DeviceZoneList.Objects[nIndex]).EVENTSTATECODE) <> 2 then TDeviceZone(DeviceZoneList.Objects[nIndex]).EVENTSTATECODE := 'SS';
        if TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONETYPE = '' then TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONETYPE := '0';
        if Not isDigit(TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO) then TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO := '0';
        if ARMAREAUSE = '0' then TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO := '0'
        else if ARMAREAUSE = '1' then
        begin
          if TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO = '0' then TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO := '1';
        end;
        if Not isDigit(TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO) then Exit;
        stSendData := stSendData + TDeviceZone(DeviceZoneList.Objects[nIndex]).EVENTSTATECODE + TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONETYPE[1] + FillZeroNumber(strtoint(TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO),2);
        if TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONERECOVERY = '1' then arrBitFunction[5] := '1';
      end else stSendData := stSendData + 'SS' + '0' + '00';
      stBitfunction := stBitfunction + BinaryToHex(string(arrBitFunction));
    end;
    result := stSendData + stBitfunction;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.GetExtendToZoneInformation');
  End;
end;

function TDevice.HolidayClear: Boolean;
var
  i : integer;
begin
  Try
    result := False;
    if DeviceDoorList.Count < 1 then Exit;
    for i := 0 to DeviceDoorList.Count - 1 do
    begin
      TDeviceDoor(DeviceDoorList.Objects[i]).HolidayClear;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.HolidayClear');
  End;
end;

function TDevice.LoadCardPermit(aCardNo: string): integer;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := -1;
  Try
    stSql := ' select ';
    stSql := stSql + ' a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CA_CARDNO,a.CP_PERMIT,f.EM_STATE,a.CP_DOOR1,a.CP_DOOR2,a.CP_DOOR3,';
    stSql := stSql + ' a.CP_DOOR4,a.CP_DOOR5,a.CP_DOOR6,a.CP_DOOR7,a.CP_DOOR8,a.CP_ARMAREA0,a.CP_ARMAREA1,a.CP_ARMAREA2,';
    stSql := stSql + ' a.CP_ARMAREA3,a.CP_ARMAREA4,a.CP_ARMAREA5,a.CP_ARMAREA6,a.CP_ARMAREA7,a.CP_ARMAREA8,a.CP_RCVACK,';
    stSql := stSql + ' b.CA_POSITIONNUM,b.CA_STATECODE,c.EM_SEQ,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ACUSE,c.EM_ATUSE,c.EM_FDUSE,';
    stSql := stSql + ' e.EM_TIMECODEUSE,e.TC_GROUP,e.TC_TIME1,e.TC_TIME2,e.TC_TIME3,e.TC_TIME4,e.TC_WEEKCODE,c.EM_REGDATE,c.EM_ENDDATE ';
    stSql := stSql + ' from TB_CARDPERMIT a  ';
    stSql := stSql + ' Left Join TB_CARD b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND b.EM_SEQ = c.EM_SEQ) ';
    stSql := stSql + ' Inner Join TB_DEVICE d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
    stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEEDEVICETIMECODE e ';
    stSql := stSql + ' ON(b.EM_SEQ = e.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = e.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = e.DE_ECUID ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEESTATECODE f ';
    stSql := stSql + ' ON(c.EM_STATECODE = f.EM_STATECODE ) ';
    stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + '''';
    stSql := stSql + ' AND a.ND_NODENO = ' + inttostr(TNode(DeviceNode).NO) + '';
    stSql := stSql + ' AND a.DE_ECUID = ''' + EcuID + '''';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + '''';

    if NodeList = nil then Exit;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
          //에러처리
          Exit;
        End;
        result := 0;
        if RecordCount < 1 then Exit;
        result := 1;
        First;
        SetNodeToCardPermitInitialize(FindField('CA_CARDNO').AsString,FindField('CP_PERMIT').AsString,FindField('CA_STATECODE').AsString,
        FindField('CP_DOOR1').AsString,FindField('CP_DOOR2').AsString,FindField('CP_DOOR3').AsString,
        FindField('CP_DOOR4').AsString,FindField('CP_DOOR5').AsString,FindField('CP_DOOR6').AsString,
        FindField('CP_DOOR7').AsString,FindField('CP_DOOR8').AsString,FindField('CP_ARMAREA0').AsString,
        FindField('CP_ARMAREA1').AsString,FindField('CP_ARMAREA2').AsString,FindField('CP_ARMAREA3').AsString,
        FindField('CP_ARMAREA4').AsString,FindField('CP_ARMAREA5').AsString,FindField('CP_ARMAREA6').AsString,
        FindField('CP_ARMAREA7').AsString,FindField('CP_ARMAREA8').AsString,FindField('CP_RCVACK').AsString,
        FindField('CA_POSITIONNUM').AsString,FindField('EM_TIMECODEUSE').AsString,FindField('TC_GROUP').AsString,
        FindField('TC_TIME1').AsString,FindField('TC_TIME2').AsString,FindField('TC_TIME3').AsString,
        FindField('TC_TIME4').AsString,FindField('TC_WEEKCODE').AsString,FindField('EM_REGDATE').AsString,FindField('EM_ENDDATE').AsString,
        FindField('EM_STATE').AsString);
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
  End;
end;

procedure TDevice.RcvDeviceArmAreaUse(aEcuId, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdArmAreaUse] := True;
    if (DEVICEARMAREAUSERCV = 'R') OR (DEVICEARMAREAUSERCV = 'S') then DEVICEARMAREAUSERCV := 'Y'; //수신상태가 송신 중이거나 수신 중일때 수신 완료 처리
    Delete(aRealData,1,4);
    ARMAREAUSE := aRealData[1];
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceArmAreaUse');
  End;
end;

procedure TDevice.RcvDeviceArmEXTENTIONMainFromLocal(aECUID, aDeviceVer,
  aRealData: string);
var
  i : integer;
  bUsed : Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdARMEXTENTIONMAINFROMLOCAL] := True;
    if (TNode(DeviceNode).ARMEXTENTIONMAINFROMLOCALRCV = 'R') OR (TNode(DeviceNode).ARMEXTENTIONMAINFROMLOCALRCV = 'S') then TNode(DeviceNode).ARMEXTENTIONMAINFROMLOCALRCV := 'Y'; //수신상태가 송신 중이거나 수신 중일때 수신 완료 처리
    Delete(aRealData,1,4);
    TNode(DeviceNode).ARMEXTENTIONMAINFROMLOCAL := aRealData;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceArmEXTENTIONMainFromLocal');
  End;
end;

procedure TDevice.RcvDeviceArmEXTENTIONMainToLocal(aECUID, aDeviceVer,
  aRealData: string);
var
  i : integer;
  bUsed : Boolean;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdARMEXTENTIONMAINFROMLOCAL] := True;
    if (TNode(DeviceNode).ARMEXTENTIONMAINTOLOCALRCV = 'R') OR (TNode(DeviceNode).ARMEXTENTIONMAINTOLOCALRCV = 'S') then TNode(DeviceNode).ARMEXTENTIONMAINTOLOCALRCV := 'Y'; //수신상태가 송신 중이거나 수신 중일때 수신 완료 처리
    Delete(aRealData,1,4);
    TNode(DeviceNode).ARMEXTENTIONMAINTOLOCAL := aRealData;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceArmEXTENTIONMainToLocal');
  End;
end;

procedure TDevice.RcvDeviceArmRelay(aEcuId, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdArmRelay] := True;
    if (DEVICEARMRELAYRCV = 'R') OR (DEVICEARMRELAYRCV = 'S') then DEVICEARMRELAYRCV := 'Y'; //수신상태가 송신 중이거나 수신 중일때 수신 완료 처리
    Delete(aRealData,1,4);
    if UpperCase(aRealData[1]) = 'A' then ARMRELAY := '0'
    else if UpperCase(aRealData[1]) = 'D' then ARMRELAY := '1';
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceArmRelay');
  End;
end;

procedure TDevice.RcvDeviceCardReaderNetworkStateCheck(aEcuId, aDeviceVer,
  aMsgNo, aRealData: string);
var
  i : integer;
  nIndex : integer;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdCardReaderNetwork] := True;
    if (DEVICECARDREADERNETWORKRcv = 'R') OR (DEVICECARDREADERNETWORKRcv = 'S') then DEVICECARDREADERNETWORKRcv := 'Y';
    Delete(aRealData,1,4);
    Delete(aRealData,1,1);
    for i := 1 to Length(aRealData) do
    begin
      nIndex := DeviceReaderList.IndexOf(inttostr(i));
      if nIndex < 0 then continue;
      if aRealData[i] = '1' then
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderUse := True;
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderConnected := True;
      end else if aRealData[i] = '0' then
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderUse := True;
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderConnected := False;
      end else if UpperCase(aRealData[i]) = 'U' then
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderUse := False;
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderConnected := False;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceCardReaderNetworkStateCheck');
  End;

end;

procedure TDevice.RcvDeviceCardReaderType(aECUID, aDeviceVer,
  aRealData: string);
var
  i : integer;
  nIndex : integer;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdCardReaderType] := True;
    if (DEVICECARDREADERTYPERCV = 'R') OR (DEVICECARDREADERTYPERCV = 'S') then DEVICECARDREADERTYPERCV := 'Y'; //수신상태가 송신 중이거나 수신 중일때 수신 완료 처리
    Delete(aRealData,1,4);
    CARDREADERTYPE := aRealData[1];
    if Length(aRealData) < 10 then Exit;
    Delete(aRealData,1,2);
    for i := 1 to 8 do
    begin
      if isDigit(aRealData[i]) then
      begin
        nIndex := DeviceReaderList.IndexOf(inttostr(i));
        if nIndex > -1 then
          TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderType := strtoint(aRealData[i]);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceCardReaderType');
  End;
end;

procedure TDevice.RcvDeviceCardReaderVersion(aEcuId, aDeviceVer, aMsgNo,
  aRealData: string);
var
  i : integer;
  nIndex : integer;
  stReaderNo : string;
begin
  Try
    stReaderNo := Copy(aRealData, 3, 2);
    if Not isDigit(stReaderNo) then Exit;

    if isDigit(stReaderNo) then stReaderNo := inttostr(strtoint(stReaderNo))
    else stReaderNo := '0';
    nIndex := DeviceReaderList.IndexOf(stReaderNo);
    if nIndex > -1 then
    begin
      TDeviceReader(DeviceReaderList.Objects[nIndex]).ReceiveReaderVersion(aECUID,aDeviceVer,aMsgNo,aRealData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceCardReaderVersion');
  End;
end;

procedure TDevice.RcvDeviceCode(aECUID, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdDeviceCode] := True;
    if (DEVICECODERCV = 'R') OR (DEVICECODERCV = 'S') then DEVICECODERCV := 'Y'; //수신상태가 송신 중이거나 수신 중일때 수신 완료 처리
    DEVICECODE := copy(aRealData,5,Length(aRealData)-4); //앞에 4자리는 command 부분임
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceCode');
  End;
end;

procedure TDevice.RcvDeviceDoor2RelayType(aECUID, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdDeviceDoor2RelayType] := True;
    if (DEVICEDOOR2RELAYRCV = 'R') or (DEVICEDOOR2RELAYRCV = 'S') then DEVICEDOOR2RELAYRCV := 'Y';
    Delete(aRealData,1,4); //command 부분 삭제 처리
    if Length(aRealData) > 3 then
      DOOR2RELAY := aRealData[3];
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceDoor2RelayType');
  End;
end;

procedure TDevice.RcvDeviceDoorArmArea(aEcuID, aDeviceVer, aRealData: string);
var
  nIndex : integer;
  i : integer;
  stDoorArmArea : string;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdDeviceDoorArmArea] := True;
    if (DEVICEDOORARMAREARCV = 'R') or (DEVICEDOORARMAREARCV = 'S') then DEVICEDOORARMAREARCV := 'Y';
    Delete(aRealData,1,4); //command 부분 삭제 처리
    Delete(aRealData,1,2); //** 부분 삭제
    aRealData := Trim(aRealData);
    if aRealData = '' then Exit;
    for i:= 1 to MaxDoorCount do
    begin
      stDoorArmArea := FindCharCopy(aRealData,i - 1,' ');
      if Not isDigit(stDoorArmArea) then stDoorArmArea := '00';
      nIndex := DeviceDoorList.IndexOf(inttostr(i));
      if nIndex > -1 then
      begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).ARMAREANO := strtoint(stDoorArmArea)
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceDoorArmArea');
  End;
end;

procedure TDevice.RcvDeviceDoorTimeCodeUse(aECUID, aDeviceVer,
  aRealData: string);
var
  nIndex : integer;
  i : integer;
  stDoorTimeCodeUse : string;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdTimeCodeUse] := True;
    if (DEVICETIMECODEUSERCV = 'R') or (DEVICETIMECODEUSERCV = 'S') then DEVICETIMECODEUSERCV := 'Y';
    Delete(aRealData,1,4); //command 부분 삭제 처리
    Delete(aRealData,1,1); //* 부분 삭제
    aRealData := Trim(aRealData); //출입문 시간타임
    if aRealData = '' then Exit;
    for i:= 1 to length(aRealData) do
    begin
      stDoorTimeCodeUse := aRealData[i];
      if Not isDigit(stDoorTimeCodeUse) then stDoorTimeCodeUse := '0';
      nIndex := DeviceDoorList.IndexOf(inttostr(i));
      if nIndex > -1 then
      begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).TimeCodeUse := stDoorTimeCodeUse;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceDoorTimeCodeUse');
  End;
end;

procedure TDevice.RcvDeviceDVRDATA(aEcuId, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdDVRIP] := True;
    if (TNode(DeviceNode).DVRDATARCV = 'R') or (TNode(DeviceNode).DVRDATARCV = 'S') then
      TNode(DeviceNode).DVRDATARCV := 'Y';
    Delete(aRealData,1,4);
    TNode(DeviceNode).DVRIP := FindCharCopy(aRealData, 0, ' ');
    TNode(DeviceNode).DVRPORT := FindCharCopy(aRealData, 1, ' ');
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceDVRDATA');
  End;
end;

procedure TDevice.RcvDeviceDVRUse(aEcuId, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeivceCmdDVRUSE] := True;
    if (TNode(DeviceNode).DVRUSERCV = 'R') or (TNode(DeviceNode).DVRUSERCV = 'S') then
        TNode(DeviceNode).DVRUSERCV := 'Y';
    Delete(aRealData,1,4);
    TNode(DeviceNode).DVRUSE := aRealData[1];
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceDVRUse');
  End;
end;

procedure TDevice.RcvDeviceEcuType(aECUID, aDeviceVer, aRealData: string);
begin

end;

procedure TDevice.RcvDeviceEcuUsedData(aECUID, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdUseState] := True;
    if (TNode(DeviceNode).ECUUSERCV = 'R') or (TNode(DeviceNode).ECUUSERCV = 'S') then
        TNode(DeviceNode).ECUUSERCV := 'Y';
    Delete(aRealData,1,4); //command 부분 삭제 처리
    if Assigned(FOnDeviceReceiveDataEvent) then
    begin
      OnDeviceReceiveDataEvent(Self,TNode(DeviceNode).No,'DEVICE',aEcuID,'0','0',con_DeviceCmdUseState,aRealData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceEcuUsedData');
  End;
end;

procedure TDevice.RcvDeviceEMZONELampSiren(aECUID, aDeviceVer,
  aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdEMZONELAMP] := True;
    if (DEVICEEMZONELAMPRCV = 'R') or (DEVICEEMZONELAMPRCV = 'S') then DEVICEEMZONELAMPRCV := 'Y';
    Delete(aRealData,1,4);
    EMZONELAMP := aRealData[1];
    EMZONESIREN := aRealData[2];
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceEMZONELampSiren');
  End;
end;

procedure TDevice.RcvDeviceExtentionUsedData(aECUID, aDeviceVer,
  aRealData: string);
var
  i,j : integer;
  nIndex : integer;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdExtentionUse] := True;
    if (DEVICEDEVICEEXTENTIONUSERCV = 'R') or (DEVICEDEVICEEXTENTIONUSERCV = 'S') then DEVICEDEVICEEXTENTIONUSERCV := 'Y';
    Delete(aRealData,1,4);
    Delete(aRealData,1,1); //메인은 항상 사용으로 존재함
    for i := 1 to Length(aRealData) do
    begin
      nIndex := DeviceZoneExtentionList.IndexOf(inttostr(i));
      if nIndex > -1 then
      begin
        TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZONEEXTENDTYPE := aRealData[i];
      end;
      if aRealData[i] <> '1' then //LOCK + ZONE 타입이 아니면
      begin
        for j := 1 to G_nDefaultZoneCount do
        begin
          nIndex := DeviceZoneList.IndexOf(FillZeroNumber(i,3) + FillZeroNumber(j,2));
          if nIndex > -1 then
          begin
            TDeviceZone(DeviceZoneList.Objects[nIndex]).ReciveStateChange := False;
          end;
        end;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceExtentionUsedData');
  End;

end;

procedure TDevice.RcvDeviceExtentionZoneData(aECUID, aDeviceVer,
  aRealData: string);
var
  stExtentionID : string;
  nIndex : integer;
  i : integer;
  stTemp : string;
  stHexData : string;
  stBinaryData : string;
begin
  Try
    stExtentionID := copy(aRealData,5,2);
    if Not isDigit(stExtentionID) then Exit;
    stExtentionID := inttostr(strtoint(stExtentionID));
    nIndex := DeviceZoneExtentionList.IndexOf(stExtentionID);
    if nIndex < 0 then Exit;
    TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).RcvDeviceExtentionZoneData(aECUID,aDeviceVer,aRealData);

    Delete(aRealData,1,4); //EL01 삭제
    Delete(aRealData,1,2); //stExtentionID 삭제
    TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZONEEXTENDTYPE := aRealData[1];
    Delete(aRealData,1,1); //ExtendType 삭제
    for i := 1 to 8 do
    begin
      nIndex := DeviceZoneList.IndexOf(FillZeroNumber(strtoint(stExtentionID),3) + FillZeroNumber(i,2)) ;
      if nIndex > -1 then
      begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).EVENTSTATECODE := copy(aRealData,(i-1) * 5 + 1,2);
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONETYPE := aRealData[(i-1) * 5 + 3];
        stTemp := copy(aRealData,(i-1) * 5 + 4,2);
        if isDigit(stTemp) then stTemp := inttostr(strtoint(stTemp))
        else stTemp:= '0';
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO := stTemp;
      end;
    end;
    Delete(aRealData,1,8 * 5);
    for i := 1 to 8 do  //복구신호 추출
    begin
      stHexData := copy(aRealData,(i-1) * 2 + 1,2);
      stBinaryData := '';
      stBinaryData := Hex2Binary(stHexData);
      nIndex := DeviceZoneList.IndexOf(FillZeroNumber(strtoint(stExtentionID),3) + FillZeroNumber(i,2)) ;
      if nIndex > -1 then
      begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONERECOVERY := stBinaryData[6];
        //stBinaryData[1] --> 존 사용유무 사용안함
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceExtentionZoneData');
  End;
end;

procedure TDevice.RcvDeviceFireRecovery(aECUID, aDeviceVer, aRealData: string);
var
  stFireState : string;
begin
  Try
    stFireState := copy(aRealData,5,1); //SM25N
    if stFireState = 'N' then  FireEvent := False;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceFireRecovery');
  End;
end;

procedure TDevice.RcvDeviceFTPDownLoadState(aECUID, aDeviceVer,
  aRealData: string);
var
  nPos : integer;
begin
  Try
    nPos := Pos('ftp success',aRealData);
    if nPos > 0 then
    begin
      if L_bFTPCardDownLoading then
      begin
        //카드데이터 다운로드 중이었으면
        if Assigned(FOnReceiveTypeChage) then
        begin
          OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdFTPCardDownLoadPer,'100');
        end;
        FTPCardDownLoadEnd := True;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceFTPDownLoadState');
  End;
end;

procedure TDevice.RcvDeviceID(aECUID, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdDeviceID] := True;
    Delete(aRealData,1,4);
    DeviceNode.DeviceID := copy(aRealData,1,G_nIDLength);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceID');
  End;
end;

procedure TDevice.RcvDeviceJaejungDelayUse(aECUID, aDeviceVer,
  aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdJaeJungDelayUse] := True;
    if (DEVICEJAEJUNGDELAYUSERCV = 'R') or (DEVICEJAEJUNGDELAYUSERCV = 'S') then DEVICEJAEJUNGDELAYUSERCV := 'Y';
    Delete(aRealData,1,4);
    JAEJUNGDELAYUSE := aRealData[1];
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceJaejungDelayUse');
  End;
end;

procedure TDevice.RcvDeviceJavaraArmClose(aECUID, aDeviceVer,
  aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdJAVARAARMCLOSE] := True;
    if (DEVICEJAVARAARMCLOSERCV = 'R') or (DEVICEJAVARAARMCLOSERCV = 'S') then DEVICEJAVARAARMCLOSERCV := 'Y';
    Delete(aRealData,1,4);
    Delete(aRealData,1,2); //출입문 번호 - 컨트롤러에서 동작 하므로 출입문 번호는 상관 없음
    JAVARAARMCLOSE := aRealData[1];
    JAVARADISARMOPEN := aRealData[2];
    JAVARASERVERARMCLOSE := aRealData[3];
    JAVARASERVERDISARMOPEN := aRealData[4];
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceJavaraArmClose');
  End;
end;

procedure TDevice.RcvDeviceJavaraAutoClose(aECUID, aDeviceVer,
  aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdJAVARAAUTOCLOSE] := True;
    if (DEVICEJAVARAAUTOCLOSERCV = 'R') or (DEVICEJAVARAAUTOCLOSERCV = 'S') then DEVICEJAVARAAUTOCLOSERCV := 'Y';
    Delete(aRealData,1,4);
    Delete(aRealData,1,2); //출입문 번호 - 컨트롤러에서 동작 하므로 출입문 번호는 상관 없음
    JAVARAAUTOCLOSE := aRealData[1];
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceJavaraAutoClose');
  End;
end;

procedure TDevice.RcvDeviceKTTCDMAData(aEcuId, aDeviceVer, aRealData: string);
var
  stTemp : string;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdKttCDMADATA] := True;
    if (TNode(DeviceNode).KTTCDMADATARCV = 'R') or (TNode(DeviceNode).KTTCDMADATARCV = 'S') then
        TNode(DeviceNode).KTTCDMADATARCV := 'Y';
    if aEcuID <> '00' then Exit;
    Delete(aRealData,1,4);
    stTemp  := FindCharCopy(aRealData, 0, '}');
    TNode(DeviceNode).KTTCDMAMIN := stTemp;
    stTemp  := FindCharCopy(aRealData, 1, '}');
    TNode(DeviceNode).KTTCDMAMUX := stTemp;
    stTemp  := FindCharCopy(aRealData, 2, '}');
    TNode(DeviceNode).KTTCDMAIP := stTemp;
    stTemp  := FindCharCopy(aRealData, 3, '}');
    TNode(DeviceNode).KTTCDMAPORT := stTemp;
    stTemp  := FindCharCopy(aRealData, 4, '}');
    TNode(DeviceNode).KTTCDMACHECKTIME := stTemp;
    stTemp  := FindCharCopy(aRealData, 5, '}');
    TNode(DeviceNode).KTTCDMARSSI := stTemp;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceKTTCDMAData');
  End;
end;

procedure TDevice.RcvDeviceKTTCDMAUse(aEcuId, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdKttCdmaUse] := True;
    if (TNode(DeviceNode).KTTCDMAUSERCV = 'R') or (TNode(DeviceNode).KTTCDMAUSERCV = 'S') then
        TNode(DeviceNode).KTTCDMAUSERCV := 'Y';
    Delete(aRealData,1,4);
    TNode(DeviceNode).KTTCDMAUSE := aRealData[1];
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceKTTCDMAUse');
  End;
end;

procedure TDevice.RcvDeviceKTTRemoteRingCount(aECUID, aDeviceVer,
  aRealData: string);
var
  stArmCount : string;
  stDisArmCount : string;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdKTTREMOTEARMRINGCOUNT] := True;
    if (TNode(DeviceNode).KTTREMOTERINGCOUNTRCV = 'R') or (TNode(DeviceNode).KTTREMOTERINGCOUNTRCV = 'S') then TNode(DeviceNode).KTTREMOTERINGCOUNTRCV := 'Y';
    Delete(aRealData,1,4);
    stArmCount := copy(aRealData,1,2);
    stDisArmCount := copy(aRealData,3,2);
    if isDigit(stArmCount) then
      TNode(DeviceNode).KTTREMOTEARMRINGCOUNT := strtoint(stArmCount);
    if isDigit(stDisArmCount) then
      TNode(DeviceNode).KTTREMOTEDISARMRINGCOUNT := strtoint(stDisArmCount);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceKTTRemoteRingCount');
  End;
end;

procedure TDevice.RcvDeviceKTTSystemId(aECUID, aDeviceVer, aRealData: string);
var
  stTemp: string;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdKTTSystemID] := True;
    if (TNode(DeviceNode).KTTSYSTEMIDRCV = 'R') or (TNode(DeviceNode).KTTSYSTEMIDRCV = 'S') then TNode(DeviceNode).KTTSYSTEMIDRCV := 'Y';

    stTemp := copy(aRealData,5,4);
    if stTemp <> 'AAAA' then
    begin
      stTemp := FillZeroNumber(Hex2Dec(stTemp),4);
    end;
    TNode(DeviceNode).KTTSYSTEMID := stTemp;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceKTTSystemId');
  End;
end;

procedure TDevice.RcvDeviceKTTTelNumber(aECUID, aDeviceVer, aRealData: string);
var
  stTemp : string;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdKTTTelNumber1] := True;
    if (TNode(DeviceNode).KTTTELNUMBERRCV = 'R') or (TNode(DeviceNode).KTTTELNUMBERRCV = 'S') then TNode(DeviceNode).KTTTELNUMBERRCV := 'Y';
    Delete(aRealData,1,4);
    stTemp := Copy(aRealData,1,2);
    Delete(aRealData,1,2);
    if stTemp = '00' then TNode(DeviceNode).KTTTELNUMBER1 := aRealData
    else if stTemp = '01' then TNode(DeviceNode).KTTTELNUMBER2 := aRealData;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceKTTTelNumber');
  End;
end;

procedure TDevice.RcvDeviceLampOnTime(aECUID, aDeviceVer, aRealData: string);
var
  stLampTime : string;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdLAMPONTIME] := True;
    if (DEVICELAMPONTIMERCV = 'R') or (DEVICELAMPONTIMERCV = 'S') then DEVICELAMPONTIMERCV := 'Y';
    Delete(aRealData,1,4);
    stLampTime := copy(aRealData,5,5);
    if Not isDigit(stLampTime) then Exit;
    LAMPONTIME := strtoint(stLampTime) div 60;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceLampOnTime');
  End;
end;

procedure TDevice.RcvDeviceNetworkState(aEcuId, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdNetworkState] := True;
    Delete(aRealData,1,4); //command 부분 삭제 처리
    if Assigned(FOnDeviceReceiveDataEvent) then
    begin
      OnDeviceReceiveDataEvent(Self,TNode(DeviceNode).No,'DEVICE',aEcuID,'0','0',con_DeviceCmdNetworkState,aRealData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceNetworkState');
  End;
end;


procedure TDevice.RcvDeviceSirenOnTime(aECUID, aDeviceVer, aRealData: string);
var
  stSirenTime : string;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdSIRENONTIME] := True;
    if (DEVICESIRENONTIMERCV = 'R') or (DEVICESIRENONTIMERCV = 'S') then DEVICESIRENONTIMERCV := 'Y';
    Delete(aRealData,1,4);
    stSirenTime := copy(aRealData,5,5);
    if Not isDigit(stSirenTime) then Exit;
    SIRENONTIME := strtoint(stSirenTime) div 60;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceSirenOnTime');
  End;
end;

procedure TDevice.RcvDeviceSystemInformation(aEcuID, aDeviceVer,
  aRealData: string);
var
  nIndex : integer;
  stLockExtend : string;
  i : integer;
begin
  Try
    L_bDeviceResponse[con_DeviceCmdSystemInformation] := True;
    if (DEVICESYSTEMINFORMATIONRCV = 'R') or (DEVICESYSTEMINFORMATIONRCV = 'S') then DEVICESYSTEMINFORMATIONRCV := 'Y';
    Delete(aRealData,1,4);
    WATCHACPOWER := aRealData[1]; //AC정전감시여부
    if Not isDigit(copy(aRealData,2,3)) then Exit;
    ARMOUTDELAY := strtoint(copy(aRealData,2,3)); //퇴실지연시간
    nIndex := DeviceDoorList.IndexOf('1');
    if nIndex > -1 then
    begin
      TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORTYPE := aRealData[6]; //Door1 타입
    end;
    nIndex := DeviceDoorList.IndexOf('2');
    if nIndex > -1 then
    begin
      TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORTYPE := aRealData[7]; //Door2 타입
    end;
    if Not isDigit(copy(aRealData,24,3)) then Exit;
    ARMINDELAY := strtoint(Copy(aRealData, 24, 3));
    if Length(aRealData) > 27 then
      stLockExtend := copy(aRealData,28,6);
    if Length(stLockExtend) = 6 then
    begin
      for i := 1 to 6 do
      begin
        nIndex := DeviceDoorList.IndexOf(inttostr(i + 2));   //3번 도어 부터
        if nIndex > -1 then TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORTYPE := stLockExtend[i]; //확장 Door 타입
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceSystemInformation');
  End;
end;

function TDevice.RcvDeviceTelEventProcess(aECUID, aDeviceVer, aMsgNo,
  aRealData: string): Boolean;
var
  stTempNodeNo : string;
  stDoorNo : string;
  stReaderNo : string;
  stTime : string;
  stTelNumber : string;
  stTelAccessEvent : string;
begin
  //aRealData = F0111[6]15070116155800P1O0[24]1234567890*1234#53
  result := True;
  Try
    stDoorNo:=  aRealData[3];
    stReaderNo := aRealData[4];
    stTime  := '20' + copy(aRealData,6,12);
    stTelNumber := copy(aRealData,24,11);

    stTempNodeNo := FillZeroNumber(TNode(DeviceNode).NO,G_nNodeCodeLength);                                                                                                              //yyyymmddhhnnss                                                                                           //16자리

    stTelAccessEvent := stTempNodeNo + aEcuID + stDoorNo[1] + stReaderNo[1] + stTime + stTelNumber;

    if Not FileAppend(G_stEventDataDir + '\TelAccessEvent' + FormatDateTime('yyyymmddhhnnss',now) + stTempNodeNo,stTelAccessEvent,False) then
    begin
      result := False;
    end;

  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceTelEventProcess');
  End;
end;

procedure TDevice.RcvDeviceTimeCodeRegProcess(aECUID, aDeviceVer, aMsgNo,
  aRealData: string);
var
  stTimeGroup : string;
begin
  Try
    stTimeGroup := aRealData[6];
    if Not isDigit(stTimeGroup) then Exit;
    L_bDeviceTimeCodeResponse[strtoint(stTimeGroup)] := True;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceTimeCodeRegProcess');
  End;
end;

procedure TDevice.RcvDeviceVersion(aECUID, aDeviceVer, aRealData: string);
begin
  Try
    L_bDeviceResponse[con_DeviceCmdVER] := True;
    DEVICEVERRCV := 'Y'; //버젼 정보는 무조건 수신 상태 Y
    DEVICEVER := copy(aRealData,5,Length(aRealData)-4); //앞에 4자리는 command 부분임
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceVersion');
  End;
end;

procedure TDevice.RcvDeviceZoneExtentionNetworkCheck(aEcuId, aDeviceVer, aMsgNo,
  aRealData: string);
var
  nIndex : integer;
  i : integer;
begin
  Try
    Delete(aRealData,1,4); //cs03 삭제
    L_bDeviceResponse[con_DeviceCmdExtentionNetwork] := True;
    DEVICEExtentionNetworkRCV := 'Y';
    Delete(aRealData,1,1);

    for i := 2 to Length(aRealData) do
    begin
      nIndex := DeviceZoneExtentionList.IndexOf(inttostr(i - 1));
      if nIndex > -1 then
      begin
        if aRealData[i] = '1' then
        begin
          TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZONEEXTENDUSE := True;
          TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZoneExtendConnected := True;
        end else if aRealData[i] = '0' then
        begin
          TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZONEEXTENDUSE := True;
          TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZoneExtendConnected := False;
        end else if UpperCase(aRealData[i]) = 'U' then
        begin
          TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZONEEXTENDTYPE := '0'; //미사용
          TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZoneExtendConnected := False;
        end;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceZoneExtentionNetworkCheck');
  End;
end;

procedure TDevice.RcvDeviceZoneInformation(aECUID, aDeviceVer,
  aRealData: string);
var
  stZoneNo : string;
  nIndex : integer;
begin
  Try
    stZoneNo := copy(aRealData,3,2);

    nIndex := DeviceZoneList.IndexOf('000' + stZoneNo);
    if nIndex < 0 then Exit;
    TDeviceZone(DeviceZoneList.Objects[nIndex]).RcvZoneInformation(aECUID,aDeviceVer,aRealData);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RcvDeviceZoneInformation');
  End;
end;

procedure TDevice.ReceiveDeviceAccessDataProcess(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
var
  msgCode: Char;
  stTemp : string;
  stDoorNo : string;
  nIndex : integer;
  bResult : Boolean;
  stTempNodeNo : string;
begin
  Try
    bResult := True;
    msgCode:= aRealData[1];

    if L_nLastPacketDupCount < 3 then
    begin
      if L_stLastPacketData = aMsgNo + aRealData then
      begin
        L_nLastPacketDupCount := L_nLastPacketDupCount + 1;
        Exit;
      end;
    end;

    L_nLastPacketDupCount := 0;
    L_stLastPacketData := aMsgNo + aRealData;

    {출입통제 데이터 처리}
    case msgcode of
      'a','b','g': begin //출입문 등록 응답
        stDoorNo:=  aRealData[3];
        nIndex := DeviceDoorList.IndexOf(stDoorNo);
        if nIndex > -1 then
        begin
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).ReceiveDoorSettingInformtion(aEcuID,aDeviceVer,aMsgNo,aRealData);
        end;
        stTempNodeNo := FillZeroNumber(TNode(DeviceNode).NO,G_nNodeCodeLength);
        FileAppend(G_stEventDataDir + '\DeviceRegEvent' + FormatDateTime('yyyymmddhhnnss',now) + stTempNodeNo,stTempNodeNo + aECUID + aRealData,False);
      end;
      'c' : begin //문제어 응답
        stDoorNo:=  aRealData[3];
        nIndex := DeviceDoorList.IndexOf(stDoorNo);
        if nIndex > -1 then
        begin
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).ReceiveDoorControlState(aEcuID,aDeviceVer,aMsgNo,aRealData);
        end;
      end;
      'D' : begin //문 상태 변경 처리
        stDoorNo:=  aRealData[3];
        nIndex := DeviceDoorList.IndexOf(stDoorNo);
        if nIndex > -1 then
        begin
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).ReceiveDoorEventState(aEcuID,aDeviceVer,aMsgNo,aRealData);
        end;
      end;
      'E' : begin //카드 데이터(출입) 처리
          bResult := RcvDeviceAccessEventProcess(aECUID,aDeviceVer,aMsgNo,aRealData);
      end;
      'F' : begin //전화 로그 데이터 처리
          bResult := RcvDeviceTelEventProcess(aECUID,aDeviceVer,aMsgNo,aRealData);
      end;
      'l','m','n','j','f': begin// 카드 데이터 등록 응답
        RcvDeviceCardRegProcess(aECUID,aDeviceVer,aMsgNo,aRealData);
      end;
      'q' : begin //휴일등록 응답
        stDoorNo:=  aRealData[3];
        nIndex := DeviceDoorList.IndexOf(stDoorNo);
        if nIndex > -1 then
        begin
          if aRealData[5] = 'W' then //특정일 전체삭제
          begin
            TDeviceDoor(DeviceDoorList.Objects[nIndex]).ReceiveDoorHolidayClear;
          end else if aRealData[5] = 'A' then //특정일 등록
          begin
            TDeviceDoor(DeviceDoorList.Objects[nIndex]).ReceiveDoorHolidayRegist(aEcuID,aDeviceVer,aMsgNo,aRealData);
          end else if aRealData[5] = 'D' then //특정일 삭제
          begin
            TDeviceDoor(DeviceDoorList.Objects[nIndex]).ReceiveDoorHolidayDelete(aEcuID,aDeviceVer,aMsgNo,aRealData);
          end;
        end;
        stTempNodeNo := FillZeroNumber(TNode(DeviceNode).NO,G_nNodeCodeLength);
        FileAppend(G_stEventDataDir + '\DeviceRegEvent' + FormatDateTime('yyyymmddhhnnss',now) + stTempNodeNo,stTempNodeNo + aECUID + aRealData,False);
      end;
      's' : begin//스케줄 데이터 등록 응답
        stDoorNo:=  aRealData[3];
        nIndex := DeviceDoorList.IndexOf(stDoorNo);
        if nIndex > -1 then
        begin
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).ReceiveDoorScheduleRegist(aECUID,aDeviceVer,aMsgNo,aRealData);
        end;
        stTempNodeNo := FillZeroNumber(TNode(DeviceNode).NO,G_nNodeCodeLength);
        //FileAppend(G_stEventDataDir + '\DeviceRegEvent' + FormatDateTime('yyyymmddhhnnss',now) + stTempNodeNo,stTempNodeNo + aECUID + aRealData,False);
      end;
      't','u': begin                     // 타임코드 응답
        RcvDeviceTimeCodeRegProcess(aECUID,aDeviceVer,aMsgNo,aRealData);
        stTempNodeNo := FillZeroNumber(TNode(DeviceNode).NO,G_nNodeCodeLength);
        //FileAppend(G_stEventDataDir + '\DeviceRegEvent' + FormatDateTime('yyyymmddhhnnss',now) + stTempNodeNo,stTempNodeNo + aECUID + aRealData,False);
      end
      else begin

      end;
    end;
    //이벤트 처리 후에 ACK 데이터 전송 하자.
    {ACK 응답:출입과 DOOR}
    if (msgCode <> 'a') and (msgCode <> 'b') and (msgCode <> 'c') and
       (msgCode <> 'l') and (msgCode <> 'm') and (msgCode <> 'n')
    then
    begin
      stTemp:='Y' + Copy(aRealData,2,2)+'  '+'a' + '  w000';  //Access Event Ack
      if bResult then SendPacket('c',aMsgNo,DeviceNode.GetDeviceVer, stTemp,0);   //정상적으로 로그를 남긴경우
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.ReceiveDeviceAccessDataProcess');
  End;
end;

procedure TDevice.ReceiveDeviceAlarmData(aECUID, aDeviceVer: string;
  aMsgNo,aCmd: char; aRealData: string);
var
  stTime : string;
  stSubCLass : string;
  stSubAddr : string;
  stArmArea : string;
  stMode : string;
  stAlarmStateCode : string;
  stAlarmStateCodeName : string;
  stAlarmStatePCCode : string;
  stAlarmStatePCCodeName : string;
  stAlarmStateModeChange : string;
  stAlarmView : string;
  stAlarmSound : string;
  stAlarmColor : string;
  stLoop : string;
  stZoneState : string;
  stOperator : string;
  nIndex : integer;
  nDoorIndex : integer;
  nOperLenth : integer;
  stTemp : string;
begin
  Try
    nOperLenth := 18;
    if (CardType = KT811) or (CardType = COMMON811) or (CardType = AUTOKT811) then
    begin
      nOperLenth := 10;
    end;;

    L_bDeviceResponse[con_DeviceCmdArmAreaState] := True;
    stTime     := copy(aRealData,2,14);
    stSubCLass := copy(aRealData,16,2);
    stSubAddr  := copy(aRealData,18,2);
    stArmArea  := copy(aRealData,20,2);
    if isDigit(stArmArea) then stArmArea := inttostr(strtoint(stArmArea))
    else stArmArea := '0';
    stMode     := UpperCase(copy(aRealData,22,1));
    stAlarmStateCode   := copy(aRealData,23,2);
    stLoop     := copy(aRealData,25,2);
    stZoneState    := copy(aRealData,27,1);
    stOperator := copy(aRealData,28,nOperLenth);
    if (UpperCase(stMode) = 'A') or (UpperCase(stMode) = 'D') then   ArmAreaStateRCV := True; //방범구역 상태 조회

    if nOperLenth = 18 then
    begin
      if copy(stOperator,1,2) = '16' then Delete(stOperator,1,2);
    end;
    stOperator := Trim(stOperator);       //깨진 데이터가 들어오는 경우가 있어서 처리함.
    stOperator := stringReplace(stOperator,'''','',[rfReplaceAll]);

    nIndex := AlarmEventStateCodeList.IndexOf(stAlarmStateCode);
    if nIndex > -1 then
    begin
      TAlarmEventStateCode(AlarmEventStateCodeList.Objects[nIndex]).GetAlarmEventPCCodeInfo(stAlarmStateCode,stSubCLass,stMode,stLoop,stZoneState,stOperator,
                                                                    stAlarmStateCodeName,stAlarmStatePCCode,stAlarmStatePCCodeName,stAlarmStateModeChange,stAlarmView,stAlarmSound,stAlarmColor);
    end;

    if (stSubCLass <> 'DO') then
    begin
      nIndex := DeviceArmAreaList.IndexOf(inttostr(strtoint(stArmArea)));
      if nIndex > -1 then
      begin
        if (stAlarmStateCode <>  G_stLongTimeStateCode) and (stAlarmStateCode <>  G_stLongTimeRecoveryCode) then    //장시간 열림시 현재 모드를 변경하면 안됨
           TDeviceArmArea(DeviceArmAreaList.Objects[nIndex]).ArmAreaCurrentSecurityMode := stMode;
      end;
    end;

    if (stSubCLass = 'MN') or (stSubCLass = 'EX') or (stSubCLass = 'SC') then
    begin
      if stAlarmStateCode = 'NF' then DEVICECONNECTED := csDisConnected
      else DEVICECONNECTED := csConnected;
    end else DEVICECONNECTED := csConnected;


    if Assigned(FOnCurrentAlarmEvent) then
    begin
      OnCurrentAlarmEvent(Self,inttostr(TNode(DeviceNode).NO),aECUID,aCmd,aMsgNo,stTime,stSubCLass,stSubAddr,stArmArea,stMode,stAlarmStateCode,stLoop,stZoneState,stOperator,stAlarmStateCodeName,stAlarmStatePCCode,stAlarmStatePCCodeName,stAlarmStateModeChange,stAlarmView,stAlarmSound,stAlarmColor);
    end;

    if stAlarmStateCode = 'FI' then
    begin
      if G_bLastFireCheck or (aCmd = 'A')  then //최종 상태를 체크 하거나 또는 실제 알람이 발생한 상태 인 경우
      begin
        if stZoneState <> 'N' then
          DeviceNode.FireEvent := True;
      end;
    end;
    if (UpperCase(stSubCLass) = 'CD') then
    begin
      stTemp := stSubAddr;
      if isDigit(stTemp) then stTemp := inttostr(strtoint(stTemp))
      else Exit;
      nIndex := DeviceReaderList.IndexOf(stTemp);
      if nIndex < 0 then Exit;

      if stAlarmStateCode = 'NF' then  //통신 단선
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderConnected  := False;
      end else if stAlarmStateCode = 'NR' then  //통신 복구
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderConnected  := True;
      end;
    end else if (UpperCase(stSubCLass) = 'EL') then
    begin
      stTemp := stSubAddr;
      if isDigit(stTemp) then stTemp := inttostr(strtoint(stTemp))
      else Exit;
      nIndex := DeviceZoneExtentionList.IndexOf(stTemp);
      if nIndex < 0 then Exit;

      if stAlarmStateCode = 'NF' then  //통신 단선
      begin
        TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZoneExtendConnected  := False;

        nDoorIndex := DeviceDoorList.IndexOf(inttostr(strtoint(stTemp)+2));  //존확장기 + 2 가 출입문이다.
        if nDoorIndex > -1 then
        begin
          TDeviceDoor(DeviceDoorList.Objects[nDoorIndex]).CardMode := '*';
          TDeviceDoor(DeviceDoorList.Objects[nDoorIndex]).DoorMode := '*';
          TDeviceDoor(DeviceDoorList.Objects[nDoorIndex]).DoorCurrentDSState := '*';
          TDeviceDoor(DeviceDoorList.Objects[nDoorIndex]).CurrentDoorStateChange := True;
          TDeviceDoor(DeviceDoorList.Objects[nDoorIndex]).CurrentDoorStateChangeAction;
        end;

      end else if stAlarmStateCode = 'NR' then  //통신 복구
      begin
        TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZoneExtendConnected  := True;

        nDoorIndex := DeviceDoorList.IndexOf(inttostr(strtoint(stTemp)+2));  //존확장기 + 2 가 출입문이다.
        if nDoorIndex > -1 then
        begin
          TDeviceDoor(DeviceDoorList.Objects[nDoorIndex]).DeviceDoorStateCheck;
        end;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.ReceiveDeviceAlarmData');
  End;
end;

procedure TDevice.ReceiveDeviceBroadCastProcess(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin

end;

procedure TDevice.ReceiveDeviceErrorDataProcess(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
var
  stCmd : string;
  i : integer;
begin
  Try
    //여기서 에러 데이터 수신하자.
    stCmd := copy(aRealData,1,4);

    if stCmd = 'cs01' then
    begin
      L_bDeviceResponse[con_DeviceCmdCardReaderNetwork] := True;
      DEVICECARDREADERNETWORKRcv := 'Y';
    end else if stCmd = 'Ct00' then
    begin
      L_bDeviceResponse[con_DeviceCmdCardReaderType] := True;
      DEVICECARDREADERTYPERCV := 'Y';
    end else if stCmd = 'DL01' then
    begin
      for i := 0 to DeviceDoorList.Count - 1 do
        TDeviceDoor(DeviceDoorList.Objects[i]).ErrorDoorArmDsCheck;
    end else if stCmd = 'DL03' then
    begin
      L_bDeviceResponse[con_DeviceCmdDeviceDoor2RelayType] := True;
      DEVICEDOOR2RELAYRCV := 'Y';
    end else if stCmd = 'DL05' then
    begin
      L_bDeviceResponse[con_DeviceCmdJAVARAARMCLOSE] := True;
      DEVICEJAVARAARMCLOSERCV := 'Y';
    end else if stCmd = 'DL07' then
    begin
      L_bDeviceResponse[con_DeviceCmdJAVARAAUTOCLOSE] := True;
      DEVICEJAVARAAUTOCLOSERCV := 'Y';
    end else if stCmd = 'DL09' then    //출입문 타임코드 전송 실패
    begin
      L_bDeviceResponse[con_DeviceCmdTimeCodeUse] := True;
      DEVICETIMECODEUSERCV := 'Y';
      TimeCodeSkill := False;
    end else if stCmd = 'DL10' then
    begin
      L_bDeviceResponse[con_DeviceCmdDeviceDoorArmArea] := True;
      DEVICEDOORARMAREARCV := 'Y';
    end else if stCmd = 'DV00' then
    begin
      L_bDeviceResponse[con_DeivceCmdDVRUSE] := True;
      TNode(DeviceNode).DVRUSERCV := 'Y';
    end else if stCmd = 'DV01' then
    begin
      L_bDeviceResponse[con_DeviceCmdDVRIP] := True;
      TNode(DeviceNode).DVRDATARCV := 'Y';
    end else if stCmd = 'EL00' then
    begin
      L_bDeviceResponse[con_DeviceCmdExtentionUse] := True;
      DEVICEDEVICEEXTENTIONUSERCV := 'Y';
    end else if stCmd = 'EX03' then
    begin
      L_bDeviceResponse[con_DeviceCmdARMEXTENTIONMAINFROMLOCAL] := True;
      TNode(DeviceNode).ARMEXTENTIONMAINFROMLOCALRCV := 'Y';
    end else if stCmd = 'EX04' then
    begin
      L_bDeviceResponse[con_DeviceCmdARMEXTENTIONMAINTOLOCAL] := True;
      TNode(DeviceNode).ARMEXTENTIONMAINTOLOCALRCV := 'Y';
    end else if stCmd = 'fn02' then
    begin
      L_bDeviceResponse[con_DeviceCmdArmAreaUse] := True;
      DEVICEARMAREAUSERCV := 'Y';
    end else if stCmd = 'fn05' then
    begin
      L_bDeviceResponse[con_DeviceCmdArmRelay] := True;
      DEVICEARMRELAYRCV := 'Y';
    end else if stCmd = 'Id00' then
    begin
      L_bDeviceResponse[con_DeviceCmdKTTSystemID] := True;
      TNode(DeviceNode).KTTSYSTEMIDRCV := 'Y';
    end else if stCmd = 'Rc00' then
    begin
      L_bDeviceResponse[con_DeviceCmdKTTREMOTEARMRINGCOUNT] := True;
      TNode(DeviceNode).KTTREMOTERINGCOUNTRCV := 'Y';
    end else if stCmd = 'RD00' then
    begin
      L_bDeviceResponse[con_DeviceCmdArmAreaState] := True;
    end else if stCmd = 'rd00' then
    begin
      L_bDeviceResponse[con_DeviceCmdArmAreaState] := True;
    end else if stCmd = 'RYEP' then
    begin
      L_bDeviceResponse[con_DeviceCmdEMZONELAMP] := True;
      DEVICEEMZONELAMPRCV := 'Y';
    end else if stCmd = 'RYLP' then
    begin
      L_bDeviceResponse[con_DeviceCmdLAMPONTIME] := True;
      DEVICELAMPONTIMERCV := 'Y';
    end else if stCmd = 'RYSI' then
    begin
      L_bDeviceResponse[con_DeviceCmdSIRENONTIME] := True;
      DEVICESIRENONTIMERCV := 'Y';
    end else if stCmd = 'sy00' then
    begin
      L_bDeviceResponse[con_DeviceCmdJaeJungDelayUse] := True;
      DEVICEJAEJUNGDELAYUSERCV := 'Y';
    end else if stCmd = 'SY00' then
    begin
      L_bDeviceResponse[con_DeviceCmdSystemInformation] := True;
      DEVICESYSTEMINFORMATIONRCV := 'Y';
    end else if stCmd = 'T00 ' then
    begin
      DEVICETIMECODERCV := 'Y';
      TimeCodeSkill := False;
    end else if stCmd = 'Tn00' then
    begin
      L_bDeviceResponse[con_DeviceCmdKTTTelNumber1] := True;
      TNode(DeviceNode).KTTTELNUMBERRCV := 'Y';
    end else if stCmd = 'VR01' then  //기기코드 명령 에러
    begin
      L_bDeviceResponse[con_DeviceCmdDeviceCode] := True;
      DEVICECODERCV := 'Y'; //송수신 완료
    end else if stCmd = 'VR00' then
    begin
      L_bDeviceResponse[con_DeviceCmdVER] := True;
      DEVICEVERRCV := 'Y';
    end else if stCmd = 'WL00' then
    begin
      L_bDeviceResponse[con_DeviceCmdKttCdmaUse] := True;
      TNode(DeviceNode).KTTCDMAUSERCV := 'Y';
    end else if stCmd = 'WL02' then
    begin
      L_bDeviceResponse[con_DeviceCmdKttCDMADATA] := True;
      TNode(DeviceNode).KTTCDMADATARCV := 'Y';
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.ReceiveDeviceErrorDataProcess');
  End;
end;

procedure TDevice.ReceiveDeviceFirmwareProcess(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin

end;

procedure TDevice.ReceiveDeviceFirmwareProcess2(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin

end;

procedure TDevice.ReceiveDeviceGageMonitor(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
var
  nIndex : integer;
  stTemp : string;
  stPerCent : string;
begin
  Try
    L_bFTPCardReceiv := True; //FTP 진행 중이면 계속 대기
    stTemp := aRealData;
    nIndex := Pos('(',stTemp);
    delete(stTemp,1,nIndex);
    nIndex := Pos(')',stTemp);
    stPerCent := copy(stTemp,1,nIndex -1);
    if isDigit(stPerCent) then
    begin
      if L_bFTPCardDownLoading then
      begin
        if Assigned(FOnReceiveTypeChage) then
        begin
          OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdFTPCardDownLoadPer,stPerCent);
        end;
        //카드데이터 다운로드 중
        if strtoint(stPerCent) = 100 then FTPCardDownLoadEnd := True;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.ReceiveDeviceGageMonitor');
  End;
end;

procedure TDevice.ReceiveDeviceMessageProcess(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin

end;

procedure TDevice.ReceiveDevicePTMonitoringProcess(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin

end;

procedure TDevice.ReceiveDeviceRegDataProcess(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
var
  stRegCode: String;
  stGubun : string;
  stDoorNo : string;
  stReaderNo : string;
  nIndex : integer;
begin
  Try
    stRegCode:= Copy(aRealData,1,2);
    stGubun:= Copy(aRealData,3,2);

    if stRegCode = 'CD' then
    begin
      stReaderNo := Copy(aRealData, 3, 2);
      nIndex := DeviceReaderList.IndexOf(stReaderNo[2]);
      if nIndex > -1 then
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReceiveReaderSettingInformation(aECUID,aDeviceVer,aMsgNo,aRealData);
      end;
    end else if stRegCode = 'Ct' then
    begin
      if stGubun = '00' then RcvDeviceCardReaderType(aECUID,aDeviceVer, aRealData);
    end else if stRegCode = 'DL' then
    begin
      if stGubun = '00' then
      begin
        stDoorNo := copy(aRealData,5,2);
        nIndex := DeviceDoorList.IndexOf(stDoorNo[2]);
        if nIndex > -1 then
        begin
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).ReceiveDoorDeadBoltDSCheckUse(aECUID,aDeviceVer,aMsgNo,aRealData);
        end;
      end else if stGubun = '01' then
      begin
        stDoorNo := copy(aRealData,5,2);
        nIndex := DeviceDoorList.IndexOf(stDoorNo[2]);
        if nIndex > -1 then
        begin
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).ReceiveDoorArmDsCheck(aECUID,aDeviceVer,aMsgNo,aRealData);
        end;
      end else if stGubun = '02' then
      begin
        stDoorNo := copy(aRealData,5,2);
        nIndex := DeviceDoorList.IndexOf(stDoorNo[2]);
        if nIndex > -1 then
        begin
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).ReceiveDoorDeadBoltDSCheckTime(aECUID,aDeviceVer,aMsgNo,aRealData);
        end;
      end else if stGubun = '03' then
      begin
        RcvDeviceDoor2RelayType(aECUID,aDeviceVer, aRealData);
      end else if stGubun = '04' then
      begin
        //RcvJavaraSchedule(aECUID,aDeviceVer, aRealData);
      end else if stGubun = '05' then
      begin
        RcvDeviceJavaraArmClose(aECUID,aDeviceVer, aRealData);
      end else if stGubun = '07' then
      begin
        RcvDeviceJavaraAutoClose(aECUID,aDeviceVer, aRealData);
      end else if stGubun = '09' then //출입문 시간코드 사용 유무 전송
      begin
        RcvDeviceDoorTimeCodeUse(aECUID,aDeviceVer, aRealData);
      end else if stGubun = '10' then
      begin
        RcvDeviceDoorArmArea(aEcuID,aDeviceVer,aRealData); //출입문방범구역
      end;
    end else if stRegCode = 'DV' then
    begin
      if stGubun = '00' then RcvDeviceDVRUse(aEcuId,aDeviceVer,aRealData)
      else if stGubun = '01' then RcvDeviceDVRData(aEcuId,aDeviceVer,aRealData)
      ;
    end else if stRegCode = 'EL' then
    begin
      if stGubun = '00' then RcvDeviceExtentionUsedData(aECUID,aDeviceVer, aRealData)
      else if stGubun = '01' then RcvDeviceExtentionZoneData(aECUID,aDeviceVer, aRealData);
    end else if stRegCode = 'EX' then
    begin
      if stGubun = '00' then RcvDeviceEcuUsedData(aECUID,aDeviceVer, aRealData) //컨트롤러확장기 사용정보
      else if stGubun = '02' then RcvDeviceEcuType(aECUID,aDeviceVer, aRealData)  //확장기 컨트롤러 타입
      else if stGubun = '03' then RcvDeviceArmEXTENTIONMainFromLocal(aECUID,aDeviceVer, aRealData)  //로컬경계후 메인경계
      else if stGubun = '04' then RcvDeviceArmEXTENTIONMainToLocal(aECUID,aDeviceVer, aRealData); //메인에서 로컬경계
    end else if stRegCode = 'fn' then
    begin
      if stGubun = '02' then RcvDeviceArmAreaUse(aEcuId,aDeviceVer,aRealData)
      else if stGubun = '05' then RcvDeviceArmRelay(aEcuId,aDeviceVer,aRealData);
    end else if stRegCode = 'Id' then
    begin
      if stGubun = '00' then RcvDeviceKTTSystemId(aECUID,aDeviceVer, aRealData);
    end else if stRegCode = 'ID' then  //컨트롤러 ID
    begin
      if stGubun = '00' then RcvDeviceID(aECUID,aDeviceVer, aRealData);
    end else if stRegCode = 'LP' then  //존정보
    begin
      RcvDeviceZoneInformation(aECUID,aDeviceVer, aRealData);
    end else if stRegCode = 'Rc' then
    begin
      if stGubun = '00' then RcvDeviceKTTRemoteRingCount(aECUID,aDeviceVer, aRealData);
    end else if stRegCode = 'RY' then
    begin
      if stGubun = 'EP' then RcvDeviceEMZONELampSiren(aECUID,aDeviceVer, aRealData)
      else if stGubun = 'LP' then RcvDeviceLampOnTime(aECUID,aDeviceVer, aRealData)
      else if stGubun = 'SI' then RcvDeviceSirenOnTime(aECUID,aDeviceVer, aRealData);
    end else if stRegCode = 'sy' then
    begin
      if stGubun = '00' then RcvDeviceJaejungDelayUse(aECUID,aDeviceVer, aRealData);
    end else if stRegCode = 'SY' then
    begin
      if stGubun = '00' then RcvDeviceSystemInforMation(aEcuID,aDeviceVer,aRealData);
    end else if stRegCode = 'TN' then  //카드리더 전화번호 등록
    begin
      stReaderNo := Copy(aRealData, 3, 2);
      nIndex := DeviceReaderList.IndexOf(stReaderNo[2]);
      if nIndex > -1 then
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReceiveReaderTelNumberSetting(aECUID,aDeviceVer,aMsgNo,aRealData);
      end;
    end else if stRegCode = 'Tn' then
    begin
      if stGubun = '00' then RcvDeviceKTTTelNumber(aECUID,aDeviceVer, aRealData);
    end else if stRegCode = 'WL' then
    begin
      if stGubun = '00' then RcvDeviceKTTCDMAUse(aEcuId,aDeviceVer,aRealData)
      else if stGubun = '01' then RcvDeviceKTTCDMAData(aEcuId,aDeviceVer,aRealData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.ReceiveDeviceRegDataProcess');
  End;
end;

procedure TDevice.ReceiveDeviceRemoteDataProcess(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
var
  stCmd: String;
  stGubun : string;
  stTime : string;
  i : integer;
begin
  Try
    stCmd:= Copy(aRealData,1,2);
    stGubun := Copy(aRealData,3,2);

    if stCmd = '**' then
    begin
  //    if stGubun = '00' then
  //    begin
  //      if Assigned(FOnCardAllClear) then
  //      begin
  //        OnCardAllClear(Self,aECUID,'');
  //      end;
  //    end;
    end else if stCmd = 'AP' then  //AntiCard 관련 함수  11:카드 입퇴실,01:글로벌안티 사용유무,16:글로벌안티패스 시작,정지,15:AntiCard시작정지
    begin
      if AntiGroupList.Count < 1 then
      begin
        if Assigned(FOnAntiPassDataEvent) then
        begin
          OnAntiPassDataEvent(Self,TNode(DeviceNode).No,aEcuID,stCmd,'',aRealData);
        end;
      end else
      begin
        for i := 0 to AntiGroupList.Count - 1 do
          OnAntiPassDataEvent(Self,TNode(DeviceNode).NO,EcuID,stCmd,AntiGroupList.Strings[i],aRealData);
      end;
    end else if stCmd = 'CD' then //카드데이터
    begin
      if stGubun = '10' then
      begin
  //      G_bDeviceResponse[CARDLISTCANCEL] := True;
      end
      else if stGubun = '11' then
      begin
  //      if Assigned(FOnCardGrade) then
  //      begin
  //        OnCardGrade(Self,aECUID,aRealData);
  //      end;
      end
      else if stGubun = '20' then
      begin
      end
      else if stGubun = '21' then
      begin
      end;
    end else if stCmd = 'cs' then //통신상태체크
    begin
      if stGubun = '00' then RcvDeviceNetworkState(aEcuId,aDeviceVer,aRealData)
      else if stGubun = '01' then RcvDeviceCardReaderNetworkStateCheck(aEcuId,aDeviceVer,aMsgNo,aRealData)
      else if stGubun = '03' then RcvDeviceZoneExtentionNetworkCheck(aEcuId,aDeviceVer,aMsgNo,aRealData);
      //else if stGubun = '90' then RcvLineShortCheck(aEcuId,aDeviceVer,aRealData);
      {
        stGubun = '00' -- cs0011uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu //확장기
        stGubun = '01' -- cs01x01uuuuuu //카드리더 8개
        stGubun = '02' -- cs02xuuuu //상황표시기
      }
    end else if stCmd = 'CV' then
    begin
      // 카드리더 버젼
      RcvDeviceCardReaderVersion(aEcuId,aDeviceVer,aMsgNo, aRealData);
    end else if stCmd = 'el' then
    begin
      // 존확장기 버젼
  //    RcvZoneExtentionVersion(aECUID,aVer, aRealData);
    end else if stCmd = 'fp' then //FTP 사용 가능 유무
    begin
      if stGubun = '10' then RcvDeviceFTPDownLoadState(aECUID,aDeviceVer, aRealData);
  //    if stGubun = '90' then RcvFTPCheck(aECUID,aVer, aRealData)
  //    else if stGubun = '10' then RcvFTPDownLoadState(aECUID,aVer, aRealData);
    end else if stCmd = 'fw' then
    begin
  //    RcvKTT812FirmWareDownload(aECUID,stGubun,aRealData);
    end else if stCmd = 'fn' then
    begin
  //    if (stGubun = '04') or (stGubun = '05')  then RcvZoneUseRemoteControl(aECUID,aVer, aRealData);
    end else if stCmd = 'MC' then   //Change mode
    begin
      //모드변경시 Mode Change로 올라옴
  //      if Pos('ModeChangeStart',aRealData) > 0 then
  //      begin
  //        G_bDeviceResponse[ALARMCONTROL] := True;
  //      end;
    end else if stCmd = 'RS' then //Reset
    begin
  //    G_bDeviceResponse[DEVICERESET] := True;
  //    if Assigned(FOnDeviceReset) then
  //    begin
  //      OnDeviceReset(Self,aECUID);
  //    end;
    end else if stCmd = 'Pt' then
    begin
      //RcvLinkusPt(aECUID,aVer, aRealData);
    end else if stCmd = 'SM' then
    begin
      if stGubun = '00' then
      begin
  //      DeviceState1Show(aECUID,aVer, aRealData);
      end else if (stGubun = '10') or (stGubun = '11') then    //10 존 상태,11 존확장기 포트 상태
      begin
  //      ZoneStateShow(aECUID,aVer, aRealData);
      end else if stGubun = '20' then
      begin
  //      DoorLockState(aECUID,aVer, aRealData)
      end else if stGubun = '24' then
      begin
  //      ZoneSensState(aECUID,aVer, aRealData);
      end else if stGubun = '25' then
      begin
        RcvDeviceFireRecovery(aECUID,aDeviceVer, aRealData);
      end;
    end else if stCmd = 'TM' then
    begin
      L_bDeviceResponse[con_DeviceControlTimeSync] := TRUE;
      //시간설정
      stTime :=  Copy(aRealData,5,14);
    end else if stCmd = 'VR' then
    begin
      //기기 버젼확인
      if stGubun = '01' then //기기코드이면
      begin
        RcvDeviceCode(aECUID,aDeviceVer, aRealData);
        Exit;
      end else if stGubun = '90' then
      begin
        //RcvSystemFunction(aECUID,aVer, aRealData);
        Exit;
      end else if stGubun = '00' then
      begin
        RcvDeviceVersion(aECUID,aDeviceVer, aRealData);
        Exit;
      end;
    end else if stCmd = 'WL' then
    begin
  //    RcvCCCControlData(aECUID,aVer,aRealData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.ReceiveDeviceRemoteDataProcess');
  End;
end;

procedure TDevice.ReceiveStateClear;
begin
  Try
    if DEVICEVERRCV = 'R' then DEVICEVERRCV := 'N';
    if DEVICECODERCV = 'R' then DEVICECODERCV := 'N';
    if DEVICEDOOR2RELAYRCV = 'R' then DEVICEDOOR2RELAYRCV := 'N';
    if DEVICESYSTEMINFORMATIONRCV = 'R' then DEVICESYSTEMINFORMATIONRCV := 'N';
    if DEVICEARMRELAYRCV = 'R' then DEVICEARMRELAYRCV := 'N';
    if DEVICECARDREADERTYPERCV = 'R' then DEVICECARDREADERTYPERCV := 'N';
    if DEVICEEMZONELAMPRCV = 'R' then DEVICEEMZONELAMPRCV := 'N';
    if DEVICELAMPONTIMERCV = 'R' then DEVICELAMPONTIMERCV := 'N';
    if DEVICESIRENONTIMERCV = 'R' then DEVICESIRENONTIMERCV := 'N';
    if DEVICEARMAREAUSERCV = 'R' then DEVICEARMAREAUSERCV := 'N';
    if DEVICEDEVICEEXTENTIONUSERCV = 'R' then DEVICEDEVICEEXTENTIONUSERCV := 'N';
    if DEVICEJAEJUNGDELAYUSERCV = 'R' then DEVICEJAEJUNGDELAYUSERCV := 'N';
    if DEVICEJAVARAARMCLOSERCV = 'R' then DEVICEJAVARAARMCLOSERCV := 'N';
    if DEVICEJAVARAAUTOCLOSERCV = 'R' then DEVICEJAVARAAUTOCLOSERCV := 'N';

    if DEVICEVERRCV = 'S' then DEVICEVERRCV := 'U';
    if DEVICECODERCV = 'S' then DEVICECODERCV := 'U';
    if DEVICEDOOR2RELAYRCV = 'S' then DEVICEDOOR2RELAYRCV := 'U';
    if DEVICESYSTEMINFORMATIONRCV = 'S' then DEVICESYSTEMINFORMATIONRCV := 'U';
    if DEVICEARMRELAYRCV = 'S' then DEVICEARMRELAYRCV := 'U';
    if DEVICECARDREADERTYPERCV = 'S' then DEVICECARDREADERTYPERCV := 'U';
    if DEVICEEMZONELAMPRCV = 'S' then DEVICEEMZONELAMPRCV := 'U';
    if DEVICELAMPONTIMERCV = 'S' then DEVICELAMPONTIMERCV := 'U';
    if DEVICESIRENONTIMERCV = 'S' then DEVICESIRENONTIMERCV := 'U';
    if DEVICEARMAREAUSERCV = 'S' then DEVICEARMAREAUSERCV := 'U';
    if DEVICEDEVICEEXTENTIONUSERCV = 'S' then DEVICEDEVICEEXTENTIONUSERCV := 'U';
    if DEVICEJAEJUNGDELAYUSERCV = 'S' then DEVICEJAEJUNGDELAYUSERCV := 'U';
    if DEVICEJAVARAARMCLOSERCV = 'S' then DEVICEJAVARAARMCLOSERCV := 'U';
    if DEVICEJAVARAAUTOCLOSERCV = 'S' then DEVICEJAVARAAUTOCLOSERCV := 'U';
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.ReceiveStateClear');
  End;
end;

function TDevice.RegistDeviceARMEXTENTIONMAINFromLOCAL(
  aARMEXTENTIONMAINFROMLOCAL: string; aDelay: Boolean): Boolean;
begin
  Try
    if ECUID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdARMEXTENTIONMAINFROMLOCAL] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'EX03' + aARMEXTENTIONMAINFROMLOCAL,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceARMEXTENTIONMAINFromLOCAL');
  End;
end;

function TDevice.RegistDeviceARMEXTENTIONMAINTOLOCAL(
  aARMEXTENTIONMAINTOLOCAL: string; aDelay: Boolean): Boolean;
begin
  Try
    if ECUID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdARMEXTENTIONMAINTOLOCAL] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'EX04' + aARMEXTENTIONMAINTOLOCAL,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdARMEXTENTIONMAINTOLOCAL,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceARMEXTENTIONMAINTOLOCAL');
  End;
end;

function TDevice.RegistDeviceDVRData(aDVRIP, aDVRPORT: string;
  aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdDVRIP] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'DV01' + aDVRIP + ' ' + aDVRPORT ,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdDVRIP,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceDVRData');
  End;
end;

function TDevice.RegistDeviceDVRUse(aDVRUSE: string; aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeivceCmdDVRUSE] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'DV00' + aDVRUSE,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeivceCmdDVRUSE,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceDVRUse');
  End;
end;

function TDevice.RegistDeviceECUUse(aEcuUseData: string;
  aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdUseState] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'EX00' + aEcuUseData,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdUseState,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceECUUse');
  End;
end;

function TDevice.RegistDeviceID(aDeviceID: string;aDelay:Boolean=True): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdDeviceID] := False;

    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'ID00' + aDeviceID,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdDeviceID,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceID');
  End;
end;

function TDevice.RegistDeviceKTTCDMADATA(aKTTCDMAMIN, aKTTCDMAMUX, aKTTCDMAIP,
  aKTTCDMAPORT, aKTTCDMACHECKTIME, aKTTCDMARSSI: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdKttCDMADATA] := False;
    stData := aKTTCDMAMIN + '}' +
                  aKTTCDMAMUX + '}' +
                  aKTTCDMAIP + '}' +
                  aKTTCDMAPORT + '}' +
                  aKTTCDMACHECKTIME + '}' +
                  aKTTCDMARSSI + '}';

    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'WL02' + stData,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdKttCDMADATA,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceKTTCDMADATA');
  End;
end;

function TDevice.RegistDeviceKTTCDMAUSE(aKTTCDMAUSE:string; aDelay: Boolean): Boolean;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdKttCdmaUse] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'WL00' + aKTTCDMAUSE ,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdKttCdmaUse,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceKTTCDMAUSE');
  End;
end;

function TDevice.RegistDeviceKTTRingCount(aKTTREMOTEARMRINGCOUNT,
  aKTTREMOTEDISARMRINGCOUNT: string; aDelay: Boolean): Boolean;
var
  stArmRingCount : string;
  stDisArmRingCount : string;
begin
  Try
    if EcuID <> '00' then Exit;
    if isDigit(aKTTREMOTEARMRINGCOUNT) then stArmRingCount := FillZeroNumber(strtoint(aKTTREMOTEARMRINGCOUNT),2)
    else stArmRingCount := '10';
    if isDigit(aKTTREMOTEDISARMRINGCOUNT) then stDisArmRingCount := FillZeroNumber(strtoint(aKTTREMOTEDISARMRINGCOUNT),2)
    else stDisArmRingCount := '10';

    L_bDeviceResponse[con_DeviceCmdKTTREMOTEARMRINGCOUNT] := False;
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'Rc00' + stArmRingCount + stDisArmRingCount,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdKTTREMOTEARMRINGCOUNT,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceKTTRingCount');
  End;
end;

function TDevice.RegistDeviceKTTSystemID(aKTTSYSTEMID: string;
  aDelay: Boolean): Boolean;
var
  stKttSystemID : string;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdKTTSystemID] := False;

    if Not isDigit(aKTTSYSTEMID) then stKttSystemID := 'AAAA'
    else
    begin
      stKttSystemID :=Dec2Hex(strtoint(aKTTSYSTEMID),4);
    end;

    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'Id00' + stKttSystemID ,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdKTTSystemID,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceKTTSystemID');
  End;
end;

function TDevice.RegistDeviceKTTTelNumber(aNo, aKTTTELNUMBER: string;
  aDelay: Boolean): Boolean;
var
  stKttTelNumber: string;
begin
  Try
    if EcuID <> '00' then Exit;
    L_bDeviceResponse[con_DeviceCmdKTTTelNumber1] := False;

    stKttTelNumber := SetSpaceLength(aKTTTELNUMBER, 20);
    SendPacket('I',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'Tn00' + FillZeroNumber(strtoint(aNo),2) + stKttTelNumber ,1);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceCmdKTTTelNumber1,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.RegistDeviceKTTTelNumber');
  End;
end;

procedure TDevice.SendPacket(aCmd, aMsgNo: char; aDeviceVer, aData: String;
  aPriority: integer);
begin
  Try
    if DeviceNode <> nil then
       DeviceNode.SendPacket(EcuID,aCmd,aMsgNo,aDeviceVer,aData,aPriority);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SendPacket');
  End;
end;

function TDevice.ServerDoorControl(aReaderNo, aDoorNo, aATButton, aCardNo,
  aAuth, aVoice: string): integer;
var
  stCardData : string;
  nCardLength : integer;
  stServerControlData : string;
begin
  result := con_NOTDEVICESEND;
  if DEVICECONNECTED <> csConnected then
  begin
    result := con_NOTDEVICECONNECT;
    Exit;
  end;
  if (CardType = AUTOKT811) or (CardType = COMMON811) then
  begin
    aCardNo := copy(aCardNo,1,8);
    stCardData := EncodeCardNo(aCardNo);
    nCardLength := 0;
  end else if (CardType = KT811) then
  begin
    if aCardNo[10] = '*' then //시리얼 타입 이면
      aCardNo := copy(aCardNo,1,8) + '0**';
    aCardNo := copy(aCardNo,1,11);
    if Length(aCardNo) <> 11 then aCardNo := FillCharString(aCardNo,'*',11,False);
    stCardData := Ascii2Hex(aCardNo);
    nCardLength := Length(stCardData);
  end else if (CardType = UNIVER811) then
  begin
    stCardData := aCardNo;
    if Length(stCardData) <> 16 then stCardData := FillCharString(stCardData,'*',16,False);
    nCardLength := Length(stCardData);
  end else if (CardType = MERGECARD) then
  begin
    stCardData := aCardNo;
    if Length(stCardData) <> 16 then stCardData := FillCharString(stCardData,'*',16,False);
    nCardLength := Length(stCardData);
  end else
  begin
    Exit;
  end;
  stCardData := FillzeroNumber(nCardLength,2) + stCardData;

  stServerControlData := 'CD90' +
                            ECUID +
                            FillZeroStrNum(aReaderNo,2) +
                            FillZeroStrNum(aDoorNo,2) +
                            Ascii2Hex(aATButton) +
                            aAuth +
                            stCardData +
                            aVoice;
                            //FillZeroNumber(aVoice,3);

  SendPacket('R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer,stServerControlData,0);
  result := con_SUCCESSDEVICESEND;

end;

procedure TDevice.SetARMAREASKILL(const Value: Boolean);
var
  i : integer;
begin
  //if FARMAREASKILL = Value then Exit;
  Try
    FARMAREASKILL := Value;
    if NOT Value then
    begin
      DEVICEARMAREAUSERCV := 'Y';
      DEVICEDOORARMAREARCV := 'Y';
      for i := 0 to DeviceArmAreaList.Count - 1 do
      begin
        if TDeviceArmArea(DeviceArmAreaList.Objects[i]).ArmAreaNo = 0 then TDeviceArmArea(DeviceArmAreaList.Objects[i]).ArmAreaUse := True
        else TDeviceArmArea(DeviceArmAreaList.Objects[i]).ArmAreaUse := False;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetARMAREASKILL');
  End;

end;

procedure TDevice.SetArmAreaStateRCV(const Value: Boolean);
begin
  //if FArmAreaStateRCV = Value then Exit;
  Try
    FArmAreaStateRCV := Value;
    if Value then
    begin
      if DoorStateRCV then CurrentArmDoorStateCheckRCV := 'Y';
    end else CurrentArmDoorStateCheckRCV := 'N';
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetArmAreaStateRCV');
  End;
end;

procedure TDevice.SetARMAREAUSE(const Value: string);
var
  i : integer;
begin
  Try
    if FARMAREAUSE = Value then Exit;
    FARMAREAUSE := Value;
    if Value = '0' then
    begin
      for i := 0 to DeviceArmAreaList.Count - 1 do
      begin
        //TDeviceArmArea(DeviceArmAreaList.Objects[i]).InfoInitialize := InfoInitialize;       //DB로딩중에는 이벤트 발생하지 말자.
        if TDeviceArmArea(DeviceArmAreaList.Objects[i]).ArmAreaNo = 0 then TDeviceArmArea(DeviceArmAreaList.Objects[i]).ArmAreaUse := True
        else TDeviceArmArea(DeviceArmAreaList.Objects[i]).ArmAreaUse := False;
        //TDeviceArmArea(DeviceArmAreaList.Objects[i]).InfoInitialize := False;
      end;
    end else if Value = '1' then
    begin
      for i := 0 to DeviceArmAreaList.Count - 1 do
      begin
        //TDeviceArmArea(DeviceArmAreaList.Objects[i]).InfoInitialize := InfoInitialize;
        if TDeviceArmArea(DeviceArmAreaList.Objects[i]).ArmAreaNo = 0 then TDeviceArmArea(DeviceArmAreaList.Objects[i]).ArmAreaUse := False
        else TDeviceArmArea(DeviceArmAreaList.Objects[i]).ArmAreaUse := True;
        //TDeviceArmArea(DeviceArmAreaList.Objects[i]).InfoInitialize := False;
      end;
    end;

    CurrentArmDoorStateCheckRCV := 'N'; //방범구역 사용 유무가 변경 되면 상태 조회를 새로 해야 됨
    for i := 0 to DeviceArmAreaList.Count - 1 do
    begin
      TDeviceArmArea(DeviceArmAreaList.Objects[i]).CurrentArmAreaStateCheckRCV := Value;
    end;
    if InfoInitialize then Exit;
    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdArmAreaUse,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetARMAREAUSE');
  End;
end;

procedure TDevice.SetARMEXTENTIONDATA(const Value: string);
begin
  Try
    FARMEXTENTIONDATA := Value;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetARMEXTENTIONDATA');
  End;
end;

procedure TDevice.SetARMEXTENTIONGUBUN(const Value: string);
begin
  Try
    FARMEXTENTIONGUBUN := Value;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetARMEXTENTIONGUBUN');
  End;
end;

procedure TDevice.SetArmExtentionSkill(const Value: Boolean);
begin
  Try
    if FArmExtentionSkill = Value then Exit;
    FArmExtentionSkill := Value;
    if EcuID = '00' then
    begin
      DeviceNode.ARMEXTENTIONSKILL := Value;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetArmExtentionSkill');
  End;
end;

procedure TDevice.SetARMINDELAY(const Value: integer);
begin
  Try
    if FARMINDELAY = Value then Exit;
    FARMINDELAY := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdArmInDelay,TNode(DeviceNode).NO,EcuID,inttostr(Value));
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetARMINDELAY');
  End;
end;

procedure TDevice.SetARMOUTDELAY(const Value: integer);
begin
  Try
    if FARMOUTDELAY = Value then Exit;
    FARMOUTDELAY := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdArmOutDelay,TNode(DeviceNode).NO,EcuID,inttostr(Value));
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetARMOUTDELAY');
  End;
end;

procedure TDevice.SetARMRELAY(const Value: string);
begin
  Try
    if FARMRELAY = Value then Exit;
    FARMRELAY := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdArmRelay,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetARMRELAY');
  End;
end;

procedure TDevice.SetCARDREADERTELSkill(const Value: Boolean);
begin
  Try
    FCARDREADERTELSkill := Value;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetCARDREADERTELSkill');
  End;
end;

procedure TDevice.SetCARDREADERTYPE(const Value: string);
begin
  Try
    if FCARDREADERTYPE = Value then Exit;
    FCARDREADERTYPE := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdCardReaderType,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetCARDREADERTYPE');
  End;
end;

procedure TDevice.SetCardType(const Value: string);
begin
  Try
    if FCardType = Value then Exit;
    FCardType := Value;
    if EcuID = '00' then
    begin
      if Value = KT811 then TNode(DeviceNode).DVRSkill := True
      else TNode(DeviceNode).DVRSkill := False;
    end;
    if Value = AUTOKT811 then //무인국사용
    begin
      MaxReaderCount := 1;
      MaxDoorCount := 1;
      CARDREADERTELSkill := True;
    end else if Value = KT811 then   //KT사옥
    begin
      DeviceJavaraScheduleSkill := True;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetCardType');
  End;
end;

procedure TDevice.SetCurrentArmDoorStateCheckRCV(const Value: string);
var
  i : integer;
begin
  Try
    if FCurrentArmDoorStateCheckRCV = Value then Exit;
    FCurrentArmDoorStateCheckRCV := Value;
    if Value = 'N' then
    begin
  {    //여기서 방범구역 상태 조회 타입 'N'으로 변경
      for i := 0 to DeviceArmAreaList.Count - 1 do
      begin
        TDeviceArmArea(DeviceArmAreaList.Objects[i]).CurrentArmAreaStateCheckRCV := Value;
      end;
      //여기서 출입문 상태 조회 타입 'N'으로 변경
      for i := 0 to DeviceDoorList.Count - 1 do
      begin
        TDeviceDoor(DeviceDoorList.Objects[i]).CurrentDoorStateCheckRCV := False;
      end;  }
      DoorStateRCV := False;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetCurrentArmDoorStateCheckRCV');
  End;
end;

procedure TDevice.SetDEVICEARMAREAUSERCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdArmAreaUse] := Value[1];
    if FDEVICEARMAREAUSERCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICEARMAREAUSERCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdArmAreaUse,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEARMAREAUSERCV');
  End;
end;

procedure TDevice.SetDEVICEARMRELAYRCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdArmRelay] := Value[1];
    if FDEVICEARMRELAYRCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICEARMRELAYRCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdArmRelay,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEARMRELAYRCV');
  End;
end;

procedure TDevice.SetDEVICECARDREADERNETWORKRcv(const Value: string);
begin
  Try
    if FDEVICECARDREADERNETWORKRcv = Value then Exit;
    if (DEVICETYPE = ICU100) or (DEVICETYPE = ICU200) then FDEVICECARDREADERNETWORKRcv := 'Y'
    else FDEVICECARDREADERNETWORKRcv := Value; //ICU는 카드리더 타입을 조회 설정 하지 말자.
    L_cDeviceRCVSTATE[con_DeviceCmdCardReaderNetwork] := FDEVICECARDREADERNETWORKRcv[1];

    ReciveStateChange := True;

    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdCardReaderNetwork,FDEVICECARDREADERNETWORKRcv);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICECARDREADERNETWORKRcv');
  End;

end;

procedure TDevice.SetDEVICECARDREADERTYPERCV(const Value: string);
begin
  Try
    if FDEVICECARDREADERTYPERCV = Value then Exit;
    if (DEVICETYPE = ICU100) or (DEVICETYPE = ICU200) then FDEVICECARDREADERTYPERCV := 'Y' //ICU는 카드리더 타입을 조회 설정 하지 말자.
    else FDEVICECARDREADERTYPERCV := Value;
    L_cDeviceRCVSTATE[con_DeviceCmdCardReaderType] := FDEVICECARDREADERTYPERCV[1];

    ReciveStateChange := True;

    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdCardReaderType,FDEVICECARDREADERTYPERCV);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICECARDREADERTYPERCV');
  End;
end;

procedure TDevice.SetDEVICECODE(const Value: string);
begin
  Try
    if FDEVICECODE = Value then Exit;
    FDEVICECODE := Value;

    if (Value = 'ACC-503') OR (Value = 'ICU-100') then DeviceType := ICU100
    else if (Value = 'ACC-505') OR (Value = 'ICU-200') then DeviceType := ICU200
    else if (Value = 'ACC-510') OR (Value = 'MCU-200') OR (Value = 'ECU-200') then
    begin
      DeviceType := KTT812;
    end else if (Value = 'ACC-104') OR (Value = 'MCU-100') OR (Value = 'ECU-100') OR (Value = 'MCU-110') OR (Value = 'ECU-110') then
    begin
      DeviceType := KTT811;
    end else if (Value = 'ACC-100') OR (Value = 'MCU-110N') then
    begin
      DeviceType := KTT811;
      CardType := AUTOKT811;
    end else if (Value = 'ACC-302') then
    begin
      DeviceType := ACC100;
    end else if (Value = 'SKI-100') then
    begin
      DeviceType := SKT100;
    end else if (Value = 'SGS-100') then
    begin
      DeviceType := SG100;
    end else
    begin
      if G_nProgramType = 2 then DeviceType := SKT100
      else DeviceType := KTT812;
    end;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdDeviceCode,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICECODE');
  End;
end;

procedure TDevice.SetDEVICECODERCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdDeviceCode] := Value[1];
    if FDEVICECODERCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICECODERCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdDeviceCode,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICECODERCV');
  End;
end;

procedure TDevice.SetDeviceConnected(const Value: TConnectedState);
var
  i : integer;
begin
  Try
    if FDeviceConnected = Value then Exit;
    FDeviceConnected := Value;
    if Value = csConnected then
    begin
      //if DEVICEVER = '' then DeviceVersionCheck;
      for i := 0 to DeviceArmAreaList.Count - 1 do
      begin
        TDeviceArmArea(DeviceArmAreaList.Objects[i]).CurrentArmAreaStateCheckRCV := 'N';
      end;
      //여기서 출입문 상태 조회 타입 'N'으로 변경
      for i := 0 to DeviceDoorList.Count - 1 do
      begin
        TDeviceDoor(DeviceDoorList.Objects[i]).CurrentDoorStateCheckRCV := False;
      end;

      if G_nMonitoringType <> 1 then ArmAreaStateRCV := False; //분기국사가 아닌경우 방범구역 상태 체크하자.
      CurrentArmDoorStateCheckRCV := 'N';
      TNode(DeviceNode).NodeConnected := csConnected;
      TNode(DeviceNode).DoorArmAreaStateRCV := False;  //확장기
      TNode(DeviceNode).ReciveStateChange := True; //컨트롤러 접속하면 기기정보 송수신 상태 체크 하자
    end else
    begin
      //통신 끊기면 알람상태와 출입문 상태 초기화
      DeviceDoorStateClear;
      DeviceAlarmStateClear;
      CurrentArmDoorStateCheckRCV := 'N';
      for i := 0 to DeviceArmAreaList.Count - 1 do
      begin
        TDeviceArmArea(DeviceArmAreaList.Objects[i]).CurrentArmAreaStateCheckRCV := 'N';
      end;
      //여기서 출입문 상태 조회 타입 'N'으로 변경
      for i := 0 to DeviceDoorList.Count - 1 do
      begin
        TDeviceDoor(DeviceDoorList.Objects[i]).CurrentDoorStateCheckRCV := False;
      end;
      FireEvent := False; //화재발생 Clear
    end;
    if Assigned(FOnDeviceConnected) then
    begin
      if AntiGroupList.Count < 1 then
      begin
        OnDeviceConnected(Self,TNode(DeviceNode).WinSocket,TNode(DeviceNode).NO,EcuID,Value,'');
      end else
      begin
        for i := 0 to AntiGroupList.Count - 1 do
          OnDeviceConnected(Self,TNode(DeviceNode).WinSocket,TNode(DeviceNode).NO,EcuID,Value,AntiGroupList.Strings[i]);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceConnected');
  End;
end;

procedure TDevice.SetDEVICEDEVICEEXTENTIONUSERCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdExtentionUse] := Value[1];
    if FDEVICEDEVICEEXTENTIONUSERCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICEDEVICEEXTENTIONUSERCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdExtentionUse,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEDEVICEEXTENTIONUSERCV');
  End;
end;

procedure TDevice.SetDEVICEDOOR2RELAYRCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdDeviceDoor2RelayType] := Value[1];
    if FDEVICEDOOR2RELAYRCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICEDOOR2RELAYRCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdDeviceDoor2RelayType,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEDOOR2RELAYRCV');
  End;
end;

procedure TDevice.SetDEVICEDOORARMAREARCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdDeviceDoorArmArea] := Value[1];
    if FDEVICEDOORARMAREARCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICEDOORARMAREARCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdDeviceDoorArmArea,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEDOORARMAREARCV');
  End;
end;

procedure TDevice.SetDEVICEEMZONELAMPRCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdEMZONELAMP] := Value[1];
    if FDEVICEEMZONELAMPRCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICEEMZONELAMPRCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdEMZONELAMP,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEEMZONELAMPRCV');
  End;
end;

procedure TDevice.SetDEVICEExtentionNetworkRCV(const Value: string);
begin
  Try
    if FDEVICEExtentionNetworkRCV = Value then Exit;
    if Not ExtendSkill then FDEVICEExtentionNetworkRCV := 'Y' //존확장기 추가 기능 없으면 조회/등록 하지 말자.
    else FDEVICEExtentionNetworkRCV := Value;

    L_cDeviceRCVSTATE[con_DeviceCmdExtentionNetwork] := FDEVICEExtentionNetworkRCV[1];

    ReciveStateChange := True;

    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdExtentionNetwork,FDEVICEExtentionNetworkRCV);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEExtentionNetworkRCV');
  End;
end;

procedure TDevice.SetDEVICEEXTENTIONUSE(const Value: string);
begin
  Try
    FDEVICEEXTENTIONUSE := Value;

    if InfoInitialize then Exit;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEEXTENTIONUSE');
  End;
end;

function TDevice.SetDeviceIDArmAreaInformation(aCmd: integer; aSubNo,
  aValue: string): Boolean;
var
  nIndex : integer;
begin
  Try
    result := False;
    nIndex := DeviceArmAreaList.IndexOf(aSubNo);
    if nIndex < 0 then Exit;
    case aCmd of
      con_ArmAreaCmdInfoInitialize : begin
        if aValue = '1' then TDeviceArmArea(DeviceArmAreaList.Objects[nIndex]).InfoInitialize := True
        else TDeviceArmArea(DeviceArmAreaList.Objects[nIndex]).InfoInitialize := False;
      end;
      con_ArmAreaCmdUse : begin
        if aValue = '1' then
          TDeviceArmArea(DeviceArmAreaList.Objects[nIndex]).ArmAreaUse := True
        else TDeviceArmArea(DeviceArmAreaList.Objects[nIndex]).ArmAreaUse := False;
      end;
      con_ArmAreaCmdView : begin
        TDeviceArmArea(DeviceArmAreaList.Objects[nIndex]).ArmAreaView := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceIDArmAreaInformation');
  End;
end;

function TDevice.SetDeviceIDCardReaderInformation(aCmd: integer; aSubNo,
  aValue: string): Boolean;
var
  nIndex : integer;
begin
  Try
    result := False;
    nIndex := DeviceReaderList.IndexOf(aSubNo);
    if nIndex < 0 then Exit;
    case aCmd of
      con_CardReaderCmdInfoInitialize : begin
        if aValue = '1' then TDeviceReader(DeviceReaderList.Objects[nIndex]).InfoInitialize := True
        else TDeviceReader(DeviceReaderList.Objects[nIndex]).InfoInitialize := False;
      end;
      con_CardReaderCmdArmAreaNo : begin
        if isDigit(aValue) then
          TDeviceReader(DeviceReaderList.Objects[nIndex]).ArmAreaNo := strtoint(aValue);
      end;
      con_CardReaderCmdBuildingPositionCode : begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).BuildingPositionCode := aValue ;
      end;
      con_CardReaderCmdDoorNo : begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).DoorNo := aValue;
      end;
      con_CardReaderCmdDoorPosition : begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).DoorPositionCode := aValue ;
      end;
      con_CardReaderCmdTelNumber0 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber0 := aValue ;
      end;
      con_CardReaderCmdTelNumber1 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber1 := aValue ;
      end;
      con_CardReaderCmdTelNumber2 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber2 := aValue ;
      end;
      con_CardReaderCmdTelNumber3 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber3 := aValue ;
      end;
      con_CardReaderCmdTelNumber4 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber4 := aValue ;
      end;
      con_CardReaderCmdTelNumber5 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber5 := aValue ;
      end;
      con_CardReaderCmdTelNumber6 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber6 := aValue ;
      end;
      con_CardReaderCmdTelNumber7 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber7 := aValue ;
      end;
      con_CardReaderCmdTelNumber8 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber8 := aValue ;
      end;
      con_CardReaderCmdTelNumber9 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber9 := aValue ;
      end;


      con_CardReaderCmdType : begin
        if isDigit(aValue) then
          TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderType := strtoint(aValue) ;
      end;
      con_CardReaderCmdUse : begin
        if aValue = '1' then
          TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderUse := True
        else TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderUse := False;
      end;
      con_CardReaderCmdVERSION : begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).READERVERSION := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceIDCardReaderInformation');
  End;
end;

function TDevice.SetDeviceIDDoorInformation(aCmd: integer; aSubNo,
  aValue: string): Boolean;
var
  nIndex : integer;
begin
  Try
    result := False;
    nIndex := DeviceDoorList.IndexOf(aSubNo);
    if nIndex < 0 then Exit;
    case aCmd of
      con_DoorCmdAntiGROUPCODE : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).AntiGroupCode := aValue;
      end;
      con_DoorCmdAntiNo : begin
        if isDigit(aValue) then
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).AntiPassNo := strtoint(aValue) ;
      end;
      con_DoorCmdArmArea : begin
        if isDigit(aValue) then
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).ARMAREANO := strtoint(aValue) ;
      end;
      con_DoorCmdARMDSCHECK : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).ARMDSCHECK := aValue ;
      end;
      con_DoorCmdCONTROLTIME : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).CONTROLTIME := aValue ;
      end;
      con_DoorCmdDeadBoltDSCHECKTIME : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DeadBoltDSCHECKTIME := aValue ;
      end;
      con_DoorCmdDeadBoltDSCHECKUSE : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DeadBoltDSCHECKUSE := aValue ;
      end;
      con_DoorCmdDSOPENSTATE : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DSOPENSTATE := aValue ;
      end;
      con_DoorCmdFIREDOOROPEN : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).FIREDOOROPEN := aValue ;
      end;
      con_DoorCmdInfoInitialize : begin
        if aValue = '1' then
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).InfoInitialize := True
        else TDeviceDoor(DeviceDoorList.Objects[nIndex]).InfoInitialize := False;
      end;
      con_DoorCmdLOCKTYPE : begin
        if isDigit(aValue) then
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).LOCKTYPE := strtoint(aValue) ;
      end;
      con_DoorCmdLONGOPENALARM : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).LONGOPENALARM := aValue;
      end;
      con_DoorCmdLONGOPENTIME : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).LONGOPENTIME := aValue ;
      end;
      con_DoorCmdLTCODE : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorLongTimeOpenState := aValue;
      end;
      con_DoorCmdName : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORNAME := aValue ;
      end;
      con_DoorCmdREMOTEDISARMDOOROPEN : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).REMOTEDISARMDOOROPEN := aValue ;
      end;
      con_DoorCmdSCHEDULEDATA : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).SetDoorScheduleData(aValue);
      end;
      con_DoorCmdSCHEDULEUSE : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).SCHEDULEUSE := aValue;
      end;
      con_DOORCmdSTATE : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORSTATE := aValue;
      end;
      con_DoorCmdTimeCodeUse : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).TimeCodeUse := aValue;
      end;
      con_DoorCmdType : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORTYPE := aValue;
      end;
      con_DoorCmdUse : begin
        if aValue = '1' then
          TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorUse := True
        else TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorUse := False;
      end;
      con_DoorCmdView : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORVIEW := aValue;
      end;
      con_DoorCurrentDSState : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DoorCurrentDSState := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceIDDoorInformation');
  End;

end;

function TDevice.SetDeviceIDExtentionInformation(aCmd:integer; aSubNo,
  aValue: string): Boolean;
var
  nIndex : integer;
begin
  Try
    result := False;
    nIndex := DeviceZoneExtentionList.IndexOf(aSubNo);
    if nIndex < 0 then Exit;
    case aCmd of
      con_ExtentionCmdInfoInitialize : begin
        if aValue = '1' then TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).InfoInitialize := True
        else TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).InfoInitialize := False;
      end;
      con_ExtentionCmdName : begin
        TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZONEEXTENDNAME := aValue;
      end;
      con_ExtentionCmdType : begin
        TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZONEEXTENDTYPE := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceIDExtentionInformation');
  End;
end;

function TDevice.SetDeviceIDSubInformation(aSubType, aCmd: integer; aSubNo,
  aValue: string): Boolean;
var
  stExtendID : string;
  stZoneNo : string;
  nIndex : integer;
begin
  if aCmd = con_DoorCmdAntiGROUPCODE then
  begin
    if strtoint(aValue) <> 0  then
    begin
      nIndex := AntiGroupList.IndexOf(aValue);
      if nIndex < 0 then AntiGroupList.Add(aValue);
    end;
  end;

  Try
    case aSubType of
      con_DeviceTypeArmArea : begin
        result := SetDeviceIDArmAreaInformation(aCmd,aSubNo,aValue);
      end;
      con_DeviceTypeDoor : begin
        result := SetDeviceIDDoorInformation(aCmd,aSubNo,aValue);
      end;
      con_DeviceTypeCardReader : begin
        result := SetDeviceIDCardReaderInformation(aCmd,aSubNo,aValue);
      end;
      con_DeviceTypeExtention : begin
        result := SetDeviceIDExtentionInformation(aCmd,aSubNo,aValue);
      end;
      con_DeviceTypeZone : begin
        stExtendID := copy(aSubNo,1,2);
        stZoneNo := copy(aSubNo,3,2);
        if isDigit(stExtendID) then stExtendID := inttostr(strtoint(stExtendID))
        else stExtendID := '0';
        if isDigit(stZoneNo) then stZoneNo := inttostr(strtoint(stZoneNo))
        else stZoneNo := '0';

        result := SetDeviceIDZoneInformation(aCmd,stExtendID, stZoneNo,aValue);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceIDSubInformation');
  End;
end;

function TDevice.SetDeviceIDZoneInformation(aCmd:integer; aExtendID, aZoneNo,
  aValue: string): Boolean;
var
  nIndex : integer;
  stZoneCode : string;
begin
  Try
    if Not isDigit(aExtendID) then Exit;
    if Not isDigit(aZoneNo) then Exit;

    stZoneCode := FillZeroNumber(strtoint(aExtendID),3) + FillZeroNumber(strtoint(aZoneNo),2);
    nIndex := DeviceZoneList.IndexOf(stZoneCode);
    if nIndex < 0 then Exit;

    case aCmd of
      con_ZoneCmdInfoInitialize : begin
        if aValue = '1' then TDeviceZone(DeviceZoneList.Objects[nIndex]).InfoInitialize := True
        else TDeviceZone(DeviceZoneList.Objects[nIndex]).InfoInitialize := False;
      end;
      con_ZoneCmdArmArea : begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ARMAREANO := aValue;
      end;
      con_ZoneCmdAlarmEventType : begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ALARMEVENTTYPE := aValue;
      end;
      con_ZoneCmdDelayUse : begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONEDELAY := aValue;
      end;
      con_ZoneCmdEventStateCode : begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).EVENTSTATECODE := aValue;
      end;
      con_ZoneCmdName : begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ZoneName := aValue;
      end;
      con_ZoneCmdRecovery : begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONERECOVERY := aValue;
      end;
      con_ZoneCmdSenseTime : begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONESENSETIME := aValue;
      end;
      con_ZoneCmdType : begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONETYPE := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceIDZoneInformation');
  End;
end;

procedure TDevice.SetDEVICEJAEJUNGDELAYUSERCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdJaeJungDelayUse] := Value[1];
    if FDEVICEJAEJUNGDELAYUSERCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICEJAEJUNGDELAYUSERCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdJaeJungDelayUse,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEJAEJUNGDELAYUSERCV');
  End;
end;

procedure TDevice.SetDEVICEJAVARAARMCLOSERCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdJAVARAARMCLOSE] := Value[1];
    if FDEVICEJAVARAARMCLOSERCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICEJAVARAARMCLOSERCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdJAVARAARMCLOSE,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEJAVARAARMCLOSERCV');
  End;
end;

procedure TDevice.SetDEVICEJAVARAAUTOCLOSERCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdJAVARAAUTOCLOSE] := Value[1];
    if FDEVICEJAVARAAUTOCLOSERCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICEJAVARAAUTOCLOSERCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdJAVARAAUTOCLOSE,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEJAVARAAUTOCLOSERCV');
  End;
end;

procedure TDevice.SetDeviceJavaraScheduleSkill(const Value: Boolean);
begin
  Try
    if FDeviceJavaraScheduleSkill = Value then Exit;
    FDeviceJavaraScheduleSkill := Value;
    if Not Value then
    begin
      DEVICEJAVARAARMCLOSERCV := 'Y';
      DEVICEJAVARAAUTOCLOSERCV := 'Y';
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceJavaraScheduleSkill');
  End;
end;

procedure TDevice.SetDeviceNode(const Value: TNode);
var
  i,j : integer;
  oDoor : TDeviceDoor;
  oArmArea : TDeviceArmArea;
  oDeviceReader : TDeviceReader;
  oDeviceZone : TDeviceZone;
  oDeviceZoneExtention : TDeviceZoneExtention;
begin
  if FDeviceNode = Value then Exit;

  Try
    FDeviceNode := Value;

    if DeviceDoorList.Count > 0 then
    begin
      for i := DeviceDoorList.Count - 1 downto 0 do
      begin
        TDeviceDoor(DeviceDoorList.Objects[i]).Free;
      end;
      DeviceDoorList.Clear;
    end;

    if DeviceArmAreaList.Count > 0 then
    begin
      for i := DeviceArmAreaList.Count - 1 downto 0 do
      begin
        TDeviceArmArea(DeviceArmAreaList.Objects[i]).Free;
      end;
      DeviceArmAreaList.Clear;
    end;

    if DeviceReaderList.Count > 0 then
    begin
      for i := DeviceReaderList.Count - 1 downto 0 do
      begin
        TDeviceReader(DeviceReaderList.Objects[i]).Free;
      end;
      DeviceReaderList.Clear;
    end;

    if DeviceZoneList.Count > 0 then
    begin
      for i := DeviceZoneList.Count - 1 downto 0 do
      begin
        TDeviceZone(DeviceZoneList.Objects[i]).Free;
      end;
      DeviceZoneList.Clear;
    end;

    if DeviceZoneExtentionList.Count > 0 then
    begin
      for i := DeviceZoneExtentionList.Count - 1 downto 0 do
      begin
        TDeviceZoneExtention(DeviceZoneExtentionList.Objects[i]).Free;
      end;
      DeviceZoneExtentionList.Clear;
    end;

    for i := 0 to HIGH(L_cDeviceRCVSTATE) do
    begin
      L_cDeviceRCVSTATE[i] := 'Y';
    end;

    for i := 1 to G_nDefaultDoorCount do
    begin
      AddDoorNo(inttostr(i));
    end;
    for i := 0 to G_nDefaultArmAreaCount do
    begin
      oArmArea := TDeviceArmArea.Create(nil);
      oArmArea.ArmAreaNo := i;
      oArmArea.Device := self;
      oArmArea.OnArmAreaPacket := ArmAreaPacket;
      DeviceArmAreaList.AddObject(inttostr(i),oArmArea);
    end;
    for i := 1 to G_nDefaultReaderCount do
    begin
      oDeviceReader := TDeviceReader.Create(nil);
      oDeviceReader.ReaderNo := i;
      oDeviceReader.Device := self;
      oDeviceReader.OnReceiveTypeChage := DeviceReceiveTypeChage;
      oDeviceReader.OnCardReaderPacketChange := CardReaderPacketChange;
      DeviceReaderList.AddObject(inttostr(i),oDeviceReader);
    end;
    for i := 0 to G_nDefaultExtentionCount do
    begin
      for j := 1 to G_nDefaultZoneCount do
      begin
        oDeviceZone := TDeviceZone.Create(nil);
        oDeviceZone.EXTENDID := i;
        oDeviceZone.ZoneNo := j;
        oDeviceZone.Device := self;
        oDeviceZone.OnReceiveTypeChage := DeviceReceiveTypeChage;
        oDeviceZone.OnZonePacketChange := ZonePacketChange;
        DeviceZoneList.AddObject(FillZeroNumber(i,3) + FillZeroNumber(j,2) ,oDeviceZone);
      end;
      oDeviceZoneExtention := TDeviceZoneExtention.Create(nil);
      oDeviceZoneExtention.EXTENDID := i;
      oDeviceZoneExtention.Device := self;
      if i = 0 then
      begin
        oDeviceZoneExtention.ZONEEXTENDTYPE := '1'; //0 은 본체이므로 무조건 Zone 사용 기능
        oDeviceZoneExtention.ZoneExtendConnected := True;  //컨트롤러 자체는 무조건 통신 연결중
      end else oDeviceZoneExtention.ZoneExtendConnected := False;

      oDeviceZoneExtention.OnZONEEXTENDTYPEChange := ZONEEXTENDTYPEChange;
      DeviceZoneExtentionList.AddObject(inttostr(i),oDeviceZoneExtention);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceNode');
  End;
end;

function TDevice.SetDeviceRcvIDArmAreaInformation(aCmd: integer; aSubNo,
  aValue: string): Boolean;
begin

end;

function TDevice.SetDeviceRcvIDCardReaderInformation(aCmd: integer; aSubNo,
  aValue: string): Boolean;
var
  nIndex : integer;
begin
  Try
    result := False;
    nIndex := DeviceReaderList.IndexOf(aSubNo);
    if nIndex < 0 then Exit;
    case aCmd of
      con_CardReaderCmdTelNumber0 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber0Rcv := aValue ;
      end;
      con_CardReaderCmdTelNumber1 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber1Rcv := aValue ;
      end;
      con_CardReaderCmdTelNumber2 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber2Rcv := aValue ;
      end;
      con_CardReaderCmdTelNumber3 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber3Rcv := aValue ;
      end;
      con_CardReaderCmdTelNumber4 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber4Rcv := aValue ;
      end;
      con_CardReaderCmdTelNumber5 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber5Rcv := aValue ;
      end;
      con_CardReaderCmdTelNumber6 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber6Rcv := aValue ;
      end;
      con_CardReaderCmdTelNumber7 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber7Rcv := aValue ;
      end;
      con_CardReaderCmdTelNumber8 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber8Rcv := aValue ;
      end;
      con_CardReaderCmdTelNumber9 :
      begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).TelNumber9Rcv := aValue ;
      end;
      con_CardReaderCmdSettingInfo : begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).ReaderSETTINGINFORcv := aValue ;
      end;
      con_CardReaderCmdVERSION : begin
        TDeviceReader(DeviceReaderList.Objects[nIndex]).READERVERSIONRcv := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceRcvIDCardReaderInformation');
  End;
end;

function TDevice.SetDeviceRcvIDDoorInformation(aCmd: integer; aSubNo,
  aValue: string): Boolean;
var
  nIndex : integer;
begin
  Try
    nIndex := DeviceDoorList.IndexOf(aSubNo);
    if nIndex < 0 then
    begin
      AddDoorNo(aSubNo);
      nIndex := DeviceDoorList.IndexOf(aSubNo);
    end;
    if nIndex < 0 then Exit;
    case aCmd of
      con_DoorCmdARMDSCHECK : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).ARMDSCHECKRCV := aValue ;
      end;
      con_DoorCmdDeadBoltDSCHECKTIME : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DeadBoltDSCHECKTIMERCV := aValue ;
      end;
      con_DoorCmdDeadBoltDSCHECKUSE : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DeadBoltDSCHECKUSERCV := aValue ;
      end;
      con_DoorCmdHOLIDAY : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).HolidayRCV := aValue;
      end;
      con_DoorCmdSCHEDULEDATA : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORSCHEDULEDATARCV := aValue;
      end;
      con_DoorCmdSettingInfo : begin
        TDeviceDoor(DeviceDoorList.Objects[nIndex]).DOORSETTINTINFORCV := aValue ;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceRcvIDDoorInformation');
  End;
end;

function TDevice.SetDeviceRcvIDExtentionInformation(aCmd: integer; aSubNo,
  aValue: string): Boolean;
var
  nIndex : integer;
begin
  Try
    result := False;
    nIndex := DeviceZoneExtentionList.IndexOf(aSubNo);
    if nIndex < 0 then Exit;
    case aCmd of
      con_ExtentionCmdZoneInfoSetting : begin
        TDeviceZoneExtention(DeviceZoneExtentionList.Objects[nIndex]).ZONEINFORCV := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceRcvIDExtentionInformation');
  End;

end;

function TDevice.SetDeviceRcvIDSubInformation(aSubType, aCmd: integer;
  aSubNo, aValue: string): Boolean;
var
  stExtendID : string;
  stZoneNo : string;
  i : integer;
begin
  Try
    case aSubType of
      con_DeviceTypeArmArea : begin
        result := SetDeviceRcvIDArmAreaInformation(aCmd,aSubNo,aValue);
      end;
      con_DeviceTypeDoor : begin
        result := SetDeviceRcvIDDoorInformation(aCmd,aSubNo,aValue);
      end;
      con_DeviceTypeCardReader : begin
        result := SetDeviceRcvIDCardReaderInformation(aCmd,aSubNo,aValue);
      end;
      con_DeviceTypeExtention : begin
        result := SetDeviceRcvIDExtentionInformation(aCmd,aSubNo,aValue);
      end;
      con_DeviceTypeZone : begin
        stExtendID := copy(aSubNo,1,2);
        stZoneNo := copy(aSubNo,3,2);
        if isDigit(stExtendID) then stExtendID := inttostr(strtoint(stExtendID))
        else stExtendID := '0';
        if isDigit(stZoneNo) then stZoneNo := inttostr(strtoint(stZoneNo))
        else stZoneNo := '0';
        if stExtendID = '0' then    //각각의 존 정보
          result := SetDeviceRcvIDZoneInformation(aCmd,stExtendID,stZoneNo,aValue)
        else result := SetDeviceRcvIDExtentionInformation(con_ExtentionCmdZoneInfoSetting,stExtendID,aValue);
      end;
      con_DoorCmdHOLIDAY : begin
        for i := 0 to DeviceDoorList.Count - 1 do
          TDeviceDoor(DeviceDoorList.Objects[i]).HolidayRCV := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceRcvIDSubInformation');
  End;

end;

function TDevice.SetDeviceRcvIDZoneInformation(aCmd:integer; aExtendID,
  aZoneNo, aValue: string): Boolean;
var
  nIndex : integer;
  stZoneCode : string;
begin
  Try
    if Not isDigit(aExtendID) then Exit;
    if Not isDigit(aZoneNo) then Exit;

    stZoneCode := FillZeroNumber(strtoint(aExtendID),3) + FillZeroNumber(strtoint(aZoneNo),2);
    nIndex := DeviceZoneList.IndexOf(stZoneCode);
    if nIndex < 0 then Exit;
    case aCmd of
      con_ZoneCmdSetting : begin
        TDeviceZone(DeviceZoneList.Objects[nIndex]).ZONESETTINGRcv := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceRcvIDZoneInformation');
  End;
end;

procedure TDevice.SetDEVICETIMECODERCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdTimeCodeSend] := Value[1];
    if FDEVICETIMECODERCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICETIMECODERCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdTimeCodeSend,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICETIMECODERCV');
  End;
end;

procedure TDevice.SetDEVICETIMECODEUSERCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdTimeCodeUse] := Value[1];
    if FDEVICETIMECODEUSERCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICETIMECODEUSERCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdTimeCodeUse,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICETIMECODEUSERCV');
  End;

end;

procedure TDevice.SetDEVICETYPE(const Value: string);
begin
  Try
    if FDEVICETYPE = Value then Exit;
    SecuritySkill := True;
    FDEVICETYPE := Value;
    case Value[1] of
      KTT811 : begin
        if EcuID = '00' then DeviceNode.MaxEcuCount := 63;

        if CardType = AUTOKT811 then
        begin
          MaxDoorCount := 1;
          MaxReaderCount := 1;
        end else
        begin
          MaxDoorCount := 2;
          MaxReaderCount := 8;
        end;
        if CardType = KT811 then
        begin
          DeviceJavaraScheduleSkill := True;
          if EcuID = '00' then
          begin
            TNode(DeviceNode).DVRSKILL := True;
          end;
        end else
        begin
          if CardType <> '' then DeviceJavaraScheduleSkill := False;
          if EcuID = '00' then
          begin
            if CardType <> '' then TNode(DeviceNode).DVRSKILL := False;
          end;
        end;
        FTPSkill := True;

        DOOR2RELAYSKILL := False;
        ExtendSkill := False;
        MaxZonePortCount := 8;
        DeviceScheduleSkill := True;
        MaxCardCount := 10000;
        ARMAREASKILL := False;
        ArmExtentionSkill := False;
        TimeCodeSkill := True;
        if EcuID = '00' then
        begin
          TNode(DeviceNode).KTTCDMASKILL := False;
          TNode(DeviceNode).ARMEXTENTIONSKILL:= False;
        end;
        TDeviceDoor(DeviceDoorList.Objects[0]).DoorUse := True;  //1번 출입문 사용 가능
        if G_nMonitoringType <> 1 then TDeviceDoor(DeviceDoorList.Objects[1]).DoorUse := True;  //2번 출입문 사용 가능
      end;
      KTT812 : begin
        if EcuID = '00' then DeviceNode.MaxEcuCount := 15;
        MaxDoorCount := 8;
        MaxReaderCount := 8;
        MaxZonePortCount := 8;
        DeviceScheduleSkill := False;
        DeviceJavaraScheduleSkill := False;
        MaxCardCount := 1000;
        ARMAREASKILL := True;
        ArmExtentionSkill := True;
        DOOR2RELAYSKILL := True;
        ExtendSkill := True;
        TimeCodeSkill := False;
        FTPSkill := False;
        if EcuID = '00' then
        begin
          TNode(DeviceNode).KTTCDMASKILL := True;
          TNode(DeviceNode).DVRSKILL := False;
          TNode(DeviceNode).ARMEXTENTIONSKILL:= True;
        end;
        TDeviceDoor(DeviceDoorList.Objects[0]).DoorUse := True;  //1번 출입문 사용 가능
      end;
      ICU100 : begin
        MaxDoorCount := 1;
        MaxReaderCount := 1;
        MaxZonePortCount := 6;
        DeviceScheduleSkill := False;
        DeviceJavaraScheduleSkill := False;
        MaxCardCount := 1000;
        ARMAREASKILL := False;
        ArmExtentionSkill := False;
        DOOR2RELAYSKILL := False;
        ExtendSkill := False;
        TimeCodeSkill := False;
        FTPSkill := False;
        if EcuID = '00' then
        begin
          TNode(DeviceNode).KTTCDMASKILL := False;
          TNode(DeviceNode).DVRSKILL := False;
          TNode(DeviceNode).ARMEXTENTIONSKILL:= False;
        end;
        DEVICECARDREADERTYPERCV := 'Y'; //카드리더 타입수신상태을 무조건 'Y';
        TDeviceDoor(DeviceDoorList.Objects[0]).DoorUse := True;  //1번 출입문 사용 가능
      end;
      ICU200 : begin
        MaxDoorCount := 0;
        MaxReaderCount := 1;
        MaxZonePortCount := 6;
        DeviceScheduleSkill := False;
        DeviceJavaraScheduleSkill := False;
        MaxCardCount := 1000;
        ARMAREASKILL := False;
        ArmExtentionSkill := False;
        DOOR2RELAYSKILL := False;
        ExtendSkill := False;
        TimeCodeSkill := False;
        FTPSkill := False;
        if EcuID = '00' then
        begin
          TNode(DeviceNode).KTTCDMASKILL := False;
          TNode(DeviceNode).DVRSKILL := False;
          TNode(DeviceNode).ARMEXTENTIONSKILL:= False;
        end;
        DEVICECARDREADERTYPERCV := 'Y'; //카드리더 타입수신상태을 무조건 'Y';
      end;
      ACC100 : begin
        if EcuID = '00' then DeviceNode.MaxEcuCount := 63;
        MaxDoorCount := 2;
        MaxReaderCount := 8;
        MaxZonePortCount := 0;
        DeviceScheduleSkill := False;
        DeviceJavaraScheduleSkill := False;
        MaxCardCount := 10000;
        ARMAREASKILL := False;
        ArmExtentionSkill := False;
        DOOR2RELAYSKILL := False;
        ExtendSkill := False;
        TimeCodeSkill := False;
        FTPSkill := False;
        SecuritySkill := False;
        if EcuID = '00' then
        begin
          TNode(DeviceNode).KTTCDMASKILL := False;
          TNode(DeviceNode).DVRSKILL := False;
          TNode(DeviceNode).ARMEXTENTIONSKILL:= False;
        end;
        TDeviceDoor(DeviceDoorList.Objects[0]).DoorUse := True;  //1번 출입문 사용 가능
        if G_nMonitoringType <> 1 then TDeviceDoor(DeviceDoorList.Objects[1]).DoorUse := True;  //2번 출입문 사용 가능
      end;
      SKT100 : begin
        if EcuID = '00' then DeviceNode.MaxEcuCount := 63;
        MaxDoorCount := 4;
        MaxReaderCount := 8;
        MaxZonePortCount := 8;
        DeviceScheduleSkill := True;
        DeviceJavaraScheduleSkill := False;
        MaxCardCount := 60000;
        ARMAREASKILL := True;
        ArmExtentionSkill := False;
        DOOR2RELAYSKILL := False;
        ExtendSkill := False;
        TimeCodeSkill := True;
        FTPSkill := True;
        if EcuID = '00' then
        begin
          TNode(DeviceNode).KTTCDMASKILL := False;
          TNode(DeviceNode).DVRSKILL := False;
          TNode(DeviceNode).ARMEXTENTIONSKILL:= False;
        end;
        TDeviceDoor(DeviceDoorList.Objects[0]).DoorUse := True;  //1번 출입문 사용 가능
        if G_nMonitoringType <> 1 then TDeviceDoor(DeviceDoorList.Objects[1]).DoorUse := True;  //2번 출입문 사용 가능
        if G_nMonitoringType <> 1 then TDeviceDoor(DeviceDoorList.Objects[2]).DoorUse := True;  //3번 출입문 사용 가능
        if G_nMonitoringType <> 1 then TDeviceDoor(DeviceDoorList.Objects[3]).DoorUse := True;  //4번 출입문 사용 가능
      end;
      SG100 : begin
        if EcuID = '00' then DeviceNode.MaxEcuCount := 63;
        MaxDoorCount := 4;
        MaxReaderCount := 8;
        MaxZonePortCount := 8;
        DeviceScheduleSkill := True;
        DeviceJavaraScheduleSkill := False;
        MaxCardCount := 60000;
        ARMAREASKILL := True;
        ArmExtentionSkill := False;
        DOOR2RELAYSKILL := False;
        ExtendSkill := False;
        TimeCodeSkill := True;
        FTPSkill := True;
        if EcuID = '00' then
        begin
          TNode(DeviceNode).KTTCDMASKILL := False;
          TNode(DeviceNode).DVRSKILL := False;
          TNode(DeviceNode).ARMEXTENTIONSKILL:= False;
        end;
        TDeviceDoor(DeviceDoorList.Objects[0]).DoorUse := True;  //1번 출입문 사용 가능
        if G_nMonitoringType <> 1 then TDeviceDoor(DeviceDoorList.Objects[1]).DoorUse := True;  //2번 출입문 사용 가능
        if G_nMonitoringType <> 1 then TDeviceDoor(DeviceDoorList.Objects[2]).DoorUse := True;  //3번 출입문 사용 가능
        if G_nMonitoringType <> 1 then TDeviceDoor(DeviceDoorList.Objects[3]).DoorUse := True;  //4번 출입문 사용 가능
      end;
      else begin
        if G_nProgramType = 2 then
        begin
          MaxDoorCount := 4;
          DeviceJavaraScheduleSkill := False;
          ARMAREASKILL := False;
          ArmExtentionSkill := False;
          DOOR2RELAYSKILL := False;
          ExtendSkill := False;
        end else
        begin
          MaxDoorCount := 2;
          DeviceJavaraScheduleSkill := False;
          ARMAREASKILL := False;
          ArmExtentionSkill := False;    //EX03 응답 없음으로 오류 발생
          DOOR2RELAYSKILL := False;
          ExtendSkill := False;
        end;

        FTPSkill := False;
        MaxReaderCount := 8;
        MaxZonePortCount := 8;
        DeviceScheduleSkill := True;
        MaxCardCount := 1000;
        if EcuID = '00' then
        begin
          TNode(DeviceNode).KTTCDMASKILL := True;
          TNode(DeviceNode).DVRSKILL := True;
        end;
        TDeviceDoor(DeviceDoorList.Objects[0]).DoorUse := True;  //1번 출입문 사용 가능
      end;
      if G_nMonitoringType = 1 then  //분기국사 시스템에서는 강제로 맞추자.
      begin
        MaxDoorCount := 1;
        MaxReaderCount := 1;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICETYPE');
  End;
end;

procedure TDevice.SetDeviceUse(const Value: Boolean);
begin
  Try
    if FDeviceUse = Value then Exit;
    FDeviceUse := Value;
    if EcuID = '00' then FDeviceUse := True; //주장치는 무조건 사용으로 설정

    if InfoInitialize then Exit; //초기화 상태 중이면 빠져 나가자.

    ReciveStateChange := Value;

    if Assigned(FOnDeviceUsed) then
    begin
      OnDeviceUsed(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceUse');
  End;
end;

procedure TDevice.SetDEVICEVER(const Value: string);
var
  TempVer : TStringList;
  nIndex : integer;
  stDeviceVersion : string;
begin
  Try
    if FDEVICEVER = Value  then Exit;
    FDEVICEVER := Value;
    Try
      TempVer := TStringList.Create;
      TempVer.Delimiter := ',';
      stDeviceVersion := StringReplace(Value,' ','_',[rfReplaceAll]);
      TempVer.DelimitedText := stDeviceVersion;
      if TempVer.Count > 2 then
      begin
        stDeviceVersion := StringReplace(TempVer.Strings[0],'_',' ',[rfReplaceAll]);
      end;
    Finally
      TempVer.Free;
    End;
    if Pos('KTT',stDeviceVersion) > 0  then CardType := COMMON811 //범용
    else if Pos('KT',stDeviceVersion) > 0  then CardType := KT811 //KT사옥용
    else if Pos('KHU',stDeviceVersion) > 0 then CardType := UNIVER811 //경희대용
    else if Pos('UNIV',stDeviceVersion) > 0 then CardType := UNIVER811 //명지대(범용대학교용)
    else if Pos('MJU',stDeviceVersion) > 0 then CardType := UNIVER811 //명지대(범용대학교용)
    else if Pos('CNU',stDeviceVersion) > 0 then CardType := UNIVER811 //충남대용
    else if Pos('AJU',stDeviceVersion) > 0 then CardType := UNIVER811 //아주대용
    else if Pos('C16',UpperCase(stDeviceVersion)) > 0 then CardType := MERGECARD //통합 16자리
    else
    begin
      if DeviceCode = 'ACC-100' then CardType := AUTOKT811
      else CardType := COMMON811;
    end;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdDeviceVersion,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEVER');
  End;
end;

procedure TDevice.SetDEVICEVERRCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdVER] := Value[1];
    if FDEVICEVERRCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICEVERRCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdVER,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICEVERRCV');
  End;
end;

procedure TDevice.SetDEVICESYSTEMINFORMATIONRCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdSystemInformation] := Value[1];
    if FDEVICESYSTEMINFORMATIONRCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICESYSTEMINFORMATIONRCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdSystemInformation,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICESYSTEMINFORMATIONRCV');
  End;
end;

function TDevice.SetDeviceTimeCode(aValue: string): Boolean;
begin
  Try
    if isDigit(aValue[1]) then
    begin
      L_arrDeviceTimeCode[strtoint(aValue[1])] := aValue;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDeviceTimeCode');
  End;
end;

procedure TDevice.SetDEVICELAMPONTIMERCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdLAMPONTIME] := Value[1];
    if FDEVICELAMPONTIMERCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICELAMPONTIMERCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdLAMPONTIME,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICELAMPONTIMERCV');
  End;
end;

procedure TDevice.SetDEVICESIRENONTIMERCV(const Value: string);
begin
  Try
    L_cDeviceRCVSTATE[con_DeviceCmdSIRENONTIME] := Value[1];
    if FDEVICESIRENONTIMERCV = Value then Exit;
    ReciveStateChange := True;
    FDEVICESIRENONTIMERCV := Value;
    if Assigned(FOnReceiveTypeChage) then
    begin
      OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdSIRENONTIME,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDEVICESIRENONTIMERCV');
  End;
end;

procedure TDevice.SetDOOR2RELAY(const Value: string);
begin
  Try
    if FDOOR2RELAY = Value then Exit;
    FDOOR2RELAY := Value;

    if Value <> '0' then
    begin
      if G_nMonitoringType <> 1 then TDeviceDoor(DeviceDoorList.Objects[1]).DoorUse := True;  //2번 출입문 사용 가능
    end else
    begin
      if DeviceType = KTT812 then
      begin
        if G_nMonitoringType <> 1 then TDeviceDoor(DeviceDoorList.Objects[1]).DoorUse := False;  //2번 출입문 사용 불가능
      end;
    end;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdDeviceDoor2RelayType,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDOOR2RELAY');
  End;
end;

procedure TDevice.SetDOOR2RELAYSKILL(const Value: Boolean);
begin
  Try
    if FDOOR2RELAYSKILL = Value then Exit;

    FDOOR2RELAYSKILL := Value;
    if Not Value then
    begin
      DEVICEDOOR2RELAYRCV := 'Y';
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDOOR2RELAYSKILL');
  End;
end;

procedure TDevice.SetDoorStateRCV(const Value: Boolean);
var
  i : integer;
begin
  Try
    FDoorStateRCV := Value;
    if Value then
    begin
      if ArmAreaStateRCV then CurrentArmDoorStateCheckRCV := 'Y';
      for i := 0 to DeviceDoorList.Count - 1 do
      begin
        if Not TDeviceDoor(DeviceDoorList.Objects[i]).CurrentDoorStateCheckRCV then
        begin
          DoorStateRCV := False;
          break;
        end;
      end;
    end else
    begin
      CurrentArmDoorStateCheckRCV := 'N';
      DeviceNode.DoorArmAreaStateRCV := Value;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDoorStateRCV');
  End;
end;

procedure TDevice.SetDVRSkill(const Value: string);
begin
  Try
    FDVRSkill := Value;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetDVRSkill');
  End;
end;

procedure TDevice.SetEMZONELAMP(const Value: string);
begin
  Try
    if FEMZONELAMP = Value then Exit;
    FEMZONELAMP := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdEMZONELAMP,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetEMZONELAMP');
  End;
end;

procedure TDevice.SetEMZONESIREN(const Value: string);
begin
  Try
    if FEMZONESIREN = Value then Exit;
    FEMZONESIREN := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdEMZONESIREN,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetEMZONESIREN');
  End;
end;

procedure TDevice.SetFireEvent(const Value: Boolean);
var
  i : integer;
begin
  Try
    if FFireEvent = Value then Exit;
    FFireEvent := Value;

    if DeviceDoorList.Count < 1 then Exit;

    for i := 0 to DeviceDoorList.Count - 1 do
    begin
(*   20160302 주장치 화재 발생으로 출입문 화재 설정은 문제가 있음 => 출입문이 화재시 문열림 사용유무를 사용하는지 모름
      if Value then TDeviceDoor(DeviceDoorList.Objects[i]).DoorCurrentFireEvent := '1'
*)
      if Not Value then
      begin
        TDeviceDoor(DeviceDoorList.Objects[i]).DoorCurrentFireEvent := '0';

        TDeviceDoor(DeviceDoorList.Objects[i]).CurrentDoorStateChangeAction; //변경이벤트 처리
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetFireEvent');
  End;
end;

procedure TDevice.SetFTPCardDownLoadEnd(const Value: Boolean);
var
  i : integer;
begin
  Try
    if FFTPCardDownLoadEnd = Value then Exit;
    FFTPCardDownLoadEnd := Value;
    if Value then
    begin
      FTPCardDownLoadCheckTimer.Enabled := False;
      while L_bCardSendCompleteClear do  //혹시 카드 정리 중이면 정리 끝날때까지 기다리자.
      begin
        sleep(1);
        Application.ProcessMessages;
      end;
      for i := DeviceCardList.Count - 1 downto 0 do
      begin
        if TDeviceCard(DeviceCardList.Objects[i]).RCVACK = 'F' then  TDeviceCard(DeviceCardList.Objects[i]).RCVACK := 'Y'; //FTP 전송 중인 데이터만
      end;
      if Assigned(FOnReceiveTypeChage) then
      begin
        OnReceiveTypeChage(Self,TNode(DeviceNode).NO,'DEVICE',EcuID,'0','0',con_DeviceCmdFTPCardDownLoadEnd,'Y');
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetFTPCardDownLoadEnd');
  End;
end;

procedure TDevice.SetFTPCardDownLoadFail(const Value: Boolean);
begin
  FFTPCardDownLoadFail := Value;
  if Value then FTPCardDownLoadCheckTimer.Enabled := False;

end;

function TDevice.SetHoliday(aDay, aValue: string): Boolean;
var
  i : integer;
begin
  Try
    result := False;
    if DeviceDoorList.Count < 1 then Exit;
    for i := 0 to DeviceDoorList.Count - 1 do
    begin
      TDeviceDoor(DeviceDoorList.Objects[i]).SetHoliday(aDay,aValue);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetHoliday');
  End;
end;

procedure TDevice.SetJAEJUNGDELAYUSE(const Value: string);
begin
  Try
    if FJAEJUNGDELAYUSE = Value then Exit;
    FJAEJUNGDELAYUSE := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdJaeJungDelayUse,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetJAEJUNGDELAYUSE');
  End;
end;

procedure TDevice.SetJAEJUNGSKILL(const Value: Boolean);
begin
  Try
    if FJAEJUNGSKILL = Value then Exit;
    FJAEJUNGSKILL := Value;

    if InfoInitialize then Exit;

    if Not JAEJUNGSKILL then
    begin
      DEVICEJAEJUNGDELAYUSERCV := 'Y';
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetJAEJUNGSKILL');
  End;
end;

procedure TDevice.SetJAVARAARMCLOSE(const Value: string);
begin
  Try
    if FJAVARAARMCLOSE = Value then Exit;
    FJAVARAARMCLOSE := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdJAVARAARMCLOSE,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetJAVARAARMCLOSE');
  End;
end;

procedure TDevice.SetJAVARAAUTOCLOSE(const Value: string);
begin
  Try
    if FJAVARAAUTOCLOSE = Value then Exit;
    FJAVARAAUTOCLOSE := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdJAVARAAUTOCLOSE,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetJAVARAAUTOCLOSE');
  End;
end;

procedure TDevice.SetJAVARADISARMOPEN(const Value: string);
begin
  Try
    if FJAVARADISARMOPEN = Value then Exit;
    FJAVARADISARMOPEN := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdJAVARADISARMOPEN,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetJAVARADISARMOPEN');
  End;
end;

procedure TDevice.SetJAVARASERVERARMCLOSE(const Value: string);
begin
  Try
    if FJAVARASERVERARMCLOSE = Value then Exit;
    FJAVARASERVERARMCLOSE := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdJAVARASERVERARMCLOSE,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetJAVARASERVERARMCLOSE');
  End;
end;

procedure TDevice.SetJAVARASERVERDISARMOPEN(const Value: string);
begin
  Try
    if FJAVARASERVERDISARMOPEN = Value then Exit;
    FJAVARASERVERDISARMOPEN := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdJAVARASERVERDISARMOPEN,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetJAVARASERVERDISARMOPEN');
  End;
end;

procedure TDevice.SetJAVARATYPEUSE(const Value: string);
var
  i : integer;
  nIndex : integer;
begin
  Try
    if FJAVARATYPEUSE = Value then Exit;
    FJAVARATYPEUSE := Value;
    if Value = '1' then
    begin
      nIndex := DeviceDoorList.IndexOf('1');
      if nIndex > -1 then
      begin
        if TDeviceDoor(DeviceDoorList.Objects[nIndex]).LOCKTYPE = 10 then  //자바라 열림이 아니면
        begin
          JAVARATYPEUSE := '0';
          Exit;
        end;
      end;
      nIndex := DeviceDoorList.IndexOf('2');
      if nIndex > -1 then
      begin
        if TDeviceDoor(DeviceDoorList.Objects[nIndex]).LOCKTYPE = 11 then //자바라 닫힘이 아니면
        begin
          JAVARATYPEUSE := '0';
          Exit;
        end;
      end;
    end;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdJAVARATYPEUSE,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetJAVARATYPEUSE');
  End;
end;

procedure TDevice.SetLAMPONTIME(const Value: integer);
begin
  Try
    if FLAMPONTIME = Value then Exit;
    FLAMPONTIME := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdLAMPONTIME,TNode(DeviceNode).NO,EcuID,inttostr(Value));
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetLAMPONTIME');
  End;
end;

procedure TDevice.SetNodeToArmAreaUse(aArmAreaNo, aValue: string);
var
  nIndex : integer;
  bValue : Boolean;
begin
  Try
    nIndex := DeviceArmAreaList.IndexOf(aArmAreaNo);
    if nIndex < 0 then Exit;
    if aValue = '1' then bValue := True
    else bValue := False;

    TDeviceArmArea(DeviceArmAreaList.Objects[nIndex]).ArmAreaUse := bValue ;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetNodeToArmAreaUse');
  End;
end;

procedure TDevice.SetNodeToCardPermitExcute(aCardNo,aRcvAck: string);
var
  nIndex : integer;
begin
  Try
    nIndex := DeviceCardList.IndexOf(aCardNo);
    if nIndex < 0 then Exit; //권한 없는 카드는 셋팅 할 필요 없다.
    TDeviceCard(DeviceCardList.Objects[nIndex]).PermitSetting(aRcvAck);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetNodeToCardPermitExcute');
  End;
end;

procedure TDevice.SetNodeToCardPermitInitialize(aCardNo, aCardPermit,aCardState, aDoor1,
  aDoor2, aDoor3, aDoor4, aDoor5, aDoor6, aDoor7, aDoor8, aArmArea0, aArmArea1,
  aArmArea2, aArmArea3, aArmArea4, aArmArea5, aArmArea6, aArmArea7, aArmArea8,
  aRcvAck, aPositionNum, aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3, aTime4, aTCWeekCode,aRegDate,aEndDate,aEmState: string;aSendType:integer=0);
var
  nIndex : integer;
  oDeviceCard : TDeviceCard;
begin
  Try
    if aCardState <> '1' then aCardPermit := '0';
    if aTimeCodeUse = '' then aTimeCodeUse := '0';
    if aTCGroup = '' then aTCGroup := '0';
    if aTime1 = '' then aTime1 := '0';
    if aTime2 = '' then aTime2 := '0';
    if aTime3 = '' then aTime3 := '0';
    if aTime4 = '' then aTime4 := '0';
    if aTCWeekCode = '' then aTCWeekCode := '0000000';
    if aEmState = '' then aEmState := '1';
    if aSendType = 1 then
    begin
      //권한이 변경 되어 DeviceServerManager에서 전송한 데이터이므로 먼저 처리 하자.
      nIndex := DeviceCardFirstList.IndexOf(aCardNo);
      if nIndex > -1 then
      begin
(*        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).CARDNO := aCardNo ;
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitCardPermit(aCardPermit);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitDoorPermit(1,aDoor1);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitDoorPermit(2,aDoor2);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitDoorPermit(3,aDoor3);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitDoorPermit(4,aDoor4);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitDoorPermit(5,aDoor5);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitDoorPermit(6,aDoor6);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitDoorPermit(7,aDoor7);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitDoorPermit(8,aDoor8);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitArmAreaPermit(0,aArmArea0);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitArmAreaPermit(1,aArmArea1);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitArmAreaPermit(2,aArmArea2);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitArmAreaPermit(3,aArmArea3);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitArmAreaPermit(4,aArmArea4);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitArmAreaPermit(5,aArmArea5);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitArmAreaPermit(6,aArmArea6);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitArmAreaPermit(7,aArmArea7);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitArmAreaPermit(8,aArmArea8);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).PositionNum := aPositionNum;
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitTimeCodeUse(aTimeCodeUse);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitTimeGroup(aTCGroup);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitTimeCode(1,aTime1);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitTimeCode(2,aTime2);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitTimeCode(3,aTime3);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitTimeCode(4,aTime4);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitWeekCode(aTCWeekCode);
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).REGDATE := aRegDate ;
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).ENDDATE := aEndDate ;
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).EMSTATE := aEmState ;
        TDeviceCard(DeviceCardFirstList.Objects[nIndex]).InitRCVACK(aRcvAck);
*)
      end else
      begin
        if (aCardState <> '1') or (aCardPermit = '0') then
        begin
          if aRcvAck = 'Y' then Exit; //카드가 정상이 아니거나 권한이 없는 카드인경우 수신상태가 'Y'이면 추가 하지 말자.
        end;

        oDeviceCard := TDeviceCard.Create(nil);
        oDeviceCard.Device := Self;
        oDeviceCard.CARDNO := aCardNo ;
        oDeviceCard.InitCardPermit(aCardPermit);
        oDeviceCard.InitDoorPermit(1,aDoor1);
        oDeviceCard.InitDoorPermit(2,aDoor2);
        oDeviceCard.InitDoorPermit(3,aDoor3);
        oDeviceCard.InitDoorPermit(4,aDoor4);
        oDeviceCard.InitDoorPermit(5,aDoor5);
        oDeviceCard.InitDoorPermit(6,aDoor6);
        oDeviceCard.InitDoorPermit(7,aDoor7);
        oDeviceCard.InitDoorPermit(8,aDoor8);
        oDeviceCard.InitArmAreaPermit(0,aArmArea0);
        oDeviceCard.InitArmAreaPermit(1,aArmArea1);
        oDeviceCard.InitArmAreaPermit(2,aArmArea2);
        oDeviceCard.InitArmAreaPermit(3,aArmArea3);
        oDeviceCard.InitArmAreaPermit(4,aArmArea4);
        oDeviceCard.InitArmAreaPermit(5,aArmArea5);
        oDeviceCard.InitArmAreaPermit(6,aArmArea6);
        oDeviceCard.InitArmAreaPermit(7,aArmArea7);
        oDeviceCard.InitArmAreaPermit(8,aArmArea8);
        oDeviceCard.PositionNum := aPositionNum;
        oDeviceCard.InitTimeCodeUse(aTimeCodeUse);
        oDeviceCard.InitTimeGroup(aTCGroup);
        oDeviceCard.InitTimeCode(1,aTime1);
        oDeviceCard.InitTimeCode(2,aTime2);
        oDeviceCard.InitTimeCode(3,aTime3);
        oDeviceCard.InitTimeCode(4,aTime4);
        oDeviceCard.InitWeekCode(aTCWeekCode);
        oDeviceCard.REGDATE := aRegDate ;
        oDeviceCard.ENDDATE := aEndDate ;
        oDeviceCard.EMSTATE := aEmState ;
        oDeviceCard.InitRCVACK(aRcvAck);

        oDeviceCard.OnCardPermitChange := CardPermitChange;
        oDeviceCard.OnCardRcvAckChange := CardRcvAckChange;

        DeviceCardFirstList.AddObject(aCardNo,oDeviceCard);
      end;
      Exit;
    end;

    nIndex := DeviceCardList.IndexOf(aCardNo);
    if nIndex > -1 then
    begin
      TDeviceCard(DeviceCardList.Objects[nIndex]).CARDNO := aCardNo ;
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitCardPermit(aCardPermit);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitDoorPermit(1,aDoor1);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitDoorPermit(2,aDoor2);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitDoorPermit(3,aDoor3);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitDoorPermit(4,aDoor4);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitDoorPermit(5,aDoor5);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitDoorPermit(6,aDoor6);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitDoorPermit(7,aDoor7);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitDoorPermit(8,aDoor8);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitArmAreaPermit(0,aArmArea0);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitArmAreaPermit(1,aArmArea1);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitArmAreaPermit(2,aArmArea2);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitArmAreaPermit(3,aArmArea3);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitArmAreaPermit(4,aArmArea4);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitArmAreaPermit(5,aArmArea5);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitArmAreaPermit(6,aArmArea6);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitArmAreaPermit(7,aArmArea7);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitArmAreaPermit(8,aArmArea8);
      TDeviceCard(DeviceCardList.Objects[nIndex]).PositionNum := aPositionNum;
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitTimeCodeUse(aTimeCodeUse);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitTimeGroup(aTCGroup);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitTimeCode(1,aTime1);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitTimeCode(2,aTime2);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitTimeCode(3,aTime3);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitTimeCode(4,aTime4);
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitWeekCode(aTCWeekCode);
      TDeviceCard(DeviceCardList.Objects[nIndex]).REGDATE := aRegDate ;
      TDeviceCard(DeviceCardList.Objects[nIndex]).ENDDATE := aEndDate ;
      TDeviceCard(DeviceCardList.Objects[nIndex]).EMSTATE := aEmState ;
      TDeviceCard(DeviceCardList.Objects[nIndex]).InitRCVACK(aRcvAck);
    end else
    begin
      if (aCardState <> '1') or (aCardPermit = '0') then
      begin
        if aRcvAck = 'Y' then Exit; //카드가 정상이 아니거나 권한이 없는 카드인경우 수신상태가 'Y'이면 추가 하지 말자.
      end;

      oDeviceCard := TDeviceCard.Create(nil);
      oDeviceCard.Device := Self;
      oDeviceCard.CARDNO := aCardNo ;
      oDeviceCard.InitCardPermit(aCardPermit);
      oDeviceCard.InitDoorPermit(1,aDoor1);
      oDeviceCard.InitDoorPermit(2,aDoor2);
      oDeviceCard.InitDoorPermit(3,aDoor3);
      oDeviceCard.InitDoorPermit(4,aDoor4);
      oDeviceCard.InitDoorPermit(5,aDoor5);
      oDeviceCard.InitDoorPermit(6,aDoor6);
      oDeviceCard.InitDoorPermit(7,aDoor7);
      oDeviceCard.InitDoorPermit(8,aDoor8);
      oDeviceCard.InitArmAreaPermit(0,aArmArea0);
      oDeviceCard.InitArmAreaPermit(1,aArmArea1);
      oDeviceCard.InitArmAreaPermit(2,aArmArea2);
      oDeviceCard.InitArmAreaPermit(3,aArmArea3);
      oDeviceCard.InitArmAreaPermit(4,aArmArea4);
      oDeviceCard.InitArmAreaPermit(5,aArmArea5);
      oDeviceCard.InitArmAreaPermit(6,aArmArea6);
      oDeviceCard.InitArmAreaPermit(7,aArmArea7);
      oDeviceCard.InitArmAreaPermit(8,aArmArea8);
      oDeviceCard.PositionNum := aPositionNum;
      oDeviceCard.InitTimeCodeUse(aTimeCodeUse);
      oDeviceCard.InitTimeGroup(aTCGroup);
      oDeviceCard.InitTimeCode(1,aTime1);
      oDeviceCard.InitTimeCode(2,aTime2);
      oDeviceCard.InitTimeCode(3,aTime3);
      oDeviceCard.InitTimeCode(4,aTime4);
      oDeviceCard.InitWeekCode(aTCWeekCode);
      oDeviceCard.REGDATE := aRegDate ;
      oDeviceCard.ENDDATE := aEndDate ;
      oDeviceCard.EMSTATE := aEmState ;
      oDeviceCard.InitRCVACK(aRcvAck);

      oDeviceCard.OnCardPermitChange := CardPermitChange;
      oDeviceCard.OnCardRcvAckChange := CardRcvAckChange;

      DeviceCardList.AddObject(aCardNo,oDeviceCard);
      inc(G_nDebugCardDownLoadCount);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetNodeToCardPermitInitialize');
  End;
end;

procedure TDevice.SetNodeToCardPermitSetting(aCardNo, aPermit, aCardState,
  aType, aNumber, aPositionNum, aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3, aTime4,
  aWeekCode,aRegDate,aEndDate,aEmState: string);
var
  nIndex : integer;
  oDeviceCard : TDeviceCard;
begin
  Try
  {  if (CardType = AUTOKT811) or (CardType = COMMON811) then
    begin
      if Length(aCardNo) <> 8 then Exit;
    end else if (CardType = KT811) then
    begin
      if Length(aCardNo) <> 11 then aCardNo := FillCharString(aCardNo,'*',11,False);
    end else if (CardType = UNIVER811) then
    begin
      if Length(aCardNo) <> 16 then aCardNo := FillCharString(aCardNo,'*',16,False);
    end else if (CardType = MERGECARD) then
    begin
      if Length(aCardNo) <> 16 then aCardNo := FillCharString(aCardNo,'*',16,False);
    end; }
    if Length(aCardNo) <> 16 then aCardNo := FillCharString(aCardNo,'*',16,False);

    if aCardState <> '1' then aPermit := '0'; //등록 상태가 아니면 해당 출입문 권한 없음 처리

    if aTimeCodeUse = '' then aTimeCodeUse := '0';
    if aTCGroup = '' then aTCGroup := '0';
    if aTime1 = '' then aTime1 := '0';
    if aTime2 = '' then aTime2 := '0';
    if aTime3 = '' then aTime3 := '0';
    if aTime4 = '' then aTime4 := '0';
    if aWeekCode = '' then aWeekCode := '0000000';

    nIndex := DeviceCardList.IndexOf(aCardNo);
    if nIndex > -1 then
    begin
      TDeviceCard(DeviceCardList.Objects[nIndex]).CARDNO := aCardNo ;
      TDeviceCard(DeviceCardList.Objects[nIndex]).PositionNum := aPositionNum;
      TDeviceCard(DeviceCardList.Objects[nIndex]).SetTimeCodeUse(aTimeCodeUse);
      TDeviceCard(DeviceCardList.Objects[nIndex]).SetTimeGroup(aTCGroup);
      TDeviceCard(DeviceCardList.Objects[nIndex]).SetTimeCode(1,aTime1);
      TDeviceCard(DeviceCardList.Objects[nIndex]).SetTimeCode(2,aTime2);
      TDeviceCard(DeviceCardList.Objects[nIndex]).SetTimeCode(3,aTime3);
      TDeviceCard(DeviceCardList.Objects[nIndex]).SetTimeCode(4,aTime4);
      TDeviceCard(DeviceCardList.Objects[nIndex]).SetWeekCode(aWeekCode);
      TDeviceCard(DeviceCardList.Objects[nIndex]).REGDATE := aRegDate ;
      TDeviceCard(DeviceCardList.Objects[nIndex]).ENDDATE := aEndDate ;
      TDeviceCard(DeviceCardList.Objects[nIndex]).EMSTATE := aEmState ;
      TDeviceCard(DeviceCardList.Objects[nIndex]).RCVACK := 'R';
      if aType = '1' then //출입문 타입이면
      begin
        TDeviceCard(DeviceCardList.Objects[nIndex]).SetDoorPermit(strtoint(aNumber),aPermit);
      end else if aType = '2' then  //방범구역이면
      begin
        TDeviceCard(DeviceCardList.Objects[nIndex]).SetArmAreaPermit(strtoint(aNumber),aPermit);
      end;
    end else
    begin
      if aCardState <> '1' then Exit; //등록 상태가 아니면 카드리스트에 등록 할 필요가 없다.

      oDeviceCard := TDeviceCard.Create(nil);
      oDeviceCard.Device := Self;
      oDeviceCard.CARDNO := aCardNo ;
      oDeviceCard.PositionNum := aPositionNum;
      oDeviceCard.SetTimeCodeUse(aTimeCodeUse);
      oDeviceCard.SetTimeGroup(aTCGroup);
      oDeviceCard.SetTimeCode(1,aTime1);
      oDeviceCard.SetTimeCode(2,aTime2);
      oDeviceCard.SetTimeCode(3,aTime3);
      oDeviceCard.SetTimeCode(4,aTime4);
      oDeviceCard.SetWeekCode(aWeekCode);
      oDeviceCard.REGDATE := aRegDate ;
      oDeviceCard.ENDDATE := aEndDate ;
      oDeviceCard.EMSTATE := aEmState ;
      oDeviceCard.RCVACK := 'R';
      if aType = '1' then //출입문 타입이면
      begin
        oDeviceCard.SetDoorPermit(strtoint(aNumber),aPermit);
      end else if aType = '2' then  //방범구역이면
      begin
        oDeviceCard.SetArmAreaPermit(strtoint(aNumber),aPermit);
      end;

      oDeviceCard.OnCardPermitChange := CardPermitChange;
      oDeviceCard.OnCardRcvAckChange := CardRcvAckChange;

      DeviceCardList.AddObject(aCardNo,oDeviceCard);
      inc(G_nDebugCardDownLoadCount);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetNodeToCardPermitSetting');
  End;
end;

procedure TDevice.SetReciveStateChange(const Value: Boolean);
begin
  Try
    if DeviceNode = nil then Exit;
    if FReciveStateChange = Value then Exit;
    FReciveStateChange := Value;
    if Value then
    begin
       TNode(DeviceNode).ReciveStateChange := True;
       if Not DeviceUse then ReciveStateChange := False; //미사용
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetReciveStateChange');
  End;
end;

procedure TDevice.SetSIRENONTIME(const Value: integer);
begin
  Try
    if FSIRENONTIME = Value then Exit;
    FSIRENONTIME := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdSIRENONTIME,TNode(DeviceNode).NO,EcuID,inttostr(Value));
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetSIRENONTIME');
  End;
end;

procedure TDevice.SetTimeCodeSkill(const Value: Boolean);
var
  stValue : string;
begin
  //if FTimeCodeSkill = Value then Exit;
  Try
    FTimeCodeSkill := Value;
    if InfoInitialize then Exit;

    if Value then stValue := '1'
    else stValue := '0';

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdTimeCodeSkill,TNode(DeviceNode).NO,EcuID,stValue);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetTimeCodeSkill');
  End;
end;

procedure TDevice.SetWATCHACPOWER(const Value: string);
begin
  Try
    if FWATCHACPOWER = Value then Exit;
    FWATCHACPOWER := Value;

    if InfoInitialize then Exit;

    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,con_DeviceCmdWATCHACPOWER,TNode(DeviceNode).NO,EcuID,Value);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.SetWATCHACPOWER');
  End;
end;


function TDevice.TimeSync(aDelay:Boolean): Boolean;
begin
  Try
    if EcuID <> '00'  then Exit; //메인이 아닌 상태에서 TimeSync 는 무의미함

    L_bDeviceResponse[con_DeviceControlTimeSync] := False;
    SendPacket('R',DeviceNode.GetSendMsgNo,DeviceNode.GetDeviceVer, 'TM00'+ FormatDatetime('yyyymmddhhnnss',Now),0);
    if aDelay then
      result := DeviceResponseCheck(con_DeviceControlTimeSync,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.TimeSync');
  End;
end;

procedure TDevice.ZONEEXTENDTYPEChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
  Try
    if Assigned(FOnZONEEXTENDTYPEChange) then
    begin
      OnZONEEXTENDTYPEChange(self,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.ZONEEXTENDTYPEChange');
  End;
end;

procedure TDevice.ZonePacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
  Try
    if Assigned(FOnZonePacketChange) then
    begin
      OnZonePacketChange(self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Device.ZonePacketChange');
  End;
end;

end.
