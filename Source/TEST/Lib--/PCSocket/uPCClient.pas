unit uPCClient;

interface

uses
  System.SysUtils, System.Classes,Winapi.WinSock,Winapi.Messages,
  Vcl.ExtCtrls,
  u_c_byte_buffer,uServerClientVariable,uServerClientFunction;

const
  wm_asynch_select= wm_User;
const
  k_buffer_max= 4096;
  k_tcp_ip_chunk= 1500;

type
  TSeverConnected = procedure(Sender: TObject;aDecoderNo:integer; aConnected:Boolean) of object;

type
  TdmPCClient = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    L_stReceiveBuffer : string;
    L_wsa_data: twsaData;
    L_Client_socket_handle:tSocket;
    l_c_reception_buffer : c_byte_buffer;
    L_bDataModuleDestory : Boolean;
    L_bDeviceStateChecking : Boolean;
    L_bDoorStateChecking : Boolean;
    L_nCurrentCheckNodeSeq : integer;
    L_nCurrentCheckDoorNodeSeq : integer;
    L_nDeviceStateCheckCount : integer;
    L_nDoorStateCheckCount : integer;
    L_nFile_size : integer;
    ClientAliveTimer : TTimer;
    DeviceStateTimer : TTimer; //��� ���¸� �������� �޾� ����.
    DoorStateCheckTimer : TTimer;
    NodeConncectCheckTimer : TTimer;
    RcvPacketProcessTimer : TTimer;
    SocketConnectCheckTimer : TTimer;
    ServerNFCheckTimer : TTimer;
    ServerNRCheckTimer : TTimer;
    DecoderNodeList : TStringList;
    RcvPacketList : TStringList;
    { Private declarations }
    procedure SocketPacketProcess;
    procedure SocketError(aErrCode:integer);
    procedure SocketConnectCheckTimerTimer(Sender: TObject);
    procedure ServerDataPacketProcess(aPacketData:string);

    procedure ClientAliveTimerTimer(Sender: TObject);
    procedure DeviceStateTimerTimer(Sender: TObject);

    procedure ArmAreaEventProcess(aRealData:string);
    procedure DeviceEventProcess(aRealData:string);
    procedure DeviceStateSearchProcess(aRealData:string);
    procedure DoorEventProcess(aRealData:string);
    procedure DoorStateCheckTimerTimer(Sender: TObject);
    procedure DoorStateSearchProcess(aRealData:string);
    procedure EcuEventProcess(aRealData:string);
    procedure ECUStateSearchProcess(aRealData:string);
    procedure MonitorEventProcess(aRealData:string);
    procedure NodeConncectCheckTimerTimer(Sender: TObject);
    procedure RcvPacketProcessTimerTimer(Sender: TObject);
    procedure ServerNFCheckTimerTimer(Sender: TObject);
    procedure ServerNRCheckTimerTimer(Sender: TObject);
  private
    //���� ���� �м� �κ�
    procedure RcvArmAreaModeChangeProcess(aNodeNo,aEcuID,aData:string); //������ ���� �̺�Ʈ
    procedure RcvDeviceAlarmEvent(aNodeNo,aEcuID,aData:string); //�˶��̺�Ʈ
    procedure RcvDeviceCardAccessEvent(aNodeNo,aEcuID,aData:string); //�����̺�Ʈ
    procedure RcvDeviceDoorArmAreaStateSearchProcess(aNodeNo,aEcuID,aData:string); //����,�������,���� ���� ��ȸ
    procedure RcvDeviceNetworkStateSearchProcess(aNodeNo,aEcuID,aData:string);  //��Ʈ�� ���� ��ȸ
    procedure RcvDoorStateChangeProcess(aNodeNo,aEcuID,aData:string);
    procedure RcvEcuNetworkStateChangeProcess(aNodeNo,aEcuID,aValue:string); //��Ʈ�ѷ� ��Ż��� ���� �̺�Ʈ
    procedure RcvKTDoorStateSearchProcess(aNodeCount,aData:string);
    procedure RcvOnlyMainDoorStateSearchProcess(aNodeCount,aData:string);
  private
    procedure ArmAreaCurrentAlarmStateChange(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure DeviceChangeEvent(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
    procedure DoorChangeEvent(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure NodeChangeEvent(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
  private
    //Handle ���� �κ�
    FHandle : THandle;
    FConnected: Boolean;
    FSocketConnect: Boolean;
    FServerPort: integer;
    FServerIP: string;
    FOnSeverConnected: TSeverConnected;
    FLastReceiveTime: TDateTime;
    FOnServerPacketView: TSCPacket;
    FOnDeviceCardAccessEvent: TSCDeviceCardAccessEvent;
    FOnDeviceAlarmEvent: TSCDeviceAlarmEvent;
    FOnAlarmConfirm: TSCExcEvent;
    FDecoderNo: integer;
    FOnArmAreaCurrentAlarmStateChange: TArmAreaSecurityModeChange;
    FOnArmAreaSecurityModeChange: TArmAreaSecurityModeChange;
    FOnDeviceChangeEvent: TDeviceChangeEvent;
    FOnDoorChangeEvent: TDoorChangeEvent;
    FOnNodeChangeEvent: TDeviceChangeEvent;
    FLastServerNetState: String;
    FOnServerNetworkState: TSCNetworkState;
    FReConnectCount: integer;
    FSocketConnectFail: string;
    FServerName: string;
    function GetHandle: THandle;
    function HandleAllocated : Boolean;
    procedure HandleNeeded;
    procedure SetConnected(const Value: Boolean);
    procedure SetSocketConnect(const Value: Boolean);
    procedure SetLastServerNetState(const Value: String);
    procedure SetFServerName(const Value: string);
  protected
    procedure WndProc ( var Message : TMessage ); virtual;
    procedure handle_wm_async_select(var Msg: TMessage); message wm_asynch_select;
    procedure handle_fd_read_notification(p_socket: tSocket);
    procedure handle_fd_write_notification(p_socket: Integer);
    procedure handle_fd_connect_notification(p_socket: Integer);
    procedure handle_fd_close_notification(p_socket: Integer);
  public
    { Public declarations }
    procedure SendPacket(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData:string);
    procedure AddArmArea(aNodeNo,aNodeIP,aNodeName,aEcuID,aEcuName,aArmAreaNo,aArmAreaName,aBuildingCode:string);
    procedure AddDoor(aNodeNo,aNodeIP,aNodeName,aEcuID,aEcuName,aDoorNo,aDoorName,aBuildingCode,aLockType:string);
    procedure AddNode(aNodeNo:string);
    procedure DeviceStateReSend;
    function GetArmAreaState(aCmd:integer;aNodeNo,aECUID,aArmArea:string):string;
    function GetNodeCount:integer;
    function GetNodeDeviceToArmAreaName(aNodeNo,aEcuID,aArmAreaNo:string):string;
    function GetNodeDeviceToArmAreaIndexInfo(aNodeNo,aEcuID:string;aArmAreaIndex:integer;var aArmAreaNo:string;var aArmAreaName:string):Boolean;
    function GetNodeDeviceToDoorName(aNodeNo,aEcuID,aSubCLass:string):string;
    function GetNodeDeviceToDoorIndexInfo(aNodeNo,aEcuID:string;aDoorIndex:integer;var aDoorNo:string;var aDoorName:string):Boolean;
    function GetNodeDeviceToDoorCount(aNodeNo,aEcuID:string):integer;
    function GetNodeDeviceToArmAreaCount(aNodeNo,aEcuID:string):integer;
    function GetNodeName(aNodeNo:string):string;
    function GetNodeIndex(aNodeNo:string):integer;
    function GetNodeIndexDeviceConnect(aNodeIndex:integer;aEcuID:string):string;
    function GetNodeIndexDeviceCount(aIndex:integer):integer;
    function GetNodeIndexDeviceIndexName(aNodeIndex,aDeviceIndex:integer;var aEcuID,aEcuName:string):Boolean;
    function GetNodeIndexIP(aIndex:integer):string;
    function GetNodeIndexName(aIndex:integer):string;
    function GetNodeIndexNodeConnected(aIndex:integer):string;
    function GetNodeIndexNodeNo(aIndex:integer):integer;
    function GetNodeIP(aNodeNo:string):string;
    function GetReceiveBufferCount : integer;
    procedure NodeIndexDeviceSort(aIndex:integer);
    procedure NodeToAlarmEventSetting(aNodeNo,aEcuID,aExtendID, aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,aAlarmStateCodeName,
              aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor:string);
    procedure NodeToArmAreaEventAllClear;
  published
    property Handle : THandle read GetHandle;
    property Connected : Boolean read FConnected write SetConnected;
    property DecoderNo : integer read FDecoderNo write FDecoderNo;
    property SocketConnect : Boolean read FSocketConnect write SetSocketConnect;
    property ServerName : string read FServerName write SetFServerName;
    property ServerIP : string read FServerIP write FServerIP;
    property ServerPort : integer read FServerPort write FServerPort;
    property LastReceiveTime : TDateTime read FLastReceiveTime write FLastReceiveTime;
    property LastServerNetState : String read FLastServerNetState write SetLastServerNetState;
  published
    property OnArmAreaCurrentAlarmStateChange : TArmAreaSecurityModeChange read FOnArmAreaCurrentAlarmStateChange write FOnArmAreaCurrentAlarmStateChange;
    property OnArmAreaSecurityModeChange : TArmAreaSecurityModeChange read FOnArmAreaSecurityModeChange write FOnArmAreaSecurityModeChange;
    property OnAlarmConfirm : TSCExcEvent read FOnAlarmConfirm write FOnAlarmConfirm;
    property OnDeviceAlarmEvent : TSCDeviceAlarmEvent read FOnDeviceAlarmEvent write FOnDeviceAlarmEvent;
    property OnDeviceCardAccessEvent : TSCDeviceCardAccessEvent read FOnDeviceCardAccessEvent write FOnDeviceCardAccessEvent;
    property OnDeviceChangeEvent : TDeviceChangeEvent read FOnDeviceChangeEvent write FOnDeviceChangeEvent;
    property OnDoorChangeEvent : TDoorChangeEvent read FOnDoorChangeEvent write FOnDoorChangeEvent;
    property OnNodeChangeEvent : TDeviceChangeEvent read FOnNodeChangeEvent write FOnNodeChangeEvent;
    property OnSeverConnected : TSeverConnected read FOnSeverConnected write FOnSeverConnected;
    property OnServerPacketView : TSCPacket read FOnServerPacketView write FOnServerPacketView;
    property OnServerNetworkState : TSCNetworkState read FOnServerNetworkState write FOnServerNetworkState;
  end;

var
  dmPCClient: TdmPCClient;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDBFunction,
  uFormVariable,
  uFormDeviceState;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}



procedure TdmPCClient.AddArmArea(aNodeNo, aNodeIP, aNodeName, aEcuID, aEcuName,
  aArmAreaNo, aArmAreaName, aBuildingCode: string);
var
  nIndex : integer;
  oNode : TMonitoringNode;
begin
  nIndex := DecoderNodeList.IndexOf(aNodeNo);
  if nIndex < 0 then
  begin
    oNode := TMonitoringNode.Create(nil);
    oNode.PCClientSocket := Self;
    oNode.DecoderNo := DecoderNo;
    oNode.NodeNo := strtoint(aNodeNo);
    oNode.NodeIP := aNodeIP;
    oNode.NodeName := aNodeName;


    oNode.SetDevice_Add(aEcuID,aEcuName);
    oNode.SetArmArea_Add(aEcuID,aArmAreaNo,aArmAreaName);
    oNode.SetArmArea_BuildingSetting(aEcuID,aArmAreaNo,aBuildingCode);

    oNode.OnArmAreaCurrentAlarmStateChange := ArmAreaCurrentAlarmStateChange;
    oNode.OnArmAreaSecurityModeChange := ArmAreaSecurityModeChange;
    oNode.OnDeviceChangeEvent := DeviceChangeEvent;
    oNode.OnDoorChangeEvent := DoorChangeEvent;
    oNode.OnNodeChangeEvent := NodeChangeEvent;

    DecoderNodeList.AddObject(aNodeNo,oNode);
  end else
  begin
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).SetDevice_Add(aEcuID,aEcuName);
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).SetArmArea_Add(aEcuID,aArmAreaNo,aArmAreaName);
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).SetArmArea_BuildingSetting(aEcuID,aArmAreaNo,aBuildingCode);
  end;
