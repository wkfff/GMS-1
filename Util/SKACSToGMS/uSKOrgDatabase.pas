unit uSKOrgDatabase;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,Vcl.Forms,Winapi.Windows,Vcl.Dialogs,ActiveX,
  uCommonVariable;

type
  TdmSKOrgDataBase = class(TDataModule)
    ADOConnection: TADOConnection;
    ADOTempQuery: TADOQuery;
  private
    FOnAdoConnected: TAdoConnectedEvent;
    FCancel: Boolean;
    FDBConnected: Boolean;
    procedure SetCancel(const Value: Boolean);
    procedure SetDBConnected(const Value: Boolean);
    { Private declarations }
    Function TableVersionCheck:Boolean;
  public
    Function DataBaseConnect(aDBType:integer;aDBHost,aDBPort,aDBUserID,aDBUserPw,aDBName:string;aMessage: Boolean):Boolean;
    Function DataBaseDisConnect:Boolean;
    { Public declarations }
  Published
    Property Cancel:Boolean read FCancel write SetCancel;
    Property DBConnected : Boolean read FDBConnected write SetDBConnected;
  Published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;
function SQLConfigDataSource(hwndParent : HWND; fRequest : WORD; lpszDriver : LPCSTR; lpszAttributes : LPCSTR) : Boolean; stdcall; external 'ODBCCP32.DLL';

var
  dmSKOrgDataBase: TdmSKOrgDataBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmSKOrgDataBase }

function TdmSKOrgDataBase.DataBaseConnect(aDBType: integer; aDBHost, aDBPort,
  aDBUserID, aDBUserPw, aDBName: string; aMessage: Boolean): Boolean;
var
  stConnectString : string;
  stDBType : string;
  stExeFolder : string;
begin
  if DBConnected then Exit;
  result := False;
  CanCel := False;
  stExeFolder  := ExtractFileDir(Application.ExeName);
  if aDBType = MSSQL then
  begin
    stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'User ID=' + aDBUserID + ';';
    stConnectString := stConnectString + 'Initial Catalog=' + aDBName + ';';
    stConnectString := stConnectString + 'Data Source=' + aDBHost  + ',' + aDBPort;
  end else if aDBType = POSTGRESQL then
  begin
    stConnectString := 'Provider=PostgreSQL OLE DB Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBHost + ';'   ;
    stConnectString := stConnectString + 'location=' + aDBName + ';';
    stConnectString := stConnectString + 'User Id='+ aDBUserID + ';';
    stConnectString := stConnectString + 'password=' + aDBUserPw;
  end else if aDBType = FIREBIRD then
  begin
    stConnectString := 'Provider=ZStyle IBOLE Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBHost + ':' + aDBName + ';';
    stConnectString := stConnectString + 'UID='+ aDBUserID + ';';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'DIALECT=3;';
  end else //디폴트로 MDB로 인식하자
  begin
    if Not FileExists(G_stExeFolder + '\..\db\SAC.mdb') then
    begin
      ChDir(G_stExeFolder + '\..\db');
      SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=SAC.mdb General'));
    end;

    stConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    stConnectString := stConnectString + 'Data Source=' + G_stExeFolder + '\..\db\SAC.mdb' + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'Jet OLEDB:Database ';
  end;

  with ADOConnection do
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
            ShowMessage('데이터베이스 접속에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    TableVersionCheck;
    //CursorLocation := clUseClient;
  end;

  DBConnected := True;
  result := True;
end;

function TdmSKOrgDataBase.DataBaseDisConnect: Boolean;
begin
  DBConnected := False;
  with ADOConnection do
  begin
    Connected := False;
  end;
end;

procedure TdmSKOrgDataBase.SetCancel(const Value: Boolean);
begin
  FCancel := Value;
end;

procedure TdmSKOrgDataBase.SetDBConnected(const Value: Boolean);
begin
  FDBConnected := Value;
end;

function TdmSKOrgDataBase.TableVersionCheck: Boolean;
begin
//
end;

end.
