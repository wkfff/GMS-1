unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,ADODB,ActiveX,DB,
  Vcl.ExtCtrls,Vcl.Themes, Vcl.Menus,System.IniFiles,JclMime;

type
  TAccessPermit = Class(TComponent)
  private
    FAccessPermitCode: string;
    FAccessPermitName: string;
  published
    property AccessPermitCode : string read FAccessPermitCode write FAccessPermitCode;
    property AccessPermitName : string read FAccessPermitName write FAccessPermitName;
  End;

  TReaderDoorPosition = Class(TComponent)
  private
    FDoorPositionName: string;
    FDoorPositionCode: string;
  published
    property DoorPositionCode : string read FDoorPositionCode write FDoorPositionCode;
    property DoorPositionName : string read FDoorPositionName write FDoorPositionName;
  End;

  TfmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ed_UserID: TEdit;
    ed_UserPW: TEdit;
    btn_Login: TSpeedButton;
    btn_Cancel: TSpeedButton;
    ServerConnectTimer: TTimer;
    pm_Style: TPopupMenu;
    MetropolisUIDark1: TMenuItem;
    MetropolisUIBlack1: TMenuItem;
    MetropolisUIBlue1: TMenuItem;
    MetropolisUIGreen1: TMenuItem;
    procedure btn_LoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure ed_UserIDKeyPress(Sender: TObject; var Key: Char);
    procedure ed_UserPWKeyPress(Sender: TObject; var Key: Char);
    procedure ServerConnectTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MetropolisUIDark1Click(Sender: TObject);
    procedure MetropolisUIBlack1Click(Sender: TObject);
    procedure MetropolisUIBlue1Click(Sender: TObject);
    procedure MetropolisUIGreen1Click(Sender: TObject);
  private
    AccessPermitCodeList : TstringList;
    ReaderDoorPositionCodeList : TstringList;
    L_bDeviceStateChecking : Boolean;
    L_nCurrentCheckNodeSeq : integer;
    L_nDeviceStateCheckCount : integer;
    FProgramGubun: string;
    FLogined: Boolean;
    FSYSADMIN: Boolean;
    { Private declarations }
    Function CheckLogin(aUserID,aUserPW:string):Boolean;
    procedure SetLogined(const Value: Boolean);
    procedure SetSYSADMIN(const Value: Boolean);
  private
    procedure LoadingAccessPermitCodeList;
    procedure LoadingArmAreaList;
    procedure LoadingBuilding;
    procedure LoadingDoorList;
    procedure LoadingReaderDoorPositionList;
    procedure LoadingTB_DECODER(aDecoderNo:string='');
    procedure LoadTB_CONFIG;
    procedure MemoryClear;
    procedure MemoryCreate;
    procedure MemoryFree;
    procedure TimerStop;
    procedure UnLoadingAccessPermitCodeList;
    procedure UnLoadingBuilding;
    procedure UnLoadingNodeList;
    procedure UnLoadingReaderDoorPositionList;
    procedure UnLoadingTB_DECODER;
  private
    procedure MonitoringRefresh;
  private
    procedure AlarmConfirm(Sender: TObject);
    procedure ArmAreaCurrentAlarmStateChange(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(Sender: TObject; aDecoderNo:integer; aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure BuildingAlarmStateChange(Sender: TObject;  aBuildingCode:string;aAlarmState : integer);
    procedure BuildingSecurityModeChange(Sender: TObject;  aBuildingCode:string;aMode : integer);
    procedure BuildingDoorStateCountChange(Sender: TObject;  aBuildingCode:string;aState,aCount : integer);
    procedure ClientConfigIniSetting; //INI 파일 읽어서 메모리 설정
    procedure DeviceAlarmEvent(Sender: TObject;aDecoderNo:integer;aNodeNo,aECUID,aExtendID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                             aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView,aAlarmSound,aAlarmColor:string;aRealTime:Boolean=True);
    procedure DeviceCardAccessEvent(Sender: TObject;aDecoderNo:integer;aTime,aNodeNo, aEcuID,aDoorNo,aReaderNo,aInOut,aCardMode,aDoorMode,
                             aChangeState,aAccessResult,aDoorState,aATButton,aType,aArmAreaNo,aCardno,aCompanyCode,
                             aCompanyName,aEmSeq,aEmCode,aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone:string);
    procedure DeviceChangeEvent(Sender: TObject; aDecoderNo:integer; aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
    procedure DoorChangeEvent(Sender: TObject;  aDecoderNo:integer;aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure NodeChangeEvent(Sender: TObject; aDecoderNo:integer; aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
    procedure ServerConnected(Sender: TObject; aDecoderNo:integer; aConnected:Boolean);
    procedure ServerPacketView(Sender: TObject;  aTxRx,aClientIP,aData,aResult:string);
    procedure ServerNetworkState(Sender: TObject;  aDecoderNo:integer;aServerIP,aData:string);
  public
    procedure SetStyle(aStyle:string);
  public
    ProgIDs,Grade : String;
    { Public declarations }
    Property Logined : Boolean read FLogined write SetLogined;
    property ProgramGubun : string read FProgramGubun write FProgramGubun;
    Property SYSADMIN : Boolean read FSYSADMIN write SetSYSADMIN;
  end;

var
  fmLogin: TfmLogin;

implementation

uses
  uMonitoringMain,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDataBaseConfig,
  uDBInsert,
  uDBFormMessage,
  uDBFunction,
  uDBSelect,
  uFormDeviceState,
  uFormVariable,
  uLoginVariable,
  uPCClient;

{$R *.dfm}

procedure TfmLogin.AlarmConfirm(Sender: TObject);
begin
  fmMonitoringMain.AlarmConfirm;
end;

procedure TfmLogin.ArmAreaCurrentAlarmStateChange(Sender: TObject;aDecoderNo:integer; aNodeNo,
  aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
begin
  if fmMonitoringMain <> nil then
    fmMonitoringMain.ArmAreaCurrentAlarmStateChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode);
end;

procedure TfmLogin.ArmAreaSecurityModeChange(Sender: TObject; aDecoderNo:integer;aNodeNo, aEcuID,
  aArmAreaNo, aMode, aBuildingCode: string);
begin
  if fmMonitoringMain <> nil then
     fmMonitoringMain.ArmAreaSecurityModeChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode);
end;

procedure TfmLogin.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLogin.btn_LoginClick(Sender: TObject);
begin
  CheckLogin(ed_UserID.Text,ed_UserPw.text);
  if Not Logined then
  begin
    showmessage('아이디와 비밀번호를 확인하여 주세요.');
    Exit;
  end;
  //여기서 장비 로딩 하자.
  LoadingBuilding;
  LoadingDoorList;
  LoadingArmAreaList;


  Hide;
  fmMonitoringMain.Show;
  fmMonitoringMain.BringToFront;
  //ServerConnectTimer.Enabled := True;
end;


procedure TfmLogin.BuildingAlarmStateChange(Sender: TObject;
  aBuildingCode: string; aAlarmState: integer);
begin
  fmMonitoringMain.BuildingAlarmStateChange(aBuildingCode,aAlarmState);
end;

procedure TfmLogin.BuildingDoorStateCountChange(Sender: TObject;
  aBuildingCode: string; aState, aCount: integer);
begin
  fmMonitoringMain.BuildingDoorStateCountChange(aBuildingCode,aState, aCount);
end;

procedure TfmLogin.BuildingSecurityModeChange(Sender: TObject;
  aBuildingCode: string; aMode: integer);
begin
  fmMonitoringMain.BuildingSecurityModeChange(aBuildingCode,aMode);
end;

function TfmLogin.CheckLogin(aUserID, aUserPW: string): Boolean;
var
  stGrade: String;
  stUserName: String;
  stSql: String;
  TempAdoQuery : TADOQuery;
  stMessage : string;
  stTime : string;
  stClientIP : string;
begin
  stClientIP:= GetLocalIPAddr;
  G_bIsMaster := False;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

    ProgIDs:=''; //사용가능한 프로그램 목록 초기화

    If SYSADMIN then
    begin
      G_bIsMaster := True;
      G_nAdminCompanyGrade := 0;
      G_nAdminBuildingType :=0; //0:전체,1:빌딩,2:층,3:구역,4:출입문단위

      //시스템 어드민 이면 비밀번호만 체크
      Logined  := True ;
      //모든 권한을 다 줌
      G_LogInfo.Log_Note:= 'Login Success';
      dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,'SYSADMIN','0','00','','0',con_ComLogTYPE_PROGRAM,'Login Success');

      if G_bIsMaster then
      begin
        ProgIDs:='';
        With  TempAdoQuery  do
        Begin
            //모든 권한을 셋팅
            stSql := 'Select FN_NAMECODE from TB_FORMNAME';
            stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
            stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + ProgramGubun + ''' ';
            stSql := stSql + ' AND FN_MENUGUBUN = ''1'' ';
            Close;
            SQL.Clear;
            SQL.Text := stSql;

            Try
              Open;
            Except
              on E : EDatabaseError do
                begin
                  ShowMessage(E.Message );
                  Exit;
                end;
            End;   //Try End

            While Not Eof do Begin
               ProgIDs:=
                   ProgIDs + Trim(FieldByName('FN_NAMECODE').AsString) + ';' ;
               Next;
            End //While End
        End;   //With End
      end;

      G_stAdminUserID := 'SYSADMIN';
      G_stAdminUserName := 'System';
      G_stAdminCompanyCode := '0';
      G_stAdminEmGroupCode := '0';
      Grade := '1';
      exit;
    End;  //IF End

    with  TempAdoQuery  do
    begin
      stSql := 'Select * from TB_ADMIN ';
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + Trim(aUserID) + ''' ';
      stSql := stSql + ' AND AD_USERPW = ''' + MimeEncodeString(Trim(aUserPw)) + ''' ';
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
         Logined  := False ;
         Exit;
      End;

      if RecordCount < 1 then
      begin
        stMessage := dmFormMessage.GetMessage('PASSWORDCHECKERROR');
        Application.messagebox(PChar(stMessage),PChar('Fail'),mb_OK);
        Logined  := False ;
        Exit;
      end;

      stGrade:=  FindField('AG_GRADECODE').asString;
      stUserName:=   FindField('AD_USERNAME').asString;
      if FindField('AD_MASTER').AsString = '1' then
      begin
        G_bIsMaster := True ;
        G_nAdminCompanyGrade := 0;
        G_nAdminBuildingType := 0;
        G_stAdminEmGroupCode := '0';
      end else
      begin
        G_bIsMaster := False;
        G_stAdminCompanyCode := FindField('CO_COMPANYCODE').AsString;
        G_stAdminBuildingCode := FindField('BC_BUILDINGCODE').AsString;
        if Not IsDigit(FindField('AD_BUILDINGTYPE').AsString) then G_nAdminBuildingType := 1
        else G_nAdminBuildingType := FindField('AD_BUILDINGTYPE').Asinteger;
        G_stAdminEmGroupCode := FindField('EM_GROUPCODE').AsString;
      end;
    end;
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,aUserID,'0','00','','0',con_ComLogTYPE_PROGRAM,'Login Success');

    //로그인 성공시
    G_stAdminUserID := aUserID;
    G_stAdminUserName := stUserName;
    Logined  := True ;
    Grade := stGrade;

    //IsMaster := MasterCheck(edUserID.text);

    if G_bIsMaster then
    begin
      ProgIDs:='';
      With  TempAdoQuery  do
      Begin
          //모든 권한을 셋팅
          stSql := 'Select FN_NAMECODE from TB_FORMNAME';
          stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
          stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + ProgramGubun + ''' ';
          stSql := stSql + ' AND FN_MENUGUBUN = ''1'' ';
          Close;
          SQL.Clear;
          SQL.Text := stSql;

          Try
            Open;
          Except
            on E : EDatabaseError do
              begin
                ShowMessage(E.Message );
                Exit;
              end;
          End;   //Try End

          While Not Eof do Begin
             ProgIDs:=
                 ProgIDs + Trim(FieldByName('FN_NAMECODE').AsString) + ';' ;
             Next;
          End //While End
      End;   //With End
    end else
    begin
      //권한체크
      ProgIDs:='';
      With  TempAdoQuery  do
      Begin
          //모든 권한을 셋팅
          stSql := 'Select FN_NAMECODE from TB_ADMINGRADEPROGRAM ';
          stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
          stSql := stSql + ' AND AG_GRADECODE = ''' + stGrade + ''' ';
          stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + ProgramGubun + ''' ';
          stSql := stSql + ' AND FN_MENUGUBUN = ''1'' ';
          Close;
          SQL.Clear;
          SQL.Text := stSql;
          Try
            Open;
          Except
            on E : EDatabaseError do
              begin
                ShowMessage(E.Message  );
                Exit;
              end;
          End;   //Try End
          While Not Eof do Begin
             ProgIDs:=
                 ProgIDs + Trim(FieldByName('FN_NAMECODE').AsString) + ';' ;
             Next;
          End //While End
      End;   //With End
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmLogin.ClientConfigIniSetting;
var
  ini_fun : TiniFile;
  stType : string;
  i : integer;
  nTemp : integer;
begin
  inherited;
  G_nReportSearchType := 0;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\ACCMonitoring.INI');
    with ini_fun do
    begin
      if ReadString('Config','OpenModeOpenState','N') = 'Y' then G_bDoorOpenModeOpenStateUse := True
      else G_bDoorOpenModeOpenStateUse := False;
      if ReadString('Config','AccessEventSound','N') = 'Y' then G_bDoorAccessEventSoundOnUse := True
      else G_bDoorAccessEventSoundOnUse := False;
      G_stACMonitorAlaramFile := ReadString('Config','AccessAlarmFile','사이렌01.mp3');
      if ReadString('Config','AlarmEventSound','Y') = 'Y' then G_bAlarmEventSoundOnUse := True
      else G_bAlarmEventSoundOnUse := False;
      if ReadString('Config','AlarmMessage','Y') = 'Y' then G_bAlarmEventMessageUse := True
      else G_bAlarmEventMessageUse := False;
      if ReadString('Config','AccessAlarmEventSound','Y') = 'Y' then G_bAccessAlarmEventSoundOnUse := True
      else G_bAccessAlarmEventSoundOnUse := False;
      if ReadString('Config','AccessMessage','Y') = 'Y' then G_bAccessEventMessageUse := True
      else G_bAccessEventMessageUse := False;

      G_stAlarmEventAlaramFile := ReadString('Config','AlarmEventFile','사이렌01.mp3');
      G_nAlarmSoundCount := ReadInteger('Config','AlarmCount',1);

      if ReadString('Config','ExampleView','Y') = 'Y' then G_bMonitorIntroView := True
      else G_bMonitorIntroView := False;
      if ReadString('Config','LOCKMODEVIEW','N') = 'Y' then G_bDoorColseModeUse := True
      else G_bDoorColseModeUse := False;

      G_stAccessEventAlaramFile := ReadString('Config','AccessAlarmFile','');
      G_nAccessSoundCount := ReadInteger('Config','AccessAlarmCount',1);
      if ReadInteger('Config','CardManageModeView',1) = 1 then G_bCardModeShow := True
      else G_bCardModeShow := False;

      if ReadInteger('Config','Key',1) = 0 then G_bKeyCheck := False
      else G_bKeyCheck := True;

      G_nMoitorLoginStart:= ReadInteger('Config','LoginMonitorStart',0); //로그인시 모니터링 시작
      G_nMonitorGubun := ReadInteger('Config','Monitoring',0); //모니터링 시 전체모니터링 0,맵모니터링 1
      if ReadInteger('Config','BuildingSearch',1) = 1 then G_bBuildingMonitoringShow := True
      else G_bBuildingMonitoringShow := False;
      nTemp := ReadInteger('Config','ACPTType',0);
      if nTemp = 0 then
      begin
        G_bAccessMonitoringUse := True ;
        G_bAlarmMonitoringUse := True;
      end else if nTemp = 1 then
      begin
        G_bAccessMonitoringUse := True ;
        G_bAlarmMonitoringUse := False;
      end else
      begin
        G_bAccessMonitoringUse := False ;
        G_bAlarmMonitoringUse := True;
      end;
      G_stDefaultRelayCode := ReadString('Config','RelayCode','001');

      G_nCardRegisterType := ReadInteger('Config','CardRegType',0);  //0.일반등록기,1.슈프리마지문등록기
      G_nCardRegisterPort := ReadInteger('Config','CardRegPort',0);
      G_stCardRegisterIP := ReadString('Config','CardRegIP','');
      G_stCardRegisterFingerPort := ReadString('Config','CardFingerRegPort','1471');
      G_nCardCreatePort := ReadInteger('CARDCREATE','COMPORT',0);
      G_nBuildingStep := ReadInteger('Config','Building',1);

      G_nDoorStateUse := ReadInteger('Config','DOORSTATEUSE',1);

      G_nBMSType := ReadInteger('Config','BMSTYPE',2);

      G_nFormLanguageType := ReadInteger('Config','Language',G_nFormLanguageType);

    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmLogin.DeviceAlarmEvent(Sender: TObject;aDecoderNo:integer; aNodeNo, aECUID, aExtendID,
  aCmd, aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode,
  aLoop, aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string; aRealTime: Boolean);
begin
  if fmMonitoringMain <> nil then
  begin
    fmMonitoringMain.DeviceAlarmEvent(aDecoderNo,aNodeNo, aECUID, aExtendID,aCmd, aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode,
    aLoop, aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
    aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
    aAlarmColor,aRealTime);
  end;
end;

procedure TfmLogin.DeviceCardAccessEvent(Sender: TObject; aDecoderNo:integer;aTime, aNodeNo,
  aEcuID, aDoorNo, aReaderNo, aInOut, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aDoorState, aATButton, aType, aArmAreaNo, aCardno,
  aCompanyCode, aCompanyName, aEmSeq, aEmCode, aEmName, aPosiCode,
  aPosiName,aPrintNo,aHandPhone: string);
var
  stInOutName : string;
  stAccessPermitName : string;
  nIndex : integer;
begin
  stInOutName := '';
  stAccessPermitName := '';
  nIndex := ReaderDoorPositionCodeList.IndexOf(aInOut);
  if nIndex > -1 then
  begin
    stInOutName := TReaderDoorPosition(ReaderDoorPositionCodeList.Objects[nIndex]).DoorPositionName;
  end;
  nIndex := AccessPermitCodeList.IndexOf(aAccessResult);
  if nIndex > -1 then
  begin
    stAccessPermitName := TAccessPermit(AccessPermitCodeList.Objects[nIndex]).AccessPermitName;
  end;

  fmMonitoringMain.DeviceCardAccessEvent (aDecoderNo,aTime,aNodeNo, aEcuID,aDoorNo, aReaderNo, aInOut,stInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,stAccessPermitName,
                          aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone);

end;

procedure TfmLogin.DeviceChangeEvent(Sender: TObject; aDecoderNo:integer; aNodeNo, aEcuID, aType,
  aNo, aCmd, aData: string);
begin
  fmMonitoringMain.DeviceChangeEvent(aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData);
end;

procedure TfmLogin.DoorChangeEvent(Sender: TObject; aDecoderNo:integer;aNodeNo, aEcuID, aType, aNo,
  aCmd, aData, aBuildingCode: string);
var
  nIndex : integer;
  stDoorName : string;
  bMonitoring : Boolean;
begin
  bMonitoring := False;
  nIndex := G_MonitoringBuildingList.IndexOf('0'); //전체 빌딩 리스트에 출입문 정보 변경하자.
  if nIndex > -1 then
  begin
    TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).DoorChangeEvent(aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData);
  end;
  if Length(aBuildingCode) >= (G_nBuildingCodeLength * G_nBuildingStep + 1) then
  begin
    nIndex := G_MonitoringBuildingList.IndexOf(copy(aBuildingCode,1,1 + G_nBuildingCodeLength * G_nBuildingStep)); //해당 빌딩 리스트에 출입문 정보 변경하자.
    if nIndex > -1 then
    begin
      TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).DoorChangeEvent(aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData);
    end;
  end;
  if fmMonitoringMain <> nil then
    fmMonitoringMain.DoorChangeEvent(aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode);


end;

procedure TfmLogin.ed_UserIDKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    ed_UserPw.SetFocus;
  end;
end;

procedure TfmLogin.ed_UserPWKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    btn_LoginClick(btn_Login);
  end;

end;

procedure TfmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  if G_bApplicationTerminate then  Exit;  //이미 종료 중이다...
  G_bApplicationTerminate := True;
  UnLoadingBuilding;

  if PCClientSocketList.Count > 0 then
  begin
    for i := 0 to PCClientSocketList.Count - 1 do
    begin
      TdmPCClient(PCClientSocketList.Objects[i]).SocketConnect := False;
    end;
  end;

  TimerStop;
  MemoryClear;
  MemoryFree;

end;

procedure TfmLogin.FormCreate(Sender: TObject);
begin
  ProgramGubun := '2';
  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage(dmFormMessage.GetMessage('DBCONNECTFAIL'));
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;
  G_nMonitoringType := 1;
  MemoryCreate;
  ClientConfigIniSetting;

  LoadingReaderDoorPositionList;
  LoadingAccessPermitCodeList;
  LoadTB_CONFIG;
end;


procedure TfmLogin.LoadingBuilding;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  nTempIndex : integer;
  stBuildingCode : string;
  oBuilding : TMonitoringBuildingState;
  odmPCClient : TdmPCClient;
begin
  UnLoadingBuilding;
  stSql := dmDBSelect.SelectTB_BUILDINGCODE_All;
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

      stBuildingCode := '0';
      nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);   //전체 빌딩 코드에 출입문 추가
      if nIndex < 0 then
      begin
        oBuilding := TMonitoringBuildingState.Create(nil);
        oBuilding.BuildingCode := stBuildingCode;
        oBuilding.BuildingName := '전체';

        oBuilding.OnBuildingAlarmStateChange := BuildingAlarmStateChange;
        oBuilding.OnBuildingSecurityModeChange := BuildingSecurityModeChange;
        oBuilding.OnBuildingDoorStateCountChange := BuildingDoorStateCountChange;

        G_MonitoringBuildingList.AddObject(stBuildingCode,oBuilding);
      end;

      if RecordCount < 1 then Exit;

      while Not Eof do
      begin
        stBuildingCode := FindField('BC_BUILDINGCODE').AsString;
        nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);   //해당 빌딩 코드에 출입문 추가
        if nIndex < 0 then
        begin
          oBuilding := TMonitoringBuildingState.Create(nil);
          oBuilding.BuildingCode := stBuildingCode;
          oBuilding.BuildingName := FindField('BC_BUILDINGNAME').AsString;

          oBuilding.OnBuildingAlarmStateChange := BuildingAlarmStateChange;
          oBuilding.OnBuildingSecurityModeChange := BuildingSecurityModeChange;
          oBuilding.OnBuildingDoorStateCountChange := BuildingDoorStateCountChange;

          G_MonitoringBuildingList.AddObject(stBuildingCode,oBuilding);
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

