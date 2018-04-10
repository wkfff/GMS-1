unit uMonitoringMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Touch.GestureMgr,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, AdvSplitter, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ImgList, AdvPageControl, AdvGlowButton, Vcl.Buttons,System.IniFiles,
  AdvSmoothLabel, AdvSmoothPanel,uSubForm, CommandArray,Vcl.Clipbrd,ADODB,ActiveX,DB,Vcl.Themes,
  Vcl.Imaging.jpeg, AdvEdit,Math,Winapi.ShellAPI, Vcl.MPlayer, AdvGlassButton,
  AdvPanel, AdvGroupBox;

const
  con_LabelPanelHeigh = 28;

  con_DoorStatePosiManageMode = 0;
  con_DoorStateNegaManageMode = 1;
  con_DoorStatePosiOpenMode = 9;
  con_DoorStateNegaOpenMode = 9;
  con_DoorStatePosiCloseMode = 2;
  con_DoorStateNegaCloseMode = 2;

  con_DoorImageFire = 4;
  con_DoorImageLongTime = 3;
  con_DoorImageOpen = 1;
  con_DoorImageClose = 0;
  con_DoorImageNothing = 2;

type
  TGroupPanelClik = procedure(Sender:TObject;aBuildingCode:string)of object;

  TGroupPanel = class(TPanel)
  private
    oPanel : TPanel;
    oLabel : TLabel;
    oImage : TImage;
    FBuildingCode: string;
    FOnGroupPanelClick: TGroupPanelClik;
    FImage: TImage;
    FOnGroupPanelMouseLeave: TGroupPanelClik;
    FOnGroupPanelMouseEnter: TGroupPanelClik;
    FBuildingName: string;
    procedure ImageClick(Sender: TObject);
    procedure MouseEnter(Sender: TObject);
    procedure MouseLeave(Sender: TObject);
    procedure SetImage(const Value: TImage);
    procedure SetBuildingName(const Value: string);
  published
    property OnGroupPanelClick : TGroupPanelClik read FOnGroupPanelClick write FOnGroupPanelClick;
    property OnGroupPanelMouseEnter : TGroupPanelClik read FOnGroupPanelMouseEnter write FOnGroupPanelMouseEnter;
    property OnGroupPanelMouseLeave : TGroupPanelClik read FOnGroupPanelMouseLeave write FOnGroupPanelMouseLeave;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property BuildingName : string read FBuildingName write SetBuildingName;
    property Image : TImage read FImage write SetImage;
  end;

  TfmMonitoringMain = class(TForm)
    AppBar: TPanel;
    CloseButton: TImage;
    ActionList1: TActionList;
    Action1: TAction;
    GestureManager1: TGestureManager;
    ScrollBox2: TScrollBox;
    GroupPanel1: TPanel;
    Panel7: TPanel;
    AdvSplitter1: TAdvSplitter;
    FlowPanel2: TFlowPanel;
    panImage: TPanel;
    Image_a1: TImage;
    Image_a2: TImage;
    Image_a3: TImage;
    Image_a4: TImage;
    Image_a5: TImage;
    Image_d1: TImage;
    Image_d2: TImage;
    Image_d3: TImage;
    Image_d4: TImage;
    Image_d5: TImage;
    pan_Monitoring: TPanel;
    LargeImageList32: TImageList;
    SmallDoorList: TImageList;
    doorListView: TListView;
    pm_DoorControl: TPopupMenu;
    mn_DoorOpen: TMenuItem;
    N9: TMenuItem;
    pm_JavarOpen: TMenuItem;
    pm_JavarClose: TMenuItem;
    pm_DoorManageMode: TMenuItem;
    pm_DooOpenMode: TMenuItem;
    pm_DoorCloseMode: TMenuItem;
    pm_Line1: TMenuItem;
    pm_CardMode: TMenuItem;
    Positive1: TMenuItem;
    Negative1: TMenuItem;
    N6: TMenuItem;
    pm_DoorStateCheck: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    pm_DoorInfo: TMenuItem;
    statelist: TImageList;
    pm_Style: TPopupMenu;
    MetropolisUIDark1: TMenuItem;
    MetropolisUIBlack1: TMenuItem;
    MetropolisUIBlue1: TMenuItem;
    MetropolisUIGreen1: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Img_Prev: TImage;
    lb_Title: TLabel;
    SpeedButton1: TSpeedButton;
    pan_SearchName: TPanel;
    Label11: TLabel;
    sg_SearchNameGrid: TAdvStringGrid;
    btn_SearchCancel: TAdvGlowButton;
    PageControl1: TPageControl;
    tab_Access: TTabSheet;
    tab_Alarm: TTabSheet;
    sg_AccessEvent: TAdvStringGrid;
    pan_DoorInfo: TPanel;
    lb_DoorInfo: TLabel;
    lb_DoorName1: TLabel;
    lb_DoorName: TLabel;
    lb_NodeIP: TLabel;
    lb_DoorNodeIP: TLabel;
    lb_DoorDeviceID: TLabel;
    lb_DeviceID: TLabel;
    lb_DoorNo: TLabel;
    lb_DoorID: TLabel;
    lb_DoorPositoin: TLabel;
    lb_Building: TLabel;
    btn_DoorInfoConfirm: TAdvGlowButton;
    mn_PingTest: TMenuItem;
    sg_AlarmEvent: TAdvStringGrid;
    pan_ServerState: TPanel;
    pan_ServerstateLabel: TPanel;
    pan_serverNet: TFlowPanel;
    Img_ServerConnect1: TImage;
    Img_ServerDisconnect1: TImage;
    PopupMenu1: TPopupMenu;
    Img_ServerConnect2: TImage;
    Img_ServerDisconnect2: TImage;
    ServerImageTimer: TTimer;
    pm_AlarmEvent: TPopupMenu;
    mn_AlarmEvent: TMenuItem;
    pm_AccessEvent: TPopupMenu;
    mn_TelEvent: TMenuItem;
    Label1: TLabel;
    mem_DoorInfo: TMemo;
    btn_DoorMemoreg: TAdvGlowButton;
    mn_CardPrintNoCreate: TMenuItem;
    mn_CardPrintNoCopy: TMenuItem;
    lb_NodeNo: TLabel;
    N2: TMenuItem;
    mn_DoorAlarmEvent: TMenuItem;
    mn_FireRecovery: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    mn_ControlerChange: TMenuItem;
    pan_ChangeNodeIP: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    lb_ChangeNodeIPNodeNo: TLabel;
    btn_ChangeNodeIPSave: TAdvGlowButton;
    ed_ChangeNodeIp: TAdvEdit;
    btn_ChangeNodeIPCancel: TAdvGlowButton;
    mn_CardReaderChange: TMenuItem;
    btn_CardAdd: TSpeedButton;
    mn_CardRegist: TMenuItem;
    mn_AccessEvent: TMenuItem;
    btn_ClientConfig: TSpeedButton;
    MediaPlayer1: TMediaPlayer;
    pan_Alarm: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    lb_Message: TAdvSmoothLabel;
    btn_MessageConfirm: TAdvGlassButton;
    SoundTimer: TTimer;
    MessageTimer: TTimer;
    pan_Example: TPanel;
    gb_DoorState: TGroupBox;
    lb_DoorMode: TLabel;
    lb_DoorState1: TLabel;
    GroupBox1: TGroupBox;
    lb_DoorOpen: TLabel;
    lb_DoorPManager: TLabel;
    lb_DoorNManager: TLabel;
    lb_DoorLock: TLabel;
    GroupBox2: TGroupBox;
    lb_DoorOpenState: TLabel;
    lb_DoorCloseState: TLabel;
    lb_DoorTimeOver: TLabel;
    lb_DoorFire: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    AdvPanel1: TAdvPanel;
    SpeedButton11: TSpeedButton;
    AdvPanel5: TAdvPanel;
    AdvPanel6: TAdvPanel;
    SpeedButton3: TSpeedButton;
    AdvPanel7: TAdvPanel;
    SpeedButton4: TSpeedButton;
    AdvPanel8: TAdvPanel;
    SpeedButton5: TSpeedButton;
    AdvPanel9: TAdvPanel;
    SpeedButton6: TSpeedButton;
    AdvPanel10: TAdvPanel;
    SpeedButton7: TSpeedButton;
    AdvPanel11: TAdvPanel;
    SpeedButton8: TSpeedButton;
    AdvPanel12: TAdvPanel;
    SpeedButton9: TSpeedButton;
    pmDoorList: TPopupMenu;
    pm_NetworkFailList: TMenuItem;
    pm_DoorOpenList: TMenuItem;
    pm_DoorLongTimeOpenList: TMenuItem;
    btn_BuildingStateMonitoring: TSpeedButton;
    mn_displaytest: TMenuItem;
    mn_buffercount: TMenuItem;
    mn_CardPermitReg: TMenuItem;
    Pan_Search: TPanel;
    Label6: TLabel;
    ed_SearchName: TAdvEdit;
    pan_building: TPanel;
    Splitter1: TSplitter;
    MenuImageList16: TImageList;
    tv_BuildingList: TTreeView;
    tv_BuildingCode: TTreeView;
    pan_Loading: TAdvSmoothPanel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    ProgressBar1: TProgressBar;
    lb_Count: TAdvSmoothLabel;
    mn_ControlerReset: TMenuItem;
    Label7: TLabel;
    lb_devicever: TLabel;
    btn_update: TSpeedButton;
    Label8: TLabel;
    lb_Addr: TLabel;
    procedure CloseButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure GroupPanel1_1Click(Sender: TObject);
    procedure FlowPanel1Resize(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Img_PrevClick(Sender: TObject);
    procedure pan_MonitoringResize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Panel7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel7DblClick(Sender: TObject);
    procedure ScrollBox2Resize(Sender: TObject);
    procedure doorListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure mn_DoorOpenClick(Sender: TObject);
    procedure pm_JavarOpenClick(Sender: TObject);
    procedure pm_JavarCloseClick(Sender: TObject);
    procedure pm_DoorManageModeClick(Sender: TObject);
    procedure pm_DooOpenModeClick(Sender: TObject);
    procedure pm_DoorCloseModeClick(Sender: TObject);
    procedure Positive1Click(Sender: TObject);
    procedure Negative1Click(Sender: TObject);
    procedure pm_DoorStateCheckClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure pm_DoorInfoClick(Sender: TObject);
    procedure btn_DoorInfoConfirmClick(Sender: TObject);
    procedure sg_AccessEventKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg_AccessEventColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure FormActivate(Sender: TObject);
    procedure MetropolisUIDark1Click(Sender: TObject);
    procedure MetropolisUIBlack1Click(Sender: TObject);
    procedure MetropolisUIBlue1Click(Sender: TObject);
    procedure MetropolisUIGreen1Click(Sender: TObject);
    procedure btn_SearchCancelClick(Sender: TObject);
    procedure pan_SearchNameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ed_SearchNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg_SearchNameGridDblClick(Sender: TObject);
    procedure ed_SearchNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg_SearchNameGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2DblClick(Sender: TObject);
    procedure mn_PingTestClick(Sender: TObject);
    procedure pan_ServerstateLabelMouseEnter(Sender: TObject);
    procedure pan_ServerstateLabelMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sg_AlarmEventColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_AlarmEventResize(Sender: TObject);
    procedure sg_AccessEventResize(Sender: TObject);
    procedure ServerImageTimerTimer(Sender: TObject);
    procedure sg_AccessEventClick(Sender: TObject);
    procedure sg_AccessEventDblClick(Sender: TObject);
    procedure mn_TelEventClick(Sender: TObject);
    procedure mn_CardPrintNoCreateClick(Sender: TObject);
    procedure mn_CardPrintNoCopyClick(Sender: TObject);
    procedure sg_AccessEventMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_DoorMemoregClick(Sender: TObject);
    procedure mn_AlarmEventClick(Sender: TObject);
    procedure mn_DoorAlarmEventClick(Sender: TObject);
    procedure mn_FireRecoveryClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btn_ChangeNodeIPSaveClick(Sender: TObject);
    procedure btn_ChangeNodeIPCancelClick(Sender: TObject);
    procedure mn_ControlerChangeClick(Sender: TObject);
    procedure mn_CardReaderChangeClick(Sender: TObject);
    procedure btn_CardAddClick(Sender: TObject);
    procedure mn_CardRegistClick(Sender: TObject);
    procedure mn_AccessEventClick(Sender: TObject);
    procedure btn_ClientConfigClick(Sender: TObject);
    procedure btn_MessageConfirmClick(Sender: TObject);
    procedure SoundTimerTimer(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure pan_ExampleMouseEnter(Sender: TObject);
    procedure pan_ExampleMouseLeave(Sender: TObject);
    procedure lb_BuildingNFCountMouseEnter(Sender: TObject);
    procedure lb_BuildingNFCountMouseLeave(Sender: TObject);
    procedure lb_BuildingDoorOpenCountMouseEnter(Sender: TObject);
    procedure lb_BuildingDoorOpenCountMouseLeave(Sender: TObject);
    procedure lb_BuildingLongTimeCountMouseEnter(Sender: TObject);
    procedure lb_BuildingLongTimeCountMouseLeave(Sender: TObject);
    procedure doorListViewResize(Sender: TObject);
    procedure pm_NetworkFailListClick(Sender: TObject);
    procedure lb_BuildingNFCountDblClick(Sender: TObject);
    procedure lb_BuildingDoorOpenCountDblClick(Sender: TObject);
    procedure lb_BuildingLongTimeCountDblClick(Sender: TObject);
    procedure btn_BuildingStateMonitoringClick(Sender: TObject);
    procedure mn_displaytestClick(Sender: TObject);
    procedure mn_buffercountClick(Sender: TObject);
    procedure mn_CardPermitRegClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure pan_buildingResize(Sender: TObject);
    procedure tv_BuildingListClick(Sender: TObject);
    procedure mn_ControlerResetClick(Sender: TObject);
    procedure btn_updateClick(Sender: TObject);
  private
    L_arrAccessEventIndexArray:Array of integer; //�����̺�Ʈ ����Ʈ ���� �迭
    L_arrRelAccessEventIndexArray:Array of integer; //�����̺�Ʈ ���� ��ġ
    L_arrAccessEventShowTable : Array of integer;  //�����̺�Ʈ ��ȸ �׸����̺�
    L_arrAccessEventSizeTable : Array of integer;  //�����̺�Ʈ Cell Size
    L_arrAlarmEventIndexArray:Array of integer; //�˶��̺�Ʈ ����Ʈ ���� �迭
    L_arrRelAlarmEventIndexArray:Array of integer; //�˶��̺�Ʈ ���� ��ġ
    L_arrAlarmEventShowTable : Array of integer;  //�˶��̺�Ʈ ��ȸ �׸����̺�
    L_arrAlarmEventSizeTable : Array of integer;   //�˶��̺�Ʈ Cell Size
    L_bFormActive : Boolean;
    L_bSoundTimerEnable : Boolean;
    L_bListRefresh : Boolean;
    L_nAccessEventShowCount : integer;
    L_nAlarmEventShowCount : integer;
    L_nAlarmSoundCount : integer;
    L_nFormDeep : integer; //0.����,1.����͸�
    L_nWindowState : integer;
    L_nBuildingCount : integer;
    L_nGroupHeigh : integer;
    L_nGroupWidth : integer;
    L_nMonitoringGroup : integer;
    L_nSelectRow : integer;
    L_nServerConnectImageType : integer;
    L_nViewListStyle : integer;
    L_stBuildingCode : string;
    L_stSelectAccessEventTime : string;
    L_stSelectNodeNo : string;
    L_stSelectEcuID : string;
    L_stSelectDoorName : string;
    L_stSelectDoorNo : string;
    L_stSelectCardNO : string;
    L_stSelectPrintNo : string;
    L_stTitle : string;
    AccessEventHeaderNameList : TStringList;
    AlarmEventHeaderNameList : TStringList;
    AlarmSoundList : TStringList;
    BuildingDoorList : TStringList;
    ListGroupBuildingCode : TStringList;
    ServerImageList : TStringList;
    ViewDoorList : TStringList;
    FAlarmPlayStop: Boolean;
    { Private declarations }
    procedure AppBarResize;
    procedure AppBarShow(mode: integer);

    procedure ChangeAccessEventIndex(FromIndex,ToIndex:integer);
    procedure ChangeAlarmEventIndex(FromIndex,ToIndex:integer);
    procedure CreateListGroup(ListView:TListView;aBuildingCode:string);
    procedure CreateServerImage;
    procedure ServerDblClick(Sender:TObject);
    function GetDisableImage(aNo:integer):TImage;
    function GetEnableImage(aNo:integer):TImage;
    procedure DisplayBuilding;
    function GetDoorManageModeImageIndex(aDoorCardMode,aDoorManageMode:string):integer;
    function GetDoorStateImageIndex(aDoorDSState,aDoorLSState,aDoorFireEvent:string):integer;
    procedure GroupPanelClick(Sender:TObject;aBuildingCode:string);
    procedure GroupPanelMouseEnter(Sender:TObject;aBuildingCode:string);
    procedure GroupPanelMouseLeave(Sender:TObject;aBuildingCode:string);
    function  ListCellSize:Boolean;
    function  ListConfigRead:Boolean;
    function  ListHeaderNameGet:Boolean;
    function  ListHeaderNameSetting:Boolean;
    function  LoadBuildingDoor(aBuildingCode:string) : Boolean;
    function  SearchDoorNameList(TargetGrid:TAdvStringGrid;aBuildingCode,aSearchName:string):Boolean;
    function  CardPermitDoorAdd(aCardNO,aNodeNo,aEcuID,aDoorNo:string):Boolean;
  public
    SelectedGroup: String;  // group string from
    L_bfmBuildingDoorStateShow : Boolean;
    { Public declarations }
    procedure AlarmConfirm;
    procedure ArmAreaCurrentAlarmStateChange(aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure BuildingAlarmStateChange(aBuildingCode:string;aAlarmState : integer);
    procedure BuildingSecurityModeChange(aBuildingCode:string;aMode : integer);
    procedure BuildingDoorStateCountChange(aBuildingCode:string;aState, aCount:integer);
    procedure DeviceAlarmEvent(aDecoderNo:integer;aNodeNo,aECUID,aExtendID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                             aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView,aAlarmSound,aAlarmColor:string;aRealTime:Boolean=True);
    procedure DeviceCardAccessEvent(aDecoderNo:integer;aTime,aNodeNo, aEcuID, aDoorNo,aReaderNo, aInOut,aInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,
                    aAccessPermitName,aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone:string);
    procedure DeviceChangeEvent(aDecoderNo:integer;aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
    procedure DoorChangeEvent(aDecoderNo:integer;aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure MonitoringRefresh;
    procedure NodeChangeEvent(aDecoderNo:integer;aNodeNo,aEcuID,aType,aNo,aCmd,aData:string);
    procedure ServerConnected(aDecoderNo:integer;aConnected:Boolean);
    procedure ServerPacketView(aTxRx,aClientIP,aData,aResult:string);
    procedure ServerNetworkState(aDecoderNo:integer;aServerIP,aData:string);
  public
    property AlarmPlayStop : Boolean read FAlarmPlayStop write FAlarmPlayStop;
  end;

var
  fmMonitoringMain: TfmMonitoringMain;

implementation

uses
  uAccessReport,
  uBuildingDoorState,
  uCardPrintNoCreate,
  uClientConfig,
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDBSelect,
  uDetailForm,
  uDoorAlarm,
  uDoorAlarmReport,
  uDoorMemo,
  uFormFunction,
  uFormVariable,
  uFormDeviceState,
  uKTEmployee,
  uMain,
  uPCClient,
  uServerClientVariable,
  uTelEventRegist;

{$R *.dfm}

const
  AppBarHeight = 75;

procedure TfmMonitoringMain.AlarmConfirm;
begin

end;

procedure TfmMonitoringMain.AppBarResize;
begin
  AppBar.SetBounds(0, AppBar.Parent.Height - AppBarHeight,
    AppBar.Parent.Width, AppBarHeight);
end;

procedure TfmMonitoringMain.AppBarShow(mode: integer);
begin
  if mode = -1 then // Toggle
    mode := integer(not AppBar.Visible );

  if mode = 0 then
    AppBar.Visible := False
  else
  begin
    AppBar.Visible := True;
    AppBar.BringToFront;
  end;
end;

procedure TfmMonitoringMain.ArmAreaCurrentAlarmStateChange(aDecoderNo:integer;aNodeNo, aEcuID,
  aArmAreaNo, aAlarmState, aBuildingCode: string);
begin

end;

procedure TfmMonitoringMain.ArmAreaSecurityModeChange(aDecoderNo:integer;aNodeNo, aEcuID,
  aArmAreaNo, aMode, aBuildingCode: string);
begin

end;

procedure TfmMonitoringMain.btn_BuildingStateMonitoringClick(Sender: TObject);
begin

  //if fmBuildingDoorState = nil then fmBuildingDoorState := TfmBuildingDoorState.Create(nil);

  if Not L_bfmBuildingDoorStateShow then fmBuildingDoorState.Show
  else
  begin
    fmBuildingDoorState.BringToFront;
  end;
end;

procedure TfmMonitoringMain.btn_CardAddClick(Sender: TObject);
begin
  fmKTEmployee := TfmKTEmployee.Create(self);
  fmKTEmployee.ShowModal;
  fmKTEmployee.Free;
end;

procedure TfmMonitoringMain.btn_ChangeNodeIPCancelClick(Sender: TObject);
begin
  pan_ChangeNodeIP.Visible := False;
end;

procedure TfmMonitoringMain.btn_ChangeNodeIPSaveClick(Sender: TObject);
var
  stNodeNo : string;
  stNodeIP : string;
  stMessage : string;
begin
  stNodeIP := ed_ChangeNodeIp.Text;
  if Not IsIPTypeCheck(stNodeIP) then
  begin
    showmessage(stNodeIP + ':' + '������ Ÿ�� ���� �Դϴ�.');
    Exit;
  end;

  stNodeNo := lb_ChangeNodeIPNodeNo.Caption;

  if dmDBFunction.CheckTB_NODE_NodeIP(stNodeIP,stNodeNo) = 1 then
  begin
    stMessage := dmFormMessage.GetMessage('DBDATADUP');
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  if Not dmDBUpdate.UpdateTB_NODE_NodeIP(stNodeNo,stNodeIP,'','','') then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('DBSAVEERROR'),'$WORK',btn_ChangeNodeIPSave.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;
  pan_ChangeNodeIP.Visible := False;
end;

procedure TfmMonitoringMain.btn_ClientConfigClick(Sender: TObject);
begin
//  dmComPort.PortOpen := False;
  fmClientConfig := TfmClientConfig.create(self);
  fmClientConfig.ShowModal;
  fmClientConfig.Free;
  pm_CardMode.Visible := G_bCardModeShow ;
  pm_Line1.Visible := G_bCardModeShow;
  if G_nDoorStateUse = 1 then
  begin
    btn_BuildingStateMonitoring.Visible := True;
  end else
  begin
    btn_BuildingStateMonitoring.Visible := False;
  end;
  
end;

procedure TfmMonitoringMain.btn_DoorInfoConfirmClick(Sender: TObject);
begin
  pan_DoorInfo.Visible := False;
end;

procedure TfmMonitoringMain.btn_DoorMemoregClick(Sender: TObject);
var
  nNodeNo : integer;
  nDoorNo : integer;
begin
  if Not isDigit(lb_NodeNo.Caption) then Exit;
  if Not isDigit(lb_DoorNo.Caption) then Exit;

  fmDoorMemo := TfmDoorMemo.Create(nil);
  fmDoorMemo.NodeNo := strtoint(lb_NodeNo.Caption);
  fmDoorMemo.EcuID := lb_DeviceID.Caption;
  fmDoorMemo.DoorNo := strtoint(lb_DoorNo.Caption);
  fmDoorMemo.ed_DoorName.Text := lb_DoorName.Caption;
  fmDoorMemo.mem_doorMemo.Text := mem_DoorInfo.Text;
  fmDoorMemo.ShowModal;
  if fmDoorMemo.Save then
  begin
    mem_DoorInfo.Text := fmDoorMemo.mem_doorMemo.Text;
  end;
  fmDoorMemo.Free;
end;

procedure TfmMonitoringMain.btn_MessageConfirmClick(Sender: TObject);
begin
  pan_Alarm.Visible := False;
  if MediaPlayer1.Mode = mpPlaying then MediaPlayer1.Stop;
  SoundTimer.Enabled := False;
  MessageTimer.Enabled := False;
  AlarmSoundList.Clear;
  L_nAlarmSoundCount := 0;
end;

procedure TfmMonitoringMain.btn_SearchCancelClick(Sender: TObject);
begin
  pan_SearchName.Visible := False;
end;

procedure TfmMonitoringMain.btn_updateClick(Sender: TObject);
begin
  if Not FileExists(G_stExeFolder + '\GMS_AccessMonitoring_Update\SmartUpdate.exe') then
  begin
    showmessage('Not Install Update Tools');
    Exit;
  end;

  ShellExecute(0, 'open', pchar(G_stExeFolder + '\GMS_AccessMonitoring_Update\SmartUpdate.exe'),'','', SW_Normal);
  //MyRunDosCommand(G_stExeFolder + '\Bmos\SmartUpdate.exe',False,False);
  Close;
end;

procedure TfmMonitoringMain.BuildingAlarmStateChange(aBuildingCode: string;
  aAlarmState: integer);
begin

end;

procedure TfmMonitoringMain.BuildingDoorStateCountChange(aBuildingCode: string;
  aState, aCount: integer);
begin
  if L_bfmBuildingDoorStateShow then fmBuildingDoorState.BuildingDoorStateCountChange(aBuildingCode,aState, aCount);
  if L_stBuildingCode <> aBuildingCode then Exit;
  
end;

procedure TfmMonitoringMain.BuildingSecurityModeChange(aBuildingCode: string;
  aMode: integer);
begin

end;

procedure TfmMonitoringMain.Action1Execute(Sender: TObject);
begin
  AppBarShow(-1);
end;

function TfmMonitoringMain.CardPermitDoorAdd(aCardNO, aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
begin
  if Length(aCardNO) <> 16 then Exit;
  if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(aNodeNo,aEcuID,'0',aCardNO) = 1 then  //�̹� ���� �ϴ� ���
  begin
    dmDBUpdate.UpdateTB_CARDPERMIT_Field_StringValue(aNodeNo,aEcuID,'0',aCardNo,'CP_PERMIT','1');
    dmDBUpdate.UpdateTB_CARDPERMIT_Field_StringValue(aNodeNo,aEcuID,'0',aCardNo,'CP_DOOR' + aDoorNo,'1');
    dmDBUpdate.UpdateTB_CARDPERMIT_Field_StringValue(aNodeNo,aEcuID,'0',aCardNo,'CP_RCVACK','N');
  end else
  begin
    dmDBInsert.InsertIntoTB_CARDPERMIT_DoorPermit(aNodeNo,aEcuID,'0',aCardNo,aDoorNo);
  end;


end;

procedure TfmMonitoringMain.ChangeAccessEventIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelAccessEventIndexArray[FromIndex];
  if FromIndex > ToIndex then   //�ڿ� �ִ� ���� ������ ���� ���
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelAccessEventIndexArray[i] := L_arrRelAccessEventIndexArray[i - 1];
    end;
    L_arrRelAccessEventIndexArray[ToIndex] := nChangData;
  end else   //�տ� �ִ� ���� �ڷ� ���� ���
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelAccessEventIndexArray[i] := L_arrRelAccessEventIndexArray[i + 1];
    end;
    L_arrRelAccessEventIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelAccessEventIndexArray) to HIGH(L_arrRelAccessEventIndexArray) do
  begin
    L_arrAccessEventIndexArray[L_arrRelAccessEventIndexArray[i]] := i;
  end;

end;

procedure TfmMonitoringMain.ChangeAlarmEventIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelAlarmEventIndexArray[FromIndex];
  if FromIndex > ToIndex then   //�ڿ� �ִ� ���� ������ ���� ���
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelAlarmEventIndexArray[i] := L_arrRelAlarmEventIndexArray[i - 1];
    end;
    L_arrRelAlarmEventIndexArray[ToIndex] := nChangData;
  end else   //�տ� �ִ� ���� �ڷ� ���� ���
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelAlarmEventIndexArray[i] := L_arrRelAlarmEventIndexArray[i + 1];
    end;
    L_arrRelAlarmEventIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelAlarmEventIndexArray) to HIGH(L_arrRelAlarmEventIndexArray) do
  begin
    L_arrAlarmEventIndexArray[L_arrRelAlarmEventIndexArray[i]] := i;
  end;

end;

procedure TfmMonitoringMain.CloseButtonClick(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  if L_nFormDeep = 0 then
  begin
    Close;
  end else
  begin
    Img_PrevClick(Img_Prev);
    AppBarShow(0);
  end;
end;

procedure TfmMonitoringMain.CreateListGroup(ListView: TListView;
  aBuildingCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  oGroupItem : TListGroup;
  nGroupID : integer;
  i : integer;
begin
  //if L_nMonitoringGroup = 1 then ListView.GroupView := True
  //else ListView.GroupView := False;

  ListGroupBuildingCode.Clear;

  if ListView.Groups.Count > 0 then
  begin
    for i := ListView.Groups.Count - 1 downto 0 do
    begin
      ListView.Groups.Delete(i);
    end;
  end;
  stSql := dmDBSelect.SelectTB_BUILDINGCODE_Group(aBuildingCode);
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
      nGroupID := 0;
      while Not Eof do
      begin
        ListGroupBuildingCode.Add(FindField('BC_BUILDINGCODE').AsString);
        nGroupID := ListGroupBuildingCode.Count - 1;
        oGroupItem := ListView.Groups.Add;
        oGroupItem.Header := FindField('BC_BUILDINGNAME').AsString;
        oGroupItem.GroupID := nGroupID;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMonitoringMain.CreateServerImage;
var
  oImage : TImage;
  i : integer;
begin
  if ServerImageList.Count > 0 then
  begin
    for i := ServerImageList.Count - 1 downto 0 do
    begin
      TImage(ServerImageList.Objects[i]).Free;
    end;
    ServerImageList.Clear;
  end;
  if PCClientSocketList.Count < 1 then Exit;

  for i := 0 to PCClientSocketList.Count - 1 do
  begin
    oImage := TImage.Create(nil);
    oImage.Parent := pan_serverNet;
    oImage.Tag := TdmPCClient(PCClientSocketList.Objects[i]).DecoderNo;
    oImage.Hint := TdmPCClient(PCClientSocketList.Objects[i]).ServerName; //'Server NO' + inttostr(TdmPCClient(PCClientSocketList.Objects[i]).DecoderNo);
    oImage.Width := 32;
    oImage.Height := 32;
    oImage.OnDblClick := ServerDblClick;
    if TdmPCClient(PCClientSocketList.Objects[i]).Connected then  oImage.Picture := Img_ServerConnect1.Picture
    else oImage.Picture := Img_ServerDisconnect1.Picture;
    oImage.Visible := True;
    oImage.ShowHint := True;
    ServerImageList.AddObject(inttostr(TdmPCClient(PCClientSocketList.Objects[i]).DecoderNo),oImage);
  end;

  ServerImageTimer.Enabled := True;
end;

procedure TfmMonitoringMain.DeviceAlarmEvent(aDecoderNo:integer;aNodeNo, aECUID, aExtendID, aCmd,
  aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string; aRealTime: Boolean);
var
  nIndex : integer;
  stNodeIp : string;
  stDoorName : string;
  stViewCardNo : string;
  stViewEmName : string;
  stNodeNo : string;
begin
  if Not( (aAlarmStateCode = 'NF') or (aAlarmStateCode = 'NR') or (aAlarmStateCode = G_stLongTimeStateCode) ) then Exit;

  stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
  nIndex := PCClientSocketList.IndexOf(inttostr(aDecoderNo));
  if nIndex > -1 then
  begin
    stDoorName := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeDeviceToDoorName(stNodeNo,aEcuID,'1');
    stNodeIp := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeIP(stNodeNo);

    if stDoorName = '' then
    begin
      if Not G_bIsMaster then Exit; //�����Ͱ� �ƴϸ� ������ ���� ������.
      stDoorName := stNodeIp;
    end;
  end else
  begin
    Exit;
  end;
  if aAlarmSound = '1' then
  begin
    lb_Message.Caption.Text := aAlarmStatePCCodeName;
    MediaPlayer1.FileName := G_stExeFolder + '\..\sound\' + G_stAlarmEventAlaramFile;
    AlarmSoundList.Add(G_stExeFolder + '\..\sound\' + G_stAlarmEventAlaramFile);
    if G_bAccessAlarmEventSoundOnUse then SoundTimer.Enabled := True;
    if G_bAccessEventMessageUse then
    begin
      lb_Message.Visible := True;
      pan_Alarm.Visible := True;
      MessageTimer.Enabled := True;
    end;
  end;

  with sg_AlarmEvent do
  begin
    if Cells[L_arrAlarmEventIndexArray[0],1] <> '' then InsertRows(1,1);
    Cells[L_arrAlarmEventIndexArray[0],1] := MakeDatetimeStr(aTime);
    Cells[L_arrAlarmEventIndexArray[1],1] := stNodeIp;
    Cells[L_arrAlarmEventIndexArray[2],1] := aEcuID;
    Cells[L_arrAlarmEventIndexArray[3],1] := stDoorName;
    Cells[L_arrAlarmEventIndexArray[4],1] := aAlarmStatePCCodeName;
    Cells[L_arrAlarmEventIndexArray[5],1] := aNodeNo;

    RowColor[1] := strtoint(aAlarmColor);

    if RowCount > 1000 then RowCount := 1000;
  end;
end;

procedure TfmMonitoringMain.DeviceCardAccessEvent(aDecoderNo:integer;aTime,aNodeNo, aEcuID, aDoorNo,aReaderNo, aInOut,aInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,
                    aAccessPermitName,aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone:string);
var
  nIndex : integer;
  stDoorName : string;
  stViewCardNo : string;
  stViewEmName : string;
  stNodeNo : string;
begin
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
  nIndex := PCClientSocketList.IndexOf(inttostr(aDecoderNo));
  if nIndex > -1 then
  begin
    stDoorName := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeDeviceToDoorName(stNodeNo,aEcuID,aDoorNo);
  end;

  stViewEmName := aEmName;
  stViewCardNo := aCardNo;
  if aChangeState = 'P' then  //��ȭ ���� �� ���
  begin
    stViewCardNo := copy(stViewCardNo,1,8);
    stViewCardNo := inttostr(Hex2Dec(stViewCardNo));
    stViewEmName := '��ȭ����';
  end;

  with sg_AccessEvent do
  begin
    if Cells[L_arrAccessEventIndexArray[0],1] <> '' then InsertRows(1,1);
    Cells[L_arrAccessEventIndexArray[0],1] := MakeDatetimeStr(aTime);
    Cells[L_arrAccessEventIndexArray[1],1] := stDoorName;
    if aType = 'B' then
    begin
      stViewEmName := dmFormFunction.GetAccessControlTypeName(aChangeState[1]);
      Cells[L_arrAccessEventIndexArray[2],1] := stViewEmName;
      (*case aChangeState[1] of
        'R' : Cells[L_arrAccessEventIndexArray[2],1] := '��������';
        'P' : Cells[L_arrAccessEventIndexArray[2],1] := '��ȭ';
        'B' : Cells[L_arrAccessEventIndexArray[2],1] := '��ǹ�ư';
        'S' : Cells[L_arrAccessEventIndexArray[2],1] := '������';
        'F' : Cells[L_arrAccessEventIndexArray[2],1] := 'ȭ��߻�';
        'f' : Cells[L_arrAccessEventIndexArray[2],1] := '����ȭ��';
      end;
      *)
    end else Cells[L_arrAccessEventIndexArray[2],1] := stViewCardNo;
    Cells[L_arrAccessEventIndexArray[3],1] := aPrintNo;
    Cells[L_arrAccessEventIndexArray[4],1] := stViewEmName;
    Cells[L_arrAccessEventIndexArray[5],1] := aCompanyName;
    Cells[L_arrAccessEventIndexArray[6],1] := aEmCode;
    Cells[L_arrAccessEventIndexArray[7],1] := aHandPhone;
    Cells[L_arrAccessEventIndexArray[8],1] := aReaderNo;
    Cells[L_arrAccessEventIndexArray[9],1] := aInOutName;
    Cells[L_arrAccessEventIndexArray[10],1] := aAccessPermitName;
    Cells[L_arrAccessEventIndexArray[11],1] := aATButton;
    Cells[L_arrAccessEventIndexArray[12],1] := aChangeState;   //Ÿ��
    Cells[L_arrAccessEventIndexArray[13],1] := stNodeNo;   //����ȣ
    Cells[L_arrAccessEventIndexArray[14],1] := aEcuID;   //����ȣ
    Cells[L_arrAccessEventIndexArray[15],1] := aDoorNo;   //���Թ���ȣ
    Cells[L_arrAccessEventIndexArray[16],1] := aAccessResult[1];   //���Խ����ڵ�

    case aAccessResult[1] of
      '1','2' : begin  //���Խ���

      end;
      '3','4' : begin  //�������

      end;
      'A' : begin       //�̵�� ī��
        RowColor[1] := clFuchsia;
      end;
      'B' : begin       //�������� ���� �Ұ�
        RowColor[1] := clFuchsia;
      end;
      'C' : begin       //������� ���� �Ұ�
        RowColor[1] := clFuchsia;
      end;
      'D' : begin       //����� ���� �Ұ�
        RowColor[1] := clFuchsia;
      end;
      'E' : begin       //���� ���� �ð�
        RowColor[1] := clFuchsia;
      end;
      'F' : begin       //��ȿ�Ⱓ ����
        RowColor[1] := clFuchsia;
      end;
      'G' : begin       //����
        RowColor[1] := clYellow;
      end;
      'H' : begin       //��������ԺҰ�
        RowColor[1] := clFuchsia;
      end;
      'I' : begin       //�����ٸ�
        RowColor[1] := clFuchsia;
      end;
      'J' : begin       //��Ƽ�н� �Ұ�
        RowColor[1] := clFuchsia;
      end;
    end;

    if RowCount > 1000 then RowCount := 1000;

  end;
end;

procedure TfmMonitoringMain.DeviceChangeEvent(aDecoderNo:integer;aNodeNo, aEcuID, aType, aNo, aCmd,
  aData: string);
begin

end;

procedure TfmMonitoringMain.DisplayBuilding;
var
  i : integer;
  oGroupPanel : TGroupPanel;
  nCount : integer;
begin
  if L_nBuildingCount < 0 then Exit;
  L_nGroupHeigh := Image_a1.Picture.Height + con_LabelPanelHeigh;
  L_nGroupWidth := Image_a1.Picture.Width;
  nCount := 0;
  for i := 0 to G_MonitoringBuildingList.Count - 1 do
  begin
    if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).GetDoorCount > 0 then
    begin
      oGroupPanel := TGroupPanel.Create(nil);
      oGroupPanel.Parent := FlowPanel2;
      oGroupPanel.ParentBiDiMode := True;
      oGroupPanel.ParentBackground := True;
      oGroupPanel.ParentColor := True;
      oGroupPanel.ParentFont := True;
      oGroupPanel.BevelOuter := bvNone;
      oGroupPanel.OnGroupPanelClick := GroupPanelClick;
      oGroupPanel.OnGroupPanelMouseEnter := GroupPanelMouseEnter;
      oGroupPanel.OnGroupPanelMouseLeave := GroupPanelMouseLeave;
      oGroupPanel.BuildingCode := G_MonitoringBuildingList.Strings[i];
      oGroupPanel.BuildingName := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingName;
      oGroupPanel.Tag := i mod 5 + 1;
      oGroupPanel.Image := GetDisableImage(oGroupPanel.Tag);
      oGroupPanel.Height := L_nGroupHeigh;
      oGroupPanel.Width := Image_a1.Picture.Width;
      inc(nCount);
    end;
  end;

  //if nCount = 1 then
  begin
    GroupPanelClick(oGroupPanel,'0');
  end;

end;

procedure TfmMonitoringMain.DoorChangeEvent(aDecoderNo:integer;aNodeNo, aEcuID, aType, aNo, aCmd,
  aData, aBuildingCode: string);
var
  stDoorID : string;
  nIndex : Integer;
  stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent : string;
  nImageIndex : integer;
begin
  stDoorID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aNo;
  nIndex := ViewDoorList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  if Not TMonitoringBuildingState(G_MonitoringBuildingList.Objects[0]).GetDoorCurrentState(aDecoderNo,aNodeNo,aEcuID,aNo,stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then Exit;
  nImageIndex := GetDoorManageModeImageIndex(stDoorCardMode,stDoorManageMode);
  DoorListView.Items[nIndex].StateIndex := nImageIndex;
  nImageIndex := GetDoorStateImageIndex(stDoorDSState,stDoorLSState,stDoorFireEvent);
  DoorListView.Items[nIndex].ImageIndex := nImageIndex;
  //DoorListView.Refresh;
end;

procedure TfmMonitoringMain.doorListViewResize(Sender: TObject);
var
  oldViewStyle : TViewStyle;
begin
  if Not L_bListRefresh then Exit;
  L_bListRefresh := False;

  oldViewStyle := doorListView.ViewStyle;
  doorListView.ViewStyle := vsSmallICon;
  doorListView.Refresh;
  doorListView.ViewStyle := oldViewStyle;
  doorListView.Refresh;
end;

procedure TfmMonitoringMain.doorListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  stLockType : string;
  bJavaraType : Boolean;
begin
  Try
    if Selected then
    begin
        stLockType := TListView(Sender).Selected.SubItems.Strings[1];
        popupMenu := pm_DoorControl;
        if stLockType = '10' then
        begin
          bJavaraType := True;
        end else
        begin
          bJavaraType := False;
        end;
        pm_JavarOpen.Visible := bJavaraType;
        pm_JavarClose.Visible := bJavaraType;
        mn_DoorOpen.Visible := Not bJavaraType;
        N9.Visible := Not bJavaraType;
        pm_DoorManageMode.Visible := Not bJavaraType;
        pm_DooOpenMode.Visible := Not bJavaraType;
        pm_DoorCloseMode.Visible := Not bJavaraType;
    end else popupMenu := nil;
  Except
    showmessage('doorListViewSelectItem Error');
  End;
end;

procedure TfmMonitoringMain.ed_SearchNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if sg_SearchNameGrid.Visible then sg_SearchNameGrid.SetFocus;
  end;
end;

procedure TfmMonitoringMain.ed_SearchNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ed_SearchName.Text = '' then pan_SearchName.Visible := False
  else
  begin
    pan_SearchName.Visible := True;
    sg_SearchNameGrid.Visible := SearchDoorNameList(sg_SearchNameGrid,L_stBuildingCode,ed_SearchName.Text);
  end;


end;

procedure TfmMonitoringMain.FlowPanel1Resize(Sender: TObject);
begin
//  Scrollbox2.VertScrollBar.Range := FlowPanel1.Height;
//  Scrollbox2.HorzScrollBar.Range := FlowPanel1.Width;
end;

procedure TfmMonitoringMain.FormActivate(Sender: TObject);
begin
  //BorderStyle := TFormBorderStyle(bsNone);
  if L_bFormActive then Exit;
  if L_nWindowState = 0 then WindowState := wsNormal
  else WindowState := wsMaximized;
  BorderStyle := bsSizeable;
//  GroupPanel1.Align := alNone;
//  Refresh;
//  GroupPanel1.Align := alTop;
//  Refresh;
  L_bFormActive := True;
  BringToFront;
  DisplayBuilding;
  fmLogin.ServerConnectTimer.Enabled := True;
end;

procedure TfmMonitoringMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i : integer;
  ini_fun : TiniFile;
begin
  AlarmPlayStop := True;
  G_bApplicationTerminate := True;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringMain.INI');
    Try
      with ini_fun do
      begin
        WriteInteger('Form','Width',Width);
        WriteInteger('Form','Height',Height);
        WriteInteger('Form','Left',Left);
        WriteInteger('Form','Top',Top);
        if WindowState = wsMaximized then WriteInteger('Form','Maximized',1)
        else WriteInteger('Form','Maximized',0);

        WriteInteger('Monitoring','Height',pan_Monitoring.Height);

        for i := LOW(L_arrAccessEventIndexArray) to HIGH(L_arrAccessEventIndexArray) do
        begin
          WriteInteger('LIST','AccessEventIndexArray'+inttostr(i),L_arrAccessEventIndexArray[i]);
        end;
        for i := LOW(L_arrRelAccessEventIndexArray) to HIGH(L_arrRelAccessEventIndexArray) do
        begin
          WriteInteger('LIST','RelAccessEventIndexArray'+inttostr(i),L_arrRelAccessEventIndexArray[i]);
        end;
        for i := 0 to sg_AccessEvent.ColCount - 1 do
        begin
          if i > HIGH(L_arrAccessEventSizeTable) then break;

          L_arrAccessEventSizeTable[i] := sg_AccessEvent.ColWidths[i];
          WriteInteger('LIST','RelAccessEventSizeArray' + inttostr(i),sg_AccessEvent.ColWidths[i]);
        end;

        for i := LOW(L_arrAlarmEventIndexArray) to HIGH(L_arrAlarmEventIndexArray) do
        begin
          WriteInteger('LIST','AlarmEventIndexArray'+inttostr(i),L_arrAlarmEventIndexArray[i]);
        end;
        for i := LOW(L_arrRelAlarmEventIndexArray) to HIGH(L_arrRelAlarmEventIndexArray) do
        begin
          WriteInteger('LIST','RelAlarmEventIndexArray'+inttostr(i),L_arrRelAlarmEventIndexArray[i]);
        end;
        for i := 0 to sg_AlarmEvent.ColCount - 1 do
        begin
          if i > HIGH(L_arrAlarmEventSizeTable) then break;

          L_arrAlarmEventSizeTable[i] := sg_AlarmEvent.ColWidths[i];
          WriteInteger('LIST','RelAlarmEventSizeArray' + inttostr(i),sg_AlarmEvent.ColWidths[i]);
        end;
      end;
    Except
      Exit;
    End;
  Finally
    ini_fun.Free;
  End;
  ViewDoorList.Clear;
  ViewDoorList.Free;
  AccessEventHeaderNameList.Free;
  AlarmEventHeaderNameList.Free;
  if AlarmSoundList <> nil then
  begin
    AlarmSoundList.Free;
    AlarmSoundList := nil;
  end;
  BuildingDoorList.Free;
  ListGroupBuildingCode.Free;

  if ServerImageList.Count > 0 then
  begin
    for i := ServerImageList.Count - 1 downto 0 do
        TImage(ServerImageList.Objects[i]).Free;
  end;
  ServerImageList.Free;

  ServerImageTimer.Enabled := False;

  Application.Terminate;
end;

procedure TfmMonitoringMain.FormCreate(Sender: TObject);
begin
  AccessEventHeaderNameList := TStringList.Create;
  AlarmEventHeaderNameList := TStringList.Create;
  AlarmSoundList := TStringList.Create;
  BuildingDoorList := TStringList.Create;
  ListGroupBuildingCode := TStringList.Create;
  ServerImageList := TStringList.Create;
  ViewDoorList := TStringList.Create;

  L_stTitle := '�бⱹ�� ����͸� �ý���';
  L_nFormDeep := 0;
end;

procedure TfmMonitoringMain.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  AppBarShow(0);
end;

procedure TfmMonitoringMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    AppBarShow(-1)
  else
  begin
    AppBarShow(0);
    if (Shift = [ssCtrl]) and ((Key = 70) or (Key = 102)) then    //CTRL + F
    begin
      if L_nFormDeep = 1 then
      begin
        //showmessage('CTRL+F');
        //pan_SearchName.Visible := True;
        //ed_SearchName.Text := '';
        //ed_SearchName.SetFocus;
      end;
    end;
  end;
end;

procedure TfmMonitoringMain.FormResize(Sender: TObject);
begin
  AppBarResize;

  DoorListView.Left := 10;
  DoorListView.Top := pan_ServerState.Height + 10;

  pan_DoorInfo.Top := DoorListView.Top + (DoorListView.Height div 2) - (pan_DoorInfo.Height div 2);
  pan_DoorInfo.Left := DoorListView.Left + (DoorListView.Width div 2) - (pan_DoorInfo.Width div 2);
  pan_SearchName.Top := pan_Monitoring.Top + pan_ServerState.Height;
  pan_SearchName.Left := Pan_Search.Left;
  pan_ChangeNodeIP.Top := DoorListView.Top + (DoorListView.Height div 2) - (pan_ChangeNodeIP.Height div 2);
  pan_ChangeNodeIP.Left := DoorListView.Left + (DoorListView.Width div 2) - (pan_ChangeNodeIP.Width div 2);

  pan_Alarm.Left := (Width div 2) - (pan_Alarm.Width div 2);
  pan_Alarm.Top := (Height div 2) - (pan_Alarm.Height div 2);
  pan_Loading.Left := (Width div 2) - (pan_Loading.Width div 2);
  pan_Loading.Top := (Height div 2) - (pan_Loading.Height div 2);

  //gb_DoorState.Top := pan_Monitoring.Height;
  gb_DoorState.Left := width - gb_DoorState.Width - 10;
  if (DoorListView.Width <> pan_Monitoring.Width - 20) or (DoorListView.Height <> pan_Monitoring.Height - pan_ServerState.Height - 20) then
  begin
    DoorListView.Width := pan_Monitoring.Width - 20;
    DoorListView.Height := pan_Monitoring.Height - pan_ServerState.Height - 20;
    doorListViewResize(doorListView);
  end;
end;

procedure TfmMonitoringMain.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  Img_Prev.Visible := False;
  lb_Title.Left := Img_Prev.Left;
  WindowState := wsNormal;
//  ReleaseCapture;
//  Perform( WM_SYSCOMMAND, $F012, 0 );
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringMain.INI');
    L_nMonitoringGroup := ini_fun.ReadInteger('Monitoring','Group',1);
    Width :=   ini_fun.ReadInteger('Form','Width',1024);
    Height :=   ini_fun.ReadInteger('Form','Height',768);
    Left :=   ini_fun.ReadInteger('Form','Left',0);
    Top :=    ini_fun.ReadInteger('Form','Top',0);
    L_nWindowState := ini_fun.ReadInteger('Form','Maximized',1);
    L_stTitle := ini_fun.ReadString('Monitoring','Caption','�бⱹ�� ����͸� �ý���');
    if ini_fun.ReadInteger('Debug','visible',0) = 1 then G_bDebug := True
    else G_bDebug := False;
    mn_displaytest.visible := G_bDebug;
    mn_buffercount.Visible := G_bDebug;
    L_nViewListStyle := 0;
    if ini_fun.ReadString('MONITOR','ViewStyle','VSICON') = 'VSLIST' then
    begin
      DoorListView.ViewStyle := vsList;
      L_nViewListStyle := 1;
    end else
    begin
      DoorListView.ViewStyle := vsIcon;
      L_nViewListStyle := 0;
    end;

    pan_Monitoring.Height := ini_fun.ReadInteger('Monitoring','Height',536);
  Finally
    ini_fun.Free;
  End;

  lb_Title.Caption := L_stTitle;
  ListHeaderNameGet;  //���� ���� �� ��...

  SetLength(L_arrAccessEventIndexArray,AccessEventHeaderNameList.Count);
  SetLength(L_arrRelAccessEventIndexArray,AccessEventHeaderNameList.Count);
  SetLength(L_arrAccessEventShowTable,AccessEventHeaderNameList.Count);
  SetLength(L_arrAccessEventSizeTable,AccessEventHeaderNameList.Count);

  SetLength(L_arrAlarmEventIndexArray,AlarmEventHeaderNameList.Count);
  SetLength(L_arrRelAlarmEventIndexArray,AlarmEventHeaderNameList.Count);
  SetLength(L_arrAlarmEventShowTable,AlarmEventHeaderNameList.Count);
  SetLength(L_arrAlarmEventSizeTable,AlarmEventHeaderNameList.Count);

  ListConfigRead;
  ListHeaderNameSetting;
  ListCellSize;

  L_nBuildingCount := 0;
  for i := 0 to G_MonitoringBuildingList.count - 1 do
  begin
    if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).GetDoorCount > 0 then inc(L_nBuildingCount)
  end;
  CreateServerImage;
  dmFormFunction.GridInitialize(sg_AccessEvent);
  dmFormFunction.GridInit(sg_AlarmEvent,HIGH(L_arrAlarmEventSizeTable));
  PageControl1.ActivePage := tab_Access;
  ScrollBox2Resize(ScrollBox2);
  pan_buildingResize(pan_building);

  pm_CardMode.Visible := G_bCardModeShow ;
  pm_Line1.Visible := G_bCardModeShow;

  if G_nDoorStateUse = 1 then
  begin
    btn_BuildingStateMonitoring.Visible := True;
  end else
  begin
    btn_BuildingStateMonitoring.Visible := False;
  end;
end;

function TfmMonitoringMain.GetDisableImage(aNo: integer): TImage;
var
  Loop : Integer;
  stName : string;
begin
  For Loop:=0 to panImage.ControlCount - 1 do
  begin
    stName := panImage.Controls[Loop].Name;
    if Uppercase(stName) = Uppercase('Image_d') + inttostr(aNo) then
    begin
        result := TImage(panImage.Controls[Loop]);
        break;
    end;
  end;
end;

function TfmMonitoringMain.GetDoorManageModeImageIndex(aDoorCardMode,
  aDoorManageMode: string): integer;
begin
  result := -1;
  if aDoorCardMode = '' then Exit;
  if aDoorManageMode = '' then Exit;
  case aDoorManageMode[1] of
    '0' : begin       //�
      case aDoorCardMode[1] of
        '0' : result := con_DoorStatePosiManageMode;
        '1' : result := con_DoorStateNegaManageMode;
        else result := -1;
      end;
    end;
    '1' : begin      //����
      case aDoorCardMode[1] of
        '0' : result := con_DoorStatePosiOpenMode;
        '1' : result := con_DoorStateNegaOpenMode;
        else result := -1;
      end;
    end;
    '2' : begin      //���
      case aDoorCardMode[1] of
        '0' : result := con_DoorStatePosiCloseMode;
        '1' : result := con_DoorStateNegaCloseMode;
        else result := -1;
      end;
    end;
    else begin
      result := -1;
    end;
  end;
end;

function TfmMonitoringMain.GetDoorStateImageIndex(aDoorDSState, aDoorLSState,
  aDoorFireEvent: string): integer;
begin
  result := con_DoorImageNothing;
  if aDoorFireEvent = '1' then
  begin
    result := con_DoorImageFire;
    Exit;
  end;
  if aDoorDSState = '' then Exit;
  case aDoorDSState[1] of
    'C': //����
      begin
        result := con_DoorImageClose;
      end;
    'O': //����
      begin
        result := con_DoorImageOpen;
      end;
    'E': //����
      begin
        //result := ;
      end;
    'T','D'://��ð� ����
      begin
        result := con_DoorImageLongTime;
      end;
    'U':    //�����̻�
      begin
        result := con_DoorImageClose;
      end;
    'L':    //�����̻�
      begin
        result := con_DoorImageOpen;
      end;
  end;
end;

function TfmMonitoringMain.GetEnableImage(aNo: integer): TImage;
var
  Loop : Integer;
  stName : string;
begin
  For Loop:=0 to panImage.ControlCount - 1 do
  begin
    stName := panImage.Controls[Loop].Name;
    if Uppercase(stName) = Uppercase('Image_a') + inttostr(aNo) then
    begin
        result := TImage(panImage.Controls[Loop]);
        break;
    end;
  end;
end;

procedure TfmMonitoringMain.GroupPanel1_1Click(Sender: TObject);
begin
  lb_Title.Caption := TPanel(TControl(Sender).Parent).Caption;
  ScrollBox2.Visible := False;
  Img_Prev.Visible := True;
  lb_Title.Left := Img_Prev.Left + Img_Prev.Width + 10;
  L_nFormDeep := 1;
  DoorListView.Visible := True;
  pan_MonitoringResize(pan_Monitoring);

end;

procedure TfmMonitoringMain.GroupPanelClick(Sender: TObject;
  aBuildingCode: string);
var
  nIndex : integer;
begin
  Try
    ScrollBox2.Visible := False;
    Img_Prev.Visible := True;
    lb_Title.Left := Img_Prev.Left + Img_Prev.Width + 10;
    L_nFormDeep := 1;
    DoorListView.Visible := True;
    pan_building.Visible := True;
    Splitter1.Visible := True;

(*    nIndex := G_MonitoringBuildingList.IndexOf(aBuildingCode);
    if nIndex > -1 then
    begin
      lb_Title.Caption := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).BuildingName;
    end;
*)
    LoadBuildingTreeView(aBuildingCode,tv_BuildingList,tv_BuildingCode,0,aBuildingCode);
    tv_BuildingListClick(tv_BuildingList);
  Except
    showmessage('GroupPanelClick Error');
  End;

end;

procedure TfmMonitoringMain.GroupPanelMouseEnter(Sender: TObject;
  aBuildingCode: string);
begin
  TGroupPanel(Sender).Image :=  GetEnableImage(TGroupPanel(Sender).Tag);
end;

procedure TfmMonitoringMain.GroupPanelMouseLeave(Sender: TObject;
  aBuildingCode: string);
begin
  TGroupPanel(Sender).Image :=  GetDisableImage(TGroupPanel(Sender).Tag);
end;

procedure TfmMonitoringMain.Image1MouseEnter(Sender: TObject);
begin
  TImage(Sender).Picture := TImage(GetEnableImage(TImage(Sender).tag)).Picture;
end;

procedure TfmMonitoringMain.Image1MouseLeave(Sender: TObject);
begin
  TImage(Sender).Picture := TImage(GetDisableImage(TImage(Sender).tag)).Picture;
end;

procedure TfmMonitoringMain.Image2DblClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfmMonitoringMain.Image2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfmMonitoringMain.Img_PrevClick(Sender: TObject);
begin
  L_stBuildingCode := '';
  DoorListView.Visible := False;
  pan_building.Visible := False;
  Splitter1.Visible := False;
  Img_Prev.Visible := False;
  lb_Title.Left := Img_Prev.Left;
  lb_Title.Caption := L_stTitle;
  ScrollBox2.Visible := True;
  pan_DoorInfo.Visible := False;
  L_nFormDeep := 0;
end;

procedure TfmMonitoringMain.lb_BuildingDoorOpenCountDblClick(Sender: TObject);
begin
  pm_NetworkFailListClick(pm_DoorOpenList);
end;

procedure TfmMonitoringMain.lb_BuildingDoorOpenCountMouseEnter(Sender: TObject);
begin
  pm_DoorOpenList.Visible := True;
  pm_DoorLongTimeOpenList.Visible := False;
  pm_NetworkFailList.Visible := False;
end;

procedure TfmMonitoringMain.lb_BuildingDoorOpenCountMouseLeave(Sender: TObject);
begin
//  pm_DoorOpenList.Visible := False;
end;

procedure TfmMonitoringMain.lb_BuildingLongTimeCountDblClick(Sender: TObject);
begin
  pm_NetworkFailListClick(pm_DoorLongTimeOpenList);
end;

procedure TfmMonitoringMain.lb_BuildingLongTimeCountMouseEnter(Sender: TObject);
begin
  pm_DoorOpenList.Visible := False;
  pm_DoorLongTimeOpenList.Visible := True;
  pm_NetworkFailList.Visible := False;
end;

procedure TfmMonitoringMain.lb_BuildingLongTimeCountMouseLeave(Sender: TObject);
begin
//  pm_DoorLongTimeOpenList.Visible := False;
end;

procedure TfmMonitoringMain.lb_BuildingNFCountDblClick(Sender: TObject);
begin
  pm_NetworkFailListClick(pm_NetworkFailList);//
end;

procedure TfmMonitoringMain.lb_BuildingNFCountMouseEnter(Sender: TObject);
begin
  pm_DoorOpenList.Visible := False;
  pm_DoorLongTimeOpenList.Visible := False;
  pm_NetworkFailList.Visible := True;
end;

procedure TfmMonitoringMain.lb_BuildingNFCountMouseLeave(Sender: TObject);
begin
//  pm_NetworkFailList.Visible := False;
end;

function TfmMonitoringMain.ListCellSize: Boolean;
var
  i : integer;
begin
  for i := 0 to sg_AccessEvent.ColCount - 1 do
  begin
    if L_arrAccessEventShowTable[i] = 0 then
    begin
      sg_AccessEvent.ColWidths[L_arrAccessEventIndexArray[i]] := 0;
    end else
    begin
      if L_arrAccessEventSizeTable[L_arrAccessEventIndexArray[i]] <> 0 then sg_AccessEvent.ColWidths[L_arrAccessEventIndexArray[i]] := L_arrAccessEventSizeTable[L_arrAccessEventIndexArray[i]]
      else sg_AccessEvent.ColWidths[L_arrAccessEventIndexArray[i]] := 150;
    end;
  end;
  for i := 0 to sg_AlarmEvent.ColCount - 1 do
  begin
    if i > HIGH(L_arrAlarmEventSizeTable) then
    begin
      sg_AlarmEvent.ColWidths[i] := 0;
    end else if L_arrAlarmEventShowTable[i] = 0 then
    begin
      sg_AlarmEvent.ColWidths[L_arrAlarmEventIndexArray[i]] := 0;
    end else
    begin
      if L_arrAlarmEventSizeTable[L_arrAlarmEventIndexArray[i]] <> 0 then sg_AlarmEvent.ColWidths[L_arrAlarmEventIndexArray[i]] := L_arrAlarmEventSizeTable[L_arrAlarmEventIndexArray[i]]
      else sg_AlarmEvent.ColWidths[L_arrAlarmEventIndexArray[i]] := 150;
    end;
  end;
end;

function TfmMonitoringMain.ListConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nAccessEventShowCount := 0;
  L_nAlarmEventShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringMain.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrAccessEventIndexArray) to HIGH(L_arrAccessEventIndexArray) do
      begin
        L_arrAccessEventIndexArray[i] := ReadInteger('LIST','AccessEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelAccessEventIndexArray) to HIGH(L_arrRelAccessEventIndexArray) do
      begin
        L_arrRelAccessEventIndexArray[i] := ReadInteger('LIST','RelAccessEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrAccessEventShowTable) to HIGH(L_arrAccessEventShowTable) do
      begin
        if i < 12 then L_arrAccessEventShowTable[i] := ReadInteger('LIST','RelAccessEventShowArray'+inttostr(i),1)
        else L_arrAccessEventShowTable[i] := 0;
        L_nAccessEventShowCount := L_nAccessEventShowCount + L_arrAccessEventShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrAccessEventSizeTable) to HIGH(L_arrAccessEventSizeTable) do
      begin
        L_arrAccessEventSizeTable[i] := ReadInteger('LIST','RelAccessEventSizeArray'+inttostr(i),nSize);
      end;

      for i := LOW(L_arrAlarmEventIndexArray) to HIGH(L_arrAlarmEventIndexArray) do
      begin
        L_arrAlarmEventIndexArray[i] := ReadInteger('LIST','AlarmEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelAlarmEventIndexArray) to HIGH(L_arrRelAlarmEventIndexArray) do
      begin
        L_arrRelAlarmEventIndexArray[i] := ReadInteger('LIST','RelAlarmEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrAlarmEventShowTable) to HIGH(L_arrAlarmEventShowTable) do
      begin
        if i <= 5 then L_arrAlarmEventShowTable[i] := ReadInteger('LIST','RelAlarmEventShowArray'+inttostr(i),1)
        else L_arrAlarmEventShowTable[i] := 0;
        L_nAlarmEventShowCount := L_nAlarmEventShowCount + L_arrAlarmEventShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrAlarmEventSizeTable) to HIGH(L_arrAlarmEventSizeTable) do
      begin
        L_arrAlarmEventSizeTable[i] := ReadInteger('LIST','RelAlarmEventSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;
end;

function TfmMonitoringMain.ListHeaderNameGet: Boolean;
begin
  if AccessEventHeaderNameList = nil then AccessEventHeaderNameList := TStringList.Create;
  if AlarmEventHeaderNameList = nil then AlarmEventHeaderNameList := TStringList.Create;


  AccessEventHeaderNameList.Clear;
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONACCESSTIME'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDOOR'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER'));
  AccessEventHeaderNameList.Add('�Ϸù�ȣ');
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANY'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONREADER'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONREADERPOSI'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONACCESSPERMITNAME'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUTTON'));
  AccessEventHeaderNameList.Add('����Ÿ���ڵ�');
  AccessEventHeaderNameList.Add('����ȣ');
  AccessEventHeaderNameList.Add('����ȣ');
  AccessEventHeaderNameList.Add('�����ȣ');
  AccessEventHeaderNameList.Add('���Խ����ڵ�');

  AlarmEventHeaderNameList.Clear;
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODEIP01'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCONTROLERID'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDOORNAME'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCONTENT'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODENO'));    //����ȣ

  result := True;
end;

function TfmMonitoringMain.ListHeaderNameSetting: Boolean;
var
  i : integer;
begin
  sg_AccessEvent.ColCount := AccessEventHeaderNameList.Count;
  for i := LOW(L_arrAccessEventIndexArray) to HIGH(L_arrAccessEventIndexArray) do
  begin
    if (sg_AccessEvent.ColCount - 1) < i then Exit;
    if (AccessEventHeaderNameList.Count - 1) < i then Exit;

    sg_AccessEvent.cells[L_arrAccessEventIndexArray[i],0] := AccessEventHeaderNameList[i];
  end;

  //sg_AlarmEvent.ColCount := AlarmEventHeaderNameList.Count;
  for i := LOW(L_arrAlarmEventIndexArray) to HIGH(L_arrAlarmEventIndexArray) do
  begin
    if (sg_AlarmEvent.ColCount - 1) < i then Exit;
    if (AlarmEventHeaderNameList.Count - 1) < i then Exit;

    sg_AlarmEvent.cells[L_arrAlarmEventIndexArray[i],0] := AlarmEventHeaderNameList[i];
  end;
end;

function TfmMonitoringMain.LoadBuildingDoor(aBuildingCode: string): Boolean;
var
//  nIndex : integer;
  i : integer;
  nDecoderNo : integer;
  nBuildingDoorCount : integer;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDoorName : string;
  nDoorIndex : integer;
  stDoorLockType : string;
  stDoorCardMode : string;
  stDoorManageMode : string;
  stDoorDSState : string;
  stDoorLSState : string;
  stDoorFireEvent : string;
  stDoorLongTimeEvent : string;
  nImageIndex : integer;
  ini_fun : TiniFile;
  nGroupID : integer;
  nBuildingStep : integer;
  TempAdoQuery : TAdoQuery;
  stSql : string;
begin
  result := False;
  if L_stBuildingCode = aBuildingCode then Exit;

  tv_BuildingList.Enabled := False;
  L_stBuildingCode := aBuildingCode;
  doorListView.Clear;
  ViewDoorList.Clear;

  nBuildingStep := length(aBuildingCode) div G_nBuildingCodeLength;

  //�׷��� ��������.
  CreateListGroup(doorListView,aBuildingCode);

  BuildingDoorList.Clear;

  if G_bIsMaster then stSql := dmDBSelect.SelectTB_DOOR_MasterAll(aBuildingCode,True)
  else
  begin
    if G_nAdminBuildingType = 0 then stSql := dmDBSelect.SelectTB_DOOR_AdminBuilding(G_stAdminUserID,aBuildingCode,True)
    else stSql := dmDBSelect.SelectTB_DOOR_AdminDoor(G_stAdminUserID,aBuildingCode,True);
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
      pan_Loading.Visible := True;
      nDoorIndex := 0;
      ProgressBar1.Max := Recordcount;
      ProgressBar1.Position := nDoorIndex;
      while Not Eof do
      begin
        stDecoderNo := FillZeroNumber(FindField('ND_DECODERNO').AsInteger,G_nDecoderCodeLength);
        stNodeNo := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength);
        stEcuID := FindField('DE_ECUID').AsString;
        stDoorNo := FindField('DO_DOORNO').AsString;
        stDoorLockType := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[0]).GetDoorNoLockType(stDecoderNo,FindField('ND_NODENO').AsString,stEcuID,stDoorNo);
        if stDoorLockType = '11' then  continue; //�ڹٶ� - ���� Ÿ���̸� ���Թ��� ǥ�� ���� ����
        if Not TMonitoringBuildingState(G_MonitoringBuildingList.Objects[0]).GetDoorNoCurrentState(stDecoderNo,FindField('ND_NODENO').AsString,stEcuID,stDoorNo,
                                                                             stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then continue;
        DoorListView.Items.Add.Caption:= FindField('DO_DOORNAME').AsString;
        nGroupID := ListGroupBuildingCode.IndexOf(copy(FindField('BC_BUILDINGCODE').AsString,1,1 + G_nBuildingCodeLength * (nBuildingStep + 1)));
        DoorListView.Items[nDoorIndex].GroupID := nGroupID;
        DoorListView.Items[nDoorIndex].SubItems.Add(stDecoderNo + stNodeNo + stEcuID + stDoorNo);
        ViewDoorList.Add(stDecoderNo + stNodeNo + stEcuID + stDoorNo);
        DoorListView.Items[nDoorIndex].SubItems.Add(stDoorLockType);               //��Ÿ�� Ȯ���ؼ� �ڹٶ��̸� �ڹٶ� ����/�������� ���� �ϵ���
        nImageIndex := GetDoorManageModeImageIndex(stDoorCardMode,stDoorManageMode);
        DoorListView.Items[nDoorIndex].StateIndex := nImageIndex;
        nImageIndex := GetDoorStateImageIndex(stDoorDSState,stDoorLSState,stDoorFireEvent);
        DoorListView.Items[nDoorIndex].ImageIndex := nImageIndex;
        BuildingDoorList.Add(stDecoderNo + stNodeNo + stEcuID + stDoorNo);
        nDoorIndex := nDoorIndex + 1;
        ProgressBar1.Position := nDoorIndex;
        lb_Count.Caption.Text := inttostr(nDoorIndex) + '/' + inttostr(RecordCount);
        Application.ProcessMessages;
        Next;
      end;
      pan_Loading.Visible := False;
    end;
  Finally
    tv_BuildingList.Enabled := True;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
(*
    nIndex := G_MonitoringBuildingList.IndexOf(aBuildingCode);
    if nIndex < 0 then Exit;
    nDoorIndex := 0;
    nBuildingDoorCount := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorCount; 
    lb_BuildingDoorCount.Caption.Text := inttostr(nBuildingDoorCount);
    lb_BuildingNFCount.Caption.Text := inttostr(TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).NetWorkFailCount); 
    lb_BuildingDoorOpenCount.Caption.Text := inttostr(TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).DoorOpenCount);
    lb_BuildingLongTimeCount.Caption.Text := inttostr(TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).DoorLongOpenCount); 
    for i := 0 to nBuildingDoorCount - 1 do
    begin
      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexDevieInfo(i,nDecoderNo,stNodeNo,stEcuID,stDoorNo,stDoorName) then
      begin
        stDecoderNo := FillZeroNumber(nDecoderNo,G_nDecoderCodeLength);
        stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
        stDoorLockType := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexLockType(i);
        if stDoorLockType = '11' then  continue; //�ڹٶ� - ���� Ÿ���̸� ���Թ��� ǥ�� ���� ����
        if Not TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexCurrentState(i,stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then continue;
        DoorListView.Items.Add.Caption:= stDoorName;
        nGroupID := ListGroupBuildingCode.IndexOf(copy(TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexFullBuildingCode(i),1,1 + G_nBuildingCodeLength * (G_nBuildingStep + 1)));
        DoorListView.Items[nDoorIndex].GroupID := nGroupID;
        DoorListView.Items[nDoorIndex].SubItems.Add(stDecoderNo + stNodeNo + stEcuID + stDoorNo);
        DoorListView.Items[nDoorIndex].SubItems.Add(stDoorLockType);               //��Ÿ�� Ȯ���ؼ� �ڹٶ��̸� �ڹٶ� ����/�������� ���� �ϵ���
        nImageIndex := GetDoorManageModeImageIndex(stDoorCardMode,stDoorManageMode);
        DoorListView.Items[nDoorIndex].StateIndex := nImageIndex;
        nImageIndex := GetDoorStateImageIndex(stDoorDSState,stDoorLSState,stDoorFireEvent);
        DoorListView.Items[nDoorIndex].ImageIndex := nImageIndex;
        BuildingDoorList.Add(stDecoderNo + stNodeNo + stEcuID + stDoorNo);
        nDoorIndex := nDoorIndex + 1;
      end;
    end;
    result := True;
  Except
    Exit;
  End;
  *)

end;

procedure TfmMonitoringMain.MediaPlayer1Notify(Sender: TObject);
begin
  if (MediaPlayer1.NotifyValue = nvSuccessful) then AlarmPlayStop := True;
  if (MediaPlayer1.Mode = mpStopped) then AlarmPlayStop := True;
end;

procedure TfmMonitoringMain.MessageTimerTimer(Sender: TObject);
begin
  lb_Message.Visible := Not lb_Message.Visible;
//  lb_AccessMessage.Visible := Not lb_AccessMessage.Visible;
end;

procedure TfmMonitoringMain.MetropolisUIBlack1Click(Sender: TObject);
begin
  fmLogin.SetStyle('Metropolis UI Black');
end;

procedure TfmMonitoringMain.MetropolisUIBlue1Click(Sender: TObject);
begin
  fmLogin.SetStyle('Metropolis UI Blue');
end;

procedure TfmMonitoringMain.MetropolisUIDark1Click(Sender: TObject);
begin
  fmLogin.SetStyle('Metropolis UI Dark');
end;

procedure TfmMonitoringMain.MetropolisUIGreen1Click(Sender: TObject);
begin
  fmLogin.SetStyle('Metropolis UI Green');
end;

procedure TfmMonitoringMain.mn_AccessEventClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDecoderNo : string;
  stDoorName : string;
begin
  if doorListView.Selected = nil then Exit;

  stDoorName := doorListView.Selected.Caption;
  stDoorID:= doorListView.Selected.SubItems.Strings[0];
  stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
  stDecoderNo := inttostr(strtoint(stDecoderNo));
  stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
  stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
  stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);

  if Not isDigit(stNodeNo) then Exit;
  if Not isDigit(stDoorNo) then Exit;

  fmAccessReport := TfmAccessReport.Create(Nil);
  fmAccessReport.NodeNo := strtoint(stNodeNo);
  fmAccessReport.EcuID := stEcuID;
  fmAccessReport.DoorNo := stDoorNo;
  fmAccessReport.DoorName := stDoorName;
  fmAccessReport.ShowModal;
  fmAccessReport.Free;
end;

procedure TfmMonitoringMain.mn_AlarmEventClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
begin
  with sg_AlarmEvent do
  begin
    stNodeNo := Cells[L_arrAlarmEventIndexArray[5],Row];
    stEcuID := Cells[L_arrAlarmEventIndexArray[2],Row];
  end;
  if Not isDigit(stNodeNo) then Exit;

  fmDoorAlarm := TfmDoorAlarm.Create(Nil);
  fmDoorAlarm.NodeNo := strtoint(stNodeNo);
  fmDoorAlarm.EcuID := stEcuID;
  fmDoorAlarm.ShowModal;
  fmDoorAlarm.Free;
end;

procedure TfmMonitoringMain.mn_buffercountClick(Sender: TObject);
var
  i : integer;
  stTest : string;
begin
  for i := 0 to PCClientSocketList.Count - 1 do stTest := stTest + ',' + inttostr(TdmPCClient(PCClientSocketList.Objects[i]).GetReceiveBufferCount);
  pan_ServerstateLabel.Caption := stTest;
end;

procedure TfmMonitoringMain.mn_CardPermitRegClick(Sender: TObject);
begin
  fmKTEmployee := TfmKTEmployee.Create(self);
  fmKTEmployee.CardRegistView := True;
  fmKTEmployee.CardNo := L_stSelectCardNO;
  fmKTEmployee.PrintNo := L_stSelectPrintNo;
  fmKTEmployee.CardGrade := True;
  fmKTEmployee.ShowModal;
  fmKTEmployee.Free;
//
end;

procedure TfmMonitoringMain.mn_CardPrintNoCopyClick(Sender: TObject);
var
  stTemp : string;
begin

  stTemp:= sg_AccessEvent.Cells[L_arrAccessEventIndexArray[3],L_nSelectRow];
  if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
  //stMessage := dmFormMessage.GetMessage('CLIPDATACOPY');
  //stMessage := stringReplace(stMessage,'$DATA',stTemp,[rfReplaceAll]);
//
end;

procedure TfmMonitoringMain.mn_CardPrintNoCreateClick(Sender: TObject);
var
  stPrintNo : string;
  i : integer;
begin
  if dmDBFunction.CheckTB_CARDPRINTLIST_CardNo(L_stSelectCardNO,stPrintNo) = 1 then
  begin
    showmessage( stPrintNo + '���� �̹� ������Դϴ�.');
    Exit;
  end;

  fmCardPrintNoCreate := TfmCardPrintNoCreate.Create(nil);
  fmCardPrintNoCreate.SelectCardNo := L_stSelectCardNO;
  fmCardPrintNoCreate.ShowModal;
  stPrintNo := fmCardPrintNoCreate.selectPrintNo;
  fmCardPrintNoCreate.Free;

  if stPrintNo = '' then Exit;

  with sg_AccessEvent do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if Cells[L_arrAccessEventIndexArray[2],i] = L_stSelectCardNO then
      begin
        if Cells[L_arrAccessEventIndexArray[3],i] = '' then Cells[L_arrAccessEventIndexArray[3],i] := stPrintNo;
      end;

    end;
  end;

end;

procedure TfmMonitoringMain.mn_CardReaderChangeClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorName : string;
begin
  if doorListView.Selected = nil then Exit;

  stDoorName := doorListView.Selected.Caption;
  stDoorID:= doorListView.Selected.SubItems.Strings[0];
  stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
  stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);

  if Application.MessageBox(pchar(stDoorName + ' �� ī�帮���� ��ȭ��ȣ�� �������մϴ�. �����Ͻðڽ��ϱ�?'),pchar('Info'),mb_OKCANCEL) = id_cancel then Exit;
  //��ȭ��ȣ ������
  dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(stNodeNo,stEcuID,'0','1','RE_CARDREADERTEL0','C');
  dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(stNodeNo,stEcuID,'0','1','RE_CARDREADERTEL1','C');
  dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(stNodeNo,stEcuID,'0','1','RE_CARDREADERTEL2','C');
  dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(stNodeNo,stEcuID,'0','1','RE_CARDREADERTEL3','C');
  dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(stNodeNo,stEcuID,'0','1','RE_CARDREADERTEL4','C');
  dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(stNodeNo,stEcuID,'0','1','RE_CARDREADERTEL5','C');
  dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(stNodeNo,stEcuID,'0','1','RE_CARDREADERTEL6','C');
  dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(stNodeNo,stEcuID,'0','1','RE_CARDREADERTEL7','C');
  dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(stNodeNo,stEcuID,'0','1','RE_CARDREADERTEL8','C');
  dmDBUpdate.UpdateTB_READERRCV_Field_StringValue(stNodeNo,stEcuID,'0','1','RE_CARDREADERTEL9','C');

end;

procedure TfmMonitoringMain.mn_CardRegistClick(Sender: TObject);
begin
  fmKTEmployee := TfmKTEmployee.Create(self);
  fmKTEmployee.CardRegistView := True;
  fmKTEmployee.CardNo := L_stSelectCardNO;
  fmKTEmployee.PrintNo := L_stSelectPrintNo;
  fmKTEmployee.ShowModal;
  fmKTEmployee.Free;
end;

procedure TfmMonitoringMain.mn_ControlerChangeClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorName : string;
begin
  if doorListView.Selected = nil then Exit;

  stDoorName := doorListView.Selected.Caption;
  stDoorID:= doorListView.Selected.SubItems.Strings[0];
  stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
  stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);

  if Application.MessageBox(pchar(stDoorName + ' �� ��Ʈ�ѷ��� ���Ա����� �������մϴ�. �����Ͻðڽ��ϱ�?'),pchar('Info'),mb_OKCANCEL) = id_cancel then Exit;
  dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','DE_DEVICEVER','');
  dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','DE_DEVICECODE','');
  if G_nMonitoringType <> 1 then dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','DE_DEVICEHANGE','Y');
  if G_nMonitoringType <> 1 then dmDBUpdate.UpdateTB_HOLIDAYDEVICE_DeviceYearSendStatus(stNodeNo,stEcuID,formatDatetime('yyyy',now),'N'); //������ ���� ���� ������
  if G_nMonitoringType <> 1 then dmDBUpdate.UpdateTB_DOORSCHEDULE_DoorReceive(stNodeNo,stEcuID,'','N');  //������ ���� ������
  if G_nMonitoringType <> 1 then dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(stNodeNo,stEcuID,'0','DE_TIMECODEUSE','N');  //Ÿ���ڵ� ������� ������
  if G_nMonitoringType <> 1 then dmDBUpdate.UpdateTB_TIMECODEDEVICE_Field_StringValue(stNodeNo,stEcuID,'TC_SEND','N');  //Ÿ���ڵ� ������
  if G_nMonitoringType <> 1 then dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(stNodeNo,stEcuID,'0','','DO_SETTINGINFO','N');  //���Թ� ������ ������� ������
  if G_nMonitoringType <> 1 then dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(stNodeNo,stEcuID,'0','','DO_DOORSCHUSE','N');  //���Թ� ������ ������� ������


  //ī����� ������
  //��й�ȣ ������
  dmDBUpdate.UpdateTB_CARDPERMIT_DeviceResend(stNodeNo,stEcuID);
  //dmDBUpdate.UpdateTB_NODE_Field_StringValue(stNodeNo,'ND_DECODERNOCHANGE','Y');


end;

procedure TfmMonitoringMain.mn_ControlerResetClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCECU,'R',stNodeNo,stEcuID,'');
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
//        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoringMain.mn_displaytestClick(Sender: TObject);
begin
  doorListView.visible := Not doorListView.visible;