end;

procedure TdmPCClient.AddDoor(aNodeNo, aNodeIP, aNodeName, aEcuID, aEcuName,
  aDoorNo, aDoorName, aBuildingCode,aLockType: string);
var
  nIndex : integer;
  oNode : TMonitoringNode;
begin
  nIndex := DecoderNodeList.IndexOf(aNodeNo);

  if nIndex < 0 then
  begin
    oNode := TMonitoringNode.Create(nil);
    oNode.PCClientSocket := Self;
    oNode.DecoderNo := DecoderNo;
    oNode.NodeNo := strtoint(aNodeNo);
    oNode.NodeIP := aNodeIP;
    oNode.NodeName := aNodeName;


    oNode.SetDevice_Add(aEcuID,aEcuName);
    oNode.SetDoor_Add(aEcuID,aDoorNo,aDoorName);
    oNode.SetDoor_BuildingSetting(aEcuID,aDoorNo,aBuildingCode);
    oNode.SetDoor_LockTypeSetting(aEcuID,aDoorNo,aLockType);

    oNode.OnArmAreaCurrentAlarmStateChange := ArmAreaCurrentAlarmStateChange;
    oNode.OnArmAreaSecurityModeChange := ArmAreaSecurityModeChange;
    oNode.OnDeviceChangeEvent := DeviceChangeEvent;
    oNode.OnDoorChangeEvent := DoorChangeEvent;
    oNode.OnNodeChangeEvent := NodeChangeEvent;

    DecoderNodeList.AddObject(aNodeNo,oNode);
  end else
  begin
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).SetDevice_Add(aEcuID,aEcuName);
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).SetDoor_Add(aEcuID,aDoorNo,aDoorName);
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).SetDoor_BuildingSetting(aEcuID,aDoorNo,aBuildingCode);
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).SetDoor_LockTypeSetting(aEcuID,aDoorNo,aLockType);

(*    TMonitoringNode(DecoderNodeList.Objects[nIndex]).OnArmAreaCurrentAlarmStateChange := ArmAreaCurrentAlarmStateChange;
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).OnArmAreaSecurityModeChange := ArmAreaSecurityModeChange;
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).OnDeviceChangeEvent := DeviceChangeEvent;
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).OnDoorChangeEvent := DoorChangeEvent;
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).OnNodeChangeEvent := NodeChangeEvent;  *)
  end;

end;

procedure TdmPCClient.AddNode(aNodeNo: string);
var
  nIndex : integer;
begin
  nIndex := DecoderNodeList.IndexOf(aNodeNo);
  if nIndex < 0 then DecoderNodeList.Add(aNodeNo);
end;

