unit uDataBaseConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, AdvPanel,
  W7Classes, W7Buttons, Vcl.ImgList,System.iniFiles,Data.DB,Data.Win.ADODB,JclMime,
  ActiveX,uCommonEvent;

type
  TDataBaseConfig = class(TComponent)
  private
    FCancel: Boolean;
    FDBConnected: Boolean;
    class function FindSelf:TComponent;
    procedure SetCancel(const Value: Boolean);
    procedure SetDBConnected(const Value: Boolean);
  private
    FOnAdoConnected: TAdoConnectedEvent;
    function Table_0001_VersionMake:Boolean;
    function Table_0002_VersionMake:Boolean;
    function Table_0003_VersionMake:Boolean;
    function Table_0004_VersionMake:Boolean;
    function Table_0005_VersionMake:Boolean;
    function Table_0006_VersionMake:Boolean;
    function Table_0007_VersionMake:Boolean;
    function Table_0008_VersionMake:Boolean;
    function Table_0009_VersionMake:Boolean;
    function Table_0010_VersionMake:Boolean;
    function Table_0011_VersionMake:Boolean;
    function Table_0012_VersionMake:Boolean;
    function Table_0013_VersionMake:Boolean;
    function Table_0014_VersionMake:Boolean;
    function Table_0015_VersionMake:Boolean;
    function Table_0016_VersionMake:Boolean;
    function Table_0017_VersionMake:Boolean;
    function Table_0018_VersionMake:Boolean;
    function Table_0019_VersionMake:Boolean;
    function Table_0020_VersionMake:Boolean;
    function Table_0021_VersionMake:Boolean;
    function Table_0022_VersionMake:Boolean;
    function Table_0023_VersionMake:Boolean;
    function Table_0024_VersionMake:Boolean;
    function Table_0025_VersionMake:Boolean;
    function Table_0026_VersionMake:Boolean;
    function Table_0027_VersionMake:Boolean;
    function Table_0028_VersionMake:Boolean;
    function Table_0029_VersionMake:Boolean;
    function Table_0030_VersionMake:Boolean;
    function Table_0031_VersionMake:Boolean;
    function Table_0032_VersionMake:Boolean;
    function Table_0033_VersionMake:Boolean;
    function Table_0034_VersionMake:Boolean;
    function Table_0035_VersionMake:Boolean;
    function Table_0036_VersionMake:Boolean;
    function Table_0037_VersionMake:Boolean;
    function Table_0038_VersionMake:Boolean;
    function Table_0039_VersionMake:Boolean;
    function Table_0040_VersionMake:Boolean;
    function Table_0041_VersionMake:Boolean;
    function Table_0042_VersionMake:Boolean;
    function Table_0043_VersionMake:Boolean;
    function Table_0044_VersionMake:Boolean;
    function Table_0045_VersionMake:Boolean;
    function Table_0046_VersionMake:Boolean;
    function Table_0047_VersionMake:Boolean;
    function Table_0048_VersionMake:Boolean;
    function Table_0049_VersionMake:Boolean;
    function Table_0050_VersionMake:Boolean;
    function Table_0051_VersionMake:Boolean;
    function Table_0052_VersionMake:Boolean;
    function Table_0053_VersionMake:Boolean;
    function Table_0054_VersionMake:Boolean;
    function Table_0055_VersionMake:Boolean;
    function Table_0056_VersionMake:Boolean;
    function Table_0057_VersionMake:Boolean;
    function Table_0058_VersionMake:Boolean;
    function Table_0059_VersionMake:Boolean;
    function Table_0060_VersionMake:Boolean;
    function Table_0061_VersionMake:Boolean;
    function Table_0062_VersionMake:Boolean;
    function Table_0063_VersionMake:Boolean;
    function Table_0064_VersionMake:Boolean;
    function Table_0065_VersionMake:Boolean;
    function Table_0066_VersionMake:Boolean;
    function Table_0067_VersionMake:Boolean;
    function Table_0068_VersionMake:Boolean;
    function Table_0069_VersionMake:Boolean;
    function Table_0070_VersionMake:Boolean;
    function Table_0071_VersionMake:Boolean;
  public
    { Public declarations }
    Procedure ShowDataBaseConfig;
    Function DataBaseConnect(aMessage:Boolean=True):Boolean;
    Function DataBaseConnect1(aMessage:Boolean=True):Boolean;
    Function EnCodeTB_ADMIN_PW:Boolean;
    Function TableVersionCheck:Boolean;
    Function GetTableVersion:integer;
    Function DBCreate(aDBHost,aDBPort,aDBUserID,aDBUserPw,aDBName:string;aWindowMode:integer=0):Boolean;
  public
    class Function GetObject:TDataBaseConfig;   //�ڱ��ڽ��� ã�°�  class �� ������������ ��밡��
  Published
    { Published declarations }
    Property Cancel:Boolean read FCancel write SetCancel;
    Property DBConnected : Boolean read FDBConnected write SetDBConnected;
  Published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;

  TfmDataBaseConfig = class(TForm)
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
    { Private declarations }
  public
    { Public declarations }
  end;
function SQLConfigDataSource(hwndParent : HWND; fRequest : WORD; lpszDriver : LPCSTR; lpszAttributes : LPCSTR) : Boolean; stdcall; external 'ODBCCP32.DLL';
var
  fmDataBaseConfig: TfmDataBaseConfig;

implementation
uses
  uCommonVariable,
  uDBCreate,
  uDBFunction,
  uDataBase,
  uDBFormMessage,
  uDBFormName,
  uDBInsert,
  uDBUpdate;

{$R *.dfm}

{ TDataBaseConfig }


function TDataBaseConfig.DataBaseConnect(aMessage: Boolean): Boolean;
var
  ini_fun : TiniFile;
  stConnectString : string;
  stConnectString1 : string;
  stDBType : string;
  nWindowMode : integer;
begin
  if DBConnected then Exit;
  result := False;
  CanCel := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  if G_stEventDataDir = '' then
    G_stEventDataDir := G_stExeFolder + '\LogDB';

  if not DirectoryExists(G_stEventDataDir) then
  begin
   if Not CreateDir(G_stEventDataDir) then
   begin
      G_stEventDataDir := G_stExeFolder;
   end;
  end;

  if not DirectoryExists(G_stExeFolder + '\Temp') then
  begin
    CreateDir(G_stExeFolder + '\Temp');
  end;

  G_stLogDirectory := G_stExeFolder + '\..\log';
  if not DirectoryExists(G_stLogDirectory) then
  begin
   if Not CreateDir(G_stLogDirectory) then
   begin
      G_stLogDirectory := G_stExeFolder;
   end;
  end;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MIAMS.INI');

    stDBType := UpperCase(ini_fun.ReadString('DBConfig','TYPE','MSSQL'));
    G_stDBHost  := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    if stDBType = 'MSSQL' then
    begin
      nWindowMode := ini_fun.ReadInteger('DBConfig','WindowAuth',1);
      G_stDBUserPw := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','c2FwYXNzd2Q='));
      G_stDBPort := ini_fun.ReadString('DBConfig','Port','1433');
      G_stDBUserID := ini_fun.ReadString('DBConfig','UserID','sa');
    end else if stDBType = 'FB' then
    begin
      G_stDBUserPw := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','bWFzdGVya2V5'));  //saPasswd
      G_stDBPort := ini_fun.ReadString('DBConfig','Port','3050');
      G_stDBUserID := ini_fun.ReadString('DBConfig','UserID','SYSDBA');
    end else if stDBType = 'PG' then
    begin
      G_stDBUserPw := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','MQ=='));
      G_stDBPort := ini_fun.ReadString('DBConfig','Port','5432');
      G_stDBUserID := ini_fun.ReadString('DBConfig','UserID','postgres');
    end;
    G_stDBName := lowerCase(ini_fun.ReadString('DBConfig','DBNAME','GMS'));
    G_stGroupCode := ini_fun.ReadString('COMPANY','GROUPCODE','1234567890');

    if UpperCase(stDBType) = 'MSSQL' then G_nDBType := MSSQL
    else if UpperCase(stDBType) = 'PG' then G_nDBType := POSTGRESQL
    else if UpperCase(stDBType) = 'FB' then G_nDBType := FIREBIRD
    else if UpperCase(stDBType) = 'MDB' then G_nDBType := MDB;

    G_nMaxComPort := ini_fun.ReadInteger('RS232','MAXPORT',40);
    G_nCardRegisterPort := ini_fun.ReadInteger('FORM','CardRegisterPort',0);

    DBCreate(G_stDBHost,G_stDBPort,G_stDBUserID,G_stDBUserPw,G_stDBName,nWindowMode);
    if G_nDBType = MSSQL then
    begin
      if nWindowMode = 1 then
      begin
        stConnectString := 'PROVIDER=SQLOLEDB.1;SERVER=localhost;DATABASE=' + G_stDBName + ';TRUSTED_CONNECTION=YES';
      end else
      begin
        stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
        stConnectString := stConnectString + 'Password=' + G_stDBUserPw + ';';
        stConnectString := stConnectString + 'Persist Security Info=True;';
        stConnectString := stConnectString + 'User ID=' + G_stDBUserID + ';';
        stConnectString := stConnectString + 'Initial Catalog=' + G_stDBName + ';';
        stConnectString := stConnectString + 'Data Source=' + G_stDBHost  + ',' + G_stDBPort;
      end;
    end else if G_nDBType = POSTGRESQL then
    begin
      stConnectString := 'Provider=PostgreSQL OLE DB Provider;';
      //(*stConnectString := 'Provider=PostgreSQL.1;';
      stConnectString := stConnectString + 'Data Source=' + G_stDBHost + ';'   ;
      stConnectString := stConnectString + 'location=' + G_stDBName + ';';
      stConnectString := stConnectString + 'User Id='+ G_stDBUserID + ';';
      stConnectString := stConnectString + 'password=' + G_stDBUserPw;
      //*)
      (*
      stConnectString := 'Driver={PostgreSQL ANSI};';
      stConnectString := stConnectString + 'Server=' + G_stDBHost + ';Port=5432;';
      stConnectString := stConnectString + 'Database=' + G_stDBName + ';';
      stConnectString := stConnectString + 'Uid='+ G_stDBUserID + ';';
      stConnectString := stConnectString + 'Pwd=' + G_stDBUserPw + ';';
      *)
      (*
        stConnectString := 'Provider=MSDASQL.1;Persist Security Info=False;';
        stConnectString := stConnectString + 'Extended Properties="DSN=PostgreSQL35;DATABASE=' + G_stDBName + ';';
        stConnectString := stConnectString + 'SERVER=' + G_stDBHost + ';PORT=5432;UID='+ G_stDBUserID + ';PWD=' + G_stDBUserPw + ';SSLmode=disable;';
        stConnectString := stConnectString + 'ReadOnly=0;Protocol=7.4;FakeOidIndex=0;ShowOidColumn=0;';
        stConnectString := stConnectString + 'RowVersioning=0;ShowSystemTables=0;ConnSettings=;Fetch=100;';
        stConnectString := stConnectString + 'Socket=4096;UnknownSizes=0;MaxVarcharSize=255;MaxLongVarcharSize=8190;';
        stConnectString := stConnectString + 'Debug=0;CommLog=0;Optimizer=1;Ksqo=1;UseDeclareFetch=0;TextAsLongVarchar=1;';
        stConnectString := stConnectString + 'UnknownsAsLongVarchar=0;BoolsAsChar=1;Parse=0;CancelAsFreeStmt=0;';
        stConnectString := stConnectString + 'ExtraSysTablePrefixes=dd_;;LFConversion=1;UpdatableCursors=1;';
        stConnectString := stConnectString + 'DisallowPremature=0;TrueIsMinus1=0;BI=0;ByteaAsLongVarBinary=0;UseServerSidePrepare=0;LowerCaseIdentifier=0;XaOpt=1"';
      *)
    (*
    stConnectString := 'Provider=MSDASQL.1;';
    stConnectString := stConnectString + 'User ID=' + G_stDBUserID + ';';
    stConnectString := stConnectString + 'Password=' + G_stDBUserPw + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'Data Source=PostgreSQL31;';
    *)
      //stConnectString := 'Provider=MSDASQL.1;Persist Security Info=False;User ID=postgres;Password=' + G_stDBUserPw + ';Data Source=PostgreSQL31;Initial Catalog=gms;';
      //stConnectString := 'driver={PostgreSQL ODBC};;Database=gms;Host=127.0.0.1;PORT=5432;User Id=postgres;Password=1';
    end else if G_nDBType = FIREBIRD then
    begin
      stConnectString := 'Provider=ZStyle IBOLE Provider;';
      stConnectString := stConnectString + 'Data Source=' + G_stDBHost + ':' + G_stDBName + ';';
      stConnectString := stConnectString + 'UID='+ G_stDBUserID + ';';
      stConnectString := stConnectString + 'Password=' + G_stDBUserPw + ';';
      stConnectString := stConnectString + 'DIALECT=3;';
      //IBOLE.dll ������ ��� �Ұ�
