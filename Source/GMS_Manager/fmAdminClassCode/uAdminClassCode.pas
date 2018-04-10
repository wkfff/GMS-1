﻿unit uAdminClassCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSubForm, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, CommandArray, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, AdvSmoothLabel, AdvSmoothPanel, W7Classes,
  W7Panels, AdvGlassButton,ADODB,ActiveX, AdvToolBar, AdvToolBarStylers,
  AdvGlowButton, AdvOfficePager, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Menus,
  AdvOfficePagerStylers, AdvAppStyler;

type
  TfmAdminClassCode = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    lb_SearchName: TAdvSmoothLabel;
    ed_SearchName: TAdvEdit;
    sg_List: TAdvStringGrid;
    btn_Search: TAdvGlassButton;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    btn_Add: TAdvGlowButton;
    btn_Update: TAdvGlowButton;
    btn_Delete: TAdvGlowButton;
    Pan_code: TAdvSmoothPanel;
    lb_WorkType: TLabel;
    lb_Name: TAdvSmoothLabel;
    ed_Name: TAdvEdit;
    ed_SelectCode: TAdvEdit;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    pm_Work: TPopupMenu;
    pm_AddCode: TMenuItem;
    pm_UpdateCode: TMenuItem;
    pm_DeleteCode: TMenuItem;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_ListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_ListDblClick(Sender: TObject);
    procedure ed_SearchNameChange(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure pm_AddCodeClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure pm_DeleteCodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    L_nPageListMaxCount : integer;
    L_nCheckCount : integer;
    L_stButtonCloseCaption : string;
    L_stButtonPrevCaption : string;
    L_stMenuID : string;
    L_stWork : string;
    { Private declarations }
    Function FormNameSetting:Boolean;
    procedure FontSetting;
    Function SearchList(aCurrentCode:string;aTopRow:integer = 0):Boolean;
  private
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);

  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmAdminClassCode: TfmAdminClassCode;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBDelete,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBSelect,
  uDBUpdate,
  uFormFunction,
  uFormVariable,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmAdminClassCode.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmAdminClassCode.btn_AddClick(Sender: TObject);
begin
  inherited;
  pm_AddCodeClick(pm_AddCode);
end;

procedure TfmAdminClassCode.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_code.Visible := False;
end;

procedure TfmAdminClassCode.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmAdminClassCode.btn_DeleteClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
  stMessage : string;
