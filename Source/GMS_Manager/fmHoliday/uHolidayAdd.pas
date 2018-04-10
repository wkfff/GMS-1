﻿unit uHolidayAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSubForm, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, CommandArray, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, AdvSmoothLabel, AdvSmoothPanel, W7Classes,
  W7Panels, AdvGlassButton,ADODB,ActiveX, frmshape, Vcl.Mask, AdvSpin,
  Vcl.ComCtrls, AdvDateTimePicker, AdvOfficeButtons, AdvToolBar,
  AdvToolBarStylers, AdvGlowButton, AdvOfficePager, AdvAppStyler,
  AdvOfficePagerStylers, Vcl.Imaging.pngimage, Vcl.ExtCtrls, AdvCombo;

type
  TfmHolidayAdd = class(TfmASubForm)
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    List: TAdvSmoothPanel;
    lb_SearchName: TAdvSmoothLabel;
    sg_List: TAdvStringGrid;
    Add: TAdvSmoothPanel;
    lb_AddName: TAdvSmoothLabel;
    ed_InsertName: TAdvEdit;
    se_Year: TAdvSpinEdit;
    dt_AddDate: TAdvDateTimePicker;
    lb_AddDate: TAdvSmoothLabel;
    chk_ACAdd: TAdvOfficeCheckBox;
    chk_ATAdd: TAdvOfficeCheckBox;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    btn_Add: TAdvGlowButton;
    btn_Update: TAdvGlowButton;
    btn_Delete: TAdvGlowButton;
    btn_BasicHoliday: TAdvGlowButton;
    lb_WorkType: TLabel;
    btn_Save: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    btn_Cancel: TAdvGlowButton;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvSmoothLabel1: TAdvSmoothLabel;
    cmb_SpecialDay: TAdvComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_ListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_ListDblClick(Sender: TObject);
    procedure ed_SearchNameChange(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure ed_InsertNameKeyPress(Sender: TObject; var Key: Char);
    procedure se_YearChange(Sender: TObject);
    procedure btn_BasicHolidayClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    L_nPageListMaxCount : integer;
    L_nCheckCount : integer;
    L_stButtonCloseCaption : string;
    L_stButtonPrevCaption : string;
    L_stDeleteCaption : string;
    L_stMenuID : string;
    { Private declarations }
    Function FormNameSetting:Boolean;
    procedure FontSetting;
    Function SearchList(aCurrentCode:string;aTopRow:integer = 0):Boolean;
    function InsertBascicHoliday(aDate,aName:string):Boolean;
  private
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);

  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmHolidayAdd: TfmHolidayAdd;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBDelete,
  uDBFunction,
  uDBFormMessage,
  uDBInsert,
  uDBSelect,
  uDBUpdate,
  uFormFunction,
  uFormVariable,
  uSolarLunar,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmHolidayAdd.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmHolidayAdd.btn_AddClick(Sender: TObject);
begin
  inherited;
  Add.Visible := True;
  dt_AddDate.Date := now;
  dt_AddDate.Enabled := True;
  ed_InsertName.Text := '';
  chk_ACAdd.Checked := True;
  chk_ATAdd.Checked := True;
  cmb_SpecialDay.ItemIndex := 0;
  lb_WorkType.Caption := btn_Add.Caption;
end;

procedure TfmHolidayAdd.btn_SaveClick(Sender: TObject);
var
  stDate : string;
  stMessage : string;
  nResult : integer;
  stACType : string;
  stATType : string;
begin
  inherited;
  Try
    btn_Add.Enabled := False;
    stDate := FormatDateTime('yyyymmdd',dt_AddDate.Date) ;

    if chk_ACAdd.Checked then stACType := '1'
    else stACType := '0';
    if chk_ATAdd.Checked then stATType := '1'
    else stATType := '0';

    nResult := dmDBFunction.CheckTB_HOLIDAY_Date(stDate);
    if nResult = 1 then
    begin
      if Not dmDBUpdate.updateTB_HOLIDAY_Value(stDate,ed_InsertName.Text,stACType,stATType,inttostr(cmb_SpecialDay.ItemIndex + 3)) then
      begin
        stMessage := dmFormMessage.GetMessage('DBSAVEERROR');
        stMessage := stringReplace(stMessage,'$WORK',btn_Save.Caption,[rfReplaceAll]);
        Application.MessageBox(PChar(stMessage),'Error',MB_OK);
        Exit;
      end;
    end else
    begin
      if Not dmDBInsert.InsertIntoTB_HOLIDAY_Value(stDate,ed_InsertName.Text,stACType,stATType,inttostr(cmb_SpecialDay.ItemIndex + 3)) then
      begin
        stMessage := dmFormMessage.GetMessage('DBSAVEERROR');
        stMessage := stringReplace(stMessage,'$WORK',btn_Save.Caption,[rfReplaceAll]);
        Application.MessageBox(PChar(stMessage),'Error',MB_OK);
        Exit;
      end;
    end;

    if stACType = '1' then
    begin
      dmDBDelete.DeleteTB_HOLIDAYDEVICE_DayAll(stDate);      //전체 장비 삭제 후
      dmDBFunction.CopyHolidayToAllDevice(stDate,inttostr(cmb_SpecialDay.ItemIndex + 3));           //전체 장비에 특정일을 입력 하자.
    end else
    begin
      dmDBUpdate.UpdateTB_HOLIDAYDEVICE_DayDelete(stDate);   //특정일을 미사용 처리 하자.
    end;

    SearchList(stDate);

    fmMain.FORMCHANGE(con_FormBMOSHOLIDAYADMIN,'');
  Finally
    btn_Add.Enabled := True;
  End;
  Add.Visible := False;
