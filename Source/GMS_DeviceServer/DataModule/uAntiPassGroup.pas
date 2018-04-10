unit uAntiPassGroup;

interface

uses
  System.SysUtils, System.Classes,ExtCtrls;

type
  TAntiGroupCardList = class(TComponent)
  private
    FInOutState: integer;
    FLastAccessTime: TDateTime;
  public
    property InOutState : integer read FInOutState write FInOutState;
    property LastAccessTime : TDateTime read FLastAccessTime write FLastAccessTime;
  end;

  TAntiPassGroup = class(TComponent)
  private
    AntiCardInitCheckTimer: TTimer;
    procedure AntiCardInitCheckTimerTimer(Sender: TObject);
  private
    AntiGroupCardList : TStringList;
    AntiGroupDeviceList : TStringList;
    FAntiPassGroup: string;
    FAntiPassNo: integer;
    FAntiDeviceConnect: Boolean;
    FAntiCardInit: Boolean;
    FAntiCardInitDate: string;
    procedure SetAntiCardInitDate(const Value: string);
    procedure SetAntiCardInit(const Value: Boolean);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure AntiGroupDeviceAdd(aDeviceID:string);
    procedure DeviceConnectChange;
    function AntiPassCardCheck(aCardNo:string; aAntiInOut:integer):integer;
  public
    { Public declarations }
    property AntiCardInit : Boolean read FAntiCardInit write SetAntiCardInit;
    property AntiCardInitDate : string read FAntiCardInitDate write SetAntiCardInitDate;
    property AntiPassGroup : string read FAntiPassGroup write FAntiPassGroup;
    property AntiPassNo : integer read FAntiPassNo write FAntiPassNo;
    Property AnitDeviceConnect : Boolean read FAntiDeviceConnect write FAntiDeviceConnect;
  end;

  TdmAntiPassGroupCode = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAntiPassGroupCode: TdmAntiPassGroupCode;

implementation
uses
  uCommonFunction,
  uCommonVariable;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TAntiPassGroup }

procedure TAntiPassGroup.AntiCardInitCheckTimerTimer(Sender: TObject);
var
  stNowTime : string;
  stNowDate : string;
begin
  if G_stGlobalAntiInitStartTime = G_stGlobalAntiInitEndTime then Exit; //�ʱ�ȭ ���ð� ��� ����
  if G_nGlobalAntiInitTime = 0 then Exit;  //�۷ι� ��Ƽ�н� �̻���̸� �ʱ�ȭ ���� �ʴ´�.
  stNowDate := FormatDateTime('yyyymmdd',now);
  stNowTime := FormatDateTime('yyyymmddhhnn',now);
  if stNowDate + G_stGlobalAntiInitEndTime <= stNowTime then
  begin
    AntiCardInit := True;
  end;
  AntiCardInitDate := FormatDateTime('yyyymmdd',now);
end;

procedure TAntiPassGroup.AntiGroupDeviceAdd(aDeviceID: string);
var
  nIndex : integer;
begin
  nIndex := AntiGroupDeviceList.IndexOf(aDeviceID);
  if nIndex < 0 then AntiGroupDeviceList.Add(aDeviceID);  //��� ���� ���� Ȯ�� �ϱ� ����
end;

function TAntiPassGroup.AntiPassCardCheck(aCardNo: string;
  aAntiInOut: integer): integer;
var
  nIndex : integer;
  oAntiGroupCardList : TAntiGroupCardList;
  dtCheckTime : TDateTime;
  stNowTime : string;