(*      stConnectString := 'Provider=LCPI.IBProvider;';
      //stConnectString := 'Provider=Firebird/InterBase(r) driver;';
      stConnectString := 'DRIVER=Firebird/InterBase(r) driver;';
      //stConnectString := 'DRIVER=XTG Systems InterBase6 ODBC driver;';
      stConnectString := stConnectString + 'DB=' + G_stDBHost + ':' + G_stDBName + ';';
      stConnectString := stConnectString + 'UID='+ G_stDBUserID + ';';
      stConnectString := stConnectString + 'Password=' + G_stDBUserPw + ';';
      stConnectString := stConnectString + 'Auto Commit=true;';
      stConnectString := stConnectString + 'DIALECT=3;';  *)
//      stConnectString := 'DRIVER={XTG Systems InterBase6 ODBC driver};DB=127.0.0.1:BMOS;UID=SYSDBA;Password=masterkey';
    end else //����Ʈ�� MDB�� �ν�����
    begin
      if Not FileExists(G_stExeFolder + '\MIAMS.mdb') then
      begin
        ChDir(G_stExeFolder);
        SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=MIAMS.mdb General'));
      end;

      stConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      stConnectString := stConnectString + 'Data Source=' + G_stExeFolder + '\BMS.mdb' + ';';
      stConnectString := stConnectString + 'Persist Security Info=True;';
      stConnectString := stConnectString + 'Jet OLEDB:Database ';
    end;

    if G_nDBType <> MDB then
    begin
      stConnectString1 := stConnectString;
    end else
    begin
      if Not FileExists(G_stExeFolder + '\MIAMSEVENT.mdb') then
      begin
        ChDir(G_stExeFolder);
        SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=MIAMSEVENT.mdb General'));
      end;
      //MDB ������ �̺�Ʈ DB �� ���� DB�� �����ϱ� ����
      stConnectString1 := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      stConnectString1 := stConnectString1 + 'Data Source=' + G_stExeFolder + '\MIAMSEVENT.mdb' + ';';
      stConnectString1 := stConnectString1 + 'Persist Security Info=True;';
      stConnectString1 := stConnectString1 + 'Jet OLEDB:Database ';
    end;

    with dmDataBase.ADOConnection do
    begin
      Connected := False;
      Try
        ConnectionString := stConnectString;
        LoginPrompt:= false ;
        Connected := True;
        //CommandTimeout := 0;
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
              ShowMessage(dmFormMessage.GetMessage('DBCONNECTFAIL') );
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
      //CursorLocation := clUseClient;
    end;
    (*
    with dmDataBase.ADOEventConnection do
    begin
      Connected := False;
      Try
        ConnectionString := stConnectString1;
        LoginPrompt:= false ;
        Connected := True;
      Except
        on E : EDatabaseError do
          begin
            // ERROR MESSAGE-BOX DISPLAY
            if aMessage then
              ShowMessage(E.Message );
            Exit;
          end;
        else
          begin
            if aMessage then
              ShowMessage('�����ͺ��̽� ���� ����' );
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
      //CursorLocation := clUseClient;
    end;  *)
    if Not TableVersionCheck then Exit;
    dmFormName.FormNameVersionCheck;
    dmFormMessage.FormMessageVersionCheck;

    DBConnected := True;
    dmDataBase.DBConnected := True;
    result := True;
  Finally
    ini_fun.Free;
  End;

end;

function TDataBaseConfig.DataBaseConnect1(aMessage: Boolean): Boolean;
var
  ini_fun : TiniFile;
  stConnectString : string;
  stConnectString1 : string;
  stDBType : string;
  nWindowMode : integer;
begin
  if DBConnected then Exit;
  result := False;
  CanCel := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  if G_stEventDataDir = '' then
    G_stEventDataDir := G_stExeFolder + '\LogDB';

  if not DirectoryExists(G_stEventDataDir) then
  begin
   if Not CreateDir(G_stEventDataDir) then
   begin
      G_stEventDataDir := G_stExeFolder;
   end;
  end;

  if not DirectoryExists(G_stExeFolder + '\Temp') then
  begin
    CreateDir(G_stExeFolder + '\Temp');
  end;

  G_stLogDirectory := G_stExeFolder + '\..\log';
  if not DirectoryExists(G_stLogDirectory) then
  begin
   if Not CreateDir(G_stLogDirectory) then
   begin
      G_stLogDirectory := G_stExeFolder;
   end;
  end;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MIAMS.INI');

    stDBType := UpperCase(ini_fun.ReadString('DBConfig','TYPE','MSSQL'));
    G_stDBHost  := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    if stDBType = 'MSSQL' then
    begin
      nWindowMode := ini_fun.ReadInteger('DBConfig','WindowAuth',1);
      G_stDBUserPw := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','c2FwYXNzd2Q='));
      G_stDBPort := ini_fun.ReadString('DBConfig','Port','1433');
      G_stDBUserID := ini_fun.ReadString('DBConfig','UserID','sa');
    end else if stDBType = 'FB' then
    begin
      G_stDBUserPw := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','bWFzdGVya2V5'));  //saPasswd
      G_stDBPort := ini_fun.ReadString('DBConfig','Port','3050');
      G_stDBUserID := ini_fun.ReadString('DBConfig','UserID','SYSDBA');
    end else if stDBType = 'PG' then
    begin
      G_stDBUserPw := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','MQ=='));
      G_stDBPort := ini_fun.ReadString('DBConfig','Port','5432');
      G_stDBUserID := ini_fun.ReadString('DBConfig','UserID','postgres');
    end;
    G_stDBName := lowerCase(ini_fun.ReadString('DBConfig','DBNAME','GMS'));
    G_stGroupCode := ini_fun.ReadString('COMPANY','GROUPCODE','1234567890');

    if UpperCase(stDBType) = 'MSSQL' then G_nDBType := MSSQL
    else if UpperCase(stDBType) = 'PG' then G_nDBType := POSTGRESQL
    else if UpperCase(stDBType) = 'FB' then G_nDBType := FIREBIRD
    else if UpperCase(stDBType) = 'MDB' then G_nDBType := MDB;

    G_nMaxComPort := ini_fun.ReadInteger('RS232','MAXPORT',40);
    G_nCardRegisterPort := ini_fun.ReadInteger('FORM','CardRegisterPort',0);

    DBCreate(G_stDBHost,G_stDBPort,G_stDBUserID,G_stDBUserPw,G_stDBName,nWindowMode);
    if G_nDBType = MSSQL then
    begin
      if nWindowMode = 1 then
      begin
        stConnectString := 'PROVIDER=SQLOLEDB.1;SERVER=localhost;DATABASE=' + G_stDBName + ';TRUSTED_CONNECTION=YES';
      end else
      begin
        stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
        stConnectString := stConnectString + 'Password=' + G_stDBUserPw + ';';
        stConnectString := stConnectString + 'Persist Security Info=True;';
        stConnectString := stConnectString + 'User ID=' + G_stDBUserID + ';';
        stConnectString := stConnectString + 'Initial Catalog=' + G_stDBName + ';';
        stConnectString := stConnectString + 'Data Source=' + G_stDBHost  + ',' + G_stDBPort;
      end;
    end else if G_nDBType = POSTGRESQL then
    begin
      stConnectString := 'Provider=PostgreSQL OLE DB Provider;';
      stConnectString := stConnectString + 'Data Source=' + G_stDBHost + ';'   ;
      stConnectString := stConnectString + 'location=' + G_stDBName + ';';
      stConnectString := stConnectString + 'User Id='+ G_stDBUserID + ';';
      stConnectString := stConnectString + 'password=' + G_stDBUserPw;
    end else if G_nDBType = FIREBIRD then
    begin
      stConnectString := 'Provider=ZStyle IBOLE Provider;';
      stConnectString := stConnectString + 'Data Source=' + G_stDBHost + ':' + G_stDBName + ';';
      stConnectString := stConnectString + 'UID='+ G_stDBUserID + ';';
      stConnectString := stConnectString + 'Password=' + G_stDBUserPw + ';';
      stConnectString := stConnectString + 'DIALECT=3;';
    end else //����Ʈ�� MDB�� �ν�����
    begin
      if Not FileExists(G_stExeFolder + '\MIAMS.mdb') then
      begin
        ChDir(G_stExeFolder);
        SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=MIAMS.mdb General'));
      end;

      stConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      stConnectString := stConnectString + 'Data Source=' + G_stExeFolder + '\BMS.mdb' + ';';
      stConnectString := stConnectString + 'Persist Security Info=True;';
      stConnectString := stConnectString + 'Jet OLEDB:Database ';
    end;

    if G_nDBType <> MDB then
    begin
      stConnectString1 := stConnectString;
    end else
    begin
      if Not FileExists(G_stExeFolder + '\MIAMSEVENT.mdb') then
      begin
        ChDir(G_stExeFolder);
        SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=MIAMSEVENT.mdb General'));
      end;
      //MDB ������ �̺�Ʈ DB �� ���� DB�� �����ϱ� ����
      stConnectString1 := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      stConnectString1 := stConnectString1 + 'Data Source=' + G_stExeFolder + '\MIAMSEVENT.mdb' + ';';
      stConnectString1 := stConnectString1 + 'Persist Security Info=True;';
      stConnectString1 := stConnectString1 + 'Jet OLEDB:Database ';
    end;

    with dmDataBase.ADOConnection do
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
              ShowMessage(dmFormMessage.GetMessage('DBCONNECTFAIL') );
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
      //CursorLocation := clUseClient;
    end;

    if Not TableVersionCheck then Exit;
    dmFormName.FormNameVersionCheck;
    dmFormMessage.FormMessageVersionCheck;

    DBConnected := True;
    dmDataBase.DBConnected := True;
    result := True;
  Finally
    ini_fun.Free;
  End;
end;

function TDataBaseConfig.DBCreate(aDBHost, aDBPort, aDBUserID, aDBUserPw,
  aDBName: string;aWindowMode:integer=0): Boolean;
var
  stConnectString : string;
  stSql : string;
begin
    if G_nDBType = MSSQL then
    begin
      if aWindowMode = 1 then
      begin
        stConnectString := 'PROVIDER=SQLOLEDB.1;SERVER=localhost;DATABASE=master;TRUSTED_CONNECTION=YES';
      end else
      begin
        stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
        stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
        stConnectString := stConnectString + 'Persist Security Info=True;';
        stConnectString := stConnectString + 'User ID=' + aDBUserID + ';';
        stConnectString := stConnectString + 'Initial Catalog=master;';
        stConnectString := stConnectString + 'Data Source=' + aDBHost  + ',' + aDBPort;
      end;
    end else if G_nDBType = POSTGRESQL then
    begin
      stConnectString := 'Provider=PostgreSQL OLE DB Provider;';
      stConnectString := stConnectString + 'Data Source=' + aDBHost + ';'   ;
      stConnectString := stConnectString + 'location=postgres;';
      stConnectString := stConnectString + 'User Id='+ aDBUserID + ';';
      stConnectString := stConnectString + 'password=' + aDBUserPw;
    end else if G_nDBType = FIREBIRD then
    begin
      Exit;
      //IBOLE.dll ������ ��� �Ұ�
    end else //����Ʈ�� MDB�� �ν�����
    begin
      if Not FileExists(G_stExeFolder + '\BMS.mdb') then
      begin
        ChDir(G_stExeFolder);
        SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=BMS.mdb General'));
      end;
      if Not FileExists(G_stExeFolder + '\BMSEvent.mdb') then
      begin
        ChDir(G_stExeFolder);
        SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=BMSEvent.mdb General'));
      end;
      Exit;
    end;
    with dmDataBase.ADOConnection do
    begin
      Connected := False;
      Try
        ConnectionString := stConnectString;
        LoginPrompt:= false ;
        Connected := True;
      Except
        on E : EDatabaseError do
          begin
            Exit;
          end;
        else
          begin
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
    end;
    stSql := 'Create DataBase ' + aDBName ;
    dmDataBase.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.EnCodeTB_ADMIN_PW: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  stSql := 'select * from TB_ADMIN where AD_ENCODER is null';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;

      while Not Eof do
      begin
        dmDBUpdate.UpdateTB_ADMIN_PW(FindField('AD_USERID').asstring,MimeEncodeString(FindField('AD_USERPW').asstring));
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

