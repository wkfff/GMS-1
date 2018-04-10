unit uThreadSocket;

interface

uses
  System.Classes,IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdStack, IdGlobal, IdUDPClient, IdUDPBase, IdUDPServer, ExtCtrls,
  IdSocketHandle,System.Types,System.SysUtils,
  uDeviceVariable;

type
  ClientSocket = class(TThread)
  private
    CardDownLoadTimer : TTimer;
    FireRecoveryTimer : TTimer;
    FTPCardDownLoadTimer : TTimer;
    NFCheckTimer : TTimer;
    NRCheckTimer : TTimer;
    RcvCheckTimer: TTimer;
    StateCheckTimer : TTimer;
    L_cNodeRCVSTATE: Array [0..MAXNODERCVCOUNT] of char;     //수신상태
    ConnectDeviceList : TStringList;
    FTPDownEcuList : TStringList;
    NodeDeviceList : TStringList;
    NodeSendPacketTimer : TTimer;
    Send1stDataList : TStringList;
    Send2ndDataList : TStringList;
    Send3rdDataList : TStringList;
    Send4thDataList : TStringList;
    procedure AddDevice(aEcuID:string;aDeviceUse:Boolean);
    procedure ArmAreaPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure CardPermitAllLoading(Sender: TObject;  aNodeNo : integer; aData:string);
    procedure CardPermitChange(Sender: TObject;  aNodeNo : integer;aEcuID,aCardNo,aPermit,aDoorPermit,aArmAreaPermit,aTimeCodeUse,aTimeCodeGroup,aTimeData,aWeekCode:string);
    procedure CardPermitLoading(Sender: TObject;aCardNo:string);
    procedure CardRcvAckChange(Sender: TObject;  aNodeNo : integer;aEcuID,aCardNo,aRcvAck:string;aPermit:Boolean);
    procedure CardReaderPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure CurrentAlarmEvent(Sender: TObject;  aNodeNo,aECUID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                                            aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor:string);
    procedure CurrentDoorState(Sender: TObject;  aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aCardMode,aDoorMode,aDoorState,aLockState,aDoorFire:string);
    procedure DeviceCardAccessEvent(Sender: TObject; aNodeNo,aECUID,aDoorNo,aReaderNo,aInOut,aTime,aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,aATButton,aCardNo,aType,aArmAreaNo,aAntiGroup:string);
    procedure DeviceConnectedEvent(Sender: TObject; aSocketNo, aNodeNo : integer;aEcuID:string; aConnected:TConnectedState;aAntiGroupCode:string);
    procedure DevicePacketChange(Sender: TObject; aCmd, aNodeNo : integer;aEcuID:string; aData:string);
    procedure DeviceUsedEvent(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string; aUsed:Boolean);
    procedure DeviceReceiveData(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string;aRcvInfoType:integer; aData: string);
    procedure DeviceReceiveTypeChage(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string;aRcvInfoType:integer; aData: string);
    procedure DoorPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure DoorHolidaySend(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure EmployeePermitAllLoading(Sender: TObject;  aNodeNo : integer; aData:string);
    procedure NodeInformationCheck(aInformationType:integer);
    procedure NodeInformationSend(aInformationType:integer);
    procedure ZONEEXTENDTYPEChange(Sender: TObject;  aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure ZonePacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
  private
    function GetRegEcuUseData : string; //ECU 사용유무 등록
    procedure CardDownLoadTimerTimer(Sender:TObject);
    procedure FireRecoveryTimerTimer(Sender:TObject);
    procedure FTPCardDownLoadTimerTimer(Sender:TObject);
    procedure NodeSendPacketTimerTimer(Sender: TObject);
    procedure NFCheckTimerTimer(Sender: TObject);
    procedure NRCheckTimerTimer(Sender: TObject);
    procedure RcvCheckTimerTimer(Sender: TObject);
    procedure StateCheckTimerTimer(Sender:TObject);
  private
    IdTCPClient1 : TIdTCPClient;
    readTByte : TIdBytes;
    FKTTREMOTERINGCOUNTRCV: string;
    FNodeConnected: TConnectedState;
    FNodeName: string;
    FKTTCDMAUSE: string;
    FKTTCDMASKILL: Boolean;
    FDVRUSE: string;
    FDVRSKILL: Boolean;
    FOnCardReaderPacketChange: TCardReaderPacket;
    FOnCardPermitAllLoading: TNotifyReceive;
    FSocketType: integer;
    FOnDeviceUsed: TDeviceUsed;
    FNo: Integer;
    FInfoInitialize: Boolean;
    FKTTCDMARSSI: string;
    FFireEvent: Boolean;
    FARMEXTENTIONMAINTOLOCALRCV: string;
    FKTTCDMAMIN: string;
    FOnZONEEXTENDTYPEChange: TZoneExtentionPacket;
    FOnReceiveData: TReceiveTypeChange;
    FFIREGUBUNCODE: string;
    FARMEXTENTIONGUBUN: string;
    FOnRcvInvalidDevice: TNotifyReceive;
    FOnArmAreaPacketChange: TArmAreaPacket;
    FKTTREMOTEARMRINGCOUNT: integer;
    FOnReceiveTypeChage: TReceiveTypeChange;
    FOnCardPermitChange: TCardPermitPacket;
    FDoorArmAreaStateRCV: Boolean;
    FKTTCDMAPORT: string;
    FDVRPORT: string;
    FARMEXTENTIONMAINTOLOCAL: string;
    FOnZonePacketChange: TZonePacket;
    FOnCardPermitLoading: TCardPermitLoading;
    FKTTCDMACHECKTIME: string;
    FReciveStateChange: Boolean;
    FECUUSERCV: string;
    FOnEmployeePermitAllLoading: TNotifyReceive;
    FOnAutoDownLoadStart: TNotifyReceive;
    FNodePort: integer;
    FLastNetworkState: string;
    FKTTTELNUMBER2: string;
    FKTTREMOTEDISARMRINGCOUNT: integer;
    FKTTCDMAMUX: string;
    FOnDeviceConnected: TDeviceConnect;
    FARMEXTENTIONMAINFROMLOCALRCV: string;
    FOnCurrentAlarmEvent: TAlarmEvent;
    FKTTSYSTEMIDRCV: string;
    FKTTTELNUMBERRCV: string;
    FKTTCDMADATARCV: string;
    FDVRDATARCV: string;
    FKTTTELNUMBER1: string;
    FOnDoorPacketChange: TDoorPacket;
    FOnCardRcvAckChange: TCardRcvPacket;
    FCardDownLoadStart: Boolean;
    FOnDeviceNodeServerPacketChange: TDeviceNodeServerPacket;
    FOnDeviceCardAccessEvent: TDeviceCardAccessEvent;
    FKTTCDMAIP: string;
    FDVRIP: string;
    FOnSendData: TNotifyReceive;
    FOnDevicePacketChange: TDevicePacket;
    FOnAntiPassDataEvent: TAntiPassEvent;
    FARMEXTENTIONMAINFROMLOCAL: string;
    FKTTSYSTEMID: string;
    FNODEIP: string;
    FDeviceID: string;
    FKTTCDMAUSERCV: string;
    FDVRUSERCV: string;
    FSocketOpen: Boolean;
    FLastReceiveTime: TDateTime;
    FOnDoorHolidaySend: TDoorPacket;
    FARMEXTENTIONSKILL: Boolean;
    FOnRcvData: TNotifyReceive;
    FOnNodePacket: TNodePacket;
    FOnCurrentDoorState: TDoorStatePacket;
    FMaxEcuCount: integer;
    FNodeDestory: Boolean;
    FWinSocket: integer;
    { Private declarations }
    procedure SetARMEXTENTIONGUBUN(const Value: string);
    procedure SetARMEXTENTIONMAINFROMLOCAL(const Value: string);
    procedure SetARMEXTENTIONMAINFROMLOCALRCV(const Value: string);
    procedure SetARMEXTENTIONMAINTOLOCAL(const Value: string);
    procedure SetARMEXTENTIONMAINTOLOCALRCV(const Value: string);
    procedure SetARMEXTENTIONSKILL(const Value: Boolean);
    procedure SetCardDownLoadStart(const Value: Boolean);
    procedure SetDeviceID(const Value: string);
    procedure SetDoorArmAreaStateRCV(const Value: Boolean);
    procedure SetDVRDATARCV(const Value: string);
    procedure SetDVRIP(const Value: string);
    procedure SetDVRPORT(const Value: string);
    procedure SetDVRSKILL(const Value: Boolean);
    procedure SetDVRUSE(const Value: string);
    procedure SetDVRUSERCV(const Value: string);
    procedure SetECUUSERCV(const Value: string);
    procedure SetFireEvent(const Value: Boolean);
    procedure SetFIREGUBUNCODE(const Value: string);
    procedure SetKTTCDMACHECKTIME(const Value: string);
    procedure SetKTTCDMADATARCV(const Value: string);
    procedure SetKTTCDMAIP(const Value: string);
    procedure SetKTTCDMAMIN(const Value: string);
    procedure SetKTTCDMAMUX(const Value: string);
    procedure SetKTTCDMAPORT(const Value: string);
    procedure SetKTTCDMARSSI(const Value: string);
    procedure SetKTTCDMASKILL(const Value: Boolean);
    procedure SetKTTCDMAUSE(const Value: string);
    procedure SetKTTCDMAUSERCV(const Value: string);
    procedure SetKTTREMOTEARMRINGCOUNT(const Value: integer);
    procedure SetKTTREMOTEDISARMRINGCOUNT(const Value: integer);
    procedure SetKTTREMOTERINGCOUNTRCV(const Value: string);
    procedure SetKTTSYSTEMID(const Value: string);
    procedure SetKTTSYSTEMIDRCV(const Value: string);
    procedure SetKTTTELNUMBER1(const Value: string);
    procedure SetKTTTELNUMBER2(const Value: string);
    procedure SetKTTTELNUMBERRCV(const Value: string);
    procedure SetLastNetworkState(const Value: string);
    procedure SetNo(const Value: Integer);
    procedure SetNodeConnected(const Value: TConnectedState);
    procedure SetReciveStateChange(const Value: Boolean);
    procedure SetSocketOpen(const Value: Boolean);
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure TCPClientConnected(Sender: TObject);
    procedure TCPClientStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);

    function  ECUConnected(aECUID:string;aConnected:TConnectedState):Boolean;
    function  ECUUsed(aECUID:string;aUsed:Boolean):Boolean;
    Function  NodeDataPacketProcess(aPacketData:RawByteString):Boolean;
    procedure NodeDataReadingProcessing;
    function  PutString(aData:string):Boolean;
    Procedure SendPacket(aEcuId: String;aCmd:Char;aMsgNo:char;aDeviceVer, aData: String;aPriority:integer=0);
    procedure SocketError(Sender: TObject; SocketError: Integer);
    procedure SocketReceive(Sender: TObject; Buf: TIdBytes;var DataLen: Integer);
  public
    function GetDeviceDoorArmaAreaState(aEcuID:string):string;
    function GetDeviceIDArmAreaInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDCardReaderInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDDoorInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDExtentionInformation(aCmd:integer;aEcuID,aSubNo:string):string;
    function GetDeviceIDInformation(aCmd:integer;aEcuID:string):string;  //ECU 정보
    function GetDeviceIDSubInformation(aSubType,aCmd:integer;aEcuID,aSubNo:string):string;  // 정보
    function GetDeviceIDZoneInformation(aCmd:integer;aEcuID,aZoneID:string):string;
    function GetDeviceIndexArmAreaInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexCardReaderInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexDoorInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexExtentionInformation(aCmd,aIndex,aSubIndex:integer):string;
    function GetDeviceIndexInformation(aCmd,aIndex:integer):string;  //ECU 정보
    function GetDeviceIndexSubInformation(aSubType,aCmd,aIndex,aSubIndex:integer):string;  //기기정보
    function GetDeviceIndexZoneInformation(aCmd,aEcuIndex,aExtentionIndex,aZoneNo:integer):string;  //기기정보
    function GetDeviceVer:string;
    function GetNodeIndexInformation(aCmd:integer):string;  //ECU 정보
    function GetSendMsgNo:char;
    function SetDeviceHoliday(aEcuID,aDay,aValue:string):Boolean;
    function SetDeviceIDInformation(aCmd:integer;aEcuID,aValue:string):Boolean;
    function SetDeviceIDSubInformation(aSubType,aCmd:integer;aEcuID,aSubNo,aValue:string):Boolean;  //기기정보
    function SetDeviceRcvIDInformation(aCmd:integer;aEcuID,aValue:string):Boolean;
    function SetDeviceRcvIDSubInformation(aSubType,aCmd:integer;aEcuID,aSubNo,aValue:string):Boolean;  //기기정보
    function SetHolidayClear:Boolean;
    function SetNodeIndexInformation(aCmd,aIndex:integer;aValue:string):string;  //ECU 정보
    procedure SetNodeToCardPermitExcute(aEcuID,aCardNo,aRcvAck:string);
    procedure SetNodeToCardPermitSetting(aEcuID,aExtendID,aCardNo,aPermit,aCardState,aType,aNumber,
          aPositionNum,aTimeCodeUse,aTCGroup,aTime1,aTime2,aTime3,aTime4,aWeekCode,aRegDate,aEndDate,aEmState:string);
    //컨트롤러 초기셋팅
    procedure SetNodeToCardPermitInitialize(aEcuID,aExtendID,aCardNo,aCardPermit,aCardState,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
            aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8,aRcvAck,aPositionNum,
            aTimeCodeUse,aTCGroup,aTime1,aTime2,aTime3,aTime4,aTCWeekCode,aRegDate,aEndDate,aEmState:string);
    procedure ControlNodeToDeviceRegDeviceID(aDeviceID:string);  //컨트롤러 ID 셋팅
  public
    procedure ServerSocketClose;
    //Server Socket
    procedure ServerSocketRead;
  public
    //제어
    procedure DeviceCardSort;
    procedure ControlNodeToDeviceArmAreaStateCheck(aEcuID,aArmAreaNo :string); //방범구역 상태 재전송
    procedure ControlNodeToDeviceCardResend(aEcuID :string); //컨트롤러 카드 재전송
    procedure ControlNodeToDeviceReset(aEcuID:string);   //컨트롤러리셋
    procedure ControlNodeToDeviceTimeSync;               //컨트롤러 시간 동기화
    procedure FireDoorOpen(aFireGubunCode:string);
    procedure FireRecovery;

  published
    property LastReceiveTime : TDateTime read FLastReceiveTime write FLastReceiveTime;
    property NodeConnected : TConnectedState read FNodeConnected write SetNodeConnected;
    property NodeDestory : Boolean read FNodeDestory write FNodeDestory;
    property SocketOpen : Boolean read FSocketOpen write SetSocketOpen;
  published
    //설정 프로그램 정보
    property ARMEXTENTIONGUBUN : string read FARMEXTENTIONGUBUN write SetARMEXTENTIONGUBUN;
    property ARMEXTENTIONMAINFROMLOCAL : string read FARMEXTENTIONMAINFROMLOCAL write SetARMEXTENTIONMAINFROMLOCAL;
    property ARMEXTENTIONMAINTOLOCAL : string read FARMEXTENTIONMAINTOLOCAL write SetARMEXTENTIONMAINTOLOCAL;
    property ARMEXTENTIONSKILL : Boolean read FARMEXTENTIONSKILL write SetARMEXTENTIONSKILL;
    property DVRIP : string read FDVRIP write SetDVRIP; //DVR IP
    property DVRPORT : string read FDVRPORT write SetDVRPORT; //DVR Port
    property DVRSKILL : Boolean read FDVRSKILL write SetDVRSKILL;   //DVR 기능 유무
    property DVRUSE : string read FDVRUSE write SetDVRUSE; //DVR 사용 유무 0.미사용,1.사용
    property FIREGUBUNCODE : string read FFIREGUBUNCODE write SetFIREGUBUNCODE; //화재그룹코드
    property FireEvent : Boolean read FFireEvent write SetFireEvent;
    property KTTCDMACHECKTIME : string read FKTTCDMACHECKTIME write SetKTTCDMACHECKTIME; //CDMA check time
    property KTTCDMAMIN : string read FKTTCDMAMIN write SetKTTCDMAMIN;
    property KTTCDMAMUX : string read FKTTCDMAMUX write SetKTTCDMAMUX;
    property KTTCDMAIP : string read FKTTCDMAIP write SetKTTCDMAIP;     //CDMA IP
    property KTTCDMAPORT : string read FKTTCDMAPORT write SetKTTCDMAPORT; //CDMA Port
    property KTTCDMARSSI : string read FKTTCDMARSSI write SetKTTCDMARSSI; //CDMA rssi
    property KTTCDMASKILL : Boolean read FKTTCDMASKILL write SetKTTCDMASKILL;   //CDMA 기능 유무
    property KTTCDMAUSE : string read FKTTCDMAUSE write SetKTTCDMAUSE; //CDMA 사용 유무 0.미사용,1.사용
    property KTTREMOTEARMRINGCOUNT : integer read FKTTREMOTEARMRINGCOUNT write SetKTTREMOTEARMRINGCOUNT;  //원격경계시 링횟수
    property KTTREMOTEDISARMRINGCOUNT : integer read FKTTREMOTEDISARMRINGCOUNT write SetKTTREMOTEDISARMRINGCOUNT;  //원격해제시 링횟수
    property KTTSYSTEMID : string read FKTTSYSTEMID write SetKTTSYSTEMID;  //관제 시스템 아이디
    property KTTTELNUMBER1 : string read FKTTTELNUMBER1 write SetKTTTELNUMBER1;  //관제 데코더 전화번호1
    property KTTTELNUMBER2 : string read FKTTTELNUMBER2 write SetKTTTELNUMBER2;  //관제 데코더 전화번호2
    property MaxEcuCount : integer read FMaxEcuCount write FMaxEcuCount;
  published
    //수신상태 정보
    property ARMEXTENTIONMAINTOLOCALRCV : string read FARMEXTENTIONMAINTOLOCALRCV write SetARMEXTENTIONMAINTOLOCALRCV;
    property ARMEXTENTIONMAINFROMLOCALRCV : string read FARMEXTENTIONMAINFROMLOCALRCV write SetARMEXTENTIONMAINFROMLOCALRCV;
    property CardDownLoadStart : Boolean Read FCardDownLoadStart write SetCardDownLoadStart;
    property DVRDATARCV : string read FDVRDATARCV write SetDVRDATARCV; //DVR IP
    property DVRUSERCV : string read FDVRUSERCV write SetDVRUSERCV; //DVR 사용 유무 0.미사용,1.사용
    property DoorArmAreaStateRCV : Boolean read FDoorArmAreaStateRCV write SetDoorArmAreaStateRCV;
    property ECUUSERCV : string read FECUUSERCV write SetECUUSERCV;  //ECU 사용유무 설정
    property KTTCDMADATARCV : string read FKTTCDMADATARCV write SetKTTCDMADATARCV;     //CDMA DATA
    property KTTCDMAUSERCV : string read FKTTCDMAUSERCV write SetKTTCDMAUSERCV; //CDMA 사용 유무 0.미사용,1.사용
    property KTTREMOTERINGCOUNTRCV : string read FKTTREMOTERINGCOUNTRCV write SetKTTREMOTERINGCOUNTRCV;  //원격경계시 링횟수
    property KTTSYSTEMIDRCV : string read FKTTSYSTEMIDRCV write SetKTTSYSTEMIDRCV;  //관제 시스템 아이디
    property KTTTELNUMBERRCV : string read FKTTTELNUMBERRCV write SetKTTTELNUMBERRCV;  //관제 데코더 전화번호1

    property ReciveStateChange : Boolean read FReciveStateChange write SetReciveStateChange; //수신 상태 변경 여부
  published
    Property DeviceID:string Read FDeviceID write SetDeviceID;   //노드 아이디 7자리
    property InfoInitialize : Boolean Read FInfoInitialize write FInfoInitialize;
    property LastNetworkState:string Read FLastNetworkState write SetLastNetworkState;
    Property No: Integer Read FNo write SetNo;
    property NodeName : string read FNodeName write FNodeName;
    property NODEIP : string Read FNODEIP write FNODEIP;
    property NodePort : integer Read FNodePort Write FNodePort;
    property SocketType : integer read FSocketType write FSocketType;  //소켓 타입 1.PC -> 기기,2.PC <- 기기
    property WinSocket : integer read FWinSocket write FWinSocket;
  published
    //AntiPass 이벤트
    property OnAntiPassDataEvent : TAntiPassEvent read FOnAntiPassDataEvent write FOnAntiPassDataEvent;               //데이터 수신
    //노드 이벤트
    property OnArmAreaPacketChange : TArmAreaPacket read FOnArmAreaPacketChange write FOnArmAreaPacketChange;
    property OnAutoDownLoadStart : TNotifyReceive read FOnAutoDownLoadStart write FOnAutoDownLoadStart;
    //카드데이터 이벤트 발생
    property OnCardPermitAllLoading: TNotifyReceive read FOnCardPermitAllLoading write FOnCardPermitAllLoading;
    property OnCardPermitChange : TCardPermitPacket read FOnCardPermitChange write FOnCardPermitChange;
    property OnCardPermitLoading : TCardPermitLoading read FOnCardPermitLoading write FOnCardPermitLoading;
    property OnCardRcvAckChange : TCardRcvPacket read FOnCardRcvAckChange write FOnCardRcvAckChange;
    property OnCardReaderPacketChange : TCardReaderPacket read FOnCardReaderPacketChange write FOnCardReaderPacketChange;
    property OnCurrentAlarmEvent: TAlarmEvent read FOnCurrentAlarmEvent write FOnCurrentAlarmEvent;
    property OnCurrentDoorState : TDoorStatePacket read FOnCurrentDoorState write FOnCurrentDoorState;
    property OnDeviceCardAccessEvent : TDeviceCardAccessEvent read FOnDeviceCardAccessEvent write FOnDeviceCardAccessEvent;
    ProPerty OnDeviceConnected : TDeviceConnect read FOnDeviceConnected Write FOnDeviceConnected;
    property OnDeviceNodeServerPacketChange : TDeviceNodeServerPacket read FOnDeviceNodeServerPacketChange write FOnDeviceNodeServerPacketChange;
    property OnDevicePacketChange : TDevicePacket read FOnDevicePacketChange write FOnDevicePacketChange;
    ProPerty OnDeviceUsed : TDeviceUsed read FOnDeviceUsed Write FOnDeviceUsed;
    property OnDoorPacketChange:TDoorPacket read FOnDoorPacketChange write FOnDoorPacketChange;
    property OnDoorHolidaySend:TDoorPacket read FOnDoorHolidaySend write FOnDoorHolidaySend;
    property OnEmployeePermitAllLoading: TNotifyReceive read FOnEmployeePermitAllLoading write FOnEmployeePermitAllLoading;
    property OnNodePacket : TNodePacket read FOnNodePacket write FOnNodePacket;
    ProPerty OnRcvData : TNotifyReceive read FOnRcvData write FOnRcvData;
    ProPerty OnRcvInvalidDevice: TNotifyReceive read FOnRcvInvalidDevice write FOnRcvInvalidDevice;
    property OnReceiveData : TReceiveTypeChange read FOnReceiveData write FOnReceiveData;                //데이터 수신
    property OnReceiveTypeChage : TReceiveTypeChange read FOnReceiveTypeChage write FOnReceiveTypeChage; //수신상태 변경
    ProPerty OnSendData : TNotifyReceive read FOnSendData write FOnSendData;
    property OnZONEEXTENDTYPEChange :TZoneExtentionPacket read FOnZONEEXTENDTYPEChange write FOnZONEEXTENDTYPEChange;
    property OnZonePacketChange : TZonePacket read FOnZonePacketChange write FOnZonePacketChange;
  end;

implementation
uses
  uAlarmEventStateCode,
  uCommonFunction,
  uCommonVariable,
  uDevice,
  uDevicePacket;

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure ClientSocket.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; 
    
    or 
    
    Synchronize( 
      procedure 
      begin
        Form1.Caption := 'Updated in thread via an anonymous method' 
      end
      )
    );
    
  where an anonymous method is passed.
  
  Similarly, the developer can call the Queue method with similar parameters as 
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.
    
}

