unit uSupremaServer;

interface

uses
  System.SysUtils, System.Classes,Winapi.Windows,Vcl.ExtCtrls,Forms,
  System.DateUtils,uFingerVariable,WinSock,Messages,u_c_byte_buffer;

const wm_asynch_select= wm_User;
const k_buffer_max= 4096;
      k_tcp_ip_chunk= 1500;
      MAXSOCKCOUNT = 100;

type
  TFingerCardNo = Class(TComponent)
  private
    FPOSITIONNUM: string;
    FSEND: string;
    FCARDNO: string;
    FTEMPLATE2_2: string;
    FCARDGUBUN: string;
    FTEMPLATE2_1: string;
    FTEMPLATE1_2: string;
    FTEMPLATE1_1: string;
    FFINGERID: string;
    FENDDATE: string;
    FFNSEQ: integer;
    FOnCardSendingChange: TCardSendingChange;
    FCARDSTATE: string;
    FPERMIT: string;
    procedure SetSEND(const Value: string);
  published
    property FNSEQ : integer read FFNSEQ write FFNSEQ;
    property POSITIONNUM : string read FPOSITIONNUM write FPOSITIONNUM;
    property CARDNO : string read FCARDNO write FCARDNO;
    property CARDGUBUN : string read FCARDGUBUN write FCARDGUBUN;
    property FINGERID : string read FFINGERID write FFINGERID;
    property TEMPLATE1_1 : string read FTEMPLATE1_1 write FTEMPLATE1_1;
    property TEMPLATE1_2 : string read FTEMPLATE1_2 write FTEMPLATE1_2;
    property TEMPLATE2_1 : string read FTEMPLATE2_1 write FTEMPLATE2_1;
    property TEMPLATE2_2 : string read FTEMPLATE2_2 write FTEMPLATE2_2;
    property ENDDATE : string read FENDDATE write FENDDATE;
    property PERMIT : string read FPERMIT write FPERMIT;
    property CARDSTATE : string read FCARDSTATE write FCARDSTATE;
    property SEND : string read FSEND write SetSEND;
  published
    property OnCardSendingChange : TCardSendingChange read FOnCardSendingChange write FOnCardSendingChange;
  End;


  TSupremaServer = Class(TComponent)
  private
    CardDownLoadTimer : TTimer;
    L_bCardDownLoading : Boolean;
    L_bCardDownLoadStop : Boolean;
    L_bGetFDData:Boolean;
    L_bModuleDestory : Boolean;
    L_bSocketWriting : Boolean;
    L_cFPCmd : char;
    l_c_reception_buffer: c_byte_buffer;
    L_nConnectedTime : integer;
    L_nFPSendCount : integer;
    L_nLibHandle : integer;
    L_nResult : integer;
    L_nSockethandle : integer;
    L_nErrorCount : integer;
    L_stData : string;
    L_stGetFDData : string;
    L_stEncryptData : string;
    L_stComBuff : string;
    l_wsa_data: twsaData;
    FingerCardList : TStringList;

    procedure CardDownLoadTimerTimer(Sender:TObject);
    procedure CardSendingChange(Sender: TObject;  aFNDEVICESEQ,POSITIONNUM : integer;aData:string);
    procedure TimeSync;
  private
    FHandle : THandle;
    FFNSEQ: integer;
    FDEVICEIP: string;
    FDEVICENAME: string;
    FDEVICEPORT: string;
    FDEVICETYPE: string;
    FNODENO: integer;
    FCPTYPE: string;
    FECUID: string;
    FEXTENDID: integer;
    FCONTROLNO: integer;
    FConnected: Boolean;
    FSocketOPEN: Boolean;
    FOnCardSendingChange: TCardSendingChange;
    FOnReaderConnected: TReaderConnected;
    FOnFingerCardEvent: TFingerCardEvent;
    FFingerDeviceID: integer;
    FWinSocket: tSocket;
    FSyncTime: TDateTime;
    procedure SetSocketOPEN(const Value: Boolean);
    procedure SetConnected(const Value: Boolean);
    procedure SupremaReaderSocketOpen(Value:Boolean);
    procedure ShunghunReaderSocketOpen(Value:Boolean);
    function HandleAllocated : Boolean;
    procedure HandleNeeded;
    function GetHandle: THandle;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    Function SetFingerCardDownload(aFNDEVICESEQ,aPOSITIONNUM,aSEND,aCARDNO,aCARDGUBUN,aFINGERID,aTEMPLATE1_1,aTEMPLATE1_2,aTEMPLATE2_1,aTEMPLATE2_2,aENDDATE,aPermit,aCardState:string):Boolean;
    Function FingerUserAllDelete:Boolean;
    procedure handle_fd_close_notification(p_socket: Integer);
    procedure handle_fd_connect_notification(p_socket: Integer);
    procedure handle_fd_read_notification(p_socket: tSocket);
    procedure handle_fd_write_notification(p_socket: Integer);
    procedure handle_wm_async_select(var Msg: TMessage); message wm_asynch_select;
    procedure CommNodeTriggerAvail(Sender: TObject; Buf: PAnsiChar;var DataLen: Integer);
    procedure CommNodeWsError(Sender: TObject;SockNo:integer;SocketError: Integer);
    function  PutString(aData:string;aLen:integer):Boolean;

    function ApprovalNum_Send(aFPReaderID,aUserID:integer):integer;
    function CheckSHFDDataPacket(aData:String; var bData:String):string;
    function SHFDataPacektProcess(aHexPacket:string):Boolean;
    function GetEncrypt(aFPReaderID:integer):integer;
    function GetFingerData(aUserID:string):string;
    function GetFPData(aUserID:string):string;
    function FP_HexSendPacket(aCmd : char;aHexAddress,aHexData:string):Boolean;
    function UserCardSend(aFPReaderID,aUserID:integer;aUserCard,aPermit:string) : integer;
    function UserCard2_4Send(aFPReaderID,aUserID:integer;aUserCard,aPermit:string) : integer;
    function UserCardDelete(aFPReaderID,aUserID:integer) : integer;
    function UserCardDelete2_4(aFPReaderID,aUserID:integer) : integer;
    function UserAllDelete:integer;
    function UserAllDelete2_4:integer;
    function UserFPDataSend(aFPReaderID,aUserID:integer;aFPDATA,aPermit:string) : integer;
    function UserFPDataSend2_4(aFPReaderID,aUserID:integer;aFPDATA,aPermit:string) : integer;
    function SetEncrypt(aFPReaderID,aType:integer):Boolean;
    function SetFingerApprovalNum(aFingerUserID:integer):Boolean;
    function ShunghunCardDownload:Boolean;
    function Shunghun2_4CardDownload:Boolean;
    function ShunghunSyncTime(aFPReaderID:integer;aSendData:string) : Boolean;
    function SyncTimeSend : Boolean;
  protected
    procedure WndProc ( var Message : TMessage ); virtual;
  published
    property FNSEQ : integer read FFNSEQ write FFNSEQ;
    property DEVICEIP : string read FDEVICEIP write FDEVICEIP;
    property DEVICENAME : string read FDEVICENAME write FDEVICENAME;
    property DEVICEPORT : string read FDEVICEPORT write FDEVICEPORT;
    property DEVICETYPE : string read FDEVICETYPE write FDEVICETYPE; //'1'.성현2.0,'2'.슈프리마,3.성현2.4이상,
    property CPTYPE : string read FCPTYPE write FCPTYPE;             //'1'.출입문권한,'2'.방범구역권한
    property NODENO : integer read FNODENO write FNODENO;
    property ECUID : string read FECUID write FECUID;
    property EXTENDID : integer read FEXTENDID write FEXTENDID;
    property CONTROLNO : integer read FCONTROLNO write FCONTROLNO;
    property Handle : THandle read GetHandle;
    property FingerDeviceID : integer read FFingerDeviceID write FFingerDeviceID;
    property WinSocket : tSocket read FWinSocket write FWinSocket;
  published
    property Connected : Boolean read FConnected write SetConnected;
    property SocketOPEN : Boolean read FSocketOPEN write SetSocketOPEN;
    property SyncTime : TDateTime read FSyncTime write FSyncTime;
  published
    property OnCardSendingChange : TCardSendingChange read FOnCardSendingChange write FOnCardSendingChange;
    property OnReaderConnected : TReaderConnected read FOnReaderConnected write FOnReaderConnected;
    property OnFingerCardEvent : TFingerCardEvent read FOnFingerCardEvent write FOnFingerCardEvent;

  End;
  TdmSupremaServer = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSupremaServer: TdmSupremaServer;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uDeviceVariable,
  uSyFpReaderFunction;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TSupremaServer }

