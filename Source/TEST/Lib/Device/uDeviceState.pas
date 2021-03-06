unit uDeviceState;

interface
uses  System.Classes,System.SysUtils,
      uDeviceEvent,uDeviceVariable;

type
  TNodeState = Class(TComponent)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    NodeECULIST : TStringList;
    procedure CheckNodeConnectState;
    procedure NodeEcuCreate;
    procedure NodeEcuDestroy;
  private
    //자식 이벤트 받는 부분
    procedure AccessEvent(Sender:TObject;aNodeNo:integer;aEcuID,aDoorNo,aReaderNo,aCardNo,aTime,aPermit,aInputType,aButton:string);
    procedure AlarmEventAnalysis(Sender:TObject;aNodeNo:integer;aECUID:string;aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aAlarmArea,aMode,aStatusCode,aPortNo,aState,aOperator,aNewStateCode:string;
                                  aAlarmView,aAlarmSound:Boolean;aAlarmColor:string);
    procedure DeviceAlarmEventStateChange(Sender:TObject;aNodeNo:integer;aECUID,aAlarmArea,aBuildingCode,aFloorCode,aAreaCode:string;aAlaramState:TAlarmEventState);
    procedure DeviceConnected(Sender:TObject;aNodeNo:integer;aEcuID:string;aValue:Boolean);
    procedure DeviceSettingData(Sender:TObject;aNodeNo:integer;aEcuID,aPacketData:string);
    procedure DoorLockEventChange(Sender:TObject;aNodeNo:integer;aEcuID,aDoorNo:string;aDoorLockEvent:TDoorLockEvent);
    procedure DoorLockStateChange(Sender:TObject;aNodeNo:integer;aEcuID,aDoorNo:string;aDoorLockState:TDoorLockState);
    procedure ExitButton(Sender:TObject;aNodeNo:integer;aEcuID,aDoorNo,aTime,aInputType:string);
    procedure WatchModeChange(Sender:TObject;aNodeNo:integer;aEcuID,aArmAreaNo:string;aWatchMode:TWatchMode);
  private
    FNodeNo: integer;
    FOnDeviceConnected: TDeviceConnected;
    FNodeConnected: Boolean;
    FOnDoorLockStateChange: TDoorLockStateChange;
    FOnDoorLockEventChange: TDoorLockEventChange;
    FOnWatchModeChange: TWatchModeChange;
    FOnExitButton: TExitButton;
    FOnAccessEvent: TAccessEvent;
    FOnDeviceSettingData: TDevicePacketData;
    FOnDeviceAlarmEventState: TDeviceAlarmEventStateChange;
    FOnAlarmEventAnalysis: TAlarmEventAnalysis;
    FNodeNodeConnectState: TNodeConnectedState;
    FOnNodeConnectState: TNodeConnectedStateEvent;
    procedure SetNodeNo(const Value: integer);
    procedure SetNodeConnected(const Value: Boolean);
    procedure SetNodeConnectState(const Value: TNodeConnectedState);
  public
    //외부 입력 부분
    procedure AlarmAreaEventClear(aEcuID,aAlarmAreaNo:string);
    procedure AlarmListBuildingCode(aEcuID,aAlarmArea,aBuildingCode,aFloorCode,aAreaCode:string);
    procedure AlarmListName(aEcuID,aAlarmArea,aName:string);
    procedure DBAlarmEvent(aNodeNo:integer;aECUID:string;aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aAlarmArea,aMode,aStatusCode,aPortNo,aState,aOperator,aNewStateCode:string;
                                  aAlarmView,aAlarmSound:Boolean;aAlarmColor:string);
    procedure DeviceAllStateCheckReceive(aData:string);
    procedure DeviceStateCheckIIIReceive(aData:string);
    procedure DoorListBuildingCode(aEcuID,aDoorNo,aBuildingCode,aFloorCode,aAreaCode:string);
    procedure DoorListName(aEcuID,aDoorNo,aName:string);
    procedure ServerDataProcessing(aData:string);
  public
    //외부 조회 부분
    function GetAlarmAreaAlarmEvent(aEcuID,aAlarmAreaNo:string):TAlarmEventState;
    function GetAlarmAreaWatchMode(aEcuID,aAlarmAreaNo:string):TWatchMode;
    function GetDeviceConnected(aEcuID:string):TConnectedState;
    function GetDoorLockEvent(aEcuID,aDoorNo:string):TDoorLockEvent;
    function GetDoorLockState(aEcuID,aDoorNo:string):TDoorLockState;
  public
    //외부 제어 부분
    procedure SendFireRecovery;
  public
    //이벤트 발생 부분
    property OnAccessEvent:TAccessEvent read FOnAccessEvent write FOnAccessEvent;
    property OnAlarmEventAnalysis:TAlarmEventAnalysis read FOnAlarmEventAnalysis write FOnAlarmEventAnalysis;
    property OnDeviceAlarmEventState : TDeviceAlarmEventStateChange read FOnDeviceAlarmEventState write FOnDeviceAlarmEventState;
    property OnDeviceConnected : TDeviceConnected read FOnDeviceConnected write FOnDeviceConnected;
    property OnDeviceSettingData : TDevicePacketData read FOnDeviceSettingData write FOnDeviceSettingData;
    property OnDoorLockEventChange : TDoorLockEventChange read FOnDoorLockEventChange write FOnDoorLockEventChange;
    property OnDoorLockStateChange : TDoorLockStateChange read FOnDoorLockStateChange write FOnDoorLockStateChange;
    property OnExitButton:TExitButton read FOnExitButton write FOnExitButton ;
    property OnNodeConnectStateChange:TNodeConnectedStateEvent read FOnNodeConnectState write FOnNodeConnectState ;
    property OnWatchModeChange : TWatchModeChange read FOnWatchModeChange write FOnWatchModeChange;
  public
    property NodeNo : integer read FNodeNo write SetNodeNo;
  public
    //State
    property NodeConnected : Boolean read FNodeConnected write SetNodeConnected;
    property NodeConnectState : TNodeConnectedState read FNodeNodeConnectState write SetNodeConnectState;
  end;

  TDeviceState = Class(TComponent)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    DeviceDoorLIST : TStringList;
    DeviceAlarmAreaLIST : TStringList;
    procedure DeviceAlarmAreaCreate;
    procedure DeviceAlarmAreaDestroy;
    procedure DeviceDoorCreate;
    procedure DeviceDoorDestroy;
  private
    //자식 이벤트 받는 부분
    procedure DeviceAlarmEventStateChange(Sender:TObject;aNodeNo:integer;aECUID,aAlarmArea,aBuildingCode,aFloorCode,aAreaCode:string;aAlaramState:TAlarmEventState);
    procedure DoorLockEventChange(Sender:TObject;aNodeNo:integer;aEcuID,aDoorNo:string;aDoorLockEvent:TDoorLockEvent);
    procedure DoorLockStateChange(Sender:TObject;aNodeNo:integer;aEcuID,aDoorNo:string;aDoorLockState:TDoorLockState);
    procedure WatchModeChange(Sender:TObject;aNodeNo:integer;aEcuID,aArmAreaNo:string;aWatchMode:TWatchMode);
  private
    FParentNode: TNodeState;
    FParentNodeNo: integer;
    FECUID: String;
    FOnDeviceConnected: TDeviceConnected;
    FDeviceConnected: Boolean;
    FDOORSTATE: TDoorLockState;
    FOnDoorLockStateChange: TDoorLockStateChange;
    FOnDoorLockEventChange: TDoorLockEventChange;
    FOnWatchModeChange: TWatchModeChange;
    FLastAccessEvent: string;
    FOnExitButton: TExitButton;
    FOnAccessEvent: TAccessEvent;
    FOnDeviceSettingData: TDevicePacketData;
    FLastAlarmEvent: string;
    FOnDeviceAlarmEventState: TDeviceAlarmEventStateChange;
    FOnAlarmEventAnalysis: TAlarmEventAnalysis;
    procedure SetParentNodeNo(const Value: integer);
    procedure SetECUID(const Value: String);
    procedure SetDeviceConnected(const Value: Boolean);
  public
    //외부 설정 부분
    procedure AlarmAreaEventClear(aEcuID, aAlarmAreaNo:string);
    procedure AlarmListBuildingCode(aEcuID,aAlarmArea,aBuildingCode,aFloorCode,aAreaCode:string);
    procedure AlarmListName(aEcuID,aAlarmArea,aName:string);
    procedure DBAlarmEvent(aNodeNo:integer;aECUID:string;aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aAlarmArea,aMode,aStatusCode,aPortNo,aState,aOperator,aNewStateCode:string;
                                  aAlarmView,aAlarmSound:Boolean;aAlarmColor:string);
    procedure DeviceAllStateCheckReceive(aDeviceData:string);
    procedure DeviceStateCheckIIIReceive(aEcuPacket:string);
    procedure DoorListBuildingCode(aEcuID,aDoorNo,aBuildingCode,aFloorCode,aAreaCode:string);
    procedure DoorListName(aEcuID,aDoorNo,aName:string);
    procedure RecvAccessEvent(aData:string);
    procedure RecvAlarmEvent(aData:string);
    procedure RecvAlarmModeState(aControlType,aAlarmArea,aDeviceData:string);
    procedure RecvDeviceSettingEvent(aData:string);
    procedure RecvDoorDataProcess(aControlType,aDoorNo,aData:string);
  public
    //외부 조회 부분
    function GetAlarmAreaAlarmEvent(aEcuID,aAlarmAreaNo:string):TAlarmEventState;
    function GetAlarmAreaWatchMode(aEcuID,aAlarmAreaNo:string):TWatchMode;
    function GetDoorLockEvent(aEcuID,aDoorNo:string):TDoorLockEvent;
    function GetDoorLockState(aEcuID,aDoorNo:string):TDoorLockState;

  public
    //이벤트 발생 부분
    property OnAccessEvent:TAccessEvent read FOnAccessEvent write FOnAccessEvent;
    property OnAlarmEventAnalysis:TAlarmEventAnalysis read FOnAlarmEventAnalysis write FOnAlarmEventAnalysis;
    property OnDeviceAlarmEventState : TDeviceAlarmEventStateChange read FOnDeviceAlarmEventState write FOnDeviceAlarmEventState;
    property OnDeviceConnected : TDeviceConnected read FOnDeviceConnected write FOnDeviceConnected;
    property OnDeviceSettingData : TDevicePacketData read FOnDeviceSettingData write FOnDeviceSettingData;
    property OnDoorLockEventChange : TDoorLockEventChange read FOnDoorLockEventChange write FOnDoorLockEventChange;
    property OnDoorLockStateChange : TDoorLockStateChange read FOnDoorLockStateChange write FOnDoorLockStateChange;
    property OnExitButton:TExitButton read FOnExitButton write FOnExitButton ;
    property OnWatchModeChange : TWatchModeChange read FOnWatchModeChange write FOnWatchModeChange;
  public
    property ParentNode : TNodeState read FParentNode write FParentNode;
    property ParentNodeNo : integer read FParentNodeNo write SetParentNodeNo;
    property ECUID : String read FECUID write SetECUID;
    property LastAccessEvent : string read FLastAccessEvent write FLastAccessEvent;
    property LastAlarmEvent : string read FLastAlarmEvent write FLastAlarmEvent;

  public
    //State
    property DeviceConnected : Boolean read FDeviceConnected write SetDeviceConnected;
  end;

  TDoorState = Class(TComponent)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    //내부 함수
    procedure DoorStateReload;
  private
    FParentDevice: TDeviceState;
    FParentECUID: string;
    FParentNodeNo: integer;
    FAreaCode: string;
    FDoorName: string;
    FBuildingCode: string;
    FFloorCode: string;
    FOnDoorLockStateChange: TDoorLockStateChange;
    FDOORNO: string;
    FDOORSTATE: TDoorLockState;
    FDOOREVENT: TDoorLockEvent;
    FOnDoorLockEventChange: TDoorLockEventChange;
    FDoorManageMode: TDoorManageMode;
    FDoorPNMode: TDoorPNMode;
    FDoorOpenState: TDoorOpenState;
    FDoorLockMode: TDoorLockMode;
    FDoorFireOpen: Boolean;
    procedure SetAreaCode(const Value: string);
    procedure SetBuildingCode(const Value: string);
    procedure SetDoorName(const Value: string);
    procedure SetFloorCode(const Value: string);
    procedure SetDOORSTATE(const Value: TDoorLockState);
    procedure SetDOOREVENT(const Value: TDoorLockEvent);
    procedure SetDoorFireOpen(const Value: Boolean);
    procedure SetDoorLockMode(const Value: TDoorLockMode);
    procedure SetDoorManageMode(const Value: TDoorManageMode);
    procedure SetDoorOpenState(const Value: TDoorOpenState);
    procedure SetDoorPNMode(const Value: TDoorPNMode);
  public
    //외부 설정 부분
    procedure DoorListBuildingCode(aEcuID,aDoorNo,aBuildingCode,aFloorCode,aAreaCode:string);
    procedure DoorListName(aEcuID,aDoorNo,aName:string);
    procedure StateClear; //상태를 초기화 하자
  public
    property OnDoorLockEventChange : TDoorLockEventChange read FOnDoorLockEventChange write FOnDoorLockEventChange;
    property OnDoorLockStateChange : TDoorLockStateChange read FOnDoorLockStateChange write FOnDoorLockStateChange;
  public
    property ParentNodeNo : integer read FParentNodeNo write FParentNodeNo;
    property ParentECUID : string read FParentECUID write FParentECUID;
    property DOORNO : string read FDOORNO write FDOORNO;
    property ParentDevice : TDeviceState read FParentDevice write FParentDevice;
    property BuildingCode : string read FBuildingCode write SetBuildingCode;
    property FloorCode : string read FFloorCode write SetFloorCode;
    property AreaCode : string read FAreaCode write SetAreaCode;
    property DoorName : string read FDoorName write SetDoorName;

    property DoorManageMode : TDoorManageMode read FDoorManageMode write SetDoorManageMode;
    property DOOREVENT : TDoorLockEvent read FDOOREVENT write SetDOOREVENT;
    property DoorFireOpen : Boolean read FDoorFireOpen write SetDoorFireOpen;
    property DoorLockMode : TDoorLockMode read FDoorLockMode write SetDoorLockMode;
    property DoorOpenState : TDoorOpenState read FDoorOpenState write SetDoorOpenState;
    property DoorPNMode : TDoorPNMode read FDoorPNMode write SetDoorPNMode;
    property DOORSTATE : TDoorLockState read FDOORSTATE write SetDOORSTATE;

  end;

  TAlarmState = Class(TComponent)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FParentDevice: TDeviceState;
    FParentECUID: string;
    FParentNodeNo: integer;
    FAreaCode: string;
    FBuildingCode: string;
    FFloorCode: string;
    FAlarmName: string;
    FWathcMode: TWatchMode;
    FWatchMode: TWatchMode;
    FOnWatchModeChange: TWatchModeChange;
    FAlarmAreaNo: string;
    FAlarmEventState: TAlarmEventState;
    FOnDeviceAlarmEventState: TDeviceAlarmEventStateChange;
    procedure SetAreaCode(const Value: string);
    procedure SetBuildingCode(const Value: string);
    procedure SetFloorCode(const Value: string);
    procedure SetAlarmName(const Value: string);
    procedure SetWatchMode(const Value: TWatchMode);
    procedure SetAlarmEventState(const Value: TAlarmEventState);
  public
    //외부 설정 부분
    procedure AlarmListBuildingCode(aEcuID,aAlarmArea,aBuildingCode,aFloorCode,aAreaCode:string);
    procedure AlarmListName(aEcuID,aAlarmArea,aName:string);
    procedure StateClear; //상태를 초기화 하자
  public
    property OnDeviceAlarmEventState : TDeviceAlarmEventStateChange read FOnDeviceAlarmEventState write FOnDeviceAlarmEventState;
    property OnWatchModeChange : TWatchModeChange read FOnWatchModeChange write FOnWatchModeChange;
  public
    property ParentNodeNo : integer read FParentNodeNo write FParentNodeNo;
    property ParentECUID : string read FParentECUID write FParentECUID;
    property AlarmAreaNo : string read FAlarmAreaNo write FAlarmAreaNo;
    property ParentDevice : TDeviceState read FParentDevice write FParentDevice;
    property BuildingCode : string read FBuildingCode write SetBuildingCode;
    property FloorCode : string read FFloorCode write SetFloorCode;
    property AreaCode : string read FAreaCode write SetAreaCode;
    property AlarmName : string read FAlarmName write SetAlarmName;

    property AlarmEventState : TAlarmEventState read FAlarmEventState write SetAlarmEventState;
    property WatchMode : TWatchMode read FWatchMode write SetWatchMode;
  end;

