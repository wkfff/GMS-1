unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, AdvToolBar,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, AdvToolBarStylers, AdvMenus, AdvMenuStylers,
  Vcl.Menus, Vcl.ImgList, AdvPreviewMenu, AdvPreviewMenuStylers,ActiveX,ADODB,uSubForm,
  CommandArray, Vcl.Imaging.pngimage,DateUtils, AdvAppStyler;

type


  TfmMain = class(TfmASubForm)
    StartMenu: TAdvPreviewMenu;
    AdvPreviewMenuOfficeStyler2: TAdvPreviewMenuOfficeStyler;
    TrayIcon1: TTrayIcon;
    TrayImageList: TImageList;
    pm_TrayMenu: TPopupMenu;
    mn_trayVisible: TMenuItem;
    N2: TMenuItem;
    mn_trayClose: TMenuItem;
    TrayTimer: TTimer;
    AdvPreviewMenuOfficeStyler1: TAdvPreviewMenuOfficeStyler;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    at_Menu: TAdvToolBarPager;
    AdvPage7: TAdvPage;
    AdvFormStyler1: TAdvFormStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    mn_CodeAdmin: TAdvToolBar;
    btn_ConfigSetting: TAdvGlowButton;
    mn_Upgrade: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    MenuImageList32: TImageList;
    MenuDisImageList32: TImageList;
    pm_NowRelay: TMenuItem;
    N3: TMenuItem;
    Image1: TImage;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mn_trayCloseClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure mn_trayVisibleClick(Sender: TObject);
    procedure TrayTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ConfigSettingClick(Sender: TObject);
    procedure CommandArrayCommandsTFORMENABLEExecute(Command: TCommand;
      Params: TStringList);
    procedure FormShow(Sender: TObject);
    procedure mn_UpgradeClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
  private
    L_stLogDirectory : string;
    L_bClose : Boolean;
    procedure MemoryCreate;
    procedure MemoryFree;
    Procedure MDIChildShow(FormName:String);

    Function GetTB_Config_SMS : Boolean;

    Procedure RelayDBConnected(Sender: TObject; aSessionNo:integer; DBConnected: Boolean); //AdoConnected
    procedure RelayDBEvent(Sender: TObject; aSession:integer; aData:string);

  private
    { Private declarations }
    wmTaskbar : word;
    procedure AppException( Sender:  TObject;  E:  Exception) ;
    procedure DefaultHandler(var Message);override;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDataBaseConfig,
  uDBCardPermit,
  uDBSelect,
  uDBUpdate,
  uDBFunction,
  uDBInsert,
  uDBRelay,
  uEmployeeRelay,
  uFormVariable;

{$R *.dfm}

{ TfmMain }

procedure TfmMain.AppException(Sender: TObject; E: Exception);
var
  sObj : string;
  ctrl : TControl;
  Comp : TComponent;
begin
  sObj := '';
  if Sender <> nil then
  begin
    if Sender.InheritsFrom(TControl) then
    begin
      ctrl := TControl(Sender);
      While (ctrl <> nil) do
      begin
        sObj := ctrl.Name + '->' + sObj;
        ctrl := ctrl.Parent;
      end;
    end else if Sender.InheritsFrom(TComponent) then
    begin
      Comp := TComponent(Sender);
      sObj := Comp.Name;
      if (Comp.Owner <> nil) then
      begin
        sObj := comp.Owner.Name + '->' + sObj;
      end;
    end;
  end;
  LogSave(L_stLogDirectory + '\AcademyServer_SMSSender' + FormatDateTime('yyyymmdd',now) + '.log',sObj);
end;


procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.btn_ConfigSettingClick(Sender: TObject);
begin
  MDIChildShow('TfmConfigSetting');
end;

procedure TfmMain.CommandArrayCommandsTFORMENABLEExecute(Command: TCommand;
  Params: TStringList);
var
  stName : string;
  bValue : Boolean;
begin
  stName := Params.Values['NAME'];
  if UpperCase(Params.Values['VALUE']) = 'TRUE' then bValue := True
  else bValue := False;

  if Not isDigit(stName) then Exit;
  G_bFormEnabled[strtoint(stName)] := bValue;   //해당 폼

  case strtoint(stName) of
    con_FormAFSConfig : begin  //환경설정 창 종료시
    end;
    con_FormAFSATReader : begin
    end;
    con_FormAFSFoodReader : begin
    end;
  end;

end;

procedure TfmMain.DefaultHandler(var Message);
begin
  inherited DefaultHandler(Message);
  with Tmessage(message) do
  begin
    if Msg = wmTaskbar then
    begin
      if TrayIcon1 = nil then
      begin
        TrayIcon1 := TTrayIcon.Create(self);
      end;
      {사라진 트레이 재생}

      TrayIcon1.Visible := False;
      TrayIcon1.Visible := True;
    end;
  end;//with
end;


procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  G_bApplicationTerminate := True;
  MemoryFree;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if L_bClose = False then
  begin
    CanClose := False;
    Hide();
    WindowState := wsMinimized;
  end;

end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'Main';

  wmTaskbar := RegisterWindowMessage('TaskbarCreated');
  L_stLogDirectory := ExtractFileDir(Application.ExeName) + '\..\log';


  TrayIcon1.Hint := 'AcademySmsServer Start';
  TrayIcon1.AnimateInterval := 1000;

  { Set up a hint balloon. }
  TrayIcon1.BalloonTitle := 'Academy SmsServer.';
  TrayIcon1.BalloonFlags := bfInfo;

  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;

  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('데이터베이스 접속 실패.데이터베이스접속 환경설정을 다시 하세요.');
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;

  if FileExists(G_stExeFolder + '\logo.ico') then
  begin
    self.Icon.LoadFromFile(G_stExeFolder + '\logo.ico');
    Application.Icon.LoadFromFile(G_stExeFolder + '\logo.ico');
  end;

  MemoryCreate;

  Application.OnException := AppException;
  TrayTimer.Enabled := True;