function TSupremaServer.ApprovalNum_Send(aFPReaderID,
  aUserID: integer): integer;
var
  stUserID : string;
  stCardNo : string;
  stPassword : string;
  stMode : string;
  stTimeTable : string;
  stAdmin : string;
  stGrade : string;
  stDate : string;
  Tick: DWORD;
  NowTick: DWORD;
  stSendData : string;
  stAddr : string;
begin
  if aFPReaderID < 9 then stAddr := Dec2Hex(aFPReaderID - 1,2)
  else
  begin
    stAddr := Dec2Hex(aFPReaderID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;
  stUserID := FillZeroNumber(aUserID,G_nFPUserIDLength);
  stUserID := FillZeroStrNum(stUserID,10,False);
  stUserID := Ascii2Hex(stUserID);

  stSendData := stUserID;

  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPApprovalNum;
    FP_HexSendPacket(cmdFPApprovalNum,stAddr,stSendData);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    result := L_nResult;
  End;
end;

procedure TSupremaServer.CardDownLoadTimerTimer(Sender: TObject);
var
  i,j : integer;
  bSend : Boolean;
  nResult : UF_RET_CODE;
  SetScanTemplateADD : T_BS_ScanTemplateADD;
  SetDeleteUser : T_BS_DeleteUser;
  nCardNo : Longword;
  stExpiretime : string;
  expireTime : double;
  nExpireTime : int64;
  nFingerCount : integer;
  nUserID : integer;
  fnTemplate : PFingerTemplate;
  stErrMessage : string;
begin
  if DEVICETYPE = '1' then
  begin
    ShunghunCardDownload;
    Exit;
  end;
  if DEVICETYPE = '3' then
  begin
    Shunghun2_4CardDownload;
    Exit;
  end;
  if Not Connected then
  begin
    Exit; //접속 안되어 있으면 전송 하러 가지 말자.
  end;

  if L_bCardDownLoading then Exit;
  if L_bModuleDestory then Exit;
  if L_nLibHandle = 0 then Exit;  //Dll 로드 실패시 빠져 나감.
  Try
    L_bCardDownLoading := True;
    //여기서 카드데이터 다운로드 하자.
    if FingerCardList.Count > 0 then
    begin
      bSend := False;
      for i := 0 to FingerCardList.Count - 1 do
      begin
        if L_bCardDownLoadStop then Exit;

        if TFingerCardNo(FingerCardList.Objects[i]).SEND = 'R' then
        begin
          bSend := True;
          if (TFingerCardNo(FingerCardList.Objects[i]).CARDSTATE = '1') and  //카드가 등록 상태 이면서
             (TFingerCardNo(FingerCardList.Objects[i]).PERMIT = '1')         //권한이 있는 경우에만 전송
          then
          begin
            @SetScanTemplateADD := GetProcAddress(L_nLibHandle,'F_BS_ScanTemplateADD');
            if Not(@SetScanTemplateADD = nil)  then
            begin
              nCardNo := Hex2Dec64(copy(TFingerCardNo(FingerCardList.Objects[i]).CARDNO,1,8));
              stExpiretime := TFingerCardNo(FingerCardList.Objects[i]).ENDDATE;
              expireTime := EncodeDateTime(strtoint(copy(stExpiretime,1,4)),
                                             strtoint(copy(stExpiretime,5,2)),
                                             strtoint(copy(stExpiretime,7,2)),
                                             23,59,59,0);
              nExpireTime := (Trunc(expireTime) - SF_EpochDiff) * SF_SecsInDay;
              nUserID := strtoint(TFingerCardNo(FingerCardList.Objects[i]).POSITIONNUM);
              Try
                New(fnTemplate);
                nFingerCount := 0;
                if TFingerCardNo(FingerCardList.Objects[i]).CARDGUBUN = '0' then
                begin
                  if (TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE1_1 <> '') and
                     (TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE1_2 <> '')
                    then
                  begin
                    Try
                      nFingerCount := 1;
                      for j := 0 to SF_TEMPLATE_SIZE - 1 do
                        fnTemplate.Template1[j] := strtoint64(copy(TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE1_1,1 + (j * 10),10));
                      for j := 0 to SF_TEMPLATE_SIZE - 1 do
                        fnTemplate.Template2[j] := strtoint64(copy(TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE1_2,1 + (j * 10),10));
                      if (TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE2_1 <> '') and
                         (TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE2_2 <> '')
                        then
                      begin
                        nFingerCount := 2;
                        for j := 0 to SF_TEMPLATE_SIZE - 1 do
                          fnTemplate.Template3[j] := strtoint64(copy(TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE2_1,1 + (j * 10),10));
                        for j := 0 to SF_TEMPLATE_SIZE - 1 do
                          fnTemplate.Template4[j] := strtoint64(copy(TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE2_2,1 + (j * 10),10));
                      end;
                    Except
                      nFingerCount := 0;
                    End;
                  end;
                end;

                if Assigned(FOnFingerCardEvent) then
                begin
                  OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Download Start');
                end;
                nResult := SetScanTemplateADD(L_nSockethandle,nFingerCount,nUserID,0,fnTemplate^,nCardNo,nExpireTime);   //1471
                if nResult = UF_RET_SUCCESS then
                begin
                  L_nErrorCount := 0;
                  TFingerCardNo(FingerCardList.Objects[i]).SEND := 'Y';
                  if Assigned(FOnFingerCardEvent) then
                  begin
                    OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Download Success');
                  end;
                end else
                begin
                  if (nResult = UF_ERR_CANNOT_START_SOCKET) or
                     (nResult = UF_ERR_CANNOT_OPEN_SOCKET) or
                     (nResult = UF_ERR_CANNOT_CONNECT_SOCKET) or
                     (nResult = UF_ERR_CANNOT_READ_SOCKET) or
                     (nResult = UF_ERR_READ_SOCKET_TIMEOUT) or
                     (nResult = UF_ERR_CANNOT_WRITE_SOCKET) or
                     (nResult = UF_ERR_WRITE_SOCKET_TIMEOUT)
                   then
                   begin
                      SocketOpen := False;
                      if Assigned(FOnFingerCardEvent) then
                      begin
                        if (nResult = UF_ERR_CANNOT_START_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_START_SOCKET'
                        else if (nResult = UF_ERR_CANNOT_OPEN_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_OPEN_SOCKET'
                        else if (nResult = UF_ERR_CANNOT_CONNECT_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_CONNECT_SOCKET'
                        else if (nResult = UF_ERR_CANNOT_READ_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_READ_SOCKET'
                        else if (nResult = UF_ERR_READ_SOCKET_TIMEOUT) then stErrMessage := 'UF_ERR_READ_SOCKET_TIMEOUT'
                        else if (nResult = UF_ERR_CANNOT_WRITE_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_WRITE_SOCKET'
                        else if (nResult = UF_ERR_WRITE_SOCKET_TIMEOUT) then stErrMessage := 'UF_ERR_WRITE_SOCKET_TIMEOUT';
                        OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Socket Error' + stErrMessage);
                      end;
                      Delay(1000);
                   end else if nResult = UF_ERR_SOCKET_UNKNOWN then
                   begin
                      SocketOpen := False;
                      TFingerCardNo(FingerCardList.Objects[i]).SEND := 'Y';
                      if Assigned(FOnFingerCardEvent) then
                      begin
                        OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'(-311)Download Success');
                      end;
                   end else begin
                      L_nErrorCount := L_nErrorCount + 1;
                      if L_nErrorCount > 5 then
                      begin
                        SocketOpen := False;
                        L_nErrorCount := 0;
                        Delay(1000);
                      end;
                      TFingerCardNo(FingerCardList.Objects[i]).SEND := 'N'; //나중에 다시 전송 하자.
                      if Assigned(FOnFingerCardEvent) then
                      begin
                        OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),inttostr(integer(nResult)) + ': Download Fail');
                      end;
                   end;
                end;
              Finally
                Dispose(fnTemplate);
              End;
              break; //하나 전송 후 빠져 나가자.
            end else
            begin
              SocketOpen := False; //함수 로딩 실패시
            end;
          end else  //권한이 없는 경우 삭제 명령 내리자.
          begin
            @SetDeleteUser := GetProcAddress(L_nLibHandle,'F_BS_DeleteUser');
            if Not(@SetDeleteUser = nil)  then
            begin
              nUserID := strtoint(TFingerCardNo(FingerCardList.Objects[i]).POSITIONNUM);
              if Assigned(FOnFingerCardEvent) then
              begin
                OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDDELETE',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Download Start');
              end;
              nResult := SetDeleteUser(L_nSockethandle,nUserID);
              if nResult = UF_RET_SUCCESS then
              begin
                //L_nErrorCount := 0;
                TFingerCardNo(FingerCardList.Objects[i]).SEND := 'Y';
                if Assigned(FOnFingerCardEvent) then
                begin
                  OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDDELETE',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Download Success');
                end;
              end else
              begin
                if (nResult = UF_ERR_CANNOT_START_SOCKET) or
                   (nResult = UF_ERR_CANNOT_OPEN_SOCKET) or
                   (nResult = UF_ERR_CANNOT_CONNECT_SOCKET) or
                   (nResult = UF_ERR_CANNOT_READ_SOCKET) or
                   (nResult = UF_ERR_READ_SOCKET_TIMEOUT) or
                   //(nResult = UF_ERR_CANNOT_WRITE_SOCKET) or    // 지문데이터 없는데 삭제 명령 내려 보내는 경우
                   (nResult = UF_ERR_WRITE_SOCKET_TIMEOUT)
                 then
                 begin
                    SocketOpen := False;
                    if Assigned(FOnFingerCardEvent) then
                    begin
                      if (nResult = UF_ERR_CANNOT_START_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_START_SOCKET'
                      else if (nResult = UF_ERR_CANNOT_OPEN_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_OPEN_SOCKET'
                      else if (nResult = UF_ERR_CANNOT_CONNECT_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_CONNECT_SOCKET'
                      else if (nResult = UF_ERR_CANNOT_READ_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_READ_SOCKET'
                      else if (nResult = UF_ERR_READ_SOCKET_TIMEOUT) then stErrMessage := 'UF_ERR_READ_SOCKET_TIMEOUT'
                      else if (nResult = UF_ERR_CANNOT_WRITE_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_WRITE_SOCKET'
                      else if (nResult = UF_ERR_WRITE_SOCKET_TIMEOUT) then stErrMessage := 'UF_ERR_WRITE_SOCKET_TIMEOUT' ;
                      OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDDELETE',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Socket Error' + stErrMessage);
                    end;
                    Delay(1000);
                 end else begin
                    //L_nErrorCount := L_nErrorCount + 1;
                    TFingerCardNo(FingerCardList.Objects[i]).SEND := 'Y'; //전송 완료 처리 하자.
                    if Assigned(FOnFingerCardEvent) then
                    begin
                      OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDDELETE',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),inttostr(integer(nResult)) + ': Download Fail');
                    end;
                end;
              end;
            end else
            begin
              SocketOpen := False; //함수 로딩 실패시
            end;
            break; //하나 전송 후 빠져 나가자.
          end;
        end;
      end;
      if Not bSend then CardDownLoadTimer.Enabled := False; //전송 할 것이 없으면 다운로드 중지 하자.
    end else
    begin
      CardDownLoadTimer.Enabled := False;
    end;
  Finally
    L_bCardDownLoading := False;
  End;
end;

procedure TSupremaServer.CardSendingChange(Sender: TObject; aFNDEVICESEQ,
  POSITIONNUM: integer; aData: string);
begin
  if Assigned(FOnCardSendingChange) then
  begin
    OnCardSendingChange(Self,aFNDEVICESEQ,POSITIONNUM,aData);
  end;
end;

function TSupremaServer.CheckSHFDDataPacket(aData: String;
  var bData: String): string;
var
  nIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
  stPacket : string;
  stCrcData : string;
  stHexCRC : string;
  stDeviceCRC : string;
  nCRC : word;
  stTemp : string;
begin
  Result:= '';
  nIndex:= Pos(Ascii2Hex(STX),aData);
  if nIndex = 0 then
  begin
    result := ''; //자릿수가 작게 들어온 경우
    bData:= '';
    Exit;
  end;

  if nIndex > 1 then
  begin
    //STX 가 처음이 아니면 STX앞데이터 삭제
    Delete(aData,1,nIndex-1);
  end;

  if Length(aData) < 16 then
  begin
    result := ''; //자릿수가 작게 들어온 경우
    bData:= aData;
    Exit;
  end;
  Lenstr := Copy(aData,3,4);
  Lenstr := copy(Lenstr,3,2) + copy(Lenstr,1,2);

  //패킷에 정의된 길이
  DefinedDataLength:= Hex2Dec(Lenstr);

  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < (DefinedDataLength * 2) then
  begin
    //실제 데이터를 다 못 받은 경우
    bData:= aData;
    Exit;
  end;
  stTemp := copy(aData,DefinedDataLength * 2 - 6 + 1,2);
  if stTemp <> '03' then
  begin
    DefinedDataLength := DefinedDataLength + 1;
  end;

  stPacket := copy(aData,1,DefinedDataLength * 2);
  stDeviceCRC := copy(aData,(DefinedDataLength * 2) - 4 + 1,4);
  Delete(aData, 1, DefinedDataLength * 2);
  bData:= aData;
  stCrcData := copy(stPacket,1, (DefinedDataLength * 2) - 4);
  stCrcData := Hex2Ascii(stCrcData);
  nCRC := crc16_ccitt(pchar(stCrcData),DefinedDataLength - 2);
  stHexCRC := Dec2Hex(nCRC,4);
  stHexCRC := copy(stHexCRC,3,2) + copy(stHexCRC,1,2);
  result := stPacket; //CRC 체크하지 말자.
  if stHexCRC = copy(stPacket,(DefinedDataLength * 2) - 4 + 1,4) then  //CRC 체크하지 말자.
  begin
    result := stPacket; //패킷이 맞는거다.
  end;
end;

procedure TSupremaServer.CommNodeTriggerAvail(Sender: TObject; Buf: PAnsiChar;var DataLen: Integer);
var
  nIndex : integer;
  stPacket : string;
  st2 : string;
  stTemp : RawByteString;
begin
  //stTemp := ByteCopy(Buf,DataLen);   //FD -> 3F 로 변하는 부분때문에...
  L_stComBuff:= L_stComBuff + AsciiLen2Hex(Buf,DataLen);
  nIndex:= Pos(Ascii2Hex(STX),L_stComBuff);
  if nIndex = 0 then
  begin
    L_stComBuff := ''; //STX 가 없으면 잘못된 패킷이므로 수신데이터를 버리고 빠져 나간다.
  end;

  if nIndex > 1 then
  begin
    //STX 가 처음이 아니면 STX앞데이터 삭제
    Delete(L_stComBuff,1,nIndex-1);
  end;

  if Length(L_stComBuff) < 16 then Exit;  //최소 패킷 수가 8바이트 이상이다.

  repeat
    stPacket:= CheckSHFDDataPacket(L_stComBuff,st2);
    L_stComBuff:= st2;
    if stPacket <> '' then SHFDataPacektProcess(stPacket);
  until stPacket = '';

end;

procedure TSupremaServer.CommNodeWsError(Sender: TObject; SockNo,
  SocketError: Integer);
begin
  if Assigned(FOnFingerCardEvent) then
  begin
    OnFingerCardEvent(Self,DEVICEIP,'SocketError','','','SocketError' + inttostr(SocketError));
  end;
  SocketError := 0;
  Connected := False;
  SocketOpen := False;
end;

constructor TSupremaServer.Create(AOwner: TComponent);
var
  BS_InitSDK : T_BS_InitSDK;
  nResult : UF_RET_CODE;
begin
  DEVICETYPE := '2'; //디폴트로 슈프리마 지문리더 설정
  FHandle := 0;
  L_nLibHandle := -1;
  L_nLibHandle := LoadLibrary('BioStar16.dll');
  if L_nLibHandle > 0 then
  begin
    @BS_InitSDK := GetProcAddress(L_nLibHandle,'F_BS_InitSDK');
    if Not(@BS_InitSDK = nil)  then
    begin
      nResult := BS_InitSDK();
      if nResult <> UF_RET_SUCCESS then L_nLibHandle := 0;
    end else
    begin
      L_nLibHandle := 0;
    end;
  end;
  l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
  FingerCardList := TStringList.Create;
  CardDownLoadTimer := TTimer.Create(nil);
  CardDownLoadTimer.Interval := 500;
  CardDownLoadTimer.OnTimer := CardDownLoadTimerTimer;
  CardDownLoadTimer.Enabled := False;
  SyncTime := Now - 1;//전일자로 생성하자.
end;

destructor TSupremaServer.Destroy;
var
  i : integer;
begin
  L_bModuleDestory := True;
  if L_nLibHandle <> 0 then
    FreeLibrary(L_nLibHandle);

  CardDownLoadTimer.Enabled := False;
  if FingerCardList.Count > 0 then
  begin
    for i := FingerCardList.Count - 1 downto 0 do
    begin
      TFingerCardNo(FingerCardList.Objects[i]).Free;
    end;
  end;
  FingerCardList.Free;
  CardDownLoadTimer.Free;
  l_c_reception_buffer.Free;
  inherited;
end;

function TSupremaServer.FingerUserAllDelete: Boolean;
var
  i,j : integer;
  bSend : Boolean;
  nResult : UF_RET_CODE;
  SetFiingerAllUserDelete : T_BS_DeleteAllUser;
  stErrMessage : string;
begin
  if DEVICETYPE = '1' then
  begin
    //성현지문리더 이면
    UserAllDelete;
    Exit;
  end;
  if DEVICETYPE = '3' then
  begin
    //성현지문리더 이면
    UserAllDelete2_4;
    Exit;
  end;

  if L_nLibHandle = 0 then Exit;  //Dll 로드 실패시 빠져 나감.
  if Not Connected then Exit; //접속 안되어 있으면 전송 하러 가지 말자.

  if L_bCardDownLoading then Exit;
  if L_bModuleDestory then Exit;
  @SetFiingerAllUserDelete := GetProcAddress(L_nLibHandle,'F_BS_DeleteAllUser');
  if Not(@SetFiingerAllUserDelete = nil)  then
  begin
      nResult := SetFiingerAllUserDelete(L_nSockethandle);   //1471
      if nResult = UF_RET_SUCCESS then
      begin
        L_nErrorCount := 0;
        if Assigned(FOnFingerCardEvent) then
        begin
          OnFingerCardEvent(Self,DEVICEIP,'ALLUSERDELETE','','','Delete Success');
        end;
      end else
      begin
        if (nResult = UF_ERR_CANNOT_START_SOCKET) or
           (nResult = UF_ERR_CANNOT_OPEN_SOCKET) or
           (nResult = UF_ERR_CANNOT_CONNECT_SOCKET) or
           (nResult = UF_ERR_CANNOT_READ_SOCKET) or
           (nResult = UF_ERR_READ_SOCKET_TIMEOUT) or
           (nResult = UF_ERR_CANNOT_WRITE_SOCKET) or
           (nResult = UF_ERR_WRITE_SOCKET_TIMEOUT)
         then
         begin
            SocketOpen := False;
            if Assigned(FOnFingerCardEvent) then
            begin
              OnFingerCardEvent(Self,DEVICEIP,'ALLUSERDELETE','','','Socket Error');
            end;
            Delay(1000);
         end else if nResult = UF_ERR_SOCKET_UNKNOWN then
         begin
            SocketOpen := False;
            TFingerCardNo(FingerCardList.Objects[i]).SEND := 'Y';
            if Assigned(FOnFingerCardEvent) then
            begin
              OnFingerCardEvent(Self,DEVICEIP,'ALLUSERDELETE','','','(-311)Socket Error');
            end;
         end else begin
            if Assigned(FOnFingerCardEvent) then
            begin
              OnFingerCardEvent(Self,DEVICEIP,'ALLUSERDELETE','','','Error');
            end;
         end;
      end;
  end;

end;

function TSupremaServer.FP_HexSendPacket(aCmd: char; aHexAddress,
  aHexData: string): Boolean;
var
  stPacket : string;
  nLength : integer;
  stHexLen : string;
  nCRC : word;
  stHexCRC : string;
begin
  stPacket := aHexAddress + Ascii2Hex(aCmd) + aHexData;
  nLength := Length(stPacket) + (6 * 2);
  nLength := nLength div 2;
  stHexLen := Dec2Hex(nLength,4);
  stHexLen := copy(stHexLen,3,2) + copy(stHexLen,1,2); //앞 뒤를 바꾼다.
  stPacket := STX + Hex2Ascii(stHexLen) + Hex2Ascii(stPacket) + ETX;
  nCRC := crc16_ccitt(pchar(stPacket),nLength - 2);
  stHexCRC := Dec2Hex(nCRC,4);
  stHexCRC := copy(stHexCRC,3,2) + copy(stHexCRC,1,2); //앞 뒤를 바꾼다.
  stPacket := stPacket + Hex2Ascii(stHexCRC);

  PutString(stPacket,nLength);
  if Assigned(FOnFingerCardEvent) then
  begin
    OnFingerCardEvent(Self,DEVICEIP,'TX','','',aHexData);
  end;
end;

function TSupremaServer.GetEncrypt(aFPReaderID: integer): integer;
var
  stAddr : string;
  stSendData : string;
  Tick: DWORD;
  NowTick: DWORD;
begin
  (*if isDigit(L_stEncryptData) then
  begin
    result := strtoint(L_stEncryptData);
    Exit;
  end; *)
  result := 1;
  if aFPReaderID < 9 then stAddr := Dec2Hex(aFPReaderID - 1,2)
  else
  begin
    stAddr := Dec2Hex(aFPReaderID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;
  stSendData := '';

  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPGetEncrypt;
    FP_HexSendPacket(cmdFPGetEncrypt,stAddr,stSendData);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
    if L_stData <> '' then
    begin
      L_stData := Hex2Ascii(L_stData);
      if isDigit(L_stData) then result := strtoint(L_stData);
    end;
  Finally

  End;

end;

function TSupremaServer.GetFingerData(aUserID: string): string;
begin
  result := '';
  if L_bModuleDestory then Exit;
  L_bCardDownLoadStop := True;
  Try
    while L_bCardDownLoading do   //카드 다운로드 중이면 대기 하자.
    begin
      sleep(1);
      Application.ProcessMessages;
    end;
    if Not Connected then
    begin
      if SocketOpen then
      begin
        SocketOpen := False;
        Delay(500);
      end;
      SocketOpen := True;
      Delay(500);
    end;
    if Not Connected then
    begin
      Exit;
    end;
    result := GetFPData(aUserID);

  Finally
    L_bCardDownLoadStop := False;
  End;

end;

function TSupremaServer.GetFPData(aUserID: string): string;
var
  stUserID : string;
  Tick: DWORD;
  NowTick: DWORD;
  stAddr : string;
begin
  if FingerDeviceID < 9 then stAddr := Dec2Hex(FingerDeviceID - 1,2)
  else
  begin
    stAddr := Dec2Hex(FingerDeviceID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;

  stUserID := FillZeroStrNum(aUserID,G_nFPUserIDLength);
  stUserID := FillZeroStrNum(stUserID,10,False);
  stUserID := Ascii2Hex(stUserID);
  L_stGetFDData := '';
  Try
    L_nResult := 0;
    L_bGetFDData := True;
    L_cFPCmd := cmdFPGetFP;
    FP_HexSendPacket(cmdFPGetFP,stAddr,stUserID);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    L_bGetFDData := False;
    result := L_stGetFDData;
  End;
end;

function TSupremaServer.GetHandle: THandle;
begin
  HandleNeeded;
  Result := FHandle;
end;

function TSupremaServer.HandleAllocated: Boolean;
begin
  Result := ( FHandle <> 0 );
end;

procedure TSupremaServer.HandleNeeded;
begin
  if not HandleAllocated
   then FHandle := AllocateHWND ( WndProc );
end;

procedure TSupremaServer.handle_fd_close_notification(p_socket: Integer);
var
  l_status: Integer;
  l_linger: TLinger;
  l_absolute_linger: array[0..3] of char absolute l_linger;
begin
    if WSAIsBlocking
          then
            begin
              WSACancelBlockingCall;
            end;
    SocketOpen := False;
end;

procedure TSupremaServer.handle_fd_connect_notification(p_socket: Integer);
begin
  Connected:= True;
end;

procedure TSupremaServer.handle_fd_read_notification(p_socket: tSocket);
var
  l_remaining: Integer;
  l_pt_start_reception: Pointer;
  l_packet_bytes: Integer;
  l_eol_position: Integer;
  stTemp : String;
begin
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

    // -- add the received data to the current buffer
    l_pt_start_reception:= @ m_oa_byte_buffer[m_write_index];

    // -- get the data from the client socket
    //LogSave(ExeFolder + '\..\log\log'+ ConnectIP +'.log','RecvStart ');
    l_packet_bytes:= Recv(WinSocket, l_pt_start_reception^, l_remaining, 0);
    if l_packet_bytes < 0 then
    begin
      LogSave(G_stExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(Recv) '+ DEVICEIP);
      CommNodeWsError(Self,p_socket,WSAGetLastError);
    end else
    begin
        m_write_index:= m_write_index+ l_packet_bytes;
//TEST1
        CommNodeTriggerAvail(self, l_pt_start_reception, l_packet_bytes);
    end;
  end; // with g_c_reception_buffer

end;

procedure TSupremaServer.handle_fd_write_notification(p_socket: Integer);
begin
  L_bSocketWriting := False; //전송 완료 소켓 버퍼 Write 공간 생김
end;

procedure TSupremaServer.handle_wm_async_select(var Msg: TMessage);
var
  l_param: Integer;
  l_error, l_notification: Integer;
  l_socket_handle: Integer;
begin
    if L_bModuleDestory then Exit;
    l_param:= Msg.lParam;
    l_socket_handle:= Msg.wParam;

    // -- extract the error and the notification code from l_param
    l_error:= wsaGetSelectError(l_param);
    l_notification:= wsaGetSelectEvent(l_param);

    if l_error <= wsaBaseErr then
    begin
        case l_notification of
          FD_CONNECT: handle_fd_connect_notification(l_socket_handle);
          FD_ACCEPT: {display_bug_stop('no_client_accept')} ;
          FD_WRITE: handle_fd_write_notification(l_socket_handle);
          FD_READ: handle_fd_read_notification(l_socket_handle);
          FD_CLOSE:
          begin
            LogSave(G_stExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(fd_close_EVENT) -' + DEVICEIP);
            handle_fd_close_notification(l_socket_handle);
          end;
        end // case
    end else
    begin
      if l_notification= FD_CLOSE then
      begin
        LogSave(G_stExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(fd_close_ERR) -' + DEVICEIP);
         handle_fd_close_notification(l_socket_handle);
      end
      else
      begin
         LogSave(G_stExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(SELECT) -'+ inttostr(l_notification) + '-' + DEVICEIP);
         handle_fd_close_notification(l_socket_handle);
      end;
    end;
end;

function TSupremaServer.PutString(aData: string; aLen: integer): Boolean;
var
  l_result: Integer;
  buf: array of Byte;
  i : integer;
begin
  Try
    result := False;

    if WinSocket = INVALID_SOCKET then Exit;
    if Not SocketOpen then Exit;

    While L_bSocketWriting do
    begin
      if Not SocketOpen then Exit;
      Application.ProcessMessages;
      sleep(1);
    end;//전송 중에는 보내지 말자.  => 전송 완료 메시지 이벤트가 발생 안되어 무용지물


    SetLength(buf, aLen);
    for i := 1 to aLen do
    begin
      buf[i-1] := ord(aData[i]);
    end;

    Try
      l_result:= Send(WinSocket,buf[0], aLen, 0);

      if l_result < 0 then
      begin
        if l_result = wsaEWouldBlock  then
        begin
          L_bSocketWriting := True;  //Socket에 Full 나면 Write
        end else
        begin
          LogSave(G_stExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(Send) -'+ inttostr(l_result) + '-' + DeviceIP);
          CommNodeWsError(Self,WinSocket,WSAGetLastError);
        end;
      end;
    Except
      Exit;
    End;
    result := True;
  Finally
//    FTCSDeviceSender.Leave;
  End;
end;

procedure TSupremaServer.SetConnected(const Value: Boolean);
begin
  if FConnected = Value then Exit;
  FConnected := Value;
  if Assigned(FOnFingerCardEvent) then
  begin
    if Value then
      OnFingerCardEvent(Self,DEVICEIP,'Connected','','','Connected')
    else OnFingerCardEvent(Self,DEVICEIP,'DisConnected','','','DisConnected');
  end;
  if Assigned(FOnReaderConnected) then
  begin
    OnReaderConnected(Self,FNSEQ,Value);
  end;
  if Value then
  begin
    TimeSync;
  end;
end;

function TSupremaServer.SetEncrypt(aFPReaderID,aType: integer): Boolean;
var
  stData : string;
  stAddr : string;
  Tick: DWORD;
  NowTick: DWORD;
begin
  result := False;
  if aFPReaderID < 9 then stAddr := Dec2Hex(aFPReaderID - 1,2)
  else
  begin
    stAddr := Dec2Hex(aFPReaderID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;
  stData := FillZeroNumber(aType,3);
  stData := Ascii2Hex(stData);
  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPSetEncrypt;
    FP_HexSendPacket(cmdFPSetEncrypt,stAddr,stData);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    if L_nResult = 1 then result := True;
  End;

end;

function TSupremaServer.SetFingerApprovalNum(aFingerUserID: integer): Boolean;
begin
  result := False;
  if L_bModuleDestory then Exit;
  L_bCardDownLoadStop := True;
  Try
    while L_bCardDownLoading do   //카드 다운로드 중이면 대기 하자.
    begin
      sleep(1);
      Application.ProcessMessages;
    end;
    if Not Connected then
    begin
      if SocketOpen then
      begin
        SocketOpen := False;
        Delay(500);
      end;
      SocketOpen := True;
      Delay(500);
    end;
    if Not Connected then
    begin
      Exit;
    end;
    UserCardDelete(FingerDeviceID,aFingerUserID);
    if ApprovalNum_Send(FingerDeviceID,aFingerUserID) = 1 then result := True
    else result := False;


  Finally
    L_bCardDownLoadStop := False;
  End;
end;

function TSupremaServer.SetFingerCardDownload(aFNDEVICESEQ, aPOSITIONNUM, aSEND,
  aCARDNO, aCARDGUBUN, aFINGERID, aTEMPLATE1_1, aTEMPLATE1_2, aTEMPLATE2_1,
  aTEMPLATE2_2,aENDDATE,aPermit,aCardState: string): Boolean;
var
  nIndex : integer;
  oFingerCardNo : TFingerCardNo;
begin
  nIndex := FingerCardList.IndexOf(aPOSITIONNUM);
  if nIndex < 0 then
  begin
    oFingerCardNo := TFingerCardNo.Create(nil);
    oFingerCardNo.FNSEQ := strtoint(aFNDEVICESEQ);
    oFingerCardNo.POSITIONNUM := aPOSITIONNUM;
    oFingerCardNo.CARDNO := aCARDNO;
    oFingerCardNo.CARDGUBUN := aCARDGUBUN;
    oFingerCardNo.FINGERID := aFINGERID;
    oFingerCardNo.TEMPLATE1_1 := aTEMPLATE1_1;
    oFingerCardNo.TEMPLATE1_2 := aTEMPLATE1_2;
    oFingerCardNo.TEMPLATE2_1 := aTEMPLATE2_1;
    oFingerCardNo.TEMPLATE2_2 := aTEMPLATE2_2;
    oFingerCardNo.ENDDATE := aENDDATE;
    oFingerCardNo.PERMIT := aPermit;
    oFingerCardNo.CARDSTATE := aCardState;
    oFingerCardNo.SEND := aSEND;

    oFingerCardNo.OnCardSendingChange := CardSendingChange;

    FingerCardList.AddObject(aPOSITIONNUM,oFingerCardNo);
  end else
  begin
    TFingerCardNo(FingerCardList.Objects[nIndex]).FNSEQ := strtoint(aFNDEVICESEQ);
    TFingerCardNo(FingerCardList.Objects[nIndex]).POSITIONNUM := aPOSITIONNUM;
    TFingerCardNo(FingerCardList.Objects[nIndex]).CARDNO := aCARDNO;
    TFingerCardNo(FingerCardList.Objects[nIndex]).CARDGUBUN := aCARDGUBUN;
    TFingerCardNo(FingerCardList.Objects[nIndex]).FINGERID := aFINGERID;
    TFingerCardNo(FingerCardList.Objects[nIndex]).TEMPLATE1_1 := aTEMPLATE1_1;
    TFingerCardNo(FingerCardList.Objects[nIndex]).TEMPLATE1_2 := aTEMPLATE1_2;
    TFingerCardNo(FingerCardList.Objects[nIndex]).TEMPLATE2_1 := aTEMPLATE2_1;
    TFingerCardNo(FingerCardList.Objects[nIndex]).TEMPLATE2_2 := aTEMPLATE2_2;
    TFingerCardNo(FingerCardList.Objects[nIndex]).ENDDATE := aENDDATE;
    TFingerCardNo(FingerCardList.Objects[nIndex]).PERMIT := aPermit;
    TFingerCardNo(FingerCardList.Objects[nIndex]).CARDSTATE := aCardState;
    TFingerCardNo(FingerCardList.Objects[nIndex]).SEND := aSEND;

  end;
  CardDownLoadTimer.Enabled := True;
end;

procedure TSupremaServer.SetSocketOPEN(const Value: Boolean);
//var
//  BS_OpenSocket : T_BS_OpenSocket;
//  BS_CloseSocket : T_BS_CloseSocket;
//  nResult : UF_RET_CODE;
begin
  if FSocketOPEN = Value then Exit;
  FSocketOPEN := Value;

  if DEVICETYPE = '2' then SupremaReaderSocketOpen(Value)
  else if (DEVICETYPE = '1') OR (DeviceType = '3') then ShunghunReaderSocketOpen(Value);

(*
  if Value then
  begin
    if L_nLibHandle < 1 then
    begin
      SocketOPEN := False;
      Exit;
    end;
    @BS_OpenSocket := GetProcAddress(L_nLibHandle,'F_BS_OpenSocket');
    if Not(@BS_OpenSocket = nil)  then
    begin
      nResult := BS_OpenSocket(pAnsiChar(AnsiString(DeviceIP)), strtoint(DevicePort), L_nSockethandle);   //1471
      if nResult = UF_RET_SUCCESS then
      begin
        if Assigned(FOnFingerCardEvent) then
        begin
          OnFingerCardEvent(Self,DEVICEIP,'Socket','','','Open Success');
        end;
        Connected := True;
      end else
      begin
        L_nSockethandle := -1;
        SocketOPEN := False;
      end;
    end else
    begin
      SocketOPEN := False;
    end;
  end else
  begin
    Connected := False;
    if Assigned(FOnFingerCardEvent) then
    begin
      OnFingerCardEvent(Self,DEVICEIP,'Socket','','','Close');
    end;
    if L_nSockethandle <> -1 then
    begin
      @BS_CloseSocket := GetProcAddress(L_nLibHandle,'F_BS_CloseSocket');
      if Not(@BS_CloseSocket = nil)  then
      begin
        Try
          nResult := BS_CloseSocket(L_nSockethandle);   //1471
        Except
          Exit;
        End;
      end;
    end;
  end;
*)
end;

function TSupremaServer.SHFDataPacektProcess(aHexPacket: string): Boolean;
var
  stResult : string;
begin
  if Assigned(FOnFingerCardEvent) then
  begin
    OnFingerCardEvent(Self,DeviceIP,'RX','','',aHexPacket);
  end;

  stResult := copy(aHexPacket,4*2 + 1,2);
  if stResult = '00' then
  begin
    L_nResult:= 1;
    if L_cFPCmd = cmdFPGetEncrypt then L_stData := copy(aHexPacket,4*3 + 1,6);
  end else if stResult = '09' then L_nResult:= 1   //삭제할 사원번호가 없다.
  else L_nResult := -1;  //에러 발생한거다

  if L_bGetFDData then //지문 조회 중인 거다... 여기에서 지문 데이터 수신 하자.
  begin
    L_bGetFDData := False;
    if FNSEQ < 9 then Delete(aHexPacket,1,4*2 + 2)
    else Delete(aHexPacket,1,4*2 + 2 + 2);

    if(copy(aHexPacket,1,2) = '00') then Delete(aHexPacket,1,2);  //4자리 리더 아이디 인 경우 한자리 삭제 처리 -IF1000 에서 추가
    //Delete(aHexPacket,1,20); //해당 지문리더에 해당하는 카드번호 삭제 처리 IF1000 에서 추가
    //L_stGetFDData := copy(aHexPacket,1,Length(aHexPacket) - 6);
    L_stGetFDData := copy(aHexPacket,21,Length(aHexPacket) - 26);
  end;
end;

function TSupremaServer.Shunghun2_4CardDownload: Boolean;
var
  bSend : Boolean;
  nUserID : integer;
begin
  Dec(L_nConnectedTime);
  if Not Connected then
  begin
    if L_nConnectedTime > 0 then Exit; //소켓 Close 후에 3초 간은 들어 오지 말자.
    if SocketOpen then
    begin
      SocketOpen := False;
      Exit;
    end;
    L_nConnectedTime := 6;
    SocketOpen := True;
    Exit; //접속 안되어 있으면 전송 하러 가지 말자.
  end;

  if L_bCardDownLoading then Exit;
  if L_bModuleDestory then Exit;
  if L_bCardDownLoadStop then Exit;

  if FingerCardList.Count < 1 then
  begin
    if Assigned(FOnFingerCardEvent) then
    begin
      OnFingerCardEvent(Self,DEVICEIP,'BUFFER_Clear','','','BUFFER_Clear');
    end;
    SocketOpen := False;
    CardDownLoadTimer.Enabled := False;
    Exit;
  end;

  Try
    L_bCardDownLoading := True;
    if L_nFPSendCount > FingerCardList.Count - 1 then L_nFPSendCount := 0;
    nUserID := strtoint(TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).POSITIONNUM);
    if (TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).CARDSTATE = '1') and  //카드가 등록 상태 이면서
       (TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).PERMIT = '1')         //권한이 있는 경우에만 전송
    then
    begin
      if TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND = 'R' then
      begin
        bSend := True;
        //여기에서 카드 정보 전송 하고 응답을 기다린다.
        if UserCard2_4Send(FingerDeviceID,nUserID,TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).CARDNO,'1') = 1 then // 전송 성공 후 응답 받은 경우
        begin
          TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND := 'F';
        end else
        begin
          SocketOpen := False;
          Exit;
        end;
        if Assigned(FOnFingerCardEvent) then
        begin
          OnFingerCardEvent(Self,DEVICEIP,'CARDSEND',TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).CARDNO,inttostr(nUserID),'Card Send');
        end;
      end;
      if TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND = 'F' then
      begin
        //여기에서 지문 정보 전송 하고 응답을 기다린다.
        if UserFPDataSend2_4(FingerDeviceID,nUserID,TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).TEMPLATE1_1,'1') = 1 then
        begin
          TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND := 'Y';
        end else
        begin
          SocketOpen := False;
          Exit;
        end;
      end;
      if Assigned(FOnFingerCardEvent) then
      begin
        OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).CARDNO,inttostr(nUserID),'Download Success');
      end;
    end else
    begin
      if UserCardDelete(FingerDeviceID,nUserID) = 1 then
      begin
        TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND := 'Y';
        if Assigned(FOnFingerCardEvent) then
        begin
          OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDDELETE',TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).CARDNO,inttostr(nUserID),'Download Success');
        end;
      end;
    end;
    if TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND = 'Y' then  //전송 성공 했으면 삭제 하자.
    begin
      TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).Free;
      FingerCardList.Delete(L_nFPSendCount);
    end else L_nFPSendCount := L_nFPSendCount + 1;

  Finally
    L_bCardDownLoading := False;
  End;

end;

function TSupremaServer.ShunghunCardDownload: Boolean;
var
  bSend : Boolean;
  nUserID : integer;
begin
  Dec(L_nConnectedTime);
  if Not Connected then
  begin
    if L_nConnectedTime > 0 then Exit; //소켓 Close 후에 3초 간은 들어 오지 말자.
    if SocketOpen then
    begin
      SocketOpen := False;
      Exit;
    end;
    L_nConnectedTime := 6;
    SocketOpen := True;
    Exit; //접속 안되어 있으면 전송 하러 가지 말자.
  end;

  if L_bCardDownLoading then Exit;
  if L_bModuleDestory then Exit;
  if L_bCardDownLoadStop then Exit;

  if FingerCardList.Count < 1 then
  begin
    SocketOpen := False;
    CardDownLoadTimer.Enabled := False;
    Exit;
  end;

  Try
    L_bCardDownLoading := True;
    if L_nFPSendCount > FingerCardList.Count - 1 then L_nFPSendCount := 0;
    nUserID := strtoint(TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).POSITIONNUM);
    if (TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).CARDSTATE = '1') and  //카드가 등록 상태 이면서
       (TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).PERMIT = '1')         //권한이 있는 경우에만 전송
    then
    begin
      if TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND = 'R' then
      begin
        bSend := True;
        //여기에서 카드 정보 전송 하고 응답을 기다린다.
        if UserCardSend(FingerDeviceID,nUserID,TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).CARDNO,'1') = 1 then // 전송 성공 후 응답 받은 경우
        begin
          TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND := 'F';
        end else
        begin
          SocketOpen := False;
          Exit;
        end;
      end;
      if TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND = 'F' then
      begin
        //여기에서 지문 정보 전송 하고 응답을 기다린다.
        if UserFPDataSend(FingerDeviceID,nUserID,TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).TEMPLATE1_1,'1') = 1 then
        begin
          TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND := 'Y';
        end else
        begin
          SocketOpen := False;
          Exit;
        end;
        if Assigned(FOnFingerCardEvent) then
        begin
          OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).CARDNO,inttostr(nUserID),'Download Success');
        end;
      end;
    end else
    begin
      if UserCardDelete(FingerDeviceID,nUserID) = 1 then
      begin
        TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND := 'Y';
        if Assigned(FOnFingerCardEvent) then
        begin
          OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDDELETE',TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).CARDNO,inttostr(nUserID),'Download Success');
        end;
      end;
    end;
    if TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).SEND = 'Y' then  //전송 성공 했으면 삭제 하자.
    begin
      TFingerCardNo(FingerCardList.Objects[L_nFPSendCount]).Free;
      FingerCardList.Delete(L_nFPSendCount);
    end else L_nFPSendCount := L_nFPSendCount + 1;

  Finally
    L_bCardDownLoading := False;
  End;

