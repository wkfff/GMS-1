
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit uMapDoorState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ExtCtrls, StdCtrls, AppEvnts, Vcl.ComCtrls,uSubForm, W7Classes, W7Panels,
  Vcl.ImgList, AdvSmoothPanel, AdvSmoothButton, CommandArray,System.IniFiles,
  ieview, imageenview, ievect,Data.Win.ADODB,ActiveX, AdvSmoothLabel,
  AdvPageControl, Vcl.OleCtrls, NemoLib_TLB, AdvToolBar, AdvToolBarStylers,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvAppStyler, Vcl.Imaging.pngimage;

type

  TfmMapDoorState = class(TfmASubForm)
    W7Panel1: TW7Panel;
    ImageEnVect1: TImageEnVect;
    lb_name: TAdvSmoothLabel;
    PopupMenu1: TPopupMenu;
    mn_DoorOpen: TMenuItem;
    N9: TMenuItem;
    pm_JavarOpen: TMenuItem;
    pm_JavarClose: TMenuItem;
    pm_DoorManageMode: TMenuItem;
    pm_DooOpenMode: TMenuItem;
    pm_DoorCloseMode: TMenuItem;
    N6: TMenuItem;
    pm_DoorStateCheck: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    mn_ImageFit: TMenuItem;
    mn_ImageOrg: TMenuItem;
    N14: TMenuItem;
    pm_DoorInfo: TMenuItem;
    N1: TMenuItem;
    mn_Name: TMenuItem;
    pan_DoorInfo: TAdvSmoothPanel;
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
    AdvSmoothButton1: TAdvSmoothButton;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    N2: TMenuItem;
    mn_CardMode: TMenuItem;
    Positive1: TMenuItem;
    Negative1: TMenuItem;
    AdvFormStyler1: TAdvFormStyler;
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvSmoothButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mn_ImageFitClick(Sender: TObject);
    procedure mn_ImageOrgClick(Sender: TObject);
    procedure ImageEnVect1ZoomIn(Sender: TObject; var NewZoom: Double);
    procedure ImageEnVect1SelectObject(Sender: TObject);
    procedure ImageEnVect1ObjectClick(Sender: TObject; hobj: Integer);
    procedure ImageEnVect1ObjectOver(Sender: TObject; hobj: Integer);
    procedure pm_ArmAreaStateSearchClick(Sender: TObject);
    procedure pm_ArmModeChangeClick(Sender: TObject);
    procedure ImageEnVect1DblClick(Sender: TObject);
    procedure ImageEnVect1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PageCCTVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageCCTVMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PageCCTVMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageCCTVDockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure mn_DoorOpenClick(Sender: TObject);
    procedure pm_JavarOpenClick(Sender: TObject);
    procedure pm_JavarCloseClick(Sender: TObject);
    procedure pm_DoorManageModeClick(Sender: TObject);
    procedure pm_DoorStateCheckClick(Sender: TObject);
    procedure pm_DoorInfoClick(Sender: TObject);
    procedure Positive1Click(Sender: TObject);
  private
    SubCodeList : TStringList;
    L_bAlarmTrigger : Boolean;
    L_bFormActive : Boolean;
    L_bViewRefresh : Boolean;
    L_nViewListStyle : integer;
    L_bImageFit : Boolean;
    L_stSelectCode : string;
    L_nTempSeq : integer;
    procedure LoadMap;
  private
    FUndockedLeft: Integer;
    FUndockedTop: Integer;
    FFloatOnCloseDock: boolean;
    FfmParent: TfmASubForm;
    FBuildingCode: string;
    FFormTYPE: String;
    DragOrigin: TPoint;
    FMouseDowning: BOOLEAN;
    FParentTop: integer;
    FParentLeft: integer;
    procedure CreateDockableWindows(aCCTVSeq,aCCTVIP,aCCTVPort,aCCTVName,aCCTVUserID,aCCTVUserPw:string);
    procedure ShowDockableWindows(aCCTVSeq:string);
    function  ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;   //도킹되어 있는 상태에서 다른 폼이 도킹을 시도하는 경우 발생
    procedure CMDockClient(var Message: TCMDockClient); message CM_DOCKCLIENT;
    procedure WMNCLButtonDown(var Msg: TMessage); message WM_NCLBUTTONDOWN;
    procedure WMNCLButtonUp(var Msg: TMessage); message WM_NCLBUTTONUP;
    procedure SetParentLeft(const Value: integer);
  public
    procedure ShowDockPanel(APanel: TPanel; MakeVisible: Boolean; Client: TControl);override;
    procedure ShowDockPageControl(APageControl: TAdvPageControl; MakeVisible: Boolean; Client: TControl);override;
    procedure FontSetting;
  public
    procedure ArmAreaCurrentAlarmStateChange(aNodeNo,aEcuID,aArmAreaNo,aAlarmState,aBuildingCode:string);
    procedure ArmAreaSecurityModeChange(aNodeNo,aEcuID,aArmAreaNo,aMode,aBuildingCode:string);
    procedure BuildingAlarmStateChange(aBuildingCode:string;aAlarmState: integer);
    procedure BuildingSecurityModeChange(aBuildingCode:string;aMode : integer);
    procedure DeviceReload;
    procedure DoorChangeEvent(aNodeNo,aEcuID,aType,aNo,aCmd,aData,aBuildingCode:string);
    procedure SecurityEventClear;
    function GetDoorImageIndex(aDoorCardMode,aDoorManageMode,aDoorDSState,aDoorLSState:string):integer;
  public
    property fmParent : TfmASubForm read FfmParent write FfmParent;
    property FormTYPE : String read FFormTYPE write FFormTYPE;
    property UndockedLeft: Integer read FUndockedLeft;
    property UndockedTop: Integer read FUndockedTop;
    property FloatOnCloseDock: boolean read FFloatOnCloseDock write FFloatOnCloseDock;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property MouseDowning : BOOLEAN read FMouseDowning write FMouseDowning;
    property ParentTop : integer read FParentTop write FParentTop;
    property ParentLeft : integer read FParentLeft write SetParentLeft;
  end;

