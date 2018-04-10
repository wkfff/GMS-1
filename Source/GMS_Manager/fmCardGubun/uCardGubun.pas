﻿unit uCardGubun;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, AdvOfficeTabSetStylers, AdvCombo,
  AdvToolBar, AdvToolBarStylers, AdvGlowButton, AdvOfficePager,
  AdvOfficePagerStylers, AdvAppStyler, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  AdvOfficeButtons;

const
  con_LocalBuildingImageIndex = 1;
  con_LocalArmAreaImageIndex = 8;
  con_LocalSelectArmAreaImageIndex = 9;

type
  TfmCardGubun = class(TfmASubForm)
    BodyPanel: TW7Panel;
    MenuImageList16: TImageList;
    pan_ArmAreaMangement: TAdvSmoothPanel;
    pan_DoorSearch: TAdvSmoothPanel;
    sg_CardGubun: TAdvStringGrid;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_caption: TLabel;
    btn_ArmAreaClose: TAdvGlowButton;
    btn_Add: TAdvGlowButton;
    btn_Delete: TAdvGlowButton;
    pan_Setting: TAdvSmoothPanel;
    lb_Setting: TLabel;
    btn_AlarmCodeSettingCancel: TAdvGlowButton;
    btn_Save: TAdvGlowButton;
    ed_code: TAdvEdit;
    ed_Name: TAdvEdit;
    lb_CardGubunName: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_CardGubunCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_AlarmCodeSettingCancelClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure sg_CardGubunDblClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    L_stMoveCode : string;
    L_stAllName : string;
    L_nCardGubunCheckCount : integer;
    procedure FormNameSetting;
    procedure FontSetting;
    procedure SearchCardGubun(aCode:string='';aTopRow:integer=0);
  private
    { Private declarations }
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmCardGubun: TfmCardGubun;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBDelete,
  uDBSelect,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormUtil,
  uComboBoxCodeLoad,
  uMain;
{$R *.dfm}

procedure TfmCardGubun.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmCardGubun.btn_AddClick(Sender: TObject);
begin
  inherited;
  lb_Setting.Caption := btn_Add.Caption;
  pan_Setting.Visible := True;
  ed_Name.Text := '';
  L_stWork := 'INSERT';
end;

procedure TfmCardGubun.btn_AlarmCodeSettingCancelClick(Sender: TObject);
begin
  inherited;
  pan_Setting.Visible := False;
end;

procedure TfmCardGubun.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmCardGubun.btn_DeleteClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',btn_Delete.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  dmDBDelete.DeleteTB_CARDGUBUN_Key(sg_CardGubun.Cells[0,sg_CardGubun.Row]);
  SearchCardGubun();
end;

procedure TfmCardGubun.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmCardGubun.btn_SaveClick(Sender: TObject);
begin
  inherited;
  if L_stWork = 'INSERT' then
  begin
    ed_code.Text := dmDBFunction.GetNextTB_CARDGUBUN_ID;
    dmDBInsert.InsertIntoTB_CARDGUBUN_All(ed_Code.Text,ed_Name.Text,'0');
  end else
  begin
    dmDBUpdate.UpdateTB_CARDGUBUN_Field_StringValue(ed_code.Text,'CA_CARDGUBUNNAME',ed_Name.Text);
  end;
  SearchCardGubun(ed_code.Text,sg_CardGubun.TopRow);
  pan_Setting.Visible := False;
end;

procedure TfmCardGubun.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
  *)
end;

procedure TfmCardGubun.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmCardGubun.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  fmMain.FORMENABLE(con_FormBMOSCARDGUBUN,'FALSE');

  Action := caFree;
end;

procedure TfmCardGubun.FormCreate(Sender: TObject);
begin
  inherited;
  if G_nFormLanguageType = 1 then
  begin
//    ed_name.ImeMode := imSHanguel;//imHanguel;
//    ed_name.ImeName := '';
  end else if G_nFormLanguageType = 2 then
  begin
//    ed_name.ImeMode := imAlpha;
//    ed_name.ImeName := '';
  end;


  FontSetting;
end;

procedure TfmCardGubun.FormGradeRefresh;
begin

end;

procedure TfmCardGubun.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmCardGubun.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_caption.Caption := dmFormFunction.GetFormName('3','1','BM2_0151');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  with sg_CardGubun do
  begin
    cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONCARDGUBUNCODE');
    cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONCARDGUBUNNAME');
    cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONCARDRELAYTYPE');

  end;
  lb_CardGubunName.Caption := dmFormFunction.GetFormName('0','2','COMMONCARDGUBUNNAME');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Add.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  btn_Delete.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
end;

procedure TfmCardGubun.FormResize(Sender: TObject);
begin
  inherited;

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  pan_ArmAreaMangement.Left := (Width div 2) - (pan_ArmAreaMangement.Width div 2);
  pan_ArmAreaMangement.top := (Height div 2) - (pan_ArmAreaMangement.Height div 2) - 30;

  if Windowstate = wsMaximized then
  begin
    //btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;
  pan_Setting.Left := (Width div 2) - (pan_Setting.Width div 2);
  pan_Setting.top := (Height div 2) - (pan_Setting.Height div 2);
end;

procedure TfmCardGubun.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  SearchCardGubun();
  fmMain.FORMENABLE(con_FormBMOSCARDGUBUN,'TRUE');

end;

procedure TfmCardGubun.Form_Close;
begin
  Close;
end;




procedure TfmCardGubun.SearchCardGubun(aCode: string; aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_CardGubun,2,2,False);
  stSql := ' Select * from TB_CARDGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';

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
      if recordcount < 1 then Exit;
      with sg_CardGubun do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('CA_CARDGUBUN').AsString;
          cells[1,nRow] := FindField('CA_CARDGUBUNNAME').AsString;
          cells[2,nRow] := FindField('CA_RELAYTYPE').AsString;

          if aCode = cells[0,nRow] then SelectRows(nRow,1);
          nRow := nRow + 1;
          Next;
        end;
        if aTopRow <> 0 then TopRow := aTopRow;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCardGubun.sg_CardGubunCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nCardGubunCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nCardGubunCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nCardGubunCheckCount := L_nCardGubunCheckCount + 1
    else L_nCardGubunCheckCount := L_nCardGubunCheckCount - 1 ;
  end;

end;

procedure TfmCardGubun.sg_CardGubunDblClick(Sender: TObject);
begin
  inherited;
  lb_Setting.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  with sg_CardGubun do
  begin
    if Not isDigit(cells[0,Row]) then Exit;

    ed_code.Text := cells[0,Row];
    ed_Name.Text := cells[1,Row];

  end;
  pan_Setting.Visible := True;
  L_stWork := 'UPDATE';
end;

initialization
  RegisterClass(TfmCardGubun);
Finalization
  UnRegisterClass(TfmCardGubun);

end.