end;

procedure TfmMonitoringMain.mn_DoorAlarmEventClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDecoderNo : string;
begin
  if doorListView.Selected = nil then Exit;

  stDoorID:= doorListView.Selected.SubItems.Strings[0];
  stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
  stDecoderNo := inttostr(strtoint(stDecoderNo));
  stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
  stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
  stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);

  if Not isDigit(stNodeNo) then Exit;
  if Not isDigit(stDoorNo) then Exit;

  fmDoorAlarm := TfmDoorAlarm.Create(Nil);
  fmDoorAlarm.NodeNo := strtoint(stNodeNo);
  fmDoorAlarm.EcuID := stEcuID;
  fmDoorAlarm.DoorNo := stDoorNo;
  fmDoorAlarm.ShowModal;
  fmDoorAlarm.Free;

end;

procedure TfmMonitoringMain.mn_DoorOpenClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoringMain.mn_FireRecoveryClick(Sender: TObject);
var
  stDoorID : string;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + '0';

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCMONITORING,'F',stNodeNo,stEcuID,stSendData);
        end;
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoringMain.mn_PingTestClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDecoderNo : string;
  stNodeIP : string;
begin
  if doorListView.Selected = nil then Exit;

  stDoorID:= doorListView.Selected.SubItems.Strings[0];
  stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
  stDecoderNo := inttostr(strtoint(stDecoderNo));
  stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
  stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
  stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
  stNodeIP := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);

  if Not IsIPTypeCheck(stNodeIp) then
  begin
    showmessage(stNodeIp + ':' + '������ Ÿ�� ���� �Դϴ�.');
    Exit;
  end;
  ShellExecute(0, 'open', PChar('ping.exe'), PChar(stNodeIp), nil, SW_SHOWNORMAL );