implementation
uses
  uAlarmCode,
  uClientSocket,
  uCommonFunction,
  uCommonVariable;

{ TNodeState }

procedure TNodeState.AccessEvent(Sender: TObject; aNodeNo: integer; aEcuID,
  aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType, aButton: string);
begin
  if Assigned(FOnAccessEvent) then
  begin
    OnAccessEvent(Self,aNodeNo,aECUID,aDoorNo,aReaderNo,aCardNo,aTime,aPermit,aInputType,aButton);
  end;
end;

procedure TNodeState.AlarmAreaEventClear(aEcuID, aAlarmAreaNo: string);
var
  nIndex : integer;
  i : integer;
begin
  if aEcuID <> '' then
  begin
    nIndex := NodeECULIST.IndexOf(aEcuID);
    if nIndex > -1 then
    begin
      TDeviceState(NodeECULIST.Objects[nIndex]).AlarmAreaEventClear(aEcuID, aAlarmAreaNo);
    end;
  end else
  begin
    if NodeECULIST.Count < 1 then Exit;
    for i := 0 to NodeECULIST.Count - 1 do
    begin
      TDeviceState(NodeECULIST.Objects[i]).AlarmAreaEventClear(aEcuID, aAlarmAreaNo);
    end;
  end;

end;

procedure TNodeState.AlarmEventAnalysis(Sender: TObject; aNodeNo: integer;
  aECUID, aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aAlarmArea, aMode,
  aStatusCode, aPortNo, aState, aOperator, aNewStateCode: string; aAlarmView,
  aAlarmSound: Boolean; aAlarmColor: string);
begin
  if Assigned(FOnAlarmEventAnalysis) then
  begin
    OnAlarmEventAnalysis(Self,aNodeNo,aECUID,aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aAlarmArea,aMode,aStatusCode,aPortNo,aState,
                                  aOperator,aNewStateCode,aAlarmView,aAlarmSound,aAlarmColor);
  end;
end;

procedure TNodeState.AlarmListBuildingCode(aEcuID, aAlarmArea, aBuildingCode,
  aFloorCode, aAreaCode: string);
var
  nIndex : integer;
begin
  nIndex := NodeECULIST.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    TDeviceState(NodeECULIST.Objects[nIndex]).AlarmListBuildingCode(aEcuID, aAlarmArea, aBuildingCode,aFloorCode, aAreaCode);
  end;
end;

procedure TNodeState.AlarmListName(aEcuID, aAlarmArea, aName: string);
var
  nIndex : integer;
begin
  nIndex := NodeECULIST.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    TDeviceState(NodeECULIST.Objects[nIndex]).AlarmListName(aEcuID, aAlarmArea, aName);
  end;
end;

procedure TNodeState.CheckNodeConnectState;
var
  i : integer;
  nConnectedCount : integer;
  nDisConnectedCount : integer;
begin
  nConnectedCount := 0;
  nDisConnectedCount := 0;
  for i := 0 to NodeECULIST.Count - 1 do
  begin
    if TDeviceState(NodeECULIST.Objects[i]).DeviceConnected then inc(nConnectedCount)
    else inc(nDisConnectedCount);
  end;
  if nConnectedCount = 0 then NodeConnectState := ncDisConnected
  else NodeConnectState := ncAllConnected;
  //else if nDisConnectedCount = 0 then NodeConnectState := ncAllConnected
  //else NodeConnectState := ncNodeConnected;
end;

constructor TNodeState.Create(AOwner: TComponent);
begin
  inherited;
  NodeECULIST := TStringList.Create;
  NodeEcuCreate;
  NodeConnectState := ncDisConnected;