{ ClientSocket }

procedure ClientSocket.AddDevice(aEcuID: string; aDeviceUse: Boolean);
var
  oDevice : TDevice;
  nIndex : integer;
begin
  nIndex := NodeDeviceList.IndexOf(aEcuID);
  if nIndex < 0 then
  begin
    oDevice := TDevice.Create(nil);
    oDevice.DeviceNode := self;
    oDevice.EcuID := aEcuID;
    oDevice.DeviceUse := aDeviceUse;
    oDevice.OnArmAreaPacketChange := ArmAreaPacketChange;
    oDevice.OnCardPermitChange := CardPermitChange;
    ODevice.OnCardPermitLoading := CardPermitLoading;
    oDevice.OnCardRcvAckChange := CardRcvAckChange;
    oDevice.OnCardReaderPacketChange := CardReaderPacketChange;
    oDevice.OnCardPermit := CardPermitAllLoading; //컨트롤러의 카드권한을 모두 로딩 하자.
    oDevice.OnCurrentAlarmEvent := CurrentAlarmEvent;
    oDevice.OnCurrentDoorState  := CurrentDoorState;
    oDevice.OnDeviceCardAccessEvent := DeviceCardAccessEvent;
    oDevice.OnDeviceConnected := DeviceConnectedEvent;
    oDevice.OnDevicePacketChange := DevicePacketChange;
    oDevice.OnDeviceUsed := DeviceUsedEvent;
    oDevice.OnDeviceReceiveDataEvent := DeviceReceiveData;
    oDevice.OnDoorPacketChange := DoorPacketChange;
    oDevice.OnDoorHolidaySend := DoorHolidaySend;
    oDevice.OnEmployeePermit := EmployeePermitAllLoading; //컨트롤러의 사원권한을 모두 로딩하자.
    oDevice.OnReceiveTypeChage := DeviceReceiveTypeChage;
    oDevice.OnZONEEXTENDTYPEChange := ZONEEXTENDTYPEChange;
    oDevice.OnZonePacketChange := ZonePacketChange;

    NodeDeviceList.AddObject(aEcuID,oDevice);
  end else
  begin
    TDevice(NodeDeviceList.objects[nIndex]).DeviceUse := aDeviceUse;
  end;
end;

procedure ClientSocket.ArmAreaPacketChange(Sender: TObject; aCmd,
  aNodeNo: integer; aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnArmAreaPacketChange) then
  begin
    OnArmAreaPacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;
end;

procedure ClientSocket.CardDownLoadTimerTimer(Sender: TObject);
var
  i : integer;
  bResult : Boolean;
begin
  if G_bApplicationTerminate then Exit;

  if G_bCardDownLoading[NO] then Exit;
  if NodeDestory then Exit;
  CardDownLoadTimer.Enabled := False;
  Try
    G_bCardDownLoading[NO] := True;
    //여기서 카드데이터 다운로드 하자.
    if G_nCardDownLoadEcuSeq[NO] > NodeDeviceList.Count - 1 then G_nCardDownLoadEcuSeq[NO] := 0;

    Try
      for i := G_nCardDownLoadEcuSeq[NO] to NodeDeviceList.Count - 1 do
      begin
        if NodeDestory then Exit;
        if (TDevice(NodeDeviceList.Objects[i]).DEVICECONNECTED = csConnected) and Not TDevice(NodeDeviceList.Objects[i]).CardDownloadRCV then
        begin
          TDevice(NodeDeviceList.Objects[i]).AutoCardDownloadStart;
          if NodeDestory then Exit;
          if Assigned(FOnAutoDownLoadStart) then
            OnAutoDownLoadStart(self,NO,TDevice(NodeDeviceList.Objects[i]).EcuId + ' CardDownLoad Start ');

          break;
        end else G_nCardDownLoadEcuSeq[NO] := i;
      end;

      if G_nCardDownLoadEcuSeq[NO] = NodeDeviceList.Count - 1 then
      begin
        bResult := True;
        for i := 0 to NodeDeviceList.Count - 1 do
        begin
          if NodeDestory then Exit;
          if Not TDevice(NodeDeviceList.Objects[i]).CardDownloadRCV then //다운로드 되지 않은 컨트롤러가 있으면
          begin
            bResult := False;
            break;
          end;
        end;
        //if bResult then CardDownLoadTimer.Enabled := False;  //전체 다운로드 완료시 타이머 스톱
      end;
      G_nCardDownLoadEcuSeq[NO] := G_nCardDownLoadEcuSeq[NO] + 1;
    Except
      G_nCardDownLoadEcuSeq[NO] := G_nCardDownLoadEcuSeq[NO] + 1;
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.CardDownLoadTimerTimer');
    End;
  Finally
    CardDownLoadTimer.Enabled := Not G_bApplicationTerminate;
    G_bCardDownLoading[NO] := False;
  End;
end;

procedure ClientSocket.CardPermitAllLoading(Sender: TObject; aNodeNo: integer;
  aData: string);
begin
  if Assigned(FOnCardPermitAllLoading) then
  begin
    OnCardPermitAllLoading(Self,aNodeNo,aData);
  end;
end;

procedure ClientSocket.CardPermitChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aCardNo, aPermit, aDoorPermit, aArmAreaPermit, aTimeCodeUse,
  aTimeCodeGroup, aTimeData, aWeekCode: string);
