unit uMain;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBar, AdvToolBarStylers, AdvPreviewMenu, CustomItemsContainer,
  AdvPreviewMenuStylers, AdvShapeButton, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, AdvGlowButton, StdCtrls, ComCtrls,
  Grids, GDIPCustomItem, ImgList, AdvOfficeHint, AdvAppStyler, AdvObj, BaseGrid,
  AdvGrid, Vcl.ExtCtrls, Vcl.Menus, AdvMenus, AdvMenuStylers,AdvStyleIF,
  Vcl.MPlayer,ActiveX,ADODB, AdvGlassButton, AdvSmoothLabel, AdvSmoothPanel,System.IniFiles,
  Data.DB,System.Win.Registry,Winapi.ShellAPI,uSubForm, CommandArray,
  Vcl.OleCtrls, SHDocVw, AdvPanel,JclMime, Vcl.Buttons, WMPLib_TLB;

const ScreenWidth  : Longint = 1024;
      ScreenHeight : Longint = 768;

type
  TReaderDoorPosition = Class(TComponent)
  private
    FDoorPositionName: string;
    FDoorPositionCode: string;
  published
    property DoorPositionCode : string read FDoorPositionCode write FDoorPositionCode;
    property DoorPositionName : string read FDoorPositionName write FDoorPositionName;
  End;

  TAccessPermit = Class(TComponent)
  private
    FAccessPermitCode: string;
    FAccessPermitName: string;
  published
    property AccessPermitCode : string read FAccessPermitCode write FAccessPermitCode;
    property AccessPermitName : string read FAccessPermitName write FAccessPermitName;
  End;

  TALARMEVENTSTATEPCCODE = Class(TComponent)
  private
    FPcCode: string;
    FAlarmEventView: string;
    FAlarmEventSound: string;
    FAlarmEventColor: integer;
  published
    property PcCode : string read FPcCode write FPcCode;
    property AlarmEventView : string read FAlarmEventView write FAlarmEventView;
    property AlarmEventSound : string read FAlarmEventSound write FAlarmEventSound;
    property AlarmEventColor : integer read FAlarmEventColor write FAlarmEventColor;
  End;

  TfmMain = class(TAdvToolBarForm)
//  TfmMain = class(TForm)
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    at_Menu: TAdvToolBarPager;
    ApBasicAdmin: TAdvPage;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    AdvShapeButton1: TAdvShapeButton;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    mn_MapAdmin: TAdvToolBar;
    mn_CodeAdmin: TAdvToolBar;
    mn_Holiday: TAdvGlowButton;
    ImageList1: TImageList;
    FontDialog1: TFontDialog;
    AdvOfficeHint1: TAdvOfficeHint;
    ColorDialog1: TColorDialog;
    ImageList3: TImageList;
    ApManager: TAdvPage;
    ApReport: TAdvPage;
    ap_Other: TAdvPage;
    ImageListNew32: TImageList;
    mn_Groupcode: TAdvGlowButton;
    mn_TimeCode: TAdvGlowButton;
    mn_BuildingCode: TAdvGlowButton;
    mn_CompanyCode: TAdvGlowButton;
    Timer1: TTimer;
    mn_BuildingMap: TAdvGlowButton;
    mn_ArmAreaMap: TAdvGlowButton;
    mn_DoorMap: TAdvGlowButton;
    mn_Card: TAdvToolBar;
    AdvPopupMenu1: TAdvPopupMenu;
    mn_PosiCodeAdd: TMenuItem;
    mn_EmployeeGubun: TMenuItem;
    pm_BasicCode: TAdvPopupMenu;
    mn_CardGubun: TMenuItem;
    mn_AccessStateCode: TMenuItem;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    AdvToolBar1: TAdvToolBar;
    mn_DoorCode: TAdvGlowButton;
    mn_ArmAreaCode: TAdvGlowButton;
    mn_Zone: TAdvGlowButton;
    mn_Employee: TAdvGlowButton;
    mn_CompanyGrade: TAdvGlowButton;
    mn_GroupGrade: TAdvGlowButton;
    mn_AccessTimeAdmin: TAdvGlowButton;
    mn_DoorSchedule1: TAdvGlowButton;
    tb_Monitoring1: TAdvToolBar;
    mn_AccessMonitoring: TAdvGlowButton;
    mn_SecurityMonitoring: TAdvGlowButton;
    mn_ServerMonitoring: TAdvGlowButton;
    tb_Monitoring2: TAdvToolBar;
    mn_MonitorState: TAdvGlowButton;
    mn_FireRecovery: TAdvGlowButton;
    mn_DaemonRestart: TAdvGlowButton;
    at_FdATReport: TAdvToolBar;
    AdvToolBar6: TAdvToolBar;
    at_ArmAreaReport: TAdvToolBar;
    AdvToolBar8: TAdvToolBar;
    mn_AccessReport: TAdvGlowButton;
    mn_AccessHistoryReport: TAdvGlowButton;
    mn_AlarmReport: TAdvGlowButton;
    mn_AlarmAreaReport: TAdvGlowButton;
    mn_ManagerReport: TAdvGlowButton;
    mn_DeviceReport: TAdvGlowButton;
    mn_AttendReport: TAdvGlowButton;
    mn_FoodReport: TAdvGlowButton;
    AdvToolBar9: TAdvToolBar;
    mn_Relay: TAdvToolBar;
    btn_EmployeeRelay: TAdvGlowButton;
    btn_ConfigSetting: TAdvGlowButton;
    btn_RemoteControl: TAdvGlowButton;
    btn_Upgrade: TAdvGlowButton;
    apAdmin: TAdvPage;
    AdvToolBar11: TAdvToolBar;
    mn_AdminGrade: TAdvGlowButton;
    mn_AdminGradeManger: TAdvGlowButton;
    mn_AdminManager: TAdvGlowButton;
    Image1: TImage;
    AdvPreviewMenuOfficeStyler2: TAdvPreviewMenuOfficeStyler;
    ImageList2: TImageList;
    StartMenu: TAdvPreviewMenu;
    AccessSoundTimer: TTimer;
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    AdvFormStyler1: TAdvFormStyler;
    SoundTimer: TTimer;
    pan_Alarm: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    btn_MessageConfirm: TAdvGlassButton;
    pan_Access: TAdvSmoothPanel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    lb_AccessMessage: TAdvSmoothLabel;
    btn_AccessConfirm: TAdvGlassButton;
    ADOExcelConnection: TADOConnection;
    ADOExcelQuery: TADOQuery;
    pan_progress: TAdvSmoothPanel;
    ProgressBar1: TProgressBar;
    CardDownLoadCheckTimer: TTimer;
    sb_Status: TAdvOfficeStatusBar;
    DeviceStateTimer: TTimer;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    ServerConnectTimer: TTimer;
    MessageTimer: TTimer;
    ImageListServerConnect: TImageList;
    ImageListServerDisConnect: TImageList;
    pm_systemReport: TAdvPopupMenu;
    mn_DoorManagementReport: TMenuItem;
    mn_AlarmManagementReport: TMenuItem;
    mn_AdminCardReport: TMenuItem;
    N9: TMenuItem;
    mn_NotUseCardReport: TMenuItem;
    N11: TMenuItem;
    mn_AdminDoorGradeReport: TMenuItem;
    mn_AdminAlarmGradeReport: TMenuItem;
    mn_EmployeeGradeSearch: TAdvGlowButton;
    pm_FoodReport: TAdvPopupMenu;
    mn_FoodStateReport: TMenuItem;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    MenuEnableImageList32: TImageList;
    MenuDisableImageList32: TImageList;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    mn_FoodReport1: TMenuItem;
    ap_FoodManager: TAdvPage;
    AdvToolBar10: TAdvToolBar;
    AdvToolBar12: TAdvToolBar;
    btn_FoodMonitoring: TAdvGlowButton;
    mn_ServerMonitoring1: TAdvGlowButton;
    AdvToolBar14: TAdvToolBar;
    btn_FoodStateReport: TAdvGlowButton;
    mn_FoodReport2: TAdvGlowButton;
    btn_FoodReaderSetting: TAdvGlowButton;
    mn_employeeManager: TAdvGlowButton;
    AdvToolBar15: TAdvToolBar;
    btn_PosiCode: TAdvGlowButton;
    btn_employeeGubun: TAdvGlowButton;
    btn_NameChange: TAdvGlowButton;
    pm_AtReport: TAdvPopupMenu;
    mn_AtManagemnet: TMenuItem;
    mn_AtSummary: TMenuItem;
    NodeConncectCheckTimer: TTimer;
    DoorStateCheckTimer: TTimer;
    btn_DepartStateReport: TAdvGlowButton;
    AdvToolBar2: TAdvToolBar;
    mn_NodeManager: TAdvGlowButton;
    mn_ControlManager: TAdvGlowButton;
    KTTMenuEnableImageList: TImageList;
    KTTMenuDisableImageList: TImageList;
    mn_ServerManager: TAdvGlowButton;
    mn_ReaderNumber: TAdvGlowButton;
    mn_telephoneoffice: TAdvGlowButton;
    mn_ReaderPasswd: TAdvGlowButton;
    lb_Message: TAdvSmoothLabel;
    mn_DoorOpenReport: TAdvGlowButton;
    mn_DoorAlarmReport: TAdvGlowButton;
    pm_EmployeeFile: TAdvPopupMenu;
    mn_employeeUploadFileFormat: TMenuItem;
    mn_EmployeeFileUpload: TMenuItem;
    SaveDialog2: TSaveDialog;
    OpenDialog2: TOpenDialog;
    mn_CardCreate: TAdvGlowButton;
    mn_EmployeeApprove: TAdvGlowButton;
    pm_EmployeeFile1: TAdvPopupMenu;
    MenuItem3: TMenuItem;
    mn_employeeUploadFileFormat1: TMenuItem;
    AdvToolBar3: TAdvToolBar;
    mn_CriticalForm: TAdvGlowButton;
    mn_ButtonEventReport: TAdvGlowButton;
    mn_TelAccessReport: TAdvGlowButton;
    pan_EmUpload: TPanel;
    Memo1: TMemo;
    btn_Confirm: TBitBtn;
    mn_FingerManager: TAdvGlowButton;
    mn_EmployeeGrade: TAdvGlowButton;
    mn_PermitResend: TAdvGlowButton;
    OpenDoorSoundTimer: TTimer;
    AdoConnectTimer: TTimer;
    mn_EmployeeFileBackup1: TMenuItem;
    mn_EmployeeFileBackup: TMenuItem;
    mn_FileUploadDupCard: TMenuItem;
    N2: TMenuItem;
    mn_EmployeeHisReport: TMenuItem;
    WindowsMediaPlayer1: TWindowsMediaPlayer;
    N1: TMenuItem;
    mn_AlarmStateCode: TMenuItem;
    pm_Map: TAdvPopupMenu;
    mn_ZoneMap: TMenuItem;
    N3: TMenuItem;
    mn_AtRelayFile: TMenuItem;
    AutoLogoutCheckTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure AccessSoundTimerTimer(Sender: TObject);
    procedure btn_AccessConfirmClick(Sender: TObject);
    procedure btn_ConfigSettingClick(Sender: TObject);
    procedure btn_EmployeeRelayClick(Sender: TObject);
    procedure btn_MessageConfirmClick(Sender: TObject);
    procedure btn_RemoteControlClick(Sender: TObject);
    procedure btn_UpgradeClick(Sender: TObject);
    procedure CardDownLoadCheckTimerTimer(Sender: TObject);
    procedure mn_PosiCodeAddClick(Sender: TObject);
    procedure mn_EmployeeGubunClick(Sender: TObject);
    procedure DeviceStateTimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure MediaPlayer2Notify(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure mn_AccessHistoryReportClick(Sender: TObject);
    procedure mn_AccessMonitoringClick(Sender: TObject);
    procedure mn_AccessReportClick(Sender: TObject);
    procedure mn_AccessTimeAdminClick(Sender: TObject);
    procedure mn_AdminCardReportClick(Sender: TObject);
    procedure mn_AdminGradeClick(Sender: TObject);
    procedure mn_AdminGradeMangerClick(Sender: TObject);
    procedure mn_AdminManagerClick(Sender: TObject);
    procedure mn_DoorManagementReportClick(Sender: TObject);
    procedure mn_DoorMapClick(Sender: TObject);
    procedure mn_DoorSchedule1Click(Sender: TObject);
    procedure mn_AlarmAreaReportClick(Sender: TObject);
    procedure mn_AlarmManagementReportClick(Sender: TObject);
    procedure mn_AlarmReportClick(Sender: TObject);
    procedure mn_ArmAreaCodeClick(Sender: TObject);
    procedure mn_ArmAreaMapClick(Sender: TObject);
    procedure mn_AttendReportClick(Sender: TObject);
    procedure mn_BuildingCodeClick(Sender: TObject);
    procedure mn_BuildingMapClick(Sender: TObject);
    procedure mn_CompanyCodeClick(Sender: TObject);
    procedure mn_CompanyCodeEnter(Sender: TObject);
    procedure mn_CompanyGradeClick(Sender: TObject);
    procedure mn_DaemonRestartClick(Sender: TObject);
    procedure mn_DeviceReportClick(Sender: TObject);
    procedure mn_DoorCodeClick(Sender: TObject);
    procedure mn_EmployeeClick(Sender: TObject);
    procedure mn_SecurityMonitoringClick(Sender: TObject);
    procedure mn_ServerMonitoringClick(Sender: TObject);
    procedure mn_TimeCodeClick(Sender: TObject);
    procedure mn_ZoneClick(Sender: TObject);
    procedure mn_EmployeeGradeSearchClick(Sender: TObject);
    procedure mn_EmployeeGroupCodeClick(Sender: TObject);
    procedure mn_FireRecoveryClick(Sender: TObject);
    procedure mn_FoodReportClick(Sender: TObject);
    procedure mn_FoodStateReportClick(Sender: TObject);
    procedure mn_GroupcodeClick(Sender: TObject);
    procedure mn_GroupGradeClick(Sender: TObject);
    procedure mn_HolidayClick(Sender: TObject);
    procedure mn_ManagerReportClick(Sender: TObject);
    procedure mn_MonitorStateClick(Sender: TObject);
    procedure ServerConnectTimerTimer(Sender: TObject);
    procedure SoundTimerTimer(Sender: TObject);
    procedure StartMenuMenuItems1Click(Sender: TObject);
    procedure StartMenuMenuItems2Click(Sender: TObject);
    procedure StartMenuMenuItems3Click(Sender: TObject);
    procedure btn_PosiCodeClick(Sender: TObject);
    procedure btn_employeeGubunClick(Sender: TObject);
    procedure mn_FoodReport1Click(Sender: TObject);
    procedure btn_FoodStateReportClick(Sender: TObject);
    procedure btn_FoodReaderSettingClick(Sender: TObject);
    procedure btn_FoodMonitoringClick(Sender: TObject);
    procedure btn_NameChangeClick(Sender: TObject);
    procedure mn_AtManagemnetClick(Sender: TObject);
    procedure mn_AtSummaryClick(Sender: TObject);
    procedure NodeConncectCheckTimerTimer(Sender: TObject);
    procedure DoorStateCheckTimerTimer(Sender: TObject);
    procedure btn_DepartStateReportClick(Sender: TObject);
    procedure mn_NodeManagerClick(Sender: TObject);
    procedure mn_ControlManagerClick(Sender: TObject);
    procedure mn_ServerManagerClick(Sender: TObject);
    procedure mn_telephoneofficeClick(Sender: TObject);
    procedure mn_ReaderNumberClick(Sender: TObject);
    procedure mn_ReaderPasswdClick(Sender: TObject);
    procedure mn_DoorOpenReportClick(Sender: TObject);
    procedure mn_DoorAlarmReportClick(Sender: TObject);
    procedure mn_employeeUploadFileFormatClick(Sender: TObject);
    procedure mn_EmployeeFileUploadClick(Sender: TObject);
    procedure mn_CardCreateClick(Sender: TObject);
    procedure mn_CriticalFormClick(Sender: TObject);
    procedure mn_ButtonEventReportClick(Sender: TObject);
    procedure btn_TESTClick(Sender: TObject);
    procedure mn_TelAccessReportClick(Sender: TObject);
    procedure btn_ConfirmClick(Sender: TObject);
    procedure mn_FingerManagerClick(Sender: TObject);
    procedure mn_EmployeeGradeClick(Sender: TObject);
    procedure mn_PermitResendClick(Sender: TObject);
    procedure OpenDoorSoundTimerTimer(Sender: TObject);
    procedure AdoConnectTimerTimer(Sender: TObject);
    procedure mn_NotUseCardReportClick(Sender: TObject);
    procedure mn_EmployeeFileBackup1Click(Sender: TObject);
    procedure mn_FileUploadDupCardClick(Sender: TObject);
    procedure mn_EmployeeHisReportClick(Sender: TObject);
    procedure mn_AlarmStateCodeClick(Sender: TObject);
    procedure mn_CardGubunClick(Sender: TObject);
    procedure mn_ZoneMapClick(Sender: TObject);
    procedure mn_AtRelayFileClick(Sender: TObject);
    procedure AutoLogoutCheckTimerTimer(Sender: TObject);
  private
    procedure ActiveChild(Sender: TObject);
    //�̺�Ʈ ����
    procedure AlarmConfirm(Sender: TObject);
    procedure ArmAreaCurrentAlarmStateChange(Sender: TObject;  aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(Sender: TObject; aDecoderNo:integer; aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure BuildingAlarmStateChange(Sender: TObject;  aBuildingCode:string;aAlarmState : integer);
    procedure BuildingSecurityModeChange(Sender: TObject;  aBuildingCode:string;aMode : integer);
    procedure CardPermitProcessEvent(Sender: TObject; aType,aCode:string;aTotCount,aCurCount:integer);
    procedure DeviceAlarmEvent(Sender: TObject;aDecoderNo:integer;aNodeNo,aECUID,aExtendID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                             aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView,aAlarmSound,aAlarmColor:string;aRealTime:Boolean=True);
    procedure DeviceCardAccessEvent(Sender: TObject;aDecoderNo:integer;aTime,aNodeNo, aEcuID,aDoorNo,aReaderNo,aInOut,aCardMode,aDoorMode,
                             aChangeState,aAccessResult,aDoorState,aATButton,aType,aArmAreaNo,aCardno,aCompanyCode,
                             aCompanyName,aEmSeq,aEmCode,aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone:string);
    procedure DeviceChangeEvent(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
    procedure DoorChangeEvent(Sender: TObject;aDecoderNo:integer;aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure EventCardReader(Sender: TObject; aCardNo:string);
    procedure NodeChangeEvent(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
    procedure RcvFTPPercent(Sender: TObject;aDecoderNo:integer;  aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
    procedure ServerConnected(Sender: TObject;aDecoderNo:integer; aConnected:Boolean);
    procedure ServerPacketView(Sender: TObject;  aTxRx,aClientIP,aData,aResult:string);

    procedure FoodEvent(Sender: TObject;aFoodDate,aAccessTime,aCardno,aCompanyCode, aCompanyName,aEmSeq,aEmCode,aEmName,aAccessResult,aAccessPermitName,aFoodType,aFoodTypeName,
                                                  aFoodCode,aFoodCodeName,aFoodAmt:string);
    procedure MonitoringRefresh;
  private
    AccessPermitCodeList : TstringList;
    AccessSoundList : TStringList;
    AlarmSoundList : TStringList;
    FoodReaderList : TStringList;
    OpenDoorAlarmList : TStringList;
    OpenDoorAlarmSoundList : TStringList;
    ReaderDoorPositionCodeList : TstringList;
    L_bReAdoConnect : Boolean;
    L_bCardDownLoadStart : Boolean;
    L_bDeviceStateChecking : Boolean;
    L_bDoorStateChecking : Boolean;
    L_bFormActivate : Boolean;
    L_bSoundTimerEnable : Boolean;
    L_dtActiveTime : TDateTime;
    L_nAccessSoundCount : integer;
    L_nAlarmSoundCount : integer;
    L_nCardDownLoadMaxCount : integer;
    L_nDeviceStateCheckCount : integer;
    L_nDoorStateCheckCount : integer;
    L_nCurrentCheckNodeSeq : integer;
    L_nCurrentCheckDoorNodeSeq : integer;
    L_nOpenDoorSoundCount : integer;
    L_nWindowState : integer;
    L_stAdminGradeCode : string;
    L_stCustomerID : string;
    procedure CardDownLoadStart;
    procedure ChungNamEmployeeRelay;
    procedure ClientConfigIniSetting; //INI ���� �о �޸� ����
    procedure CreateMDIChild(Kind: integer; const FormName: string);
    procedure EmployeeFileUpload(aFile,aEmApprove:string;aDupCardexcept:Boolean=False);
    Function EmployeeLineUpload(aLine,aEmApprove:string;aDupCardexcept:Boolean=False):integer;
    Function EmployeeLineUploadVer(aLine:string;aVer:integer;aDupCardexcept:Boolean=False):integer;
    procedure LoadingAccessPermitCodeList;
    procedure LoadingArmAreaList;
    procedure LoadingTB_DECODER(aDecoderNo:string='');
    procedure LoadingAlarmDoorList;
    procedure LoadingDoorList;
    procedure LoadingFoodReaderList;
    procedure LoadingReaderDoorPositionList;
    procedure LoadSecurityEvent;
    procedure MemoryClear;
    procedure MemoryCreate;
    procedure MemoryFree;
    procedure TimerStop;
    procedure TravelAdvPageEnable(oControl:TAdvPage;ProgIDs:String);
    Procedure TravelToolBarImageChange(oControl:TAdvToolBarPager);
    Procedure TravelToolBarPagerEnable(oControl:TAdvToolBarPager;ProgIDs:String);
    procedure UnLoadingAccessPermitCodeList;
    procedure UnLoadingArmAreaList;
    procedure UnLoadingTB_DECODER;
    procedure UnLoadingDoorList;
    procedure UnLoadingFoodReaderList;
    procedure UnLoadingNodeList;
    procedure UnLoadingReaderDoorPositionList;
    procedure WMNCHitTest(var Msg: TWMNCHitTest);message WM_NCHITTEST;
  private
    Function ChildFormClose(aFormNumber:integer):Boolean;
    function CreateDBConfig : string;
    Function FontSetting:Boolean;
    Function FormChangeEvent(aFormNumber,aFormName:integer):Boolean;  //���⼭ �ش��ϴ� �� ��ü�� ������ ���� �� ����
    Function FormMenuNameSetting:Boolean;
    Function GetTB_Config : Boolean;
    Function LoadingALARMEVENTSTATEPCCODEList : Boolean;
    Function UnLoadingALARMEVENTSTATEPCCODEList : Boolean;
    Function HTTPZeronServerSend(aContent:string):Boolean;
    Function MDIChildGradeShow(FormName,FormCaption:String;aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean):Boolean;
    Function MDIChildShow(FormName:String):Boolean;
    Function MDIForm(FormName:string):TForm;
    procedure MDIFormAllClose;
  private
    FAccessPlayStop: Boolean;
    FAllowSize: Boolean;
    FLogined: Boolean;
    FAlarmPlayStop: Boolean;
    FPrivileges: String;
    procedure SetLogined(const Value: Boolean);
    procedure SetPrivileges(const Value: String);
    { Private declarations }
    procedure DeleteCardPermitDelete; //������ ī�� ���� ����
    procedure WriteRegistryKey(aCustomerID,aInstallDate:string);
    Function RegistryKeyCheck(var aCustomerID:string):Boolean;
  protected
    { Protected declarations }
    procedure AdoConnected(Sender: TObject;  Connected:Boolean);
  public
    { Public declarations }
    procedure FORMALARMCONFIRMExecute;
    procedure FORMALARMMESSAGE(aMessage:string);
    procedure FORMCARDDOWNLOADExecute;
    procedure FORMCHANGE(aName:integer;aValue:string);
    procedure FORMENABLE(aName:integer;aValue:string);
    procedure FormMenuChange;
    procedure FORMREPORT(aName:integer;aFormType,aID:string);
    procedure FormShowEvent(aFormNumber:integer;aValue:Boolean;aData1:string='');
    procedure FORMSTATUSMSG(aIndex:integer;aMessage:string);
    procedure RegFingerDeviceEmployee(aDecoderNo,aNodeNo,aEcuID,aDoorNo:string);
    procedure MessageEvent(var Msg: TMsg; var Handled: Boolean);
  published
    property AccessPlayStop : Boolean read FAccessPlayStop write FAccessPlayStop;
    property AlarmPlayStop : Boolean read FAlarmPlayStop write FAlarmPlayStop;
    Property Logined : Boolean read FLogined write  SetLogined; //������Ƽ�� ���������� Logined��� ������ �ٲ�� SetLogined ��� �Լ��� �����
    Property Privileges : String read FPrivileges write SetPrivileges;
  end;

var
  fmMain: TfmMain;
  tmMonitor: TMonitor;
  tmWorkRect: TRect;

implementation

{$R *.dfm}

uses
  uAccessHisReport,
  uAccessReport,
  uAlarmEventReport,
  uAlarmStateCode,
  uArmAreaAccessReport,
  uArmArea,
  uAttendManger,
  uAttendSummary,
  uBuilding,
  uBuildingMonitoring,
  uButtonEventReport,
  uCardGubun,
  uCardManagementReport,
  uClientConfig,
  uCompany,
  uCommonVariable,
  uCommonFunction,
  uComPort,
  uDataBase,
  uDataBaseConfig,
  uDBCardPermit,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBRelay,
  uDBSelect,
  uDBUpdate,
  uDeviceSetting,
  uDoorList,
  uDoorAlarmReport,
  uDoorManagementReport,
  uDoorOpenReport,
  uEmployee,
  uEmployeeCardCreate,
  uEmployeeGrade,
  uEmployeeHisReport,
  uEmployeeRelay,
  uFPCardEmployee,
  uFoodEventReport,
  uFoodMonitoring,
  uFoodReader,
  uFoodDepartStateReport,
  uFoodStateReport,
  uFormDeviceState,
  uFormFunction,
  uFormVariable,
  uKTEmployee,
  uLogin,
  uMapMonitoring,
  uMonitoring,
  uNameChange,
  uNodeManager,
  uNotCardUseReport,
  uPCClient,
  uPCComMonitoring,
  uPermitReSend,
  uPosiCode,
  uRelayFilecreate,
  uServerClientVariable,
  uServerManager,
  uSprash,
  uSupremaFinger,
  uTelAccessReport,
  utelephoneOfficeManager,
  systeminfos,
  uFoodReaderSetting,
  uFormUtil,
  uEmployeeGroupCode,
  uEmployeeGubunCode,
  uNewZoneAdmin,
  uHolidayAdd,
  uDoorSchedule,
  uTimeCodeAdmin,
  uAdminClassCode,
  uAdminClassGrade,
  uAdminUserID,
  uAttendReport,
  uRemoteControl,
  uDeviceVersionReport,
  uAlarmManagementReport,
  uAccessTimeAdmin,
  uEmGroupGrade,
  uCompanyGrade,
  uDoorMapAdmin,
  uArmAreaMapAdmin,
  uBuildingMapAdmin,
  uEmployeeGradeSearch,
  uZoneMapAdmin,
  uZoneMapMonitoring;

// �ݹ� �Լ�
function EnumFamToLines(lplf: PLOGFONT; lpntm: PNEWTEXTMETRIC;
   FontType: DWORD; Lines: LPARAM): Integer; stdcall;
begin
// �Ʒ��� �ѱ۹��ڼ�Ʈ�� ���� ��ġ(variable pitch)�� ��Ʈ�� �����մϴ�
// ���� ���� ��ġ���� �����Ϸ��� lfPitchAndFamily �� ���� 4 ��Ʈ��
// �����ϸ� �˴ϴ�
//    FIXED_PITCH 1 (���� ��ġ)
//    VARIABLE_PITCH 2 (���� ��ġ)
// ��Ÿ �ٸ� ����� rtlwinwindows.pas �� ������ ������

with lplf^ do
   if (lfCharSet = HANGEUL_CHARSET) and (lfPitchAndFamily and $0F = VARIABLE_PITCH) then
     TStrings(Lines).Add(lplf.lfFaceName);
 Result := 1;
end;


procedure TfmMain.AccessSoundTimerTimer(Sender: TObject);
var
  stAccessFile : string;
begin
  inherited;
  if L_bSoundTimerEnable then Exit;
  if G_nBMSType = 3 then Exit;  //�ļ� ����͸��� ���� �˶� �߻� ���Ѵ�.
  if G_nBMSType = 4 then Exit;  //���� ����͸��� ���� �˶� �߻� ���Ѵ�.

  sb_Status.Panels[2].Text := 'AccessSoundTimerTimer Start ';
  if G_nAccessSoundCount > 0 then
  begin
    if G_nAccessSoundCount <= L_nAccessSoundCount then
    begin
      L_nAccessSoundCount := 0;
      if AccessSoundList.Count = 1 then AccessSoundTimer.Enabled := False;
      if AccessSoundList.Count > 0 then
         AccessSoundList.Delete(0);
      Exit;
    end;
    inc(L_nAccessSoundCount);
  end;
  if AccessSoundList.Count < 1 then
  begin
    L_nAccessSoundCount := 0;
    AccessSoundTimer.Enabled := False;
    Exit;
  end;
  stAccessFile := '';
  if AccessSoundList.Count > 0 then
  begin
    stAccessFile := AccessSoundList.Strings[0];
  end;
  if Not FileExists(stAccessFile) then
  begin
    L_nAccessSoundCount := 0;
    AccessSoundList.Delete(0);
    //SoundTimer.Enabled := False;
    Exit;
  end;
  if AccessSoundList.Count > 1 then
  begin
    L_nAccessSoundCount := 0;
    AccessSoundList.Delete(0); //���� ���� Play
  end;
  MediaPlayer2.FileName := stAccessFile;
  L_bSoundTimerEnable := True;
  Try
    MediaPlayer2.Open;
    Try
      AccessPlayStop := False;
      WindowsMediaPlayer1.Controls.stop;
      MediaPlayer2.Play;
    Except
      AccessSoundTimer.Enabled := False;
      Exit;
    End;
//    Delay(1000);
//    while Not ( (MediaPlayer2.NotifyValue = nvSuccessful) or (MediaPlayer2.Mode = mpPlaying) )  do
    while Not AccessPlayStop  do
    begin
      Application.ProcessMessages;
    end;
  Finally
    sb_Status.Panels[2].Text := 'AccessSoundTimerTimer End ';
    MediaPlayer2.Close;
    L_bSoundTimerEnable := False;
  End;
end;

procedure TfmMain.ActiveChild(Sender: TObject);
begin

end;

procedure TfmMain.AdoConnected(Sender: TObject; Connected: Boolean);
begin
  AdoConnectTimer.Enabled := Not Connected;
end;

procedure TfmMain.AdoConnectTimerTimer(Sender: TObject);
begin
  lb_AccessMessage.Caption.Text := ' �����ͺ��̽� ���� ���� ������¸� Ȯ���� �ּ��� !!! ';
  pan_Access.Visible := True;

  Exit;   //��Ī���� �� �κп��� ������ �����鼭 ������ ���� �ȵǴ� ��ʰ� �־���
  if L_bReAdoConnect then  Exit;
  L_bReAdoConnect := True;
  Try
    TDataBaseConfig.GetObject.DBConnected := False;
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  Finally
    L_bReAdoConnect := False;
  End;
end;

procedure TfmMain.AlarmConfirm(Sender: TObject);
begin
  LoadSecurityEvent;
end;

procedure TfmMain.ArmAreaCurrentAlarmStateChange(Sender: TObject; aDecoderNo:integer;aNodeNo,
  aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
var
  fmTemp : TForm;
  nIndex : integer;
  stBuildingCode : string;
begin
  if G_bFormEnabled[con_FormBMOSMONITOR] then
  begin
    fmTemp := MDIForm('TfmMonitoring');
    if fmTemp <> nil then TfmMonitoring(fmTemp).ArmAreaCurrentAlarmStateChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode);
  end;
  if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
  begin
    fmTemp := MDIForm('TfmBuildingMonitoring');
    if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).ArmAreaCurrentAlarmStateChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode);
  end;

  if G_bFormEnabled[con_FormBMOSMAPMONITOR] then
  begin
    fmTemp := MDIForm('TfmMapMonitoring');
    if fmTemp <> nil then TfmMapMonitoring(fmTemp).ArmAreaCurrentAlarmStateChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode);
  end;

  stBuildingCode := '0';
  nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetArmAreaAlarmStateChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aAlarmState);
  end;
  stBuildingCode := copy(aBuildingCode,1,1 + (G_nBuildingCodeLength * G_nBuildingStep));
  nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetArmAreaAlarmStateChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aAlarmState);
  end;

end;

procedure TfmMain.ArmAreaSecurityModeChange(Sender: TObject;aDecoderNo:integer; aNodeNo, aEcuID,
  aArmAreaNo, aMode, aBuildingCode: string);
var
  fmTemp : TForm;
  nIndex : integer;
  stBuildingCode : string;
  stTemp : string;
begin
  if G_bFormEnabled[con_FormBMOSMONITOR] then
  begin
    fmTemp := MDIForm('TfmMonitoring');
    if fmTemp <> nil then TfmMonitoring(fmTemp).ArmAreaSecurityModeChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode);
  end;
  if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
  begin
    fmTemp := MDIForm('TfmBuildingMonitoring');
    if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).ArmAreaSecurityModeChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode);
  end;

  if G_bFormEnabled[con_FormBMOSMAPMONITOR] then
  begin
    fmTemp := MDIForm('TfmMapMonitoring');
    if fmTemp <> nil then TfmMapMonitoring(fmTemp).ArmAreaSecurityModeChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode);
  end;

  if (aMode <> 'A') and (aMode <> 'D') then
  begin
    stTemp := aMode ; //������
  end;

  stBuildingCode := '0';
  nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetArmAreaSecurityModeChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aMode);
  end;
  stBuildingCode := copy(aBuildingCode,1,1 + (G_nBuildingCodeLength * G_nBuildingStep));
  nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetArmAreaSecurityModeChange(aDecoderNo,aNodeNo,aEcuID,aArmAreaNo,aMode);
  end;