procedure TdmPCClient.ArmAreaCurrentAlarmStateChange(Sender: TObject;aDecoderNo:integer; aNodeNo,
  aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
begin
  if Assigned(FOnArmAreaCurrentAlarmStateChange) then
  begin
    OnArmAreaCurrentAlarmStateChange(Self,aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode);
  end;
end;

procedure TdmPCClient.ArmAreaEventProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
  stTemp : string;
begin
  stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
  stEcuID := copy(aRealData,4 + G_nNodeCodeLength ,2);
  case aRealData[3] of
    'M' : begin  //��� ��� ����
        stData := aRealData;
        Delete(stData,1,4 + G_nNodeCodeLength + 1);
        RcvArmAreaModeChangeProcess(stNodeNo,stEcuID,stData);
    end;
  end;
end;

procedure TdmPCClient.ArmAreaSecurityModeChange(Sender: TObject;aDecoderNo:integer; aNodeNo,
  aEcuID, aArmAreaNo, aMode, aBuildingCode: string);
begin
  if Assigned(FOnArmAreaSecurityModeChange) then
  begin
    OnArmAreaSecurityModeChange(Self,aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode);
  end;

end;

procedure TdmPCClient.ClientAliveTimerTimer(Sender: TObject);
begin
  if L_bDataModuleDestory then Exit;
  if Not Connected then Exit;  //���� ���� ���� ���¿����� �׳� ���� ������.
  SendPacket('e',SCECU,'*','0000','00','Alive');
end;

procedure TdmPCClient.DataModuleCreate(Sender: TObject);
begin
  L_nFile_size := 0;
  L_Client_socket_handle:= Invalid_socket;
  l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
  SocketConnectCheckTimer := TTimer.Create(nil);
  SocketConnectCheckTimer.Interval := 10000;
  SocketConnectCheckTimer.OnTimer := SocketConnectCheckTimerTimer;
  SocketConnectCheckTimer.Enabled := False;

  ClientAliveTimer := TTimer.Create(nil);
  ClientAliveTimer.Interval := 100000;
  ClientAliveTimer.OnTimer := ClientAliveTimerTimer;
  ClientAliveTimer.Enabled := False;

  DeviceStateTimer := TTimer.Create(nil);
  DeviceStateTimer.Interval := 100000;
  DeviceStateTimer.OnTimer := DeviceStateTimerTimer;
  DeviceStateTimer.Enabled := False;

  DoorStateCheckTimer := TTimer.Create(nil);
  DoorStateCheckTimer.Interval := 2000;
  DoorStateCheckTimer.OnTimer := DoorStateCheckTimerTimer;
  DoorStateCheckTimer.Enabled := False;

  NodeConncectCheckTimer := TTimer.Create(nil);
  NodeConncectCheckTimer.Interval := 2000;
  NodeConncectCheckTimer.OnTimer := NodeConncectCheckTimerTimer;
  NodeConncectCheckTimer.Enabled := False;

  RcvPacketProcessTimer := TTimer.Create(nil);
  RcvPacketProcessTimer.Interval := 5;
  RcvPacketProcessTimer.OnTimer := RcvPacketProcessTimerTimer;
  RcvPacketProcessTimer.Enabled := False;

  ServerNFCheckTimer := TTimer.Create(nil);
  ServerNFCheckTimer.Interval := 60000;
  ServerNFCheckTimer.OnTimer := ServerNFCheckTimerTimer;
  ServerNFCheckTimer.Enabled := True;

  ServerNRCheckTimer := TTimer.Create(nil);
  ServerNRCheckTimer.Interval := 60000;
  ServerNRCheckTimer.OnTimer := ServerNRCheckTimerTimer;
  ServerNRCheckTimer.Enabled := False;

  DecoderNodeList := TStringList.create;
  RcvPacketList  := TStringList.create;
end;

procedure TdmPCClient.DataModuleDestroy(Sender: TObject);
begin
  L_bDataModuleDestory := True;

  SocketConnectCheckTimer.Enabled := False;
  SocketConnectCheckTimer.Free;
  ClientAliveTimer.Enabled := False;
  ClientAliveTimer.Free;
  DeviceStateTimer.Enabled := False;
  DeviceStateTimer.Free;
  DoorStateCheckTimer.Enabled := False;
  DoorStateCheckTimer.Free;
  NodeConncectCheckTimer.Enabled := False;
  NodeConncectCheckTimer.Free;
  ServerNFCheckTimer.Enabled := False;
  ServerNFCheckTimer.Free;
  ServerNRCheckTimer.Enabled := False;
  ServerNRCheckTimer.Free;

  DecoderNodeList.Clear;
  DecoderNodeList.free;
  RcvPacketList.Free;

  l_c_reception_buffer.Free;

  if HandleAllocated
   then DeAllocateHWND ( FHandle );
end;

procedure TdmPCClient.RcvArmAreaModeChangeProcess(aNodeNo, aEcuID,
  aData: string);
var
  nIndex : integer;
  stTemp : string;
begin
  if aData = '' then Exit;

  if DecoderNodeList = nil then Exit;  //�������� ����ϴ� ��⿡�� �������� ���� �޸𸮰� ������ �ִ�.

  nIndex := DecoderNodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex < 0 then Exit;
  TMonitoringNode(DecoderNodeList.Objects[nIndex]).RcvNodeToArmAreaModeChangeProcess(aEcuID,aData);

end;

procedure TdmPCClient.RcvDeviceAlarmEvent(aNodeNo, aEcuID, aData: string);
var
  stData : string;
  chExtendID : char;
  chCmd, chMsgNo : char;
  stTime, stSubCLass, stSubAddr, stArmArea, stMode, stAlarmStateCode, stLoop: string;
  stZoneState, stOper, stAlarmStateCodeName, stAlarmStatePCCode : string;
  stAlarmStatePCCodeName,stArmModeChange, stAlarmView, stAlarmSound, stAlarmColor : string;
  bServerAlarm : Boolean;
  nIndex : integer;
begin
  if aData = '' then Exit;
  bServerAlarm := False;
  stData := aData;
  chExtendID := stData[1];
  Delete(stData,1,1);
  chCmd := stData[1];
  Delete(stData,1,1);
  chMsgNo := stData[1];
  Delete(stData,1,1);
  stTime := copy(stData,1,14);
  Delete(stData,1,14);
  stSubCLass := copy(stData,1,2);
  Delete(stData,1,2);
  stSubAddr := copy(stData,1,2);
  Delete(stData,1,2);
  stArmArea := copy(stData,1,2);
  Delete(stData,1,2);
  stMode := copy(stData,1,1);
  Delete(stData,1,1);
  stAlarmStateCode := copy(stData,1,2);
  Delete(stData,1,2);
  stLoop := copy(stData,1,2);
  if isDigit(stLoop) then stLoop := inttostr(strtoint(stLoop))
  else stLoop := '0';
  Delete(stData,1,2);
  stZoneState := copy(stData,1,1);
  Delete(stData,1,1);
  Delete(stData,1,1); //',' ����
  stOper := FindCharCopy(stData,0,',');
  stAlarmStateCodeName := FindCharCopy(stData,1,',');
  stAlarmStatePCCode := FindCharCopy(stData,2,',');
  stAlarmStatePCCodeName := FindCharCopy(stData,3,',');
  stArmModeChange := FindCharCopy(stData,4,',');
  stAlarmView := FindCharCopy(stData,5,',');
  stAlarmSound := FindCharCopy(stData,6,',');
  stAlarmColor := FindCharCopy(stData,7,',');

  if stAlarmStateCode = G_stLongTimeStateCode  then bServerAlarm := True; //��ð� ���� �̺�Ʈ�� �������� ������ �̺�Ʈ�̴�.


  if Assigned(FOnDeviceAlarmEvent) then
  begin
    OnDeviceAlarmEvent(Self,DecoderNo,aNodeNo,aEcuID,chExtendID, chCmd,chMsgNo,stTime,stSubCLass,stSubAddr,stArmArea,
                             stMode,stAlarmStateCode,stLoop,stZoneState,stOper,stAlarmStateCodeName,stAlarmStatePCCode,stAlarmStatePCCodeName,
                             stArmModeChange,stAlarmView,stAlarmSound,stAlarmColor);
  end;

  nIndex := DecoderNodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex < 0 then Exit;
  TMonitoringNode(DecoderNodeList.Objects[nIndex]).RcvNodeToAlarmEventProcess(aEcuID,chExtendID, chCmd,chMsgNo,stTime,stSubCLass,stSubAddr,stArmArea,
                             stMode,stAlarmStateCode,stLoop,stZoneState,stOper,stAlarmStateCodeName,stAlarmStatePCCode,stAlarmStatePCCodeName,
                             stArmModeChange,stAlarmView,stAlarmSound,stAlarmColor,bServerAlarm);


end;

procedure TdmPCClient.RcvDeviceCardAccessEvent(aNodeNo, aEcuID, aData: string);
var
  stData : string;
  stDoorNo : string;
  stReaderNo : string;
  stInOut : string;
  stCardMode : string;
  stDoorMode : string;
  stChangeState : string;
  stAccessResult : string;
  stDoorState : string;
  stATButton : string;
  stType : string;
  stArmAreaNo : string;
  stTime : string;
  stCardno : string;
  stCompanyCode : string;
  stCompanyName : string;
  stEmSeq : string;
  stEmCode : string;
  stEmName : string;
  stPosiCode : string;
  stPosiName : string;
  stPrintNo : string;
  stHandPhone : string;
begin
  if aData = '' then Exit;
  stData := aData;
  stDoorNo := copy(stData,1,2);
  Delete(stData,1,2);
  stReaderNo := stData[1];
  Delete(stData,1,1);
  stInOut := stData[1];
  Delete(stData,1,1);
  stCardMode := stData[1];
  Delete(stData,1,1);
  stDoorMode := stData[1];
  Delete(stData,1,1);
  stChangeState := stData[1];
  Delete(stData,1,1);
  stAccessResult := stData[1];
  Delete(stData,1,1);
  stDoorState := stData[1];
  Delete(stData,1,1);
  stATButton := stData[1];
  Delete(stData,1,1);
  stType := stData[1];
  Delete(stData,1,1);
  stArmAreaNo := stData[1];
  Delete(stData,1,1);
  Delete(stData,1,1); //',' ����
  stTime := FindCharCopy(stData,0,',');
  stCardno := FindCharCopy(stData,1,',');
  stCompanyCode := FindCharCopy(stData,2,',');
  stCompanyName := FindCharCopy(stData,3,',');
  stEmSeq := FindCharCopy(stData,4,',');
  stEmCode := FindCharCopy(stData,5,',');
  stEmName := FindCharCopy(stData,6,',');
  stPosiCode := FindCharCopy(stData,7,',');
  stPosiName := FindCharCopy(stData,8,',');
  stPrintNo := FindCharCopy(stData,9,',');
  stHandPhone := FindCharCopy(stData,10,',');
  if Assigned(FOnDeviceCardAccessEvent) then
  begin
    OnDeviceCardAccessEvent(Self,DecoderNo,stTime,aNodeNo, aEcuID,stDoorNo,stReaderNo,stInOut,stCardMode,stDoorMode,
                             stChangeState,stAccessResult,stDoorState,stATButton,stType,stArmAreaNo,stCardno,stCompanyCode,
                             stCompanyName,stEmSeq,stEmCode,stEmName,stPosiCode,stPosiName,stPrintNo,stHandPhone);
  end;
end;

procedure TdmPCClient.RcvDeviceDoorArmAreaStateSearchProcess(aNodeNo, aEcuID,
  aData: string);
var
  nIndex : integer;
  nDoorCount : integer;
  nDoorFormatLength :integer;
  stDoorStateData : string;
  nArmAreaCount : integer;
  nArmAreaFormatLength :integer;
  stArmAreaStateData : string;
  nCardReaderCount : integer;
  nCardReaderFormatLength :integer;
  stCardReaderStateData : string;
  stData : string;
begin
  if aData = '' then Exit;
  nIndex := DecoderNodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex < 0 then Exit;
  stData := aData;
  Try
    nDoorCount := ord(stData[1]) - $30;
    nDoorFormatLength := ord(stData[2]) - $30;
    if (nDoorCount > 0) and (nDoorFormatLength > 0) then
    begin
      stDoorStateData := copy(stData,3,nDoorCount * nDoorFormatLength);
      TMonitoringNode(DecoderNodeList.Objects[nIndex]).RcvNodeToDoorStateProcess(aEcuID,nDoorCount,nDoorFormatLength,stDoorStateData);
    end;
    Delete(stData,1,3 + (nDoorCount * nDoorFormatLength) - 1);
    if stData = '' then Exit;
    nArmAreaCount := ord(stData[1]) - $30;
    nArmAreaFormatLength := ord(stData[2]) - $30;
    if (nArmAreaCount > 0) and (nArmAreaFormatLength > 0) then
    begin
      stArmAreaStateData := copy(stData,3,nArmAreaCount * nArmAreaFormatLength);
      TMonitoringNode(DecoderNodeList.Objects[nIndex]).RcvNodeToArmAreaStateProcess(aEcuID,nArmAreaCount,nArmAreaFormatLength,stArmAreaStateData);
    end;
    Delete(stData,1,3 + (nArmAreaCount * nArmAreaFormatLength) - 1);

    if stData = '' then Exit;
    nCardReaderCount := ord(stData[1]) - $30;
    nCardReaderFormatLength := ord(stData[2]) - $30;
    if (nCardReaderCount > 0) and (nCardReaderFormatLength > 0) then
    begin
      stCardReaderStateData := copy(stData,3,nCardReaderCount * nCardReaderFormatLength);
    end;

  Except
    Exit;
  End;
end;

procedure TdmPCClient.RcvDeviceNetworkStateSearchProcess(aNodeNo, aEcuID,
  aData: string);
var
  nIndex : integer;
begin
  if aData = '' then Exit;

  nIndex := DecoderNodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex < 0 then Exit;
  TMonitoringNode(DecoderNodeList.Objects[nIndex]).RcvNodeToDeviceNetworkStateSearchProcess(aData);
end;

procedure TdmPCClient.RcvDoorStateChangeProcess(aNodeNo, aEcuID, aData: string);
var
  nIndex : integer;
  stTemp : string;
begin
  if aData = '' then Exit;

  if DecoderNodeList = nil then Exit;  //�������� ����ϴ� ��⿡�� �������� ���� �޸𸮰� ������ �ִ�.

  nIndex := DecoderNodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex < 0 then Exit;
  TMonitoringNode(DecoderNodeList.Objects[nIndex]).RcvNodeToDoorStateChangeProcess(aEcuID,aData);
end;

procedure TdmPCClient.RcvEcuNetworkStateChangeProcess(aNodeNo, aEcuID,
  aValue: string);
var
  nIndex : integer;
begin
  if aValue = '' then Exit;

  nIndex := DecoderNodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex < 0 then Exit;
  TMonitoringNode(DecoderNodeList.Objects[nIndex]).RcvNodeToEcuNetworkStateChangeProcess(aEcuID,aValue);
end;

procedure TdmPCClient.RcvKTDoorStateSearchProcess(aNodeCount, aData: string);
var
  i : integer;
  stNodeData : string;
  stNodeNo : string;
  stDoorState : string;
  stDoorBinData : string;
  nIndex : integer;
begin
  if Not isDigit(aNodeCount) then Exit;
  if DecoderNodeList = nil then Exit;  //�������� ����ϴ� ��⿡�� �������� ���� �޸𸮰� ������ �ִ�.
  for i := 1 to strtoint(aNodeCount) do
  begin
    stNodeData := copy(aData,(i-1) * (G_nNodeCodeLength + 2) + 1,(G_nNodeCodeLength + 2));
    stNodeNo := copy(stNodeData,1,G_nNodeCodeLength);
    stDoorState := copy(stNodeData,1 + G_nNodeCodeLength,2);
    stDoorBinData := Hex2Binary(stDoorState);
    nIndex := DecoderNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(DecoderNodeList.Objects[nIndex]).RcvKTDoorStateBinary(stDoorBinData);
    end;
  end;
end;

procedure TdmPCClient.RcvOnlyMainDoorStateSearchProcess(aNodeCount,
  aData: string);
var
  i,j : integer;
  stNodeData : string;
  stNodeNo : string;
  stDoorState : string;
  stDoorBinData : string;
  nIndex : integer;
begin
  if Not isDigit(aNodeCount) then Exit;
  if DecoderNodeList = nil then Exit;  //�������� ����ϴ� ��⿡�� �������� ���� �޸𸮰� ������ �ִ�.
  for i := 1 to strtoint(aNodeCount) do
  begin
    stNodeData := copy(aData,(i-1) * (G_nNodeCodeLength + (2 * G_nMonitoringOnlyDoorCount)) + 1,(G_nNodeCodeLength + (2 * G_nMonitoringOnlyDoorCount)));
    stNodeNo := copy(stNodeData,1,G_nNodeCodeLength);
    stDoorState := copy(stNodeData,1 + G_nNodeCodeLength,2 * G_nMonitoringOnlyDoorCount);
    nIndex := DecoderNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      for j := 1 to G_nMonitoringOnlyDoorCount do
      begin
        stDoorBinData := Hex2Binary(copy(stDoorState,((j - 1) * 2) + 1,2));
        TMonitoringNode(DecoderNodeList.Objects[nIndex]).RcvOnlyMainDoorStateBinary(j,stDoorBinData);
      end;
    end;
  end;
end;

procedure TdmPCClient.RcvPacketProcessTimerTimer(Sender: TObject);
var
  stPacketData : string;
begin
  if L_bDataModuleDestory then Exit;
  if G_bApplicationTerminate then Exit;
  Try
    if RcvPacketList.Count < 1 then Exit;
    RcvPacketProcessTimer.Enabled := False;
    Try
      stPacketData := RcvPacketList.Strings[0];
      RcvPacketList.Delete(0);
      ServerDataPacketProcess(stPacketData);
    Finally
      RcvPacketProcessTimer.Enabled := Not L_bDataModuleDestory;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','PCClient.RcvPacketProcessTimerTimer');
  End;
end;

procedure TdmPCClient.DeviceChangeEvent(Sender: TObject;aDecoderNo:integer; aNodeNo, aEcuID, aType,
  aNo, aCmd, aData: string);
begin
  if Assigned(FOnDeviceChangeEvent) then
  begin
    OnDeviceChangeEvent(Self,aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData);
  end;
end;

procedure TdmPCClient.DeviceEventProcess(aRealData: string);
begin

  case aRealData[2] of
    SCECU : begin
      ECUEventProcess(aRealData);
    end;
    SCDOOR : begin
      DoorEventProcess(aRealData);
    end;
    SCARMAREA : begin
      ArmAreaEventProcess(aRealData);
    end;
    SCMONITORING : begin
      MonitorEventProcess(aRealData);
    end;
  end;

end;

procedure TdmPCClient.DeviceStateReSend;
var
  i : integer;
begin
  if DecoderNodeList.Count < 1 then Exit;

  for i := 0 to DecoderNodeList.Count - 1 do
  begin
    TMonitoringNode(DecoderNodeList.Objects[i]).DeviceStateReSend;
  end;
end;

procedure TdmPCClient.DeviceStateSearchProcess(aRealData: string);
begin
  case aRealData[2] of
    SCECU : begin
      ECUStateSearchProcess(aRealData);
    end;
    SCDOOR : begin
      DoorStateSearchProcess(aRealData);
    end;
    SCARMAREA : begin

    end;
  end;
end;

procedure TdmPCClient.DeviceStateTimerTimer(Sender: TObject);
var
  i : integer;
  bCheck : Boolean;
begin
  inherited;
  if L_bDataModuleDestory then Exit;
  if G_bApplicationTerminate then Exit;
  if Not Connected then Exit;  //���� ���� ���� ���¿����� �׳� ���� ������.
  DeviceStateTimer.Interval := 1000; //ó�� �ѹ��� �� �Ŀ��� 1�ʿ� �ѹ��� ����. TEST
  if L_nDeviceStateCheckCount > 3 then
  begin
    L_nDeviceStateCheckCount := 0;
    L_bDeviceStateChecking := False; //������ Ǯ��
  end;
  if L_bDeviceStateChecking then
  begin
    inc(L_nDeviceStateCheckCount);
    Exit;
  end;
  Try
    Try
      L_bDeviceStateChecking := True;
      if L_nCurrentCheckNodeSeq < 0 then L_nCurrentCheckNodeSeq := 0;
      if L_nCurrentCheckNodeSeq > DecoderNodeList.Count - 1 then
      begin
        L_nCurrentCheckNodeSeq := 0;
      end;
      if DecoderNodeList.Count < 1 then Exit;
      if TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckNodeSeq]).ServerRcv <> 'Y' then
      begin
        TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckNodeSeq]).NodeStateCheck;
      end;
      if G_bApplicationTerminate then Exit;
      if L_nCurrentCheckNodeSeq = DecoderNodeList.Count - 1 then
      begin
        L_nCurrentCheckNodeSeq := 0;
        bCheck := True;
        for i := 0 to DecoderNodeList.Count - 1 do
          if TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckNodeSeq]).ServerRcv <> 'Y' then bCheck := False;

        if bCheck then
        begin
          DeviceStateTimer.Enabled := False; //�������� ��� ���� ���� ��� ���� Ÿ�̸� ����
          NodeConncectCheckTimer.Enabled := True;
        end;
      end else
      begin
        L_nCurrentCheckNodeSeq := L_nCurrentCheckNodeSeq + 1;
      end;
    Except
      Exit;
    End;

  Finally
    L_bDeviceStateChecking := False;
  End;
