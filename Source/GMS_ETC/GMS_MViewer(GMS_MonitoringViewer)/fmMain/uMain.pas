unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, AdvSmoothLabel,
  Vcl.StdCtrls, AdvAppStyler, AdvSmoothLedLabel,System.IniFiles,ActiveX,ADODB,
  Vcl.ExtCtrls, AdvSmoothPanel, Vcl.Imaging.pngimage, AdvSmoothCircularProgress,
  Vcl.Imaging.jpeg,uSubForm, CommandArray, AdvGlassButton, Vcl.Buttons;

type
  TAccessPermit = Class(TComponent)
  private
    FAccessPermitCode: string;
    FAccessPermitName: string;
  published
    property AccessPermitCode : string read FAccessPermitCode write FAccessPermitCode;
    property AccessPermitName : string read FAccessPermitName write FAccessPermitName;
  End;


  TFoodCodeDetail = class(TComponent)
  private
    FStartTime: string;
    FAmt: integer;
    FEndTime: string;
    FFoodCode: string;
    FYesterDayTime: string;
    FInitTime: string;
  public
    property FoodCode : string read FFoodCode write FFoodCode;
    property StartTime : string read FStartTime write FStartTime;
    property EndTime : string read FEndTime write FEndTime;
    property Amt : integer read FAmt write FAmt;
    property YesterDayTime : string read FYesterDayTime write FYesterDayTime;
    property InitTime : string read FInitTime write FInitTime;
  end;

  TfmMain = class(TfmASubForm)
    ServerConnectTimer: TTimer;
    pan_Main: TAdvSmoothPanel;
    AdvSmoothPanel1: TAdvSmoothPanel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    AdvSmoothPanel2: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    btn_FoodOut: TAdvGlowButton;
    AdvSmoothPanel3: TAdvSmoothPanel;
    lb_CurrentFoodCount: TAdvSmoothLedLabel;
    AdvSmoothPanel4: TAdvSmoothPanel;
    lb_CurrentFoodOutCount: TAdvSmoothLedLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    Image1: TImage;
    pan_Body: TPanel;
    lb_Date: TLabel;
    lb_Time: TLabel;
    btn_Close: TImage;
    Timer2: TTimer;
    Panel3: TPanel;
    ImgMon_E: TImage;
    ImgTUE_E: TImage;
    ImgWED_E: TImage;
    ImgTHU_E: TImage;
    ImgFRI_E: TImage;
    ImgSAT_E: TImage;
    ImgMon_a: TImage;
    ImgTUE_a: TImage;
    ImgWED_a: TImage;
    ImgTHU_a: TImage;
    ImgFRI_a: TImage;
    ImgSAT_a: TImage;
    Img_Sunny: TImage;
    Img_CloudyLittle: TImage;
    Img_Cloudy: TImage;
    Img_Rain: TImage;
    Panel4: TPanel;
    ImgMon: TImage;
    ImgTUE: TImage;
    ImgWED: TImage;
    ImgTHU: TImage;
    ImgFRI: TImage;
    ImgSAT: TImage;
    Image5: TImage;
    Img_Option: TImage;
    pan_Access: TAdvSmoothPanel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    lb_AccessMessage: TAdvSmoothLabel;
    btn_AccessConfirm: TAdvGlassButton;
    MessageTimer: TTimer;
    InitTimer: TTimer;
    AdoConnectedTimer: TTimer;
    ImgSUN_E: TImage;
    ImgSUN_a: TImage;
    ImgSUN: TImage;
    Timer3: TTimer;
    DisplayTimer: TTimer;
    lb_Weekend: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ServerConnectTimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1DblClick(Sender: TObject);
    procedure Img_OptionClick(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure InitTimerTimer(Sender: TObject);
    procedure AdoConnectedTimerTimer(Sender: TObject);
    procedure DisplayTimerTimer(Sender: TObject);
  private
    Function GetTB_Config : Boolean;
    Function GetConfigInI : Boolean;
    procedure AdoConnected(Sender: TObject;  Connected:Boolean);
  private
    L_bAdoConnectedTimer : Boolean;
    L_nRowCount : integer;
    L_nColCount : integer;
    L_nDisplayDelayTime : integer;
    L_nTextPositoin : integer;
    L_nInitTime : integer;
    L_nPhotoW : integer;
    L_nPhotoH : integer;
    AccessPermitCodeList : TstringList;
    RowPanelList : TStringList;
    ColPanelList : TStringList;
    MonitorFormList : TStringList;

    L_stOldDate : string;
    L_nMaxWindow : integer;
    FInitType: integer;
    FEventTime: TDateTime;
    FDisplayView: Boolean;

    { Private declarations }
    procedure AlarmConfirm(Sender: TObject);
    procedure DeviceAlarmEvent(Sender: TObject;aDecoderNo:integer;aNodeNo,aECUID,aExtendID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                             aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView,aAlarmSound,aAlarmColor:string;aRealTime:Boolean=True);
    procedure DeviceCardAccessEvent(Sender: TObject;aDecoderNo:integer;aTime,aNodeNo, aEcuID,aDoorNo,aReaderNo,aInOut,aCardMode,aDoorMode,
                             aChangeState,aAccessResult,aDoorState,aATButton,aType,aArmAreaNo,aCardno,aCompanyCode,
                             aCompanyName,aEmSeq,aEmCode,aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone:string);

    procedure LoadingAccessPermitCodeList;
    procedure LoadingTB_DECODER(aDecoderNo:string='');
    procedure LoadingDoorList;
    procedure UnLoadingAccessPermitCodeList;
    procedure UnLoadingTB_DECODER;
    procedure PanelClear;
    procedure PanelReSize;
    procedure PanelSetting;
    procedure PanelDockDrop(Sender: TObject; Source: TDragDockObject; X,Y: Integer);
    procedure PanelDockOver(Sender: TObject; Source: TDragDockObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
    procedure PanelGetSiteInfo(Sender: TObject; DockClient: TControl;
      var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
    procedure PanelDockResize(Sender: TObject);
    procedure PanelUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);

    procedure ShowDockPanel(APanel: TPanel; MakeVisible: Boolean; Client: TControl);override;
    procedure MonitoingSetting(aGroupNo:integer;aPanel:TPanel);
    procedure ServerConnected(Sender: TObject;aDecoderNo:integer; aConnected:Boolean);
    procedure ServerPacketView(Sender: TObject;  aClientIP,aTxRx,aData,aResult:string);
    procedure ScreenRefresh;
    procedure WndProc(var Message: TMessage); override;
    procedure SetEventTime(const Value: TDateTime);
    procedure SetDisplayView(const Value: Boolean);
  public
    { Public declarations }
    property EventTime : TDateTime read FEventTime write SetEventTime;
    property DisplayView : Boolean read FDisplayView write SetDisplayView;
  end;

var
  fmMain: TfmMain;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDataBaseConfig,
  uDBFunction,
  uDBInsert,
  uDBSelect,
  uDBUpdate,
  uDisplay,
  uOption,
  uPCClient,
  uReaderMonitoring,
  uRelayDataBase,
  uRelayDataBaseConfig;

{$R *.dfm}

procedure TfmMain.AdoConnected(Sender: TObject; Connected: Boolean);
begin
  AdoConnectedTimer.Enabled := Connected;
end;

procedure TfmMain.AdoConnectedTimerTimer(Sender: TObject);
begin
  inherited;
  if L_bAdoConnectedTimer then Exit;
  Try
    L_bAdoConnectedTimer := True;
    TDataBaseConfig.GetObject.DBConnected := False;
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  Finally
    L_bAdoConnectedTimer := False;
  End;
end;

procedure TfmMain.AlarmConfirm(Sender: TObject);
begin

end;

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.DeviceAlarmEvent(Sender: TObject; aDecoderNo: integer;
  aNodeNo, aECUID, aExtendID, aCmd, aMsgNo, aTime, aSubCLass, aSubAddr,
  aArmArea, aMode, aAlarmStateCode, aLoop, aZoneState, aOper,
  aAlarmStateCodeName, aAlarmStatePCCode, aAlarmStatePCCodeName, aArmModeChange,
  aAlarmView, aAlarmSound, aAlarmColor: string; aRealTime: Boolean);
begin

end;


procedure TfmMain.DeviceCardAccessEvent(Sender: TObject; aDecoderNo: integer;
  aTime, aNodeNo, aEcuID, aDoorNo, aReaderNo, aInOut, aCardMode, aDoorMode,
  aChangeState, aAccessResult, aDoorState, aATButton, aType, aArmAreaNo,
  aCardno, aCompanyCode, aCompanyName, aEmSeq, aEmCode, aEmName, aPosiCode,
  aPosiName, aPrintNo, aHandPhone: string);
var
  i : integer;
  stAccessPermitName : string;
  nIndex : integer;
begin
  nIndex := AccessPermitCodeList.IndexOf(aAccessResult);
  if nIndex > -1 then
  begin
    stAccessPermitName := TAccessPermit(AccessPermitCodeList.Objects[nIndex]).AccessPermitName;
  end;

  if MonitorFormList.Count > 0 then
  begin
    for i := 0 to MonitorFormList.Count - 1 do
    begin
      TfmReaderMonitoring(MonitorFormList.Objects[i]).DeviceCardAccessEvent(aDecoderNo,aTime, aNodeNo, aEcuID, aDoorNo, aReaderNo, aInOut, aCardMode, aDoorMode,
  aChangeState, aAccessResult, aDoorState, aATButton, aType, aArmAreaNo,
  aCardno, aCompanyCode, aCompanyName, aEmSeq, aEmCode, aEmName, aPosiCode,
  aPosiName, aPrintNo, aHandPhone,stAccessPermitName);
    end;
  end;
end;

procedure TfmMain.DisplayTimerTimer(Sender: TObject);
var
  dtTimeOut: TDatetime;
begin
  inherited;
  Try
    DisplayTimer.Enabled := False;
    dtTimeOut:= IncTime(EventTime,0,0,L_nDisplayDelayTime,0);   //6분 동안 데이터가 수신된게 없으면 클라이언트 소켓을 끊어 버리자...
    if Not DisplayView and (Now > dtTimeOut) then
    begin
      fmDisplay := TfmDisplay.Create(self);
      fmDisplay.ShowModal;
      fmDisplay.Free;
    end;
  Finally
    DisplayTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  ScreenRefresh;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
  ini_fun : TIniFile;
begin
  G_bApplicationTerminate := True;
//  dmPCClient.SocketConnect := False;
  ServerConnectTimer.Enabled := False;
  DisplayTimer.Enabled := False;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MVIEW.INI');
    ini_fun.WriteInteger('Form','Left',Left);
    ini_fun.WriteInteger('Form','Top',Top);
  Finally
    ini_fun.Free;
  End;

  PanelClear;
  if PCClientSocketList.Count > 0 then
  begin
    for i := 0 to PCClientSocketList.Count - 1 do
    begin
      TdmPCClient(PCClientSocketList.Objects[i]).SocketConnect := False;
    end;
  end;
  for i := PCClientSocketList.count - 1 downto 0 do TdmPCClient(PCClientSocketList.Objects[i]).Free;
  PCClientSocketList.Clear;
  PCClientSocketList.Free;

  UnLoadingAccessPermitCodeList;
  AccessPermitCodeList.Free;
  RowPanelList.free;
  ColPanelList.free;
  MonitorFormList.free;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
    AccessPermitCodeList := TStringList.Create;
    RowPanelList := TStringList.Create;
    ColPanelList := TStringList.Create;
    MonitorFormList := TStringList.Create;
    PCClientSocketList := TStringList.Create;

    dmDataBase.OnAdoConnected := AdoConnected;

(*  dmPCClient.OnAlarmConfirm := AlarmConfirm;
  dmPCClient.OnDeviceAlarmEvent := DeviceAlarmEvent;
  dmPCClient.OnDeviceCardAccessEvent := DeviceCardAccessEvent;
  dmPCClient.OnSeverConnected := ServerConnected;
  dmPCClient.OnServerPacketView := ServerPacketView;
*)
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
//  btn_Close.Top := 5;
//  btn_Close.Left := Width - btn_Close.Width - 10;

  Image5.Left := Width div 2 - (Image5.Width div 2);

  ImgWED.Left := Width div 2 - (ImgWED.Width div 2);
  ImgTUE.Left := ImgWED.Left - 10 - ImgTUE.Width ;
  ImgMon.Left := ImgTUE.Left - 10 - ImgMon.Width ;
  ImgSUN.Left := ImgMon.Left - 10 - ImgSUN.Width ;

  ImgTHU.Left := ImgWED.Left + ImgWED.Width + 10;
  ImgFRI.Left := ImgTHU.Left + ImgTHU.Width + 10;
  ImgSAT.Left := ImgFRI.Left + ImgFRI.Width + 10;
  ScreenRefresh;

  pan_Access.Left := Width div 2 - (pan_Access.Width div 2);
  pan_Access.Top := Height div 2 - (pan_Access.Height div 2);
  PanelResize;
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('데이터베이스 접속 실패.데이터베이스접속 환경설정을 다시 하세요.');
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MVIEW.INI');
    fmMain.Left := ini_fun.ReadInteger('Form','Left',0);
    fmMain.Top := ini_fun.ReadInteger('Form','Top',0);
  Finally
    ini_fun.Free;
  End;
  GetTB_Config;
  GetConfigInI;
  PanelSetting;
  LoadingAccessPermitCodeList;
  LoadingTB_DECODER;
  LoadingDoorList;
  MessageTimer.Enabled := True;
  ServerConnectTimer.Enabled := True;

  WindowState := wsMaximized;
  EventTime := Now;
  DisplayTimer.Enabled := True;
  //Image1DblClick(Image1);
  //InitTimer.Enabled := True;
end;

function TfmMain.GetConfigInI: Boolean;
var
  ini_fun : TiniFile;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MVIEW.INI');
    L_nRowCount := ini_fun.ReadInteger('Config','RowCount',1);
    L_nColCount := ini_fun.ReadInteger('Config','ColCount',5);
    L_nDisplayDelayTime := ini_fun.ReadInteger('Config','DisplayDelayTime',5);
    L_nTextPositoin := ini_fun.ReadInteger('Config','TextPos',0);
    L_nInitTime := ini_fun.ReadInteger('Config','InitTime',5);
    L_nPhotoW := ini_fun.ReadInteger('Config','PhotoW',213);
    L_nPhotoH := ini_fun.ReadInteger('Config','PhotoH',283);
  Finally
    ini_fun.Free;
  End;

end;

function TfmMain.GetTB_Config: Boolean;
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

    G_nEmployeeSearchType := 1;
    G_nFormLanguageType := 1;       //폼 언어 타입 1.KOR,2.ENG
    G_bFingerRelayUse := False;     //지문리더 연동 유무
    G_stDaemonControlPort := '5101';
    G_stFireStateCode := 'FI';
    G_bFingerDeleteUse := False;
    G_stLongTimeStateCode := 'LT';
    G_nProgramGrade := 1;

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
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
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGGROUP').AsString = 'CARD' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'EMPLOYEESEARCH' then G_nEmployeeSearchType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTDOORPERMITTYPE' then G_nCardDefaultDOORPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTARMPERMITTYPE' then G_nCardDefaultArmPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTGRADEGROUP' then G_nCardDefaultGroupType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'LANGUAGE' then G_nFormLanguageType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ATAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAttendDedicateDoorUse := True
            else G_bAttendDedicateDoorUse := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFoodDedicateDoorUse := True
            else G_bFoodDedicateDoorUse := False;
          end
          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'DAEMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'CONTROLPORT' then G_stDaemonControlPort := FindField('CO_CONFIGVALUE').asstring
          else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMECD' then G_stLongTimeStateCode := FindField('CO_CONFIGVALUE').asstring
          else if FindField('CO_CONFIGCODE').AsString = 'CARDGRADE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nProgramGrade := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end
          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'DATABASE' then
        begin
        end else if FindField('CO_CONFIGGROUP').AsString = 'FIRE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'STATECODE' then G_stFireStateCode := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGGROUP').AsString = 'MONITORING' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'MAPTYPE' then G_nMonitorMapType := FindField('CO_CONFIGVALUE').AsInteger
          else if FindField('CO_CONFIGCODE').AsString = 'MAPBUILDING' then G_nMonitorMapBuilding := FindField('CO_CONFIGVALUE').AsInteger

          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'RELAY' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'FINGERRELAYUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFingerRelayUse := True;  //지문 연동 사용시
          end else if FindField('CO_CONFIGCODE').AsString = 'EMPLOYEETYPE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nEmployeeRelayType := strtoint(FindField('CO_CONFIGVALUE').AsString);  //
          end else if FindField('CO_CONFIGCODE').AsString = 'FINGERDELETEUSE' then
          begin
             if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFingerDeleteUse := True;  //지문 연동 사용시
          end;

        end else if FindField('CO_CONFIGGROUP').AsString = 'REPORT' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'SEARCHTYPE' then
          begin
            G_nReportSearchType := FindField('CO_CONFIGVALUE').AsInteger;
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

procedure TfmMain.Image1DblClick(Sender: TObject);
begin
  if WindowState <> wsMaximized then WindowState := wsMaximized
  else WindowState := wsNormal;
end;

procedure TfmMain.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfmMain.Img_OptionClick(Sender: TObject);
begin
  fmOption := TfmOption.Create(nil);
  fmOption.RowCount := L_nRowCount;
  fmOption.ColCount := L_nColCount;
  fmOption.DisplayDelayTime := L_nDisplayDelayTime;
  fmOption.TextPos := L_nTextPositoin;
  fmOption.InitTime := L_nInitTime;
  fmOption.PhotoW := L_nPhotoW;
  fmOption.PhotoH := L_nPhotoH;

  fmOption.ShowModal;
  if fmOption.Save then
  begin
    L_nRowCount := fmOption.RowCount;
    L_nColCount := fmOption.ColCount;
    L_nTextPositoin := fmOption.TextPos;
    L_nInitTime := fmOption.InitTime;
    L_nPhotoW := fmOption.PhotoW;
    L_nPhotoH := fmOption.PhotoH;
    L_nDisplayDelayTime := fmOption.DisplayDelayTime;
  end;
  fmOption.Free;
  PanelSetting;
  Image1DblClick(Image1);
  Delay(1000);
  Image1DblClick(Image1);
  //PanelReSize;
end;

procedure TfmMain.InitTimerTimer(Sender: TObject);
begin
  inherited;
  InitTimer.Enabled := False;
  Image1DblClick(Image1);
end;

procedure TfmMain.LoadingAccessPermitCodeList;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  oAccessPermit : TAccessPermit;
begin
  UnLoadingAccessPermitCodeList;
  stSql := ' Select AP_PERMITCODE,AP_PERMITCODENAME' + inttostr(G_nFormLanguageType) + ' as Name from TB_ACCESSPERMITCODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;

      while Not Eof do
      begin
        nIndex := AccessPermitCodeList.IndexOf(FindField('AP_PERMITCODE').AsString);
        if nIndex < 0 then
        begin
          oAccessPermit := TAccessPermit.Create(nil);
          oAccessPermit.AccessPermitCode := FindField('AP_PERMITCODE').AsString;
          oAccessPermit.AccessPermitName := FindField('Name').AsString;
          AccessPermitCodeList.AddObject(FindField('AP_PERMITCODE').AsString,oAccessPermit);
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.LoadingDoorList;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  nTempIndex : integer;
  stBuildingCode : string;
  odmPCClient : TdmPCClient;
begin
  stSql := dmDBSelect.SelectTB_DOOR_MasterAll;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;

      while Not Eof do
      begin
        nTempIndex := PCClientSocketList.IndexOf(FindField('ND_DECODERNO').AsString);
        if nTempIndex < 0 then
        begin
          LoadingTB_DECODER(FindField('ND_DECODERNO').AsString);
          nTempIndex := PCClientSocketList.IndexOf(FindField('ND_DECODERNO').AsString);
        end;

        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).AddDoor(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),
                                                                      FindField('ND_NODEIP').AsString,
                                                                      FindField('ND_NODENAME').AsString,
                                                                      FindField('DE_ECUID').AsString,
                                                                      FindField('DE_DEVICENAME').AsString,
                                                                      FindField('DO_DOORNO').AsString,
                                                                      FindField('DO_DOORNAME').AsString,
                                                                      FindField('BC_BUILDINGCODE').AsString,
                                                                      FindField('DO_LOCKTYPE').AsString
                                                                      );
        end;

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