end;

procedure TSupremaServer.ShunghunReaderSocketOpen(Value: Boolean);
var
  l_result : Integer;
  l_error: Integer;
  l_socket_address_in: tSockAddrIn;
  l_ip_z: array[0..255] of char;
  rset: TFDSet;
  t: TTimeVal;
  rslt: integer;
  stConnectIP : string;
begin
  stConnectIP := DeviceIP;
  if Value then
  begin
    if Assigned(FOnFingerCardEvent) then
    begin
      OnFingerCardEvent(Self,DEVICEIP,'SocketOpen','','','SocketOpen');
    end;
//    Connected:= False;   //Connecting
    l_result := wsaStartup(MAKEWORD(1, 1), l_wsa_data);
    if l_result <> 0 then
    begin
      SocketOpen := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    WinSocket:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    if WinSocket = INVALID_SOCKET then
    begin
      SocketOpen := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    l_result:= wsaAsyncSelect(WinSocket, Handle,
        wm_asynch_select,
        FD_CONNECT+ FD_READ+ FD_WRITE+ FD_CLOSE);

    FillChar(l_socket_address_in, sizeof(l_socket_address_in), 0);
    with l_socket_address_in do
    begin
      sin_family:= pf_Inet;
      // -- the requested service
      sin_port:= hToNs(strtoint(DEVICEPORT));
      // -- the server IP address
      if Not IsIPTypeCheck(DEVICEIP) then
      begin
        stConnectIP := GetIpFromDomain(DEVICEIP);
      end;
      StrPCopy(l_ip_z, stConnectIP);
      sin_addr.s_Addr:= inet_addr(PAnsichar(AnsiString(l_ip_z)));
    end; // with m_socket_address_in
    l_result:= Connect(WinSocket, l_socket_address_in,
        sizeof(l_socket_address_in));
    if l_result<> 0 then
    begin
      l_error:= WSAGetLastError;
      if l_error <> wsaEWouldBlock then
      begin
        //LogSave(ExeFolder + '\..\log\Connectlog'+ FormatDateTIme('yyyymmdd',Now)+'.log',ConnectIP + 'OpenError' + inttostr(WinSocket));
        SocketOpen := False;
        Exit;  //소켓생성 실패 시에 Open False
      end else
      begin
      end;
      //LogSave(ExeFolder + '\..\log\Connectlog'+ FormatDateTIme('yyyymmdd',Now)+'.log',ConnectIP + 'Open' + inttostr(WinSocket));
    end;
  end else
  begin
    Connected:= False;
    if WinSocket <> INVALID_SOCKET then
    begin
      //LogSave(ExeFolder + '\..\log\Connectlog'+ FormatDateTIme('yyyymmdd',Now)+'.log',ConnectIP + 'Close' + inttostr(WinSocket));
      shutdown(WinSocket,SD_BOTH);
      l_result:= CloseSocket(WinSocket);
      if l_result = 0 then
      begin
        WinSocket:= INVALID_SOCKET;
      end else
      begin
        WinSocket:= INVALID_SOCKET;
      end;
      if WSAISBlocking then WSACancelBlockingCall;  //--추가 20141215 충남대에서 에러 때문에 혹시나 해서...ㅠ.ㅠ
      WSACleanup;
    end;
  end;