end;

procedure TNodeState.DBAlarmEvent(aNodeNo: integer; aECUID, aCmd, aMsgNo, aTime,
  aSubClass, aSubAddr, aAlarmArea, aMode, aStatusCode, aPortNo, aState,
  aOperator, aNewStateCode: string; aAlarmView, aAlarmSound: Boolean;
  aAlarmColor: string);
var
  nIndex : integer;
begin
  nIndex := NodeECULIST.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  TDeviceState(NodeECULIST.Objects[nIndex]).DBAlarmEvent(aNodeNo,aECUID,aCmd,aMsgNo,aTime,aSubClass,aSubAddr,aAlarmArea,aMode,aStatusCode,aPortNo,aState,aOperator,aNewStateCode,
                                  aAlarmView,aAlarmSound,aAlarmColor);
end;

destructor TNodeState.Destroy;
begin
  NodeEcuDestroy;
  NodeECULIST.Free;
  inherited;
end;


procedure TNodeState.DeviceAlarmEventStateChange(Sender: TObject; aNodeNo: integer;
  aECUID,aAlarmArea,aBuildingCode,aFloorCode,aAreaCode: string; aAlaramState: TAlarmEventState);
begin
  if Assigned(FOnDeviceAlarmEventState) then
  begin
    OnDeviceAlarmEventState(self,aNodeNo,aECUID,aAlarmArea,aBuildingCode,aFloorCode,aAreaCode,aAlaramState);
  end;
end;

procedure TNodeState.DeviceAllStateCheckReceive(aData: string);
var
  stReceiveType : string; //'N'(노드),'E'(기기),'D'(도어),'A'(알람),'S'(데몬제어-재시작등)
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stReaderNo : string;
  stDataType : string;    // 'CR'(카드리더등록),'PT'(방범데이터),'AC'(출입데이터),'AT'(근태데이터),'SV'(데몬서버데이터),'DV'(기기데이터)
  stControlType: string;  //'C'(카드데이터 또는 'DV' 인경우 CONNECT 상태),'R'(원격제어),'S'(상태-출입문,알람),'F'(FTP다운로드 상태)
  stDataLength : string;
  stDeviceData : string;
  nPacketSize : integer;
  i : integer;
  nIndex : integer;
  stEcuPacket : string;
begin
  stReceiveType := aData[2];
  stNodeNo := copy(aData,3,3);
  stEcuID := copy(aData,6,2);
  stDoorNo := copy(aData,8,2);
  if Not IsDigit(stDoorNo) then stDoorNo := '0';
  stDoorNo := inttostr(strtoint(stDoorNo));
  stReaderNo := copy(aData,10,2);
  if Not IsDigit(stReaderNo) then stReaderNo := '0';
  stReaderNo := inttostr(strtoint(stReaderNo));

  stDataType := copy(aData,12,2);
  stControlType := aData[14];
  stDataLength := copy(aData,15,3);
  if Not IsDigit(stDataLength) then Exit;
  stDeviceData := copy(aData,18,strtoint(stDataLength));

  if stControlType <> 'S' then Exit;
  nIndex := NodeECULIST.IndexOf(FillZeroNumber(i,2));
  if nIndex > -1 then
  begin
    TDeviceState(NodeECULIST.Objects[nIndex]).DeviceAllStateCheckReceive(stDeviceData);
  end;
end;

procedure TNodeState.DeviceConnected(Sender: TObject; aNodeNo: integer;
  aEcuID: string; aValue: Boolean);
begin
  if Assigned(FOnDeviceConnected) then
  begin
    OnDeviceConnected(Self,aNodeNo,aEcuID,aValue);
  end;
  CheckNodeConnectState;
end;

procedure TNodeState.DeviceSettingData(Sender: TObject; aNodeNo: integer; aEcuID,
  aPacketData: string);
begin
  if Assigned(FOnDeviceSettingData) then
  begin
    OnDeviceSettingData(Self,aNodeNo,aEcuID,aPacketData);
  end;
end;

procedure TNodeState.DeviceStateCheckIIIReceive(aData: string);
var
  stReceiveType : string; //'N'(노드),'E'(기기),'D'(도어),'A'(알람),'S'(데몬제어-재시작등)
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stReaderNo : string;
  stDataType : string;    // 'CR'(카드리더등록),'PT'(방범데이터),'AC'(출입데이터),'AT'(근태데이터),'SV'(데몬서버데이터),'DV'(기기데이터)
  stControlType: string;  //'C'(카드데이터 또는 'DV' 인경우 CONNECT 상태),'R'(원격제어),'S'(상태-출입문,알람),'F'(FTP다운로드 상태)
  stDataLength : string;
  stDeviceData : string;
  nPacketSize : integer;
  i : integer;
  nIndex : integer;
  stEcuPacket : string;
begin
  stReceiveType := aData[2];
  stNodeNo := copy(aData,3,3);
  stEcuID := copy(aData,6,2);
  stDoorNo := copy(aData,8,2);
  if Not IsDigit(stDoorNo) then stDoorNo := '0';
  stDoorNo := inttostr(strtoint(stDoorNo));
  stReaderNo := copy(aData,10,2);
  if Not IsDigit(stReaderNo) then stReaderNo := '0';
  stReaderNo := inttostr(strtoint(stReaderNo));

  stDataType := copy(aData,12,2);
  stControlType := aData[14];
  stDataLength := copy(aData,15,3);
  if Not IsDigit(stDataLength) then Exit;
  stDeviceData := copy(aData,18,strtoint(stDataLength));

  if stControlType <> 'N' then Exit;

  if G_nMonitorSockType = 0 then
    nPacketSize := conBINARYPACKETSIZE div 8      //ASCII 8비트가 한패킷
  else nPacketSize := conBINARYPACKETSIZE div 4; //HEX 4비트가 한패킷

  for i := 0 to conMAXDEVICECOUNT do
  begin
    stEcuPacket := copy(stDeviceData,(i * nPacketSize) + 1,nPacketSize);
    if G_nMonitorSockType = 0 then
      stEcuPacket := Ascii2Hex(stEcuPacket);  //ASCII 값으로 오면 HEX 로 변환
    stEcuPacket := Hex2Binary(stEcuPacket);
    nIndex := NodeECULIST.IndexOf(FillZeroNumber(i,2));
    if nIndex > -1 then
    begin
      TDeviceState(NodeECULIST.Objects[nIndex]).DeviceStateCheckIIIReceive(stEcuPacket);
    end;
  end;

end;

procedure TNodeState.DoorListBuildingCode(aEcuID, aDoorNo, aBuildingCode,
  aFloorCode, aAreaCode: string);
var
  nIndex : integer;
begin
  nIndex := NodeECULIST.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    TDeviceState(NodeECULIST.Objects[nIndex]).DoorListBuildingCode(aEcuID, aDoorNo, aBuildingCode,aFloorCode, aAreaCode);
  end;

end;

procedure TNodeState.DoorListName(aEcuID, aDoorNo, aName: string);
var
  nIndex : integer;
begin
  nIndex := NodeECULIST.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    TDeviceState(NodeECULIST.Objects[nIndex]).DoorListName(aEcuID, aDoorNo, aName);
  end;

end;

procedure TNodeState.DoorLockEventChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aDoorNo: string; aDoorLockEvent: TDoorLockEvent);
begin
  if Assigned(FOnDoorLockEventChange) then
  begin
    OnDoorLockEventChange(Self,aNodeNo,aEcuID,aDoorNo,aDoorLockEvent);
  end;
end;

procedure TNodeState.DoorLockStateChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aDoorNo: string; aDoorLockState: TDoorLockState);
begin
  if Assigned(FOnDoorLockStateChange) then
  begin
    OnDoorLockStateChange(Self,aNodeNo,aEcuID,aDoorNo,aDoorLockState);
  end;
end;

procedure TNodeState.ExitButton(Sender: TObject; aNodeNo: integer; aEcuID,
  aDoorNo, aTime, aInputType: string);
begin
  if Assigned(FOnExitButton) then
  begin
    OnExitButton(Self,aNodeNo,aEcuID,aDoorNo,aTime,aInputType);
  end;
end;

function TNodeState.GetAlarmAreaAlarmEvent(aEcuID,
  aAlarmAreaNo: string): TAlarmEventState;
var
  nIndex : integer;
begin
  result := aeNothing;
  nIndex := NodeECULIST.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TDeviceState(NodeECULIST.Objects[nIndex]).GetAlarmAreaAlarmEvent(aEcuID, aAlarmAreaNo);

end;

function TNodeState.GetAlarmAreaWatchMode(aEcuID,
  aAlarmAreaNo: string): TWatchMode;
var
  nIndex : integer;
begin
  result := cmNothing;
  nIndex := NodeECULIST.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TDeviceState(NodeECULIST.Objects[nIndex]).GetAlarmAreaWatchMode(aEcuID, aAlarmAreaNo);

end;

function TNodeState.GetDeviceConnected(aEcuID: string): TConnectedState;
var
  nIndex : integer;
begin
  result := csNothing;
  nIndex := NodeECULIST.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  if TDeviceState(NodeECULIST.Objects[nIndex]).DeviceConnected then result := csConnected
  else result := csDisConnected;

end;

function TNodeState.GetDoorLockEvent(aEcuID, aDoorNo: string): TDoorLockEvent;
var
  nIndex : integer;
begin
  result := deNothing;
  nIndex := NodeECULIST.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TDeviceState(NodeECULIST.Objects[nIndex]).GetDoorLockEvent(aEcuID, aDoorNo);

end;

function TNodeState.GetDoorLockState(aEcuID, aDoorNo: string): TDoorLockState;
var
  nIndex : integer;
begin
  result := dsNothing;
  nIndex := NodeECULIST.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  result := TDeviceState(NodeECULIST.Objects[nIndex]).GetDoorLockState(aEcuID, aDoorNo);
end;

procedure TNodeState.NodeEcuCreate;
var
  i : integer;
  oNodeEcu : TDeviceState;
  stEcuID : string;