end;

procedure TfmMain.AutoLogoutCheckTimerTimer(Sender: TObject);
begin
  if L_dtActiveTime < now - (1.0/(24 * 60))* G_nAutoLogOutTime then
  begin
    Logined := False;  //Master_ID�� ���߿� �����Ǿ�� ��. �α� ���� ���
  end;

end;

procedure TfmMain.btn_AccessConfirmClick(Sender: TObject);
begin
  pan_Access.Visible := False;
  if MediaPlayer2.Mode = mpPlaying then MediaPlayer2.Stop;
  AccessSoundTimer.Enabled := False;
  OpenDoorSoundTimer.Enabled := False;
  AdoConnectTimer.Enabled := False;
  AccessSoundList.Clear;
  OpenDoorAlarmSoundList.Clear;
  L_nAccessSoundCount := 0;
end;

procedure TfmMain.btn_ConfigSettingClick(Sender: TObject);
begin
  dmComPort.PortOpen := False;
  fmClientConfig := TfmClientConfig.create(self);
  fmClientConfig.ShowModal;
  fmClientConfig.Free;
  ClientConfigIniSetting;
  if G_nAttendRelayFormat = 0 then mn_AtRelayFile.Visible := False
  else mn_AtRelayFile.Visible := True;
  AutoLogoutCheckTimer.Enabled := G_bAutoLogOut;
end;

procedure TfmMain.btn_ConfirmClick(Sender: TObject);
begin
  pan_EmUpload.Visible := False;
end;

procedure TfmMain.btn_DepartStateReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TAdvGlowButton(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmFoodDepartStateReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmFoodDepartStateReport');
  if fmTemp <> nil then
  begin
    TfmFoodDepartStateReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmFoodDepartStateReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmFoodDepartStateReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmFoodDepartStateReport(fmTemp).FormGradeRefresh;
    TfmFoodDepartStateReport(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;
end;

procedure TfmMain.btn_EmployeeRelayClick(Sender: TObject);
begin
  if G_nEmployeeRelayType = 1 then
  begin
    ChungNamEmployeeRelay;
  end;
end;

procedure TfmMain.btn_FoodMonitoringClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);

  MDIChildGradeShow('TfmFoodMonitoring',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmFoodMonitoring');
  if fmTemp <> nil then
  begin
    TfmFoodMonitoring(fmTemp).IsInsertGrade := bInsertGrade;
    TfmFoodMonitoring(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmFoodMonitoring(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmFoodMonitoring(fmTemp).FormGradeRefresh;
    TfmFoodMonitoring(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.btn_FoodReaderSettingClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmFoodReaderSetting',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmFoodReaderSetting');
  if fmTemp <> nil then
  begin
    TfmFoodReaderSetting(fmTemp).IsInsertGrade := bInsertGrade;
    TfmFoodReaderSetting(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmFoodReaderSetting(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmFoodReaderSetting(fmTemp).FormGradeRefresh;
    TfmFoodReaderSetting(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.btn_FoodStateReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TAdvGlowButton(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmFoodStateReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmFoodStateReport');
  if fmTemp <> nil then
  begin
    TfmFoodStateReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmFoodStateReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmFoodStateReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmFoodStateReport(fmTemp).FormGradeRefresh;
    TfmFoodStateReport(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;
end;

procedure TfmMain.btn_employeeGubunClick(Sender: TObject);
begin
  mn_EmployeeGubunClick(mn_EmployeeGubun);
end;

procedure TfmMain.btn_MessageConfirmClick(Sender: TObject);
begin
  pan_Alarm.Visible := False;
  if MediaPlayer1.Mode = mpPlaying then MediaPlayer1.Stop;
  SoundTimer.Enabled := False;
  AlarmSoundList.Clear;
  L_nAlarmSoundCount := 0;
end;

procedure TfmMain.btn_NameChangeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmNameChange',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmNameChange');
  if fmTemp <> nil then
  begin
    TfmNameChange(fmTemp).IsInsertGrade := bInsertGrade;
    TfmNameChange(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmNameChange(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmNameChange(fmTemp).FormGradeRefresh;
    TfmNameChange(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.btn_PosiCodeClick(Sender: TObject);
begin
  mn_PosiCodeAddClick(mn_PosiCodeAdd);
end;

procedure TfmMain.btn_RemoteControlClick(Sender: TObject);
var
  regKey : TRegistry;
  stPath : string;
  stUrl : string;
begin
//  ShellExecute(0, 'open', pchar('http://zeron.co.kr/help'), '','', SW_Normal);
//  MDIChildShow('TfmRemoteSupport');
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_CURRENT_USER;
    if (not regKey.KeyExists('\Software\Zeron\Seetrol')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY ����
         regKey.Free;

      ShellExecute(0, 'open', pchar(ExtractFileDir(Application.ExeName) + '\seetrol_Setup.exe'),'','', SW_Normal);

      Exit;
    end;
    regKey.OpenKey ('\Software\Zeron\Seetrol',False);
    stPath := regKey.ReadString('path');
    if stPath = '' then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY ����
         regKey.Free;
      ShellExecute(0, 'open', pchar(ExtractFileDir(Application.ExeName) + '\seetrol_Setup.exe'),'','', SW_Normal);
      Exit;
    end;
    ShellExecute(0, 'open', pchar(stPath + 'SeetrolClient.exe'), pchar('-' + L_stCustomerID + formatdateTime('nnss',now) + ' -zeron.co.kr -8081 -8082 -8083 -auto'),'', SW_Normal)
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY ����
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY ����
     regKey.Free;

end;

procedure TfmMain.btn_TESTClick(Sender: TObject);
begin
  if PCClientSocketList.Count = 0 then Exit;
  sb_Status.Panels[2].Text := 'ReceiveCount : ' + inttostr( TdmPCClient(PCClientSocketList.Objects[0]).GetReceiveBufferCount );
end;

procedure TfmMain.btn_UpgradeClick(Sender: TObject);
begin
  if Not FileExists(G_stExeFolder + '\GMS_Manager_Update\SmartUpdate.exe') then
  begin
    showmessage('Not Install ' + btn_Upgrade.Caption + ' Tools');
    Exit;
  end;

  ShellExecute(0, 'open', pchar(G_stExeFolder + '\GMS_Manager_Update\SmartUpdate.exe'),'','', SW_Normal);
  //MyRunDosCommand(G_stExeFolder + '\Bmos\SmartUpdate.exe',False,False);
  Close;
end;

procedure TfmMain.BuildingAlarmStateChange(Sender: TObject;
  aBuildingCode: string; aAlarmState: integer);
var
  fmTemp : TForm;
  nIndex : integer;
  stBuildingCode : string;
begin
(*  if G_bFormEnabled[con_FormBMOSSECURITYMONITOR] then
  begin
    fmTemp := MDIForm('TfmSecurityMonitoring');
    if fmTemp <> nil then TfmSecurityMonitoring(fmTemp).BuildingAlarmStateChange(aBuildingCode,aAlarmState);
  end;
  if G_bFormEnabled[con_FormBMOSMERGEMONITOR] then
  begin
    fmTemp := MDIForm('TfmMergeMonitoring');
    if fmTemp <> nil then TfmMergeMonitoring(fmTemp).BuildingAlarmStateChange(aBuildingCode,aAlarmState);
  end;
  *)
end;

procedure TfmMain.BuildingSecurityModeChange(Sender: TObject;
  aBuildingCode: string; aMode: integer);
var
  fmTemp : TForm;
  nIndex : integer;
  stBuildingCode : string;
begin
(*  if G_bFormEnabled[con_FormBMOSSECURITYMONITOR] then
  begin
    fmTemp := MDIForm('TfmSecurityMonitoring');
    if fmTemp <> nil then TfmSecurityMonitoring(fmTemp).BuildingSecurityModeChange(aBuildingCode,aMode);
  end;
  if G_bFormEnabled[con_FormBMOSMERGEMONITOR] then
  begin
    fmTemp := MDIForm('TfmMergeMonitoring');
    if fmTemp <> nil then TfmMergeMonitoring(fmTemp).BuildingSecurityModeChange(aBuildingCode,aMode);
  end;
*)
end;

procedure TfmMain.CardDownLoadCheckTimerTimer(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select count(*) as cnt from TB_CARDPERMIT ';
  stSql := stsql + ' Where CP_RCVACK <> ''Y'' ';
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
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;
      if FindField('cnt').AsInteger = 0 then CardDownLoadCheckTimer.Enabled := False;
      if L_nCardDownLoadMaxCount < FindField('cnt').AsInteger then CardDownLoadStart;
      sb_Status.Panels[3].Progress.position := L_nCardDownLoadMaxCount - FindField('cnt').AsInteger;
      Application.ProcessMessages;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.CardDownLoadStart;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select count(*) as cnt from TB_CARDPERMIT ';
  stSql := stsql + ' Where CP_RCVACK <> ''Y'' ';
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
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;
      L_nCardDownLoadMaxCount := FindField('cnt').AsInteger;
      sb_Status.Panels[3].Progress.Max := L_nCardDownLoadMaxCount;
      sb_Status.Panels[3].Progress.position := 0;
      CardDownLoadCheckTimer.Enabled := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.CardPermitProcessEvent(Sender: TObject; aType, aCode: string;
  aTotCount, aCurCount: integer);
var
  fmTemp : TForm;
begin
  if G_bFormEnabled[con_FormBMOSEMGROUPGRADE] then
  begin
    fmTemp := MDIForm('TfmEmGroupGrade');
    if fmTemp <> nil then TfmEmGroupGrade(fmTemp).CardPermitProcessEvent(aType,aCode,aTotCount,aCurCount);
  end;
  if G_bFormEnabled[con_FormBMOSCOMPANYGRADE] then
  begin
    fmTemp := MDIForm('TfmCompanyGrade');
    if fmTemp <> nil then TfmCompanyGrade(fmTemp).CardPermitProcessEvent(aType,aCode,aTotCount,aCurCount);
  end;

end;

function TfmMain.ChildFormClose(aFormNumber: integer): Boolean;
var
  fmTemp : TForm;
begin
  case aFormNumber of
    con_FormBMOSACCESSHISREPORT : begin
      fmTemp := MDIForm('TfmAccessHisReport');
      if fmTemp <> nil then TfmAccessHisReport(fmTemp).Form_Close;
    end;
    con_FormBMOSACCESSREPORT : begin
      fmTemp := MDIForm('TfmAccessReport');
      if fmTemp <> nil then TfmAccessReport(fmTemp).Form_Close;
    end;
    con_FormBMOSACCESSTIME : begin
      fmTemp := MDIForm('TfmAccessTimeAdmin');
      if fmTemp <> nil then TfmAccessTimeAdmin(fmTemp).Form_Close;
    end;
    con_FormBMOSADMINCLASSCODE : begin
      fmTemp := MDIForm('TfmAdminClassCode');
      if fmTemp <> nil then TfmAdminClassCode(fmTemp).Form_Close;
    end;
    con_FormBMOSADMINCLASSGRADE : begin
      fmTemp := MDIForm('TfmAdminClassGrade');
      if fmTemp <> nil then TfmAdminClassGrade(fmTemp).Form_Close;
    end;
    con_FormBMOSADMINUSERID : begin
      fmTemp := MDIForm('TfmAdminUserID');
      if fmTemp <> nil then TfmAdminUserID(fmTemp).Form_Close;
    end;
    con_FormBMOSALARMEVENTREPORT : begin
      fmTemp := MDIForm('TfmAlarmEventReport');
      if fmTemp <> nil then TfmAlarmEventReport(fmTemp).Form_Close;
    end;
    con_FormBMOSArmAreaACCESSREPORT : begin
      fmTemp := MDIForm('TfmArmAreaAccessReport');
      if fmTemp <> nil then TfmArmAreaAccessReport(fmTemp).Form_Close;
    end;
    con_FormBMOSARMAREACODE : begin
      fmTemp := MDIForm('TfmArmArea');
      if fmTemp <> nil then TfmArmArea(fmTemp).Form_Close;
    end;
    con_FormBMOSArmAreaMangementREPORT : begin
      fmTemp := MDIForm('TfmAlarmManagementReport');
      if fmTemp <> nil then TfmAlarmManagementReport(fmTemp).Form_Close;
    end;
    con_FormBMOSARMAREAMAP : begin
      fmTemp := MDIForm('TfmArmAreaMapAdmin');
      if fmTemp <> nil then TfmArmAreaMapAdmin(fmTemp).Form_Close;
    end;
    con_FormBMOSATREPORT : begin
      fmTemp := MDIForm('TfmAttendReport');
      if fmTemp <> nil then TfmAttendReport(fmTemp).Form_Close;
    end;
    con_FormBMOSBUILDINGCODE : begin
      fmTemp := MDIForm('TfmBuilding');
      if fmTemp <> nil then TfmBuilding(fmTemp).Form_Close;
    end;
    con_FormBMOSBUILDINGMAP : begin
      fmTemp := MDIForm('TfmBuildingMapAdmin');
      if fmTemp <> nil then TfmBuildingMapAdmin(fmTemp).Form_Close;
    end;
    con_FormBMOSBUTTONEVENTREPORT : begin
      fmTemp := MDIForm('TfmButtonEventReport');
      if fmTemp <> nil then TfmButtonEventReport(fmTemp).Form_Close;
    end;
    con_FormBMOSCARDREGESTFORM : begin
      fmTemp := MDIForm('TfmEmployeeCardCreate');
      if fmTemp <> nil then TfmEmployeeCardCreate(fmTemp).Form_Close;
    end;
    con_FormBMOSCOMPANYCODE : begin
      fmTemp := MDIForm('TfmCompany');
      if fmTemp <> nil then TfmCompany(fmTemp).Form_Close;
    end;
    con_FormBMOSCOMPANYGRADE : begin
      fmTemp := MDIForm('TfmCompanyGrade');
      if fmTemp <> nil then TfmCompanyGrade(fmTemp).Form_Close;
    end;
    con_FormBMOSDECODERMANAGER : begin
      fmTemp := MDIForm('TfmServerManager');
      if fmTemp <> nil then TfmServerManager(fmTemp).Form_Close;
    end;
    con_FormBMOSDEVICEMANAGER : begin
      fmTemp := MDIForm('TfmDeviceSetting');
      if fmTemp <> nil then TfmDeviceSetting(fmTemp).Form_Close;
    end;
    con_FormBMOSDeviceVersionREPORT : begin
      fmTemp := MDIForm('TfmDeviceVersionReport');
      if fmTemp <> nil then TfmDeviceVersionReport(fmTemp).Form_Close;
    end;
    con_FormBMOSDOORCODE : begin
      fmTemp := MDIForm('TfmDoorList');
      if fmTemp <> nil then TfmDoorList(fmTemp).Form_Close;
    end;
    con_FormBMOSDoorMangementREPORT : begin
      fmTemp := MDIForm('TfmDoorManagementReport');
      if fmTemp <> nil then TfmDoorManagementReport(fmTemp).Form_Close;
    end;
    con_FormBMOSDOORMAP : begin
      fmTemp := MDIForm('TfmDoorMapAdmin');
      if fmTemp <> nil then TfmDoorMapAdmin(fmTemp).Form_Close;
    end;
    con_FormBMOSDOORSCHEDULEADMIN : begin
      fmTemp := MDIForm('TfmDoorSchedule');
      if fmTemp <> nil then TfmDoorSchedule(fmTemp).Form_Close;
    end;
    con_FormBMOSEMGROUPCODE : begin
      fmTemp := MDIForm('TfmEmployeeGroupCode');
      if fmTemp <> nil then TfmEmployeeGroupCode(fmTemp).Form_Close;
    end;
    con_FormBMOSEMGROUPGRADE : begin
      fmTemp := MDIForm('TfmEmGroupGrade');
      if fmTemp <> nil then TfmEmGroupGrade(fmTemp).Form_Close;
    end;
    con_FormBMOSEMPLOYEE : begin
      fmTemp := MDIForm('TfmEmployee');
      if fmTemp <> nil then TfmEmployee(fmTemp).Form_Close;
    end;
    con_FormBMOSEMPLOYEEGRADE : Begin
      fmTemp := MDIForm('TfmEmployeeGrade');
      if fmTemp <> nil then TfmEmployeeGrade(fmTemp).Form_Close;
    End;
    con_FormBMOSEMPLOYEEGRADESEARCH : Begin
      fmTemp := MDIForm('TfmEmployeeGradeSearch');
      if fmTemp <> nil then TfmEmployeeGradeSearch(fmTemp).Form_Close;
    End;
    con_FormBMOSEMPLOYEEGUBUN : begin
      fmTemp := MDIForm('TfmEmployeeGubunCode');
      if fmTemp <> nil then TfmEmployeeGubunCode(fmTemp).Form_Close;
    end;
    con_FormBMOSFOODDEPARTSTATEREPORT : begin
      fmTemp := MDIForm('TfmFoodDepartStateReport');
      if fmTemp <> nil then TfmFoodDepartStateReport(fmTemp).Form_Close;
    end;
    con_FormBMOSFOODEVENTREPORT : begin
      fmTemp := MDIForm('TfmFoodEventReport');
      if fmTemp <> nil then TfmFoodEventReport(fmTemp).Form_Close;
    end;
    con_FormBMOSFOODSTATEREPORT : begin
      fmTemp := MDIForm('TfmFoodStateReport');
      if fmTemp <> nil then TfmFoodStateReport(fmTemp).Form_Close;
    end;
    con_FormBMOSFPCARDEMPLOYEE : begin
      fmTemp := MDIForm('TfmFPCardEmployee');
      if fmTemp <> nil then TfmFPCardEmployee(fmTemp).Form_Close;
    end;
    con_FormBMOSHOLIDAYADMIN : begin
      fmTemp := MDIForm('TfmHolidayAdd');
      if fmTemp <> nil then TfmHolidayAdd(fmTemp).Form_Close;
    end;
    con_FormBMOSKTEMPLOYEE : begin
      fmTemp := MDIForm('TfmKTEmployee');
      if fmTemp <> nil then TfmKTEmployee(fmTemp).Form_Close;
    end;
    con_FormBMOSMONITOR : begin
      fmTemp := MDIForm('TfmMonitoring');
      if fmTemp <> nil then TfmMonitoring(fmTemp).Form_Close;
    end;
    con_FormBMOSBUILDINGMONITOR : begin
      fmTemp := MDIForm('TfmBuildingMonitoring');
      if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).Form_Close;
    end;

    con_FormBMOSNODEMANAGER : begin
      fmTemp := MDIForm('TfmNodeManager');
      if fmTemp <> nil then TfmNodeManager(fmTemp).Form_Close;
    end;
    con_FormBMOSNOTCARDUSEREPORT : begin
      fmTemp := MDIForm('TfmNotCardUseReport');
      if fmTemp <> nil then TfmNotCardUseReport(fmTemp).Form_Close;
    end;
    con_FormBMOSPOSICODE : begin
      fmTemp := MDIForm('TfmPosiCode');
      if fmTemp <> nil then TfmPosiCode(fmTemp).Form_Close;
    end;
    con_FormBMOSTIMECODEADMIN : begin
      fmTemp := MDIForm('TfmTimeCodeAdmin');
      if fmTemp <> nil then TfmTimeCodeAdmin(fmTemp).Form_Close;
    end;
    con_FormBMOSZONECODE : begin
      fmTemp := MDIForm('TfmNewZoneAdmin');
      if fmTemp <> nil then TfmNewZoneAdmin(fmTemp).Form_Close;
    end;
    conFORMPCCOMMONITORING : begin
      fmTemp := MDIForm('TfmPCComMonitoring');
      if fmTemp <> nil then TfmPCComMonitoring(fmTemp).Form_Close;
    end;
    conFormREMOTECONTROL : begin
      fmTemp := MDIForm('TfmRemoteControl');
      if fmTemp <> nil then TfmRemoteControl(fmTemp).Form_Close;
    end;

  end;

end;

procedure TfmMain.ChungNamEmployeeRelay;
var
  stExcelFile : string;
  oStringList : TStringList;
  stSql : string;
  stCompanyName : string;
  stEmCode : string;
begin
  stExcelFile := '';

  OpenDialog1.Filter := 'Excel Files(*.xls,*.xlsx)|*.xls;*.xlsx';
  if OpenDialog1.Execute then
  begin
    stExcelFile := OpenDialog1.FileName;
  end;

  if Not FileExists(stExcelFile) then Exit;
//  ADOConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + stExcelFile + ';Extended Properties=Excel 8.0;Persist Security info=false; ';
  Try
    ADOExcelConnection.ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=' + stExcelFile + ';Extended Properties="Excel 8.0;Imex=1;HDR=YES;" ';
    ADOExcelConnection.Connected := False;
    ADOExcelConnection.LoginPrompt := False;
    ADOExcelConnection.Connected := True;
    ADOExcelConnection.CursorLocation := clUseServer;
    oStringList := TStringList.Create;
    ADOExcelConnection.GetTableNames(oStringList);
    stSql := ' Select * from [' + oStringList.Strings[0] + ']';
    with ADOExcelQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      pan_progress.Visible := True;
      ProgressBar1.Max := recordCount;
      ProgressBar1.Position := 0;
      while Not Eof do
      begin
        if Not Fields[0].IsNull then
          dmEmployeeRelay.ChungnamEmployeeDataProcess(Fields[0].Value,Fields[1].Value,Fields[2].Value,'',Fields[7].Value,Fields[6].Value,Fields[5].Value,Fields[3].Value,Fields[9].Value);
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Application.ProcessMessages;
        Next;
      end;
      Close;
    end;
  Finally
    ADOExcelConnection.Connected := False;
    oStringList.Free;
    pan_progress.Visible := False;
  End;
end;

procedure TfmMain.ClientConfigIniSetting;
var
  ini_fun : TiniFile;
  stType : string;
  i : integer;
  nTemp : integer;
begin
  inherited;
  LoadingAlarmDoorList;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MIAMS.INI');
    with ini_fun do
    begin
      if ReadString('Config','OpenModeOpenState','N') = 'Y' then G_bDoorOpenModeOpenStateUse := True
      else G_bDoorOpenModeOpenStateUse := False;
      if ReadString('Config','AccessEventSound','N') = 'Y' then G_bDoorAccessEventSoundOnUse := True
      else G_bDoorAccessEventSoundOnUse := False;
      G_stACMonitorAlaramFile := ReadString('Config','AccessAlarmFile','');
      if ReadString('Config','AlarmEventSound','N') = 'Y' then G_bAlarmEventSoundOnUse := True
      else G_bAlarmEventSoundOnUse := False;
      if ReadString('Config','AlarmMessage','N') = 'Y' then G_bAlarmEventMessageUse := True
      else G_bAlarmEventMessageUse := False;

      if ReadString('Config','ModeChangeSound','N') = 'Y' then G_bModeChangeSound := True
      else G_bModeChangeSound := False;
      G_stModeChangeArmSoundFile := ReadString('Config','ModeChangeArmSoundFile','');
      G_stModeChangeDisArmSoundFile := ReadString('Config','ModeChangeDisArmSoundFile','');

      G_stAlarmEventAlaramFile := ReadString('Config','AlarmEventFile','');
      G_nAlarmSoundCount := ReadInteger('Config','AlarmCount',1);

      if ReadString('Config','ExampleView','Y') = 'Y' then G_bMonitorIntroView := True
      else G_bMonitorIntroView := False;
      if ReadString('Config','LOCKMODEVIEW','N') = 'Y' then G_bDoorColseModeUse := True
      else G_bDoorColseModeUse := False;

      G_stAccessEventAlaramFile := ReadString('Config','AccessAlarmFile','');
      G_nAccessSoundCount := ReadInteger('Config','AccessAlarmCount',1);
      if ReadInteger('Config','CardManageModeView',0) = 1 then G_bCardModeShow := True
      else G_bCardModeShow := False;

      if ReadInteger('Config','DoorOpenAlarmUse',0) = 1 then G_bDoorOpenAlarmUse := True
      else G_bDoorOpenAlarmUse := False;
      G_stDoorOpenAlarmFile := ReadString('Config','DoorOpenAlarmFile','');

      G_nReportFileFormat := ReadInteger('Config','FileFormat',0);


      if ReadInteger('Config','Key',1) = 0 then G_bKeyCheck := False
      else G_bKeyCheck := True;

      G_nMoitorLoginStart:= ReadInteger('Config','LoginMonitorStart',0); //�α��ν� ����͸� ����
      G_nMonitorGubun := ReadInteger('Config','Monitoring',0); //����͸� �� ��ü����͸� 0,�ʸ���͸� 1
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

      G_nCardRegisterType := ReadInteger('Config','CardRegType',0);  //0.�Ϲݵ�ϱ�,1.��������������ϱ�
      G_nCardRegisterPort := ReadInteger('Config','CardRegPort',0);
      G_stCardRegisterIP := ReadString('Config','CardRegIP','');
      G_stCardRegisterFingerPort := ReadString('Config','CardFingerRegPort','1471');
      G_stShFingerRegDeviceIP := ReadString('Config','SHCardFingerRegIP','127.0.0.1');
      G_nShFingerRegDevicePort := ReadInteger('Config','SHCardFingerRegPort',7005);
      G_nShFingerRegDeviceID := ReadInteger('Config','SHCardFingerRegID',1);
      G_nShFingerRegType := ReadInteger('Config','SHCardFingerRegType',0);
      G_nCardCreatePort := ReadInteger('CARDCREATE','COMPORT',0);
      G_nBuildingStep := ReadInteger('Config','Building',2);

      G_nBMSType := ReadInteger('Config','BMSTYPE',2);

      G_nFormLanguageType := ReadInteger('Config','Language',G_nFormLanguageType);
      G_nFormEnable := ReadInteger('Config','FormEnable',0);

      G_nReportCompanyStep := ReadInteger('Config','ReportCompanyStep',3);

      if ReadInteger('Config','TEST',0) = 1 then G_bTest := True
      else G_bTest := False;

      if ReadInteger('Config','DataLoadingView',0) = 1 then G_bDataLoadingView := True
      else G_bDataLoadingView := False;
      if G_nMonitoringType = 1 then G_bDataLoadingView := True; //�бⱹ��� �����ͷ��� ���Ƽ� �ε��� ���� ��� �Ѵ�.

      if G_nCardRegisterPort <> 0 then
      begin
        try
          dmComPort.PortOpen := False;
          dmComPort.SERIALPORT := G_nCardRegisterPort;
          dmComPort.PortOpen := True;
        except
        end;
      end;
    end;
  Finally
    ini_fun.Free;
  End;
end;

function TfmMain.CreateDBConfig: string;
var
  ini_fun : TiniFile;
  stResult : string;
begin
  result := '';
  stResult := '';
  Try
    ini_fun := TiniFile.Create('c:\'+ L_stCustomerID + '.INI');
  Except
    Exit;
  End;
  Try
    Try
      stResult := 'PGTYPE' + ':BMOS';
      ini_fun.WriteString('BMOS','DBTYPE',inttostr(G_nDBType));
      stResult := stResult + ';' +'DBTYPE' + ':' + inttostr(G_nDBType);
      ini_fun.WriteString('BMOS','DBNAME',G_stDBName);
      stResult := stResult + ';' + 'DBNAME' + ':' + G_stDBName;
      ini_fun.WriteString('BMOS','DBSERVER',G_stDBHost);
      stResult := stResult + ';' + 'DBSERVER' + ':' + G_stDBHost;
      ini_fun.WriteString('BMOS','DBUSER',G_stDBUserID);
      stResult := stResult + ';' + 'DBUSER' + ':' + G_stDBUserID;
      ini_fun.WriteString('BMOS','DBUSERPW',G_stDBUserPw);
      stResult := stResult + ';' + 'DBUSERPW' + ':' + G_stDBUserPw;
      ini_fun.WriteString('BMOS','DBPORT',G_stDBPort);
      stResult := stResult + ';' + 'DBPORT' + ':' + G_stDBPort;
    Except
      Exit;  //Window 7 ���� ���� �κп� ���� write�� �ȵ�
    End;
  Finally
    ini_fun.Free;
  End;
  result := stResult;
end;

procedure TfmMain.CreateMDIChild(Kind: integer; const FormName: string);
begin
  case Kind of
    con_FormBMOSTIMECODEADMIN : begin
      fmTimeCodeAdmin := TfmTimeCodeAdmin.Create(Application);
      fmTimeCodeAdmin.Caption := FormName;
    end;
  end;
end;

procedure TfmMain.DeleteCardPermitDelete;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select a.* from TB_EMPLOYEE a ';
  stSql := stSql + ' inner join (select EM_SEQ from TB_CARDPERMITEMPLOYEECODE where CP_PERMIT <> ''0'' group by EM_SEQ) b ';
  stSql := stSql + ' on(a.em_seq = b.em_seq) ';
  stSql := stSql + ' where a.EM_ACUSE = ''0'' AND a.EM_ATUSE = ''0'' AND a.EM_FDUSE = ''0'' ';

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
        ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + stSql);
          dmDataBase.DBConnected := False;
          Exit;
        end;
      End;

      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        dmDBCardPermit.EmployeePermitAllDelete(FindField('EM_SEQ').AsString); //��� ��ü���� ����
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

procedure TfmMain.DeviceAlarmEvent(Sender: TObject;aDecoderNo:integer; aNodeNo, aECUID, aExtendID,
  aCmd, aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode,
  aLoop, aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string; aRealTime: Boolean);
var
  fmTemp : TForm;
  nIndex : integer;
  nAlarmPCIndex : integer;
begin


  nIndex := PCClientSocketList.IndexOf(inttostr(aDecoderNo));
  if nIndex < 0 then Exit;
  nAlarmPCIndex := ALARMEVENTSTATEPCCODEList.IndexOf(aAlarmStatePCCode);
  if nAlarmPCIndex > -1 then
  begin
    aAlarmView := TALARMEVENTSTATEPCCODE(ALARMEVENTSTATEPCCODEList.Objects[nAlarmPCIndex]).AlarmEventView;
    aAlarmSound := TALARMEVENTSTATEPCCODE(ALARMEVENTSTATEPCCODEList.Objects[nAlarmPCIndex]).AlarmEventSound;
    aAlarmColor := inttostr(TALARMEVENTSTATEPCCODE(ALARMEVENTSTATEPCCODEList.Objects[nAlarmPCIndex]).AlarmEventColor);
  end;

  if Not G_bIsMaster then
  begin
    if TdmPCClient(PCClientSocketList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaUsed,aNodeNo,aECUID,aArmArea) <> '1' then Exit;  //��ȸ ��� ������ �ƴϸ� ���� ������...
  end;

  if G_bModeChangeSound then
  begin
    if copy(aAlarmStatePCCode,3,2) = 'A0' then   //����� �����
    begin
      if (MediaPlayer1.Mode <> mpPlaying) and (MediaPlayer2.Mode <> mpPlaying) then  //�˶� �︮�� �ִ� ���ȿ��� �Ҹ� ���� ����.
      begin
        WindowsMediaPlayer1.Controls.stop;
        WindowsMediaPlayer1.URL := G_stModeChangeArmSoundFile;
        WindowsMediaPlayer1.Controls.play;
      end;
    end else if copy(aAlarmStatePCCode,3,2) = 'D0' then  //������� �����
    begin
      if (MediaPlayer1.Mode <> mpPlaying) and (MediaPlayer2.Mode <> mpPlaying) then
      begin
        WindowsMediaPlayer1.Controls.stop;
        WindowsMediaPlayer1.URL := G_stModeChangeDisArmSoundFile;
        WindowsMediaPlayer1.Controls.play;
      end;
    end;

  end;


  if G_bFormEnabled[con_FormBMOSMONITOR] then
  begin
    if aAlarmSound = '1' then
    begin
      MediaPlayer1.FileName := G_stExeFolder + '\..\sound\' + G_stAlarmEventAlaramFile;
      AlarmSoundList.Add(G_stExeFolder + '\..\sound\' + G_stAlarmEventAlaramFile);
      if G_bAlarmEventSoundOnUse then SoundTimer.Enabled := True;
      if G_bAlarmEventMessageUse then
      begin
        if G_nBMSType = 2 then pan_Alarm.Visible := True;
      end;
    end;
    fmTemp := MDIForm('TfmMonitoring');
    if fmTemp <> nil then TfmMonitoring(fmTemp).DeviceAlarmEvent(aDecoderNo,aNodeNo, aECUID,aExtendID, aCmd,
                          aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
                          aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
                          aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor);
  end;
  if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
  begin
    if aAlarmSound = '1' then
    begin
      MediaPlayer1.FileName := G_stExeFolder + '\..\sound\' + G_stAlarmEventAlaramFile;
      AlarmSoundList.Add(G_stExeFolder + '\..\sound\' + G_stAlarmEventAlaramFile);
      if G_bAlarmEventSoundOnUse then SoundTimer.Enabled := True;
      if G_bAlarmEventMessageUse then
      begin
        if G_nBMSType = 2 then pan_Alarm.Visible := True;
      end;
    end;
    fmTemp := MDIForm('TfmBuildingMonitoring');
    if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).DeviceAlarmEvent(aDecoderNo,aNodeNo, aECUID,aExtendID, aCmd,
                          aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
                          aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
                          aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor);
  end;

  if G_bFormEnabled[con_FormBMOSMAPMONITOR] then
  begin
    if aAlarmSound = '1' then
    begin
      MediaPlayer1.FileName := G_stExeFolder + '\..\sound\' + G_stAlarmEventAlaramFile;
      AlarmSoundList.Add(G_stExeFolder + '\..\sound\' + G_stAlarmEventAlaramFile);
      if G_bAlarmEventSoundOnUse then SoundTimer.Enabled := True;
      if G_bAlarmEventMessageUse then
      begin
        if G_nBMSType = 2 then pan_Alarm.Visible := True;
      end;
    end;
    fmTemp := MDIForm('TfmMapMonitoring');
    if fmTemp <> nil then TfmMapMonitoring(fmTemp).DeviceAlarmEvent(aDecoderNo,aNodeNo, aECUID,aExtendID, aCmd,
                          aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
                          aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
                          aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor);
  end;

end;

procedure TfmMain.DeviceCardAccessEvent(Sender: TObject;aDecoderNo:integer; aTime, aNodeNo, aEcuID,
  aDoorNo, aReaderNo, aInOut, aCardMode, aDoorMode, aChangeState, aAccessResult,
  aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode, aCompanyName,
  aEmSeq, aEmCode, aEmName, aPosiCode, aPosiName,aPrintNo,aHandPhone: string);
var
  fmTemp : TForm;
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

  if G_bFormEnabled[con_FormBMOSMONITOR] then
  begin
    fmTemp := MDIForm('TfmMonitoring');
    if fmTemp <> nil then TfmMonitoring(fmTemp).DeviceCardAccessEvent(aDecoderNo,aTime,aNodeNo, aEcuID,aDoorNo, aReaderNo, aInOut,stInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,stAccessPermitName,
                          aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone);
  end;

  if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
  begin
    fmTemp := MDIForm('TfmBuildingMonitoring');
    if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).DeviceCardAccessEvent(aDecoderNo,aTime,aNodeNo, aEcuID,aDoorNo, aReaderNo, aInOut,stInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,stAccessPermitName,
                          aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone);
  end;


  if G_bFormEnabled[con_FormBMOSMAPMONITOR] then
  begin
    fmTemp := MDIForm('TfmMapMonitoring');
    if fmTemp <> nil then TfmMapMonitoring(fmTemp).DeviceCardAccessEvent(aDecoderNo,aTime,aNodeNo, aEcuID,aDoorNo, aReaderNo, aInOut,stInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,stAccessPermitName,
                          aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone);
  end;


  if isDigit(aReaderNo) then
  begin
    nIndex := FoodReaderList.IndexOf(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + inttostr(strtoint(aReaderNo)));
    if nIndex > -1 then  //�ļ��������� �ö�� �������̸�
    begin
      TFoodReaderType(FoodReaderList.Objects[nIndex]).DeviceCardAccessEvent(aDecoderNo,aTime,aNodeNo, aEcuID,aDoorNo, aReaderNo, aInOut,stInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,stAccessPermitName,
                          aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName);
    end;
  end;

end;

procedure TfmMain.DeviceChangeEvent(Sender: TObject;aDecoderNo:integer; aNodeNo, aEcuID, aType,
  aNo, aCmd, aData: string);
var
  fmTemp : TForm;
begin
  if (aType = SCECU) and (aCmd = SCCMDCONNECTED) then
  begin
    if G_bFormEnabled[con_FormBMOSMONITOR] then
    begin
      fmTemp := MDIForm('TfmMonitoring');
      if fmTemp <> nil then TfmMonitoring(fmTemp).RcvDeviceConnectedChangeEvent(aDecoderNo,aNodeNo,aEcuID,aData);
    end;
    if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
    begin
      fmTemp := MDIForm('TfmBuildingMonitoring');
      if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).RcvDeviceConnectedChangeEvent(aDecoderNo,aNodeNo,aEcuID,aData);
    end;

  end;
end;

procedure TfmMain.DeviceStateTimerTimer(Sender: TObject);
var
  i : integer;
  bCheck : Boolean;
begin
  inherited;
(*  if G_bApplicationTerminate then Exit;
//  if Not dmPCClient.Connected then Exit;
  if L_nDeviceStateCheckCount > 3 then
  begin
    L_nDeviceStateCheckCount := 0;
    L_bDeviceStateChecking := False; //������ Ǯ��
  end;
  if L_bDeviceStateChecking then
  begin
    inc(L_nDeviceStateCheckCount);
    Exit;
  end;
  Try
    Try
      L_bDeviceStateChecking := True;
      if L_nCurrentCheckNodeSeq < 0 then L_nCurrentCheckNodeSeq := 0;
      if L_nCurrentCheckNodeSeq > G_MonitoringNodeList.Count - 1 then
      begin
        L_nCurrentCheckNodeSeq := 0;
      end;
      if G_MonitoringNodeList.Count < 1 then Exit;
      if TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckNodeSeq]).ServerRcv <> 'Y' then
      begin
        TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckNodeSeq]).NodeStateCheck;
      end;
      if G_bApplicationTerminate then Exit;
      if L_nCurrentCheckNodeSeq = G_MonitoringNodeList.Count - 1 then
      begin
        DeviceStateTimer.Interval := 1000; //ó�� �ѹ��� �� �Ŀ��� 1�ʿ� �ѹ��� ����. TEST
        L_nCurrentCheckNodeSeq := 0;
        bCheck := True;
        for i := 0 to G_MonitoringNodeList.Count - 1 do
          if TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckNodeSeq]).ServerRcv <> 'Y' then bCheck := False;

        if bCheck then
        begin
          DeviceStateTimer.Enabled := False; //�������� ��� ���� ���� ��� ���� Ÿ�̸� ����
          NodeConncectCheckTimer.Enabled := True;
          MonitoringRefresh;
        end;
      end else
      begin
        L_nCurrentCheckNodeSeq := L_nCurrentCheckNodeSeq + 1;
      end;
    Except
      Exit;
    End;

  Finally
    L_bDeviceStateChecking := False;
  End;
*)
end;

procedure TfmMain.DoorChangeEvent(Sender: TObject; aDecoderNo:integer; aNodeNo, aEcuID, aType, aNo,
  aCmd, aData, aBuildingCode: string);
var
  fmTemp : TForm;
  nIndex : integer;
  stDoorName : string;
  bMonitoring : Boolean;
begin
  bMonitoring := False;

  nIndex := G_MonitoringBuildingList.IndexOf('0'); //��ü ���� ����Ʈ�� ���Թ� ���� ��������.
  if nIndex > -1 then
  begin
    TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).DoorChangeEvent(aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData);
    stDoorName := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorName(aDecoderNo,aNodeNo,aEcuID,aNo);
  end;

  if Length(aBuildingCode) >= ((G_nBuildingCodeLength * G_nBuildingStep) + 1) then
  begin
    nIndex := G_MonitoringBuildingList.IndexOf(copy(aBuildingCode,1,1 + (G_nBuildingCodeLength * G_nBuildingStep))); //�ش� ���� ����Ʈ�� ���Թ� ���� ��������.
    if nIndex > -1 then
    begin
      TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).DoorChangeEvent(aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData);
    end;
  end;

  if G_bFormEnabled[con_FormBMOSMONITOR] then
  begin
    bMonitoring := True;
    fmTemp := MDIForm('TfmMonitoring');
    if fmTemp <> nil then TfmMonitoring(fmTemp).DoorChangeEvent(aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode);
  end;
  if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
  begin
    bMonitoring := True;
    fmTemp := MDIForm('TfmBuildingMonitoring');
    if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).DoorChangeEvent(aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode);
  end;

  if G_bFormEnabled[con_FormBMOSMAPMONITOR] then
  begin
    bMonitoring := True;
    fmTemp := MDIForm('TfmMapMonitoring');
    if fmTemp <> nil then TfmMapMonitoring(fmTemp).DoorChangeEvent(aDecoderNo,aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode);
  end;

  if G_bDoorOpenAlarmUse and (aCmd = SCCMDDOORDSSTATE) and (aData = 'O')then    //���Թ��� ���� ���
  begin
    nIndex := OpenDoorAlarmList.IndexOf(FillZeroStrNum(aNodeNo,G_nNodeCodeLength) + aEcuID + aNo);
    if nIndex > -1 then
    begin
      //������� �°��� ���� ������ �ִ� ���̴ϱ� ���⿡�� �޽��� ��� �� �ָ� �ȴ�.
      if FileExists(G_stExeFolder + '\..\sound\' + G_stDoorOpenAlarmFile) then
      begin
        OpenDoorAlarmSoundList.Add(G_stExeFolder + '\..\sound\' + G_stDoorOpenAlarmFile);
        OpenDoorSoundTimer.Enabled := True;
      end;
      lb_AccessMessage.Caption.Text := stDoorName + ' : Door Open !!! ';
      pan_Access.Visible := True;

    end;
  end;

  if G_bDoorLongTimeOpenEventUse and ((aData = 'D') or (aData = 'T')) then   //��ð� ���� ���� �˶� �︮��
  begin
    if bMonitoring then
    begin
      OpenDoorAlarmSoundList.Add(G_stExeFolder + '\..\sound\' + G_stAccessEventAlaramFile);
      OpenDoorSoundTimer.Enabled := True;
      lb_AccessMessage.Caption.Text := stDoorName + ' : Door Open !!! ';
      pan_Access.Visible := True;
    end;
  end;

end;

procedure TfmMain.DoorStateCheckTimerTimer(Sender: TObject);
var
  i,j,k : integer;
  nDeviceCount,nDoorCount : integer;
  bCheck : Boolean;
  stDSState : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
begin
(*  if G_bApplicationTerminate then Exit;
//  if Not dmPCClient.Connected then Exit;
  if L_nDoorStateCheckCount > 3 then
  begin
    L_nDoorStateCheckCount := 0;
    L_bDoorStateChecking := False; //������ Ǯ��
  end;
  if L_bDoorStateChecking then
  begin
    inc(L_nDoorStateCheckCount);
    Exit;
  end;
  Try
    Try
      bCheck := False;
      L_bDoorStateChecking := True;
      if L_nCurrentCheckDoorNodeSeq < 0 then L_nCurrentCheckDoorNodeSeq := 0;
      if L_nCurrentCheckDoorNodeSeq > G_MonitoringNodeList.Count - 1 then L_nCurrentCheckDoorNodeSeq := 0;
      if G_MonitoringNodeList.Count < 1 then Exit;
      if TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).NodeConnected <> '0' then  //���� �Ǿ� ������ ���Թ� ���� üũ ����.
      begin
        nDeviceCount := TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceCount;
        for j := 0 to nDeviceCount do
        begin
          if TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceIndexConnect(j) = '1' then  //��Ʈ�ѷ� ���� �Ǿ� �ִµ�...
          begin
            nDoorCount := TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceIndexDoorCount(j);
            if nDoorCount > 0 then
            begin
              for k := 0 to nDoorCount do
              begin
                stDSState := TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceIndexDoorIndexDSState(j,k) ;
                if (stDSState = '') or (stDSState = '*') then
                begin
                  bCheck := True;
                  stNodeNo := FillZeroNumber(TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).NodeNo,G_nNodeCodeLength);
                  stEcuID := TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceIndexEcuID(j);
                  stDoorNo := TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).GetDeviceIndexDoorID(j,k);
                  TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckDoorNodeSeq]).SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,FillZeroNumber(strtoint(stDoorNo),2));
                  break;
                end;
              end;
            end;
          end;
        end;
      end;
      if G_bApplicationTerminate then Exit;
      if L_nCurrentCheckDoorNodeSeq = 0 then
      begin
        L_nCurrentCheckDoorNodeSeq := L_nCurrentCheckDoorNodeSeq + 1;

        if Not bCheck then
        begin
          DoorStateCheckTimer.Enabled := False;
        end;
      end else
      begin
        L_nCurrentCheckDoorNodeSeq := L_nCurrentCheckDoorNodeSeq + 1;
      end;
    Except
      Exit;
    End;

  Finally
    L_bDoorStateChecking := False;
  End;
*)
end;