class function TDataBaseConfig.FindSelf: TComponent;
var
  Loop:Integer;
begin
  Result:=Nil;
  for Loop:=0 to Application.ComponentCount-1 do begin
      if Application.Components[Loop] is TDataBaseConfig then begin
          Result:= Application.Components[Loop];
          Break;
      end;
  end;
end;

class function TDataBaseConfig.GetObject: TDataBaseConfig;
begin
   If FindSelf = Nil then TDataBaseConfig.Create(Application);
   Result := TDataBaseConfig(FindSelf);
end;

function TDataBaseConfig.GetTableVersion: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''TABLE_VER'' ';
  with dmDataBase.ADOTempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    Try
      result := strtoint(FindField('CO_CONFIGVALUE').AsString);
    Except
      Exit;
    End;
  end;
end;


procedure TDataBaseConfig.SetCancel(const Value: Boolean);
begin
  FCancel := Value;
end;

procedure TDataBaseConfig.SetDBConnected(const Value: Boolean);
begin
  if FDBConnected = Value then Exit;

  FDBConnected := Value;
  if Assigned(FOnAdoConnected) then
  begin
    OnAdoConnected(Self,Value);
  end;

end;

procedure TDataBaseConfig.ShowDataBaseConfig;
begin
  FDBConnected := False;

  fmDataBaseConfig:=TfmDataBaseConfig.Create(Nil);
  Try
    fmDataBaseConfig.ShowModal;
  Finally
    fmDataBaseConfig.Free;
  End;
end;

Function TDataBaseConfig.TableVersionCheck:Boolean;
var
  nTableVersion : integer;
begin
  result := False;
  nTableVersion := GetTableVersion;
  if nTableVersion < 1 then Table_0001_VersionMake;
  if nTableVersion < 2 then Table_0002_VersionMake;
  if nTableVersion < 3 then Table_0003_VersionMake;
  if nTableVersion < 4 then Table_0004_VersionMake;
  if nTableVersion < 5 then Table_0005_VersionMake;
  if nTableVersion < 6 then Table_0006_VersionMake;
  if nTableVersion < 7 then Table_0007_VersionMake;
  if nTableVersion < 8 then Table_0008_VersionMake;
  if nTableVersion < 9 then Table_0009_VersionMake;
  if nTableVersion < 10 then Table_0010_VersionMake;
  if nTableVersion < 11 then Table_0011_VersionMake;
  if nTableVersion < 12 then Table_0012_VersionMake;
  if nTableVersion < 13 then Table_0013_VersionMake;
  if nTableVersion < 14 then Table_0014_VersionMake;
  if nTableVersion < 15 then Table_0015_VersionMake;
  if nTableVersion < 16 then Table_0016_VersionMake;
  if nTableVersion < 17 then Table_0017_VersionMake;
  if nTableVersion < 18 then Table_0018_VersionMake;
  if nTableVersion < 19 then Table_0019_VersionMake;
  if nTableVersion < 20 then Table_0020_VersionMake;
  if nTableVersion < 21 then Table_0021_VersionMake;
  if nTableVersion < 22 then Table_0022_VersionMake;
  if nTableVersion < 23 then Table_0023_VersionMake;
  if nTableVersion < 24 then Table_0024_VersionMake;
  if nTableVersion < 25 then Table_0025_VersionMake;
  if nTableVersion < 26 then Table_0026_VersionMake;
  if nTableVersion < 27 then Table_0027_VersionMake;
  if nTableVersion < 28 then Table_0028_VersionMake;
  if nTableVersion < 29 then Table_0029_VersionMake;
  if nTableVersion < 30 then Table_0030_VersionMake;
  if nTableVersion < 31 then Table_0031_VersionMake;
  if nTableVersion < 32 then Table_0032_VersionMake;
  if nTableVersion < 33 then Table_0033_VersionMake;
  if nTableVersion < 34 then Table_0034_VersionMake;
  if nTableVersion < 35 then Table_0035_VersionMake;
  if nTableVersion < 36 then Table_0036_VersionMake;
  if nTableVersion < 37 then Table_0037_VersionMake;
  if nTableVersion < 38 then Table_0038_VersionMake;
  if nTableVersion < 39 then Table_0039_VersionMake;
  if nTableVersion < 40 then Table_0040_VersionMake;
  if nTableVersion < 41 then Table_0041_VersionMake;
  if nTableVersion < 42 then Table_0042_VersionMake;
  if nTableVersion < 43 then Table_0043_VersionMake;
  if nTableVersion < 44 then Table_0044_VersionMake;
  if nTableVersion < 45 then Table_0045_VersionMake;
  if nTableVersion < 46 then Table_0046_VersionMake;
  if nTableVersion < 47 then Table_0047_VersionMake;
  if nTableVersion < 48 then Table_0048_VersionMake;
  if nTableVersion < 49 then Table_0049_VersionMake;
  if nTableVersion < 50 then Table_0050_VersionMake;
  if nTableVersion < 51 then Table_0051_VersionMake;
  if nTableVersion < 52 then Table_0052_VersionMake;
  if nTableVersion < 53 then Table_0053_VersionMake;
  if nTableVersion < 54 then Table_0054_VersionMake;
  if nTableVersion < 55 then Table_0055_VersionMake;
  if nTableVersion < 56 then Table_0056_VersionMake;
  if nTableVersion < 57 then Table_0057_VersionMake;
  if nTableVersion < 58 then Table_0058_VersionMake;
  if nTableVersion < 59 then Table_0059_VersionMake;
  if nTableVersion < 60 then Table_0060_VersionMake;
  if nTableVersion < 61 then Table_0061_VersionMake;
  if nTableVersion < 62 then Table_0062_VersionMake;
  if nTableVersion < 63 then Table_0063_VersionMake;
  if nTableVersion < 64 then Table_0064_VersionMake;
  if nTableVersion < 65 then Table_0065_VersionMake;
  if nTableVersion < 66 then Table_0066_VersionMake;
  if nTableVersion < 67 then Table_0067_VersionMake;
  if nTableVersion < 68 then Table_0068_VersionMake;
  if nTableVersion < 69 then Table_0069_VersionMake;
  if nTableVersion < 70 then Table_0070_VersionMake;
  if nTableVersion < 71 then Table_0071_VersionMake;

  result := True;
end;

