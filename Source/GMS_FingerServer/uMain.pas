unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvToolBar, AdvShapeButton,
  AdvGlowButton, AdvToolBarStylers, AdvMenus, AdvMenuStylers, Vcl.ImgList,
  AdvPreviewMenu, AdvPreviewMenuStylers, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Menus,uSubForm, CommandArray, AdvOfficeStatusBar, Vcl.ActnList,ADODB,ActiveX,
  System.Actions, Vcl.Imaging.pngimage,System.IniFiles;

type
  TfmMain = class(TfmASubForm)
    StartMenu: TAdvPreviewMenu;
    AdvPreviewMenuOfficeStyler2: TAdvPreviewMenuOfficeStyler;
    MenuImageList32: TImageList;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvPreviewMenuOfficeStyler1: TAdvPreviewMenuOfficeStyler;
    at_Menu: TAdvToolBarPager;
    ApManager: TAdvPage;
    AdvPage4: TAdvPage;
    AdvToolBar4: TAdvToolBar;
    mn_FingerDevice: TAdvGlowButton;
    mn_ComMonitoring: TAdvGlowButton;
    AdvToolBar9: TAdvToolBar;
    mn_FireRecovery: TAdvGlowButton;
    AdvShapeButton1: TAdvShapeButton;
    Image1: TImage;
    ImageList2: TImageList;
    mn_ControlerState: TAdvGlowButton;
    TrayImageList: TImageList;
    pm_TrayMenu: TPopupMenu;
    mn_trayVisible: TMenuItem;
    N2: TMenuItem;
    mn_trayClose: TMenuItem;
    TrayIcon1: TTrayIcon;
    TrayTimer: TTimer;
    AdoConnectCheckTimer: TTimer;
    sb_Status: TAdvOfficeStatusBar;
    ActionList1: TActionList;
    Action_Daemonstop: TAction;
    Action_Daemonstart: TAction;
    FingerDeviceConnectCheckTimer: TTimer;
    PermitEmployeeToCardTimer: TTimer;
    FingersendTimer: TTimer;
    AdvToolBar1: TAdvToolBar;
    mn_Monitor: TAdvGlowButton;
    SendTimerCheck: TTimer;
    AdvToolBar2: TAdvToolBar;
    btn_Config: TAdvGlowButton;
    FingerDeviceLoadTimer1: TTimer;
    SyncTimer: TTimer;
    SHFFingerRegTimer: TTimer;
    procedure StartMenuMenuItems1Click(Sender: TObject);
    procedure mn_trayCloseClick(Sender: TObject);
    procedure TrayTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);
    procedure Action_DaemonstartExecute(Sender: TObject);
    procedure Action_DaemonstopExecute(Sender: TObject);
    procedure mn_trayVisibleClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure FingerDeviceConnectCheckTimerTimer(Sender: TObject);
    procedure mn_FingerDeviceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PermitEmployeeToCardTimerTimer(Sender: TObject);
    procedure FingersendTimerTimer(Sender: TObject);
    procedure CommandArrayCommandsTCHANGEExecute(Command: TCommand;
      Params: TStringList);
    procedure mn_ControlerStateClick(Sender: TObject);
    procedure CommandArrayCommandsTFORMENABLEExecute(Command: TCommand;
      Params: TStringList);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mn_MonitorClick(Sender: TObject);
    procedure SendTimerCheckTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ConfigClick(Sender: TObject);
    procedure FingerDeviceLoadTimer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SyncTimerTimer(Sender: TObject);
    procedure SHFFingerRegTimerTimer(Sender: TObject);
  private
    Procedure MDIChildShow(FormName:String);
    Function MDIForm(FormName:string):TForm;
    procedure CardSendingChange(Sender: TObject;  aFNDEVICESEQ,POSITIONNUM : integer;aData:string);
    procedure ReaderConnected(Sender: TObject;  aFNDEVICESEQ: integer;aValue:Boolean);
    procedure FingerCardEvent(Sender: TObject;  aIP,aCmd,aData1,aData2,aData3:string);
    procedure SHFReaderServerEvent(Sender: TObject;  aClientIP,aCmd,aData1,aData2:string);
  private
    wmTaskbar : word;
    L_bDaemonLock : Boolean;
    L_bDaemonStarted : Boolean;
    L_bLoadLock : Boolean;
    L_bClose : Boolean;
    L_bEmployeePermitLoding : Boolean;
    L_nFingerConnectSeq : integer;
    L_nSyncTimeSendSeq : integer;
    L_stLogDirectory : string;
    procedure MemoryInitialize;
    procedure BottomStatusBarPanelCaption(aIndex: integer;aData:string);
    procedure LoadTB_FINGERAPPROVALNUM;
    procedure LoadFingerDevice;
    procedure LoadChangeFingerDevice;
    procedure LoadTB_CONFIG;
    procedure UnLoadFingerDevice;
    procedure TimerStop;
    Function FormChangeEvent(aFormNumber,aFormName:integer):Boolean;  //여기서 해당하는 폼 전체에 데이터 전송 해 주자
  private
    Function EmployeePermitLoad:Boolean;
    Function EmployeePermitToFingerLoad(aEmSeq:string):Boolean;
    Function FingerSend : Boolean;
    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
  private
    { Private declarations }
    procedure  AppException( Sender:  TObject;  E:  Exception) ;
    procedure WinUserMSG(var msg:TMessage); message WM_USER;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uConfig,
  uDataBaseConfig,
  uDataBase,
  uDBDelete,
  uDBFunction,
  uDBInsert,
  uSHFDBRelay,
  uDBUpdate,
  uDBVariable,
  uFingerDeviceState,
  uFormVariable,
  uSupremaServer,
  systeminfos,
  uDeviceComMonitoring,
  uSHFReaderServer;
{$R *.dfm}

