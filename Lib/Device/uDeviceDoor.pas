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
    L_cDoorRCVSTATE: Array [0..MAXDOORRCVCOUNT] of char;     //�������� ���Ż���
    L_bDoorResponse: Array [0..100] of Boolean;              //��� ���� ���� ���� ����
    L_bDoorHolidayResponse: Array [0..12] of Boolean;              //Ư���� ���俩��
    L_bDoorScheduleResponse: Array [0..10] of Boolean;              //Ư���� ���俩��
    L_ArrDoorScheduleData: Array [0..10] of string;              //Ư���� ���俩��
    L_ArrHoliday : Array [0..12] of string;       //Ư���� ���
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
    property DoorUse : Boolean read FDoorUse write SetDoorUse; //���Թ��������
    property DOORNAME : string read FDOORNAME write SetDOORNAME;
    //������
    property ARMAREANO : integer read FARMAREANO write SetARMAREANO;                               //���������ȣ
    property ARMDSCHECK : string read FARMDSCHECK write SetARMDSCHECK;                             //���� DS üũ
    property CONTROLTIME : string read FCONTROLTIME write SetCONTROLTIME;                          //���ð�
    property DeadBoltDSCHECKUSE : string read FDeadBoltDSCHECKUSE write SetDeadBoltDSCHECKUSE;     //���庼Ʈ DSüũ �������
    property DeadBoltDSCHECKTIME : string read FDeadBoltDSCHECKTIME write SetDeadBoltDSCHECKTIME;  //���庼Ʈ DSüũ ���ð�
    property DOORTYPE : string read FDOORTYPE write SetDOORTYPE;                                   //���Թ� �ý��� ����,'0'.�������,'1'.��������,'2'.'���+����';
    property DOORSTATE : string read FDOORSTATE write SetDOORSTATE;                                //���Թ��������� '0'.�ش����,'1'.���Թ�����,'2'.������
    property DOORVIEW : string read FDOORVIEW write SetDOORVIEW;                                    //���Թ� ����͸� ǥ�� ����
    property DSOPENSTATE : string read FDSOPENSTATE write SetDSOPENSTATE;                          //���Թ��������� (DS OPEN 0x30,DS CLOSE 0x31)
    property FIREDOOROPEN : string read FFIREDOOROPEN write SetFIREDOOROPEN;                       //ȭ��� ������ '0'.������,'1'.���
    property LOCKSTATE : string read FLOCKSTATE write SetLOCKSTATE;                                //LS����(������)
    property LOCKTYPE : integer read FLOCKTYPE write SetLOCKTYPE;                                  //������ Ÿ��
    property LONGOPENTIME : string read FLONGOPENTIME write SetLONGOPENTIME;                       //��ð������ð�
    property LONGOPENALARM : string read FLONGOPENALARM write SetLONGOPENALARM;                    //��ð������� �˶��߻�����
    property REMOTEDISARMDOOROPEN : string read FREMOTEDISARMDOOROPEN write SetREMOTEDISARMDOOROPEN;  //���������� ���Թ� ����
    property SCHEDULEUSE : string read FSCHEDULEUSE write SetSCHEDULEUSE;                          //������ ��������
    property TimeCodeUse : string read FTimeCodeUse write SetTimeCodeUse;
    property AntiPassNo : integer read FAntiPassNo write SetAntiPassNo;
    property AntiGroupCode : string read FAntiGroupCode write SetAntiGroupCode;
  published
    //���Թ� ���°�
    property CARDMODE : string read FCARDMODE write SetCARDMODE;                                     //ī����'0'.Posi,'1'.Nega
    property DOORMODE : string read FDOORMODE write SetDOORMODE;                                     //���Թ����� '0'.�,'1'.����,'2'.���,'3'.������
    property DoorCurrentDSState : string read FDoorCurrentDSState write SetDoorCurrentDSState;       //���� ���Թ� ����(O),����(C),'T'��ð����� ����
    property DoorCurrentLSState : string read FDoorCurrentLSState write SetDoorCurrentLSState;       //���� ���Թ� ���/���� ���� - �̻��
    property DoorCurrentFireEvent : string read FDoorCurrentFireEvent write SetDoorCurrentFireEvent; //���Թ�ȭ��߻� ���� '0'.����,'1'.����
    property DoorLongTimeOpenState : string read FDoorLongTimeOpenState write SetDoorLongTimeOpenState;  //��ð� ���Թ� ���������ڵ�

    property CurrentDoorStateChange : Boolean read FCurrentDoorStateChange write FCurrentDoorStateChange; // ���� ���Թ� ���°� ���� �Ǵ� ��� ���߿� �̺�Ʈ �߻� ��Ű��.
    property CurrentDoorStateCheckRCV :Boolean read FCurrentDoorStateCheckRCV write SetCurrentDoorStateCheckRCV;  //
  published
    property InfoInitialize : Boolean Read FInfoInitialize write FInfoInitialize;
    //���ſ���
    property DOORSETTINTINFORCV : string read FDOORSETTINTINFORCV write SetDOORSETTINTINFORCV;
    property DeadBoltDSCHECKUSERCV : string read FDeadBoltDSCHECKUSERCV write SetDeadBoltDSCHECKUSERCV;
    property DeadBoltDSCHECKTIMERCV : string read FDeadBoltDSCHECKTIMERCV write SetDeadBoltDSCHECKTIMERCV;
    property ARMDSCHECKRCV : string read FARMDSCHECKRCV write SetARMDSCHECKRCV;
    property HolidayRCV : string read FHolidayRCV write SetHolidayRCV;
    property DOORSCHEDULEDATARCV : string read FDOORSCHEDULEDATARCV write SetDOORSCHEDULEDATARCV;
  published
    //�̺�Ʈ �߻�
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
    property ReciveStateChange : Boolean read FReciveStateChange write SetReciveStateChange; //���� ���� ���� ����
  public
    //��� ���� ó��
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
    procedure CurrentDoorStateChangeAction;  //���� ���� �̺�Ʈ �߻� ��Ű��.
    procedure HolidayClear;
    function SetHoliday(aDay,aValue:string):Boolean; //������ ����
    function SetDoorScheduleData(aValue:string):Boolean; //�����ٵ�����
    procedure ErrorDoorArmDsCheck; //���Թ� ���� Ds üũ ��� ���� ����
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
         inttostr(DoorNo) +                 //  ��⳻ Door No
         #$30+                              //  RecordCount(����)
         #$30+                              //  RecordCount(������ȸ)
         #$30;                              //  �ǹ̾���

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
    ARMDSCHECK := '0'; //���庼Ʈ���� �ƴϸ� ���� DS üũ�� ������ �������̴�.
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
  if Not isDigit(DeadBoltDSCHECKTIME) then DeadBoltDSCHECKTIME := '1'; //1�ʸ� ����Ʈ�� ����.

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
  if DeadBoltDSCHECKUSE = '' then DeadBoltDSCHECKUSE := '1'; //����� ����Ʈ�� ����

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
  stData := 'Q' + //��ȸ'R'
            '0' + //���� 0 ���� 1
            inttostr(DoorNo) + //0:��ü,1:1����,2:2����
            ' ' + //�����̽�
            'W' + //A:�߰�,D����,W:��ü����
            '0000' + //MMDD
            '3';  //'3' : Ư����

  L_bDoorHolidayResponse[0] := False; //���� ����
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
    stData := 'Q' + //��ȸ'R'
              '0' + //���� 0 ���� 1
              inttostr(DoorNo) + //0:��ü,1:1����,2:2����
              ' ' + //�����̽�
              'D' + //A:�߰�,D����,W:��ü����
              HolidayDelList.Strings[i] + //MMDD
              '3';  //'3' : Ư����
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
    stData := 'Q' + //��ȸ'R'
              '0' + //���� 0 ���� 1
              inttostr(DoorNo) + //0:��ü,1:1����,2:2����
              ' ' + //�����̽�
              'A' + //A:�߰�,D����,W:��ü����
              HolidayRegList.Strings[i] + //MMDD
              '3';  //'3' : Ư����
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
  stData := 'Q' + //��ȸ'R'
            '0' + //���� 0 ���� 1
            inttostr(DoorNo) + //0:��ü,1:1����,2:2����
            ' ' + //�����̽�
            'A' + //A:�߰�,D����,W:��ü����
            FillZeroNumber(aMonth,2) + //MM dd
            copy(L_ArrHoliday[aMonth],1,31)
            ;  //'3' : Ư����

  L_bDoorHolidayResponse[aMonth] := False; //���� ����
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

  //if DoorHolidayClearSetting(aDelay) then  //��ü ���� ���� ��
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
      if DeadBoltDSCHECKUSERCV = 'R' then DeadBoltDSCHECKUSERCV := 'Y'; //����� ���°͵� ����
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
      HolidayRCV := 'Y'; //������ ��ȸ�� ���� ����.
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
      if (Device.DEVICECODE <> '') and Not Device.DeviceScheduleSkill then //������ ����� ������ �������� ����.
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
      if (Device.DEVICECODE <> '') and Not Device.DeviceScheduleSkill then //������ ����� ������ �������� ����.
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
  if SCHEDULEUSE = '9' then SCHEDULEUSE := '0';  //DB ����Ʈ ���̸�
  if LONGOPENALARM = '' then LONGOPENALARM := '0';
  if FIREDOOROPEN = '' then FIREDOOROPEN := '0';
  if FIREDOOROPEN = '9' then FIREDOOROPEN := '0';
  if DSOPENSTATE = '' then DSOPENSTATE := '1';
  if DSOPENSTATE = '9' then DSOPENSTATE := '1';
  if REMOTEDISARMDOOROPEN = '' then REMOTEDISARMDOOROPEN := '0';
  if REMOTEDISARMDOOROPEN = '9' then REMOTEDISARMDOOROPEN := '0';

  L_bDoorResponse[con_DoorCmdSettingInfo] := False;
  stData := 'G' + '0' +                             //MSG Code  A:���,B:��ȸ,G:��� ���� ���� ���   A->G�� ����
            inttostr(DoorNo) +               //����ȣ
            #$20 + #$20 +
            CARDMODE[1] +
            DOORMODE[1] +
            stDoorControlTime[1] +
            stDoorLongOpenTime[1] +
            SCHEDULEUSE[1] +
            '1' +      //���Թ����������� ������ ���Թ�����
            '0' +      //����̻�� ���(������:����)
            inttostr(AntiPassNo) + //'0' +      //AntiPassBack(������:����)
            LONGOPENALARM[1] +
            '0' +      //��� �̻�� ���� ��� (������:����)
            stDoorLockType[1] +
            FIREDOOROPEN[1] +
            '0' +
            DSOPENSTATE[1] +  //���Թ��������� (DS OPEN 0x30,DS CLOSE 0x31)
            REMOTEDISARMDOOROPEN[1]  +   //���������� ������
            '00000'                      //��ȸ�� ��ü�� '0'���� ��ŷ
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
      ReciveStateChange := False; //��Ʈ�ѷ��� �ִ� ���Թ� ��ȣ�� �Ѿ ���Թ��� ���ؼ��� �˻����� ����.
      Exit;
    end;

    for i := 0 to HIGH(L_cDoorRCVSTATE) do
    begin
      if (L_cDoorRCVSTATE[i] = 'U') or (L_cDoorRCVSTATE[i] = 'S') then  //����� ���� ������ �۽� ����....
      begin
        //L_cDoorRCVSTATE[i] := 'N'; //����� ���� ������ ���Ÿ� ����...
        DoorInformationSend(i);
        Exit;
      end;
    end;
    for i := 0 to HIGH(L_cDoorRCVSTATE) do
    begin
      if L_cDoorRCVSTATE[i] = 'N' then  //���¸� ������ ���� ������ ���� üũ ����....
      begin
        DoorInformationCheck(i);
        Exit;
      end;
    end;

    //���⼭�� ���Ż��� üũ �ϴ� �� ==> ������ �ȵǸ� ���⼭ ���� ���� �߻�
    bReciveStateCheck := False;
    for i := 0 to HIGH(L_cDoorRCVSTATE) do
    begin
      if L_cDoorRCVSTATE[i] <> 'Y' then
      begin
        bReciveStateCheck := True;
        break;
      end;
    end;
    ReciveStateChange := bReciveStateCheck;  //��ü �۽� ������ False�� ����
  Finally
    //RcvCheckTimer.Enabled := ReciveStateChange;  //���Ż��¸� ���� �ϸ鼭 ���� ��
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

  stData := 'S' + //������
            '0' + //���� 0 ���� 1
            inttostr(DoorNo) + //0:��ü,1:1����,2:2����
            ' ' + //�����̽�
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
            inttostr(DoorNo) +               //����ȣ
            #$20 + #$20 + '00000000000000000000';          //��ȸ�� ��ü�� '0'���� ��ŷ
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
    nOrd := $20 + nMSec; //21~29 ���� MSEC;
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
  Delete(aRealData,1,2); //���Թ���ȣ
  ARMDSCHECK := aRealData[1];