begin
  for i := 0 to conMAXDEVICECOUNT do
  begin
    oNodeEcu := TDeviceState.Create(nil);
    oNodeEcu.ParentNode := Self;
    oNodeEcu.OnAccessEvent := AccessEvent;
    oNodeEcu.OnAlarmEventAnalysis := AlarmEventAnalysis;
    oNodeEcu.OnDeviceAlarmEventState := DeviceAlarmEventStateChange;
    oNodeEcu.OnDeviceConnected := DeviceConnected;
    oNodeEcu.OnDeviceSettingData := DeviceSettingData;
    oNodeEcu.OnDoorLockEventChange := DoorLockEventChange;
    oNodeEcu.OnDoorLockStateChange := DoorLockStateChange;
    oNodeEcu.OnExitButton := ExitButton;
    oNodeEcu.OnWatchModeChange := WatchModeChange;
    stEcuID := FillZeroNumber(i,2);
    oNodeEcu.ECUID := stEcuID;
    NodeECULIST.AddObject(stEcuID,oNodeEcu);
  end;
end;

procedure TNodeState.NodeEcuDestroy;
var
  i : integer;
begin
  if NodeECULIST.Count = 0 then Exit;
  for i := NodeECULIST.Count - 1 to 0 do
  begin
    TDeviceState(NodeECULIST.Objects[i]).Free;
  end;
  NodeECULIST.Clear;
end;

procedure TNodeState.SendFireRecovery;
var
  stData : string;
begin
  stData :=  'FIRERECOVERY'+ DATADELIMITER + FillZeroNumber(NodeNo,G_nNodeCodeLength) + DATADELIMITER;
  dmClientSocket.SendDaemonPacket(stData);
end;

procedure TNodeState.ServerDataProcessing(aData: string);
var
  stReceiveType : string; //'N'(노드),'E'(기기),'D'(도어),'A'(알람),'S'(데몬제어-재시작등)
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stReaderNo : string;
  stDataType : string;    // 'CR'(카드리더등록),'PT'(방범데이터),'AC'(출입데이터),'AT'(근태데이터),'SV'(데몬서버데이터),'DV'(기기데이터)
  stControlType: string;  //'C'(카드데이터 또는 'DV' 인경우 CONNECT 상태),'R'(원격제어),'S'(상태-출입문,알람),'F'(FTP다운로드 상태)
  stDataLength : string;
  stDeviceData : string;
  nPacketSize : integer;
  i : integer;
  nIndex : integer;
  stEcuPacket : string;
begin
  stReceiveType := aData[2];
  stNodeNo := copy(aData,3,3);
  stEcuID := copy(aData,6,2);
  stDoorNo := copy(aData,8,2);
  if Not IsDigit(stDoorNo) then stDoorNo := '0';
  stDoorNo := inttostr(strtoint(stDoorNo));
  stReaderNo := copy(aData,10,2);
  if Not IsDigit(stReaderNo) then stReaderNo := '0';
  stReaderNo := inttostr(strtoint(stReaderNo));

  stDataType := copy(aData,12,2);
  stControlType := aData[14];
  stDataLength := copy(aData,15,3);
  if Not IsDigit(stDataLength) then Exit;
  stDeviceData := copy(aData,18,strtoint(stDataLength));
  case stReceiveType[1] of
    'N' : begin
            if stDataType = 'DV' then
            begin
              if Pos('DISCONNECTED',UpperCase(stDeviceData)) > 0 then NodeConnected := False
              else if Pos('CONNECTED',UpperCase(stDeviceData)) > 0 then NodeConnected := True;
            end;
          end;
    'E' : begin
            nIndex := NodeECULIST.IndexOf(stEcuID);
            if stDataType = 'DV' then
            begin
              if nIndex > -1 then
              begin
                if Pos('DISCONNECTED',UpperCase(stDeviceData)) > 0 then TDeviceState(NodeECULIST.Objects[nIndex]).DeviceConnected := False
                else if Pos('CONNECTED',UpperCase(stDeviceData)) > 0 then TDeviceState(NodeECULIST.Objects[nIndex]).DeviceConnected := True;
              end;
            end else if stDataType = 'AC' then //출입 데이터
            begin
              if nIndex > -1 then
              begin
                TDeviceState(NodeECULIST.Objects[nIndex]).RecvAccessEvent(stDeviceData);
              end;
            end else if stDataType = 'ST' then //SetupData
            begin
              if nIndex > -1 then
              begin
                TDeviceState(NodeECULIST.Objects[nIndex]).RecvDeviceSettingEvent(stDeviceData);
              end;
            end else if stDataType = 'AL' then //전체 데이터 --올라오지 않음
            begin
            end;
          end;
    'D' : begin
            nIndex := NodeECULIST.IndexOf(stEcuID);
            if stDataType = 'DV' then
            begin
              if nIndex > -1 then
              begin
                TDeviceState(NodeECULIST.Objects[nIndex]).RecvDoorDataProcess(stControlType,stDoorNo,stDeviceData);
              end;
            end;
          end;
    'A' : begin
            nIndex := NodeECULIST.IndexOf(stEcuID);
            if stDataType = 'DV' then //기기정보
            begin
              if nIndex > -1 then
              begin
                TDeviceState(NodeECULIST.Objects[nIndex]).RecvAlarmModeState(stControlType,'0',stDeviceData);  //방범구역 무조건 '0'으로 설정
              end;
            end else if stDataType = 'PT' then  //Alarm 발생 전체전문
            begin
              if nIndex > -1 then
              begin
                TDeviceState(NodeECULIST.Objects[nIndex]).RecvAlarmEvent(stDeviceData);
              end;
            end else if stDataType = 'AL' then  //전체전문
            begin
            end;
          end;

  end;
end;

procedure TNodeState.SetNodeConnected(const Value: Boolean);
var
  i : integer;
  nIndex : integer;
begin
  FNodeConnected := Value;
  if Not Value then        //통신 끊김
  begin
    for i := 0 to NodeECULIST.Count - 1 do
    begin
      TDeviceState(NodeECULIST.Objects[i]).DeviceConnected := Value;
    end;
  end else
  begin
    nIndex := NodeECULIST.IndexOf('00'); //메인 컨트롤러의 접속 상태를 Connected 로 하자
    TDeviceState(NodeECULIST.Objects[nIndex]).DeviceConnected := Value;
  end;
end;

procedure TNodeState.SetNodeConnectState(const Value: TNodeConnectedState);
begin
  if FNodeNodeConnectState = Value then Exit;
  FNodeNodeConnectState := Value;

  if Assigned(FOnNodeConnectState) then
  begin
    OnNodeConnectStateChange(Self,NodeNo,Value);
  end;
end;

procedure TNodeState.SetNodeNo(const Value: integer);
var
  i : integer;
begin
  FNodeNo := Value;
  for i := 0 to NodeECULIST.Count - 1 do
  begin
    TDeviceState(NodeECULIST.Objects[i]).ParentNodeNo := Value;
  end;

end;

procedure TNodeState.WatchModeChange(Sender: TObject; aNodeNo: integer; aEcuID,
  aArmAreaNo: string; aWatchMode: TWatchMode);
begin
  if Assigned(FOnDoorLockStateChange) then
  begin
    OnWatchModeChange(Self,aNodeNo,aEcuID,aArmAreaNo,aWatchMode);
  end;
end;

{ TDeviceState }


procedure TDeviceState.AlarmAreaEventClear(aEcuID, aAlarmAreaNo: string);
var
  nIndex : integer;
  i : integer;
begin
  if aAlarmAreaNo <> '' then
  begin
    nIndex := DeviceAlarmAreaLIST.IndexOf(aAlarmAreaNo);
    if nIndex > -1 then
    begin
      TAlarmState(DeviceAlarmAreaLIST.Objects[nIndex]).AlarmEventState := aeNormal;
    end;
  end else
  begin
    if DeviceAlarmAreaLIST.Count < 1 then Exit;
    for i := 0 to DeviceAlarmAreaLIST.Count - 1 do
    begin
      TAlarmState(DeviceAlarmAreaLIST.Objects[i]).AlarmEventState := aeNormal;
    end;
  end;
end;

procedure TDeviceState.AlarmListBuildingCode(aEcuID, aAlarmArea, aBuildingCode,
  aFloorCode, aAreaCode: string);
var
  nIndex : integer;
begin
  nIndex := DeviceAlarmAreaLIST.IndexOf(aAlarmArea);
  if nIndex > -1 then
  begin
    TAlarmState(DeviceAlarmAreaLIST.Objects[nIndex]).AlarmListBuildingCode(aEcuID, aAlarmArea, aBuildingCode,aFloorCode, aAreaCode);
  end;
end;

procedure TDeviceState.AlarmListName(aEcuID, aAlarmArea, aName: string);
var
  nIndex : integer;
begin
  nIndex := DeviceAlarmAreaLIST.IndexOf(aAlarmArea);
  if nIndex > -1 then
  begin
    TAlarmState(DeviceAlarmAreaLIST.Objects[nIndex]).AlarmListName(aEcuID, aAlarmArea,aName );
  end;
end;

constructor TDeviceState.Create(AOwner: TComponent);
begin
  inherited;
  DeviceDoorLIST := TStringList.Create;
  DeviceAlarmAreaLIST := TStringList.Create;
  DeviceDoorCreate;
  DeviceAlarmAreaCreate;
end;

procedure TDeviceState.DBAlarmEvent(aNodeNo: integer; aECUID, aCmd, aMsgNo,
  aTime, aSubClass, aSubAddr, aAlarmArea, aMode, aStatusCode, aPortNo, aState,
  aOperator, aNewStateCode: string; aAlarmView, aAlarmSound: Boolean;
  aAlarmColor: string);
var
  nAlarmIndex : integer;
