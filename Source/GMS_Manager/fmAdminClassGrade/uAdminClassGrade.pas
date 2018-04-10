﻿unit uAdminClassGrade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, W7Classes, W7Panels, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvSmoothPanel, Vcl.ExtCtrls, AdvSmoothLabel,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvToolBtn,ADODB,ActiveX, uSubForm, CommandArray, AdvCombo, AdvGroupBox,
  Vcl.Mask, AdvSpin, AdvOfficeButtons, AdvPanel, Vcl.ComCtrls, AdvListV,
  Vcl.ImgList, Vcl.Menus, AdvMenus, AdvGlassButton, Jpeg,
  DB, Vcl.Samples.Gauges, AdvSplitter, AdvToolBar, AdvToolBarStylers,
  AdvGlowButton, AdvOfficePager, Vcl.Imaging.pngimage, AdvAppStyler,
  AdvOfficePagerStylers;

type
  TfmAdminClassGrade = class(TfmASubForm)
    Image1: TImage;
    BodyPanel: TAdvSmoothPanel;
    ImageList1: TImageList;
    pop_PermitAdd: TAdvPopupMenu;
    mn_addpermitListDelete: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    pan_CardList: TAdvSmoothPanel;
    AdvSplitter1: TAdvSplitter;
    pan_CardCount: TAdvSmoothPanel;
    sg_AdminClassCode: TAdvStringGrid;
    lb_ProgrmGroup: TAdvSmoothLabel;
    cmb_ProgrmGroup: TAdvComboBox;
    cmb_MenuGroup: TAdvComboBox;
    lb_MenuGroup: TAdvSmoothLabel;
    lb_SearchName: TAdvSmoothLabel;
    ed_SearchName: TAdvEdit;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    pan_ProgramGrade: TAdvSmoothPanel;
    pan_NotPermitDoor: TAdvSmoothPanel;
    pan_NotPermitDoorCount: TAdvSmoothPanel;
    sg_NotPermitProgram: TAdvStringGrid;
    pan_PermitAction: TAdvSmoothPanel;
    pan_PermitDoor: TAdvSmoothPanel;
    pan_DoorPermitCount: TAdvSmoothPanel;
    sg_PermitProgram: TAdvStringGrid;
    lb_AdminGradeList: TLabel;
    btn_Search: TAdvGlowButton;
    btn_PermitAdd: TAdvGlowButton;
    btn_PermitDelete: TAdvGlowButton;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_DoorNotPermitCountName: TAdvSmoothLabel;
    lb_SearchCount: TAdvSmoothLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    lb_CardNotPermitCount: TAdvSmoothLabel;
    AdvSmoothLabel5: TAdvSmoothLabel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    lb_CardPermitCount: TAdvSmoothLabel;
    AdvSmoothLabel6: TAdvSmoothLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_AddNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure sg_addPermitDoorListCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_NotPermitDoorListResize(Sender: TObject);
    procedure sg_PermitDoorListResize(Sender: TObject);
    procedure pan_CardListResize(Sender: TObject);
    procedure cmb_ProgrmGroupChange(Sender: TObject);
    procedure cmb_SearchAreaChange(Sender: TObject);
    procedure pan_PermitActionResize(Sender: TObject);
    procedure pan_NotPermitDoorResize(Sender: TObject);
    procedure pan_PermitDoorResize(Sender: TObject);
    procedure sg_AdminClassCodeClick(Sender: TObject);
    procedure sg_NotPermitProgramCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitProgramCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_PermitAddClick(Sender: TObject);
    procedure btn_PermitDeleteClick(Sender: TObject);
    procedure ed_SearchNameChange(Sender: TObject);
    procedure cmb_MenuGroupChange(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure BodyPanelResize(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pan_ProgramGradeResize(Sender: TObject);
  private
    SearchCompanyCodeList : TStringList;
    SearchJijumCodeList : TStringList;
    SearchDepartCodeList : TStringList;
    SearchPosiCodeList : TStringList;
    SearchEmpTypeCodeList : TStringList;
    SearchCardGubunCodeList : TStringList;
    AddCompanyCodeList : TStringList;
    AddJijumCodeList : TStringList;
    AddDepartCodeList : TStringList;
    AddPosiCodeList : TStringList;
    AddEmpTypeCodeList : TStringList;
    AddGroupGradeCodeList : TStringList;
    AddCardGubunCodeList : TStringList;
    GubunCompanyCodeList : TStringList;
    GubunJijumCodeList : TStringList;
    GubunDepartCodeList : TStringList;
    GubunPosiCodeList : TStringList;
    GubunEmTypeCodeList : TStringList;
    DeletePermitDongCodeList : TStringList;
    DeletePermitAreaCodeList : TStringList;
    PermitAddBuildingCodeList : TStringList;
    PermitAddFloorCodeList : TStringList;
    PermitAddAreaCodeList : TStringList;
    CardPerimtGroupGradeCodeList : TStringList;

    ProgramGroupCodeList : TStringList;
    MenuGroupCodeList : TStringList;

    L_nPageListMaxCount : integer;
    L_nNotPermitCheckCount : integer;
    L_nPermitCheckCount : integer;

    L_stSaveMode : string;
    L_stPermitMode : string;
    L_stButtonCloseCaption : string;
    L_stMenuID : string;
    L_stAllName : string;
    { Private declarations }
  private
    Function FormNameSetting:Boolean;
    procedure FontSetting;
    Function FormComboBoxInitilize:Boolean;
  private
    procedure SearchAdminClassCodeList(aCurrentCode:string;aTopRow:integer = 0);
    procedure SearchNotPermitProgramList(aCurrentCode:string;aTopRow:integer = 0);
    procedure SearchPermitProgramList(aCurrentCode:string;aTopRow:integer = 0);

    procedure AdvStrinGridSetAllCheck(Sender: TObject;aCol:integer;bchkState:Boolean);
    function UpdateAdminClassGrade_All(aCol:integer;aValue:Boolean):Boolean;
  public
    { Public declarations }
    procedure EventCardReader(aCardNo:string); //카드등록기에서 올라온 카드 데이터 /가공 된 데이터임
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmAdminClassGrade: TfmAdminClassGrade;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBSelect,
  uDBDelete,
  uDBInsert,
  uDBUpdate,
  uDeviceVariable,
  uFormFunction,
  uFormVariable,
  uFormUtil,
  uMain;

{$R *.dfm}


procedure TfmAdminClassGrade.AdvStrinGridSetAllCheck(Sender: TObject;aCol:integer;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(aCol,i,bchkState);
    end;
    if aCol > 0 then UpdateAdminClassGrade_All(aCol,bchkState);
end;

procedure TfmAdminClassGrade.cmb_SearchAreaChange(Sender: TObject);
begin
  inherited;
  btn_SearchClick(self);
end;

procedure TfmAdminClassGrade.cmb_MenuGroupChange(Sender: TObject);
begin
  inherited;
  SearchNotPermitProgramList('');
  SearchPermitProgramList('');
end;

procedure TfmAdminClassGrade.cmb_ProgrmGroupChange(Sender: TObject);
var
  stProgramGroupCode : string;
begin
  inherited;
  if cmb_ProgrmGroup.ItemIndex < 0 then Exit;

  stProgramGroupCode := '';
  if cmb_ProgrmGroup.ItemIndex > -1 then
  begin
    stProgramGroupCode := ProgramGroupCodeList.Strings[cmb_ProgrmGroup.ItemIndex];
  end;
  LoadMenuGroupCode(stProgramGroupCode,MenuGroupCodeList,TComboBox(cmb_MenuGroup),True,L_stAllName);

  SearchNotPermitProgramList('');
  SearchPermitProgramList('');

end;

procedure TfmAdminClassGrade.ed_AddNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfmAdminClassGrade.ed_SearchNameChange(Sender: TObject);
begin
  inherited;
  SearchAdminClassCodeList('');
end;

procedure TfmAdminClassGrade.EventCardReader(aCardNo: string);
var
  stMessage : string;
begin
//여기서 카드 등록기 처리 하자.
end;

procedure TfmAdminClassGrade.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
  *)
end;

procedure TfmAdminClassGrade.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  SearchAdminClassCodeList('');
  btn_SearchClick(self);
end;

procedure TfmAdminClassGrade.FormChangeEvent(aFormName: integer);
begin

end;

procedure TfmAdminClassGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmMain.FORMENABLE(con_FormBMOSADMINCLASSGRADE,'FALSE');

  SearchCompanyCodeList.Free;
  SearchJijumCodeList.Free;
  SearchDepartCodeList.Free;
  SearchPosiCodeList.Free;
  SearchEmpTypeCodeList.Free;
  SearchCardGubunCodeList.Free;
  AddCompanyCodeList.Free;
  AddJijumCodeList.Free;
  AddDepartCodeList.Free;
  AddPosiCodeList.Free;
  AddEmpTypeCodeList.Free;
  AddGroupGradeCodeList.Free;
  AddCardGubunCodeList.Free;
  DeletePermitDongCodeList.Free;
  DeletePermitAreaCodeList.Free;
  PermitAddBuildingCodeList.Free;
  PermitAddFloorCodeList.Free;
  PermitAddAreaCodeList.Free;
  GubunCompanyCodeList.Free;
  GubunEmTypeCodeList.Free;
  GubunJijumCodeList.Free;
  GubunDepartCodeList.Free;
  GubunPosiCodeList.Free;
  CardPerimtGroupGradeCodeList.Free;
  ProgramGroupCodeList.Free;
  MenuGroupCodeList.Free;

  Action := caFree;
end;

function TfmAdminClassGrade.FormComboBoxInitilize: Boolean;
var
  stProgramGroupCode : string;
begin

  LoadProgramGroupCode(ProgramGroupCodeList,TComboBox(cmb_ProgrmGroup),True,L_stAllName);
  stProgramGroupCode := '';
  if cmb_ProgrmGroup.ItemIndex > -1 then
  begin
    stProgramGroupCode := ProgramGroupCodeList.Strings[cmb_ProgrmGroup.ItemIndex];
  end;
  LoadMenuGroupCode(stProgramGroupCode,MenuGroupCodeList,TComboBox(cmb_MenuGroup),True,L_stAllName);

end;

procedure TfmAdminClassGrade.FormCreate(Sender: TObject);
begin

  SearchCompanyCodeList := TStringList.Create;
  SearchJijumCodeList := TStringList.Create;
  SearchDepartCodeList := TStringList.Create;
  SearchPosiCodeList := TStringList.Create;
  SearchEmpTypeCodeList := TStringList.Create;
  SearchCardGubunCodeList := TStringList.Create;
  AddCompanyCodeList := TStringList.Create;
  AddJijumCodeList := TStringList.Create;
  AddDepartCodeList := TStringList.Create;
  AddPosiCodeList := TStringList.Create;
  AddEmpTypeCodeList := TStringList.Create;
  AddGroupGradeCodeList := TStringList.Create;
  AddCardGubunCodeList := TStringList.Create;
  DeletePermitDongCodeList := TStringList.Create;
  DeletePermitAreaCodeList := TStringList.Create;
  PermitAddBuildingCodeList := TStringList.Create;
  PermitAddFloorCodeList := TStringList.Create;
  PermitAddAreaCodeList := TStringList.Create;
  GubunCompanyCodeList := TStringList.Create;
  GubunJijumCodeList := TStringList.Create;
  GubunDepartCodeList := TStringList.Create;
  GubunPosiCodeList := TStringList.Create;
  GubunEmTypeCodeList := TStringList.Create;
  CardPerimtGroupGradeCodeList := TStringList.Create;
  ProgramGroupCodeList := TStringList.Create;
  MenuGroupCodeList := TStringList.Create;


  FormNameSetting;
  FormComboBoxInitilize;
  FontSetting;
end;


procedure TfmAdminClassGrade.FormGradeRefresh;
begin
  btn_PermitAdd.Enabled := IsInsertGrade;
  btn_PermitDelete.Enabled := IsDeleteGrade;
end;

procedure TfmAdminClassGrade.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmAdminClassGrade.FormNameSetting: Boolean;
var
  stSql : string;
  nCommonLength : integer;
  nButtonLength : integer;
  nMenuLength : integer;
  TempAdoQuery : TADOQuery;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('0','2','COMMONLIST01');//dmFormFunction.GetFormName('0','2','COMMONLIST01');
  sg_PermitProgram.cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONADD');
  sg_PermitProgram.cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONUPDATE');
  sg_PermitProgram.cells[4,0] := dmFormFunction.GetFormName('0','2','COMMONDELETE');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  lb_SearchName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONADMINGRADENAME');
  sg_AdminClassCode.cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONADMINGRADENAME');
//  pan_CardList.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONADMINGRADENAME');
  lb_MenuGroup.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONMENUGROUP');
  sg_NotPermitProgram.cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONPROGRAMNAME');
  sg_PermitProgram.cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONPROGRAMNAME');

  lb_ProgrmGroup.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONPROGRAMGROUP');
  pan_NotPermitDoor.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONREGNOTPROGRAM');
  pan_PermitDoor.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONREGPROGRAM');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  btn_PermitAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITADD001');
  btn_PermitDelete.Caption := dmFormFunction.GetFormName('0','2','BUTTONPERMITDELETE001');
  lb_AdminGradeList.Caption := dmFormFunction.GetFormName('0','2','COMMONADMINGRADENAME');

  lb_DoorNotPermitCountName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  AdvSmoothLabel1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  AdvSmoothLabel2.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  AdvSmoothLabel3.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  AdvSmoothLabel5.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  AdvSmoothLabel6.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');

  with sg_PermitProgram do
  begin
    AddCheckBox(2,0,False,False);
    AddCheckBox(3,0,False,False);
    AddCheckBox(4,0,False,False);
  end;

end;

procedure TfmAdminClassGrade.FormResize(Sender: TObject);
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

procedure TfmAdminClassGrade.FormShow(Sender: TObject);
begin
  fmMain.FORMENABLE(con_FormBMOSADMINCLASSGRADE,'TRUE');
  pan_PermitDoor.Align := alClient;
end;

procedure TfmAdminClassGrade.pan_CardListResize(Sender: TObject);
begin
  inherited;
  sg_AdminClassCode.Left := 10;
  sg_AdminClassCode.Width := pan_CardList.Width - (sg_AdminClassCode.Left * 2);
  sg_AdminClassCode.Height := pan_CardList.Height - sg_AdminClassCode.Top - pan_CardCount.Height - 10;
  sg_AdminClassCode.ColWidths[0] := sg_AdminClassCode.Width;
end;

procedure TfmAdminClassGrade.pan_NotPermitDoorResize(Sender: TObject);
begin
  inherited;
  sg_NotPermitProgram.Left := 10;
  sg_NotPermitProgram.Width := pan_NotPermitDoor.Width - (sg_NotPermitProgram.Left * 2);
  sg_NotPermitProgram.Height := pan_NotPermitDoor.Height - sg_NotPermitProgram.Top - pan_NotPermitDoorCount.Height - 10;
  sg_NotPermitProgram.ColWidths[1] := sg_NotPermitProgram.Width - sg_NotPermitProgram.ColWidths[0];
end;

procedure TfmAdminClassGrade.pan_PermitActionResize(Sender: TObject);
begin
  inherited;
  btn_PermitAdd.Top := (pan_PermitAction.Height div 2) - btn_PermitAdd.Height - 5;
  btn_PermitDelete.Top := (pan_PermitAction.Height div 2) + 5;
end;

procedure TfmAdminClassGrade.pan_PermitDoorResize(Sender: TObject);
begin
  inherited;
  sg_PermitProgram.Left := 10;
  sg_PermitProgram.Width := pan_PermitDoor.Width - (sg_PermitProgram.Left * 2);
  sg_PermitProgram.Height := pan_PermitDoor.Height - sg_PermitProgram.Top - pan_DoorPermitCount.Height - 10;
  sg_PermitProgram.ColWidths[1] := sg_PermitProgram.Width - sg_PermitProgram.ColWidths[0] - sg_PermitProgram.ColWidths[2] - sg_PermitProgram.ColWidths[3] - sg_PermitProgram.ColWidths[4] - 30;

end;

procedure TfmAdminClassGrade.pan_ProgramGradeResize(Sender: TObject);
begin
  inherited;
  pan_NotPermitDoor.Width := (pan_ProgramGrade.Width - pan_PermitAction.Width) div 2;
//  pan_PermitDoor.Width := (pan_ProgramGrade.Width - pan_PermitAction.Width) div 2;

end;

procedure TfmAdminClassGrade.SearchAdminClassCodeList(aCurrentCode: string; aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardRegType : string;
  stEmployeeType : string;
  stCardGubun : string;
begin
  GridInit(sg_AdminClassCode,1,2,False);

  stCompanyCode := '';
  stJijumCode := '';
  stDepartCode := '';
  stPosiCode := '';
  stCardRegType := '0';
  stEmployeeType := '';
  stCardGubun := '';

  stSql := dmDBSelect.SelectTB_ADMINGRADECODE_Name(ed_SearchName.Text);


  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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
      lb_SearchCount.Caption.Text := FormatFloat('#,##0',recordCount);
      if recordcount < 1 then Exit;

      with sg_AdminClassCode do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('AG_GRADECODENAME').AsString;
          cells[1,nRow] := FindField('AG_GRADECODE').AsString;
          if FindField('AG_GRADECODE').AsString  = aCurrentCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow = 0 then
        begin
          if Row > (L_nPageListMaxCount - 1) then TopRow := Row - L_nPageListMaxCount;
        end else
        begin
          TopRow := aTopRow;
        end;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;


procedure TfmAdminClassGrade.SearchNotPermitProgramList(aCurrentCode: string;
  aTopRow: integer);
var
  stAdminClassCode : string;
  stProgramGroupCode : string;
  stMenuGroupCode : string;
  stSql : string;

  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_NotPermitProgram,2,2,true);
  L_nNotPermitCheckCount := 0;

  stAdminClassCode := sg_AdminClassCode.Cells[1,sg_AdminClassCode.Row];

  if stAdminClassCode = '' then Exit;

  stProgramGroupCode := '';
  stMenuGroupCode := '';

  if cmb_ProgrmGroup.ItemIndex > 0 then stProgramGroupCode := ProgramGroupCodeList.Strings[cmb_ProgrmGroup.ItemIndex];
  if cmb_MenuGroup.ItemIndex > 0 then stMenuGroupCode := MenuGroupCodeList.Strings[cmb_MenuGroup.ItemIndex];

  if stMenuGroupCode <> '' then stMenuGroupCode := copy(stMenuGroupCode,1,3);

  stSql := dmDBSelect.SelectTB_ADMINGRADEPROGRAM_NotGradeProgram(stAdminClassCode,stProgramGroupCode,stMenuGroupCode);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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
      lb_CardNotPermitCount.Caption.Text := FormatFloat('#,##0',recordCount);
      if recordcount < 1 then Exit;
      with sg_NotPermitProgram do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('NAME').AsString;
          cells[2,nRow] := FindField('FN_NAMECODE').AsString;
          cells[3,nRow] := FindField('FN_PROGRAMGUBUN').AsString;
          cells[4,nRow] := FindField('FN_MENUGUBUN').AsString;
          cells[5,nRow] := FindField('FN_MENUGROUP').AsString;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow <> 0 then
        begin
          TopRow := aTopRow;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAdminClassGrade.SearchPermitProgramList(aCurrentCode: string;
  aTopRow: integer);
var
  stAdminClassCode : string;
  stProgramGroupCode : string;
  stMenuGroupCode : string;
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_PermitProgram,5,2,true);
  with sg_PermitProgram do   //스트링그리드 초기화
  begin
    SetCheckBoxState(2,0,False);  //입력
    SetCheckBoxState(3,0,False);  //수정
    SetCheckBoxState(4,0,False);  //삭제
    RemoveCheckBox(2,1);
    RemoveCheckBox(3,1);
    RemoveCheckBox(4,1);
  end;
  L_nPermitCheckCount := 0;

  stAdminClassCode := sg_AdminClassCode.Cells[1,sg_AdminClassCode.Row];

  if stAdminClassCode = '' then Exit;
  stProgramGroupCode := '';
  stMenuGroupCode := '';

  if cmb_ProgrmGroup.ItemIndex > 0 then stProgramGroupCode := ProgramGroupCodeList.Strings[cmb_ProgrmGroup.ItemIndex];
  if cmb_MenuGroup.ItemIndex > 0 then stMenuGroupCode := MenuGroupCodeList.Strings[cmb_MenuGroup.ItemIndex];

  stSql := dmDBSelect.SelectTB_ADMINGRADEPROGRAM_GradeProgram(stAdminClassCode,stProgramGroupCode,stMenuGroupCode);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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
      lb_CardPermitCount.Caption.Text := FormatFloat('#,##0',recordCount);
      if recordcount < 1 then Exit;
      with sg_PermitProgram do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          AddCheckBox(2,nRow,False,False);
          AddCheckBox(3,nRow,False,False);
          AddCheckBox(4,nRow,False,False);
          cells[1,nRow] := FindField('NAME').AsString;
          if FindField('AG_INSERT').AsString = '0' then  SetCheckBoxState(2,nRow,False)
          else SetCheckBoxState(2,nRow,True);
          if FindField('AG_UPDATE').AsString = '0' then  SetCheckBoxState(3,nRow,False)
          else SetCheckBoxState(3,nRow,True);
          if FindField('AG_DELETE').AsString = '0' then  SetCheckBoxState(4,nRow,False)
          else SetCheckBoxState(4,nRow,True);
          cells[5,nRow] := FindField('FN_PROGRAMGUBUN').AsString;
          cells[6,nRow] := FindField('FN_NAMECODE').AsString;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow <> 0 then
        begin
          TopRow := aTopRow;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAdminClassGrade.sg_addPermitDoorListCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,ACol,State);
  end;