procedure TfmMain.EmployeeFileUpload(aFile,aEmApprove: string;aDupCardexcept:Boolean=False);
var
  EmployeeFileList : TStringList;
  i : integer;
  nResult : integer;
  stError : string;
  stVer : string;
begin
  if Not fileexists(aFile) then
  begin
    showmessage('���õ� ������ �����ϴ�.');
    Exit;
  end;
  pan_progress.Visible := True;
  EmployeeFileList := TStringList.Create;
  memo1.Lines.Clear;
  Try
    EmployeeFileList.LoadFromFile(aFile);
    stVer := EmployeeFileList.Strings[0];
    if Pos('VER=',stVer) > 0 then
    begin
      Delete(stVer,1,length('VER='));
      if (stVer='1.0') then
      begin
        if EmployeeFileList.Count > 1 then
        begin
          ProgressBar1.Max := EmployeeFileList.Count - 1;
          for i := 2 to EmployeeFileList.Count - 1 do
          begin
            ProgressBar1.Position := i;
            nResult :=  EmployeeLineUploadVer(EmployeeFileList.Strings[i],1,aDupCardexcept);
            if nResult <> 0 then
            begin
              if nResult = -1 then stError := 'ī���ȣ�̵��:' + EmployeeFileList.Strings[i]
              else if nResult = -2 then stError := '�׷��ڵ�̵��:' + EmployeeFileList.Strings[i]
              else if nResult = -3 then stError := '��������Է½���:' + EmployeeFileList.Strings[i]
              else if nResult = -4 then stError := '�������������Ʈ����:' + EmployeeFileList.Strings[i]
              else stError := '��Ÿ����('+inttostr(nResult) + '):' + EmployeeFileList.Strings[i];

              memo1.Lines.Add(stError);
              pan_EmUpload.Visible := True;
            end;
            Application.ProcessMessages;
          end;
        end;
        Exit;
      end;
    end;
    if G_nMonitoringType = 1 then
    begin
      if FindCharCopy( EmployeeFileList.Strings[0],0,',') <> '�ι�' then
      begin
        showmessage('���������� Ʋ���ϴ�.���ε��������� ���� �Ŀ� �ش� ���˿� ���� ���ε� �ϼ���.');
        Exit;
      end;
    end;
    if EmployeeFileList.Count > 1 then
    begin
      ProgressBar1.Max := EmployeeFileList.Count - 1;
      for i := 1 to EmployeeFileList.Count - 1 do
      begin
        ProgressBar1.Position := i;
        nResult :=  EmployeeLineUpload(EmployeeFileList.Strings[i],aEmApprove,aDupCardexcept);
        if nResult <> 0 then
        begin
          if nResult = -1 then stError := 'ī���ȣ�̵��:' + EmployeeFileList.Strings[i]
          else if nResult = -2 then stError := '�׷��ڵ�̵��:' + EmployeeFileList.Strings[i]
          else if nResult = -3 then stError := '��������Է½���:' + EmployeeFileList.Strings[i]
          else if nResult = -4 then stError := '�������������Ʈ����:' + EmployeeFileList.Strings[i]
          else stError := '��Ÿ����('+inttostr(nResult) + '):' + EmployeeFileList.Strings[i];

          memo1.Lines.Add(stError);
          pan_EmUpload.Visible := True;
        end;
        Application.ProcessMessages;
      end;
    end;
  Finally
    EmployeeFileList.Free;
    pan_progress.Visible := False;
  End;
end;

Function TfmMain.EmployeeLineUpload(aLine,aEmApprove: string;aDupCardexcept:Boolean=False):integer;
var
  LineDataList : TStringList;
  stCompanyName1 : string;
  stCompanyName2 : string;
  stCompanyName3 : string;
  stCompanyName4 : string;
  stCompanyName5 : string;
  stCompanyName6 : string;
  stPosiName : string;
  stEmCode : string;
  stEmName : string;
  stWorkGubunName : string; //��������
  stHandPhone : string;
  stCompanyPhone : string;
  stEmpInfo : string; //��Ÿ
  stCardNo : string;
  stValidDate : string;
  stGradeType : string;
  stGroupName : string;
  stTemp1,stTemp2,stTemp3,stTemp4 : string;
  stEmSeq : string;
  stCardPrintNo : string;
  stCompanyCode : string;
  stGroupPermitCode : string;
  stPosiCode : string;
  bGradeUpdate : Boolean;
  stACType : string;
  stATType : string;
  stFDType : string;
  stPositionNum : string;
  stRelayID : string;
  stGubunCode : string;
  stFingerUse : string;
  stEmStateCode : string;
  stAWCode : string;
  stCardUse : string;
  nResult : integer;
begin
  nResult := 0;
  stCardPrintNo := '';
  stCompanyCode := '0';
  stGroupPermitCode := '0';
  stPosiCode := '0';
  stACType := '1';
  stATType := '0';
  stFDType := '0';
  stGubunCode := '0'; //�������� �ڵ� ���»�,������ ��
  stFingerUse := '0'; //����������� 0.�̻��,1.���
  stEmStateCode := '1'; //1.����,2.����
  stAWCode := '1';
  stCardUse := '0'; //0.ī��̵��,1.ī����
  bGradeUpdate := True;
  LineDataList := TStringList.Create;
  Try

    LineDataList.StrictDelimiter := True;
    LineDataList.Delimiter := ',';
    LineDataList.DelimitedText := aLine;
    if LineDataList.Count < 7 then Exit;
    stCompanyName1 := Trim(LineDataList.Strings[0]);
    stCompanyName2 := Trim(LineDataList.Strings[1]);
    stCompanyName3 := Trim(LineDataList.Strings[2]);
    stCompanyName4 := Trim(LineDataList.Strings[3]);
    if G_nMonitoringType = 1 then  //�бⱹ�� �̸�
    begin
      stEmCode := LineDataList.Strings[4];
      if LineDataList.Count > 5 then stEmName := Trim(LineDataList.Strings[5]);
      if LineDataList.Count > 6 then stWorkGubunName := Trim(LineDataList.Strings[6]);
      if LineDataList.Count > 7 then stHandPhone := Trim(LineDataList.Strings[7]);
      if LineDataList.Count > 8 then stCompanyPhone := Trim(LineDataList.Strings[8]);
      if LineDataList.Count > 9 then stEmpInfo := Trim(LineDataList.Strings[9]);
      if LineDataList.Count > 10 then stCardPrintNo := Trim(LineDataList.Strings[10]);
      if LineDataList.Count > 11 then stCardNo := Trim(LineDataList.Strings[11]);
      if LineDataList.Count > 12 then stValidDate := Trim(LineDataList.Strings[12]);
      stValidDate := stringReplace(stValidDate,'-','',[rfReplaceAll]);
      stValidDate := stringReplace(stValidDate,':','',[rfReplaceAll]);
      stValidDate := stringReplace(stValidDate,' ','',[rfReplaceAll]);
      if Not isDate(stValidDate) then
      begin
        stValidDate := '99991231';
      end;
      if LineDataList.Count > 13 then stGradeType := Trim(LineDataList.Strings[13]);
      if Not isDigit(stGradeType) then stGradeType := '1';
      if stGradeType = '3' then bGradeUpdate := False;
      if LineDataList.Count > 14 then stGroupName := Trim(LineDataList.Strings[14]);
    end else
    begin
      stCompanyName5 := Trim(LineDataList.Strings[4]);
      stCompanyName6 := Trim(LineDataList.Strings[5]);
      stPosiName := Trim(LineDataList.Strings[6]);
      stEmCode := Trim(LineDataList.Strings[7]);
      if LineDataList.Count > 8 then stEmName := Trim(LineDataList.Strings[8]);
      if LineDataList.Count > 9 then stWorkGubunName := Trim(LineDataList.Strings[9]);
      if LineDataList.Count > 10 then stHandPhone := Trim(LineDataList.Strings[10]);
      if LineDataList.Count > 11 then stCompanyPhone := Trim(LineDataList.Strings[11]);
      if LineDataList.Count > 12 then stEmpInfo := Trim(LineDataList.Strings[12]);
      if LineDataList.Count > 13 then stCardNo := Trim(LineDataList.Strings[13]);
      if LineDataList.Count > 14 then stValidDate := Trim(LineDataList.Strings[14]);
      if stValidDate <> '' then
      begin
        stValidDate := stringReplace(stValidDate,'-','',[rfReplaceAll]);
        stValidDate := stringReplace(stValidDate,':','',[rfReplaceAll]);
        stValidDate := stringReplace(stValidDate,' ','',[rfReplaceAll]);
        if Not isDate(stValidDate) then
        begin
          stValidDate := '99991231';
        end;
      end else
      begin
        stValidDate := '99991231';
      end;
      if LineDataList.Count > 15 then stGradeType := Trim(LineDataList.Strings[15]);
      if Not isDigit(stGradeType) then stGradeType := '3';
      if stGradeType = '3' then bGradeUpdate := False;
      if LineDataList.Count > 16 then stGroupName := Trim(LineDataList.Strings[16]);
    end;
    if stEmCode = '' then //������� �����ؼ� ���ε� ����.
    begin
      stEmCode := dmDBFunction.GetNextTB_EMPLOYEE_EmployeeCode;
    end;
    if G_nMonitoringType = 1 then  //�бⱹ�� �̸�
    begin
      //stCardPrintNo := stCardNo;
      if stCardPrintNo <> '' then
      begin
        stCardNo := dmDBFunction.GetTB_CARDPRINTLIST_CardNo(stCardPrintNo);
      end else
      begin
        if Not isDigit(stCardNo)  then nResult := -1
        else
        begin
          stCardNo := Dec2Hex(strtoint64(stCardNo),8);
          //stCardNo := FillCharString(stCardNo,'*',16);
        end;
        stCardPrintNo := dmDBFunction.GetTB_CARDPRINTLIST_PrintNoFromCardNo(FillCharString(stCardNo,'*',16));
        if stCardPrintNo = '' then
        begin
          stCardPrintNo := dmDBFunction.GetTB_CARDPRINTLIST_AutoPrintNo;
          dmDBInsert.InsertIntoTB_CARDPRINTLIST_Value(stCardPrintNo,FillCharString(stCardNo,'*',16));
        end;
      end;
    end;
    if stCardNo <> '' then
    begin
      stCardNo := FillCharString(stCardNo,'*',16,False);
      if aDupCardexcept then  //�ߺ� ī�� ���� ���ε� �̸� ī�� üũ�ؼ� ������ ���� ������.
      begin
        if dmDBFunction.CheckTB_CARD_CARDNO(stCardNo,stTemp1,stTemp2,stTemp3,stTemp4) = 1 then
        begin
          result := 0;
          Exit;
        end;
      end;
    end;
    if stCompanyName1 <> '' then
    begin
      stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName1,'1');
      if stTemp1 = '' then
      begin
        dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
        dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName1,stTemp2,'1',stTemp3);
      end;
      stCompanyCode := stTemp1;
      if stCompanyName2 <> '' then
      begin
        stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName2,'2');
        if stTemp1 = '' then
        begin
          dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
          dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName2,stTemp2,'1',stTemp3);
        end;
        stCompanyCode := stTemp1;
        if stCompanyName3 <> '' then
        begin
          stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName3,'3');
          if stTemp1 = '' then
          begin
            dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
            dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName3,stTemp2,'1',stTemp3);
          end;
          stCompanyCode := stTemp1;
          if stCompanyName4 <> '' then
          begin
            stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName4,'4');
            if stTemp1 = '' then
            begin
              dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
              dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName4,stTemp2,'1',stTemp3);
            end;
            stCompanyCode := stTemp1;
            if stCompanyName5 <> '' then
            begin
              stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName5,'5');
              if stTemp1 = '' then
              begin
                dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
                dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName5,stTemp2,'1',stTemp3);
              end;
              stCompanyCode := stTemp1;
              if stCompanyName6 <> '' then
              begin
                stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName6,'6');
                if stTemp1 = '' then
                begin
                  dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
                  dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName5,stTemp2,'1',stTemp3);
                end;
                stCompanyCode := stTemp1;
              end;
           end;
          end;
        end;
      end;
    end;
    if stPosiName <> '' then
    begin
      stPosiCode := dmDBFunction.GetTB_POSICODE_codeFromName('',stPosiName);
      if stPosiCode = '' then
      begin
        stPosiCode := dmDBFunction.GetNextTB_PosiCode;
        dmDBInsert.InsertIntoTB_POSICODE_DefaultValue(stPosiCode,stPosiName,'0',stPosiCode);
      end;
    end;
    if stGroupName <> '' then
    begin
      stGroupPermitCode := dmDBFunction.GetTB_EMPLOYEEGROUPCODE_codeFromName(stGroupName,'',stTemp1);
      if stGroupPermitCode = '' then
      begin
        nResult := -2;
        //dmDBFunction.GetNextTB_EMPLOYEEGROUPCODE_ChildEmGroupCode(G_stAdminEmGroupCode,stGroupPermitCode,stTemp1,stTemp2);
        //dmDBInsert.InsertIntoTB_EMPLOYEEGROUPCODE_All(stGroupPermitCode,stGroupName,stTemp1,'1',stTemp2);
      end;
    end;
    if stWorkGubunName <> '' then
    begin
      stTemp1 := dmDBFunction.GetTB_EMPLOYEEGUBUN_CodeFromName(stWorkGubunName);
      if stTemp1 = '' then
      begin
        stTemp1 := dmDBFunction.GetNextTB_EMPLOYEEGUBUN_Code;
        dmDBInsert.InsertIntoTB_EMPLOYEEGUBUN_Value(stTemp1,stWorkGubunName,stTemp1);
      end;
      stGubunCode := stTemp1;
    end;
    if dmDBFunction.GetTB_EMPLOYEE_EmSeq(stEMCode,stEmseq,stTemp1,stTemp2,stTemp3) <> 1 then  //������� üũ �ؼ� ���� ����.
    begin
      stEmSeq := dmDBFunction.GetNextTB_EMPLOYEE_EmSeq;
    end else
    begin
      if (stTemp3 = stGradeType) then
      begin
        if (stGradeType = '1') and ( stTemp1 = stCompanyCode) then bGradeUpdate := False; //�ҼӺ� ���� �̸鼭 �Ҽ��� ���� ���� �ʾ����� ���� ���۾� �� �ʿ� ����.
        if (stGradeType = '2') and ( stTemp2 = stGroupPermitCode) then bGradeUpdate := False; //�׷캰 ���� �̸鼭 �׷��� ���� ���� �ʾ����� ���� ���۾� �� �ʿ� ����.
      end;
    end;

    if nResult = 0 then
    begin
      if stCardNo <> '' then
      begin
        stCardNo := FillCharString(stCardNo,'*',16,False);
        if dmDBFunction.CheckTB_CARD_CARDNO(stCardNo,stTemp1,stTemp2,stTemp3,stTemp4) <> 1 then
        begin
          bGradeUpdate := True;
          stPositionNum := dmDBFunction.GetNextTB_CARD_PositionNum;
          stRelayID := dmDBFunction.GetNextTB_CARD_RelayID;
          dmDBInsert.InsertIntoTB_CARD_Value(stCardNo,'1','1',stPositionNum,stRelayID,'0',stEmSeq,stCardPrintNo);
          dmDBInsert.InsertIntoTB_CARDHIS_CopyCard(stCardNo,stCardNo,con_ComWorkType_INSERT); //ī�� �Է� �̷� ������.
        end else
        begin
          if (stTemp2 <> stEmSeq) then
          begin
            dmDBUpdate.UpdateTB_CARD_Field_IntValue(stCardNo,'EM_SEQ',stEmSeq);
            bGradeUpdate := True; //���� ���۾�
          end;
        end;
        stCardUse := '1';
      end;
      if dmDBFunction.checkTB_EMPLOYEE_EMSeq(stEmSeq) <> 1 then
      begin
        bGradeUpdate := True;
        if Not dmDBInsert.InsertIntoTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stGubunCode,
                   stCompanyPhone,'',stHandPhone,stEmpInfo,FormatDateTime('yyyymmdd',Now),
                   stValidDate,'1',stATType,stFdType,stGroupPermitCode,stGradeType,stFingerUse,stEmStateCode,stAWCode,stCardUse,'0','','',aEmApprove) then nResult := -3;
        dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_INSERT); //������� InSert ���� ������. ī�带 ó�� �ϰ� ������� �Է� �Ŀ� ���ܾ� ������ ���� ����
      end else
      begin
        if stCardUse <> '1' then stCardUse := ''; //ī�尡 �̵�� �����̸� �� ���� ��� �����ϼ��� �ִ�.

        if Not dmDBUpdate.UpdateTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stGubunCode,
                   stCompanyPhone,'',stHandPhone,stEmpInfo,'',
                   stValidDate,'1','','',stGroupPermitCode,stGradeType,'',stEmStateCode,'',False,stCardUse,'','','',aEmApprove) then nResult := -4;
        dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_UPDATE); //������� InSert ���� ������. ī�带 ó�� �ϰ� ������� �Է� �Ŀ� ���ܾ� ������ ���� ����
      end;
      if bGradeUpdate then
      begin
        if stGradeType = '3' then  //���κ� ���� �۾��̸�
        begin
          dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N','','',aEmApprove); //�ش� ����� ���� ���� �κ��� �� �۾� - ������ ī�尡 �ְų� �߰��� ī�尡 �����Ƿ�
        end else
        begin
          dmDBCardPermit.EmployeeGradeChange_Process(stEmSeq,stCompanyCode,stGroupPermitCode,stGradeType,bGradeUpdate,aEmApprove);
        end;
      end;
    end;
  Finally
    LineDataList.Free;
  End;
  result := nResult;
