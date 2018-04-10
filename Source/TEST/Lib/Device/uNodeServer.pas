unit uNodeServer;

interface

uses
  System.SysUtils, System.Classes,Winapi.WinSock,Vcl.ExtCtrls,Winapi.Messages,
  Vcl.Forms,System.SyncObjs,
  u_c_byte_buffer,uDeviceVariable;

const
  wm_asynch_nodeselect= wm_User;
  NodeMAXSOCKCOUNT = 1000;
const Node_buffer_max= 4096;
      Node_tcp_ip_chunk= 1500;

type
  TServerNode = Class(TComponent)
  private
    FDeviceID: string;
    FWinSocket: integer;
    FNodeNo: integer;
  published
    property DeviceID : string read FDeviceID write FDeviceID;
    property NodeNo : integer read FNodeNo write FNodeNo;
    property WinSocket : integer read FWinSocket write FWinSocket;
  end;

  TdmNodeServer = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    //�̺�Ʈ ���ź�
    procedure AntiPassDataEvent(Sender: TObject;  aNodeNo : integer;aECUID,aSubCmd,aAntiGroup,aData: string );
    procedure ArmAreaPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure CardPermitChange(Sender: TObject;  aNodeNo : integer;aEcuID,aCardNo,aPermit,aDoorPermit,aArmAreaPermit,aTimeCodeUse,aTimeCodeGroup,aTimeData,aWeekCode:string);
    procedure CardRcvAckChange(Sender: TObject;  aNodeNo : integer;aEcuID,aCardNo,aRcvAck:string;aPermit:Boolean);
    procedure CardReaderPacketChange(Sender: TObject; aCmd, aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure CurrentAlarmEvent(Sender: TObject;  aNodeNo,aECUID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                                            aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor:string);
    procedure CurrentDoorState(Sender: TObject;  aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aCardMode,aDoorMode,aDoorState,aLockState,aDoorFire:string);
    procedure DeviceCardAccessEvent(Sender: TObject; aNodeNo,aECUID,aDoorNo,aReaderNo,aInOut,aTime,aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,aATButton,aCardNo,aType,aArmAreaNo,aAntiGroup:string);
    procedure DeviceConnected(Sender: TObject;aSocketNo,aNodeNo : integer;aEcuID:string; aConnected:TConnectedState;aAntiGroupCode:string);
    procedure DeviceNodeServerPacketChange(Sender: TObject;  aCmd,aWinSock,aNodeNo : integer;aLanIp,aEcuID:string; aData:string);
    procedure DevicePacketChange(Sender: TObject; aCmd, aNodeNo : integer;aEcuID:string; aData:string);
    procedure DeviceReceiveData(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string;aRcvInfoType:integer; aData: string);
    procedure DeviceReceiveTypeChage(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string;aRcvInfoType:integer; aData: string);
    procedure DeviceUsedEvent(Sender: TObject;  aNodeNo : integer;aType:string;aEcuID,aExtendID,aNumber:string; aUsed:Boolean);
    procedure DoorHolidaySend(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure DoorPacketChange(Sender: TObject;  aCmd,aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
    procedure NodeSendData(Sender: TObject;  aNodeNo : integer;aData: string);
    procedure NotifyRcvData(Sender: TObject;  aNodeNo : integer; aData: string );
    procedure RcvInvalidDevice(Sender: TObject;  aNodeNo : integer; aData: string );
    procedure ZONEEXTENDTYPEChange(Sender: TObject;  aNodeNo : integer;aEcuID,aExtendID,aNumber:string; aData:string);
  private
    procedure NodePacket(Sender: TObject;aNodeNo : integer; aNodeName,aEcuID,aCmd,aMsgNo,aDeviceVer,aData,aType:string);
  private
    NodeConnectCheckTimer: TTimer;
    //Handle ���� �κ�
    FHandle : THandle;
    function HandleAllocated : Boolean;
    procedure HandleNeeded;
    function GetHandle: THandle;
    procedure WndProc ( var Message : TMessage ); virtual;
    procedure handle_wm_async_select(var Msg: TMessage); message wm_asynch_nodeselect;
    procedure handle_fd_accept_notification(p_socket: tSocket);
    procedure handle_fd_close_notification(p_socket: Integer);
    procedure handle_fd_read_notification(p_socket: tSocket);
    procedure handle_fd_write_notification(p_socket: Integer);
    procedure NodeConnectCheckTimerTimer(Sender: TObject);
  private
    L_server_socket_handle:tSocket;
    L_c_server_client_socket_list: TStringList;
    L_wsa_data: twsaData;
    FServerPort: integer;
    FServerStart: Boolean;
    FOnNodePacket: TNodePacket;
    FOnDeviceNodeServerPacketChange: TDeviceNodeServerPacket;
    FOnCardPermitChange: TCardPermitPacket;
    FOnCardRcvAckChange: TCardRcvPacket;
    FOnCardReaderPacketChange: TCardReaderPacket;
    FOnCurrentAlarmEvent: TAlarmEvent;
    FOnCurrentDoorState: TDoorStatePacket;
    FOnDeviceCardAccessEvent: TDeviceCardAccessEvent;
    FOnDeviceConnected: TDeviceConnect;
    FOnDevicePacketChange: TDevicePacket;
    FOnDeviceUsed: TDeviceUsed;
    FOnDoorPacketChange: TDoorPacket;
    FOnRcvData: TNotifyReceive;
    FOnRcvInvalidDevice: TNotifyReceive;
    FOnReceiveData: TReceiveTypeChange;
    FOnReceiveTypeChage: TReceiveTypeChange;
    FOnSendData: TNotifyReceive;
    FOnZONEEXTENDTYPEChange: TZoneExtentionPacket;
    FOnArmAreaPacketChange: TArmAreaPacket;
    FStart: Boolean;
    FOnAntiPassDataEvent: TAntiPassEvent;
    FOnDoorHolidaySend: TDoorPacket;
    FOnArmAreaModeChange: TArmAreaPacket;
    { Private declarations }
    procedure SetServerStart(const Value: Boolean);
  public
    { Public declarations }
    procedure DeviceNodeServer_ControlNodeToDeviceArmAreaStateCheck(aWinSocket:integer;aEcuID ,aArmAreaNo:string);
    procedure DeviceNodeServer_ControlNodeToDeviceCardResend(aWinSocket:integer;aEcuID:string);
    procedure DeviceNodeServer_ControlNodeToDeviceReset(aWinSocket:integer;aEcuID:string);
    procedure DeviceNodeServer_ControlNodeToDeviceTimeSync(aWinSocket:integer);
    procedure DeviceNodeServer_DeviceCardSort(aWinSocket:integer);
    procedure DeviceNodeServer_FireRecovery(aWinSocket:integer);
    procedure DeviceNodeServer_FireDoorOpen(aWinSocket:integer;aFireGubunCode:string);
    procedure DeviceNodeServer_SendPacket(aWinSocket:integer;aEcuID ,aCmd,aData:string;aPriority: integer);
    procedure DeviceNodeServer_SetNodeToCardPermitExcute(aWinSocket:integer;aEcuID, aCardNo,aRcvAck: string);
    procedure DeviceNodeServer_SetNodeToCardPermitSetting(aWinSocket:integer;aEcuID,aExtendID,aCardNo,aPermit,aCardState,aType,aNumber,
          aPositionNum,aTimeCodeUse,aTCGroup,aTime1,aTime2,aTime3,aTime4,aWeekCode,aRegDate,aEndDate,aEmState:string);
    procedure RegDeviceID(aWinSock:integer;aNodeNo,aDeviceID:string);
    procedure ServerNodeDisConnect(aWinSock:integer);

    function DeviceNodeServer_GetDeviceIDInformation(aWinSocket,aCmd:integer;aEcuID:string):string;
    function DeviceNodeServer_GetDeviceIDSubInformation(aWinSocket,aSubType,aCmd:integer;aEcuID,aSubNo:string):string;  // ����
    function DeviceNodeServer_GetDeviceIndexInformation(aWinSocket,aCmd,aNodeIndex:integer):string;
    function DeviceNodeServer_GetDeviceIndexSubInformation(aWinSocket,aSubType,aCmd,aIndex,aSubIndex:integer):string;
    function DeviceNodeServer_GetDeviceIndexZoneInformation(aWinSocket,aCmd,aEcuIndex,aExtentionIndex,aZoneNo:integer):string;  //�������
    function DeviceNodeServer_GetNodeIndexInformation(aWinSocket,aCmd:integer):string;

    function DeviceNodeServer_SetDeviceIDInformation(aWinSocket,aCmd:integer;aEcuID,aValue:string):Boolean;
    function DeviceNodeServer_SetDeviceIDSubInformation(aWinSocket,aSubType,aCmd:integer;aEcuID,aSubNo,aValue:string):Boolean;
    function DeviceNodeServer_SetDeviceRcvIDInformation(aWinSocket,aCmd:integer;aEcuID,aValue:string):Boolean;
    function DeviceNodeServer_SetDeviceRcvIDSubInformation(aWinSocket,aSubType,aCmd:integer;aEcuID,aSubNo,aValue:string):Boolean;
    function DeviceNodeServer_SetNodeInformation(aWinSocket,aCmd:integer;aValue:string):Boolean;
    function DeviceNodeServer_SetNodeIndexInformation(aWinSocket,aCmd,aIndex:integer;aValue:string):Boolean;
    function DeviceNodeServer_SetNodeRCVInformation(aWinSocket,aCmd:integer;aValue:string):Boolean;
    function DeviceNodeServer_SetHolidayClear(aWinSocket:integer):Boolean;
    function DeviceNodeServer_SetDeviceHoliday(aWinSocket:integer;aEcuID,aDay,aValue:string):Boolean;
  public
    procedure LoadDeviceNodeServer_CardPermitSetting(aWinSock:integer;aNodeNo,aECUID,aEXTENDID,aCARDNO,aPERMIT,aSTATECODE,
          aDOOR1,aDOOR2,aDOOR3,aDOOR4,aDOOR5,aDOOR6,aDOOR7,aDOOR8,aARMAREA0,aARMAREA1,aARMAREA2,aARMAREA3,aARMAREA4,aARMAREA5,
          aARMAREA6,aARMAREA7,aARMAREA8,aRCVACK,aPOSITIONNUM,aTIMECODEUSE,aTCGROUP,aTCTIME1,aTCTIME2,aTCTIME3,aTCTIME4,aTCWEEKCODE,
          aREGDATE,aENDDATE,aEmState:string);
    procedure LoadDeviceNodeServer_NodeRCVSetting(aWinSock:integer;aECUUSE,aKTTSYSTEMID,aKTTTELNUMBER,aKTTREMOTERINGCOUNT,aKTTCDMAUSE,
                   aKTTCDMADATA,aDVRUSE,aDVRDATA,aARMEXTENTIONMAINTOLOCAL,aARMEXTENTIONMAINFROMLOCAL:string );
    procedure LoadDeviceNodeServer_NodeSetting(aWinSock:integer;aNodeNo:integer;aDeviceID,aNodeName,aNodeIP,aNodePort,
                   aKttSystemID,aKttTelNumber1,aKttTelNumber2,aKTTREMOTEARMRINGCOUNT,aKTTREMOTEDISARMRINGCOUNT,aKTTCDMAUSE,
                   aKTTCDMAIP,aKTTCDMAPORT,aKTTCDMACHECKTIME,aKTTCDMARSSI,aKTTCDMAMIN,aKTTCDMAMUX,aDVRUSE,aDVRIP,aDVRPORT,
                   aFGGROUPCODE,aARMEXTENTIONGUBUN,aARMEXTENTIONMAINTOLOCAL,aARMEXTENTIONMAINFROMLOCAL:string);
    procedure LoadDeviceNodeServer_ReaderRCVSetting(aWinSock:integer;aECUID,aREADERNO,aReaderSETTINGINFO:string);
    procedure LoadDeviceNodeServer_ReaderSetting(aWinSock:integer;aECUID,aREADERNO,aREADERUSE,aREADERTYPE,aREADERDOOR,aDOORPOSITIONCODE,
                   aBUILDINGPOSITIONCODE,aARMAREANO:string);
  published
    property Handle : THandle read GetHandle;
    property ServerPort : integer read FServerPort write FServerPort;
    property ServerStart : Boolean read FServerStart write SetServerStart;
    property Start : Boolean read FStart write FStart;
  published
    //AntiPass �̺�Ʈ
    property OnAntiPassDataEvent : TAntiPassEvent read FOnAntiPassDataEvent write FOnAntiPassDataEvent;               //������ ����
    property OnArmAreaPacketChange : TArmAreaPacket read FOnArmAreaPacketChange write FOnArmAreaPacketChange;
    property OnCardPermitChange : TCardPermitPacket read FOnCardPermitChange write FOnCardPermitChange;
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
    property OnNodePacket : TNodePacket read FOnNodePacket write FOnNodePacket;
    ProPerty OnRcvData : TNotifyReceive read FOnRcvData write FOnRcvData;
    property OnRcvInvalidDevice : TNotifyReceive read FOnRcvInvalidDevice write FOnRcvInvalidDevice;
    property OnReceiveData : TReceiveTypeChange read FOnReceiveData write FOnReceiveData;                //������ ����
    property OnReceiveTypeChage : TReceiveTypeChange read FOnReceiveTypeChage write FOnReceiveTypeChage; //���Ż��� ����
    ProPerty OnSendData : TNotifyReceive read FOnSendData write FOnSendData;
    property OnZONEEXTENDTYPEChange :TZoneExtentionPacket read FOnZONEEXTENDTYPEChange write FOnZONEEXTENDTYPEChange;
  end;

var
  dmNodeServer: TdmNodeServer;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDevice,
  uDevicePacket,
  uThreadSocket;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TdmNodeServer.AntiPassDataEvent(Sender: TObject; aNodeNo: integer;
  aECUID, aSubCmd, aAntiGroup, aData: string);
begin
  Try
    if Assigned(FOnAntiPassDataEvent) then
    begin
      OnAntiPassDataEvent(Self,aNodeNo,aEcuID,aSubCmd,aAntiGroup,aData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','NodeServer.AntiPassDataEvent');
  End;
end;

procedure TdmNodeServer.ArmAreaPacketChange(Sender: TObject; aCmd,
  aNodeNo: integer; aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnArmAreaPacketChange) then
  begin
    OnArmAreaPacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;
end;


procedure TdmNodeServer.CardPermitChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aCardNo, aPermit, aDoorPermit, aArmAreaPermit, aTimeCodeUse,
  aTimeCodeGroup, aTimeData, aWeekCode: string);
begin
  if Assigned(FOnCardPermitChange) then
  begin
    OnCardPermitChange(Self,aNodeNo,aEcuID,aCardNo,aPermit,aDoorPermit,aArmAreaPermit,aTimeCodeUse,aTimeCodeGroup,aTimeData,aWeekCode);
  end;
end;

procedure TdmNodeServer.CardRcvAckChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aCardNo, aRcvAck: string;aPermit:Boolean);
begin
  if Assigned(FOnCardRcvAckChange) then
  begin
    OnCardRcvAckChange(Self,aNodeNo,aEcuID,aCardNo,aRcvAck,aPermit);
  end;
end;

procedure TdmNodeServer.CardReaderPacketChange(Sender: TObject; aCmd,
  aNodeNo: integer; aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnCardReaderPacketChange) then
  begin
    OnCardReaderPacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;
end;

procedure TdmNodeServer.CurrentAlarmEvent(Sender: TObject; aNodeNo, aECUID,
  aCmd, aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode,
  aLoop, aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string);
begin
  if Assigned(FOnCurrentAlarmEvent) then
  begin
    OnCurrentAlarmEvent(Self,aNodeNo,aECUID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                        aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor);
  end;
end;

procedure TdmNodeServer.CurrentDoorState(Sender: TObject; aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aCardMode, aDoorMode, aDoorState, aLockState,
  aDoorFire: string);
begin
  if Assigned(FOnCurrentDoorState) then
  begin
    OnCurrentDoorState(self,aNodeNo,aEcuID,aExtendID,aNumber, aCardMode, aDoorMode, aDoorState, aLockState,aDoorFire);
  end;
end;

procedure TdmNodeServer.DataModuleCreate(Sender: TObject);
begin
  L_server_socket_handle:= Invalid_socket;
  L_c_server_client_socket_list := TStringList.Create;
  NodeConnectCheckTimer := TTimer.Create(nil);
  NodeConnectCheckTimer.Interval := 1000;
  NodeConnectCheckTimer.OnTimer := NodeConnectCheckTimerTimer;
  NodeConnectCheckTimer.Enabled := True;
end;

procedure TdmNodeServer.DataModuleDestroy(Sender: TObject);
var
  i : integer;
begin
  NodeConnectCheckTimer.Enabled := False;
  NodeConnectCheckTimer.Free;
  if L_c_server_client_socket_list.Count > 0 then
  begin
    for i := L_c_server_client_socket_list.Count - 1 downto 0 do
    begin
      ClientSocket(L_c_server_client_socket_list.Objects[i]).Free;
    end;
  end;
  L_c_server_client_socket_list.Free;

  if HandleAllocated
   then DeAllocateHWND ( FHandle );
end;

procedure TdmNodeServer.DeviceCardAccessEvent(Sender: TObject; aNodeNo, aECUID,
  aDoorNo, aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aDoorState, aATButton, aCardNo, aType, aArmAreaNo,aAntiGroup: string);
begin
  if Assigned(FOnDeviceCardAccessEvent) then
  begin
    OnDeviceCardAccessEvent(Self,aNodeNo, aECUID, aDoorNo,aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
                  aDoorState, aATButton, aCardNo, aType, aArmAreaNo,aAntiGroup);
  end;
end;

procedure TdmNodeServer.DeviceConnected(Sender: TObject; aSocketNo,
  aNodeNo: integer; aEcuID: string; aConnected: TConnectedState;aAntiGroupCode:string);
begin
  if Assigned(FOnDeviceConnected) then
  begin
    OnDeviceConnected(Self,aSocketNo,aNodeNo,aEcuID,aConnected,aAntiGroupCode);
  end;

end;

procedure TdmNodeServer.DeviceNodeServerPacketChange(Sender: TObject; aCmd,
  aWinSock, aNodeNo: integer; aLanIp, aEcuID, aData: string);
begin
  if Assigned(FOnDeviceNodeServerPacketChange) then
  begin
    OnDeviceNodeServerPacketChange(Self,aCmd,aWinSock,aNodeNo,aLanIp,aEcuID,aData);
  end;
end;

procedure TdmNodeServer.DeviceNodeServer_ControlNodeToDeviceArmAreaStateCheck(
  aWinSocket: integer; aEcuID, aArmAreaNo: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ControlNodeToDeviceArmAreaStateCheck(aEcuID,aArmAreaNo);
end;

procedure TdmNodeServer.DeviceNodeServer_ControlNodeToDeviceCardResend(
  aWinSocket: integer; aEcuID: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ControlNodeToDeviceCardResend(aEcuID);
end;

procedure TdmNodeServer.DeviceNodeServer_ControlNodeToDeviceReset(
  aWinSocket: integer; aEcuID: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ControlNodeToDeviceReset(aEcuID);
end;

procedure TdmNodeServer.DeviceNodeServer_ControlNodeToDeviceTimeSync(
  aWinSocket: integer);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ControlNodeToDeviceTimeSync;
end;

procedure TdmNodeServer.DeviceNodeServer_DeviceCardSort(aWinSocket: integer);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).DeviceCardSort;
end;

procedure TdmNodeServer.DeviceNodeServer_FireDoorOpen(aWinSocket: integer;
  aFireGubunCode: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).FireDoorOpen(aFireGubunCode);

end;

procedure TdmNodeServer.DeviceNodeServer_FireRecovery(aWinSocket: integer);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).FireRecovery;
end;

function TdmNodeServer.DeviceNodeServer_GetDeviceIDInformation(aWinSocket,
  aCmd: integer; aEcuID: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  result := ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).GetDeviceIDInformation(aCmd,aEcuID);
end;

function TdmNodeServer.DeviceNodeServer_GetDeviceIDSubInformation(aWinSocket,
  aSubType, aCmd: integer; aEcuID, aSubNo: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  result := ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).GetDeviceIDSubInformation(aSubType,aCmd,aEcuID,aSubNo);
end;

function TdmNodeServer.DeviceNodeServer_GetDeviceIndexInformation(aWinSocket,
  aCmd, aNodeIndex: integer): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  result := ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).GetDeviceIndexInformation(aCmd,aNodeIndex);
end;

function TdmNodeServer.DeviceNodeServer_GetDeviceIndexSubInformation(aWinSocket,
  aSubType, aCmd, aIndex, aSubIndex: integer): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  result := ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).GetDeviceIndexSubInformation(aSubType, aCmd, aIndex, aSubIndex);
end;

function TdmNodeServer.DeviceNodeServer_GetDeviceIndexZoneInformation(
  aWinSocket, aCmd, aEcuIndex, aExtentionIndex, aZoneNo: integer): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  result := ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).GetDeviceIndexZoneInformation(aCmd, aEcuIndex, aExtentionIndex, aZoneNo);
