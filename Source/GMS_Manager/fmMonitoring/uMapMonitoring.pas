unit uMapMonitoring;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, AdvOfficePager,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvAppStyler, AdvOfficePagerStylers,
  AdvSmoothPanel, Vcl.ExtCtrls, AdvSplitter, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.ImgList, uSubForm, CommandArray,Winapi.ShellAPI,
  AdvSmoothButton, Vcl.Imaging.pngimage,System.IniFiles, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, AdvPageControl,Vcl.Clipbrd, Vcl.Buttons,ActiveX,AdoDB,
  ieview, imageenview, ievect, AdvSmoothLabel;

const
  //con_AlarmStateNotEvent = -1;
  //con_AlarmStateNormalEvent = 0;
  //con_AlarmStateAlarmEvent = 1;

  con_ArmAreaImageNothing = 0;
  con_ArmAreaNormalImageDisArm = 1;
  con_ArmAreaNormalImagePartArm = 2;
  con_ArmAreaNormalImageArm = 3;
  con_ArmAreaEventImageDisArm = 4;
  con_ArmAreaEventImagePartArm = 5;
  con_ArmAreaEventImageArm = 6;
  con_ArmAreaAlarmImageDisArm = 7;
  con_ArmAreaAlarmImagePartArm = 8;
  con_ArmAreaAlarmImageArm = 9;

  con_BuildingArmAreaImageNothing = 0;
  con_BuildingArmAreaNormalImageDisArm = 1;
  con_BuildingArmAreaNormalImagePartArm = 2;
  con_BuildingArmAreaNormalImageArm = 3;
  con_BuildingArmAreaEventImageDisArm = 4;
  con_BuildingArmAreaEventImagePartArm = 5;
  con_BuildingArmAreaEventImageArm = 6;
  con_BuildingArmAreaAlarmImageDisArm = 7;
  con_BuildingArmAreaAlarmImagePartArm = 8;
  con_BuildingArmAreaAlarmImageArm = 9;

const
  con_LocalNodeAllConnectedImageIndex = 2;
  con_LocalNodeConnectedImageIndex = 1;
  con_LocalNodeDisConnectedImageIndex = 0;

  con_LocalDeviceConnectedImageIndex = 4;
  con_LocalDeviceDisConnectedImageIndex = 3;

  con_DoorStatePosiManageMode = 0;
  con_DoorStateNegaManageMode = 1;
  con_DoorStatePosiOpenMode = -1;
  con_DoorStateNegaOpenMode = -1;
  con_DoorStatePosiCloseMode = 2;
  con_DoorStateNegaCloseMode = 2;

  con_DoorImageFire = 4;
  con_DoorImageLongTime = 3;
  con_DoorImageOpen = 1;
  con_DoorImageClose = 0;
  con_DoorImageNothing = 2;
  con_BuildingImage = 5;