procedure TfmMain.Action_DaemonstartExecute(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if L_bDaemonLock then Exit;
  L_bDaemonLock := True;
  Try
    BottomStatusBarPanelCaption(2,'FingerServer Start');
    TrayIcon1.BalloonHint := 'FingerServer Start';

    LoadFingerDevice; //지문리더를 Load

    if G_nFingerReaderType = 2 then FingerDeviceConnectCheckTimer.Enabled := True;

    L_bDaemonStarted := True;
  Finally
    L_bDaemonLock := False;
  End;
end;

procedure TfmMain.Action_DaemonstopExecute(Sender: TObject);
begin
  inherited;
  L_bDaemonStarted := False;
  UnLoadFingerDevice;
//
end;

procedure TfmMain.AdoConnectCheckTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  Try
    AdoConnectCheckTimer.Enabled := False;
    if Not TDataBaseConfig.GetObject.DBConnected then Exit;
    BottomStatusBarPanelCaption(2,'AdoConnectCheckTimer');
    TDataBaseConfig.GetObject.DBConnected := False;
    Action_DaemonstopExecute(self);
    TDataBaseConfig.GetObject.DataBaseConnect;
    while Not TDataBaseConfig.GetObject.DBConnected do
    begin
      if TDataBaseConfig.GetObject.Cancel then
      begin
        Application.Terminate;
        G_bApplicationTerminate := True;
        Exit;
      End;
      TDataBaseConfig.GetObject.ShowDataBaseConfig;
    end;

    if G_bApplicationTerminate then Exit;
    Action_DaemonstartExecute(self);
  Finally

  End;
end;

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
  LogSave(L_stLogDirectory + '\FingerServerApplication' + FormatDateTime('yyyymmdd',now) + '.log',sObj);

end;

procedure TfmMain.BottomStatusBarPanelCaption(aIndex: integer; aData: string);
begin
  sb_Status.Panels[aIndex].Text := aData;
end;

procedure TfmMain.btn_ConfigClick(Sender: TObject);
begin
  inherited;
  fmConfig := TfmConfig.Create(nil);
  fmConfig.ShowModal;
  fmConfig.Free;
  UnLoadFingerDevice;
  LoadFingerDevice;
end;

procedure TfmMain.CardSendingChange(Sender: TObject; aFNDEVICESEQ,
  POSITIONNUM: integer; aData: string);
var
  stPermit : string;
begin
  if aData = 'Y' then
  begin
    if dmDBFunction.CheckTB_FINGERDEVICECARD_SENDSTATE(inttostr(aFNDEVICESEQ),inttostr(POSITIONNUM),'S',stPermit) = 1 then   //S 상태인 것만
    begin
      if stPermit = '1' then dmDBUpdate.UpdateTB_FINGERDEVICECARD_Field_StringValue(inttostr(aFNDEVICESEQ),inttostr(POSITIONNUM),'FD_SEND',aData)
      else if stPermit = '0' then dmDBDelete.DeleteTB_FINGERDEVICECARD_DeviceCard(inttostr(aFNDEVICESEQ),inttostr(POSITIONNUM));
    end else if dmDBFunction.CheckTB_FINGERDEVICECARD_SENDSTATE(inttostr(aFNDEVICESEQ),inttostr(POSITIONNUM),'F',stPermit) = 1 then //F 상태인 것도 처리 하자.
    begin
      if stPermit = '1' then dmDBUpdate.UpdateTB_FINGERDEVICECARD_Field_StringValue(inttostr(aFNDEVICESEQ),inttostr(POSITIONNUM),'FD_SEND',aData)
      else if stPermit = '0' then dmDBDelete.DeleteTB_FINGERDEVICECARD_DeviceCard(inttostr(aFNDEVICESEQ),inttostr(POSITIONNUM));
    end;

  end else dmDBUpdate.UpdateTB_FINGERDEVICECARD_Field_StringValue(inttostr(aFNDEVICESEQ),inttostr(POSITIONNUM),'FD_SEND',aData);
end;

procedure TfmMain.CommandArrayCommandsTCHANGEExecute(Command: TCommand;
  Params: TStringList);
var
  stName : string;
  i : integer;
begin
  inherited;
  stName := Params.Values['NAME'];
  if Not isDigit(stName) then Exit;
  for i := 0 to HIGH(G_bFormEnabled) do
  begin
    if G_bFormEnabled[i] then FormChangeEvent(i,strtoint(stName));
  end;
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

end;

procedure TfmMain.DataModuleAdoConnected(Sender: TObject; DBConnected: Boolean);
begin
  if Not DBConnected then
  begin
    AdoConnectCheckTimer.Enabled := True;
  end;
end;

function TfmMain.EmployeePermitLoad: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stEmSeq : string;
begin
  if L_bEmployeePermitLoding then Exit;
  L_bEmployeePermitLoding := True;

  result := False;
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FINGERUseAPPLYChange('N','R');
//  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FINGERNotEmployeeAPPLYChange('N','R'); //20160211삭제된 사원정보도 지문 전송해야 한다.

  stSql := ' Select ';
  if G_nDBType = MSSQL then       //데이터베이스 부하를 줄이기 위해서 한건씩만 셀렉트 하자...
    stSql := stSql + ' top 1 ';
  stSql := stSql + ' a.* from TB_CARDPERMITEMPLOYEECODE a ';
  stSql := stSql + ' Inner Join TB_CARD c ';    //Inner Join ->Left Join으로 변경 처리함, 카드삭제 되면 삭제 데이터 안내려감
  stSql := stSql + ' ON(a.EM_SEQ = c.EM_SEQ) ';
  stSql := stSql + ' Inner Join TB_FINGERDEVICE b ';
  stSql := stSql + ' ON( a.ND_NODENO = b.ND_NODENO  ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID  ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID  ';
  stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE  ';
  stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO)';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CP_FINGERAPPLY = ''R'' ';
  if (G_nFingerReaderType = 1) or (G_nFingerReaderType = 3) then
    stSql := stSql + ' AND c.CA_CARDGUBUN = 0 '; //지문만 다운로드 하자.
  stSql := stSql + ' AND c.CA_CARDGUBUN <> 999  ';
  if G_nDBType = POSTGRESQL then stSql := stSql + ' LIMIT 1 OFFSET 0 ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then
      begin
        dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FINGERAPPLYChange('R','Y'); //지문리더가 없는 기기의 권한이므로 전송 완료 처리 하자.
        Exit;
      end;
      stEmSeq := FindField('EM_SEQ').AsString;
      if EmployeePermitToFingerLoad(stEmSeq) then
      begin
        //if dmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_FingerApply(stEmSeq,'R') = 1 then     //변경함
           dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,'Y');
          dmDBDelete.DeleteTB_CARDPERMITEMPLOYEECODE_EmSeqApplyFromNotPermit(stEmSeq);
      end;
    end;
  Finally
    L_bEmployeePermitLoding := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmMain.EmployeePermitToFingerLoad(aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stPermit : string;
  stTemp : string;
begin
  result := False;
  stSql := ' Select a.EM_SEQ,b.FN_DEVICESEQ,c.CA_CARDNO,c.CA_POSITIONNUM,c.CA_CARDGUBUN,a.CP_PERMIT,a.ND_NODENO,a.DE_ECUID,a.CP_TYPE,a.CP_NUMBER,d.EM_STATECODE,d.EM_ENDDATE';
  stSql := stSql + ' from TB_CARDPERMITEMPLOYEECODE a ';
  stSql := stSql + ' INNER Join TB_FINGERDEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO  ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID  ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID  ';
  stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE  ';
  stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO)';
  stSql := stSql + ' INNER Join TB_CARD c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = c.EM_SEQ  ';
  if (G_nFingerReaderType = 1) or (G_nFingerReaderType = 3) then
    stSql := stSql + ' AND c.CA_CARDGUBUN = 0 '; //지문만 다운로드 하자.
  stSql := stSql + ' AND c.CA_CARDGUBUN <> 999 ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE d ';
  stSql := stSql + ' ON(a.EM_SEQ = d.EM_SEQ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND a.CP_FINGERAPPLY = ''R'' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;

      First;
      while Not Eof do
      begin
        stPermit := FindField('CP_PERMIT').AsString;
        stTemp := FindField('FN_DEVICESEQ').AsString + ',' + FindField('CA_POSITIONNUM').AsString ;
        if FindField('EM_STATECODE').AsString <> '1' then stPermit := '0';//재직 상태가 아니면 삭제 처리 하자.
        if FindField('EM_ENDDATE').AsString < FormatDateTime('yyyymmdd',now) then stPermit := '0';


        if dmDBFunction.CheckTB_FINGERDEVICECARD_Value(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString) = 1 then
        begin
          sb_Status.Panels[2].Text := FindField('FN_DEVICESEQ').AsString +' :' + FindField('CA_POSITIONNUM').AsString + '-' + FindField('CP_PERMIT').AsString;
          if dmDBFunction.CheckTB_FINGERDEVICECARD_PermitValue(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString,stPermit) <> 1 then //권한이 바뀌었으면
          begin
             dmDBUpdate.UpdateTB_FINGERDEVICECARD_Value(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString,FindField('EM_SEQ').AsString,stPermit,'N');
             sb_Status.Panels[2].Text := 'TB_FINGERDEVICECARD Update';
          end else
          begin
            sb_Status.Panels[2].Text := 'TB_FINGERDEVICECARD Update';
            //if dmDBFunction.CheckTB_FINGERDEVICECARD_SENDSTATE(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString,'N') = 0 then
            dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,'Y');
          end;
        end else
        begin
          sb_Status.Panels[2].Text := 'TB_FINGERDEVICECARD Insert';
          dmDBInsert.InsertIntoTB_FINGERDEVICECARD_Value(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString,FindField('EM_SEQ').AsString,stPermit,'N');
        end;
        if dmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_FingerApply(FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,'R') = 1 then
           dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,'Y');

        dmDBUpdate.UpdateTB_FINGERDEVICECARD_Field_StringValue(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString,'FD_SEND','N');
         //dmDBUpdate.UpdateTB_FINGERDEVICECARD_Resend(FindField('FN_DEVICESEQ').AsString);     //2014.01.10모니터링에서 지문 변경 시 다운로드 안되는 현상
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

