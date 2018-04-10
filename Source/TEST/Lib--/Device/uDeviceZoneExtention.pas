unit uDeviceZoneExtention;

interface

uses
  System.SysUtils, System.Classes,Windows,Forms,
  uNode,uDevice,uDeviceVariable;

type
  TDeviceZoneExtention = Class(TComponent)
  private
    procedure ZoneExtentionInformationCheck(aInformationType: integer);
    procedure ZoneExtentionInformationSend(aInformationType: integer);

    function ZoneExtentionInformationSetting(aDelay:Boolean=True):Boolean;
    function ZoneExtentionInfoSettingCheck(aDelay:Boolean=True):Boolean;
    function ZoneExtentionResponseCheck(aIndex,aDelay:integer):Boolean;
    procedure SendPacket(aCmd:Char;aMsgNo:char;aDeviceVer, aData: String;aPriority:integer=0);
  private
    L_cZoneExtentionRCVSTATE: Array [0..100] of char;     //���Ż���
    L_bZoneExtentionResponse: Array [0..100] of Boolean;              //��� ���� ���� ���� ����
    FEXTENDID: integer;
    FDevice: TDevice;
    FZONEEXTENDTYPE: string;
    FOnZONEEXTENDTYPEChange: TZoneExtentionPacket;
    FZoneExtendConnected: Boolean;
    FZONEEXTENDNAME: string;
    FZONEINFORCV: string;
    FOnReceiveTypeChage: TReceiveTypeChange;
    FReciveStateChange: Boolean;
    FZONEEXTENDUSE: Boolean;
    FInfoInitialize: Boolean;
    procedure SetZONEEXTENDTYPE(const Value: string);
    procedure SetZONEINFORCV(const Value: string);
    procedure SetReciveStateChange(const Value: Boolean);
  published
    //�����κ�
    property InfoInitialize : Boolean Read FInfoInitialize write FInfoInitialize;
    property ZoneExtendConnected : Boolean read FZoneExtendConnected write FZoneExtendConnected;
    property Device : TDevice read FDevice write FDevice;
    property EXTENDID : integer read FEXTENDID write FEXTENDID;
    property ZONEEXTENDNAME : string read FZONEEXTENDNAME write FZONEEXTENDNAME;
    property ZONEEXTENDTYPE : string read FZONEEXTENDTYPE write SetZONEEXTENDTYPE; //0�̻��,1.LOCK+ZONE,2.LOCK
    property ZONEEXTENDUSE : Boolean read FZONEEXTENDUSE write FZONEEXTENDUSE;
  published
    property ZONEINFORCV :string read FZONEINFORCV write SetZONEINFORCV;
    property ReciveStateChange : Boolean read FReciveStateChange write SetReciveStateChange; //���� ���� ���� ����
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure ZoneExtentionReciveCheck;
    procedure RcvDeviceExtentionZoneData(aECUID,aDeviceVer,aRealData:string);
  published
    //�̺�Ʈ �߻�
    property OnZONEEXTENDTYPEChange : TZoneExtentionPacket read FOnZONEEXTENDTYPEChange write FOnZONEEXTENDTYPEChange;
    property OnReceiveTypeChage : TReceiveTypeChange read FOnReceiveTypeChage write FOnReceiveTypeChage;
  End;

  TdmDeviceZoneExtention = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDeviceZoneExtention: TdmDeviceZoneExtention;

implementation
uses
  uCommonFunction,
  uCommonVariable;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDeviceZoneExtention }

constructor TDeviceZoneExtention.Create(AOwner: TComponent);
var
  i : integer;
begin
  inherited;
  for i := 0 to HIGH(L_cZoneExtentionRCVSTATE) do
  begin
    L_cZoneExtentionRCVSTATE[i] := 'Y';
  end;

end;

destructor TDeviceZoneExtention.Destroy;
begin

  inherited;
end;

procedure TDeviceZoneExtention.RcvDeviceExtentionZoneData(aECUID, aDeviceVer,
  aRealData: string);
begin
  L_bZoneExtentionResponse[con_ExtentionCmdZoneInfoSetting] := True;
  if (ZONEINFORCV = 'R') or (ZONEINFORCV = 'S') then ZONEINFORCV := 'Y';
end;

procedure TDeviceZoneExtention.SendPacket(aCmd, aMsgNo: char; aDeviceVer,
  aData: String; aPriority: integer);
begin
  if Device.DeviceNode <> nil then
     Device.DeviceNode.SendPacket(TDevice(Device).EcuID,aCmd,aMsgNo,aDeviceVer,aData,aPriority);
end;

procedure TDeviceZoneExtention.SetReciveStateChange(const Value: Boolean);
begin
  if FReciveStateChange = Value then Exit;
  FReciveStateChange := Value;
  if Value then
     TDevice(Device).ReciveStateChange := True;
end;