type
  TfmMapMonitoring = class(TfmASubForm)
    AdvOfficePager1: TAdvOfficePager;
    ap_Access: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    ap_Alarm: TAdvOfficePage;
    pan_Device: TAdvSmoothPanel;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvSplitter1: TAdvSplitter;
    lb_List: TLabel;
    toolslist: TImageList;
    MenuImageList16: TImageList;
    pan_AlarmDevice: TAdvSmoothPanel;
    lb_List1: TLabel;
    AdvSplitter2: TAdvSplitter;
    pan_Alarm: TAdvSmoothPanel;
    pan_Access: TAdvSmoothPanel;
    SmallDoorList: TImageList;
    statelist: TImageList;
    AdvSplitter3: TAdvSplitter;
    ReSizeTimer: TTimer;
    ActiveTimer: TTimer;
    pan_AccessEvent: TAdvSmoothPanel;
    PageControl1: TAdvPageControl;
    tb_AccessEvent: TAdvTabSheet;
    sg_AccessEvent: TAdvStringGrid;
    tb_AccessAlarm: TAdvTabSheet;
    sg_AccessAlarmEvent: TAdvStringGrid;
    PopupMenu3: TPopupMenu;
    mn_CardNOCopy: TMenuItem;
    pan_AlarmState: TAdvSmoothPanel;
    AdvSplitter4: TAdvSplitter;
    pan_AlarmEvent: TAdvSmoothPanel;
    lb_FloorName1: TLabel;
    stateArmArealist: TImageList;
    SmallArmAreaList: TImageList;
    ap_AlarmEvent: TAdvPageControl;
    tb_AlarmEvent: TAdvTabSheet;
    tb_ArmModeChange: TAdvTabSheet;
    sg_AlarmEvent: TAdvStringGrid;
    sg_ModeChange: TAdvStringGrid;
    PopupMenu5: TPopupMenu;
    mn_AlarmConfirm1: TMenuItem;
    LargeImageList32: TImageList;
    lb_AlarmstateExample: TLabel;
    LargeArmAreaList32: TImageList;
    sg_AccessBuildingCode: TAdvStringGrid;
    sg_AlarmBuildingCode: TAdvStringGrid;
    pan_AccessState: TAdvSmoothPanel;
    lb_FloorName: TLabel;
    lb_DoorstateExample: TLabel;
    ImageEnVect1: TImageEnVect;
    pan_DoorInfo: TAdvSmoothPanel;
    lb_DoorNodeIP: TLabel;
    lb_DoorDeviceID: TLabel;
    lb_DoorID: TLabel;
    lb_DoorPositoin: TLabel;
    lb_NodeIP: TLabel;
    lb_DeviceID: TLabel;
    lb_DoorNo: TLabel;
    lb_Building: TLabel;
    lb_DoorName1: TLabel;
    lb_DoorName: TLabel;
    lb_DoorInfo: TLabel;
    btn_DoorInfoConfirm: TAdvGlowButton;
    pm_DoorControl: TPopupMenu;
    mn_Name: TMenuItem;
    N1: TMenuItem;
    mn_DoorOpen: TMenuItem;
    N9: TMenuItem;
    pm_JavarOpen: TMenuItem;
    pm_JavarClose: TMenuItem;
    pm_DoorManageMode: TMenuItem;
    pm_DooOpenMode: TMenuItem;
    pm_DoorCloseMode: TMenuItem;
    N2: TMenuItem;
    mn_CardMode: TMenuItem;
    Positive1: TMenuItem;
    Negative1: TMenuItem;
    N6: TMenuItem;
    pm_DoorStateCheck: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    mn_ImageFit: TMenuItem;
    mn_ImageOrg: TMenuItem;
    N14: TMenuItem;
    pm_DoorInfo: TMenuItem;
    lb_name: TAdvSmoothLabel;
    gb_DoorState: TGroupBox;
    lb_DoorOpenModeOpen: TLabel;
    lb_DoorOpenModeClose: TLabel;
    lb_DoorCloseModeOpen: TLabel;
    lb_DoorCloseModeClose: TLabel;
    lb_DoorLockModeOpen: TLabel;
    lb_DoorLockModeClose: TLabel;
    lb_DoorFire: TLabel;
    lb_DoorTimeOver: TLabel;
    Img_d02: TImage;
    Img_d04: TImage;
    Img_d11: TImage;
    Img_d01: TImage;
    Img_d03: TImage;
    Img_d10: TImage;
    Img_dfc: TImage;
    Img_d05: TImage;
    ImageEnVect2: TImageEnVect;
    lb_name2: TAdvSmoothLabel;
    PageCCTV: TAdvPageControl;
    gb_AlarmStateExample: TGroupBox;
    lb_AlarmState1: TLabel;
    SpeedButton9: TSpeedButton;
    lb_DisArmMode: TLabel;
    lb_ArmMode: TLabel;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    lb_AlarmEvent: TLabel;
    pan_ArmAreaInfo: TAdvSmoothPanel;
    lb_ArmAreaNodeIP: TLabel;
    lb_ArmAreaDeviceID: TLabel;
    lb_ArmAreaNo1: TLabel;
    lb_ArmAreaPositoin: TLabel;
    lb_ArmAreaDeviceID1: TLabel;
    lb_ArmAreaNo: TLabel;
    Label6: TLabel;
    lb_ArmAreaName1: TLabel;
    lb_ArmAreaName: TLabel;
    lb_ArmAreaTelno1: TLabel;
    lb_TelNo: TLabel;
    lb_ArmAreaMemo: TLabel;
    btn_ArmAreaInfoConfirm: TAdvSmoothButton;
    memo1: TMemo;
    ed_NodeIP: TEdit;
    lb_ArmAreaInfo: TLabel;
    pm_ArmAreaControl: TPopupMenu;
    mn_ArmAreaName: TMenuItem;
    pm_1: TMenuItem;
    pm_AlarmConfirm: TMenuItem;
    pm_ArmAreaStateSearch: TMenuItem;
    pm_2: TMenuItem;
    pm_ArmModeChange: TMenuItem;
    pm_DisArmModeChange: TMenuItem;
    pm_3: TMenuItem;
    MenuItem9: TMenuItem;
    mn_ImageFit2: TMenuItem;
    mn_ImageOrg2: TMenuItem;
    pm_4: TMenuItem;
    pm_DeviceInfo: TMenuItem;
    pm_5: TMenuItem;
    pm_AlarmReport: TMenuItem;
    pm_6: TMenuItem;
    pm_CCTV1: TMenuItem;
    AlarmTimer: TTimer;
    mn_AllAlarmEvent: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure pan_DeviceResize(Sender: TObject);
    procedure pan_AlarmDeviceResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure doorListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btn_DoorInfoConfirmClick(Sender: TObject);
    procedure sg_AccessEventKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mn_CardNOCopyClick(Sender: TObject);
    procedure ap_AlarmShow(Sender: TObject);
    procedure ap_AccessShow(Sender: TObject);
    procedure sg_ModeChangeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mn_AlarmConfirm1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pan_AlarmStateResize(Sender: TObject);
    procedure lb_AlarmstateExampleMouseEnter(Sender: TObject);
    procedure lb_AlarmstateExampleMouseLeave(Sender: TObject);
    procedure pan_AccessEventResize(Sender: TObject);
    procedure lb_DoorstateExampleMouseEnter(Sender: TObject);
    procedure lb_DoorstateExampleMouseLeave(Sender: TObject);
    procedure sg_AccessEventColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_AccessAlarmEventColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_AlarmEventColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_ModeChangeColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure pan_AccessStateResize(Sender: TObject);
    procedure sg_AccessBuildingCodeClick(Sender: TObject);
    procedure ImageEnVect1ZoomIn(Sender: TObject; var NewZoom: Double);
    procedure ImageEnVect1DblClick(Sender: TObject);
    procedure ImageEnVect1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageEnVect1ObjectOver(Sender: TObject; hobj: Integer);
    procedure ImageEnVect1SelectObject(Sender: TObject);
    procedure mn_ImageFitClick(Sender: TObject);
    procedure pm_DoorInfoClick(Sender: TObject);
    procedure mn_DoorOpenClick(Sender: TObject);
    procedure pm_JavarOpenClick(Sender: TObject);
    procedure pm_JavarCloseClick(Sender: TObject);
    procedure pm_DoorManageModeClick(Sender: TObject);
    procedure pm_DooOpenModeClick(Sender: TObject);
    procedure pm_DoorCloseModeClick(Sender: TObject);
    procedure Positive1Click(Sender: TObject);
    procedure Negative1Click(Sender: TObject);
    procedure pm_DoorStateCheckClick(Sender: TObject);
    procedure mn_ImageOrgClick(Sender: TObject);
    procedure sg_AlarmBuildingCodeClick(Sender: TObject);
    procedure ImageEnVect2DblClick(Sender: TObject);
    procedure ImageEnVect2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageEnVect2ObjectClick(Sender: TObject; hobj: Integer);
    procedure ImageEnVect2ObjectOver(Sender: TObject; hobj: Integer);
    procedure ImageEnVect2SelectObject(Sender: TObject);
    procedure AlarmTimerTimer(Sender: TObject);
    procedure pm_AlarmConfirmClick(Sender: TObject);
    procedure pm_AlarmReportClick(Sender: TObject);
    procedure pm_ArmAreaStateSearchClick(Sender: TObject);
    procedure pm_ArmModeChangeClick(Sender: TObject);
    procedure pm_DisArmModeChangeClick(Sender: TObject);
    procedure mn_ImageFit2Click(Sender: TObject);
    procedure ImageEnVect2ZoomIn(Sender: TObject; var NewZoom: Double);
    procedure mn_ImageOrg2Click(Sender: TObject);
    procedure pm_DeviceInfoClick(Sender: TObject);
    procedure btn_ArmAreaInfoConfirmClick(Sender: TObject);
    procedure pan_AlarmStateDblClick(Sender: TObject);
    procedure pan_AccessStateDblClick(Sender: TObject);
    procedure AdvSplitter3DblClick(Sender: TObject);
    procedure AdvSplitter4DblClick(Sender: TObject);
    procedure pan_AlarmEventResize(Sender: TObject);
    procedure mn_AllAlarmEventClick(Sender: TObject);
  private
    SubAccessCodeList : TStringList;
    SubAlarmCodeList : TStringList;
    BuildingCodeList : TStringList;
    BuildingArmAreaList : TStringList;
    BuildingDoorList : TStringList;
    AccessEventHeaderNameList : TStringList;
    DeviceEventHeaderNameList : TStringList;
    AlarmEventHeaderNameList : TStringList;
    AlarmModeHeaderNameList : TStringList;
    AlarmEventCodeList : TStringList;

    L_arrAccessEventIndexArray:Array of integer; //출입이벤트 리스트 순서 배열
    L_arrRelAccessEventIndexArray:Array of integer; //출입이벤트 실제 위치
    L_arrAccessEventShowTable : Array of integer;  //출입이벤트 조회 항목테이블
    L_arrAccessEventSizeTable : Array of integer;  //출입이벤트 Cell Size
    L_arrDeviceEventIndexArray:Array of integer; //장비이상 리스트 순서 배열
    L_arrRelDeviceEventIndexArray:Array of integer; //장비이상 실제 위치
    L_arrDeviceEventShowTable : Array of integer;  //장비이상 조회 항목테이블
    L_arrDeviceEventSizeTable : Array of integer;  //장비이상 Cell Size
    L_arrAlarmEventIndexArray:Array of integer; //알람이벤트 리스트 순서 배열
    L_arrRelAlarmEventIndexArray:Array of integer; //알람이벤트 실제 위치
    L_arrAlarmEventShowTable : Array of integer;  //알람이벤트 조회 항목테이블
    L_arrAlarmEventSizeTable : Array of integer;  //알람이벤트Cell Size
    L_arrAlarmModeIndexArray:Array of integer; //모드변경 리스트 순서 배열
    L_arrRelAlarmModeIndexArray:Array of integer; //모드변경 실제 위치
    L_arrAlarmModeShowTable : Array of integer;  //모드변경 조회 항목테이블
    L_arrAlarmModeSizeTable : Array of integer;  //모드변경 Cell Size

    L_bAlarmTrigger : Boolean;
    L_bImageFit : Boolean;
    L_bImageFit2 : Boolean;
    L_bFormActive : Boolean;
    L_bViewRefresh : Boolean;
    L_nCount : integer;
    L_nAccessEventHeight : integer;
    L_nAlarmEventHeight : integer;
    L_nAlarmViewListStyle : integer;
    L_nAccessEventShowCount : integer;
    L_nAlarmEventShowCount : integer;
    L_nAlarmModeShowCount : integer;
    L_nDeviceEventShowCount : integer;
    L_nViewListStyle : integer;
    L_stMenuID : string;

    L_stAccessSelectBuildingCode : string;
    L_stAlarmSelectBuildingCode : string;
    L_stSelectDoorCode : string;
    L_stSelectArmAreaCode : string;

    { Private declarations }
    procedure ArmAreaStateRefresh;
    procedure BuildingStateRefresh;
    procedure ChangeAccessEventIndex(FromIndex,ToIndex:integer);
    procedure ChangeAlarmEventIndex(FromIndex,ToIndex:integer);
    procedure ChangeAlarmModeIndex(FromIndex,ToIndex:integer);
    procedure ChangeDeviceEventIndex(FromIndex,ToIndex:integer);
    function  ListCellSize:Boolean;
    function  ListConfigRead:Boolean;
    function  ListHeaderNameGet:Boolean;
    function  ListHeaderNameSetting:Boolean;
    function  ListFieldNameSetting:Boolean;
    function  LoadBuildingArmArea:Boolean;
    function  WriteIniConfig:Boolean;
  private
    FBuildingCode: string;
    function GetDoorManageModeImageIndex(aDoorCardMode,aDoorManageMode:string):integer;
    function GetDoorStateImageIndex(aDoorDSState,aDoorLSState,aDoorFireEvent:string):integer;
  public
    procedure AlarmEventAllClear(aMessage:string);
    procedure DeviceReload;
    procedure Load_AccessBuildingCode;
    procedure Load_AlarmBuildingCode;
    procedure LoadAccessMap;
    procedure LoadAlarmMap;
    function GetDoorImageIndex(aDoorCardMode,aDoorManageMode,aDoorDSState,aDoorLSState:string):integer;
    procedure LoadDoorExampleImage;
  public
    { Public declarations }
    procedure ArmAreaCurrentAlarmStateChange(aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(aDecoderNo:integer;aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure BuildingAlarmStateChange(aBuildingCode:string;aAlarmState: integer);
    procedure BuildingSecurityModeChange(aBuildingCode:string;aMode : integer);
    procedure DeviceCardAccessEvent(aDecoderNo:integer;aTime,aNodeNo, aEcuID, aDoorNo,aReaderNo, aInOut,aInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,
                    aAccessPermitName,aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone:string);
    procedure DeviceAlarmEvent(aDecoderNo:integer;aNodeNo, aECUID,aExtendID, aCmd,aMsgNo, aTime, aSubCLass, aSubAddr, aArmAreaNo, aMode, aAlarmStateCode, aLoop,
                          aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor:string);
    procedure DoorChangeEvent(aDecoderNo:integer;aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
    Function  FormNameSetting:Boolean;
    procedure RcvDeviceConnectedChangeEvent(aNodeNo,aEcuID,aData:string);
    procedure RcvNodeConnectedChangeEvent(aNodeNo,aEcuID,aData:string);
    procedure SecurityEventClear;
    procedure MonitoringRefresh;
  end;

var
  fmMapMonitoring: TfmMapMonitoring;

implementation
uses
  uBuildingAlarmConfirm,
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormDeviceState,
  uFormVariable,
  uMain,
  uPCClient,
  uSecurityEventConfirm,
  uServerClientVariable;
{$R *.dfm}


procedure TfmMapMonitoring.pan_AccessEventResize(Sender: TObject);
begin
  inherited;
  if pan_AccessEvent.Height <> 0 then
  begin
    sg_AccessEvent.Top := 5;
    sg_AccessEvent.Left := 5;
    sg_AccessEvent.Height := tb_AccessEvent.Height - (sg_AccessEvent.Top * 2);
    sg_AccessEvent.Width := tb_AccessEvent.Width - (sg_AccessEvent.Left * 2);
    L_nAccessEventHeight := pan_AccessEvent.Height;
    sg_AccessAlarmEvent.Top := 5;
    sg_AccessAlarmEvent.Left := 5;
    sg_AccessAlarmEvent.Height := tb_AccessAlarm.Height - (sg_AccessAlarmEvent.Top * 2);
    sg_AccessAlarmEvent.Width := tb_AccessAlarm.Width - (sg_AccessAlarmEvent.Left * 2);
  end;

end;

procedure TfmMapMonitoring.AdvSplitter3DblClick(Sender: TObject);
begin
  inherited;
  if pan_AccessEvent.Height = 0 then
  begin
    pan_AccessEvent.Height := L_nAccessEventHeight;
  end else
  begin
    pan_AccessEvent.Height := 0;
  end;
end;

procedure TfmMapMonitoring.AdvSplitter4DblClick(Sender: TObject);
var
  n_EventHeight : integer;
begin
  inherited;
  if pan_AlarmEvent.Height = 0 then
  begin
    pan_AlarmEvent.Height := L_nAlarmEventHeight;
  end else
  begin
    pan_AlarmEvent.Height := 0;
  end;
end;

procedure TfmMapMonitoring.AlarmEventAllClear(aMessage: string);
var
  stTime : string;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stMsgNo : string;
  stAlarmDate : string;
  stAlarmTime : string;
  i : integer;
begin
  With sg_AlarmEvent do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if Cells[L_arrAlarmEventIndexArray[10],i] = '' then continue;
      if Cells[L_arrAlarmEventIndexArray[2],i] = '' then continue;
      if Cells[L_arrAlarmEventIndexArray[11],i] = '' then continue;
      if Cells[L_arrAlarmEventIndexArray[12],i] = '' then continue;
      stTime := Cells[L_arrAlarmEventIndexArray[12],i];
      stTime := stringReplace(stTime,'-','',[rfReplaceAll]);
      stTime := stringReplace(stTime,':','',[rfReplaceAll]);
      stTime := stringReplace(stTime,' ','',[rfReplaceAll]);
      stNodeNo := Cells[L_arrAlarmEventIndexArray[10],i];
      stEcuID := Cells[L_arrAlarmEventIndexArray[2],i];
      stExtendID := Cells[L_arrAlarmEventIndexArray[13],i];
      stMsgNo := Cells[L_arrAlarmEventIndexArray[11],i];
      stAlarmDate := copy(stTime,1,8);
      stAlarmTime := copy(stTime,9,6);
      dmDBUpdate.UpdateTB_ALARMEVENT_Confirm(stAlarmDate, stAlarmTime,
            stNodeNo, stEcuID, stExtendID, stMsgNo, '1', aMessage, formatDateTime('yyyymmddhhnnsszzz',now),
            GetLocalIPAddr);
    end;
  end;
end;

procedure TfmMapMonitoring.AlarmTimerTimer(Sender: TObject);
var
  i : integer;
  stArmAreaID : string;
  nIndex : Integer;
  hobj : integer;
begin
  inherited;
  if AlarmEventCodeList.Count < 1 then Exit;
  L_bAlarmTrigger := Not L_bAlarmTrigger;

  for i := 0 to AlarmEventCodeList.Count - 1 do
  begin
    stArmAreaID := AlarmEventCodeList.Strings[i];
    nIndex := SubAlarmCodeList.IndexOf(stArmAreaID);
    if nIndex > -1 then
    begin
      hobj := TMapAlarm(SubAlarmCodeList.Objects[nIndex]).hobj;
      if L_bAlarmTrigger then
        ImageEnVect2.ObjTransparency[hobj] := 250
      else ImageEnVect2.ObjTransparency[hobj] := 50;
    end;
  end;
end;

procedure TfmMapMonitoring.ap_AccessShow(Sender: TObject);
begin
  inherited;
  FormResize(self);
end;

procedure TfmMapMonitoring.ap_AlarmShow(Sender: TObject);
begin
  inherited;
  FormResize(self);
  ArmAreaStateRefresh;

end;

procedure TfmMapMonitoring.ArmAreaCurrentAlarmStateChange(aDecoderNo:integer;aNodeNo, aEcuID,
  aArmAreaNo, aAlarmState, aBuildingCode: string);
var
  stArmAreaID : string;
  nIndex : Integer;
  hobj : integer;
  mydata:PMyData;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stCCTVSeq : string;
  stCCTVIP,stCCTVPort,stCCTVIName,stCCTVUserID,stCCTVUserPw : string;
begin
  stArmAreaID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := SubAlarmCodeList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  if aAlarmState = '3' then
  begin
    if AlarmEventCodeList.IndexOf(stArmAreaID) < 0  then
    begin
      AlarmEventCodeList.Add(stArmAreaID);
      hobj := TMapAlarm(SubAlarmCodeList.Objects[nIndex]).hobj;
      mydata:=ImageEnVect2.ObjUserData[ hobj ];
      if mydata <> nil then
      begin
        ImageEnVect2.ObjBrushColor[hobj] := mydata.AlarmColor;
        ImageEnVect2.ObjPenColor[hobj] := mydata.AlarmColor;
      end;
    end;
    stNodeNo := copy(stArmAreaID,1,G_nNodeCodeLength);
    stEcuID := copy(stArmAreaID,1 + G_nNodeCodeLength,2);
    stArmAreaNo := copy( stArmAreaID,1 + G_nNodeCodeLength + 2,1);
    if Not dmDBFunction.GetTB_ARMAREA_CCTVSeq(stNodeNo,stEcuID,stArmAreaNo,stCCTVSeq) then Exit;
    if Not dmDBFunction.GetTB_CCTV_Info(stCCTVSeq,stCCTVIP,stCCTVPort,stCCTVIName,stCCTVUserID,stCCTVUserPw) then
    begin
      Exit;
    end;
  end;
end;

procedure TfmMapMonitoring.ArmAreaSecurityModeChange(aDecoderNo:integer;aNodeNo, aEcuID, aArmAreaNo,
  aMode, aBuildingCode: string);
var
  stArmAreaID : string;
  nIndex : Integer;
  hobj : integer;
  mydata:PMyData;
begin
  stArmAreaID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := SubAlarmCodeList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  if AlarmEventCodeList.IndexOf(stArmAreaID) < 0  then
  begin
    hobj := TMapAlarm(SubAlarmCodeList.Objects[nIndex]).hobj;
    mydata:=ImageEnVect2.ObjUserData[ hobj ];
    if mydata <> nil then
    begin
      if aMode = 'A' then
      begin
        ImageEnVect2.ObjBrushColor[hobj] := mydata.ArmColor;
        ImageEnVect2.ObjPenColor[hobj] := mydata.ArmColor;
      end else
      begin
        ImageEnVect2.ObjBrushColor[hobj] := mydata.DisArmColor;
        ImageEnVect2.ObjPenColor[hobj] := mydata.DisArmColor;
      end;
    end;
  end;
end;

procedure TfmMapMonitoring.ArmAreaStateRefresh;
begin

end;

procedure TfmMapMonitoring.btn_ArmAreaInfoConfirmClick(Sender: TObject);
begin
  inherited;
  pan_ArmAreaInfo.Visible := False;
end;

procedure TfmMapMonitoring.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMapMonitoring.btn_DoorInfoConfirmClick(Sender: TObject);
begin
  inherited;
  pan_DoorInfo.Visible := False;
end;

procedure TfmMapMonitoring.btn_minimizeClick(Sender: TObject);
begin
  windowState := wsNormal;
end;

procedure TfmMapMonitoring.BuildingAlarmStateChange(aBuildingCode: string;
  aAlarmState: integer);
begin
  Exit;
end;

procedure TfmMapMonitoring.BuildingSecurityModeChange(aBuildingCode: string;
  aMode: integer);
begin
  Exit;
end;

procedure TfmMapMonitoring.BuildingStateRefresh;
var
  i : integer;
  stBuildingCode : string;
  nIndex : integer;
  nBuildingSecurityMode : integer;
  nImageIndex : integer;
begin
  Try
    if G_MonitoringBuildingList.Count < 1 then Exit;
    for i := 0 to G_MonitoringBuildingList.Count - 1 do
    begin
      nImageIndex := con_BuildingArmAreaImageNothing;
      stBuildingCode := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingCode;
      nIndex := BuildingArmAreaList.IndexOf(stBuildingCode);
      nBuildingSecurityMode := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode;
      case TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingAlarmState of
        1 : begin
          if nBuildingSecurityMode = 1 then nImageIndex := con_BuildingArmAreaNormalImageDisArm
          else if nBuildingSecurityMode = 2 then nImageIndex := con_BuildingArmAreaNormalImagePartArm
          else if nBuildingSecurityMode = 3 then nImageIndex := con_BuildingArmAreaNormalImageArm;
          //ArmAreaListView.Items[i].StateIndex := con_AlarmStateNormalEvent;
        end;
        2 : begin
          if nBuildingSecurityMode = 1 then nImageIndex := con_BuildingArmAreaEventImageDisArm
          else if nBuildingSecurityMode = 2 then nImageIndex := con_BuildingArmAreaEventImagePartArm
          else if nBuildingSecurityMode = 3 then nImageIndex := con_BuildingArmAreaEventImageArm;
          //ArmAreaListView.Items[i].StateIndex := con_AlarmStateNormalEvent;
        end;
        3 : begin
          if nBuildingSecurityMode = 1 then nImageIndex := con_BuildingArmAreaAlarmImageDisArm
          else if nBuildingSecurityMode = 2 then nImageIndex := con_BuildingArmAreaAlarmImagePartArm
          else if nBuildingSecurityMode = 3 then nImageIndex := con_BuildingArmAreaAlarmImageArm;
          //ArmAreaListView.Items[i].StateIndex := con_AlarmStateAlarmEvent;
        end;
        else begin
          if nBuildingSecurityMode = 1 then nImageIndex := con_BuildingArmAreaNormalImageDisArm
          else if nBuildingSecurityMode = 2 then nImageIndex := con_BuildingArmAreaNormalImagePartArm
          else if nBuildingSecurityMode = 3 then nImageIndex := con_BuildingArmAreaNormalImageArm;
          //ArmAreaListView.Items[i].StateIndex := con_AlarmStateNotEvent;
        end;
      end;

    end;
  Except
    Exit;
  End;
end;

procedure TfmMapMonitoring.ChangeAccessEventIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelAccessEventIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelAccessEventIndexArray[i] := L_arrRelAccessEventIndexArray[i - 1];
    end;
    L_arrRelAccessEventIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
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

procedure TfmMapMonitoring.ChangeAlarmEventIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelAlarmEventIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelAlarmEventIndexArray[i] := L_arrRelAlarmEventIndexArray[i - 1];
    end;
    L_arrRelAlarmEventIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
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

procedure TfmMapMonitoring.ChangeAlarmModeIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelAlarmModeIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelAlarmModeIndexArray[i] := L_arrRelAlarmModeIndexArray[i - 1];
    end;
    L_arrRelAlarmModeIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelAlarmModeIndexArray[i] := L_arrRelAlarmModeIndexArray[i + 1];
    end;
    L_arrRelAlarmModeIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelAlarmModeIndexArray) to HIGH(L_arrRelAlarmModeIndexArray) do
  begin
    L_arrAlarmModeIndexArray[L_arrRelAlarmModeIndexArray[i]] := i;
  end;

end;

procedure TfmMapMonitoring.ChangeDeviceEventIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelDeviceEventIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelDeviceEventIndexArray[i] := L_arrRelDeviceEventIndexArray[i - 1];
    end;
    L_arrRelDeviceEventIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelDeviceEventIndexArray[i] := L_arrRelDeviceEventIndexArray[i + 1];
    end;
    L_arrRelDeviceEventIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelDeviceEventIndexArray) to HIGH(L_arrRelDeviceEventIndexArray) do
  begin
    L_arrDeviceEventIndexArray[L_arrRelDeviceEventIndexArray[i]] := i;
  end;

end;

procedure TfmMapMonitoring.DeviceAlarmEvent(aDecoderNo:integer;aNodeNo, aECUID, aExtendID, aCmd,
  aMsgNo, aTime, aSubCLass, aSubAddr, aArmAreaNo, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string);
var
  nIndex : integer;
  stNodename : string;
  stDoorName : string;
  stNodeIP : string;
  stAlarmAreaName : string;
  stAlarmDeviceTypeName : string;
  stAlarmModeName : string;
  stEmSeq,stEmName,stCompanyName,stEmCode,stPosiName : string;
  stNodeNo : string;
begin
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
  if (aAlarmStateCode = G_stLongTimeStateCode) or
     (aAlarmStateCode = G_stFireStateCode) or
     (aAlarmStateCode = 'AF') or
     (aAlarmStateCode = 'AN') or
     (aAlarmStateCode = 'CO') or
     (aAlarmStateCode = 'CC') or
     (aAlarmStateCode = 'NF') or
     (aAlarmStateCode = 'NR')
  then
  begin

    nIndex := PCClientSocketList.IndexOf(inttostr(aDecoderNo));
    if nIndex > -1 then
    begin
      stNodename := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeName(stNodeNo);
      stDoorName := '';
      if aAlarmStateCode = G_stLongTimeStateCode then
      begin
        stDoorName := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeDeviceToDoorName(stNodeNo,aEcuID,aSubCLass[2]);
      end;
    end;
    with sg_AccessAlarmEvent do
    begin
      if Cells[L_arrDeviceEventIndexArray[0],1] <> '' then InsertRows(1,1);
      Cells[L_arrDeviceEventIndexArray[0],1] := MakeDatetimeStr(aTime);
      Cells[L_arrDeviceEventIndexArray[1],1] := stNodename;
      Cells[L_arrDeviceEventIndexArray[2],1] := aECUID;
      Cells[L_arrDeviceEventIndexArray[3],1] := stDoorName;
      Cells[L_arrDeviceEventIndexArray[4],1] := aAlarmStatePCCodeName;

      if (aAlarmStatePCCode = '000FI001') or   //화재발생
        (aAlarmStateCode = 'AF') or
        (aAlarmStateCode = 'CO') or
        (aAlarmStateCode = 'NF')
      then
      begin
        RowColor[1] := clWebDarkOrange;
      end;
      if RowCount > 1000 then RowCount := 1000;
    end;
  end;
  if aCmd <> 'A' then Exit;
  if Not G_bAlarmMonitoringUse then Exit; //TEST

  if Not isDigit(aArmAreaNo) then aArmAreaNo := '0'
  else aArmAreaNo := inttostr(strtoint(aArmAreaNo));

  nIndex := PCClientSocketList.IndexOf(inttostr(aDecoderNo));
  //nIndex := G_MonitoringNodeList.Indexof(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex > -1 then
  begin
    stNodeIP := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeIP(stNodeNo);
    stAlarmAreaName := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaName,stNodeNo,aEcuID,aArmAreaNo);
  end;
  stAlarmDeviceTypeName := dmFormFunction.GetAlarmDeviceTypeName(aSubCLass);
  stAlarmModeName := dmFormFunction.GetAlarmModeName(aMode);

  Try
    if aArmModeChange <> '1' then
    begin
      //AlarmEvent
      if aAlarmView = '0' then Exit;
      with sg_AlarmEvent do
      begin
        if Cells[L_arrAlarmEventIndexArray[0],1] <> '' then InsertRows(1,1);
        Cells[L_arrAlarmEventIndexArray[0],1] := MakeDatetimeStr(aTime);
        Cells[L_arrAlarmEventIndexArray[1],1] := stNodeIP;
        Cells[L_arrAlarmEventIndexArray[2],1] := aECUID;
        Cells[L_arrAlarmEventIndexArray[3],1] := aArmAreaNo;
        Cells[L_arrAlarmEventIndexArray[4],1] := stAlarmAreaName;
        Cells[L_arrAlarmEventIndexArray[5],1] := stAlarmDeviceTypeName;
        Cells[L_arrAlarmEventIndexArray[6],1] := aSubAddr;
        Cells[L_arrAlarmEventIndexArray[7],1] := stAlarmModeName;
        Cells[L_arrAlarmEventIndexArray[8],1] := aLoop;
        Cells[L_arrAlarmEventIndexArray[9],1] := aAlarmStatePCCodeName;
        Cells[L_arrAlarmEventIndexArray[10],1] := aNodeNo;
        Cells[L_arrAlarmEventIndexArray[11],1] := aMsgNo;
        Cells[L_arrAlarmEventIndexArray[12],1] := aTime;
        Cells[L_arrAlarmEventIndexArray[13],1] := aExtendID;
        if isDigit(aAlarmColor) then
          RowColor[1] := strtoint(aAlarmColor);
      end;
    end else
    begin
      with sg_ModeChange do
      begin
        if Cells[L_arrAlarmModeIndexArray[0],1] <> '' then InsertRows(1,1);
        Cells[L_arrAlarmModeIndexArray[0],1] := MakeDatetimeStr(aTime);
        Cells[L_arrAlarmModeIndexArray[1],1] := stNodeIP;
        Cells[L_arrAlarmModeIndexArray[2],1] := aECUID;
        Cells[L_arrAlarmModeIndexArray[3],1] := aArmAreaNo;
        Cells[L_arrAlarmModeIndexArray[4],1] := stAlarmAreaName;
        Cells[L_arrAlarmModeIndexArray[5],1] := aAlarmStatePCCodeName;
        Cells[L_arrAlarmModeIndexArray[6],1] := aOper;
        dmFormFunction.GetCardToEmployeeInfo(aOper,stEmSeq,stEmName,stCompanyName,stEmCode,stPosiName);
        Cells[L_arrAlarmModeIndexArray[7],1] := stEmName;
        Cells[L_arrAlarmModeIndexArray[8],1] := stCompanyName;
        Cells[L_arrAlarmModeIndexArray[9],1] := stEmCode;
        if isDigit(aAlarmColor) then
          RowColor[1] := strtoint(aAlarmColor);
      end;
    end;
  Except
    Exit;
  End;
  if aAlarmSound = '1' then
  begin
    fmMain.FORMALARMMESSAGE(stAlarmAreaName + '-' + aAlarmStatePCCodeName);
  end;
