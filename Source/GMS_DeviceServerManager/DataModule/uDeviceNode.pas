unit uDeviceNode;

interface

uses
  System.SysUtils, System.Classes,Winapi.WinSock,Winapi.Messages,Vcl.Forms,
  uCommonVariable,u_c_byte_buffer,System.SyncObjs;

const k_buffer_max= 4096; //k_buffer_max= 4096;
      k_tcp_ip_chunk= 1500;

type
  TNode = class(TComponent)
  private
    L_bSocketWriting : Boolean;
    l_c_reception_buffer: c_byte_buffer;
    L_stComBuffer : RawByteString;
    L_stDeviceVer : string;
    Function NodeDataPacketProcess(aPacketData:string):Boolean;
    procedure NodeDataReadingProcessing;
  private
    FTCSDeviceSender : TCriticalSection;
    //Handle ���� �κ�
    FHandle : THandle;
    FWinSocket: tSocket;
    FConnectIP: string;
    FOnNodePacket: TNodePacket;
    FNodeConnected: integer;
    FLastReceiveTime: TDateTime;
    FDeviceID: string;
    FOnNodeConnected: TSocketConnected;
    function GetHandle: THandle;
    function HandleAllocated : Boolean;
    procedure HandleNeeded;
    procedure SetDeviceID(const Value: string);
    procedure SetNodeConnected(const Value: integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure ServerSocketClose;
    procedure ServerSocketRead;
    procedure WriteNotification;
    procedure NodeSocketError(Sender: TObject; SocketError: Integer);
    procedure NodeSocketReceive(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);
    Procedure SendPacket(aEcuId: String;aCmd:Char;aMsgNo:char;aDeviceVer, aData: String;aPriority:integer=0);
    function PutString(aData:string):Boolean;
  protected
    procedure WndProc ( var Message : TMessage ); virtual;
  published
    property Handle : THandle read GetHandle;
    property WinSocket : tSocket read FWinSocket write FWinSocket;
    property ConnectIP : string read FConnectIP write FConnectIP;
    property NodeConnected : integer read FNodeConnected write SetNodeConnected;
    property LastReceiveTime : TDateTime read FLastReceiveTime write FLastReceiveTime;
    property DeviceID : string read FDeviceID write SetDeviceID;
  published
    property OnNodePacket : TNodePacket read FOnNodePacket write FOnNodePacket;
    property OnNodeConnected : TSocketConnected read FOnNodeConnected write FOnNodeConnected;
  end;

  TdmDeviceNode = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDeviceNode: TdmDeviceNode;

implementation
uses
  uAlarmEventStateCode,
  uCommonFunction;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TNode }

constructor TNode.Create(AOwner: TComponent);
begin
  inherited;
  l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
  FTCSDeviceSender := TCriticalSection.Create;
end;

destructor TNode.Destroy;
begin
  l_c_reception_buffer.Free;
  l_c_reception_buffer:= Nil;

  FTCSDeviceSender.Free;
  inherited;
end;

function TNode.GetHandle: THandle;
begin
  HandleNeeded;
  Result := FHandle;
end;

function TNode.HandleAllocated: Boolean;
begin
  Result := ( FHandle <> 0 );
end;

procedure TNode.HandleNeeded;
begin
  if not HandleAllocated
   then FHandle := AllocateHWND ( WndProc );
end;

function TNode.NodeDataPacketProcess(aPacketData: string): Boolean;
var
  stECUID : string;
  stRealData : string;
  chCMD : char;
  chMsgNo : char;
  cKey : char;
  nIndex : integer;
  stTemp : string;
  stServerSendData : string;
  nOperLenth : integer;
  nPacketLength : integer;
  stPacketData : string;
  stExtendID : string;
  stNodeID : string;
  stTime : string;
  stSubCLass : string;
  stSubAddr : string;
  stArmArea : string;
  stMode : string;
  stAlarmStateCode : string;
  stLoop : string;
  stZoneState : string;
  stOperator : string;
  stAlarmStateCodeName,stAlarmStatePCCode,stAlarmStatePCCodeName,stAlarmStateModeChange,stAlarmView,stAlarmSound,stAlarmColor,stAlarmEventGroup : string;