procedure TfmLogin.LoadingAccessPermitCodeList;
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

procedure TfmLogin.LoadingArmAreaList;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  nTempIndex : integer;
  oNode : TMonitoringNode;
  stBuildingCode : string;
  oBuilding : TMonitoringBuildingState;
begin
  if G_bIsMaster then stSql := dmDBSelect.SelectTB_ARMAREA_MasterAll
  else
  begin
    if G_nAdminBuildingType = 0 then stSql := dmDBSelect.SelectTB_ARMAREA_AdminBuilding(G_stAdminUserID)
    else stSql := dmDBSelect.SelectTB_ARMAREA_AdminArmArea(G_stAdminUserID);
  end;
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
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).AddArmArea(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),
                                                                      FindField('ND_NODEIP').AsString,
                                                                      FindField('ND_NODENAME').AsString,
                                                                      FindField('DE_ECUID').AsString,
                                                                      FindField('DE_DEVICENAME').AsString,
                                                                      FindField('AR_ARMAREANO').AsString,
                                                                      FindField('AR_ARMAREANAME').AsString,
                                                                      FindField('BC_BUILDINGCODE').AsString
                                                                      );
        end;


        nIndex := G_MonitoringBuildingList.IndexOf('0');   //전체 빌딩 코드에 방범구역 추가
        if nIndex < 0 then
        begin