begin
  if Assigned(FOnCardPermitChange) then
  begin
    OnCardPermitChange(Self,aNodeNo,aEcuID,aCardNo,aPermit,aDoorPermit,aArmAreaPermit,aTimeCodeUse,aTimeCodeGroup,aTimeData,aWeekCode);
  end;
end;

procedure ClientSocket.CardPermitLoading(Sender: TObject; aCardNo: string);
begin
  if Assigned(FOnCardPermitLoading) then
  begin
    OnCardPermitLoading(Self,aCardNo);
  end;
end;

procedure ClientSocket.CardRcvAckChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aCardNo, aRcvAck: string; aPermit: Boolean);
begin
  if Assigned(FOnCardRcvAckChange) then
  begin
    OnCardRcvAckChange(Self,aNodeNo,aEcuID,aCardNo,aRcvAck,aPermit);
  end;
end;

procedure ClientSocket.CardReaderPacketChange(Sender: TObject; aCmd,
  aNodeNo: integer; aEcuID, aExtendID, aNumber, aData: string);
begin
    if Assigned(FOnCardReaderPacketChange) then
    begin
      OnCardReaderPacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;
end;

procedure ClientSocket.ControlNodeToDeviceArmAreaStateCheck(aEcuID,
  aArmAreaNo: string);
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    if Not isDigit(aArmAreaNo) then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).DeviceArmAreaStateCheck(strtoint(aArmAreaNo));
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceArmAreaStateCheck');
  End;
end;

procedure ClientSocket.ControlNodeToDeviceCardResend(aEcuID: string);
var
  nIndex : integer;
begin
  Try
    nIndex := FTPDownEcuList.IndexOf(aEcuID);
    if nIndex > -1 then Exit;
    FTPDownEcuList.Add(aEcuID);
    FTPCardDownLoadTimer.Enabled := True;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceArmAreaStateCheck');
  End;
end;

procedure ClientSocket.ControlNodeToDeviceRegDeviceID(aDeviceID: string);
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf('00'); //메인만 해당 하는것임
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceID(aDeviceID);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceRegDeviceID');
  End;
end;

procedure ClientSocket.ControlNodeToDeviceReset(aEcuID: string);
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).DeviceReset;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceReset');
  End;
end;

procedure ClientSocket.ControlNodeToDeviceTimeSync;
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf('00');
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).TimeSync;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ControlNodeToDeviceTimeSync');
  End;
end;

constructor ClientSocket.Create;
var
  i : integer;
begin
  NodeDestory := False;
  WinSocket := 0;

  IdTCPClient1 := TIdTCPClient.Create(nil);
  IdTCPClient1.OnConnected := TCPClientConnected;
  IdTCPClient1.OnStatus := TCPClientStatus;


  NodeDeviceList := TStringList.Create;
  ConnectDeviceList := TStringList.Create;

  Send1stDataList := TStringList.Create;
  Send2ndDataList := TStringList.Create;
  Send3rdDataList := TStringList.Create;
  Send4thDataList := TStringList.Create;

  FTPDownEcuList := TStringList.Create;

  CardDownLoadTimer := TTimer.Create(nil);
  CardDownLoadTimer.Interval := 500;
  CardDownLoadTimer.OnTimer := CardDownLoadTimerTimer;
  CardDownLoadTimer.Enabled := False;

  FireRecoveryTimer := TTimer.Create(nil);
  FireRecoveryTimer.Interval := 10000;
  FireRecoveryTimer.OnTimer := FireRecoveryTimerTimer;
  FireRecoveryTimer.Enabled := False;
  G_bFireEvent[NO] := False;

  FTPCardDownLoadTimer := TTimer.Create(nil);
  FTPCardDownLoadTimer.Interval := 10000;
  FTPCardDownLoadTimer.OnTimer := FTPCardDownLoadTimerTimer;
  FTPCardDownLoadTimer.Enabled := False;

  NodeSendPacketTimer := TTimer.Create(nil);
  NodeSendPacketTimer.Interval := 20;
  NodeSendPacketTimer.OnTimer := NodeSendPacketTimerTimer;
  NodeSendPacketTimer.Enabled := False;

  NRCheckTimer := TTimer.Create(nil);
  NRCheckTimer.Interval := 60000;
  NRCheckTimer.OnTimer := NRCheckTimerTimer;
  NRCheckTimer.Enabled := False;

  NFCheckTimer := TTimer.Create(nil);
  NFCheckTimer.Interval := 60000;
  NFCheckTimer.OnTimer := NFCheckTimerTimer;
  NFCheckTimer.Enabled := False;

  RcvCheckTimer := TTimer.Create(nil);
  RcvCheckTimer.Interval := 20000;
  RcvCheckTimer.OnTimer := RcvCheckTimerTimer;
  RcvCheckTimer.Enabled := False;

  StateCheckTimer := TTimer.Create(nil);
  StateCheckTimer.Interval := 5000;
  StateCheckTimer.OnTimer := StateCheckTimerTimer;
  StateCheckTimer.Enabled := False;

  G_nSendMsgNo[NO] := 0;
  for i := 0 to HIGH(L_cNodeRCVSTATE) do
  begin
    L_cNodeRCVSTATE[i] := 'Y';
  end;
  AddDevice(FillZeroNumber(0,2),True);  //기기 추가는 가장 마지막에 하자...

(*  for i := 0 to 63 do
  begin
    AddDevice(FillZeroNumber(i,2),True);  //기기 추가는 가장 마지막에 하자...
  end;  *)

  if G_nMonitoringType = 1 then ECUUSERCV := 'Y'
  else ECUUSERCV := 'N';
  FreeOnTerminate := False;
  inherited Create( True );
end;

procedure ClientSocket.CurrentAlarmEvent(Sender: TObject; aNodeNo, aECUID, aCmd,
  aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string);
begin
  if (aZoneState <> 'N') and (aAlarmStateCode = G_stFireStateCode) then
  begin
    FireRecoveryTimer.Enabled := False;
    G_bFireEvent[NO] := True;
  end;

  if Assigned(FOnCurrentAlarmEvent) then
  begin
    OnCurrentAlarmEvent(Self,aNodeNo,aECUID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                        aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor);
  end;
end;

procedure ClientSocket.CurrentDoorState(Sender: TObject; aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aCardMode, aDoorMode, aDoorState, aLockState,
  aDoorFire: string);
begin
  if Assigned(FOnCurrentDoorState) then
  begin
    OnCurrentDoorState(self,aNodeNo,aEcuID,aExtendID,aNumber, aCardMode, aDoorMode, aDoorState, aLockState,aDoorFire);
  end;
end;

destructor ClientSocket.Destroy;
var
  i : integer;
begin
  NodeDestory := True;

  ConnectDeviceList.free;
  if NodeDeviceList.count > 0 then
  begin
    for i := 0 to NodeDeviceList.count - 1 do
      TDevice(NodeDeviceList.objects[i]).free;
  end;

  CardDownLoadTimer.Enabled := False;
  FireRecoveryTimer.Enabled := False;
  FTPCardDownLoadTimer.Enabled := False;
  NodeSendPacketTimer.Enabled := False;
  RcvCheckTimer.Enabled := False;
  StateCheckTimer.Enabled := False;
  NFCheckTimer.enabled := False;
  NRCheckTimer.enabled := False;

  CardDownLoadTimer.Free;
  FireRecoveryTimer.Free;
  FTPCardDownLoadTimer.Free;
  NodeSendPacketTimer.Free;
  RcvCheckTimer.Free;
  StateCheckTimer.Free;
  NFCheckTimer.free;
  NRCheckTimer.free;

  NodeDeviceList.Free;
  Send1stDataList.Free;
  Send2ndDataList.Free;
  Send3rdDataList.Free;
  Send4thDataList.Free;

  FTPDownEcuList.Free;
  IdTCPClient1.Free;
  inherited;
end;

procedure ClientSocket.DeviceCardAccessEvent(Sender: TObject; aNodeNo, aECUID,
  aDoorNo, aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aDoorState, aATButton, aCardNo, aType, aArmAreaNo,
  aAntiGroup: string);
begin
    if Assigned(FOnDeviceCardAccessEvent) then
    begin
      OnDeviceCardAccessEvent(Self,aNodeNo, aECUID, aDoorNo,aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
                    aDoorState, aATButton, aCardNo, aType, aArmAreaNo,aAntiGroup);
    end;
end;

procedure ClientSocket.DeviceCardSort;
begin
  SendPacket('00','R',GetSendMsgNo,GetDeviceVer, 'SM2699Rst0000',1); //카드 소트 전송
end;

procedure ClientSocket.DeviceConnectedEvent(Sender: TObject; aSocketNo,
  aNodeNo: integer; aEcuID: string; aConnected: TConnectedState;
  aAntiGroupCode: string);
begin
    ECUConnected(aEcuID,aConnected);
    if Assigned(FOnDeviceConnected) then
    begin
      OnDeviceConnected(Self,aSocketNo,aNodeNo,aEcuID,aConnected,aAntiGroupCode);
    end;
end;

procedure ClientSocket.DevicePacketChange(Sender: TObject; aCmd,
  aNodeNo: integer; aEcuID, aData: string);
begin
    if Assigned(FOnDevicePacketChange) then
    begin
      OnDevicePacketChange(Self,aCmd,aNodeNo,aEcuID,aData);
    end;

end;

procedure ClientSocket.DeviceReceiveData(Sender: TObject; aNodeNo: integer;
  aType, aEcuID, aExtendID, aNumber: string; aRcvInfoType: integer;
  aData: string);
var
  i : integer;
  nIndex : integer;
begin
  Try
    if aType = 'DEVICE' then
    begin
      case aRcvInfoType of
        con_DeviceCmdNetworkState :
        begin //네트웍 상태 체크중
          for i := 1 to Length(aData) do
          begin
            nIndex := NodeDeviceList.IndexOf(FillZeroNumber(i-1,2));
            if nIndex > -1 then
            begin
              if aData[i] = 'u' then
              begin
                //TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := False;   //사용유무 체크 하여 설정 하자.
                TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := csNothing;
              end else
              begin
                //TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := True;
                if aData[i] = '1' then
                  TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := csConnected
                else TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := csDisConnected;
              end;
            end else
            begin
              if aData[i] = '0' then
              begin
                AddDevice(FillZeroNumber(i-1,2),True);
                nIndex := NodeDeviceList.IndexOf(FillZeroNumber(i-1,2));
                if nIndex > -1 then
                begin
                  TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := csDisConnected;
                end;
              end else if aData[i] = '1' then
              begin
                AddDevice(FillZeroNumber(i-1,2),True);
                nIndex := NodeDeviceList.IndexOf(FillZeroNumber(i-1,2));
                if nIndex > -1 then
                begin
                  TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := csConnected;
                end;
              end;
            end;
          end;
        end;
        con_DeviceCmdUseState :  //Ecu 사용유무 체크중...
        begin
          for i := 2 to Length(aData) do
          begin
            nIndex := NodeDeviceList.IndexOf(FillZeroNumber(i-1,2));
            if nIndex > -1 then
            begin
              if aData[i] = '1' then
              begin
                TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := True;
              end else
              begin
                TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := False;
              end;
            end else
            begin
              if aData[i] = '1' then AddDevice(FillZeroNumber(i-1,2),True);
            end;
          end;
        end;
      end;
    end;
    if Assigned(FOnReceiveData) then
    begin
      OnReceiveData(Self,aNodeNo,aType,aEcuID,aExtendID,aNumber,aRcvInfoType,aData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.DeviceReceiveData');
  End;
end;

procedure ClientSocket.DeviceReceiveTypeChage(Sender: TObject; aNodeNo: integer;
  aType, aEcuID, aExtendID, aNumber: string; aRcvInfoType: integer;
  aData: string);
begin
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,aNodeNo,aType,aEcuID,aExtendID,aNumber,aRcvInfoType,aData);
  end;
end;

procedure ClientSocket.DeviceUsedEvent(Sender: TObject; aNodeNo: integer; aType,
  aEcuID, aExtendID, aNumber: string; aUsed: Boolean);
begin
  if Assigned(FOnDeviceUsed) then
  begin
    OnDeviceUsed(Self,aNodeNo,aType,aEcuID,aExtendID,aNumber,aUsed);
  end;
end;

procedure ClientSocket.DoorHolidaySend(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnDoorHolidaySend) then
  begin
    OnDoorHolidaySend(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;
end;

procedure ClientSocket.DoorPacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
    if Assigned(FOnDoorPacketChange) then
    begin
      OnDoorPacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;
end;

function ClientSocket.ECUConnected(aECUID: string;
  aConnected: TConnectedState): Boolean;
var
  nIndex : integer;
begin
  result := True;
  Try
    if (aConnected = csConnected) then
    begin
      if ConnectDeviceList.IndexOf(aEcuID) < 0 then
      begin
        ConnectDeviceList.Add(aEcuID);
        DoorArmAreaStateRCV := False;
      end;
    end else
    begin
      if ConnectDeviceList.IndexOf(aEcuID) > -1 then ConnectDeviceList.Delete(ConnectDeviceList.IndexOf(aEcuID));
    end;

    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then
    begin
      AddDevice(aEcuID,True);
      nIndex := NodeDeviceList.IndexOf(aEcuID);
    end;
    if TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected = aConnected then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).DeviceConnected := aConnected;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ECUConnected');
  End;
end;

function ClientSocket.ECUUsed(aECUID: string; aUsed: Boolean): Boolean;
var
  nIndex : integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    if TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse = aUsed then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := aUsed;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.ECUUsed');
  End;
end;

procedure ClientSocket.EmployeePermitAllLoading(Sender: TObject;
  aNodeNo: integer; aData: string);
begin
  if Assigned(FOnEmployeePermitAllLoading) then
  begin
    OnEmployeePermitAllLoading(Self,aNodeNo,aData);
  end;
end;

procedure ClientSocket.Execute;
var
  nlen : integer ;
  i : integer;
begin
  { Place thread code here }
 while(Not Terminated) do
 begin

  IdTCPClient1.ReadTimeout := 100; //무한히 기다리지 않도록 time out을
  //통신이 연결되어 있고
  if IdTCPClient1.Connected then
  begin
   //입력버퍼에 값이 있으면
   if Not IdTCPClient1.IOHandler.InputBufferIsEmpty then
   begin
    nlen := IdTCPClient1.IOHandler.InputBuffer.Size;
    //ireadLen = nlen;
    IdTCPClient1.IOHandler.ReadBytes(readTByte,nlen);
    SocketReceive(self, readTByte, nlen);
    /////Synchronize(fn_Display);
    //ireadCnt++;
   end;
  end else
  begin
//    SocketOpen := True;
  end;
  sleep(1000);
 end;
end;