end;

procedure TDeviceDoor.ReceiveDoorControlState(aEcuID, aDeviceVer, aMsgNo,
  aRealData: string);
begin
  L_bDoorResponse[con_DOORCONTROLSTATECHECK] := True;
  CurrentDoorStateCheckRCV := True;
  CardMode:= aRealData[6];    //Posi/Nega
  DoorMode:=  aRealData[7];    //�/����
  DoorCurrentDSState:= aRealData[8];    //������
  DoorCurrentLSState := '';
  CurrentDoorStateChangeAction;
end;

procedure TDeviceDoor.ReceiveDoorDeadBoltDSCheckTime(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin
  L_bDoorResponse[con_DoorCmdDeadBoltDSCHECKTIME] := True;
  DeadBoltDSCHECKTIMERCV := 'Y';
  Delete(aRealData,1,4);
  Delete(aRealData,1,2); //���Թ���ȣ
  DeadBoltDSCHECKTIME := copy(aRealData,1,2);
end;

procedure TDeviceDoor.ReceiveDoorDeadBoltDSCheckUse(aECUID, aDeviceVer: string;
  aMsgNo: char; aRealData: string);
begin
  L_bDoorResponse[con_DoorCmdDeadBoltDSCHECKUSE] := True;
  DeadBoltDSCHECKUSERCV := 'Y';
  Delete(aRealData,1,4);
  Delete(aRealData,1,2); //���Թ���ȣ
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
  DoorMode:=  aRealData[19];    //�/����
  DoorCurrentDSState:= aRealData[22];    //������
  stChangeState := aRealData[20];       //'F' ȭ��
  if UpperCase(stChangeState) = 'F' then   //�������� ȭ�� �߻��� ó�� �ϱ� ���� �κ�
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
  LONGOPENALARM := aRealData[14];          //��ð� ���� �������
  LOCKTYPE := ord(aRealData[16]) - $30;   //������ Ÿ��
  FIREDOOROPEN := aRealData[17];          //ȭ�� �߻��� ������
//  DSLSCHECK := aRealData[18];             //DS LS �˻�(������:����)
  DSOPENSTATE := aRealData[19];           //���Թ��������� (DS OPEN 0x30,DS CLOSE 0x31)
  REMOTEDISARMDOOROPEN := aRealData[20];  //���������� (DoorOpen 0x30,DoorClose 0x31)
  DOORSETTINTINFORCV := 'Y';
end;

procedure TDeviceDoor.SendPacket(aCmd, aMsgNo: char; aDeviceVer, aData: String;
  aPriority: integer);
begin
  if Device.DeviceNode <> nil then
     Device.DeviceNode.SendPacket(TDevice(Device).EcuID,aCmd,aMsgNo,aDeviceVer,aData,aPriority);
end;

procedure TDeviceDoor.SetAntiGroupCode(const Value: string);
var
  stData : string;
begin
  if FAntiGroupCode = Value then Exit;

  FAntiGroupCode := Value;
  if isdigit(Value) then
  begin
    if strtoint(Value) = 0  then  //��Ƽ�н����� ������� �ʴ´�.
    begin
      if Not ((CARDMODE='') or (CARDMODE='0') or (CARDMODE = '1')) then  //Positive �Ǵ� Negative ��尡 �ƴϸ� Positive ���� ��������.
      begin
        stData := 'C' +
                  '0' +  //  Msg Count
                  inttostr(DoorNo) +
                  #$30+
                  #$31+ //  RecordCount(ī����庯�� #$31)
                  '0';
        SendPacket('c',Device.DeviceNode.GetSendMsgNo,Device.DeviceNode.GetDeviceVer,stData,0);
      end;
    end else
    begin
      if ((CARDMODE='0') or (CARDMODE = '1')) then  //Positive �Ǵ� Negative ����̸� Positive-ACK ���� ��������.
      begin
        stData := 'C' +
                  '0' +  //  Msg Count
                  inttostr(DoorNo) +
                  #$30+
                  #$31+ //  RecordCount(ī����庯�� #$31)
                  '2';
        SendPacket('c',Device.DeviceNode.GetSendMsgNo,Device.DeviceNode.GetDeviceVer,stData,0);
      end;
    end;
  end else
  begin
    if Not ((CARDMODE='0') or (CARDMODE = '1')) then  //Positive �Ǵ� Negative ��尡 �ƴϸ� Positive ���� ��������.
    begin
      stData := 'C' +
                '0' +  //  Msg Count
                inttostr(DoorNo) +
                #$30+
                #$31+ //  RecordCount(ī����庯�� #$31)
                '0';
      SendPacket('c',Device.DeviceNode.GetSendMsgNo,Device.DeviceNode.GetDeviceVer,stData,0);
    end;
  end;

end;

procedure TDeviceDoor.SetAntiPassNo(const Value: integer);
begin
  if FAntiPassNo = Value then Exit;
  FAntiPassNo := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdAntiNo,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),inttostr(Value));
  end;