begin


  nAlarmIndex := DeviceAlarmAreaLIST.IndexOf(aAlarmArea);
  if nAlarmIndex < 0 then Exit;     //해당 방범구역이 없으면 빠져 나감
  case UpperCase(aMode)[1] of
   'A': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmArm end;
   'D': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmDisarm end;
   'T': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmTest end;
   'I': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmInit end;
   'P': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmPatrol end;
   'E': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmJaejung end;
  else
    begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmNothing end;
  end;

  if (aSubCLass = 'MN') or (aSubCLass = 'EX')then
  begin
    if aStatusCode = 'NF' then
    begin
      TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmNothing;
    end;
  end;

  if aCmd <> 'A' then Exit; //알람 발생 상태가 아니면 이벤트 발생하지 말자.

  if aAlarmView or aAlarmSound then
  begin
    if aAlarmSound then TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).AlarmEventState := aeAlarmEvent
    else
    begin
      if TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).AlarmEventState <> aeAlarmEvent  then
         TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).AlarmEventState := aeNormalEvent;
    end;
  end else
  begin
    if TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).AlarmEventState = aeNothing then //이벤트 상태를 모르는 경우만 복구
       TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).AlarmEventState := aeNormal;
  end;

  if Assigned(FOnAlarmEventAnalysis) then
  begin
    OnAlarmEventAnalysis(Self,aNodeNo,aECUID,aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aAlarmArea,aMode,aStatusCode,aPortNo,aState,
                                  aOperator,aNewStateCode,aAlarmView,aAlarmSound,aAlarmColor);
  end;
end;

destructor TDeviceState.Destroy;
begin
  DeviceDoorDestroy;
  DeviceAlarmAreaDestroy;
  DeviceDoorLIST.Free;
  DeviceAlarmAreaLIST.Free;
  inherited;
end;

procedure TDeviceState.DeviceAlarmAreaCreate;
var
  i : integer;
  oAlarmArea : TAlarmState;
begin
  for i := 0 to conMAXALARMAREACOUNT do
  begin
    oAlarmArea := TAlarmState.Create(nil);
    oAlarmArea.ParentDevice := Self;
    oAlarmArea.ParentECUID := ECUID;
    oAlarmArea.AlarmAreaNo := inttostr(i);
    oAlarmArea.OnDeviceAlarmEventState := DeviceAlarmEventStateChange;
    oAlarmArea.OnWatchModeChange := WatchModeChange;
    DeviceAlarmAreaLIST.AddObject(inttostr(i),oAlarmArea);
  end;

end;

procedure TDeviceState.DeviceAlarmAreaDestroy;
var
  i : integer;
begin
  if DeviceAlarmAreaLIST.Count = 0 then Exit;
  for i := DeviceAlarmAreaLIST.Count - 1 to 0 do
  begin
    TAlarmState(DeviceAlarmAreaLIST.Objects[i]).Free;
  end;
  DeviceAlarmAreaLIST.Clear;

end;

procedure TDeviceState.DeviceAlarmEventStateChange(Sender: TObject; aNodeNo:integer;aECUID,aAlarmArea,aBuildingCode,aFloorCode,aAreaCode:string; aAlaramState: TAlarmEventState);
begin
  if Assigned(FOnDeviceAlarmEventState) then
  begin
    OnDeviceAlarmEventState(self,aNodeNo,aECUID,aAlarmArea,aBuildingCode,aFloorCode,aAreaCode,aAlaramState);
  end;
end;

procedure TDeviceState.DeviceAllStateCheckReceive(aDeviceData: string);
var
  nIndex : integer;
  stAlarmArea : string;
  nAlarmIndex : integer;
  nDoorIndex : integer;
begin
  stAlarmArea := '0'; //현재는 무조건 0번구역

  case aDeviceData[1] of  //DeviceConnected State
    'C' : begin DeviceConnected := True end;
    'D' : begin DeviceConnected := False end;
    else begin DeviceConnected := False end;
  end;
  nAlarmIndex := DeviceAlarmAreaLIST.IndexOf(stAlarmArea);
  if nAlarmIndex > -1 then
  begin
    case aDeviceData[2] of //Device Watch Mode
      'N' : begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmNothing end;
      'A' : begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmArm end;
      'D' : begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmDisarm end;
      'P' : begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmPatrol end;
      'I' : begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmInit end;
      'T' : begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmTest end;
      'E' : begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmJaejung end;
      else begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmNothing end;
    end;
  end;
  nDoorIndex := DeviceDoorLIST.IndexOf('1'); //1번 도어
  if nDoorIndex > -1 then
  begin
    case aDeviceData[3] of //Door1 Manage Mode
      'N' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmNothing end;
      'M' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmManager end;
      'O' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmOpen end;
      'L' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmLock end;
      else begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmNothing end;
    end;
    case aDeviceData[5] of //Door1 Card Mode
      'N' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNothing end;
      'P' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnPositive end;
      'O' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNegative end;
      else begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode:= pnNothing end;
    end;
    case aDeviceData[7] of //Door1 Open State
      'N' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doNothing end;
      'C' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doClose end;
      'O' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doOpen end;
      'L' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doLongTime end;
      'P' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doOpenErr end;
      'S' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doCloseErr end;
      else begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doNothing end;
    end;
    case aDeviceData[9] of //Door1 Lock State
      'N' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsNothing end;
      'C' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsClose end;
      'O' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsOpen end;
      else begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsNothing end;
    end;
    case aDeviceData[11] of //Door1 Fire State
      'N' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := False end;
      'F' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := True end;
      else begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := False end;
    end;
  end;
  nDoorIndex := DeviceDoorLIST.IndexOf('2'); //1번 도어
  if nDoorIndex > -1 then
  begin
    case aDeviceData[4] of //Door2 Manage Mode
      'N' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmNothing end;
      'M' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmManager end;
      'O' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmOpen end;
      'L' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmLock end;
      else begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmNothing end;
    end;
    case aDeviceData[6] of //Door2 Card Mode
      'N' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNothing end;
      'P' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnPositive end;
      'O' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNegative end;
      else begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNothing end;
    end;
    case aDeviceData[8] of //Door2 Open State
      'N' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doNothing end;
      'C' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doClose end;
      'O' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doOpen end;
      'L' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doLongTime end;
      'P' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doOpenErr end;
      'S' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doCloseErr end;
      else begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doNothing end;
    end;
    case aDeviceData[10] of //Door2 Lock State
      'N' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsNothing end;
      'C' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsClose end;
      'O' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsOpen end;
      else begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsNothing end;
    end;
    case aDeviceData[12] of //Door1 Fire State
      'N' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := False end;
      'F' : begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := True end;
      else begin TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := False end;
    end;
  end;
end;

procedure TDeviceState.DeviceDoorCreate;
var
  i : integer;
  oDeviceDoor : TDoorState;
begin
  for i := 1 to conMAXDOORCOUNT do
  begin
    oDeviceDoor := TDoorState.Create(nil);
    oDeviceDoor.ParentDevice := Self;
    oDeviceDoor.ParentECUID := ECUID;
    oDeviceDoor.DOORNO := inttostr(i);
    oDeviceDoor.OnDoorLockEventChange := DoorLockEventChange;
    oDeviceDoor.OnDoorLockStateChange := DoorLockStateChange;

    DeviceDoorLIST.AddObject(inttostr(i),oDeviceDoor);
  end;

end;

procedure TDeviceState.DeviceDoorDestroy;
var
  i : integer;
begin
  if DeviceDoorLIST.Count = 0 then Exit;
  for i := DeviceDoorLIST.Count - 1 to 0 do
  begin
    TDoorState(DeviceDoorLIST.Objects[i]).Free;
  end;
  DeviceDoorLIST.Clear;
end;

procedure TDeviceState.DeviceStateCheckIIIReceive(aEcuPacket: string);
var
  nIndex : integer;
  stAlarmArea : string;
  nAlarmIndex : integer;
  nDoorIndex : integer;
  stDeviceConnect : string;
  stWatchMode : string;
  stDoorManager1,stDoorManager2 : string;
  stDoorPNmode1,stDoorPNmode2 : string;
  stDoorOpenState1,stDoorOpenState2 : string;
  stDoorLockState1,stDoorLockState2 : string;
  stDoorFireState1,stDoorFireState2 : string;
begin
  stAlarmArea := '0'; //현재는 무조건 0번구역
  stDeviceConnect := copy(aEcuPacket,1,2);
  stWatchMode := copy(aEcuPacket,3,4);
  stDoorManager1 := copy(aEcuPacket,7,3);
  stDoorManager2 := copy(aEcuPacket,10,3);
  stDoorPNmode1 := copy(aEcuPacket,13,2);
  stDoorPNmode2 := copy(aEcuPacket,15,2);
  stDoorOpenState1 := copy(aEcuPacket,17,3);
  stDoorOpenState2 := copy(aEcuPacket,20,3);
  stDoorLockState1 := copy(aEcuPacket,23,2);
  stDoorLockState2 := copy(aEcuPacket,25,2);
  stDoorFireState1 := copy(aEcuPacket,27,1);
  stDoorFireState2 := copy(aEcuPacket,28,1);

  if stDeviceConnect = '01' then DeviceConnected := True
  else DeviceConnected := False;
  nAlarmIndex := DeviceAlarmAreaLIST.IndexOf(stAlarmArea);
  if nAlarmIndex > -1 then
  begin
    if stWatchMode = '0000' then TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmNothing
    else if stWatchMode = '0001' then TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmArm
    else if stWatchMode = '0010' then TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmDisarm
    else if stWatchMode = '0011' then TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmPatrol
    else if stWatchMode = '0100' then TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmInit
    else if stWatchMode = '0101' then TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmTest
    else if stWatchMode = '0110' then TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmJaejung
    else TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmNothing;
  end;
  nDoorIndex := DeviceDoorLIST.IndexOf('1'); //1번 도어
  if nDoorIndex > -1 then
  begin
    if stDoorManager1 = '000' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmNothing
    else if stDoorManager1 = '001' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmManager
    else if stDoorManager1 = '010' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmOpen
    else if stDoorManager1 = '011' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmLock
    else TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmNothing;
    if stDoorPNmode1 = '00' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNothing
    else if stDoorPNmode1 = '01' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnPositive
    else if stDoorPNmode1 = '10' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNegative
    else TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNothing;
    if stDoorOpenState1 = '000' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doNothing
    else if stDoorOpenState1 = '001' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doClose
    else if stDoorOpenState1 = '010' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doOpen
    else if stDoorOpenState1 = '011' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doLongTime
    else if stDoorOpenState1 = '100' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doOpenErr
    else if stDoorOpenState1 = '101' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doCloseErr
    else TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doNothing;
    if stDoorLockState1 = '00' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsNothing
    else if stDoorLockState1 = '01' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsClose
    else if stDoorLockState1 = '10' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsOpen
    else TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsNothing;
    if stDoorFireState1 = '1' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := True
    else TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := False;
  end;
  nDoorIndex := DeviceDoorLIST.IndexOf('2'); //2번 도어
  if nDoorIndex > -1 then
  begin
    if stDoorManager2 = '000' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmNothing
    else if stDoorManager2 = '001' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmManager
    else if stDoorManager2 = '010' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmOpen
    else if stDoorManager2 = '011' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmLock
    else TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmNothing;
    if stDoorPNmode2 = '00' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNothing
    else if stDoorPNmode2 = '01' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnPositive
    else if stDoorPNmode2 = '10' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNegative
    else TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNothing;
    if stDoorOpenState2 = '000' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doNothing
    else if stDoorOpenState2 = '001' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doClose
    else if stDoorOpenState2 = '010' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doOpen
    else if stDoorOpenState2 = '011' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doLongTime
    else if stDoorOpenState2 = '100' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doOpenErr
    else if stDoorOpenState2 = '101' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doCloseErr
    else TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doNothing;
    if stDoorLockState2 = '00' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsNothing
    else if stDoorLockState2 = '01' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsClose
    else if stDoorLockState2 = '10' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsOpen
    else TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorLockMode := lsNothing;
    if stDoorFireState2 = '1' then TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := True
    else TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := False;
  end;

