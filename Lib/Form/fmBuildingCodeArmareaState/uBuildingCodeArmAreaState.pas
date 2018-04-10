
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit uBuildingCodeArmAreaState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls, AppEvnts, Vcl.ComCtrls,uSubForm, W7Classes, W7Panels,
  Vcl.ImgList, AdvSmoothPanel, AdvSmoothButton, CommandArray,System.IniFiles,
  AdvToolBar, AdvToolBarStylers, AdvOfficeTabSet, AdvOfficeTabSetStylers;

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

type
  TfmBuildingCodeArmAreaState = class(TfmASubForm)
    Pan_Basic: TW7Panel;
    ArmAreaListView: TListView;
    LargeDoorList: TImageList;
    SmallDoorList: TImageList;
    statelist: TImageList;
    PopupMenu1: TPopupMenu;
    pm_ArmModeChange: TMenuItem;
    pm_DisArmModeChange: TMenuItem;
    N6: TMenuItem;
    pm_LargeIcon: TMenuItem;
    pm_SmallICon: TMenuItem;
    N14: TMenuItem;
    pm_DeviceInfo: TMenuItem;
    pan_DoorInfo: TAdvSmoothPanel;
    AdvSmoothButton1: TAdvSmoothButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lb_DeviceID: TLabel;
    lb_ArmAreaNo: TLabel;
    lb_Building: TLabel;
    Label9: TLabel;
    lb_ArmAreaName: TLabel;
    N1: TMenuItem;
    pm_AlarmReport: TMenuItem;
    pm_AlarmConfirm: TMenuItem;
    N4: TMenuItem;
    pm_ArmAreaStateSearch: TMenuItem;
    Label5: TLabel;
    lb_TelNo: TLabel;
    Label7: TLabel;
    memo1: TMemo;
    ed_NodeIP: TEdit;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pm_LargeIconClick(Sender: TObject);
    procedure pm_SmallIConClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pm_ArmModeChangeClick(Sender: TObject);
    procedure pm_DisArmModeChangeClick(Sender: TObject);
    procedure pm_DeviceInfoClick(Sender: TObject);
    procedure AdvSmoothButton1Click(Sender: TObject);
    procedure pm_AlarmConfirmClick(Sender: TObject);
    procedure pm_AlarmReportClick(Sender: TObject);
    procedure ArmAreaListViewClick(Sender: TObject);
    procedure ArmAreaListViewDblClick(Sender: TObject);
    procedure pm_ArmAreaStateSearchClick(Sender: TObject);
    procedure ViewRefreshTimerTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ArmAreaListViewMouseEnter(Sender: TObject);
    procedure ReSizeTimerTimer(Sender: TObject);
  private
    BuildingArmAreaList : TStringList;
    L_bFormActive : Boolean;
    L_bViewRefresh : Boolean;
    L_nViewListStyle : integer;
    ViewRefreshTimer: TTimer;
    ReSizeTimer: TTimer;
    procedure LoadBuildingArmArea;
    procedure LoadBuildingList;
    procedure ArmAreaStateRefresh;
    procedure BuildingStateRefresh;
  private
    FUndockedLeft: Integer;
    FUndockedTop: Integer;
    FFloatOnCloseDock: boolean;
    FfmParent: TfmASubForm;
    FBuildingCode: string;
    FFormTYPE: String;
    function  ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;   //도킹되어 있는 상태에서 다른 폼이 도킹을 시도하는 경우 발생
    procedure CMDockClient(var Message: TCMDockClient); message CM_DOCKCLIENT;
    procedure WMNCLButtonDown(var Msg: TMessage); message WM_NCLBUTTONDOWN;
    procedure FontSetting;
  public
    procedure ArmAreaCurrentAlarmStateChange(aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure BuildingAlarmStateChange(aBuildingCode:string;aAlarmState: integer);
    procedure BuildingSecurityModeChange(aBuildingCode:string;aMode : integer);
    procedure DeviceReload;
    procedure DoorChangeEvent(aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
  public
    property fmParent : TfmASubForm read FfmParent write FfmParent;
    property FormTYPE : String read FFormTYPE write FFormTYPE;
    property UndockedLeft: Integer read FUndockedLeft;
    property UndockedTop: Integer read FUndockedTop;
    property FloatOnCloseDock: boolean read FFloatOnCloseDock write FFloatOnCloseDock;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
  end;

implementation
uses
  uDBFunction,
  uDBInsert,
  uFormDeviceState,
  uFormVariable,
  uCommonVariable,
  uCommonFunction,
  uPCClient,
  uServerClientVariable,
  uBuildingAlarmConfirm,
  uFormUtil;
{$R *.dfm}

procedure TfmBuildingCodeArmAreaState.FormDockOver(Sender: TObject; Source: TDragDockObject;
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

procedure TfmBuildingCodeArmAreaState.FormResize(Sender: TObject);
begin
  Try
    ArmAreaListView.Left := 10;
    ArmAreaListView.Top := 10;
    ArmAreaListView.Width := Pan_Basic.Width - 20;
    ArmAreaListView.Height := Pan_Basic.Height - 20;
    ArmAreaListView.Refresh;

    pan_DoorInfo.Top := (Height div 2) - (pan_DoorInfo.Height div 2);
    pan_DoorInfo.Left := (Width div 2) - (pan_DoorInfo.Width div 2);

    if L_bFormActive then
    begin
      //ViewRefreshTimer.Enabled := False;
      //ViewRefreshTimer.Enabled := True;
    end;
    ReSizeTimer.Enabled := False;
    ReSizeTimer.Enabled := True;
  Finally
    //pan_basic.Visible := True;
  End;
end;

procedure TfmBuildingCodeArmAreaState.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  stTemp : string;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\BuildingCodeArmAreaState.INI');
    with ini_fun do
    begin
      if ReadString('MONITOR','ViewStyle' + BuildingCode,'VSICON') = 'VSICON' then
      begin
        ArmAreaListView.ViewStyle := vsIcon;
        L_nViewListStyle := 0;
      end else
      begin
        ArmAreaListView.ViewStyle := vsList;
        L_nViewListStyle := 1;
      end;
      if FormTYPE <> 'BUILDING' then
      begin
        stTemp := 'Test';
      end;
    end;
  Finally
    ini_fun.Free;
  End;

  FormResize(sender);
  if FormTYPE = 'BUILDING' then
  begin
    pm_ArmAreaStateSearch.Visible := False;
    N4.Visible := False;
    pm_ArmModeChange.Visible := False;
    pm_DisArmModeChange.Visible := False;
    N6.Visible := False;
    N14.Visible := False;
    pm_DeviceInfo.Visible := False;
    N1.Visible := False;
    pm_AlarmReport.Visible := False;
  end else
  begin
    pm_ArmAreaStateSearch.Visible := True;
    N4.Visible := True;
    pm_ArmModeChange.Visible := True;
    pm_DisArmModeChange.Visible := True;
    N6.Visible := True;
    N14.Visible := True;
    pm_DeviceInfo.Visible := True;
    N1.Visible := True;
    pm_AlarmReport.Visible := True;
  end;
  ViewRefreshTimer.Enabled := True;

end;

procedure TfmBuildingCodeArmAreaState.LoadBuildingArmArea;
var
  nIndex : integer;
  i : integer;
  nArmAreaIndex : integer;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stArmAreaName : string;
  stArmAreaID : string;
  nImageIndex : integer;
  nEventIndex : integer;
  stArmState : string;
begin
  Try
    ArmAreaListView.Clear;
    BuildingArmAreaList.Clear;
    nIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
    if nIndex < 0 then Exit;
    nArmAreaIndex := 0;
    for i := 0 to TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaCount - 1 do
    begin
      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexDevieInfo(i,stNodeNo,stEcuID,stArmAreaNo,stArmAreaName) then
      begin
        stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
        stArmAreaID := stNodeNo + stEcuID + stArmAreaNo;

        ArmAreaListView.Items.Add.Caption:= stArmAreaName;
        ArmAreaListView.Items[nArmAreaIndex].SubItems.Add(stArmAreaID);
        nImageIndex := con_ArmAreaImageNothing;
        stArmState := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexSecurityMode(i);
        {if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexSecurityMode(i) = 'D' then
        begin
          nImageIndex := con_ArmAreaImageDisArm;
        end else if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexSecurityMode(i) = 'A' then
        begin
          nImageIndex := con_ArmAreaImageArm;
        end;
        ArmAreaListView.Items[nArmAreaIndex].ImageIndex := nImageIndex;
        }

        nEventIndex := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexArmAreaState(i);
        case nEventIndex of
          1 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          2 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaEventImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaEventImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          3 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaAlarmImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaAlarmImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateAlarmEvent;
          end;
          else begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNotEvent;
          end;
        end;
        ArmAreaListView.Items[nArmAreaIndex].ImageIndex := nImageIndex;
        BuildingArmAreaList.Add(stArmAreaID);
        nArmAreaIndex := nArmAreaIndex + 1;
      end;
    end;
  Except
    Exit;
  End;
end;

procedure TfmBuildingCodeArmAreaState.LoadBuildingList;
var
  i : integer;
  stBuildingCode : string;
  nBuildingSecurityMode : integer;
  nImageIndex : integer;
begin
  Try
    ArmAreaListView.Clear;
    BuildingArmAreaList.Clear;
    if G_MonitoringBuildingList.Count < 1 then Exit;
    for i := 0 to G_MonitoringBuildingList.Count - 1 do
    begin
      ArmAreaListView.Items.Add.Caption:= TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingName;
      stBuildingCode := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingCode;
      ArmAreaListView.Items[i].SubItems.Add(stBuildingCode);
      nBuildingSecurityMode := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode;
      {if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode = 1 then
      begin
        ArmAreaListView.Items[i].ImageIndex  := con_BuildingArmAreaImageDisArm;
      end else if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode = 2 then
      begin
        ArmAreaListView.Items[i].ImageIndex := con_BuildingArmAreaImagePartArm;
      end else if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode = 3 then
      begin
        ArmAreaListView.Items[i].ImageIndex := con_BuildingArmAreaImageArm;
      end; }

      nImageIndex := con_BuildingArmAreaImageNothing;
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
      ArmAreaListView.Items[i].ImageIndex := nImageIndex;

      BuildingArmAreaList.Add(stBuildingCode);
    end;
  Except
    Exit;
  End;
end;

procedure TfmBuildingCodeArmAreaState.pm_LargeIconClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  ArmAreaListView.ViewStyle := vsIcon;
  L_nViewListStyle := 0;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\BuildingCodeArmAreaState.INI');
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

procedure TfmBuildingCodeArmAreaState.pm_SmallIConClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  ArmAreaListView.ViewStyle := vsList;
  L_nViewListStyle := 1;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\BuildingCodeArmAreaState.INI');
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

procedure TfmBuildingCodeArmAreaState.ReSizeTimerTimer(Sender: TObject);
begin
  inherited;
  ReSizeTimer.Enabled := False;
  if L_bViewRefresh then Exit;
  L_bViewRefresh := True;
  Try
    if L_nViewListStyle = 0 then
    begin
      ArmAreaListView.ViewStyle := vsList;
      Delay(10);
      ArmAreaListView.ViewStyle := vsICon;
    end else
    begin
      ArmAreaListView.ViewStyle := vsICon;
      Delay(10);
      ArmAreaListView.ViewStyle := vsList;
    end;
    ArmAreaListView.Refresh;
  Finally
    L_bViewRefresh := False;
  End;
end;

procedure TfmBuildingCodeArmAreaState.ViewRefreshTimerTimer(Sender: TObject);
var
  nSelectIndex : integer;
begin
  inherited;
  ViewRefreshTimer.Enabled := False;
  if L_bViewRefresh then Exit;
  if L_bFormActive then Exit;

  L_bViewRefresh := True;
  //if ArmAreaListView.Selected <> nil then nSelectIndex := ArmAreaListView.Selected.

  if FormTYPE = 'BUILDING' then
  begin
    if Not L_bFormActive then LoadBuildingList;
    BuildingStateRefresh;
  end else
  begin
    if Not L_bFormActive then LoadBuildingArmArea;
    ArmAreaStateRefresh;
  end;
  Try
    if L_nViewListStyle = 0 then
    begin
      ArmAreaListView.ViewStyle := vsList;
      Delay(100);
      ArmAreaListView.ViewStyle := vsIcon;
      ArmAreaListView.Refresh;
    end else if L_nViewListStyle = 1 then
    begin
      ArmAreaListView.ViewStyle := vsIcon;
      Delay(100);
      ArmAreaListView.ViewStyle := vsList;
      ArmAreaListView.Refresh;
    end;
  Finally
    L_bViewRefresh := False;
    L_bFormActive := True;
  End;

end;

procedure TfmBuildingCodeArmAreaState.pm_DeviceInfoClick(Sender: TObject);
var
  stArmAreaID : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stTelNo : string;
  stMemo : string;
  stBuildingName : string;
begin
  if ArmAreaListView.Selected = nil then Exit;

  lb_ArmAreaName.Caption := ArmAreaListView.Selected.Caption;
  stArmAreaID:= ArmAreaListView.Selected.SubItems.Strings[0];
  stNodeNo := copy(stArmAreaID,1,G_nNodeCodeLength);
  stEcuID := copy(stArmAreaID,1 + G_nNodeCodeLength,2);
  stArmAreaNo := copy( stArmAreaID,1 + G_nNodeCodeLength + 2,1);
  ed_NodeIP.Text := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
  lb_DeviceID.Caption := stEcuID;
  lb_ArmAreaNo.Caption := stArmAreaNo;
  dmDBFunction.GetTB_ARMAREA_BuildingInfo(stNodeNo,stEcuID,stArmAreaNo,stBuildingName,stTelNo,stMemo);
  //lb_Building.Caption := dmDBFunction.GetTB_ARMAREA_BuildingName(stNodeNo,stEcuID,stArmAreaNo);
  lb_TelNo.Caption := stTelNo;
  memo1.Text := stMemo;
  pan_DoorInfo.Visible := True;
  pan_DoorInfo.Caption.Text := pm_DeviceInfo.Caption;
end;

procedure TfmBuildingCodeArmAreaState.pm_AlarmConfirmClick(Sender: TObject);
var
  stArmAreaID : string;
begin
  Try
    if ArmAreaListView.Selected = nil then
    begin
      if ArmAreaListView.ItemIndex > -1 then ArmAreaListView.Items[ArmAreaListView.ItemIndex].Selected := True;
      Exit;
    end;
    stArmAreaID:= ArmAreaListView.Selected.SubItems.Strings[0];
    fmBuildingAlarmConfirm := TfmBuildingAlarmConfirm.create(Self);
    fmBuildingAlarmConfirm.FormTYPE := FormType;
    fmBuildingAlarmConfirm.SearchID := stArmAreaID;
    fmBuildingAlarmConfirm.ShowModal;
    if fmBuildingAlarmConfirm.Save then
    begin
      if dmPCClient.Connected then
        dmPCClient.SendPacket('E',SCMONITORING,'A','0000','00','')
      else self.FindSubForm('Main').FindCommand('ALARMCONFIRM').Execute;
    end;

    fmBuildingAlarmConfirm.Free;
  Except
    Exit;
  End;

end;

procedure TfmBuildingCodeArmAreaState.pm_AlarmReportClick(Sender: TObject);
var
  stArmAreaID : string;
begin
  Try
    if ArmAreaListView.Selected = nil then Exit;
    stArmAreaID:= ArmAreaListView.Selected.SubItems.Strings[0];
    self.FindSubForm('Main').FindCommand('REPORT').Params.Values['NAME'] := 'ALARMREPORT';
    self.FindSubForm('Main').FindCommand('REPORT').Params.Values['FORMTYPE'] := FormTYPE;
    self.FindSubForm('Main').FindCommand('REPORT').Params.Values['ID'] := stArmAreaID;
    self.FindSubForm('Main').FindCommand('REPORT').Execute;
  Except
    Exit;
  End;

end;

procedure TfmBuildingCodeArmAreaState.pm_ArmAreaStateSearchClick(
  Sender: TObject);
var
  stArmAreaID : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  i : integer;
  stTime : string;
  stClientIP : string;
begin
  Try
    if ArmAreaListView.SelCount < 1 then Exit;
    if Not dmPCClient.Connected then
    begin
      showmessage('서버와 통신연결이 끊어 졌습니다.');
      Exit;
    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
    for i := 0 to ArmAreaListView.Items.Count - 1 do
    begin
      if ArmAreaListView.Items[i].Selected then
      begin
        stArmAreaID:= ArmAreaListView.Items[i].SubItems.Strings[0];
        stNodeNo := copy(stArmAreaID,1,G_nNodeCodeLength);
        stEcuID := copy(stArmAreaID,1 + G_nNodeCodeLength,2);
        stArmAreaNo := copy( stArmAreaID,1 + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stArmAreaNo),2);

        dmPCClient.SendPacket('S',SCARMAREA,'s',stNodeNo,stEcuID,stSendData);
        //dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    showmessage('전송실패');
    Exit;
  End;
end;

procedure TfmBuildingCodeArmAreaState.pm_ArmModeChangeClick(Sender: TObject);
var
  stArmAreaID : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  i : integer;
begin
  Try
    if ArmAreaListView.Selected = nil then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    if Not dmPCClient.Connected then
    begin
      showmessage('서버와 통신연결이 끊어 졌습니다.');
      Exit;
    end;

    for i := 0 to ArmAreaListView.Items.Count - 1 do
    begin
      if ArmAreaListView.Items[i].Selected then
      begin
        stArmAreaID:= ArmAreaListView.Items[i].SubItems.Strings[0];
        stNodeNo := copy(stArmAreaID,1,G_nNodeCodeLength);
        stEcuID := copy(stArmAreaID,1 + G_nNodeCodeLength,2);
        stArmAreaNo := copy( stArmAreaID,1 + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stArmAreaNo),2) + 'A';
        dmPCClient.SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    Exit;
  End;

end;

procedure TfmBuildingCodeArmAreaState.pm_DisArmModeChangeClick(Sender: TObject);
var
  stArmAreaID : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stSendData : string;
  stTime : string;
  stClientIP : string;
  i : integer;
begin
  Try
    if ArmAreaListView.Selected = nil then Exit;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    if Not dmPCClient.Connected then
    begin
      showmessage('서버와 통신연결이 끊어 졌습니다.');
      Exit;
    end;

    for i := 0 to ArmAreaListView.Items.Count - 1 do
    begin
      if ArmAreaListView.Items[i].Selected then
      begin
        stArmAreaID:= ArmAreaListView.Items[i].SubItems.Strings[0];
        stNodeNo := copy(stArmAreaID,1,G_nNodeCodeLength);
        stEcuID := copy(stArmAreaID,1 + G_nNodeCodeLength,2);
        stArmAreaNo := copy( stArmAreaID,1 + G_nNodeCodeLength + 2,1);
        stSendData := FillZeroNumber(strtoint(stArmAreaNo),2) + 'D';
        dmPCClient.SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
      end;
    end;
  Except
    Exit;
  End;

end;

function TfmBuildingCodeArmAreaState.ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;
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

procedure TfmBuildingCodeArmAreaState.DeviceReload;
begin
  L_bFormActive := False; //재로딩 하자
  ViewRefreshTimer.Enabled := True;
end;

procedure TfmBuildingCodeArmAreaState.DoorChangeEvent(aNodeNo, aEcuID, aType, aNo,
  aCmd, aData, aBuildingCode: string);
begin

end;

procedure TfmBuildingCodeArmAreaState.ArmAreaCurrentAlarmStateChange(aNodeNo,
  aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
var
  stArmAreaID : string;
  nIndex : Integer;
  nTempIndex : integer;
  stArmMode : string;
  nEventIndex : integer;
  nImageIndex : integer;
begin
  stArmAreaID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := BuildingArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  if nIndex > ArmAreaListView.Items.Count - 1 then Exit;

  nTempIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
  if nTempIndex < 0 then Exit;

  stArmMode := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nTempIndex]).GetArmAreaDeviceSecurityMode(aNodeNo,aEcuID,aArmAreaNo);
  nEventIndex := 0;
  nImageIndex := con_ArmAreaImageNothing;
  if isDigit(aAlarmState) then nEventIndex := strtoint(aAlarmState);
  case nEventIndex of
    1 : begin
      if stArmMode = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
      else if stArmMode = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
    end;
    2 : begin
      if stArmMode = 'D' then nImageIndex := con_ArmAreaEventImageDisArm
      else if stArmMode = 'A' then nImageIndex := con_ArmAreaEventImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
    end;
    3 : begin
      if stArmMode = 'D' then nImageIndex := con_ArmAreaAlarmImageDisArm
      else if stArmMode = 'A' then nImageIndex := con_ArmAreaAlarmImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateAlarmEvent;
    end;
    else begin
      if stArmMode = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
      else if stArmMode = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNotEvent;
    end;
  end;
  ArmAreaListView.Items[nIndex].ImageIndex := nImageIndex;

  {
  if aAlarmState = '1' then
  begin
    ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNormalEvent;
  end else if aAlarmState = '2' then
  begin
    ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNormalEvent;
  end else if aAlarmState = '3' then
  begin
    ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateAlarmEvent;
  end else
  begin
    ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNotEvent;
  end;
  }
  ArmAreaListView.Refresh;
