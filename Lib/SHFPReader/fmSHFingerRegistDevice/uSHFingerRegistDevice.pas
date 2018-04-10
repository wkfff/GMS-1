unit uSHFingerRegistDevice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB;

type
  TfmSHFingerRegistDevice = class(TForm)
    Panel1: TPanel;
    lb_Message: TLabel;
    Panel2: TPanel;
    btn_GetFPData: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Cancel: TSpeedButton;
    TempADOQuery: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_GetFPDataClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    L_stDeviceMessage : string;
    FSave: Boolean;
    FFingerCardNo: string;
    FFingerUserID: string;
    FFingerTemplate1_2: string;
    FFingerTemplate1_1: string;
    { Private declarations }
    Function DupCheckCardNo(aCardNo:string):Boolean;
  public
    { Public declarations }
    property FingerUserID : string read FFingerUserID write FFingerUserID;
    property FingerCardNo : string read FFingerCardNo write FFingerCardNo;
    property FingerTemplate1_1 : string read FFingerTemplate1_1 write FFingerTemplate1_1;
    property FingerTemplate1_2 : string read FFingerTemplate1_2 write FFingerTemplate1_2;
    property Save : Boolean read FSave write FSave;
  end;

var
  fmSHFingerRegistDevice: TfmSHFingerRegistDevice;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBFunction,
  uSupremaServer;

{$R *.dfm}

procedure TfmSHFingerRegistDevice.FormCreate(Sender: TObject);
begin
  L_stDeviceMessage := '$DeviceIP ���� $UserID ������ ���� ����� �������� ��ư�� Ŭ�� �Ͽ� �ּ���.';
end;

procedure TfmSHFingerRegistDevice.FormShow(Sender: TObject);
var
  oFPNode : TSupremaServer;
  Tick: DWORD;
  NowTick: DWORD;
begin
  Try
    oFPNode := TSupremaServer.Create(nil);
    oFPNode.DEVICETYPE := '3'; //��ϱ� Ÿ������ ��������.
    oFPNode.FingerDeviceID := G_nShFingerRegDeviceID;
    oFPNode.FNSEQ := 1;
    oFPNode.DEVICEIP := G_stShFingerRegDeviceIP;
    oFPNode.DEVICEPORT := inttostr(G_nShFingerRegDevicePort);
    oFPNode.DEVICENAME := '��ϱ�';

    if Not oFPNode.Connected then oFPNode.SocketOPEN := False;
    oFPNode.SocketOPEN := True;

    Tick := GetTickCount + DWORD(3000);    //3�� ���� ���� ���� ���ϸ� ���� �����̴�.

    While Not oFPNode.Connected  do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;

    if Not oFPNode.Connected then
    begin
      showmessage('�������� ���ӿ� ���� �Ͽ����ϴ�.');
      Exit;
    end;

    oFPNode.ApprovalNum_Send(G_nShFingerRegDeviceID,strtoint(FingerUserID));
  Finally
    oFPNode.SocketOPEN := False;
    oFPNode.Destroy;
    btn_GetFPData.Enabled := True;
  End;
end;

procedure TfmSHFingerRegistDevice.FormActivate(Sender: TObject);
var
  stMessage : string;
begin
  stMessage := StringReplace(L_stDeviceMessage,'$DeviceIP',G_stShFingerRegDeviceIP,[rfReplaceAll]);
  stMessage := StringReplace(stMessage,'$UserID',FillZeroStrNum(FingerUserID,G_nFPUserIDLength),[rfReplaceAll]);
  lb_Message.Caption := stMessage;
  
end;

procedure TfmSHFingerRegistDevice.btn_SaveClick(Sender: TObject);
begin
  Save := True;
  if FingerCardNo = '' then FingerCardNo := dmDBFunction.GetTB_CARD_FingerCardNo(FingerUserID);
  Close;
end;

procedure TfmSHFingerRegistDevice.btn_CancelClick(Sender: TObject);
begin
  Save := False;
  Close;
end;

procedure TfmSHFingerRegistDevice.btn_GetFPDataClick(Sender: TObject);
var
  oFPNode : TSupremaServer;
  Tick: DWORD;
  NowTick: DWORD;
begin
  Try
    btn_GetFPData.Enabled := False;
    btn_Save.Enabled := False;
    oFPNode := TSupremaServer.Create(nil);
    oFPNode.DEVICETYPE := '3'; //��ϱ� Ÿ������ ��������.
    oFPNode.FingerDeviceID := G_nShFingerRegDeviceID;
    oFPNode.FNSEQ := G_nShFingerRegDeviceID;  //1
    oFPNode.DEVICEIP := G_stShFingerRegDeviceIP;
    oFPNode.DEVICEPORT := inttostr(G_nShFingerRegDevicePort);
    oFPNode.DEVICENAME := '��ϱ�';
    
    if Not oFPNode.Connected then oFPNode.SocketOPEN := False;
    oFPNode.SocketOPEN := True;

    Tick := GetTickCount + DWORD(3000);    //3�� ���� ���� ���� ���ϸ� ���� �����̴�.

    While Not oFPNode.Connected  do
    begin
      NowTick := GetTickCount;
      if Tick < NowTick then break;
      Application.ProcessMessages;
    end;

    if Not oFPNode.Connected then
    begin
      showmessage('�������� ���ӿ� ���� �Ͽ����ϴ�.');
      Exit;
    end;

    FingerTemplate1_1 := oFPNode.GetFPData(FingerUserID);
    if FingerTemplate1_1 = '' then
    begin
      showmessage('�ش� ������ ������ �������� ���߽��ϴ�..');
      Exit;
    end;
    oFPNode.SocketOPEN := False;
    btn_SaveClick(btn_Save);
    //btn_Save.Enabled := True;

  Finally
    oFPNode.Destroy;
    btn_GetFPData.Enabled := True;
  End;
end;


function TfmSHFingerRegistDevice.DupCheckCardNo(aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  //���� ī�� �ߺ�����
  stSql := ' Select * from TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';
  with TempADOQuery do
  begin
    close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

procedure TfmSHFingerRegistDevice.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FingerTemplate1_1 <> '') and (Not Save) then
  begin
    if Application.MessageBox(PChar('���������͸� ���� ���� �ʾҽ��ϴ�.���� �Ͻðڽ��ϱ�?'),'���',MB_OKCANCEL) = ID_CANCEL  then
    begin
      CanClose := False;
    end;
  end;

end;

end.