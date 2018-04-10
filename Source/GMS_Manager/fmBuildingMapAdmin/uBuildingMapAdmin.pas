﻿unit uBuildingMapAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, ieview, imageenview, ievect,
  CurvyControls,Vcl.Imaging.jpeg,IniFiles, Vcl.ExtCtrls, Vcl.Buttons, AdvCombo,Data.DB,
  AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers, AdvGlowButton,
  AdvOfficePager, AdvAppStyler, AdvOfficePagerStylers, Vcl.Imaging.pngimage;

const
  con_LocalBuildingImageIndex = 1;
  con_LocalDoorImageIndex = 7;

  con_Box = 1;
  con_Ellipse = 2;


type
  TfmBuildingMapAdmin = class(TfmASubForm)
    BodyPanel: TW7Panel;
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
    btn_Box: TSpeedButton;
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
    sh_Color: TShape;
    Label1: TLabel;
    sh_AlarmColor: TShape;
    btn_Ellipse: TSpeedButton;
    Pan_Workcode: TAdvSmoothPanel;
    ed_BuildingCode: TAdvEdit;
    cmb_Building: TAdvComboBox;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_WorkType: TLabel;
    lb_Name: TAdvSmoothLabel;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    btn_Cancel: TAdvGlowButton;
    btn_Apply: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
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
    procedure sh_ColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sh_AlarmColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cmb_BuildingChange(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_ApplyClick(Sender: TObject);
    procedure ImageEnVect1NewObject(Sender: TObject; hobj: Integer);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
  private
    BuildingCodeList : TStringList;
    CmbBuildingCodeList : TStringList;
    L_nType : integer;
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    procedure FormNameSetting;
    procedure FontSetting;
  private
    { Private declarations }
    procedure GetBuildingImageMap;
    procedure Load_BuildingCode;
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmBuildingMapAdmin: TfmBuildingMapAdmin;

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
  uDBUpdate,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmBuildingMapAdmin.btn_ApplyClick(Sender: TObject);
begin
  inherited;
  if ed_BuildingCode.Text = '' then
  begin
    showmessage('빌딩코드를 선택해 주셔야 합니다.');
    Exit;
  end;

  case L_nType of
    con_Box : begin
      ImageEnVect1.MouseInteractVt := [miPutBox];
    end;
    con_Ellipse : begin
      ImageEnVect1.MouseInteractVt := [miPutEllipse];
    end;
  end;
  Pan_Workcode.Visible := False;
end;

procedure TfmBuildingMapAdmin.btn_BoxClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := True;
  Load_BuildingCode;
  L_nType := con_Box;
  //ImageEnVect1.MouseInteractVt := [miPutBox];
  ImageEnVect1.ObjBoxHighlight[-1] := False;
  ImageEnVect1.ObjBrushColor[-1] := sh_Color.Brush.Color;
  ImageEnVect1.ObjBrushStyle[-1] := bsSolid;
  ImageEnVect1.ObjTransparency[-1] := 150;

end;

procedure TfmBuildingMapAdmin.btn_FileOpenClick(Sender: TObject);
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

procedure TfmBuildingMapAdmin.btn_ImageFitClick(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Fit;

end;

procedure TfmBuildingMapAdmin.btn_ImageOrgClick(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Zoom := 100;

end;

procedure TfmBuildingMapAdmin.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmBuildingMapAdmin.btn_Rotate270Click(Sender: TObject);
begin
  inherited;
  ImageEnVect1.RotateAllObjects(270,ierImage);
  ImageEnVect1.Proc.Rotate(270);

end;

procedure TfmBuildingMapAdmin.btn_Rotate90Click(Sender: TObject);
begin
  inherited;
  ImageEnVect1.RotateAllObjects(90,ierImage);
  ImageEnVect1.Proc.Rotate(90);

end;

procedure TfmBuildingMapAdmin.btn_saveClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  inherited;
  if FileExists(G_stExeFolder + '\0_temp.jpg') then DeleteFile(G_stExeFolder + '\0_temp.jpg');
  if FileExists(G_stExeFolder + '\0_temp.iev') then DeleteFile(G_stExeFolder + '\0_temp.iev');

  // save the bitmap
  ImageEnVect1.IO.SaveToFile( G_stExeFolder + '\0_temp.jpg' );
  // save vectorial objects
  ImageEnVect1.SaveToFileIEV( G_stExeFolder + '\0_temp.iev' );

  if dmDBFunction.CheckTB_BUILDINGMAP_BuildingCode('0','1') <> 1 then
  begin
    dmDBInsert.InsertIntoTB_BUILDINGMAP_Code('0','1','0');
  end;

  if (G_nDBType = MSSQL) or (G_nDBType = MDB)  then
  begin
    stSql := 'Update TB_BUILDINGMAP Set ';
    stSql := stSql + 'BM_MAP = :BM_MAP, ';
    stSql := stSql + 'BM_MAPINFO = :BM_MAPINFO ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND BC_BUILDINGCODE = ''0''';
    stSql := stSql + ' AND BM_TYPE = 1 ';
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
        Parameters.ParamByName( 'BM_MAP' ).LoadFromFile( G_stExeFolder + '\0_temp.jpg', ftGraphic );
        Parameters.ParamByName( 'BM_MAPINFO' ).LoadFromFile( G_stExeFolder + '\0_temp.iev', ftBlob );
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
    stSql := stSql + 'BM_MAP = lo_import(''' + stringReplace(G_stExeFolder + '\0_temp.jpg','\','\\',[rfReplaceAll]) + '''), ' ;
    stSql := stSql + 'BM_MAPINFO = lo_import(''' + stringReplace(G_stExeFolder + '\0_temp.iev','\','\\',[rfReplaceAll]) + ''') ' ;
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND BC_BUILDINGCODE = ''0''';
    stSql := stSql + ' AND BM_TYPE = 1 ';
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

procedure TfmBuildingMapAdmin.btn_ZoomInClick(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Zoom := ImageEnVect1.Zoom / 2;
end;

procedure TfmBuildingMapAdmin.btn_ZoomOutClick(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Zoom := ImageEnVect1.Zoom * 2;
end;

procedure TfmBuildingMapAdmin.cmb_BuildingChange(Sender: TObject);
begin
  ed_BuildingCode.Text := '';
  if cmb_Building.ItemIndex < 0 then Exit;

  ed_BuildingCode.Text := cmbBuildingCodeList.Strings[cmb_Building.ItemIndex];
end;

procedure TfmBuildingMapAdmin.CurvyPanel1Resize(Sender: TObject);
begin
  inherited;
  ImageEnVect1.Left := 5;
  ImageEnVect1.Top := 5;
  ImageEnVect1.Width := CurvyPanel1.Width - (ImageEnVect1.Left * 2);
  ImageEnVect1.Height := CurvyPanel1.Height - Panel2.Height - (ImageEnVect1.Top * 2);

  Pan_Workcode.Left := (CurvyPanel1.Width div 2) - (Pan_Workcode.Width div 2);
  Pan_Workcode.Top := (CurvyPanel1.Height div 2) - (Pan_Workcode.Height div 2);
end;

procedure TfmBuildingMapAdmin.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmBuildingMapAdmin.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmBuildingMapAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  BuildingCodeList.Free;
  CmbBuildingCodeList.Free;

  fmMain.FORMENABLE(con_FormBMOSBUILDINGMAP,'FALSE');

  Action := caFree;
end;

procedure TfmBuildingMapAdmin.FormCreate(Sender: TObject);
begin
  inherited;
  BuildingCodeList := TStringList.Create;
  CmbBuildingCodeList := TStringList.Create;

  ImageEnVect1.MouseInteractVt:=[miObjectSelect];
  ImageEnVect1.CenterNewObjects:=true;
  ImageEnVect1.ObjGripPen.Style := psClear;
  ImageEnVect1.ObjGripBrush.Style := bsclear;
  FontSetting;
end;

procedure TfmBuildingMapAdmin.FormGradeRefresh;
begin
//  pm_DeleteCode.Enabled := IsDeleteGrade;
end;

procedure TfmBuildingMapAdmin.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmBuildingMapAdmin.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
//  btn_Delete.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
//  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_Name.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  lb_WorkType.Caption := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  btn_Apply.Caption := dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
end;

procedure TfmBuildingMapAdmin.FormResize(Sender: TObject);
begin
  inherited;

  Panel1.Left := (Panel2.Width - Panel1.Width) div 2;

  Pan_Workcode.Left := (Width div 2) - (Pan_Workcode.Width div 2);
  Pan_Workcode.top := (Height div 2) - (Pan_Workcode.Height div 2);


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

procedure TfmBuildingMapAdmin.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSBUILDINGMAP,'TRUE');


  GetBuildingImageMap;
end;

procedure TfmBuildingMapAdmin.Form_Close;
begin
  Close;
end;

procedure TfmBuildingMapAdmin.GetBuildingImageMap;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  ini_fun : TiniFile;
  nZoomSize : integer;
  i : integer;
  hobj : integer;
  mydata:PMyData;
  Stream: TStream;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\setting.INI');
    with ini_fun do
    begin
      nZoomSize := ReadInteger('Image','BuildingSettingZoom',100);
    end;
  Finally
    ini_fun.Free;
  End;

  if FileExists(G_stExeFolder + '\0.jpg') then DeleteFile(G_stExeFolder + '\0.jpg');     //파일 삭제
  if FileExists(G_stExeFolder + '\0.iev') then DeleteFile(G_stExeFolder + '\0.iev');
  //여기서 이미지 로딩 하자.
  Try
    if G_nDBType = POSTGRESQL then
    begin
      stSql := ' SELECT BM_MAP,lo_export(TB_BUILDINGMAP.BM_MAP, ' + G_stExeFolder + '\\0.jpg''),lo_export(TB_BUILDINGMAP.BM_MAPINFO, ' + G_stExeFolder + '\\0.iev'') From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''0'' ';
      stSql := stSql + ' AND BM_TYPE = 1 ';
    end else
    begin
      stSql := ' SELECT * From TB_BUILDINGMAP ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND BC_BUILDINGCODE = ''0'' ';
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
        if Not FindField('BM_MAP').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_MAP'), G_stExeFolder + '\0.jpg');
          end;
        end;
        if Not FindField('BM_MAPINFO').IsNull then
        begin
          if G_nDBType <> POSTGRESQL then
          begin
            SaveToImageFileFromDB(FieldByName('BM_MAPINFO'), G_stExeFolder + '\0.iev');
          end;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  if FileExists(G_stExeFolder + '\0.jpg') then
  begin
    // load the bitmap
    ImageEnVect1.IO.LoadFromFile( G_stExeFolder + '\0.jpg' );
    // look for vectorial objects
    if FileExists(G_stExeFolder + '\0.iev' ) then
      ImageEnVect1.LoadFromFileIEV( G_stExeFolder + '\0.iev' );
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
        if BuildingCodeList.IndexOf(mydata.BuildingID) < 0 then
           BuildingCodeList.Add(mydata.BuildingID);
      end;
    end;
  end;

end;

procedure TfmBuildingMapAdmin.ImageEnVect1NewObject(Sender: TObject;
  hobj: Integer);
var
  mydata:PMyData;
begin
  getmem(mydata, sizeof(TMyData));

  mydata^.BuildingID:=ed_BuildingCode.text;
  mydata^.NormalColor:=sh_Color.Brush.color;
  mydata^.AlarmColor:=sh_AlarmColor.Brush.color;

  ImageEnVect1.ObjUserData[hobj]:=mydata;
  ImageEnVect1.ObjUserDataLength[hobj]:=sizeof(TMyData);
  ImageEnVect1.MouseInteractVt:=[miObjectSelect];
  if BuildingCodeList.IndexOf(ed_BuildingCode.text) < 0 then BuildingCodeList.Add(ed_BuildingCode.text);

end;

procedure TfmBuildingMapAdmin.ImageEnVect1ObjectOver(Sender: TObject;
  hobj: Integer);
begin
  inherited;
  ImageEnVect1.UnSelAllObjects;
  ImageEnVect1.AddSelObject(hobj);
  ImageEnVect1.ObjTransparency[hobj] := 150;
end;

procedure TfmBuildingMapAdmin.ImageEnVect1ZoomIn(Sender: TObject;
  var NewZoom: Double);
var
  ini_fun : TiniFile;
begin
  inherited;
  Try
    ini_fun := TiniFile.Create('setting.INI');
    with ini_fun do
    begin
      WriteInteger('Image','BuildingSettingZoom',Round(ImageEnVect1.Zoom));
    end;
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmBuildingMapAdmin.Load_BuildingCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Building.Text := '';
  ed_BuildingCode.Text := '';

  cmb_Building.Items.Clear;
  cmb_Building.ItemIndex := -1;
  CmbBuildingCodeList.Clear;

  stSql := ' select * from TB_BUILDINGCODE ';
  stSql := stSql + ' Where Group_Code = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_DEEPSEQ = 1 ';

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
        if BuildingCodeList.IndexOf(FindField('BC_BUILDINGCODE').AsString) < 0 then
        begin
          CmbBuildingCodeList.Add(FindField('BC_BUILDINGCODE').AsString);
          cmb_Building.Items.Add(FindField('BC_BUILDINGNAME').AsString);
        end;
        Next;
      end;
      if cmb_Building.Items.Count > 0 then
      begin
        cmb_Building.ItemIndex := 0;
        cmb_BuildingChange(self);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmBuildingMapAdmin.sh_AlarmColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ColorDialog1.execute then
  begin
    sh_AlarmColor.Brush.color := colorDialog1.Color;
  end;

end;

procedure TfmBuildingMapAdmin.sh_ColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ColorDialog1.execute then
  begin
    sh_Color.Brush.color := colorDialog1.Color;
  end;

end;

procedure TfmBuildingMapAdmin.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  ImageEnVect1.MouseInteractVt := [miObjectSelect];
end;

procedure TfmBuildingMapAdmin.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := False;
end;

procedure TfmBuildingMapAdmin.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmBuildingMapAdmin.btn_DeleteClick(Sender: TObject);
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
          stBuildingCode := mydata.BuildingID;
          nIndex := BuildingCodeList.IndexOf(stBuildingCode);
          if nIndex > -1 then BuildingCodeList.Delete(nIndex);
        end;
        ImageEnVect1.RemoveObject(hobj);
      end;
    end;
end;

procedure TfmBuildingMapAdmin.btn_EllipseClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := True;
  Load_BuildingCode;
  L_nType := con_Ellipse;

//  ImageEnVect1.MouseInteractVt := [miPutEllipse];
  ImageEnVect1.ObjBoxHighlight[-1] := false;
  ImageEnVect1.ObjBrushColor[-1] := sh_Color.Brush.Color;
  ImageEnVect1.ObjBrushStyle[-1] := bsSolid;

end;

initialization
  RegisterClass(TfmBuildingMapAdmin);
Finalization
  UnRegisterClass(TfmBuildingMapAdmin);

end.