end;

procedure TfmBuildingCodeArmAreaState.ArmAreaListViewClick(Sender: TObject);
begin
  //popupMenu := nil;
  if ArmAreaListView.ItemIndex < 0 then Exit;
  if ArmAreaListView.ItemIndex > (ArmAreaListView.Items.Count ) then Exit;
  popupMenu := popupMenu1;
  if Not fmParent.IsInsertGrade then
  begin
    pm_ArmModeChange.Enabled := False;
    pm_DisArmModeChange.Enabled := False;
  end else
  begin
    pm_ArmModeChange.Enabled := True;
    pm_DisArmModeChange.Enabled := True;
  end;
end;

procedure TfmBuildingCodeArmAreaState.ArmAreaListViewDblClick(Sender: TObject);
var
  stArmAreaID : string;
begin
  Try
    if ArmAreaListView.Selected = nil then Exit;
    stArmAreaID:= ArmAreaListView.Selected.SubItems.Strings[0];
    if FormTYPE = 'BUILDING' then
    begin
      FfmParent.ParentCommand('TfmBuildingCodeArmAreaState','BUILDINGCHANGE',stArmAreaID);
      Exit;
    end;
  Except
    Exit;
  End;
end;

procedure TfmBuildingCodeArmAreaState.ArmAreaListViewMouseEnter(
  Sender: TObject);