end;

function TdmNodeServer.DeviceNodeServer_GetNodeIndexInformation(aWinSocket,
  aCmd: integer): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  result := ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).GetNodeIndexInformation(aCmd);
end;

procedure TdmNodeServer.DeviceNodeServer_SendPacket(aWinSocket: integer; aEcuID,
  aCmd, aData: string; aPriority: integer);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SendPacket(aEcuID,aCmd[1],ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).GetSendMsgNo,ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).GetDeviceVer,aData,aPriority);
end;

function TdmNodeServer.DeviceNodeServer_SetDeviceHoliday(aWinSocket: integer;
  aEcuID, aDay, aValue: string): Boolean;
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  result := ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceHoliday(aEcuID,aDay,aValue);
end;

function TdmNodeServer.DeviceNodeServer_SetDeviceIDInformation(aWinSocket,
  aCmd: integer; aEcuID, aValue: string): Boolean;
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  result := ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceIDInformation(aCmd,aEcuID,aValue);
end;

function TdmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(aWinSocket,
  aSubType, aCmd: integer; aEcuID, aSubNo, aValue:string):Boolean;
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  result := ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceIDSubInformation(aSubType, aCmd,aEcuID, aSubNo, aValue);
end;

function TdmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(aWinSocket,
  aCmd: integer; aEcuID, aValue: string): Boolean;
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceRcvIDInformation(aCmd,aEcuID,aValue);
end;

function TdmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(aWinSocket,
  aSubType, aCmd: integer; aEcuID, aSubNo, aValue: string):Boolean;
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceRcvIDSubInformation(aSubType, aCmd,aEcuID, aSubNo, aValue);
end;

function TdmNodeServer.DeviceNodeServer_SetHolidayClear(
  aWinSocket: integer): Boolean;
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetHolidayClear;

end;

function TdmNodeServer.DeviceNodeServer_SetNodeIndexInformation(aWinSocket,
  aCmd, aIndex: integer; aValue: string): Boolean;
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetNodeIndexInformation(aCmd,aIndex,aValue);
end;

function TdmNodeServer.DeviceNodeServer_SetNodeInformation(aWinSocket,
  aCmd: integer; aValue: string): Boolean;
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  case aCmd of
    con_DeviceCmdARMEXTENTIONGUBUN : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ARMEXTENTIONGUBUN := aValue;
    end;
    con_DeviceCmdKTTREMOTEARMRINGCOUNT : begin
      if isDigit(aValue) then
        ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTREMOTEARMRINGCOUNT := strtoint(aValue);
    end;
    con_DeviceCmdKTTSystemID : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTSYSTEMID := aValue;
    end;
    con_DeviceCmdKTTTelNumber1 : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTTELNUMBER1 := aValue;
    end;
    con_DeviceCmdKTTTelNumber2 : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTTELNUMBER2 := aValue;
    end;
  end;
