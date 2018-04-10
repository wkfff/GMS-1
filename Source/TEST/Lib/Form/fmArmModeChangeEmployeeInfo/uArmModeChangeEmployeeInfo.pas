
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit uArmModeChangeEmployeeInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls, AppEvnts, Vcl.ComCtrls,uSubForm, W7Classes, W7Panels,Vcl.Imaging.jpeg,
  Data.Win.ADODB,Winapi.ActiveX, CommandArray, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers, AdvPageControl;

type
  TfmArmModeChangeEmployeeInfo = class(TfmASubForm)
    W7Panel1: TW7Panel;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvPageControl1: TAdvPageControl;
    AdvTabSheet1: TAdvTabSheet;
    ed_ArmAreaName: TEdit;
    ed_ArmChange: TEdit;
    ed_DepartName: TEdit;
    ed_EmCode: TEdit;
    ed_Name: TEdit;
    ed_Posiname: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lb_name: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    function GetCardToEmployeeInfo(aCardNo:string;var aEmSeq,aEmName,aCompanyName,aEmCode,aPosiName:string):Boolean;
    procedure ImageLoading(aEmSeq:string);
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
    procedure DeviceAlarmEvent(aNodeNo, aECUID,aExtendID, aCmd, aMsgNo, aTime, aSubCLass, aSubAddr, aArmAreaNo, aMode, aAlarmStateCode, aLoop,
                      aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor:string);
    procedure DeviceCardAccessEvent(aTime,aNodeNo, aEcuID, aDoorNo,aReaderNo, aInOut,aInOutName, aCardMode, aDoorMode, aChangeState, aAccessResult,
                    aAccessPermitName,aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName:string);
  public
    property fmParent : TfmASubForm read FfmParent write FfmParent;
    property UndockedLeft: Integer read FUndockedLeft;
    property UndockedTop: Integer read FUndockedTop;
    property FloatOnCloseDock: boolean read FFloatOnCloseDock write FFloatOnCloseDock;
  end;

implementation
{$R *.dfm}
uses
  uCommonFunction,
  uCommonVariable,
  uDBVariable,
  uDataBase,
  uFormDeviceState,
  uFormFunction,
  uFormVariable,
  uFormUtil;

procedure TfmArmModeChangeEmployeeInfo.FormDockOver(Sender: TObject; Source: TDragDockObject;
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

function TfmArmModeChangeEmployeeInfo.GetCardToEmployeeInfo(aCardNo: string;
  var aEmSeq,aEmName,aCompanyName,aEmCode,aPosiName: string): Boolean;
var
  stSql : string;
  nIndex : integer;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  stSql := ' Select a.EM_SEQ,b.EM_CODE,b.EM_NAME,b.CO_COMPANYCODE,c.CO_COMPANYNAME,b.PO_POSICODE,d.PO_POSICODENAME  from TB_CARD a ' ;
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ) ';
  stSql := stSql + ' Left Join TB_COMPANYCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE )';
  stSql := stSql + ' Left Join TB_POSICODE d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.PO_POSICODE = d.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

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

      result := True;
      aEmSeq := FindField('EM_SEQ').AsString;
      aEmName := FindField('EM_NAME').AsString;
      aCompanyName := FindField('CO_COMPANYNAME').AsString;
      aEmCode := FindField('PO_POSICODENAME').AsString;
      aPosiName := FindField('PO_POSICODENAME').AsString;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmArmModeChangeEmployeeInfo.ImageLoading(aEmSeq: string);
var
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Image1.Picture := nil;
  //여기서 이미지 로딩 하자.
  Try
    MapJpg := TJpegImage.Create;
    MapStream := TMemoryStream.Create;
    if G_nDBType = POSTGRESQL then
    begin
      DeleteFile(G_stExeFolder + '\1.jpg');
      stSql := ' SELECT lo_export(TB_EMPLOYEE.EM_IMAGE, ' + G_stExeFolder + '\1.jpg' + ') From TB_EMPLOYEE ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
    end else
    begin
      stSql := ' select * from TB_EMPLOYEE ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
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
        Exit;
      End;

      if RecordCount > 0 then
      begin
        if Not FindField('EM_IMAGE').IsNull then
        begin
          if G_nDBType = POSTGRESQL then
          begin
            if FileExists(G_stExeFolder + '\1.jpg') then
              Image1.Picture.LoadFromFile(G_stExeFolder + '\1.jpg');
          end else
          begin
            JPEGLoadFromDB(FieldByName('EM_IMAGE'), Image1);
          end;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
    MapJpg.Free;
    MapStream.Free;
  End;