end;

function TfmMain.EmployeeLineUploadVer(aLine: string; aVer: integer;aDupCardexcept:Boolean=False): integer;
var
  LineDataList : TStringList;
  stCompanyName1 : string;
  stCompanyName2 : string;
  stCompanyName3 : string;
  stCompanyName4 : string;
  stCompanyName5 : string;
  stCompanyName6 : string;
  stPosiName : string;
  stEmCode : string;
  stEmName : string;
  stWorkGubunName : string; //��������
  stHandPhone : string;
  stCompanyPhone : string;
  stEmpInfo : string; //��Ÿ
  stCardNo : string;
  stValidDate : string;
  stGradeType : string;
  stGroupName : string;
  stTemp1,stTemp2,stTemp3,stTemp4 : string;
  stEmSeq : string;
  stCardPrintNo : string;
  stCompanyCode : string;
  stGroupPermitCode : string;
  stPosiCode : string;
  bGradeUpdate : Boolean;
  stACType : string;
  stATType : string;
  stFDType : string;
  stPositionNum : string;
  stRelayID : string;
  stGubunCode : string;
  stFingerUse : string;
  stEmStateCode : string;
  stAWCode : string;
  stCardUse : string;
  nResult : integer;
begin
  nResult := 0;
  stCardPrintNo := '';
  stCompanyCode := '0';
  stGroupPermitCode := '0';
  stPosiCode := '0';
  stACType := '1';
  stATType := '0';
  stFDType := '0';
  stGubunCode := '0'; //�������� �ڵ� ���»�,������ ��
  stFingerUse := '0'; //����������� 0.�̻��,1.���
  stEmStateCode := '1'; //1.����,2.����
  stAWCode := '1';
  stCardUse := '0'; //0.ī��̵��,1.ī����
  stGradeType := '3';
  bGradeUpdate := True;
(*
  stSql := ' select b.CO_COMPANYNAME as ''�ι�'',c.CO_COMPANYNAME as ''����'', ';
  stSql := stSql + ' d.CO_COMPANYNAME as ''����/����/����'',e.CO_COMPANYNAME as ''��'',';
  stSql := stSql + ' a.EM_CODE as ''���'',a.EM_NAME as ''�̸�'',';
  stSql := stSql + ' f.EM_GUBUNCODENAME as ''��������'',';
  stSql := stSql + ' a.EM_HANDPHONE as ''�ڵ���'',a.EM_COMPANYPHONE as ''�系��ȭ��ȣ'',';
  stSql := stSql + ' a.EM_EMINFO as ''��Ÿ����'',';
  stSql := stSql + ' g.CA_PRINTNO as ''ī���Ϸù�ȣ'',';
  stSql := stSql + ' g.CA_CARDNO as ''ī���ȣ'', ';
  stSql := stSql + ' a.EM_ENDDATE as ''��ȿ�Ⱓ'' ';
*)
  LineDataList := TStringList.Create;
  Try

    LineDataList.StrictDelimiter := True;
    LineDataList.Delimiter := ',';
    LineDataList.DelimitedText := aLine;
    if LineDataList.Count < 7 then Exit;
    stCompanyName1 := LineDataList.Strings[0]; //�ι�
    stCompanyName2 := LineDataList.Strings[1]; //����
    stCompanyName3 := LineDataList.Strings[2]; //����/����/����
    stCompanyName4 := LineDataList.Strings[3]; //��
    if aVer = 1 then  //1.0 �����̸�
    begin
      stEmCode := LineDataList.Strings[4];
      if LineDataList.Count > 5 then stEmName := LineDataList.Strings[5];
      if LineDataList.Count > 6 then stWorkGubunName := LineDataList.Strings[6];
      if LineDataList.Count > 7 then stHandPhone := LineDataList.Strings[7];
      if LineDataList.Count > 8 then stCompanyPhone := LineDataList.Strings[8];
      if LineDataList.Count > 9 then stEmpInfo := LineDataList.Strings[9];
      if LineDataList.Count > 10 then stCardPrintNo := LineDataList.Strings[10];
      if LineDataList.Count > 11 then stCardNo := LineDataList.Strings[11];
      if LineDataList.Count > 12 then stValidDate := LineDataList.Strings[12];
      stValidDate := stringReplace(stValidDate,'-','',[rfReplaceAll]);
      stValidDate := stringReplace(stValidDate,':','',[rfReplaceAll]);
      stValidDate := stringReplace(stValidDate,' ','',[rfReplaceAll]);
      if Not isDate(stValidDate) then
      begin
        stValidDate := '99991231';
      end;
      if LineDataList.Count > 13 then stGradeType := LineDataList.Strings[13];
      if Not isDigit(stGradeType) then stGradeType := '3';
      if stGradeType = '3' then bGradeUpdate := False;
      if LineDataList.Count > 14 then stGroupName := LineDataList.Strings[14];
    end;
    if stEmCode = '' then //������� �����ؼ� ���ε� ����.
    begin
      stEmCode := dmDBFunction.GetNextTB_EMPLOYEE_EmployeeCode;
    end;
    if G_nMonitoringType = 1 then  //�бⱹ�� �̸�
    begin
      //stCardPrintNo := stCardNo;
      if stCardPrintNo <> '' then
      begin
        stCardNo := dmDBFunction.GetTB_CARDPRINTLIST_CardNo(stCardPrintNo);
      end else
      begin
        if Not isDigit(stCardNo)  then nResult := -1
        else
        begin
          stCardNo := Dec2Hex(strtoint64(stCardNo),8);
          //stCardNo := FillCharString(stCardNo,'*',16);
        end;
        stCardPrintNo := dmDBFunction.GetTB_CARDPRINTLIST_PrintNoFromCardNo(FillCharString(stCardNo,'*',16));
        if stCardPrintNo = '' then
        begin
          stCardPrintNo := dmDBFunction.GetTB_CARDPRINTLIST_AutoPrintNo;
          dmDBInsert.InsertIntoTB_CARDPRINTLIST_Value(stCardPrintNo,FillCharString(stCardNo,'*',16));
        end;
      end;
    end;
    if stCardNo <> '' then
    begin
      stCardNo := FillCharString(stCardNo,'*',16,False);
      if aDupCardexcept then  //�ߺ� ī�� ���� ���ε� �̸� ī�� üũ�ؼ� ������ ���� ������.
      begin
        if dmDBFunction.CheckTB_CARD_CARDNO(stCardNo,stTemp1,stTemp2,stTemp3,stTemp4) = 1 then
        begin
          result := 0;
          Exit;
        end;
      end;
    end;
    if stCompanyName1 <> '' then
    begin
      stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName1,'1');
      if stTemp1 = '' then
      begin
        dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
        dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName1,stTemp2,'1',stTemp3);
      end;
      stCompanyCode := stTemp1;
      if stCompanyName2 <> '' then
      begin
        stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName2,'2');
        if stTemp1 = '' then
        begin
          dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
          dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName2,stTemp2,'1',stTemp3);
        end;
        stCompanyCode := stTemp1;
        if stCompanyName3 <> '' then
        begin
          stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName3,'3');
          if stTemp1 = '' then
          begin
            dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
            dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName3,stTemp2,'1',stTemp3);
          end;
          stCompanyCode := stTemp1;
          if stCompanyName4 <> '' then
          begin
            stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName4,'4');
            if stTemp1 = '' then
            begin
              dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
              dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName4,stTemp2,'1',stTemp3);
            end;
            stCompanyCode := stTemp1;
            if stCompanyName5 <> '' then
            begin
              stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName5,'5');
              if stTemp1 = '' then
              begin
                dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
                dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName5,stTemp2,'1',stTemp3);
              end;
              stCompanyCode := stTemp1;
              if stCompanyName6 <> '' then
              begin
                stTemp1 := dmDBFunction.GetTB_COMPANYCODE_CompanyCodeFromName(stCompanyCode,stCompanyName6,'6');
                if stTemp1 = '' then
                begin
                  dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,stTemp1,stTemp2,stTemp3);
                  dmDBInsert.InsertIntoTB_COMPANYCODE_All(stTemp1,stCompanyName5,stTemp2,'1',stTemp3);
                end;
                stCompanyCode := stTemp1;
              end;
           end;
          end;
        end;
      end;
    end;
    if stPosiName <> '' then
    begin
      stPosiCode := dmDBFunction.GetTB_POSICODE_codeFromName('',stPosiName);
      if stPosiCode = '' then
      begin
        stPosiCode := dmDBFunction.GetNextTB_PosiCode;
        dmDBInsert.InsertIntoTB_POSICODE_DefaultValue(stPosiCode,stPosiName,'0',stPosiCode);
      end;
    end;
    if stGroupName <> '' then
    begin
      stGroupPermitCode := dmDBFunction.GetTB_EMPLOYEEGROUPCODE_codeFromName(stGroupName,'',stTemp1);
      if stGroupPermitCode = '' then
      begin
        nResult := -2;
        //dmDBFunction.GetNextTB_EMPLOYEEGROUPCODE_ChildEmGroupCode(G_stAdminEmGroupCode,stGroupPermitCode,stTemp1,stTemp2);
        //dmDBInsert.InsertIntoTB_EMPLOYEEGROUPCODE_All(stGroupPermitCode,stGroupName,stTemp1,'1',stTemp2);
      end;
    end;
    if stWorkGubunName <> '' then
    begin
      stTemp1 := dmDBFunction.GetTB_EMPLOYEEGUBUN_CodeFromName(stWorkGubunName);
      if stTemp1 = '' then
      begin
        stTemp1 := dmDBFunction.GetNextTB_EMPLOYEEGUBUN_Code;
        dmDBInsert.InsertIntoTB_EMPLOYEEGUBUN_Value(stTemp1,stWorkGubunName,stTemp1);
      end;
      stGubunCode := stTemp1;
    end;
    if dmDBFunction.GetTB_EMPLOYEE_EmSeq(stEMCode,stEmseq,stTemp1,stTemp2,stTemp3) <> 1 then  //������� üũ �ؼ� ���� ����.
    begin
      stEmSeq := dmDBFunction.GetNextTB_EMPLOYEE_EmSeq;
    end else
    begin
      if (stTemp3 = stGradeType) then
      begin
        if (stGradeType = '1') and ( stTemp1 = stCompanyCode) then bGradeUpdate := False; //�ҼӺ� ���� �̸鼭 �Ҽ��� ���� ���� �ʾ����� ���� ���۾� �� �ʿ� ����.
        if (stGradeType = '2') and ( stTemp2 = stGroupPermitCode) then bGradeUpdate := False; //�׷캰 ���� �̸鼭 �׷��� ���� ���� �ʾ����� ���� ���۾� �� �ʿ� ����.
      end;
    end;

    if nResult = 0 then
    begin
      if stCardNo <> '' then
      begin
        if dmDBFunction.CheckTB_CARD_CARDNO(stCardNo,stTemp1,stTemp2,stTemp3,stTemp4) <> 1 then
        begin
          bGradeUpdate := True;
          stPositionNum := dmDBFunction.GetNextTB_CARD_PositionNum;
          stRelayID := dmDBFunction.GetNextTB_CARD_RelayID;
          dmDBInsert.InsertIntoTB_CARD_Value(stCardNo,'1','1',stPositionNum,stRelayID,'0',stEmSeq,stCardPrintNo);
          dmDBInsert.InsertIntoTB_CARDHIS_CopyCard(stCardNo,stCardNo,con_ComWorkType_INSERT); //ī�� �Է� �̷� ������.
        end else
        begin
          if (stTemp2 <> stEmSeq) then
          begin
            dmDBUpdate.UpdateTB_CARD_Field_IntValue(stCardNo,'EM_SEQ',stEmSeq);
            bGradeUpdate := True; //���� ���۾�
          end;
        end;
        stCardUse := '1';
      end;
      if dmDBFunction.checkTB_EMPLOYEE_EMSeq(stEmSeq) <> 1 then
      begin
        bGradeUpdate := True;
        if Not dmDBInsert.InsertIntoTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stGubunCode,
                   stCompanyPhone,'',stHandPhone,stEmpInfo,FormatDateTime('yyyymmdd',Now),
                   stValidDate,'1',stATType,stFdType,stGroupPermitCode,stGradeType,stFingerUse,stEmStateCode,stAWCode,stCardUse,'0','','','') then nResult := -3;
        dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_INSERT); //������� InSert ���� ������. ī�带 ó�� �ϰ� ������� �Է� �Ŀ� ���ܾ� ������ ���� ����
      end else
      begin
        if stCardUse <> '1' then stCardUse := ''; //ī�尡 �̵�� �����̸� �� ���� ��� �����ϼ��� �ִ�.

        if Not dmDBUpdate.UpdateTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stGubunCode,
                   stCompanyPhone,'',stHandPhone,stEmpInfo,'',
                   stValidDate,'1','','',stGroupPermitCode,stGradeType,'',stEmStateCode,'',False,stCardUse,'','','') then nResult := -4;
        dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_UPDATE); //������� InSert ���� ������. ī�带 ó�� �ϰ� ������� �Է� �Ŀ� ���ܾ� ������ ���� ����
      end;
      if bGradeUpdate then
      begin
        if stGradeType = '3' then  //���κ� ���� �۾��̸�
        begin
          dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N','',''); //�ش� ����� ���� ���� �κ��� �� �۾� - ������ ī�尡 �ְų� �߰��� ī�尡 �����Ƿ�
        end else
        begin
          dmDBCardPermit.EmployeeGradeChange_Process(stEmSeq,stCompanyCode,stGroupPermitCode,stGradeType,bGradeUpdate);
        end;
      end;
    end;
  Finally
    LineDataList.Free;
  End;
  result := nResult;
end;

procedure TfmMain.EventCardReader(Sender: TObject; aCardNo: string);
var
  fmTemp : TForm;
begin
//ī���ϱ� �̺�Ʈ

  if G_bFormEnabled[con_FormBMOSCARDREGESTFORM] then
  begin
    fmTemp := MDIForm('TfmEmployeeCardCreate');
    if fmTemp <> nil then TfmEmployeeCardCreate(fmTemp).CardRegistEvent(aCardNo);
  end;
  if G_bFormEnabled[con_FormBMOSEMPLOYEE] then
  begin
    fmTemp := MDIForm('TfmEmployee');
    if fmTemp <> nil then TfmEmployee(fmTemp).CardRegistEvent(aCardNo);
  end;
  if G_bFormEnabled[con_FormBMOSFPCARDEMPLOYEE] then
  begin
    fmTemp := MDIForm('TfmFPCardEmployee');
    if fmTemp <> nil then TfmFPCardEmployee(fmTemp).CardRegistEvent(aCardNo);
  end;
  if G_bFormEnabled[con_FormBMOSKTEMPLOYEE] then
  begin
    fmTemp := MDIForm('TfmKTEmployee');
    if fmTemp <> nil then TfmKTEmployee(fmTemp).CardRegistEvent(aCardNo);
  end;
end;

function TfmMain.FontSetting: Boolean;
begin
//
end;

procedure TfmMain.FoodEvent(Sender: TObject; aFoodDate, aAccessTime, aCardno,
  aCompanyCode, aCompanyName, aEmSeq, aEmCode, aEmName, aAccessResult,aAccessPermitName,
  aFoodType, aFoodTypeName, aFoodCode, aFoodCodeName, aFoodAmt: string);
var
  fmTemp : TForm;
begin
  if G_bFormEnabled[con_FormBMOSFOODMONITOR] then
  begin
    fmTemp := MDIForm('TfmFoodMonitoring');
    if fmTemp <> nil then TfmFoodMonitoring(fmTemp).FoodEvent(aFoodDate,aAccessTime,aCardno,aCompanyCode, aCompanyName,aEmSeq,aEmCode,aEmName,aAccessResult,aAccessPermitName,aFoodType,aFoodTypeName,
                                                  aFoodCode,aFoodCodeName,aFoodAmt);
  end;

end;

procedure TfmMain.FormActivate(Sender: TObject);
var
  stKey : string;
  stDate : string;
  bResult : Boolean;
  stContent : string;
  bRegistryKeyCheck : Boolean;
