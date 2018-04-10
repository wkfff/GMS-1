unit uNameChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSubForm, CommandArray,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, AdvGroupBox,
  AdvOfficeButtons, AdvGlowButton, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvEdBtn, AdvCombo, AdvEdit, AdvSmoothLabel, AdvSmoothPanel, AdvOfficePager,
  ADODB,ActiveX, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvAppStyler,
  AdvOfficePagerStylers;

type
  TfmNameChange = class(TfmASubForm)
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    BodyPanel: TAdvSmoothPanel;
    lb_List: TLabel;
    lb_NameType: TAdvSmoothLabel;
    cmb_NameType: TAdvComboBox;
    sg_FormName: TAdvStringGrid;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    pan_NameUpdate: TAdvSmoothPanel;
    btn_Apply: TAdvGlowButton;
    lb_OldFomName: TAdvSmoothLabel;
    lb_NewFomName: TAdvSmoothLabel;
    ed_OldFomName: TAdvEdit;
    ed_NewFomName: TAdvEdit;
    ed_Code1: TEdit;
    ed_code2: TEdit;
    ed_code3: TEdit;
    ed_code4: TEdit;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    procedure cmb_NameTypeChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sg_FormNameResize(Sender: TObject);
    procedure pan_NameUpdateResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_FormNameClick(Sender: TObject);
    procedure btn_ApplyClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Function FormNameSetting:Boolean;
    Function SearchFormName(aTop,aRow:integer):Boolean;
  public
    { Public declarations }
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmNameChange: TfmNameChange;

implementation
uses
  uDataBase,
  uDBSelect,
  uDBUpdate,
  uFormFunction
  ;

{$R *.dfm}

{ TfmNameChange }

procedure TfmNameChange.btn_ApplyClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if ed_NewFomName.Text = '' then
  begin
    stMessage := dmFormFunction.GetFormMessage('BLANKFIELD');
    stMessage := stringReplace(stMessage,'$WORK',lb_NewFomName.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;

  if cmb_NameType.ItemIndex = 0 then
  begin
    dmDBUpdate.UpdateTB_FORMNAME_Name(ed_Code1.Text,ed_Code2.Text,ed_Code3.Text,ed_Code4.Text,ed_NewFomName.Text);
  end else if cmb_NameType.ItemIndex = 1 then
  begin
    dmDBUpdate.UpdateTB_FORMMESSAGE_Name(ed_Code1.Text,ed_NewFomName.Text);
  end;
  SearchFormName(sg_FormName.TopRow,sg_FormName.Row);
end;

procedure TfmNameChange.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmNameChange.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

procedure TfmNameChange.cmb_NameTypeChange(Sender: TObject);
begin
  inherited;

  sg_FormName.Cells[0,0] := cmb_NameType.Text;
  lb_OldFomName.Caption.Text := cmb_NameType.Text;
  lb_NewFomName.Caption.Text := cmb_NameType.Text;

  SearchFormName(1,1);
  sg_FormNameClick(sg_FormName);
end;

procedure TfmNameChange.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfmNameChange.FormGradeRefresh;
begin

end;

procedure TfmNameChange.FormIDSetting(aID: string);
begin

end;

function TfmNameChange.FormNameSetting: Boolean;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('2','1','BM6_05');
  Caption := dmFormFunction.GetFormName('2','1','BM6_05');
  lb_List.Caption := dmFormFunction.GetFormName('2','1','BM6_05');
  lb_NameType.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNAMETYPE');

  cmb_NameType.Clear;
  cmb_NameType.Items.Add(dmFormFunction.GetFormName('0','2','COMMONFORMNAME'));
  cmb_NameType.Items.Add(dmFormFunction.GetFormName('0','2','COMMONFORMMESSAGE'));
  cmb_NameType.ItemIndex := 0;
  cmb_NameTypeChange(cmb_NameType);

  btn_Apply.Caption := dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
end;

procedure TfmNameChange.FormResize(Sender: TObject);
begin
  inherited;
  sg_FormName.Left := 10;
  sg_FormName.Width := BodyPanel.Width - (sg_FormName.Left * 2);
  sg_FormName.Height := BodyPanel.Height - sg_FormName.Top - pan_NameUpdate.Height;

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

procedure TfmNameChange.FormShow(Sender: TObject);
begin
  inherited;
  Left := 0;
  Top := 0;
  FormNameSetting;
  FormResize(self);
  sg_FormNameResize(sg_FormName);
  pan_NameUpdateResize(pan_NameUpdate);
end;

procedure TfmNameChange.pan_NameUpdateResize(Sender: TObject);
begin
  inherited;
  ed_OldFomName.Width := BodyPanel.Width - ed_OldFomName.Left - 10;
  ed_NewFomName.Width := BodyPanel.Width - ed_NewFomName.Left - 10;

  btn_Apply.Left := (pan_NameUpdate.Width div 2) - (btn_Apply.Width div 2);
end;

function TfmNameChange.SearchFormName(aTop,aRow:integer): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_FormName,1);

  if cmb_NameType.ItemIndex = 0 then
  begin
    stSql :=  dmDBSelect.SelectTB_FORMNAME_All;
  end else if cmb_NameType.ItemIndex = 1 then
  begin
    stSql :=  dmDBSelect.SelectTB_FORMMESSAGE_All;
  end;

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
      with sg_FormName do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          if cmb_NameType.ItemIndex = 0 then
          begin
            cells[0,nRow] := FindField('NAME').AsString;
            cells[1,nRow] := FindField('FN_PROGRAMGUBUN').AsString;
            cells[2,nRow] := FindField('FN_NAMECODE').AsString;
            cells[3,nRow] := FindField('FN_MENUGUBUN').AsString;
            cells[4,nRow] := FindField('FN_MENUGROUP').AsString;
          end else if cmb_NameType.ItemIndex = 1 then
          begin
            cells[0,nRow] := FindField('NAME').AsString;
            cells[1,nRow] := FindField('FM_MESSAGECODE').AsString;
          end;
          nRow := nRow + 1;
          Next;
        end;
        TopRow := aTop;
        Row := aRow;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmNameChange.sg_FormNameClick(Sender: TObject);
begin
  inherited;
  with sg_FormName do
  begin
    ed_OldFomName.Text := cells[0,Row];
    ed_code1.Text := cells[1,Row];
    ed_code2.Text := cells[2,Row];
    ed_code3.Text := cells[3,Row];
    ed_code4.Text := cells[4,Row];
    ed_NewFomName.Text := '';
  end;
end;

procedure TfmNameChange.sg_FormNameResize(Sender: TObject);
begin
  inherited;
  sg_FormName.ColWidths[0] := sg_FormName.Width;
end;


initialization
  RegisterClass(TfmNameChange);
Finalization
  UnRegisterClass(TfmNameChange);

end.