end;

procedure TDeviceDoor.SetARMAREANO(const Value: integer);
begin
  if FARMAREANO = Value then Exit;
  FARMAREANO := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdArmArea,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),inttostr(Value));
  end;
end;

procedure TDeviceDoor.SetARMDSCHECK(const Value: string);
begin
  if FARMDSCHECK = Value then Exit;
  FARMDSCHECK := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
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
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
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
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
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
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,TNode(Device.DeviceNode).NO,'DOOR',TDevice(Device).EcuID,'0',inttostr(DoorNo),con_DoorCmdSettingInfo,Value);
  end;
end;

procedure TDeviceDoor.SetCARDMODE(const Value: string);
var
  stData : string;
begin
  if FCARDMODE = Value then Exit;
  FCARDMODE := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.

  if (Value = '*') or (Value = '') then CurrentDoorStateCheckRCV := False
  else
  begin
    if isdigit(AntiGroupCode) then
    begin
      if strtoint(AntiGroupCode) = 0  then  //��Ƽ�н����� ������� �ʴ´�.
      begin
        if Not ((CARDMODE='0') or (CARDMODE = '1')) then  //Positive �Ǵ� Negative ��尡 �ƴϸ� Positive ���� ��������.
        begin
          stData := 'C' +
                    '0' +  //  Msg Count
                    inttostr(DoorNo) +
                    #$30+
                    #$31+ //  RecordCount(ī����庯�� #$31)
                    '0';
          SendPacket('c',Device.DeviceNode.GetSendMsgNo,Device.DeviceNode.GetDeviceVer,stData,0);
        end;
      end else
      begin
        if ((CARDMODE='0') or (CARDMODE = '1')) then  //Positive �Ǵ� Negative ����̸� Positive-ACK ���� ��������.
        begin
          stData := 'C' +
                    '0' +  //  Msg Count
                    inttostr(DoorNo) +
                    #$30+
                    #$31+ //  RecordCount(ī����庯�� #$31)
                    '2';
          SendPacket('c',Device.DeviceNode.GetSendMsgNo,Device.DeviceNode.GetDeviceVer,stData,0);
        end;
      end;
    end else
    begin
      if Not ((CARDMODE='0') or (CARDMODE = '1')) then  //Positive �Ǵ� Negative ��尡 �ƴϸ� Positive ���� ��������.
      begin
        stData := 'C' +
                  '0' +  //  Msg Count
                  inttostr(DoorNo) +
                  #$30+
                  #$31+ //  RecordCount(ī����庯�� #$31)
                  '0';
        SendPacket('c',Device.DeviceNode.GetSendMsgNo,Device.DeviceNode.GetDeviceVer,stData,0);
      end;
    end;

  end;

  CurrentDoorStateChange := True;
