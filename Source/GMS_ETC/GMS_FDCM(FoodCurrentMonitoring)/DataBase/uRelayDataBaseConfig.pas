unit uRelayDataBaseConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, AdvPanel,
  W7Classes, W7Buttons, Vcl.ImgList,System.iniFiles,Data.DB,Data.Win.ADODB,JclMime,
  ActiveX,uDBVariable;

type
  TRelayDataBaseConfig = class(TComponent)
  private
    L_stExeFolder : string;
    FCancel: Boolean;
    FDBConnected: Boolean;
    class function FindSelf:TComponent;
    procedure SetCancel(const Value: Boolean);
    procedure SetDBConnected(const Value: Boolean);
  private
    FOnAdoConnected: TAdoConnectedEvent;
  public
    { Public declarations }
    Procedure ShowDataBaseConfig;
    Function DataBaseConnect(aMessage:Boolean=True):Boolean;
  public
    class Function GetObject:TRelayDataBaseConfig;   //자기자신을 찾는것  class 는 폼생성전에도 사용가능
  Published
    { Published declarations }
    Property Cancel:Boolean read FCancel write SetCancel;
    Property DBConnected : Boolean read FDBConnected write SetDBConnected;
  Published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;

  TfmRelayDataBaseConfig = class(TForm)
    rg_DBType: TRadioGroup;
    AdvPanel1: TAdvPanel;
    edPasswd: TEdit;
    edDataBaseName: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    edUserid: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    edServerPort: TEdit;
    edServerIP: TEdit;
    Label1: TLabel;
    btn_Save: TW7SpeedButton;
    btn_Close: TW7SpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure rg_DBTypeClick(Sender: TObject);
  private
    L_stExeFolder : string;
    { Private declarations }
  public
    { Public declarations }
  end;
function SQLConfigDataSource(hwndParent : HWND; fRequest : WORD; lpszDriver : LPCSTR; lpszAttributes : LPCSTR) : Boolean; stdcall; external 'ODBCCP32.DLL';
var
  fmRelayDataBaseConfig: TfmRelayDataBaseConfig;

implementation
uses
  uRelayDataBase;

{$R *.dfm}

{ TRelayDataBaseConfig }

function TRelayDataBaseConfig.DataBaseConnect(aMessage: Boolean): Boolean;
var
  ini_fun : TiniFile;
  stConnectString : string;
  stConnectString1 : string;
  stDBType : string;
  stDBHost : string;
  stDBUserPw : string;
  stDBPort : string;
  stDBUserID : string;
  stDBName : string;
begin
  if DBConnected then Exit;
  result := False;
  CanCel := False;
  L_stExeFolder  := ExtractFileDir(Application.ExeName);
  Try
    ini_fun := TiniFile.Create(L_stExeFolder + '\bms.INI');

    stDBType := UpperCase(ini_fun.ReadString('RelayDBConfig','TYPE','MSSQL'));
    stDBHost  := ini_fun.ReadString('RelayDBConfig','Host','192.168.12.151');
    if stDBType = 'MSSQL' then
    begin
      stDBUserPw := ini_fun.ReadString('RelayDBConfig','UserPW','em@View');
      stDBPort := ini_fun.ReadString('RelayDBConfig','Port','3901');
      stDBUserID := ini_fun.ReadString('RelayDBConfig','UserID','emView');
    end;
    stDBName := lowerCase(ini_fun.ReadString('RelayDBConfig','DBNAME','OPFOOD3'));

    if UpperCase(stDBType) = 'MSSQL' then
    begin
      stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
      stConnectString := stConnectString + 'Password=' + stDBUserPw + ';';
      stConnectString := stConnectString + 'Persist Security Info=True;';
      stConnectString := stConnectString + 'User ID=' + stDBUserID + ';';
      stConnectString := stConnectString + 'Initial Catalog=' + stDBName + ';';
      stConnectString := stConnectString + 'Data Source=' + stDBHost  + ',' + stDBPort;
    end;

    with dmRelayDataBase.ADOConnection do
    begin
      Connected := False;
      Try
        ConnectionString := stConnectString;
        LoginPrompt:= false ;
        Connected := True;
      Except
        on E : EDatabaseError do
          begin
            // ERROR MESSAGE-BOX DISPLAY
            if aMessage then
              ShowMessage(stConnectString + E.Message );
            Exit;
          end;
        else
          begin
            if aMessage then
              ShowMessage('RelayDB Connect Fail' );
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
      //CursorLocation := clUseClient;
    end;
    DBConnected := True;
    result := True;
  Finally
    ini_fun.Free;
  End;