end;

function TdmNodeServer.DeviceNodeServer_SetNodeRCVInformation(aWinSocket,
  aCmd: integer; aValue: string): Boolean;
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  case aCmd of
    con_DeviceCmdARMEXTENTIONMAINTOLOCAL : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ARMEXTENTIONMAINTOLOCALRCV := aValue;
    end;
    con_DeviceCmdARMEXTENTIONMAINFROMLOCAL : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ARMEXTENTIONMAINFROMLOCALRCV := aValue;
    end;
    con_DeviceCmdDeviceUSE : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ECUUSERCV := aValue;
    end;
    con_DeviceCmdKTTREMOTEARMRINGCOUNT : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTREMOTERINGCOUNTRCV := aValue;
    end;
    con_DeviceCmdKTTREMOTEDISARMRINGCOUNT : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTREMOTERINGCOUNTRCV := aValue;
    end;
    con_DeviceCmdKTTSystemID : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTSYSTEMIDRCV := aValue;
    end;
    con_DeviceCmdKTTTelNumber1 : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTTELNUMBERRCV := aValue;
    end;
    con_DeviceCmdKTTTelNumber2 : begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTTELNUMBERRCV := aValue;
    end;
  end;
end;

procedure TdmNodeServer.DeviceNodeServer_SetNodeToCardPermitExcute(
  aWinSocket: integer; aEcuID, aCardNo,aRcvAck: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetNodeToCardPermitExcute(aEcuID,aCardNo,aRcvAck);
end;

procedure TdmNodeServer.DeviceNodeServer_SetNodeToCardPermitSetting(
  aWinSocket: integer; aEcuID, aExtendID, aCardNo, aPermit, aCardState, aType,
  aNumber, aPositionNum, aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3, aTime4,
  aWeekCode, aRegDate, aEndDate,aEmState: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSocket));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetNodeToCardPermitSetting(aEcuID, aExtendID, aCardNo, aPermit, aCardState, aType,
        aNumber, aPositionNum, aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3, aTime4,aWeekCode, aRegDate, aEndDate,aEmState);