begin
  result := -1; //�ʱ� ���°�
  nIndex := AntiGroupCardList.IndexOf(aCardNo);
  if nIndex < 0 then
  begin
    oAntiGroupCardList := TAntiGroupCardList.Create(nil);
    oAntiGroupCardList.InOutState := aAntiInOut;
    oAntiGroupCardList.LastAccessTime := Now;
    AntiGroupCardList.AddObject(aCardNo,oAntiGroupCardList);
    Exit;
  end;

  if Not AnitDeviceConnect then Exit; //Anti�׷쳻 ��� ��Ʈ�ѷ��� Connect ���� �϶��� ��Ƽ�н� üũ ����.

  if TAntiGroupCardList(AntiGroupCardList.Objects[nIndex]).InOutState = aAntiInOut then
  begin
    if G_nGlobalAntiInitTime = 0 then    //��Ƽ �ʱ�ȭ ������� ������ ��Ƽ�н� ���� ����
    begin
      result := 0 ;
    end else                            //��Ƽ �ʱ�ȭ ����ϸ� �ð� üũ
    begin
      if G_stGlobalAntiInitStartTime < G_stGlobalAntiInitEndTime then
      begin
        stNowTime := FormatDateTime('hhnn',now);
        if (G_stGlobalAntiInitStartTime < stNowTime ) and ( stNowTime < G_stGlobalAntiInitEndTime) then     //��Ƽ �ʱ�ȭ �ð��̸� �ð�üũ
        begin
          dtCheckTime := IncTime(TAntiGroupCardList(AntiGroupCardList.Objects[nIndex]).LastAccessTime,0,G_nGlobalAntiInitTime,0,0);
          if dtCheckTime < now then
          begin
            result := -1;
            TAntiGroupCardList(AntiGroupCardList.Objects[nIndex]).LastAccessTime := Now;
          end else
          begin
            result := 0;
          end;
        end else
        begin
          result := 0;
        end;
      end else
      begin
        stNowTime := FormatDateTime('hhnn',now);
        if (G_stGlobalAntiInitStartTime < stNowTime ) or ( stNowTime < G_stGlobalAntiInitEndTime) then
        begin
          dtCheckTime := IncTime(TAntiGroupCardList(AntiGroupCardList.Objects[nIndex]).LastAccessTime,0,G_nGlobalAntiInitTime,0,0);
          if dtCheckTime < now then
          begin
            result := -1;
            TAntiGroupCardList(AntiGroupCardList.Objects[nIndex]).LastAccessTime := Now;
          end else
          begin
            result := 0;
          end;
        end else
        begin
          result := 0;
        end;
      end;
    end;
  end else
  begin
    TAntiGroupCardList(AntiGroupCardList.Objects[nIndex]).InOutState := aAntiInOut;
    TAntiGroupCardList(AntiGroupCardList.Objects[nIndex]).LastAccessTime := Now;
    result := 1;
  end;

end;

constructor TAntiPassGroup.Create(AOwner: TComponent);
begin
  inherited;
  AntiGroupCardList := TStringList.Create;
  AntiGroupDeviceList := TStringList.Create;
  AntiCardInitCheckTimer := TTimer.Create(nil);
  AntiCardInitCheckTimer.OnTimer := AntiCardInitCheckTimerTimer;
  AntiCardInitCheckTimer.Interval := 10000;
  AntiCardInitCheckTimer.Enabled := True;

end;

destructor TAntiPassGroup.Destroy;
var
  i : integer;
begin
  if AntiGroupCardList.Count > 0 then
  begin
    for i := AntiGroupCardList.Count - 1 downto 0 do TAntiGroupCardList(AntiGroupCardList.Objects[i]).Free;
  end;
  AntiGroupCardList.Free;
  AntiGroupDeviceList.Free;
  AntiCardInitCheckTimer.Enabled := False;
  AntiCardInitCheckTimer.Free;

  inherited;
end;

procedure TAntiPassGroup.DeviceConnectChange;
var
  i : integer;
  nIndex : integer;
  bConnect : Boolean;
begin
  if AntiGroupDeviceList.Count < 1 then Exit;
  bConnect := True;
  for i := 0 to AntiGroupDeviceList.Count - 1 do
  begin
    nIndex := DeviceList.IndexOf(AntiGroupDeviceList.Strings[i]);
    if nIndex > -1 then
    begin
      if Not TDevice(DeviceList.Objects[nIndex]).Connected then
      begin
        bConnect := False;
        Break;
      end;
    end;
  end;
  AnitDeviceConnect := bConnect;

end;

procedure TAntiPassGroup.SetAntiCardInit(const Value: Boolean);
var
  i : integer;
begin
  if FAntiCardInit = Value then Exit;
  FAntiCardInit := Value;
  if Value then
  begin
    if AntiGroupCardList.Count > 0 then
    begin
      for i := AntiGroupCardList.Count - 1 downto 0 do
      begin
        TAntiGroupCardList(AntiGroupCardList.Objects[i]).Free;
      end;
      AntiGroupCardList.Clear;
    end;
  end;

end;

procedure TAntiPassGroup.SetAntiCardInitDate(const Value: string);
begin
  if FAntiCardInitDate = Value then Exit;
  FAntiCardInitDate := Value;
  AntiCardInit := False;

end;

end.