end;

procedure TfmMain.FormResize(Sender: TObject);
var
  nImageWidth : integer;
  nImageHight : integer;
begin
  inherited;
  nImageWidth := 1919;
  nImageHight := 928;

  Image1.Width := Width;
  Image1.Height := nImageHight * width div nImageWidth;

  Image1.Top := at_Menu.Height + (Height - at_Menu.Height) div 2 - (Image1.Height div 2) - 20;
  Image1.Left := 0;

end;

procedure TfmMain.FormShow(Sender: TObject);
var
  stLogoFile : string;
begin
  inherited;
  stLogoFile := G_stExeFolder + '\Logo.JPG';
  if FileExists(stLogoFile) then
    Image1.Picture.LoadFromFile(stLogoFile);
end;

function TfmMain.GetTB_Config_SMS: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    G_nSystmRelayUse := 0;
    G_nSystmRelayCustomerNo := 0;
    G_nSystmRelayCyle := 5;
    G_stSystmRelayDB1Type := '1';
    G_stSystmRelayDB1IP := '127.0.0.1';
    G_stSystmRelayDB1PORT := '1433';
    G_stSystmRelayDB1USERID := 'sa';
    G_stSystmRelayDB1USERPW := 'sapasswd';
    G_stSystmRelayDB1NAME := 'BMOS';
    G_stSystmRelayDB2Type := '3';
    G_stSystmRelayDB2IP := '127.0.0.1';
    G_stSystmRelayDB2PORT := '1521';
    G_stSystmRelayDB2USERID := 'sys' ;
    G_stSystmRelayDB2USERPW := 'master';
    G_stSystmRelayDB2NAME := 'BMOS';

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND (CO_CONFIGGROUP = ''ATTEND'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''FOOD'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''SYSTEMRELAY'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''DAEMON'' ';
    stSql := stSql + ' ) ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGGROUP').AsString = 'DAEMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'PACKETTYPE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nProgramType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'FOOD' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'DUPEVENT' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '0' then G_bFoodDupEvent := False
            else G_bFoodDupEvent := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'USE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '0' then G_bFoodUse := False
            else G_bFoodUse := True;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ATAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAttendDedicateDoorUse := True
            else G_bAttendDedicateDoorUse := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFoodDedicateDoorUse := True
            else G_bFoodDedicateDoorUse := False;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'SYSTEMRELAY' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'USE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
              G_nSystmRelayUse := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'CUSTMOR' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
             G_nSystmRelayCustomerNo := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'CYCLE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
             G_nSystmRelayCyle := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1TYPE' then
          begin
            G_stSystmRelayDB1Type := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1IP' then
          begin
            G_stSystmRelayDB1IP := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1PORT' then
          begin
            G_stSystmRelayDB1PORT := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1USERID' then
          begin
            G_stSystmRelayDB1USERID := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1USERPW' then
          begin
            G_stSystmRelayDB1USERPW := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1DBNAME' then
          begin
            G_stSystmRelayDB1NAME := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2TYPE' then
          begin
            G_stSystmRelayDB2Type := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2IP' then
          begin
            G_stSystmRelayDB2IP := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2PORT' then
          begin
            G_stSystmRelayDB2PORT := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2USERID' then
          begin
            G_stSystmRelayDB2USERID := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2USERPW' then
          begin
            G_stSystmRelayDB2USERPW := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2DBNAME' then
          begin
            G_stSystmRelayDB2NAME := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'RELAYCODE1' then
          begin
            G_stRelayCode1 := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'RELAYCODE2' then
          begin
            G_stRelayCode2 := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'RELAYCODE3' then
          begin
            G_stRelayCode3 := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'RELAYCODE4' then
          begin
            G_stRelayCode4 := FindField('CO_CONFIGVALUE').AsString;
          end;
        end;

        Next;
      end;
    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;



procedure TfmMain.MDIChildShow(FormName: String);
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        if Screen.ActiveForm = Screen.Forms[i] then
        begin
          Exit;
        end;
        Screen.Forms[i].Show;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    tmpForm.Show;
  end;
end;

procedure TfmMain.MemoryCreate;
begin
end;

procedure TfmMain.MemoryFree;
var
  i : integer;
begin

end;

procedure TfmMain.mn_trayCloseClick(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.mn_trayVisibleClick(Sender: TObject);
begin
  TrayIcon1DblClick(self);
end;

procedure TfmMain.mn_UpgradeClick(Sender: TObject);
begin
  inherited;
  if Not FileExists(G_stExeFolder + '\AFServer\SmartUpdate.exe') then
  begin
    showmessage(mn_Upgrade.Caption + ' 도구가 설치되어 있지 않습니다.');
    Exit;
  end;

  MyRunDosCommand(G_stExeFolder + '\AFServer\SmartUpdate.exe',False,False);
  Close;

end;

procedure TfmMain.RelayDBConnected(Sender: TObject; aSessionNo: integer;
  DBConnected: Boolean);
begin
end;

procedure TfmMain.RelayDBEvent(Sender: TObject; aSession: integer;
  aData: string);
begin

end;

procedure TfmMain.TrayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure TfmMain.TrayTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;

  TrayTimer.Enabled := False;
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;



end.