end;

procedure TDeviceState.DoorListBuildingCode(aEcuID, aDoorNo, aBuildingCode,
  aFloorCode, aAreaCode: string);
var
  nIndex : integer;
begin
  nIndex := DeviceDoorLIST.IndexOf(aDoorNo);
  if nIndex > -1 then
  begin
    TDoorState(DeviceDoorLIST.Objects[nIndex]).DoorListBuildingCode(aEcuID, aDoorNo, aBuildingCode,aFloorCode, aAreaCode);
  end;

end;

procedure TDeviceState.DoorListName(aEcuID, aDoorNo, aName: string);
var
  nIndex : integer;
begin
  nIndex := DeviceDoorLIST.IndexOf(aDoorNo);
  if nIndex > -1 then
  begin
    TDoorState(DeviceDoorLIST.Objects[nIndex]).DoorListName(aEcuID, aDoorNo, aName);
  end;

end;

procedure TDeviceState.DoorLockEventChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aDoorNo: string; aDoorLockEvent: TDoorLockEvent);
begin
  if Assigned(FOnDoorLockEventChange) then
  begin
    OnDoorLockEventChange(Self,aNodeNo,aEcuID,aDoorNo,aDoorLockEvent);
  end;
end;

procedure TDeviceState.DoorLockStateChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aDoorNo: string; aDoorLockState: TDoorLockState);
begin
  if Assigned(FOnDoorLockStateChange) then
  begin
    OnDoorLockStateChange(Self,aNodeNo,aEcuID,aDoorNo,aDoorLockState);
  end;
end;

function TDeviceState.GetAlarmAreaAlarmEvent(aEcuID,
  aAlarmAreaNo: string): TAlarmEventState;
var
  nIndex : integer;
begin
  result := aeNothing;
  nIndex := DeviceAlarmAreaLIST.IndexOf(aAlarmAreaNo);
  if nIndex < 0 then Exit;
  result := TAlarmState(DeviceAlarmAreaLIST.Objects[nIndex]).AlarmEventState;

end;

function TDeviceState.GetAlarmAreaWatchMode(aEcuID,
  aAlarmAreaNo: string): TWatchMode;
var
  nIndex : integer;
begin
  result := cmNothing;
  nIndex := DeviceAlarmAreaLIST.IndexOf(aAlarmAreaNo);
  if nIndex < 0 then Exit;
  result := TAlarmState(DeviceAlarmAreaLIST.Objects[nIndex]).WatchMode;

end;

function TDeviceState.GetDoorLockEvent(aEcuID, aDoorNo: string): TDoorLockEvent;
var
  nIndex : integer;
begin
  result := deNothing;
  nIndex := DeviceDoorLIST.IndexOf(aDoorNo);
  if nIndex < 0 then Exit;
  result := TDoorState(DeviceDoorLIST.Objects[nIndex]).DOOREVENT;

end;

function TDeviceState.GetDoorLockState(aEcuID, aDoorNo: string): TDoorLockState;
var
  nIndex : integer;
begin
  result := dsNothing;
  nIndex := DeviceDoorLIST.IndexOf(aDoorNo);
  if nIndex < 0 then Exit;
  result := TDoorState(DeviceDoorLIST.Objects[nIndex]).DOORSTATE;
end;

procedure TDeviceState.RecvAccessEvent(aData: string);
var
  stDoorNo,stReaderNo : string;
  stPermitCode : string;
  stTime : string;
  stCardNo : string;
  nCardNoLen : integer;
  bExitButton : Boolean;
  cButton : char; //근태 버튼
  cInputType : char; //변경 사유 (원격제어: "R" ,버튼: "B" ,카드: "C", 스케쥴동작  :'S'  )
  stTemp : string;
  nCardNo : int64;
  nDoorIndex : integer;
begin
  if LastAccessEvent = aData then Exit;
  LastAccessEvent := aData;  //마지막 데이터 저장해서 같은 데이터는 처리 하지 말자

  bExitButton := False;

  stDoorNo:=     aData[21];
  stReaderNo:=   aData[22];
  cInputType:=   aData[38];
  stPermitCode:= aData[39];
  cButton :=     aData[41];
  stTime:= Copy(aData,24,12);
  stTime:= copy(FormatDateTime('yyyymmdd',Now),1,2) + stTime;
  if isDigit(Copy(aData,42,2)) then
    nCardNoLen := strtoint(Copy(aData,42,2))
  else nCardNoLen := 0;

  if G_nCardLengthType = 0 then  //고정길이 타입이면
  begin
    stTemp := Copy(aData,44,8);
    if G_nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
    begin
      stCardNo := DecodeCardNo(stTemp,8,True);
      stCardNo := copy(stCardNo,1,6) + '00';
      nCardNo:= Hex2Dec64(stCardNo);
      stCardNo:= FillZeroNumber(nCardNo,10);
      if stCardNo = '0000000000' then bExitButton := True;
    end else
    begin
      if G_bCardTypeNumeric then
      begin
        stCardNo:= DecodeCardNo(stTemp);
        if stCardNo = '0000000000' then bExitButton := True;
      end
      else
      begin
        stCardNo:= DecodeCardNo(stTemp,8,True);
        if FillZeroNumber(Hex2Dec64(stCardNo),10) = '0000000000' then bExitButton := True;
      end;
    end;
  end else
  begin
    if nCardNoLen = 0 then Exit;
    stCardNo:= Copy(aData,44,nCardNoLen);
    stTemp := FillZeroNumber(0,nCardNoLen);
    if stCardNo = stTemp then bExitButton := True; //Exit 버튼 눌른것임

    if Not bExitButton then
    begin
      if G_nCardLengthType = 1 then
      begin
        if G_bCardTypeNumeric then stCardNo:= inttostr(Hex2Dec64(stCardNo));
      end else if G_nCardLengthType = 2 then   //KT사옥이면
      begin
        stCardNo := Hex2Ascii(stCardNo);
      end;
    end;
  end;
  if bExitButton then
  begin
    if cInputType = 'F' then
    begin
      nDoorIndex := DeviceDoorLIST.IndexOf(stDoorNo);
      if nDoorIndex > -1 then
      begin
        TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := True;
      end;
    end;
    if Assigned(FOnExitButton) then
    begin
      OnExitButton(Self,ParentNodeNo,EcuID,stDoorNo,stTime,cInputType);
    end;
    Exit;
  end;
  if Assigned(FOnAccessEvent) then
  begin
    OnAccessEvent(Self,ParentNodeNo,EcuID,stDoorNo,stReaderNo,stCardNo,stTime,stPermitCode,cInputType,cButton);
  end;

  if cInputType = 'F' then
  begin
    nDoorIndex := DeviceDoorLIST.IndexOf(stDoorNo);
    if nDoorIndex > -1 then
    begin
      TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := True;
    end;
  end;

end;

procedure TDeviceState.RecvAlarmEvent(aData: string);
var
  stAlarmColor : string;
  stCmd : string;
  stMsgNo : string;
  stTime : string;
  stSubClass : string;
  stSubAddr : string;
  stAlarmArea : string;
  stMode : string;
  stStatusCode : string;
  stPortNo : string;
  stState : string;
  stOperator : string;
  stNewStateCode : string;
  nTempIndex : integer;
  stTemp : string;
  bAlarmView : Boolean;
  bAlarmSound : Boolean;
  nAlarmIndex :integer;