procedure TfmMain.FingerCardEvent(Sender: TObject; aIP, aCmd, aData1, aData2,
  aData3: string);
var
  fmTemp : TForm;
begin
//패킷 송수신 부분 체크
  if G_bFormEnabled[conFORMFINGERCOMMONITORING] then
  begin
    fmTemp := MDIForm('TfmDeviceComMonitoring');
    if fmTemp <> nil then TfmDeviceComMonitoring(fmTemp).FingerCardEvent(aIP , aCmd,aData1,aData2,aData3);
  end;
end;

procedure TfmMain.FingerDeviceConnectCheckTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  Try
    FingerDeviceConnectCheckTimer.Enabled := False;
    if FingerReaderList.Count < 1 then Exit;
    if (FingerReaderList.Count - 1) < L_nFingerConnectSeq then
    begin
      FingerDeviceConnectCheckTimer.Interval := 10000;
      L_nFingerConnectSeq := 0;
    end;
    for I := L_nFingerConnectSeq to FingerReaderList.Count - 1 do
    begin
      L_nFingerConnectSeq := L_nFingerConnectSeq + 1;
      if Not TSupremaServer(FingerReaderList.Objects[i]).Connected and (TSupremaServer(FingerReaderList.Objects[i]).DEVICETYPE = '2') then
      begin
        TSupremaServer(FingerReaderList.Objects[i]).SocketOPEN := True;
        BottomStatusBarPanelCaption(2,TSupremaServer(FingerReaderList.Objects[i]).DEVICEIP + ':Connected Try');
        break;
      end;
      Application.ProcessMessages;      
    end;
  Finally
    if G_nFingerReaderType = 2 then FingerDeviceConnectCheckTimer.Enabled := Not G_bApplicationTerminate;  //슈프리마 지문리더는 계속 접속 유지 하자.
  End;
//
end;

procedure TfmMain.FingerDeviceLoadTimer1Timer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  LoadChangeFingerDevice;
end;

function TfmMain.FingerSend: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stPermit : string;
  stTemp : string;