end;

procedure TfmAdminClassGrade.sg_AdminClassCodeClick(Sender: TObject);
begin
  inherited;
  btn_SearchClick(self);
end;

procedure TfmAdminClassGrade.sg_NotPermitProgramCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nNotPermitCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nNotPermitCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,ACol,State);
  end else
  begin
    if State then L_nNotPermitCheckCount := L_nNotPermitCheckCount + 1
    else L_nNotPermitCheckCount := L_nNotPermitCheckCount - 1 ;
  end;

end;

procedure TfmAdminClassGrade.sg_NotPermitDoorListResize(Sender: TObject);
begin
  inherited;
  TAdvStringGrid(Sender).ColWidths[1] := TAdvStringGrid(Sender).Width - 55;
end;

procedure TfmAdminClassGrade.sg_PermitProgramCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
var
  stAdminClassCode : string;
  stGrade : string;
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if ACol = 0 then
    begin
      if State then L_nPermitCheckCount := (Sender as TAdvStringGrid).RowCount - 1
      else L_nPermitCheckCount := 0;
    end;
    AdvStrinGridSetAllCheck(Sender,ACol,State);
  end else
  begin
    if State then stGrade := '1'
    else stGrade := '0';
    stAdminClassCode := sg_AdminClassCode.Cells[1,sg_AdminClassCode.Row];
    with sg_PermitProgram do
    begin
      if aCol = 2 then dmDBUpdate.UpdateTB_ADMINGRADEPROGRAM_Field_StringValue(stAdminClassCode,Cells[5,Row],Cells[6,Row],'AG_INSERT',stGrade)
      else if aCol = 3 then dmDBUpdate.UpdateTB_ADMINGRADEPROGRAM_Field_StringValue(stAdminClassCode,Cells[5,Row],Cells[6,Row],'AG_UPDATE',stGrade)
      else if aCol = 4 then dmDBUpdate.UpdateTB_ADMINGRADEPROGRAM_Field_StringValue(stAdminClassCode,Cells[5,Row],Cells[6,Row],'AG_DELETE',stGrade);
    end;
    if ACol = 0 then
    begin
      if State then L_nPermitCheckCount := L_nPermitCheckCount + 1
      else L_nPermitCheckCount := L_nPermitCheckCount - 1 ;
    end;
  end;