end;

procedure TfmHolidayAdd.btn_BasicHolidayClick(Sender: TObject);
var
  stYear : string;
  stDate : string;
  nYear,nMonth,nDay : Word;
begin
  inherited;
  stYear := inttostr(se_Year.Value);
  stDate := stYear + '0101';   //신정
  InsertBascicHoliday(stDate,'신정');
  stDate := stYear + '0301';   //삼일절
  InsertBascicHoliday(stDate,'삼일절');
  stDate := stYear + '0505';   //어린이날
  InsertBascicHoliday(stDate,'어린이날');
  stDate := stYear + '0606';   //현충일
  InsertBascicHoliday(stDate,'현충일');
  stDate := stYear + '0815';   //광복절
  InsertBascicHoliday(stDate,'광복절');
  stDate := stYear + '1009';   //한글날
  InsertBascicHoliday(stDate,'한글날');
  stDate := stYear + '1013';   //개천절
  InsertBascicHoliday(stDate,'개천절');
  stDate := stYear + '1225';   //성탄절
  InsertBascicHoliday(stDate,'성탄절');

  Lunar_To_Solar(se_Year.Value - 1,12,29,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //구정연휴
  InsertBascicHoliday(stDate,'구정연휴');
  Lunar_To_Solar(se_Year.Value,1,1,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //구정연휴
  InsertBascicHoliday(stDate,'구정연휴');
  Lunar_To_Solar(se_Year.Value,1,2,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //구정연휴
  InsertBascicHoliday(stDate,'구정연휴');
  Lunar_To_Solar(se_Year.Value,4,8,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //석가탄신일
  InsertBascicHoliday(stDate,'부처님오신날');
  Lunar_To_Solar(se_Year.Value,8,14,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //추석연휴
  InsertBascicHoliday(stDate,'추석연휴');
  Lunar_To_Solar(se_Year.Value,8,15,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //추석연휴
  InsertBascicHoliday(stDate,'추석연휴');
  Lunar_To_Solar(se_Year.Value,8,16,nYear,nMonth,nDay);
  stDate := FillZeroNumber(nYear,4) + FillZeroNumber(nMonth,2) + FillZeroNumber(nDay,2); //추석연휴
  InsertBascicHoliday(stDate,'추석연휴');
  //InsertBascicHoliday(stYear + '0101','신정')
  SearchList('');

end;

procedure TfmHolidayAdd.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Add.Visible := False;
end;

procedure TfmHolidayAdd.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmHolidayAdd.btn_DeleteClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
  stMessage : string;
  stDate : string;
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
        stDate := cells[1,i];
        stDate := stringReplace(stDate,'-','',[rfReplaceAll]);
        dmDBDelete.DeleteTB_HOLIDAY_DayAll(stDate);
        dmDBUpdate.UpdateTB_HOLIDAYDEVICE_DayDelete(stDate);   //특정일을 미사용 처리 하자.
      end;
    end;
  end;
  SearchList('');

end;

procedure TfmHolidayAdd.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

procedure TfmHolidayAdd.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmHolidayAdd.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  lb_WorkType.Caption := btn_Update.Caption;
  sg_ListDblClick(sg_List);
end;

procedure TfmHolidayAdd.ed_InsertNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    key := #0;
    btn_SaveClick(self);
  end;

end;

procedure TfmHolidayAdd.ed_SearchNameChange(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmHolidayAdd.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);  *)
end;

procedure TfmHolidayAdd.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsNormal;
end;

procedure TfmHolidayAdd.FormChangeEvent(aFormName: integer);
begin

end;

procedure TfmHolidayAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fmMain.FORMENABLE(con_FormBMOSHOLIDAYADMIN,'FALSE');

  Action := caFree;
end;

procedure TfmHolidayAdd.FormCreate(Sender: TObject);
var
  stYear : string;
begin
  inherited;
  L_nPageListMaxCount := 17;
  stYear := FormatDateTime('YYYY',Now);
  se_Year.Value := strtoint(stYear);
  dt_AddDate.Date := Now;
  FontSetting;
end;

procedure TfmHolidayAdd.FormGradeRefresh;
begin
  btn_Add.Enabled := IsInsertGrade;
  btn_Delete.Enabled := IsDeleteGrade;
  btn_Update.Enabled := IsUpdateGrade;
end;

procedure TfmHolidayAdd.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmHolidayAdd.FormNameSetting: Boolean;
begin

  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  btn_Delete.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  L_stDeleteCaption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_AddName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONHOLIDAYNAME');
  sg_List.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONHOLIDAYNAME');
  lb_AddDate.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDATE');
  sg_List.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDATE');
  lb_SearchName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONYEAR');
  sg_List.Cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONACCESS');
  sg_List.Cells[4,0] := dmFormFunction.GetFormName('0','2','COMMONATTEND');
  btn_Add.Caption  := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  btn_Update.Caption  := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_BasicHoliday.Caption := dmFormFunction.GetFormName('2','2','BM2_014_01');
  chk_ACAdd.Caption := dmFormFunction.GetFormName('0','2','COMMONACCESS');
  chk_ATAdd.Caption := dmFormFunction.GetFormName('0','2','COMMONATTEND');
end;

procedure TfmHolidayAdd.FormResize(Sender: TObject);
begin
  inherited;
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  sg_List.Height := List.Height - sg_List.Top - 30;
  sg_List.Width := List.Width - (sg_List.Left * 2);
  sg_List.ColWidths[2] := sg_List.Width - sg_List.ColWidths[0] - sg_List.ColWidths[1];
  btn_BasicHoliday.Left := sg_List.Left + sg_List.Width - btn_BasicHoliday.Width;

  Add.Left := (Width div 2) - (Add.Width div 2);
  Add.top := (Height div 2) - (Add.Height div 2);

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

procedure TfmHolidayAdd.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSHOLIDAYADMIN,'TRUE');

  SearchList('');

  Left := 0;
  Top := 0;

end;

function TfmHolidayAdd.InsertBascicHoliday(aDate, aName: string): Boolean;
var
  nResult : integer;
begin
  result := False;
  nResult := dmDBFunction.CheckTB_HOLIDAY_Date(aDate);
  if nResult = 2 then
  begin
    Exit;
  end;
  if nResult <> 1 then
  begin
    if Not dmDBInsert.InsertIntoTB_HOLIDAY_Value(aDate,aName,'1','1','3') then
    begin
      Exit;
    end;
    dmDBDelete.DeleteTB_HOLIDAYDEVICE_DayAll(aDate);      //전체 장비 삭제 후
    dmDBFunction.CopyHolidayToAllDevice(aDate,'3');           //전체 장비에 특정일을 입력 하자.
  end;
  result := True;

end;

function TfmHolidayAdd.SearchList(aCurrentCode:string;aTopRow:integer = 0): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stYear : string;
begin
  GridInit(sg_List,3,2,true);

  stYear := inttostr(se_Year.Value);
  stSql := dmDBSelect.SelectTB_Holiday_Year(stYear);
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
          cells[1,nRow] := MakeDatetimeStr(FindField('HO_DAY').AsString);
          cells[2,nRow] := FindField('NAME').AsString;
          if FindField('HO_ACUSE').AsString = '1' then AddCheckBox(3,nRow,True,False)
          else AddCheckBox(3,nRow,False,False);
          if FindField('HO_ATUSE').AsString = '1' then AddCheckBox(4,nRow,True,False)
          else AddCheckBox(4,nRow,False,False);
          cells[5,nRow] := inttostr(FindField('HO_TYPE').AsInteger - 2);

          if (FindField('HO_DAY').AsString )  = aCurrentCode then
          begin
            SelectRows(nRow,1);
          end;

          if FindField('HO_TYPE').AsString = '4' then RowColor[nRow] := clYellow
          else if FindField('HO_TYPE').AsString = '5' then RowColor[nRow] := clAqua
          else RowColor[nRow] := clWhite;

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


procedure TfmHolidayAdd.se_YearChange(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmHolidayAdd.sg_ListCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmHolidayAdd.sg_ListDblClick(Sender: TObject);
var
  bChecked : Boolean;
  stDate : string;
begin
  inherited;
  if Not IsUpdateGrade then Exit;

  lb_WorkType.Caption := btn_Update.Caption;
  with sg_List do
  begin
    if cells[1,Row] = '' then Exit;
    stDate := stringReplace(cells[1,Row],'-','',[rfReplaceAll]);
    stDate := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
    Try
      dt_AddDate.Date := strtoDate(stDate);
    Except
      Exit;
    End;
    dt_AddDate.Enabled := False;
    ed_InsertName.Text := cells[2,Row];
    GetCheckBoxState(3,Row, bChecked);
    chk_ACAdd.Checked := bChecked;
    GetCheckBoxState(4,Row, bChecked);
    chk_ATAdd.Checked := bChecked;
    if isDigit(cells[5,Row]) then
       cmb_SpecialDay.ItemIndex := strtoint(cells[5,Row]) - 1;
  end;
  Add.Visible := True;

end;

initialization
  RegisterClass(TfmHolidayAdd);
Finalization
  UnRegisterClass(TfmHolidayAdd);

end.