procedure ClientSocket.FireDoorOpen(aFireGubunCode: string);
begin
  if FireGubunCode = '' then Exit; //화재그룹 사용 안하는 경우
  if FireGubunCode <> aFireGubunCode then Exit;
  FireRecoveryTimer.Enabled := False;
  G_bFireEvent[NO] := True;
  SendPacket('00','R',GetSendMsgNo,GetDeviceVer, 'SM2900Fire',1);
end;

procedure ClientSocket.FireRecovery;
begin
  G_bFireEvent[NO] := False;
  SendPacket('00','R',GetSendMsgNo,GetDeviceVer, 'SM2699RSM2500',1);
  FireRecoveryTimer.Enabled := True;
end;


procedure ClientSocket.FireRecoveryTimerTimer(Sender: TObject);
var
  i : integer;
  bResult : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;

  FireRecoveryTimer.Enabled := False;
  if NodeDeviceList.Count < 1 then
  begin
    FireEvent := False;
    Exit;
  end;
  bResult := False;
  for i := 0 to NodeDeviceList.Count - 1 do
  begin
    if (TDevice(NodeDeviceList.Objects[i]).DEVICECONNECTED = csConnected) and
       (TDevice(NodeDeviceList.Objects[i]).FireEvent) then bResult := True;
  end;

  if bResult and Not G_bFireEvent[NO] then FireRecovery;

  FireEvent := bResult;
end;

procedure ClientSocket.FTPCardDownLoadTimerTimer(Sender: TObject);
var
  nIndex : integer;
  i,j : integer;
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;
  if G_bFTPCardDownLoading then Exit;
  G_bFTPCardDownLoading := True;
  Try
    Try
      if FTPDownEcuList.Count < 1 then
      begin
        FTPCardDownLoadTimer.Enabled := False;
        Exit;
      end;
      for i := 0 to FTPDownEcuList.Count - 1 do
      begin
        nIndex := NodeDeviceList.IndexOf(FTPDownEcuList.strings[i]);
        if nIndex < 0 then Exit;
        for j := 1 to 3 do // 실패시 3번 재전송 해 보자
        begin
          if j = 1 then TDevice(NodeDeviceList.Objects[nIndex]).FTPFirst := True;

          if TDevice(NodeDeviceList.Objects[nIndex]).DeviceFTPCardDownLoadStart then
          begin
            FTPDownEcuList.Delete(i);
            break;
          end;
          if j > 2 then  //3 번 전송에서 실패 하면 전체를 전문 타입으로 전송 처리
          begin
            TDevice(NodeDeviceList.Objects[nIndex]).DeviceCardAllResend;
          end;
        end;
      end;
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.FTPCardDownLoadTimerTimer');
    End;
  Finally
    G_bFTPCardDownLoading := False;
  End;
end;

function ClientSocket.GetDeviceDoorArmaAreaState(aEcuID: string): string;
var
  nIndex : integer;
  stData : string;
  nTemp : integer;
  i : integer;
  nDoorFormatLength :integer;
  nArmAreaFormatLength :integer;
  nCardReaderFormatLength :integer;
begin
  Try
    nDoorFormatLength := 5;
    nArmAreaFormatLength := 1;
    nCardReaderFormatLength := 1;

    stData := '';
    result := '00'; //오류발생시 0 건처리
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    nTemp := TDevice(NodeDeviceList.Objects[nIndex]).MaxDoorCount;
    stData := stData + char($30 + nTemp); //출입문 최대 갯수
    stData := stData + char($30 + nDoorFormatLength);     //출입문상태포맷길이
    for i := 0 to nTemp - 1 do
    begin
      stData := stData + TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToDoorIndexState(i,nDoorFormatLength);
    end;
    stData := stData + char($30 + 9); //방범구역 최대 갯수  - 9
    stData := stData + char($30 + nArmAreaFormatLength);     //방범구역상태포맷길이
    for i := 0 to 8 do
    begin
      stData := stData + TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToArmAreaIndexMode(i,nArmAreaFormatLength);
    end;
    nTemp := TDevice(NodeDeviceList.Objects[nIndex]).MaxReaderCount;
    stData := stData + char($30 + nTemp); //카드리더 최대 갯수
    stData := stData + char($30 + nCardReaderFormatLength);     //카드리더상태포맷길이
    for i := 0 to nTemp - 1 do
    begin
      stData := stData + TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToCardReaderIndexState(i,nCardReaderFormatLength);
    end;
    result := stData;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceDoorArmaAreaState');
  End;
end;

function ClientSocket.GetDeviceIDArmAreaInformation(aCmd: integer; aEcuID,
  aSubNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToArmAreaIDInformation(aCmd,aSubNo);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDArmAreaInformation');
  End;
end;

function ClientSocket.GetDeviceIDCardReaderInformation(aCmd: integer; aEcuID,
  aSubNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;

    case aCmd of
      con_CardReaderCmdBuildingPositionCode : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToCardReaderIDBuildingPosition(aSubNo);
      end;
      con_CardReaderCmdDoorPosition : begin  //출입문 위치
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToCardReaderIDDoorPosition(aSubNo);
      end;
      con_CardReaderCmdType : begin   //카드리더 타입
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToCardReaderIDType(aSubNo);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDCardReaderInformation');
  End;
end;

function ClientSocket.GetDeviceIDDoorInformation(aCmd: integer; aEcuID,
  aSubNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToDoorIDInformation(aCmd,aSubNo);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDDoorInformation');
  End;
end;

function ClientSocket.GetDeviceIDExtentionInformation(aCmd: integer; aEcuID,
  aSubNo: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToExtentionIDInformation(aCmd,aSubNo);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDExtentionInformation');
  End;
end;

function ClientSocket.GetDeviceIDInformation(aCmd: integer;
  aEcuID: string): string;
var
  nIndex : integer;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    case aCmd of
      con_DeviceCmdArmAreaSKill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).ARMAREASKILL then result := '1'
        else result := '0'
      end;
      con_DeviceCmdArmAreaState : begin
        result := GetDeviceDoorArmaAreaState(aEcuID);
      end;
      con_DeviceCmdArmAreaUse : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).ARMAREASKILL then result := TDevice(NodeDeviceList.Objects[nIndex]).ARMAREAUSE
        else result := '0';
      end;
      con_DeviceCmdArmInDelay : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[nIndex]).ARMINDELAY);
      end;
      con_DeviceCmdArmOutDelay : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[nIndex]).ARMOUTDELAY);
      end;
      con_DeviceCmdArmRelay : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).ARMRELAY;
      end;
      con_DeviceCmdDeviceDoor2RelayType : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).DOOR2RELAY;
      end;
      con_DeviceCmdDeviceDoor2Skill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).DOOR2RELAYSKILL then result := '1'
        else result := '0';
      end;
      con_DeviceCmdDeviceType : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).DEVICETYPE;
      end;
      con_DeviceCmdDoorCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToDoorCount);
      end;
      con_DeviceCmdExtentionSkill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).ExtendSkill then result := '1'
        else result := '0';
      end;
      con_DeviceCmdJaeJungDelaySkill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).JAEJUNGSKILL then result := '1'
        else result := '0';
      end;
      con_DeviceCmdJaeJungDelayUse : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).JAEJUNGDELAYUSE;
      end;
      con_DeviceCmdDoorScheduleSkill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).DEVICEScheduleSkill then result := '1'
        else result := '0';
      end;
      con_DeviceCmdJAVARAARMCLOSE : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).JAVARAARMCLOSE;
      end;
      con_DeviceCmdJAVARAAUTOCLOSE : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).JAVARAAUTOCLOSE;
      end;
      con_DeviceCmdTimeCodeSkill : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).TimeCodeSkill then result := '1'
        else result := '0';
      end;
      con_DeviceCmdWATCHACPOWER : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).WATCHACPOWER;
      end;
      con_DeviceDoorStateRCV : begin
        if TDevice(NodeDeviceList.Objects[nIndex]).DoorStateRCV then result := 'TRUE'
        else result := 'FALSE';
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDInformation');
  End;
end;

function ClientSocket.GetDeviceIDSubInformation(aSubType, aCmd: integer; aEcuID,
  aSubNo: string): string;
begin
  Try
    result := '';
    case aSubType of
      con_DeviceTypeArmArea : begin
        result := GetDeviceIDArmAreaInformation(aCmd,aEcuID,aSubNo);
      end;
      con_DeviceTypeDoor : begin
        result := GetDeviceIDDoorInformation(aCmd,aEcuID,aSubNo);
      end;
      con_DeviceTypeCardReader : begin
        result := GetDeviceIDCardReaderInformation(aCmd,aEcuID,aSubNo);
      end;
      con_DeviceTypeExtention : begin
        result := GetDeviceIDExtentionInformation(aCmd,aEcuID,aSubNo);
      end;
      con_DeviceTypeZone : begin
        result := GetDeviceIDZoneInformation(aCmd,aEcuID,aSubNo);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDSubInformation');
  End;
end;

function ClientSocket.GetDeviceIDZoneInformation(aCmd: integer; aEcuID,
  aZoneID: string): string;
var
  nIndex : integer;
  stExtendID : string;
  stZoneNo : string;
begin
  Try
    result := '';
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    stExtendID := copy(aZoneID,1,2);
    stZoneNo := copy(aZoneID,3,2);
    if isDigit(stExtendID) then stExtendID := inttostr(strtoint(stExtendID))
    else stExtendID := '0';
    if isDigit(stZoneNo) then stZoneNo := inttostr(strtoint(stZoneNo))
    else stZoneNo := '0';

    case aCmd of
      con_ZoneCmdArmArea : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToZoneIDArmArea(stExtendID,stZoneNo);
      end;
      con_ZoneCmdDelayUse : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToZoneIDDelayUse(stExtendID,stZoneNo);
      end;
      con_ZoneCmdRecovery : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToZoneIDRecovery(stExtendID,stZoneNo);
      end;
      con_ZoneCmdType : begin
        result := TDevice(NodeDeviceList.Objects[nIndex]).GetDeviceToZoneIDType(stExtendID,stZoneNo);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIDZoneInformation');
  End;
end;

function ClientSocket.GetDeviceIndexArmAreaInformation(aCmd, aIndex,
  aSubIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > NodeDeviceList.Count - 1 then Exit;
    case aCmd of
      con_ArmAreaCmdName : begin
        result := TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToArmAreaName(aSubIndex);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexArmAreaInformation');
  End;
end;

function ClientSocket.GetDeviceIndexCardReaderInformation(aCmd, aIndex,
  aSubIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > NodeDeviceList.Count - 1 then Exit;
    case aCmd of
      con_CardReaderCmdArmAreaNo : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToCardReaderIndexArmAreaNo(aSubIndex));
      end;
      con_CardReaderCmdUse : begin
        if TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToCardReaderIndexUse(aSubIndex) then result := '1'
        else result := '0';
      end;
      con_CardReaderCmdDoorNo : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToCardReaderIndexDoorNo(aSubIndex));
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexCardReaderInformation');
  End;
end;

function ClientSocket.GetDeviceIndexDoorInformation(aCmd, aIndex,
  aSubIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > NodeDeviceList.Count - 1 then Exit;
    result := TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToDoorIndexInformation(aCmd,aSubIndex);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexDoorInformation');
  End;
end;

function ClientSocket.GetDeviceIndexExtentionInformation(aCmd, aIndex,
  aSubIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > NodeDeviceList.Count - 1 then Exit;
    case aCmd of
      con_ExtentionCmdZoneUse : begin
        result := TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToExtentionIndexUse(aSubIndex);
      end;
      con_ExtentionCmdZoneCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToExtentionIndexZoneCount(aSubIndex));
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexExtentionInformation');
  End;
end;

function ClientSocket.GetDeviceIndexInformation(aCmd, aIndex: integer): string;
begin
  Try
    result := '';
    if aIndex > NodeDeviceList.Count - 1 then Exit;

    case aCmd of
      con_DeviceCmdDeviceID : begin
        result := TDevice(NodeDeviceList.Objects[aIndex]).EcuID;
      end;
      con_DeviceCmdDeviceName : begin
        result := TDevice(NodeDeviceList.Objects[aIndex]).DEVICENAME;
      end;
      con_DeviceCmdDeviceUSE : begin
        if TDevice(NodeDeviceList.Objects[aIndex]).DeviceUse then result := '1'
        else result := '0';
      end;
      con_DeviceCmdArmAreaUse : begin
        if TDevice(NodeDeviceList.Objects[aIndex]).ARMAREASKILL then result := TDevice(NodeDeviceList.Objects[aIndex]).ARMAREAUSE
        else result := '0';
      end;
      con_DeviceCmdArmAreaCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToArmAreaCount);
      end;
      con_DeviceCmdDoorCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToDoorCount);
      end;
      con_DeviceCmdCardReaderCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToCardReaderCount);
      end;
      con_DeviceCmdDeviceConnected : begin
        if TDevice(NodeDeviceList.Objects[aIndex]).DEVICECONNECTED = csConnected then result := '1'
        else result := '0';
      end;
      con_DeviceCmdZoneExtentionCount : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aIndex]).GetDeviceToExtentionCount);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexInformation');
  End;
end;

function ClientSocket.GetDeviceIndexSubInformation(aSubType, aCmd, aIndex,
  aSubIndex: integer): string;
begin
  Try
    result := '';
    case aSubType of
      con_DeviceTypeArmArea : begin
        result := GetDeviceIndexArmAreaInformation(aCmd,aIndex,aSubIndex);
      end;
      con_DeviceTypeDoor : begin
        result := GetDeviceIndexDoorInformation(aCmd,aIndex,aSubIndex);
      end;
      con_DeviceTypeCardReader : begin
        result := GetDeviceIndexCardReaderInformation(aCmd,aIndex,aSubIndex);
      end;
      con_DeviceTypeExtention : begin
        result := GetDeviceIndexExtentionInformation(aCmd,aIndex,aSubIndex);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexSubInformation');
  End;
end;

function ClientSocket.GetDeviceIndexZoneInformation(aCmd, aEcuIndex,
  aExtentionIndex, aZoneNo: integer): string;
begin
  Try
    result := '';
    if aEcuIndex > NodeDeviceList.Count - 1 then Exit;
    case aCmd of
      con_ZoneCmdName : begin
        result := TDevice(NodeDeviceList.Objects[aEcuIndex]).GetDeviceToExtentionIndexZoneName(aExtentionIndex,aZoneNo);
      end;
      con_ZoneCmdArmArea : begin
        result := inttostr(TDevice(NodeDeviceList.Objects[aEcuIndex]).GetDeviceToExtentionIndexZoneArmArea(aExtentionIndex,aZoneNo));
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetDeviceIndexZoneInformation');
  End;
end;

function ClientSocket.GetDeviceVer: string;
begin
  if G_stDeviceVer[NO] = '' then G_stDeviceVer[NO] := 'K1';

  Result := G_stDeviceVer[NO];
end;