end;

procedure TfmMonitoringMain.mn_TelEventClick(Sender: TObject);
begin
  if Not isDigit(L_stSelectNodeNo) then Exit;

  fmTelEventRegist := TfmTelEventRegist.Create(nil);
  fmTelEventRegist.Caption := L_stSelectDoorName;
  fmTelEventRegist.SelectNodeNo := L_stSelectNodeNo;
  fmTelEventRegist.SelectEcuID := L_stSelectEcuID;
  fmTelEventRegist.SelectDoorNO := L_stSelectDoorNo;
  fmTelEventRegist.SelectAccessEventTime := L_stSelectAccessEventTime;
  fmTelEventRegist.ShowModal;
  fmTelEventRegist.Free;
end;

procedure TfmMonitoringMain.MonitoringRefresh;
begin

end;

procedure TfmMonitoringMain.N12Click(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  L_nViewListStyle := 0;
  doorListView.ViewStyle := vsIcon;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringMain.INI');
    with ini_fun do
    begin
      if L_nViewListStyle = 0 then
        WriteString('MONITOR','ViewStyle','VSICON')
      else WriteString('MONITOR','ViewStyle','VSLIST');
    end;
  Finally
    ini_fun.Free;
  End;

end;

procedure TfmMonitoringMain.N13Click(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  L_nViewListStyle := 1;
  doorListView.ViewStyle := vsList;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MonitoringMain.INI');
    with ini_fun do
    begin
      if L_nViewListStyle = 0 then
        WriteString('MONITOR','ViewStyle' ,'VSICON')
      else WriteString('MONITOR','ViewStyle' ,'VSLIST');
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmMonitoringMain.N3Click(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDecoderNo : string;
  stNodeIP : string;
begin
  if doorListView.Selected = nil then Exit;

  stDoorID:= doorListView.Selected.SubItems.Strings[0];
  stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
  stDecoderNo := inttostr(strtoint(stDecoderNo));
  stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
  stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
  stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
  stNodeIP := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
  pan_ChangeNodeIP.Visible := True;
  ed_ChangeNodeIp.Text := stNodeIp;
  lb_ChangeNodeIPNodeNo.Caption := stNodeNo;

end;

procedure TfmMonitoringMain.Negative1Click(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  stMode : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stMode := inttostr(TMenuItem(Sender).Tag);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + stMode;

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoringMain.NodeChangeEvent(aDecoderNo:integer;aNodeNo, aEcuID, aType, aNo, aCmd,
  aData: string);
begin

end;

procedure TfmMonitoringMain.Panel7DblClick(Sender: TObject);
begin
  if WindowState = wsMaximized then WindowState := wsNormal
  else WindowState := wsMaximized;
end;

procedure TfmMonitoringMain.Panel7MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform( WM_SYSCOMMAND, $F012, 0 );
end;

procedure TfmMonitoringMain.pan_buildingResize(Sender: TObject);
begin
  tv_BuildingList.Top := 0;
  tv_BuildingList.Left := 5;
  tv_BuildingList.Width := pan_building.Width - 10;
  tv_BuildingList.Height := pan_building.Height ;//- 20;
end;

procedure TfmMonitoringMain.pan_ExampleMouseEnter(Sender: TObject);
begin
  gb_DoorState.Visible := True;
end;

procedure TfmMonitoringMain.pan_ExampleMouseLeave(Sender: TObject);
begin
  gb_DoorState.Visible := False;
end;

procedure TfmMonitoringMain.pan_MonitoringResize(Sender: TObject);
begin
  FormResize(Sender);
(*
  DoorListView.Left := 10;
  DoorListView.Top := 10;
  DoorListView.Width := pan_Monitoring.Width - 20;
  DoorListView.Height := pan_Monitoring.Height - 20;
*)
end;

procedure TfmMonitoringMain.pan_SearchNameMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmMonitoringMain.pan_ServerstateLabelMouseEnter(Sender: TObject);
begin
  pan_serverNet.Visible := True;
end;

procedure TfmMonitoringMain.pan_ServerstateLabelMouseLeave(Sender: TObject);
begin
//  pan_serverNet.Visible := False;
end;

procedure TfmMonitoringMain.pm_DooOpenModeClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + '1';

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        end;
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoringMain.pm_DoorCloseModeClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + '2';

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        end;
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoringMain.pm_DoorInfoClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDecoderNo : string;
begin
  if doorListView.Selected = nil then Exit;

  lb_DoorName.Caption := doorListView.Selected.Caption;
  stDoorID:= doorListView.Selected.SubItems.Strings[0];
  stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
  stDecoderNo := inttostr(strtoint(stDecoderNo));
  stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
  stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
  stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
  lb_NodeIp.Caption := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
  lb_NodeNo.Caption := stNodeNo;
  lb_DeviceID.Caption := stEcuID;
  lb_DoorNo.Caption := stDoorNo;
  lb_Building.Caption := dmDBFunction.GetTB_Door_BuildingName(stNodeNo,stEcuID,stDoorNo);
  mem_DoorInfo.Text := dmDBFunction.GetTB_Door_DoorMemo(stNodeNo,stEcuID,stDoorNo);
  lb_Addr.Caption := dmDBFunction.GetTB_NODE_NodeAddr(stNodeNo);
  lb_devicever.Caption := dmDBFunction.GetTB_DEVICE_Version(stNodeNo,stEcuID);
  pan_DoorInfo.Visible := True;
end;

procedure TfmMonitoringMain.pm_DoorManageModeClick(Sender: TObject);
var
  stDoorID : string;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + '0';

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        end;
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoringMain.pm_DoorStateCheckClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
  //DeviceReload;
end;

procedure TfmMonitoringMain.pm_JavarCloseClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stClientIP : string;
  stTime : string;
  nTempIndex :integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := '2';
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        end;
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoringMain.pm_JavarOpenClick(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stClientIP : string;
  stTime : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := '1';
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        end;
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoringMain.pm_NetworkFailListClick(Sender: TObject);
begin
  fmDoorAlarmReport := TfmDoorAlarmReport.Create(nil);
  fmDoorAlarmReport.BuildingCode := L_stBuildingCode;
  fmDoorAlarmReport.BuildingName := lb_Title.Caption;
  fmDoorAlarmReport.ReportName := TMenuItem(Sender).Caption;
  fmDoorAlarmReport.ReportType := TMenuItem(Sender).Tag;
  fmDoorAlarmReport.ShowModal;
end;

procedure TfmMonitoringMain.Positive1Click(Sender: TObject);
var
  stDecoderNo : string;
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  stMode : string;
  nTempIndex : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= doorListView.Items[i].SubItems.Strings[0];
        stDecoderNo := copy(stDoorID,1,G_nDecoderCodeLength);
        stDecoderNo := inttostr(strtoint(stDecoderNo));
        stNodeNo := copy(stDoorID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        stMode := inttostr(TMenuItem(Sender).Tag);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + stMode;

        nTempIndex := PCClientSocketList.IndexOf(stDecoderNo);
        if nTempIndex > -1 then
        begin
          TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
        end;
//        dmPCClient.SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMonitoringMain.ScrollBar1Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  FlowPanel2.ScrollBy(ScrollPos,0);
end;

procedure TfmMonitoringMain.ScrollBox2Resize(Sender: TObject);
var
  nWidth : integer;
  nHeighCount : integer;
  nWidthCount : integer;
begin
  if L_nGroupHeigh = 0 then Exit;

  if L_nGroupHeigh < ScrollBox2.Height then  FlowPanel2.Height := ScrollBox2.Height - 5
  else FlowPanel2.Height := L_nGroupHeigh;

  nHeighCount := FlowPanel2.Height div L_nGroupHeigh ; //���η� ���� ����
  nWidthCount := L_nBuildingCount div nHeighCount;

  if L_nBuildingCount mod nHeighCount <> 0 then nWidthCount := nWidthCount + 1;

  FlowPanel2.Width  := L_nGroupWidth * nWidthCount + 10;
end;

function TfmMonitoringMain.SearchDoorNameList(TargetGrid: TAdvStringGrid;
  aBuildingCode, aSearchName: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  i : integer;
begin
  result := False;
  dmFormFunction.GridInit(TargetGrid,1,1);
  if aSearchName = '' then Exit;

(*  if G_bIsMaster then stSql := dmDBSelect.SelectTB_DOOR_MasterAll(aBuildingCode)
  else
  begin
    if G_nAdminBuildingType = 0 then stSql := dmDBSelect.SelectTB_DOOR_AdminBuilding(G_stAdminUserID,aBuildingCode)
    else stSql := dmDBSelect.SelectTB_DOOR_AdminDoor(G_stAdminUserID,aBuildingCode);
  end;
*)
  if G_bIsMaster or (aBuildingCode <> '0') then
  begin
    stSql := ' Select a.*,b.ND_DECODERNO from TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON(a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' Where a.DO_DOORNAME Like ''%' + aSearchName + '%'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    if aBuildingCode <> ''  then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  end else
  begin
    stSql := ' Select a.*,b.ND_DECODERNO from TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON(a.ND_NODENO = b.ND_NODENO) ';
    stSql := stSql + ' Inner Join TB_ADMIN d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.BC_BUILDINGCODE Like d.BC_BUILDINGCODE + ''%'' ' ;
    stSql := stSql + ' AND d.AD_USERID = ''' + G_stAdminUserID + ''' ';
    stSql := stSql + ')';
    stSql := stSql + ' Where a.DO_DOORNAME Like ''%' + aSearchName + '%'' ';
    stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
    stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
    if aBuildingCode <> ''  then stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';

  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := True;
      with TargetGrid do
      begin
        nRow := 0;
        RowCount := RecordCount;
        while Not Eof do
        begin
          cells[0,nRow] := findField('DO_DOORNAME').AsString;
          cells[1,nRow] := FillZeroNumber(FindField('ND_DECODERNO').AsInteger,G_nDecoderCodeLength) + FillZeroNumber(findField('ND_NODENO').AsInteger,G_nNodeCodeLength) + findField('DE_ECUID').AsString + findField('DO_DOORNO').AsString;
          cells[2,nRow] := findField('DE_ECUID').AsString;
          cells[3,nRow] := findField('DO_DOORNO').AsString;
          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMonitoringMain.ServerConnected(aDecoderNo:integer;aConnected: Boolean);
var
  nIndex : integer;
begin
  nIndex := ServerImageList.IndexOf(inttostr(aDecoderNo));
  if nIndex < 0 then Exit;
  if aConnected then  TImage(ServerImageList.Objects[nIndex]).Picture := Img_ServerConnect1.Picture
  else TImage(ServerImageList.Objects[nIndex]).Picture := Img_ServerDisconnect1.Picture;
end;

procedure TfmMonitoringMain.ServerDblClick(Sender: TObject);
var
  nDecoderNo : integer;
  nTempIndex : integer;
begin
  nDecoderNo := TImage(Sender).Tag;
  nTempIndex := PCClientSocketList.IndexOf(inttostr(nDecoderNo));
  if nTempIndex > -1 then
  begin
    TdmPCClient(PCClientSocketList.Objects[nTempIndex]).SendPacket('S',SCMONITORING,'S',FillZeroNumber(0,G_nNodeCodeLength),'00','');
  end;

end;

procedure TfmMonitoringMain.ServerImageTimerTimer(Sender: TObject);
var
  i : integer;
  nIndex : integer;
  oConnectImage : TImage;
  oDisConnectImage : TImage;
begin

  if PCClientSocketList.Count < 1 then Exit;
  if L_nServerConnectImageType = 1 then
  begin
    L_nServerConnectImageType := 0;
    oConnectImage := Img_ServerConnect1;
    oDisConnectImage := Img_ServerDisConnect1;
  end else
  begin
    L_nServerConnectImageType := 1;
    oConnectImage := Img_ServerConnect2;
    oDisConnectImage := Img_ServerDisConnect2;
  end;

  for i := 0 to PCClientSocketList.Count - 1 do
  begin
    nIndex := ServerImageList.IndexOf(inttostr(TdmPCClient(PCClientSocketList.Objects[i]).DecoderNo));
    if TdmPCClient(PCClientSocketList.Objects[i]).Connected then
    begin
      TImage(ServerImageList.Objects[nIndex]).Picture := oConnectImage.Picture;
    end else
    begin
      TImage(ServerImageList.Objects[nIndex]).Picture := oDisConnectImage.Picture;
    end;
  end;

end;

procedure TfmMonitoringMain.ServerNetworkState(aDecoderNo: integer;
  aServerIP,aData: string);
begin

  with sg_AlarmEvent do
  begin
    if Cells[L_arrAlarmEventIndexArray[0],1] <> '' then InsertRows(1,1);
    Cells[L_arrAlarmEventIndexArray[0],1] := FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
    Cells[L_arrAlarmEventIndexArray[1],1] := aServerIP;
    Cells[L_arrAlarmEventIndexArray[2],1] := '';
    Cells[L_arrAlarmEventIndexArray[3],1] := 'Server' + inttostr(aDecoderNo);
    if aData = 'NF' then
    begin
      Cells[L_arrAlarmEventIndexArray[4],1] := 'Server' + inttostr(aDecoderNo) + ' ��Ŵܼ�';
      RowColor[1] := clRed;
      lb_Message.Caption.Text := Cells[L_arrAlarmEventIndexArray[4],1];
      MediaPlayer1.FileName := G_stExeFolder + '\..\sound\' + G_stAlarmEventAlaramFile;
      AlarmSoundList.Add(G_stExeFolder + '\..\sound\' + G_stAlarmEventAlaramFile);
      if G_bAccessAlarmEventSoundOnUse then SoundTimer.Enabled := True;
      if G_bAccessEventMessageUse then
      begin
        lb_Message.Visible := True;
        pan_Alarm.Visible := True;
        MessageTimer.Enabled := True;
      end;
    end else if aData = 'NR' then
    begin
      Cells[L_arrAlarmEventIndexArray[4],1] := 'Server' + inttostr(aDecoderNo) + ' ��ź���';
      RowColor[1] := clWhite;
    end;


    if RowCount > 1000 then RowCount := 1000;
  end;

end;

procedure TfmMonitoringMain.ServerPacketView(aTxRx, aClientIP, aData,
  aResult: string);
begin

end;

procedure TfmMonitoringMain.sg_AccessEventClick(Sender: TObject);
begin
//  Exit;

  L_stSelectAccessEventTime := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[0],sg_AccessEvent.Row];
  L_stSelectAccessEventTime := stringReplace(L_stSelectAccessEventTime,'-','',[rfReplaceAll]);
  L_stSelectAccessEventTime := stringReplace(L_stSelectAccessEventTime,' ','',[rfReplaceAll]);
  L_stSelectAccessEventTime := stringReplace(L_stSelectAccessEventTime,':','',[rfReplaceAll]);
  L_stSelectNodeNo := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[13],sg_AccessEvent.Row];
  L_stSelectEcuID := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[14],sg_AccessEvent.Row];
  L_stSelectDoorNo := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[15],sg_AccessEvent.Row];
  L_stSelectDoorName := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[1],sg_AccessEvent.Row];
  L_stSelectCardNO :=  sg_AccessEvent.Cells[L_arrAccessEventIndexArray[2],sg_AccessEvent.Row] ;
  L_stSelectPrintNo := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[3],sg_AccessEvent.Row];

  if (sg_AccessEvent.Cells[L_arrAccessEventIndexArray[12],sg_AccessEvent.Row] = 'P')
    OR (sg_AccessEvent.Cells[L_arrAccessEventIndexArray[12],sg_AccessEvent.Row] = 'R')  then  //��������
  begin
    mn_TelEvent.Visible := True;
    mn_CardRegist.Visible := False;
    mn_CardPrintNoCreate.Visible := False;
    mn_CardPrintNoCopy.Visible := False;
  end else
  begin
    mn_TelEvent.Visible := False;
    if (sg_AccessEvent.Cells[L_arrAccessEventIndexArray[12],sg_AccessEvent.Row] = 'C') and
       (sg_AccessEvent.Cells[L_arrAccessEventIndexArray[6],sg_AccessEvent.Row] = '') then  //EM_CODE
    begin
      if sg_AccessEvent.Cells[L_arrAccessEventIndexArray[2],sg_AccessEvent.Row] <> '' then
      begin
        mn_CardRegist.Visible := True;
        //mn_CardPrintNoCreate.Visible := True;
        //mn_CardPrintNoCopy.Visible := False;
      end;
    end else
    begin
      mn_CardRegist.Visible := False;
      if (sg_AccessEvent.Cells[L_arrAccessEventIndexArray[12],sg_AccessEvent.Row] = 'C') then mn_CardPermitReg.Visible := True
      else mn_CardPermitReg.Visible := False;
      //         Not isDigit(sg_AccessEvent.Cells[L_arrAccessEventIndexArray[16],sg_AccessEvent.Row])
      //then mn_CardPermitReg.Visible := True
      //else mn_CardPermitReg.Visible := False;   *)
      //mn_CardPrintNoCreate.Visible := False;
      //mn_CardPrintNoCopy.Visible := True;
    end;
    //sg_AccessEvent.PopupMenu := nil;
    //sg_AccessEvent.PopupMenu := pm_TelEventReport;
  end;

end;

procedure TfmMonitoringMain.sg_AccessEventColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  ChangeAccessEventIndex(FromIndex, ToIndex);
end;

procedure TfmMonitoringMain.sg_AccessEventDblClick(Sender: TObject);
begin
  if sg_AccessEvent.Cells[L_arrAccessEventIndexArray[12],sg_AccessEvent.Row] = 'P' then
  begin
    //sg_AccessEvent.PopupMenu := pm_TelEventReport;
    mn_TelEvent.Visible := True;
    L_stSelectAccessEventTime := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[0],sg_AccessEvent.Row];
    L_stSelectAccessEventTime := stringReplace(L_stSelectAccessEventTime,'-','',[rfReplaceAll]);
    L_stSelectAccessEventTime := stringReplace(L_stSelectAccessEventTime,' ','',[rfReplaceAll]);
    L_stSelectAccessEventTime := stringReplace(L_stSelectAccessEventTime,':','',[rfReplaceAll]);
    L_stSelectNodeNo := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[13],sg_AccessEvent.Row];
    L_stSelectEcuID := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[14],sg_AccessEvent.Row];
    L_stSelectDoorNo := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[15],sg_AccessEvent.Row];
    L_stSelectDoorName := sg_AccessEvent.Cells[L_arrAccessEventIndexArray[1],sg_AccessEvent.Row];
    mn_TelEventClick(mn_TelEvent);
  end;
end;

procedure TfmMonitoringMain.sg_AccessEventKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  stTemp: string;
  stMessage : string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      //stTemp:= Cells[L_arrAccessEventIndexArray[2],Row];
      if G_nMonitoringType = 1 then stTemp:= Cells[L_arrAccessEventIndexArray[3],Row]  //ī���Ϸù�ȣ ��������.
      else stTemp:= Cells[L_arrAccessEventIndexArray[2],Row];

      if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
      stMessage := dmFormMessage.GetMessage('CLIPDATACOPY');
      stMessage := stringReplace(stMessage,'$DATA',stTemp,[rfReplaceAll]);
    end;
  end;
end;

procedure TfmMonitoringMain.sg_AccessEventMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  L_nSelectRow := TAdvStringGrid(Sender).Row;
end;

procedure TfmMonitoringMain.sg_AccessEventResize(Sender: TObject);
begin
  with sg_AccessEvent do
  begin
//    if (ColWidths[0] + ColWidths[1] + ColWidths[2] + ColWidths[3] + ColWidths[4] + ColWidths[5] + ColWidths[6] + ColWidths[7] + ColWidths[8] + ColWidths[9]) < (Width - 20)  then
//    begin
//      ColWidths[9] := Width - (ColWidths[0] + ColWidths[1] + ColWidths[2] + ColWidths[3] + ColWidths[4] + ColWidths[5] + ColWidths[6] + ColWidths[7] + ColWidths[8]) - 20;
//    end;
  end;

end;

procedure TfmMonitoringMain.sg_AlarmEventColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  ChangeAlarmEventIndex(FromIndex, ToIndex);
end;

procedure TfmMonitoringMain.sg_AlarmEventResize(Sender: TObject);
begin
  with sg_AlarmEvent do
  begin
    if (ColWidths[0] + ColWidths[1] + ColWidths[2] + ColWidths[3] + ColWidths[4] ) < (Width - 20)  then
    begin
      ColWidths[4] := Width - (ColWidths[0] + ColWidths[1] + ColWidths[2] + ColWidths[3] ) - 20;
    end;
  end;

end;

procedure TfmMonitoringMain.sg_SearchNameGridDblClick(Sender: TObject);
var
  stDoorID : string;
  nIndex : integer;
  vPoint: TPoint;
  xPosition,yPosition : integer;
  NewBottomItemIndex :integer;
begin
  ed_SearchName.text := '';
  DoorListView.ClearSelection;
  pan_SearchName.Visible := False;
  stDoorID := sg_SearchNameGrid.Cells[1,sg_SearchNameGrid.Row];
  nIndex := BuildingDoorList.IndexOf(stDoorID);
  if nIndex > -1 then
  begin
    DoorListView.Items[nIndex].Selected := True;
(*    vPoint := DoorListView.Items[nIndex].GetPosition;
    if vPoint.X < DoorListView.Width then xPosition := vPoint.X
    else xPosition := vPoint.X - DoorListView.Width div 2;
    if vPoint.Y < DoorListView.Height then yPosition := vPoint.Y
    else yPosition := vPoint.Y - DoorListView.Height div 2;

    DoorListView.Scroll(xPosition, yPosition);
    //DoorListView.Scroll(vPoint.X, vPoint.Y - DoorListView.Height div 2 ); *)
    with DoorListView do
    begin
      Items.Item[0].MakeVisible(False);
      NewBottomItemIndex := Min(nIndex+VisibleRowCount-1,Items.Count-1);
      if NewBottomItemIndex > -1 then
         Items.Item[NewBottomItemIndex].MakeVisible(False);
    end;
    DoorListView.SetFocus;
  end;
end;

procedure TfmMonitoringMain.sg_SearchNameGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    sg_SearchNameGridDblClick(sg_SearchNameGrid);
  end;
end;

procedure TfmMonitoringMain.SoundTimerTimer(Sender: TObject);
var
  stAlarmFile : string;
begin
  inherited;
  if L_bSoundTimerEnable then Exit;
  if G_nAccessSoundCount > 0 then
  begin
    if G_nAccessSoundCount <= L_nAlarmSoundCount then
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

procedure TfmMonitoringMain.SpeedButton1Click(Sender: TObject);
begin
  L_nFormDeep := 0;
  CloseButtonClick(CloseButton);
end;

procedure TfmMonitoringMain.SpeedButton2Click(Sender: TObject);
begin
  WindowState := wsMinimized;
end;


procedure TfmMonitoringMain.Splitter1Moved(Sender: TObject);
begin
  L_bListRefresh := True;
end;

procedure TfmMonitoringMain.tv_BuildingListClick(Sender: TObject);
var
  stBuildingCode : string;
begin
  if tv_BuildingList.Selected = nil then tv_BuildingList.Items[0].Selected := True;

  lb_Title.Caption := tv_BuildingList.Selected.Text;
  stBuildingCode := tv_BuildingCode.Items.Item[tv_BuildingList.Selected.AbsoluteIndex].Text;

  DoorListView.Enabled := False;
  LoadBuildingDoor(stBuildingCode);

  pan_MonitoringResize(pan_Monitoring);
  DoorListView.Enabled := True;


  if G_nDoorStateUse = 1 then
  begin
    btn_BuildingStateMonitoring.Visible := True;
  end else
  begin
    btn_BuildingStateMonitoring.Visible := False;
  end;

end;

{ TGroupPanel }

constructor TGroupPanel.Create(AOwner: TComponent);
begin
  inherited;
  oPanel := TPanel.Create(self);
  oPanel.Parent := Self;
  oPanel.Align := alBottom;
  oPanel.Height := con_LabelPanelHeigh;
  oPanel.Color := clGradientActiveCaption;
  oPanel.BevelOuter := bvNone;
  oImage := TImage.Create(self);
  oImage.Parent := Self;
  oImage.Align := alClient;
  oImage.OnClick := ImageClick;
  oImage.OnMouseEnter := MouseEnter;
  oImage.OnMouseLeave := MouseLeave;
  oLabel := TLabel.Create(self);
  oLabel.Parent := oPanel;
  oLabel.Align := alClient;
  //oLabel.Caption.ColorStart := clWhite;
  //oLabel.Caption.ColorEnd := clWhite;
  oLabel.Alignment := taCenter;
  oLabel.Color := clGradientActiveCaption;
//  oLabel.Font.Color := clWhite;
  oLabel.ParentBiDiMode := True;
  oLabel.ParentColor := True;
  oLabel.ParentFont := True;
  oLabel.OnClick := ImageClick;
  oLabel.OnMouseEnter := MouseEnter;
  oLabel.OnMouseLeave := MouseLeave;
end;

destructor TGroupPanel.Destroy;
begin
  oLabel.Free;
  oImage.Free;
  oPanel.Free;
  inherited;
end;

procedure TGroupPanel.ImageClick(Sender: TObject);
begin
  if Assigned(FOnGroupPanelClick) then
  begin
    OnGroupPanelClick(Self,BuildingCode);
  end;
end;

procedure TGroupPanel.MouseEnter(Sender: TObject);
begin
  if Assigned(FOnGroupPanelMouseEnter) then
  begin
    OnGroupPanelMouseEnter(Self,BuildingCode);
  end;
end;

procedure TGroupPanel.MouseLeave(Sender: TObject);
begin
  if Assigned(FOnGroupPanelMouseLeave) then
  begin
    OnGroupPanelMouseLeave(Self,BuildingCode);
  end;
end;

procedure TGroupPanel.SetBuildingName(const Value: string);
begin
  FBuildingName := Value;
  oLabel.Caption := Value;
end;

procedure TGroupPanel.SetImage(const Value: TImage);
begin
  if FImage = Value then Exit;
  FImage := Value;

  oImage.Picture := TImage(Value).Picture;
end;

end.