end;

procedure TfmMapMonitoring.DeviceCardAccessEvent(aDecoderNo:integer;aTime, aNodeNo, aEcuID, aDoorNo,
  aReaderNo, aInOut, aInOutName, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aAccessPermitName, aDoorState, aATButton, aType, aArmAreaNo,
  aCardno, aCompanyCode, aCompanyName, aEmSeq, aEmCode, aEmName, aPosiCode,
  aPosiName,aPrintNo,aHandPhone: string);
var
  nIndex : integer;
  stDoorName : string;
  stNodeNo : string;
begin
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
  nIndex := PCClientSocketList.IndexOf(inttostr(aDecoderNo));
  if nIndex > -1 then
  begin
    stDoorName := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeDeviceToDoorName(stNodeNo,aEcuID,aDoorNo);
  end;

  with sg_AccessEvent do
  begin
    if Cells[L_arrAccessEventIndexArray[0],1] <> '' then InsertRows(1,1);
    Cells[L_arrAccessEventIndexArray[0],1] := MakeDatetimeStr(aTime);
    Cells[L_arrAccessEventIndexArray[1],1] := stDoorName;
    if aType = 'B' then
    begin
      Cells[L_arrAccessEventIndexArray[2],1] := dmFormFunction.GetAccessControlTypeName(aChangeState[1]);
      (*case aChangeState[1] of
        'R' : Cells[L_arrAccessEventIndexArray[2],1] := '원격제어';
        'P' : Cells[L_arrAccessEventIndexArray[2],1] := '전화';
        'B' : Cells[L_arrAccessEventIndexArray[2],1] := '퇴실버튼';
        'S' : Cells[L_arrAccessEventIndexArray[2],1] := '스케줄';
        'F' : Cells[L_arrAccessEventIndexArray[2],1] := '화재발생';
        'f' : Cells[L_arrAccessEventIndexArray[2],1] := '원격화재';
      end;
      *)
    end else Cells[L_arrAccessEventIndexArray[2],1] := aCardno;
    Cells[L_arrAccessEventIndexArray[3],1] := aEmName;
    Cells[L_arrAccessEventIndexArray[4],1] := aCompanyName;
    Cells[L_arrAccessEventIndexArray[5],1] := aEmCode;
    Cells[L_arrAccessEventIndexArray[6],1] := aReaderNo;
    Cells[L_arrAccessEventIndexArray[7],1] := aInOutName;
    Cells[L_arrAccessEventIndexArray[8],1] := aAccessPermitName;
    Cells[L_arrAccessEventIndexArray[9],1] := aATButton;

    case aAccessResult[1] of
      '1','2' : begin  //출입승인

      end;
      '3','4' : begin  //방범승인

      end;
      'A' : begin       //미등록 카드
        RowColor[1] := clFuchsia;
      end;
      'B' : begin       //출입조작 권한 불가
        RowColor[1] := clFuchsia;
      end;
      'C' : begin       //방범조작 권한 불가
        RowColor[1] := clFuchsia;
      end;
      'D' : begin       //경계모드 출입 불가
        RowColor[1] := clFuchsia;
      end;
      'E' : begin       //출입 제한 시간
        RowColor[1] := clFuchsia;
      end;
      'F' : begin       //유효기간 만료
        RowColor[1] := clFuchsia;
      end;
      'G' : begin       //근태
        RowColor[1] := clYellow;
      end;
      'H' : begin       //폐쇄모드출입불가
        RowColor[1] := clFuchsia;
      end;
      'I' : begin       //구역다름
        RowColor[1] := clFuchsia;
      end;
      'J' : begin       //안티패스 불가
        RowColor[1] := clFuchsia;
      end;
    end;

    if RowCount > 1000 then RowCount := 1000;

  end;
end;

procedure TfmMapMonitoring.DeviceReload;
begin
  LoadBuildingArmArea;
end;

procedure TfmMapMonitoring.DoorChangeEvent(aDecoderNo:integer;aNodeNo, aEcuID, aType, aNo, aCmd,
  aData, aBuildingCode: string);
var
  stDoorID : string;
  nIndex : Integer;
  hobj : integer;
  mydata:PMyData;
  nBuildingIndex : integer;
  nImageIndex : integer;
  stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent : string;
  stBuildingCode : string;