begin
  inherited;
  ArmAreaListView.hint := inttostr(L_nViewListStyle);
end;

procedure TfmBuildingCodeArmAreaState.ArmAreaSecurityModeChange(aNodeNo, aEcuID,
  aArmAreaNo, aMode, aBuildingCode: string);
var
  stArmAreaID : string;
  nIndex : Integer;
  nImageIndex : integer;
  nEventIndex : integer;
  nTempIndex : integer;
begin
  stArmAreaID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := BuildingArmAreaList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
  if nIndex > ArmAreaListView.Items.Count - 1 then Exit;
  nImageIndex := con_ArmAreaImageNothing;
(*  if aMode = 'D' then
  begin
    ArmAreaListView.Items[nIndex].ImageIndex := con_ArmAreaImageDisArm;
  end else if aMode = 'A' then
  begin
    ArmAreaListView.Items[nIndex].ImageIndex := con_ArmAreaImageArm;
  end else
  begin
    ArmAreaListView.Items[nIndex].ImageIndex := con_ArmAreaImageNothing;
  end;
*)
  nTempIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
  if nTempIndex < 0 then Exit;

  nEventIndex := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nTempIndex]).GetArmAreaDeviceArmAreaState(aNodeNo,aEcuID,aArmAreaNo);
  case nEventIndex of
    1 : begin
      if aMode = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
      else if aMode = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
    end;
    2 : begin
      if aMode = 'D' then nImageIndex := con_ArmAreaEventImageDisArm
      else if aMode = 'A' then nImageIndex := con_ArmAreaEventImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
    end;
    3 : begin
      if aMode = 'D' then nImageIndex := con_ArmAreaAlarmImageDisArm
      else if aMode = 'A' then nImageIndex := con_ArmAreaAlarmImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateAlarmEvent;
    end;
    else begin
      if aMode = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
      else if aMode = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
      //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNotEvent;
    end;
  end;
  ArmAreaListView.Items[nIndex].ImageIndex := nImageIndex;

  ArmAreaListView.Refresh;