end;

procedure TDeviceDoor.SetCONTROLTIME(const Value: string);
begin
  if FCONTROLTIME = Value then Exit;
  FCONTROLTIME := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
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
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if (Value = '*') or (Value = '') then CurrentDoorStateCheckRCV := False;
  CurrentDoorStateChange := True;
end;

procedure TDeviceDoor.SetDOORNAME(const Value: string);
begin
  if FDOORNAME = Value then Exit;
  FDOORNAME := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
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
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDOORPacketChange) then
  begin
    OnDOORPacketChange(Self,con_DOORCmdSTATE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetDOORTYPE(const Value: string);
begin
  if FDOORTYPE = Value then Exit;
  FDOORTYPE := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
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
  //if InfoInitialize then Exit; //DB���� �ε� �� ���� ��������� ���ؼ� ��������� ���� �ϵ��� ����
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdUse,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),stDoorUse);
  end;

end;

procedure TDeviceDoor.SetDOORVIEW(const Value: string);
begin
  if FDOORVIEW = Value then Exit;
  FDOORVIEW := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdView,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetDeadBoltDSCHECKTIME(const Value: string);
begin
  if FDeadBoltDSCHECKTIME = Value then Exit;
  FDeadBoltDSCHECKTIME := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
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
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,TNode(Device.DeviceNode).NO,'DOOR',TDevice(Device).EcuID,'0',inttostr(DoorNo),con_DoorCmdDeadBoltDSCHECKTIME,Value);
  end;