begin
  inherited;
  stMessage := dmFormMessage.GetMessage('NOTSELECTDATA');
  stMessage := stringReplace(stMessage,'$WORK',btn_Delete.Caption,[rfReplaceAll]);
  if L_nCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stMessage := dmFormMessage.GetMessage('WORKCOUNTINFO');
  stMessage := stringReplace(stMessage,'$WORK',btn_Delete.Caption,[rfReplaceAll]);
  stMessage := stringReplace(stMessage,'$COUNT',inttostr(L_nCheckCount),[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  With sg_List do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bChkState);
      if bChkState then
      begin
        dmDBDelete.DeleteTB_ADMINGRADECODE(cells[2,i]); //해당 권한 모두 삭제 하자
        dmDBDelete.DeleteTB_ADMINGRADEPROGRAM_GRADECODE(cells[2,i]); //권한코드에 해당하는 프로그램 권한 삭제
      end;
    end;
  end;
  SearchList('');

end;

procedure TfmAdminClassCode.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmAdminClassCode.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stAdminClassCode : string;
begin
  inherited;
  if Trim(ed_Name.Text) = '' then
  begin
    stMessage := dmFormMessage.GetMessage('BLANKFIELD');
    stMessage := StringReplace(stMessage,'$WORK',lb_Name.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;

  if L_stWork = 'ADD' then
  begin
    stAdminClassCode := dmDBFunction.GetNextTB_AdminGradeCode;

    if Not dmDBInsert.InsertIntoTB_ADMINGRADE_All(stAdminClassCode,ed_Name.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('DBSAVEERROR');
      stMessage := stringReplace(stMessage,'$WORK',btn_Save.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;

    SearchList(stAdminClassCode);

    fmMain.FORMCHANGE(con_FormBMOSADMINCLASSCODE,'');
  end else if L_stWork = 'UPDATE' then
  begin
    stAdminClassCode := ed_SelectCode.Text;

    if Not dmDBUpdate.UpdateTB_ADMINGRADECODE_Field_StringValue(stAdminClassCode,'AG_GRADECODENAME',ed_Name.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('DBSAVEERROR');
      stMessage := stringReplace(stMessage,'$WORK',btn_Save.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;

    SearchList(stAdminClassCode,sg_List.TopRow);

    fmMain.FORMCHANGE(con_FormBMOSADMINCLASSCODE,'');
  end;

  Pan_code.Visible := False;
end;

procedure TfmAdminClassCode.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmAdminClassCode.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(pm_UpdateCode);

end;

procedure TfmAdminClassCode.ed_SearchNameChange(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmAdminClassCode.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
  *)
end;

procedure TfmAdminClassCode.FormChangeEvent(aFormName: integer);
begin

end;

procedure TfmAdminClassCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fmMain.FORMENABLE(con_FormBMOSADMINCLASSCODE,'FALSE');

  Action := caFree;
end;

procedure TfmAdminClassCode.FormCreate(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := 17;
  FontSetting;
end;

procedure TfmAdminClassCode.FormGradeRefresh;
begin
  btn_Add.Enabled := IsInsertGrade;
  btn_Delete.Enabled := IsDeleteGrade;
end;

procedure TfmAdminClassCode.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmAdminClassCode.FormNameSetting: Boolean;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('2','1','BM5_011');//dmFormFunction.GetFormName('0','2','COMMONLIST01');
  btn_Add.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  pm_AddCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  btn_Delete.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  pm_DeleteCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  btn_Update.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  pm_UpdateCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stButtonPrevCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU004');
  lb_SearchName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONADMINGRADENAME');
  sg_List.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONADMINGRADENAME');
  lb_Name.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONADMINGRADENAME');
end;

procedure TfmAdminClassCode.FormResize(Sender: TObject);
begin
  inherited;
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  sg_List.Height := List.Height - sg_List.Top - 30;
  sg_List.Width := List.Width - (sg_List.Left * 2);
  sg_List.ColWidths[1] := sg_List.Width - sg_List.ColWidths[0] ;

  Pan_code.Left := (Width div 2) - (Pan_code.Width div 2);
  Pan_code.top := (Height div 2) - (Pan_code.Height div 2);

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

procedure TfmAdminClassCode.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSADMINCLASSCODE,'TRUE');

  SearchList('');

end;

procedure TfmAdminClassCode.pm_AddCodeClick(Sender: TObject);
begin
  inherited;
  Pan_code.Visible := True;
  lb_WorkType.Caption := btn_Add.Caption;
  L_stWork := 'ADD';
  ed_Name.Text := '';
  ed_Name.SetFocus;

end;

procedure TfmAdminClassCode.pm_DeleteCodeClick(Sender: TObject);
begin
  inherited;
  btn_DeleteClick(btn_Delete);
end;

procedure TfmAdminClassCode.pm_UpdateCodeClick(Sender: TObject);
begin
  inherited;
  Pan_code.Visible := True;
  lb_WorkType.Caption := pm_UpdateCode.Caption;
  with sg_List do
  begin
    if Not isDigit(cells[2,Row]) then Exit;
    ed_SelectCode.Text  := cells[2,Row];
    ed_Name.Text := cells[1,Row];
  end;
  L_stWork := 'UPDATE';
  ed_Name.SetFocus;

end;

function TfmAdminClassCode.SearchList(aCurrentCode:string;aTopRow:integer = 0): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_List,2,2,true);
  stSql := dmDBSelect.SelectTB_ADMINGRADECODE_Name(ed_SearchName.Text);
  L_nCheckCount := 0;

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
      with sg_List do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('AG_GRADECODENAME').AsString;
          cells[2,nRow] := FindField('AG_GRADECODE').AsString;
          if (FindField('AG_GRADECODE').AsString )  = aCurrentCode then
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
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure TfmAdminClassCode.sg_ListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nCheckCount := L_nCheckCount + 1
    else L_nCheckCount := L_nCheckCount - 1 ;
  end;
end;

procedure TfmAdminClassCode.sg_ListDblClick(Sender: TObject);
begin
  inherited;
  if Not IsUpdateGrade then Exit;

  pm_UpdateCodeClick(pm_UpdateCode);
end;

initialization
  RegisterClass(TfmAdminClassCode);
Finalization
  UnRegisterClass(TfmAdminClassCode);

end.