end;

procedure TfmBuildingCodeArmAreaState.ArmAreaStateRefresh;
var
  nIndex : integer;
  i : integer;
  nArmAreaIndex : integer;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stArmAreaName : string;
  stArmAreaID : string;
  nImageIndex : integer;
  nEventIndex : integer;
  stArmState : string;
begin
  if FormTYPE = 'BUILDING' then Exit;

  Try
    nIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
    if nIndex < 0 then Exit;
    for i := 0 to TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaCount - 1 do
    begin
      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexDevieInfo(i,stNodeNo,stEcuID,stArmAreaNo,stArmAreaName) then
      begin
        stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
        stArmAreaID := stNodeNo + stEcuID + stArmAreaNo;
        nArmAreaIndex := BuildingArmAreaList.IndexOf(stArmAreaID);
        nImageIndex := con_ArmAreaImageNothing;
        stArmState := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexSecurityMode(i);
        {if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexSecurityMode(i) = 'D' then
        begin
          nImageIndex := con_ArmAreaImageDisArm;
        end else if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexSecurityMode(i) = 'A' then
        begin
          nImageIndex := con_ArmAreaImageArm;
        end;
        ArmAreaListView.Items[nArmAreaIndex].ImageIndex := nImageIndex;

        nEventIndex := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexArmAreaState(i);
        case nEventIndex of
          1 : begin
            ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          2 : begin
            ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          3 : begin
            ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateAlarmEvent;
          end;
          else begin
            ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNotEvent;
          end;
        end;   }
        nEventIndex := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nIndex]).GetArmAreaIndexArmAreaState(i);
        case nEventIndex of
          1 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          2 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaEventImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaEventImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNormalEvent;
          end;
          3 : begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaAlarmImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaAlarmImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateAlarmEvent;
          end;
          else begin
            if stArmState = 'D' then nImageIndex := con_ArmAreaNormalImageDisArm
            else if stArmState = 'A' then nImageIndex := con_ArmAreaNormalImageArm;
            //ArmAreaListView.Items[nArmAreaIndex].StateIndex := con_AlarmStateNotEvent;
          end;
        end;
        ArmAreaListView.Items[nArmAreaIndex].ImageIndex := nImageIndex;
      end;
    end;
  Except
    Exit;
  End;