end;

function TfmAdminClassGrade.UpdateAdminClassGrade_All(aCol: integer;
  aValue: Boolean): Boolean;
var
  i : integer;
  stGrade : string;
  stAdminClassCode : string;
begin
  if aValue then stGrade := '1'
  else stGrade := '0';
  stAdminClassCode := sg_AdminClassCode.Cells[1,sg_AdminClassCode.Row];
  with sg_PermitProgram do
  begin
    for i:= 1 to rowCount - 1 do
    begin
      if aCol = 2 then dmDBUpdate.UpdateTB_ADMINGRADEPROGRAM_Field_StringValue(stAdminClassCode,Cells[5,Row],Cells[6,Row],'AG_INSERT',stGrade)
      else if aCol = 3 then dmDBUpdate.UpdateTB_ADMINGRADEPROGRAM_Field_StringValue(stAdminClassCode,Cells[5,Row],Cells[6,Row],'AG_UPDATE',stGrade)
      else if aCol = 4 then dmDBUpdate.UpdateTB_ADMINGRADEPROGRAM_Field_StringValue(stAdminClassCode,Cells[5,Row],Cells[6,Row],'AG_DELETE',stGrade);
    end;
  end;

end;

procedure TfmAdminClassGrade.sg_PermitDoorListResize(Sender: TObject);
begin
  inherited;
  TAdvStringGrid(Sender).ColWidths[2] := 35;
  TAdvStringGrid(Sender).ColWidths[1] := TAdvStringGrid(Sender).Width - 55 - TAdvStringGrid(Sender).ColWidths[2];