begin
  if LastAlarmEvent = aData then Exit;
  LastAlarmEvent := aData;

  stAlarmColor := '255'; //무조건 빨간색으로 설정

  stCmd := UpperCase(aData[17]);   //'A' 알람발생,'O'상태조회
  stMsgNo    := aData[18];
  stTime     := copy(aData,20,14);
  stSubClass := copy(aData,34,2);
  stSubAddr  := copy(aData,36,2);
  stAlarmArea := copy(aData,38,2);
  if isDigit(stAlarmArea) then stAlarmArea := inttostr(strtoint(stAlarmArea))
  else stAlarmArea := '0';
  stMode     := UpperCase(aData[40]);
  stStatusCode   := copy(aData,41,2);
  stPortNo   := copy(aData,43,2);
  if isDigit(stPortNo) then stPortNo := inttostr(strtoint(stPortNo));
  stState    := aData[45];
  stOperator := copy(aData,46,10);

  if G_nDaemonServerVersion < 1 then
    stNewStateCode := stStatusCode
  else
  begin
    nTempIndex := Pos(';',aData);
    stTemp := copy(aData,nTempIndex + 1,Length(aData) - nTempIndex);
    stNewStateCode := copy(stTemp,1,2);
  end;

  if G_nDaemonServerVersion < 1 then
  begin
    if stCmd = 'A' then
    begin
      if stStatusCode = '00' then
      begin
        //Mode Change StateCode
        nTempIndex := AlarmModeNotCardList.IndexOf(stOperator);
        if nTempIndex > -1 then
        begin
          if stMode = 'A' then
            stNewStateCode := TAlarmStatusCode(AlarmModeNotCardList.Objects[nTempIndex]).ALARMSTATUSCODE
          else stNewStateCode := TAlarmStatusCode(AlarmModeNotCardList.Objects[nTempIndex]).DISALARMSTATUSCODE;
        end else
        begin
          if stMode = 'A' then stNewStateCode := 'A1'
          else stNewStateCode := 'C1';
        end;
      end else if isDigit(stPortNo) then
      begin
        //Alarm StateCode
        nTempIndex := ZoneDetectList.IndexOf(stStatusCode);
        if nTempIndex < 0 then
        begin
          stNewStateCode := 'Z' + stState;     //S:쇼트,N:정상,P:단선
        end;
      end;
    end;
  end;


  nTempIndex := AlarmEventViewStatusCode.Indexof(stStatusCode);
  if nTempIndex < 0 then
  begin
    nTempIndex := AlarmEventViewStatusCode.Indexof(stNewStateCode);
  end;
  if nTempIndex < 0 then bAlarmView := False
  else bAlarmView := True;

  nTempIndex := AlarmEventSoundStatusCode.Indexof(stStatusCode);
  if nTempIndex < 0 then
  begin
    nTempIndex := AlarmEventSoundStatusCode.Indexof(stNewStateCode);
  end;
  if nTempIndex < 0 then bAlarmSound := False
  else
  begin
    stAlarmColor := AlarmEventSoundColor.Strings[nTempIndex];
    bAlarmSound := True;
  end;

  if stPortNo <> '**' then    //포트 감지 인경우 무조건 뿌리자.
  begin
    if stState <> 'N' then
    begin
      bAlarmSound := True;
      bAlarmView := True;
    end else
    begin
      bAlarmSound := False; //존 복구는 알람 울리지 말자...
    end;
  end;

  nAlarmIndex := DeviceAlarmAreaLIST.IndexOf(stAlarmArea);
  if nAlarmIndex < 0 then Exit;     //해당 방범구역이 없으면 빠져 나감
  case UpperCase(stMode)[1] of
   'A': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmArm end;
   'D': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmDisarm end;
   'T': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmTest end;
   'I': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmInit end;
   'P': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmPatrol end;
   'E': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmJaejung end;
  else
    begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmNothing end;
  end;

  if (stSubCLass = 'MN') or (stSubCLass = 'EX')then
  begin
    if stStatusCode = 'NF' then
    begin
      TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmNothing;
    end;
  end;

  if stCmd <> 'A' then Exit; //알람 발생 상태가 아니면 이벤트 발생하지 말자.

  if bAlarmView or bAlarmSound then
  begin
    if bAlarmSound then TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).AlarmEventState := aeAlarmEvent
    else
    begin
      if TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).AlarmEventState <> aeAlarmEvent  then
         TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).AlarmEventState := aeNormalEvent;
    end;
  end else
  begin
    if TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).AlarmEventState = aeNothing then //이벤트 상태를 모르는 경우만 복구
       TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).AlarmEventState := aeNormal;
  end;

  if Assigned(FOnAlarmEventAnalysis) then
  begin
    OnAlarmEventAnalysis(Self,ParentNodeNo,EcuID,stCmd,stMsgNo,stTime,stSubClass,stSubAddr,
                                  stAlarmArea,stMode,stStatusCode,stPortNo,stState,
                                  stOperator,stNewStateCode,bAlarmView,bAlarmSound,stAlarmColor);
  end;

end;

procedure TDeviceState.RecvAlarmModeState(aControlType, aAlarmArea,
  aDeviceData: string);
var
  nAlarmIndex : integer;
begin
  nAlarmIndex := DeviceAlarmAreaLIST.IndexOf(aAlarmArea);
  if nAlarmIndex > -1 then
  begin
    if aControlType = 'S' then //상태정보
    begin
      case UpperCase(aDeviceData)[1] of
       'A': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmArm end;
       'D': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmDisarm end;
       'T': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmTest end;
       'I': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmInit end;
       'P': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmPatrol end;
       'E': begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmJaejung end;
      else
        begin TAlarmState(DeviceAlarmAreaLIST.Objects[nAlarmIndex]).WatchMode := cmNothing end;
      end;
    end;
  end;

end;

procedure TDeviceState.RecvDeviceSettingEvent(aData: string);
begin
  if Assigned(FOnDeviceSettingData) then
  begin
    OnDeviceSettingData(Self,ParentNodeNo,EcuID,aData);
  end;

end;

procedure TDeviceState.RecvDoorDataProcess(aControlType,aDoorNo,aData: string);
var
  nDoorIndex : integer;
begin
  nDoorIndex := DeviceDoorLIST.IndexOf(inttostr(strtoint(aDoorNo)));
  if nDoorIndex < 0 then Exit;

  if aControlType = 'S' then
  begin
      case aData[1] of  //운영개방
        '0' : begin
                TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmManager; //운영
              end;
        '1' : begin
                TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmOpen;   //개방
              end;
        '2' : begin
                TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmLock;   //폐쇄
              end;
        else begin
                TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorManageMode := dmNothing;   //모름
             end;
      end;
      case aData[2] of  //Posi Nega
        '0' : begin
                TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnPositive;  //Posi
              end;
        '1' : begin
                TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNegative;  //Posi
              end;
        else  begin
                TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorPNMode := pnNothing;  //Posi
              end;
      end;
      case aData[3] of  //DoorState
        'C': //닫힘
          begin
            TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doClose;
          end;
        'O': //열림
          begin
            TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doOpen;
          end;
        'E': //에러
          begin
            TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doNothing;
          end;
        'T','D'://장시간 열림
          begin
            TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doLongTime;
          end;
        'U':    //해정이상
          begin
            TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doOpenErr;
          end;
        'L':    //시정이상
          begin
            TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doCloseErr;
          end;
        else
          begin
            TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorOpenState := doNothing;
          end;
      end;
  end else if aControlType = 'F' then
  begin
      if aData[1] = 'F' then
      begin
        TDoorState(DeviceDoorLIST.Objects[nDoorIndex]).DoorFireOpen := True;
      end;
  end;
end;

procedure TDeviceState.SetDeviceConnected(const Value: Boolean);
var
  i : integer;
begin
  if FDeviceConnected = Value then Exit;

  FDeviceConnected := Value;
  if Assigned(FOnDeviceConnected) then
  begin
    OnDeviceConnected(Self,ParentNode.NodeNo,ECUID,Value);
  end;
  if Value then
  begin
    ParentNode.NodeConnected := Value;
  end else  //통신 끊김
  begin
    for i := 0 to DeviceDoorLIST.Count - 1 do
    begin
      TDoorState(DeviceDoorLIST.Objects[i]).StateClear;
    end;
    for i := 0 to DeviceAlarmAreaLIST.Count - 1 do
    begin
      TAlarmState(DeviceAlarmAreaLIST.Objects[i]).StateClear;
    end;
  end;
end;

procedure TDeviceState.SetECUID(const Value: String);
var
  i : integer;
begin
  FECUID := Value;
  for i := 0 to DeviceDoorLIST.Count - 1 do
  begin
    TDoorState(DeviceDoorLIST.Objects[i]).ParentECUID := Value;
  end;
  for i := 0 to DeviceAlarmAreaLIST.Count - 1 do
  begin
    TAlarmState(DeviceAlarmAreaLIST.Objects[i]).ParentECUID := Value;
  end;
end;

procedure TDeviceState.SetParentNodeNo(const Value: integer);
var
  i : integer;
begin
  FParentNodeNo := Value;
  for i := 0 to DeviceDoorLIST.Count - 1 do
  begin
    TDoorState(DeviceDoorLIST.Objects[i]).ParentNodeNo := Value;
  end;
  for i := 0 to DeviceAlarmAreaLIST.Count - 1 do
  begin
    TAlarmState(DeviceAlarmAreaLIST.Objects[i]).ParentNodeNo := Value;
  end;
end;

procedure TDeviceState.WatchModeChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aArmAreaNo: string; aWatchMode: TWatchMode);
begin
  if Assigned(FOnDoorLockStateChange) then
  begin
    OnWatchModeChange(Self,aNodeNo,aEcuID,aArmAreaNo,aWatchMode);
  end;
end;

{ TDoorState }

constructor TDoorState.Create(AOwner: TComponent);
begin
  inherited;
  StateClear;

end;

destructor TDoorState.Destroy;
begin

  inherited;
end;

procedure TDoorState.DoorListBuildingCode(aEcuID, aDoorNo, aBuildingCode,
  aFloorCode, aAreaCode: string);
begin

end;

procedure TDoorState.DoorListName(aEcuID, aDoorNo, aName: string);
begin

end;