begin
  result := True;
  stSql := ' Update TB_FINGERDEVICECARD set FD_SEND = ''R'' ' ;
  stSql := stSql + ' Where FD_SEND = ''N'' ';

  dmDataBase.ProcessExecSQL(stSql);

  stSql := 'Select a.FN_DEVICESEQ,a.CA_POSITIONNUM,a.CP_PERMIT,a.FD_SEND,b.CA_CARDNO,b.CA_CARDGUBUN,b.CA_STATECODE,b.EM_SEQ,c.EF_FINGERID,';
  stSql := stSql + ' c.EF_TEMPLATE1_1,c.EF_TEMPLATE1_2,c.EF_TEMPLATE2_1,c.EF_TEMPLATE2_2,d.EM_ENDDATE,d.EM_STATECODE,e.FN_FINGERDEVICEID ';
  stSql := stSql + ' From TB_FINGERDEVICECARD a ';
  if (G_nFingerReaderType = 1) or (G_nFingerReaderType = 3) then stSql := stSql + ' Left Join TB_CARD b '
  else stSql := stSql + ' Inner Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_POSITIONNUM = b.CA_POSITIONNUM ) ';
  if (G_nFingerReaderType = 1) or (G_nFingerReaderType = 3) then stSql := stSql + ' Inner Join TB_EMPLOYEEFINGER c '
  else stSql := stSql + ' Left Join TB_EMPLOYEEFINGER c ';
  stSql := stSql + ' ON( b.EM_SEQ = c.EM_SEQ ';
  if (G_nFingerReaderType = 1) or (G_nFingerReaderType = 3) then stSql := stSql + ' AND b.CA_CARDGUBUN = 0  ';
  stSql := stSql + ' AND b.CA_CARDGUBUN <> 999 ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE d ';
  stSql := stSql + ' ON(b.EM_SEQ = d.EM_SEQ) ';  //a.em_seq -> b.em_seq 로 변경 처리 함 카드 삭제 된 경우에는 EM_ENDDATE,EM_STATECODE 가 null 이 됨    a.em_seq 인경우 fingerdevicecardno 에서 삭제 안된 경우 문제 발생됨
  stSql := stSql + ' Left Join TB_FINGERDEVICE e ';
  stSql := stSql + ' ON(a.FN_DEVICESEQ = e.FN_DEVICESEQ) ';  //a.em_seq -> b.em_seq 로 변경 처리 함 카드 삭제 된 경우에는 EM_ENDDATE,EM_STATECODE 가 null 이 됨    a.em_seq 인경우 fingerdevicecardno 에서 삭제 안된 경우 문제 발생됨
  stSql := stSql + ' Where a.FD_SEND = ''R'' ';
  stSql := stSql + ' Order by a.CP_PERMIT desc ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      result := False;
      if recordcount < 1 then Exit;

      First;
      while Not Eof do
      begin
        stPermit := FindField('CP_PERMIT').AsString;
        stTemp := FindField('EM_ENDDATE').AsString;
        if FindField('EM_ENDDATE').AsString < FormatDateTime('yyyymmdd',now)  then stPermit := '0';
        if FindField('EM_STATECODE').AsString <> '1'  then stPermit := '0';
        if Trim(Findfield('CA_CARDNO').AsString) = '' then stPermit := '0';
        if Trim(Findfield('CA_STATECODE').AsString) <> '1' then stPermit := '0';

        if (G_nFingerReaderType <> 2) and (G_nFingerRelayType = 2) then  //슈프리마가 아니고 DB 연동타입인경우
        begin
          //DB연동시에는 여기서 권한 테이블에 넘겨 주자.
          if dmSHFDBRelay.RelayFingerUserPermit(inttostr(FindField('FN_FINGERDEVICEID').asInteger-1),
                       FindField('CA_POSITIONNUM').AsString,stPermit,FindField('EM_SEQ').AsString,FindField('CA_CARDNO').AsString) then
          begin
            stSql := ' Update TB_FINGERDEVICECARD set FD_SEND = ''Y'' ' ;   //다시 부르지 않게
            stSql := stSql + ' Where FN_DEVICESEQ = ' + FindField('FN_DEVICESEQ').AsString;
            stSql := stSql + ' AND CA_POSITIONNUM = ' + FindField('CA_POSITIONNUM').AsString ;

            dmDataBase.ProcessExecSQL(stSql);
          end;
        end else
        begin

          nIndex := FingerReaderList.IndexOf(FillZeroNumber(FindField('FN_DEVICESEQ').asInteger,G_nNodeCodeLength));
          if nIndex > -1 then
          begin
            stSql := ' Update TB_FINGERDEVICECARD set FD_SEND = ''S'' ' ;   //다시 부르지 않게
            stSql := stSql + ' Where FN_DEVICESEQ = ' + FindField('FN_DEVICESEQ').AsString;
            stSql := stSql + ' AND CA_POSITIONNUM = ' + FindField('CA_POSITIONNUM').AsString ;

            dmDataBase.ProcessExecSQL(stSql);

            TSupremaServer(FingerReaderList.Objects[nIndex]).SetFingerCardDownload(FindField('FN_DEVICESEQ').AsString,
              FindField('CA_POSITIONNUM').AsString,FindField('FD_SEND').AsString,FindField('CA_CARDNO').AsString,FindField('CA_CARDGUBUN').AsString,
              FindField('EF_FINGERID').AsString,FindField('EF_TEMPLATE1_1').AsString,FindField('EF_TEMPLATE1_2').AsString,
              FindField('EF_TEMPLATE2_1').AsString,FindField('EF_TEMPLATE2_2').AsString,FindField('EM_ENDDATE').AsString,stPermit,FindField('CA_STATECODE').AsString);

          end else
          begin
            stSql := ' Update TB_FINGERDEVICECARD set FD_SEND = ''S'' ' ;   //다시 부르지 않게
            stSql := stSql + ' Where FN_DEVICESEQ = ' + FindField('FN_DEVICESEQ').AsString;
            stSql := stSql + ' AND CA_POSITIONNUM = ' + FindField('CA_POSITIONNUM').AsString ;

            dmDataBase.ProcessExecSQL(stSql);
            //LoadChangeFingerDevice;
            //기기가 존재 하지 않으면 다운로드 하지 않도록 처리
            //stSql := ' Update TB_FINGERDEVICECARD set FD_SEND = ''Y'' ' ;
            //stSql := stSql + ' Where FN_DEVICESEQ = ' + FindField('FN_DEVICESEQ').AsString;

            //dmDataBase.ProcessExecSQL(stSql);
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