end;

function TSupremaServer.ShunghunSyncTime(aFPReaderID:integer;aSendData:string): Boolean;
var
  stAddr : string;
  stSendData : string;
  Tick: DWORD;
  NowTick: DWORD;
begin
  Dec(L_nConnectedTime);
  if Not Connected then
  begin
    if L_nConnectedTime > 0 then Exit; //소켓 Close 후에 3초 간은 들어 오지 말자.
    if SocketOpen then
    begin
      SocketOpen := False;
      Exit;
    end;
    L_nConnectedTime := 6;
    SocketOpen := True;
    Exit; //접속 안되어 있으면 전송 하러 가지 말자.
  end;

  if L_bCardDownLoading then Exit;
  if L_bModuleDestory then Exit;
  Try
    L_bCardDownLoading := True;
    if aFPReaderID < 9 then stAddr := Dec2Hex(aFPReaderID - 1,2)
    else
    begin
      stAddr := Dec2Hex(aFPReaderID - 1,4);
      stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
    end;
    stSendData := Ascii2Hex(aSendData);
    L_nResult := 0;

    L_cFPCmd := cmdFPTimeSet;
    FP_HexSendPacket(cmdFPTimeSet,stAddr,stSendData);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
    if L_nResult = 1 then SyncTime := now; //현재시간으로 시간 동기화를 했다.
    SocketOpen := False;
  Finally
    L_bCardDownLoading := False;
  End;