end;

procedure TdmNodeServer.DevicePacketChange(Sender: TObject; aCmd,
  aNodeNo: integer; aEcuID, aData: string);
begin
  if Assigned(FOnDevicePacketChange) then
  begin
    OnDevicePacketChange(Self,aCmd,aNodeNo,aEcuID,aData);
  end;
end;

procedure TdmNodeServer.DeviceReceiveData(Sender: TObject; aNodeNo: integer;
  aType, aEcuID, aExtendID, aNumber: string; aRcvInfoType: integer;
  aData: string);
begin
  if Assigned(FOnReceiveData) then
  begin
    OnReceiveData(Self,aNodeNo,aType,aEcuID,aExtendID,aNumber,aRcvInfoType,aData);
  end;
end;

procedure TdmNodeServer.DeviceReceiveTypeChage(Sender: TObject;
  aNodeNo: integer; aType, aEcuID, aExtendID, aNumber: string;
  aRcvInfoType: integer; aData: string);
begin
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,aNodeNo,aType,aEcuID,aExtendID,aNumber,aRcvInfoType,aData);
  end;
end;

procedure TdmNodeServer.DeviceUsedEvent(Sender: TObject; aNodeNo: integer;
  aType, aEcuID, aExtendID, aNumber: string; aUsed: Boolean);
begin
  if Assigned(FOnDeviceUsed) then
  begin
    OnDeviceUsed(Self,aNodeNo,aType,aEcuID,aExtendID,aNumber,aUsed);
  end;
end;