function ClientSocket.GetNodeIndexInformation(aCmd: integer): string;
begin
  Try
    result := '';
    case aCmd of
      con_DeviceCmdARMEXTENTIONGUBUN : begin
        result := ARMEXTENTIONGUBUN;
      end;
      con_DeviceCmdARMEXTENTIONMAINFROMLOCAL : begin
        result := ARMEXTENTIONMAINFROMLOCAL;
      end;
      con_DeviceCmdARMEXTENTIONMAINTOLOCAL : begin
        result := ARMEXTENTIONMAINTOLOCAL;
      end;
      con_DeviceCmdARMEXTENTIONSKILL : begin
        if ARMEXTENTIONSKILL then result := '1'
        else result := '0';
      end;
      con_DeviceCmdDVRIP : begin
        result := DVRIP;
      end;
      con_DeviceCmdDVRPORT : begin
        result := DVRPORT;
      end;
      con_DeivceCmdDVRSKILL : begin
        if DVRSKILL then result := '1'
        else result := '0';
      end;
      con_DeivceCmdDVRUSE : begin
        result := DVRUSE;
      end;
      con_DeviceCmdKTTREMOTEARMRINGCOUNT : begin
        result := inttostr(KTTREMOTEARMRINGCOUNT);
      end;
      con_DeviceCmdKTTREMOTEDisARMRINGCOUNT : begin
        result := inttostr(KTTREMOTEDISARMRINGCOUNT);
      end;
      con_DeviceCmdKTTSystemID : begin
        result := KTTSYSTEMID;
      end;
      con_DeviceCmdKTTTelNumber1 : begin
        result := KTTTELNUMBER1;
      end;
      con_DeviceCmdKTTTelNumber2 : begin
        result := KTTTELNUMBER2;
      end;
      con_NodeCmdDeviceCount : begin
        result := inttostr(NodeDeviceList.Count);
      end;
      con_NodeCmdDeviceRegState : begin
        result := GetRegEcuUseData;
      end;
      con_NodeCmdEcuMaxCount : begin
        result := inttostr(MaxEcuCount);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.GetNodeIndexInformation');
  End;
end;

function ClientSocket.GetRegEcuUseData: string;
var
  i : integer;
  aData : String[100];
  aNo : integer;
begin
  aData :='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 1 to NodeDeviceList.Count - 1  do
  begin
    Try
      aNo:= StrtoInt(NodeDeviceList.Strings[i]);
      if (aNo + 1) > Length(aData) then continue;
      if TDevice(NodeDeviceList.Objects[i]).DeviceUse then
         aData[aNo + 1]:= '1';
    Except
      continue;
    End;
  end;
  Result:= aData;
end;

function ClientSocket.GetSendMsgNo: char;
begin
  result := inttostr(G_nSendMsgNo[NO])[1];
  G_nSendMsgNo[NO] := G_nSendMsgNo[NO] + 1;
  if G_nSendMsgNo[NO] > 9 then G_nSendMsgNo[NO] := 0;
end;


procedure ClientSocket.NFCheckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;
  NFCheckTimer.Enabled := False;
  LastNetworkState := 'NF';
end;

function ClientSocket.NodeDataPacketProcess(
  aPacketData: RawByteString): Boolean;
var
  stECUID : string;
  stRealData : string;
  chCMD : char;
  chMsgNo : char;
  cKey : char;
  nIndex : integer;
  stTemp : String;
  stPacket : string;
begin
  stPacket := String(aPacketData);
  Try
    result := False;
    if aPacketData = '' then Exit;
    stTemp := copy(aPacketData,5,1);
    cKey := stTemp[1];
    DeviceID := Copy(aPacketData, 8, G_nIDLength);
    stECUID := copy(aPacketData,8 + G_nIDLength,2);
    stTemp := copy(aPacketData,G_nIDLength + 10,1);
    chCMD:= stTemp[1];
    stTemp := copy(aPacketData,G_nIDLength + 11,1);
    chMsgNo:= stTemp[1];
    G_stDeviceVer[NO] := copy(aPacketData,6,2);
    if Assigned(FOnNodePacket) then
    begin
      OnNodePacket(Self,No,NodeName,stECUID,chCMD,chMsgNo,G_stDeviceVer[NO],stPacket,'RX');
    end;
    //066*SK000000000Arn20140113144756MN0000d00***160000000000******81

    stRealData := Copy(aPacketData,G_nIDLength + 12,Length(aPacketData)-(G_nIDLength + 14));

    if G_stReceivedLastpacket[NO] = stPacket then
    begin
      if (chCMD <> 'c') AND (chCMD <> 'A') then   //알람 데이터 또는 출입이벤트가 아니면 Ack 전송
      begin
        SendPacket(stECUID,'a',chMsgNo,G_stDeviceVer[NO], 'w000', 0); //Ack 전송
      end;
      //최종 패킷과 현재 패킷이 같으면 무시하자
      Exit;
    end;
    G_stReceivedLastpacket[NO] := stPacket;

    //if (pos('Bad Command',aPacketData) > 0) or (pos('COMM ERROR',aPacketData) > 0 ) or (pos('UNUSED',aPacketData) > 0 ) then
    if (pos('COMM ERROR',aPacketData) > 0 ) then
    begin
      ECUConnected(stECUID,csDisConnected);
    end else if (pos('UNUSED',aPacketData) > 0 ) then
    begin
      ECUUsed(stECUID,False);
      ECUConnected(stECUID,csDisConnected);
    end else
    begin
      if (chCMD <> 'A') and (chCMD <> 'o') then ECUConnected(stECUID,csConnected);//통신에러 나오는 경우도 있음
    end;

    if (chCMD = 'a') then
    begin
      Exit;
    end;

    {받은 데이터 커맨드별 처리}
    { ================================================================================
    "A" = Alarm Data
    "I" = Initial Data
    "R" = Remote Command
    "e" = ENQ
    "E" = ERROR
    "a" = ACK
    "n" = NAK
    "r" = Remote Answer
    "c" = Access Control data
    ★ c(출입통제 데이터)인경우에는 ACK 를 'c' command를 만들어 응답을 해야 한다.
    즉 ACK 응답을 두번 주어야 한다.(①전체 패킷응답,②출입통제 응답)
    ================================================================================ }
    nIndex := NodeDeviceList.IndexOf(stECUID);
    if nIndex > -1 then
    begin
      case chCMD of
        'A','o':{알람}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAlarmData(stECUID,G_stDeviceVer[NO],chMsgNo,chCMD,stRealData)         end;
        'i':{Initial}       begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRegDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)             end;
        'R':{Remote}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
        'r':{Remote Answer} begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
        'c':{출입통제}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAccessDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
        'f':{펌웨어}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)            end;
        'F':{펌웨어}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess2(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)           end;
        '*':{브로드캐스트}  begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceBroadCastProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)           end;
        'E':{ERROR}         begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)       end;
        'm':{관제데이터 모니터링 } begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDevicePTMonitoringProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)  end;
        'M':{메세지참조 }   begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceMessageProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)  end;
        '#':{게이지 값 모니터링} begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceGageMonitor(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)            end;
        'e':{ENQ}           begin {ErrorDataProcess(stECUID,G_stDeviceVer,stRealData) }           end;
        else {error 발생: [E003]정의 되지 않은 커맨드}  begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData) end;
      end;
    end else
    begin
      AddDevice(stECUID,True);
      nIndex := NodeDeviceList.IndexOf(stECUID);
      if nIndex > -1 then
      begin
        case chCMD of
          'A','o':{알람}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAlarmData(stECUID,G_stDeviceVer[NO],chMsgNo,chCMD,stRealData)         end;
          'i':{Initial}       begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRegDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)             end;
          'R':{Remote}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
          'r':{Remote Answer} begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceRemoteDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
          'c':{출입통제}      begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceAccessDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)          end;
          'f':{펌웨어}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)            end;
          'F':{펌웨어}        begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceFirmwareProcess2(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)           end;
          '*':{브로드캐스트}  begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceBroadCastProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)           end;
          'E':{ERROR}         begin  TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)       end;
          'm':{관제데이터 모니터링 } begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDevicePTMonitoringProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)  end;
          'M':{메세지참조 }   begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceMessageProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)  end;
          '#':{게이지 값 모니터링} begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceGageMonitor(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData)            end;
          'e':{ENQ}           begin {ErrorDataProcess(stECUID,G_stDeviceVer,stRealData) }           end;
          else {error 발생: [E003]정의 되지 않은 커맨드}  begin TDevice(NodeDeviceList.Objects[nIndex]).ReceiveDeviceErrorDataProcess(stECUID,G_stDeviceVer[NO],chMsgNo,stRealData) end;
        end;
      end
    end;

    if (chCMD <> 'c') then
    begin
      SendPacket(stECUID,'a',chMsgNo,G_stDeviceVer[NO], 'w000', 0); //Ack 전송
    end;

    Result:= True;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeDataPacketProcess');
  End;
end;

procedure ClientSocket.NodeDataReadingProcessing;
var
  nFormat : integer;
  bLoop : Boolean;
  stLeavePacketData : RawByteString;
  stPacketData : RawByteString;
  bDecoderFormat : Boolean;
begin
  Try
    bLoop := False;
    repeat
      if Trim(G_stComBuffer[NO]) = '' then Exit;
      nFormat := dmDevicePacket.PacketFormatCheck(G_stComBuffer[NO],G_nProgramType,stLeavePacketData,stPacketData);
      if nFormat < 0 then
      begin
        if G_stComBuffer[NO] = '' then break;
        if nFormat = -1 then  //비정상 전문 인경우
        begin
           Delete(G_stComBuffer[NO],1,1);
           continue;
        end else break;   //포맷 길이가 작게 들어온 경우
      end;
      G_stComBuffer[NO]:= stLeavePacketData;
      bDecoderFormat := False;
      if nFormat = 1 then bDecoderFormat := False
      else if nFormat = 2 then bDecoderFormat := True
      else continue;
      if bDecoderFormat then continue;   //데코더 포맷인 경우 처리 하지 말자
      if stPacketData <> '' then
      begin
        NodeDataPacketProcess(stPacketData);
      end;

      if pos(ETX,G_stComBuffer[NO]) = 0 then bLoop := True
      else bLoop := False;
    until bLoop;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeDataReadingProcessing');
  End;
end;

procedure ClientSocket.NodeInformationCheck(aInformationType: integer);
var
  nIndex : integer;
begin
  Try
    case aInformationType of
      con_DeviceCmdKTTSystemID: begin
        KTTSYSTEMIDRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTSystemIDCheck;
        end;
        if KTTSYSTEMIDRCV = 'R' then KTTSYSTEMIDRCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //관제 시스템 아이디
      con_DeviceCmdKTTTelNumber1: begin
        KTTTELNUMBERRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTTelNumberCheck('0');
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTTelNumberCheck('1');
        end;
        if KTTTELNUMBERRCV = 'R' then KTTTELNUMBERRCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //관제 데코더 전화번호
      con_DeviceCmdKTTREMOTEARMRINGCOUNT: begin
        KTTREMOTERINGCOUNTRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTRingCountCheck;
        end;
        if KTTREMOTERINGCOUNTRCV = 'R' then KTTREMOTERINGCOUNTRCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //원격경해시 링횟수
      con_DeviceCmdKttCdmaUse: begin
        KTTCDMAUSERCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTCDMAUSECheck;
        end;
        if KTTCDMAUSERCV = 'R' then KTTCDMAUSERCV := 'Y'; //수신 하지 못한 경우 수신 하지 말자.
      end; //CDMA 사용 유무 0.미사용,1.사용
      con_DeviceCmdKttCDMADATA: begin
        KTTCDMADATARCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceKTTCDMADATACheck;
        end;
        if KTTCDMADATARCV = 'R' then KTTCDMADATARCV := 'Y'; //CDMA 모듈이 없는 경우 아무런 메시지도 오지 않음
      end;     //CDMA IP
      con_DeivceCmdDVRUSE: begin
        DVRUSERCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceDVRUseCheck;
        end;
        if DVRUSERCV = 'R' then DVRUSERCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end; //DVR 사용 유무 0.미사용,1.사용
      con_DeviceCmdDVRIP: begin
        DVRDATARCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceDVRDataCheck;
        end;
        if DVRDATARCV = 'R' then DVRDATARCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end; //DVR IP
      con_DeviceCmdARMEXTENTIONMAINTOLOCAL : begin
        if Not ARMEXTENTIONSKILL then
        begin
          ARMEXTENTIONMAINTOLOCALRCV := 'Y';
          Exit;
        end;
        ARMEXTENTIONMAINTOLOCALRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceARMEXTENTIONMAINTOLOCALCheck;
        end;
        if ARMEXTENTIONMAINTOLOCALRCV = 'R' then ARMEXTENTIONMAINTOLOCALRCV := 'Y'; //수신 하지 못한 경우 수신 하지 말자
      end;
      con_DeviceCmdARMEXTENTIONMAINFROMLOCAL : begin
        if Not ARMEXTENTIONSKILL then
        begin
          ARMEXTENTIONMAINFROMLOCALRCV := 'Y';
          Exit;
        end;
        ARMEXTENTIONMAINFROMLOCALRCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceARMEXTENTIONMAINFromLOCALCheck;
        end;
        if ARMEXTENTIONMAINFROMLOCALRCV = 'R' then ARMEXTENTIONMAINFROMLOCALRCV := 'Y'; //수신 하지 못한 경우 재수신 하지 말자
      end;
      con_DeviceCmdUseState : begin
        ECUUSERCV := 'R';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceECUUseCheck;
        end;
        if ECUUSERCV = 'R' then ECUUSERCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeInformationCheck');
  End;
end;

procedure ClientSocket.NodeInformationSend(aInformationType: integer);
var
  nIndex : integer;
  stTemp : string;
  i : integer;