end;

procedure TdmPCClient.DoorChangeEvent(Sender: TObject; aDecoderNo:integer;aNodeNo, aEcuID, aType,
  aNo, aCmd, aData, aBuildingCode: string);
begin
  if Assigned(FOnDoorChangeEvent) then
  begin
    OnDoorChangeEvent(Self,aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode);
  end;
end;

procedure TdmPCClient.DoorEventProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
  stTemp : string;
begin
  stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
  stEcuID := copy(aRealData,4 + G_nNodeCodeLength ,2);
  case aRealData[3] of
    'D' : begin  //���Թ� ���º��� �̺�Ʈ
        stData := aRealData;
        Delete(stData,1,4 + G_nNodeCodeLength + 1);
        RcvDoorStateChangeProcess(stNodeNo,stEcuID,stData);
    end;
  end;
end;

procedure TdmPCClient.DoorStateCheckTimerTimer(Sender: TObject);
var
  i,j,k : integer;
  nDeviceCount,nDoorCount : integer;
  bCheck : Boolean;
  stDSState : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
begin
  if L_bDataModuleDestory then Exit;
  if G_bApplicationTerminate then Exit;
  if Not Connected then Exit;

  if L_nDoorStateCheckCount > 3 then
  begin
    L_nDoorStateCheckCount := 0;
    L_bDoorStateChecking := False; //������ Ǯ��
  end;
  if L_bDoorStateChecking then
  begin
    inc(L_nDoorStateCheckCount);
    Exit;
  end;
  Try
    Try
      bCheck := False;
      L_bDoorStateChecking := True;
      if L_nCurrentCheckDoorNodeSeq < 0 then L_nCurrentCheckDoorNodeSeq := 0;
      if L_nCurrentCheckDoorNodeSeq > DecoderNodeList.Count - 1 then L_nCurrentCheckDoorNodeSeq := 0;
      if DecoderNodeList.Count < 1 then Exit;
      if TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).NodeConnected <> '0' then  //���� �Ǿ� ������ ���Թ� ���� üũ ����.
      begin
        nDeviceCount := TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceCount;
        for j := 0 to nDeviceCount do
        begin
          if TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceIndexConnect(j) = '1' then  //��Ʈ�ѷ� ���� �Ǿ� �ִµ�...
          begin
            nDoorCount := TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceIndexDoorCount(j);
            if nDoorCount > 0 then
            begin
              for k := 0 to nDoorCount do
              begin
                stDSState := TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceIndexDoorIndexDSState(j,k) ;
                if (stDSState = '') or (stDSState = '*') then
                begin
                  bCheck := True;
                  stNodeNo := FillZeroNumber(TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).NodeNo,G_nNodeCodeLength);
                  stEcuID := TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceIndexEcuID(j);
                  stDoorNo := TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceIndexDoorID(j,k);
                  TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,FillZeroNumber(strtoint(stDoorNo),2));
                  break;
                end;
              end;
            end;
          end;
        end;
      end;
      if G_bApplicationTerminate then Exit;
      if L_nCurrentCheckDoorNodeSeq = 0 then
      begin
        L_nCurrentCheckDoorNodeSeq := L_nCurrentCheckDoorNodeSeq + 1;

        if Not bCheck then
        begin
          DoorStateCheckTimer.Enabled := False;
        end;
      end else
      begin
        L_nCurrentCheckDoorNodeSeq := L_nCurrentCheckDoorNodeSeq + 1;
      end;
    Except
      Exit;
    End;

  Finally
    L_bDoorStateChecking := False;
  End;