end;

procedure TfmAdminClassGrade.BodyPanelResize(Sender: TObject);
begin
  inherited;
  pan_ProgramGrade.Height := BodyPanel.Height - (cmb_MenuGroup.Top + cmb_MenuGroup.Height + 10);
end;

procedure TfmAdminClassGrade.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmAdminClassGrade.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmAdminClassGrade.btn_PermitAddClick(Sender: TObject);
var
  stMessage : string;
  i :integer;
  bCheckState : Boolean;
  stAdminClassCode : string;
  stProgramID : string;
  stProgramGubun : string;
  stMenuGubun : string;
begin
  inherited;
  stMessage := dmFormMessage.GetMessage('SELECTERROR');
  stMessage := stringReplace(stMessage,'$WORK',btn_PermitAdd.Caption,[rfReplaceAll]);
  if L_nNotPermitCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stAdminClassCode := sg_AdminClassCode.Cells[1,sg_AdminClassCode.Row];

  if stAdminClassCode = '' then Exit;

  With sg_NotPermitProgram do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        stProgramID := cells[2,i];
        stProgramGubun := cells[3,i];
        stMenuGubun := cells[4,i];
        if stProgramID = '' then continue;

        dmDBInsert.InsertIntoTB_ADMINGRADEPROGRAM_Value(stAdminClassCode,stProgramGubun,stProgramID,stMenuGubun,'1','1','1',G_stAdminUserID,FormatDateTime('yyyymmddhhnnss',now));
      end;
    end;
  end;

  SearchNotPermitProgramList('',sg_NotPermitProgram.TopRow);
  SearchPermitProgramList('',sg_PermitProgram.TopRow);