begin
  Try
    case aInformationType of
      con_DeviceCmdKTTSystemID: begin
        KTTSYSTEMIDRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTSystemID(KTTSYSTEMID);
        end;
        if KTTSYSTEMIDRCV = 'S' then KTTSYSTEMIDRCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //관제 시스템 아이디
      con_DeviceCmdKTTTelNumber1: begin
        KTTTELNUMBERRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTTelNumber('0',KTTTELNUMBER1);
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTTelNumber('1',KTTTELNUMBER2);
        end;
        if KTTTELNUMBERRCV = 'S' then KTTTELNUMBERRCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //관제 데코더 전화번호
      con_DeviceCmdKTTREMOTEARMRINGCOUNT: begin
        KTTREMOTERINGCOUNTRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTRingCount(inttostr(KTTREMOTEARMRINGCOUNT),inttostr(KTTREMOTEDISARMRINGCOUNT));
        end;
        if KTTREMOTERINGCOUNTRCV = 'S' then KTTREMOTERINGCOUNTRCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;  //원격경해시 링횟수
      con_DeviceCmdKttCdmaUse: begin
        KTTCDMAUSERCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTCDMAUSE(KTTCDMAUSE);
        end;
        if KTTCDMAUSERCV = 'S' then KTTCDMAUSERCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end; //CDMA 사용 유무 0.미사용,1.사용
      con_DeviceCmdKttCDMADATA: begin
        KTTCDMADATARCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceKTTCDMADATA(KTTCDMAMIN,KTTCDMAMUX,KTTCDMAIP,KTTCDMAPORT,KTTCDMACHECKTIME,KTTCDMARSSI);
        end;
        if KTTCDMADATARCV = 'S' then KTTCDMADATARCV := 'U'; //CDMA 모듈이 없는 경우 아무런 메시지도 오지 않음
      end;     //CDMA IP
      con_DeivceCmdDVRUSE: begin
        DVRUSERCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceDVRUse(DVRUSE);
        end;
        if DVRUSERCV = 'S' then DVRUSERCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end; //DVR 사용 유무 0.미사용,1.사용
      con_DeviceCmdDVRIP: begin
        DVRDATARCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceDVRData(DVRIP,DVRPORT);
        end;
        if DVRDATARCV = 'S' then DVRDATARCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end; //DVR IP
      con_DeviceCmdARMEXTENTIONMAINTOLOCAL : begin
        if Not ARMEXTENTIONSKILL then
        begin
          ARMEXTENTIONMAINTOLOCALRCV := 'Y';
          Exit;
        end;
        ARMEXTENTIONMAINTOLOCALRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          if ARMEXTENTIONGUBUN = '0' then
          begin
            stTemp := '';
            for i := 0 to 63 do stTemp := stTemp + '0';
          end else
          begin
            stTemp := ARMEXTENTIONMAINTOLOCAL;
          end;
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceARMEXTENTIONMAINTOLOCAL(stTemp);
        end;
        if ARMEXTENTIONMAINTOLOCALRCV = 'S' then ARMEXTENTIONMAINTOLOCALRCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;
      con_DeviceCmdARMEXTENTIONMAINFROMLOCAL : begin
        if Not ARMEXTENTIONSKILL then
        begin
          ARMEXTENTIONMAINFROMLOCALRCV := 'Y';
          Exit;
        end;
        ARMEXTENTIONMAINFROMLOCALRCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          if ARMEXTENTIONGUBUN = '0' then
          begin
            stTemp := '';
            for i := 0 to 63 do stTemp := stTemp + '0';
          end else
          begin
            stTemp := ARMEXTENTIONMAINFROMLOCAL;
          end;
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceARMEXTENTIONMAINFromLOCAL(stTemp);
        end;
        if ARMEXTENTIONMAINFROMLOCALRCV = 'S' then ARMEXTENTIONMAINFROMLOCALRCV := 'U'; //송신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;
      con_DeviceCmdUseState : begin
        ECUUSERCV := 'S';
        nIndex := NodeDeviceList.IndexOf('00');
        if nIndex > -1 then
        begin
          TDevice(NodeDeviceList.Objects[nIndex]).RegistDeviceECUUse(GetRegEcuUseData);
        end;
        if ECUUSERCV = 'S' then ECUUSERCV := 'U'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeInformationSend');
  End;
end;

procedure ClientSocket.NodeSendPacketTimerTimer(Sender: TObject);
var
  stPacket : string;
  nCardDelayCount : integer;
begin
  if G_bApplicationTerminate then Exit;
  if G_bSocketWriting[NO] then Exit; //전송 중에는 보내지 말자.  => 전송 완료 메시지 이벤트가 발생 안되어 무용지물

  if NodeDestory then Exit;

  Try
    nCardDelayCount := 20;   //카드데이터 다운로드시 200ms 에 하나씩 전송 하기 위해서 400ms 안된 경우 전송 하지 말자.

    G_nSendDelayCount[NO] := G_nSendDelayCount[NO] + 1;
    stPacket := '';
    if (Send1stDataList.Count > 0) and (G_n1stCount[NO] < 5) then
    begin
      if G_nSendDelayCount[NO] > nCardDelayCount then G_nSendDelayCount[NO] := 0;
      stPacket := Send1stDataList.Strings[0];
      Send1stDataList.Delete(0);
      inc(G_n1stCount[NO]);
    end else if (Send2ndDataList.Count > 0) and (G_n2ndCount[NO] < 5) then
    begin
      G_n1stCount[NO] := 0;
      if G_nSendDelayCount[NO] > nCardDelayCount then G_nSendDelayCount[NO] := 0;
      stPacket := Send2ndDataList.Strings[0];
      Send2ndDataList.Delete(0);
      inc(G_n2ndCount[NO]);
    end else if (Send3rdDataList.Count > 0) and (G_n3rdCount[NO] < 5) then
    begin
      G_n1stCount[NO] := 0;
      G_n2ndCount[NO] := 0;
      if G_nSendDelayCount[NO] > nCardDelayCount then G_nSendDelayCount[NO] := 0;
      stPacket := Send3rdDataList.Strings[0];
      Send3rdDataList.Delete(0);
      inc(G_n3rdCount[NO]);
    end else if (Send4thDataList.Count > 0) and (G_n4thCount[NO] < 5) then
    begin
      G_n1stCount[NO] := 0;
      G_n2ndCount[NO] := 0;
      G_n3rdCount[NO] := 0;
      if G_nSendDelayCount[NO] < nCardDelayCount then Exit;       //카드데이터 다운로드시 200ms 에 하나씩 전송 하기 위해서 400ms 안된 경우 전송 하지 말자.
      G_nSendDelayCount[NO] := 0;
      stPacket := Send4thDataList.Strings[0];
      Send4thDataList.Delete(0);
      inc(G_n4thCount[NO]);
    end else
    begin
      G_n1stCount[NO] := 0;
      G_n2ndCount[NO] := 0;
      G_n3rdCount[NO] := 0;
      G_n4thCount[NO] := 0;
    end;
    if stPacket <> '' then
    begin
      //L_bSocketWriting := True;   //Send 후 이벤트가 발생하지 않네...ㅠ.ㅠ
      PutString(stPacket); //소켓에 전송
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.NodeSendPacketTimerTimer');
  End;
end;

procedure ClientSocket.NRCheckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  if NodeDestory then Exit;
  NRCheckTimer.Enabled := False;
  LastNetworkState := 'NR';
end;

function ClientSocket.PutString(aData: string): Boolean;
begin
  if IdTCPClient1.Connected then IdTCPClient1.IOHandler.Write(aData);
end;

procedure ClientSocket.RcvCheckTimerTimer(Sender: TObject);
var
  i : integer;
  bReciveStateCheck : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  if Not (NodeConnected = csConnected) then Exit; //노드가 연결되어 있지 않으면 빠져 나감

  if G_bRcvChecking[NO] or G_bStateChecking[NO] then Exit; //작업 중이면 일단 빠져 나감
  if NodeDestory then Exit;
  RcvCheckTimer.Interval := 200;

  G_bRcvChecking[NO] := True;
  Try
    RcvCheckTimer.Enabled := False;
    Try
      if G_nNodeUpdateIndex[NO] > HIGH(L_cNodeRCVSTATE) then G_nNodeUpdateIndex[NO] := 0;

      for i := G_nNodeUpdateIndex[NO] to HIGH(L_cNodeRCVSTATE) do
      begin
        G_nNodeUpdateIndex[NO] := i + 1;
        if L_cNodeRCVSTATE[i] = 'U' then  //변경된 건이 있으면 송신 하자....
        begin
          if NodeDestory then Exit;
          NodeInformationSend(i);
          Exit;
        end;
      end;
      if G_nNodeSearchIndex[NO] > HIGH(L_cNodeRCVSTATE) then G_nNodeSearchIndex[NO] := 0;
      for i := G_nNodeSearchIndex[NO] to HIGH(L_cNodeRCVSTATE) do
      begin
        G_nNodeSearchIndex[NO] := i + 1;
        if L_cNodeRCVSTATE[i] = 'N' then  //상태를 수신할 건이 있으면 수신 체크 하자....
        begin
          if NodeDestory then Exit;
          NodeInformationCheck(i);
          Exit;
        end;
      end;

      if G_nDeviceSearchIndex[NO] > NodeDeviceList.Count - 1 then G_nDeviceSearchIndex[NO] := 0;

      for i := G_nDeviceSearchIndex[NO] to NodeDeviceList.Count - 1 do  //컨트롤러의 상태가 변경 또는 체크 할것이 있는지 확인하자
      begin
        G_nDeviceSearchIndex[NO] := i + 1;
        if TDevice(NodeDeviceList.Objects[i]).DeviceConnected  = csConnected then
        begin
          if TDevice(NodeDeviceList.Objects[i]).ReciveStateChange then
          begin
            if NodeDestory then Exit;
            TDevice(NodeDeviceList.Objects[i]).DeviceReciveCheck;
            ReciveStateChange := True; //다음 장비의 상태를 체크 해야 하므로
            Exit;
          end;
        end;
      end;

      //여기서는 수신상태 체크 하는 곳 ==> 수신이 안되면 여기서 멈춤 현상 발생
      bReciveStateCheck := False;
      for i := 0 to HIGH(L_cNodeRCVSTATE) do
      begin
        if NodeDestory then Exit;
        if L_cNodeRCVSTATE[i] <> 'Y' then
        begin
          bReciveStateCheck := True;
          break;
        end;
      end;
      if Not bReciveStateCheck then
      begin
        for i := 0 to NodeDeviceList.Count - 1 do  //존의 상태가 변경 또는 체크 할것이 있는지 확인하자
        begin
          if NodeDestory then Exit;
          if TDevice(NodeDeviceList.Objects[i]).DeviceConnected  = csConnected then
          begin
            if TDevice(NodeDeviceList.Objects[i]).ReciveStateChange then
            begin
              bReciveStateCheck := True;
              break;
            end;
          end;
        end;
      end;
      ReciveStateChange := bReciveStateCheck;
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.RcvCheckTimerTimer');
    End;
  Finally
    G_bRcvChecking[NO] := False;
    RcvCheckTimer.Enabled := ReciveStateChange;  //수신상태를 변경 하면서 수행 됨
  End;
end;

procedure ClientSocket.SendPacket(aEcuId: String; aCmd, aMsgNo: char;
  aDeviceVer, aData: String; aPriority: integer);
var
  stDeviceID : string;
  nDataLength : integer;
  stLen : string;
  stPacket : string;
  cKey : char;
  stNormalPacket : string;
begin
  Try
    if Not (NodeConnected = csConnected) then Exit;

    if G_nEncrypt = 0 then cKey := #$20
    else cKey := #$19;

    stDeviceID := DeviceID ;
    if Length(stDeviceID) < G_nIDLength then stDeviceID := FillZeroStrNum(stDeviceID,G_nIDLength);
    stDeviceID := stDeviceID + aEcuID;
    nDataLength := (G_nIDLength + 14) + Length(aData);
    stLen := FillZeroNumber(nDataLength, 3);
    if aCmd = 'a' then {응답 처리}
       stPacket := dmDevicePacket.PacketCreate(G_nProgramType,stLen,aDeviceVer,stDeviceID,aCmd,aData,aMsgNo,cKey,stNormalPacket)
    else {제어 or 등록 }
    begin
      stPacket := dmDevicePacket.PacketCreate(G_nProgramType,stLen,aDeviceVer,stDeviceID,aCmd,aData,aMsgNo,cKey,stNormalPacket);
    end;
    if aPriority = 0 then    //ack 와 같이 최우선 순위 데이터
    begin
      PutString(stPacket);
    end else if aPriority = 1 then   //제어,조회 명령과 같이 우선 순위 데이터
    begin
      Send1stDataList.Add(stPacket);
    end else if aPriority = 2 then   //AccessEvent 에서 권한 데이터 불일치
    begin
      Send2ndDataList.Add(stPacket);
    end else if aPriority = 3 then
    begin
      Send3rdDataList.Add(stPacket);
    end else if aPriority = 4 then   //Auto CardData DownLoad
    begin
      Send4thDataList.Add(stPacket);
    end;

    if Assigned(FOnNodePacket) then
    begin
      OnNodePacket(Self,No,NodeName,aEcuID,aCmd,aMsgNo,aDeviceVer,stNormalPacket,'TX');
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SendPacket');
  End;
end;

procedure ClientSocket.ServerSocketClose;
begin
  SocketOpen := False;
end;

procedure ClientSocket.ServerSocketRead;
begin

end;

procedure ClientSocket.SetARMEXTENTIONGUBUN(const Value: string);
begin
  if FARMEXTENTIONGUBUN = Value then Exit;
  FARMEXTENTIONGUBUN := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdARMEXTENTIONGUBUN,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetARMEXTENTIONMAINFROMLOCAL(const Value: string);
var
  bUsed : Boolean;
  i : integer;
begin
  if FARMEXTENTIONMAINFROMLOCAL = Value then Exit;
  FARMEXTENTIONMAINFROMLOCAL := Value;
  bUsed := False;
  if Value <> '' then
  begin
    for i := 1 to Length(Value) - 1 do
    begin
      if Value[i+1] = '1' then
      begin
        bUsed := True;
        break;
      End;
    end;
  end;

  if bUsed then
  begin
    ARMEXTENTIONGUBUN := '2';
  end else
  begin
    bUsed := False;
    for i := 1 to Length(ARMEXTENTIONMAINTOLOCAL) - 1 do
    begin
      if ARMEXTENTIONMAINTOLOCAL[i+1] = '1' then
      begin
        bUsed := True;
        break;
      end;
    end;
    if Not bUsed then ARMEXTENTIONGUBUN := '0';  //사용안함
  end;

  if InfoInitialize then Exit;

  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetARMEXTENTIONMAINFROMLOCALRCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdARMEXTENTIONMAINFROMLOCAL] := Value[1];
  if FARMEXTENTIONMAINFROMLOCALRCV = Value then Exit;
  FARMEXTENTIONMAINFROMLOCALRCV := Value;
  ReciveStateChange:=True;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,Value);
  end;
end;

procedure ClientSocket.SetARMEXTENTIONMAINTOLOCAL(const Value: string);
var
  bUsed : Boolean;
  i : integer;