end;

procedure TdmPCClient.DoorStateSearchProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
begin
  stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
  stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
  case aRealData[3] of
    'K' : begin  //�бⱹ��
        stData := aRealData;
        Delete(stData,1,4 + G_nNodeCodeLength + 1);
        //stNodeNo �� ��� ����
        RcvKTDoorStateSearchProcess(stNodeNo,stData);
    end;
    'O' : begin  //���� ���� ����ϴ� ����Ÿ��
        stData := aRealData;
        Delete(stData,1,4 + G_nNodeCodeLength + 1);
        //stNodeNo �� ��� ����
        RcvOnlyMainDoorStateSearchProcess(stNodeNo,stData);
    end;
  end;

end;

procedure TdmPCClient.EcuEventProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
begin
  stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
  stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
  case aRealData[3] of
    'A' : begin  //�����̺�Ʈ
        stData := aRealData;
        Delete(stData,1,4 + G_nNodeCodeLength + 1);
        RcvDeviceCardAccessEvent(stNodeNo,stEcuID,stData);
    end;
    'N' : begin  //��Ʈ�ѷ� ��Ʈ�� ���� ����
        stData := aRealData;
        Delete(stData,1,4 + G_nNodeCodeLength + 1);
        RcvEcuNetworkStateChangeProcess(stNodeNo,stEcuID,stData);
    end;
    'S' : begin  //����̺�Ʈ(Security
        stData := aRealData;
        Delete(stData,1,4 + G_nNodeCodeLength + 1);
        RcvDeviceAlarmEvent(stNodeNo,stEcuID,stData);
    end;
  end;
