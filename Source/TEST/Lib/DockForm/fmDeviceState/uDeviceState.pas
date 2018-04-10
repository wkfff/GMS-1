
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit uDeviceState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls, AppEvnts, Vcl.ComCtrls,uSubForm, W7Classes, W7Panels,
  Vcl.ImgList,shellapi, AdvToolBar, AdvToolBarStylers, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, CommandArray, AdvPageControl, AdvAppStyler,
  Vcl.Imaging.pngimage;

const
  con_LocalNodeAllConnectedImageIndex = 2;
  con_LocalNodeConnectedImageIndex = 1;
  con_LocalNodeDisConnectedImageIndex = 0;

  con_LocalDeviceConnectedImageIndex = 4;
  con_LocalDeviceDisConnectedImageIndex = 3;

type
  TfmDeviceState = class(TfmASubForm)
    W7Panel1: TW7Panel;

    MenuImageList16: TImageList;
    toolslist: TImageList;
    PopupMenu1: TPopupMenu;
    pm_PingTest: TMenuItem;
    pm_TimeSync: TMenuItem;
    N3: TMenuItem;
    pm_DeviceReset: TMenuItem;
    pm_PermitReSend: TMenuItem;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvPageControl1: TAdvPageControl;
    TabSheet1: TAdvTabSheet;
    tv_DeviceList: TTreeView;
    tv_DeviceCode: TTreeView;
    AdvFormStyler1: TAdvFormStyler;
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet1Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tv_DeviceListClick(Sender: TObject);
    procedure pm_PingTestClick(Sender: TObject);
    procedure pm_TimeSyncClick(Sender: TObject);
    procedure pm_DeviceResetClick(Sender: TObject);
    procedure pm_PermitReSendClick(Sender: TObject);
  private
    procedure LoadDeviceList;
  private
    FUndockedLeft: Integer;
    FUndockedTop: Integer;
    FFloatOnCloseDock: boolean;
    FfmParent: TfmASubForm;
    function  ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;   //도킹되어 있는 상태에서 다른 폼이 도킹을 시도하는 경우 발생
    procedure CMDockClient(var Message: TCMDockClient); message CM_DOCKCLIENT;
    procedure WMNCLButtonDown(var Msg: TMessage); message WM_NCLBUTTONDOWN;
    procedure FontSetting;
  public
    procedure RcvDeviceConnectedChangeEvent(aNodeNo,aEcuID,aData:string);
    procedure RcvNodeConnectedChangeEvent(aNodeNo,aEcuID,aData:string);
  public
    property fmParent : TfmASubForm read FfmParent write FfmParent;
    property UndockedLeft: Integer read FUndockedLeft;
    property UndockedTop: Integer read FUndockedTop;
    property FloatOnCloseDock: boolean read FFloatOnCloseDock write FFloatOnCloseDock;
  end;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormDeviceState,
  uFormVariable,
  uPCClient,
  uServerClientVariable,
  uFormUtil;
{$R *.dfm}