begin
  if FARMEXTENTIONMAINTOLOCAL = Value then Exit;
  FARMEXTENTIONMAINTOLOCAL := Value;
  bUsed := False;
  if Value <> '' then
  begin
    for i := 1 to Length(Value) - 1 do
    begin
      if Value[i+1] = '1' then
      begin
        bUsed := True;
        break;
      End;
    end;
  end;

  if bUsed then
  begin
    ARMEXTENTIONGUBUN := '1';
  end else
  begin
    bUsed := False;
    for i := 1 to Length(ARMEXTENTIONMAINFROMLOCAL) - 1 do
    begin
      if ARMEXTENTIONMAINFROMLOCAL[i+1] = '1' then
      begin
        bUsed := True;
        break;
      end;
    end;
    if Not bUsed then ARMEXTENTIONGUBUN := '0';  //사용안함
  end;

  if InfoInitialize then Exit;

  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdARMEXTENTIONMAINTOLOCAL,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetARMEXTENTIONMAINTOLOCALRCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdARMEXTENTIONMAINTOLOCAL] := Value[1];
  if FARMEXTENTIONMAINTOLOCALRCV = Value then Exit;
  FARMEXTENTIONMAINTOLOCALRCV := Value;
  ReciveStateChange:=True;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdARMEXTENTIONMAINTOLOCAL,Value);
  end;

end;

procedure ClientSocket.SetARMEXTENTIONSKILL(const Value: Boolean);
begin
  if FARMEXTENTIONSKILL = Value then Exit;

  FARMEXTENTIONSKILL := Value;
  if Not Value then
  begin
    ARMEXTENTIONMAINTOLOCALRCV := 'Y';
    ARMEXTENTIONMAINFROMLOCALRCV := 'Y';
  end;

end;

procedure ClientSocket.SetCardDownLoadStart(const Value: Boolean);
begin
  if FCardDownLoadStart = Value then Exit;

  FCardDownLoadStart := Value;
  CardDownLoadTimer.Enabled := Value;
end;

function ClientSocket.SetDeviceHoliday(aEcuID, aDay, aValue: string): Boolean;
var
  nIndex :integer;
begin
  Try
    result := False;
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    result := TDevice(NodeDeviceList.Objects[nIndex]).setHoliday(aDay,aValue);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetDeviceHoliday');
  End;
end;

procedure ClientSocket.SetDeviceID(const Value: string);
begin
  FDeviceID := Value;
  if FDeviceID = Value then Exit;
  FDeviceID := Value;

  if InfoInitialize then Exit;
end;

function ClientSocket.SetDeviceIDInformation(aCmd: integer; aEcuID,
  aValue: string): Boolean;
var
  nIndex :integer;
begin
  Try
    result := False;
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    case aCmd of
      con_DeviceCmdInfoInitialize : begin
        if aValue = '1' then TDevice(NodeDeviceList.Objects[nIndex]).InfoInitialize := True
        else TDevice(NodeDeviceList.Objects[nIndex]).InfoInitialize := False;
      end;
      con_DeviceCmdArmAreaUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).ARMAREAUSE := aValue;
      end;
      con_DeviceCmdArmInDelay : begin
        if isDigit(aValue) then
          TDevice(NodeDeviceList.Objects[nIndex]).ARMINDELAY := strtoint(aValue);
      end;
      con_DeviceCmdArmOutDelay : begin
        if isDigit(aValue) then
          TDevice(NodeDeviceList.Objects[nIndex]).ARMOUTDELAY := strtoint(aValue);
      end;
      con_DeviceCmdArmRelay : begin
        TDevice(NodeDeviceList.Objects[nIndex]).ARMRELAY := aValue;
      end;
      con_DeviceCmdCardReaderType : begin
        TDevice(NodeDeviceList.Objects[nIndex]).CARDREADERTYPE := aValue;
      end;
      con_DeviceCmdDeviceCode : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICECODE := aValue;
      end;
      con_DeviceCmdDeviceDoor2RelayType : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DOOR2RELAY := aValue;
      end;
      con_DeviceCmdDeviceUSE : begin
        if aValue = '1' then
          TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := True
        else TDevice(NodeDeviceList.Objects[nIndex]).DeviceUse := False;
      end;
      con_DeviceCmdDeviceVersion : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEVER := aValue;
      end;
      con_DeviceCmdEMZONELAMP : begin
        TDevice(NodeDeviceList.Objects[nIndex]).EMZONELAMP := aValue;
      end;
      con_DeviceCmdEMZONESIREN : begin
        TDevice(NodeDeviceList.Objects[nIndex]).EMZONESIREN := aValue;
      end;
      con_DeviceCmdJaeJungDelayUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAEJUNGDELAYUSE := aValue;
      end;
      con_DeviceCmdJAVARAARMCLOSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARAARMCLOSE := aValue;
      end;
      con_DeviceCmdJAVARAAUTOCLOSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARAAUTOCLOSE := aValue;
      end;
      con_DeviceCmdJAVARADISARMOPEN : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARADISARMOPEN := aValue;
      end;
      con_DeviceCmdJAVARASERVERARMCLOSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARASERVERARMCLOSE := aValue;
      end;
      con_DeviceCmdJAVARASERVERDISARMOPEN : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARASERVERDISARMOPEN := aValue;
      end;
      con_DeviceCmdJAVARATYPEUSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).JAVARATYPEUSE := aValue;
      end;
      con_DeviceCmdLAMPONTIME : begin
        if isDigit(aValue) then
          TDevice(NodeDeviceList.Objects[nIndex]).LAMPONTIME := strtoint(aValue);
      end;
      con_DeviceCmdSIRENONTIME : begin
        if isDigit(aValue) then
          TDevice(NodeDeviceList.Objects[nIndex]).SIRENONTIME := strtoint(aValue);
      end;
      con_DeviceCmdTimeCodeSend : begin
        TDevice(NodeDeviceList.Objects[nIndex]).SetDeviceTimeCode(aValue);
      end;
      con_DeviceCmdTimeCodeSkill : begin
        if aValue = '1' then TDevice(NodeDeviceList.Objects[nIndex]).TimeCodeSkill := True
        else TDevice(NodeDeviceList.Objects[nIndex]).TimeCodeSkill := False;
      end;
      con_DeviceCmdWATCHACPOWER : begin
        TDevice(NodeDeviceList.Objects[nIndex]).WATCHACPOWER := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetDeviceIDInformation');
  End;
end;

function ClientSocket.SetDeviceIDSubInformation(aSubType, aCmd: integer; aEcuID,
  aSubNo, aValue: string): Boolean;
var
  nIndex :integer;
begin
  Try
    result := false;
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).SetDeviceIDSubInformation(aSubType,aCmd,aSubNo, aValue);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetDeviceIDSubInformation');
  End;
end;

function ClientSocket.SetDeviceRcvIDInformation(aCmd: integer; aEcuID,
  aValue: string): Boolean;
var
  nIndex :integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    case aCmd of
      con_DeviceCmdArmAreaUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEARMAREAUSERCV := aValue;
      end;
      con_DeviceCmdArmRelay : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEARMRELAYRCV := aValue;
      end;
      con_DeviceCmdCardReaderNetwork : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICECARDREADERNETWORKRcv := aValue;
      end;
      con_DeviceCmdCardReaderType : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICECARDREADERTYPERCV := aValue;
      end;
      con_DeviceCmdDeviceCode : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICECODERCV := aValue;
      end;
      con_DeviceCmdDeviceDoor2RelayType : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEDOOR2RELAYRCV := aValue;
      end;
      con_DeviceCmdDeviceDoorArmArea : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEDOORARMAREARCV := aValue;
      end;
      con_DeviceCmdDeviceVersion : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEVERRCV := aValue;
      end;
      con_DeviceCmdEMZONELAMP : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEEMZONELAMPRCV := aValue;
      end;
      con_DeviceCmdExtentionNetwork : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEExtentionNetworkRCV := aValue;
      end;
      con_DeviceCmdExtentionUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEDEVICEEXTENTIONUSERCV := aValue;
      end;
      con_DeviceCmdJaeJungDelayUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEJAEJUNGDELAYUSERCV := aValue;
      end;
      con_DeviceCmdJAVARAARMCLOSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEJAVARAARMCLOSERCV := aValue;
      end;
      con_DeviceCmdJAVARAAUTOCLOSE : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICEJAVARAAUTOCLOSERCV := aValue;
      end;
      con_DeviceCmdLAMPONTIME : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICELAMPONTIMERCV := aValue;
      end;
      con_DeviceCmdSIRENONTIME : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICESIRENONTIMERCV := aValue;
      end;
      con_DeviceCmdSystemInformation : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICESYSTEMINFORMATIONRCV := aValue;
      end;
      con_DeviceCmdTimeCodeSend : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICETIMECODERCV := aValue;
      end;
      con_DeviceCmdTimeCodeUse : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICETIMECODEUSERCV := aValue;
      end;
      con_DeviceCmdWATCHACPOWER : begin
        TDevice(NodeDeviceList.Objects[nIndex]).DEVICESYSTEMINFORMATIONRCV := aValue;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetDeviceRcvIDInformation');
  End;
end;

function ClientSocket.SetDeviceRcvIDSubInformation(aSubType, aCmd: integer;
  aEcuID, aSubNo, aValue: string): Boolean;
var
  nIndex :integer;
begin
  Try
    result := false;
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then
    begin
      AddDevice(aEcuID,True);
      nIndex := NodeDeviceList.IndexOf(aEcuID);
    end;
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).SetDeviceRcvIDSubInformation(aSubType,aCmd,aSubNo, aValue);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetDeviceRcvIDSubInformation');
  End;
end;

procedure ClientSocket.SetDoorArmAreaStateRCV(const Value: Boolean);
begin
  if FDoorArmAreaStateRCV = Value then Exit;

  FDoorArmAreaStateRCV := Value;
  StateCheckTimer.Enabled := Not Value;
end;

procedure ClientSocket.SetDVRDATARCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdDVRIP] := Value[1];
  if FDVRDATARCV = Value then Exit;
  FDVRDATARCV := Value;
  ReciveStateChange:=True;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdDVRIP,Value);
  end;
end;

procedure ClientSocket.SetDVRIP(const Value: string);
begin
  if FDVRIP = Value then Exit;
  FDVRIP := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdDVRIP,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetDVRPORT(const Value: string);
begin
  if FDVRPORT = Value then Exit;
  FDVRPORT := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdDVRPORT,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetDVRSKILL(const Value: Boolean);
begin
  if FDVRSKILL = Value then Exit;
  FDVRSKILL := Value;
  if Not Value then
  begin
    //DVR 기능이 없으면 DVR 상태를 체크 하지 말자.
    DVRUSERCV :='Y'; //DVR 사용 유무 0.미사용,1.사용
    DVRDATARCV :='Y'; //DVR IP
  end;
end;

procedure ClientSocket.SetDVRUSE(const Value: string);
begin
  if FDVRUSE = Value then Exit;
  FDVRUSE := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeivceCmdDVRUSE,NO,'00',Trim(Value));
  end;
end;

procedure ClientSocket.SetDVRUSERCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeivceCmdDVRUSE] := Value[1];
  if FDVRUSERCV = Value then Exit;
  FDVRUSERCV := Value;
  ReciveStateChange:=True;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeivceCmdDVRUSE,Value);
  end;

end;

procedure ClientSocket.SetECUUSERCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdUseState] := Value[1];
  if FECUUSERCV = Value then Exit;
  ReciveStateChange:=True;
  FECUUSERCV := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdUseState,Value);
  end;
end;

procedure ClientSocket.SetFireEvent(const Value: Boolean);
var
  i : integer;
begin
  if FFireEvent = Value then Exit;

  FFireEvent := Value;

  if NodeDeviceList.Count < 1 then Exit;
  if Not Value then Exit;

  for i := 0 to NodeDeviceList.Count - 1 do
  begin
    if TDevice(NodeDeviceList.Objects[i]).DEVICECONNECTED = csConnected then
       TDevice(NodeDeviceList.Objects[i]).FireEvent := Value;
  end;
end;

procedure ClientSocket.SetFIREGUBUNCODE(const Value: string);
begin
  FFIREGUBUNCODE := Value;
end;

function ClientSocket.SetHolidayClear: Boolean;
var
  i :integer;
begin
  for i := 0 to NodeDeviceList.Count - 1 do
  begin
    TDevice(NodeDeviceList.Objects[i]).HolidayClear;
  end;
end;

procedure ClientSocket.SetKTTCDMACHECKTIME(const Value: string);
begin
  if FKTTCDMACHECKTIME = Value then Exit;
  FKTTCDMACHECKTIME := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCDMACHECKTIME,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetKTTCDMADATARCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdKttCDMADATA] := Value[1];
  if FKTTCDMADATARCV = Value then Exit;
  FKTTCDMADATARCV := Value;
  ReciveStateChange:=True;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdKttCDMADATA,Value);
  end;
end;

procedure ClientSocket.SetKTTCDMAIP(const Value: string);
begin
  if FKTTCDMAIP = Value then Exit;
  FKTTCDMAIP := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCDMAIP,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetKTTCDMAMIN(const Value: string);
begin
  if FKTTCDMAMIN = Value then Exit;
  FKTTCDMAMIN := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTCDMAMIN,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetKTTCDMAMUX(const Value: string);
begin
  if FKTTCDMAMUX = Value then Exit;
  FKTTCDMAMUX := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCDMAMUX,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetKTTCDMAPORT(const Value: string);
begin
  if FKTTCDMAPORT = Value then Exit;
  FKTTCDMAPORT := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCDMAPORT,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetKTTCDMARSSI(const Value: string);
begin
  if FKTTCDMARSSI = Value then Exit;
  FKTTCDMARSSI := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCDMARSSI,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetKTTCDMASKILL(const Value: Boolean);
begin
  if FKTTCDMASKILL = Value then Exit;
  FKTTCDMASKILL := Value;
  if Not Value then
  begin
    //CDMA 기능이 없으면 CDMA 상태를 체크 하지 말자.
    KTTCDMAUSERCV := 'Y'; //CDMA 사용 유무 0.미사용,1.사용
    KTTCDMADATARCV := 'Y';     //CDMA IP
  end;
end;

procedure ClientSocket.SetKTTCDMAUSE(const Value: string);
begin
  if FKTTCDMAUSE = Value then Exit;
  FKTTCDMAUSE := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKttCdmaUse,NO,'00',Value);
  end;

end;

procedure ClientSocket.SetKTTCDMAUSERCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdKttCdmaUse] := Value[1];
  if FKTTCDMAUSERCV = Value then Exit;
  ReciveStateChange:=True;
  FKTTCDMAUSERCV := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdKttCdmaUse,Value);
  end;
end;

procedure ClientSocket.SetKTTREMOTEARMRINGCOUNT(const Value: integer);
begin
  if FKTTREMOTEARMRINGCOUNT = Value then Exit;
  FKTTREMOTEARMRINGCOUNT := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTREMOTEARMRINGCOUNT,NO,'00',inttostr(Value));
  end;
end;

procedure ClientSocket.SetKTTREMOTEDISARMRINGCOUNT(const Value: integer);
begin
  if FKTTREMOTEDISARMRINGCOUNT = Value then Exit;
  FKTTREMOTEDISARMRINGCOUNT := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTREMOTEDisARMRINGCOUNT,NO,'00',inttostr(Value));
  end;