(*          oBuilding := TMonitoringBuildingState.Create(nil);
          oBuilding.BuildingCode := '0';
          oBuilding.BuildingName := dmDBFunction.GetTB_BUILDINGCODE_BuildingName('0');
          oBuilding.SetArmArea_Add(FindField('ND_DECODERNO').AsInteger, FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('AR_ARMAREANO').AsString,FindField('AR_ARMAREANAME').AsString);

          oBuilding.OnBuildingAlarmStateChange := BuildingAlarmStateChange;
          oBuilding.OnBuildingSecurityModeChange := BuildingSecurityModeChange;
          oBuilding.OnBuildingDoorStateCountChange := BuildingDoorStateCountChange;

          G_MonitoringBuildingList.AddObject('0',oBuilding);
*)
        end else
        begin
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetArmArea_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('AR_ARMAREANO').AsString,FindField('AR_ARMAREANAME').AsString);
//          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetArmArea_BuildingCode(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('AR_ARMAREANO').AsString,FindField('BC_BUILDINGCODE').AsString);
        end;

        stBuildingCode := FindField('BC_BUILDINGCODE').AsString;
        stBuildingCode := copy(stBuildingCode,1,1 + (G_nBuildingCodeLength * G_nBuildingStep));
        nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);   //해당 빌딩 코드에 방범구역 추가
        if nIndex < 0 then
        begin