procedure TfmDeviceState.FormDockOver(Sender: TObject; Source: TDragDockObject;
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

procedure TfmDeviceState.LoadDeviceList;
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  i : integer;
  j : integer;
  stNodeNo : string;
  stEcuID,stEcuName : string;
begin
  aTreeView := tv_DeviceList;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := tv_DeviceCode;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  if G_MonitoringNodeList.Count < 1 then Exit;

  for i := 0 to G_MonitoringNodeList.Count - 1 do
  begin
    aNode := aTreeView.Items.Add(nil,TMonitoringNode(G_MonitoringNodeList.Objects[i]).NodeIP + ':' + TMonitoringNode(G_MonitoringNodeList.Objects[i]).NodeName);
    case TMonitoringNode(G_MonitoringNodeList.Objects[i]).NodeConnected[1] of
      '2' : begin
        aNode.ImageIndex := con_LocalNodeAllConnectedImageIndex;
        aNode.SelectedIndex := con_LocalNodeAllConnectedImageIndex;
      end;
      '1' : begin
        aNode.ImageIndex := con_LocalNodeConnectedImageIndex;
        aNode.SelectedIndex := con_LocalNodeConnectedImageIndex;
      end;
      '0' : begin
        aNode.ImageIndex := con_LocalNodeDisConnectedImageIndex;
        aNode.SelectedIndex := con_LocalNodeDisConnectedImageIndex;
      end;
      else begin
        aNode.ImageIndex := con_LocalNodeDisConnectedImageIndex;
        aNode.SelectedIndex := con_LocalNodeDisConnectedImageIndex;
      end;
    end;
    stNodeNo := FillZeroNumber(TMonitoringNode(G_MonitoringNodeList.Objects[i]).NodeNo,G_nNodeCodeLength);
    vNode1 := vTreeView.Items.AddChild(nil,'N' + stNodeNo);
    TMonitoringNode(G_MonitoringNodeList.Objects[i]).DeviceSort; //기기번호별로 조회 하자.
    for j := 0 to TMonitoringNode(G_MonitoringNodeList.Objects[i]).GetDeviceCount - 1 do
    begin
      if TMonitoringNode(G_MonitoringNodeList.Objects[i]).GetDeviceIndexName(j,stEcuID,stEcuName) then
      begin
        if aNode <> nil then
        begin
          bNode:= aTreeView.Items.AddChild(aNode,stEcuID); //+ ':' + stEcuName);
          case TMonitoringNode(G_MonitoringNodeList.Objects[i]).GetDeviceConnect(stEcuID)[1] of
            '0' : begin
              bNode.ImageIndex := con_LocalDeviceDisConnectedImageIndex ;
              bNode.SelectedIndex := con_LocalDeviceDisConnectedImageIndex ;
            end;
            '1' : begin
              bNode.ImageIndex := con_LocalDeviceConnectedImageIndex;
              bNode.SelectedIndex := con_LocalDeviceConnectedImageIndex;
            end;
            else begin
              bNode.ImageIndex := con_LocalDeviceDisConnectedImageIndex;
              bNode.SelectedIndex := con_LocalDeviceDisConnectedImageIndex;
            end;
          end;

        end;
        if vNode1 <> nil then
        begin
          vNode2:= vTreeView.Items.AddChild(vNode1,'E' + stNodeNo + stEcuID);
        end;
      end;
    end;
    aNode.Expanded := True;
  end;
end;

procedure TfmDeviceState.pm_DeviceResetClick(Sender: TObject);
var
  stDeviceCode : string;
  stNodeNo : string;
  stECUID : string;
  stClientIP : string;
  stTime : string;
  nIndex : integer;
begin
  stDeviceCode := tv_DeviceCode.Items.Item[tv_DeviceList.Selected.AbsoluteIndex].Text;
  if copy(stDeviceCode,1,1) <> 'E' then Exit;
  Delete(stDeviceCode,1,1);
  stNodeNo := copy(stDeviceCode,1,G_nNodeCodeLength);
  stEcuID := copy(stDeviceCode,1 + G_nNodeCodeLength,2);
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCECU,'R',stNodeNo,stEcuID,'');
  end;
  //dmPCClient.SendPacket('C',SCECU,'R',stNodeNo,stEcuID,'');
  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'','0',con_ComLogTYPE_DEVICE,TMenuItem(Sender).Caption);

end;

procedure TfmDeviceState.pm_PermitReSendClick(Sender: TObject);
var
  stDeviceCode : string;
  stNodeNo : string;
  stECUID : string;
  stClientIP : string;
  stTime : string;
  nIndex : integer;
begin
  stDeviceCode := tv_DeviceCode.Items.Item[tv_DeviceList.Selected.AbsoluteIndex].Text;
  if copy(stDeviceCode,1,1) <> 'E' then Exit;
  Delete(stDeviceCode,1,1);
  stNodeNo := copy(stDeviceCode,1,G_nNodeCodeLength);
  stEcuID := copy(stDeviceCode,1 + G_nNodeCodeLength,2);
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  if dmDBFunction.CheckTB_CARDFTPDOWNLIST_Device(stNodeNo,stEcuID) < 1 then
  begin
    //Insert
    dmDBInsert.InsertIntoTB_CARDFTPDOWNLIST_Value(stNodeNo,stEcuID,'0','N','0');
  end else
  begin
    //Update
    dmDBUpdate.UpdateTB_CARDFTPDOWNLIST_Value(stNodeNo,stEcuID,'0','N','0')
  end;
  nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCECU,'C',stNodeNo,stEcuID,'');
  end;
//  dmPCClient.SendPacket('C',SCECU,'C',stNodeNo,stEcuID,'');

  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'','0',con_ComLogTYPE_DEVICE,TMenuItem(Sender).Caption);

end;

procedure TfmDeviceState.pm_PingTestClick(Sender: TObject);
var
  stNodeIp : string;
  stMessage : string;
  stExe:string;
begin
  stNodeIp := tv_DeviceList.Selected.Text;
  stNodeIp := FindCharCopy(stNodeIp,0,':');
  if Not IsIPTypeCheck(stNodeIp) then
  begin
    stMessage := dmFormMessage.GetMessage('DATATYPEFAIL');
    showmessage(stNodeIp + ':' + stMessage);
    Exit;
  end;
  ShellExecute(0, 'open', PChar('ping.exe'), PChar(stNodeIp), nil, SW_SHOWNORMAL );
end;

procedure TfmDeviceState.pm_TimeSyncClick(Sender: TObject);
var
  stNodeNo : string;
  stClientIP : string;
  stTime : string;
  nIndex : integer;
begin
  stNodeNo := tv_DeviceCode.Items.Item[tv_DeviceList.Selected.AbsoluteIndex].Text;
  if copy(stNodeNo,1,1) <> 'N' then Exit;
  Delete(stNodeNo,1,1);
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
  if nIndex > -1 then
  begin
    TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCNODE,'T',stNodeNo,'00','');
  end;