end;

class function TRelayDataBaseConfig.FindSelf: TComponent;
var
  Loop:Integer;
begin
  Result:=Nil;
  for Loop:=0 to Application.ComponentCount-1 do begin
      if Application.Components[Loop] is TRelayDataBaseConfig then begin
          Result:= Application.Components[Loop];
          Break;
      end;
  end;
end;

class function TRelayDataBaseConfig.GetObject: TRelayDataBaseConfig;
begin
   If FindSelf = Nil then TRelayDataBaseConfig.Create(Application);
   Result := TRelayDataBaseConfig(FindSelf);
end;



procedure TRelayDataBaseConfig.SetCancel(const Value: Boolean);
begin
  FCancel := Value;
end;

procedure TRelayDataBaseConfig.SetDBConnected(const Value: Boolean);
begin
  if FDBConnected = Value then Exit;

  FDBConnected := Value;
  if Assigned(FOnAdoConnected) then
  begin
    OnAdoConnected(Self,Value);
  end;
end;

procedure TRelayDataBaseConfig.ShowDataBaseConfig;
begin
  FDBConnected := False;

  fmRelayDataBaseConfig:=TfmRelayDataBaseConfig.Create(Nil);
  Try
    fmRelayDataBaseConfig.ShowModal;
  Finally
    fmRelayDataBaseConfig.Free;
  End;
end;



procedure TfmRelayDataBaseConfig.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
  stDBType : string;
begin
  Try
    if L_stExeFolder = '' then L_stExeFolder := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(L_stExeFolder + '\bms.ini');

    stDBType := UpperCase(ini_fun.ReadString('RelayDBConfig','TYPE','MSSQL'));

    rg_DBType.ItemIndex := 0;

    edServerIP.Text  := ini_fun.ReadString('RelayDBConfig','Host','192.168.12.151');
    edServerPort.Text := ini_fun.ReadString('RelayDBConfig','Port','3901');
    edUserid.Text := ini_fun.ReadString('RelayDBConfig','UserID','emView');
    edPasswd.Text := ini_fun.ReadString('RelayDBConfig','UserPW','em@View');  //saPasswd
    edDataBaseName.Text := lowerCase(ini_fun.ReadString('RelayDBConfig','DBNAME','OPFOOD3'));
  Finally
    ini_fun.Free;
  End;
  rg_DBTypeClick(sender);
end;

procedure TfmRelayDataBaseConfig.rg_DBTypeClick(Sender: TObject);
begin
  if rg_DBType.ItemIndex = MDB then AdvPanel1.Visible := False
  else AdvPanel1.Visible := True;

end;

procedure TfmRelayDataBaseConfig.btn_CloseClick(Sender: TObject);
begin
  TRelayDataBaseConfig.GetObject.Cancel := True;
  Close;
end;

procedure TfmRelayDataBaseConfig.btn_SaveClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  Try
    if L_stExeFolder = '' then L_stExeFolder := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(L_stExeFolder + '\bms.INI');

    if rg_DBType.ItemIndex = 0 then ini_fun.WriteString('RelayDBConfig','TYPE','MSSQL')
    else if rg_DBType.ItemIndex = 1 then ini_fun.WriteString('RelayDBConfig','TYPE','MDB')
    else if rg_DBType.ItemIndex = 2 then ini_fun.WriteString('RelayDBConfig','TYPE','PG')
    else if rg_DBType.ItemIndex = 3 then ini_fun.WriteString('RelayDBConfig','TYPE','FB');

    ini_fun.WriteString('RelayDBConfig','Host',Trim(edServerIP.Text));
    ini_fun.WriteString('RelayDBConfig','Port',Trim(edServerPort.Text));
    ini_fun.WriteString('RelayDBConfig','UserID',Trim(edUserid.Text));
    ini_fun.WriteString('RelayDBConfig','UserPW',Trim(edPasswd.Text));
    ini_fun.WriteString('RelayDBConfig','DBNAME',Trim(edDataBaseName.Text));

  Finally
    ini_fun.Free;
  End;

  TRelayDataBaseConfig.GetObject.DataBaseConnect;
  Close;

end;

end.