(*          oBuilding := TMonitoringBuildingState.Create(nil);
          oBuilding.BuildingCode := stBuildingCode;
          oBuilding.BuildingName := dmDBFunction.GetTB_BUILDINGCODE_BuildingName(stBuildingCode);
          oBuilding.SetArmArea_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('AR_ARMAREANO').AsString,FindField('AR_ARMAREANAME').AsString);

          oBuilding.OnBuildingAlarmStateChange := BuildingAlarmStateChange;
          oBuilding.OnBuildingSecurityModeChange := BuildingSecurityModeChange;
          oBuilding.OnBuildingDoorStateCountChange := BuildingDoorStateCountChange;

          G_MonitoringBuildingList.AddObject(stBuildingCode,oBuilding);
          *)
        end else
        begin
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetArmArea_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('AR_ARMAREANO').AsString,FindField('AR_ARMAREANAME').AsString);
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetArmArea_BuildingCode(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('AR_ARMAREANO').AsString,FindField('BC_BUILDINGCODE').AsString);
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

procedure TfmLogin.LoadingDoorList;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  nTempIndex : integer;
  stBuildingCode : string;
  oBuilding : TMonitoringBuildingState;
  odmPCClient : TdmPCClient;
begin
  if G_bIsMaster then stSql := dmDBSelect.SelectTB_DOOR_MasterAll
  else
  begin
    if G_nAdminBuildingType = 0 then stSql := dmDBSelect.SelectTB_DOOR_AdminBuilding(G_stAdminUserID)
    else stSql := dmDBSelect.SelectTB_DOOR_AdminDoor(G_stAdminUserID);
  end;
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


        nIndex := G_MonitoringBuildingList.IndexOf('0');   //전체 빌딩 코드에 출입문 추가
        if nIndex < 0 then
        begin