end;

procedure ClientSocket.SetKTTREMOTERINGCOUNTRCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdKTTREMOTEARMRINGCOUNT] := Value[1];
  if FKTTREMOTERINGCOUNTRCV = Value then Exit;
  ReciveStateChange:=True;
  FKTTREMOTERINGCOUNTRCV := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdKTTREMOTEARMRINGCOUNT,Value);
  end;
end;

procedure ClientSocket.SetKTTSYSTEMID(const Value: string);
begin
  if Trim(FKTTSYSTEMID) = Trim(Value) then Exit;

  FKTTSYSTEMID := Trim(Value);
  if InfoInitialize then Exit;

  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTSystemID,NO,'00',Trim(Value));
  end;
end;

procedure ClientSocket.SetKTTSYSTEMIDRCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdKTTSystemID] := Value[1];
  if FKTTSYSTEMIDRCV = Value then Exit;
  ReciveStateChange:=True;
  FKTTSYSTEMIDRCV := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdKTTSystemID,Value);
  end;
end;

procedure ClientSocket.SetKTTTELNUMBER1(const Value: string);
begin
  if FKTTTELNUMBER1 = Value then Exit;
  FKTTTELNUMBER1 := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTTelNumber1,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetKTTTELNUMBER2(const Value: string);
begin
  if FKTTTELNUMBER2 = Value then Exit;
  FKTTTELNUMBER2 := Value;
  if InfoInitialize then Exit;
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,con_DeviceCmdKTTTelNumber2,NO,'00',Value);
  end;
end;

procedure ClientSocket.SetKTTTELNUMBERRCV(const Value: string);
begin
  L_cNodeRCVSTATE[con_DeviceCmdKTTTelNumber1] := Value[1];
  if FKTTTELNUMBERRCV = Value then Exit;
  ReciveStateChange:=True;
  FKTTTELNUMBERRCV := Value;

  if InfoInitialize then Exit;

  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,NO,'NODE','00','0','0',con_DeviceCmdKTTTelNumber1,Value);
  end;
end;

procedure ClientSocket.SetLastNetworkState(const Value: string);
var
  stAlarmEvent : string;
  nIndex : integer;
  stAlarmStateCodeName : string;
  stAlarmStatePCCode : string;
  stAlarmStatePCCodeName : string;
  stAlarmStateModeChange : string;
  stAlarmView : string;
  stAlarmSound : string;
  stAlarmColor : string;
begin
  if Value = '' then
  begin
    LastNetworkState := 'NR';
    Exit;
  end;

  if FLastNetworkState = Value then Exit;
  FLastNetworkState := Value;

  if InfoInitialize and (Value = 'NR') then NFCheckTimer.Enabled := True;  //처음 DB에서 읽었을때 접속 성공이면 NF 체크 하자.

  if InfoInitialize then Exit;  //DB읽어서 셋팅중인경우에는 이벤트 생성하지 말자고...

  if (FLastNetworkState <> '') then  //'NR' 인 경우 처음 로딩 상태가 아니면
  begin
    //여기에서 NetworkAlarm상태를 만들자.
    //stAlarmEvent := '066 K1000000000ABn' + formatDatetime('yyyymmddhhnnss',now) + 'MN0000n' + Value + '***16****************A3';
(*    stAlarmEvent := FillZeroNumber(No,G_nNodeCodeLength) + '00' + 'A' + '0' + formatDatetime('yyyymmddhhnnss',now) + 'MN' + '00' + '0' + 'n' +
                    Value + '0' + '*' + 'MN0' + Value+ '000' + '*' + '1' + '1' + FillZeroStrNum(inttostr(clFuchsia),10) + formatDatetime('yyyymmddhhnnsszzz',now) + '****************';

*)

    nIndex := AlarmEventStateCodeList.IndexOf(Value);
    if nIndex > -1 then
    begin
      TAlarmEventStateCode(AlarmEventStateCodeList.Objects[nIndex]).GetAlarmEventPCCodeInfo(Value,'MN','n','0','*','****************',
                                                                    stAlarmStateCodeName,stAlarmStatePCCode,stAlarmStatePCCodeName,stAlarmStateModeChange,stAlarmView,stAlarmSound,stAlarmColor);
    end;

    stAlarmEvent := FillZeroNumber(No,G_nNodeCodeLength) + '00' + '0' + 'A' + '0' + formatDatetime('yyyymmddhhnnss',now) + 'MN' + '00' +
                 '00' + 'n' + Value + '00' +
                 '*' + ',' + '****************' + ',' + stAlarmStateCodeName + ',' + stAlarmStatePCCode + ',' + stAlarmStatePCCodeName + ',' + stAlarmStateModeChange + ',' + stAlarmView + ',' +
                 stAlarmSound + ',' + stAlarmColor;

    FileAppend(G_stEventDataDir + '\AlarmEvent' + FormatDateTime('yyyymmddhhnnss',now) + inttostr(No),stAlarmEvent,False);

  end;
end;

procedure ClientSocket.SetNo(const Value: Integer);
begin
  FNo := Value;
  G_bSocketWriting[Value] := False;
end;

procedure ClientSocket.SetNodeConnected(const Value: TConnectedState);
var
  i : integer;
  nIndex : integer;
begin
  Try
    if FNodeConnected = Value then Exit;
    FNodeConnected := Value;
    if G_bApplicationTerminate then Exit;

    if Value = csConnected then
    begin
      NodeSendPacketTimer.Enabled := True;
      G_bSocketWriting[NO] := False;
      DoorArmAreaStateRCV := False;
      StateCheckTimer.Interval := 2000; //2초 후부터 상태 체크 하자.
      StateCheckTimer.Enabled := True;
      RcvCheckTimer.Interval := 20000; //20초 후부터 기기정보 수신 체크
      RcvCheckTimer.Enabled := True; //수신상태 체크
      if LastNetworkState <> 'NR' then
         NRCheckTimer.enabled:= True;
      NFCheckTimer.enabled:= False;
      ControlNodeToDeviceTimeSync;
    end else
    begin
      NRCheckTimer.enabled:= False; //NR CheckTimer
      if LastNetworkState <> 'NF' then NFCheckTimer.enabled:= True; //NF CheckTimer
      //LastNetworkState := 'NF';
      for i := 0 to NodeDeviceList.Count - 1 do
      begin
        if Not NodeDestory then TDevice(NodeDeviceList.Objects[i]).DeviceConnected := csDisConnected;
      end;

      NodeSendPacketTimer.Enabled := False;
      DoorArmAreaStateRCV := True;
      StateCheckTimer.Enabled := False;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetNodeConnected');
  End;
end;

function ClientSocket.SetNodeIndexInformation(aCmd, aIndex: integer;
  aValue: string): string;
var
  stTemp : string;
begin
  Try
    case aCmd of
      con_DeviceCmdARMEXTENTIONMAINFROMLOCAL : begin
        stTemp := ARMEXTENTIONMAINTOLOCAL;
        if Length(stTemp) < aIndex  then Exit;
        stTemp[aIndex] := aValue[1];
        ARMEXTENTIONMAINTOLOCAL := stTemp;
      end;
      con_DeviceCmdARMEXTENTIONMAINTOLOCAL : begin
        stTemp := ARMEXTENTIONMAINFROMLOCAL;
        if Length(stTemp) < aIndex  then Exit;
        stTemp[aIndex] := aValue[1];
        ARMEXTENTIONMAINFROMLOCAL := stTemp;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetNodeIndexInformation');
  End;
end;

procedure ClientSocket.SetNodeToCardPermitExcute(aEcuID, aCardNo,
  aRcvAck: string);
var
  nIndex :integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).SetNodeToCardPermitExcute(aCardNo,aRcvAck);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetNodeToCardPermitExcute');
  End;
end;

procedure ClientSocket.SetNodeToCardPermitInitialize(aEcuID, aExtendID, aCardNo,
  aCardPermit, aCardState, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6,
  aDoor7, aDoor8, aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4,
  aArmArea5, aArmArea6, aArmArea7, aArmArea8, aRcvAck, aPositionNum,
  aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3, aTime4, aTCWeekCode, aRegDate,
  aEndDate, aEmState: string);
var
  nIndex :integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).SetNodeToCardPermitInitialize(aCardNo,
    aCardPermit,aCardState, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6, aDoor7, aDoor8,
    aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4, aArmArea5, aArmArea6,
    aArmArea7, aArmArea8, aRcvAck, aPositionNum, aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3,
    aTime4, aTCWeekCode,aRegDate,aEndDate,aEmState);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetNodeToCardPermitInitialize');
  End;
end;

procedure ClientSocket.SetNodeToCardPermitSetting(aEcuID, aExtendID, aCardNo,
  aPermit, aCardState, aType, aNumber, aPositionNum, aTimeCodeUse, aTCGroup,
  aTime1, aTime2, aTime3, aTime4, aWeekCode, aRegDate, aEndDate,
  aEmState: string);
var
  nIndex :integer;
begin
  Try
    nIndex := NodeDeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    TDevice(NodeDeviceList.Objects[nIndex]).SetNodeToCardPermitSetting(aCardNo, aPermit,
    aCardState, aType, aNumber, aPositionNum, aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3,
    aTime4, aWeekCode,aRegDate,aEndDate,aEmState);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SetNodeToCardPermitSetting');
  End;
end;

procedure ClientSocket.SetReciveStateChange(const Value: Boolean);
begin
  FReciveStateChange := Value;   //수신상태 변경 되었을때 이곳으로
  if Value then
  begin
    if NodeConnected = csConnected then
       RcvCheckTimer.Enabled := True; //수신상태 체크
  end;
end;

procedure ClientSocket.SetSocketOpen(const Value: Boolean);
begin
  FSocketOpen := Value;
  if SocketType <> 1 then Exit;  //Server -> Device 가 아닌 경우에는 소켓 오픈을 하지 말자...

  if Value then
  begin
    try
      LastReceiveTime := Now;
      IdTCPClient1.Host := NodeIP;
      IdTCPClient1.Port := NodePort;
      IdTCPClient1.ConnectTimeout := 500;
      //IdTCPClient1.
      if Not IdTCPClient1.Connected then IdTCPClient1.Connect;
    except
      on E : Exception do
      begin
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log',NODEIP + ':' +  E.Message);
        NodeConnected := csDisConnected;
      end;
    end
  end else
  begin
    if IdTCPClient1.Connected then IdTCPClient1.Disconnect;
  end;
end;

procedure ClientSocket.SocketError(Sender: TObject; SocketError: Integer);
begin
  if (SocketError = WSAEWOULDBLOCK) or (SocketError = 10038) then
  begin
    //Tag := 0
  end else begin
    NodeConnected := csDisConnected;
  end;
end;

procedure ClientSocket.SocketReceive(Sender: TObject; Buf: TIdBytes;
  var DataLen: Integer);
var
//  pTemp : AnsiString;
  stTemp : RawByteString;
begin
  Try
    //GetMem(pTemp,DataLen);
    stTemp := TIdBytesCopy(Buf,DataLen);   //FD -> 3F 로 변하는 부분때문에...
//    pTemp := pCopy(Buf,DataLen);
    LastReceiveTime := Now;
    G_stComBuffer[NO] := G_stComBuffer[NO] + stTemp;
    NodeDataReadingProcessing;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.TcpClientReceive');
  End;
end;

procedure ClientSocket.StateCheckTimerTimer(Sender: TObject);
var
  nIndex : integer;
  i : integer;
  bResult : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  if Not (NodeConnected = csConnected) then Exit; //노드가 연결되어 있지 않으면 빠져 나감

  if G_bRcvChecking[NO] or G_bStateChecking[NO] then Exit; //작업 중이면 일단 빠져 나감
  if NodeDestory then Exit;

  Try
    StateCheckTimer.Enabled := False;
    StateCheckTimer.Interval := 2000;
    if ECUUSERCV <> 'Y' then
    begin
      ECUUSERCV := 'R';
      nIndex := NodeDeviceList.IndexOf('00');
      if nIndex > -1 then
      begin
        TDevice(NodeDeviceList.Objects[nIndex]).DeviceECUUseCheck;
      end;
      if ECUUSERCV = 'R' then ECUUSERCV := 'N'; //수신 하지 못한 경우 수신 할때 까지 Retry 하자.
      Exit;
    end;

    StateCheckTimer.Interval := 200;
    G_bStateChecking[NO] := True;
    Try
      if G_nStateCheckEcuSeq[NO] < 0 then G_nStateCheckEcuSeq[NO] := 0;
      if ConnectDeviceList.Count < 1 then Exit;
      if G_nStateCheckEcuSeq[NO] > ConnectDeviceList.Count - 1  then G_nStateCheckEcuSeq[NO] := 0;

      nIndex := NodeDeviceList.IndexOf(ConnectDeviceList.Strings[G_nStateCheckEcuSeq[NO]]);
      if nIndex < 0 then Exit;
      if TDevice(NodeDeviceList.Objects[nIndex]).CurrentArmDoorStateCheckRCV = 'Y' then
      begin
        bResult := True;
        for i := 0 to NodeDeviceList.Count - 1 do
        begin
          if NodeDestory then Exit;
          if TDevice(NodeDeviceList.Objects[i]).DEVICECONNECTED = csConnected then
          begin
            if TDevice(NodeDeviceList.Objects[i]).CurrentArmDoorStateCheckRCV <> 'Y' then
            begin
              bResult := False;
              break;
            end;
          end;
        end;
        if bResult then DoorArmAreaStateRCV := True; //전체 상태를 모두 조회 한 상태면 타이머 종료 하자.
      end else
      begin
        //여기서 출입문 상태와 방범 상태 조회 하자.
        TDevice(NodeDeviceList.Objects[nIndex]).DeviceCurrentArmDoorStateCheck;
      end;
    Finally
      G_nStateCheckEcuSeq[NO] := G_nStateCheckEcuSeq[NO] + 1;
      G_bStateChecking[NO] := False;
    End;
  Finally
    StateCheckTimer.Enabled := Not DoorArmAreaStateRCV;
  End;
end;

procedure ClientSocket.TCPClientConnected(Sender: TObject);
begin
  NodeConnected := csConnected;
end;

procedure ClientSocket.TCPClientStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
  case AStatus of
    hsResolving     : ;
    hsConnecting    : ;
    hsConnected     : ;
    hsDisconnecting : ;
    hsDisconnected  : begin
      NodeConnected := csDisConnected;
    end;
    hsStatusText    : ;
  end;
end;

procedure ClientSocket.ZONEEXTENDTYPEChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
    if Assigned(FOnZONEEXTENDTYPEChange) then
    begin
      OnZONEEXTENDTYPEChange(Self,aNodeNo,aEcuID,aExtendID,aNumber,aData);
    end;
end;

procedure ClientSocket.ZonePacketChange(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnZonePacketChange) then
  begin
    OnZonePacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;
end;

end.