begin
  stDoorID := FillZeroNumber(aDecoderNo,G_nDecoderCodeLength) + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aNo;
  nIndex := SubAccessCodeList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  stBuildingCode := copy(aBuildingCode,1,G_nBuildingCodeLength * G_nBuildingStep + 1);
  hobj := TMapDoor(SubAccessCodeList.Objects[nIndex]).hobj;
  mydata:=ImageEnVect1.ObjUserData[ hobj ];
  if mydata <> nil then
  begin
    nBuildingIndex := G_MonitoringBuildingList.IndexOf(stBuildingCode);
    if nBuildingIndex > -1 then
    begin
      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nBuildingIndex]).GetDoorCurrentState(aDecoderNo,aNodeNo,aEcuID,aNo,stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then
      begin
        if stDoorFireEvent = '1' then
        begin
          //ImageEnVect1.SetObjBitmapFromFile(hobj, G_stExeFolder + '\dfc.bmp');
          if stDoorDSState = 'C' then
          begin
            if FileExists(G_stExeFolder + '\dfc.bmp') then
               ImageEnVect1.SetObjBitmapFromFile(hobj, G_stExeFolder + '\dfc.bmp');
          end else
          begin
            if FileExists(G_stExeFolder + '\dfo.bmp') then
              ImageEnVect1.SetObjBitmapFromFile(hobj, G_stExeFolder + '\dfo.bmp');
          end;
        end else
        begin
          nImageIndex := GetDoorImageIndex(stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState);
          if FileExists(G_stExeFolder + '\d' + FillZeroNumber(nImageIndex,2) + '.bmp') then
            ImageEnVect1.SetObjBitmapFromFile(hobj, G_stExeFolder + '\d' + FillZeroNumber(nImageIndex,2) + '.bmp');
          ImageEnVect1.Refresh;
        end;
      end;
    end;
  end;
end;

procedure TfmMapMonitoring.doorListViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  stLockType : string;
  bJavaraType : Boolean;
begin
  if Selected then
  begin
      stLockType := TListView(Sender).Selected.SubItems.Strings[1];
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
end;

procedure TfmMapMonitoring.FormActivate(Sender: TObject);
begin
  inherited;
  ActiveTimer.Enabled := True;

end;

procedure TfmMapMonitoring.FormChangeEvent(aFormName: integer);
begin

end;

procedure TfmMapMonitoring.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini_fun : TiniFile;
  i : integer;
begin
  WriteIniConfig;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MapMonitoring.INI');
    with ini_fun do
    begin
      WriteInteger('Form','DoorDeviceWidth',Pan_Device.Width);
      WriteInteger('Form','AccessEventHeight',L_nAccessEventHeight);
      WriteInteger('Form','AlarmDeviceWidth',pan_AlarmDevice.Width);
      WriteInteger('Form','AlarmEventHeight',L_nAlarmEventHeight);
    end;
  Finally
    ini_fun.Free;
  End;
  fmMain.FORMENABLE(con_FormBMOSMAPMONITOR,'FALSE');

  AlarmTimer.Enabled := False;

  BuildingCodeList.Free;
  BuildingArmAreaList.Free;
  BuildingDoorList.Free;

  if SubAccessCodeList.Count > 0 then
  begin
    for i := SubAccessCodeList.Count - 1 downto 0 do
    begin
      TMapDoor(SubAccessCodeList.Objects[i]).Free;
      SubAccessCodeList.Delete(i);
    end;
  end;
  SubAccessCodeList.Clear;
  SubAccessCodeList.Free;

  if SubAlarmCodeList.Count > 0 then
  begin
    for i := SubAlarmCodeList.Count - 1 downto 0 do
    begin
      TMapAlarm(SubAlarmCodeList.Objects[i]).Free;
      SubAlarmCodeList.Delete(i);
    end;
  end;
  SubAlarmCodeList.Clear;
  SubAlarmCodeList.Free;
  AlarmEventCodeList.Free;
  Action := caFree;
end;

procedure TfmMapMonitoring.FormCreate(Sender: TObject);
begin
  inherited;
  BuildingCodeList := TStringList.Create;
  BuildingArmAreaList := TStringList.Create;
  BuildingDoorList := TStringList.Create;
  AccessEventHeaderNameList := TStringList.Create;
  DeviceEventHeaderNameList := TStringList.Create;
  AlarmEventHeaderNameList := TStringList.Create;
  AlarmModeHeaderNameList := TStringList.Create;
  SubAccessCodeList := TStringList.Create;
  SubAlarmCodeList := TStringList.Create;
  AlarmEventCodeList := TStringList.Create;

  Load_AccessBuildingCode;
  Load_AlarmBuildingCode;
  LoadDoorExampleImage;

  PageControl1.ActivePageIndex := 0;
  sg_AccessEvent.RowCount := 2;
  sg_AccessAlarmEvent.RowCount := 2;

  sg_ModeChange.RowCount := 2;
  ap_AlarmEvent.ActivePageIndex := 0;
  FormNameSetting;

end;

procedure TfmMapMonitoring.FormGradeRefresh;
begin

end;

procedure TfmMapMonitoring.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmMapMonitoring.FormNameSetting: Boolean;
begin
  Caption := dmFormFunction.GetFormName('2','2','BM3_012Caption');
  ap_Access.Caption := dmFormFunction.GetFormName('2','2','BM3_012AccessMonitor');
  ap_Alarm.Caption := dmFormFunction.GetFormName('2','2','BM3_012AlarmMonitor');
  lb_List.Caption := dmFormFunction.GetFormName('0','2','COMMONBUILDINGLIST');
  lb_List1.Caption := dmFormFunction.GetFormName('0','2','COMMONBUILDINGLIST');
  sg_AccessBuildingCode.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  sg_AlarmBuildingCode.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');

  //lb_FloorName1.Caption := dmFormFunction.GetFormName('2','2','BM3_012AlarmState');
  lb_AlarmState1.Caption := dmFormFunction.GetFormName('2','2','BM3_012AlarmState');
  lb_DisArmMode.Caption := dmFormFunction.GetFormName('2','2','BM3_012DisArmMode');
  lb_ArmMode.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmMode');
  lb_AlarmEvent.Caption := dmFormFunction.GetFormName('2','2','BM3_012Alarm');
  lb_DoorstateExample.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  gb_AlarmStateExample.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  lb_AlarmstateExample.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  lb_DoorOpenModeOpen.Caption := dmFormFunction.GetFormName('0','2','COMDOOROPENMODEOPEN');
  lb_DoorOpenModeClose.Caption := dmFormFunction.GetFormName('0','2','COMDOOROPENMODECLOSE');
  lb_DoorCloseModeOpen.Caption := dmFormFunction.GetFormName('0','2','COMDOORCLOSEMODEOPEN');
  lb_DoorCloseModeClose.Caption := dmFormFunction.GetFormName('0','2','COMDOORCLOSEMODECLOSE');
  lb_DoorLockModeOpen.Caption := dmFormFunction.GetFormName('0','2','COMDOORLOCKMODEOPEN');
  lb_DoorLockModeClose.Caption := dmFormFunction.GetFormName('0','2','COMDOORLOCKMODECLOSE');
  lb_DoorTimeOver.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorTimeOver');
  lb_DoorFire.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorFire');
  lb_DoorNodeIP.Caption := dmFormFunction.GetFormName('2','2','BM3_012NodeIP');
  lb_DoorDeviceID.Caption := dmFormFunction.GetFormName('2','2','BM3_012DeviceID');
  lb_DoorID.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorID');
  lb_DoorPositoin.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorPosition');
  btn_DoorInfoConfirm.Caption := dmFormFunction.GetFormName('0','2','COMMONCONFIRM');
  lb_DoorInfo.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorInfo');
  lb_DoorName1.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  lb_ArmAreaInfo.Caption := dmFormFunction.GetFormName('0','2','BM3_012ArmAreaInfo');
  lb_ArmAreaName1.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREANAME');
  lb_ArmAreaNodeIP.Caption := dmFormFunction.GetFormName('2','2','BM3_012NodeIP');
  lb_ArmAreaDeviceID.Caption := dmFormFunction.GetFormName('2','2','BM3_012DeviceID');
  lb_ArmAreaNo1.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREANO');
  lb_ArmAreaPositoin.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmAreaPosition');
  lb_ArmAreaTelno1.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmAreaTel');
  lb_ArmAreaMemo.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmAreaMemo');
  btn_ArmAreaInfoConfirm.Caption := dmFormFunction.GetFormName('0','2','COMMONCONFIRM');
  tb_AccessEvent.Caption := dmFormFunction.GetFormName('2','2','BM3_012AccessEvent') + ' ';
  tb_AccessAlarm.Caption := dmFormFunction.GetFormName('2','2','BM3_012AccessAlarm') + ' ';
  tb_AlarmEvent.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmEvent') + ' ';
  tb_ArmModeChange.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmModeChange') + ' ';

  mn_DoorOpen.Caption := dmFormFunction.GetFormName('0','2','COMDOOROPEN');
  pm_JavarOpen.Caption := dmFormFunction.GetFormName('0','2','COMJAVARAOPEN');
  pm_JavarClose.Caption := dmFormFunction.GetFormName('0','2','COMJAVARACLOSE');
  pm_DoorManageMode.Caption := dmFormFunction.GetFormName('0','2','COMMONCLOSEMODE');
  pm_DooOpenMode.Caption := dmFormFunction.GetFormName('0','2','COMMONOPENMODE');
  pm_DoorCloseMode.Caption := dmFormFunction.GetFormName('0','2','COMMONLOCKMODE');
  Positive1.Caption  := dmFormFunction.GetFormName('0','2','COMDOORPOSI');
  Negative1.Caption  := dmFormFunction.GetFormName('0','2','COMDOORNEGA');
  mn_CardMode.Caption  := dmFormFunction.GetFormName('0','2','COMDOORCARDMODE');
  pm_DoorStateCheck.Caption := dmFormFunction.GetFormName('0','2','COMDOORSTATESEARCH');
  N11.Caption := dmFormFunction.GetFormName('0','2','COMSCREEN');
  pm_DoorInfo.Caption := dmFormFunction.GetFormName('2','2','BM3_012DoorInfo');
  pm_AlarmConfirm.Caption := dmFormFunction.GetFormName('0','2','COMALARMCONFIRM');
  pm_ArmAreaStateSearch.Caption := dmFormFunction.GetFormName('0','2','COMARMSTATESEARCH');
  pm_ArmModeChange.Caption := dmFormFunction.GetFormName('2','2','BM3_012ArmMode');
  pm_DisArmModeChange.Caption := dmFormFunction.GetFormName('2','2','BM3_012DisArmMode');
  pm_DeviceInfo.Caption := dmFormFunction.GetFormName('0','2','COMDEVICEINFO');
  pm_AlarmReport.Caption := dmFormFunction.GetFormName('2','1','BM4_013');
  mn_AlarmConfirm1.Caption := dmFormFunction.GetFormName('0','2','COMALARMCONFIRM');
  mn_CardNOCopy.Caption := dmFormFunction.GetFormName('0','2','COMCARDNOCOPY');
end;

procedure TfmMapMonitoring.FormResize(Sender: TObject);
begin
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

  ReSizeTimer.Enabled := False;
  ReSizeTimer.Enabled := True;

  pan_AlarmStateResize(pan_AlarmState);


end;

procedure TfmMapMonitoring.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  inherited;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MapMonitoring.INI');
    with ini_fun do
    begin
      Pan_Device.Width := ReadInteger('Form','DoorDeviceWidth',256);
      L_nAccessEventHeight := ReadInteger('Form','AccessEventHeight',230);
      pan_AccessEvent.Height := L_nAccessEventHeight;
      pan_AlarmDevice.Width := ReadInteger('Form','AlarmDeviceWidth',256);
      L_nAlarmEventHeight := ReadInteger('Form','AlarmEventHeight',230);
      pan_AlarmEvent.Height := L_nAlarmEventHeight;
    end;
  Finally
    ini_fun.Free;
  End;

  ListHeaderNameGet;  //먼저 가져 온 후...

  SetLength(L_arrAccessEventIndexArray,AccessEventHeaderNameList.Count);
  SetLength(L_arrRelAccessEventIndexArray,AccessEventHeaderNameList.Count);
  SetLength(L_arrAccessEventShowTable,AccessEventHeaderNameList.Count);
  SetLength(L_arrAccessEventSizeTable,AccessEventHeaderNameList.Count);

  SetLength(L_arrDeviceEventIndexArray,DeviceEventHeaderNameList.Count);
  SetLength(L_arrRelDeviceEventIndexArray,DeviceEventHeaderNameList.Count);
  SetLength(L_arrDeviceEventShowTable,DeviceEventHeaderNameList.Count);
  SetLength(L_arrDeviceEventSizeTable,DeviceEventHeaderNameList.Count);

  SetLength(L_arrAlarmEventIndexArray,AlarmEventHeaderNameList.Count);
  SetLength(L_arrRelAlarmEventIndexArray,AlarmEventHeaderNameList.Count);
  SetLength(L_arrAlarmEventShowTable,AlarmEventHeaderNameList.Count);
  SetLength(L_arrAlarmEventSizeTable,AlarmEventHeaderNameList.Count);

  SetLength(L_arrAlarmModeIndexArray,AlarmModeHeaderNameList.Count);
  SetLength(L_arrRelAlarmModeIndexArray,AlarmModeHeaderNameList.Count);
  SetLength(L_arrAlarmModeShowTable,AlarmModeHeaderNameList.Count);
  SetLength(L_arrAlarmModeSizeTable,AlarmModeHeaderNameList.Count);

  ListConfigRead;
  ListHeaderNameSetting;

  pm_ArmAreaStateSearch.Visible := True;
  pm_ArmModeChange.Visible := True;
  pm_DisArmModeChange.Visible := True;
  N6.Visible := True;
  N14.Visible := True;
  pm_DeviceInfo.Visible := True;
  N1.Visible := True;
  pm_AlarmReport.Visible := True;

  fmMain.FORMENABLE(con_FormBMOSMAPMONITOR,'TRUE');
  fmMain.FORMALARMCONFIRMExecute;

  ap_Alarm.TabVisible := G_bAlarmMonitoringUse;
  ap_Access.TabVisible := G_bAccessMonitoringUse;
  if ap_Access.TabVisible then AdvOfficePager1.ActivePage := ap_Access
  else AdvOfficePager1.ActivePage := ap_Alarm;
end;

function TfmMapMonitoring.GetDoorImageIndex(aDoorCardMode, aDoorManageMode,
  aDoorDSState, aDoorLSState: string): integer;
begin
  result := 0; //상태 모름
  if aDoorCardMode = '' then Exit;
  if aDoorManageMode = '' then Exit;
  if aDoorDSState = '' then Exit;
  //if aDoorLSState = '' then Exit;   //LS는 현재 사용하지 않음
  case aDoorManageMode[1] of
    '0' : begin       //운영
      case aDoorCardMode[1] of
        '0' :
          begin
            if aDoorDSState = 'C' then result := con_DoorPMC
            else if aDoorDSState = 'O' then result := con_DoorPMO
            else if aDoorDSState = 'T' then result := con_DoorPMT
            else if aDoorDSState = 'D' then result := con_DoorPMD
            else if aDoorDSState = 'U' then result := con_DoorPMU
            else if aDoorDSState = 'L' then result := con_DoorPML;
          end;
        '1' :
          begin
            if aDoorDSState = 'C' then result := con_DoorNMC
            else if aDoorDSState = 'O' then result := con_DoorNMO
            else if aDoorDSState = 'T' then result := con_DoorNMT
            else if aDoorDSState = 'D' then result := con_DoorNMD
            else if aDoorDSState = 'U' then result := con_DoorNMU
            else if aDoorDSState = 'L' then result := con_DoorNML;
          end;
        else result := 0;
      end;
    end;
    '1' : begin      //개방
      case aDoorCardMode[1] of
        '0' :
          begin
            if aDoorDSState = 'C' then result := con_DoorPOC
            else if aDoorDSState = 'O' then result := con_DoorPOO
            else if aDoorDSState = 'T' then result := con_DoorPOT
            else if aDoorDSState = 'D' then result := con_DoorPOD
            else if aDoorDSState = 'U' then result := con_DoorPOU
            else if aDoorDSState = 'L' then result := con_DoorPOL;
          end;
        '1' :
          begin
            if aDoorDSState = 'C' then result := con_DoorNOC
            else if aDoorDSState = 'O' then result := con_DoorNOO
            else if aDoorDSState = 'T' then result := con_DoorNOT
            else if aDoorDSState = 'D' then result := con_DoorNOD
            else if aDoorDSState = 'U' then result := con_DoorNOU
            else if aDoorDSState = 'L' then result := con_DoorNOL;
          end;
        else result := 0;
      end;
    end;
    '2' : begin      //폐쇄
      case aDoorCardMode[1] of
        '0' :
          begin
            if aDoorDSState = 'C' then result := con_DoorPCC
            else if aDoorDSState = 'O' then result := con_DoorPCO
            else if aDoorDSState = 'T' then result := con_DoorPCT
            else if aDoorDSState = 'D' then result := con_DoorPCD
            else if aDoorDSState = 'U' then result := con_DoorPCU
            else if aDoorDSState = 'L' then result := con_DoorPCL;
          end;
        '1' :
          begin
            if aDoorDSState = 'C' then result := con_DoorNCC
            else if aDoorDSState = 'O' then result := con_DoorNCO
            else if aDoorDSState = 'T' then result := con_DoorNCT
            else if aDoorDSState = 'D' then result := con_DoorNCD
            else if aDoorDSState = 'U' then result := con_DoorNCU
            else if aDoorDSState = 'L' then result := con_DoorNCL;
          end;
        else result := 0;
      end;
    end;
    else begin
      result := 0;
    end;
  end;
end;

function TfmMapMonitoring.GetDoorManageModeImageIndex(aDoorCardMode,
  aDoorManageMode: string): integer;
begin
  result := -1;
  if aDoorCardMode = '' then Exit;
  if aDoorManageMode = '' then Exit;
  case aDoorManageMode[1] of
    '0' : begin       //운영
      case aDoorCardMode[1] of
        '0' : result := con_DoorStatePosiManageMode;
        '1' : result := con_DoorStateNegaManageMode;
        else result := -1;
      end;
    end;
    '1' : begin      //개방
      case aDoorCardMode[1] of
        '0' : result := con_DoorStatePosiOpenMode;
        '1' : result := con_DoorStateNegaOpenMode;
        else result := -1;
      end;
    end;
    '2' : begin      //폐쇄
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

function TfmMapMonitoring.GetDoorStateImageIndex(aDoorDSState, aDoorLSState,
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
    'C': //닫힘
      begin
        result := con_DoorImageClose;
      end;
    'O': //열림
      begin
        result := con_DoorImageOpen;
      end;
    'E': //에러
      begin
        //result := ;
      end;
    'T','D'://장시간 열림
      begin
        result := con_DoorImageLongTime;
      end;
    'U':    //해정이상
      begin
        result := con_DoorImageClose;
      end;
    'L':    //시정이상
      begin
        result := con_DoorImageOpen;
      end;
  end;
end;

procedure TfmMapMonitoring.ImageEnVect1DblClick(Sender: TObject);
begin
  inherited;
  if Not IsInsertGrade then
  begin
    mn_DoorOpen.Enabled := False;
    pm_JavarOpen.Enabled := False;
    pm_JavarClose.Enabled := False;
    pm_DoorManageMode.Enabled := False;
    pm_DooOpenMode.Enabled := False;
    pm_DoorCloseMode.Enabled := False;
    mn_CardMode.Enabled := False;
  end else
  begin
    mn_DoorOpen.Enabled := True;
    pm_JavarOpen.Enabled := True;
    pm_JavarClose.Enabled := True;
    pm_DoorManageMode.Enabled := True;
    pm_DooOpenMode.Enabled := True;
    pm_DoorCloseMode.Enabled := True;
    mn_CardMode.Enabled := True;
  end;
end;

procedure TfmMapMonitoring.ImageEnVect1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  lb_name.Top := y + 30;
  lb_name.Left := X - (lb_name.Width div 2);
end;

procedure TfmMapMonitoring.ImageEnVect1ObjectOver(Sender: TObject;
  hobj: Integer);
begin
  inherited;
//  ImageEnVect1.MouseInteractVt:=[miObjectSelect];
  ImageEnVect1.UnSelAllObjects;
  ImageEnVect1.AddSelObject(hobj);
  //ImageEnVect1.ObjTransparency[hobj] := 250;

end;

procedure TfmMapMonitoring.ImageEnVect1SelectObject(Sender: TObject);
var
  i,hobj:integer;
  mydata:PMyData;
  stDecoderNo,stNodeNo,stEcuID,stDoorNo : string;
begin
  with ImageEnVect1 do
    for i:=0 to ObjectsCount-1 do
    begin
      hobj := GetObjFromIndex( i );
      if IsSelObject( hobj ) then
      begin
        mydata:=ImageEnVect1.ObjUserData[ hobj ];
        if mydata <> nil then
        begin
          //mn_Name.Caption := '선택된위치:' + mydata.ArmAreaName;
          if L_stSelectDoorCode = myData.ArmAreaID then break;
          L_stSelectDoorCode := myData.ArmAreaID;

          stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
          stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
          stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
          stDoorNo := copy( L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
          lb_name.Visible := True;
          //lb_name.Caption.Text := mydata.ArmAreaName;
          lb_name.Caption.Text := dmDBFunction.GetTB_DOOR_DoorName(stNodeNo,stEcuID,stDoorNo);
          mn_Name.Caption := '선택된위치:' + lb_name.Caption.Text;
          if dmDBFunction.CheckTB_DOOR_JavaraType(stNodeNo,stEcuID,stDoorNo) then
          begin
            mn_DoorOpen.Visible := False;
            N9.Visible := False;
            pm_JavarOpen.Visible := True;
            pm_JavarClose.Visible := True;
            pm_DoorManageMode.Visible := False;
            pm_DooOpenMode.Visible := False;
            pm_DoorCloseMode.Visible := False;
          end else
          begin
            mn_DoorOpen.Visible := True;
            N9.Visible := True;
            pm_JavarOpen.Visible := False;
            pm_JavarClose.Visible := False;
            pm_DoorManageMode.Visible := True;
            pm_DooOpenMode.Visible := True;
            pm_DoorCloseMode.Visible := True;
          end;
        end;
        ImageEnVect1.ObjTransparency[hobj] := 300;
        break;
      end else
      begin
        mydata:=ImageEnVect1.ObjUserData[ hobj ];
        if mydata <> nil then
        begin
        end;
        ImageEnVect1.ObjTransparency[hobj] := 200;
      end;
    end;
end;

procedure TfmMapMonitoring.ImageEnVect1ZoomIn(Sender: TObject;
  var NewZoom: Double);
var
  ini_fun : TiniFile;
begin
  inherited;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','MapDoorStateZoom' + L_stAccessSelectBuildingCode,Round(ImageEnVect1.Zoom));
      WriteInteger('Image','MapDoorStateFit' + L_stAccessSelectBuildingCode,0);
    end;
  Finally
    ini_fun.Free;
  End;
  L_bImageFit := False;

end;

procedure TfmMapMonitoring.ImageEnVect2DblClick(Sender: TObject);
begin
  inherited;
  if Not IsInsertGrade then
  begin
    pm_ArmModeChange.Enabled := False;
    pm_DisArmModeChange.Enabled := False;
  end else
  begin
    pm_ArmModeChange.Enabled := True;
    pm_DisArmModeChange.Enabled := True;
  end;
end;

procedure TfmMapMonitoring.ImageEnVect2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  lb_name2.Top := y + 30;
  lb_name2.Left := X - (lb_name2.Width div 2);
end;

procedure TfmMapMonitoring.ImageEnVect2ObjectClick(Sender: TObject;
  hobj: Integer);
begin
  inherited;
  //이 프로세스를 안탄다.
//  ImageEnVect2.MouseInteractVt:=[miUnStampMode];
    ImageEnVect2.UnSelAllObjects;
    ImageEnVect2.AddSelObject(hobj);
    ImageEnVect2.ObjTransparency[hobj] := 250;

end;

procedure TfmMapMonitoring.ImageEnVect2ObjectOver(Sender: TObject;
  hobj: Integer);
begin
  inherited;
//  ImageEnVect2.MouseInteractVt:=[miObjectSelect];
  ImageEnVect2.UnSelAllObjects;
  ImageEnVect2.AddSelObject(hobj);
  //ImageEnVect2.ObjTransparency[hobj] := 250;
end;

procedure TfmMapMonitoring.ImageEnVect2SelectObject(Sender: TObject);
var
  i,hobj:integer;
  mydata:PMyData;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stTemp : string;
  nIndex :integer;
begin
  with ImageEnVect2 do
    for i:=0 to ObjectsCount-1 do
    begin
      hobj := GetObjFromIndex( i );
      if IsSelObject( hobj ) then
      begin
        lb_name2.Visible := True;
        mydata:=ImageEnVect2.ObjUserData[ hobj ];
        if mydata <> nil then
        begin
          L_stSelectArmAreaCode := myData.ArmAreaID;
          stDecoderNo := copy(L_stSelectArmAreaCode,1,G_nDecoderCodeLength);
          nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
          if nIndex > -1 then
          begin
            stNodeNo := copy(L_stSelectArmAreaCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
            stEcuID := copy(L_stSelectArmAreaCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
            stArmAreaNo := copy( L_stSelectArmAreaCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
            stTemp := TdmPCClient(PCClientSocketList.Objects[nIndex]).GetNodeDeviceToArmAreaName(stNodeNo,stEcuID,stArmAreaNo);
          end else
          begin
            stTemp := mydata.ArmAreaName;
          end;
          mn_ArmAreaName.Caption := '선택된위치:' + stTemp;
          lb_name2.Caption.Text := stTemp;

          if copy(L_stSelectArmAreaCode,1,1) = 'C' then
          begin
            pm_1.Visible := False;
            pm_AlarmConfirm.Visible := False;
            pm_ArmAreaStateSearch.Visible := false;
            pm_2.Visible := False;
            pm_ArmModeChange.Visible := False;
            pm_DisArmModeChange.Visible := False;
            pm_3.Visible := False;
            pm_4.Visible := False;
            pm_DeviceInfo.Visible := False;
            pm_DeviceInfo.Visible := False;
            pm_AlarmReport.Visible := False;
            pm_6.Visible := True;
            pm_CCTV1.Visible := True;
          end else
          begin
            pm_1.Visible := True;
            pm_AlarmConfirm.Visible := True;
            pm_ArmAreaStateSearch.Visible := True;
            pm_2.Visible := True;
            pm_ArmModeChange.Visible := True;
            pm_DisArmModeChange.Visible := True;
            pm_3.Visible := True;
            pm_4.Visible := True;
            pm_DeviceInfo.Visible := True;
            pm_DeviceInfo.Visible := True;
            pm_AlarmReport.Visible := True;
            pm_6.Visible := False;
            pm_CCTV1.Visible := False;
          end;

          if AlarmEventCodeList.IndexOf(myData.ArmAreaID) > -1 then continue;
          ImageEnVect2.ObjTransparency[hobj] := 250;
        end;
      end else
      begin

        mydata:=ImageEnVect2.ObjUserData[ hobj ];
        if mydata <> nil then
        begin
          if AlarmEventCodeList.IndexOf(mydata.ArmAreaID) > -1 then continue;
        end;
        ImageEnVect2.ObjTransparency[hobj] := 100;
      end;
    end;
end;

procedure TfmMapMonitoring.ImageEnVect2ZoomIn(Sender: TObject;
  var NewZoom: Double);
var
  ini_fun : TiniFile;
begin
  inherited;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','MapArmAreaStateZoom' + L_stAlarmSelectBuildingCode,Round(ImageEnVect2.Zoom));
      WriteInteger('Image','MapArmAreaStateFit' + L_stAlarmSelectBuildingCode,0);
    end;
  Finally
    ini_fun.Free;
  End;
  L_bImageFit2 := False;
end;

procedure TfmMapMonitoring.lb_AlarmstateExampleMouseEnter(Sender: TObject);
begin
  inherited;
  gb_AlarmStateExample.Visible := True;
end;

procedure TfmMapMonitoring.lb_AlarmstateExampleMouseLeave(Sender: TObject);
begin
  inherited;
  gb_AlarmStateExample.Visible := False;

end;

procedure TfmMapMonitoring.lb_DoorstateExampleMouseEnter(Sender: TObject);
begin
  inherited;
  gb_DoorState.Visible := True;
end;

procedure TfmMapMonitoring.lb_DoorstateExampleMouseLeave(Sender: TObject);
begin
  inherited;
  gb_DoorState.Visible := False;

end;

function TfmMapMonitoring.ListCellSize: Boolean;
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
      else sg_AccessEvent.ColWidths[L_arrAccessEventIndexArray[i]] := 90;
    end;
  end;
  for i := 0 to sg_AccessAlarmEvent.ColCount - 1 do
  begin
    if L_arrDeviceEventShowTable[i] = 0 then
    begin
      sg_AccessAlarmEvent.ColWidths[L_arrDeviceEventIndexArray[i]] := 0;
    end else
    begin
      if L_arrDeviceEventSizeTable[L_arrDeviceEventIndexArray[i]] <> 0 then sg_AccessAlarmEvent.ColWidths[L_arrDeviceEventIndexArray[i]] := L_arrDeviceEventSizeTable[L_arrDeviceEventIndexArray[i]]
      else sg_AccessAlarmEvent.ColWidths[L_arrDeviceEventIndexArray[i]] := 90;
    end;
  end;
  for i := 0 to sg_AlarmEvent.ColCount - 1 do
  begin
    if L_arrAlarmEventShowTable[i] = 0 then
    begin
      sg_AlarmEvent.ColWidths[L_arrAlarmEventIndexArray[i]] := 0;
    end else
    begin
      if L_arrAlarmEventSizeTable[L_arrAlarmEventIndexArray[i]] <> 0 then sg_AlarmEvent.ColWidths[L_arrAlarmEventIndexArray[i]] := L_arrAlarmEventSizeTable[L_arrAlarmEventIndexArray[i]]
      else sg_AlarmEvent.ColWidths[L_arrAlarmEventIndexArray[i]] := 90;
    end;
  end;
  for i := 0 to sg_ModeChange.ColCount - 1 do
  begin
    if L_arrAlarmModeShowTable[i] = 0 then
    begin
      sg_ModeChange.ColWidths[L_arrAlarmModeIndexArray[i]] := 0;
    end else
    begin
      if L_arrAlarmModeSizeTable[L_arrAlarmModeIndexArray[i]] <> 0 then sg_ModeChange.ColWidths[L_arrAlarmModeIndexArray[i]] := L_arrAlarmModeSizeTable[L_arrAlarmModeIndexArray[i]]
      else sg_ModeChange.ColWidths[L_arrAlarmModeIndexArray[i]] := 90;
    end;
  end;
end;

function TfmMapMonitoring.ListConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nAccessEventShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\MapMonitoring.INI');
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
        L_arrAccessEventShowTable[i] := ReadInteger('LIST','RelAccessEventShowArray'+inttostr(i),1);
        L_nAccessEventShowCount := L_nAccessEventShowCount + L_arrAccessEventShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrAccessEventSizeTable) to HIGH(L_arrAccessEventSizeTable) do
      begin
        L_arrAccessEventSizeTable[i] := ReadInteger('LIST','RelAccessEventSizeArray'+inttostr(i),nSize);
      end;

      for i := LOW(L_arrDeviceEventIndexArray) to HIGH(L_arrDeviceEventIndexArray) do
      begin
        L_arrDeviceEventIndexArray[i] := ReadInteger('LIST','DeviceEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelDeviceEventIndexArray) to HIGH(L_arrRelDeviceEventIndexArray) do
      begin
        L_arrRelDeviceEventIndexArray[i] := ReadInteger('LIST','RelDeviceEventIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrDeviceEventShowTable) to HIGH(L_arrDeviceEventShowTable) do
      begin
        L_arrDeviceEventShowTable[i] := ReadInteger('LIST','RelDeviceEventShowArray'+inttostr(i),1);
        L_nDeviceEventShowCount := L_nDeviceEventShowCount + L_arrDeviceEventShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrDeviceEventSizeTable) to HIGH(L_arrDeviceEventSizeTable) do
      begin
        L_arrDeviceEventSizeTable[i] := ReadInteger('LIST','RelDeviceEventSizeArray'+inttostr(i),nSize);
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
        L_arrAlarmEventShowTable[i] := ReadInteger('LIST','RelAlarmEventShowArray'+inttostr(i),1);
        L_nAlarmEventShowCount := L_nAlarmEventShowCount + L_arrAlarmEventShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrAlarmEventSizeTable) to HIGH(L_arrAlarmEventSizeTable) do
      begin
        L_arrAlarmEventSizeTable[i] := ReadInteger('LIST','RelAlarmEventSizeArray'+inttostr(i),nSize);
      end;

      for i := LOW(L_arrAlarmModeIndexArray) to HIGH(L_arrAlarmModeIndexArray) do
      begin
        L_arrAlarmModeIndexArray[i] := ReadInteger('LIST','AlarmModeIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelAlarmModeIndexArray) to HIGH(L_arrRelAlarmModeIndexArray) do
      begin
        L_arrRelAlarmModeIndexArray[i] := ReadInteger('LIST','RelAlarmModeIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrAlarmModeShowTable) to HIGH(L_arrAlarmModeShowTable) do
      begin
        L_arrAlarmModeShowTable[i] := ReadInteger('LIST','RelAlarmModeShowArray'+inttostr(i),1);
        L_nAlarmModeShowCount := L_nAlarmModeShowCount + L_arrAlarmModeShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrAlarmModeSizeTable) to HIGH(L_arrAlarmModeSizeTable) do
      begin
        L_arrAlarmModeSizeTable[i] := ReadInteger('LIST','RelAlarmModeSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

end;

function TfmMapMonitoring.ListFieldNameSetting: Boolean;
begin

end;

function TfmMapMonitoring.ListHeaderNameGet: Boolean;
begin

  if AccessEventHeaderNameList = nil then AccessEventHeaderNameList := TStringList.Create;
  if DeviceEventHeaderNameList = nil then DeviceEventHeaderNameList := TStringList.Create;
  if AlarmEventHeaderNameList = nil then AlarmEventHeaderNameList := TStringList.Create;
  if AlarmModeHeaderNameList = nil then AlarmModeHeaderNameList := TStringList.Create;


  AccessEventHeaderNameList.Clear;
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONACCESSTIME'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDOOR'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANY'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONREADER'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONREADERPOSI'));
  AccessEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONACCESSPERMITNAME'));

  DeviceEventHeaderNameList.Clear;
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODENAME01'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICENO'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDOOR'));
  DeviceEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCONTENT'));

  AlarmEventHeaderNameList.Clear;
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODEIP01'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICENO'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMAREANO'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMAREANAME'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICETYPE'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICENO'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMMODE'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONPORTNO'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCONTENT'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODENO'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODEMSG01'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  AlarmEventHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEXTENDNO'));

  AlarmModeHeaderNameList.Clear;
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODEIP01'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICENO'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMAREANO'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMAREANAME'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONMANGEDETAIL'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANY'));
  AlarmModeHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE'));

  result := True;
end;

function TfmMapMonitoring.ListHeaderNameSetting: Boolean;
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

  sg_AccessAlarmEvent.ColCount := DeviceEventHeaderNameList.Count;
  for i := LOW(L_arrDeviceEventIndexArray) to HIGH(L_arrDeviceEventIndexArray) do
  begin
    if (sg_AccessAlarmEvent.ColCount - 1) < i then Exit;
    if (DeviceEventHeaderNameList.Count - 1) < i then Exit;

    sg_AccessAlarmEvent.cells[L_arrDeviceEventIndexArray[i],0] := DeviceEventHeaderNameList[i];
  end;

  sg_AlarmEvent.ColCount := AlarmEventHeaderNameList.Count;
  for i := LOW(L_arrAlarmEventIndexArray) to HIGH(L_arrAlarmEventIndexArray) do
  begin
    if (sg_AlarmEvent.ColCount - 1) < i then Exit;
    if (AlarmEventHeaderNameList.Count - 1) < i then Exit;

    sg_AlarmEvent.cells[L_arrAlarmEventIndexArray[i],0] := AlarmEventHeaderNameList[i];
  end;

  sg_ModeChange.ColCount := AlarmModeHeaderNameList.Count;
  for i := LOW(L_arrAlarmModeIndexArray) to HIGH(L_arrAlarmModeIndexArray) do
  begin
    if (sg_ModeChange.ColCount - 1) < i then Exit;
    if (AlarmModeHeaderNameList.Count - 1) < i then Exit;

    sg_ModeChange.cells[L_arrAlarmModeIndexArray[i],0] := AlarmModeHeaderNameList[i];
  end;
end;

procedure TfmMapMonitoring.LoadAccessMap;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  ini_fun : TiniFile;
  nZoomSize : integer;
  i : integer;
  hobj : integer;
  mydata:PMyData;
  Stream: TStream;
  oMapDoor : TMapDoor;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  nIndex : integer;
  nBuildingIndex : integer;
  stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent : string;
  nImageIndex : integer;
begin
  if SubAccessCodeList.Count > 0 then
  begin
    for i := SubAccessCodeList.Count - 1 downto 0 do
    begin
      TMapDoor(SubAccessCodeList.Objects[i]).Free;
      SubAccessCodeList.Delete(i);
    end;
  end;
  SubAccessCodeList.Clear;

  if ImageEnVect1.ObjectsCount > 0 then
  begin
    for i := ImageEnVect1.ObjectsCount - 1 downto 0 do
    begin
      hobj := ImageEnVect1.GetObjFromIndex( i );
      ImageEnVect1.RemoveObject(hobj);
    end;
  end;
  ImageEnVect1.Clear;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\setting.INI');
    with ini_fun do
    begin
      nZoomSize := ReadInteger('Image','MapDoorStateZoom' + L_stAccessSelectBuildingCode,100);
      if ReadInteger('Image','MapDoorStateFit' + L_stAccessSelectBuildingCode,1) = 1 then L_bImageFit := True
      else L_bImageFit := False;
    end;
  Finally
    ini_fun.Free;
  End;

  if FileExists(G_stExeFolder + '\' + L_stAccessSelectBuildingCode + '.jpg') then DeleteFile(G_stExeFolder + '\' + L_stAccessSelectBuildingCode + '.jpg');     //파일 삭제
  if FileExists(G_stExeFolder + '\' + L_stAccessSelectBuildingCode + '.iev') then DeleteFile(G_stExeFolder + '\' + L_stAccessSelectBuildingCode + '.iev');
  //여기서 이미지 로딩 하자.
  Try
    if G_nDBType = POSTGRESQL then
    begin
      stSql := ' SELECT BM_DOORMAP,lo_export(TB_BUILDINGMAP.BM_DOORMAP, ' + G_stExeFolder + '\\' + L_stAccessSelectBuildingCode + '.jpg''),lo_export(TB_BUILDINGMAP.BM_DOORMAPINFO, ' + G_stExeFolder + '\\' + L_stAccessSelectBuildingCode + '.iev'') From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''' + L_stAccessSelectBuildingCode + ''' ';
      stSql := stSql + ' AND BM_TYPE = 1 ';
    end else
    begin
      stSql := ' SELECT * From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''' + L_stAccessSelectBuildingCode + ''' ';
      stSql := stSql + ' AND BM_TYPE = 1 ';
    end;

    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount > 0 then
      begin
        if Not FindField('BM_DOORMAP').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_DOORMAP'), G_stExeFolder + '\' + L_stAccessSelectBuildingCode + '.jpg');
          end;
        end;
        if Not FindField('BM_DOORMAPINFO').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_DOORMAPINFO'), G_stExeFolder + '\' + L_stAccessSelectBuildingCode + '.iev');
          end;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  if FileExists(G_stExeFolder + '\' + L_stAccessSelectBuildingCode + '.jpg') then
  begin
    // load the bitmap
    ImageEnVect1.IO.LoadFromFile( G_stExeFolder + '\' + L_stAccessSelectBuildingCode + '.jpg' );
    // look for vectorial objects
    if FileExists(G_stExeFolder + '\' + L_stAccessSelectBuildingCode + '.iev' ) then
      ImageEnVect1.LoadFromFileIEV( G_stExeFolder + '\' + L_stAccessSelectBuildingCode + '.iev' );
    //
    ImageEnVect1.ObjGripPen.Style := psClear;
    ImageEnVect1.ObjGripBrush.Style := bsclear;

//    showmessage(inttostr(ImageEnVect1.Height) + '/' + inttostr(ImageEnVect1.Width));
    ImageEnVect1.Zoom := nZoomSize;
    for i := 0 to ImageEnVect1.ObjectsCount - 1 do
    begin
      hobj := ImageEnVect1.GetObjFromIndex( i );
      mydata:=ImageEnVect1.ObjUserData[ hobj ];
      if mydata<>nil then
      begin
        if SubAccessCodeList.IndexOf(mydata.ArmAreaID) < 0 then
        begin
          oMapDoor := TMapDoor.Create(nil) ;
          oMapDoor.Code := mydata.ArmAreaID;
          oMapDoor.hobj := hobj;
          oMapDoor.Name := dmDBFunction.GetTB_DOOR_DoorName(copy(mydata.ArmAreaID,1,G_nNodeCodeLength),copy(mydata.ArmAreaID,1 + G_nNodeCodeLength,2),copy(mydata.ArmAreaID,1 + G_nNodeCodeLength + 2,1));
          mydata^.ArmAreaName := oMapDoor.Name;
          ImageEnVect1.ObjUserData[hobj]:=mydata;
          ImageEnVect1.ObjUserDataLength[hobj]:=sizeof(TMyData);

          stDecoderNo := copy(mydata.ArmAreaID,1,G_nDecoderCodeLength);
          stNodeNo := copy(mydata.ArmAreaID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
          stEcuID := copy(mydata.ArmAreaID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
          stDoorNo := copy(mydata.ArmAreaID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
          //nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
          nBuildingIndex := G_MonitoringBuildingList.IndexOf(L_stAccessSelectBuildingCode);
          if nBuildingIndex > -1 then
          begin
            if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nBuildingIndex]).GetDoorCurrentState(strtoint(stDecoderNo),stNodeNo,stEcuID,stDoorNo,stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then
            begin
              if stDoorFireEvent = '1' then
              begin
                //ImageEnVect1.SetObjBitmapFromFile(hobj, G_stExeFolder + '\dfc.bmp');
                if stDoorDSState = 'C' then
                begin
                  if FileExists(G_stExeFolder + '\dfc.bmp') then
                     ImageEnVect1.SetObjBitmapFromFile(hobj, G_stExeFolder + '\dfc.bmp');
                end else
                begin
                  if FileExists(G_stExeFolder + '\dfo.bmp') then
                    ImageEnVect1.SetObjBitmapFromFile(hobj, G_stExeFolder + '\dfo.bmp');
                end;
              end else
              begin
                nImageIndex := GetDoorImageIndex(stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState);
                if FileExists(G_stExeFolder + '\d' + FillZeroNumber(nImageIndex,2) + '.bmp') then
                  ImageEnVect1.SetObjBitmapFromFile(hobj, G_stExeFolder + '\d' + FillZeroNumber(nImageIndex,2) + '.bmp');
              end;
            end;
          end;
          SubAccessCodeList.AddObject(mydata.ArmAreaID,oMapDoor);
        end;
      end;
    end;
    if L_bImageFit then
    begin
      ImageEnVect1.Fit;
      mn_ImageFit.Checked := True;
      mn_ImageOrg.Checked := False;
    end else
    begin
      mn_ImageFit.Checked := False;
      mn_ImageOrg.Checked := False;
      if nZoomSize = 100 then mn_ImageOrg.Checked := True;
    end;
  end;

end;


procedure TfmMapMonitoring.LoadAlarmMap;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  ini_fun : TiniFile;
  nZoomSize : integer;
  i : integer;
  hobj : integer;
  mydata:PMyData;
  Stream: TStream;
  oMapAlarm : TMapAlarm;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  nIndex : integer;
begin
  if SubAlarmCodeList.Count > 0 then
  begin
    for i := SubAlarmCodeList.Count - 1 downto 0 do
    begin
      TMapAlarm(SubAlarmCodeList.Objects[i]).Free;
      SubAlarmCodeList.Delete(i);
    end;
  end;
  SubAlarmCodeList.Clear;

  if ImageEnVect2.ObjectsCount > 0 then
  begin
    for i := ImageEnVect2.ObjectsCount - 1 downto 0 do
    begin
      hobj := ImageEnVect2.GetObjFromIndex( i );
      ImageEnVect2.RemoveObject(hobj);
    end;
  end;
  ImageEnVect2.Clear;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\setting.INI');
    with ini_fun do
    begin
      nZoomSize := ReadInteger('Image','MapArmAreaStateZoom' + L_stAlarmSelectBuildingCode,100);
      if ReadInteger('Image','MapArmAreaStateFit' + L_stAlarmSelectBuildingCode,1) = 1 then L_bImageFit2 := True
      else L_bImageFit2 := False;
    end;
  Finally
    ini_fun.Free;
  End;

  if FileExists(G_stExeFolder + '\' + L_stAlarmSelectBuildingCode + '.jpg') then DeleteFile(G_stExeFolder + '\' + L_stAlarmSelectBuildingCode + '.jpg');     //파일 삭제
  if FileExists(G_stExeFolder + '\' + L_stAlarmSelectBuildingCode + '.iev') then DeleteFile(G_stExeFolder + '\' + L_stAlarmSelectBuildingCode + '.iev');
  //여기서 이미지 로딩 하자.
  Try
    if G_nDBType = POSTGRESQL then
    begin
      stSql := ' SELECT BM_MAP,lo_export(TB_BUILDINGMAP.BM_MAP, ' + G_stExeFolder + '\\' + L_stAlarmSelectBuildingCode + '.jpg''),lo_export(TB_BUILDINGMAP.BM_MAPINFO, ' + G_stExeFolder + '\\' + L_stAlarmSelectBuildingCode + '.iev'') From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''' + L_stAlarmSelectBuildingCode + ''' ';
      stSql := stSql + ' AND BM_TYPE = 2 ';
    end else
    begin
      stSql := ' SELECT * From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''' + L_stAlarmSelectBuildingCode + ''' ';
      stSql := stSql + ' AND BM_TYPE = 2 ';
    end;

    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;

      if RecordCount > 0 then
      begin
        if Not FindField('BM_MAP').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_MAP'), G_stExeFolder + '\' + L_stAlarmSelectBuildingCode + '.jpg');
          end;
        end;
        if Not FindField('BM_MAPINFO').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_MAPINFO'), G_stExeFolder + '\' + L_stAlarmSelectBuildingCode + '.iev');
          end;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  if FileExists(G_stExeFolder + '\' + L_stAlarmSelectBuildingCode + '.jpg') then
  begin
    // load the bitmap
    ImageEnVect2.IO.LoadFromFile( G_stExeFolder + '\' + L_stAlarmSelectBuildingCode + '.jpg' );
    // look for vectorial objects
    if FileExists(G_stExeFolder + '\' + L_stAlarmSelectBuildingCode + '.iev' ) then
      ImageEnVect2.LoadFromFileIEV( G_stExeFolder + '\' + L_stAlarmSelectBuildingCode + '.iev' );
    //
    ImageEnVect2.ObjGripPen.Style := psClear;
    ImageEnVect2.ObjGripBrush.Style := bsclear;

//    showmessage(inttostr(ImageEnVect2.Height) + '/' + inttostr(ImageEnVect2.Width));
    ImageEnVect2.Zoom := nZoomSize;
    for i := 0 to ImageEnVect2.ObjectsCount - 1 do
    begin
      hobj := ImageEnVect2.GetObjFromIndex( i );
      mydata:=ImageEnVect2.ObjUserData[ hobj ];
      if mydata<>nil then
      begin
        if SubAlarmCodeList.IndexOf(mydata.ArmAreaID) < 0 then
        begin
          oMapAlarm := TMapAlarm.Create(nil) ;
          oMapAlarm.Code := mydata.ArmAreaID;
          oMapAlarm.hobj := hobj;
          if copy(mydata.ArmAreaID,1,1) = 'C' then //CCTV 이면
            oMapAlarm.Name := dmDBFunction.GetTB_CCTV_Name(copy(mydata.ArmAreaID,2,G_nNodeCodeLength))
          else oMapAlarm.Name := dmDBFunction.GetTB_ARMAREA_ArmAreaName(copy(mydata.ArmAreaID,1,G_nNodeCodeLength),copy(mydata.ArmAreaID,1 + G_nNodeCodeLength,2),copy(mydata.ArmAreaID,1 + G_nNodeCodeLength + 2,1));
          mydata^.ArmAreaName := oMapAlarm.Name;
          ImageEnVect2.ObjUserData[hobj]:=mydata;
          ImageEnVect2.ObjUserDataLength[hobj]:=sizeof(TMyData);

          stDecoderNo := copy(mydata.ArmAreaID,1,G_nDecoderCodeLength);
          stNodeNo := copy(mydata.ArmAreaID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
          stEcuID := copy(mydata.ArmAreaID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
          stArmAreaNo := copy(mydata.ArmAreaID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);

          nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
          //nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            if TdmPCClient(PCClientSocketList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaArmMode,stNodeNo,stEcuID,stArmAreaNo) = 'A' then
            begin
              ImageEnVect2.ObjBrushColor[hobj] := mydata.ArmColor;
              ImageEnVect2.ObjPenColor[hobj] := mydata.ArmColor;
            end else
            begin
              ImageEnVect2.ObjBrushColor[hobj] := mydata.DisArmColor;
              ImageEnVect2.ObjPenColor[hobj] := mydata.DisArmColor;
            end;
          end;
          SubAlarmCodeList.AddObject(mydata.ArmAreaID,oMapAlarm);
        end;
      end;
    end;
    if L_bImageFit2 then
    begin
      ImageEnVect2.Fit;
      mn_ImageFit2.Checked := True;
      mn_ImageOrg2.Checked := False;
    end else
    begin
      mn_ImageFit2.Checked := False;
      mn_ImageOrg2.Checked := False;
      if nZoomSize = 100 then mn_ImageOrg2.Checked := True;
    end;
  end;
end;

function TfmMapMonitoring.LoadBuildingArmArea: Boolean;
begin

end;

procedure TfmMapMonitoring.LoadDoorExampleImage;
begin
  Img_d01.Picture.LoadFromFile(G_stExeFolder + '\d' + FillZeroNumber(con_DoorPOC,2) + '.bmp');
  Img_d02.Picture.LoadFromFile(G_stExeFolder + '\d' + FillZeroNumber(con_DoorPOO,2) + '.bmp');
  Img_d03.Picture.LoadFromFile(G_stExeFolder + '\d' + FillZeroNumber(con_DoorPMC,2) + '.bmp');
  Img_d04.Picture.LoadFromFile(G_stExeFolder + '\d' + FillZeroNumber(con_DoorPMO,2) + '.bmp');
  Img_d05.Picture.LoadFromFile(G_stExeFolder + '\d' + FillZeroNumber(con_DoorPMT,2) + '.bmp');
  Img_d10.Picture.LoadFromFile(G_stExeFolder + '\d' + FillZeroNumber(con_DoorPCC,2) + '.bmp');
  Img_d11.Picture.LoadFromFile(G_stExeFolder + '\d' + FillZeroNumber(con_DoorPCO,2) + '.bmp');
  Img_dfc.Picture.LoadFromFile(G_stExeFolder + '\dfc.bmp');
end;

procedure TfmMapMonitoring.Load_AccessBuildingCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin

  GridInit(sg_AccessBuildingCode,1,2);

  stSql := ' select * from TB_BUILDINGCODE ';
  stSql := stSql + ' Where Group_Code = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_CODEUSE = ''1'' ';
  stSql := stSql + ' AND BC_DEEPSEQ = ' + inttostr(G_nBuildingStep);

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
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      nRow := 1;
      sg_AccessBuildingCode.RowCount := recordcount + 1;
      while Not Eof do
      begin
        with sg_AccessBuildingCode do
        begin
          cells[0,nRow] := FindField('BC_BUILDINGNAME').AsString;
          cells[1,nRow] := FindField('BC_BUILDINGCODE').AsString;
          inc(nRow);
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if sg_AccessBuildingCode.RowCount > 1 then
  begin
    sg_AccessBuildingCode.Row := 1;
    sg_AccessBuildingCodeClick(sg_AccessBuildingCode);
  end;
end;

procedure TfmMapMonitoring.Load_AlarmBuildingCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin

  GridInit(sg_AlarmBuildingCode,1,2);

  stSql := ' select * from TB_BUILDINGCODE ';
  stSql := stSql + ' Where Group_Code = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_CODEUSE = ''1'' ';
  stSql := stSql + ' AND BC_DEEPSEQ = ' + inttostr(G_nBuildingStep);

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
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      nRow := 1;
      sg_AlarmBuildingCode.RowCount := recordcount + 1;
      while Not Eof do
      begin
        with sg_AlarmBuildingCode do
        begin
          cells[0,nRow] := FindField('BC_BUILDINGNAME').AsString;
          cells[1,nRow] := FindField('BC_BUILDINGCODE').AsString;
          inc(nRow);
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if sg_AlarmBuildingCode.RowCount > 1 then
  begin
    sg_AlarmBuildingCode.Row := 1;
    sg_AlarmBuildingCodeClick(sg_AlarmBuildingCode);
  end;
end;

procedure TfmMapMonitoring.pm_AlarmConfirmClick(Sender: TObject);
var
  stSearchID : string;
begin
  inherited;
  stSearchID := L_stSelectArmAreaCode;
  Delete(stSearchID,1,G_nDecoderCodeLength);
  Try
    fmBuildingAlarmConfirm := TfmBuildingAlarmConfirm.create(Self);
    fmBuildingAlarmConfirm.FormTYPE := 'ALARM';
    fmBuildingAlarmConfirm.SearchID := stSearchID;
    fmBuildingAlarmConfirm.ShowModal;
    if fmBuildingAlarmConfirm.Save then
    begin
      //if dmPCClient.Connected then
      //  dmPCClient.SendPacket('E',SCMONITORING,'A','0000','00','')
      //else
      fmMain.FORMALARMCONFIRMExecute;
    end;
    fmBuildingAlarmConfirm.Free;
  Except
    Exit;
  End;

end;

procedure TfmMapMonitoring.pm_AlarmReportClick(Sender: TObject);
var
  stSelectArmAreaCode : string;
begin
  inherited;
  stSelectArmAreaCode := L_stSelectArmAreaCode;
  Delete(stSelectArmAreaCode,1,G_nDecoderCodeLength);
  Try
    fmMain.FORMREPORT(con_FormBMOSALARMEVENTREPORT,'ALARM',stSelectArmAreaCode);
  Except
    Exit;
  End;

end;

procedure TfmMapMonitoring.pm_ArmAreaStateSearchClick(Sender: TObject);
var
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  nIndex : integer;
begin
  Try
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    stDecoderNo := copy(L_stSelectArmAreaCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectArmAreaCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectArmAreaCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stArmAreaNo := copy( L_stSelectArmAreaCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stArmAreaNo),2);

    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('S',SCARMAREA,'s',stNodeNo,stEcuID,stSendData);
    end;
(*
    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('S',SCARMAREA,'s',stNodeNo,stEcuID,stSendData);
    end;
*)
    //dmPCClient.SendPacket('S',SCARMAREA,'s',stNodeNo,stEcuID,stSendData);
    //dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapMonitoring.pm_ArmModeChangeClick(Sender: TObject);
var
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  i : integer;
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    stDecoderNo := copy(L_stSelectArmAreaCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectArmAreaCode,1 + G_nDecoderCodeLength, G_nNodeCodeLength);
    stEcuID := copy(L_stSelectArmAreaCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stArmAreaNo := copy( L_stSelectArmAreaCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stArmAreaNo),2) + 'A';
    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    end;
(*
    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    end;
*)
    //dmPCClient.SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
  Except
    Exit;
  End;
end;

procedure TfmMapMonitoring.mn_CardNOCopyClick(Sender: TObject);
var
  stTemp : string;
  stMessage : string;
begin
  inherited;
    with sg_AccessEvent do
    begin
      stTemp:= Cells[2,Row];

      if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
      stMessage := dmFormMessage.GetMessage('CLIPDATACOPY');
      stMessage := stringReplace(stMessage,'$DATA',stTemp,[rfReplaceAll]);
      fmMain.FORMSTATUSMSG(2,stMessage);
      //showmessage(stTemp + ' 가 ClipBoard에 복사 되었습니다.');
    end;
end;

procedure TfmMapMonitoring.mn_DoorOpenClick(Sender: TObject);
var
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  i : integer;
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stDoorNo),2);

    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    end;
(*
    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    end;
*)
//    dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    Exit;
  End;

end;

procedure TfmMapMonitoring.mn_ImageFit2Click(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  inherited;
  ImageEnVect2.Fit;
  L_bImageFit2 := True;
  if L_bImageFit2 then
  begin
    ImageEnVect2.Fit;
    mn_ImageFit2.Checked := True;
    mn_ImageOrg2.Checked := False;
  end;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','MapArmAreaStateZoom',Round(ImageEnVect2.Zoom));
      WriteInteger('Image','MapArmAreaStateFit',1);
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmMapMonitoring.mn_ImageFitClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  inherited;
  ImageEnVect1.Fit;
  L_bImageFit := True;
  if L_bImageFit then
  begin
    ImageEnVect1.Fit;
    mn_ImageFit.Checked := True;
    mn_ImageOrg.Checked := False;
  end;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','MapDoorStateZoom',Round(ImageEnVect1.Zoom));
      WriteInteger('Image','MapDoorStateFit',1);
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmMapMonitoring.mn_ImageOrg2Click(Sender: TObject);
begin
  inherited;
  ImageEnVect2.Zoom := 100;
  L_bImageFit2 := False;
  mn_ImageFit2.Checked := False;
  mn_ImageOrg2.Checked := True;

end;

procedure TfmMapMonitoring.mn_ImageOrgClick(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Zoom := 100;
  L_bImageFit := False;
  mn_ImageFit.Checked := False;
  mn_ImageOrg.Checked := True;

end;

procedure TfmMapMonitoring.MonitoringRefresh;
begin

end;

procedure TfmMapMonitoring.Negative1Click(Sender: TObject);
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
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stDoorNo),2) + inttostr(TMenuItem(sender).Tag);

    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
    end;
(*    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
*)
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapMonitoring.mn_AlarmConfirm1Click(Sender: TObject);
var
  stTime : string;
begin
  inherited;

  With sg_AlarmEvent do
  begin
    if Cells[L_arrAlarmEventIndexArray[10],Row] = '' then Exit;
    if Cells[L_arrAlarmEventIndexArray[2],Row] = '' then Exit;
    if Cells[L_arrAlarmEventIndexArray[13],Row] = '' then Exit;
    if Cells[L_arrAlarmEventIndexArray[11],Row] = '' then Exit;
    if cells[L_arrAlarmEventIndexArray[12],Row] = '' then Exit;

    stTime := Cells[L_arrAlarmEventIndexArray[12],Row];
    stTime := stringReplace(stTime,'-','',[rfReplaceAll]);
    stTime := stringReplace(stTime,':','',[rfReplaceAll]);
    stTime := stringReplace(stTime,' ','',[rfReplaceAll]);
    fmSecurityEventConfirm:= TfmSecurityEventConfirm.Create(Self);
    fmSecurityEventConfirm.NodeNo := Cells[L_arrAlarmEventIndexArray[10],Row];
    fmSecurityEventConfirm.EcuID := Cells[L_arrAlarmEventIndexArray[2],Row];
    fmSecurityEventConfirm.ExtendID := Cells[L_arrAlarmEventIndexArray[13],Row];
    fmSecurityEventConfirm.MsgNo := Cells[L_arrAlarmEventIndexArray[11],Row];
    fmSecurityEventConfirm.AlarmDate := copy(stTime,1,8);
    fmSecurityEventConfirm.AlarmTime := copy(stTime,9,6);
    fmSecurityEventConfirm.ed_ArmAreaName.Text := Cells[L_arrAlarmEventIndexArray[4],Row];
    fmSecurityEventConfirm.ed_AlarmStateName.Text := Cells[L_arrAlarmEventIndexArray[9],Row];
    fmSecurityEventConfirm.Memo1.Text := '';
    fmSecurityEventConfirm.SHowmodal;
    if fmSecurityEventConfirm.Save then
    begin
      //if dmPCClient.Connected then
      //  dmPCClient.SendPacket('E',SCMONITORING,'A','0000','00','')
      //else
      fmMain.FORMALARMCONFIRMExecute;
    end;
    fmSecurityEventConfirm.Free;
  end;
end;

procedure TfmMapMonitoring.mn_AllAlarmEventClick(Sender: TObject);
begin
  inherited;
  fmSecurityEventConfirm:= TfmSecurityEventConfirm.Create(Self);
  fmSecurityEventConfirm.AllAlarmProcess := True;
  fmSecurityEventConfirm.Memo1.Text := '';
  fmSecurityEventConfirm.SHowmodal;
  if fmSecurityEventConfirm.Save then
  begin
    AlarmEventAllClear(fmSecurityEventConfirm.Memo1.Text);
    fmMain.FORMALARMCONFIRMExecute;
  end;
  fmSecurityEventConfirm.Free;

end;

procedure TfmMapMonitoring.pan_AccessStateDblClick(Sender: TObject);
begin
  inherited;
  fmMain.FormMenuChange;
end;

procedure TfmMapMonitoring.pan_AccessStateResize(Sender: TObject);
begin
  inherited;
  pan_DoorInfo.Left := (pan_AccessState.Width div 2) - (pan_DoorInfo.Width div 2);
  pan_DoorInfo.Top := (pan_AccessState.Height div 2) - (pan_DoorInfo.Height div 2);

  ImageEnVect1.Top := 64;
  ImageEnVect1.Left := 5;
  ImageEnVect1.Width := pan_AccessState.Width - (ImageEnVect1.Left * 2);
  ImageEnVect1.Height := pan_AccessState.Height - ImageEnVect1.Top - 5 ;

  lb_DoorstateExample.Left := ImageEnVect1.Left + ImageEnVect1.Width - lb_DoorstateExample.Width;
  if L_bImageFit then ImageEnVect1.Fit;

  gb_DoorState.Left := ImageEnVect1.Left;
  gb_DoorState.Top := ImageEnVect1.Top;
  gb_DoorState.Width := ImageEnVect1.Width;

end;

procedure TfmMapMonitoring.pan_AlarmDeviceResize(Sender: TObject);
begin
  inherited;
  sg_AlarmBuildingCode.Left := 10;
  sg_AlarmBuildingCode.Top := 63;
  sg_AlarmBuildingCode.Width := pan_AlarmDevice.Width - (sg_AlarmBuildingCode.Left * 2);
  sg_AlarmBuildingCode.Height := pan_AlarmDevice.Height - sg_AlarmBuildingCode.Top - 10;
  sg_AlarmBuildingCode.ColWidths[0] := sg_AlarmBuildingCode.Width;
end;

procedure TfmMapMonitoring.pan_AlarmEventResize(Sender: TObject);
begin
  inherited;
  if pan_AlarmEvent.Height <> 0 then
  begin
    sg_AlarmEvent.top := 5;
    sg_AlarmEvent.Left := 5;
    sg_AlarmEvent.Height := tb_AlarmEvent.Height - (sg_AlarmEvent.Top * 2);
    sg_AlarmEvent.Width := tb_AlarmEvent.Width - (sg_AlarmEvent.Left * 2);

    sg_ModeChange.Top := 5;
    sg_ModeChange.Left := 5;
    sg_ModeChange.Height := tb_ArmModeChange.Height - (sg_ModeChange.Top * 2);
    sg_ModeChange.Width := tb_ArmModeChange.Width - (sg_ModeChange.Left * 2);
    L_nAlarmEventHeight := pan_AlarmEvent.Height;
  end;

end;

procedure TfmMapMonitoring.pan_AlarmStateDblClick(Sender: TObject);
begin
  inherited;
  fmMain.FormMenuChange;
end;

procedure TfmMapMonitoring.pan_AlarmStateResize(Sender: TObject);
begin
  inherited;
  pan_ArmAreaInfo.Top := (pan_AlarmState.Height div 2) - (pan_ArmAreaInfo.Height div 2);
  pan_ArmAreaInfo.Left := (pan_AlarmState.Width div 2) - (pan_ArmAreaInfo.Width div 2);

  ImageEnVect2.Top := 64;
  ImageEnVect2.Left := 5;
  ImageEnVect2.Width := pan_AlarmState.Width - (ImageEnVect2.Left * 2);
  ImageEnVect2.Height := pan_AlarmState.Height - ImageEnVect2.Top - 5 ;

  gb_AlarmStateExample.Left := ImageEnVect2.Left;
  gb_AlarmStateExample.Top := ImageEnVect2.Top;
  gb_AlarmStateExample.Width := ImageEnVect2.Width;

  lb_AlarmstateExample.Left := ImageEnVect2.Left + ImageEnVect2.Width - lb_AlarmstateExample.Width;
  if L_bImageFit2 then ImageEnVect2.Fit;

end;

procedure TfmMapMonitoring.pan_DeviceResize(Sender: TObject);
begin
  sg_AccessBuildingCode.Left := 10;
  sg_AccessBuildingCode.Top := 63;
  sg_AccessBuildingCode.Width := pan_Device.Width - (sg_AccessBuildingCode.Left * 2);
  sg_AccessBuildingCode.Height := pan_Device.Height - sg_AccessBuildingCode.Top - 10;
  sg_AccessBuildingCode.ColWidths[0] := sg_AccessBuildingCode.Width;
//
end;

procedure TfmMapMonitoring.pm_DeviceInfoClick(Sender: TObject);
var
  stArmAreaID : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stTelNo : string;
  stMemo : string;
  stBuildingName : string;
begin
  stArmAreaID:= L_stSelectArmAreaCode;
  stNodeNo := copy(stArmAreaID,1,G_nNodeCodeLength);
  stEcuID := copy(stArmAreaID,1 + G_nNodeCodeLength,2);
  stArmAreaNo := copy( stArmAreaID,1 + G_nNodeCodeLength + 2,1);
  lb_ArmAreaName.Caption := dmDBFunction.GetTB_ARMAREA_ArmAreaName(stNodeNo,stEcuID,stArmAreaNo);
  ed_NodeIP.Text := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
  lb_ArmAreaDeviceID1.Caption := stEcuID;
  lb_ArmAreaNo.Caption := stArmAreaNo;
  dmDBFunction.GetTB_ARMAREA_BuildingInfo(stNodeNo,stEcuID,stArmAreaNo,stBuildingName,stTelNo,stMemo);
  //lb_Building.Caption := dmDBFunction.GetTB_ARMAREA_BuildingName(stNodeNo,stEcuID,stArmAreaNo);
  lb_TelNo.Caption := stTelNo;
  memo1.Text := stMemo;
  pan_ArmAreaInfo.Visible := True;
  pan_ArmAreaInfo.Caption.Text := pm_DeviceInfo.Caption;

end;

procedure TfmMapMonitoring.pm_DisArmModeChangeClick(Sender: TObject);
var
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  i : integer;
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stDecoderNo := copy(L_stSelectArmAreaCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectArmAreaCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectArmAreaCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stArmAreaNo := copy( L_stSelectArmAreaCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stArmAreaNo),2) + 'D';
    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    end;
(*    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    end;
*)
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
  Except
    Exit;
  End;
end;

procedure TfmMapMonitoring.pm_DooOpenModeClick(Sender: TObject);
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
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectDoorCode,1 + G_nDecoderCodeLength+ G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stDoorNo),2) + inttostr(TMenuItem(sender).Tag);

    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
    end;
(*
    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
    end;
*)
    //dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapMonitoring.pm_DoorCloseModeClick(Sender: TObject);
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
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stDoorNo),2) + inttostr(TMenuItem(sender).Tag);

    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapMonitoring.pm_DoorInfoClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDecoderNo : string;
begin

  stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
  stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
  stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
  stDoorNo := copy( L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
  lb_DoorName.Caption := dmDBFunction.GetTB_DOOR_DoorName(stNodeNo,stEcuID,stDoorNo);
  lb_NodeIp.Caption := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
  lb_DeviceID.Caption := stEcuID;
  lb_DoorNo.Caption := stDoorNo;
  lb_Building.Caption := dmDBFunction.GetTB_Door_BuildingName(stNodeNo,stEcuID,stDoorNo);
  pan_DoorInfo.Visible := True;

end;

procedure TfmMapMonitoring.pm_DoorManageModeClick(Sender: TObject);
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
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength ,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stDoorNo),2) + inttostr(TMenuItem(sender).Tag);

    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapMonitoring.pm_DoorStateCheckClick(Sender: TObject);
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
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);

    stSendData := FillZeroNumber(strtoint(stDoorNo),2);

    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,stSendData);
    end;
    //dmPCClient.SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapMonitoring.pm_JavarCloseClick(Sender: TObject);
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
  nIndex : integer;
begin
  Try
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stDoorNo := '2';
    stSendData := FillZeroNumber(strtoint(stDoorNo),2);

    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapMonitoring.pm_JavarOpenClick(Sender: TObject);
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
  nIndex : integer;
begin
  Try
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stDoorNo := '1';
    stSendData := FillZeroNumber(strtoint(stDoorNo),2);

    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapMonitoring.Positive1Click(Sender: TObject);
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
  nIndex : integer;
begin
  Try
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stDecoderNo := copy(L_stSelectDoorCode,1,G_nDecoderCodeLength);
    stNodeNo := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectDoorCode,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stDoorNo),2) + inttostr(TMenuItem(sender).Tag);

    nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
    if nIndex > -1 then
    begin
      TdmPCClient(PCClientSocketList.Objects[nIndex]).SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapMonitoring.RcvDeviceConnectedChangeEvent(aNodeNo, aEcuID,
  aData: string);
begin
end;

procedure TfmMapMonitoring.RcvNodeConnectedChangeEvent(aNodeNo, aEcuID,
  aData: string);
begin

end;

procedure TfmMapMonitoring.SecurityEventClear;
var
  i,hobj:integer;
  mydata:PMyData;
  stAlarmID : string;
  stDecoderNo : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  nIndex : integer;
begin
  AlarmEventCodeList.Clear;
  with ImageEnVect2 do
  begin
    for i:=0 to ObjectsCount-1 do
    begin
      hobj := GetObjFromIndex( i );
      mydata:=ImageEnVect2.ObjUserData[ hobj ];
      if mydata <> nil then
      begin
        stAlarmID := mydata.ArmAreaID;
        stDecoderNo := copy(stAlarmID,1,G_nDecoderCodeLength);
        stNodeNo := copy(stAlarmID,1 + G_nDecoderCodeLength,G_nNodeCodeLength);
        stEcuID := copy(stAlarmID,1 + G_nDecoderCodeLength + G_nNodeCodeLength,2);
        stArmAreaNo := copy(stAlarmID,1 + G_nDecoderCodeLength + G_nNodeCodeLength + 2,1);
        nIndex := PCClientSocketList.IndexOf(inttostr(strtoint(stDecoderNo)));
        //nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          if TdmPCClient(PCClientSocketList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaArmMode,stNodeNo,stEcuID,stArmAreaNo) = 'A' then
          begin
            ObjBrushColor[hobj] := mydata.ArmColor;
            ObjPenColor[hobj] := mydata.ArmColor;
          end else
          begin
            ObjBrushColor[hobj] := mydata.DisArmColor;
            ObjPenColor[hobj] := mydata.DisArmColor;
          end;
        end;
      end;
    end;
  end;

  Try
    GridInit(sg_AlarmEvent,10);
    sg_AlarmEvent.RowColor[1] := clWhite;
  Except
    Exit;
  End;
end;

procedure TfmMapMonitoring.sg_AccessAlarmEventColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  inherited;
  ChangeDeviceEventIndex(FromIndex, ToIndex);
end;

procedure TfmMapMonitoring.sg_AccessBuildingCodeClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
//  L_stSelectBuildingCode := '';
  with sg_AccessBuildingCode do
  begin
    if cells[1,Row] = '' then Exit;
    if L_stAccessSelectBuildingCode = cells[1,Row] then Exit;

    L_stAccessSelectBuildingCode := cells[1,Row];
    lb_FloorName.Caption := cells[0,Row];
  end;

  LoadAccessMap;
end;

procedure TfmMapMonitoring.sg_AccessEventColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeAccessEventIndex(FromIndex, ToIndex);
end;

procedure TfmMapMonitoring.sg_AccessEventKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  stTemp: string;
  stMessage : string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      stTemp:= Cells[2,Row];

      if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
      stMessage := dmFormMessage.GetMessage('CLIPDATACOPY');
      stMessage := stringReplace(stMessage,'$DATA',stTemp,[rfReplaceAll]);
      fmMain.FORMSTATUSMSG(2,stMessage);
      //showmessage(stTemp + ' 가 ClipBoard에 복사 되었습니다.');
    end;
  end;
end;

procedure TfmMapMonitoring.sg_AlarmBuildingCodeClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with sg_AlarmBuildingCode do
  begin
    if cells[1,Row] = '' then Exit;
    if L_stAlarmSelectBuildingCode = cells[1,Row] then Exit;

    L_stAlarmSelectBuildingCode := cells[1,Row];
    lb_FloorName1.Caption := cells[0,Row];
    lb_FloorName1.Refresh;
  end;

  LoadAlarmMap;
end;

procedure TfmMapMonitoring.sg_AlarmEventColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeAlarmEventIndex(FromIndex, ToIndex);
end;

procedure TfmMapMonitoring.sg_ModeChangeColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeAlarmModeIndex(FromIndex, ToIndex);
end;

procedure TfmMapMonitoring.sg_ModeChangeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  stTemp: string;
  stMessage : string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      stTemp:= Cells[6,Row];

      if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
      stMessage := dmFormMessage.GetMessage('CLIPDATACOPY');
      stMessage := stringReplace(stMessage,'$DATA',stTemp,[rfReplaceAll]);
      fmMain.FORMSTATUSMSG(2,stMessage);
    end;
  end;
end;

function TfmMapMonitoring.WriteIniConfig: Boolean;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(G_stExeFolder + '\MapMonitoring.INI');
  Try
    with ini_fun do
    begin
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

      for i := LOW(L_arrDeviceEventIndexArray) to HIGH(L_arrDeviceEventIndexArray) do
      begin
        WriteInteger('LIST','DeviceEventIndexArray'+inttostr(i),L_arrDeviceEventIndexArray[i]);
      end;
      for i := LOW(L_arrRelDeviceEventIndexArray) to HIGH(L_arrRelDeviceEventIndexArray) do
      begin
        WriteInteger('LIST','RelDeviceEventIndexArray'+inttostr(i),L_arrRelDeviceEventIndexArray[i]);
      end;
      for i := 0 to sg_AccessAlarmEvent.ColCount - 1 do
      begin
        if i > HIGH(L_arrDeviceEventSizeTable) then break;

        L_arrDeviceEventSizeTable[i] := sg_AccessAlarmEvent.ColWidths[i];
        WriteInteger('LIST','RelDeviceEventSizeArray' + inttostr(i),sg_AccessAlarmEvent.ColWidths[i]);
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

        L_arrAlarmEventSizeTable[i] := sg_AccessAlarmEvent.ColWidths[i];
        WriteInteger('LIST','RelAlarmEventSizeArray' + inttostr(i),sg_AlarmEvent.ColWidths[i]);
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

      for i := LOW(L_arrAlarmModeIndexArray) to HIGH(L_arrAlarmModeIndexArray) do
      begin
        WriteInteger('LIST','AlarmModeIndexArray'+inttostr(i),L_arrAlarmModeIndexArray[i]);
      end;
      for i := LOW(L_arrRelAlarmModeIndexArray) to HIGH(L_arrRelAlarmModeIndexArray) do
      begin
        WriteInteger('LIST','RelAlarmModeIndexArray'+inttostr(i),L_arrRelAlarmModeIndexArray[i]);
      end;
      for i := 0 to sg_ModeChange.ColCount - 1 do
      begin
        if i > HIGH(L_arrAlarmModeSizeTable) then break;

        L_arrAlarmModeSizeTable[i] := sg_ModeChange.ColWidths[i];
        WriteInteger('LIST','RelAlarmModeSizeArray' + inttostr(i),sg_ModeChange.ColWidths[i]);
      end;
    end;

  Finally
    ini_fun.Free;
  End;
end;

initialization
  RegisterClass(TfmMapMonitoring);
Finalization
  UnRegisterClass(TfmMapMonitoring);

end.