end;

procedure TdmPCClient.ECUStateSearchProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
begin
  stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
  stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
  case aRealData[3] of
    'N' : begin  //��Ʈ�� ����
        stData := aRealData;
        Delete(stData,1,4 + G_nNodeCodeLength + 1);
        RcvDeviceNetworkStateSearchProcess(stNodeNo,stEcuID,stData);
    end;
    's' : begin  //��Ʈ�ѷ� ����
        stData := aRealData;
        Delete(stData,1,4 + G_nNodeCodeLength + 1);
        RcvDeviceDoorArmAreaStateSearchProcess(stNodeNo,stEcuID,stData);
    end;
  end;
end;

function TdmPCClient.GetArmAreaState(aCmd: integer; aNodeNo, aECUID,
  aArmArea: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DecoderNodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[nIndex]).GetArmAreaState(aCmd,aECUID,aArmArea);
end;

function TdmPCClient.GetHandle: THandle;
begin
  HandleNeeded;
  Result := FHandle;
end;

function TdmPCClient.GetNodeCount: integer;
begin
  result := DecoderNodeList.Count;
end;

function TdmPCClient.GetNodeDeviceToArmAreaCount(aNodeNo,
  aEcuID: string): integer;
var
  nIndex : integer;
  stNodeNo : string;
begin
  result := -1;
  stNodeNo := FillZeroStrNum(aNodeNo,G_nNodeCodeLength);
  nIndex := DecoderNodeList.IndexOf(stNodeNo);
  if nIndex < 0 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[nIndex]).GetNodeDeviceToArmAreaCount(aEcuID);

end;

function TdmPCClient.GetNodeDeviceToArmAreaIndexInfo(aNodeNo, aEcuID: string;
  aArmAreaIndex: integer; var aArmAreaNo:string; var aArmAreaName: string): Boolean;
var
  nIndex : integer;
  stNodeNo : string;
begin
  result := False;
  stNodeNo := FillZeroStrNum(aNodeNo,G_nNodeCodeLength);
  nIndex := DecoderNodeList.IndexOf(stNodeNo);
  if nIndex < 0 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[nIndex]).GetNodeDeviceToArmAreaIndexInfo(aEcuID,aArmAreaIndex,aArmAreaNo, aArmAreaName);

end;

function TdmPCClient.GetNodeDeviceToArmAreaName(aNodeNo, aEcuID,
  aArmAreaNo: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DecoderNodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[nIndex]).GetDeviceToArmAreaName(aEcuID,aArmAreaNo);
end;

function TdmPCClient.GetNodeDeviceToDoorCount(aNodeNo, aEcuID: string): integer;
var
  nIndex : integer;
  stNodeNo : string;
begin
  result := -1;
  stNodeNo := FillZeroStrNum(aNodeNo,G_nNodeCodeLength);
  nIndex := DecoderNodeList.IndexOf(stNodeNo);
  if nIndex < 0 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[nIndex]).GetNodeDeviceToDoorCount(aEcuID);

end;

function TdmPCClient.GetNodeDeviceToDoorIndexInfo(aNodeNo, aEcuID: string;
  aDoorIndex: integer; var aDoorNo, aDoorName: string): Boolean;
var
  nIndex : integer;
  stNodeNo : string;
begin
  result := False;
  stNodeNo := FillZeroStrNum(aNodeNo,G_nNodeCodeLength);
  nIndex := DecoderNodeList.IndexOf(stNodeNo);
  if nIndex < 0 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[nIndex]).GetNodeDeviceToDoorIndexInfo(aEcuID,aDoorIndex,aDoorNo, aDoorName);
end;

function TdmPCClient.GetNodeDeviceToDoorName(aNodeNo, aEcuID,
  aSubCLass: string): string;
var
  nIndex : integer;
  stNodeNo : string;
begin
  result := '';
  stNodeNo := FillZeroStrNum(aNodeNo,G_nNodeCodeLength);
  nIndex := DecoderNodeList.IndexOf(stNodeNo);
  if nIndex < 0 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[nIndex]).GetDeviceToDoorName(aEcuID,aSubCLass);
end;

function TdmPCClient.GetNodeIndex(aNodeNo: string): integer;
var
  stNodeNo : string;
begin
  stNodeNo := FillZeroStrNum(aNodeNo,G_nNodeCodeLength);
  result := DecoderNodeList.IndexOf(stNodeNo);
end;

function TdmPCClient.GetNodeIndexDeviceConnect(aNodeIndex: integer;
  aEcuID: string): string;
begin
  result := ' ';
  if aNodeIndex > DecoderNodeList.Count - 1 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[aNodeIndex]).GetDeviceConnect(aEcuID);
end;

function TdmPCClient.GetNodeIndexDeviceCount(aIndex: integer): integer;
begin
  result := 0;
  if aIndex > DecoderNodeList.Count - 1 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[aIndex]).GetDeviceCount;
end;

function TdmPCClient.GetNodeIndexDeviceIndexName(aNodeIndex,
  aDeviceIndex: integer; var aEcuID, aEcuName: string): Boolean;
begin
  result := False;
  if aNodeIndex > DecoderNodeList.Count - 1 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[aNodeIndex]).GetDeviceIndexName(aDeviceIndex,aEcuID,aEcuName);
end;

function TdmPCClient.GetNodeIndexIP(aIndex: integer): string;
begin
  result := '';
  if aIndex > DecoderNodeList.Count - 1 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[aIndex]).NodeIP;
end;

function TdmPCClient.GetNodeIndexName(aIndex: integer): string;
begin
  result := '';
  if aIndex > DecoderNodeList.Count - 1 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[aIndex]).NodeName;
end;

function TdmPCClient.GetNodeIndexNodeConnected(aIndex: integer): string;
begin
  result := '';
  if aIndex > DecoderNodeList.Count - 1 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[aIndex]).NodeConnected;
end;

function TdmPCClient.GetNodeIndexNodeNo(aIndex: integer): integer;
begin
  result := 0;
  if aIndex > DecoderNodeList.Count - 1 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[aIndex]).NodeNo;
end;

function TdmPCClient.GetNodeIP(aNodeNo: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DecoderNodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[nIndex]).NodeIP;
end;

