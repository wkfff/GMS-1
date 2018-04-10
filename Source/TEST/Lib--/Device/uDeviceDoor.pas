unit uDeviceDoor;

interface

uses
  System.SysUtils, System.Classes,Windows,Forms,
  uNode,uDevice,uDeviceVariable;

const MAXDOORRCVCOUNT = 100;

type
  TDeviceDoor = Class(TComponent)
  private
    function ControlTimechar2DecType(aControlTime:char):string;
  private
    procedure DoorInformationSend(aInformationType: integer);
    procedure DoorInformationCheck(aInformationType: integer);

    function DoorScheduleResponseCheck(aIndex,aDelay:integer):Boolean;
    function DoorHoliDayResponseCheck(aIndex,aDelay:integer):Boolean;
    function DoorResponseCheck(aIndex,aDelay:integer):Boolean;
    function DoorArmDsCheck(aDelay:Boolean=True):Boolean;
    function DoorArmDsCheckSetting(aDelay:Boolean=True):Boolean;
    function DoorDeadBoltDSCHECKTIMECheck(aDelay:Boolean=True):Boolean;
    function DoorDeadBoltDSCHECKTIMESetting(aDelay:Boolean=True):Boolean;
    function DoorDeadBoltDSCHECKUSECheck(aDelay:Boolean=True):Boolean;
    function DoorDeadBoltDSCHECKUSESetting(aDelay:Boolean=True):Boolean;
    function DoorHolidaySetting(aDelay:Boolean=True):Boolean;
    function DoorHolidayClearSetting(aDelay:Boolean=True):Boolean;
    function DoorHolidayDateSetting(aDelay:Boolean=True):Boolean;
    function DoorHolidayMonthSetting(aMonth:integer;aDelay:Boolean=True):Boolean;
    function DoorInformationSetting(aDelay:Boolean=True):Boolean;
    function DoorScheduleDataSetting(aDelay:Boolean=True):Boolean;
    function DoorScheduleDayCodeSetting(aIndex:integer;aDelay:Boolean=True):Boolean;
    function DoorSettingInformationCheck(aDelay:Boolean=True):Boolean;

    function GetDoorControlTimeSendFormat:string;
    function GetDoorLockTypeSendFormat:string;
    function GetDoorLongOpenTimeSendFormat:string;

    procedure SendPacket(aCmd:Char;aMsgNo:char;aDeviceVer, aData: String;aPriority:integer=0);
  private
    L_cDoorRCVSTATE: Array [0..MAXDOORRCVCOUNT] of char;     //설정정보 수신상태
    L_bDoorResponse: Array [0..100] of Boolean;              //기기 설정 정보 응답 여부
    L_bDoorHolidayResponse: Array [0..12] of Boolean;              //특정일 응답여부
    L_bDoorScheduleResponse: Array [0..10] of Boolean;              //특정일 응답여부
    L_ArrDoorScheduleData: Array [0..10] of string;              //특정일 응답여부
    L_ArrHoliday : Array [0..12] of string;       //특정일 등록
    HolidayRegList : TStringList;
    HolidayDelList : TStringList;
    FDoorUse: Boolean;
    FDoorNo: integer;
    FDevice: TDevice;
    FREMOTEDISARMDOOROPEN: string;
    FDOORTYPE: string;
    FARMAREANO: integer;
    FLOCKTYPE: integer;
    FDeadBoltDSCHECKUSE: string;
    FARMDSCHECK: string;
    FFIREDOOROPEN: string;
    FDOORNAME: string;
    FSCHEDULEUSE: string;
    FDOORMODE: string;
    FDOORSTATE: string;
    FDeadBoltDSCHECKTIME: string;
    FLONGOPENTIME: string;
    FCARDMODE: string;
    FLONGOPENALARM: string;
    FDSOPENSTATE: string;
    FCONTROLTIME: string;
    FDeadBoltDSCHECKUSERCV: string;
    FARMDSCHECKRCV: string;
    FDeadBoltDSCHECKTIMERCV: string;
    FDOORSETTINTINFORCV: string;
    FReciveStateChange: Boolean;
    FOnReceiveTypeChage: TReceiveTypeChange;
    FLOCKSTATE: string;
    FInfoInitialize: Boolean;
    FDoorCurrentDSState: string;
    FDoorCurrentLSState: string;
    FDoorCurrentFireEvent: string;
    FDoorCurrentLongTimeEvent: string;
    FCurrentDoorStateCheckRCV: Boolean;
    FCurrentDoorStateChange: Boolean;
    FonCurrentDoorState: TDoorStatePacket;
    FOnDoorPacketChange: TDoorPacket;
    FDOORVIEW: string;
    FHolidayRCV: string;
    FDOORSCHEDULEDATARCV: string;
    FTimeCodeUse: string;
    FAntiPassNo: integer;
    FAntiGroupCode: string;
    FOnDoorHolidaySend: TDoorPacket;
    FOnDoorLongTimeOpenEvent: TDoorPacket;
    FDoorLongTimeOpenState: string;
    procedure SetARMAREANO(const Value: integer);
    procedure SetCARDMODE(const Value: string);
    procedure SetCONTROLTIME(const Value: string);
    procedure SetDOORMODE(const Value: string);
    procedure SetDOORNAME(const Value: string);
    procedure SetDOORSTATE(const Value: string);
    procedure SetDOORTYPE(const Value: string);
    procedure SetDoorUse(const Value: Boolean);
    procedure SetDSOPENSTATE(const Value: string);
    procedure SetFIREDOOROPEN(const Value: string);
    procedure SetLOCKSTATE(const Value: string);
    procedure SetLOCKTYPE(const Value: integer);
    procedure SetLONGOPENALARM(const Value: string);
    procedure SetLONGOPENTIME(const Value: string);
    procedure SetReciveStateChange(const Value: Boolean);
    procedure SetREMOTEDISARMDOOROPEN(const Value: string);
    procedure SetSCHEDULEUSE(const Value: string);

    procedure SetARMDSCHECKRCV(const Value: string);
    procedure SetDOORSETTINTINFORCV(const Value: string);
    procedure SetDeadBoltDSCHECKTIMERCV(const Value: string);
    procedure SetDeadBoltDSCHECKUSERCV(const Value: string);
    procedure SetARMDSCHECK(const Value: string);
    procedure SetDeadBoltDSCHECKTIME(const Value: string);
    procedure SetDeadBoltDSCHECKUSE(const Value: string);
    procedure SetDoorCurrentDSState(const Value: string);
    procedure SetDoorCurrentLSState(const Value: string);
    procedure SetDoorCurrentFireEvent(const Value: string);
    procedure SetCurrentDoorStateCheckRCV(const Value: Boolean);
    procedure SetDOORVIEW(const Value: string);
    procedure SetHolidayRCV(const Value: string);
    procedure SetDOORSCHEDULEDATARCV(const Value: string);
    procedure SetTimeCodeUse(const Value: string);
    procedure SetAntiPassNo(const Value: integer);
    procedure SetAntiGroupCode(const Value: string);
    procedure SetDoorLongTimeOpenState(const Value: string);
    { Private declarations }
  published
    property Device : TDevice read FDevice write FDevice;
    property DoorNo : integer read FDoorNo write FDoorNo;
    property DoorUse : Boolean read FDoorUse write SetDoorUse; //출입문사용유무
    property DOORNAME : string read FDOORNAME write SetDOORNAME;
    //설정값
    property ARMAREANO : integer read FARMAREANO write SetARMAREANO;                               //방범구역번호
    property ARMDSCHECK : string read FARMDSCHECK write SetARMDSCHECK;                             //경계시 DS 체크
    property CONTROLTIME : string read FCONTROLTIME write SetCONTROLTIME;                          //잠김시간
    property DeadBoltDSCHECKUSE : string read FDeadBoltDSCHECKUSE write SetDeadBoltDSCHECKUSE;     //데드볼트 DS체크 사용유무
    property DeadBoltDSCHECKTIME : string read FDeadBoltDSCHECKTIME write SetDeadBoltDSCHECKTIME;  //데드볼트 DS체크 사용시간
    property DOORTYPE : string read FDOORTYPE write SetDOORTYPE;                                   //출입문 시스템 상태,'0'.방범전용,'1'.출입전용,'2'.'방범+출입';
    property DOORSTATE : string read FDOORSTATE write SetDOORSTATE;                                //출입문상태전송 '0'.해당없음,'1'.출입문상태,'2'.락상태
    property DOORVIEW : string read FDOORVIEW write SetDOORVIEW;                                    //출입문 모니터링 표시 유무
    property DSOPENSTATE : string read FDSOPENSTATE write SetDSOPENSTATE;                          //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
    property FIREDOOROPEN : string read FFIREDOOROPEN write SetFIREDOOROPEN;                       //화재시 문열림 '0'.사용안함,'1'.사용
    property LOCKSTATE : string read FLOCKSTATE write SetLOCKSTATE;                                //LS상태(사용안함)
    property LOCKTYPE : integer read FLOCKTYPE write SetLOCKTYPE;                                  //전기정 타입
    property LONGOPENTIME : string read FLONGOPENTIME write SetLONGOPENTIME;                       //장시간열림시간
    property LONGOPENALARM : string read FLONGOPENALARM write SetLONGOPENALARM;                    //장시간열림시 알람발생유무
    property REMOTEDISARMDOOROPEN : string read FREMOTEDISARMDOOROPEN write SetREMOTEDISARMDOOROPEN;  //원격해제시 출입문 열림
    property SCHEDULEUSE : string read FSCHEDULEUSE write SetSCHEDULEUSE;                          //스케줄 적용유무
    property TimeCodeUse : string read FTimeCodeUse write SetTimeCodeUse;
    property AntiPassNo : integer read FAntiPassNo write SetAntiPassNo;
    property AntiGroupCode : string read FAntiGroupCode write SetAntiGroupCode;
  published
    //출입문 상태값
    property CARDMODE : string read FCARDMODE write SetCARDMODE;                                     //카드모드'0'.Posi,'1'.Nega
    property DOORMODE : string read FDOORMODE write SetDOORMODE;                                     //출입문운영모드 '0'.운영,'1'.개방,'2'.폐쇄,'3'.마스터
    property DoorCurrentDSState : string read FDoorCurrentDSState write SetDoorCurrentDSState;       //현재 출입문 열림(O),닫힘(C),'T'장시간열림 상태
    property DoorCurrentLSState : string read FDoorCurrentLSState write SetDoorCurrentLSState;       //현재 출입문 잠김/열림 상태 - 미사용
    property DoorCurrentFireEvent : string read FDoorCurrentFireEvent write SetDoorCurrentFireEvent; //출입문화재발생 상태 '0'.정상,'1'.복구
    property DoorLongTimeOpenState : string read FDoorLongTimeOpenState write SetDoorLongTimeOpenState;  //장시간 출입문 열림상태코드

    property CurrentDoorStateChange : Boolean read FCurrentDoorStateChange write FCurrentDoorStateChange; // 현재 출입문 상태가 변경 되는 경우 나중에 이벤트 발생 시키자.
    property CurrentDoorStateCheckRCV :Boolean read FCurrentDoorStateCheckRCV write SetCurrentDoorStateCheckRCV;  //
  published
    property InfoInitialize : Boolean Read FInfoInitialize write FInfoInitialize;
    //수신여부
    property DOORSETTINTINFORCV : string read FDOORSETTINTINFORCV write SetDOORSETTINTINFORCV;
    property DeadBoltDSCHECKUSERCV : string read FDeadBoltDSCHECKUSERCV write SetDeadBoltDSCHECKUSERCV;
    property DeadBoltDSCHECKTIMERCV : string read FDeadBoltDSCHECKTIMERCV write SetDeadBoltDSCHECKTIMERCV;
    property ARMDSCHECKRCV : string read FARMDSCHECKRCV write SetARMDSCHECKRCV;
    property HolidayRCV : string read FHolidayRCV write SetHolidayRCV;
    property DOORSCHEDULEDATARCV : string read FDOORSCHEDULEDATARCV write SetDOORSCHEDULEDATARCV;
  published
    //이벤트 발생
    property onCurrentDoorState : TDoorStatePacket read FonCurrentDoorState write FonCurrentDoorState;
    property OnDoorPacketChange : TDoorPacket read FOnDoorPacketChange write FOnDoorPacketChange;
    property OnDoorHolidaySend : TDoorPacket read FOnDoorHolidaySend write FOnDoorHolidaySend;
    property OnDoorLongTimeOpenEvent : TDoorPacket read FOnDoorLongTimeOpenEvent write FOnDoorLongTimeOpenEvent;

    property OnReceiveTypeChage : TReceiveTypeChange read FOnReceiveTypeChage write FOnReceiveTypeChage;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoorReciveCheck;
    property ReciveStateChange : Boolean read FReciveStateChange write SetReciveStateChange; //수신 상태 변경 여부
  public
    //장비 수신 처리
    procedure ReceiveDoorArmDsCheck(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDoorControlState(aEcuID,aDeviceVer,aMsgNo,aRealData:string);
    procedure ReceiveDoorDeadBoltDSCheckTime(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDoorDeadBoltDSCheckUse(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
    procedure ReceiveDoorEventState(aEcuID,aDeviceVer,aMsgNo,aRealData:string);
    procedure ReceiveDoorHolidayClear;
    procedure ReceiveDoorHolidayDelete(aEcuID,aDeviceVer,aMsgNo,aRealData:string);
    procedure ReceiveDoorHolidayRegist(aEcuID,aDeviceVer,aMsgNo,aRealData:string);
    procedure ReceiveDoorScheduleRegist(aECUID,aDeviceVer,aMsgNo,aRealData:string);
    procedure ReceiveDoorSettingInformtion(aECUID,aDeviceVer:string;aMsgNo:char;aRealData:string);
  public
    //
    function DeviceDoorStateCheck(aDelay: Boolean=True):Boolean;
    procedure CurrentDoorStateChangeAction;  //현재 상태 이벤트 발생 시키자.
    procedure HolidayClear;
    function SetHoliday(aDay,aValue:string):Boolean; //공휴일 설정
    function SetDoorScheduleData(aValue:string):Boolean; //스케줄데이터
    procedure ErrorDoorArmDsCheck; //출입문 경계시 Ds 체크 기능 전문 없음
  end;

  TdmDeviceDoor = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDeviceDoor: TdmDeviceDoor;

implementation

uses
  uCommonFunction,
  uCommonVariable;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDeviceDoor }

function TDeviceDoor.ControlTimechar2DecType(aControlTime: char): string;
var
   nDoorControlTime : integer;
   nOrd : integer;
   nMsec : integer;
begin
  if aControlTime >= #$30 then
  begin
   if aControlTime < #$40 then  result := aControlTime
   else
   begin
      if (aControlTime >= 'A') and (aControlTime <= 'Z') then  nDoorControlTime := Ord(aControlTime) - Ord('A')
      else nDoorControlTime := Ord(aControlTime) - Ord('a') + 26;
      nDoorControlTime := nDoorControlTime * 5;
      result := inttostr( 10 + nDoorControlTime );
   end;
  end else
  begin
    nOrd := Ord(aControlTime);
    nMsec := (nOrd - $20) * 100;
    result := inttostr(nMsec) + 'ms';
  end;
end;

constructor TDeviceDoor.Create(AOwner: TComponent);
var
  i : integer;
begin
  inherited;
  HolidayRegList := TStringList.create;
  HolidayDelList := TStringList.create;

  for i := 0 to HIGH(L_cDoorRCVSTATE) do
  begin
    L_cDoorRCVSTATE[i] := 'Y';
  end;
  for i := 0 to HIGH(L_bDoorHolidayResponse) do
  begin
    L_bDoorHolidayResponse[i] := True;
  end;
  DoorUse := False;
  AntiPassNo := 0;
  HolidayClear;
end;

procedure TDeviceDoor.CurrentDoorStateChangeAction;
begin
  if Not CurrentDoorStateChange then Exit;
  CurrentDoorStateChange := False;
  if Assigned(FonCurrentDoorState) then
  begin
    onCurrentDoorState(Self,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),CardMode,DoorMode,DoorCurrentDSState,DoorCurrentLSState,DoorCurrentFireEvent);
  end;
end;

destructor TDeviceDoor.Destroy;
begin
  HolidayRegList.free;
  HolidayDelList.free;
  inherited;
end;

function TDeviceDoor.DeviceDoorStateCheck(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Try
    L_bDoorResponse[con_DOORCONTROLSTATECHECK] := False;
    stData := 'C'+                          //  Msg Code
         '0' +                              //  Msg Count
         inttostr(DoorNo) +                 //  기기내 Door No
         #$30+                              //  RecordCount(고정)
         #$30+                              //  RecordCount(상태조회)
         #$30;                              //  의미없음

    SendPacket('c',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
    if aDelay then
      result := DoorResponseCheck(con_DOORCONTROLSTATECHECK,con_DelayTime);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceDoorStateCheck');
  End;

end;

function TDeviceDoor.DoorArmDsCheck(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  L_bDoorResponse[con_DoorCmdARMDSCHECK] := False;
  stData := 'DL01' +
            FillZeroNumber(DoorNo,2);
  SendPacket('Q',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorResponseCheck(con_DoorCmdARMDSCHECK,con_DelayTime);
end;

function TDeviceDoor.DoorArmDsCheckSetting(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  if (LOCKTYPE <> 2) and (LOCKTYPE <> 3) then
  begin
    ARMDSCHECK := '0'; //데드볼트락이 아니면 경계시 DS 체크는 무조건 사용안함이다.
  end;
  if ARMDSCHECK = '' then ARMDSCHECK := '0';

  L_bDoorResponse[con_DoorCmdARMDSCHECK] := False;
  stData := 'DL01' +
            FillZeroNumber(DoorNo,2) +
            ARMDSCHECK[1];

  SendPacket('I',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorResponseCheck(con_DoorCmdARMDSCHECK,con_DelayTime);

end;

function TDeviceDoor.DoorDeadBoltDSCHECKTIMECheck(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  L_bDoorResponse[con_DoorCmdDeadBoltDSCHECKTIME] := False;
  stData := 'DL02' +
            FillZeroNumber(DoorNo,2);
  SendPacket('Q',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorResponseCheck(con_DoorCmdDeadBoltDSCHECKTIME,con_DelayTime);
end;

function TDeviceDoor.DoorDeadBoltDSCHECKTIMESetting(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  if Not isDigit(DeadBoltDSCHECKTIME) then DeadBoltDSCHECKTIME := '1'; //1초를 디폴트로 하자.

  L_bDoorResponse[con_DoorCmdDeadBoltDSCHECKTIME] := False;
  stData := 'DL02' +
            FillZeroNumber(DoorNo,2)+
            FillZeroNumber(strtoint(DeadBoltDSCHECKTIME),2) + '0';
  SendPacket('I',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorResponseCheck(con_DoorCmdDeadBoltDSCHECKTIME,con_DelayTime);
end;

function TDeviceDoor.DoorDeadBoltDSCHECKUSECheck(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  L_bDoorResponse[con_DoorCmdDeadBoltDSCHECKUSE] := False;
  stData := 'DL00' +
            FillZeroNumber(DoorNo,2);
  SendPacket('Q',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorResponseCheck(con_DoorCmdDeadBoltDSCHECKUSE,con_DelayTime);
end;

function TDeviceDoor.DoorDeadBoltDSCHECKUSESetting(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  if DeadBoltDSCHECKUSE = '' then DeadBoltDSCHECKUSE := '1'; //사용을 디폴트로 하자

  L_bDoorResponse[con_DoorCmdDeadBoltDSCHECKUSE] := False;
  stData := 'DL00' +
            FillZeroNumber(DoorNo,2) +
            DeadBoltDSCHECKUSE[1];
  SendPacket('I',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorResponseCheck(con_DoorCmdDeadBoltDSCHECKUSE,con_DelayTime);
end;

function TDeviceDoor.DoorHolidayClearSetting(aDelay: Boolean): Boolean;
var
  stData : string;
begin
  stData := 'Q' + //조회'R'
            '0' + //정상 0 에러 1
            inttostr(DoorNo) + //0:전체,1:1번문,2:2번문
            ' ' + //스페이스
            'W' + //A:추가,D삭제,W:전체삭제
            '0000' + //MMDD
            '3';  //'3' : 특정일

  L_bDoorHolidayResponse[0] := False; //삭제 전송
  SendPacket('c',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorHoliDayResponseCheck(0,con_DelayTime);

end;

function TDeviceDoor.DoorHolidayDateSetting(aDelay: Boolean): Boolean;
var
  stData : string;
  i : integer;
  bResult : Boolean;
begin

  for i := HolidayDelList.Count - 1 downto 0 do
  begin
    if G_bApplicationTerminate then Exit;
    stData := 'Q' + //조회'R'
              '0' + //정상 0 에러 1
              inttostr(DoorNo) + //0:전체,1:1번문,2:2번문
              ' ' + //스페이스
              'D' + //A:추가,D삭제,W:전체삭제
              HolidayDelList.Strings[i] + //MMDD
              '3';  //'3' : 특정일
    L_bDoorResponse[con_DoorCmdHOLIDAY] := False;
    SendPacket('c',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
    if aDelay then
    begin
      bResult := DoorResponseCheck(con_DoorCmdHOLIDAY,con_DelayTime);
      if bResult then
      begin
        if Assigned(FOnDoorHolidaySend) then
        begin
          OnDoorHolidaySend(Self,con_DoorCmdHOLIDAY,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),HolidayDelList.Strings[i] + '0');
        end;
        HolidayDelList.Delete(i);
      end;
    end;


  end;
  for i := HolidayRegList.Count - 1 downto 0 do
  begin
    if G_bApplicationTerminate then Exit;
    stData := 'Q' + //조회'R'
              '0' + //정상 0 에러 1
              inttostr(DoorNo) + //0:전체,1:1번문,2:2번문
              ' ' + //스페이스
              'A' + //A:추가,D삭제,W:전체삭제
              HolidayRegList.Strings[i] + //MMDD
              '3';  //'3' : 특정일
    L_bDoorResponse[con_DoorCmdHOLIDAY] := False;
    SendPacket('c',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
    if aDelay then
    begin
      bResult := DoorResponseCheck(con_DoorCmdHOLIDAY,con_DelayTime);
      if bResult then
      begin
        if Assigned(FOnDoorHolidaySend) then
        begin
          OnDoorHolidaySend(Self,con_DoorCmdHOLIDAY,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),HolidayRegList.Strings[i] + '1');
        end;
        HolidayRegList.Delete(i);
      end;
    end;
  end;
  result := bResult;

end;

function TDeviceDoor.DoorHolidayMonthSetting(aMonth: integer;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  stData := 'Q' + //조회'R'
            '0' + //정상 0 에러 1
            inttostr(DoorNo) + //0:전체,1:1번문,2:2번문
            ' ' + //스페이스
            'A' + //A:추가,D삭제,W:전체삭제
            FillZeroNumber(aMonth,2) + //MM dd
            copy(L_ArrHoliday[aMonth],1,31)
            ;  //'3' : 특정일

  L_bDoorHolidayResponse[aMonth] := False; //삭제 전송
  SendPacket('c',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorHoliDayResponseCheck(aMonth,con_DelayTime);

end;

function TDeviceDoor.DoorHoliDayResponseCheck(aIndex, aDelay: integer): Boolean;
var
  FirstTickCount : double;
begin
  FirstTickCount := GetTickCount + aDelay;
  While Not L_bDoorHolidayResponse[aIndex] do
  begin
    if G_bApplicationTerminate then Exit;
    sleep(1);
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
  result := L_bDoorHolidayResponse[aIndex];
end;

function TDeviceDoor.DoorHolidaySetting(aDelay: Boolean): Boolean;
var
  i : integer;
begin
  if G_bApplicationTerminate then Exit;
  result := False;
  (*
  DoorHolidayDateSetting(aDelay);
  if (HolidayDelList.Count = 0) and (HolidayRegList.Count = 0) then
  begin
    HolidayRCV := 'Y';
    result := True;
  end;
  *)

  //if DoorHolidayClearSetting(aDelay) then  //전체 삭제 성공 후
  begin
    for i := 1 to 12 do
    begin
      if Not DoorHolidayMonthSetting(i) then Exit;
    end;
    if HolidayRCV = 'S' then
       HolidayRCV := 'Y';
    result := True;
  end;

end;

procedure TDeviceDoor.DoorInformationCheck(aInformationType: integer);
begin
  case aInformationType of
    con_DoorCmdSettingInfo : begin
      DOORSETTINTINFORCV :='R';
      DoorSettingInformationCheck;
      if DOORSETTINTINFORCV = 'R' then DOORSETTINTINFORCV := 'N';
    end;
    con_DoorCmdDeadBoltDSCHECKUSE : begin
      DeadBoltDSCHECKUSERCV :='R';
      DoorDeadBoltDSCHECKUSECheck;
      if DeadBoltDSCHECKUSERCV = 'R' then DeadBoltDSCHECKUSERCV := 'Y'; //기능이 없는것도 있음
    end;
    con_DoorCmdDeadBoltDSCHECKTIME : begin
      DeadBoltDSCHECKTIMERCV :='R';
      DoorDeadBoltDSCHECKTIMECheck;
      if DeadBoltDSCHECKTIMERCV = 'R' then DeadBoltDSCHECKTIMERCV := 'Y';
    end;
    con_DoorCmdARMDSCHECK : begin
      ARMDSCHECKRCV :='R';
      DoorArmDsCheck;
      if ARMDSCHECKRCV = 'R' then ARMDSCHECKRCV := 'Y';
    end;
    con_DoorCmdHOLIDAY : begin
      HolidayRCV := 'Y'; //공휴일 조회는 하지 말자.
    end;
  end;
end;

procedure TDeviceDoor.DoorInformationSend(aInformationType: integer);
begin
  if G_bApplicationTerminate then Exit;
  case aInformationType of
    con_DoorCmdSettingInfo : begin
      DOORSETTINTINFORCV :='S';
      DoorInformationSetting;
      if DOORSETTINTINFORCV = 'S' then DOORSETTINTINFORCV := 'U';
    end;
    con_DoorCmdDeadBoltDSCHECKUSE : begin
      DeadBoltDSCHECKUSERCV :='S';
      DoorDeadBoltDSCHECKUSESetting;
      if DeadBoltDSCHECKUSERCV = 'S' then DeadBoltDSCHECKUSERCV := 'U';
    end;
    con_DoorCmdDeadBoltDSCHECKTIME : begin
      DeadBoltDSCHECKTIMERCV :='S';
      DoorDeadBoltDSCHECKTIMESetting;
      if DeadBoltDSCHECKTIMERCV = 'S' then DeadBoltDSCHECKTIMERCV := 'U';
    end;
    con_DoorCmdARMDSCHECK : begin
      ARMDSCHECKRCV :='S';
      DoorArmDsCheckSetting;
      if ARMDSCHECKRCV = 'S' then ARMDSCHECKRCV := 'U';
    end;
    con_DoorCmdHOLIDAY : begin
      if (Device.DEVICECODE <> '') and Not Device.DeviceScheduleSkill then //스케줄 기능이 없으면 전송하지 말자.
      begin
        HolidayRCV := 'Y';
      end else
      begin
        HolidayRCV := 'S';
        DoorHolidaySetting;
        if HolidayRCV = 'S' then HolidayRCV := 'U';
      end;
    end;
    con_DoorCmdSCHEDULEDATA : begin
      if (Device.DEVICECODE <> '') and Not Device.DeviceScheduleSkill then //스케줄 기능이 없으면 전송하지 말자.
      begin
        DOORSCHEDULEDATARCV := 'Y';
      end else
      begin
        DOORSCHEDULEDATARCV := 'S';
        DoorScheduleDataSetting;
        if DOORSCHEDULEDATARCV = 'S' then DOORSCHEDULEDATARCV := 'U';
      end;
    end;
  end;
end;

function TDeviceDoor.DoorInformationSetting(aDelay: Boolean): Boolean;
var
  stDoorControlTime:string;
  stDoorLockType : string;
  stDoorLongOpenTime:string;
  stData : string;
begin
  stDoorControlTime := GetDoorControlTimeSendFormat;
  stDoorLockType := GetDoorLockTypeSendFormat;
  stDoorLongOpenTime := GetDoorLongOpenTimeSendFormat;

  if CARDMODE = '' then CARDMODE := '0';
  if DOORMODE = '' then DOORMODE := '0';
  if SCHEDULEUSE = '' then SCHEDULEUSE := '0';
  if SCHEDULEUSE = '9' then SCHEDULEUSE := '0';  //DB 디폴트 값이면
  if LONGOPENALARM = '' then LONGOPENALARM := '0';
  if FIREDOOROPEN = '' then FIREDOOROPEN := '0';
  if FIREDOOROPEN = '9' then FIREDOOROPEN := '0';
  if DSOPENSTATE = '' then DSOPENSTATE := '1';
  if DSOPENSTATE = '9' then DSOPENSTATE := '1';
  if REMOTEDISARMDOOROPEN = '' then REMOTEDISARMDOOROPEN := '0';
  if REMOTEDISARMDOOROPEN = '9' then REMOTEDISARMDOOROPEN := '0';

  L_bDoorResponse[con_DoorCmdSettingInfo] := False;
  stData := 'G' + '0' +                             //MSG Code  A:등록,B:조회,G:모드 변경 없이 등록   A->G로 변경
            inttostr(DoorNo) +               //문번호
            #$20 + #$20 +
            CARDMODE[1] +
            DOORMODE[1] +
            stDoorControlTime[1] +
            stDoorLongOpenTime[1] +
            SCHEDULEUSE[1] +
            '1' +      //출입문상태전송은 무조건 출입문상태
            '0' +      //통신이상시 기기운영(사용안함:고정)
            inttostr(AntiPassNo) + //'0' +      //AntiPassBack(사용안함:고정)
            LONGOPENALARM[1] +
            '0' +      //통신 이상시 부저 출력 (사용안함:고정)
            stDoorLockType[1] +
            FIREDOOROPEN[1] +
            '0' +
            DSOPENSTATE[1] +  //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
            REMOTEDISARMDOOROPEN[1]  +   //원격해제시 문열림
            '00000'                      //조회는 전체를 '0'으로 마킹
            ;
  SendPacket('c',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorResponseCheck(con_DoorCmdSettingInfo,con_DelayTime);
end;

procedure TDeviceDoor.DoorReciveCheck;
var
  i : integer;
  bReciveStateCheck : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  Try
    if TDevice(Device).MaxDoorCount < DoorNo then
    begin
      ReciveStateChange := False; //컨트롤러의 최대 출입문 번호를 넘어간 출입문에 대해서는 검사하지 말자.
      Exit;
    end;

    for i := 0 to HIGH(L_cDoorRCVSTATE) do
    begin
      if (L_cDoorRCVSTATE[i] = 'U') or (L_cDoorRCVSTATE[i] = 'S') then  //변경된 건이 있으면 송신 하자....
      begin
        //L_cDoorRCVSTATE[i] := 'N'; //변경된 건이 있으면 수신만 하자...
        DoorInformationSend(i);
        Exit;
      end;
    end;
    for i := 0 to HIGH(L_cDoorRCVSTATE) do
    begin
      if L_cDoorRCVSTATE[i] = 'N' then  //상태를 수신할 건이 있으면 수신 체크 하자....
      begin
        DoorInformationCheck(i);
        Exit;
      end;
    end;

    //여기서는 수신상태 체크 하는 곳 ==> 수신이 안되면 여기서 멈춤 현상 발생
    bReciveStateCheck := False;
    for i := 0 to HIGH(L_cDoorRCVSTATE) do
    begin
      if L_cDoorRCVSTATE[i] <> 'Y' then
      begin
        bReciveStateCheck := True;
        break;
      end;
    end;
    ReciveStateChange := bReciveStateCheck;  //전체 송신 했으면 False로 하자
  Finally
    //RcvCheckTimer.Enabled := ReciveStateChange;  //수신상태를 변경 하면서 수행 됨
  End;
end;

function TDeviceDoor.DoorResponseCheck(aIndex, aDelay: integer): Boolean;
var
  FirstTickCount : double;
begin
  if G_bApplicationTerminate then Exit;
  FirstTickCount := GetTickCount + aDelay;
  While Not L_bDoorResponse[aIndex] do
  begin
    if G_bApplicationTerminate then Exit;

    sleep(1);
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
  result := L_bDoorResponse[aIndex];
end;

function TDeviceDoor.DoorScheduleDataSetting(aDelay: Boolean): Boolean;
var
  i : integer;
begin
  result := False;
  for i := Low(L_ArrDoorScheduleData) to High(L_ArrDoorScheduleData) do
  begin
    if Not DoorScheduleDayCodeSetting(i) then Exit;
  end;
  if DOORSCHEDULEDATARCV = 'S' then DOORSCHEDULEDATARCV := 'Y';
  result := True;

end;

function TDeviceDoor.DoorScheduleDayCodeSetting(aIndex: integer;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  result := True;
  stData := L_ArrDoorScheduleData[aIndex];
  if stData = '' then Exit;

  stData := 'S' + //스케줄
            '0' + //정상 0 에러 1
            inttostr(DoorNo) + //0:전체,1:1번문,2:2번문
            ' ' + //스페이스
            stData;

  L_bDoorScheduleResponse[aIndex] := False; //
  SendPacket('c',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorScheduleResponseCheck(aIndex,con_DelayTime);
end;

function TDeviceDoor.DoorScheduleResponseCheck(aIndex,
  aDelay: integer): Boolean;
var
  FirstTickCount : double;
begin
  FirstTickCount := GetTickCount + aDelay;
  While Not L_bDoorScheduleResponse[aIndex] do
  begin
    if G_bApplicationTerminate then Exit;
    sleep(1);
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
  result := L_bDoorScheduleResponse[aIndex];
end;

function TDeviceDoor.DoorSettingInformationCheck(aDelay:Boolean):Boolean;
var
  stData : string;
begin
  L_bDoorResponse[con_DoorCmdSettingInfo] := False;
  stData := 'B' + '0' +                             //MSG Code
            inttostr(DoorNo) +               //문번호
            #$20 + #$20 + '00000000000000000000';          //조회는 전체를 '0'으로 마킹
  SendPacket('c',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := DoorResponseCheck(con_DoorCmdSettingInfo,con_DelayTime);

end;

procedure TDeviceDoor.ErrorDoorArmDsCheck;
begin
  L_bDoorResponse[con_DoorCmdARMDSCHECK] := True;
  ARMDSCHECKRCV := 'Y';
end;

function TDeviceDoor.GetDoorControlTimeSendFormat: string;
var
  nOrdUDiff : integer;
  nDoorTime : integer;
  nOrd : integer;
  stMSEC : string;
  nMSec : integer;
begin
  result := '3';
  if isDigit(CONTROLTIME) then
  begin
    if strtoint(CONTROLTIME) < 10 then
    begin
       result := Trim(CONTROLTIME);
    end else
    begin
      nOrdUDiff := 26;
      nDoorTime := strtoint(CONTROLTIME) - 10;
      nDoorTime := nDoorTime div 5;
      if nDoorTime < nOrdUDiff then  nOrd := Ord('A') + nDoorTime
      else nOrd := Ord('a') + nDoorTime - nOrdUDiff;
      if nOrd > Ord('z') then nOrd := Ord('z');
      result := Char(nOrd);
    end;
  end else
  begin
    stMSEC := copy(CONTROLTIME,1,3);
    if Not isDigit(stMSEC) then  Exit;
    nMSec := strtoint(stMsec) div 100;
    if nMSec < 1 then Exit;
    if nMSec > 9 then Exit;
    nOrd := $20 + nMSec; //21~29 까지 MSEC;
    result := Char(nOrd);
  end;
end;

function TDeviceDoor.GetDoorLockTypeSendFormat: string;
var
  nLockType : integer;
begin
  result := '1';
  if LOCKTYPE = 9 then LOCKTYPE := 1; //DB Default
  nLockType := ord('0') + LOCKTYPE;
  result := char(nLockType);
end;

function TDeviceDoor.GetDoorLongOpenTimeSendFormat: string;
begin
  if isDigit(LONGOPENTIME) then result := char($30 + strtoint(LONGOPENTIME))
  else result := '0';
end;

procedure TDeviceDoor.HolidayClear;
var
  stTemp : string;
  i : integer;
begin
  stTemp := '';
  for i := 0 to 31 do
  begin
    stTemp := stTemp + '0';
  end;
  for i := 0 to High(L_ArrHoliday) do
  begin
    L_ArrHoliday[i] := stTemp;
  end;
end;

procedure TDeviceDoor.ReceiveDoorArmDsCheck(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin
  L_bDoorResponse[con_DoorCmdARMDSCHECK] := True;
  ARMDSCHECKRCV := 'Y';
  Delete(aRealData,1,4);
  Delete(aRealData,1,2); //출입문번호
  ARMDSCHECK := aRealData[1];
end;

procedure TDeviceDoor.ReceiveDoorControlState(aEcuID, aDeviceVer, aMsgNo,
  aRealData: string);
begin
  L_bDoorResponse[con_DOORCONTROLSTATECHECK] := True;
  CurrentDoorStateCheckRCV := True;
  CardMode:= aRealData[6];    //Posi/Nega
  DoorMode:=  aRealData[7];    //운영/개방
  DoorCurrentDSState:= aRealData[8];    //문상태
  DoorCurrentLSState := '';
  CurrentDoorStateChangeAction;
end;

procedure TDeviceDoor.ReceiveDoorDeadBoltDSCheckTime(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin
  L_bDoorResponse[con_DoorCmdDeadBoltDSCHECKTIME] := True;
  DeadBoltDSCHECKTIMERCV := 'Y';
  Delete(aRealData,1,4);
  Delete(aRealData,1,2); //출입문번호
  DeadBoltDSCHECKTIME := copy(aRealData,1,2);
end;

procedure TDeviceDoor.ReceiveDoorDeadBoltDSCheckUse(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin
  L_bDoorResponse[con_DoorCmdDeadBoltDSCHECKUSE] := True;
  DeadBoltDSCHECKUSERCV := 'Y';
  Delete(aRealData,1,4);
  Delete(aRealData,1,2); //출입문번호
  DeadBoltDSCHECKUSE := aRealData[1];
end;

procedure TDeviceDoor.ReceiveDoorEventState(aEcuID, aDeviceVer, aMsgNo,
  aRealData: string);
var
  stReaderNo : string;
  stInOut : string;
  stTime : string;
  stChangeState : string;
  stAccessResult : string;
begin
  CurrentDoorStateCheckRCV := True;
  CardMode:= aRealData[18];    //Posi/Nega
  DoorMode:=  aRealData[19];    //운영/개방
  DoorCurrentDSState:= aRealData[22];    //문상태
  stChangeState := aRealData[20];       //'F' 화재
  if UpperCase(stChangeState) = 'F' then   //서버에서 화재 발생시 처리 하기 위한 부분
  begin
    Device.FireEvent := True;
    DoorCurrentFireEvent := '1';
  end;

  DoorCurrentLSState := '';

  CurrentDoorStateChangeAction;
end;

procedure TDeviceDoor.ReceiveDoorHolidayClear;
begin
  L_bDoorHolidayResponse[0] := True;
end;

procedure TDeviceDoor.ReceiveDoorHolidayDelete(aEcuID, aDeviceVer, aMsgNo,
  aRealData: string);
var
  stMonth : string;
  stDate : string;
  nIndex : integer;
begin
  stDate := copy(aRealData,6,4);

  nIndex := HolidayRegList.IndexOf(stDate);
  if nIndex > -1 then HolidayRegList.Delete(nIndex);
  L_bDoorResponse[con_DoorCmdHOLIDAY] := True;
end;

procedure TDeviceDoor.ReceiveDoorHolidayRegist(aEcuID, aDeviceVer, aMsgNo,
  aRealData: string);
var
  stMonth : string;
  stDate : string;
  nIndex : integer;
begin
  stMonth := copy(aRealData,6,2);
  stDate := copy(aRealData,6,4);
  if Not isDigit(stMonth) then Exit;
  L_bDoorHolidayResponse[strtoint(stMonth)] := True;

  nIndex := HolidayRegList.IndexOf(stDate);
  if nIndex > -1 then HolidayRegList.Delete(nIndex);
  L_bDoorResponse[con_DoorCmdHOLIDAY] := True;
end;

procedure TDeviceDoor.ReceiveDoorScheduleRegist(aECUID, aDeviceVer, aMsgNo,
  aRealData: string);
var
  stDayCode : string;
begin
  stDayCode := aRealData[5];
  if Not isDigit(stDayCode) then Exit;
  L_bDoorScheduleResponse[strtoint(stDayCode)] := True;
end;

procedure TDeviceDoor.ReceiveDoorSettingInformtion(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin
  L_bDoorResponse[con_DoorCmdSettingInfo] := True;
  CARDMODE := aRealData[6];
  DOORMODE := aRealData[7];
  CONTROLTIME := ControlTimechar2DecType(aRealData[8]);
  LONGOPENTIME := inttostr(Ord(aRealData[9]) - $30);
  SCHEDULEUSE := aRealData[10];
  DOORSTATE := aRealData[11];
  if isDigit(aRealData[13]) then AntiPassNo := strtoint(aRealData[13]) //AntiPassNo
  else AntiPassNo := 0;
  LONGOPENALARM := aRealData[14];          //장시간 열림 부저출력
  LOCKTYPE := ord(aRealData[16]) - $30;   //전기정 타입
  FIREDOOROPEN := aRealData[17];          //화재 발생시 문제어
//  DSLSCHECK := aRealData[18];             //DS LS 검사(사용안함:고정)
  DSOPENSTATE := aRealData[19];           //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
  REMOTEDISARMDOOROPEN := aRealData[20];  //원격해제시 (DoorOpen 0x30,DoorClose 0x31)
  DOORSETTINTINFORCV := 'Y';
end;

procedure TDeviceDoor.SendPacket(aCmd, aMsgNo: char; aDeviceVer, aData: String;
  aPriority: integer);
begin
  if Device.DeviceNode <> nil then
     Device.DeviceNode.SendPacket(TDevice(Device).EcuID,aCmd,aMsgNo,aDeviceVer,aData,aPriority);
end;

procedure TDeviceDoor.SetAntiGroupCode(const Value: string);
begin
  FAntiGroupCode := Value;
end;

procedure TDeviceDoor.SetAntiPassNo(const Value: integer);
begin
  if FAntiPassNo = Value then Exit;
  FAntiPassNo := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdAntiNo,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),inttostr(Value));
  end;
end;

procedure TDeviceDoor.SetARMAREANO(const Value: integer);
begin
  if FARMAREANO = Value then Exit;
  FARMAREANO := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdArmArea,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),inttostr(Value));
  end;
end;

procedure TDeviceDoor.SetARMDSCHECK(const Value: string);
begin
  if FARMDSCHECK = Value then Exit;
  FARMDSCHECK := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdARMDSCHECK,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetARMDSCHECKRCV(const Value: string);
begin
  L_cDoorRCVSTATE[con_DoorCmdARMDSCHECK] := Value[1];
  if FARMDSCHECKRCV = Value then Exit;
  ReciveStateChange := True;
  FARMDSCHECKRCV := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,TNode(Device.DeviceNode).NO,'DOOR',TDevice(Device).EcuID,'0',inttostr(DoorNo),con_DoorCmdARMDSCHECK,Value);
  end;
end;

procedure TDeviceDoor.SetDOORSCHEDULEDATARCV(const Value: string);
begin
  L_cDoorRCVSTATE[con_DoorCmdSCHEDULEDATA] := Value[1];
  if FDOORSCHEDULEDATARCV = Value then Exit;
  FDOORSCHEDULEDATARCV := Value;
  ReciveStateChange := True;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,TNode(Device.DeviceNode).NO,'DOOR',TDevice(Device).EcuID,'0',inttostr(DoorNo),con_DoorCmdSCHEDULEDATA,Value);
  end;
end;

procedure TDeviceDoor.SetDOORSETTINTINFORCV(const Value: string);
begin
  L_cDoorRCVSTATE[con_DoorCmdSettingInfo] := Value[1];
  if FDOORSETTINTINFORCV = Value then Exit;
  ReciveStateChange := True;
  FDOORSETTINTINFORCV := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,TNode(Device.DeviceNode).NO,'DOOR',TDevice(Device).EcuID,'0',inttostr(DoorNo),con_DoorCmdSettingInfo,Value);
  end;
end;

procedure TDeviceDoor.SetCARDMODE(const Value: string);
begin
  if FCARDMODE = Value then Exit;
  FCARDMODE := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.

  if (Value = '*') or (Value = '') then CurrentDoorStateCheckRCV := False;

  CurrentDoorStateChange := True;
end;

procedure TDeviceDoor.SetCONTROLTIME(const Value: string);
begin
  if FCONTROLTIME = Value then Exit;
  FCONTROLTIME := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdCONTROLTIME,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;


procedure TDeviceDoor.SetCurrentDoorStateCheckRCV(const Value: Boolean);
var
  i : integer;
begin
//  if FCurrentDoorStateCheckRCV = Value then Exit;

  FCurrentDoorStateCheckRCV := Value;
  if Not Value then
  begin
    Device.CurrentArmDoorStateCheckRCV := 'N';
    Device.DoorStateRCV := False;
  end;
end;

procedure TDeviceDoor.SetDOORMODE(const Value: string);
begin
  if FDOORMODE = Value then Exit;
  FDOORMODE := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if (Value = '*') or (Value = '') then CurrentDoorStateCheckRCV := False;
  CurrentDoorStateChange := True;
end;

procedure TDeviceDoor.SetDOORNAME(const Value: string);
begin
  if FDOORNAME = Value then Exit;
  FDOORNAME := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdName,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

function TDeviceDoor.SetDoorScheduleData(aValue: string): Boolean;
begin
  if isDigit(aValue[1]) then
  begin
    L_ArrDoorScheduleData[strtoint(aValue[1])] := aValue;
  end;
end;

procedure TDeviceDoor.SetDOORSTATE(const Value: string);
begin
  if FDOORSTATE = Value then Exit;
  FDOORSTATE := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDOORPacketChange) then
  begin
    OnDOORPacketChange(Self,con_DOORCmdSTATE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetDOORTYPE(const Value: string);
begin
  if FDOORTYPE = Value then Exit;
  FDOORTYPE := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdType,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetDoorUse(const Value: Boolean);
var
  stDoorUse : string;
begin
  if FDoorUse = Value then Exit;
  FDoorUse := Value;
  if Value then stDoorUse := '1'
  else stDoorUse := '0';
  //if InfoInitialize then Exit; //DB에서 로딩 을 빼고 기기정보에 의해서 사용유무를 설정 하도록 변경
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdUse,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),stDoorUse);
  end;

end;

procedure TDeviceDoor.SetDOORVIEW(const Value: string);
begin
  if FDOORVIEW = Value then Exit;
  FDOORVIEW := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdView,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetDeadBoltDSCHECKTIME(const Value: string);
begin
  if FDeadBoltDSCHECKTIME = Value then Exit;
  FDeadBoltDSCHECKTIME := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdDeadBoltDSCHECKTIME,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetDeadBoltDSCHECKTIMERCV(const Value: string);
begin
  L_cDoorRCVSTATE[con_DoorCmdDeadBoltDSCHECKTIME] := Value[1];
  if FDeadBoltDSCHECKTIMERCV = Value then Exit;
  ReciveStateChange := True;
  FDeadBoltDSCHECKTIMERCV := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,TNode(Device.DeviceNode).NO,'DOOR',TDevice(Device).EcuID,'0',inttostr(DoorNo),con_DoorCmdDeadBoltDSCHECKTIME,Value);
  end;
end;

procedure TDeviceDoor.SetDeadBoltDSCHECKUSE(const Value: string);
begin
  if FDeadBoltDSCHECKUSE = Value then Exit;
  FDeadBoltDSCHECKUSE := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdDeadBoltDSCHECKUSE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetDeadBoltDSCHECKUSERCV(const Value: string);
begin
  L_cDoorRCVSTATE[con_DoorCmdDeadBoltDSCHECKUSE] := Value[1];
  if FDeadBoltDSCHECKUSERCV = Value then Exit;
  ReciveStateChange := True;
  FDeadBoltDSCHECKUSERCV := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,TNode(Device.DeviceNode).NO,'DOOR',TDevice(Device).EcuID,'0',inttostr(DoorNo),con_DoorCmdDeadBoltDSCHECKUSE,Value);
  end;
end;

procedure TDeviceDoor.SetDoorCurrentFireEvent(const Value: string);
begin
  if FDoorCurrentFireEvent = Value then Exit;

(* 20160302 주장치 화재 발생으로 출입문 화재 설정은 문제가 있음 => 출입문이 화재시 문열림 사용유무를 사용하는지 모름
  if FIREDOOROPEN = '0' then
  begin
    FDoorCurrentFireEvent := '0';  //화재시 문열림 사용 안하는 경우 무조건 화재발생 없음
    Exit;
  end;
*)
  FDoorCurrentFireEvent := Value;
  CurrentDoorStateChange := True;
end;

procedure TDeviceDoor.SetDoorCurrentLSState(const Value: string);
begin
  if FDoorCurrentLSState = Value then Exit;

  FDoorCurrentLSState := Value;
  if (Value = '*') or (Value = '') then CurrentDoorStateCheckRCV := False;
  CurrentDoorStateChange := True;
end;

procedure TDeviceDoor.SetDoorLongTimeOpenState(const Value: string);
begin
  if FDoorLongTimeOpenState = Value then Exit;

  FDoorLongTimeOpenState := Value;
  if InfoInitialize then Exit; //DB 읽을때는 이벤트 발생 시키지 말자.

  if Assigned(FOnDoorLongTimeOpenEvent) then
  begin
    OnDoorLongTimeOpenEvent(Self,con_DoorCmdDSOPENSTATE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;

end;

procedure TDeviceDoor.SetDoorCurrentDSState(const Value: string);
begin
  if FDoorCurrentDSState = Value then Exit;
(*  if Value = 'O' then //출입문 열림 이면
  begin
    if (FDoorCurrentDSState = 'T') or (FDoorCurrentDSState = 'D') then Exit; //장시간 열림이 된 상태에서
  end;
*)
//  if (FDoorCurrentDSState <> '') and (Value <> '') then   //처음 기동하여 상태 확인시에는 로그 남기지 말자.
  if Not InfoInitialize and (Value <> '') then   //처음 기동하여 상태 확인시에는 로그 남기지 말자.
  begin
    if Assigned(FOnDoorPacketChange) then
    begin
      OnDoorPacketChange(Self,con_DoorCurrentDSState,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
    end;
  end;

  FDoorCurrentDSState := Value;
  if (Value = '*') or (Value = '') then CurrentDoorStateCheckRCV := False;
  if (Value = 'T') or (Value = 'D') then
  begin
    DoorLongTimeOpenState := G_stLongTimeStateCode;
  end else if Not ((Value = '*') or (Value = '')) then
  begin
    DoorLongTimeOpenState := G_stLongTimeRecoveryCode;
  end;

  CurrentDoorStateChange := True;
end;

procedure TDeviceDoor.SetDSOPENSTATE(const Value: string);
begin
  if FDSOPENSTATE = Value then Exit;
  FDSOPENSTATE := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdDSOPENSTATE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetFIREDOOROPEN(const Value: string);
begin
  if FFIREDOOROPEN = Value then Exit;
  FFIREDOOROPEN := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdFIREDOOROPEN,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

function TDeviceDoor.SetHoliday(aDay, aValue: string): Boolean;
var
  nMonth : integer;
  nDay : integer;
  nIndex : integer;
begin
  result := False;
  if aValue = '' then aValue := '0';
  Try
    nMonth := strtoint(copy(aDay,1,2));
    nDay := strtoint(copy(aDay,3,2));
  Except
    Exit;
  End;

  if aValue = '0' then //삭제가 들어 오면
  begin
    nIndex := HolidayRegList.IndexOf(aDay);
    if nIndex > -1 then HolidayRegList.Delete(nIndex);
    nIndex := HolidayDelList.IndexOf(aDay);
    if nIndex < 0 then HolidayDelList.Add(aDay);
  end else //if aValue = '1' then //추가가 들어 오면
  begin
    nIndex := HolidayDelList.IndexOf(aDay);
    if nIndex > -1 then HolidayDelList.Delete(nIndex);
    nIndex := HolidayRegList.IndexOf(aDay);
    if nIndex < 0 then HolidayRegList.Add(aDay);
  end;

  L_ArrHoliday[nMonth][nDay] := aValue[1];
end;

procedure TDeviceDoor.SetHolidayRCV(const Value: string);
begin
  L_cDoorRCVSTATE[con_DoorCmdHOLIDAY] := Value[1];
  if FHolidayRCV = Value then Exit;
  FHolidayRCV := Value;
  ReciveStateChange := True;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.

  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdHOLIDAY,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetLOCKSTATE(const Value: string);
begin
  if FLOCKSTATE = Value then Exit;
  FLOCKSTATE := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdLOCKSTATE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;

end;

procedure TDeviceDoor.SetLOCKTYPE(const Value: integer);
begin
  if FLOCKTYPE = Value then Exit;
  FLOCKTYPE := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdLOCKTYPE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),inttostr(Value));
  end;
end;

procedure TDeviceDoor.SetLONGOPENALARM(const Value: string);
begin
  if FLONGOPENALARM = Value then Exit;
  FLONGOPENALARM := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdLONGOPENALARM,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetLONGOPENTIME(const Value: string);
begin
  if FLONGOPENTIME = Value then Exit;
  FLONGOPENTIME := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdLONGOPENTIME,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;


procedure TDeviceDoor.SetReciveStateChange(const Value: Boolean);
begin
  if FReciveStateChange = Value then Exit;
  FReciveStateChange := Value;
  if Value then
     TDevice(Device).ReciveStateChange := True;
end;

procedure TDeviceDoor.SetREMOTEDISARMDOOROPEN(const Value: string);
begin
  if FREMOTEDISARMDOOROPEN = Value then Exit;
  FREMOTEDISARMDOOROPEN := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdREMOTEDISARMDOOROPEN,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetSCHEDULEUSE(const Value: string);
begin
  if FSCHEDULEUSE = Value then Exit;
  FSCHEDULEUSE := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdSCHEDULEUSE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetTimeCodeUse(const Value: string);
begin
  if FTimeCodeUse = Value then Exit;
  FTimeCodeUse := Value;
  if InfoInitialize then Exit; //DB에서 로딩 중에는 이벤트 발생 처리 하지 말자.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdTimeCodeUse,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;


end.