implementation
uses
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uFormDeviceState,
  uFormVariable,
  uCommonVariable,
  uCommonFunction,
  uCCTV,
  uPCClient,
  uServerClientVariable,
  uBuildingAlarmConfirm,
  uFormUtil;
{$R *.dfm}

procedure TfmMapDoorState.FormDockOver(Sender: TObject; Source: TDragDockObject;
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

procedure TfmMapDoorState.FormResize(Sender: TObject);
begin
  inherited;
  pan_DoorInfo.Left := (W7Panel1.Width div 2) - (pan_DoorInfo.Width div 2);
  pan_DoorInfo.Top := (W7Panel1.Height div 2) - (pan_DoorInfo.Height div 2);

  ImageEnVect1.Left := 15;
  ImageEnVect1.Top := 15;
  ImageEnVect1.Width := W7Panel1.Width - 30;
  ImageEnVect1.Height := W7Panel1.Height - 30;

  if L_bImageFit then ImageEnVect1.Fit;

//
end;

procedure TfmMapDoorState.FormShow(Sender: TObject);
begin
  inherited;
  LoadMap;
  pm_JavarOpen.Visible := False;
  pm_JavarClose.Visible := False;
  mn_CardMode.Visible := G_bCardModeShow;
end;

function TfmMapDoorState.GetDoorImageIndex(aDoorCardMode, aDoorManageMode,
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

procedure TfmMapDoorState.ImageEnVect1DblClick(Sender: TObject);
begin
  if Not fmParent.IsInsertGrade then
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
  Try
    if FormTYPE = 'BUILDING' then
    begin
      FfmParent.ParentCommand('TfmMapDoorState','BUILDINGCHANGE',L_stSelectCode);
      Exit;
    end;
  Except
    Exit;
  End;

end;

procedure TfmMapDoorState.ImageEnVect1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  lb_name.Top := y;
  lb_name.Left := X - (lb_name.Width div 2);

end;

procedure TfmMapDoorState.ImageEnVect1ObjectClick(Sender: TObject;
  hobj: Integer);
begin
  inherited;
  //이 프로세스를 안탄다.
//  ImageEnVect1.MouseInteractVt:=[miUnStampMode];
  if FormTYPE <> 'BUILDING' then
  begin
    ImageEnVect1.UnSelAllObjects;
    ImageEnVect1.AddSelObject(hobj);
    ImageEnVect1.ObjTransparency[hobj] := 250;
  end;

end;

procedure TfmMapDoorState.ImageEnVect1ObjectOver(Sender: TObject;
  hobj: Integer);
begin
  inherited;
//  ImageEnVect1.MouseInteractVt:=[miObjectSelect];
  ImageEnVect1.UnSelAllObjects;
  ImageEnVect1.AddSelObject(hobj);
  if FormTYPE = 'BUILDING' then
  begin
    //ImageEnVect1.ObjTransparency[hobj] := 150;
  end else
  begin
    //ImageEnVect1.ObjTransparency[hobj] := 250;
  end;
end;

procedure TfmMapDoorState.ImageEnVect1SelectObject(Sender: TObject);
var
  i,hobj:integer;
  mydata:PMyData;
  stNodeNo,stEcuID,stDoorNo : string;
begin
  with ImageEnVect1 do
    for i:=0 to ObjectsCount-1 do
    begin
      hobj := GetObjFromIndex( i );
      if IsSelObject( hobj ) then
      begin
        lb_name.Visible := True;
        if FormTYPE = 'BUILDING' then
        begin
          mydata:=ImageEnVect1.ObjUserData[ hobj ];
          if mydata <> nil then
          begin
            mn_Name.Caption := '선택된위치:' + mydata.BuildingName;
            lb_name.Caption.Text := mydata.BuildingName;
            L_stSelectCode := mydata.BuildingID;
          end;
          ImageEnVect1.ObjTransparency[hobj] := 150;
        end else
        begin
          mydata:=ImageEnVect1.ObjUserData[ hobj ];
          if mydata <> nil then
          begin
            mn_Name.Caption := '선택된위치:' + mydata.ArmAreaName;
            lb_name.Caption.Text := mydata.ArmAreaName;
            L_stSelectCode := myData.ArmAreaID;
            stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
            stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
            stDoorNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);
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
        end;
      end else
      begin
        if FormTYPE = 'BUILDING' then
        begin
          mydata:=ImageEnVect1.ObjUserData[ hobj ];
          if mydata <> nil then
          begin
          end;
          ImageEnVect1.ObjTransparency[hobj] := 0;
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
end;

procedure TfmMapDoorState.ImageEnVect1ZoomIn(Sender: TObject;
  var NewZoom: Double);
var
  ini_fun : TiniFile;
begin
  inherited;
  Try
    ini_fun := TiniFile.Create('setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','MapDoorStateZoom' + BuildingCode,Round(ImageEnVect1.Zoom));
      WriteInteger('Image','MapDoorStateFit' + BuildingCode,0);
    end;
  Finally
    ini_fun.Free;
  End;
  L_bImageFit := False;
end;

procedure TfmMapDoorState.LoadMap;
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
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  nIndex : integer;
  nBuildingIndex : integer;
  stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent : string;
  nImageIndex : integer;
begin
  if SubCodeList.Count > 0 then
  begin
    for i := SubCodeList.Count - 1 downto 0 do
    begin
      TMapDoor(SubCodeList.Objects[i]).Free;
      SubCodeList.Delete(i);
    end;
  end;
  SubCodeList.Clear;

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
      nZoomSize := ReadInteger('Image','MapDoorStateZoom' + BuildingCode,100);
      if ReadInteger('Image','MapDoorStateFit' + BuildingCode,1) = 1 then L_bImageFit := True
      else L_bImageFit := False;
    end;
  Finally
    ini_fun.Free;
  End;

  if FileExists(G_stExeFolder + '\' + BuildingCode + '.jpg') then DeleteFile(G_stExeFolder + '\' + BuildingCode + '.jpg');     //파일 삭제
  if FileExists(G_stExeFolder + '\' + BuildingCode + '.iev') then DeleteFile(G_stExeFolder + '\' + BuildingCode + '.iev');
  //여기서 이미지 로딩 하자.
  Try
    if G_nDBType = POSTGRESQL then
    begin
      stSql := ' SELECT BM_DOORMAP,lo_export(TB_BUILDINGMAP.BM_DOORMAP, ' + G_stExeFolder + '\\' + BuildingCode + '.jpg''),lo_export(TB_BUILDINGMAP.BM_DOORMAPINFO, ' + G_stExeFolder + '\\' + BuildingCode + '.iev'') From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''' + BuildingCode + ''' ';
      stSql := stSql + ' AND BM_TYPE = 1 ';
    end else
    begin
      stSql := ' SELECT * From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''' + BuildingCode + ''' ';
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
        Exit;
      End;

      if RecordCount > 0 then
      begin
        if Not FindField('BM_DOORMAP').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_DOORMAP'), G_stExeFolder + '\' + BuildingCode + '.jpg');
          end;
        end;
        if Not FindField('BM_DOORMAPINFO').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_DOORMAPINFO'), G_stExeFolder + '\' + BuildingCode + '.iev');
          end;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  if FileExists(G_stExeFolder + '\' + BuildingCode + '.jpg') then
  begin
    // load the bitmap
    ImageEnVect1.IO.LoadFromFile( G_stExeFolder + '\' + BuildingCode + '.jpg' );
    // look for vectorial objects
    if FileExists(G_stExeFolder + '\' + BuildingCode + '.iev' ) then
      ImageEnVect1.LoadFromFileIEV( G_stExeFolder + '\' + BuildingCode + '.iev' );
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
        if FormTYPE = 'BUILDING' then
        begin
          if SubCodeList.IndexOf(mydata.BuildingID) < 0 then
          begin
            oMapDoor := TMapDoor.Create(nil) ;
            oMapDoor.Code := mydata.BuildingID;
            oMapDoor.hobj := hobj;
            oMapDoor.Name := dmDBFunction.GetTB_BUILDINGCODE_BuildingName(mydata.BuildingID);
            mydata^.BuildingName := oMapDoor.Name;
            ImageEnVect1.ObjUserData[hobj]:=mydata;
            ImageEnVect1.ObjUserDataLength[hobj]:=sizeof(TMyData);
            SubCodeList.AddObject(mydata.BuildingID,oMapDoor);
          end;
        end else if FormTYPE = 'DOOR' then
        begin
          if SubCodeList.IndexOf(mydata.ArmAreaID) < 0 then
          begin
            oMapDoor := TMapDoor.Create(nil) ;
            oMapDoor.Code := mydata.ArmAreaID;
            oMapDoor.hobj := hobj;
            oMapDoor.Name := dmDBFunction.GetTB_DOOR_DoorName(copy(mydata.ArmAreaID,1,G_nNodeCodeLength),copy(mydata.ArmAreaID,1 + G_nNodeCodeLength,2),copy(mydata.ArmAreaID,1 + G_nNodeCodeLength + 2,1));
            mydata^.ArmAreaName := oMapDoor.Name;
            ImageEnVect1.ObjUserData[hobj]:=mydata;
            ImageEnVect1.ObjUserDataLength[hobj]:=sizeof(TMyData);

            stNodeNo := copy(mydata.ArmAreaID,1,G_nNodeCodeLength);
            stEcuID := copy(mydata.ArmAreaID,1 + G_nNodeCodeLength,2);
            stDoorNo := copy(mydata.ArmAreaID,1 + G_nNodeCodeLength + 2,1);
            //nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
            nBuildingIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
            if nBuildingIndex > -1 then
            begin
              if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nBuildingIndex]).GetDoorCurrentState(stNodeNo,stEcuID,stDoorNo,stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then
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
            SubCodeList.AddObject(mydata.ArmAreaID,oMapDoor);
          end;
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

procedure TfmMapDoorState.mn_ImageOrgClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  inherited;
  ImageEnVect1.Zoom := 100;
  L_bImageFit := False;
  mn_ImageFit.Checked := False;
  mn_ImageOrg.Checked := True;
  Try
    ini_fun := TiniFile.Create('setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','MapDoorStateZoom' + BuildingCode,Round(ImageEnVect1.Zoom));
      WriteInteger('Image','MapDoorStateFit' + BuildingCode,0);
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmMapDoorState.PageCCTVDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
  inherited;
  //OnDockDrop gets called AFTER the client has actually docked,
  //so we check for DockClientCount = 1 before making the dock panel visible.
//  if (Sender as TAdvPageControl).DockClientCount = 1 then
//    ShowDockPageControl(Sender as TAdvPageControl, True, nil);
//  (Sender as TAdvPageControl).DockManager.ResetBounds(True);
  //Make DockManager repaints it's clients.

end;

procedure TfmMapDoorState.PageCCTVMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    if (Button = mbLeft) and (MouseDowning = False) then
    begin
        // DRAG POINT 저장
        DragOrigin := Point (X,Y);
        // MOUSE DOWN = TRUE 설정
        MouseDowning := True;
    end else MouseDowning := False;

end;

procedure TfmMapDoorState.PageCCTVMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = TRUE CHECK
    if (MouseDowning = True) then
    begin
      if ((Sender as TAdvPageControl).Top + (Sender as TAdvPageControl).Height) >= (ImageEnVect1.Height) then
      begin
        (Sender as TAdvPageControl).Top := (ImageEnVect1.Height) - (Sender as TAdvPageControl).Height - 1;
      end
      else if ((Sender as TAdvPageControl).Left + (Sender as TAdvPageControl).Width) >= (ImageEnVect1.Width ) then
      begin
        (Sender as TAdvPageControl).Left := (ImageEnVect1.Width) - (Sender as TAdvPageControl).Width - 1;
      end
      else
      begin
        // IMAGE TOP 위치 설정
        (Sender as TAdvPageControl).Top := (Sender as TAdvPageControl).Top + Y - DragOrigin.Y;
        // IMAGE LEFT 위치 설정
        (Sender as TAdvPageControl).Left := (Sender as TAdvPageControl).Left + X - DragOrigin.X;
      end;
    end;
end;

procedure TfmMapDoorState.PageCCTVMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = FALSE 설정
  MouseDowning := False;

end;

procedure TfmMapDoorState.pm_ArmAreaStateSearchClick(Sender: TObject);
var
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
    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stArmAreaNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stArmAreaNo),2);

    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('S',SCARMAREA,'s',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('S',SCARMAREA,'s',stNodeNo,stEcuID,stSendData);
    //dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapDoorState.pm_ArmModeChangeClick(Sender: TObject);
var
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

    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stArmAreaNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stArmAreaNo),2) + 'A';
    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    end;
    //dmPCClient.SendPacket('C',SCARMAREA,'M',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stArmAreaNo,con_ComLogTYPE_ARMAREA,TMenuItem(Sender).Caption);
  Except
    Exit;
  End;

end;

procedure TfmMapDoorState.pm_DoorInfoClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
begin

  stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
  stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
  stDoorNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);
  lb_DoorName.Caption := dmDBFunction.GetTB_DOOR_DoorName(stNodeNo,stEcuID,stDoorNo);
  lb_NodeIp.Caption := dmDBFunction.GetTB_NODE_NodeIP(stNodeNo);
  lb_DeviceID.Caption := stEcuID;
  lb_DoorNo.Caption := stDoorNo;
  lb_Building.Caption := dmDBFunction.GetTB_Door_BuildingName(stNodeNo,stEcuID,stDoorNo);
  pan_DoorInfo.Visible := True;
  pan_DoorInfo.Caption.Text := pm_DoorInfo.Caption;

end;

procedure TfmMapDoorState.pm_DoorManageModeClick(Sender: TObject);
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
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stDoorNo),2) + inttostr(TMenuItem(sender).Tag);

    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCDOOR,'M',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapDoorState.pm_DoorStateCheckClick(Sender: TObject);
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
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);

    stSendData := FillZeroNumber(strtoint(stDoorNo),2);

    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,stSendData);
    end;
    //dmPCClient.SendPacket('S',SCDOOR,'D',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapDoorState.pm_JavarCloseClick(Sender: TObject);
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
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stDoorNo := '2';
    stSendData := FillZeroNumber(strtoint(stDoorNo),2);

    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapDoorState.pm_JavarOpenClick(Sender: TObject);
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
//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stDoorNo := '1';
    stSendData := FillZeroNumber(strtoint(stDoorNo),2);

    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapDoorState.Positive1Click(Sender: TObject);
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
    stClientIP:= GetLocalIPAddr;
    stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

//    if Not dmPCClient.Connected then
//    begin
//      showmessage(dmFormMessage.GetMessage('SERVERDISCONNECT'));
//      Exit;
//    end;

    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stDoorNo),2) + inttostr(TMenuItem(sender).Tag);

    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
    end;
//    dmPCClient.SendPacket('C',SCDOOR,'C',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    showmessage(dmFormMessage.GetMessage('SENDFAIL'));
    Exit;
  End;
end;

procedure TfmMapDoorState.SecurityEventClear;
var
  i,hobj:integer;
  mydata:PMyData;
  stAlarmID : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  nIndex : integer;
begin
  with ImageEnVect1 do
    for i:=0 to ObjectsCount-1 do
    begin
      hobj := GetObjFromIndex( i );
      mydata:=ImageEnVect1.ObjUserData[ hobj ];
      if mydata <> nil then
      begin
        if FormTYPE = 'BUILDING' then
        begin
          ObjBrushColor[hobj] := mydata.NormalColor;
        end else
        begin
          stAlarmID := mydata.ArmAreaID;
          stNodeNo := copy(stAlarmID,1,G_nNodeCodeLength);
          stEcuID := copy(stAlarmID,1 + G_nNodeCodeLength,2);
          stArmAreaNo := copy(stAlarmID,1 + G_nNodeCodeLength + 2,1);
          nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            if TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).GetArmAreaState(con_CMDArmAreaArmMode,stEcuID,stArmAreaNo) = 'A' then
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
end;

procedure TfmMapDoorState.SetParentLeft(const Value: integer);
begin
  FParentLeft := Value;
end;

procedure TfmMapDoorState.ShowDockableWindows(aCCTVSeq:string);
begin

end;

procedure TfmMapDoorState.ShowDockPageControl(APageControl: TAdvPageControl;
  MakeVisible: Boolean; Client: TControl);
begin
  inherited;
  if not MakeVisible and (APageControl.VisibleDockClientCount > 1) then
    Exit;

  if MakeVisible and (Client <> nil) then Client.Show
  else if Not MakeVisible then
  begin
  end;

end;

procedure TfmMapDoorState.ShowDockPanel(APanel: TPanel; MakeVisible: Boolean;
  Client: TControl);
begin
inherited ;
  //Client - the docked client to show if we are re-showing the panel.
  //Client is ignored if hiding the panel.

  //Since docking to a non-visible docksite isn't allowed, instead of setting
  //Visible for the panels we set the width to zero. The default InfluenceRect
  //for a control extends a few pixels beyond it's boundaries, so it is possible
  //to dock to zero width controls.

  //Don't try to hide a panel which has visible dock clients.
  if not MakeVisible and (APanel.VisibleDockClientCount > 1) then
    Exit;

  if MakeVisible and (Client <> nil) then Client.Show
  else if Not MakeVisible then
  begin
  end;
end;

procedure TfmMapDoorState.mn_DoorOpenClick(Sender: TObject);
var
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

    stNodeNo := copy(L_stSelectCode,1,G_nNodeCodeLength);
    stEcuID := copy(L_stSelectCode,1 + G_nNodeCodeLength,2);
    stDoorNo := copy( L_stSelectCode,1 + G_nNodeCodeLength + 2,1);
    stSendData := FillZeroNumber(strtoint(stDoorNo),2);

    nIndex := G_MonitoringNodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      TMonitoringNode(G_MonitoringNodeList.Objects[nIndex]).SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    end;
    //dmPCClient.SendPacket('C',SCDOOR,'O',stNodeNo,stEcuID,stSendData);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo,stEcuID,'',stDoorNo,con_ComLogTYPE_DOOR,TMenuItem(Sender).Caption);
  Except
    Exit;
  End;

end;

procedure TfmMapDoorState.mn_ImageFitClick(Sender: TObject);
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
    ini_fun := TiniFile.Create('setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','MapDoorStateZoom' + BuildingCode,Round(ImageEnVect1.Zoom));
      WriteInteger('Image','MapDoorStateFit' + BuildingCode,1);
    end;
  Finally
    ini_fun.Free;
  End;
end;

function TfmMapDoorState.ComputeDockingRect(var DockRect: TRect; MousePos: TPoint): TAlign;
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

procedure TfmMapDoorState.CreateDockableWindows(aCCTVSeq,aCCTVIP,aCCTVPort,aCCTVName,aCCTVUserID,aCCTVUserPw:string);
var
  I: Integer;
  oCCTVForm : TfmCCTV;
  stBuildingCode : string;
  nIndex : integer;
begin
  if FormTYPE <> 'BUILDING' then
  begin
  end;
end;

procedure TfmMapDoorState.DeviceReload;
begin

end;

procedure TfmMapDoorState.DoorChangeEvent(aNodeNo, aEcuID, aType, aNo,
  aCmd, aData, aBuildingCode: string);
var
  stDoorID : string;
  nIndex : Integer;
  hobj : integer;
  mydata:PMyData;
  nBuildingIndex : integer;
  nImageIndex : integer;
  stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent : string;
begin
  stDoorID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aNo;
  nIndex := SubCodeList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  hobj := TMapDoor(SubCodeList.Objects[nIndex]).hobj;
  mydata:=ImageEnVect1.ObjUserData[ hobj ];
  if mydata <> nil then
  begin
    nBuildingIndex := G_MonitoringBuildingList.IndexOf(BuildingCode);
    if nBuildingIndex > -1 then
    begin
      if TMonitoringBuildingState(G_MonitoringBuildingList.Objects[nBuildingIndex]).GetDoorCurrentState(aNodeNo,aEcuID,aNo,stDoorCardMode,stDoorManageMode,stDoorDSState,stDoorLSState,stDoorFireEvent) then
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

procedure TfmMapDoorState.ArmAreaCurrentAlarmStateChange(aNodeNo,
  aEcuID, aArmAreaNo, aAlarmState, aBuildingCode: string);
begin

end;

procedure TfmMapDoorState.ArmAreaSecurityModeChange(aNodeNo, aEcuID,
  aArmAreaNo, aMode, aBuildingCode: string);
var
  stArmAreaID : string;
  nIndex : Integer;
  hobj : integer;
  mydata:PMyData;
begin
  stArmAreaID := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aArmAreaNo;
  nIndex := SubCodeList.IndexOf(stArmAreaID);
  if nIndex < 0 then Exit;
    hobj := TMapDoor(SubCodeList.Objects[nIndex]).hobj;
    mydata:=ImageEnVect1.ObjUserData[ hobj ];
    if mydata <> nil then
    begin
      if aMode = 'A' then
      begin
        ImageEnVect1.ObjBrushColor[hobj] := mydata.ArmColor;
        ImageEnVect1.ObjPenColor[hobj] := mydata.ArmColor;
      end else
      begin
        ImageEnVect1.ObjBrushColor[hobj] := mydata.DisArmColor;
        ImageEnVect1.ObjPenColor[hobj] := mydata.DisArmColor;
      end;
    end;
end;

procedure TfmMapDoorState.BuildingAlarmStateChange(
  aBuildingCode: string; aAlarmState: integer);
var
  nIndex : integer;
  hobj : integer;
  mydata:PMyData;
begin
  if FormTYPE <> 'BUILDING' then Exit;
  if aAlarmState = 3 then
  begin
      nIndex := SubCodeList.IndexOf(aBuildingCode);
      if nIndex > -1 then
      begin
        hobj := TMapDoor(SubCodeList.Objects[nIndex]).hobj;
        mydata:=ImageEnVect1.ObjUserData[ hobj ];
        if mydata <> nil then
        begin
          ImageEnVect1.ObjBrushColor[hobj] := mydata.AlarmColor;
          ImageEnVect1.ObjPenColor[hobj] := mydata.AlarmColor;
        end;
      end;
  end;
end;

procedure TfmMapDoorState.BuildingSecurityModeChange(
  aBuildingCode: string; aMode: integer);
begin
  if FormTYPE <> 'BUILDING' then Exit;

end;

procedure TfmMapDoorState.FontSetting;
begin
  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);

end;

procedure TfmMapDoorState.FormActivate(Sender: TObject);
begin
  L_bFormActive := True;
end;

procedure TfmMapDoorState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SubCodeList.Free;

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

procedure TfmMapDoorState.FormCreate(Sender: TObject);
begin
  SubCodeList := TStringList.Create;
  FontSetting;
end;

procedure TfmMapDoorState.AdvSmoothButton1Click(Sender: TObject);
begin
  pan_DoorInfo.Visible := False;
end;

procedure TfmMapDoorState.CMDockClient(var Message: TCMDockClient);
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

procedure TfmMapDoorState.WMNCLButtonDown(var Msg: TMessage);
begin
  inherited;
  // This event happen when mouse click in caption
  // save initial window position
  FUndockedLeft:= Left;
  FUndockedTop:= Top;
end;

procedure TfmMapDoorState.WMNCLButtonUp(var Msg: TMessage);
begin
  MouseDowning := False;
end;

end.