procedure TfmMain.FingersendTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  Try
    if Not L_bDaemonStarted then Exit; //데몬이 시작되지 않은 동안에는 작업 하지 말자.

    FingersendTimer.Enabled := False;
    if FingerSend then
    begin
      //자료 송신할 자료가 있으면 계속 시도
      //FingersendTimer.Enabled := Not G_bApplicationTerminate;
    end else
    begin
      //PermitEmployeeToCardTimer.Enabled := True; //자료를 모두 송신 했으면 다운로드 체크
    end;
  Finally
    PermitEmployeeToCardTimer.Enabled := Not G_bApplicationTerminate;  //한번 송신 후 변경된 건이 있는지 확인
  End;

end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  inherited;
  FingerDeviceLoadTimer1.Enabled := True;
end;

function TfmMain.FormChangeEvent(aFormNumber, aFormName: integer): Boolean;
var
  fmTemp : TForm;
begin
  if aFormName = conFORMFINGERDEVICE then
  begin
    Action_DaemonstopExecute(self);
    Action_DaemonstartExecute(self);
  end;

  case aFormNumber of
    conFORMFINGERDEVICE : begin
//      fmTemp := MDIForm('TfmNode');
//      if fmTemp <> nil then TfmNode(fmTemp).FormChangeEvent(aFormName);
    end;
  end;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  G_bApplicationTerminate := True;
  TimerStop;
  
  FingerReaderList.free;
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
var
  MyIcon : TIcon;
  stLogoFile : string;
begin
  wmTaskbar := RegisterWindowMessage('TaskbarCreated');
  Application.OnException := AppException;

  Self.ModuleID := 'Main';

  G_stAdminUserID := 'BMSSERVER';

  MemoryInitialize;

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
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      Application.Terminate;
      G_bApplicationTerminate := True;
      LogSave(L_stLogDirectory +'\FingerServerApplication' + FormatDateTime('yyyymmdd',now) + '.log','Daemon Program Close(DB Connect Fail) ');
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;
  if FileExists(G_stExeFolder + '\logo.ico') then
  begin
    self.Icon.LoadFromFile(G_stExeFolder + '\logo.ico');
    Application.Icon.LoadFromFile(G_stExeFolder + '\logo.ico');
  end;

  stLogoFile := G_stExeFolder + '\Logo.JPG';
  if FileExists(stLogoFile) then
    Image1.Picture.LoadFromFile(stLogoFile);

  { Load the tray icons. }
  { Set up a hint message and the animation interval. }
  TrayIcon1.Hint := 'Start FINGER Server';

  { Set up a hint balloon. }
  TrayIcon1.BalloonTitle := 'FINGER Server.';
  TrayIcon1.BalloonHint :=
    'Double click the system tray icon to restore the window.';
  TrayIcon1.BalloonFlags := bfInfo;

  LogSave(L_stLogDirectory + '\FingerServerApplication'+FormatDateTime('yyyymmdd',now) + '.log','FINGER Server Program Start ');
  TrayTimer.Enabled := True; //화면 숨김

  FingerReaderList := TStringList.Create;
  G_bApplicationTerminate := False;

  L_nFingerConnectSeq := 0;

  LoadTB_CONFIG;
  if (G_nFingerReaderType = 1) or (G_nFingerReaderType = 3) then AdvToolBar9.Visible := False;

  dmSHFReaderServer.OnServerEvent := SHFReaderServerEvent;
  Action_DaemonStartExecute(Self);
  SyncTimer.Enabled := True;
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
  stSql : string;
begin
  inherited;
  stSql := ' Update TB_FINGERDEVICECARD set FD_SEND = ''N'' ' ;
  stSql := stSql + ' Where FD_SEND = ''S'' OR FD_SEND = ''F'' ';

  dmDataBase.ProcessExecSQL(stSql);
  StartMenu.SubMenuItems[1].Title := strBuildInfo;
  Caption := 'GMS_FingerServer[' + strBuildInfo + ']';//'ACAM software[' + strBuildInfo + ']';
end;

procedure TfmMain.LoadChangeFingerDevice;
var
  stSql : string;
  oSupremaServer : TSupremaServer;
  TempAdoQuery : TAdoQuery;
  nIndex : integer;