begin
  Try
    result := False;
    if aPacketData = '' then Exit;
    nPacketLength := Length(aPacketData);
    stPacketData := copy(aPacketData,1,nPacketLength - 3);  //CS(2Byte) + ETX ����
    cKey := stPacketData[5];
    DeviceID := Copy(stPacketData, 8, G_nDeviceIDLength);
    stECUID := copy(stPacketData,8 + G_nDeviceIDLength,2);
    chCMD:= stPacketData[G_nDeviceIDLength + 10];
    chMsgNo:= stPacketData[G_nDeviceIDLength + 11];
    L_stDeviceVer := copy(stPacketData,6,2);
    NodeConnected := nwConnected;

    stExtendID := '001';
    case chCMD of
      'A','O' : begin
        if (nPacketLength - 3) > (4 + G_nDeviceIDLength + 10 + 29 + G_nAlarmOperLength) then
          stExtendID := copy(stPacketData,4 + G_nDeviceIDLength + 10 + 29 + G_nAlarmOperLength,G_nNodeExtIDLength)
      end;
      'e' : begin
        if (nPacketLength - 3) > (G_nDeviceIDLength + 10 + 7) then
        stExtendID := copy(stPacketData,G_nDeviceIDLength + 10 + 7,G_nNodeExtIDLength);
      end;
    end;
    stNodeID := stExtendID + DeviceID;

    stServerSendData := chCMD + DataDelimiter +        //0
                        stNodeID + DataDelimiter +     //1
                        stECUID + DataDelimiter;       //2

    Delete(stPacketData,1,7 + G_nDeviceIDLength + 2 + 1 + 1);
    //                   STX+K1,                ECUID,cmd,msg
    case chCMD of
      'A' : begin
        nOperLenth := 18;
        stTime     := copy(stPacketData,2,14);
        stSubCLass := copy(stPacketData,16,2);
        if (stSubCLass = 'EX') and (stECUID = '00') then stSubCLass := 'MN';
        stSubAddr  := copy(stPacketData,18,2);
        stArmArea  := copy(stPacketData,20,2);
        if isDigit(stArmArea) then stArmArea := inttostr(strtoint(stArmArea))
        else stArmArea := '0';
        stMode     := UpperCase(copy(stPacketData,22,1));
        stAlarmStateCode   := copy(stPacketData,23,2);
        stLoop     := copy(stPacketData,25,2);
        stZoneState    := copy(stPacketData,27,1);
        stOperator := copy(stPacketData,28,nOperLenth);

        if nOperLenth = 18 then
        begin
          if copy(stOperator,1,2) = '16' then Delete(stOperator,1,2);
        end;
        nIndex := AlarmEventStateCodeList.IndexOf(stAlarmStateCode);
        if nIndex > -1 then
        begin
          TAlarmEventStateCode(AlarmEventStateCodeList.Objects[nIndex]).GetAlarmEventPCCodeInfo(stAlarmStateCode,stSubCLass,stMode,stLoop,stZoneState,stOperator,
                                                                        stAlarmStateCodeName,stAlarmStatePCCode,stAlarmStatePCCodeName,stAlarmStateModeChange,stAlarmView,stAlarmSound,stAlarmColor,stAlarmEventGroup);
        end;
        stServerSendData := stServerSendData +                        //
                            stTime + DataDelimiter +                  //3
                            stSubCLass + DataDelimiter +              //4
                            stSubAddr + DataDelimiter +               //5
                            stArmArea + DataDelimiter +               //6
                            stMode + DataDelimiter +                  //7
                            stAlarmStateCode + DataDelimiter +        //8
                            stLoop + DataDelimiter +                  //9
                            stZoneState + DataDelimiter +             //10
                            stOperator + DataDelimiter +              //11
                            stAlarmStatePCCode + DataDelimiter +      //12
                            stAlarmStateModeChange + DataDelimiter +  //13
                            stAlarmView + DataDelimiter +             //14
                            stAlarmSound + DataDelimiter +            //15
                            stAlarmEventGroup + DataDelimiter ;       //16
        FileAppend(G_stEventDataDir + '/AlarmEvent' + FormatDateTime('yyyyMMddhhnnss',now) + '.dat',stServerSendData);
      end;
    end;

    if Assigned(FOnNodePacket) then
    begin
      OnNodePacket(Self,'RX',stServerSendData);
    end;

    if (chCMD <> 'c') then
    begin
      SendPacket(stECUID,'a',chMsgNo,L_stDeviceVer, 'w000', 0); //Ack ����
    end else
    begin
      stTemp:='Y' + Copy(aPacketData,G_nDeviceIDLength + 12,2)+'  '+'a' + '  w000';  //Access Event Ack
      SendPacket(stECUID,'c',chMsgNo,L_stDeviceVer, stTemp,0);   //���������� �α׸� ������
    end;

    Result:= True;
  Except
    Exit;
  End;
