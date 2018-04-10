﻿unit uArmAreaMapAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, ieview, imageenview, ievect,
  CurvyControls,Vcl.Imaging.jpeg,IniFiles, Vcl.ExtCtrls, Vcl.Buttons, AdvCombo,Data.DB,
  Vcl.Mask, AdvSpin, AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers,
  Vcl.Imaging.pngimage, AdvGlowButton, AdvOfficePager, AdvOfficePagerStylers,
  AdvAppStyler;

const
  con_LocalBuildingImageIndex = 1;
  con_LocalDoorImageIndex = 7;

  con_Box = 1;
  con_Ellipse = 2;
  con_PolyLine = 3;
  con_PutBitmap = 4;

type
  TfmArmAreaMapAdmin = class(TfmASubForm)
    BodyPanel: TAdvSmoothPanel;
    CurvyPanel1: TCurvyPanel;
    ImageEnVect1: TImageEnVect;
    Panel2: TPanel;
    Panel1: TPanel;
    btn_ZoomOut: TSpeedButton;
    btn_ZoomIn: TSpeedButton;
    Bevel1: TBevel;
    SpeedButton3: TSpeedButton;
    btn_ImageFit: TSpeedButton;
    btn_ImageOrg: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btn_Delete: TSpeedButton;
    btn_save: TSpeedButton;
    Bevel4: TBevel;
    btn_FileOpen: TSpeedButton;
    Bevel5: TBevel;
    btn_Rotate270: TSpeedButton;
    btn_Rotate90: TSpeedButton;
    ColorDialog1: TColorDialog;
    Label4: TLabel;
    sh_DisArmColor: TShape;
    Label1: TLabel;
    sh_AlarmColor: TShape;
    btn_Ellipse: TSpeedButton;
    Pan_Workcode: TAdvSmoothPanel;
    lb_Name: TAdvSmoothLabel;
    ed_ArmAreaCode: TAdvEdit;
    cmb_ArmArea: TAdvComboBox;
    Splitter1: TSplitter;
    Label3: TLabel;
    sh_ArmColor: TShape;
    Label5: TLabel;
    se_Icon: TAdvSpinEdit;
    SpeedButton6: TSpeedButton;
    lb_Line: TAdvSmoothLabel;
    se_line: TAdvSpinEdit;
    btn_CCTV: TSpeedButton;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    pan_list: TAdvSmoothPanel;
    sg_BuildingCode: TAdvStringGrid;
    lb_List: TLabel;
    btn_Apply: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    lb_WorkType: TLabel;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    ed_ArmAreaName: TAdvEdit;
    btn_Box: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CurvyPanel1Resize(Sender: TObject);
    procedure ImageEnVect1ZoomIn(Sender: TObject; var NewZoom: Double);
    procedure FormCreate(Sender: TObject);
    procedure ImageEnVect1ObjectOver(Sender: TObject; hobj: Integer);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btn_EllipseClick(Sender: TObject);
    procedure btn_FileOpenClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_ZoomOutClick(Sender: TObject);
    procedure btn_ZoomInClick(Sender: TObject);
    procedure btn_Rotate270Click(Sender: TObject);
    procedure btn_Rotate90Click(Sender: TObject);
    procedure btn_ImageFitClick(Sender: TObject);
    procedure btn_ImageOrgClick(Sender: TObject);
    procedure btn_BoxClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sh_AlarmColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cmb_ArmAreaChange(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_ApplyClick(Sender: TObject);
    procedure ImageEnVect1NewObject(Sender: TObject; hobj: Integer);
    procedure sg_BuildingCodeClick(Sender: TObject);
    procedure sh_ArmColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sh_DisArmColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageEnVect1SelectObject(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure btn_CCTVClick(Sender: TObject);
    procedure pan_listResize(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    ArmAreaCodeList : TStringList;    //맵에 올려진 방범구역 코드
    CmbArmAreaCodeList : TStringList; //맵에 올려지지 않은 방범구역 코드
    L_nType : integer;
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    L_stSelectBuildingCode : string;
    L_bLineType : Boolean;
    L_bImageChange : Boolean;
    procedure FormNameSetting;
    procedure FontSetting;
  private
    { Private declarations }
    procedure GetBuildingImageMap(aBuildingCode:string);
    procedure Load_BuildingCode;
    procedure Load_ArmAreaCode(aBuildingCode:string);
    procedure Load_CCTVCode(aBuildingCode:string);
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmArmAreaMapAdmin: TfmArmAreaMapAdmin;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBSelect,
  uDBUpdate,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmArmAreaMapAdmin.btn_ApplyClick(Sender: TObject);
begin
  inherited;
  if ed_ArmAreaCode.Text = '' then
  begin
    showmessage(dmFormMessage.GetMessage('NOTSELECTARMAREA'));
    Exit;
  end;

  L_bLineType := False;
  case L_nType of
    con_Box : begin
      ImageEnVect1.MouseInteractVt := [miPutBox];
    end;
    con_Ellipse : begin
      ImageEnVect1.MouseInteractVt := [miPutEllipse];
    end;
    con_PolyLine : begin
      ImageEnVect1.MouseInteractVt := [miPutPolyLine];
      L_bLineType := True;
    end;
    con_PutBitmap : begin
      ImageEnVect1.MouseInteractVt := [miPutBitmap];
    end;
  end;
  Pan_Workcode.Visible := False;
end;

procedure TfmArmAreaMapAdmin.btn_BoxClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := True;
  lb_line.Visible := False;
  se_line.Visible := False;
  Load_ArmAreaCode(L_stSelectBuildingCode);
  L_nType := con_Box;
  //ImageEnVect1.MouseInteractVt := [miPutBox];
  ImageEnVect1.ObjBoxHighlight[-1] := False;
  ImageEnVect1.ObjBrushColor[-1] := sh_DisArmColor.Brush.Color;
  ImageEnVect1.ObjBrushStyle[-1] := bsSolid;
  ImageEnVect1.ObjTransparency[-1] := 150;

end;

procedure TfmArmAreaMapAdmin.btn_FileOpenClick(Sender: TObject);
var
  fn : string;
begin
  inherited;
  fn := ImageEnVect1.IO.ExecuteOpenDialog('', '', false, 1, '');
  if fn <> '' then
  begin
    Caption := fn;
    // load image
    ImageEnVect1.IO.LoadFromFile(fn);
    ImageEnvect1.Fit;
    // load annotations
    ImageEnVect1.RemoveAllObjects;
    ImageEnVect1.IO.Params.ImagingAnnot.CopyToTImageEnVect(ImageEnVect1);
  end;
end;

procedure TfmArmAreaMapAdmin.btn_ImageFitClick(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Fit;

end;

procedure TfmArmAreaMapAdmin.btn_ImageOrgClick(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Zoom := 100;

end;

procedure TfmArmAreaMapAdmin.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmArmAreaMapAdmin.btn_Rotate270Click(Sender: TObject);
begin
  inherited;
  ImageEnVect1.RotateAllObjects(270,ierImage);
  ImageEnVect1.Proc.Rotate(270);

end;

procedure TfmArmAreaMapAdmin.btn_Rotate90Click(Sender: TObject);
begin
  inherited;
  ImageEnVect1.RotateAllObjects(90,ierImage);
  ImageEnVect1.Proc.Rotate(90);

end;

procedure TfmArmAreaMapAdmin.btn_saveClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  inherited;
  L_bImageChange := False;
  if L_stSelectBuildingCode = '' then Exit;

  if FileExists(G_stExeFolder + '\' + L_stSelectBuildingCode + '_temp.jpg') then DeleteFile(G_stExeFolder + '\' + L_stSelectBuildingCode + '_temp.jpg');
  if FileExists(G_stExeFolder + '\' + L_stSelectBuildingCode + '_temp.iev') then DeleteFile(G_stExeFolder + '\' + L_stSelectBuildingCode + '_temp.iev');

  // save the bitmap
  ImageEnVect1.IO.SaveToFile( G_stExeFolder + '\' + L_stSelectBuildingCode + '_temp.jpg' );
  // save vectorial objects
  ImageEnVect1.SaveToFileIEV( G_stExeFolder + '\' + L_stSelectBuildingCode + '_temp.iev' );

  if dmDBFunction.CheckTB_BUILDINGMAP_BuildingCode(L_stSelectBuildingCode,'2') <> 1 then
  begin
    dmDBInsert.InsertIntoTB_BUILDINGMAP_Code(L_stSelectBuildingCode,'2','1');
  end;

  if (G_nDBType = MSSQL) or (G_nDBType = MDB)  then
  begin
    stSql := 'Update TB_BUILDINGMAP Set ';
    stSql := stSql + 'BM_MAP = :BM_MAP, ';
    stSql := stSql + 'BM_MAPINFO = :BM_MAPINFO ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND BC_BUILDINGCODE = ''' + L_stSelectBuildingCode + '''';
    stSql := stSql + ' AND BM_TYPE = 2 ';
    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        Sql.Clear;
        Sql.Text := stSql;
        Parameters.ParamByName( 'BM_MAP' ).LoadFromFile( G_stExeFolder + '\' + L_stSelectBuildingCode + '_temp.jpg', ftGraphic );
        Parameters.ParamByName( 'BM_MAPINFO' ).LoadFromFile( G_stExeFolder + '\' + L_stSelectBuildingCode + '_temp.iev', ftBlob );
        Try
          ExecSQL;
        Except
          dmDataBase.DBConnected := False;
          Exit;
        End;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  end else if G_nDBType = POSTGRESQL then
  begin
    stSql := 'Update TB_BUILDINGMAP Set ';
    stSql := stSql + 'BM_MAP = lo_import(''' + stringReplace(G_stExeFolder + '\' + L_stSelectBuildingCode + '_temp.jpg','\','\\',[rfReplaceAll]) + '''), ' ;
    stSql := stSql + 'BM_MAPINFO = lo_import(''' + stringReplace(G_stExeFolder + '\' + L_stSelectBuildingCode + '_temp.iev','\','\\',[rfReplaceAll]) + ''') ' ;
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND BC_BUILDINGCODE = ''' + L_stSelectBuildingCode + '''';
    stSql := stSql + ' AND BM_TYPE = 2 ';
    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        Sql.Clear;
        Sql.Text := stSql;
        Try
          ExecSQL;
        Except
          dmDataBase.DBConnected := False;
          Exit;
        End;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  end;

end;

procedure TfmArmAreaMapAdmin.btn_ZoomInClick(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Zoom := ImageEnVect1.Zoom / 2;
end;

procedure TfmArmAreaMapAdmin.btn_ZoomOutClick(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Zoom := ImageEnVect1.Zoom * 2;
end;

procedure TfmArmAreaMapAdmin.cmb_ArmAreaChange(Sender: TObject);
begin
  ed_ArmAreaCode.Text := '';
  ed_ArmAreaName.Text := '';
  if cmb_ArmArea.ItemIndex < 0 then Exit;

  ed_ArmAreaCode.Text := cmbArmAreaCodeList.Strings[cmb_ArmArea.ItemIndex];
  ed_ArmAreaName.Text := cmb_ArmArea.Text;
end;

procedure TfmArmAreaMapAdmin.CurvyPanel1Resize(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Top := 5;
  ImageEnVect1.Left := 5;
  ImageEnVect1.Width := CurvyPanel1.Width - (ImageEnVect1.Left * 2);
  ImageEnVect1.Height := CurvyPanel1.Height - Panel2.Height - (ImageEnVect1.Top * 2);

  Pan_Workcode.Left := (CurvyPanel1.Width div 2) - (Pan_Workcode.Width div 2);
  Pan_Workcode.Top := (CurvyPanel1.Height div 2) - (Pan_Workcode.Height div 2);

  Panel1.Left := (Panel2.Width - Panel1.Width) div 2;
end;

procedure TfmArmAreaMapAdmin.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
 *)
end;

procedure TfmArmAreaMapAdmin.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmArmAreaMapAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ArmAreaCodeList.Free;
  CmbArmAreaCodeList.Free;

  fmMain.FORMENABLE(con_FormBMOSARMAREAMAP,'FALSE');

  Action := caFree;
end;

procedure TfmArmAreaMapAdmin.FormCreate(Sender: TObject);
begin
  inherited;
  ArmAreaCodeList := TStringList.Create;
  CmbArmAreaCodeList := TStringList.Create;

  ImageEnVect1.MouseInteractVt:=[miObjectSelect];
  ImageEnVect1.CenterNewObjects:=true;
  ImageEnVect1.ObjGripPen.Style := psClear;
  ImageEnVect1.ObjGripBrush.Style := bsclear;

  FontSetting;
end;

procedure TfmArmAreaMapAdmin.FormGradeRefresh;
begin
//  pm_DeleteCode.Enabled := IsDeleteGrade;
end;

procedure TfmArmAreaMapAdmin.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmArmAreaMapAdmin.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_WorkType.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREA');
  lb_List.Caption := dmFormFunction.GetFormName('0','2','COMMONBUILDINGLIST');
  sg_BuildingCode.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  lb_Name.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONARMAREANAME');
  lb_Line.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONLINEWIDTH');
  btn_Apply.Caption := dmFormFunction.GetFormName('0','2','BUTTONAPPLY');

end;

procedure TfmArmAreaMapAdmin.FormResize(Sender: TObject);
begin
  inherited;
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

end;

procedure TfmArmAreaMapAdmin.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSARMAREAMAP,'TRUE');

  Load_BuildingCode;
  sg_BuildingCodeClick(self);
end;

procedure TfmArmAreaMapAdmin.Form_Close;
begin
  Close;
end;

procedure TfmArmAreaMapAdmin.GetBuildingImageMap(aBuildingCode:string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  ini_fun : TiniFile;
  nZoomSize : integer;
  i : integer;
  hobj : integer;
  mydata:PMyData;
  Stream: TStream;
  Field: TVarBytesField;
begin
  if ImageEnVect1.ObjectsCount > 0 then
  begin
    for i := ImageEnVect1.ObjectsCount - 1 downto 0 do
    begin
      hobj := ImageEnVect1.GetObjFromIndex( i );
      ImageEnVect1.RemoveObject(hobj);
    end;
  end;
  ImageEnVect1.Clear;
  ArmAreaCodeList.Clear;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\setting.INI');
    with ini_fun do
    begin
      nZoomSize := ReadInteger('Image','AlarmSettingZoom',100);
    end;
  Finally
    ini_fun.Free;
  End;

  if FileExists(G_stExeFolder + '\' + aBuildingCode + '.jpg') then DeleteFile(G_stExeFolder + '\' + aBuildingCode + '.jpg');     //파일 삭제
  if FileExists(G_stExeFolder + '\' + aBuildingCode + '.iev') then DeleteFile(G_stExeFolder + '\' + aBuildingCode + '.iev');
  //여기서 이미지 로딩 하자.
  Try
    if G_nDBType = POSTGRESQL then
    begin
      stSql := ' SELECT BM_MAP,lo_export(TB_BUILDINGMAP.BM_MAP, ' + G_stExeFolder + '\\' + aBuildingCode + '.jpg''),lo_export(TB_BUILDINGMAP.BM_MAPINFO, ' + G_stExeFolder + '\\' + aBuildingCode + '.iev'') From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''' + aBuildingCode + ''' ';
      stSql := stSql + ' AND BM_TYPE = 2 ';
    end else
    begin
      stSql := ' SELECT * From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''' + aBuildingCode + ''' ';
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
            SaveToImageFileFromDB(FieldByName('BM_MAP'), G_stExeFolder + '\' + aBuildingCode + '.jpg');
          end;
        end;
        if Not FindField('BM_MAPINFO').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_MAPINFO'), G_stExeFolder + '\' + aBuildingCode + '.iev');
          end;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  if FileExists(G_stExeFolder + '\' + aBuildingCode + '.jpg') then
  begin
    // load the bitmap
    ImageEnVect1.IO.LoadFromFile( G_stExeFolder + '\' + aBuildingCode + '.jpg' );
    // look for vectorial objects
    if FileExists(G_stExeFolder + '\' + aBuildingCode + '.iev' ) then
      ImageEnVect1.LoadFromFileIEV( G_stExeFolder + '\' + aBuildingCode + '.iev' );
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
        if ArmAreaCodeList.IndexOf(mydata.ArmAreaID) < 0 then
           ArmAreaCodeList.Add(mydata.ArmAreaID);
      end;
    end;
  end;

end;

procedure TfmArmAreaMapAdmin.ImageEnVect1NewObject(Sender: TObject;
  hobj: Integer);
var
  mydata:PMyData;
begin
  L_bImageChange := True;
  getmem(mydata, sizeof(TMyData));

  mydata^.ArmAreaID:=ed_ArmAreaCode.text;
  mydata^.ArmAreaName := ed_ArmAreaName.text;
  mydata^.DisArmColor:=sh_DisArmColor.Brush.color;
  mydata^.ArmColor:=sh_ArmColor.Brush.color;
  mydata^.SelectDisArmColor:=sh_DisArmColor.Brush.color + 100;
  mydata^.SelectArmColor:=sh_ArmColor.Brush.color + 100;
  mydata^.AlarmColor:=sh_AlarmColor.Brush.color;

  ImageEnVect1.ObjUserData[hobj]:=mydata;
  ImageEnVect1.ObjUserDataLength[hobj]:=sizeof(TMyData);
  ImageEnVect1.ObjPenColor[hobj] := sh_DisArmColor.Brush.color;
  if L_bLineType then ImageEnVect1.ObjPenWidth[hobj] := se_Line.Value;
  ImageEnVect1.MouseInteractVt:=[miObjectSelect];
  if ArmAreaCodeList.IndexOf(ed_ArmAreaCode.text) < 0 then ArmAreaCodeList.Add(ed_ArmAreaCode.text);

end;

procedure TfmArmAreaMapAdmin.ImageEnVect1ObjectOver(Sender: TObject;
  hobj: Integer);
begin
  inherited;
  ImageEnVect1.UnSelAllObjects;
  ImageEnVect1.AddSelObject(hobj);
//  ImageEnVect1.ObjTransparency[hobj] := 200;
end;

procedure TfmArmAreaMapAdmin.ImageEnVect1SelectObject(Sender: TObject);
var
  i,hobj:integer;
begin
  with ImageEnVect1 do
    for i:=0 to ObjectsCount-1 do
    begin
      hobj := GetObjFromIndex( i );
      if IsSelObject( hobj ) then
        ObjTransparency[hobj] := 250
      else
        ObjTransparency[hobj] := 150;
    end;

end;

procedure TfmArmAreaMapAdmin.ImageEnVect1ZoomIn(Sender: TObject;
  var NewZoom: Double);
var
  ini_fun : TiniFile;
begin
  inherited;
  Try
    ini_fun := TiniFile.Create('setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','AlarmSettingZoom',Round(ImageEnVect1.Zoom));
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmArmAreaMapAdmin.Load_ArmAreaCode(aBuildingCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stArmAreaCode : string;
begin

  lb_WorkType.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREA');//  '방범구역선택';
  lb_Name.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONARMAREA');
  lb_Line.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONLINEWIDTH');

  cmb_ArmArea.Text := '';
  ed_ArmAreaCode.Text := '';

  cmb_ArmArea.Items.Clear;
  cmb_ArmArea.ItemIndex := -1;
  cmbArmAreaCodeList.Clear;

  stSql := dmDBSelect.SelectTB_ARMAREA_BuildingCode(aBuildingCode);

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
      while Not Eof do
      begin
        stArmAreaCode := FillZeroNumber(FindField('ND_DECODERNO').AsInteger,G_nDecoderCodeLength) + FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('AR_ARMAREANO').AsString;
        if ArmAreaCodeList.IndexOf(stArmAreaCode) < 0 then
        begin
          cmbArmAreaCodeList.Add(stArmAreaCode);
          cmb_ArmArea.Items.Add(FindField('AR_ARMAREANAME').AsString);
        end;
        Next;
      end;
      if cmb_ArmArea.Items.Count > 0 then
      begin
        cmb_ArmArea.ItemIndex := 0;
        cmb_ArmAreaChange(self);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmArmAreaMapAdmin.Load_BuildingCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin

  GridInit(sg_BuildingCode,1,2);

  stSql := ' select * from TB_BUILDINGCODE ';
  stSql := stSql + ' Where Group_Code = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_CODEUSE = ''1'' ';
  stSql := stSql + ' AND BC_DEEPSEQ = ' + inttostr(G_nBuildingStep);
//  stSql := stSql + ' AND BC_DEEPSEQ = 1 ';

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
      sg_BuildingCode.RowCount := recordcount + 1;
      while Not Eof do
      begin
        with sg_BuildingCode do
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
end;

procedure TfmArmAreaMapAdmin.Load_CCTVCode(aBuildingCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stArmAreaCode : string;
begin

  lb_WorkType.Caption := 'CCTV선택';
  lb_Name.Caption.Text := 'CCTV명';
  lb_Line.Caption.Text := '라인굵기';

  cmb_ArmArea.Text := '';
  ed_ArmAreaCode.Text := '';

  cmb_ArmArea.Items.Clear;
  cmb_ArmArea.ItemIndex := -1;
  cmbArmAreaCodeList.Clear;

  stSql := dmDBSelect.SelectTB_CCTV_BuildingCode(aBuildingCode);

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
      while Not Eof do
      begin
        stArmAreaCode := 'C' + FillZeroNumber(FindField('CT_NO').AsInteger,G_nNodeCodeLength);
        if ArmAreaCodeList.IndexOf(stArmAreaCode) < 0 then
        begin
          cmbArmAreaCodeList.Add(stArmAreaCode);
          cmb_ArmArea.Items.Add(FindField('CT_NAME').AsString);
        end;
        Next;
      end;
      if cmb_ArmArea.Items.Count > 0 then
      begin
        cmb_ArmArea.ItemIndex := 0;
        cmb_ArmAreaChange(self);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmArmAreaMapAdmin.pan_listResize(Sender: TObject);
begin
  inherited;
  sg_BuildingCode.Left := 10;
  sg_BuildingCode.Width := pan_list.Width - (sg_BuildingCode.Left * 2);
  sg_BuildingCode.height := pan_list.height - (sg_BuildingCode.top + 10);
  sg_BuildingCode.ColWidths[0] := sg_BuildingCode.Width;
end;

procedure TfmArmAreaMapAdmin.sg_BuildingCodeClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
//  L_stSelectBuildingCode := '';
  with sg_BuildingCode do
  begin
    if cells[1,Row] = '' then Exit;
    if L_stSelectBuildingCode = cells[1,Row] then Exit;

    if L_bImageChange then
    begin
      if (Application.MessageBox(PChar(dmFormMessage.GetMessage('NOTSAVEWORK')),'Information',MB_OKCANCEL) = IDCANCEL)  then
      begin
        for i := 1 to RowCount - 1 do
        begin
          if L_stSelectBuildingCode = cells[1,i] then
          begin
            sg_BuildingCode.SelectRows(i,1);
            break;
          end;
        end;
        Exit;
      end;
      L_bImageChange := False;
    end;
    L_stSelectBuildingCode := cells[1,Row];
  end;
  Panel1.Enabled := True;
  GetBuildingImageMap( L_stSelectBuildingCode );
   //
end;

procedure TfmArmAreaMapAdmin.sh_AlarmColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ColorDialog1.execute then
  begin
    sh_AlarmColor.Brush.color := colorDialog1.Color;
  end;
end;

procedure TfmArmAreaMapAdmin.sh_ArmColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ColorDialog1.execute then
  begin
    sh_ArmColor.Brush.color := colorDialog1.Color;
  end;

end;

procedure TfmArmAreaMapAdmin.sh_DisArmColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ColorDialog1.execute then
  begin
    sh_DisArmColor.Brush.color := colorDialog1.Color;
  end;

end;

procedure TfmArmAreaMapAdmin.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  ImageEnVect1.MouseInteractVt := [miObjectSelect];
end;

procedure TfmArmAreaMapAdmin.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if L_stSelectBuildingCode = '' then Exit;

  Pan_Workcode.Visible := True;
  lb_line.Visible := True;
  se_line.Visible := True;
  Load_ArmAreaCode(L_stSelectBuildingCode);
  L_nType := con_PolyLine;

//  ImageEnVect1.MouseInteractVt := [miPutEllipse];
  ImageEnVect1.ObjStyle[-1]:=[ievsSelectable, ievsMoveable, ievsVisible];
  ImageEnVect1.ObjBoxHighlight[-1] := false;
  ImageEnVect1.ObjBrushColor[-1] := sh_DisArmColor.Brush.Color;
  ImageEnVect1.ObjWidth[-1] := se_Icon.Value;
  ImageEnVect1.objHeight[-1] := se_Icon.Value;
  ImageEnVect1.ObjBrushStyle[-1] := bsSolid;

end;

procedure TfmArmAreaMapAdmin.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := False;
end;

procedure TfmArmAreaMapAdmin.btn_CCTVClick(Sender: TObject);
begin
  inherited;
  if L_stSelectBuildingCode = '' then Exit;

  Pan_Workcode.Visible := True;
  lb_line.Visible := False;
  se_line.Visible := False;
  Load_CCTVCode(L_stSelectBuildingCode);
  L_nType := con_PutBitmap;

//  ImageEnVect1.MouseInteractVt := [miPutEllipse];
  ImageEnVect1.ObjStyle[-1]:=[ievsSelectable, ievsMoveable, ievsVisible];
  ImageEnVect1.ObjBoxHighlight[-1] := false;
  ImageEnVect1.ObjBrushColor[-1] := sh_DisArmColor.Brush.Color;
  ImageEnVect1.ObjWidth[-1] := se_Icon.Value;
  ImageEnVect1.objHeight[-1] := se_Icon.Value;
  ImageEnVect1.ObjBrushStyle[-1] := bsSolid;
  ImageEnVect1.SetObjBitmapFromFile(-1, G_stExeFolder + '\48CCTV.bmp');
  //ImageEnVect1.IEBitmap.Assign(ImageEnVect1.ObjBitmap[-1]);
  //ImageEnVect1.Update;
  //ImageEnVect1.Fit;

end;

procedure TfmArmAreaMapAdmin.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmArmAreaMapAdmin.btn_DeleteClick(Sender: TObject);
var
  i,hobj:integer;
  mydata:PMyData;
  stBuildingCode : string;
  nIndex : integer;
begin
  with ImageEnVect1 do
    for i:=0 to ObjectsCount-1 do
    begin
      hobj := GetObjFromIndex( i );
      if IsSelObject(hobj) then
      begin
        mydata:=ImageEnVect1.ObjUserData[hobj];
        if mydata <> nil then
        begin
          stBuildingCode := mydata.ArmAreaID;
          nIndex := ArmAreaCodeList.IndexOf(stBuildingCode);
          if nIndex > -1 then ArmAreaCodeList.Delete(nIndex);
        end;
        ImageEnVect1.RemoveObject(hobj);
      end;
    end;
end;

procedure TfmArmAreaMapAdmin.btn_EllipseClick(Sender: TObject);
begin
  inherited;
  if L_stSelectBuildingCode = '' then Exit;

  Pan_Workcode.Visible := True;
  lb_line.Visible := False;
  se_line.Visible := False;
  Load_ArmAreaCode(L_stSelectBuildingCode);
  L_nType := con_Ellipse;

//  ImageEnVect1.MouseInteractVt := [miPutEllipse];
//  ImageEnVect1.ObjStyle[-1]:=[ievsSelectable, ievsMoveable, ievsVisible];  //사이즈 고정 시킬때 이 부분 푼다.
  ImageEnVect1.ObjBoxHighlight[-1] := false;
  ImageEnVect1.ObjBrushColor[-1] := sh_DisArmColor.Brush.Color;
  ImageEnVect1.ObjWidth[-1] := se_Icon.Value;
  ImageEnVect1.objHeight[-1] := se_Icon.Value;
  ImageEnVect1.ObjBrushStyle[-1] := bsSolid;

end;

initialization
  RegisterClass(TfmArmAreaMapAdmin);
Finalization
  UnRegisterClass(TfmArmAreaMapAdmin);

end.