function TDataBaseConfig.Table_0001_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_ACCESSCARDMODE;
  dmDBInsert.InsertIntoTB_ACCESSCARDMODE_All('0','POSITIVE','POSITIVE');
  dmDBInsert.InsertIntoTB_ACCESSCARDMODE_All('1','NEGATIVE','NEGATIVE');
  dmDBInsert.InsertIntoTB_ACCESSCARDMODE_All('2','POSI-ACK','POSI-ACK');
  dmDBInsert.InsertIntoTB_ACCESSCARDMODE_All('3','NEGA-ACK','NEGA-ACK');
  dmDBCreate.CreateTB_ACCESSCONTROLTYPE;
  dmDBInsert.InsertIntoTB_ACCESSCONTROLTYPE_All('B','��ǹ�ư','Button');
  dmDBInsert.InsertIntoTB_ACCESSCONTROLTYPE_All('C','ī��','Card');
  dmDBInsert.InsertIntoTB_ACCESSCONTROLTYPE_All('F','ȭ��߻�','Fire');
  dmDBInsert.InsertIntoTB_ACCESSCONTROLTYPE_All('P','��ȭ','Phone');
  dmDBInsert.InsertIntoTB_ACCESSCONTROLTYPE_All('R','��������','RemoteControl');
  dmDBInsert.InsertIntoTB_ACCESSCONTROLTYPE_All('S','������','Schedule');
  dmDBInsert.InsertIntoTB_ACCESSCONTROLTYPE_All('f','����ȭ��','RemoteFire');
  dmDBCreate.CreateTB_ACCESSDOORMODE;
  dmDBInsert.InsertIntoTB_ACCESSDOORMODE_All('0','����','Door Card Mode');
  dmDBInsert.InsertIntoTB_ACCESSDOORMODE_All('1','������','Door Open Mode');
  dmDBInsert.InsertIntoTB_ACCESSDOORMODE_All('2','�����','Door Lock Mode');
  dmDBCreate.CreateTB_ACCESSEVENT;
  if G_nDBTYPE = MSSQL then dmDBCreate.AlterTB_ACCESSEVENT_CONTROLTYPECODE_LanguageTypeChange;
  dmDBCreate.CreateTB_ACCESSPERMITCODE;
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('0','�ش����','Nothing');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('1','���Խ���','ACCESS');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('2','�������','PATROL');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('3','������','ARM');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('4','��������','DISARM');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('A','�̵��','Not RegistCard');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('B','����ī����ѺҰ�','Not Access Permit');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('C','���ī�����ԺҰ�','Not Patrol Permit');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('D','��������ԺҰ�','Not Access(ARM Mode)');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('E','�������ѽð�','Not Access(Time Over)');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('F','��ȿ�Ⱓ����','Not Access(Date Over)');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('G','����','Attend');
  dmDBCreate.CreateTB_ADMIN;
  dmDBInsert.InsertIntoTB_ADMIN_All('1234','1234','Admin','1','000','0','0','1','0');
  dmDBCreate.CreateTB_ADMINBUILDING;
  dmDBCreate.CreateTB_ADMINDEVICE;
  dmDBCreate.CreateTB_ADMINGRADECODE;
  dmDBCreate.CreateTB_ADMINGRADEPROGRAM;
  dmDBCreate.CreateTB_ADMINWORKLOG;
  dmDBCreate.CreateTB_ALARMDEVICETYPE;
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('**','�ش����');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('AD','�˶�ǥ�ñ�');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('CD','ī�帮��');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('DP','Display(����)');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('DT','��ȭ��ɴܸ���');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('EX','������Ȯ���');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('EL','��Ȯ���');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('JP','����ǥ�ñ�');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('MN','����ġ');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('PC','PC');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('PR','������');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('PT','������');
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('WR','�����߰��');
  dmDBCreate.CreateTB_ALARMEVENT;
  dmDBCreate.CreateTB_ALARMEVENTOPERMODECHANGE;
  dmDBInsert.InsertIntoTB_ALARMEVENTOPERMODECHANGE_All('***RESET**','RS','01');
  dmDBInsert.InsertIntoTB_ALARMEVENTOPERMODECHANGE_All('.KTLinkUs.','00','01');
  dmDBInsert.InsertIntoTB_ALARMEVENTOPERMODECHANGE_All('0000000000','00','02');
  dmDBInsert.InsertIntoTB_ALARMEVENTOPERMODECHANGE_All('ForceRelay','00','03');
  dmDBInsert.InsertIntoTB_ALARMEVENTOPERMODECHANGE_All('ForceBoard','00','04');
  dmDBInsert.InsertIntoTB_ALARMEVENTOPERMODECHANGE_All('RecoveryOK','RO','01');
  dmDBInsert.InsertIntoTB_ALARMEVENTOPERMODECHANGE_All('CtrlCenter','00','01');
  dmDBCreate.CreateTB_ALARMEVENTSTATECODE;
  //dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('00','��庯��','Mode Change','1','1','0','1');  //DeviceType ���� ����.
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('00','��庯��','Mode Change','0','1','0','1');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('AF','AC�ܼ�','AC FAIL','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('AN','AC����','AC Normal','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('BF','DATA FULL','BUFFER FULL','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('CC','������','Controler Cover Close','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('CO','��迭��','Controler Cover Open','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('CR','COLD Reset','COLD Reset','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('DF','DC�����ҷ�','DC FAIL','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('DL','DC�ܼ�','DC Lower','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('DR','DC����','DC Recovery','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('E1','���˶�','Emergency Event','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('EM','���α׷���������','Setting Change','0','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('FI','ȭ��','Fire Event','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('G1','����','Gas Event','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('NF','��Ŵܼ�','Network Fail','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('NR','��ź���','Network Recovery','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('PC','����üũ','Network Check','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('PF','���üũ','Network Check','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('Q1','����','eQuipment Event','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('RS','��⸮��','Device Reset','0','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('WR','Worm Reset','Worm Reset','1','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('S1','1���� ħ��','Z1 trespass','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('S2','2���� ħ��','Z2 trespass','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('S3','3���� ħ��','Z3 trespass','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('S4','4���� ħ��','Z4 trespass','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('S5','5���� ħ��','Z5 trespass','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('S6','6���� ħ��','Z6 trespass','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('S7','7���� ħ��','Z7 trespass','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('S8','8���� ħ��','Z8 trespass','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('SS','ħ�Թ߻�','Zone trespass','0','0','1','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('TP','�������۽���','Control Center Send Fail','0','0','0','0');
  dmDBCreate.CreateTB_ALARMEVENTSTATEGROUP;
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEGROUP_All('1','��Ʈ�ѷ�','Device');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEGROUP_All('2','��庯��','Mode Change');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEGROUP_All('3','�嵥��','Battery');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEGROUP_All('4','����','POWER');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEGROUP_All('5','�˶��̺�Ʈ','Alarm Event');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEGROUP_All('6','������','Data');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEGROUP_All('7','��Ʈ��','Network');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEGROUP_All('8','��񸮼�','Device Reset');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEGROUP_All('9','��Ÿ','ETC');
  dmDBCreate.CreateTB_ALARMEVENTSTATEPCCODE;
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0NF000','����ġ ��Ŵܼ�','MainControler Network Fail','NF','7','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0NR000','����ġ ��Ŵܼ�����','MainControler Network Recovery','NR','7','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0AF000','����ġ AC�ܼ�','MainControler AC Fail','AF','4','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0AN000','����ġ AC����','MainControler AC Recovery','AN','4','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0BF000','����ġ BUFFER FULL','MainControler BUFFER FULL','BF','6','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0CC000','����ġ ������','MainControler Cover Close','CC','1','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0CO000','����ġ ��迭��','MainControler Cover Open','CO','1','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0CR000','����ġ COLD Reset','MainControler COLD Reset','CR','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0DF000','����ġ DC�����ҷ�','MainControler DC FAIL','DF','4','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0DL000','����ġ DC�ܼ�','MainControler DC Lower','DL','4','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0DR000','����ġ DC����','MainControler DC Recovery','DR','4','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0PC000','����ġ ����üũ','MainControler Network Check','PC','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0PF000','����ġ ���üũ','MainControler Network Check','PF','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MN0WR000','����ġ Worm Reset','MainControler Worm Reset','WR','8','0','1','1',inttostr(clFuchsia));
(*  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MNA00000','����庯��(ī��)','Arm Mode Change(CARD)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MND00000','������庯��(ī��)','DisArm Mode Change(CARD)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MNA00010','����庯��(����)','Arm Mode Change(Remote)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MND00010','������庯��(����)','DisArm Mode Change(Remote)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MNA00020','����庯��(PC)','Arm Mode Change(PC)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MND00020','������庯��(PC)','DisArm Mode Change(PC)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MNA00030','����庯��(����)','Arm Mode Change(Relay)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MND00030','������庯��(����)','DisArm Mode Change(Relay)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MNA00040','����庯��(���)','Arm Mode Change(Device)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MND00040','������庯��(���)','DisArm Mode Change(Device)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MNARS010','����ġ ����(���)','MainControler RESET(ARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MNDRS010','����ġ ����(����)','MainControler RESET(DisARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MNARO010','������ư(���)','RecoveryButton(ARM)','00','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('MNDRO010','������ư(����)','RecoveryButton(DisARM)','00','9','0','1','0',inttostr(clWhite));
*)

  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0NF000','������Ȯ��� ��Ŵܼ�','ExtentionControler Network Fail','NF','7','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0NR000','������Ȯ��� ��Ŵܼ�����','ExtentionControler Network Recovery','NR','7','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0AF000','������Ȯ��� AC�ܼ�','ExtentionControler AC Fail','AF','4','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0AN000','������Ȯ��� AC����','ExtentionControler AC Recovery','AN','4','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0BF000','������Ȯ��� BUFFER FULL','ExtentionControler BUFFER FULL','BF','6','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0CC000','������Ȯ��� ������','ExtentionControler Cover Close','CC','1','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0CO000','������Ȯ��� ��迭��','ExtentionControler Cover Open','CO','1','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0CR000','������Ȯ��� COLD Reset','ExtentionControler COLD Reset','CR','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0DF000','������Ȯ��� DC�����ҷ�','ExtentionControler DC FAIL','DF','4','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0DL000','������Ȯ��� DC�ܼ�','ExtentionControler DC Lower','DL','4','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0DR000','������Ȯ��� DC����','ExtentionControler DC Recovery','DR','4','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0PC000','������Ȯ��� ����üũ','MainControler Network Check','PC','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0PF000','������Ȯ��� ���üũ','ExtentionControler Network Check','PF','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EX0WR000','����ġ Worm Reset','MainControler Worm Reset','WR','8','0','1','1',inttostr(clFuchsia));
(*  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXA00000','����庯��(ī��)','Arm Mode Change(CARD)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXD00000','������庯��(ī��)','DisArm Mode Change(CARD)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXA00010','����庯��(����)','Arm Mode Change(Remote)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXD00010','������庯��(����)','DisArm Mode Change(Remote)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXA00020','����庯��(PC)','Arm Mode Change(PC)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXD00020','������庯��(PC)','DisArm Mode Change(PC)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXA00030','����庯��(����)','Arm Mode Change(Relay)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXD00030','������庯��(����)','DisArm Mode Change(Relay)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXA00040','����庯��(���)','Arm Mode Change(Device)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXD00040','������庯��(���)','DisArm Mode Change(Device)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXARS010','������Ȯ��� ����(���)','ExtentionControler RESET(ARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXDRS010','������Ȯ��� ����(����)','ExtentionControler RESET(DisARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXARO010','������ư(���)','RecoveryButton(ARM)','00','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EXDRO010','������ư(����)','RecoveryButton(DisARM)','00','9','0','1','0',inttostr(clWhite));
*)

  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('CD0NF000','ī�帮�� ��Ŵܼ�','CardReader Network Fail','NF','7','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('CD0NR000','ī�帮�� ��Ŵܼ�����','CardReader Network Recovery','NR','7','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('CD0CC000','ī�帮�� ������','CardReader Cover Close','CC','1','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('CD0CO000','ī�帮�� ��迭��','CardReader Cover Open','CO','1','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('CD0CR000','ī�帮�� COLD Reset','CardReader COLD Reset','CR','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('CD0WR000','ī�帮�� Worm Reset','CardReader Worm Reset','WR','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('CDARS010','ī�帮�� ����(���)','CardReader RESET(ARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('CDDRS010','ī�帮�� ����(����)','CardReader RESET(DisARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('CDARO010','������ư(���)','RecoveryButton(ARM)','00','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('CDDRO010','������ư(����)','RecoveryButton(DisARM)','00','9','0','1','0',inttostr(clWhite));

  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EL0NF000','��Ȯ��� ��Ŵܼ�','ZoneExtention Network Fail','NF','7','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EL0CR000','��Ȯ��� COLD Reset','ZoneExtention COLD Reset','CR','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('EL0WR000','��Ȯ��� Worm Reset','ZoneExtention Worm Reset','WR','8','0','1','1',inttostr(clFuchsia));
(*  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELA00000','����庯��(ī��)','Arm Mode Change(CARD)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELD00000','������庯��(ī��)','DisArm Mode Change(CARD)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELA00010','����庯��(����)','Arm Mode Change(Remote)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELD00010','������庯��(����)','DisArm Mode Change(Remote)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELA00020','����庯��(PC)','Arm Mode Change(PC)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELD00020','������庯��(PC)','DisArm Mode Change(PC)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELA00030','����庯��(����)','Arm Mode Change(Relay)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELD00030','������庯��(����)','DisArm Mode Change(Relay)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELA00040','����庯��(���)','Arm Mode Change(Device)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELD00040','������庯��(���)','DisArm Mode Change(Device)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELARS010','��Ȯ��� ����(���)','ZoneExtention RESET(ARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELDRS010','��Ȯ��� ����(����)','ZoneExtention RESET(DisARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELARO010','������ư(���)','RecoveryButton(ARM)','00','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('ELDRO010','������ư(����)','RecoveryButton(DisARM)','00','9','0','1','0',inttostr(clWhite));
*)

(*
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**A00000','����庯��(ī��)','Arm Mode Change(CARD)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**D00000','������庯��(ī��)','DisArm Mode Change(CARD)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**A00010','����庯��(����)','Arm Mode Change(Remote)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**D00010','������庯��(����)','DisArm Mode Change(Remote)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**A00020','����庯��(PC)','Arm Mode Change(PC)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**D00020','������庯��(PC)','DisArm Mode Change(PC)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**A00030','����庯��(����)','Arm Mode Change(Relay)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**D00030','������庯��(����)','DisArm Mode Change(Relay)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**A00040','����庯��(���)','Arm Mode Change(Device)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**D00040','������庯��(���)','DisArm Mode Change(Device)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**ARS010','����ġ ����(���)','MainControler RESET(ARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**DRS010','����ġ ����(����)','MainControler RESET(DisARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**ARO010','������ư(���)','RecoveryButton(ARM)','00','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('**DRO010','������ư(����)','RecoveryButton(DisARM)','00','9','0','1','0',inttostr(clWhite));
*)
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00A00000','����庯��(ī��)','Arm Mode Change(CARD)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00D00000','������庯��(ī��)','DisArm Mode Change(CARD)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00A00010','����庯��(����)','Arm Mode Change(Remote)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00D00010','������庯��(����)','DisArm Mode Change(Remote)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00A00020','����庯��(PC)','Arm Mode Change(PC)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00D00020','������庯��(PC)','DisArm Mode Change(PC)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00A00030','����庯��(����)','Arm Mode Change(Relay)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00D00030','������庯��(����)','DisArm Mode Change(Relay)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00A00040','����庯��(���)','Arm Mode Change(Device)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00D00040','������庯��(���)','DisArm Mode Change(Device)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00ARS010','����ġ ����(���)','MainControler RESET(ARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00DRS010','����ġ ����(����)','MainControler RESET(DisARM)','00','8','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00ARO010','������ư(���)','RecoveryButton(ARM)','00','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00DRO010','������ư(����)','RecoveryButton(DisARM)','00','9','0','1','0',inttostr(clWhite));

  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000E1000','���˶� ����','Emergency Recovery','E1','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000E1001','���˶� �߻�','Emergency Event','E1','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000FI000','ȭ�� ����','Fire Recovery','FI','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000FI001','ȭ�� �߻�','Fire Event','FI','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000G1000','���� ����','Gas Recovery','G1','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000G1001','���� �߻�','Gas Event','G1','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000Q1000','�����̻� ����','eQuipment Recovery','Q1','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000Q1001','�����̻� �߻�','eQuipment Event','Q1','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S1000','1���� ����','Z1 trespass Recovery','S1','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S1001','1���� ħ���̻� �߻�','Z1 trespass Event','S1','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S2000','2���� ����','Z2 trespass Recovery','S2','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S2001','2���� ħ���̻� �߻�','Z2 trespass Event','S2','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S3000','3���� ����','Z3 trespass Recovery','S3','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S3001','3���� ħ���̻� �߻�','Z3 trespass Event','S3','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S4000','4���� ����','Z4 trespass Recovery','S4','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S4001','4���� ħ���̻� �߻�','Z4 trespass Event','S4','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S5000','5���� ����','Z5 trespass Recovery','S5','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S5001','5���� ħ���̻� �߻�','Z5 trespass Event','S5','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S6000','6���� ����','Z6 trespass Recovery','S6','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S6001','6���� ħ���̻� �߻�','Z6 trespass Event','S6','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S7000','7���� ����','Z7 trespass Recovery','S7','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S7001','7���� ħ���̻� �߻�','Z7 trespass Event','S7','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S8000','8���� ����','Z8 trespass Recovery','S8','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000S8001','8���� ħ���̻� �߻�','Z8 trespass Event','S8','5','0','1','1',inttostr(clFuchsia));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000SS000','�� ����','trespass Recovery','SS','5','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000SS001','�� ħ���̻� �߻�','trespass Event','SS','5','0','1','1',inttostr(clFuchsia));

  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000EM000','���α׷���������','Setting Change','EM','9','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000RS000','��⸮��','Device Reset','RS','8','0','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000TP000','�������۽���','Control Center Send Fail','TP','9','0','1','0',inttostr(clWhite));

  dmDBCreate.CreateTB_ALARMMODECODE;
  dmDBInsert.InsertIntoTB_ALARMMODECODE_All('A','�����','Arm Mode');
  dmDBInsert.InsertIntoTB_ALARMMODECODE_All('D','�������','DisArm Mode');
  dmDBInsert.InsertIntoTB_ALARMMODECODE_All('N','�˼�����','Nothing Mode');
  dmDBCreate.CreateTB_ALARMPORTSTATE;
  dmDBInsert.InsertIntoTB_ALARMPORTSTATE_All('P','����','Open');
  dmDBInsert.InsertIntoTB_ALARMPORTSTATE_All('S','��Ʈ','Short');
  dmDBInsert.InsertIntoTB_ALARMPORTSTATE_All('N','����','Normal');
  dmDBCreate.CreateTB_ARMAREA;
  dmDBCreate.CreateTB_ATTENDCODE;
  dmDBInsert.InsertIntoTB_ATTENDCODE_VALUE('1','1','��ñٹ���','0400','0900','1800','0500','1800','','','','','','','','','','','','','','','','','','','','',
             '','','','','','','','','','','','','','','');
  dmDBInsert.InsertIntoTB_ATTENDCODE_VALUE('2','1','1����','2400','0900','1800','0000','1200','','','','','','','','','','','','','','','','','','','','',
             '','','','','','','','','','','','','','','');
  dmDBInsert.InsertIntoTB_ATTENDCODE_VALUE('2','2','2����','1200','1800','0900','1300','2400','','','','','','','','','','','','','','','','','','','','',
             '','','','','','','','','','','','','','','');
  dmDBCreate.CreateTB_ATTENDEVENT;
  dmDBCreate.CreateTB_ATTENDEVENTLIST;
  dmDBCreate.CreateTB_ATTENDINOUTCODE;
  dmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value('1','1','1','���','1');
  dmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value('2','1','2','����','1');
  dmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value('3','1','3','���','1');
  dmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value('4','1','4','�������','1');
  dmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value('11','2','1','���','1');
  dmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value('12','2','2','����','1');
  dmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value('13','2','3','����ٹ�','1');
  dmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value('14','2','4','�߱�','1');
  dmDBCreate.CreateTB_ATTENDPOSITION;
  dmDBInsert.InsertIntoTB_ATTENDPOSITION_VALUE('1','������Ʈ', '0', '1', '2', '0', '3', '4');
  dmDBInsert.InsertIntoTB_ATTENDPOSITION_VALUE('2','ī�帮��', '1', '1', '2', '1', '3', '4');
  dmDBInsert.InsertIntoTB_ATTENDPOSITION_VALUE('3','��ư', '1', '1', '2', '2', '4', '5');
  dmDBCreate.CreateTB_ATTENDWORKTYPE;
  dmDBInsert.InsertIntoTB_ATTENDWORKTYPE_VALUE('1', '��ñٹ���','0', '0', '0');
  dmDBInsert.InsertIntoTB_ATTENDWORKTYPE_VALUE('2', '����ٹ���','0', '0', '0');
  dmDBCreate.CreateTB_BMSCONFIG;
  dmDBInsert.InsertIntoTB_BMSCONFIG_All('BMS','LASTBACKUP','','�����������');
  dmDBInsert.InsertIntoTB_BMSCONFIG_All('BMS','DEVICESORT','','ī�嵥����������Ʈ����');
  dmDBInsert.InsertIntoTB_BMSCONFIG_All('BMS','PASSWORD','1234','BMS�α��κ�й�ȣ');
//  dmDBInsert.InsertIntoTB_BMSCONFIG_All('BMS','FINGERCARD','2222222222','����ī���ȣ');
  dmDBCreate.CreateTB_BUILDINGCODE;
  dmDBCreate.CreateTB_BUILDINGMAP;
  dmDBInsert.InsertIntoTB_BUILDINGCODE_All('0','Building','0','1','1'); //������ġ�ڵ�� ��ȸ ���� �ʱ� ���� �κж����� ���Ƿ� ������
  dmDBCreate.CreateTB_CARD;
  dmDBCreate.CreateTB_CARDFTPDOWNLIST;
  dmDBCreate.CreateTB_CARDGUBUN;
  dmDBInsert.InsertIntoTB_CARDGUBUN_All('0','��������','1');
  dmDBInsert.InsertIntoTB_CARDGUBUN_All('1','�Ϲ�ī��','0');
  dmDBCreate.CreateTB_CARDHIS;
  dmDBCreate.CreateTB_CARDPERMIT;
  dmDBCreate.CreateTB_CARDPERMITCOMPANYGROUP;
  dmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE;
  dmDBCreate.CreateTB_CARDPERMITEMPLOYEEGROUP;
  dmDBCreate.CreateTB_CARDSTATE;
  dmDBInsert.InsertIntoTB_CARDSTATE_All('1','���','Normal Card');
  dmDBInsert.InsertIntoTB_CARDSTATE_All('2','�н�','Lost Card');
  dmDBInsert.InsertIntoTB_CARDSTATE_All('3','����','Stop Card');
  dmDBCreate.CreateTB_CCTV;
  dmDBCreate.CreateTB_CLIENTSOCKET;
  dmDBCreate.CreateTB_COMPANYCODE;
  dmDBInsert.InsertIntoTB_COMPANYCODE_All('0','Company','0','1','1'); //����ȸ���ڵ�� ��ȸ ���� �ʱ� ���� �κж����� ���Ƿ� ������
  dmDBCreate.CreateTB_COMPANYCODEHIS;
  dmDBCreate.CreateTB_CONFIG;
  dmDBInsert.InsertIntoTB_CONFIG_All('ATTEND','WORKTIME','','�����۾��ð�');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARD','DEFAULTGRADEGROUP','1','1.ȸ�纰����,2.�׷캰����,3.���κ�����');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARD','DEFAULTDOORPERMITTYPE','2','1.��ü����,2.��ü���Ѿ���');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARD','DEFAULTARMPERMITTYPE','2','1.��ü����,2.��ü���Ѿ���');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARD','EMPLOYEESEARCH','1','1.�ٷΰ˻�(���뷮),2.�̺�Ʈ�ð˻�(��뷮)');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','TABLE_VER','1','���̺� ��������');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','ACEVENT','0','0.��ü�̷�,1.ī���̺�Ʈ��');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','CAPOSINUM','0','0.ī����ġ�̻��,1.ī����ġ���');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','CARDNOTYPE','0','0.4Byte,1.16BYTE,2.KT���');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','CARDNUM','0','0.����Ÿ��,1.HEXŸ�� - 4Byte�� �ش�');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','DAEMON_VER','0','�������');
//  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','FORMNAMEVER','1','�����̺�����');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','LANGUAGE','1','1.KOR,2.ENG');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','COMPANYCODELENGTH','3','ȸ���ڵ����');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','BUILDINGCODELENGTH','3','�����ڵ����');
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','ALARMLEN','10','����ī�����');
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','DEVICESERVERPORT','3000','��⼭����Ʈ');
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','FTPPORT','3100','FTP��Ʈ');
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','SERVERIP','127.0.0.1','����IP');
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','CONTROLPORT','5101','Control��Ʈ');
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','LONGTIMECD','LT','��ð������� �˶��߻��ڵ�');
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','USEARMLEN','FALSE','����ī�尡����������');
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','CARDAUTODOWNLOAD','TRUE','ī���ڵ��ٿ�ε�');
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','SCHDEVICE','0','0.��Ʈ�ѷ�������,1.PC������');
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','HOLIDAYSENDYEAR','','�����ϵ����� ���۳��');
  dmDBInsert.InsertIntoTB_CONFIG_All('DATABASE','AC_DELETE','360','�����̺�Ʈ������');
  dmDBInsert.InsertIntoTB_CONFIG_All('DATABASE','AT_DELETE','360','�����̺�Ʈ������');
  dmDBInsert.InsertIntoTB_CONFIG_All('DATABASE','FD_DELETE','360','�ļ��̺�Ʈ������');
  dmDBInsert.InsertIntoTB_CONFIG_All('DATABASE','PT_DELETE','360','����̺�Ʈ������');
  dmDBInsert.InsertIntoTB_CONFIG_All('DATABASE','AUTO','TRUE','�ڵ��������');
  dmDBInsert.InsertIntoTB_CONFIG_All('DATABASE','BACKCYCLE','10','�����ͺ��̽�����ֱ�');
  if G_nDBType = POSTGRESQL then dmDBInsert.InsertIntoTB_CONFIG_All('DATABASE','BACKDIR','c:\\Backup','�����ͺ��̽�������丮')
  else dmDBInsert.InsertIntoTB_CONFIG_All('DATABASE','BACKDIR','c:\Backup','�����ͺ��̽�������丮');
  dmDBInsert.InsertIntoTB_CONFIG_All('DATABASE','BACKTIME','0100','������� �ð�');
  //dmDBInsert.InsertIntoTB_CONFIG_All('FIRE','FIREOPEN','0','ȭ�簨������ü����0.�̻��,1.���');
  dmDBInsert.InsertIntoTB_CONFIG_All('MONITORING','MAPTYPE','1','0.���,1.���+����');
  dmDBInsert.InsertIntoTB_CONFIG_All('MONITORING','MAPBUILDING','1','0.����������,1.�����ʹ�����');
  dmDBInsert.InsertIntoTB_CONFIG_All('RELAY','FINGERRELAYUSE','0','����������������0.�̻��,1.���');
  dmDBInsert.InsertIntoTB_CONFIG_All('RELAY','EMPLOYEETYPE','0','�����������0.�̻��,1.�泲');
  dmDBInsert.InsertIntoTB_CONFIG_All('REPORT','SEARCHTYPE','1','1.�ٷΰ˻�,2.��ȸ��ư�� �˻�');
  dmDBCreate.CreateTB_DEVICE;
  dmDBCreate.CreateTB_DEVICERCV;
  dmDBCreate.CreateTB_DOOR;
  dmDBCreate.CreateTB_DOORGUBUN;
  dmDBInsert.InsertIntoTB_DOORGUBUN_Value('1','���Թ�����1');
  dmDBInsert.InsertIntoTB_DOORGUBUN_Value('2','���Թ�����2');
  dmDBCreate.CreateTB_DOORRCV;
  dmDBCreate.CreateTB_DOORSCHEDULE;
  dmDBCreate.CreateTB_EMPLOYEE;
  dmDBCreate.CreateTB_EMPLOYEEDEVICETIMECODE;
  dmDBCreate.CreateTB_EMPLOYEEFINGER;
  dmDBCreate.CreateTB_EMPLOYEEGROUPCODE;
  dmDBInsert.InsertIntoTB_EMPLOYEEGROUPCODE_All('0','Group','0','1','1'); //���ʱ׷��ڵ�� ��ȸ ���� �ʱ� ���� �κж����� ���Ƿ� ������
  dmDBCreate.CreateTB_EMPLOYEEGUBUN;
  dmDBInsert.InsertIntoTB_EMPLOYEEGUBUN_Value('1','������','1');
  dmDBInsert.InsertIntoTB_EMPLOYEEGUBUN_Value('2','��������','2');
  dmDBCreate.CreateTB_EMPLOYEEHIS;
  dmDBCreate.CreateTB_EMPLOYEESTATECODE;
  dmDBInsert.InsertIntoTB_EMPLOYEESTATECODE_Value('1','����','1');
  dmDBInsert.InsertIntoTB_EMPLOYEESTATECODE_Value('2','����','2');
  dmDBCreate.CreateTB_FINGERDEVICE;
  dmDBCreate.CreateTB_FINGERDEVICECARD;
  dmDBCreate.CreateTB_FIREGROUP;
  dmDBInsert.InsertIntoTB_FIREGROUP_All('001','ȭ��׷�'); //��ü�׷�
  dmDBCreate.CreateTB_FORMMESSAGE;
  dmDBCreate.CreateTB_FORMNAME;
  dmDBCreate.CreateTB_HOLIDAY;
  dmDBFunction.DefaultHolidayCreate;
  dmDBCreate.CreateTB_HOLIDAYDEVICE;
  dmDBCreate.CreateTB_NODE;
  dmDBCreate.CreateTB_NODERCV;
  dmDBCreate.CreateTB_POSICODE;
  dmDBCreate.CreateTB_READER;
  dmDBCreate.CreateTB_READERBUILDINGPOSITIONCODE;
  dmDBInsert.InsertIntoTB_READERBUILDINGPOSITIONCODE_All('0','�ǹ�����','Inside Building');
  dmDBInsert.InsertIntoTB_READERBUILDINGPOSITIONCODE_All('1','�ǹ��ܺ�','Outside Building');
  dmDBCreate.CreateTB_READERDOORPOSITIONCODE;
  dmDBInsert.InsertIntoTB_READERDOORPOSITIONCODE_All('0','���Թ�����','Inside Door');
  dmDBInsert.InsertIntoTB_READERDOORPOSITIONCODE_All('1','���Թ��ܺ�','Outside Door');
  dmDBCreate.CreateTB_READERRCV;
  dmDBCreate.CreateTB_SETTINGINFO;
  dmDBCreate.CreateTB_SYSTEMLOG;
  dmDBCreate.CreateTB_TIMECODE;
  dmDBInsert.InsertIntoTB_TIMECODE_CodeInit('0','0');
  dmDBInsert.InsertIntoTB_TIMECODE_CodeInit('0','1');
  dmDBCreate.CreateTB_TIMECODEDEVICE;
  dmDBCreate.CreateTB_ZONE;
  dmDBCreate.CreateTB_ZONEEXTENTION;
  dmDBCreate.CreateTB_ZONEEXTENTIONRCV;
  dmDBCreate.CreateTB_ZONERCV;

end;

function TDataBaseConfig.Table_0002_VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set EM_FINGERUSE = ''1'' ';
  result := dmDataBase.ProcessExecSQL(stSql);  //��ü �����͸� ����������� ó�� ����.

  dmDBInsert.InsertIntoTB_CONFIG_All('RELAY','FINGERDELETEUSE','0','0.üũ������ �������� ���� ����,1.��������������');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','2');
end;

function TDataBaseConfig.Table_0003_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('FIRE','USEFIREOPEN','0','0.ȭ�翬������,1.ȭ�翬����');
  dmDBInsert.InsertIntoTB_CONFIG_All('FIRE','STATECODE','FI','');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','3');

end;

function TDataBaseConfig.Table_0004_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_FOODCODE;
  dmDBInsert.InsertIntoTB_FOODCODE_Value('1','1','����','0600','1059','5000','1059');
  dmDBInsert.InsertIntoTB_FOODCODE_Value('1','2','�߽�','1100','1459','5000','1459');
  dmDBInsert.InsertIntoTB_FOODCODE_Value('1','3','����','1300','1959','5000','1959');
  dmDBInsert.InsertIntoTB_FOODCODE_Value('1','4','�߽�','2000','2359','5000','2359');
  dmDBCreate.CreateTB_FOODEVENT;
  dmDBCreate.CreateTB_FOODTYPE;
  dmDBInsert.InsertIntoTB_FOODTYPE_Value('1','�ļ�Ÿ��');
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','4');
end;

function TDataBaseConfig.Table_0005_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('ATTEND','USE','1','');
  dmDBInsert.InsertIntoTB_CONFIG_All('FOOD','USE','0','');
  dmDBInsert.InsertIntoTB_CONFIG_All('FOOD','WORKTIME','','');
  dmDBInsert.InsertIntoTB_CONFIG_All('FOOD','DUPEVENT','1','');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','5');
end;

function TDataBaseConfig.Table_0006_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','ATAUTO','1','');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','FDAUTO','1','');

  dmDBCreate.AlterTB_DOOR_ATType_Add;
  dmDBCreate.AlterTB_DOOR_FDType_Add;
  dmDBUpdate.UpdateTB_DOOR_AllField_StringValue('DO_ATTYPE','0');
  dmDBUpdate.UpdateTB_DOOR_AllField_StringValue('DO_FDTYPE','0');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','6');
end;

function TDataBaseConfig.Table_0007_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value('21','3','1','����','1');
  dmDBInsert.InsertIntoTB_ATTENDINOUTCODE_Value('22','4','1','����','1');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','7');
end;

function TDataBaseConfig.Table_0008_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','LONGTIMEALARMUSE','1','��ð����� ��� ����');
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('DAEMON','LONGTIMECD','CO_CONFIGVALUE','LT');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('LT','��ð����Թ�����','LongTime OpenDoor','0','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000LT000','��ð����Թ�����','LongTime OpenDoor','LT','9','0','1','0',inttostr(clWhite));

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','8');

end;

function TDataBaseConfig.Table_0009_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','CARDGRADE','1','0.���ѹ̵��,1.���ѵ��');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','9');
end;

function TDataBaseConfig.Table_0010_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_NODE_MEMLOAD_Add ;
  dmDBUpdate.UpdateTB_NODE_AllMemLoadInit('N');
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','10');
end;

function TDataBaseConfig.Table_0011_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_EMPLOYEE_EMNAME_Change ;
  dmDBCreate.AlterTB_COMPANYCODE_CompanyNAME_Change ;
  dmDBCreate.AlterTB_EMPLOYEEHIS_EMNAME_Change;
  dmDBCreate.AlterTB_ACCESSEVENT_EMNAME_Change;
  dmDBCreate.AlterTB_ATTENDEVENT_EMNAME_Change;
  dmDBCreate.AlterTB_ATTENDEVENTLIST_EMNAME_Change;
  dmDBCreate.AlterTB_FOODEVENT_EMNAME_Change;


  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','11');

end;

function TDataBaseConfig.Table_0012_VersionMake: Boolean;
var
  stSql : string;
begin
  dmDBCreate.AlterTB_FOODTYPE_YesterDayTime_Add ;

  stSql := ' Update TB_FOODTYPE set FT_YESTERDAYTIME = ''0400'' ';
  dmDataBase.ProcessExecSQL(stSql);

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','12');
end;

function TDataBaseConfig.Table_0013_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_FOODOUTCOUNT ;
  dmDBCreate.AlterTB_FOODCODE_InitTime_Add ; //��ı����� Initial �� �ð�

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','13');
end;

function TDataBaseConfig.Table_0014_VersionMake: Boolean;
var
  stSql : string;
begin
  dmDBCreate.AlterTB_Reader_BuildingCode_Add ; //��ı����� Initial �� �ð�

  stSql := ' Update TB_READER set BC_BUILDINGCODE = ''0'' ';
  dmDataBase.ProcessExecSQL(stSql);

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','14');
end;

function TDataBaseConfig.Table_0015_VersionMake: Boolean;
var
  stSql : string;
begin
  dmDBCreate.AlterTB_FORMNAME_NAME3_Add;
  stSql := ' Update TB_FORMNAME set FN_NAME3 = FN_NAME1 ';
  dmDataBase.ProcessExecSQL(stSql);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','15');
end;

function TDataBaseConfig.Table_0016_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_BUILDINGCODE_BUILDINGNAME_Change ;
  dmDBCreate.AlterTB_EMPLOYEEGROUPCODE_GROUPCODENAME_Change ;
  dmDBCreate.AlterTB_HOLIDAY_HONAME3_Add ;
  dmDBCreate.AlterTB_HOLIDAY_HONAME_Change ;
  dmDBCreate.AlterTB_POSICODE_POSICODENAME_Change ;
  dmDBCreate.AlterTB_EMPLOYEEGUBUN_GUBUNCODENAME_Change ;
  dmDBCreate.AlterTB_DOOR_DOORNAME_Change ;
  dmDBCreate.AlterTB_ArmArea_ARMAREANAME_Change ;
  dmDBCreate.AlterTB_ZONE_ZONENAME_Change ;


  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','16');
end;

function TDataBaseConfig.Table_0017_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_ACCESSDOORMODE_DOORMODENAME3_Add ;
  dmDBCreate.AlterTB_ACCESSDOORMODE_DOORMODENAME_Change ;
  dmDBCreate.AlterTB_ACCESSCONTROLTYPE_CONTROLTYPECODENAME3_Add ;
  dmDBCreate.AlterTB_ACCESSCONTROLTYPE_CONTROLTYPECODENAME_Change ;
  dmDBCreate.AlterTB_ACCESSCARDMODE_CARDMODENAME3_Add ;
  dmDBCreate.AlterTB_ACCESSCARDMODE_CARDMODENAME_Change ;
  dmDBCreate.AlterTB_ACCESSPERMITCODE_PERMITCODENAME3_Add ;
  dmDBCreate.AlterTB_ACCESSPERMITCODE_PERMITCODENAME_Change ;
  dmDBCreate.AlterTB_ADMINGRADECODE_GRADECODENAME_Change ;
  dmDBCreate.AlterTB_ADMIN_USERNAME_Change ;
  dmDBCreate.AlterTB_ALARMDEVICETYPE_ALARMDEVICETYPENAME_Change ;
  dmDBCreate.AlterTB_ALARMEVENTSTATECODE_EVENTSTATECODENAME3_Add ;
  dmDBCreate.AlterTB_ALARMEVENTSTATECODE_EVENTSTATECODENAME_Change ;
  dmDBCreate.AlterTB_ALARMEVENTSTATEGROUP_NAME3_Add ;
  dmDBCreate.AlterTB_ALARMEVENTSTATEGROUP_NAME_Change ;
  dmDBCreate.AlterTB_ALARMEVENTSTATEPCCODE_EVENTSTATEPCCODENAME3_Add ;
  dmDBCreate.AlterTB_ALARMEVENTSTATEPCCODE_EVENTSTATEPCCODENAME_Change ;
  dmDBCreate.AlterTB_ALARMMODECODE_ARMMODENAME3_Add ;
  dmDBCreate.AlterTB_ALARMMODECODE_ARMMODENAME_Change ;
  dmDBCreate.AlterTB_ALARMPORTSTATE_PORTSTATENAME3_Add ;
  dmDBCreate.AlterTB_ALARMPORTSTATE_PORTSTATENAME_Change ;
  dmDBCreate.AlterTB_ATTENDCODE_CODENAME_Change ;
  dmDBCreate.AlterTB_ATTENDINOUTCODE_NAME_Change ;
  dmDBCreate.AlterTB_ATTENDPOSITION_NAME_Change ;
  dmDBCreate.AlterTB_ATTENDWORKTYPE_NAME_Change ;
  dmDBCreate.AlterTB_CARDGUBUN_CARDGUBUNNAME_Change ;
  dmDBCreate.AlterTB_CARDSTATE_STATECODENAME3_Add ;
  dmDBCreate.AlterTB_CARDSTATE_STATECODENAME_Change ;
  dmDBCreate.AlterTB_CCTV_NAME_Change ;
  dmDBCreate.AlterTB_DEVICE_DEVICENAME_Change ;
  dmDBCreate.AlterTB_DOORGUBUN_NAME_Change ;
  dmDBCreate.AlterTB_EMPLOYEESTATECODE_STATECODENAME_Change ;
  dmDBCreate.AlterTB_FINGERDEVICE_DEVICENAME_Change ;
  dmDBCreate.AlterTB_FIREGROUP_GROUPCODENAME_Change ;
  dmDBCreate.AlterTB_FOODCODE_NAME_Change ;
  dmDBCreate.AlterTB_FOODTYPE_FDTYPENAME_Change ;
  dmDBCreate.AlterTB_FORMMESSAGE_MESSAGENAME3_Add ;
  dmDBCreate.AlterTB_FORMMESSAGE_MESSAGENAME_Change ;
  dmDBCreate.AlterTB_FORMNAME_NAME_Change ;
  dmDBCreate.AlterTB_NODE_NODENAME_Change ;
  dmDBCreate.AlterTB_READERBUILDINGPOSITIONCODE_BUILDINGPOSITIONCODENAME3_Add ;
  dmDBCreate.AlterTB_READERBUILDINGPOSITIONCODE_BUILDINGPOSITIONCODENAME_Change ;
  dmDBCreate.AlterTB_READERDOORPOSITIONCODE_DOORPOSITIONCODENAME3_Add ;
  dmDBCreate.AlterTB_READERDOORPOSITIONCODE_DOORPOSITIONCODENAME_Change ;
  dmDBCreate.AlterTB_ZONEEXTENTION_EXTENTIONNAME_Change ;
  dmDBCreate.AlterTB_ALARMEVENT_CHECKMSG_Change ;
  dmDBCreate.AlterTB_SYSTEMLOG_LOGDATA_Change;
  dmDBCreate.AlterTB_Reader_NAME_CHANGE;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','17');
end;

function TDataBaseConfig.Table_0018_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','USE','0','�ý��ۿ�������');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','CUSTMOR','0','������');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','CYCLE','5','�ֱ�');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB1TYPE','1','1.MSSQL');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB1IP','127.0.0.1','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB1PORT','1433','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB1USERID','sa','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB1USERPW','','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB1DBNAME','BMOS','');

  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB2TYPE','3','3.ORACLE');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB2IP','127.0.0.1','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB2PORT','1521','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB2USERID','sys','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB2USERPW','manager','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','DB2DBNAME','BMOS','');

  dmDBCreate.AlterTB_ATTENDEVENT_RELAY_Add ;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','18');
end;

function TDataBaseConfig.Table_0019_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_EMPLOYEE_MEMLOAD_Add ;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','19');
end;

function TDataBaseConfig.Table_0020_VersionMake: Boolean;
var
  stSql : string;
begin
  dmDBCreate.AlterTB_NODE_DELETE_Add;

  stSql := ' Update TB_NODE set ND_DELETE = ''N'' ';
  dmDataBase.ProcessExecSQL(stSql);

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','20');
end;

function TDataBaseConfig.Table_0021_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_ATTENDPOSITION_AP_ATSTARTBUTTON_Change ;
  dmDBCreate.AlterTB_ATTENDPOSITION_AP_ATOFFBUTTON_Change ;
  dmDBCreate.AlterTB_ATTENDPOSITION_AP_INOUTDEVICETYPE_Change ;
  dmDBCreate.AlterTB_ATTENDPOSITION_AP_WORKOUTBUTTON_Change ;
  dmDBCreate.AlterTB_ATTENDPOSITION_AP_WORKINBUTTON_Change ;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','21');
end;

function TDataBaseConfig.Table_0022_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_CARDPERMIT_CP_MEMLOAD_Add ;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','22');
end;

function TDataBaseConfig.Table_0023_VersionMake: Boolean;
begin
//  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','ALARMMONITORING','0','��� �������');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','23');
end;

function TDataBaseConfig.Table_0024_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_CARDPERMIT_Ix01;
  dmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE_Ix01;
  dmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE_Ix02;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','24');
end;

function TDataBaseConfig.Table_0025_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_FORMMESSAGE_MESSAGENAME1_Change ;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','25');
end;

function TDataBaseConfig.Table_0026_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_ATTENDEVENT_USER_Add ;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','26');
end;

function TDataBaseConfig.Table_0027_VersionMake: Boolean;
var
  stSql : string;
begin
  dmDBCreate.CreateTB_AntiGroupCode ;
  dmDBCreate.AlterTB_DOOR_AntiNo_Add ;
  dmDBCreate.AlterTB_DOOR_AntiGroupCode_Add ;

  stSql := ' Update TB_DOOR set AG_ANTINO = 0,AG_CODE = 0 ';
  dmDataBase.ProcessExecSQL(stSql);

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','27');
end;

function TDataBaseConfig.Table_0028_VersionMake: Boolean;
var
  stSql : string;
begin
  dmDBCreate.AlterTB_ACCESSEVENT_ATSUMMARY_Add ;

  stSql := ' Update TB_ACCESSEVENT set AE_ATSUMMARY = ''Y'' where AE_DATE <> ''' + FormatDateTime('yyyymmdd',now) + ''' ';
  dmDataBase.ProcessExecSQL(stSql);

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','28');
end;

function TDataBaseConfig.Table_0029_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('H','��������ԺҰ�','Not Access(Lock)');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('I','��������ٸ�','Not Matching Area');
  dmDBInsert.InsertIntoTB_ACCESSPERMITCODE_All('J','��Ƽ�н����ԺҰ�','Not Access(AntiPass)');
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','29');
end;

function TDataBaseConfig.Table_0030_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_NODE_DEVICETYPE_Add ;
  dmDBCreate.CreateTB_NODEDEVICETYPECODE;
  dmDBInsert.InsertIntoTB_NODEDEVICETYPECODE_All('0','��Ʈ�ѷ�','Controler','Controler','2');
  dmDBInsert.InsertIntoTB_NODEDEVICETYPECODE_All('1','�������','ETC','ETC','2');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','30');
end;

function TDataBaseConfig.Table_0031_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('ANTIPASS','ANTIFREE','0','��Ƽ�н������ð��������,0.�̻��,1.���');
  dmDBInsert.InsertIntoTB_CONFIG_All('ANTIPASS','ANTIFREETIME','1','��Ƽ�н������ð�');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','31');
end;

function TDataBaseConfig.Table_0032_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_FOODGROUP;
  dmDBInsert.InsertIntoTB_FOODGROUP_Value('1','�ѽ�');
  dmDBInsert.InsertIntoTB_FOODGROUP_Value('2','���');
  dmDBCreate.AlterTB_Reader_FGCODE_Add;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','32');
end;

function TDataBaseConfig.Table_0033_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_FOODEVENT_FGCODE_Add;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','33');
end;

function TDataBaseConfig.Table_0034_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('ACAM','VER','1','ACAM VER');
  dmDBInsert.InsertIntoTB_CONFIG_All('ACAMSERVER','VER','1','ACAMSERVER VER');
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','34');
end;

function TDataBaseConfig.Table_0035_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_FOODEVENT_FDSUMMARY_Add;
  dmDBCreate.CreateTB_FOODCODECOUNT;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','35');
end;

function TDataBaseConfig.Table_0036_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_NODE_DECODERNO_Add;
  dmDBCreate.AlterTB_NODE_LASTNETSTATE_Add;
  dmDBCreate.CreateTB_DECODER;
  dmDBInsert.InsertIntoTB_DECODER_ALL('1','1','Decoder1','127.0.0.1','3000','6501','7001','16501');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','36');
end;

function TDataBaseConfig.Table_0037_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_DOORRCV_DOORSCHUSE_Add;
  dmDBCreate.AlterTB_NODEDEVICETYPECODE_PGTYPE_Add;
  dmDBCreate.AlterTB_NODE_ADDDate_Add;
  dmDBCreate.AlterTB_NODE_ADDR_Add;
  dmDBCreate.AlterTB_NODE_BUILDINGCODE_Add;
  dmDBCreate.AlterTB_NODE_OLDDECORDERNO_Add;
  dmDBCreate.AlterTB_NODE_DECORDERNOCHANGE_Add;
  dmDBCreate.AlterTB_NODE_TELNUM_Add;
  dmDBCreate.AlterTB_CARD_CardPrintNo_Add;
  dmDBCreate.AlterTB_CARDPERMIT_PASSWD_Add;
  dmDBCreate.AlterTB_ACCESSEVENT_TELNUM_Add;
  dmDBCreate.CreateTB_CARDPRINTLIST;
  dmDBInsert.InsertIntoTB_NODEDEVICETYPECODE_All('0','KTT811','KTT811','KTT811','0');
  dmDBInsert.InsertIntoTB_NODEDEVICETYPECODE_All('1','�������','ETC','ETC','0');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','37');
end;

function TDataBaseConfig.Table_0038_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','PROTOCOL','0','0.Ȯ�����,1.����ġ����');
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','38');
end;

function TDataBaseConfig.Table_0039_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_DEVICE_ARMAREAUSE_Add;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','39');
end;

function TDataBaseConfig.Table_0040_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','PGTYPE','1','0.�Ϲ�,1.�бⱹ��');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','NODELENGTH','4','������');
  dmDBCreate.AlterTB_DOOR_LTSTATE_Add;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','40');
end;


function TDataBaseConfig.Table_0041_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_CARDPERMIT_Ix02;
  dmDBInsert.InsertIntoTB_ALARMEVENTOPERMODECHANGE_All('ARM_PRESS.','00','05');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00A00050','����庯��(��ư)','Arm Mode Change(Button)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('00D00050','������庯��(��ư)','DisArm Mode Change(Button)','00','2','1','1','0',inttostr(clWhite));
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','LONGTIMERC','LR','��ð����������� �˶��ڵ�');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATECODE_All('LR','��ð����Թ���������','OpenDoor Recovery','0','0','0','0');
  dmDBInsert.InsertIntoTB_ALARMEVENTSTATEPCCODE_All('000LR000','��ð����Թ���������','OpenDoor Recovery','LR','9','0','1','0',inttostr(clWhite));
  dmDBCreate.CreateTB_DOORSTATEEVENT;
  dmDBInsert.InsertIntoTB_ALARMDEVICETYPE_All('DO','���Թ�');
  dmDBCreate.CreateTB_DOORTELEVENT;

  dmDBCreate.AlterTB_DOOR_DoorMemo_Add;
  dmDBCreate.AlterTB_ACCESSEVENT_PRINTNO_Add;

  dmDBInsert.InsertIntoTB_CONFIG_All('CARDDELETE','APPLYTYPE','4','1.��ü,2.�Ҽ�,3.�׷�,4.�Ҽ�+�׷�');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARDDELETE','DELETETYPE','1','1.Ƚ��,2.�Ⱓ');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARDDELETE','WORKSCHEDULE','1000000','�۾�������');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARDDELETE','WORKTIME','0000','�۾��ð�');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARDDELETE','DAYTERM','7','�Ⱓ');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARDDELETE','COUNT','2','Ƚ���̸�');
  dmDBCreate.AlterTB_COMPANYCODE_AutoPermitDelete_Add;
  dmDBCreate.AlterTB_COMPANYCODE_RelayCompanyCode_Add; //ȸ���ڵ忬���� ���� ȸ���ڵ� ������ ��� ��
  dmDBCreate.AlterTB_EMPLOYEE_CARDUSE_Add;
  dmDBCreate.AlterTB_EMPLOYEE_RelayUse_Add;
  dmDBCreate.AlterTB_EMPLOYEE_RelayDate_Add;
  dmDBCreate.AlterTB_EMPLOYEE_RelayCode_Add;
  dmDBCreate.AlterTB_EMPLOYEEGROUPCODE_AutoPermitDelete_Add;
  dmDBCreate.AlterTB_EMPLOYEEGUBUN_RelayCode_Add;
  dmDBCreate.CreateTB_CARDDELETEEVENT;
  dmDBCreate.CreateTB_CARDDELETEHISTORY;
  dmDBCreate.CreateTB_DOORSTATECODE;
  dmDBInsert.InsertIntoTB_DOORSTATECODE('O','���Թ�����');
  dmDBInsert.InsertIntoTB_DOORSTATECODE('C','���Թ�����');
  dmDBInsert.InsertIntoTB_DOORSTATECODE('T','��ð����Թ�����');
  dmDBInsert.InsertIntoTB_DOORSTATECODE('D','��ð����Թ�����');
  dmDBCreate.AlterTB_DECODER_FTPPort_Add;
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','MAXDOORCOUNT','1','�ִ����Թ�����');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','ONLYMAINCOUNT','100','��Ŷ���尹��');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARD','FPTYPE','1','1.��������ī��,2.ī��+����');
  dmDBInsert.InsertIntoTB_CONFIG_All('CARD','CARDREGISTFORM','0','0.ī��߱޸޴�������,1.�����');

  dmDBCreate.AlterTB_DECODER_FTPPort_Add;
  dmDBInsert.InsertIntoTB_CONFIG_All('DAEMON','PACKETTYPE','0','0.KTT,1.STEC,2.SK');
  dmDBCreate.AlterTB_DOOR_RelayID_Add;
  dmDBCreate.AlterTB_DOOR_RelayIDChange_Add;
  dmDBCreate.CreateTB_DOOR_Ix01;
  dmDBCreate.CreateVW_APPROV_LABOR;
  dmDBCreate.CreateVW_APPROV_LABOR_Ix01;
  dmDBCreate.AlterTB_ACCESSEVENT_RELAY_Add;
  dmDBCreate.CreateTB_ACCESSEVENT_Ix01;
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','RELAYCODE1','F000','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','RELAYCODE2','01','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','RELAYCODE3','LIBS','');
  dmDBInsert.InsertIntoTB_CONFIG_All('SYSTEMRELAY','RELAYCODE4','01','');

  dmDBCreate.CreateTB_GUESTLIST;
  dmDBCreate.CreateTB_GUESTEVENT;
  dmDBInsert.InsertIntoTB_CONFIG_All('VISIT','USE','0','0.�̻��,1.���');
  dmDBInsert.InsertIntoTB_CONFIG_All('VISIT','CODE','0003','�湮�� �Ҽ��ڵ�');
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','41');
end;

function TDataBaseConfig.Table_0042_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_GUESTLIST_AREACODE_Add;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','42');
end;

function TDataBaseConfig.Table_0043_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_FOODEVENT_RELAYUSE_Add;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','43');
end;

function TDataBaseConfig.Table_0044_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_FOODEVENT_CARDNO_Add;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','44');
end;

function TDataBaseConfig.Table_0045_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_EMPLOYEE_APPROVE_Add;
  dmDBCreate.AlterTB_HOLIDAY_HOTYPE_Add;
  dmDBCreate.AlterTB_HOLIDAYDEVICE_HOTYPE_Add;

  dmDBUpdate.UpdateTB_HOLIDAY_Field_IntValue('','HO_TYPE','3');
  dmDBUpdate.UpdateTB_HOLIDAYDEVICE_Field_IntValue('','','','HO_TYPE','3');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','45');
end;

function TDataBaseConfig.Table_0046_VersionMake: Boolean;
begin
//  dmDBCreate.AlterTB_CARDPERMITCOMPANYGROUP_APPROVE_Add;
  dmDBCreate.AlterTB_CARDPERMITEMPLOYEECODE_APPROVE_Add;
//  dmDBCreate.AlterTB_CARDPERMITEMPLOYEEGROUP_APPROVE_Add;
//  dmDBCreate.AlterTB_CARDPERMIT_APPROVE_Add;

  dmDBUpdate.UpdateTB_EMPLOYEE_Field_IntValue('', 'EM_APPROVE','1');
//  dmDBUpdate.UpdateTB_CARDPERMITCOMPANYGROUP_Field_IntValue('', '', '', '', '', '', 'EM_APPROVE','1');
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_IntValue('','', '', '', '', '', 'EM_APPROVE','1');
//  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEEGROUP_Field_IntValue('','','','','','', 'EM_APPROVE','1');
//  dmDBUpdate.UpdateTB_CARDPERMIT_Field_IntValue('','','','', 'EM_APPROVE','1');
  dmDBCreate.AlterTB_EMPLOYEE_REGUSERID_Add;
  dmDBCreate.AlterTB_EMPLOYEE_APPROVEUSERID_Add;
  dmDBCreate.AlterTB_EMPLOYEE_APPROVEMSG_Add;
  dmDBCreate.AlterTB_ADMIN_EMGROUPCODE_Add;
  dmDBCreate.AlterTB_DOOR_MEMLOAD_Add;
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue('','','','','DO_FIREDOOROPEN','1');
  dmDBCreate.CreateTB_FORMCRITICAL;
  dmDBInsert.InsertIntoTB_FORMCRITICAL_Value('1','EMPLOYEE','���','1');
  dmDBInsert.InsertIntoTB_FORMCRITICAL_Value('2','EMPLOYEE','�̸�','1');
  dmDBInsert.InsertIntoTB_FORMCRITICAL_Value('3','EMPLOYEE','�ڵ���','0');
  dmDBInsert.InsertIntoTB_FORMCRITICAL_Value('4','EMPLOYEE','�系��ȭ��ȣ','0');
  dmDBInsert.InsertIntoTB_FORMCRITICAL_Value('5','EMPLOYEE','��Ÿ�������','0');

  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','EM_APPROVE','0','0.������ι̻��,1.������λ��');
  dmDBInsert.InsertIntoTB_CONFIG_All('FIRE','LASTFIRECHECK','1','�������� ȭ���ȣ üũ ����,0.üũ����');


  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','46');
end;

function TDataBaseConfig.Table_0047_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('CARDDELETE','USE','0','�������');
  dmDBCreate.AlterTB_DEVICE_DEVICEHANGE_Add;
  dmDBUpdate.UpdateTB_DEVICE_Field_StringValue('','','','DE_DEVICEHANGE','N');
  dmDBCreate.CreateTB_CARDBUTTONEVENTSTAT;
  dmDBCreate.AlterTB_CARDPRINTLIST_Ix01;
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','CARDBUTTONSTAT','0','���Թ�ư���������');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','47');
end;

function TDataBaseConfig.Table_0048_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_DOOR_DOOROPENSTATE_Add; //���Թ�����/���� ���� ����� ��� �Ѵ�.
  dmDBCreate.AlterTB_DOOR_LASTACCESSCARD_Add; //���������� ī���ȣ ��� �Ѵ�.

  dmDBCreate.AlterTB_ADMIN_ENCODER_Add;
  EnCodeTB_ADMIN_PW;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','48');
end;

function TDataBaseConfig.Table_0049_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('CARDDELETE','CARDSTOP','0','��������,0.��ȿ�Ⱓ,1.�������,2.�������');
  dmDBCreate.CreateTB_CARDPERMIT_Ix03;
  dmDBCreate.CreateTB_EMPLOYEE_Ix01;
  dmDBCreate.CreateTB_EMPLOYEE_Ix02;
  dmDBCreate.CreateTB_EMPLOYEE_Ix03;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','49');
end;

function TDataBaseConfig.Table_0050_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE_Ix03;
  dmDBCreate.AlterTB_NODE_LASTNETTIME_Add;
  dmDBCreate.AlterTB_DOOR_LASTLDTIME_Add;
  dmDBCreate.AlterTB_DOORTELEVENT_USERNAME_Add;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','50');
end;

function TDataBaseConfig.Table_0051_VersionMake: Boolean;
var
  stSql : string;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','TYPE','2','����Ÿ��,1.����,2.��������');
  dmDBCreate.AlterTB_FINGERDEVICE_FINGERDEVICEID_Add;
  dmDBCreate.AlterTB_FINGERDEVICE_BUILDINGCODE_Add;
  dmDBCreate.AlterTB_FINGERDEVICE_CHANGE_Add;
  stSql := 'Update TB_FINGERDEVICE set FN_FINGERDEVICEID = FN_DEVICESEQ ';
  dmDataBase.ProcessExecSQL(stSql);
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','51');
end;

function TDataBaseConfig.Table_0052_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_DOOR_LASTACCESSTIME_Add;
  dmDBCreate.AlterTB_DOOR_DOTIME_Add;
  dmDBInsert.InsertIntoTB_CONFIG_All('ANTIPASS','ANTISTIME','0000','Antipass�ʱ�ȭ ���۽ð�');
  dmDBInsert.InsertIntoTB_CONFIG_All('ANTIPASS','ANTIETIME','2400','Antipass�ʱ�ȭ ����ð�');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','52');
end;

function TDataBaseConfig.Table_0053_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_CARD_DeleteTrigger;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','53');
end;

function TDataBaseConfig.Table_0054_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE_Ix04;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','54');
end;

function TDataBaseConfig.Table_0055_VersionMake: Boolean;
var
  stSql : string;
begin
  dmDBCreate.AlterTB_DECODER_DIRECTPORT_Add;

  stSql := ' Update TB_DECODER set ND_DIRECTPORT = ND_DECODERCONTROLPORT + 10000 ';
  dmDataBase.ProcessExecSQL(stSql);

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','55');
end;

function TDataBaseConfig.Table_0056_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_DOOR_OPENDOORALARM_Add;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','56');
end;

function TDataBaseConfig.Table_0057_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','RELAYTYPE','1','����Ÿ��,1.TCPIP,2.DB');
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','RELAYDBTYPE','1','DBŸ��,1.MSSQL');
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','RELAYDBIP','127.0.0.1','DBIP');
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','RELAYDBPORT','1433','DBPORT');
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','RELAYDBUSER','sa','����');
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','RELAYDBUSERPW','sapasswd','��й�ȣ');
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','RELAYDBNAME','sh_fpsystem','DB��');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','57');
end;

function TDataBaseConfig.Table_0058_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','READERIDLEN','4','�������̵����');
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','READERUSERLEN','4','����ھ��̵����');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','58');
end;

function TDataBaseConfig.Table_0059_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','SERVERPORT','7006','������������IP');
  dmDBCreate.CreateTB_FINGERAPPROVALNUM;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','59');
end;

function TDataBaseConfig.Table_0060_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('MONITORING','CHILDGRADESYNC','0','�ڽı��ѵ���ȭ');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','60');
end;

function TDataBaseConfig.Table_0061_VersionMake: Boolean;
var
  stCardPos : string;
begin
  stCardPos := dmDBFunction.GetNextTB_CARD_PositionNum;
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','LASTCARDPOS',stCardPos,'����ī���ȣ');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','61');
end;

function TDataBaseConfig.Table_0062_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_CARDHIS_Ix01;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','62');
end;

function TDataBaseConfig.Table_0063_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','CHKFINGERCARDPOS','0','����ī�� üũ��ġ');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','63');
end;

function TDataBaseConfig.Table_0064_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_SYSTEMLOG_CARDNO_Change;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','64');
end;

function TDataBaseConfig.Table_0065_VersionMake: Boolean;
var
  i : integer;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('ATTEND','RELAYTYPE','0','���¿���Ÿ��');
  dmDBCreate.CreateTB_ATTENDFILEFORMAT;
  for i := 1 to 10 do
    dmDBInsert.InsertIntoTB_ATTENDFILEFORMAT_Value(inttostr(i),'0','','10',' ','yyyymmddhhnnss','0','1','2','3','4');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','65');
end;

function TDataBaseConfig.Table_0066_VersionMake: Boolean;
begin
  dmDBCreate.AlterTB_ATTENDFILEFORMAT_GUBUN_Add;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','66');
end;

function TDataBaseConfig.Table_0067_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('FINGER','READERCARDLEN','6','ī�����'); //�� ������̴�.

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','67');
end;

function TDataBaseConfig.Table_0068_VersionMake: Boolean;
begin
  dmDBCreate.CreateTB_CARDPERMITEMPLOYEECODE_Ix05;
  dmDBCreate.CreateTB_CARDPERMITCOMPANYGROUP_Ix01;

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','68');
end;

function TDataBaseConfig.Table_0069_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('CARD','SYNC','1','ī�嵿��ȭ');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','69');
end;

function TDataBaseConfig.Table_0070_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','AUTOLOGOUTUSE','0','�ڵ��α׾ƿ��������0.�̻��,1.���');
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','AUTOLOGOUTTIME','1','�ڵ��α׾ƿ��ð�(��)');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','70');
end;

function TDataBaseConfig.Table_0071_VersionMake: Boolean;
begin
  dmDBInsert.InsertIntoTB_CONFIG_All('COMMON','COMPANYNOTMATCH','0','ȸ���ڵ�NotMatch��������');

  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','TABLE_VER','CO_CONFIGVALUE','71');
end;

procedure TfmDataBaseConfig.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
  stDBType : string;
begin
  Try
    if G_stExeFolder = '' then G_stExeFolder := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(G_stExeFolder + '\MIAMS.ini');

    stDBType := UpperCase(ini_fun.ReadString('DBConfig','TYPE','MSSQL'));
    if UpperCase(stDBType) = 'MSSQL' then G_nDBType := MSSQL
    else if UpperCase(stDBType) = 'PG' then G_nDBType := POSTGRESQL
    else if UpperCase(stDBType) = 'FB' then G_nDBType := FIREBIRD
    else if UpperCase(stDBType) = 'MDB' then G_nDBType := MDB;

    rg_DBType.ItemIndex := G_nDBType;

    edServerIP.Text  := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    edServerPort.Text := ini_fun.ReadString('DBConfig','Port','1433');
    edUserid.Text := ini_fun.ReadString('DBConfig','UserID','sa');
    edPasswd.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW',MimeEncodeString('sapasswd')));  //saPasswd
    edDataBaseName.Text := lowerCase(ini_fun.ReadString('DBConfig','DBNAME','MIAMS'));
  Finally
    ini_fun.Free;
  End;
  rg_DBTypeClick(sender);
end;

procedure TfmDataBaseConfig.rg_DBTypeClick(Sender: TObject);
begin
  if rg_DBType.ItemIndex = MDB then AdvPanel1.Visible := False
  else AdvPanel1.Visible := True;

end;

procedure TfmDataBaseConfig.btn_CloseClick(Sender: TObject);
begin
  TDataBaseConfig.GetObject.Cancel := True;
  Close;
end;

procedure TfmDataBaseConfig.btn_SaveClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  Try
    if G_stExeFolder = '' then G_stExeFolder := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(G_stExeFolder + '\MIAMS.INI');

    if rg_DBType.ItemIndex = 0 then ini_fun.WriteString('DBConfig','TYPE','MSSQL')
    else if rg_DBType.ItemIndex = 1 then ini_fun.WriteString('DBConfig','TYPE','MDB')
    else if rg_DBType.ItemIndex = 2 then ini_fun.WriteString('DBConfig','TYPE','PG')
    else if rg_DBType.ItemIndex = 3 then ini_fun.WriteString('DBConfig','TYPE','FB');

    ini_fun.WriteString('DBConfig','Host',Trim(edServerIP.Text));
    ini_fun.WriteString('DBConfig','Port',Trim(edServerPort.Text));
    ini_fun.WriteString('DBConfig','UserID',Trim(edUserid.Text));
    ini_fun.WriteString('DBConfig','UserPW',MimeEncodeString(Trim(edPasswd.Text)));
    ini_fun.WriteString('DBConfig','DBNAME',Trim(edDataBaseName.Text));

  Finally
    ini_fun.Free;
  End;

  TDataBaseConfig.GetObject.DataBaseConnect;
  Close;

end;

end.