end;

procedure TfmBuildingCodeArmAreaState.BuildingAlarmStateChange(
  aBuildingCode: string; aAlarmState: integer);
var
  nIndex : Integer;
  nImageIndex : integer;
  nTempIndex : integer;
  nBuildingSecurityMode : integer;
begin
  if FormTYPE <> 'BUILDING' then Exit;
  nIndex := BuildingArmAreaList.IndexOf(aBuildingCode);
  if nIndex < 0 then Exit;
  if nIndex > ArmAreaListView.Items.Count - 1 then Exit;
  nTempIndex := G_MonitoringBuildingList.IndexOf(aBuildingCode);
  nBuildingSecurityMode := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nTempIndex]).BuildingSecurityMode;

  case aAlarmState of
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
  ArmAreaListView.Items[nIndex].ImageIndex := nImageIndex;
   (*
  if aAlarmState = 1 then
  begin
    ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNormalEvent;
  end else if aAlarmState = 2 then
  begin
    ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNormalEvent;
  end else if aAlarmState = 3 then
  begin
    ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateAlarmEvent;
  end else
  begin
    ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNotEvent;
  end; *)
  ArmAreaListView.Refresh;
end;

procedure TfmBuildingCodeArmAreaState.BuildingSecurityModeChange(
  aBuildingCode: string; aMode: integer);