procedure TfmMain.LoadingTB_DECODER(aDecoderNo: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
  nIndex : integer;
  oPCClientSocket : TdmPCClient;
  stDecoderIP : string;
  ini_fun : TiniFile;

begin
  if aDecoderNo = '' then
     UnLoadingTB_DECODER;
  stSql := ' Select * from TB_DECODER ';
  if aDecoderNo <> '' then stSql := stSql + ' Where ND_DECODERNO = ' + aDecoderNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    ini_fun := TiniFile.Create(G_stExeFolder + '\Decoder.INI');

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        stDecoderIP := FindField('ND_DECODERIP').AsString;
        stDecoderIP := ini_fun.ReadString('Decoder',FindField('ND_DECODERNO').AsString,stDecoderIP);
        oPCClientSocket := TdmPCClient.Create(nil);
        oPCClientSocket.DecoderNo := FindField('ND_DECODERNO').AsInteger;
        oPCClientSocket.ServerIP := stDecoderIP;
        oPCClientSocket.ServerPort := FindField('ND_DIRECTPORT').AsInteger;
//        oPCClientSocket.OnArmAreaCurrentAlarmStateChange := ArmAreaCurrentAlarmStateChange;
//        oPCClientSocket.OnArmAreaSecurityModeChange := ArmAreaSecurityModeChange;
        oPCClientSocket.OnAlarmConfirm := AlarmConfirm;
        oPCClientSocket.OnDeviceAlarmEvent := DeviceAlarmEvent;
        oPCClientSocket.OnDeviceCardAccessEvent := DeviceCardAccessEvent;
//        oPCClientSocket.OnDeviceChangeEvent := DeviceChangeEvent;
//        oPCClientSocket.OnDoorChangeEvent := DoorChangeEvent;
//        oPCClientSocket.OnNodeChangeEvent := NodeChangeEvent;
//        oPCClientSocket.OnFTPPercent := RcvFTPPercent;
        oPCClientSocket.OnSeverConnected := ServerConnected;
        oPCClientSocket.OnServerPacketView := ServerPacketView;
        PCClientSocketList.AddObject(FindField('ND_DECODERNO').AsString,oPCClientSocket);
        Next;
        Application.ProcessMessages;
      end;
    end;
  Finally
    ini_fun.Free;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.MessageTimerTimer(Sender: TObject);
begin
  inherited;
  pan_Access.Visible := Not pan_Access.Visible;
end;

procedure TfmMain.MonitoingSetting(aGroupNo: integer; aPanel: TPanel);
var
  oReaderMonitoring:TfmReaderMonitoring;
begin
  oReaderMonitoring := TfmReaderMonitoring.Create(Application);
  oReaderMonitoring.GroupNo := aGroupNo;
  oReaderMonitoring.TextPos := L_nTextPositoin;
  oReaderMonitoring.InitTime := L_nInitTime;
  oReaderMonitoring.PhotoW := L_nPhotoW;
  oReaderMonitoring.PhotoH := L_nPhotoH;
  oReaderMonitoring.fmParent := self;
  if (oReaderMonitoring.HostDockSite is TPanel) and
    ((oReaderMonitoring.HostDockSite.Height = 0) or (oReaderMonitoring.HostDockSite.Width = 0)) then
    ShowDockPanel(oReaderMonitoring.HostDockSite as TPanel, True, oReaderMonitoring)
  else
  begin
    //if the window isn't docked at all, simply show it.
    oReaderMonitoring.ManualDock(aPanel,nil,alClient);
    oReaderMonitoring.Show;
  end;
  //DockDeviceState.ManualDock(LeftDockPanel,DockDeviceState,alBottom);
  aPanel.DockSite := False;
  MonitorFormList.addObject(inttostr(aGroupNo),oReaderMonitoring);
end;

procedure TfmMain.PanelClear;
var
  i : integer;
begin
  if MonitorFormList.Count > 0 then
  begin
    for i := MonitorFormList.Count - 1 downto 0 do
    begin
      TForm(MonitorFormList.Objects[i]).Free;
    end;
  end;
  MonitorFormList.Clear;
  if ColPanelList.Count > 0 then
  begin
    for i := ColPanelList.Count - 1 downto 0 do TPanel(ColPanelList.Objects[i]).Free;
  end;
  ColPanelList.Clear;

  if RowPanelList.Count > 0 then
  begin
    for i := RowPanelList.Count - 1 downto 0 do TPanel(RowPanelList.Objects[i]).Free;
  end;
  RowPanelList.Clear;
end;

procedure TfmMain.PanelDockDrop(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer);
begin
  //OnDockDrop gets called AFTER the client has actually docked,
  //so we check for DockClientCount = 1 before making the dock panel visible.
  if (Sender as TPanel).DockClientCount = 1 then
    ShowDockPanel(Sender as TPanel, True, nil);
  if (Sender as TPanel).DockManager <> nil then
    (Sender as TPanel).DockManager.ResetBounds(True);
end;

procedure TfmMain.PanelDockOver(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := Source.Control is TForm;
  if Accept then
  begin
    //Modify the DockRect to preview dock area.
    ARect.TopLeft := TPanel(Sender).ClientToScreen(Point(0, 0));
//    ARect.BottomRight := LeftDockPanel.ClientToScreen(Point(Self.ClientWidth div 3, LeftDockPanel.Height));
//    ARect.BottomRight := TPanel(Sender).ClientToScreen(Point(L_nDeviceStateWidth, LeftDockPanel.Height));
    Source.DockRect := ARect;
  end;
end;

procedure TfmMain.PanelDockResize(Sender: TObject);
begin
  TPanel(Sender).DockSite := True;
  TPanel(Sender).DockSite := False;
end;

procedure TfmMain.PanelGetSiteInfo(Sender: TObject; DockClient: TControl;
  var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
begin

end;

procedure TfmMain.PanelReSize;
var
  i : integer;
  nHeight : integer;
  nWidth : integer;
begin
  nHeight := pan_Body.Height div L_nRowCount;
  nWidth := pan_Body.Width div L_nColCount;
  for i := 0 to RowPanelList.Count - 1 do
  begin
    TPanel(RowPanelList.Objects[i]).Height := nHeight;
  end;
  for i := 0 to ColPanelList.Count - 1 do
  begin
    TPanel(ColPanelList.Objects[i]).Width := nWidth;
  end;
end;

procedure TfmMain.PanelSetting;
var
  i,j : integer;
  oRowPanel : TPanel;
  oColPanel : TPanel;
  nHeight : integer;
  nWidth : integer;
begin
  PanelClear;
  nHeight := pan_Body.Height div L_nRowCount;
  nWidth := pan_Body.Width div L_nColCount;

  for i := 1 to L_nRowCount do
  begin
    oRowPanel := TPanel.Create(nil);
    oRowPanel.Parent := pan_Body;
//    oPanel.Caption := inttostr(i);
    oRowPanel.Height := nHeight;
    oRowPanel.BevelOuter := bvNone;
    if i =  L_nRowCount then oRowPanel.Align := alClient
    else oRowPanel.Align := alTop;
    RowPanelList.AddObject(inttostr(i),oRowPanel);


    for j:=L_nColCount downto 1 do
    begin
      oColPanel := TPanel.Create(nil);
      oColPanel.Parent := oRowPanel;
      oColPanel.Caption := inttostr( (i-1) * L_nColCount + j);
      oColPanel.Tag := (i-1) * L_nColCount + j;
      oColPanel.Width := nWidth;
      oColPanel.BevelOuter := bvNone;
      oColPanel.OnDockDrop := PanelDockDrop;
      oColPanel.OnDockOver := PanelDockOver;
      oColPanel.OnGetSiteInfo := PanelGetSiteInfo;
      oColPanel.onResize := PanelDockResize;
      oColPanel.OnUnDock := PanelUnDock;
      if j =  1 then oColPanel.Align := alClient
      else oColPanel.Align := alLeft;
      ColPanelList.AddObject(inttostr( (i-1) * L_nColCount + j),oColPanel);
      MonitoingSetting((i-1) * L_nColCount + j,oColPanel);

    end;

  end;

end;

procedure TfmMain.PanelUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);
begin
  //OnUnDock gets called BEFORE the client is undocked, in order to optionally
  //disallow the undock. DockClientCount is never 0 when called from this event.
  if ((Sender as TPanel).DockClientCount = 1) then
    ShowDockPanel(Sender as TPanel, False, nil);
end;

procedure TfmMain.ScreenRefresh;
begin
Exit;
  Try
    Image1.Refresh;
  Except
    Exit;
  End;
end;

procedure TfmMain.ServerConnected(Sender: TObject;aDecoderNo:integer; aConnected:Boolean);
begin
  Try
//    ServerConnectTimer.Enabled := Not aConnected;
    if aConnected then   // 연결 시점에 현재 식수 Count 다시 조회 하자.
    begin

    end;
    MessageTimer.Enabled := Not aConnected;
    pan_Access.Visible := Not aConnected;
  Except
    Exit;
  End;
end;

procedure TfmMain.ServerConnectTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if PCClientSocketList.Count < 1 then Exit;

  for i := 0 to PCClientSocketList.Count - 1 do
  begin
    if Not TdmPCClient(PCClientSocketList.Objects[i]).Connected then
    begin
      if TdmPCClient(PCClientSocketList.Objects[i]).SocketConnect then TdmPCClient(PCClientSocketList.Objects[i]).SocketConnect := False
      else TdmPCClient(PCClientSocketList.Objects[i]).SocketConnect := True;
    end;
  end;
end;

procedure TfmMain.ServerPacketView(Sender: TObject; aClientIP, aTxRx, aData,
  aResult: string);
begin
//  memo1.Lines.Add(aData);
end;


procedure TfmMain.SetDisplayView(const Value: Boolean);
begin
  FDisplayView := Value;
  if Not Value then EventTime := Now;

end;

procedure TfmMain.SetEventTime(const Value: TDateTime);
begin
  if FEventTime = Value then Exit;

  FEventTime := Value;
  if DisplayView then
  begin
    fmDisplay.Form_Close;
  end;
end;

procedure TfmMain.ShowDockPanel(APanel: TPanel; MakeVisible: Boolean;
  Client: TControl);
begin
  inherited;
  //Client - the docked client to show if we are re-showing the panel.
  //Client is ignored if hiding the panel.

  //Since docking to a non-visible docksite isn't allowed, instead of setting
  //Visible for the panels we set the width to zero. The default InfluenceRect
  //for a control extends a few pixels beyond it's boundaries, so it is possible
  //to dock to zero width controls.

  //Don't try to hide a panel which has visible dock clients.
  if not MakeVisible and (APanel.VisibleDockClientCount > 1) then
    Exit;

  if MakeVisible and (Client <> nil) then
    Client.Show;
end;

procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  Try

    //lb_CurrentFoodCount.Repaint;
    lb_CurrentFoodOutCount.Repaint;
  Except
    Exit;
  End;

end;

procedure TfmMain.Timer2Timer(Sender: TObject);
var
  nDay : integer;
  days: array[1..7] of string;
begin
  Try
    lb_Time.Caption := FormatDateTime('AM/PM hh:nn',now);

    if L_stOldDate = FormatDateTime('yyyymmdd',now) then Exit;
    L_stOldDate := FormatDateTime('yyyymmdd',now);

    lb_Date.Caption := FormatDateTime('yyyy年 mm月 dd日',now);
    nDay := DayOfWeek(now);
    days[1] := '日';
    days[2] := '月';
    days[3] := '火';
    days[4] := '水';
    days[5] := '木';
    days[6] := '金';
    days[7] := '土';

    lb_Weekend.Caption := days[DayOfWeek(now)];

    ImgSUN.Picture := ImgSUN_E.Picture;
    ImgMon.Picture := ImgMon_E.Picture;
    ImgTUE.Picture := ImgTUE_E.Picture;
    ImgWED.Picture := ImgWED_E.Picture;
    ImgTHU.Picture := ImgTHU_E.Picture;
    ImgFRI.Picture := ImgFRI_E.Picture;
    ImgSAT.Picture := ImgSAT_E.Picture;

    case nDay of
      1 : begin
        ImgSUN.Picture := ImgSUN_a.Picture;
      end;
      2 : begin
        ImgMon.Picture := ImgMon_a.Picture;
      end;
      3 : begin
        ImgTUE.Picture := ImgTUE_a.Picture;
      end;
      4 : begin
        ImgWED.Picture := ImgWED_a.Picture;
      end;
      5 : begin
        ImgTHU.Picture := ImgTHU_a.Picture;
      end;
      6 : begin
        ImgFRI.Picture := ImgFRI_a.Picture;
      end;
      7 : begin
        ImgSAT.Picture := ImgSAT_a.Picture;
      end;
    end;
  Except
    Exit;
  End;
end;

procedure TfmMain.UnLoadingAccessPermitCodeList;
var
  i : integer;
begin
  if AccessPermitCodeList = nil then Exit;

  for i := AccessPermitCodeList.Count - 1 downto 0 do
  begin
    TAccessPermit(AccessPermitCodeList.Objects[i]).Free;
  end;
  AccessPermitCodeList.Clear;
end;

procedure TfmMain.UnLoadingTB_DECODER;
var
  i : integer;
begin
  if PCClientSocketList.Count >0 then
  begin
    for i := PCClientSocketList.Count - 1 downto 0 do
    begin
      TdmPCClient(PCClientSocketList.Objects[i]).Free;
    end;
  end;
  PCClientSocketList.Clear;
end;

procedure TfmMain.WndProc(var Message: TMessage);
begin
  inherited;
  if Message.Msg=WM_ENDSESSION then begin
    if Not G_bApplicationTerminate then Close;
  end else if Message.Msg = WM_QUERYENDSESSION then begin
    if Not G_bApplicationTerminate then Close;
    Message.Result := 1;
  end;
end;

end.