//  dmPCClient.SendPacket('C',SCNODE,'T',stNodeNo,'00','');
  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,'00','','0',con_ComLogTYPE_DEVICE,TMenuItem(Sender).Caption);
end;

procedure TfmDeviceState.RcvDeviceConnectedChangeEvent(aNodeNo, aEcuID,
  aData: string);
var
  stNodeNo : string;
  aTreeView   : TTreeview;
  vTreeView   : TTreeview;
  aNode       : TTreeNode;
  nItemIndex : integer;
begin
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
  aTreeView := tv_DeviceList;
  if aTreeView.Items.Count < 1 then Exit;
  vTreeView := tv_DeviceCode;
  aNode:= GetNodeByText(vTreeView,'E' + stNodeNo + aEcuID ,False);

  if aNode = nil then
  begin
    aNode:= GetNodeByText(vTreeView,'E' + stNodeNo + aEcuID ,False);
    exit;
  end;

  nItemIndex := aNode.AbsoluteIndex;
  if aData <> '' then
  begin
    case aData[1] of
      '0' : begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalDeviceDisConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalDeviceDisConnectedImageIndex;
      end;
      '1' : begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalDeviceConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalDeviceConnectedImageIndex;
      end;
      else begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalDeviceDisConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalDeviceDisConnectedImageIndex;
      end;
    end;
  end else
  begin
    aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalDeviceDisConnectedImageIndex;
    aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalDeviceDisConnectedImageIndex;
  end;

end;

procedure TfmDeviceState.RcvNodeConnectedChangeEvent(aNodeNo, aEcuID,
  aData: string);
var
  stNodeNo : string;
  aTreeView   : TTreeview;
  vTreeView   : TTreeview;
  aNode       : TTreeNode;
  nItemIndex : integer;
begin
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
  aTreeView := tv_DeviceList;
  if aTreeView.Items.Count < 1 then Exit;
  vTreeView := tv_DeviceCode;
  aNode:= GetNodeByText(vTreeView,'N' + stNodeNo ,False);

  if aNode = nil then
  begin
    aNode:= GetNodeByText(vTreeView,'N' + stNodeNo ,False);
    exit;
  end;

  nItemIndex := aNode.AbsoluteIndex;
  if aData <> '' then
  begin
    case aData[1] of
      '2' : begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalNodeAllConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalNodeAllConnectedImageIndex;
      end;
      '1' : begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalNodeConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalNodeConnectedImageIndex;
      end;
      '0' : begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalNodeDisConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalNodeDisConnectedImageIndex;
      end;
      else begin
        aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalNodeDisConnectedImageIndex;
        aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalNodeDisConnectedImageIndex;
      end;
    end;
  end else
  begin
    aTreeView.Items.Item[nItemIndex].ImageIndex := con_LocalNodeDisConnectedImageIndex;
    aTreeView.Items.Item[nItemIndex].SelectedIndex := con_LocalNodeDisConnectedImageIndex;
  end;
  aTreeView.Refresh;
end;

procedure TfmDeviceState.TabSheet1Resize(Sender: TObject);
begin
  tv_DeviceList.Left := 3;
  tv_DeviceList.Width := TabSheet1.Width - 6;
  tv_DeviceList.Top := 3;
  tv_DeviceList.Height := TabSheet1.Height - 6;
end;

procedure TfmDeviceState.tv_DeviceListClick(Sender: TObject);
var
  stCode : string;
begin
  popupmenu := nil;
  if tv_DeviceList.Selected = nil then Exit;
  stCode := tv_DeviceCode.Items.Item[tv_DeviceList.Selected.AbsoluteIndex].Text;

  popupmenu := PopupMenu1;

  if copy(stCode,1,1) = 'N' then
  begin
    pm_PingTest.Visible := True;
    pm_TimeSync.Visible := True;
    pm_DeviceReset.Visible := False;
    pm_PermitReSend.Visible := False;
  end else
  begin
    pm_PingTest.Visible := False;
    pm_TimeSync.Visible := False;
    pm_DeviceReset.Visible := True;
    pm_PermitReSend.Visible := True;
  end;


end;

function TfmDeviceState.ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;
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

procedure TfmDeviceState.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);

end;

procedure TfmDeviceState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
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

procedure TfmDeviceState.FormCreate(Sender: TObject);
begin
  tv_DeviceCode.Left := -200;  //Visible =  False 로 하면 코드를 찾지 못한다.
  LoadDeviceList;
  FontSetting;
end;

procedure TfmDeviceState.CMDockClient(var Message: TCMDockClient);
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

procedure TfmDeviceState.WMNCLButtonDown(var Msg: TMessage);
begin
  inherited;
  // This event happen when mouse click in caption
  // save initial window position
  FUndockedLeft:= Left;
  FUndockedTop:= Top;
end;

end.