begin
  //BottomStatusBarPanelCaption(2,'LoadChangeFingerDevice');
  if L_bLoadLock then Exit;
  L_bLoadLock := True;
  Try
    stSql := ' select * from TB_FINGERDEVICE  ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';
    //stSql := stSql + ' AND FN_DEVICETYPE = ''' + inttostr(G_nFingerReaderType) + ''' ';
    stSql := stSql + ' AND (FN_CHANGE is NULL OR FN_CHANGE = ''Y'') ';
    stSql := stSql + ' Order by FN_DEVICESEQ ';

    if NodeList = nil then NodeList := TStringList.Create;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //에러처리
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          if G_nFingerRelayType = 2 then
          begin
            //BottomStatusBarPanelCaption(2,FindField('FN_DEVICESEQ').AsString);
            //DB연동 타입이면 여기서 DB 연동하자.
            if dmSHFDBRelay.RelayFingerDevice(FindField('FN_DEVICESEQ').AsString,inttostr(FindField('FN_FINGERDEVICEID').asInteger - 1),
                                        Trim(FindField('FN_DEVICEIP').AsString),Trim(FindField('FN_DEVICEPORT').AsString),
                                        FindField('FN_DEVICENAME').AsString) then
            begin
              //BottomStatusBarPanelCaption(2,FindField('FN_DEVICESEQ').AsString+'Sucess');
              dmDBUpdate.UpdateTB_FINGERDEVICE_Field_StringValue(FindField('FN_DEVICESEQ').AsString,'FN_CHANGE','N'); //변경된게 없다
            end else
            begin
              //BottomStatusBarPanelCaption(2,FindField('FN_DEVICESEQ').AsString+'Fail');
            end;
          end else
          begin
            nIndex := FingerReaderList.IndexOf(FillZeroNumber(FindField('FN_DEVICESEQ').asInteger,G_nNodeCodeLength));
            if nIndex < 0 then  //추가된건
            begin
              oSupremaServer := TSupremaServer.Create(nil);
              oSupremaServer.FNSEQ := FindField('FN_DEVICESEQ').asInteger;
              oSupremaServer.DEVICEIP := FindField('FN_DEVICEIP').AsString;
              oSupremaServer.DEVICENAME := FindField('FN_DEVICENAME').AsString;
              oSupremaServer.DEVICEPORT := FindField('FN_DEVICEPORT').AsString;
              oSupremaServer.DEVICETYPE := FindField('FN_DEVICETYPE').AsString;      //inttostr(G_nFingerReaderType);
              oSupremaServer.CPTYPE := FindField('CP_TYPE').AsString;
              oSupremaServer.NODENO := FindField('ND_NODENO').asInteger;
              oSupremaServer.ECUID := FindField('DE_ECUID').AsString;
              oSupremaServer.EXTENDID := FindField('DE_EXTENDID').asInteger;
              oSupremaServer.CONTROLNO := FindField('DO_DOORNO').asInteger;
              oSupremaServer.FingerDeviceID := FindField('FN_FINGERDEVICEID').asInteger;
              oSupremaServer.OnReaderConnected := ReaderConnected;
              oSupremaServer.OnCardSendingChange := CardSendingChange;
              oSupremaServer.OnFingerCardEvent := FingerCardEvent;
              FingerReaderList.AddObject(FillZeroNumber(FindField('FN_DEVICESEQ').asInteger,G_nNodeCodeLength),oSupremaServer);

              stSql := ' Update TB_FINGERDEVICECARD set FD_SEND = ''R'' ' ;   //추가 되는 장비는 다시 재전송하자.
              stSql := stSql + ' Where FN_DEVICESEQ = ' + FindField('FN_DEVICESEQ').AsString;
              stSql := stSql + ' AND FD_SEND = ''S'' ';

              dmDataBase.ProcessExecSQL(stSql);

            end else
            begin
              TSupremaServer(FingerReaderList.Objects[nIndex]).FNSEQ := FindField('FN_DEVICESEQ').asInteger;
              TSupremaServer(FingerReaderList.Objects[nIndex]).DEVICEIP := FindField('FN_DEVICEIP').AsString;
              TSupremaServer(FingerReaderList.Objects[nIndex]).DEVICENAME := FindField('FN_DEVICENAME').AsString;
              TSupremaServer(FingerReaderList.Objects[nIndex]).DEVICEPORT := FindField('FN_DEVICEPORT').AsString;
              TSupremaServer(FingerReaderList.Objects[nIndex]).DEVICETYPE := FindField('FN_DEVICETYPE').AsString;      //inttostr(G_nFingerReaderType);
              TSupremaServer(FingerReaderList.Objects[nIndex]).CPTYPE := FindField('CP_TYPE').AsString;
              TSupremaServer(FingerReaderList.Objects[nIndex]).NODENO := FindField('ND_NODENO').asInteger;
              TSupremaServer(FingerReaderList.Objects[nIndex]).ECUID := FindField('DE_ECUID').AsString;
              TSupremaServer(FingerReaderList.Objects[nIndex]).EXTENDID := FindField('DE_EXTENDID').asInteger;
              TSupremaServer(FingerReaderList.Objects[nIndex]).CONTROLNO := FindField('DO_DOORNO').asInteger;
              TSupremaServer(FingerReaderList.Objects[nIndex]).FingerDeviceID := FindField('FN_FINGERDEVICEID').asInteger;
            end;
            dmDBUpdate.UpdateTB_FINGERDEVICE_Field_StringValue(FindField('FN_DEVICESEQ').AsString,'FN_CHANGE','N'); //변경된게 없다
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
  Finally
    L_bLoadLock := False;
  End;
end;

procedure TfmMain.LoadFingerDevice;
var
  stSql : string;
  oSupremaServer : TSupremaServer;
  TempAdoQuery : TAdoQuery;
begin
  if G_nFingerRelayType = 2 then
  begin
    dmSHFDBRelay.DataBaseConnect(G_nFingerRelayDBType,G_stFingerRelayDBIP,G_stFingerRelayDBPort,G_stFingerRelayDBUserID,G_stFingerRelayDBUserPW,G_stFingerRelayDBName);
    //DB연동 타입이면 여기서 로딩 하면 충돌이 난다.
    Exit;
  end;
  UnLoadFingerDevice;
  if L_bLoadLock then Exit;
  L_bLoadLock := True;
  Try
    stSql := ' select * from TB_FINGERDEVICE  ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';
//    stSql := stSql + ' AND FN_DEVICETYPE = ''' + inttostr(G_nFingerReaderType) + ''' ';
    stSql := stSql + ' Order by FN_DEVICESEQ ';

    if NodeList = nil then NodeList := TStringList.Create;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //에러처리
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          oSupremaServer := TSupremaServer.Create(nil);
          oSupremaServer.FNSEQ := FindField('FN_DEVICESEQ').asInteger;
          oSupremaServer.DEVICEIP := FindField('FN_DEVICEIP').AsString;
          oSupremaServer.DEVICENAME := FindField('FN_DEVICENAME').AsString;
          oSupremaServer.DEVICEPORT := FindField('FN_DEVICEPORT').AsString;
          oSupremaServer.DEVICETYPE := FindField('FN_DEVICETYPE').AsString;      //inttostr(G_nFingerReaderType);
          oSupremaServer.CPTYPE := FindField('CP_TYPE').AsString;
          oSupremaServer.NODENO := FindField('ND_NODENO').asInteger;
          oSupremaServer.ECUID := FindField('DE_ECUID').AsString;
          oSupremaServer.EXTENDID := FindField('DE_EXTENDID').asInteger;
          oSupremaServer.CONTROLNO := FindField('DO_DOORNO').asInteger;
          oSupremaServer.FingerDeviceID := FindField('FN_FINGERDEVICEID').asInteger;
          oSupremaServer.OnReaderConnected := ReaderConnected;
          oSupremaServer.OnCardSendingChange := CardSendingChange;
          oSupremaServer.OnFingerCardEvent := FingerCardEvent;
          FingerReaderList.AddObject(FillZeroNumber(FindField('FN_DEVICESEQ').asInteger,G_nNodeCodeLength),oSupremaServer);
          dmDBUpdate.UpdateTB_FINGERDEVICE_Field_StringValue(FindField('FN_DEVICESEQ').AsString,'FN_CHANGE','N'); //변경된게 없다
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
    L_bLoadLock := False;
  End;