procedure TDeviceZoneExtention.SetZONEEXTENDTYPE(const Value: string);
begin
  if FZONEEXTENDTYPE = Value then Exit;

  if EXTENDID = 0 then FZONEEXTENDTYPE := '1'
  else FZONEEXTENDTYPE := Value;

  if FZONEEXTENDTYPE <> '0' then ZONEEXTENDUSE := True
  else ZONEEXTENDUSE := False;

  Device.EXTENDTYPEChange(EXTENDID,Value);

  if InfoInitialize then Exit;

  if Assigned(FOnZONEEXTENDTYPEChange) then
  begin
    OnZONEEXTENDTYPEChange(Self,TNode(Device.DeviceNode).NO,TDevice(Device).EcuID,inttostr(EXTENDID),'0',FZONEEXTENDTYPE);
  end;
end;

procedure TDeviceZoneExtention.SetZONEINFORCV(const Value: string);
begin
  if FZONEINFORCV = Value then Exit;
  if EXTENDID = 0 then FZONEINFORCV := 'Y'
  else FZONEINFORCV := Value;

  ReciveStateChange := True;

  L_cZoneExtentionRCVSTATE[con_ExtentionCmdZoneInfoSetting] := FZONEINFORCV[1];
  if Assigned(FOnReceiveTypeChage) then
  begin
    OnReceiveTypeChage(Self,TNode(Device.DeviceNode).NO,'EXTEND',TDevice(Device).EcuID,inttostr(EXTENDID),'0',con_ExtentionCmdZoneInfoSetting,FZONEINFORCV);
  end;

end;

procedure TDeviceZoneExtention.ZoneExtentionInformationCheck(
  aInformationType: integer);
begin
  case aInformationType of
    con_ExtentionCmdZoneInfoSetting : begin
      ZONEINFORCV := 'R';
      ZoneExtentionInfoSettingCheck;
      if ZONEINFORCV = 'R' then ZONEINFORCV := 'N';
    end;
  end;
end;

procedure TDeviceZoneExtention.ZoneExtentionInformationSend(
  aInformationType: integer);
begin
  case aInformationType of
    con_ExtentionCmdZoneInfoSetting : begin
      ZONEINFORCV := 'S';
      ZoneExtentionInformationSetting;
      if ZONEINFORCV = 'S' then ZONEINFORCV := 'U';
    end;
  end;
end;

function TDeviceZoneExtention.ZoneExtentionInformationSetting(
  aDelay: Boolean): Boolean;
var
  stData : string;
  stSendData : string;
begin
  L_bZoneExtentionResponse[con_ExtentionCmdZoneInfoSetting] := False;
  stData := Device.GetExtendToZoneInformation(EXTENDID);
  if ZONEEXTENDUSE then stData := '1' + stData
  else stData := '0' + stData;
  stSendData := 'EL01' +                             //COMMAND
    FillZeroNumber(EXTENDID,2) +                     //��Ȯ����ȣ
    stData;                                          //������

  SendPacket('I',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := ZoneExtentionResponseCheck(con_ExtentionCmdZoneInfoSetting,con_DelayTime);

end;

function TDeviceZoneExtention.ZoneExtentionInfoSettingCheck(
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  L_bZoneExtentionResponse[con_ExtentionCmdZoneInfoSetting] := False;
  stData := 'EL01' +                             //MSG Code
            FillZeroNumber(EXTENDID, 2);               //������ȣ
  SendPacket('Q',TNode(Device.DeviceNode).GetSendMsgNo,TNode(Device.DeviceNode).GetDeviceVer, stData,0);
  if aDelay then
    result := ZoneExtentionResponseCheck(con_ExtentionCmdZoneInfoSetting,con_DelayTime);
end;

procedure TDeviceZoneExtention.ZoneExtentionReciveCheck;
var
  i : integer;
  bReciveStateCheck : Boolean;
begin
  Try
    for i := 0 to HIGH(L_cZoneExtentionRCVSTATE) do
    begin
      if L_cZoneExtentionRCVSTATE[i] = 'U' then  //����� ���� ������ �۽� ����....
      begin
        ZoneExtentionInformationSend(i);
        Exit;
      end;
    end;
    for i := 0 to HIGH(L_cZoneExtentionRCVSTATE) do
    begin
      if L_cZoneExtentionRCVSTATE[i] = 'N' then  //���¸� ������ ���� ������ ���� üũ ����....
      begin
        ZoneExtentionInformationCheck(i);
        Exit;
      end;
    end;
    //���⼭�� ���Ż��� üũ �ϴ� �� ==> ������ �ȵǸ� ���⼭ ���� ���� �߻�
    bReciveStateCheck := False;
    for i := 0 to HIGH(L_cZoneExtentionRCVSTATE) do
    begin
      if L_cZoneExtentionRCVSTATE[i] <> 'Y' then
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

function TDeviceZoneExtention.ZoneExtentionResponseCheck(aIndex,
  aDelay: integer): Boolean;
var
  FirstTickCount : double;
begin
  FirstTickCount := GetTickCount + aDelay;
  While Not L_bZoneExtentionResponse[aIndex] do
  begin
    if G_bApplicationTerminate then Exit;
    sleep(1);
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
  result := L_bZoneExtentionResponse[aIndex];
end;

end.