function TdmPCClient.GetNodeName(aNodeNo: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DecoderNodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  result := TMonitoringNode(DecoderNodeList.Objects[nIndex]).NodeName;
end;

function TdmPCClient.GetReceiveBufferCount: integer;
begin
  result := RcvPacketList.Count;
end;

function TdmPCClient.HandleAllocated: Boolean;
begin
  Result := ( FHandle <> 0 );
end;

procedure TdmPCClient.HandleNeeded;
begin
  if not HandleAllocated
   then FHandle := AllocateHWND ( WndProc );
end;

procedure TdmPCClient.handle_fd_close_notification(p_socket: Integer);
var
  l_linger: TLinger;
  l_absolute_linger: array[0..3] of char absolute l_linger;
  l_status: Integer;
begin
  if G_bApplicationTerminate then Exit;
  if WSAIsBlocking then WSACancelBlockingCall;
  ShutDown(p_socket, 2);
  l_linger.l_onoff:= 1;
  l_linger.l_linger:= 0;
  SetSockOpt(p_socket, Sol_Socket, So_Linger, pAnsichar(AnsiString(l_absolute_linger)), sizeof(l_linger));//l_absolute_linger[0] -> (AnsiString(l_absolute_linger)
  l_status:= CloseSocket(p_socket);
  Connected := False;
end;

procedure TdmPCClient.handle_fd_connect_notification(p_socket: Integer);
begin
  if G_bApplicationTerminate then Exit;
  LastReceiveTime := now; //Connect �ϸ� ���� ���Žð��� Connect �� �ð����� ��������.
  Connected := True;
end;

procedure TdmPCClient.handle_fd_read_notification(p_socket: tSocket);
var
  nRemaining: Integer;
  ptStart_reception: Pointer;
  nPacket_bytes: Integer;
  nEol_position: Integer;
  buffByte : TBytes;
  stTemp : string;
  stWideString : WideString;
  stRawByteString : RawByteString;
  stWideStr : String;
begin
  if G_bApplicationTerminate then Exit;
  with l_c_reception_buffer do
  begin
  //G_bTest0
    nRemaining:= m_buffer_size- m_write_index;
  //G_bTest1
    if nRemaining < k_tcp_ip_chunk then
    begin
      double_the_capacity;
      nRemaining:= m_buffer_size- m_write_index;
    end;
  //G_bTest2
    ptStart_reception:= @ m_oa_byte_buffer[m_write_index];
  //G_bTest3

    nPacket_bytes:= Recv(L_Client_socket_handle, ptStart_reception^, nRemaining, 0);
  //G_bTest4
    if nPacket_bytes < 0 then
    begin
      SocketError(-3);
      SocketConnect := False;
      Exit;
    end;
    LastReceiveTime := now;
    if nPacket_bytes > 0 then
    begin
      m_write_index:= m_write_index+ nPacket_bytes;
      //L_stReceiveBuffer := L_stReceiveBuffer + PAnsiChar(ptStart_reception);
      stTemp := PAnsiChar(ptStart_reception);
      Try
        //stWideString := WideString(ptStart_reception);
        //stWideString := AnsiToWide(PAnsiChar(ptStart_reception),nPacket_bytes,0);
        stRawByteString := RawByteString(ptStart_reception);
        stRawByteString := copy(stRawByteString,1,nPacket_bytes);
        stWideStr := Utf8ToString(stRawByteString);    //UTF8Decode -> Utf8ToString G_bTest9
        L_stReceiveBuffer := L_stReceiveBuffer + stWideStr ;//UTF8Decode(stRawByteString);  �׽�Ʈ�ϱ� ���� ������... ���� �ƹ��ų� ����ص� ������
      Except
        L_stReceiveBuffer := L_stReceiveBuffer + stTemp;
      End;
(*      stWideString := WideString(ptStart_reception);
//      L_stReceiveBuffer := L_stReceiveBuffer + stTemp;
      buffByte := ptStart_reception;
{      SetString(stTemp, PAnsiChar(@buffByte[0]), nPacket_bytes);
      stTemp :=BytesToAscii(buffByte,nPacket_bytes);  }
      stTemp := UTF8Decode(RawByteString(ptStart_reception));
      stTemp := copy(stTemp,1,nPacket_bytes);  *)
//      L_stReceiveBuffer := L_stReceiveBuffer + UTF8Decode(stRawByteString);

      //stTemp := WideToAnsi(PWideChar(ptStart_reception),nPacket_bytes,0);
      //L_stReceiveBuffer := L_stReceiveBuffer + stTemp;
        SocketPacketProcess;
(*    //if G_bTest then
    begin
      //m_write_index:= m_write_index + 4096;
      //L_stReceiveBuffer := '';
      //ptStart_reception := nil;
      clear_buffer;
      Exit;
    end;
    *)
(*      nEol_position:= f_return_line_feed_position(0);
      if (L_nfile_size= 0) and (nEol_position> 0) then
      begin
        L_nfile_size:= StrToInt(f_extract_string_start_end(0, nEol_position - 3));
        remove_from_start(nEol_position);
      end;   //G_bTest8 ==> ȿ�� ����*)
    end;
  end;
end;

procedure TdmPCClient.handle_fd_write_notification(p_socket: Integer);
begin
  if G_bApplicationTerminate then Exit;
  //���� ���� �Ϸ� �̺�Ʈ
end;

procedure TdmPCClient.handle_wm_async_select(var Msg: TMessage);
var
  nParameter: Integer;
  nError, nNotification: Integer;
  nSocketHandle: Integer;
begin
  if G_bApplicationTerminate then Exit;

  nParameter:= Msg.lParam;
  nSocketHandle:= Msg.wParam;
  nError:= wsaGetSelectError(nParameter);
  nNotification:= wsaGetSelectEvent(nParameter);

  if nError<= wsaBaseErr then
  begin
    case nNotification of
      FD_ACCEPT: begin end; // Client ������ Accept �� �߻����� ����
      FD_CONNECT: handle_fd_connect_notification(nSocketHandle); //display('no server fd_connect');
      FD_WRITE: handle_fd_write_notification(nSocketHandle);
      FD_READ: handle_fd_read_notification(nSocketHandle);
      FD_CLOSE: handle_fd_close_notification(nSocketHandle);
    end // case
  end else begin
    if nNotification= FD_CLOSE then handle_fd_close_notification(nSocketHandle);
  end;
end;

procedure TdmPCClient.MonitorEventProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
begin
  stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
  stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
  case aRealData[3] of
    'A' : begin  //�˶����� Ȯ��
      if Assigned(FOnAlarmConfirm) then
      begin
        OnAlarmConfirm(Self);
      end;
    end;
  end;
end;

procedure TdmPCClient.NodeChangeEvent(Sender: TObject;aDecoderNo:integer; aNodeNo, aEcuID, aType,
  aNo, aCmd, aData: string);
begin
  if Assigned(FOnNodeChangeEvent) then
  begin
    OnNodeChangeEvent(Self,aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData);
  end;

end;

procedure TdmPCClient.NodeConncectCheckTimerTimer(Sender: TObject);
var
  i : integer;
  bCheck : Boolean;
begin
  if L_bDataModuleDestory then Exit;
  if G_bApplicationTerminate then Exit;
  if Not Connected then Exit;  //���� ���� ���� ���¿����� �׳� ���� ������.
  if L_nDeviceStateCheckCount > 3 then
  begin
    L_nDeviceStateCheckCount := 0;
    L_bDeviceStateChecking := False; //������ Ǯ��
  end;
  if L_bDeviceStateChecking then
  begin
    inc(L_nDeviceStateCheckCount);
    Exit;
  end;
  Try
    Try
      L_bDeviceStateChecking := True;
      if L_nCurrentCheckNodeSeq < 0 then L_nCurrentCheckNodeSeq := 0;
      if L_nCurrentCheckNodeSeq > DecoderNodeList.Count - 1 then L_nCurrentCheckNodeSeq := 0;
      if DecoderNodeList.Count < 1 then Exit;
      if TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckNodeSeq]).NodeConnected = '0' then
      begin
        TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckNodeSeq]).NodeStateCheck;
      end;
      if G_bApplicationTerminate then Exit;
      if L_nCurrentCheckNodeSeq = DecoderNodeList.Count - 1 then
      begin
        L_nCurrentCheckNodeSeq := 0;
        bCheck := True;
        for i := 0 to DecoderNodeList.Count - 1 do
          if TMonitoringNode(DecoderNodeList.Objects[L_nCurrentCheckNodeSeq]).NodeConnected <> '0' then bCheck := False;
        if bCheck then
        begin
          NodeConncectCheckTimer.Enabled := False;
          DoorStateCheckTimer.Enabled := True;
        end;
      end else
      begin
        L_nCurrentCheckNodeSeq := L_nCurrentCheckNodeSeq + 1;
      end;
    Except
      Exit;
    End;

  Finally
    L_bDeviceStateChecking := False;
  End;
end;

procedure TdmPCClient.NodeIndexDeviceSort(aIndex: integer);
begin
  if aIndex > DecoderNodeList.Count - 1 then Exit;
  TMonitoringNode(DecoderNodeList.Objects[aIndex]).DeviceSort;
end;

procedure TdmPCClient.NodeToAlarmEventSetting(aNodeNo, aEcuID, aExtendID, aCmd,
  aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string);
var
  nIndex : integer;
begin
  nIndex := DecoderNodeList.IndexOf(aNodeNo);
  if nIndex > -1 then
  begin
    TMonitoringNode(DecoderNodeList.Objects[nIndex]).NodeToAlarmEventSetting(aEcuID, aExtendID, aCmd,
      aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
      aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
      aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
      aAlarmColor);
  end;