end;

procedure TDeviceDoor.SetDeadBoltDSCHECKUSE(const Value: string);
begin
  if FDeadBoltDSCHECKUSE = Value then Exit;
  FDeadBoltDSCHECKUSE := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
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
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,TNode(Device.DeviceNode).NO,'DOOR',TDevice(Device).EcuID,'0',inttostr(DoorNo),con_DoorCmdDeadBoltDSCHECKUSE,Value);
  end;
end;

procedure TDeviceDoor.SetDoorCurrentFireEvent(const Value: string);
begin
  if FDoorCurrentFireEvent = Value then Exit;

(* 20160302 ����ġ ȭ�� �߻����� ���Թ� ȭ�� ������ ������ ���� => ���Թ��� ȭ��� ������ ��������� ����ϴ��� ��
  if FIREDOOROPEN = '0' then
  begin
    FDoorCurrentFireEvent := '0';  //ȭ��� ������ ��� ���ϴ� ��� ������ ȭ��߻� ����
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
  if InfoInitialize then Exit; //DB �������� �̺�Ʈ �߻� ��Ű�� ����.

  if Assigned(FOnDoorLongTimeOpenEvent) then
  begin
    OnDoorLongTimeOpenEvent(Self,con_DoorCmdDSOPENSTATE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;

end;

procedure TDeviceDoor.SetDoorCurrentDSState(const Value: string);
begin
  if FDoorCurrentDSState = Value then Exit;
(*  if Value = 'O' then //���Թ� ���� �̸�
  begin
    if (FDoorCurrentDSState = 'T') or (FDoorCurrentDSState = 'D') then Exit; //��ð� ������ �� ���¿���
  end;
*)
//  if (FDoorCurrentDSState <> '') and (Value <> '') then   //ó�� �⵿�Ͽ� ���� Ȯ�νÿ��� �α� ������ ����.
  if Not InfoInitialize and (Value <> '') then   //ó�� �⵿�Ͽ� ���� Ȯ�νÿ��� �α� ������ ����.
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
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdDSOPENSTATE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetFIREDOOROPEN(const Value: string);
begin
  if FFIREDOOROPEN = Value then Exit;
  FFIREDOOROPEN := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
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

  if aValue = '0' then //������ ��� ����
  begin
    nIndex := HolidayRegList.IndexOf(aDay);
    if nIndex > -1 then HolidayRegList.Delete(nIndex);
    nIndex := HolidayDelList.IndexOf(aDay);
    if nIndex < 0 then HolidayDelList.Add(aDay);
  end else //if aValue = '1' then //�߰��� ��� ����
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
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.

  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdHOLIDAY,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetLOCKSTATE(const Value: string);
begin
  if FLOCKSTATE = Value then Exit;
  FLOCKSTATE := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdLOCKSTATE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;

end;

procedure TDeviceDoor.SetLOCKTYPE(const Value: integer);
begin
  if FLOCKTYPE = Value then Exit;
  FLOCKTYPE := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdLOCKTYPE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),inttostr(Value));
  end;
end;

procedure TDeviceDoor.SetLONGOPENALARM(const Value: string);
begin
  if FLONGOPENALARM = Value then Exit;
  FLONGOPENALARM := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdLONGOPENALARM,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetLONGOPENTIME(const Value: string);
begin
  if FLONGOPENTIME = Value then Exit;
  FLONGOPENTIME := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
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
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdREMOTEDISARMDOOROPEN,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetSCHEDULEUSE(const Value: string);
begin
  if FSCHEDULEUSE = Value then Exit;
  FSCHEDULEUSE := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdSCHEDULEUSE,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;

procedure TDeviceDoor.SetTimeCodeUse(const Value: string);
begin
  if FTimeCodeUse = Value then Exit;
  FTimeCodeUse := Value;
  if InfoInitialize then Exit; //DB���� �ε� �߿��� �̺�Ʈ �߻� ó�� ���� ����.
  if Assigned(FOnDoorPacketChange) then
  begin
    OnDoorPacketChange(Self,con_DoorCmdTimeCodeUse,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,'0',inttostr(DoorNo),Value);
  end;
end;


end.