var
  nIndex : Integer;
  nImageIndex : integer;
  nTempIndex : integer;
  nBuildingAlarmState : integer;
begin
  if FormTYPE <> 'BUILDING' then Exit;
  nIndex := BuildingArmAreaList.IndexOf(aBuildingCode);
  if nIndex < 0 then Exit;
  if nIndex > ArmAreaListView.Items.Count - 1 then Exit;

  nTempIndex := G_MonitoringBuildingList.IndexOf(aBuildingCode);
  if nTempIndex < 0 then Exit;
  nBuildingAlarmState := TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nTempIndex]).BuildingAlarmState;
  case nBuildingAlarmState of
    1 : begin
      if aMode = 1 then nImageIndex := con_BuildingArmAreaNormalImageDisArm
      else if aMode = 2 then nImageIndex := con_BuildingArmAreaNormalImagePartArm
      else if aMode = 3 then nImageIndex := con_BuildingArmAreaNormalImageArm;
      //ArmAreaListView.Items[i].StateIndex := con_AlarmStateNormalEvent;
    end;
    2 : begin
      if aMode = 1 then nImageIndex := con_BuildingArmAreaEventImageDisArm
      else if aMode = 2 then nImageIndex := con_BuildingArmAreaEventImagePartArm
      else if aMode = 3 then nImageIndex := con_BuildingArmAreaEventImageArm;
      //ArmAreaListView.Items[i].StateIndex := con_AlarmStateNormalEvent;
    end;
    3 : begin
      if aMode = 1 then nImageIndex := con_BuildingArmAreaAlarmImageDisArm
      else if aMode = 2 then nImageIndex := con_BuildingArmAreaAlarmImagePartArm
      else if aMode = 3 then nImageIndex := con_BuildingArmAreaAlarmImageArm;
      //ArmAreaListView.Items[i].StateIndex := con_AlarmStateAlarmEvent;
    end;
    else begin
      if aMode = 1 then nImageIndex := con_BuildingArmAreaNormalImageDisArm
      else if aMode = 2 then nImageIndex := con_BuildingArmAreaNormalImagePartArm
      else if aMode = 3 then nImageIndex := con_BuildingArmAreaNormalImageArm;
      //ArmAreaListView.Items[i].StateIndex := con_AlarmStateNotEvent;
    end;
  end;
  ArmAreaListView.Items[nIndex].ImageIndex := nImageIndex;
  ArmAreaListView.Refresh;