end;

procedure TdmPCClient.NodeToArmAreaEventAllClear;
var
  i : integer;
begin
  if DecoderNodeList.Count < 1 then Exit;

  for i := 0 to DecoderNodeList.Count - 1 do
  begin
    TMonitoringNode(DecoderNodeList.Objects[i]).NodeToArmAreaEventAllClear;
  end;
end;

procedure TdmPCClient.SendPacket(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData: string);
var
  buf: TBytes;
  nResult : integer;
  stSendData : string;
begin
  if G_bApplicationTerminate then Exit;

  stSendData := GetPacketData(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData);

  if Assigned(FOnServerPacketView) then
  begin
    OnServerPacketView(Self,'TX',ServerIP,stSendData,'00');  //View �� ���� �ְ�....
  end;

  Ascii2Bytes(stSendData,Length(stSendData),buf);
  nResult:= Send(L_Client_socket_handle,buf[0], Length(stSendData), 0);
end;

procedure TdmPCClient.ServerDataPacketProcess(aPacketData: string);
var
  stRealData : string;
  stRealLen : string;
begin
  if Assigned(FOnServerPacketView) then
  begin
    OnServerPacketView(Self,'RX',ServerIP,aPacketData,'00');  //View �� ���� �ְ�....
  end;

  stRealLen := copy(aPacketData,2,3);
  if Not IsDigit(stRealLen) then Exit;
  stRealData := copy(aPacketData,5,strtoint(stRealLen));
  case stRealData[1] of
    'S' : begin
      DeviceStateSearchProcess(stRealData);
    end;
    'e' : begin

    end;
    'C' : begin

    end;
    'E' : begin
      DeviceEventProcess(stRealData);
    end;
  end;
end;

procedure TdmPCClient.ServerNFCheckTimerTimer(Sender: TObject);
begin
  if L_bDataModuleDestory then Exit;
  if G_bApplicationTerminate then Exit;
  ServerNFCheckTimer.Enabled := False;

  if Not Connected then LastServerNetState := 'NF';
end;

procedure TdmPCClient.ServerNRCheckTimerTimer(Sender: TObject);
begin
  if L_bDataModuleDestory then Exit;
  if G_bApplicationTerminate then Exit;
  ServerNFCheckTimer.Enabled := False;

  if Connected then LastServerNetState := 'NR';
end;

procedure TdmPCClient.SetConnected(const Value: Boolean);
var
  i : integer;
begin
  if FConnected = Value then Exit;
  FConnected := Value;
  if Assigned(FOnSeverConnected) then
  begin
    OnSeverConnected(Self,DecoderNo,Value);
  end;
  if Not Value then
  begin
    //���⿡�� ��� ����� ���¸� �𸣴� ������ ǥ������.
    if DecoderNodeList.Count < 1 then Exit;

    for i := 0 to DecoderNodeList.Count - 1 do
    begin
      TMonitoringNode(DecoderNodeList.Objects[i]).NodeConnected := '0';
    end;
  end;
  DeviceStateTimer.Interval := 100000;
  DeviceStateTimer.Enabled := Value;
  ServerNFCheckTimer.Enabled := Not Value;
  ServerNRCheckTimer.Enabled := Value;
  RcvPacketProcessTimer.Enabled := Value;
end;

procedure TdmPCClient.SetFServerName(const Value: string);
begin
  FServerName := Value;
end;

procedure TdmPCClient.SetLastServerNetState(const Value: String);
begin
  if FLastServerNetState = Value then Exit;

  if Value = 'NR' then
  begin
    if FLastServerNetState = '' then
    begin
      FLastServerNetState := Value;
      Exit;
    end;
  end;
  FLastServerNetState := Value;
  if Assigned(FOnServerNetworkState) then
  begin
    OnServerNetworkState(Self,DecoderNo,ServerIP,Value);
  end;

end;

procedure TdmPCClient.SetSocketConnect(const Value: Boolean);
var
  nSocketVersion: Word;
  nResult: Integer;
  l_socket_address_in: tSockAddrIn;
  l_ip_z: array[0..255] of char;
  nError : integer;
begin
//  if FSocketConnect = Value then Exit;  //���� connected �Ŀ� Disconnect �ÿ� ���� �κ�ó�� �ȵǾ...

  FSocketConnect := Value;
  if Value then
  begin
    nSocketVersion:= $0101;
    nResult:= wsaStartup(nSocketVersion, L_wsa_data);
    if nResult <> 0 then
    begin
      SocketConnect := False;
      Exit;
    end;
    L_Client_socket_handle:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    if L_Client_socket_handle = INVALID_SOCKET then
    begin
      SocketError(-1);
      SocketConnect := False;
      Exit;
    end;
    nResult:= wsaAsyncSelect(L_Client_socket_handle, Handle,
      wm_asynch_select,
      FD_CONNECT+ FD_READ+ FD_WRITE+ FD_CLOSE);
    if nResult <> 0 then
    begin
      SocketError(-2);
      SocketConnect := False;
      Exit;
    end;
    FillChar(l_socket_address_in, sizeof(l_socket_address_in), 0);
    with l_socket_address_in do
    begin
      sin_family:= AF_INET;// pf_Inet;
      // -- the requested service
      sin_port:= hToNs(ServerPort);
      StrPCopy(l_ip_z, ServerIP);
      sin_addr.s_Addr:= inet_addr(PAnsiChar(AnsiString(l_ip_z)));
    end;
    nResult:= Connect(L_Client_socket_handle, l_socket_address_in,
            sizeof(l_socket_address_in));
    if nResult <> 0 then
    begin
      nError:= WSAGetLastError;
      if nError <> wsaEWouldBlock then
      begin
        SocketError(nError);
        SocketConnect := False;
        Exit;
      end;
    end;
    //L_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
  end else
  begin
    Try
      if L_Client_socket_handle <> INVALID_SOCKET then
      begin
        shutdown(L_Client_socket_handle,SD_BOTH);
        nResult:= CloseSocket(L_Client_socket_handle);
        L_Client_socket_handle := INVALID_SOCKET;
      end;
      Connected := False;
    Except
      Exit;
    End;
  end;
end;


procedure TdmPCClient.SocketConnectCheckTimerTimer(Sender: TObject);
var
  i : integer;
  dtPollingTime: TDatetime;
  dtTimeOut: TDatetime;
begin
  if L_bDataModuleDestory then Exit;

  dtPollingTime := LastReceiveTime;
  dtTimeOut:= IncTime(dtPollingTime,0,6,0,0);   //6�� ���� �����Ͱ� ���ŵȰ� ������ Ŭ���̾�Ʈ ������ ���� ������...
  if Now > dtTimeOut then
  begin
    SocketConnect := False;
  end;
end;

procedure TdmPCClient.SocketError(aErrCode: integer);
begin

end;

procedure TdmPCClient.SocketPacketProcess;
var
  bLoop : Boolean;
  nFormat : integer;
  stLeavePacketData,stPacketData : String;
begin
  // G_bTest 5
  //Client ���� �۽��� �����Ͱ� ����� �´�.
  bLoop := False;
  repeat
    if Trim(L_stReceiveBuffer) = '' then Exit;
    nFormat := PacketFormatCheck(L_stReceiveBuffer,stLeavePacketData,stPacketData);
    L_stReceiveBuffer:= stLeavePacketData;

    if nFormat < 0 then
    begin
      if L_stReceiveBuffer = '' then break;
      if nFormat = -1 then  //������ ���� �ΰ��
      begin
        if Assigned(FOnServerPacketView) then
        begin
          OnServerPacketView(Self,'RX',ServerIP,L_stReceiveBuffer + '[' + Ascii2Hex(L_stReceiveBuffer) + ']','Er');
        end;
        Delete(L_stReceiveBuffer,1,1);
        continue;
      end else break;   //���� ���̰� �۰� ���� ���
    end;
    if stPacketData <> '' then
    begin
      RcvPacketList.Add(stPacketData);
      //ServerDataPacketProcess(stPacketData);
    end;
    if pos(SCETX,L_stReceiveBuffer) = 0 then bLoop := True
    else bLoop := False;
  until bLoop;
end;

procedure TdmPCClient.WndProc(var Message: TMessage);
begin
  if G_bApplicationTerminate then Exit;

  Dispatch ( Message );
end;

end.