end;

function TfmArmModeChangeEmployeeInfo.ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;
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

procedure TfmArmModeChangeEmployeeInfo.DeviceAlarmEvent(aNodeNo, aECUID,aExtendID, aCmd,
  aMsgNo, aTime, aSubCLass, aSubAddr, aArmAreaNo, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName,aArmModeChange, aAlarmView, aAlarmSound, aAlarmColor: string);
var
  nIndex : integer;
  stNodeIP : string;
  stAlarmAreaName : string;
  stAlarmDeviceTypeName : string;
  stAlarmModeName : string;
  bModeChange : Boolean;
  stEmSeq,stPosiName,stEmName,stCompanyName,stEmCode : string;
begin
  if aCmd <> 'A' then Exit;
  if aArmModeChange <> '1' then Exit;


  if Not isDigit(aArmAreaNo) then aArmAreaNo := '0'
  else aArmAreaNo := inttostr(strtoint(aArmAreaNo));

  nIndex := G_MonitoringNodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex < 0 then Exit;
  ed_ArmAreaName.Text := TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaName,aEcuID,aArmAreaNo);
  ed_ArmChange.Text := dmFormFunction.GetAlarmModeName(aMode);
  if aMode ='A' then
  begin
    ed_ArmChange.Font.Color := clRed;
  end else
  begin
    ed_ArmChange.Font.Color := clBlue;
  end;

  bModeChange := False;
  if copy(aAlarmStatePCCode,4,2) <> '00' then Exit;
  if Not dmFormFunction.GetCardToEmployeeInfo(aOper,stEmSeq,stEmName,stCompanyName,stEmCode,stPosiName) then
  begin
    Image1.Picture := nil;
    ed_Name.Text := aAlarmStatePCCodeName;
    ed_Posiname.Text := '';
    ed_DepartName.Text := '';
    ed_EmCode.Text := '';
    Exit;
  end;
  ed_Name.Text := stEmName;
  ed_Posiname.Text := stPosiName;
  ed_DepartName.Text := stCompanyName;
  ed_EmCode.Text := stEmCode;
  ImageLoading(stEmSeq);

end;

procedure TfmArmModeChangeEmployeeInfo.DeviceCardAccessEvent(aTime, aNodeNo, aEcuID,
  aDoorNo, aReaderNo, aInOut, aInOutName, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aAccessPermitName, aDoorState, aATButton, aType, aArmAreaNo,
  aCardno, aCompanyCode, aCompanyName, aEmSeq, aEmCode, aEmName,aPosiCode,aPosiName: string);
var
  nIndex : integer;
begin
  Exit;
  if Not ((aAccessResult = '3') or (aAccessResult = '4')) then Exit; //방범 조작이 아니면 빠져 나가자.

  nIndex := G_MonitoringNodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength));
  if nIndex < 0 then Exit;
  ed_ArmAreaName.Text := TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaName,aEcuID,aArmAreaNo);
  if aAccessResult ='3' then
  begin
    ed_ArmChange.Font.Color := clRed;
    ed_ArmChange.Text := '경계조작';
  end else
  begin
    ed_ArmChange.Font.Color := clBlue;
    ed_ArmChange.Text := '해제조작';
  end;

  ed_Name.Text := aEmName;
  ed_Posiname.Text := aPosiName;
  ed_DepartName.Text := aCompanyName;
  ed_EmCode.Text := aEmCode;
  ImageLoading(aEmSeq);
end;

procedure TfmArmModeChangeEmployeeInfo.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);

end;

procedure TfmArmModeChangeEmployeeInfo.FormClose(Sender: TObject;
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

procedure TfmArmModeChangeEmployeeInfo.FormCreate(Sender: TObject);
begin
  inherited;
  FontSetting;
end;

procedure TfmArmModeChangeEmployeeInfo.CMDockClient(var Message: TCMDockClient);
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

procedure TfmArmModeChangeEmployeeInfo.WMNCLButtonDown(var Msg: TMessage);
begin
  inherited;
  // This event happen when mouse click in caption
  // save initial window position
  FUndockedLeft:= Left;
  FUndockedTop:= Top;
end;

end.