end;

procedure TSupremaServer.SupremaReaderSocketOpen(Value: Boolean);
var
  BS_OpenSocket : T_BS_OpenSocket;
  BS_CloseSocket : T_BS_CloseSocket;
  nResult : UF_RET_CODE;
begin
  if Value then
  begin
    if L_nLibHandle < 1 then
    begin
      SocketOPEN := False;
      Exit;
    end;
    @BS_OpenSocket := GetProcAddress(L_nLibHandle,'F_BS_OpenSocket');
    if Not(@BS_OpenSocket = nil)  then
    begin
      nResult := BS_OpenSocket(pAnsiChar(AnsiString(DeviceIP)), strtoint(DevicePort), L_nSockethandle);   //1471
      if nResult = UF_RET_SUCCESS then
      begin
        if Assigned(FOnFingerCardEvent) then
        begin
          OnFingerCardEvent(Self,DEVICEIP,'Socket','','','Open Success');
        end;
        Connected := True;
      end else
      begin
        L_nSockethandle := -1;
        SocketOPEN := False;
      end;
    end else
    begin
      SocketOPEN := False;
    end;
  end else
  begin
    Connected := False;
    if Assigned(FOnFingerCardEvent) then
    begin
      OnFingerCardEvent(Self,DEVICEIP,'Socket','','','Close');
    end;
    if L_nSockethandle <> -1 then
    begin
      @BS_CloseSocket := GetProcAddress(L_nLibHandle,'F_BS_CloseSocket');
      if Not(@BS_CloseSocket = nil)  then
      begin
        Try
          nResult := BS_CloseSocket(L_nSockethandle);   //1471
        Except
          Exit;
        End;
      end;
    end;
  end;