end;

procedure TNode.NodeDataReadingProcessing;
var
  nFormat : integer;
  bLoop : Boolean;
  stLeavePacketData : string;
  stPacketData : string;
  bDecoderFormat : Boolean;
begin
  Try
    bLoop := False;
    repeat
      if Trim(L_stComBuffer) = '' then Exit;
      nFormat := DecoderFromDevicePacketFormatCheck(L_stComBuffer,G_nProgramType,stLeavePacketData,stPacketData);
      if nFormat < 0 then
      begin
        if L_stComBuffer = '' then break;
        if nFormat = -1 then  //������ ���� �ΰ��
        begin
           Delete(L_stComBuffer,1,1);
           continue;
        end else break;   //���� ���̰� �۰� ���� ���
      end;
      L_stComBuffer:= stLeavePacketData;
      bDecoderFormat := False;
      if nFormat = 1 then bDecoderFormat := False
      else if nFormat = 2 then bDecoderFormat := True
      else continue;
      if bDecoderFormat then continue;   //���ڴ� ������ ��� ó�� ���� ����
      if stPacketData <> '' then
      begin
        NodeDataPacketProcess(stPacketData);
      end;

      if pos(ETX,L_stComBuffer) = 0 then bLoop := True
      else bLoop := False;
      Application.ProcessMessages;
    until bLoop;
  Except
    Exit;
  End;
end;

procedure TNode.NodeSocketError(Sender: TObject; SocketError: Integer);
var
  nResult : integer;
begin
  Try
    if (SocketError = WSAEWOULDBLOCK) or (SocketError = 10038) then Tag := 0
    else
    begin
      ServerSocketClose;
      Tag := SocketError;
    end;
  Except
    Exit;
  End;
end;