end;

procedure TfmMain.LoadTB_CONFIG;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  dmSHFReaderServer.ServerStart := False;
  G_nFingerReaderType := 2;
  G_nFingerRelayType := 1;
  G_nFingerServerPort := 7006;
  stSql := ' select * from TB_CONFIG  ';
  stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''FINGER'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      while Not Eof do
      begin
        if FindField('CO_CONFIGCODE').AsString = 'TYPE' then G_nFingerReaderType := FindField('CO_CONFIGVALUE').AsInteger
        else if FindField('CO_CONFIGCODE').AsString = 'RELAYTYPE' then G_nFingerRelayType := FindField('CO_CONFIGVALUE').AsInteger
        else if FindField('CO_CONFIGCODE').AsString = 'RELAYDBTYPE' then G_nFingerRelayDBType := FindField('CO_CONFIGVALUE').AsInteger
        else if FindField('CO_CONFIGCODE').AsString = 'RELAYDBIP' then G_stFingerRelayDBIP := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'RELAYDBPORT' then G_stFingerRelayDBPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'RELAYDBUSER' then G_stFingerRelayDBUserID := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'RELAYDBUSERPW' then G_stFingerRelayDBUserPW := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'RELAYDBNAME' then G_stFingerRelayDBName := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'READERUSERLEN' then G_nFPUserIDLength := FindField('CO_CONFIGVALUE').AsInteger
        else if FindField('CO_CONFIGCODE').AsString = 'READERCARDLEN' then G_nFPUserCardLength := FindField('CO_CONFIGVALUE').AsInteger
        else if FindField('CO_CONFIGCODE').AsString = 'SERVERPORT' then G_nFingerServerPort := FindField('CO_CONFIGVALUE').AsInteger
        ;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if G_nFingerRelayType = 3 then
  begin
    SHFFingerRegTimer.Enabled := True;
    dmSHFReaderServer.ServerPort := G_nFingerServerPort;
    dmSHFReaderServer.ServerStart := True;
  end;
end;

procedure TfmMain.LoadTB_FINGERAPPROVALNUM;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  nIndex : integer;
begin
  stSql := ' select * from TB_FINGERAPPROVALNUM  ';
  stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';
  stSql := stSql + ' AND FD_SEND = ''N'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      while Not Eof do
      begin
        nIndex := FingerReaderList.IndexOf(FillZeroNumber(FindField('FN_DEVICESEQ').asInteger,G_nNodeCodeLength));
        if nIndex > -1 then
        begin
          //성현지문리더가 있는 경우에만 Getapprovalnum 하자.
          if TSupremaServer(FingerReaderList.Objects[nIndex]).SetFingerApprovalNum(FindField('CA_POSITIONNUM').AsInteger) then
             dmDBUpdate.UpdateTB_FINGERAPPROVALNUM_Field_StringValue(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString,'FD_SEND','S')
          else dmDBUpdate.UpdateTB_FINGERAPPROVALNUM_Field_StringValue(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString,'FD_SEND','F');
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
          //Screen.Forms[i].WindowState := wsMaximized;
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

function TfmMain.MDIForm(FormName: string): TForm;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        result := Screen.Forms[i];
        Exit;
      end;
    end;
  end;
end;

procedure TfmMain.MemoryInitialize;
begin
  G_bApplicationTerminate := False;

  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  L_stLogDirectory := ExtractFileDir(Application.ExeName) + '\..\log';
  dmDataBase.OnAdoConnected := DataModuleAdoConnected;

  L_bEmployeePermitLoding := False;
end;

procedure TfmMain.mn_ControlerStateClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmFingerDeviceState');
  self.FindClassForm('TfmFingerDeviceState').FindCommand('MENUID').Params.Values['ID'] := 'BM2_02';
  self.FindClassForm('TfmFingerDeviceState').FindCommand('MENUID').Execute;
  self.FindClassForm('TfmFingerDeviceState').FindCommand('FORMNAME').Params.Values['CAPTION'] := mn_ControlerState.Caption;
  self.FindClassForm('TfmFingerDeviceState').FindCommand('FORMNAME').Execute;

end;

procedure TfmMain.mn_FingerDeviceClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmFingerDevice');
  self.FindClassForm('TfmFingerDevice').FindCommand('MENUID').Params.Values['ID'] := 'BM2_01';
  self.FindClassForm('TfmFingerDevice').FindCommand('MENUID').Execute;
  self.FindClassForm('TfmFingerDevice').FindCommand('FORMNAME').Params.Values['CAPTION'] := mn_FingerDevice.Caption;
  self.FindClassForm('TfmFingerDevice').FindCommand('FORMNAME').Execute;

end;

procedure TfmMain.mn_MonitorClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmDeviceComMonitoring');
  self.FindClassForm('TfmDeviceComMonitoring').FindCommand('MENUID').Params.Values['ID'] := 'BM3_011';
  self.FindClassForm('TfmDeviceComMonitoring').FindCommand('MENUID').Execute;
  self.FindClassForm('TfmDeviceComMonitoring').FindCommand('FORMNAME').Params.Values['CAPTION'] := mn_Monitor.Caption;
  self.FindClassForm('TfmDeviceComMonitoring').FindCommand('FORMNAME').Execute;

end;