end;

function TSupremaServer.SyncTimeSend: Boolean;
var
  stSendData:string;
begin
  if SyncTime > Now - 1 then Exit; //시간 전송 한지 하루가 안 지났으면 전송하지 말자
  if (DEVICETYPE <> '1') and (DEVICETYPE <> '3') then Exit;  //성현지문리더가 아니면 시간 전송하지 말자.
  if L_bCardDownLoading then Exit; //현재 카드 데이터 전송중이면 시간 전송하지 말자.

  stSendData := inttostr(DayofWeek(now)) + copy(formatdateTime('yyyymmddhhnnss',now),3,12);
  ShunghunSyncTime(FingerDeviceID,stSendData);
end;

procedure TSupremaServer.TimeSync;
var
  nResult : UF_RET_CODE;
  SetTimeSync : T_BS_SetTime;

  i,j : integer;
  bSend : Boolean;
  SetDeleteUser : T_BS_DeleteUser;
  nCardNo : Longword;
  stExpiretime : string;
  expireTime : double;
  nExpireTime : int64;
  nFingerCount : integer;
  nUserID : integer;
  fnTemplate : PFingerTemplate;
begin
  if L_nLibHandle = 0 then Exit;  //Dll 로드 실패시 빠져 나감.
  if Not Connected then Exit; //접속 안되어 있으면 전송 하러 가지 말자.

  if L_bModuleDestory then Exit;
  Try
    @SetTimeSync := GetProcAddress(L_nLibHandle,'F_BS_SetTime');
    if Not(@SetTimeSync = nil)  then
    begin
      nResult := SetTimeSync(L_nSockethandle);   //1471
    end;
  Except

  End;