end;

procedure TfmAdminClassGrade.btn_PermitDeleteClick(Sender: TObject);
var
  stMessage : string;
  i :integer;
  bCheckState : Boolean;
  stAdminClassCode : string;
  stProgramID : string;
  stProgramGubun : string;
begin
  inherited;
  stMessage := dmFormMessage.GetMessage('SELECTERROR');
  stMessage := stringReplace(stMessage,'$WORK',btn_PermitDelete.Caption,[rfReplaceAll]);
  if L_nPermitCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
//  stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',btn_PermitDelete.Caption,[rfReplaceAll]);
//  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;

  stAdminClassCode := sg_AdminClassCode.Cells[1,sg_AdminClassCode.Row];

  if stAdminClassCode = '' then Exit;

  With sg_PermitProgram do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        stProgramGubun := cells[5,i];
        stProgramID := cells[6,i];
        if stProgramID = '' then continue;
        dmDBDelete.DeleteTB_ADMINGRADEPROGRAM(stAdminClassCode,stProgramGubun,stProgramid);
      end;
    end;
  end;

  SearchNotPermitProgramList('',sg_NotPermitProgram.TopRow);
  SearchPermitProgramList('',sg_PermitProgram.TopRow);

end;

procedure TfmAdminClassGrade.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchNotPermitProgramList('');
  SearchPermitProgramList('');

end;

initialization
  RegisterClass(TfmAdminClassGrade);
Finalization
  UnRegisterClass(TfmAdminClassGrade);

end.