procedure TfmMain.mn_trayCloseClick(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.mn_trayVisibleClick(Sender: TObject);
begin
  inherited;
  TrayIcon1DblClick(self);
end;

procedure TfmMain.PermitEmployeeToCardTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  Try
    if Not L_bDaemonStarted then Exit; //데몬이 시작되지 않은 동안에는 작업 하지 말자.

    PermitEmployeeToCardTimer.Enabled := False;
    if EmployeePermitLoad then
    begin
      //다운로드 할 자료가 있으면 자료 송신
      PermitEmployeeToCardTimer.Interval := 200;
      //PermitEmployeeToCardTimer.Enabled := True;
      //FingersendTimer.Enabled := True;
    end else
    begin
      PermitEmployeeToCardTimer.Interval := 1000;   //없으면 5초 후에 체크하자
      //PermitEmployeeToCardTimer.Enabled := Not G_bApplicationTerminate;    //다운로드 할 자료가 없으면 다시 체크
    end;
  Finally
    FingersendTimer.Enabled := Not G_bApplicationTerminate; //한번 읽고 무조건 한번 전송 하자.
  End;

end;

procedure TfmMain.ReaderConnected(Sender: TObject; aFNDEVICESEQ: integer;
  aValue: Boolean);
var
  fmTemp : TForm;
begin
  if G_bFormEnabled[conFORMFINGERDEVICESTATE] then
  begin
    fmTemp := MDIForm('TfmFingerDeviceState');
    if fmTemp <> nil then TfmFingerDeviceState(fmTemp).ReaderConnected(aFNDEVICESEQ,aValue);
  end;

end;

procedure TfmMain.SendTimerCheckTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;

  if (Not PermitEmployeeToCardTimer.Enabled) and (Not FingersendTimer.Enabled)   then PermitEmployeeToCardTimer.Enabled := True;
  //if (Not FingersendTimer.Enabled)   then FingersendTimer.Enabled := True;
end;

procedure TfmMain.SHFFingerRegTimerTimer(Sender: TObject);
begin
  inherited;
  //여기에서 TB_FINGERAPPROVALNUM 체크하자.
  SHFFingerRegTimer.Enabled := False;
  Try
    LoadTB_FINGERAPPROVALNUM;
  Finally
    if G_nFingerRelayType = 3 then
    begin
      SHFFingerRegTimer.Enabled := True;
    end;
  End;

end;

procedure TfmMain.SHFReaderServerEvent(Sender: TObject; aClientIP, aCmd, aData1,
  aData2: string);
var
  fmTemp : TForm;
  nFingerDeviceSeq : integer;
  nIndex : integer;
  stFingerData:string;
  stEmSeq : string;
begin
//패킷 송수신 부분 체크
  if aCmd = 'RX' then
  begin
    if G_bFormEnabled[conFORMFINGERCOMMONITORING] then
    begin
      fmTemp := MDIForm('TfmDeviceComMonitoring');
      if fmTemp <> nil then TfmDeviceComMonitoring(fmTemp).FingerCardEvent(aClientIP , aCmd,aData1,aData2,'');
    end;
  end else if aCmd = 'RE' then
  begin
    nFingerDeviceSeq := dmDBFunction.GetTB_FINGERAPPROVALNUM_FingerDeviceSeq(aClientIP,aData1,aData2,stEmSeq);
    if nFingerDeviceSeq = -1 then Exit;
    nIndex := FingerReaderList.IndexOf(FillZeroNumber(nFingerDeviceSeq,G_nNodeCodeLength));
    if nIndex > -1 then
    begin
      stFingerData := TSupremaServer(FingerReaderList.Objects[nIndex]).GetFingerData(aData1);
      if stFingerData <> '' then
      begin
        if dmDBFunction.CheckTB_EMPLOYEEFINGER_Value(stEmSeq,'1') = 1 then
        begin
          dmDBUpdate.UpdateTB_EMPLOYEEFINGER_Field_StringValue(stEmSeq,'1','EF_TEMPLATE1_1',stFingerData);
        end else
        begin
          dmDBInsert.InsertIntoTB_EMPLOYEEFINGER_Template(stEmSeq,'1',stFingerData,'','','','','');
        end;
        dmDBUpdate.UpdateTB_FINGERAPPROVALNUM_Field_StringValue(inttostr(nFingerDeviceSeq),aData1,'FD_SEND','Y');
      end;
      TSupremaServer(FingerReaderList.Objects[nIndex]).SocketOpen := False;
    end;
  end;
end;

procedure TfmMain.StartMenuMenuItems1Click(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.SyncTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if FingerReaderList.Count < 1 then Exit;
  if L_nSyncTimeSendSeq > FingerReaderList.Count - 1 then L_nSyncTimeSendSeq := 0;

  TSupremaServer(FingerReaderList.Objects[L_nSyncTimeSendSeq]).SyncTimeSend;
  inc(L_nSyncTimeSendSeq);
//
end;

procedure TfmMain.TimerStop;
begin
  TrayTimer.Enabled := False;
  FingerDeviceConnectCheckTimer.Enabled := False;
  PermitEmployeeToCardTimer.Enabled := False;
  FingersendTimer.Enabled := False;
  FingerDeviceLoadTimer1.Enabled := False;
  SyncTimer.Enabled := False;
  SHFFingerRegTimer.Enabled := False;
end;

procedure TfmMain.TrayIcon1DblClick(Sender: TObject);
begin
  inherited;
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
//  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;

end;

procedure TfmMain.UnLoadFingerDevice;
var
  i : integer;
begin
  if FingerReaderList.Count < 1 then Exit;
  for i := FingerReaderList.Count - 1 downto 0 do
  begin
    if TSupremaServer(FingerReaderList.Objects[i]).Connected then TSupremaServer(FingerReaderList.Objects[i]).SocketOPEN := False;
    TSupremaServer(FingerReaderList.Objects[i]).Free;
  end;
  FingerReaderList.Clear;
end;

procedure TfmMain.WinUserMSG(var msg: TMessage);
begin
  if Msg.WParam = SC_MAXIMIZE then
  begin
    TrayIcon1DblClick(self);
  end;

end;

end.