begin
  inherited;
  if L_bFormActivate then Exit;
  L_bFormActivate := True; // �ѹ��� Activate ���� �ǵ��� ������

  bRegistryKeyCheck := RegistryKeyCheck(L_stCustomerID);

  if G_bKeyCheck and Not bRegistryKeyCheck then
  begin
    stKey := GetAuthKey('2');
    if stKey = '' then
    begin
      if G_nFormLanguageType = 1 then showMessage('���α׷� ��ġ�� ���α׷� ������ �����ž� ��� ���� �մϴ�.')
      else showMessage('Please create an authentication key.');
      ExecFileAndWait(G_stExeFolder + '\KeyZen.exe 2',true,true);
      stKey := GetAuthKey('2');
    end;
    if stKey = '' then
    begin
      Application.Terminate;
      G_bApplicationTerminate := True;
      Exit;
    end;

    L_stCustomerID := GetCustomerId('');
    bResult  := False;

    if L_stCustomerID <> '' then
    begin
      bResult := CompareKey(L_stCustomerID,stKey);
      if Not bResult then bResult := CompareKey2(L_stCustomerID,stKey);
      if Not bResult then bResult := CompareKey3(L_stCustomerID,stKey);
      if Not bResult then bResult := CompareKey4(L_stCustomerID,stKey);
      if Not bResult then bResult := CompareKey4(L_stCustomerID,stKey,1);
      if Not bResult then
      begin
        stKey := GetAuthKey('2',1);
        if stKey <> '' then
        begin
          bResult := CompareKey(L_stCustomerID,stKey);
          if Not bResult then bResult := CompareKey2(L_stCustomerID,stKey);
          if Not bResult then bResult := CompareKey3(L_stCustomerID,stKey);
          if Not bResult then bResult := CompareKey4(L_stCustomerID,stKey);
          if Not bResult then bResult := CompareKey4(L_stCustomerID,stKey,1);
        end;
      end;
    end;
    if Not bResult then
    begin
      showmessage(dmFormMessage.GetMessage('INCORRECTAUTHKEY')); //����Ű���� Ʋ���ϴ�.')
      if FileExists(ExtractFileDir(Application.ExeName) + '\' + 'Key.ini') then
      begin
        //DeleteFile(ExtractFileDir(Application.ExeName) + '\' + 'Key.ini');
      end;
      Application.Terminate;
      G_bApplicationTerminate := True;
      Close;
      Exit;
    end;

    if L_stCustomerID = 'Z-00000000' then
    begin
      stDate := GetInstallDate('2');
      stDate := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
      if Not IsDate(stDate) then
      begin
        showmessage(dmFormMessage.GetMessage('EXPIRAUTHKEY'));
        Application.Terminate;
        G_bApplicationTerminate := True;
        Close;
        Exit;
      end;
      if stDate < formatDateTime('yyyy-mm-dd',now) then
      begin
        showmessage(dmFormMessage.GetMessage('EXPIRAUTHKEY'));
        //if G_nFormLanguageType = 1 then showmessage('����Ű�� ��ȿ�Ⱓ�� ����Ǿ����ϴ�.')
        //else showmessage('Expiration');
        Application.Terminate;
        G_bApplicationTerminate := True;
        Close;
        Exit;
      end;
    end;

    if Not bRegistryKeyCheck then
    begin
      WriteRegistryKey(L_stCustomerID,stDate);
    end;
  end;

  Panel1.Left := -1000;
  stContent := CreateDBConfig;
  //Exit; //�Ʒ� ������ Ÿ�� ���� �߻�

  if stContent <> '' then
  begin
    if FileExists('c:\'+ L_stCustomerID + '.INI') then
    begin
      //���⿡�� FTP ��������.
      // if UseFTPZeronServer then FTPZeronServerSend;
      HTTPZeronServerSend(stContent);
    end;
  end;
  Timer1.Enabled := True;
  //G_bAlarmMonitoringUse := True; //TEST
end;

procedure TfmMain.FORMALARMCONFIRMExecute;
var
  i : integer;
begin
  LoadSecurityEvent;
  for i := 0 to PCClientSocketList.Count - 1 do
  begin
    TdmPCClient(PCClientSocketList.Objects[i]).SendPacket('E',SCMONITORING,'A','0000','00',''); //�˶� Ȯ�� ����
  end;
end;

procedure TfmMain.FORMALARMMESSAGE(aMessage: string);
begin
  lb_Message.Caption.Text := aMessage;
end;

procedure TfmMain.FORMCARDDOWNLOADExecute;
begin
  if L_bCardDownLoadStart then Exit;
  Try
    L_bCardDownLoadStart := True;
//    while dmDBFunction.GetTB_CARDPERMITEMPLOYEECODE_ApplyCount <> 0 do
//    begin
//      Delay(1000);
//      Application.ProcessMessages;
//    end;
    CardDownLoadStart;
  Finally
    L_bCardDownLoadStart := False;
  End;
end;

procedure TfmMain.FORMCHANGE(aName: integer; aValue: string);
var
  i : integer;
begin
  inherited;
  for i := 0 to HIGH(G_bFormEnabled) do
  begin
    if G_bFormEnabled[i] then FormChangeEvent(i,aName);
  end;

end;

function TfmMain.FormChangeEvent(aFormNumber, aFormName: integer): Boolean;
var
  fmTemp : TForm;
begin
  case aFormNumber of
    con_FormBMOSACCESSHISREPORT : begin
      fmTemp := MDIForm('TfmAccessHisReport');
      if fmTemp <> nil then TfmAccessHisReport(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSACCESSREPORT : begin
      fmTemp := MDIForm('TfmAccessReport');
      if fmTemp <> nil then TfmAccessReport(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSARMAREACODE : begin
      fmTemp := MDIForm('TfmArmArea');
      if fmTemp <> nil then TfmArmArea(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSBUILDINGCODE : begin
      fmTemp := MDIForm('TfmBuilding');
      if fmTemp <> nil then TfmBuilding(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSBUTTONEVENTREPORT : begin
      fmTemp := MDIForm('TfmButtonEventReport');
      if fmTemp <> nil then TfmButtonEventReport(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSCARDREGESTFORM : begin
      fmTemp := MDIForm('TfmEmployeeCardCreate');
      if fmTemp <> nil then TfmEmployeeCardCreate(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSCOMPANYCODE : begin
      fmTemp := MDIForm('TfmCompany');
      if fmTemp <> nil then TfmCompany(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSDOORCODE : begin
      fmTemp := MDIForm('TfmDoorList');
      if fmTemp <> nil then TfmDoorList(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSEMPLOYEE : begin
      fmTemp := MDIForm('TfmEmployee');
      if fmTemp <> nil then TfmEmployee(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSFPCARDEMPLOYEE : begin
      fmTemp := MDIForm('TfmEmployee');
      if fmTemp <> nil then TfmEmployee(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSKTEMPLOYEE : begin
      fmTemp := MDIForm('TfmFPCardEmployee');
      if fmTemp <> nil then TfmFPCardEmployee(fmTemp).FormChangeEvent(aFormName);
    end;
    con_FormBMOSPOSICODE : begin
      fmTemp := MDIForm('TfmPosiCode');
      if fmTemp <> nil then TfmPosiCode(fmTemp).FormChangeEvent(aFormName);
    end;
  end;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini_fun : TiniFile;
  i : integer;
begin
  inherited;
  if G_bApplicationTerminate then  Exit;  //�̹� ���� ���̴�...
  G_bApplicationTerminate := True;

  Logined := False;
  AlarmPlayStop := True;
  AccessPlayStop := True;

  Delay(1000);//�۾��� ������ �ð��� �ʿ� �ϴ�.

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
  //DeviceStateTimer.Free;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MIAMS.INI');
    Try
      with ini_fun do
      begin
        if fmMain.Width > Screen.Width then fmMain.Width := Screen.Width;
        if fmMain.Height >= Screen.Height then fmMain.Height := Screen.Height - 50;
        if fmMain.Top < 0 then fmMain.Top := 0;
        WriteInteger('Form','Width',Width);
        WriteInteger('Form','Height',Height);
        WriteInteger('Form','Left',Left);
        WriteInteger('Form','Top',Top);
        if WindowState = wsMaximized then WriteInteger('Form','Maximized',1)
        else WriteInteger('Form','Maximized',0);
      end;
    Except
      Exit;
    End;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  Application.OnMessage := MessageEvent;

  fmSprash:= TfmSprash.Create(Application);
  fmSprash.Show;
  fmSprash.Update;
  G_bApplicationTerminate := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
(*
  if (G_nProgramType = 0) and FileExists(G_stExeFolder + '\ktt.ico') then    //������Ʈ���� ������ ���� ����
  begin
    self.Icon.LoadFromFile(G_stExeFolder + '\ktt.ico');
    Application.Icon.LoadFromFile(G_stExeFolder + '\ktt.ico');
  end else if (G_nProgramType = 2) and FileExists(G_stExeFolder + '\sk.ico') then
  begin
    self.Icon.LoadFromFile(G_stExeFolder + '\sk.ico');
    Application.Icon.LoadFromFile(G_stExeFolder + '\sk.ico');
  end else if FileExists(G_stExeFolder + '\logo.ico') then
  begin
    self.Icon.LoadFromFile(G_stExeFolder + '\logo.ico');
    Application.Icon.LoadFromFile(G_stExeFolder + '\logo.ico');
  end;
*)

  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('DataBase Connected Fail');
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;

  dmDataBase.OnAdoConnected := AdoConnected;
  MemoryCreate;
  MemoryClear;

  dmComPort.OnCardReadEvent := EventCardReader;
  FontSetting;
  FAllowSize := True;

  dmDBCardPermit.OnCardPermitProcess := CardPermitProcessEvent;
  WindowsMediaPlayer1.Left := -1000;

//  WindowState := wsMaximized;
//  Align := alClient;
//  tmMonitor := Screen.MonitorFromWindow( Handle );
//  tmWorkRect := tmMonitor.WorkareaRect;
//  SetBounds( tmWorkRect.Left, tmWorkRect.Top, tmWorkRect.Right - tmWorkRect.Left, tmWorkRect.Bottom - tmWorkRect.Top );
end;

procedure TfmMain.FORMENABLE(aName:integer; aValue: string);
var
  bValue : Boolean;
begin
  Try
    if UpperCase(aValue) = 'TRUE' then bValue := True
    else bValue := False;

    G_bFormEnabled[aName] := bValue;   //�ش� ��

    case aName of
      con_FormBMOSSECURITYMONITOR : begin  //��� ���� ��ȸ��
        if bValue then LoadSecurityEvent;
      end;
      con_FormBMOSMERGEMONITOR : begin  //��� ���� ��ȸ��
        if bValue then LoadSecurityEvent;
      end;
      con_FormBMOSMAPSECURITYMONITOR : begin  //����� ���� ��ȸ��
        if bValue then LoadSecurityEvent;
      end;
      con_FormBMOSMAPSECURITYACCESS : begin  //����� ���� ��ȸ��
        if bValue then LoadSecurityEvent;
      end;
      con_FormBMOSMAPACCESS : begin  //���Ը� ���� ��ȸ��
        //if bValue then LoadSecurityEvent;
      end;
      con_FormBMOSMAPMONITOR : begin
        if Not bValue then at_Menu.Visible := True;
      end;
    end;
  Except
    Exit;
  End;
end;

procedure TfmMain.FormMenuChange;
begin
  at_Menu.Visible := Not at_Menu.Visible;
end;

function TfmMain.FormMenuNameSetting: Boolean;
begin
  StartMenu.MenuItems[0].Caption := dmFormFunction.GetFormName('2','1','BM1_0');
  StartMenu.MenuItems[1].Caption := dmFormFunction.GetFormName('2','1','BM1_1');
  StartMenu.MenuItems[2].Caption := dmFormFunction.GetFormName('2','1','BM1_2');
  StartMenu.MenuItems[3].Caption := dmFormFunction.GetFormName('2','1','BM1_3');
  StartMenu.SubMenuCaption := dmFormFunction.GetFormName('2','1','BM1_01');
  StartMenu.SubMenuItems[0].Title := dmFormFunction.GetFormName('2','1','BM1_02');
  ApBasicAdmin.Caption  := dmFormFunction.GetFormName('2','1','BM2_0');
  mn_CompanyCode.Caption  := dmFormFunction.GetFormName('2','1','BM2_011');
  mn_CompanyCode.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_011');
  mn_CompanyCode.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_011');
  mn_BuildingCode.Caption  := dmFormFunction.GetFormName('2','1','BM2_012');
  mn_BuildingCode.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_012');
  mn_BuildingCode.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_012');
  mn_PosiCodeAdd.Caption  := dmFormFunction.GetFormName('2','1','BM2_013');
  btn_PosiCode.Caption  := dmFormFunction.GetFormName('2','1','BM2_013');
  btn_PosiCode.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_013');
  btn_PosiCode.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_013');
  mn_Holiday.Caption  := dmFormFunction.GetFormName('2','1','BM2_014');
  mn_Holiday.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_014');
  mn_Holiday.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_014');
  mn_TimeCode.Caption  := dmFormFunction.GetFormName('2','1','BM2_015');
  mn_TimeCode.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_015');
  mn_TimeCode.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_015');
  mn_CardGubun.Caption := dmFormFunction.GetFormName('3','1','BM2_0151');
  mn_AccessStateCode.Caption := dmFormFunction.GetFormName('3','1','BM2_0152');
  mn_AlarmStateCode.Caption := dmFormFunction.GetFormName('3','1','BM2_0153');
  mn_EmployeeGubun.Caption := dmFormFunction.GetFormName('2','1','BM2_016');
  btn_employeeGubun.Caption  := dmFormFunction.GetFormName('2','1','BM2_016');
  btn_employeeGubun.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_016');
  btn_employeeGubun.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_016');
  mn_Groupcode.Caption := dmFormFunction.GetFormName('2','1','BM2_017');
  mn_Groupcode.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_017');
  mn_Groupcode.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_017');

  mn_DoorCode.Caption  := dmFormFunction.GetFormName('2','1','BM2_021');
  mn_DoorCode.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_021');
  mn_DoorCode.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_021');
  mn_ArmAreaCode.Caption  := dmFormFunction.GetFormName('2','1','BM2_022');
  mn_ArmAreaCode.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_022');
  mn_ArmAreaCode.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_022');
  mn_Zone.Caption  := dmFormFunction.GetFormName('2','1','BM2_023');
  mn_Zone.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_023');
  mn_Zone.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_024');
  mn_telephoneoffice.Caption  := dmFormFunction.GetFormName('2','1','BM2_024');
  mn_telephoneoffice.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_024');
  mn_telephoneoffice.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_024');
  mn_ReaderNumber.Caption  := dmFormFunction.GetFormName('2','1','BM2_025');
  mn_ReaderNumber.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_025');
  mn_ReaderNumber.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_025');


  mn_BuildingMap.Caption  := dmFormFunction.GetFormName('2','1','BM2_031');
  mn_BuildingMap.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_031');
  mn_BuildingMap.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_031');
  mn_ArmAreaMap.Caption  := dmFormFunction.GetFormName('2','1','BM2_032');
  mn_ArmAreaMap.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_032');
  mn_ArmAreaMap.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_032');
  mn_ZoneMap.Caption := dmFormFunction.GetFormName('2','1','BM2_0321');
  mn_DoorMap.Caption  := dmFormFunction.GetFormName('2','1','BM2_033');
  mn_DoorMap.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM2_033');
  mn_DoorMap.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM2_033');

  ApManager.Caption  := dmFormFunction.GetFormName('2','1','BM3_0');
  ap_FoodManager.Caption := dmFormFunction.GetFormName('2','1','BM3_0');
  mn_EmployeeApprove.Caption  := dmFormFunction.GetFormName('2','1','BM3_026');
  mn_CardCreate.Caption  := dmFormFunction.GetFormName('2','1','BM3_010');
  mn_Employee.Caption  := dmFormFunction.GetFormName('2','1','BM3_011');
  mn_Employee.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_011');
  mn_Employee.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_011');
  mn_employeeManager.Caption  := dmFormFunction.GetFormName('2','1','BM3_011');
  mn_employeeManager.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_011');
  mn_employeeManager.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_011');
  mn_employeeUploadFileFormat.Caption := dmFormFunction.GetFormName('0','2','COMMONUPLOADFILEFORMAT');
  mn_EmployeeFileUpload.Caption := dmFormFunction.GetFormName('0','2','COMMONFILEUPLOAD');

  mn_AccessMonitoring.Caption  := dmFormFunction.GetFormName('2','1','BM3_012');
  mn_AccessMonitoring.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_012');
  mn_AccessMonitoring.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_012');
  mn_SecurityMonitoring.Caption  := dmFormFunction.GetFormName('2','1','BM3_013');
  mn_SecurityMonitoring.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_013');
  mn_SecurityMonitoring.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_013');
//  mn_IntegrateMonitoring.Caption  := dmFormFunction.GetFormName('2','1','BM3_014');
//  mn_IntegrateMonitoring.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_014');
//  mn_IntegrateMonitoring.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_014');
  mn_ServerMonitoring.Caption  := dmFormFunction.GetFormName('2','1','BM3_015');
  mn_ServerMonitoring.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_015');
  mn_ServerMonitoring.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_015');
  mn_ServerMonitoring1.Caption  := dmFormFunction.GetFormName('2','1','BM3_015');
  mn_ServerMonitoring1.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_015');
  mn_ServerMonitoring1.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_015');
//  mn_AccessTimeAdmin.Caption  := dmFormFunction.GetFormName('2','1','BM3_016');
  mn_CompanyGrade.Caption  := dmFormFunction.GetFormName('2','1','BM3_017');
  mn_CompanyGrade.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_017');
  mn_CompanyGrade.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_017');
  mn_GroupGrade.Caption  := dmFormFunction.GetFormName('2','1','BM3_018');
  mn_GroupGrade.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_018');
  mn_GroupGrade.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_018');
  mn_AccessTimeAdmin.Caption  := dmFormFunction.GetFormName('2','1','BM3_019');
  mn_AccessTimeAdmin.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_019');
  mn_AccessTimeAdmin.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_019');
  mn_DoorSchedule1.Caption  := dmFormFunction.GetFormName('2','1','BM3_020');
  mn_DoorSchedule1.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_020');
  mn_DoorSchedule1.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_020');
  mn_PermitResend.Caption  := dmFormFunction.GetFormName('2','1','BM3_029');
  mn_PermitResend.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_029');
  mn_PermitResend.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_029');
  mn_MonitorState.Caption  := dmFormFunction.GetFormName('2','1','BM3_021');
  mn_MonitorState.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_021');
  mn_MonitorState.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_021');
  mn_FireRecovery.Caption  := dmFormFunction.GetFormName('2','1','BM3_022');
  mn_FireRecovery.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_022');
  mn_FireRecovery.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_022');
  mn_DaemonRestart.Caption  := dmFormFunction.GetFormName('2','1','BM3_023');
  mn_DaemonRestart.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_023');
  mn_DaemonRestart.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_023');
  mn_EmployeeGradeSearch.Caption := dmFormFunction.GetFormName('2','1','BM3_024');
  mn_EmployeeGradeSearch.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_024');
  mn_EmployeeGradeSearch.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_024');
  mn_ReaderPasswd.Caption := dmFormFunction.GetFormName('2','1','BM3_025');
  mn_ReaderPasswd.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_025');
  mn_ReaderPasswd.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_025');
  mn_EmployeeGrade.Caption := dmFormFunction.GetFormName('2','1','BM3_028');
  mn_EmployeeGrade.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_028');
  mn_EmployeeGrade.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_028');
  btn_FoodReaderSetting.Caption := dmFormFunction.GetFormName('2','1','BM3_101');
  btn_FoodReaderSetting.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_101');
  btn_FoodReaderSetting.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_101');
  btn_FoodMonitoring.Caption := dmFormFunction.GetFormName('2','1','BM3_102');
  btn_FoodMonitoring.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_102');
  btn_FoodMonitoring.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_102');
  mn_FoodReport2.Caption := dmFormFunction.GetFormName('2','1','BM4_018');
  mn_FoodReport2.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_018');
  mn_FoodReport2.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_018');
  btn_FoodStateReport.Caption := dmFormFunction.GetFormName('2','1','BM4_020');
  btn_FoodStateReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_020');
  btn_FoodStateReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_020');
  mn_ButtonEventReport.Caption := dmFormFunction.GetFormName('2','1','BM4_023');
  mn_ButtonEventReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_023');
  mn_ButtonEventReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_023');
  mn_DoorOpenReport.Caption := dmFormFunction.GetFormName('2','1','BM4_024');
  mn_DoorOpenReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_024');
  mn_DoorOpenReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_024');
  mn_DoorAlarmReport.Caption := dmFormFunction.GetFormName('2','1','BM4_025');
  mn_DoorAlarmReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_025');
  mn_DoorAlarmReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_025');


  btn_DepartStateReport.Caption := dmFormFunction.GetFormName('2','1','BM3_105');
  btn_DepartStateReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM3_105');
  btn_DepartStateReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM3_105');

  ApReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_0');
  mn_AccessReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_011');
  mn_AccessReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_011');
  mn_AccessReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_011');
  mn_AccessHistoryReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_012');
  mn_AccessHistoryReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_012');
  mn_AccessHistoryReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_012');
  mn_AlarmReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_013');
  mn_AlarmReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_013');
  mn_AlarmReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_013');
  mn_AlarmAreaReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_014');
  mn_AlarmAreaReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_014');
  mn_AlarmAreaReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_014');
  mn_ManagerReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_015');
  mn_ManagerReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_015');
  mn_ManagerReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_015');
  mn_DoorManagementReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_015');
  mn_DeviceReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_016');
  mn_DeviceReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_016');
  mn_DeviceReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_016');
  mn_AttendReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_017');
  mn_AttendReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_017');
  mn_AttendReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_017');
  mn_FoodReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_018');
  mn_FoodReport.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM4_018');
  mn_FoodReport.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM4_018');
  mn_FoodReport1.Caption  := dmFormFunction.GetFormName('2','1','BM4_018');
  mn_AlarmManagementReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_019');
  mn_FoodStateReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_020');
  btn_FoodStateReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_020');
  mn_NotUseCardReport.Caption  := dmFormFunction.GetFormName('2','1','BM4_026');
  apAdmin.Caption  := dmFormFunction.GetFormName('2','1','BM5_0');
  mn_NodeManager.Caption := dmFormFunction.GetFormName('2','1','BM5_021');
  mn_NodeManager.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM5_021');
  mn_NodeManager.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM5_021');
  mn_ServerManager.Caption  := dmFormFunction.GetFormName('2','1','BM5_022');
  mn_ServerManager.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM5_022');
  mn_ServerManager.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM5_022');
  mn_ControlManager.Caption := dmFormFunction.GetFormName('2','1','BM5_023');
  mn_ControlManager.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM5_023');
  mn_ControlManager.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM5_023');
  mn_FingerManager.Caption := dmFormFunction.GetFormName('2','1','BM5_024');
  mn_FingerManager.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM5_024');
  mn_FingerManager.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM5_024');
  mn_AdminGrade.Caption  := dmFormFunction.GetFormName('2','1','BM5_011');
  mn_AdminGrade.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM5_011');
  mn_AdminGrade.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM5_011');
  mn_AdminGradeManger.Caption  := dmFormFunction.GetFormName('2','1','BM5_0112');
  mn_AdminGradeManger.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM5_0112');
  mn_AdminGradeManger.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM5_0112');
  mn_AdminManager.Caption  := dmFormFunction.GetFormName('2','1','BM5_012');
  mn_AdminManager.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM5_012');
  mn_AdminManager.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM5_012');
  mn_CriticalForm.Caption  := dmFormFunction.GetFormName('2','1','BM5_013');
  mn_CriticalForm.OfficeHint.Title  := dmFormFunction.GetFormName('2','1','BM5_013');
  mn_CriticalForm.OfficeHint.Notes.Text  := dmFormFunction.GetFormName('3','1','BM5_013');
  ap_Other.Caption := dmFormFunction.GetFormName('2','1','BM6_0');
  btn_EmployeeRelay.Caption := dmFormFunction.GetFormName('2','1','BM6_01');
  btn_EmployeeRelay.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM6_01');
  btn_EmployeeRelay.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM6_01');
  btn_ConfigSetting.Caption := dmFormFunction.GetFormName('2','1','BM6_02');
  btn_ConfigSetting.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM6_02');
  btn_ConfigSetting.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM6_02');
  btn_RemoteControl.Caption := dmFormFunction.GetFormName('2','1','BM6_03');
  btn_RemoteControl.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM6_03');
  btn_RemoteControl.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM6_03');
  btn_Upgrade.Caption := dmFormFunction.GetFormName('2','1','BM6_04');
  btn_Upgrade.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM6_04');
  btn_Upgrade.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM6_04');
  btn_NameChange.Caption := dmFormFunction.GetFormName('2','1','BM6_05');
  btn_NameChange.OfficeHint.Title := dmFormFunction.GetFormName('2','1','BM6_05');
  btn_NameChange.OfficeHint.Notes.Text := dmFormFunction.GetFormName('3','1','BM6_05');
  mn_AtManagemnet.Caption := dmFormFunction.GetFormName('2','1','BM4_021');
  mn_AtSummary.Caption := dmFormFunction.GetFormName('2','1','BM4_022');

end;

procedure TfmMain.FORMREPORT(aName: integer; aFormType, aID: string);
var
  stName : string;
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmForm : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(mn_AlarmReport).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  if aName = con_FormBMOSALARMEVENTREPORT then
  begin
    MDIChildGradeShow('TfmAlarmEventReport',TAdvGlowButton(mn_AlarmReport).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
    fmForm := MDIForm('TfmAlarmEventReport');
    if fmForm <> nil then
    begin
       TfmAlarmEventReport(fmForm).FORMREPORT(aID,aFormType);
       TfmAlarmEventReport(fmForm).FormIDSetting(TControl(mn_AlarmReport).Hint);
    end;
(*    self.FindClassForm('TfmAlarmEventReport').FindCommand('GRADEREFRESH').Execute;
    self.FindClassForm('TfmAlarmEventReport').FindCommand('EXECUTE').Params.Values['FORMTYPE'] := stFormType;
    self.FindClassForm('TfmAlarmEventReport').FindCommand('EXECUTE').Params.Values['SEARCHID'] := stID;
    self.FindClassForm('TfmAlarmEventReport').FindCommand('EXECUTE').Execute;
    self.FindClassForm('TfmAlarmEventReport').FindCommand('MENUID').Params.Values['ID'] := TControl(mn_AlarmReport).Hint;
    self.FindClassForm('TfmAlarmEventReport').FindCommand('MENUID').Execute;  *)
  end;

end;

procedure TfmMain.FormResize(Sender: TObject);
var
  nImageHight : integer;
  nImageWidth : integer;
begin
  inherited;
  sb_Status.Panels[0].Width := 150;
  sb_Status.Panels[2].Width := 100;
  sb_Status.Panels[3].Width := 100;
  sb_Status.Panels[2].Width := Width - 350;

  pan_Alarm.Left := (Width div 2) - (pan_Alarm.Width div 2);
  pan_Alarm.Top := (Height div 2) - (pan_Alarm.Height div 2);
  pan_Access.Left := (Width div 2) - (pan_Access.Width div 2);
  pan_Access.Top := (Height div 2) - (pan_Access.Height div 2) + pan_Alarm.Height;

  pan_progress.Left := (Width div 2) - (pan_progress.Width div 2);
  pan_progress.Top := (Height div 2) - (pan_progress.Height div 2);

  nImageWidth := 1919;
  nImageHight := 928;

  Image1.Width := Width;
  Image1.Height := nImageHight * width div nImageWidth;

  Image1.Top := at_Menu.Height + (Height - at_Menu.Height - sb_Status.Height) div 2 - (Image1.Height div 2);
  Image1.Left := 0;

  pan_EmUpload.Top := at_Menu.Height + (Height - at_Menu.Height - sb_Status.Height) div 2 - (pan_EmUpload.Height div 2);
  pan_EmUpload.Left := (Width div 2) - (pan_EmUpload.Width div 2);;
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  stLogoFile : string;
  ini_fun : TiniFile;
begin
  inherited;
(*  Scaled := True;
  if (Screen.Width <> ScreenWidth) then
  begin
    Height := Longint(Height) * Longint(Screen.Height) DIV ScreenHeight;
    Width  := Longint(Width)  * Longint(Screen.Width)  DIV ScreenWidth;
    ScaleBy(Screen.Width,ScreenWidth);
  end;
 *)
  WindowState := wsMinimized;
  if G_bApplicationTerminate then Exit;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MIAMS.INI');
    fmMain.Width :=   ini_fun.ReadInteger('Form','Width',1024);
    fmMain.Height :=   ini_fun.ReadInteger('Form','Height',768);
    fmMain.Left :=   ini_fun.ReadInteger('Form','Left',0);
    fmMain.Top :=    ini_fun.ReadInteger('Form','Top',0);
    L_nWindowState := ini_fun.ReadInteger('Form','Maximized',1);
    if fmMain.Width > Screen.Width then fmMain.Width := Screen.Width;
    if fmMain.Height > Screen.Height then fmMain.Height := Screen.Height;

    {
    if ini_fun.ReadInteger('Form','Maximized',1) = 0 then fmMain.WindowState := wsNormal
    else fmMain.WindowState := wsMaximized;   }

//    G_nBuildingStep := ini_fun.ReadInteger('Config','Building',1);
    if UpperCase(ini_fun.ReadString('Config','FTPZERONSERVER','TRUE')) = 'TRUE' then G_bFTPZeronServerUse := True
    else G_bFTPZeronServerUse := False;
  Finally
    ini_fun.Free;
  End;
  (*
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      Application.Terminate;
      G_bApplicationTerminate := True;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;  *)
  GetTB_Config;
  LoadingALARMEVENTSTATEPCCODEList;
  ClientConfigIniSetting;

  StartMenu.SubMenuItems[1].Title := strBuildInfo;
  at_Menu.Caption.Caption := 'GMS_Manager[' + strBuildInfo + ']';//'ACAM software[' + strBuildInfo + ']';
  if G_nMonitoringType = 2 then //SK �̸� caption �� ACAM_Manager �� �ٲ���.
  begin
    at_Menu.Caption.Caption := 'ACAM_Manager[' + strBuildInfo + ']';//'ACAM software[' + strBuildInfo + ']';
  end;

//  dmPCClient.ServerIP := G_stDaemonControlServerIP;
//  dmPCClient.ServerPort := strtoint(G_stDaemonControlPort);
  Logined := False;
  Privileges := '';

  if G_nMonitoringType = 1 then  //�бⱹ�� Ÿ���� ���
  begin
    mn_DoorCode.Visible := False;
    mn_Holiday.Visible := False; //������ ������ ������ ����.
    mn_TimeCode.Visible := False; //Ÿ���ڵ� ������ ������ ����.
    mn_ArmAreaCode.Visible := False; //������� ������ ������ ����.
    mn_Zone.Visible := False;       //�������� ������ ����.
    mn_MapAdmin.Visible := False;   //�ʰ����� ������ ����.
    btn_PosiCode.Visible := False;   //�����ڵ� ���� ������ ����.
    mn_NodeManager.Visible := False;
    mn_ControlManager.Visible := False;
    mn_FingerManager.Visible := False;
    mn_AccessTimeAdmin.Visible := False;
    mn_DoorSchedule1.Visible := False;
    mn_PermitResend.Visible := False;
    //at_ArmAreaReport.Visible := False;
    at_FdATReport.Visible := false;
    tb_Monitoring1.Visible := False;
    tb_Monitoring2.Visible := False;


    mn_telephoneoffice.Visible := True;
    mn_ReaderNumber.Visible := True;
    mn_ReaderPasswd.Visible := True;
    mn_DoorOpenReport.Visible := True;
    mn_DoorAlarmReport.Visible := True;
    mn_AlarmReport.Visible := False;
    mn_AlarmAreaReport.Visible := False;
    btn_NameChange.Visible := False;
    G_bAccessMonitoringUse := True;
    G_bAlarmMonitoringUse := False;   //�бⱹ��� ������� ���� �� ������ �Ⱥ��δ�.
    mn_TelAccessReport.Visible := True;
  end else
  begin
    mn_DoorCode.Visible := True;
    mn_Holiday.Visible := True; //������ ����
    mn_TimeCode.Visible := True; //Ÿ���ڵ� ����
    mn_ArmAreaCode.Visible := True; //������� ����
    mn_Zone.Visible := True;       //������
    mn_MapAdmin.Visible := True;   //�ʰ���
    btn_PosiCode.Visible := True;   //�����ڵ�
    mn_NodeManager.Visible := True;
    mn_ControlManager.Visible := True;
    mn_FingerManager.Visible := True;
    mn_AccessTimeAdmin.Visible := True;
    mn_DoorSchedule1.Visible := True;
    mn_PermitResend.Visible := True;
    //at_ArmAreaReport.Visible := True;
    at_FdATReport.Visible := True;
    tb_Monitoring1.Visible := True;
    tb_Monitoring2.Visible := True;

    mn_DoorOpenReport.Visible := False;
    mn_DoorAlarmReport.Visible := False;
    mn_AlarmReport.Visible := True;
    mn_AlarmAreaReport.Visible := True;

    mn_telephoneoffice.Visible := False;
    mn_ReaderNumber.Visible := False;
    mn_ReaderPasswd.Visible := False;
    btn_NameChange.Visible := True;
    mn_TelAccessReport.Visible := False;
  end;
  mn_CardCreate.Visible := False;
  if G_nCardRegistForm = 1 then
  begin
    mn_CardCreate.Visible := True;
  end;
  mn_EmployeeApprove.Visible := False;
  if G_nEmployeeApprove = 1 then mn_EmployeeApprove.Visible := True;
  mn_ButtonEventReport.Visible := G_bCardButtonEventStatictcs;

  if G_nBMSType = 2 then   //
  begin
    ApBasicAdmin.TabVisible := True;
    ApManager.TabVisible := True;
    ApReport.TabVisible := True;
    ap_FoodManager.TabVisible := False;
    at_Menu.ActivePage := ApManager;
  end else if G_nBMSType = 3 then  //����
  begin
  end else if G_nBMSType = 4 then  //�ļ�
  begin
    ApBasicAdmin.TabVisible := False;
    ApManager.TabVisible := False;
    ApReport.TabVisible := False;
    ap_FoodManager.TabVisible := True;
    at_Menu.ActivePage := ap_FoodManager;
  end;


(*
  dmDBFunction.GetFormName; //Form Variabel Setting
  FormNameSetting;
  DBConfigSetting;
  ClientConfigIniSetting;
  EventSetting;
  dmAlarmCode.LoadAlarmModeNotCard(AlarmModeNotCardList);
  dmAlarmCode.LoadAlarmEventSoundStatusCodeLoad(AlarmEventSoundStatusCode,AlarmEventSoundColor);
  dmAlarmCode.LoadZoneDetectList(ZoneDetectList);
  DeviceLoad;

  dmClientSocket.Start := False;
  dmClientSocket.ConnectIP := G_stDaemonServerIP;
  dmClientSocket.ConnectPort := G_stDaemonServerPort;
  dmClientSocket.Start := True;

  stLogoFile := G_stExeFolder + '\Logo.JPG';
  if FileExists(stLogoFile) then
    Image1.Picture.LoadFromFile(stLogoFile);  *)
  FormMenuNameSetting;
  LoadingReaderDoorPositionList;
  LoadingAccessPermitCodeList;
  stLogoFile := G_stExeFolder + '\Logo.JPG';
  if FileExists(stLogoFile) then
    Image1.Picture.LoadFromFile(stLogoFile);
  if L_nWindowState = 0 then WindowState := wsNormal
  else WindowState := wsMaximized;
  if fmMain.Left < 0 then fmMain.Left := 0;
  if fmMain.Top < 0 then fmMain.Top := 0;
  if fmSprash <> nil then fmSprash.Free;

  if G_nEmployeeRelayType = 0 then mn_Relay.Visible := False
  else mn_Relay.Visible := True;
  if G_nACAMVersion < 2 then
  begin
    DeleteCardPermitDelete;   //������ �ο� �� ī����� �������� ���� ��� ��� ���ѻ���
  end;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('ACAM','VER','CO_CONFIGVALUE','2');

  TravelToolBarImageChange(at_Menu); //�޴� Image Change

  if (G_nSystmRelayUse = 1) and (G_nSystmRelayCustomerNo = 2) then
  begin
    dmDBRelay.AdoRelay1Connected(G_stSystmRelayDB1Type, G_stSystmRelayDB1IP, G_stSystmRelayDB1PORT,
                      G_stSystmRelayDB1USERID, G_stSystmRelayDB1USERPW, G_stSystmRelayDB1NAME);
  end;

  AutoLogoutCheckTimer.Enabled := G_bAutoLogOut;

  if G_nACAMServerVersion > 2 then
  begin
    showmessage('���� ������ ���� ������ ȣȯ���� �ʽ��ϴ�. ���׷��̵� �� ����ϼ���');
    Application.Terminate;
  end;
end;

procedure TfmMain.FormShowEvent(aFormNumber: integer; aValue: Boolean;aData1:string='');
var
  fmTemp : TForm;
begin
  case aFormNumber of
    con_FormBMOSPOSICODE : begin
      mn_PosiCodeAddClick(mn_PosiCodeAdd);
    end;
    con_FormBMOSEMPLOYEEGUBUN : begin
      mn_EmployeeGubunClick(mn_EmployeeGubun);
    end;
    con_FormBMOSEMPLOYEEGRADE : begin
      mn_EmployeeGradeClick(mn_EmployeeGrade);
      while Not G_bFormEnabled[con_FormBMOSEMPLOYEEGRADE] do
      begin
        Application.ProcessMessages;
      end;
      if G_bFormEnabled[con_FormBMOSEMPLOYEEGRADE] then
      begin
        fmTemp := MDIForm('TfmEmployeeGrade');
        if fmTemp <> nil then TfmEmployeeGrade(fmTemp).RecvCardNO(aData1);
      end;
    end;
  end;
end;

procedure TfmMain.FORMSTATUSMSG(aIndex: integer; aMessage: string);
begin
  sb_Status.Panels[aIndex].Text := aMessage;
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
    G_nFormLanguageType := 1;       //�� ��� Ÿ�� 1.KOR,2.ENG
    G_bFingerRelayUse := False;     //�������� ���� ����
    G_stDaemonControlPort := '5101';
//    G_stDaemonControlServerIP := '127.0.0.1';
    G_stFireStateCode := 'FI';
    G_bFingerDeleteUse := False;
    G_stLongTimeStateCode := 'LT';
    G_nProgramGrade := 1;
    G_nACAMVersion := 1;
    G_nProgramType := 0;
    G_nSystmRelayUse := 0; //��������
    G_nSystmRelayCustomerNo := 0;  //0.���̴н�,1.SK����,2.����
    G_nEmployeeAPPROVE := 0;
    G_bCardButtonEventStatictcs := False;
    G_bDoorLongTimeOpenEventUse := False;
    G_bCompanyCodeNotMatch := False;

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
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGGROUP').AsString = 'ACAM' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'VER' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
              G_nACAMVersion := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'ACAMSERVER' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'VER' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
              G_nACAMServerVersion := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'ATTEND' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'RELAYTYPE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
              G_nAttendRelayFormat := strtoint(FindField('CO_CONFIGVALUE').AsString);
            if G_nAttendRelayFormat = 0 then mn_AtRelayFile.Visible := False
            else mn_AtRelayFile.Visible := True;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'CARD' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'EMPLOYEESEARCH' then G_nEmployeeSearchType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CARDREGISTFORM' then G_nCardRegistForm := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTDOORPERMITTYPE' then G_nCardDefaultDOORPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTARMPERMITTYPE' then G_nCardDefaultArmPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTGRADEGROUP' then G_nCardDefaultGroupType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'FPTYPE' then G_nCardFPType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          ;
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
          end else if FindField('CO_CONFIGCODE').AsString = 'AUTOLOGOUTUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAutoLogOut := True
            else G_bAutoLogOut := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'AUTOLOGOUTTIME' then
          begin
            G_nAutoLogOutTime := FindField('CO_CONFIGVALUE').AsInteger;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'BUILDINGCODELENGTH' then G_nBuildingCodeLength := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CARDBUTTONSTAT' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bCardButtonEventStatictcs := True
            else G_bCardButtonEventStatictcs := False;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then G_nCardNoType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CAPOSINUM' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bCardPositionUse := True;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'COMPANYCODELENGTH' then G_nCompanyCodeLength := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'EM_APPROVE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nEmployeeAPPROVE := FindField('CO_CONFIGVALUE').AsInteger
            else G_nEmployeeAPPROVE := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDAUTO' then
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
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitoringOnlyMainCount := FindField('CO_CONFIGVALUE').AsInteger
            else G_nMonitoringOnlyDoorCount := 100;
          end else if FindField('CO_CONFIGCODE').AsString = 'PGTYPE' then
          begin
            G_nMonitoringType := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'PROTOCOL' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitoringProtocol := FindField('CO_CONFIGVALUE').AsInteger
            else G_nMonitoringProtocol := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'CHKFINGERCARDPOS' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nCheckFingerCardPos := FindField('CO_CONFIGVALUE').AsInteger
            else G_nCheckFingerCardPos := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'COMPANYNOTMATCH' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bCompanyCodeNotMatch := True
            else G_bCompanyCodeNotMatch := False;

          end

          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'DAEMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'CONTROLPORT' then G_stDaemonControlPort := FindField('CO_CONFIGVALUE').asstring
//          else if FindField('CO_CONFIGCODE').AsString = 'SERVERIP' then G_stDaemonControlServerIP := FindField('CO_CONFIGVALUE').asstring
          else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMEALARMUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bDoorLongTimeOpenEventUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMECD' then G_stLongTimeStateCode := FindField('CO_CONFIGVALUE').asstring
          else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMERC' then G_stLongTimeRecoveryCode := Trim(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CARDGRADE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nProgramGrade := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'PACKETTYPE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nProgramType := strtoint(FindField('CO_CONFIGVALUE').AsString);
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
          else if FindField('CO_CONFIGCODE').AsString = 'CHILDGRADESYNC' then
          begin
            if (FindField('CO_CONFIGVALUE').AsInteger = 1 ) then G_bChildGradeSync := True
            else G_bChildGradeSync := False;
          end
          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'RELAY' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'FINGERRELAYUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFingerRelayUse := True;  //���� ���� ����
          end else if FindField('CO_CONFIGCODE').AsString = 'EMPLOYEETYPE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nEmployeeRelayType := strtoint(FindField('CO_CONFIGVALUE').AsString);  //
          end else if FindField('CO_CONFIGCODE').AsString = 'FINGERDELETEUSE' then
          begin
             if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFingerDeleteUse := True;  //���� ���� ����
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'REPORT' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'SEARCHTYPE' then
          begin
            G_nReportSearchType := FindField('CO_CONFIGVALUE').AsInteger;
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
        end else if FindField('CO_CONFIGGROUP').AsString = 'FINGER' then
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
          ;
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

function TfmMain.HTTPZeronServerSend(aContent: string): Boolean;
var
  stUrl : string;
begin
  Try
    stUrl := 'http://zeron.co.kr/zmosconfig/write.php?filename=' + L_stCustomerID + '.INI' + '&content='+aContent;
    if Length(stUrl) > 1000 then stUrl := copy(stUrl,1,1000);
    WebBrowser1.Navigate(stUrl);
  Except
    Exit;
  End;
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
        dmDataBase.DBConnected := False;
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

procedure TfmMain.LoadingAlarmDoorList;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  nTempIndex : integer;
  oNode : TMonitoringNode;
  stBuildingCode : string;
  oBuilding : TMonitoringBuildingState;
  odmPCClient : TdmPCClient;
begin
  OpenDoorAlarmList.Clear;

  stSql := 'select * from tb_door where DO_OPENDOORALARM = ''Y'' ';
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
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;

      while Not Eof do
      begin
        OpenDoorAlarmList.Add(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DO_DOORNO').AsString );
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

function TfmMain.LoadingALARMEVENTSTATEPCCODEList: Boolean;
var
  stSql : string ;
  TempAdoQuery : TADOQuery;
  oAlarmEventPcCode : TALARMEVENTSTATEPCCODE;
  nIndex : integer;
begin
  UnLoadingALARMEVENTSTATEPCCODEList;
  stSql := dmDBSelect.SelectTB_ALARMEVENTSTATEPCCODE_All;
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
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;

      while Not Eof do
      begin
        oAlarmEventPcCode := TALARMEVENTSTATEPCCODE.Create(nil);
        oAlarmEventPcCode.PcCode := FindField('AP_EVENTSTATEPCCODE').AsString;
        oAlarmEventPcCode.AlarmEventView := FindField('AP_VIEW').AsString;
        oAlarmEventPcCode.AlarmEventSound := FindField('AP_SOUND').AsString;
        oAlarmEventPcCode.AlarmEventColor := FindField('AP_COLOR').AsInteger;

        ALARMEVENTSTATEPCCODEList.AddObject(FindField('AP_EVENTSTATEPCCODE').AsString,oAlarmEventPcCode);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;


end;

procedure TfmMain.LoadingArmAreaList;
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
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;

      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;

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

        nIndex := G_MonitoringBuildingList.IndexOf('0');   //��ü ���� �ڵ忡 ������� �߰�
        if nIndex < 0 then
        begin
          oBuilding := TMonitoringBuildingState.Create(nil);
          oBuilding.BuildingCode := '0';
          oBuilding.BuildingName := dmDBFunction.GetTB_BUILDINGCODE_BuildingName('0');
          oBuilding.SetArmArea_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('AR_ARMAREANO').AsString,FindField('AR_ARMAREANAME').AsString);

          oBuilding.OnBuildingAlarmStateChange := BuildingAlarmStateChange;
          oBuilding.OnBuildingSecurityModeChange := BuildingSecurityModeChange;

          G_MonitoringBuildingList.AddObject('0',oBuilding);
        end else
        begin
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetArmArea_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('AR_ARMAREANO').AsString,FindField('AR_ARMAREANAME').AsString);
        end;

        stBuildingCode := FindField('BC_BUILDINGCODE').AsString;
        stBuildingCode := copy(stBuildingCode,1,1 + (G_nBuildingCodeLength * G_nBuildingStep));
        nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);   //�ش� ���� �ڵ忡 ������� �߰�
        if nIndex < 0 then
        begin
          oBuilding := TMonitoringBuildingState.Create(nil);
          oBuilding.BuildingCode := stBuildingCode;
          oBuilding.BuildingName := dmDBFunction.GetTB_BUILDINGCODE_BuildingName(stBuildingCode);
          oBuilding.SetArmArea_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('AR_ARMAREANO').AsString,FindField('AR_ARMAREANAME').AsString);

          oBuilding.OnBuildingAlarmStateChange := BuildingAlarmStateChange;
          oBuilding.OnBuildingSecurityModeChange := BuildingSecurityModeChange;

          G_MonitoringBuildingList.AddObject(stBuildingCode,oBuilding);
        end else
        begin
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetArmArea_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('AR_ARMAREANO').AsString,FindField('AR_ARMAREANAME').AsString);
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

procedure TfmMain.LoadingDoorList;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  nTempIndex : integer;
  oNode : TMonitoringNode;
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
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;

      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;

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

        nIndex := G_MonitoringBuildingList.IndexOf('0');   //��ü ���� �ڵ忡 ���Թ� �߰�
        if nIndex < 0 then
        begin
          oBuilding := TMonitoringBuildingState.Create(nil);
          oBuilding.BuildingCode := '0';
          oBuilding.BuildingName := dmDBFunction.GetTB_BUILDINGCODE_BuildingName('0');
          oBuilding.SetDoor_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOORNAME').AsString);
          oBuilding.SetDoor_LockTypeSetting(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_LOCKTYPE').AsString);

          oBuilding.OnBuildingAlarmStateChange := BuildingAlarmStateChange;
          oBuilding.OnBuildingSecurityModeChange := BuildingSecurityModeChange;

          G_MonitoringBuildingList.AddObject('0',oBuilding);
        end else
        begin
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetDoor_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOORNAME').AsString);
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetDoor_LockTypeSetting(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_LOCKTYPE').AsString);
        end;

        stBuildingCode := FindField('BC_BUILDINGCODE').AsString;
        stBuildingCode := copy(stBuildingCode,1,1 + (G_nBuildingCodeLength * G_nBuildingStep));
        nIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);   //�ش� ���� �ڵ忡 ���Թ� �߰�
        if nIndex < 0 then
        begin
          oBuilding := TMonitoringBuildingState.Create(nil);
          oBuilding.BuildingCode := stBuildingCode;
          oBuilding.BuildingName := dmDBFunction.GetTB_BUILDINGCODE_BuildingName(stBuildingCode);
          oBuilding.SetDoor_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOORNAME').AsString);
          oBuilding.SetDoor_LockTypeSetting(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_LOCKTYPE').AsString);

          oBuilding.OnBuildingAlarmStateChange := BuildingAlarmStateChange;
          oBuilding.OnBuildingSecurityModeChange := BuildingSecurityModeChange;

          G_MonitoringBuildingList.AddObject(stBuildingCode,oBuilding);
        end else
        begin
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetDoor_Add(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOORNAME').AsString);
          TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).SetDoor_LockTypeSetting(FindField('ND_DECODERNO').AsInteger,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_LOCKTYPE').AsString);
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

procedure TfmMain.LoadingFoodReaderList;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  oFoodReader : TFoodReaderType;
begin
  UnLoadingFoodReaderList;

  stSql := dmDBSelect.SelectTB_READER_FoodMasterAll;
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
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;

      while Not Eof do
      begin
        nIndex := FoodReaderList.IndexOf(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('RE_READERNO').AsString);
        if nIndex < 0 then
        begin
          oFoodReader := TFoodReaderType.Create(nil);
          oFoodReader.NodeNo := FindField('ND_NODENO').AsInteger;
          oFoodReader.EcuID := FindField('DE_ECUID').AsString;
          oFoodReader.ReaderNo := FindField('RE_READERNO').AsString;
          oFoodReader.FoodType := FindField('RE_FDTYPE').AsString;
          oFoodReader.FoodTypeName := FindField('RE_FDTYPENAME').AsString;
          oFoodReader.YesterDayTime := FindField('FT_YESTERDAYTIME').AsString;
          oFoodReader.AddFoodCode(FindField('FO_CODE').AsString,FindField('FO_NAME').AsString,FindField('FO_STARTTIME').AsString,FindField('FO_ENDTIME').AsString,FindField('FO_AMT').AsString,FindField('FO_INITTIME').AsString);
          oFoodReader.OnFoodEvent := FoodEvent;

          FoodReaderList.AddObject(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('RE_READERNO').AsString,oFoodReader);
        end else
        begin
          TFoodReaderType(FoodReaderList.Objects[nIndex]).AddFoodCode(FindField('FO_CODE').AsString,FindField('FO_NAME').AsString,FindField('FO_STARTTIME').AsString,FindField('FO_ENDTIME').AsString,FindField('FO_AMT').AsString,FindField('FO_INITTIME').AsString);
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

procedure TfmMain.LoadingReaderDoorPositionList;
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
        dmDataBase.DBConnected := False;
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


procedure TfmMain.LoadingTB_DECODER(aDecoderNo:string='');
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
        dmDataBase.DBConnected := False;
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
        oPCClientSocket.ServerPort := FindField('ND_DECODERCONTROLPORT').AsInteger;
        oPCClientSocket.OnArmAreaCurrentAlarmStateChange := ArmAreaCurrentAlarmStateChange;
        oPCClientSocket.OnArmAreaSecurityModeChange := ArmAreaSecurityModeChange;
        oPCClientSocket.OnAlarmConfirm := AlarmConfirm;
        oPCClientSocket.OnDeviceAlarmEvent := DeviceAlarmEvent;
        oPCClientSocket.OnDeviceCardAccessEvent := DeviceCardAccessEvent;
        oPCClientSocket.OnDeviceChangeEvent := DeviceChangeEvent;
        oPCClientSocket.OnDoorChangeEvent := DoorChangeEvent;
        oPCClientSocket.OnNodeChangeEvent := NodeChangeEvent;
        oPCClientSocket.OnFTPPercent := RcvFTPPercent;
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

procedure TfmMain.LoadSecurityEvent;
var
  fmTemp : TForm;
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
  nIndex : integer;
  nRow : integer;
begin
  if Not G_bAlarmMonitoringUse then Exit;

  SoundTimer.Enabled := False;
  if MediaPlayer1.Mode = mpPlaying then MediaPlayer1.Stop;
  if pan_Alarm.Visible then pan_Alarm.Visible := False;
  Try
    if G_bFormEnabled[con_FormBMOSMONITOR] then
    begin
      fmTemp := MDIForm('TfmMonitoring');
      if fmTemp <> nil then TfmMonitoring(fmTemp).SecurityEventClear;
    end;
    if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
    begin
      fmTemp := MDIForm('TfmBuildingMonitoring');
      if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).SecurityEventClear;
    end;

    if G_bFormEnabled[con_FormBMOSMAPMONITOR] then
    begin
      fmTemp := MDIForm('TfmMapMonitoring');
      if fmTemp <> nil then TfmMapMonitoring(fmTemp).SecurityEventClear;
    end;

    if PCClientSocketList.Count < 1 then Exit;

    for i := 0 to PCClientSocketList.Count - 1 do
    begin
      Try
        TdmPCClient(PCClientSocketList.Objects[i]).NodeToArmAreaEventAllClear;
      Except
        continue;
      End;
    end;
  Except
    Exit;
  End;
  stSql := dmDBSelect.SelectTB_ALARMEVENT_ScurityEvent(FormatDateTime('yyyymmddhhnnsszzz',now-1));

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
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount < 1 then Exit;
      nRow := 0;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;

        DeviceAlarmEvent(self,FindField('ND_DECODERNO').AsInteger,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,'A',
                          FindField('AE_MSGNO').AsString,FindField('AE_DATE').AsString + FindField('AE_TIME').AsString,
                          FindField('AL_ALARMDEVICETYPE').AsString,FindField('AE_SUBADDR').AsString,FindField('AR_ARMAREANO').AsString,
                          FindField('AM_ARMMODECODE').AsString,FindField('AE_EVENTSTATECODE').AsString,FindField('ZN_ZONENO').AsString,
                          FindField('AP_PORTSTATE').AsString,FindField('AE_OPERATOR').AsString,FindField('AE_EVENTSTATECODENAME').AsString,
                          FindField('AP_EVENTSTATEPCCODE').AsString,FindField('AP_EVENTSTATEPCCODENAME').AsString,
                          FindField('AP_MODECHANGE').AsString,FindField('AP_VIEW').AsString,FindField('AP_SOUND').AsString,
                          FindField('AP_COLOR').AsString,False);

        nIndex := PCClientSocketList.IndexOf(FindField('ND_DECODERNO').AsString);
        if nIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nIndex]).NodeToAlarmEventSetting(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength),FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,'A',
                          FindField('AE_MSGNO').AsString,FindField('AE_DATE').AsString + FindField('AE_TIME').AsString,
                          FindField('AL_ALARMDEVICETYPE').AsString,FindField('AE_SUBADDR').AsString,FindField('AR_ARMAREANO').AsString,
                          FindField('AM_ARMMODECODE').AsString,FindField('AE_EVENTSTATECODE').AsString,FindField('ZN_ZONENO').AsString,
                          FindField('AP_PORTSTATE').AsString,FindField('AE_OPERATOR').AsString,FindField('AE_EVENTSTATECODENAME').AsString,
                          FindField('AP_EVENTSTATEPCCODE').AsString,FindField('AP_EVENTSTATEPCCODENAME').AsString,
                          FindField('AP_MODECHANGE').AsString,FindField('AP_VIEW').AsString,FindField('AP_SOUND').AsString,
                          FindField('AP_COLOR').AsString,True);
        end;
        inc(nRow);
        lb_AccessMessage.Caption.Text := 'Alarm Data Loading(' + inttostr(nRow) + '/' + inttostr(RecordCount) + ')';
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


function TfmMain.MDIChildGradeShow(FormName, FormCaption: String; aInsertGrade,
  aUpdateGrade, aDeleteGrade: Boolean): Boolean;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := False;
  tmpClass := FindClass(FormName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if G_bApplicationTerminate then Exit;

      if Screen.Forms[i].ClassNameIs(FormName) then
      begin
        Screen.Forms[i].Show;
        result := True;
        Exit;
      end;
    end;

    if G_bApplicationTerminate then Exit;
    if Not G_bApplicationTerminate then tmpFormClass := TFormClass(tmpClass);
    if Not G_bApplicationTerminate then tmpForm := tmpFormClass.Create(Self);
    if Not G_bApplicationTerminate then tmpForm.Caption := FormCaption;
    if Not G_bApplicationTerminate then TfmASubForm(tmpForm).IsInsertGrade := aInsertGrade;
    if Not G_bApplicationTerminate then TfmASubForm(tmpForm).IsUpdateGrade := aUpdateGrade;
    if Not G_bApplicationTerminate then TfmASubForm(tmpForm).IsDeleteGrade := aDeleteGrade;
    if Not G_bApplicationTerminate then tmpForm.Show;
    result := True;
  end;
end;

function TfmMain.MDIChildShow(FormName: String): Boolean;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := False;
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
        result := True;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    tmpForm.Show;
    result := True;
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

procedure TfmMain.MDIFormAllClose;
var
  i : integer;
begin
  for i := 0 to HIGH(G_bFormEnabled) do
  begin
    if G_bFormEnabled[i] then ChildFormClose(i);
  end;
end;

procedure TfmMain.MediaPlayer1Notify(Sender: TObject);
begin
  inherited;
  if (MediaPlayer1.NotifyValue = nvSuccessful) then AlarmPlayStop := True;
  if (MediaPlayer1.Mode = mpStopped) then AlarmPlayStop := True;
end;

procedure TfmMain.MediaPlayer2Notify(Sender: TObject);
begin
  inherited;
  if (MediaPlayer2.NotifyValue = nvSuccessful) then AccessPlayStop := True;
  if (MediaPlayer2.Mode = mpStopped) then AccessPlayStop := True;
end;

procedure TfmMain.MemoryClear;
begin
  UnLoadingNodeList;
  if G_MonitoringBuildingList <> nil then
    G_MonitoringBuildingList.Clear;
  UnLoadingReaderDoorPositionList;
  UnLoadingAccessPermitCodeList;
  UnLoadingFoodReaderList;
end;

procedure TfmMain.MemoryCreate;
begin
  G_MonitoringBuildingList := TStringList.Create; //������ ����Ʈ
  ReaderDoorPositionCodeList := TStringList.Create;
  AccessPermitCodeList := TStringList.Create;
  OpenDoorAlarmList := TStringList.Create;

  AlarmDeviceTypeCodeList := TStringList.Create;
  AlarmModeCodeList := TStringList.Create;
  CardList := TStringList.Create;
  AlarmSoundList := TStringList.Create;
  AccessSoundList := TStringList.Create;
  OpenDoorAlarmSoundList := TStringList.Create;

  FoodReaderList := TStringList.Create;
  PCClientSocketList := TStringList.Create;
  ALARMEVENTSTATEPCCODEList := TStringList.Create;
  dmSupremaFinger := TdmSupremaFinger.Create(nil);
end;

procedure TfmMain.MemoryFree;
var
  i : integer;
begin
  Try
    if G_MonitoringBuildingList <> nil then
    begin
      G_MonitoringBuildingList.Free;
      G_MonitoringBuildingList := nil;
    end;
    if ReaderDoorPositionCodeList <> nil then
    begin
      ReaderDoorPositionCodeList.Free;
      ReaderDoorPositionCodeList := nil;
    end;
    if AccessPermitCodeList <> nil then
    begin
      AccessPermitCodeList.Free;
      AccessPermitCodeList := nil;
    end;
    if AlarmSoundList <> nil then
    begin
      AlarmSoundList.Free;
      AlarmSoundList := nil;
    end;
    if AccessSoundList <> nil then
    begin
      AccessSoundList.Free;
      AccessSoundList := nil;
    end;
    if OpenDoorAlarmSoundList <> nil then
    begin
      OpenDoorAlarmSoundList.Free;
      OpenDoorAlarmSoundList := nil;
    end;

    if AlarmDeviceTypeCodeList <> nil then
    begin
      if AlarmDeviceTypeCodeList.Count > 0 then
      begin
        for i := AlarmDeviceTypeCodeList.Count - 1 downto 0 do
        begin
          TAlarmDeviceType(AlarmDeviceTypeCodeList.Objects[i]).Free;
        end;
      end;
      AlarmDeviceTypeCodeList.Free;
      AlarmDeviceTypeCodeList := nil;
    end;
    if AlarmModeCodeList <> nil then
    begin
      if AlarmModeCodeList.Count > 0 then
      begin
        for i := AlarmModeCodeList.Count - 1 downto 0 do
        begin
          TAlarmMode(AlarmModeCodeList.Objects[i]).Free;
        end;
      end;
      AlarmModeCodeList.Free;
      AlarmModeCodeList := nil;
    end;
    if CardList <> nil then
    begin
      if CardList.Count > 0 then
      begin
        for i := CardList.Count - 1 downto 0 do
        begin
          TCardNo(CardList.Objects[i]).Free;
        end;
      end;
      CardList.Free;
      CardList := nil;
    end;

    OpenDoorAlarmList.Free;
    FoodReaderList.Free;
    UnLoadingTB_DECODER;
    UnLoadingALARMEVENTSTATEPCCODEList;
    PCClientSocketList.Free;
    PCClientSocketList := nil;
  Except
    Exit;
  End;
end;

procedure TfmMain.MessageEvent(var Msg: TMsg; var Handled: Boolean);
begin
  if (Msg.message = WM_KEYDOWN) or (Msg.message = WM_KEYUP) or (Msg.message = WM_LBUTTONDOWN) or (Msg.message = WM_RBUTTONDOWN) then
  begin
    L_dtActiveTime := Now;
  end;
end;

procedure TfmMain.MessageTimerTimer(Sender: TObject);
begin
  inherited;
  lb_Message.Visible := Not lb_Message.Visible;
  lb_AccessMessage.Visible := Not lb_AccessMessage.Visible;
end;

procedure TfmMain.mn_AccessHistoryReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAccessHisReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAccessHisReport');
  if fmTemp <> nil then
  begin
    TfmAccessHisReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAccessHisReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAccessHisReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAccessHisReport(fmTemp).FormGradeRefresh;
    TfmAccessHisReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_AccessMonitoringClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);

  if G_nMonitorGubun = 0 then
  begin
    MDIChildGradeShow('TfmMonitoring',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
    fmTemp := MDIForm('TfmMonitoring');
    if fmTemp <> nil then
    begin
      TfmMonitoring(fmTemp).IsInsertGrade := bInsertGrade;
      TfmMonitoring(fmTemp).IsUpdateGrade := bUpdateGrade;
      TfmMonitoring(fmTemp).IsDeleteGrade := bDeleteGrade;
      TfmMonitoring(fmTemp).FormGradeRefresh;
      TfmMonitoring(fmTemp).FormIDSetting(TControl(Sender).Hint);
    end;
  end else if G_nMonitorGubun = 1 then
  begin
    MDIChildGradeShow('TfmMapMonitoring',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
    fmTemp := MDIForm('TfmMapMonitoring');
    if fmTemp <> nil then
    begin
      TfmMapMonitoring(fmTemp).IsInsertGrade := bInsertGrade;
      TfmMapMonitoring(fmTemp).IsUpdateGrade := bUpdateGrade;
      TfmMapMonitoring(fmTemp).IsDeleteGrade := bDeleteGrade;
      TfmMapMonitoring(fmTemp).FormGradeRefresh;
      TfmMapMonitoring(fmTemp).FormIDSetting(TControl(Sender).Hint);
    end;
  end else if G_nMonitorGubun = 2 then
  begin
    MDIChildGradeShow('TfmBuildingMonitoring',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
    fmTemp := MDIForm('TfmBuildingMonitoring');
    if fmTemp <> nil then
    begin
      TfmBuildingMonitoring(fmTemp).IsInsertGrade := bInsertGrade;
      TfmBuildingMonitoring(fmTemp).IsUpdateGrade := bUpdateGrade;
      TfmBuildingMonitoring(fmTemp).IsDeleteGrade := bDeleteGrade;
      TfmBuildingMonitoring(fmTemp).FormGradeRefresh;
      TfmBuildingMonitoring(fmTemp).FormIDSetting(TControl(Sender).Hint);
    end;
  end else if G_nMonitorGubun = 3 then
  begin
    MDIChildGradeShow('TfmZoneMapMonitoring',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
    fmTemp := MDIForm('TfmZoneMapMonitoring');
    if fmTemp <> nil then
    begin
      TfmZoneMapMonitoring(fmTemp).IsInsertGrade := bInsertGrade;
      TfmZoneMapMonitoring(fmTemp).IsUpdateGrade := bUpdateGrade;
      TfmZoneMapMonitoring(fmTemp).IsDeleteGrade := bDeleteGrade;
      TfmZoneMapMonitoring(fmTemp).FormGradeRefresh;
      TfmZoneMapMonitoring(fmTemp).FormIDSetting(TControl(Sender).Hint);
    end;
  end;

end;

procedure TfmMain.mn_AccessReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAccessReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAccessReport');
  if fmTemp <> nil then
  begin
    TfmAccessReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAccessReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAccessReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAccessReport(fmTemp).FormGradeRefresh;
    TfmAccessReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_AccessTimeAdminClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAccessTimeAdmin',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAccessTimeAdmin');
  if fmTemp <> nil then
  begin
    TfmAccessTimeAdmin(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAccessTimeAdmin(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAccessTimeAdmin(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAccessTimeAdmin(fmTemp).FormGradeRefresh;
    TfmAccessTimeAdmin(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_AdminCardReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuITem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCardManagementReport',TMenuITem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  if fmCardManagementReport <> nil then
  begin
    fmCardManagementReport.FormGradeRefresh;
    fmCardManagementReport.FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_AdminGradeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAdminClassCode',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAdminClassCode');
  if fmTemp <> nil then
  begin
    TfmAdminClassCode(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAdminClassCode(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAdminClassCode(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAdminClassCode(fmTemp).FormGradeRefresh;
    TfmAdminClassCode(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_AdminGradeMangerClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAdminClassGrade',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAdminClassGrade');
  if fmTemp <> nil then
  begin
    TfmAdminClassGrade(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAdminClassGrade(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAdminClassGrade(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAdminClassGrade(fmTemp).FormGradeRefresh;
    TfmAdminClassGrade(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_AdminManagerClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAdminUserID',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAdminUserID');
  if fmTemp <> nil then
  begin
    TfmAdminUserID(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAdminUserID(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAdminUserID(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAdminUserID(fmTemp).FormGradeRefresh;
    TfmAdminUserID(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_AlarmAreaReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmArmAreaAccessReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmArmAreaAccessReport');
  if fmTemp <> nil then
  begin
    TfmArmAreaAccessReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmArmAreaAccessReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmArmAreaAccessReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmArmAreaAccessReport(fmTemp).FormGradeRefresh;
    TfmArmAreaAccessReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_AlarmManagementReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuITem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAlarmManagementReport',TMenuITem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAlarmManagementReport');
  if fmTemp <> nil then
  begin
    TfmAlarmManagementReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAlarmManagementReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAlarmManagementReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAlarmManagementReport(fmTemp).FormGradeRefresh;
    TfmAlarmManagementReport(fmTemp).FormIDSetting(TMenuITem(Sender).Hint);
  end;
end;

procedure TfmMain.mn_AlarmReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAlarmEventReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAlarmEventReport');
  if fmTemp <> nil then
  begin
    TfmAlarmEventReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAlarmEventReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAlarmEventReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAlarmEventReport(fmTemp).FormGradeRefresh;
    TfmAlarmEventReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_AlarmStateCodeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAlarmStateCode',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAlarmStateCode');
  if fmTemp <> nil then
  begin
    TfmAlarmStateCode(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAlarmStateCode(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAlarmStateCode(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAlarmStateCode(fmTemp).FormGradeRefresh;
    TfmAlarmStateCode(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;

end;

procedure TfmMain.mn_ArmAreaCodeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmArmArea',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmArmArea');
  if fmTemp <> nil then
  begin
    TfmArmArea(fmTemp).IsInsertGrade := bInsertGrade;
    TfmArmArea(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmArmArea(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmArmArea(fmTemp).FormGradeRefresh;
    TfmArmArea(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_ArmAreaMapClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmArmAreaMapAdmin',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmArmAreaMapAdmin');
  if fmTemp <> nil then
  begin
    TfmArmAreaMapAdmin(fmTemp).IsInsertGrade := bInsertGrade;
    TfmArmAreaMapAdmin(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmArmAreaMapAdmin(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmArmAreaMapAdmin(fmTemp).FormGradeRefresh;
    TfmArmAreaMapAdmin(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_AtManagemnetClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAttendManger',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAttendManger');
  if fmTemp <> nil then
  begin
    TfmAttendManger(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAttendManger(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAttendManger(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAttendManger(fmTemp).FormGradeRefresh;
    TfmAttendManger(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;
end;

procedure TfmMain.mn_AtRelayFileClick(Sender: TObject);
begin
  fmRelayFilecreate := TfmRelayFilecreate.Create(self);
  fmRelayFilecreate.ShowModal;
  fmRelayFilecreate.Free;
end;

procedure TfmMain.mn_AtSummaryClick(Sender: TObject);
begin
  fmAttendSummary := TfmAttendSummary.Create(nil);
  fmAttendSummary.ShowModal;
end;

procedure TfmMain.mn_AttendReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAttendReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmAttendReport');
  if fmTemp <> nil then
  begin
    TfmAttendReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmAttendReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmAttendReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmAttendReport(fmTemp).FormGradeRefresh;
    TfmAttendReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_BuildingCodeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmBuilding',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmBuilding');
  if fmTemp <> nil then
  begin
    TfmBuilding(fmTemp).IsInsertGrade := bInsertGrade;
    TfmBuilding(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmBuilding(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmBuilding(fmTemp).FormGradeRefresh;
    TfmBuilding(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_BuildingMapClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmBuildingMapAdmin',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmBuildingMapAdmin');
  if fmTemp <> nil then
  begin
    TfmBuildingMapAdmin(fmTemp).IsInsertGrade := bInsertGrade;
    TfmBuildingMapAdmin(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmBuildingMapAdmin(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmBuildingMapAdmin(fmTemp).FormGradeRefresh;
    TfmBuildingMapAdmin(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_ButtonEventReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmButtonEventReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmButtonEventReport');
  if fmTemp <> nil then
  begin
    TfmButtonEventReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmButtonEventReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmButtonEventReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmButtonEventReport(fmTemp).FormGradeRefresh;
    TfmButtonEventReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_CardCreateClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployeeCardCreate',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployeeCardCreate');
  if fmTemp <> nil then
  begin
    TfmEmployeeCardCreate(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmployeeCardCreate(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmployeeCardCreate(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmployeeCardCreate(fmTemp).FormGradeRefresh;
    TfmEmployeeCardCreate(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_CardGubunClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCardGubun',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmCardGubun');
  if fmTemp <> nil then
  begin
    TfmCardGubun(fmTemp).IsInsertGrade := bInsertGrade;
    TfmCardGubun(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmCardGubun(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmCardGubun(fmTemp).FormGradeRefresh;
    TfmCardGubun(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;

end;

procedure TfmMain.mn_CompanyCodeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCompany',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmCompany');
  if fmTemp <> nil then
  begin
    TfmCompany(fmTemp).IsInsertGrade := bInsertGrade;
    TfmCompany(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmCompany(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmCompany(fmTemp).FormGradeRefresh;
    TfmCompany(fmTemp).FormIDSetting(TControl(Sender).Hint);
//    TfmCompany(fmTemp).AdvFormStyler1.Style := AdvFormStyler1.Style;
  end;
end;

procedure TfmMain.mn_CompanyCodeEnter(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  stMessage := dmFormMessage.GetMessage('WORKEXCUTE');
  stMessage := stringReplace(stMessage,'$WORK',TAdvGlowButton(Sender).Caption,[rfReplaceAll]);
  FORMSTATUSMSG(2,stMessage);
end;

procedure TfmMain.mn_CompanyGradeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCompanyGrade',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmCompanyGrade');
  if fmTemp <> nil then
  begin
    TfmCompanyGrade(fmTemp).IsInsertGrade := bInsertGrade;
    TfmCompanyGrade(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmCompanyGrade(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmCompanyGrade(fmTemp).FormGradeRefresh;
    TfmCompanyGrade(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_ControlManagerClick(Sender: TObject);
begin
  MDIChildShow('TfmDeviceSetting');
end;

procedure TfmMain.mn_CriticalFormClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmCriticalForm');
end;

procedure TfmMain.mn_DaemonRestartClick(Sender: TObject);
var
  i,j : integer;
  fmTemp : TForm;
begin
  inherited;
//  if Not dmPCClient.Connected then
//  begin
//    showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//    Exit;
//  end;
  if PCClientSocketList.Count > 0 then
  begin
    for i := 0 to PCClientSocketList.Count - 1 do
    begin
      if TdmPCClient(PCClientSocketList.Objects[i]).Connected then
        TdmPCClient(PCClientSocketList.Objects[i]).SendPacket('C',SCMONITORING,'R','0000','00','DAEMON'); //���� �����
    end;
  end;

end;

procedure TfmMain.mn_DeviceReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDeviceVersionReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmDeviceVersionReport');
  if fmTemp <> nil then
  begin
    TfmDeviceVersionReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmDeviceVersionReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmDeviceVersionReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmDeviceVersionReport(fmTemp).FormGradeRefresh;
    TfmDeviceVersionReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_DoorAlarmReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDoorAlarmReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmDoorAlarmReport');
  if fmTemp <> nil then
  begin
    TfmDoorAlarmReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmDoorAlarmReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmDoorAlarmReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmDoorAlarmReport(fmTemp).FormGradeRefresh;
    TfmDoorAlarmReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_DoorCodeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDoorList',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmDoorList');
  if fmTemp <> nil then
  begin
    TfmDoorList(fmTemp).IsInsertGrade := bInsertGrade;
    TfmDoorList(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmDoorList(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmDoorList(fmTemp).FormGradeRefresh;
    TfmDoorList(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_DoorManagementReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuITem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDoorManagementReport',TMenuITem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmDoorManagementReport');
  if fmTemp <> nil then
  begin
    TfmDoorManagementReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmDoorManagementReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmDoorManagementReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmDoorManagementReport(fmTemp).FormGradeRefresh;
    TfmDoorManagementReport(fmTemp).FormIDSetting(TMenuITem(Sender).Hint);
  end;
end;

procedure TfmMain.mn_DoorMapClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDoorMapAdmin',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmDoorMapAdmin');
  if fmTemp <> nil then
  begin
    TfmDoorMapAdmin(fmTemp).IsInsertGrade := bInsertGrade;
    TfmDoorMapAdmin(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmDoorMapAdmin(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmDoorMapAdmin(fmTemp).FormGradeRefresh;
    TfmDoorMapAdmin(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_DoorOpenReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDoorOpenReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmDoorOpenReport');
  if fmTemp <> nil then
  begin
    TfmDoorOpenReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmDoorOpenReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmDoorOpenReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmDoorOpenReport(fmTemp).FormGradeRefresh;
    TfmDoorOpenReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_DoorSchedule1Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDoorSchedule',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmDoorSchedule');
  if fmTemp <> nil then
  begin
    TfmDoorSchedule(fmTemp).IsInsertGrade := bInsertGrade;
    TfmDoorSchedule(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmDoorSchedule(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmDoorSchedule(fmTemp).FormGradeRefresh;
    TfmDoorSchedule(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_EmployeeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);

  if G_nCardFPType = 2 then
  begin
    MDIChildGradeShow('TfmFPCardEmployee',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
    fmTemp := MDIForm('TfmFPCardEmployee');
    if fmTemp <> nil then
    begin
      TfmFPCardEmployee(fmTemp).IsInsertGrade := bInsertGrade;
      TfmFPCardEmployee(fmTemp).IsUpdateGrade := bUpdateGrade;
      TfmFPCardEmployee(fmTemp).IsDeleteGrade := bDeleteGrade;
      TfmFPCardEmployee(fmTemp).FormGradeRefresh;
      TfmFPCardEmployee(fmTemp).FormIDSetting(TControl(Sender).Hint);
    end;
    Exit;
  end;
  if G_nMonitoringType = 1 then   //�бⱹ��� �������
  begin
    MDIChildGradeShow('TfmKTEmployee',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
    fmTemp := MDIForm('TfmKTEmployee');
    if fmTemp <> nil then
    begin
      TfmKTEmployee(fmTemp).IsInsertGrade := bInsertGrade;
      TfmKTEmployee(fmTemp).IsUpdateGrade := bUpdateGrade;
      TfmKTEmployee(fmTemp).IsDeleteGrade := bDeleteGrade;
      TfmKTEmployee(fmTemp).FormGradeRefresh;
      TfmKTEmployee(fmTemp).FormIDSetting(TControl(Sender).Hint);
    end;
  end else
  begin
    MDIChildGradeShow('TfmEmployee',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
    fmTemp := MDIForm('TfmEmployee');
    if fmTemp <> nil then
    begin
      TfmEmployee(fmTemp).IsInsertGrade := bInsertGrade;
      TfmEmployee(fmTemp).IsUpdateGrade := bUpdateGrade;
      TfmEmployee(fmTemp).IsDeleteGrade := bDeleteGrade;
      TfmEmployee(fmTemp).FormGradeRefresh;
      TfmEmployee(fmTemp).FormIDSetting(TControl(Sender).Hint);
    end;
  end;

end;

procedure TfmMain.mn_EmployeeFileBackup1Click(Sender: TObject);
var
  stHeader : string;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stFileName : string;
  strCsvRec : string;
  FileList : TStringList;
  i : integer;
begin
  if Not SaveDialog1.Execute then Exit;
  stFileName := SaveDialog1.FileName;
  if stFileName = '' then Exit;

  stSql := ' select b.CO_COMPANYNAME as ''�ι�'',c.CO_COMPANYNAME as ''����'', ';
  stSql := stSql + ' d.CO_COMPANYNAME as ''����/����/����'',e.CO_COMPANYNAME as ''��'',';
  stSql := stSql + ' a.EM_CODE as ''���'',a.EM_NAME as ''�̸�'',';
  stSql := stSql + ' f.EM_GUBUNCODENAME as ''��������'',';
  stSql := stSql + ' a.EM_HANDPHONE as ''�ڵ���'',a.EM_COMPANYPHONE as ''�系��ȭ��ȣ'',';
  stSql := stSql + ' a.EM_EMINFO as ''��Ÿ����'',';
  stSql := stSql + ' g.CA_PRINTNO as ''ī���Ϸù�ȣ'',';
  stSql := stSql + ' g.CA_CARDNO as ''ī���ȣ'', ';
  stSql := stSql + ' a.EM_ENDDATE as ''��ȿ�Ⱓ'' ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_COMPANYCODE b ';
  stSql := stSql + ' ON(substring(a.CO_COMPANYCODE,1,' + inttostr(G_nCompanyCodeLength + 1) + ') = b.CO_COMPANYCODE ) ';
  stSql := stSql + ' Left Join TB_COMPANYCODE c ';
  stSql := stSql + ' ON(substring(a.CO_COMPANYCODE,1,' + inttostr(G_nCompanyCodeLength * 2 + 1) + ') = c.CO_COMPANYCODE ) ';
  stSql := stSql + ' Left Join TB_COMPANYCODE d ';
  stSql := stSql + ' ON(substring(a.CO_COMPANYCODE,1,' + inttostr(G_nCompanyCodeLength * 3 + 1) + ') = d.CO_COMPANYCODE ) ';
  stSql := stSql + ' Left Join TB_COMPANYCODE e ';
  stSql := stSql + ' ON(substring(a.CO_COMPANYCODE,1,' + inttostr(G_nCompanyCodeLength * 4 + 1) + ') = e.CO_COMPANYCODE ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEGUBUN f ';
  stSql := stSql + ' ON(a.EM_GUBUNCODE = f.EM_GUBUNCODE ) ';
  stSql := stSql + ' Left Join TB_CARD g ';
  stSql := stSql + ' ON(a.EM_SEQ = g.EM_SEQ ';
  stSql := stSql + '  AND g.CA_STATECODE = ''1'' ) ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    FileList := TStringList.Create;
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
      FileList.Clear;
      FileList.Add('VER=1.0');
      strCsvRec := '�ι�,����,����/����/����,��,���,�̸�,��������,�ڵ���,�系��ȭ��ȣ,��Ÿ����,ī���Ϸù�ȣ,ī���ȣ';
      FileList.Add(strCsvRec);
      while Not Eof do
      begin
        strCsvRec := '';
        for i:=0 to Fields.Count-1 do
        begin
          if i <> 0 then  strCsvRec := strCsvRec + ',';
          strCsvRec := strCsvRec + Fields.Fields[i].AsString;
        end;
        FileList.Add(strCsvRec);
        Next;
      end;
      //TempAdoQuery.SaveToFile(stFileName,pfADTG);
      FileList.SaveToFile(stFileName);
      //Application.ProcessMessages;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
    FileList.free;
  End;
(*  fmEmployeeFileBackup := TfmEmployeeFileBackup.Create(nil);
  fmEmployeeFileBackup.ShowModal;
  fmEmployeeFileBackup.Free;
*)
end;

procedure TfmMain.mn_EmployeeFileUploadClick(Sender: TObject);
var
  stFile : string;
  stEmApprove : string;
begin
  stEmApprove := '1';
  Memo1.Lines.Clear;
  if Sender = mn_employeeUploadFileFormat1 then stEmApprove := '0';

  OpenDialog1.DefaultExt:= 'csv';
  OpenDialog1.Filter := 'csv files (*.csv)|*.csv';
  if OpenDialog1.Execute then
  begin
    stFile :=  OpenDialog1.FileName;
    if stFile = '' then Exit;

    EmployeeFileUpload(stFile,stEmApprove);
  end;

end;

procedure TfmMain.mn_EmployeeGradeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployeeGrade',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployeeGrade');
  if fmTemp <> nil then
  begin
    TfmEmployeeGrade(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmployeeGrade(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmployeeGrade(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmployeeGrade(fmTemp).FormGradeRefresh;
    TfmEmployeeGrade(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;

end;

procedure TfmMain.mn_EmployeeGradeSearchClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployeeGradeSearch',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployeeGradeSearch');
  if fmTemp <> nil then
  begin
    TfmEmployeeGradeSearch(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmployeeGradeSearch(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmployeeGradeSearch(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmployeeGradeSearch(fmTemp).FormGradeRefresh;
    TfmEmployeeGradeSearch(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_EmployeeGroupCodeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployeeGroupCode',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  if fmEmployeeGroupCode <> nil then
  begin
    fmEmployeeGroupCode.FormGradeRefresh;
    fmEmployeeGroupCode.FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_EmployeeGubunClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployeeGubunCode',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployeeGubunCode');
  if fmTemp <> nil then
  begin
    TfmEmployeeGubunCode(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmployeeGubunCode(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmployeeGubunCode(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmployeeGubunCode(fmTemp).FormGradeRefresh;
    TfmEmployeeGubunCode(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;
end;

procedure TfmMain.mn_EmployeeHisReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuITem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployeeHisReport',TMenuITem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployeeHisReport');
  if fmTemp <> nil then
  begin
    TfmEmployeeHisReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmployeeHisReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmployeeHisReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmployeeHisReport(fmTemp).FormGradeRefresh;
    TfmEmployeeHisReport(fmTemp).FormIDSetting(TMenuITem(Sender).Hint);
  end;

end;

procedure TfmMain.mn_employeeUploadFileFormatClick(Sender: TObject);
var
  FileFormatList : TStringList;
  stHeader : string;
  stFileName : string;
begin
  if SaveDialog2.Execute then
  begin
    stFileName := SaveDialog2.FileName;

    if stFileName <> '' then
    begin
      if fileexists(stFileName) then
        deletefile(stFileName);
    end else Exit;
  end else Exit;

  FileFormatList := TStringList.Create;
  Try
    if G_nMonitoringType = 1 then
    begin
      stHeader := '�ι�,';
      stHeader := stHeader + '����,';
      stHeader := stHeader + '����/����/����,';
      stHeader := stHeader + '��,';
      stHeader := stHeader + '���,';
      stHeader := stHeader + '�̸�,';
      stHeader := stHeader + '��������,';
      stHeader := stHeader + '�ڵ���,';
      stHeader := stHeader + '�系��ȭ��ȣ,';
      stHeader := stHeader + '���»��,';
      stHeader := stHeader + 'ī���Ϸù�ȣ,';
      stHeader := stHeader + 'ī���ȣ(����10�ڸ�),';
      stHeader := stHeader + '��ȿ�Ⱓ(yyyymmdd),';
      stHeader := stHeader + '����Ÿ��(1.�ҼӺ�����;2.�׷캰����;3.���κ�����),';
      stHeader := stHeader + '���ѱ׷��';
      FileFormatList.Add(stHeader);
    end else
    begin
      stHeader := '�Ҽ�1,';
      stHeader := stHeader + '�Ҽ�2,';
      stHeader := stHeader + '�Ҽ�3,';
      stHeader := stHeader + '�Ҽ�4,';
      stHeader := stHeader + '�Ҽ�5,';
      stHeader := stHeader + '�Ҽ�6,';
      stHeader := stHeader + '������,';
      stHeader := stHeader + '���,';
      stHeader := stHeader + '�̸�,';
      stHeader := stHeader + '��������,';
      stHeader := stHeader + '�ڵ���,';
      stHeader := stHeader + '�系��ȭ��ȣ,';
      stHeader := stHeader + '��Ÿ����,';
      stHeader := stHeader + 'ī���ȣ,';
      stHeader := stHeader + '��ȿ�Ⱓ(yyyymmdd),';
      stHeader := stHeader + '����Ÿ��(1.�ҼӺ�����;2.�׷캰����;3.���κ�����),';
      stHeader := stHeader + '���ѱ׷��';
      FileFormatList.Add(stHeader);
    end;

    FileFormatList.SaveToFile(stFileName);
  Finally
    FileFormatList.Free;
  End;
end;

procedure TfmMain.mn_FileUploadDupCardClick(Sender: TObject);
var
  stFile : string;
  stEmApprove : string;
begin
  stEmApprove := '1';
  Memo1.Lines.Clear;
  if Sender = mn_employeeUploadFileFormat1 then stEmApprove := '0';

  OpenDialog1.DefaultExt:= 'csv';
  OpenDialog1.Filter := 'csv files (*.csv)|*.csv';
  if OpenDialog1.Execute then
  begin
    stFile :=  OpenDialog1.FileName;
    if stFile = '' then Exit;

    EmployeeFileUpload(stFile,stEmApprove,True);
  end;

end;

procedure TfmMain.mn_FingerManagerClick(Sender: TObject);
begin
  MDIChildShow('TfmFingerReaderSetting');
end;

procedure TfmMain.mn_FireRecoveryClick(Sender: TObject);
var
  i,j : integer;
  fmTemp : TForm;
begin
  inherited;
//  if Not dmPCClient.Connected then
//  begin
//    showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//    Exit;
//  end;
  if PCClientSocketList.Count > 0 then
  begin
    for i := 0 to PCClientSocketList.Count - 1 do
    begin
      if TdmPCClient(PCClientSocketList.Objects[i]).Connected then
        TdmPCClient(PCClientSocketList.Objects[i]).SendPacket('C',SCMONITORING,'F',FillZeroNumber(0,G_nNodeCodeLength),'00',''); //ȭ�纹��
    end;
  end;
end;

procedure TfmMain.mn_FoodReport1Click(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmFoodEventReport',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmFoodEventReport');
  if fmTemp <> nil then
  begin
    TfmFoodEventReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmFoodEventReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmFoodEventReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmFoodEventReport(fmTemp).FormGradeRefresh;
    TfmFoodEventReport(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;

end;

procedure TfmMain.mn_FoodReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmFoodEventReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmFoodEventReport');
  if fmTemp <> nil then
  begin
    TfmFoodEventReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmFoodEventReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmFoodEventReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmFoodEventReport(fmTemp).FormGradeRefresh;
    TfmFoodEventReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_FoodStateReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmFoodStateReport',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmFoodStateReport');
  if fmTemp <> nil then
  begin
    TfmFoodStateReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmFoodStateReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmFoodStateReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmFoodStateReport(fmTemp).FormGradeRefresh;
    TfmFoodStateReport(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;
end;

procedure TfmMain.mn_GroupcodeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployeeGroupCode',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployeeGroupCode');
  if fmTemp <> nil then
  begin
    TfmEmployeeGroupCode(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmployeeGroupCode(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmployeeGroupCode(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmployeeGroupCode(fmTemp).FormGradeRefresh;
    TfmEmployeeGroupCode(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_GroupGradeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmGroupGrade',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmGroupGrade');
  if fmTemp <> nil then
  begin
    TfmEmGroupGrade(fmTemp).IsInsertGrade := bInsertGrade;
    TfmEmGroupGrade(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmEmGroupGrade(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmEmGroupGrade(fmTemp).FormGradeRefresh;
    TfmEmGroupGrade(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_HolidayClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmHolidayAdd',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmHolidayAdd');
  if fmTemp <> nil then
  begin
    TfmHolidayAdd(fmTemp).IsInsertGrade := bInsertGrade;
    TfmHolidayAdd(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmHolidayAdd(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmHolidayAdd(fmTemp).FormGradeRefresh;
    TfmHolidayAdd(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_ManagerReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDoorManagementReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmDoorManagementReport');
  if fmTemp <> nil then
  begin
    TfmDoorManagementReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmDoorManagementReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmDoorManagementReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmDoorManagementReport(fmTemp).FormGradeRefresh;
    TfmDoorManagementReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_MonitorStateClick(Sender: TObject);
var
  i,j : integer;
  fmTemp : TForm;
begin
  inherited;
//  if Not dmPCClient.Connected then
//  begin
//    showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//    Exit;
//  end;
  if PCClientSocketList.Count < 1 then Exit;

  for i := 0 to PCClientSocketList.Count - 1 do
  begin
    TdmPCClient(PCClientSocketList.Objects[i]).DeviceStateReSend;
  end;
  DeviceStateTimer.Enabled := True;

  if G_bFormEnabled[con_FormBMOSMONITOR] then
  begin
    fmTemp := MDIForm('TfmMonitoring');
    if fmTemp <> nil then TfmMonitoring(fmTemp).DeviceReload;
  end;
  if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
  begin
    fmTemp := MDIForm('TfmBuildingMonitoring');
    if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).DeviceReload;
  end;


end;

procedure TfmMain.mn_NodeManagerClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
  stTemp : string;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  //MDIChildGradeShow('TfmNodeManager',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmNodeManager');
(*  stTemp := 'TEST';
  fmTemp := MDIForm('TfmNodeManager');
  if fmTemp <> nil then
  begin
    TfmNodeManager(fmTemp).IsInsertGrade := bInsertGrade;
    TfmNodeManager(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmNodeManager(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmNodeManager(fmTemp).FormGradeRefresh;
    TfmNodeManager(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;  *)
end;

procedure TfmMain.mn_NotUseCardReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuITem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmNotCardUseReport',TMenuITem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmNotCardUseReport');
  if fmTemp <> nil then
  begin
    TfmNotCardUseReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmNotCardUseReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmNotCardUseReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmNotCardUseReport(fmTemp).FormGradeRefresh;
    TfmNotCardUseReport(fmTemp).FormIDSetting(TMenuITem(Sender).Hint);
  end;

end;

procedure TfmMain.mn_PermitResendClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmPermitReSend',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmPermitReSend');
  if fmTemp <> nil then
  begin
    TfmPermitReSend(fmTemp).IsInsertGrade := bInsertGrade;
    TfmPermitReSend(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmPermitReSend(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmPermitReSend(fmTemp).FormGradeRefresh;
    TfmPermitReSend(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_PosiCodeAddClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmPosiCode',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmPosiCode');
  if fmTemp <> nil then
  begin
    TfmPosiCode(fmTemp).IsInsertGrade := bInsertGrade;
    TfmPosiCode(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmPosiCode(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmPosiCode(fmTemp).FormGradeRefresh;
    TfmPosiCode(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;
end;

procedure TfmMain.mn_ReaderNumberClick(Sender: TObject);
begin
  MDIChildShow('TfmRederTelNumber');

end;

procedure TfmMain.mn_ReaderPasswdClick(Sender: TObject);
begin
  MDIChildShow('TfmRederPassword');
end;

procedure TfmMain.mn_SecurityMonitoringClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmSecurityMonitoring',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
end;

procedure TfmMain.mn_ServerManagerClick(Sender: TObject);
begin
  //dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  //MDIChildGradeShow('TfmNodeManager',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmServerManager');

end;

procedure TfmMain.mn_ServerMonitoringClick(Sender: TObject);
var
  fmTemp : TForm;
begin
  inherited;
  MDIChildShow('TfmPCComMonitoring');
  fmTemp := MDIForm('TfmPCComMonitoring');
  if fmTemp <> nil then
  begin
    TfmPCComMonitoring(fmTemp).FormGradeRefresh;
    TfmPCComMonitoring(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;
end;

procedure TfmMain.mn_TelAccessReportClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmTelAccessReport',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmTelAccessReport');
  if fmTemp <> nil then
  begin
    TfmTelAccessReport(fmTemp).IsInsertGrade := bInsertGrade;
    TfmTelAccessReport(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmTelAccessReport(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmTelAccessReport(fmTemp).FormGradeRefresh;
    TfmTelAccessReport(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_telephoneofficeClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmtelephoneOfficeManager');

end;

procedure TfmMain.mn_TimeCodeClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  //CreateMDIChild(con_FormBMOSTIMECODEADMIN,TAdvGlowButton(Sender).Caption);
  MDIChildGradeShow('TfmTimeCodeAdmin',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmTimeCodeAdmin');
  if fmTemp <> nil then
  begin
    TfmTimeCodeAdmin(fmTemp).IsInsertGrade := bInsertGrade;
    TfmTimeCodeAdmin(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmTimeCodeAdmin(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmTimeCodeAdmin(fmTemp).FormGradeRefresh;
    TfmTimeCodeAdmin(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_ZoneClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmNewZoneAdmin',TAdvGlowButton(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmNewZoneAdmin');
  if fmTemp <> nil then
  begin
    TfmNewZoneAdmin(fmTemp).IsInsertGrade := bInsertGrade;
    TfmNewZoneAdmin(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmNewZoneAdmin(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmNewZoneAdmin(fmTemp).FormGradeRefresh;
    TfmNewZoneAdmin(fmTemp).FormIDSetting(TControl(Sender).Hint);
  end;
end;

procedure TfmMain.mn_ZoneMapClick(Sender: TObject);
var
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
  fmTemp : TForm;
begin
  inherited;
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TMenuItem(Sender).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmZoneMapAdmin',TMenuItem(Sender).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmZoneMapAdmin');
  if fmTemp <> nil then
  begin
    TfmZoneMapAdmin(fmTemp).IsInsertGrade := bInsertGrade;
    TfmZoneMapAdmin(fmTemp).IsUpdateGrade := bUpdateGrade;
    TfmZoneMapAdmin(fmTemp).IsDeleteGrade := bDeleteGrade;
    TfmZoneMapAdmin(fmTemp).FormGradeRefresh;
    TfmZoneMapAdmin(fmTemp).FormIDSetting(TMenuItem(Sender).Hint);
  end;
end;

procedure TfmMain.MonitoringRefresh;
var
  fmTemp : TForm;
begin
  if G_bFormEnabled[con_FormBMOSMONITOR] then
  begin
    fmTemp := MDIForm('TfmMonitoring');
    if fmTemp <> nil then TfmMonitoring(fmTemp).MonitoringRefresh;
  end;
  if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
  begin
    fmTemp := MDIForm('TfmBuildingMonitoring');
    if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).MonitoringRefresh;
  end;

  if G_bFormEnabled[con_FormBMOSMAPMONITOR] then
  begin
    fmTemp := MDIForm('TfmMapMonitoring');
    if fmTemp <> nil then TfmMapMonitoring(fmTemp).MonitoringRefresh;
  end;

end;

procedure TfmMain.NodeChangeEvent(Sender: TObject;aDecoderNo:integer; aNodeNo, aEcuID, aType, aNo,
  aCmd, aData: string);
var
  fmTemp : TForm;
begin
  if (aType = SCNODE) and (aCmd = SCCMDCONNECTED) then
  begin
    if G_bFormEnabled[con_FormBMOSMONITOR] then
    begin
      fmTemp := MDIForm('TfmMonitoring');
      if fmTemp <> nil then TfmMonitoring(fmTemp).RcvNodeConnectedChangeEvent(aDecoderNo, aNodeNo,aEcuID,aData);
    end;
    if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
    begin
      fmTemp := MDIForm('TfmBuildingMonitoring');
      if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).RcvNodeConnectedChangeEvent(aDecoderNo, aNodeNo,aEcuID,aData);
    end;

  end;

end;

procedure TfmMain.NodeConncectCheckTimerTimer(Sender: TObject);
var
  i : integer;
  bCheck : Boolean;
begin
(*  if G_bApplicationTerminate then Exit;
//  if Not dmPCClient.Connected then Exit;
  if L_nDeviceStateCheckCount > 3 then
  begin
    L_nDeviceStateCheckCount := 0;
    L_bDeviceStateChecking := False; //������ Ǯ��
  end;
  if L_bDeviceStateChecking then
  begin
    inc(L_nDeviceStateCheckCount);
    Exit;
  end;
  Try
    Try
      L_bDeviceStateChecking := True;
      if L_nCurrentCheckNodeSeq < 0 then L_nCurrentCheckNodeSeq := 0;
      if L_nCurrentCheckNodeSeq > G_MonitoringNodeList.Count - 1 then L_nCurrentCheckNodeSeq := 0;
      if G_MonitoringNodeList.Count < 1 then Exit;
      if TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckNodeSeq]).NodeConnected = '0' then
      begin
        TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckNodeSeq]).NodeStateCheck;
      end;
      if G_bApplicationTerminate then Exit;
      if L_nCurrentCheckNodeSeq = G_MonitoringNodeList.Count - 1 then
      begin
        L_nCurrentCheckNodeSeq := 0;
        bCheck := True;
        for i := 0 to G_MonitoringNodeList.Count - 1 do
          if TMonitoringNode(G_MonitoringNodeList.Objects[L_nCurrentCheckNodeSeq]).NodeConnected <> '0' then bCheck := False;

        if bCheck then
        begin
          NodeConncectCheckTimer.Enabled := False;
          DoorStateCheckTimer.Enabled := True;
        end;
      end else
      begin
        L_nCurrentCheckNodeSeq := L_nCurrentCheckNodeSeq + 1;
      end;
    Except
      Exit;
    End;

  Finally
    L_bDeviceStateChecking := False;
  End;
  *)
end;

procedure TfmMain.OpenDoorSoundTimerTimer(Sender: TObject);
var
  stAccessFile : string;
begin
  inherited;
  if L_bSoundTimerEnable then Exit;
  if G_nBMSType = 3 then Exit;  //�ļ� ����͸��� ���� �˶� �߻� ���Ѵ�.
  if G_nBMSType = 4 then Exit;  //���� ����͸��� ���� �˶� �߻� ���Ѵ�.
  sb_Status.Panels[2].Text := 'OpenDoorSoundTimer Start ';

  if G_nAccessSoundCount > 0 then
  begin
    if G_nAccessSoundCount <= L_nOpenDoorSoundCount then
    begin
      L_nOpenDoorSoundCount := 0;
      if OpenDoorAlarmSoundList.Count = 1 then OpenDoorSoundTimer.Enabled := False;
      if OpenDoorAlarmSoundList.Count > 0 then
         OpenDoorAlarmSoundList.Delete(0);
      Exit;
    end;
    inc(L_nOpenDoorSoundCount);
  end;
  if OpenDoorAlarmSoundList.Count < 1 then
  begin
    L_nOpenDoorSoundCount := 0;
    OpenDoorSoundTimer.Enabled := False;
    Exit;
  end;
  stAccessFile := '';
  if OpenDoorAlarmSoundList.Count > 0 then
  begin
    stAccessFile := OpenDoorAlarmSoundList.Strings[0];
  end;
  if Not FileExists(stAccessFile) then
  begin
    L_nOpenDoorSoundCount := 0;
    OpenDoorAlarmSoundList.Delete(0);
    //SoundTimer.Enabled := False;
    Exit;
  end;
  if OpenDoorAlarmSoundList.Count > 1 then
  begin
    L_nOpenDoorSoundCount := 0;
    OpenDoorAlarmSoundList.Delete(0); //���� ���� Play
  end;
  MediaPlayer2.FileName := stAccessFile;
  L_bSoundTimerEnable := True;
  Try
    MediaPlayer2.Open;
    Try
      AccessPlayStop := False;
      WindowsMediaPlayer1.Controls.stop;
      MediaPlayer2.Play;
    Except
      OpenDoorSoundTimer.Enabled := False;
      Exit;
    End;
//    Delay(1000);
//    while Not ( (MediaPlayer2.NotifyValue = nvSuccessful) or (MediaPlayer2.Mode = mpPlaying) )  do
    while Not AccessPlayStop  do
    begin
      Application.ProcessMessages;
    end;
  Finally
    sb_Status.Panels[2].Text := 'OpenDoorSoundTimer End ';
    MediaPlayer2.Close;
    L_bSoundTimerEnable := False;
  End;
end;

procedure TfmMain.RcvFTPPercent(Sender: TObject; aDecoderNo: integer; aNodeNo,
  aEcuID, aType, aNo, aCmd, aData: string);
var
  fmTemp : TForm;
begin
  if G_bFormEnabled[con_FormBMOSPERMITRESEND] then
  begin
    fmTemp := MDIForm('TfmPermitReSend');
    if fmTemp <> nil then TfmPermitReSend(fmTemp).RcvFTPPercent(inttostr(aDecoderNo), aNodeNo,aEcuID,aData);
  end;
end;

procedure TfmMain.RegFingerDeviceEmployee(aDecoderNo, aNodeNo, aEcuID,
  aDoorNo: string);
var
  fmTemp : TForm;
  bInsertGrade,bUpdateGrade,bDeleteGrade : Boolean;
begin
  dmDBFunction.GetProgramGrade(L_stAdminGradeCode,TControl(mn_Employee).Hint,inttostr(G_nBMSType),bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmEmployee',TAdvGlowButton(mn_Employee).Caption, bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTemp := MDIForm('TfmEmployee');
  if fmTemp <> nil then
  begin
    TfmEmployee(fmTemp).IsInsertGrade := True;
    TfmEmployee(fmTemp).IsUpdateGrade := True;
    TfmEmployee(fmTemp).IsDeleteGrade := True;
    TfmEmployee(fmTemp).FormGradeRefresh;
    TfmEmployee(fmTemp).RegFingerDeviceEmployee(aDecoderNo,aNodeNo,aEcuID,aDoorNo);
    TfmEmployee(fmTemp).FormIDSetting(TAdvGlowButton(mn_Employee).Hint);
  end;
end;

function TfmMain.RegistryKeyCheck(var aCustomerID: string): Boolean;
var
  FReg : TRegistry;
  stInstallDate : string;
begin

  FReg := TRegistry.Create;
  try
    FReg.RootKey := HKEY_LOCAL_MACHINE;
    if FReg.OpenKey('Software\Zeron\GMS',True) then
    begin
      aCustomerID := FReg.ReadString('CustomerID');
      stInstallDate := FReg.ReadString('InstallDate');
      if aCustomerID = 'Z-00000000' then
      begin
        stInstallDate := copy(stInstallDate,1,4) + '-' + copy(stInstallDate,5,2) + '-' + copy(stInstallDate,7,2);
        if Not IsDate(stInstallDate) then result := False
        else
        begin
          if stInstallDate < formatDateTime('yyyy-mm-dd',now) then result := False
          else result := True;
        end;
      end else
      begin
        if aCustomerID <> '' then result := True;
      end;
    end else
    begin
      result := False;
    end;
    FReg.CloseKey;
  Finally
    FReg.Free;
  end;
end;

procedure TfmMain.ServerConnected(Sender: TObject;aDecoderNo:integer; aConnected: Boolean);
var
  fmTemp : TForm;
begin
  if G_bFormEnabled[con_FormBMOSMONITOR] then
  begin
    fmTemp := MDIForm('TfmMonitoring');
    if fmTemp <> nil then TfmMonitoring(fmTemp).ServerConnected(aDecoderNo,aConnected);
  end;
  if G_bFormEnabled[con_FormBMOSBUILDINGMONITOR] then
  begin
    fmTemp := MDIForm('TfmBuildingMonitoring');
    if fmTemp <> nil then TfmBuildingMonitoring(fmTemp).ServerConnected(aDecoderNo,aConnected);
  end;

  if Not aConnected then
  begin
    //���⿡�� ��� ����� ���¸� �𸣴� ������ ǥ������.
    //if G_MonitoringNodeList.Count < 1 then Exit;

    //for i := G_MonitoringNodeList.Count - 1 downto 0 do
    //begin
    //  TMonitoringNode(G_MonitoringNodeList.Objects[i]).NodeConnected := '0';
    //end;
    sb_Status.Panels[1].AnimationImages := ImageListServerDisConnect;
  end else
  begin
    sb_Status.Panels[1].AnimationImages := ImageListServerConnect;
  end;
  //DeviceStateTimer.Enabled := aConnected;  //���� ���� �Ǹ� ���� ��ȸ

end;

procedure TfmMain.ServerConnectTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
//  Exit; //20151217TEST
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

procedure TfmMain.ServerPacketView(Sender: TObject; aTxRx,aClientIP,aData,
  aResult: string);
var
  fmTemp : TForm;
begin
  //��Ŷ �ۼ��� �κ� üũ
  if G_bFormEnabled[conFORMPCCOMMONITORING] then
  begin
    fmTemp := MDIForm('TfmPCComMonitoring');
    if fmTemp <> nil then TfmPCComMonitoring(fmTemp).ClientPacketView(aTxRx,aClientIP,aData,aResult);
  end;
end;

procedure TfmMain.SetLogined(const Value: Boolean);
var
  i : integer;
begin
//  if FLogined = Value then Exit;

  FLogined := Value;

  if Not Value then
  begin
    Privileges := '';
    MDIFormAllClose;
    G_bIsMaster := False;
    apAdmin.TabVisible := False;
    FORMSTATUSMSG(2,dmFormMessage.GetMessage('LOGOUTMESSAGE'));
    //���⼭ ��� ���� ����.
    UnLoadingDoorList;
    UnLoadingArmAreaList;
    UnLoadingNodeList;
    UnLoadingTB_DECODER;
    if at_Menu.ActivePage = apAdmin then at_Menu.ActivePage := ApManager;
  end else
  begin
//    if G_nBMSType = 2 then apAdmin.TabVisible := G_bIsMaster;   //���Ը���͸������� ������ ���� ����.
    FORMSTATUSMSG(2,dmFormMessage.GetMessage('LOGINMESSAGE'));
    //if G_nMoitorLoginStart = 0 then mn_MonitoringClick(mn_Monitoring);
    //���⼭ ��� �ε� ����.

    if G_nMonitoringType <> 1 then
    begin
      pan_Access.Visible := True;
      lb_AccessMessage.Caption.Text := dmFormMessage.GetMessage('DEVICELOADING');
      Application.ProcessMessages;
//      if Not G_bApplicationTerminate then LoadingTB_DECODER;   //�ش� ���� ��常 �����..
      if Not G_bApplicationTerminate then LoadingDoorList;
      if Not G_bApplicationTerminate then LoadingArmAreaList;
      if Not G_bApplicationTerminate then LoadingFoodReaderList;
      if G_nMoitorLoginStart = 0 then
      begin
        if G_nBMSType = 2 then
        begin
          if mn_AccessMonitoring.Enabled then
          begin
            lb_AccessMessage.Caption.Text := 'Monitoring Starting...';
            Application.ProcessMessages;
            mn_AccessMonitoringClick(self);
          end;
        end;
      end;
      pan_Access.Visible := False;
    end;
  end;

  if G_bApplicationTerminate then Exit;

  for i := 0 to PCClientSocketList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;

    if Not TdmPCClient(PCClientSocketList.Objects[i]).Connected then
    begin
      TdmPCClient(PCClientSocketList.Objects[i]).SocketConnect := Value;
    end;
  end;


  ServerConnectTimer.Enabled := Value;

  StartMenu.MenuItems.Items[1].Enabled := Not Value;
  StartMenu.MenuItems.Items[2].Enabled := Value;

end;

procedure TfmMain.SetPrivileges(const Value: String);
begin
  FPrivileges := Value;
  TravelToolBarPagerEnable(at_Menu,Value); //�޴� Enable

  if Pos('BM5_',Value) > 0 then apAdmin.TabVisible := True
  else apAdmin.TabVisible := False;
  if Pos('BM4_021',Value) > 0 then mn_AtManagemnet.Enabled := True
  else mn_AtManagemnet.Enabled := False;
  if Pos('BM4_022',Value) > 0 then mn_AtSummary.Enabled := True
  else mn_AtSummary.Enabled := False;


end;

procedure TfmMain.SoundTimerTimer(Sender: TObject);
var
  stAlarmFile : string;
begin
  inherited;
  if L_bSoundTimerEnable then Exit;
  if G_nAlarmSoundCount > 0 then
  begin
    if G_nAlarmSoundCount <= L_nAlarmSoundCount then
    begin
      L_nAlarmSoundCount := 0;
      if AlarmSoundList.Count = 1 then SoundTimer.Enabled := False;
      if AlarmSoundList.Count > 0 then
         AlarmSoundList.Delete(0);
      Exit;
    end;
    inc(L_nAlarmSoundCount);
  end;
  if AlarmSoundList.Count < 1 then
  begin
    L_nAlarmSoundCount := 0;
    SoundTimer.Enabled := False;
    Exit;
  end;
  stAlarmFile := '';
  if AlarmSoundList.Count > 0 then
  begin
    stAlarmFile := AlarmSoundList.Strings[0];
  end;
  if Not FileExists(stAlarmFile) then
  begin
    L_nAlarmSoundCount := 0;
    AlarmSoundList.Delete(0);
    //SoundTimer.Enabled := False;
    Exit;
  end;
  if AlarmSoundList.Count > 1 then
  begin
    L_nAlarmSoundCount := 0;
    AlarmSoundList.Delete(0); //���� ���� Play
  end;
  MediaPlayer1.FileName := stAlarmFile;
  L_bSoundTimerEnable := True;
  Try
    MediaPlayer1.Open;
    Try
      AlarmPlayStop := False;
      WindowsMediaPlayer1.Controls.stop;
      MediaPlayer1.Play;
    Except
      SoundTimer.Enabled := False;
      Exit;
    End;
    //while Not ( (MediaPlayer1.NotifyValue = nvSuccessful) and (MediaPlayer1.Mode = mpPlaying) )  do
    while Not AlarmPlayStop  do
    begin
      Application.ProcessMessages;
    end;
  Finally
    MediaPlayer1.Close;
    L_bSoundTimerEnable := False;
  End;
end;

procedure TfmMain.StartMenuMenuItems1Click(Sender: TObject);
begin
  inherited;
  TLogin.GetObject.ShowLoginDlg(inttostr(G_nBMSType));
  G_stAdminUserID := TLogin.GetObject.UserID;
  G_stAdminUserName := TLogin.GetObject.UserName;
  L_stAdminGradeCode := Trim(TLogin.GetObject.Grade);
  Privileges :=TLogin.GetObject.ProgIDs; //���Ѽ���
  Logined := TLogin.GetObject.Logined;
  FORMSTATUSMSG(0,G_stAdminUserName);
end;

procedure TfmMain.StartMenuMenuItems2Click(Sender: TObject);
begin
  inherited;
  Logined:= False;
  Privileges := '';
end;

procedure TfmMain.StartMenuMenuItems3Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Exit;
  AdvFormStyler1.Metro := false;
  AdvFormStyler1.Style := tsCustom;
  AdvToolBarOfficeStyler1.Style := AdvToolbarStylers.bsCustom;
  AdvShapeButton1.UseGlobalColor := false;

  AdvFormStyler1.MetroColor := clSkyBlue;//clHighlight;
  AdvFormStyler1.MetroStyle := msLight;

  AdvFormStyler1.Metro := True;
  AdvShapeButton1.UseGlobalColor := not AdvFormStyler1.Metro;

end;

procedure TfmMain.TimerStop;
begin
  DeviceStateTimer.Enabled := False;
  ServerConnectTimer.Enabled := False;
  SoundTimer.Enabled := False;
  MessageTimer.Enabled := False;
  AccessSoundTimer.Enabled := False;
  OpenDoorSoundTimer.Enabled := False;
  CardDownLoadCheckTimer.Enabled := False;
  AdoConnectTimer.Enabled := False;
  DoorStateCheckTimer.Enabled := False;
  NodeConncectCheckTimer.Enabled := False;
end;

procedure TfmMain.TravelAdvPageEnable(oControl: TAdvPage; ProgIDs: String);
var
  Loop : Integer;
  stName : string;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    if oControl.Controls[Loop] <> nil then
    begin
      Try
        stName := oControl.Controls[Loop].Name;
        if oControl.Controls[Loop].Tag = 1 then
        begin
          if Pos(oControl.Controls[Loop].Hint,ProgIDs) > 0 then oControl.Controls[Loop].Enabled := True
          else oControl.Controls[Loop].Enabled := False;
        end;
        Try
          if stName <> 'AdvToolBarSeparator1' then
            TravelAdvPageEnable(TAdvPage(oControl.Controls[Loop]), ProgIDs);
        Except
          continue;
        End;
      Except
        Exit;
      End;
    end;
  end;
end;

procedure TfmMain.TravelToolBarImageChange(oControl: TAdvToolBarPager);
var
  Loop : Integer;
  stName : string;
begin
(*
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    stName := oControl.Controls[Loop].Name;
    if oControl.Controls[Loop].ClassType = TAdvGlowButton then
    begin
      if G_nProgramType = 2 then
      begin
        TAdvGlowButton(oControl.Controls[Loop]).Images := KTTMenuEnableImageList;
        TAdvGlowButton(oControl.Controls[Loop]).DisabledImages := KTTMenuDisableImageList;
      end else
      begin
        TAdvGlowButton(oControl.Controls[Loop]).Images := MenuEnableImageList32;
        TAdvGlowButton(oControl.Controls[Loop]).DisabledImages := MenuDisableImageList32;
      end;
    end;
  end;
*)
  if G_nProgramType = 0 then
  begin
    mn_CompanyCode.Images := KTTMenuEnableImageList;
    mn_CompanyCode.DisabledImages := KTTMenuDisableImageList;
    mn_BuildingCode.Images := KTTMenuEnableImageList;
    mn_BuildingCode.DisabledImages := KTTMenuDisableImageList;
    mn_Groupcode.Images := KTTMenuEnableImageList;
    mn_Groupcode.DisabledImages := KTTMenuDisableImageList;
    mn_Holiday.Images := KTTMenuEnableImageList;
    mn_Holiday.DisabledImages := KTTMenuDisableImageList;
    mn_TimeCode.Images := KTTMenuEnableImageList;
    mn_TimeCode.DisabledImages := KTTMenuDisableImageList;
    btn_employeeGubun.Images := KTTMenuEnableImageList;
    btn_employeeGubun.DisabledImages := KTTMenuDisableImageList;
    btn_PosiCode.Images := KTTMenuEnableImageList;
    btn_PosiCode.DisabledImages := KTTMenuDisableImageList;
    mn_DoorCode.Images := KTTMenuEnableImageList;
    mn_DoorCode.DisabledImages := KTTMenuDisableImageList;
    mn_ArmAreaCode.Images := KTTMenuEnableImageList;
    mn_ArmAreaCode.DisabledImages := KTTMenuDisableImageList;
    mn_Zone.Images := KTTMenuEnableImageList;
    mn_Zone.DisabledImages := KTTMenuDisableImageList;
    mn_BuildingMap.Images := KTTMenuEnableImageList;
    mn_BuildingMap.DisabledImages := KTTMenuDisableImageList;
    mn_ArmAreaMap.Images := KTTMenuEnableImageList;
    mn_ArmAreaMap.DisabledImages := KTTMenuDisableImageList;
    mn_DoorMap.Images := KTTMenuEnableImageList;
    mn_DoorMap.DisabledImages := KTTMenuDisableImageList;
    mn_CardCreate.Images := KTTMenuEnableImageList;
    mn_CardCreate.DisabledImages := KTTMenuEnableImageList;
    mn_EmployeeApprove.Images := KTTMenuEnableImageList;
    mn_EmployeeApprove.DisabledImages := KTTMenuEnableImageList;
    mn_Employee.Images := KTTMenuEnableImageList;
    mn_Employee.DisabledImages := KTTMenuDisableImageList;
    mn_CompanyGrade.Images := KTTMenuEnableImageList;
    mn_CompanyGrade.DisabledImages := KTTMenuDisableImageList;
    mn_GroupGrade.Images := KTTMenuEnableImageList;
    mn_GroupGrade.DisabledImages := KTTMenuDisableImageList;
    mn_AccessTimeAdmin.Images := KTTMenuEnableImageList;
    mn_AccessTimeAdmin.DisabledImages := KTTMenuDisableImageList;
    mn_DoorSchedule1.Images := KTTMenuEnableImageList;
    mn_DoorSchedule1.DisabledImages := KTTMenuDisableImageList;
    mn_EmployeeGradeSearch.Images := KTTMenuEnableImageList;
    mn_EmployeeGradeSearch.DisabledImages := KTTMenuDisableImageList;
    mn_EmployeeGrade.Images := KTTMenuEnableImageList;
    mn_EmployeeGrade.DisabledImages := KTTMenuDisableImageList;
    mn_AccessMonitoring.Images := KTTMenuEnableImageList;
    mn_AccessMonitoring.DisabledImages := KTTMenuDisableImageList;
    mn_SecurityMonitoring.Images := KTTMenuEnableImageList;
    mn_SecurityMonitoring.DisabledImages := KTTMenuDisableImageList;
    mn_ServerMonitoring.Images := KTTMenuEnableImageList;
    mn_ServerMonitoring.DisabledImages := KTTMenuDisableImageList;
    mn_MonitorState.Images := KTTMenuEnableImageList;
    mn_MonitorState.DisabledImages := KTTMenuDisableImageList;
    mn_FireRecovery.Images := KTTMenuEnableImageList;
    mn_FireRecovery.DisabledImages := KTTMenuDisableImageList;
    mn_DaemonRestart.Images := KTTMenuEnableImageList;
    mn_DaemonRestart.DisabledImages := KTTMenuDisableImageList;
    mn_employeeManager.Images := KTTMenuEnableImageList;
    mn_employeeManager.DisabledImages := KTTMenuDisableImageList;
    btn_FoodReaderSetting.Images := KTTMenuEnableImageList;
    btn_FoodReaderSetting.DisabledImages := KTTMenuDisableImageList;
    btn_FoodMonitoring.Images := KTTMenuEnableImageList;
    btn_FoodMonitoring.DisabledImages := KTTMenuDisableImageList;
    mn_ServerMonitoring1.Images := KTTMenuEnableImageList;
    mn_ServerMonitoring1.DisabledImages := KTTMenuDisableImageList;
    mn_FoodReport2.Images := KTTMenuEnableImageList;
    mn_FoodReport2.DisabledImages := KTTMenuDisableImageList;
    btn_FoodStateReport.Images := KTTMenuEnableImageList;
    btn_FoodStateReport.DisabledImages := KTTMenuDisableImageList;
    btn_DepartStateReport.Images := KTTMenuEnableImageList;
    btn_DepartStateReport.DisabledImages := KTTMenuDisableImageList;
    mn_AccessReport.Images := KTTMenuEnableImageList;
    mn_AccessReport.DisabledImages := KTTMenuDisableImageList;
    mn_AccessHistoryReport.Images := KTTMenuEnableImageList;
    mn_AccessHistoryReport.DisabledImages := KTTMenuDisableImageList;
    mn_AlarmReport.Images := KTTMenuEnableImageList;
    mn_AlarmReport.DisabledImages := KTTMenuDisableImageList;
    mn_AlarmAreaReport.Images := KTTMenuEnableImageList;
    mn_AlarmAreaReport.DisabledImages := KTTMenuDisableImageList;
    mn_ManagerReport.Images := KTTMenuEnableImageList;
    mn_ManagerReport.DisabledImages := KTTMenuDisableImageList;
    mn_DeviceReport.Images := KTTMenuEnableImageList;
    mn_DeviceReport.DisabledImages := KTTMenuDisableImageList;
    mn_AttendReport.Images := KTTMenuEnableImageList;
    mn_AttendReport.DisabledImages := KTTMenuDisableImageList;
    mn_FoodReport.Images := KTTMenuEnableImageList;
    mn_FoodReport.DisabledImages := KTTMenuDisableImageList;
    mn_NodeManager.Images := KTTMenuEnableImageList;
    mn_NodeManager.DisabledImages := KTTMenuDisableImageList;
    mn_ControlManager.Images := KTTMenuEnableImageList;
    mn_ControlManager.DisabledImages := KTTMenuDisableImageList;
    mn_FingerManager.Images := KTTMenuEnableImageList;
    mn_FingerManager.DisabledImages := KTTMenuDisableImageList;
    mn_AdminGrade.Images := KTTMenuEnableImageList;
    mn_AdminGrade.DisabledImages := KTTMenuDisableImageList;
    mn_AdminGradeManger.Images := KTTMenuEnableImageList;
    mn_AdminGradeManger.DisabledImages := KTTMenuDisableImageList;
    mn_AdminManager.Images := KTTMenuEnableImageList;
    mn_AdminManager.DisabledImages := KTTMenuDisableImageList;
    mn_CriticalForm.Images := KTTMenuEnableImageList;
    mn_CriticalForm.DisabledImages := KTTMenuDisableImageList;
    btn_EmployeeRelay.Images := KTTMenuEnableImageList;
    btn_EmployeeRelay.DisabledImages := KTTMenuDisableImageList;
    btn_ConfigSetting.Images := KTTMenuEnableImageList;
    btn_ConfigSetting.DisabledImages := KTTMenuDisableImageList;
    btn_RemoteControl.Images := KTTMenuEnableImageList;
    btn_RemoteControl.DisabledImages := KTTMenuDisableImageList;
    btn_Upgrade.Images := KTTMenuEnableImageList;
    btn_Upgrade.DisabledImages := KTTMenuDisableImageList;
    btn_NameChange.Images := KTTMenuEnableImageList;
    btn_NameChange.DisabledImages := KTTMenuDisableImageList;
  end else
  begin
    mn_CompanyCode.Images := MenuEnableImageList32;
    mn_CompanyCode.DisabledImages := MenuDisableImageList32;
    mn_BuildingCode.Images := MenuEnableImageList32;
    mn_BuildingCode.DisabledImages := MenuDisableImageList32;
    mn_Groupcode.Images := MenuEnableImageList32;
    mn_Groupcode.DisabledImages := MenuDisableImageList32;
    mn_Holiday.Images := MenuEnableImageList32;
    mn_Holiday.DisabledImages := MenuDisableImageList32;
    mn_TimeCode.Images := MenuEnableImageList32;
    mn_TimeCode.DisabledImages := MenuDisableImageList32;
    btn_employeeGubun.Images := MenuEnableImageList32;
    btn_employeeGubun.DisabledImages := MenuDisableImageList32;
    btn_PosiCode.Images := MenuEnableImageList32;
    btn_PosiCode.DisabledImages := MenuDisableImageList32;
    mn_DoorCode.Images := MenuEnableImageList32;
    mn_DoorCode.DisabledImages := MenuDisableImageList32;
    mn_ArmAreaCode.Images := MenuEnableImageList32;
    mn_ArmAreaCode.DisabledImages := MenuDisableImageList32;
    mn_Zone.Images := MenuEnableImageList32;
    mn_Zone.DisabledImages := MenuDisableImageList32;
    mn_BuildingMap.Images := MenuEnableImageList32;
    mn_BuildingMap.DisabledImages := MenuDisableImageList32;
    mn_ArmAreaMap.Images := MenuEnableImageList32;
    mn_ArmAreaMap.DisabledImages := MenuDisableImageList32;
    mn_DoorMap.Images := MenuEnableImageList32;
    mn_DoorMap.DisabledImages := MenuDisableImageList32;
    mn_CardCreate.Images := MenuEnableImageList32;
    mn_CardCreate.DisabledImages := MenuDisableImageList32;
    mn_EmployeeApprove.Images := MenuEnableImageList32;
    mn_EmployeeApprove.DisabledImages := MenuDisableImageList32;
    mn_Employee.Images := MenuEnableImageList32;
    mn_Employee.DisabledImages := MenuDisableImageList32;
    mn_CompanyGrade.Images := MenuEnableImageList32;
    mn_CompanyGrade.DisabledImages := MenuDisableImageList32;
    mn_GroupGrade.Images := MenuEnableImageList32;
    mn_GroupGrade.DisabledImages := MenuDisableImageList32;
    mn_AccessTimeAdmin.Images := MenuEnableImageList32;
    mn_AccessTimeAdmin.DisabledImages := MenuDisableImageList32;
    mn_DoorSchedule1.Images := MenuEnableImageList32;
    mn_DoorSchedule1.DisabledImages := MenuDisableImageList32;
    mn_EmployeeGradeSearch.Images := MenuEnableImageList32;
    mn_EmployeeGradeSearch.DisabledImages := MenuDisableImageList32;
    mn_EmployeeGrade.Images := MenuEnableImageList32;
    mn_EmployeeGrade.DisabledImages := MenuDisableImageList32;
    mn_AccessMonitoring.Images := MenuEnableImageList32;
    mn_AccessMonitoring.DisabledImages := MenuDisableImageList32;
    mn_SecurityMonitoring.Images := MenuEnableImageList32;
    mn_SecurityMonitoring.DisabledImages := MenuDisableImageList32;
    mn_ServerMonitoring.Images := MenuEnableImageList32;
    mn_ServerMonitoring.DisabledImages := MenuDisableImageList32;
    mn_MonitorState.Images := MenuEnableImageList32;
    mn_MonitorState.DisabledImages := MenuDisableImageList32;
    mn_FireRecovery.Images := MenuEnableImageList32;
    mn_FireRecovery.DisabledImages := MenuDisableImageList32;
    mn_DaemonRestart.Images := MenuEnableImageList32;
    mn_DaemonRestart.DisabledImages := MenuDisableImageList32;
    mn_employeeManager.Images := MenuEnableImageList32;
    mn_employeeManager.DisabledImages := MenuDisableImageList32;
    btn_FoodReaderSetting.Images := MenuEnableImageList32;
    btn_FoodReaderSetting.DisabledImages := MenuDisableImageList32;
    btn_FoodMonitoring.Images := MenuEnableImageList32;
    btn_FoodMonitoring.DisabledImages := MenuDisableImageList32;
    mn_ServerMonitoring1.Images := MenuEnableImageList32;
    mn_ServerMonitoring1.DisabledImages := MenuDisableImageList32;
    mn_FoodReport2.Images := MenuEnableImageList32;
    mn_FoodReport2.DisabledImages := MenuDisableImageList32;
    btn_FoodStateReport.Images := MenuEnableImageList32;
    btn_FoodStateReport.DisabledImages := MenuDisableImageList32;
    btn_DepartStateReport.Images := MenuEnableImageList32;
    btn_DepartStateReport.DisabledImages := MenuDisableImageList32;
    mn_AccessReport.Images := MenuEnableImageList32;
    mn_AccessReport.DisabledImages := MenuDisableImageList32;
    mn_AccessHistoryReport.Images := MenuEnableImageList32;
    mn_AccessHistoryReport.DisabledImages := MenuDisableImageList32;
    mn_AlarmReport.Images := MenuEnableImageList32;
    mn_AlarmReport.DisabledImages := MenuDisableImageList32;
    mn_AlarmAreaReport.Images := MenuEnableImageList32;
    mn_AlarmAreaReport.DisabledImages := MenuDisableImageList32;
    mn_ManagerReport.Images := MenuEnableImageList32;
    mn_ManagerReport.DisabledImages := MenuDisableImageList32;
    mn_DeviceReport.Images := MenuEnableImageList32;
    mn_DeviceReport.DisabledImages := MenuDisableImageList32;
    mn_AttendReport.Images := MenuEnableImageList32;
    mn_AttendReport.DisabledImages := MenuDisableImageList32;
    mn_FoodReport.Images := MenuEnableImageList32;
    mn_FoodReport.DisabledImages := MenuDisableImageList32;
    mn_NodeManager.Images := MenuEnableImageList32;
    mn_NodeManager.DisabledImages := MenuDisableImageList32;
    mn_ControlManager.Images := MenuEnableImageList32;
    mn_ControlManager.DisabledImages := MenuDisableImageList32;
    mn_FingerManager.Images := MenuEnableImageList32;
    mn_FingerManager.DisabledImages := MenuDisableImageList32;
    mn_AdminGrade.Images := MenuEnableImageList32;
    mn_AdminGrade.DisabledImages := MenuDisableImageList32;
    mn_AdminGradeManger.Images := MenuEnableImageList32;
    mn_AdminGradeManger.DisabledImages := MenuDisableImageList32;
    mn_AdminManager.Images := MenuEnableImageList32;
    mn_AdminManager.DisabledImages := MenuDisableImageList32;
    mn_CriticalForm.Images := MenuEnableImageList32;
    mn_CriticalForm.DisabledImages := MenuDisableImageList32;
    btn_EmployeeRelay.Images := MenuEnableImageList32;
    btn_EmployeeRelay.DisabledImages := MenuDisableImageList32;
    btn_ConfigSetting.Images := MenuEnableImageList32;
    btn_ConfigSetting.DisabledImages := MenuDisableImageList32;
    btn_RemoteControl.Images := MenuEnableImageList32;
    btn_RemoteControl.DisabledImages := MenuDisableImageList32;
    btn_Upgrade.Images := MenuEnableImageList32;
    btn_Upgrade.DisabledImages := MenuDisableImageList32;
    btn_NameChange.Images := MenuEnableImageList32;
    btn_NameChange.DisabledImages := MenuDisableImageList32;
  end;

end;

procedure TfmMain.TravelToolBarPagerEnable(oControl: TAdvToolBarPager;
  ProgIDs: String);
var
  Loop : Integer;
  stName : string;
begin
  For Loop:=0 to oControl.ControlCount - 1 do
  begin
    stName := oControl.Controls[Loop].Name;
    if oControl.Controls[Loop].Tag = 1 then
    begin
      if Pos(oControl.Controls[Loop].Hint,ProgIDs) > 0 then oControl.Controls[Loop].Enabled := True
      else oControl.Controls[Loop].Enabled := False;
    end;
    Try
      TravelAdvPageEnable(TAdvPage(oControl.Controls[Loop]), ProgIDs);
    Except
      continue;
    End;

  end;
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

function TfmMain.UnLoadingALARMEVENTSTATEPCCODEList: Boolean;
var
  i : integer;
begin
  if ALARMEVENTSTATEPCCODEList.Count = 0 then Exit;

  for i := ALARMEVENTSTATEPCCODEList.Count - 1 downto 0 do
  begin
    TALARMEVENTSTATEPCCODE(ALARMEVENTSTATEPCCODEList.Objects[i]).Free;
  end;
  ALARMEVENTSTATEPCCODEList.Clear;
end;

procedure TfmMain.UnLoadingArmAreaList;
begin

end;

procedure TfmMain.UnLoadingDoorList;
begin

end;

procedure TfmMain.UnLoadingFoodReaderList;
var
  i : integer;
begin
  if FoodReaderList.Count < 1 then Exit;

  for i := FoodReaderList.Count - 1 downto 0 do
  begin
    TFoodReaderType(FoodReaderList.Objects[i]).Free;
  end;
  FoodReaderList.Clear;
end;

procedure TfmMain.UnLoadingNodeList;
var
  i : integer;
begin
(*  if G_MonitoringNodeList = nil then Exit;

  for i := G_MonitoringNodeList.Count - 1 downto 0 do
  begin
    TMonitoringNode(G_MonitoringNodeList.Objects[i]).Free;
    G_MonitoringNodeList.Objects[i] := nil;
  end;
  G_MonitoringNodeList.Clear;
*)
  if G_MonitoringBuildingList = nil then Exit;
  for i := G_MonitoringBuildingList.Count - 1 downto 0 do
  begin
    TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).Free;
    G_MonitoringBuildingList.Objects[i] := nil;
  end;
  G_MonitoringBuildingList.Clear;
end;

procedure TfmMain.UnLoadingReaderDoorPositionList;
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

procedure TfmMain.WMNCHitTest(var Msg: TWMNCHitTest);
var
ScreenPt : TPoint;
MoveArea : TRect;
HANDLE_WIDTH: Integer;
SIZEGRIP: Integer;
begin
HANDLE_WIDTH := 3;
Sizegrip := 19;
inherited;
if not (csDesigning in ComponentState) then
begin
ScreenPt := ScreenToClient(Point(Msg.Xpos, Msg.Ypos));
MoveArea := Rect(HANDLE_WIDTH,
HANDLE_WIDTH,
Width - HANDLE_WIDTH,
Height - HANDLE_WIDTH);
if FAllowSize then
begin
// left side
if (ScreenPt.x < HANDLE_WIDTH) then
Msg.Result := HTLEFT
// top side
else if (ScreenPt.y < HANDLE_WIDTH) then
Msg.Result := HTTOP
// right side
else if (ScreenPt.x >= Width - HANDLE_WIDTH) then
Msg.Result := HTRIGHT
// bottom side
else if (ScreenPt.y >= Height - HANDLE_WIDTH) then
Msg.Result := HTBOTTOM
// top left corner
else if (ScreenPt.x < Sizegrip) and
(ScreenPt.y < Sizegrip) then
Msg.Result := HTTOPLEFT
// bottom left corner
else if (ScreenPt.x < Sizegrip) and
(ScreenPt.y >= Height - Sizegrip) then
Msg.Result := HTBOTTOMLEFT
// top right corner
else if (ScreenPt.x >= Width - Sizegrip) and
(ScreenPt.y < Sizegrip) then
Msg.Result := HTTOPRIGHT
// bottom right corner
else if (ScreenPt.x >= Width - Sizegrip) and
(ScreenPt.y >= Height - Sizegrip) then
Msg.Result := HTBOTTOMRIGHT
end;
end;
{
// IF you want to allow moving the form, add an FAllowMove variable and
// set it to true, then uncomment this code.
if FAllowMove then
begin
// no sides or corners, this will do the dragging
if PtInRect(MoveArea, ScreenPt) then
Msg.Result := HTCAPTION;
end;
}
end;

procedure TfmMain.WriteRegistryKey(aCustomerID, aInstallDate: string);
var
  FReg : TRegistry;
begin
  if aInstallDate = '' then aInstallDate := formatDateTime('yyyymmdd' ,Now + 30);

  FReg := TRegistry.Create;
  try
    FReg.RootKey := HKEY_LOCAL_MACHINE;
    FReg.OpenKey('Software\Zeron\GMS',True);
    FReg.WriteString('CustomerID',aCustomerID);
    FReg.WriteString('InstallDate',aInstallDate);
    FReg.CloseKey;
  Finally
    FReg.Free;
  end;
end;

end.