procedure TdmNodeServer.DoorHolidaySend(Sender: TObject; aCmd, aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnDoorHolidaySend) then
  begin
    OnDoorHolidaySend(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;

end;

procedure TdmNodeServer.DoorPacketChange(Sender: TObject; aCmd,
  aNodeNo: integer; aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,aCmd,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;

end;

function TdmNodeServer.GetHandle: THandle;
begin
  HandleNeeded;
  Result := FHandle;
end;

function TdmNodeServer.HandleAllocated: Boolean;
begin
  Result := ( FHandle <> 0 );
end;

procedure TdmNodeServer.HandleNeeded;
begin
  if not HandleAllocated
   then FHandle := AllocateHWND ( WndProc );
end;

procedure TdmNodeServer.handle_fd_accept_notification(p_socket: tSocket);
var l_address_socket_in: tSockAddrIn;
    l_address_size: Integer;
    l_server_client_socket: tSocket;
    nIndex : integer;
    oNodeSocket : ClientSocket;
    l_address_in: tSockAddrIn;
    l_size: Integer;
    nResult : integer;
begin
  l_address_size:= sizeof(l_address_socket_in);
  l_server_client_socket:= Accept(p_socket, @l_address_socket_in, @l_address_size);
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(l_server_client_socket));
  if nIndex < 0 then
  begin
    oNodeSocket := ClientSocket.Create;
    oNodeSocket.WinSocket := l_server_client_socket;
    oNodeSocket.SocketType := 2;
    l_size := sizeof(tSockAddr);
   (* nResult:= GetSockName(l_server_client_socket, tSockAddr(l_address_in), l_size);
    if nResult = 0 then
      oClientSocket.ClientPCIP :=  inet_ntoa(l_address_in.sin_addr);  //������� ����ص� ���� ���� *)
    GetPeerName(l_server_client_socket, tSockAddr(l_address_in), l_size);
    oNodeSocket.NODEIP :=  inet_ntoa(l_address_in.sin_addr);
    oNodeSocket.OnNodePacket := NodePacket;
    oNodeSocket.OnDeviceNodeServerPacketChange := DeviceNodeServerPacketChange;
    oNodeSocket.OnAntiPassDataEvent := AntiPassDataEvent;
    oNodeSocket.OnArmAreaPacketChange := ArmAreaPacketChange;
    oNodeSocket.OnCardPermitChange := CardPermitChange;
    oNodeSocket.OnCardRcvAckChange := CardRcvAckChange;
    oNodeSocket.OnCardReaderPacketChange := CardReaderPacketChange;
    oNodeSocket.OnCurrentAlarmEvent := CurrentAlarmEvent;
    oNodeSocket.OnCurrentDoorState := CurrentDoorState;
    oNodeSocket.OnDeviceCardAccessEvent := DeviceCardAccessEvent;
    oNodeSocket.OnDeviceConnected :=  DeviceConnected;
    oNodeSocket.OnDevicePacketChange := DevicePacketChange;
    oNodeSocket.OnDeviceUsed := DeviceUsedEvent;
    oNodeSocket.OnDoorPacketChange := DoorPacketChange;
    oNodeSocket.OnDoorHolidaySend := DoorHolidaySend;
    oNodeSocket.OnRcvData:=           NotifyRcvData;
    oNodeSocket.OnRcvInvalidDevice:=  RcvInvalidDevice;
    oNodeSocket.OnReceiveData :=      DeviceReceiveData;
    oNodeSocket.OnReceiveTypeChage := DeviceReceiveTypeChage;
    oNodeSocket.OnSendData :=         NodeSendData;
    oNodeSocket.OnZONEEXTENDTYPEChange := ZONEEXTENDTYPEChange;

    L_c_server_client_socket_list.AddObject(inttostr(l_server_client_socket),oNodeSocket);

    oNodeSocket.NodeConnected := csConnected;
  end;
end;

procedure TdmNodeServer.handle_fd_close_notification(p_socket: Integer);
var l_status: Integer;
    l_linger: TLinger;
    l_absolute_linger: array[0..3] of char absolute l_linger;

    nIndex : Integer;
begin
  if p_socket <> L_server_socket_handle then
  begin
    nIndex:= L_c_server_client_socket_list.IndexOf(inttostr(p_socket));
  end;
  if WSAIsBlocking then WSACancelBlockingCall;
  ShutDown(p_socket, 2);
  Try
    SetSockOpt(p_socket, Sol_Socket, So_Linger,
              pAnsichar(AnsiString(l_absolute_linger)), sizeof(l_linger));  // l_absolute_linger[0] ->  AnsiString(l_absolute_linger) ���� ����
  Except
  End;
  l_status:= CloseSocket(p_socket);
  if nIndex > -1 then
  begin
    ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).Free;
    L_c_server_client_socket_list.Delete(nIndex);
  end;
end;

procedure TdmNodeServer.handle_fd_read_notification(p_socket: tSocket);
var nIndex : integer;
begin
  if p_socket= L_server_socket_handle then
  begin
    //server should not receive much
  end else
  begin
    nIndex := L_c_server_client_socket_list.IndexOf(inttostr(p_socket));
    if nIndex > -1 then
    begin
      ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ServerSocketRead;
    end;
  end;
end;

procedure TdmNodeServer.handle_fd_write_notification(p_socket: Integer);
var nIndex : integer;
    l_remaining: Integer;
    l_pt_start_reception: Pointer;
begin
  if p_socket <> L_server_socket_handle then
  begin
    nIndex := L_c_server_client_socket_list.IndexOf(inttostr(p_socket));
    if nIndex > -1 then
    begin
      with ClientSocket(L_c_server_client_socket_list.Objects[nIndex]) do
      begin

      end;
    end;
  end;
end;

procedure TdmNodeServer.handle_wm_async_select(var Msg: TMessage);
var
    l_param: Integer;
    l_error, l_notification: Integer;
    l_socket_handle: Integer;
begin
    l_param:= Msg.lParam;
    l_socket_handle:= Msg.wParam;
    l_error:= wsaGetSelectError(l_param);
    l_notification:= wsaGetSelectEvent(l_param);

    if l_error<= wsaBaseErr then
    begin
      case l_notification of
        FD_ACCEPT: handle_fd_accept_notification(l_socket_handle);
        FD_CONNECT: begin end; //display('no server fd_connect');
        FD_WRITE: handle_fd_write_notification(l_socket_handle);
        FD_READ: handle_fd_read_notification(l_socket_handle);
        FD_CLOSE: handle_fd_close_notification(l_socket_handle);
      end // case
    end else begin
      if l_notification= FD_CLOSE then handle_fd_close_notification(l_socket_handle);
    end;
end;

procedure TdmNodeServer.LoadDeviceNodeServer_CardPermitSetting(
  aWinSock: integer; aNodeNo, aECUID, aEXTENDID, aCARDNO, aPERMIT, aSTATECODE,
  aDOOR1, aDOOR2, aDOOR3, aDOOR4, aDOOR5, aDOOR6, aDOOR7, aDOOR8, aARMAREA0,
  aARMAREA1, aARMAREA2, aARMAREA3, aARMAREA4, aARMAREA5, aARMAREA6, aARMAREA7,
  aARMAREA8, aRCVACK, aPOSITIONNUM, aTIMECODEUSE, aTCGROUP, aTCTIME1, aTCTIME2,
  aTCTIME3, aTCTIME4, aTCWEEKCODE, aREGDATE, aENDDATE,aEmState: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSock));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetNodeToCardPermitInitialize(aECUID,aEXTENDID,aCARDNO,aPERMIT,aSTATECODE,
    aDOOR1,aDOOR2,aDOOR3,aDOOR4,aDOOR5,aDOOR6,aDOOR7,aDOOR8,aARMAREA0,aARMAREA1,aARMAREA2,aARMAREA3,aARMAREA4,aARMAREA5,aARMAREA6,
    aARMAREA7,aARMAREA8,aRCVACK,aPOSITIONNUM,aTIMECODEUSE,aTCGROUP,aTCTIME1,aTCTIME2,aTCTIME3,aTCTIME4,aTCWEEKCODE,aREGDATE,aENDDATE,aEmState);