procedure TDoorState.DoorStateReload;
begin
  case DoorManageMode of
    dmNothing: begin
      case DoorPNMode of
        pnNothing: begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              DOORSTATE := dsNothing;
            end;
            doOpen: begin
              DOORSTATE := dsNothing;
            end;
            doLongTime:begin
              DOORSTATE := dsNothing;
            end;
            doOpenErr:begin
              DOORSTATE := dsNothing;
            end;
            doCloseErr:begin
              DOORSTATE := dsNothing;
            end;
          end;
        end;
        pnPositive: begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              DOORSTATE := dsNothing;
            end;
            doOpen: begin
              DOORSTATE := dsNothing;
            end;
            doLongTime:begin
              DOORSTATE := dsNothing;
            end;
            doOpenErr:begin
              DOORSTATE := dsNothing;
            end;
            doCloseErr:begin
              DOORSTATE := dsNothing;
            end;
          end;
        end;
        pnNegative : begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              DOORSTATE := dsNothing;
            end;
            doOpen: begin
              DOORSTATE := dsNothing;
            end;
            doLongTime:begin
              DOORSTATE := dsNothing;
            end;
            doOpenErr:begin
              DOORSTATE := dsNothing;
            end;
            doCloseErr:begin
              DOORSTATE := dsNothing;
            end;
          end;
        end;
      end;
    end;
    dmManager: begin
      case DoorPNMode of
        pnNothing: begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              DOORSTATE := dsNothing;
            end;
            doOpen: begin
              DOORSTATE := dsNothing;
            end;
            doLongTime:begin
              DOORSTATE := dsNothing;
            end;
            doOpenErr:begin
              DOORSTATE := dsNothing;
            end;
            doCloseErr:begin
              DOORSTATE := dsNothing;
            end;
          end;
        end;
        pnPositive: begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              DOORSTATE := dsPMC;
            end;
            doOpen: begin
              DOORSTATE := dsPMO;
            end;
            doLongTime:begin
              DOORSTATE := dsPMO;
              if Not DoorFireOpen then
                DOOREVENT := deLongTime;
            end;
            doOpenErr:begin
              DOORSTATE := dsPMC;
              if Not DoorFireOpen then
                DOOREVENT := deOpenErr;
            end;
            doCloseErr:begin
              DOORSTATE := dsPMO;
              if Not DoorFireOpen then
                DOOREVENT := deCloseErr;
            end;
          end;
        end;
        pnNegative : begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              DOORSTATE := dsNMC;
            end;
            doOpen: begin
              DOORSTATE := dsNMO;
            end;
            doLongTime:begin
              DOORSTATE := dsNMO;
              if Not DoorFireOpen then
                DOOREVENT := deLongTime;
            end;
            doOpenErr:begin
              DOORSTATE := dsNMC;
              if Not DoorFireOpen then
                DOOREVENT := deOpenErr;
            end;
            doCloseErr:begin
              DOORSTATE := dsNMO;
              if Not DoorFireOpen then
                DOOREVENT := deCloseErr;
            end;
          end;
        end;
      end;
    end;
    dmOpen: begin
      case DoorPNMode of
        pnNothing: begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              DOORSTATE := dsNothing;
            end;
            doOpen: begin
              DOORSTATE := dsNothing;
            end;
            doLongTime:begin
              DOORSTATE := dsNothing;
            end;
            doOpenErr:begin
              DOORSTATE := dsNothing;
            end;
            doCloseErr:begin
              DOORSTATE := dsNothing;
            end;
          end;
        end;
        pnPositive: begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              if G_bDoorOpenModeOpenStateUse then DOORSTATE := dsPOO
              else DOORSTATE := dsPOC;
            end;
            doOpen: begin
              DOORSTATE := dsPOO;
            end;
            doLongTime:begin
              DOORSTATE := dsPOO;
              if Not DoorFireOpen then
                DOOREVENT := deLongTime;
            end;
            doOpenErr:begin
              if G_bDoorOpenModeOpenStateUse then DOORSTATE := dsPOO
              else DOORSTATE := dsPOC;
              if Not DoorFireOpen then
                DOOREVENT := deOpenErr;
            end;
            doCloseErr:begin
              DOORSTATE := dsPOO;
              if Not DoorFireOpen then
                DOOREVENT := deCloseErr;
            end;
          end;
        end;
        pnNegative : begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              if G_bDoorOpenModeOpenStateUse then DOORSTATE := dsNOO
              else DOORSTATE := dsNOC;
            end;
            doOpen: begin
              DOORSTATE := dsNOO;
            end;
            doLongTime:begin
              DOORSTATE := dsNOO;
              if Not DoorFireOpen then
                DOOREVENT := deLongTime;
            end;
            doOpenErr:begin
              if G_bDoorOpenModeOpenStateUse then DOORSTATE := dsNOO
              else DOORSTATE := dsNOC;
              if Not DoorFireOpen then
                DOOREVENT := deOpenErr;
            end;
            doCloseErr:begin
              DOORSTATE := dsNOO;
              if Not DoorFireOpen then
                DOOREVENT := deCloseErr;
            end;
          end;
        end;
      end;
    end;
    dmLock: begin
      case DoorPNMode of
        pnNothing: begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              DOORSTATE := dsNothing;
            end;
            doOpen: begin
              DOORSTATE := dsNothing;
            end;
            doLongTime:begin
              DOORSTATE := dsNothing;
            end;
            doOpenErr:begin
              DOORSTATE := dsNothing;
            end;
            doCloseErr:begin
              DOORSTATE := dsNothing;
            end;
          end;
        end;
        pnPositive: begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              DOORSTATE := dsPLC;
            end;
            doOpen: begin
              DOORSTATE := dsPLO;
            end;
            doLongTime:begin
              DOORSTATE := dsPLO;
              if Not DoorFireOpen then
                DOOREVENT := deLongTime;
            end;
            doOpenErr:begin
              DOORSTATE := dsPLC;
              if Not DoorFireOpen then
                DOOREVENT := deOpenErr;
            end;
            doCloseErr:begin
              DOORSTATE := dsPLO;
              if Not DoorFireOpen then
                DOOREVENT := deCloseErr;
            end;
          end;
        end;
        pnNegative : begin
          case DoorOpenState of
            doNothing: begin
              DOORSTATE := dsNothing;
            end;
            doClose: begin
              DOORSTATE := dsNLC;
            end;
            doOpen: begin
              DOORSTATE := dsNLO;
            end;
            doLongTime:begin
              DOORSTATE := dsNLO;
              if Not DoorFireOpen then
                DOOREVENT := deLongTime;
            end;
            doOpenErr:begin
              DOORSTATE := dsNLC;
              if Not DoorFireOpen then
                DOOREVENT := deOpenErr;
            end;
            doCloseErr:begin
              DOORSTATE := dsNLO;
              if Not DoorFireOpen then
                DOOREVENT := deCloseErr;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TDoorState.SetAreaCode(const Value: string);
begin
  FAreaCode := Value;
end;

procedure TDoorState.SetBuildingCode(const Value: string);
begin
  FBuildingCode := Value;
end;

procedure TDoorState.SetDOOREVENT(const Value: TDoorLockEvent);
begin
  if FDOOREVENT = Value then Exit;
  FDOOREVENT := Value;
  if Assigned(FOnDoorLockStateChange) then
  begin
    OnDoorLockEventChange(Self,ParentDevice.ParentNode.NodeNo,ParentDevice.ECUID,DOORNO,Value);
  end;
end;

procedure TDoorState.SetDoorFireOpen(const Value: Boolean);
begin
  if FDoorFireOpen = Value then Exit;

  FDoorFireOpen := Value;
  if Value then DOOREVENT := deFire
  else DOOREVENT := deNothing;

end;

procedure TDoorState.SetDoorLockMode(const Value: TDoorLockMode);
begin
  FDoorLockMode := Value;
end;

procedure TDoorState.SetDoorManageMode(const Value: TDoorManageMode);
begin
  if FDoorManageMode = Value then Exit;
  FDoorManageMode := Value;
  DoorStateReload;
end;

procedure TDoorState.SetDoorName(const Value: string);
begin
  FDoorName := Value;
end;

procedure TDoorState.SetDoorOpenState(const Value: TDoorOpenState);
begin
  if FDoorOpenState = Value then Exit;

  FDoorOpenState := Value;
  DoorStateReload;
end;

procedure TDoorState.SetDoorPNMode(const Value: TDoorPNMode);
begin
  if FDoorPNMode = Value then Exit;

  FDoorPNMode := Value;
  DoorStateReload;
end;

procedure TDoorState.SetDOORSTATE(const Value: TDoorLockState);
begin
  if FDOORSTATE = Value then Exit;
  FDOORSTATE := Value;
  if Assigned(FOnDoorLockStateChange) then
  begin
    OnDoorLockStateChange(Self,ParentDevice.ParentNode.NodeNo,ParentDevice.ECUID,DOORNO,Value);
  end;
end;

procedure TDoorState.SetFloorCode(const Value: string);
begin
  FFloorCode := Value;
end;

procedure TDoorState.StateClear;
begin
  DOORSTATE := dsNothing;
  DOOREVENT := deNothing;
end;

{ TAlarmState }

procedure TAlarmState.AlarmListBuildingCode(aEcuID, aAlarmArea, aBuildingCode,
  aFloorCode, aAreaCode: string);
begin
  BuildingCode := aBuildingCode;
  FloorCode := aFloorCode;
  AreaCode := aAreaCode;
end;

procedure TAlarmState.AlarmListName(aEcuID, aAlarmArea, aName: string);
begin
  AlarmName := aName;
end;

constructor TAlarmState.Create(AOwner: TComponent);
begin
  inherited;
  StateClear;
end;

destructor TAlarmState.Destroy;
begin

  inherited;
end;

procedure TAlarmState.SetAlarmEventState(const Value: TAlarmEventState);
begin
  if FAlarmEventState = value then Exit;
  FAlarmEventState := Value;
  {if FAlarmEventState = aeAlarmEvent then Exit;
  if aeAlarmEvent = aeNormalEvent then
  begin
    if Value = aeNormal then Exit;
  end;
   }

  if Assigned(FOnDeviceAlarmEventState) then
  begin
    OnDeviceAlarmEventState(self,ParentNodeNo,ParentECUID,AlarmAreaNo,BuildingCode,FloorCode,AreaCode,Value);
  end;
end;

procedure TAlarmState.SetAlarmName(const Value: string);
begin
  FAlarmName := Value;
end;

procedure TAlarmState.SetAreaCode(const Value: string);
begin
  FAreaCode := Value;  //향후 변경 되는 부분에 대해서 이벤트 발생 시켜서 빌딩별 구성시 이용
end;

procedure TAlarmState.SetBuildingCode(const Value: string);
begin
  FBuildingCode := Value;
end;

procedure TAlarmState.SetFloorCode(const Value: string);
begin
  FFloorCode := Value;
end;

procedure TAlarmState.SetWatchMode(const Value: TWatchMode);
begin
  if FWatchMode = Value then Exit;
  FWatchMode := Value;
  if Assigned(FOnWatchModeChange) then
  begin
    OnWatchModeChange(Self,ParentNodeNo,ParentECUID,AlarmAreaNo,Value);
  end;
end;

procedure TAlarmState.StateClear;
begin
  WatchMode := cmNothing;
  AlarmEventState := aeNothing;
end;

end.
