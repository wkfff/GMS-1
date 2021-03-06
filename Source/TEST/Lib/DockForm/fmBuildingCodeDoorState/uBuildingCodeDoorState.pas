
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit uBuildingCodeDoorState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls, AppEvnts, Vcl.ComCtrls,uSubForm, W7Classes, W7Panels,
  Vcl.ImgList, AdvSmoothPanel, AdvSmoothButton,System.IniFiles, AdvToolBar,
  AdvToolBarStylers, AdvOfficeTabSet, AdvOfficeTabSetStylers, CommandArray,
  AdvAppStyler, Vcl.Imaging.pngimage;

const
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

type
  TfmBuildingCodeDoorState = class(TfmASubForm)
    Pan_Basic: TW7Panel;
    doorListView: TListView;
    LargeDoorList: TImageList;
    SmallDoorList: TImageList;
    statelist: TImageList;
    PopupMenu1: TPopupMenu;
    pm_JavarOpen: TMenuItem;
    pm_JavarClose: TMenuItem;
    pm_DoorManageMode: TMenuItem;
    pm_DooOpenMode: TMenuItem;
    pm_DoorCloseMode: TMenuItem;
    N6: TMenuItem;
    pm_DoorStateCheck: TMenuItem;
    mn_DoorOpen: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    pm_DoorInfo: TMenuItem;
    pan_DoorInfo: TAdvSmoothPanel;
    AdvSmoothButton1: TAdvSmoothButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lb_NodeIP: TLabel;
    lb_DeviceID: TLabel;
    lb_DoorNo: TLabel;
    lb_Building: TLabel;
    Label9: TLabel;
    lb_DoorName: TLabel;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    N1: TMenuItem;
    pm_CardMode: TMenuItem;
    Positive1: TMenuItem;
    Negative1: TMenuItem;
    AdvFormStyler1: TAdvFormStyler;
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure doorListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure doorListViewClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mn_DoorOpenClick(Sender: TObject);
    procedure pm_JavarOpenClick(Sender: TObject);
    procedure pm_JavarCloseClick(Sender: TObject);
    procedure pm_DoorManageModeClick(Sender: TObject);
    procedure pm_DooOpenModeClick(Sender: TObject);
    procedure pm_DoorCloseModeClick(Sender: TObject);
    procedure pm_DoorStateCheckClick(Sender: TObject);
    procedure pm_DoorInfoClick(Sender: TObject);
    procedure AdvSmoothButton1Click(Sender: TObject);
    procedure ActiveTimerTimer(Sender: TObject);
    procedure doorListViewMouseEnter(Sender: TObject);
    procedure Pan_BasicMouseEnter(Sender: TObject);
    procedure Positive1Click(Sender: TObject);
    procedure ReSizeTimerTimer(Sender: TObject);
  private
    BuildingDoorList : TStringList;
    L_bViewRefresh : Boolean;
    L_bFormActive : Boolean;
    L_nViewListStyle : integer;
    L_nCount : integer;
    ActiveTimer: TTimer;
    ReSizeTimer: TTimer;
    procedure LoadBuildingDoor;
  private
    function GetDoorManageModeImageIndex(aDoorCardMode,aDoorManageMode:string):integer;
    function GetDoorStateImageIndex(aDoorDSState,aDoorLSState,aDoorFireEvent:string):integer;
  private
    FUndockedLeft: Integer;
    FUndockedTop: Integer;
    FFloatOnCloseDock: boolean;
    FfmParent: TfmASubForm;
    FBuildingCode: string;
    function  ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;   //도킹되어 있는 상태에서 다른 폼이 도킹을 시도하는 경우 발생
    procedure CMDockClient(var Message: TCMDockClient); message CM_DOCKCLIENT;
    procedure WMNCLButtonDown(var Msg: TMessage); message WM_NCLBUTTONDOWN;
    procedure FontSetting;
  public
    procedure DoorChangeEvent(aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure DeviceReload;
  public
    property fmParent : TfmASubForm read FfmParent write FfmParent;
    property UndockedLeft: Integer read FUndockedLeft;
    property UndockedTop: Integer read FUndockedTop;
    property FloatOnCloseDock: boolean read FFloatOnCloseDock write FFloatOnCloseDock;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
  end;

implementation
uses
  uDBFunction,
  uDBInsert,
  uDBFormMessage,
  uFormDeviceState,
  uFormVariable,
  uCommonVariable,
  uCommonFunction,
  uPCClient,
  uServerClientVariable,
  uFormUtil;
{$R *.dfm}

procedure TfmBuildingCodeDoorState.FormDockOver(Sender: TObject; Source: TDragDockObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := (Source.Control is Tform);
  //Draw dock preview depending on where the cursor is relative to our client area
  if Accept and (ComputeDockingRect(ARect, Point(X, Y)) <> alNone) then
  begin
    ComputeDockingRect(ARect, Point(X, Y));
    Source.DockRect := ARect;
  end;
end;

procedure TfmBuildingCodeDoorState.FormResize(Sender: TObject);
var
  stTemp : string;
begin
  doorListView.Visible := False;
  doorListView.Align := alNone;
  doorListView.Left := 10;
  doorListView.Top := 10;
  doorListView.Width := Width - 20;
  doorListView.Height := Height - 20;
  doorListView.Refresh;
  stTemp := BuildingCode;
  doorListView.Visible := True;

  pan_DoorInfo.Top := (Pan_Basic.Height div 2) - (pan_DoorInfo.Height div 2);
  pan_DoorInfo.Left := (Pan_Basic.Width div 2) - (pan_DoorInfo.Width div 2);

  //if Not L_bFormActive then Exit;
  //ActiveTimer.Enabled := False;
  //ActiveTimer.Enabled := True;
  ReSizeTimer.Enabled := False;
  ReSizeTimer.Enabled := True;
end;

procedure TfmBuildingCodeDoorState.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\BuildingCodeDoorState.INI');
    with ini_fun do
    begin
      L_nViewListStyle := 0;
      if ReadString('MONITOR','ViewStyle' + BuildingCode,'VSICON') = 'VSLIST' then
      begin
        DoorListView.ViewStyle := vsList;
        L_nViewListStyle := 1;
      end else
      begin
        DoorListView.ViewStyle := vsIcon;
        L_nViewListStyle := 0;
      end;
    end;
  Finally
    ini_fun.Free;
  End;
  ActiveTimer.Enabled := True;
end;

function TfmBuildingCodeDoorState.GetDoorManageModeImageIndex(aDoorCardMode,
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

function TfmBuildingCodeDoorState.GetDoorStateImageIndex(aDoorDSState,
  aDoorLSState, aDoorFireEvent: string): integer;
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

procedure TfmBuildingCodeDoorState.LoadBuildingDoor;
var
  nIndex : integer;
  i : integer;
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
begin
  Try
    doorListView.Clear;
    BuildingDoorList.Clear;
    nIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
    if nIndex < 0 then Exit;
    nDoorIndex := 0;
    for i := 0 to TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorCount - 1 do
    begin
      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexDevieInfo(i,stNodeNo,stEcuID,stDoorNo,stDoorName) then
      begin
        stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
        stDoorLockType := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexLockType(i);
        if stDoorLockType = '11' then  continue; //자바라 - 닫힘 타입이면 출입문에 표시 하지 말자
        if Not TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetDoorIndexCurrentState(i,stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then continue;
        DoorListView.Items.Add.Caption:= stDoorName;
        DoorListView.Items[nDoorIndex].SubItems.Add(stNodeNo + stEcuID + stDoorNo);
        DoorListView.Items[nDoorIndex].SubItems.Add(stDoorLockType);               //락타입 확인해서 자바라이면 자바라 열림/닫힘으로 설정 하도록
        nImageIndex := GetDoorManageModeImageIndex(stDoorCardMode,stDoorManageMode);
        DoorListView.Items[nDoorIndex].StateIndex := nImageIndex;
        nImageIndex := GetDoorStateImageIndex(stDoorDSState,stDoorLSState,stDoorFireEvent);
        DoorListView.Items[nDoorIndex].ImageIndex := nImageIndex;
        BuildingDoorList.Add(stNodeNo + stEcuID + stDoorNo);
        nDoorIndex := nDoorIndex + 1;
      end;
    end;
  Except
    Exit;
  End;
end;

procedure TfmBuildingCodeDoorState.mn_DoorOpenClick(Sender: TObject);
var
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
        stNodeNo := copy(stDoorID,1,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        end;
        //dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;

end;

procedure TfmBuildingCodeDoorState.N12Click(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  L_nViewListStyle := 0;
  doorListView.ViewStyle := vsIcon;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\BuildingCodeDoorState.INI');
    with ini_fun do
    begin
      if L_nViewListStyle = 0 then
        WriteString('MONITOR','ViewStyle'  + BuildingCode ,'VSICON')
      else WriteString('MONITOR','ViewStyle'  + BuildingCode,'VSLIST');
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmBuildingCodeDoorState.N13Click(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  L_nViewListStyle := 1;
  doorListView.ViewStyle := vsList;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\BuildingCodeDoorState.INI');
    with ini_fun do
    begin
      if L_nViewListStyle = 0 then
        WriteString('MONITOR','ViewStyle'  + BuildingCode ,'VSICON')
      else WriteString('MONITOR','ViewStyle'  + BuildingCode,'VSLIST');
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmBuildingCodeDoorState.Pan_BasicMouseEnter(Sender: TObject);
begin
  inherited;
  if doorListView.Visible then
    Pan_Basic.Hint := inttostr(doorListView.Top) + '/' + inttostr(doorListView.Left) + '/' + inttostr(doorListView.Height) + '/' + 'Visible'
  else Pan_Basic.Hint := inttostr(doorListView.Top) + '/' + inttostr(doorListView.Left) + '/' + 'NotVisible';
end;

procedure TfmBuildingCodeDoorState.pm_DoorInfoClick(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
begin
  if doorListView.Selected = nil then Exit;

  lb_DoorName.Caption := doorListView.Selected.Caption;
  stDoorID:= doorListView.Selected.SubItems.Strings[0];
  stNodeNo := copy(stDoorID,1,G_nNodeCodeLength);
  stEcuID := copy(stDoorID,1 + G_nNodeCodeLength,2);
  stDoorNo := copy( stDoorID,1 + G_nNodeCodeLength + 2,1);
  lb_NodeIp.Caption := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
  lb_DeviceID.Caption := stEcuID;
  lb_DoorNo.Caption := stDoorNo;
  lb_Building.Caption := dmDBFunction.GetTB_Door_BuildingName(stNodeNo,stEcuID,stDoorNo);
  pan_DoorInfo.Visible := True;
  pan_DoorInfo.Caption.Text := pm_DoorInfo.Caption;
end;

procedure TfmBuildingCodeDoorState.pm_DooOpenModeClick(Sender: TObject);
var
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
        stNodeNo := copy(stDoorID,1,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + '1';

        nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        end;
        //dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmBuildingCodeDoorState.pm_DoorCloseModeClick(Sender: TObject);
var
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
        stNodeNo := copy(stDoorID,1,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + '2';

        nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        end;
        //dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmBuildingCodeDoorState.pm_DoorManageModeClick(Sender: TObject);
var
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
        stNodeNo := copy(stDoorID,1,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + '0';

        nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        end;
        //dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmBuildingCodeDoorState.pm_DoorStateCheckClick(Sender: TObject);
var
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
        stNodeNo := copy(stDoorID,1,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,stSendData);
        end;
        //dmPCClient.SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmBuildingCodeDoorState.pm_JavarCloseClick(Sender: TObject);
var
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
        stNodeNo := copy(stDoorID,1,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nNodeCodeLength,2);
        stDoorNo := '2';
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        end;
        //dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmBuildingCodeDoorState.pm_JavarOpenClick(Sender: TObject);
var
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
        stNodeNo := copy(stDoorID,1,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nNodeCodeLength,2);
        stDoorNo := '1';
        stSendData := FillZeroNumber(strtoint(stDoorNo),2);

        nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        end;
        //dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmBuildingCodeDoorState.Positive1Click(Sender: TObject);
var
  stDoorID : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
  stMode : string;
  nIndex : integer;
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
        stNodeNo := copy(stDoorID,1,G_nNodeCodeLength);
        stEcuID := copy(stDoorID,1 + G_nNodeCodeLength,2);
        stDoorNo := copy( stDoorID,1 + G_nNodeCodeLength + 2,1);
        stMode := inttostr(TMenuItem(Sender).Tag);
        stSendData := FillZeroNumber(strtoint(stDoorNo),2) + stMode;

        nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
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

procedure TfmBuildingCodeDoorState.ReSizeTimerTimer(Sender: TObject);
begin
  inherited;
  ReSizeTimer.Enabled := False;
  if L_bViewRefresh then Exit;
  L_bViewRefresh := True;
  Try
    if L_nViewListStyle = 0 then
    begin
      doorListView.ViewStyle := vsList;
      Delay(10);
      doorListView.ViewStyle := vsICon;
      doorListView.Refresh;
    end else
    begin
      doorListView.ViewStyle := vsICon;
      Delay(10);
      doorListView.ViewStyle := vsList;
      doorListView.Refresh;
    end;
  Finally
    L_bViewRefresh := False;
  End;
end;

function TfmBuildingCodeDoorState.ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;
var
  DockTopRect,
  DockLeftRect,
  DockBottomRect,
  DockRightRect,
  DockCenterRect: TRect;
begin
  Result := alNone;
  //divide form up into docking "Zones"
  DockLeftRect.TopLeft := Point(0, 0);
  DockLeftRect.BottomRight := Point(ClientWidth div 5, ClientHeight);

  DockTopRect.TopLeft := Point(ClientWidth div 5, 0);
  DockTopRect.BottomRight := Point(ClientWidth div 5 * 4, ClientHeight div 5);

  DockRightRect.TopLeft := Point(ClientWidth div 5 * 4, 0);
  DockRightRect.BottomRight := Point(ClientWidth, ClientHeight);

  DockBottomRect.TopLeft := Point(ClientWidth div 5, ClientHeight div 5 * 4);
  DockBottomRect.BottomRight := Point(ClientWidth div 5 * 4, ClientHeight);

  DockCenterRect.TopLeft := Point(ClientWidth div 5, ClientHeight div 5);
  DockCenterRect.BottomRight := Point(ClientWidth div 5 * 4, ClientHeight div 5 * 4);

  //Find out where the mouse cursor is, to decide where to draw dock preview.
  if PtInRect(DockLeftRect, MousePos) then
  begin
    Result := alLeft;
    DockRect := DockLeftRect;
    DockRect.Right := ClientWidth div 2;
  end
  else
  if PtInRect(DockTopRect, MousePos) then
  begin
    Result := alTop;
    DockRect := DockTopRect;
    DockRect.Left := 0;
    DockRect.Right := ClientWidth;
    DockRect.Bottom := ClientHeight div 2;
  end
  else
  if PtInRect(DockRightRect, MousePos) then
  begin
    Result := alRight;
    DockRect := DockRightRect;
    DockRect.Left := ClientWidth div 2;
  end
  else
  if PtInRect(DockBottomRect, MousePos) then
  begin
    Result := alBottom;
    DockRect := DockBottomRect;
    DockRect.Left := 0;
    DockRect.Right := ClientWidth;
    DockRect.Top := ClientHeight div 2;
 end
  else
  if PtInRect(DockCenterRect, MousePos) then
  begin
    Result := alClient;
    DockRect := DockCenterRect;
  end;
  if Result = alNone then Exit;

  //DockRect is in screen coordinates.
  DockRect.TopLeft := ClientToScreen(DockRect.TopLeft);
  DockRect.BottomRight := ClientToScreen(DockRect.BottomRight);
end;

procedure TfmBuildingCodeDoorState.DeviceReload;
begin
  ActiveTimer.Enabled := True;
end;

procedure TfmBuildingCodeDoorState.DoorChangeEvent(aNodeNo, aEcuID, aType, aNo,
  aCmd, aData, aBuildingCode: string);
var
  stDoorID : string;
  nIndex : Integer;
  nBuildingIndex : integer;
  stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent : string;
  nImageIndex : integer;
begin
  stDoorID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aNo;
  nIndex := BuildingDoorList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  nBuildingIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
  if nBuildingIndex < 0 then Exit;
  if Not TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nBuildingIndex]).GetDoorCurrentState(aNodeNo,aEcuID,aNo,stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then Exit;
  nImageIndex := GetDoorManageModeImageIndex(stDoorCardMode,stDoorManageMode);
  DoorListView.Items[nIndex].StateIndex := nImageIndex;
  nImageIndex := GetDoorStateImageIndex(stDoorDSState,stDoorLSState,stDoorFireEvent);
  DoorListView.Items[nIndex].ImageIndex := nImageIndex;
  DoorListView.Refresh;
end;

procedure TfmBuildingCodeDoorState.doorListViewClick(Sender: TObject);
begin
//  popupMenu := nil;
  if doorListView.ItemIndex < 0 then Exit;
  if doorListView.ItemIndex > (doorListView.Items.Count ) then Exit;
  popupMenu := popupMenu1;
  if Not fmParent.IsInsertGrade then
  begin
    mn_DoorOpen.Enabled := False;
    pm_JavarOpen.Enabled := False;
    pm_JavarClose.Enabled := False;
    pm_DoorManageMode.Enabled := False;
    pm_DooOpenMode.Enabled := False;
    pm_DoorCloseMode.Enabled := False;
    pm_CardMode.Enabled := False;
  end else
  begin
    mn_DoorOpen.Enabled := True;
    pm_JavarOpen.Enabled := True;
    pm_JavarClose.Enabled := True;
    pm_DoorManageMode.Enabled := True;
    pm_DooOpenMode.Enabled := True;
    pm_DoorCloseMode.Enabled := True;
    pm_CardMode.Enabled := True;
  end;
  pm_CardMode.Visible := G_bCardModeShow;
  N1.Visible := G_bCardModeShow;
end;

procedure TfmBuildingCodeDoorState.doorListViewMouseEnter(Sender: TObject);
begin
  inherited;
  doorListView.hint := inttostr(doorListView.width) + '/' + inttostr(doorListView.Height);
end;

procedure TfmBuildingCodeDoorState.doorListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  stLockType : string;
  bJavaraType : Boolean;
begin
  if Selected then
  begin
      stLockType := TListView(Sender).Selected.SubItems.Strings[1];
      popupMenu := PopupMenu1;
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

procedure TfmBuildingCodeDoorState.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);

end;

procedure TfmBuildingCodeDoorState.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin
  L_bFormActive := False;
  ActiveTimer.Enabled := False;
  ActiveTimer.Free;
  ReSizeTimer.Enabled := False;
  ReSizeTimer.Free;

(*  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\BuildingCodeDoorState.INI');
    with ini_fun do
    begin
      if DoorListView.ViewStyle = vsIcon then
        WriteString('MONITOR','ViewStyle' + BuildingCode,'VSICON')
      else WriteString('MONITOR','ViewStyle' + BuildingCode,'VSLIST');
    end;
  Finally
    ini_fun.Free;
  End; *)

  BuildingDoorList.Free;

  //the action taken depends on how the form is docked.

  //if docked to a panel, tell the panel to hide itself. If there are other
  //visible dock clients on the panel, it ShowDockPanel won't allow it to
  //be hidden
  if (HostDockSite is TPanel) then
    fmParent.ShowDockPanel(HostDockSite as TPanel, False, nil);

  Action := caHide;

  if not Floating and FloatOnCloseDock then
  begin
    // Float when close docked window
    Hide;
    ManualFloat(Rect(FUndockedLeft, FUndockedTop, FUndockedLeft + UndockWidth,
      FUndockedTop + UndockHeight));
  end;
end;

procedure TfmBuildingCodeDoorState.FormCreate(Sender: TObject);
begin
  ActiveTimer := TTimer.Create(nil);
  ActiveTimer.Interval := 200;
  ActiveTimer.OnTimer := ActiveTimerTimer;
  ActiveTimer.Enabled := False;

  ReSizeTimer := TTimer.Create(nil);
  ReSizeTimer.Interval := 200;
  ReSizeTimer.OnTimer := ReSizeTimerTimer;
  ReSizeTimer.Enabled := False;


  BuildingDoorList := TStringList.Create;
//  LoadBuildingDoor;
  FontSetting;
end;

procedure TfmBuildingCodeDoorState.ActiveTimerTimer(Sender: TObject);
begin
  ActiveTimer.Enabled := False;
  if L_bFormActive then Exit;
  if L_bViewRefresh then Exit;
  L_bViewRefresh := True;
  Try
    if Not L_bFormActive then LoadBuildingDoor;

    if L_nViewListStyle = 0 then
    begin
      doorListView.ViewStyle := vsList;
      Delay(100);
      doorListView.ViewStyle := vsICon;
      doorListView.Refresh;
    end else
    begin
      doorListView.ViewStyle := vsICon;
      Delay(100);
      doorListView.ViewStyle := vsList;
      doorListView.Refresh;
    end;
    FormResize(self);
  Finally
    L_bViewRefresh := False;
    L_bFormActive := True;
  End;
end;

procedure TfmBuildingCodeDoorState.AdvSmoothButton1Click(Sender: TObject);
begin
  pan_DoorInfo.Visible := False;
end;

procedure TfmBuildingCodeDoorState.CMDockClient(var Message: TCMDockClient);
var
  ARect: TRect;
  DockType: TAlign;
  Host: TForm;
  Pt: TPoint;
begin
  //Overriding this message allows the dock form to create host forms
  //depending on the mouse position when docking occurs. If we don't override
  //this message, the form will use VCL's default DockManager.

  //NOTE: the only time ManualDock can be safely called during a drag
  //operation is we override processing of CM_DOCKCLIENT.
  if Message.DockSource.Control is Tform then
  begin
    //Find out how to dock (Using a TAlign as the result of ComputeDockingRect)
    Pt.X := Message.MousePos.X;
    Pt.Y := Message.MousePos.Y;
    DockType := ComputeDockingRect(ARect, Pt);

    //if we are over a dockable form docked to a panel in the
    //main window, manually dock the dragged form to the panel with
    //the correct orientation.
    if (HostDockSite is TPanel) then
    begin
      Message.DockSource.Control.ManualDock(HostDockSite, nil, DockType);
      Exit;
    end;
  end;
end;

procedure TfmBuildingCodeDoorState.WMNCLButtonDown(var Msg: TMessage);
begin
  inherited;
  // This event happen when mouse click in caption
  // save initial window position
  FUndockedLeft:= Left;
  FUndockedTop:= Top;
end;

end.