(*
  if aMode = 1 then
  begin
    ArmAreaListView.Items[nIndex].ImageIndex := con_BuildingArmAreaImageDisArm;
  end else if aMode = 2 then
  begin
    ArmAreaListView.Items[nIndex].ImageIndex := con_BuildingArmAreaImagePartArm;
  end else if aMode = 3 then
  begin
    ArmAreaListView.Items[nIndex].ImageIndex := con_BuildingArmAreaImageArm;
  end;
*)
end;

procedure TfmBuildingCodeArmAreaState.BuildingStateRefresh;
var
  i : integer;
  stBuildingCode : string;
  nIndex : integer;
  nBuildingSecurityMode : integer;
  nImageIndex : integer;
begin
  if FormTYPE <> 'BUILDING' then Exit;
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
      ArmAreaListView.Items[i].ImageIndex := nImageIndex;
(*      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode = 1 then
      begin
        ArmAreaListView.Items[nIndex].ImageIndex  := con_BuildingArmAreaImageDisArm;
      end else if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode = 2 then
      begin
        ArmAreaListView.Items[nIndex].ImageIndex := con_BuildingArmAreaImagePartArm;
      end else if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingSecurityMode = 3 then
      begin
        ArmAreaListView.Items[nIndex].ImageIndex := con_BuildingArmAreaImageArm;
      end;

      case TMonitoringBuildingState(G_MonitoringBuildingList.Objects[i]).BuildingAlarmState of
        1 : begin
          ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNormalEvent;
        end;
        2 : begin
          ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNormalEvent;
        end;
        3 : begin
          ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateAlarmEvent;
        end;
        else begin
          ArmAreaListView.Items[nIndex].StateIndex := con_AlarmStateNotEvent;
        end;
      end;
*)
    end;
  Except
    Exit;
  End;