end;

procedure TdmNodeServer.LoadDeviceNodeServer_NodeRCVSetting(aWinSock: integer;
  aECUUSE, aKTTSYSTEMID, aKTTTELNUMBER, aKTTREMOTERINGCOUNT, aKTTCDMAUSE,
  aKTTCDMADATA, aDVRUSE, aDVRDATA, aARMEXTENTIONMAINTOLOCAL,
  aARMEXTENTIONMAINFROMLOCAL: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSock));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ECUUSERCV := aECUUSE;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTSYSTEMIDRCV := aKTTSYSTEMID;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTTELNUMBERRCV := aKTTTELNUMBER;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTREMOTERINGCOUNTRCV := aKTTREMOTERINGCOUNT;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTCDMAUSERCV := aKTTCDMAUSE;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTCDMADATARCV := aKTTCDMADATA;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).DVRUSERCV := aDVRUSE;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).DVRDATARCV := aDVRDATA;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ARMEXTENTIONMAINTOLOCALRCV := aARMEXTENTIONMAINTOLOCAL;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ARMEXTENTIONMAINFROMLOCALRCV := aARMEXTENTIONMAINFROMLOCAL;

end;

procedure TdmNodeServer.LoadDeviceNodeServer_NodeSetting(aWinSock:integer;
  aNodeNo: integer; aDeviceID, aNodeName, aNodeIP, aNodePort, aKttSystemID,
  aKttTelNumber1, aKttTelNumber2, aKTTREMOTEARMRINGCOUNT,
  aKTTREMOTEDISARMRINGCOUNT, aKTTCDMAUSE, aKTTCDMAIP, aKTTCDMAPORT,
  aKTTCDMACHECKTIME, aKTTCDMARSSI, aKTTCDMAMIN, aKTTCDMAMUX, aDVRUSE, aDVRIP,
  aDVRPORT, aFGGROUPCODE, aARMEXTENTIONGUBUN, aARMEXTENTIONMAINTOLOCAL,
  aARMEXTENTIONMAINFROMLOCAL: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSock));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).InfoInitialize := True;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).No := aNodeNo;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SocketType := 2;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).DeviceID := aDeviceID;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).NodeName := aNodeName;
  //ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).LANIP := aNodeIP;
  //ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).LANPort := strtoint(aNodePort);
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTSYSTEMID := aKttSystemID;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTTELNUMBER1 := aKttTelNumber1;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTTELNUMBER2 := aKttTelNumber2;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTREMOTEARMRINGCOUNT := strtoint(aKTTREMOTEARMRINGCOUNT);
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTREMOTEDISARMRINGCOUNT := strtoint(aKTTREMOTEDISARMRINGCOUNT);
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTCDMAUSE := aKTTCDMAMIN;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTCDMAIP := aKTTCDMAIP;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTCDMAPORT := aKTTCDMAPORT;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTCDMACHECKTIME := aKTTCDMACHECKTIME;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTCDMARSSI := aKTTCDMARSSI;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTCDMAMIN := aKTTCDMAMIN;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).KTTCDMAMUX := aKTTCDMAMUX;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).DVRUSE := aDVRUSE;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).DVRIP := aDVRIP;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).DVRPORT := aDVRPORT;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).FIREGUBUNCODE := aFGGROUPCODE;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ARMEXTENTIONGUBUN := aARMEXTENTIONGUBUN;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ARMEXTENTIONMAINTOLOCAL := aARMEXTENTIONMAINTOLOCAL;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ARMEXTENTIONMAINFROMLOCAL := aARMEXTENTIONMAINFROMLOCAL;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).InfoInitialize := False;
end;

procedure TdmNodeServer.LoadDeviceNodeServer_ReaderRCVSetting(aWinSock: integer;
  aECUID, aREADERNO, aReaderSETTINGINFO: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSock));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,aECUID,aREADERNO,aReaderSETTINGINFO);
end;

procedure TdmNodeServer.LoadDeviceNodeServer_ReaderSetting(aWinSock:integer; aECUID,
  aREADERNO, aREADERUSE, aREADERTYPE, aREADERDOOR, aDOORPOSITIONCODE,
  aBUILDINGPOSITIONCODE, aARMAREANO: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSock));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdInfoInitialize,aECUID,aREADERNO,'1');
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdUse,aECUID,aREADERNO,aREADERUSE);
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdType,aECUID,aREADERNO,aREADERTYPE);
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdDoorNo,aECUID,aREADERNO,aREADERDOOR);
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdDoorPosition,aECUID,aREADERNO,aDOORPOSITIONCODE);
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdBuildingPositionCode,aECUID,aREADERNO,aBUILDINGPOSITIONCODE);
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdArmAreaNo,aECUID,aREADERNO,aARMAREANO);
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdInfoInitialize,aECUID,aREADERNO,'0');

end;


procedure TdmNodeServer.NodeConnectCheckTimerTimer(Sender: TObject);
var
  i : integer;
  dtPollingTime: TDatetime;
  dtTimeOut: TDatetime;
  nWinSock : integer;
  nIndex : integer;