procedure TNode.NodeSocketReceive(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
var
  stTemp : RawByteString;
begin
  Try
    stTemp := ByteCopy(Buf,DataLen);   //FD -> 3F �� ���ϴ� �κж�����...
    LastReceiveTime := Now;
    L_stComBuffer := L_stComBuffer + stTemp;
    NodeDataReadingProcessing;
  Except
    Exit;
  End;
end;

function TNode.PutString(aData: string): Boolean;
var
  l_result: Integer;
  buf: TBytes;
begin
  Try
    Try
      FTCSDeviceSender.Enter;
      result := False;
      if Not (NodeConnected = nwConnected) then Exit;

      Try
        Ascii2Bytes(aData,Length(aData),buf);
        l_result:= Send(WinSocket,buf[0], Length(aData), 0);

        if l_result < 0 then
        begin
          if l_result = wsaEWouldBlock  then
          begin
            L_bSocketWriting := True;  //Socket�� Full ���� Write
          end else
          begin
            NodeSocketError(self,WSAGetLastError);
          end;
        end;
      Except
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log',ConnectIP + ':PutString');
        Exit;
      End;
      result := True;
    Finally
      FTCSDeviceSender.Leave;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.PutString');
  End;
end;

procedure TNode.SendPacket(aEcuId: String; aCmd, aMsgNo: char; aDeviceVer,
  aData: String; aPriority: integer);
var
  stDeviceID : string;
  nDataLength : integer;
  stLen : string;
  stPacket : string;
  cKey : char;
  stNormalPacket : string;
begin
  Try
    if Not (NodeConnected = nwConnected) then Exit;

    if G_nEncrypt = 0 then cKey := #$20
    else cKey := #$19;

    stDeviceID := DeviceID ;
    if Length(stDeviceID) < G_nDeviceIDLength then stDeviceID := FillZeroStrNum(stDeviceID,G_nDeviceIDLength);
    stDeviceID := stDeviceID + aEcuID;
    nDataLength := (G_nDeviceIDLength + 14) + Length(aData);
    stLen := FillZeroNumber(nDataLength, 3);
    if aCmd = 'a' then {���� ó��}
       stPacket := PacketCreate(G_nProgramType,stLen,aDeviceVer,stDeviceID,aCmd,aData,aMsgNo,cKey,stNormalPacket)
    else {���� or ��� }
    begin
      stPacket := PacketCreate(G_nProgramType,stLen,aDeviceVer,stDeviceID,aCmd,aData,aMsgNo,cKey,stNormalPacket);
    end;
    if aPriority = 0 then    //ack �� ���� �ֿ켱 ���� ������
    begin
      PutString(stPacket);
    end;

    if Assigned(FOnNodePacket) then
    begin
      OnNodePacket(Self,'TX',stPacket);
    end;

  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Node.SendPacket');
  End;
end;

procedure TNode.ServerSocketClose;
var
  nResult : integer;
begin
  Try
    if WinSocket <> INVALID_SOCKET then
    begin
      shutdown(WinSocket,SD_BOTH);
      nResult:= CloseSocket(WinSocket);
      //if l_result = 0 then
      WinSocket := INVALID_SOCKET;
      //WSACleanup;
    end;
    NodeConnected := nwDisConnected;
  Except
    Exit;
  End;
end;

procedure TNode.ServerSocketRead;
var l_remaining: Integer;
    l_pt_start_reception: Pointer;
    l_packet_bytes: Integer;

    l_eol_position: Integer;
    l_file_name: String;
begin
  Try
    if l_c_reception_buffer = nil then Exit;
    with l_c_reception_buffer do
    begin
      l_remaining:= m_buffer_size- m_write_index;
      // -- if not at least a tcp-ip chunk, increase the room
      if l_remaining < k_tcp_ip_chunk then
      begin
        // -- reallocate
        double_the_capacity;
        l_remaining:= m_buffer_size- m_write_index;
      end;
      l_pt_start_reception:= @ m_oa_byte_buffer[m_write_index];
      l_packet_bytes:= Recv(WinSocket, l_pt_start_reception^, l_remaining, 0);
      if l_packet_bytes < 0 then NodeSocketError(self,WSAGetLastError)
      else
      begin
        m_write_index:= m_write_index + l_packet_bytes;
        NodeSocketReceive(self, l_pt_start_reception, l_packet_bytes);
      end;
    end;
  Except
    Exit;
  End;
end;

procedure TNode.SetDeviceID(const Value: string);
begin
  if FDeviceID = Value then Exit;

  FDeviceID := Value;
end;

procedure TNode.SetNodeConnected(const Value: integer);
begin
  if FNodeConnected = Value then Exit;

  FNodeConnected := Value;
  if Value = nwConnected then
  begin
    L_bSocketWriting := False;
    if Assigned(FOnNodeConnected) then
    begin
      OnNodeConnected(Self,True);
    end;
  end else
  begin
    if Assigned(FOnNodeConnected) then
    begin
      OnNodeConnected(Self,False);
    end;
  end;
end;

procedure TNode.WndProc(var Message: TMessage);
begin
  Dispatch ( Message );
end;

procedure TNode.WriteNotification;
begin
  L_bSocketWriting := False;
end;

end.