end;

procedure TfmBuildingCodeArmAreaState.Button1Click(Sender: TObject);
begin
  inherited;
  ArmAreaStateRefresh;
  BuildingStateRefresh;
end;

procedure TfmBuildingCodeArmAreaState.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);

end;

procedure TfmBuildingCodeArmAreaState.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin
  ViewRefreshTimer.Enabled := False;
  ViewRefreshTimer.Free;
  ReSizeTimer.Enabled := False;
  ReSizeTimer.Free;
(*  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\BuildingCodeArmAreaState.INI');
    with ini_fun do
    begin
      if L_nViewListStyle = 0 then
        WriteString('MONITOR','ViewStyle'  + BuildingCode ,'VSICON')
      else WriteString('MONITOR','ViewStyle'  + BuildingCode,'VSLIST');
    end;
  Finally
    ini_fun.Free;
  End;
*)

  BuildingArmAreaList.Free;

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

procedure TfmBuildingCodeArmAreaState.FormCreate(Sender: TObject);
begin
  ViewRefreshTimer := TTimer.Create(nil);
  ViewRefreshTimer.Interval := 200;
  ViewRefreshTimer.OnTimer := ViewRefreshTimerTimer;
  ViewRefreshTimer.Enabled := False;

  ReSizeTimer := TTimer.Create(nil);
  ReSizeTimer.Interval := 200;
  ReSizeTimer.OnTimer := ReSizeTimerTimer;
  ReSizeTimer.Enabled := False;

  BuildingArmAreaList := TStringList.Create;
  FontSetting;
end;

procedure TfmBuildingCodeArmAreaState.AdvSmoothButton1Click(Sender: TObject);
begin
  pan_DoorInfo.Visible := False;
end;

procedure TfmBuildingCodeArmAreaState.CMDockClient(var Message: TCMDockClient);
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

procedure TfmBuildingCodeArmAreaState.WMNCLButtonDown(var Msg: TMessage);
begin
  inherited;
  // This event happen when mouse click in caption
  // save initial window position
  FUndockedLeft:= Left;
  FUndockedTop:= Top;
end;

end.