begin
  inherited;
  Try
    NodeConnectCheckTimer.Enabled := False;
    if ServerNodeList.Count < 1 then Exit;

    for i := ServerNodeList.Count - 1 downto 0 do
    begin
      if G_bApplicationTerminate then Exit;
      nWinSock := TServerNode(ServerNodeList.Objects[i]).WinSocket;
      nIndex := L_c_server_client_socket_list.IndexOf(inttostr(nWinSock));
      if nIndex > -1 then
      begin
        if ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).NodeConnected = csConnected then
        begin
          Try
            dtPollingTime:= ClientSocket(L_c_server_client_socket_list.Objects[i]).LastReceiveTime;
            dtTimeOut:= IncTime(dtPollingTime,0,0,con_NODESOCKETDELAYTIME,0);
            if Now > dtTimeOut then
            begin
               ServerNodeDisConnect(nWinSock);
            end;
          Except
            LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','NodeConnectCheckTimerTimer');
            //
          End;
        end;
      end;
    end;

  Finally
    NodeConnectCheckTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

procedure TdmNodeServer.NodePacket(Sender: TObject; aNodeNo: integer; aNodeName,
  aEcuID, aCmd, aMsgNo, aDeviceVer, aData, aType: string);
begin
  if Assigned(FOnNodePacket) then
  begin
    OnNodePacket(Self,aNodeNo,aNodeName,aEcuID,aCmd,aMsgNo,aDeviceVer,aData,aType);
  end;
end;

procedure TdmNodeServer.NodeSendData(Sender: TObject; aNodeNo: integer;
  aData: string);
begin
  if Assigned(FOnSendData) then
  begin
    OnSendData(Self,aNodeNo,aData);
  end;
end;

procedure TdmNodeServer.NotifyRcvData(Sender: TObject; aNodeNo: integer;
  aData: string);
begin
  if Assigned(FOnRcvData) then
  begin
    OnRcvData(Self,aNodeNo,aData);
  end;
end;

procedure TdmNodeServer.RcvInvalidDevice(Sender: TObject; aNodeNo: integer;
  aData: string);
begin
  if Assigned(FOnRcvInvalidDevice) then
  begin
    OnRcvInvalidDevice(Self,aNodeNo,aData);
  end;
end;

procedure TdmNodeServer.RegDeviceID(aWinSock: integer; aNodeNo,
  aDeviceID: string);
var
  nIndex : integer;
begin
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSock));
  if nIndex < 0 then Exit;

  if isDigit(aNodeNo) then
    ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).No := strtoint(aNodeNo);
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).ControlNodeToDeviceRegDeviceID(aDeviceID);

end;

procedure TdmNodeServer.ServerNodeDisConnect(aWinSock: integer);
var
  nIndex : integer;
begin
  CloseSocket(aWinSock);
  nIndex := L_c_server_client_socket_list.IndexOf(inttostr(aWinSock));
  if nIndex < 0 then Exit;
  ClientSocket(L_c_server_client_socket_list.Objects[nIndex]).Free;
  L_c_server_client_socket_list.Delete(nIndex);
end;

procedure TdmNodeServer.SetServerStart(const Value: Boolean);
var
  l_result : integer;
  l_address_socket_in: tSockAddrIn;
  i : integer;
begin

  if FServerStart = Value then Exit;
  FServerStart := Value;

  if Value then
  begin
    l_result := wsaStartup($0101, l_wsa_data);
    if l_result <> 0 then
    begin
      ServerStart := False;
      Exit;  //���ϻ��� ���� �ÿ� Open False
    end;
    L_server_socket_handle:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    if L_server_socket_handle= INVALID_SOCKET then
    begin
      ServerStart := False;
      Exit;  //���ϻ��� ���� �ÿ� Open False
    end;
    l_result:= wsaAsyncSelect(L_server_socket_handle, Handle,wm_asynch_nodeselect,FD_ACCEPT+ FD_READ+ FD_WRITE+ FD_CLOSE);
    if l_result<> 0 then
    begin
      ServerStart := False;
      Exit;  //���ϻ��� ���� �ÿ� Open False
    end;
    FillChar(l_address_socket_in, sizeof(l_address_socket_in), 0);
    with l_address_socket_in do
    begin
      sin_family:= af_Inet;
      sin_port:= hToNs(ServerPort);
      sin_addr.s_addr:= InAddr_Any; // $00000000
    end;
    l_result:= Bind(L_server_socket_handle, l_address_socket_in,
        sizeof(l_address_socket_in));
    if l_result <> 0 then
    begin
      ServerStart := False;
      Exit;  //���ϻ��� ���� �ÿ� Open False
    end;
    l_result:= Listen(L_server_socket_handle, NodeMAXSOCKCOUNT);
    if l_result <> 0 then
    begin
      ServerStart := False;
      Exit;  //���ϻ��� ���� �ÿ� Open False
    end;
  end else
  begin
    for i := L_c_server_client_socket_list.Count - 1 downto 0 do
    begin
      ClientSocket(L_c_server_client_socket_list.Objects[i]).ServerSocketClose;
      ClientSocket(L_c_server_client_socket_list.Objects[i]).Free;
    end;
    if L_server_socket_handle <> INVALID_SOCKET then
    begin
      l_result:= CloseSocket(L_server_socket_handle);
      if l_result = 0 then L_server_socket_handle:= INVALID_SOCKET;
    end;
  end;
end;

procedure TdmNodeServer.WndProc(var Message: TMessage);
begin
  Dispatch ( Message );
end;


procedure TdmNodeServer.ZONEEXTENDTYPEChange(Sender: TObject; aNodeNo: integer;
  aEcuID, aExtendID, aNumber, aData: string);
begin
  if Assigned(FOnZONEEXTENDTYPEChange) then
  begin
    OnZONEEXTENDTYPEChange(Self,aNodeNo,aEcuID,aExtendID,aNumber,aData);
  end;
end;

end.