end;

function TSupremaServer.UserAllDelete: integer;
var
  stUserID : string;
  Tick: DWORD;
  NowTick: DWORD;
  stSendData : string;
  stAddr : string;
begin
  if Not Connected then
  begin
    if SocketOpen then
    begin
      SocketOpen := False;
      Delay(100);
    end;
    L_nConnectedTime := 6;
    SocketOpen := True;
    Delay(100);
  end;

  if FingerDeviceID < 9 then stAddr := Dec2Hex(FingerDeviceID - 1,2)
  else
  begin
    stAddr := Dec2Hex(FingerDeviceID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;

  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPAllDelete;
    FP_HexSendPacket(cmdFPAllDelete,stAddr,'');
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    result := L_nResult;
  End;
end;

function TSupremaServer.UserAllDelete2_4: integer;
var
  stUserID : string;
  Tick: DWORD;
  NowTick: DWORD;
  stSendData : string;
  stAddr : string;
begin
  if Not Connected then
  begin
    if SocketOpen then
    begin
      SocketOpen := False;
      Delay(100);
    end;
    L_nConnectedTime := 6;
    SocketOpen := True;
    Delay(100);
  end;

  if FingerDeviceID < 9 then stAddr := Dec2Hex(FingerDeviceID - 1,2)
  else
  begin
    stAddr := Dec2Hex(FingerDeviceID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;

  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPAllDelete;
    FP_HexSendPacket(cmdFPAllDelete,stAddr,'');
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    result := L_nResult;
  End;
end;

function TSupremaServer.UserCard2_4Send(aFPReaderID, aUserID: integer;
  aUserCard, aPermit: string): integer;
var
  stUserID : string;
  stCardNo : string;
  stPassword : string;
  stMode : string;
  stTimeTable : string;
  stAdmin : string;
  stGrade : string;
  stDate : string;
  Tick: DWORD;
  NowTick: DWORD;
  stSendData : string;
  stAddr : string;
begin
  if aFPReaderID < 9 then stAddr := Dec2Hex(aFPReaderID - 1,2)
  else
  begin
    stAddr := Dec2Hex(aFPReaderID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;
  stUserID := FillZeroNumber(aUserID,G_nFPUserIDLength);
  stUserID := FillZeroStrNum(stUserID,10,False);
  stUserID := Ascii2Hex(stUserID);
  stPassword := FillCharString('','F',10 * 2);
  stMode := '33333330';
  stMode := Ascii2Hex(stMode);
  stTimeTable := FillCharString('','F',168 * 2);
  stAdmin := '30';
  stGrade := '01';
  stDate := FillCharString('','F',20 * 2);

  //if copy(aUserCard,15,2) = '**' then stCardNo:= copy(aUserCard,1,8)
  //else
  //begin
  //  stCardNo := copy(aUserCard,1,10) + copy(aUserCard,15,2);
  //  stCardNo := Ascii2Hex(stCardNo);
  //end;
  stCardNo := FillCharString(aUserCard,'F',72); //72자리 카드 번호를 만든다.


  stSendData := stUserID + stCardNo + stPassword + stMode + stTimeTable + stAdmin + stGrade + stDate;

  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPCard;
    FP_HexSendPacket(cmdFPCard,stAddr,stSendData);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    result := L_nResult;
  End;
end;

function TSupremaServer.UserCardDelete(aFPReaderID, aUserID: integer): integer;
var
  stUserID : string;
  stCardNo : string;
  Tick: DWORD;
  NowTick: DWORD;
  stSendData : string;
  stAddr : string;
begin
  if aFPReaderID < 9 then stAddr := Dec2Hex(aFPReaderID - 1,2)
  else
  begin
    stAddr := Dec2Hex(aFPReaderID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;
  stUserID := FillZeroNumber(aUserID,G_nFPUserIDLength);
  stUserID := FillZeroStrNum(stUserID,10,False);
  stUserID := Ascii2Hex(stUserID);
  stSendData := stUserID ;

  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPCardDelete;
    FP_HexSendPacket(cmdFPCardDelete,stAddr,stSendData);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    result := L_nResult;
  End;
end;

function TSupremaServer.UserCardDelete2_4(aFPReaderID,
  aUserID: integer): integer;
var
  stUserID : string;
  stCardNo : string;
  Tick: DWORD;
  NowTick: DWORD;
  stSendData : string;
  stAddr : string;
begin
  if aFPReaderID < 9 then stAddr := Dec2Hex(aFPReaderID - 1,2)
  else
  begin
    stAddr := Dec2Hex(aFPReaderID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;
  stUserID := FillZeroNumber(aUserID,G_nFPUserIDLength);
  stUserID := FillZeroStrNum(stUserID,10,False);
  stUserID := Ascii2Hex(stUserID);
  stSendData := stUserID ;

  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPCardDelete;
    FP_HexSendPacket(cmdFPCardDelete,stAddr,stSendData);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    result := L_nResult;
  End;
end;

function TSupremaServer.UserCardSend(aFPReaderID, aUserID: integer; aUserCard,
  aPermit: string): integer;
var
  stUserID : string;
  stCardNo : string;
  stPassword : string;
  stMode : string;
  stTimeTable : string;
  stAdmin : string;
  stGrade : string;
  stDate : string;
  Tick: DWORD;
  NowTick: DWORD;
  stSendData : string;
  stAddr : string;
begin
  if aFPReaderID < 9 then stAddr := Dec2Hex(aFPReaderID - 1,2)
  else
  begin
    stAddr := Dec2Hex(aFPReaderID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;
  stUserID := FillZeroNumber(aUserID,G_nFPUserIDLength);
  stUserID := FillZeroStrNum(stUserID,10,False);
  stUserID := Ascii2Hex(stUserID);
  stPassword := FillCharString('','F',10 * 2);
  stMode := '33333330';
  stMode := Ascii2Hex(stMode);
  stTimeTable := FillCharString('','F',168 * 2);
  stAdmin := '30';
  stGrade := '01';
  stDate := FillCharString('','F',20 * 2);

  if copy(aUserCard,15,2) = '**' then stCardNo:= copy(aUserCard,1,8)
  else
  begin
    stCardNo := copy(aUserCard,1,10) + copy(aUserCard,15,2);
    stCardNo := Ascii2Hex(stCardNo);
  end;
  stCardNo := FillCharString(stCardNo,'F',24); //24자리 카드 번호를 만든다.


  stSendData := stUserID + stCardNo + stPassword + stMode + stTimeTable + stAdmin + stGrade + stDate;

  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPCard;
    FP_HexSendPacket(cmdFPCard,stAddr,stSendData);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    result := L_nResult;
  End;
end;

function TSupremaServer.UserFPDataSend(aFPReaderID, aUserID: integer; aFPDATA,
  aPermit: string): integer;
var
  stUserID : string;
  Tick: DWORD;
  NowTick: DWORD;
  stSendData : string;
  stAddr : string;
begin
  if aFPReaderID < 9 then stAddr := Dec2Hex(aFPReaderID - 1,2)
  else
  begin
    stAddr := Dec2Hex(aFPReaderID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;
  stUserID := FillZeroNumber(aUserID,G_nFPUserIDLength);
  stUserID := FillZeroStrNum(stUserID,10,False);
  stUserID := Ascii2Hex(stUserID);

  stSendData := stUserID + aFPDATA;

  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPData;
    FP_HexSendPacket(cmdFPData,stAddr,stSendData);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    result := L_nResult;
  End;
end;

function TSupremaServer.UserFPDataSend2_4(aFPReaderID, aUserID: integer;
  aFPDATA, aPermit: string): integer;
var
  stUserID : string;
  Tick: DWORD;
  NowTick: DWORD;
  stSendData : string;
  stAddr : string;
begin
  if GetEncrypt(aFPReaderID) <> 1 then
  begin
    if SetEncrypt(aFPReaderID,1) then L_stEncryptData := '1';
  end;

  if aFPReaderID < 9 then stAddr := Dec2Hex(aFPReaderID - 1,2)
  else
  begin
    stAddr := Dec2Hex(aFPReaderID - 1,4);
    stAddr := copy(stAddr,3,2) + copy(stAddr,1,2);
  end;
  stUserID := FillZeroNumber(aUserID,G_nFPUserIDLength);
  stUserID := FillZeroStrNum(stUserID,10,False);
  stUserID := Ascii2Hex(stUserID);

  stSendData := stUserID + aFPDATA;

  Try
    L_nResult := 0;
    L_cFPCmd := cmdFPData;
    FP_HexSendPacket(cmdFPData,stAddr,stSendData);
    Tick := GetTickCount + DWORD(2000);
    while (L_nResult = 0) do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;
  Finally
    result := L_nResult;
  End;
end;

procedure TSupremaServer.WndProc(var Message: TMessage);
begin
  if G_bApplicationTerminate then Exit;

  Try
    Dispatch ( Message );
  Except
    Exit;
  End;
end;

{ TFingerCardNo }

procedure TFingerCardNo.SetSEND(const Value: string);
begin
  if FSEND = Value then Exit;
  FSEND := Value;
  if Assigned(FOnCardSendingChange) then
  begin
    OnCardSendingChange(Self,FNSEQ,strtoint(POSITIONNUM),Value);
  end;
end;

end.