(*        oBuilding := TMonitoringBuildingState.Create(nil);
          oBuilding.BuildingCode := '0';
          oBuilding.BuildingName := dmDBFunction.GetTB_BUILDINGCODE_BuildingName('0');
          oBuilding.SetDoor_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOORNAME').AsString);
          oBuilding.SetDoor_LockTypeSetting(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_LOCKTYPE').AsString);

          oBuilding.OnBuildingAlarmStateChange := BuildingAlarmStateChange;
          oBuilding.OnBuildingSecurityModeChange := BuildingSecurityModeChange;
          oBuilding.OnBuildingDoorStateCountChange := BuildingDoorStateCountChange;

          G_MonitoringBuildingList.AddObject('0',oBuilding);
*)
        end else
        begin
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetDoor_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOORNAME').AsString);
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetDoor_LockTypeSetting(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_LOCKTYPE').AsString);
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetDoor_BuildingCode(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('BC_BUILDINGCODE').AsString);
        end;


        stBuildingCode := FindField('BC_BUILDINGCODE').AsString;
        stBuildingCode := copy(stBuildingCode,1,1 + (G_nBuildingCodeLength * G_nBuildingStep ));
        nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);   //해당 빌딩 코드에 출입문 추가
        if nIndex < 0 then
        begin
(*
          oBuilding := TMonitoringBuildingState.Create(nil);
          oBuilding.BuildingCode := stBuildingCode;
          oBuilding.BuildingName := dmDBFunction.GetTB_BUILDINGCODE_BuildingName(stBuildingCode);
          oBuilding.SetDoor_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOORNAME').AsString);
          oBuilding.SetDoor_LockTypeSetting(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_LOCKTYPE').AsString);

          oBuilding.OnBuildingAlarmStateChange := BuildingAlarmStateChange;
          oBuilding.OnBuildingSecurityModeChange := BuildingSecurityModeChange;
          oBuilding.OnBuildingDoorStateCountChange := BuildingDoorStateCountChange;

          G_MonitoringBuildingList.AddObject(stBuildingCode,oBuilding);
*)
        end else
        begin
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetDoor_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOORNAME').AsString);
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetDoor_LockTypeSetting(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_LOCKTYPE').AsString);
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetDoor_BuildingCode(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('BC_BUILDINGCODE').AsString);
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

procedure TfmLogin.LoadingReaderDoorPositionList;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  oReaderDoorPosition : TReaderDoorPosition;
begin
  UnLoadingReaderDoorPositionList;
  stSql := ' Select RP_DOORPOSITIONCODE,RP_DOORPOSITIONCODENAME' + inttostr(G_nFormLanguageType) + ' as Name from TB_READERDOORPOSITIONCODE ';
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
        nIndex := ReaderDoorPositionCodeList.IndexOf(FindField('RP_DOORPOSITIONCODE').AsString);
        if nIndex < 0 then
        begin
          oReaderDoorPosition := TReaderDoorPosition.Create(nil);
          oReaderDoorPosition.DoorPositionCode := FindField('RP_DOORPOSITIONCODE').AsString;
          oReaderDoorPosition.DoorPositionName := FindField('Name').AsString;
          ReaderDoorPositionCodeList.AddObject(FindField('RP_DOORPOSITIONCODE').AsString,oReaderDoorPosition);
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

procedure TfmLogin.LoadingTB_DECODER(aDecoderNo: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
  nIndex : integer;
  oPCClientSocket : TdmPCClient;
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
        oPCClientSocket := TdmPCClient.Create(nil);
        oPCClientSocket.DecoderNo := FindField('ND_DECODERNO').AsInteger;
        oPCClientSocket.ServerIP := FindField('ND_DECODERIP').AsString;
        oPCClientSocket.ServerPort := FindField('ND_DECODERCONTROLPORT').AsInteger;
        oPCClientSocket.ServerName := FindField('ND_DECODERNAME').AsString;
        oPCClientSocket.OnArmAreaCurrentAlarmStateChange := ArmAreaCurrentAlarmStateChange;
        oPCClientSocket.OnArmAreaSecurityModeChange := ArmAreaSecurityModeChange;
        oPCClientSocket.OnAlarmConfirm := AlarmConfirm;
        oPCClientSocket.OnDeviceAlarmEvent := DeviceAlarmEvent;
        oPCClientSocket.OnDeviceCardAccessEvent := DeviceCardAccessEvent;
        oPCClientSocket.OnDeviceChangeEvent := DeviceChangeEvent;
        oPCClientSocket.OnDoorChangeEvent := DoorChangeEvent;
        oPCClientSocket.OnNodeChangeEvent := NodeChangeEvent;
        oPCClientSocket.OnSeverConnected := ServerConnected;
        oPCClientSocket.OnServerPacketView := ServerPacketView;
        oPCClientSocket.OnServerNetworkState := ServerNetworkState;

        PCClientSocketList.AddObject(FindField('ND_DECODERNO').AsString,oPCClientSocket);
        Next;
        Application.ProcessMessages;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmLogin.LoadTB_CONFIG;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    G_nCardNoType := 0; //디폴트로 고정 4Byte 사용
    G_nFormLanguageType := 1;       //폼 언어 타입 1.KOR,2.ENG
    G_nCompanyCodeLength := 3;       //
    G_nBuildingCodeLength := 3;       //
    G_nNodeCodeLength := 4;

//    G_stDaemonControlServerIP := '127.0.0.1';
//    G_stDaemonFTPPort := '3001';
    G_stLongTimeStateCode := '';

    G_bCardPositionUse := False; //카드 위치정보 사용 유무
    G_bExitButtonEventUse := False;   //출입이력만 남기자.
    G_bDoorLongTimeOpenEventUse := False;  //장시간출입문열림시 알람 이벤트 남길지 여부
    G_bDeviceCommLogSave := False;
    G_nScheduleDevice := 0;  //0.컨트롤러스케줄,1.PC스케줄
    G_bAlarmEventLengthUse := False; //알람 이벤트 처리시 고정으로 처리함(STX/KT/기타)
    G_nAlarmEventLength := 10;

    G_bDataBaseAutoBackup := TRUE;
    G_stDataBaseBackupDir := 'c:\Backup';
    G_nDataBaseBackupCycle := 10;
    G_nDataBaseACEventdeleteDay := 360;
    G_nDataBasePTEventdeleteDay := 360;
    G_bAlarmMonitoringUse := False;

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','GetTB_Config');
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
          if FindField('CO_CONFIGCODE').AsString = 'ALARMLEN' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nAlarmEventLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'COMMLOG' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bDeviceCommLogSave := False
            else G_bDeviceCommLogSave := True;
//          end else if FindField('CO_CONFIGCODE').AsString = 'DEVICESERVERPORT' then G_stDaemonDeviceServerPort := FindField('CO_CONFIGVALUE').asstring
//          else if FindField('CO_CONFIGCODE').AsString = 'FTPPORT' then G_stDaemonFTPPort := FindField('CO_CONFIGVALUE').AsString
          end else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMEALARMUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bDoorLongTimeOpenEventUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMECD' then
          begin
            G_stLongTimeStateCode := Trim(FindField('CO_CONFIGVALUE').AsString);
//          end else if FindField('CO_CONFIGCODE').AsString = 'MULTI' then
//          begin
//            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMultiDaemon := strtoint(FindField('CO_CONFIGVALUE').AsString);
//          end else if FindField('CO_CONFIGCODE').AsString = 'MULTISOCK' then G_nMultiSocket := strtoint(FindField('CO_CONFIGVALUE').asstring)
          end else if FindField('CO_CONFIGCODE').AsString = 'SCHDEVICE' then G_nScheduleDevice := strtoint(FindField('CO_CONFIGVALUE').AsString)
//          else if FindField('CO_CONFIGCODE').AsString = 'SERVERIP' then G_stDaemonControlServerIP := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'USEARMLEN' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'TRUE' then G_bAlarmEventLengthUse := False
            else G_bAlarmEventLengthUse := True;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ACEVENT' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bExitButtonEventUse := False
            else G_bExitButtonEventUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'ALARMMONITORING' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAlarmMonitoringUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'ATAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAttendDedicateDoorUse := True
            else G_bAttendDedicateDoorUse := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'BUILDINGCODELENGTH' then G_nBuildingCodeLength := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then G_nCardNoType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CAPOSINUM' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bCardPositionUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'COMPANYCODELENGTH' then G_nCompanyCodeLength := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'FDAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFoodDedicateDoorUse := True
            else G_bFoodDedicateDoorUse := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'LANGUAGE' then G_nFormLanguageType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'MAXDOORCOUNT' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitoringOnlyDoorCount := FindField('CO_CONFIGVALUE').AsInteger
            else G_nMonitoringOnlyDoorCount := 1;
          end else if FindField('CO_CONFIGCODE').AsString = 'NODELENGTH' then
          begin
            G_nNodeCodeLength := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'ONLYMAINCOUNT' then
          begin
//            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitoringOnlyMainCount := FindField('CO_CONFIGVALUE').AsInteger
//            else G_nMonitoringOnlyDoorCount := 100;
          end else if FindField('CO_CONFIGCODE').AsString = 'PGTYPE' then
          begin
            G_nMonitoringType := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'PROTOCOL' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitoringProtocol := FindField('CO_CONFIGVALUE').AsInteger
            else G_nMonitoringProtocol := 0;
          end
          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'CARD' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'DEFAULTDOORPERMITTYPE' then
          begin
            G_nCardDefaultDoorPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTARMPERMITTYPE' then
          begin
            G_nCardDefaultArmPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'DATABASE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'AUTO' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'FALSE' then G_bDataBaseAutoBackup := False;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'BACKDIR' then G_stDataBaseBackupDir := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'BACKCYCLE' then  G_nDataBaseBackupCycle := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'AC_DELETE' then G_nDataBaseACEventdeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'PT_DELETE' then G_nDataBasePTEventdeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGGROUP').AsString = 'FIRE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'USEFIREOPEN' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bFireDoorOpenUse := False
            else G_bFireDoorOpenUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'STATECODE' then
          begin
            G_stFireStateCode := FindField('CO_CONFIGVALUE').AsString;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'ANTIPASS' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ANTIFREE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
               G_nAntiFreeTimeUse := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'ANTIFREETIME' then
          begin
            G_stAntiFreeTime := FindField('CO_CONFIGVALUE').AsString;
          end;
        end;
        Next;
      end;
    end;

    if G_nAntiFreeTimeUse = 0 then G_stAntiFreeTime := '0'
    else
    begin
      if Not isDigit(G_stAntiFreeTime) then G_stAntiFreeTime := '0';
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmLogin.MemoryClear;
begin
  UnLoadingNodeList;
  if G_MonitoringBuildingList <> nil then
    G_MonitoringBuildingList.Clear;
  UnLoadingReaderDoorPositionList;
  UnLoadingAccessPermitCodeList;

end;

procedure TfmLogin.MemoryCreate;
begin
  G_MonitoringBuildingList := TStringList.Create; //빌딩별 리스트
  PCClientSocketList := TStringList.Create;
  AccessPermitCodeList := TStringList.Create;
  ReaderDoorPositionCodeList := TStringList.Create;

end;

procedure TfmLogin.MemoryFree;
begin
    if AccessPermitCodeList <> nil then
    begin
      AccessPermitCodeList.Free;
      AccessPermitCodeList := nil;
    end;
    if G_MonitoringBuildingList <> nil then
    begin
      G_MonitoringBuildingList.Free;
      G_MonitoringBuildingList := nil;
    end;
    if PCClientSocketList <> nil then
    begin
      PCClientSocketList.Free;
      PCClientSocketList := nil;
    end;
    if ReaderDoorPositionCodeList <> nil then
    begin
      ReaderDoorPositionCodeList.Free;
      ReaderDoorPositionCodeList := nil;
    end;

end;

procedure TfmLogin.MetropolisUIBlack1Click(Sender: TObject);
begin
  TStyleManager.SetStyle('Metropolis UI Black');
end;

procedure TfmLogin.MetropolisUIBlue1Click(Sender: TObject);
begin
  TStyleManager.SetStyle('Metropolis UI Blue');
end;

procedure TfmLogin.MetropolisUIDark1Click(Sender: TObject);
begin
  TStyleManager.SetStyle('Metropolis UI Dark');
end;

procedure TfmLogin.MetropolisUIGreen1Click(Sender: TObject);
begin
  TStyleManager.SetStyle('Metropolis UI Green');
end;

procedure TfmLogin.MonitoringRefresh;
var
  fmTemp : TForm;
begin
  if G_bFormEnabled[con_FormBMOSACCESSMONITOR] then
  begin
    fmMonitoringMain.MonitoringRefresh;
  end;
end;

procedure TfmLogin.NodeChangeEvent(Sender: TObject; aDecoderNo:integer;aNodeNo, aEcuID, aType, aNo,
  aCmd, aData: string);
begin
  if fmMonitoringMain <> nil then
  fmMonitoringMain.NodeChangeEvent(aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData);
end;

procedure TfmLogin.ServerConnected(Sender: TObject; aDecoderNo:integer; aConnected: Boolean);
begin
  if fmMonitoringMain <> nil then
  fmMonitoringMain.ServerConnected(aDecoderNo,aConnected);
end;

procedure TfmLogin.ServerConnectTimerTimer(Sender: TObject);
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

procedure TfmLogin.ServerNetworkState(Sender: TObject; aDecoderNo: integer;
  aServerIP,aData: string);
begin
  if fmMonitoringMain <> nil then
  fmMonitoringMain.ServerNetworkState(aDecoderNo, aServerIP,aData);

end;

procedure TfmLogin.ServerPacketView(Sender: TObject; aTxRx, aClientIP, aData,
  aResult: string);
begin
  if fmMonitoringMain <> nil then
  fmMonitoringMain.ServerPacketView(aTxRx, aClientIP, aData,aResult);
end;

procedure TfmLogin.SetLogined(const Value: Boolean);
begin
  FLogined := Value;
end;


procedure TfmLogin.SetStyle(aStyle: string);
begin
  Show;
  TStyleManager.SetStyle(aStyle);
//  Hide;
//  fmMonitoringMain.Show;
//  fmMonitoringMain.BringToFront;
end;

procedure TfmLogin.SetSYSADMIN(const Value: Boolean);
begin
  FSYSADMIN := Value;
end;

procedure TfmLogin.TimerStop;
begin
  ServerConnectTimer.Enabled := False;
end;

procedure TfmLogin.UnLoadingAccessPermitCodeList;
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

procedure TfmLogin.UnLoadingBuilding;
var
  i : integer;
begin
  if G_MonitoringBuildingList.Count < 1 then Exit;

  for i := G_MonitoringBuildingList.Count - 1 downto 0 do
    TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).Free;
  G_MonitoringBuildingList.Clear;
end;

procedure TfmLogin.UnLoadingNodeList;
begin
end;

procedure TfmLogin.UnLoadingReaderDoorPositionList;
var
  i : integer;
begin
  if ReaderDoorPositionCodeList = nil then Exit;

  for i := ReaderDoorPositionCodeList.Count - 1 downto 0 do
  begin
    TReaderDoorPosition(ReaderDoorPositionCodeList.Objects[i]).Free;
  end;
  ReaderDoorPositionCodeList.Clear;
end;

procedure TfmLogin.UnLoadingTB_DECODER;
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

end.
