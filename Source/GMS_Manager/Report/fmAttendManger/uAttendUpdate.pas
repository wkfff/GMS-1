unit uAttendUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  AdvGlowButton,System.DateUtils,ADODB,ActiveX, AdvSmoothLabel;

type
  TfmAttendUpdate = class(TForm)
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    GroupBox1: TGroupBox;
    ed_ATOutTimess: TEdit;
    lb_ss4: TLabel;
    lb_ss3: TLabel;
    lb_ss2: TLabel;
    lb_ss1: TLabel;
    ed_ATInTimess: TEdit;
    ed_ATWorkOutTimess: TEdit;
    ed_ATWorkInTimess: TEdit;
    lb_mm4: TLabel;
    lb_mm3: TLabel;
    lb_mm2: TLabel;
    lb_mm1: TLabel;
    ed_ATInTimemm: TEdit;
    ed_ATWorkOutTimemm: TEdit;
    ed_ATWorkInTimemm: TEdit;
    ed_ATOutTimemm: TEdit;
    lb_hh4: TLabel;
    lb_hh3: TLabel;
    lb_hh2: TLabel;
    lb_hh1: TLabel;
    ed_ATInTimehh: TEdit;
    ed_ATWorkOutTimehh: TEdit;
    ed_ATWorkInTimehh: TEdit;
    ed_ATOutTimehh: TEdit;
    ed_ATOutTimeYear: TEdit;
    ed_ATWorkInTimeYear: TEdit;
    ed_ATWorkOutTimeYear: TEdit;
    ed_ATInTimeYear: TEdit;
    cmb_AttendCode: TComboBox;
    cmb_AttendWorkType: TComboBox;
    ed_EMName: TEdit;
    ed_EmCode: TEdit;
    dt_Indate: TDateTimePicker;
    lb_AtDate: TLabel;
    lb_EMCODE: TLabel;
    lb_EMNAME: TLabel;
    lb_AWCODE: TLabel;
    lb_ATCODE: TLabel;
    lb_ATINTIME: TLabel;
    lb_ATWORKOUTTIME: TLabel;
    lb_ATWORKINTIME: TLabel;
    lb_ATOUTTIME: TLabel;
    lb_list: TAdvSmoothLabel;
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_AttendWorkTypeChange(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    AttendWorkTypeCodeList : TStringList;
    AttendCodeList : TStringList;
    Function FormNameSetting:Boolean;
    function DataFormatCheck:Boolean;
    function SaveAttendEvent : Boolean;
    Function GetWorkTime(aWeekCode:integer;var aWorkStartTime:string;var aWorkEndTime:string;var aExtendTime:string;var aNightTime: string):Boolean;
  private
    FEMSEQ: string;
    FATDATE: string;
    FAWCODE: string;
    FATCODE: string;
    FInit: Boolean;
    FInTime: string;
    FWorkOutTime: string;
    FWorkInTime: string;
    FOutTime: string;
    FDataChange: Boolean;
    FOutTimeChange: Boolean;
    FInTimeChange: Boolean;
    FWorkOutTimeChange: Boolean;
    FAWCODEChange: Boolean;
    FATCODEChange: Boolean;
    FWorkInTimeChange: Boolean;
    procedure SetATCODE(const Value: string);
    procedure SetAWCODE(const Value: string);
    procedure SetInTime(const Value: string);
    procedure SetOutTime(const Value: string);
    procedure SetWorkInTime(const Value: string);
    procedure SetWorkOutTime(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property Init : Boolean read FInit write FInit;
    property DataChange : Boolean read FDataChange write FDataChange;
    property ATCODEChange : Boolean read FATCODEChange write FATCODEChange;
    property AWCODEChange : Boolean read FAWCODEChange write FAWCODEChange;
    property InTimeChange : Boolean read FInTimeChange write FInTimeChange;
    property WorkOutTimeChange : Boolean read FWorkOutTimeChange write FWorkOutTimeChange;
    property WorkInTimeChange : Boolean read FWorkInTimeChange write FWorkInTimeChange;
    property OutTimeChange : Boolean read FOutTimeChange write FOutTimeChange;

    property ATCODE : string read FATCODE write SetATCODE;
    property ATDATE : string read FATDATE write FATDATE;
    property AWCODE : string read FAWCODE write SetAWCODE;
    property EMSEQ : string read FEMSEQ write FEMSEQ;
    property InTime : string read FInTime write SetInTime;
    property WorkOutTime : string read FWorkOutTime write SetWorkOutTime;
    property WorkInTime : string read FWorkInTime write SetWorkInTime;
    property OutTime : string read FOutTime write SetOutTime;

  end;

var
  fmAttendUpdate: TfmAttendUpdate;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBFormMessage,
  uDBUpdate,
  uFormFunction;
{$R *.dfm}

{ TfmAttendUpdate }

procedure TfmAttendUpdate.btn_CancelClick(Sender: TObject);
begin
  DataChange := False;
  Close;
end;

procedure TfmAttendUpdate.btn_SaveClick(Sender: TObject);
var
  stInTime : string;
  stWorkOutTime : string;
  stWorkInTime : string;
  stOutTime : string;
  stSql : string;
  stMessage : string;
begin
  if Not DataFormatCheck then Exit;
  AwCode := AttendWorkTypeCodeList.Strings[cmb_AttendWorkType.ItemIndex];
  ATCode := AttendCodeList.Strings[cmb_AttendCode.ItemIndex];

  stInTime := '';
  stWorkOutTime := '';
  stWorkInTime := '';
  stOutTime := '';
  if ed_ATInTimeYear.Text <> '' then
  begin
    if ed_ATInTimehh.Text = '' then ed_ATInTimehh.text := '00';
    if ed_ATInTimemm.Text = '' then ed_ATInTimemm.text := '00';
    if ed_ATInTimess.Text = '' then ed_ATInTimess.text := '00';
    stInTime := ed_ATInTimeYear.Text + FillZeroStrNum(ed_ATInTimehh.Text,2) + FillZeroStrNum(ed_ATInTimemm.Text,2) + FillZeroStrNum(ed_ATInTimess.Text,2);
    stInTime := stringReplace(stInTime,'-','',[rfReplaceAll]);
    stInTime := stringReplace(stInTime,':','',[rfReplaceAll]);
    stInTime := stringReplace(stInTime,' ','',[rfReplaceAll]);
    InTime := stInTime;
  end;
  if ed_ATWorkOutTimeYear.Text <> '' then
  begin
    if ed_ATWorkOutTimehh.Text = '' then ed_ATWorkOutTimehh.text := '00';
    if ed_ATWorkOutTimemm.Text = '' then ed_ATWorkOutTimemm.text := '00';
    if ed_ATWorkOutTimess.Text = '' then ed_ATWorkOutTimess.text := '00';
    stWorkOutTime := ed_ATWorkOutTimeYear.Text + FillZeroStrNum(ed_ATWorkOutTimehh.Text,2) + FillZeroStrNum(ed_ATWorkOutTimemm.Text,2) + FillZeroStrNum(ed_ATWorkOutTimess.Text,2);
    stWorkOutTime := stringReplace(stWorkOutTime,'-','',[rfReplaceAll]);
    stWorkOutTime := stringReplace(stWorkOutTime,':','',[rfReplaceAll]);
    stWorkOutTime := stringReplace(stWorkOutTime,' ','',[rfReplaceAll]);
    WorkOutTime := stWorkOutTime;
  end;
  if ed_ATWorkInTimeYear.Text <> '' then
  begin
    if ed_ATWorkInTimehh.Text = '' then ed_ATWorkInTimehh.text := '00';
    if ed_ATWorkInTimemm.Text = '' then ed_ATWorkInTimemm.text := '00';
    if ed_ATWorkInTimess.Text = '' then ed_ATWorkInTimess.text := '00';
    stWorkInTime := ed_ATWorkInTimeYear.Text + FillZeroStrNum(ed_ATWorkInTimehh.Text,2) + FillZeroStrNum(ed_ATWorkInTimemm.Text,2) + FillZeroStrNum(ed_ATWorkInTimess.Text,2);
    stWorkInTime := stringReplace(stWorkInTime,'-','',[rfReplaceAll]);
    stWorkInTime := stringReplace(stWorkInTime,':','',[rfReplaceAll]);
    stWorkInTime := stringReplace(stWorkInTime,' ','',[rfReplaceAll]);
    WorkInTime := stWorkInTime;
  end;
  if ed_ATOutTimeYear.Text <> '' then
  begin
    if ed_ATOutTimehh.Text = '' then ed_ATOutTimehh.text := '00';
    if ed_ATOutTimemm.Text = '' then ed_ATOutTimemm.text := '00';
    if ed_ATOutTimess.Text = '' then ed_ATOutTimess.text := '00';
    stOutTime := ed_ATOutTimeYear.Text + FillZeroStrNum(ed_ATOutTimehh.Text,2) + FillZeroStrNum(ed_ATOutTimemm.Text,2) + FillZeroStrNum(ed_ATOutTimess.Text,2);
    stOutTime := stringReplace(stOutTime,'-','',[rfReplaceAll]);
    stOutTime := stringReplace(stOutTime,':','',[rfReplaceAll]);
    stOutTime := stringReplace(stOutTime,' ','',[rfReplaceAll]);
    OutTime := stOutTime;
  end;

  if Not DataChange then
  begin
    Close;
    Exit;
  end;

  if Not SaveAttendEvent then
  begin
    stMessage := dmFormMessage.GetMessage('DBSAVEERROR');
    stMessage := stringReplace(stMessage,'$NAME',btn_Save.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;
  Close;

end;

procedure TfmAttendUpdate.cmb_AttendWorkTypeChange(Sender: TObject);
var
  stAwCode : string;
begin
  if cmb_AttendWorkType.ItemIndex < 0 then Exit;

  stAwCode := AttendWorkTypeCodeList.Strings[cmb_AttendWorkType.ItemIndex];
  LoadAttendCode(stAwCode,AttendCodeList,TComboBox(cmb_AttendCode),False);
  if cmb_AttendCode.Items.Count > 0 then cmb_AttendCode.ItemIndex := 0;
end;

function TfmAttendUpdate.DataFormatCheck: Boolean;
var
  stMessage : string;
begin
  result := False;
  if cmb_AttendWorkType.ItemIndex < 0 then
  begin
    stMessage := dmFormMessage.GetMessage('NAMEERROR');
    stMessage := stringReplace(stMessage,'$NAME',lb_AWCODE.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;
  if cmb_AttendCode.ItemIndex < 0 then
  begin
    stMessage := dmFormMessage.GetMessage('NAMEERROR');
    stMessage := stringReplace(stMessage,'$NAME',lb_ATCODE.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  if ed_ATInTimeYear.Text <> '' then
  begin
    if Not IsDate(ed_ATInTimeYear.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATInTimehh.Text <> '' then
  begin
    if Not IsDigit(ed_ATInTimehh.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATInTimehh.Text) > 23 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATInTimemm.Text <> '' then
  begin
    if Not IsDigit(ed_ATInTimemm.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATInTimemm.Text) > 59 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATInTimess.Text <> '' then
  begin
    if Not IsDigit(ed_ATInTimess.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATInTimess.Text) > 59 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;


  if ed_ATWorkOutTimeYear.Text <> '' then
  begin
    if Not IsDate(ed_ATWorkOutTimeYear.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATWorkOutTimehh.Text <> '' then
  begin
    if Not IsDigit(ed_ATWorkOutTimehh.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATWorkOutTimehh.Text) > 23 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATWorkOutTimemm.Text <> '' then
  begin
    if Not IsDigit(ed_ATWorkOutTimemm.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATWorkOutTimemm.Text) > 59 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATWorkOutTimess.Text <> '' then
  begin
    if Not IsDigit(ed_ATWorkOutTimess.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATWorkOutTimess.Text) > 59 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;


  if ed_ATWorkInTimeYear.Text <> '' then
  begin
    if Not IsDate(ed_ATWorkINTimeYear.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATWorkInTimehh.Text <> '' then
  begin
    if Not IsDigit(ed_ATWorkInTimehh.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATWorkInTimehh.Text) > 23 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATWorkInTimemm.Text <> '' then
  begin
    if Not IsDigit(ed_ATWorkInTimemm.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATWorkInTimemm.Text) > 59 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATWorkInTimess.Text <> '' then
  begin
    if Not IsDigit(ed_ATWorkInTimess.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATWorkInTimess.Text) > 59 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATWORKINTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;


  if ed_ATOutTimeYear.Text <> '' then
  begin
    if Not IsDate(ed_ATOutTimeYear.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATOutTimehh.Text <> '' then
  begin
    if Not IsDigit(ed_ATOutTimehh.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATOutTimehh.Text) > 23 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATOutTimemm.Text <> '' then
  begin
    if Not IsDigit(ed_ATOutTimemm.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATOutTimemm.Text) > 59 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;
  if ed_ATOutTimess.Text <> '' then
  begin
    if Not IsDigit(ed_ATOutTimess.Text) then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
    if StrToInt64(ed_ATOutTimess.Text) > 59 then
    begin
      stMessage := dmFormMessage.GetMessage('NAMEERROR');
      stMessage := stringReplace(stMessage,'$NAME',lb_ATOUTTIME.Caption,[rfReplaceAll]);
      Application.MessageBox(PChar(stMessage),'Error',MB_OK);
      Exit;
    end;
  end;

  result := True;
end;

procedure TfmAttendUpdate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AttendWorkTypeCodeList.Free;
  AttendCodeList.Free;
end;

procedure TfmAttendUpdate.FormCreate(Sender: TObject);
begin
  DataChange:= False;
  ATCODEChange:= False;
  AWCODEChange:= False;
  InTimeChange:= False;
  WorkOutTimeChange:= False;
  WorkInTimeChange:= False;
  OutTimeChange:= False;

  AttendWorkTypeCodeList := TStringList.Create;
  AttendCodeList := TStringList.Create;
end;

function TfmAttendUpdate.FormNameSetting: Boolean;
begin
  lb_AtDate.Caption := dmFormFunction.GetFormName('0','2','COMMONATTENDDATE');
  lb_EMCODE.Caption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  lb_EMNAME.Caption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  lb_AWCODE.Caption := dmFormFunction.GetFormName('0','2','COMMONATTENDTYPE');  //근태타입
  lb_ATCODE.Caption := dmFormFunction.GetFormName('0','2','COMMONATTENDCODE');  //근태코드
  lb_ATINTIME.Caption := dmFormFunction.GetFormName('0','2','COMMONATINTIME');
  lb_ATWORKOUTTIME.Caption := dmFormFunction.GetFormName('0','2','COMMONATWORKOUTTIME');
  lb_ATWORKINTIME.Caption := dmFormFunction.GetFormName('0','2','COMMONATWORKINTIME');
  lb_ATOUTTIME.Caption := dmFormFunction.GetFormName('0','2','COMMONATOUTTIME');
  lb_hh1.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_hh2.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_hh3.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_hh4.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_mm1.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_mm2.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_mm3.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_mm4.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_ss1.Caption := dmFormFunction.GetFormName('0','2','COMMONSS');
  lb_ss2.Caption := dmFormFunction.GetFormName('0','2','COMMONSS');
  lb_ss3.Caption := dmFormFunction.GetFormName('0','2','COMMONSS');
  lb_ss4.Caption := dmFormFunction.GetFormName('0','2','COMMONSS');

  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');

  Caption := dmFormFunction.GetFormName('2','1','BM4_021');
end;

procedure TfmAttendUpdate.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  FormNameSetting;
  LoadAttendWorkType(AttendWorkTypeCodeList,TComboBox(cmb_AttendWorkType),False);
  nIndex := AttendWorkTypeCodeList.IndexOf(AWCODE);
  cmb_AttendWorkType.ItemIndex := nIndex;
  cmb_AttendWorkTypeChange(cmb_AttendWorkType);
  nIndex := AttendCodeList.IndexOf(ATCODE);
  cmb_AttendCode.ItemIndex := nIndex;

  if InTime <> '' then
  begin
    ed_ATInTimeYear.Text := MakeDatetimeStr(copy(InTime,1,8));
    ed_ATInTimehh.Text := MakeDatetimeStr(copy(InTime,9,2));
    ed_ATInTimemm.Text := MakeDatetimeStr(copy(InTime,11,2));
    ed_ATInTimess.Text := MakeDatetimeStr(copy(InTime,13,2));
  end;
  if WorkOutTime <> '' then
  begin
    ed_ATWorkOutTimeYear.Text := MakeDatetimeStr(copy(WorkOutTime,1,8));
    ed_ATWorkOutTimehh.Text := MakeDatetimeStr(copy(WorkOutTime,9,2));
    ed_ATWorkOutTimemm.Text := MakeDatetimeStr(copy(WorkOutTime,11,2));
    ed_ATWorkOutTimess.Text := MakeDatetimeStr(copy(WorkOutTime,13,2));
  end;
  if WorkInTime <> '' then
  begin
    ed_ATWorkInTimeYear.Text := MakeDatetimeStr(copy(WorkInTime,1,8));
    ed_ATWorkInTimehh.Text := MakeDatetimeStr(copy(WorkInTime,9,2));
    ed_ATWorkInTimemm.Text := MakeDatetimeStr(copy(WorkInTime,11,2));
    ed_ATWorkInTimess.Text := MakeDatetimeStr(copy(WorkInTime,13,2));
  end;
  if OutTime <> '' then
  begin
    ed_ATOutTimeYear.Text := MakeDatetimeStr(copy(OutTime,1,8));
    ed_ATOutTimehh.Text := MakeDatetimeStr(copy(OutTime,9,2));
    ed_ATOutTimemm.Text := MakeDatetimeStr(copy(OutTime,11,2));
    ed_ATOutTimess.Text := MakeDatetimeStr(copy(OutTime,13,2));
  end;
end;

function TfmAttendUpdate.GetWorkTime(aWeekCode:integer;var aWorkStartTime:string;var aWorkEndTime:string;
  var aExtendTime:string;var aNightTime: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := false;
  aWorkStartTime := '';
  aWorkEndTime := '';
  aExtendTime := '';
  aNightTime := '';

  stSql := 'select * from TB_ATTENDCODE ';
  stSql := stSql + ' Where AW_CODE = ' + AWCODE + ' ';
  stSql := stSql + ' AND AT_ATCODE = ' + ATCODE + ' ';
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
      case aWeekCode of
        1 : begin  //일요일
          aWorkStartTime := FindField('AT_HWORKSTARTTIME').AsString;
          aWorkEndTime := FindField('AT_HWORKENDTIME').AsString;
          aExtendTime := FindField('AT_HEXTENDTIME').AsString;
          aNightTime := FindField('AT_HNIGHTTIME').AsString;
        end;
        7 : begin  //토요일
          aWorkStartTime := FindField('AT_SWORKSTARTTIME').AsString;
          aWorkEndTime := FindField('AT_SWORKENDTIME').AsString;
          aExtendTime := FindField('AT_SEXTENDTIME').AsString;
          aNightTime := FindField('AT_SNIGHTTIME').AsString;
        end;
        else begin  //평일
          aWorkStartTime := FindField('AT_WORKSTARTTIME').AsString;
          aWorkEndTime := FindField('AT_WORKENDTIME').AsString;
          aExtendTime := FindField('AT_EXTENDTIME').AsString;
          aNightTime := FindField('AT_NIGHTTIME').AsString;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmAttendUpdate.SaveAttendEvent: Boolean;
var
  stSql : string;
  dtAtDate: TDatetime;
  wYear    : word;
  wMonth   : word;
  wDay     : word;
  stWorkStartTime : string;
  stWorkEndTime : string;
  stExtendTime : string;
  stNightTime : string;
  nWeekCode : integer;
  nBeforWorkMM : integer;
  nWorkMM : integer;
  nExtendWorkMM : integer;
  nNightWorkMM : integer;
  nJiGakCount : integer;
  nJoTaeCount : integer;
  nBeforWorkCount : integer;
  nWorkCount : integer;
  nExtendWorkCount : integer;
  nNightWorkCount : integer;
  nTempTime : integer;
  stInResult : string;
  stOutResult : string;
begin
  wYear  := StrtoInt(Copy(ATDATE,1,4));
  wMonth := StrtoInt(Copy(ATDATE,5,2));
  wDay   := StrtoInt(Copy(ATDATE,7,2));
  dtAtDate:= EncodeDatetime(wYear, wMonth, wDay, 0, 0, 0,00);
  nWeekCode := DayOfWeek(dtAtDate);

  nWorkCount := 1;
  GetWorkTime(nWeekCode,stWorkStartTime,stWorkEndTime,stExtendTime,stNightTime);
  if (InTime <> '') and (stWorkStartTime <> '') then
  begin
    nJiGakCount := 0;
    if StrToInt64(copy(InTime,9,4)) <= StrToInt64(stWorkStartTime)  then stInResult := '1'
    else
    begin
      nJiGakCount := 1;
      stInResult := '2';
    end;
  end;
  if (OutTime <> '') and (stWorkEndTime <> '') then
  begin
    nBeforWorkMM := 0;
    nBeforWorkCount := 0;
    nExtendWorkMM := 0;
    nNightWorkMM := 0;
    nExtendWorkCount := 0;
    nNightWorkCount := 0;
    nJoTaeCount := 0;
    if isDigit(InTime) then
    begin
      nWorkMM := MakeWorkTime_Minute(copy(OutTime,9,4),copy(InTime,9,4),3);
    end;
    if StrToInt64(copy(OutTime,9,4)) >= StrToInt64(stWorkEndTime)  then
    begin
      stOutResult := '11';    //퇴근
      if isDigit(stExtendTime) then
      begin
        if stWorkStartTime  < stExtendTime then    //연장 근무 시간이 24시 이전이면
        begin
          if StrToInt64(copy(OutTime,9,4)) > StrToInt64(stExtendTime)  then //연장근무시간이 지났으면
          begin
            nExtendWorkMM := MakeWorkTime_Minute(copy(OutTime,9,4),stExtendTime,3);
            stOutResult := '13'; //연장근무
            nExtendWorkCount := 1;
          end;
        end else
        begin
          nTempTime := StrToInt64(copy(stExtendTime,1,2));
          stExtendTime := FillZeroNumber(nTempTime + 24,2) + copy(stExtendTime,3,2);
          if StrToInt64(copy(OutTime,9,4)) > StrToInt64(stExtendTime)  then //연장근무시간이 지났으면
          begin
            nExtendWorkMM := MakeWorkTime_Minute(copy(OutTime,9,4),stExtendTime,3);
            stOutResult := '13'; //연장근무
            nExtendWorkCount := 1;
          end;
        end;
      end;
      if isDigit(stNightTime) then
      begin
        if stWorkStartTime  < stNightTime then    //야간 근무 시간이 24시 이전이면
        begin
          if StrToInt64(copy(OutTime,9,4)) > StrToInt64(stNightTime)  then //야간근무시간이 지났으면
          begin
            nNightWorkMM := MakeWorkTime_Minute(copy(OutTime,9,4),stNightTime,3);
            stOutResult := '14'; //야간근무
            nExtendWorkCount := 0;
            nNightWorkCount := 1;
          end;
        end else
        begin
          nTempTime := StrToInt64(copy(stNightTime,1,2));
          stNightTime := FillZeroNumber(nTempTime + 24,2) + copy(stNightTime,3,2);
          if StrToInt64(copy(OutTime,9,4)) > StrToInt64(stNightTime)  then //연장근무시간이 지났으면
          begin
            nExtendWorkMM := MakeWorkTime_Minute(copy(OutTime,9,4),stNightTime,3);
            stOutResult := '14'; //야간근무
            nExtendWorkCount := 0;
            nNightWorkCount := 1;
          end;
        end;
      end;
    end
    else
    begin
      nJoTaeCount := 1;
      stOutResult := '12'; //조퇴
    end;
  end;

  stSql := 'Update TB_ATTENDEVENT Set ';
  stSql := stSql + ' AE_WORKCOUNT = ' + inttostr(nWorkCount) + ' ';
  stSql := stSql + ', AE_ATINTIME = ''' + InTime + ''' ';
  stSql := stSql + ', AE_ATOUTTIME = ''' + OutTime + ''' ';
  stSql := stSql + ', AE_ATINRESULT = ' + stInResult + ' ';
  stSql := stSql + ', AE_ATOUTRESULT = ' + stOutResult + ' ';
  stSql := stSql + ', AE_WORKMM = ' + inttostr(nWorkMM) + ' ';
  stSql := stSql + ', AE_EXTENDWORKMM = ' + inttostr(nExtendWorkMM) + ' ';
  stSql := stSql + ', AE_NIGHTWORKMM = ' + inttostr(nNightWorkMM) + ' ';
  stSql := stSql + ', AE_JIGAKCOUNT = ' + inttostr(nJiGakCount) + ' ';
  stSql := stSql + ', AE_JOTAECOUNT = ' + inttostr(nJoTaeCount) + ' ';
  stSql := stSql + ', AE_EXTENDWORKCOUNT = ' + inttostr(nExtendWorkCount) + ' ';
  stSql := stSql + ', AE_NIGHTWORKCOUNT = ' + inttostr(nNightWorkCount) + ' ';
  if ATCODEChange or AWCODEChange then
  begin
    stSql := stSql + ', AW_CODE = ' + AWCODE + ' ';
    stSql := stSql + ', AT_ATCODE = ' + ATCODE + ' ';
    stSql := stSql + ', AE_WORKSTARTTIME = ''' + stWorkStartTime + ''' ';
    stSql := stSql + ', AE_WORKENDTIME = ''' + stWorkEndTime + ''' ';
    stSql := stSql + ', AE_ATTYPEUSER = ''' + G_stAdminUserID + ''' ';
  end;
  if InTimeChange then stSql := stSql + ', AE_INUSER = ''' + G_stAdminUserID + ''' ';
  if WorkOutTimeChange then stSql := stSql + ', AE_WORKOUTUSER = ''' + G_stAdminUserID + ''' ';
  if WorkInTimeChange then stSql := stSql + ', AE_WORKINUSER = ''' + G_stAdminUserID + ''' ';
  if OutTimeChange then stSql := stSql + ', AE_OUTUSER = ''' + G_stAdminUserID + ''' ';
  stSql := stSql + ' Where AT_DATE = ''' + ATDATE + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + EmSeq + ' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

procedure TfmAttendUpdate.SetATCODE(const Value: string);
begin
  if FATCODE = Value then Exit;
  FATCODE := Value;
  if Init then Exit;
  ATCODEChange := True;
  DataChange := True;
end;

procedure TfmAttendUpdate.SetAWCODE(const Value: string);
begin
  if FAWCODE = Value then Exit;
  FAWCODE := Value;
  if Init then Exit;
  AWCODEChange := True;
  DataChange := True;
end;

procedure TfmAttendUpdate.SetInTime(const Value: string);
begin
  if FInTime = Value then Exit;
  FInTime := Value;
  if Init then Exit;
  InTimeChange := True;
  DataChange := True;
end;

procedure TfmAttendUpdate.SetOutTime(const Value: string);
begin
  if FOutTime = Value then Exit;
  FOutTime := Value;
  if Init then Exit;
  OutTimeChange := True;
  DataChange := True;
end;

procedure TfmAttendUpdate.SetWorkInTime(const Value: string);
begin
  if FWorkInTime = Value then Exit;
  FWorkInTime := Value;
  if Init then Exit;
  WorkInTimeChange := True;
  DataChange := True;
end;

procedure TfmAttendUpdate.SetWorkOutTime(const Value: string);
begin
  if FWorkOutTime = Value then Exit;
  FWorkOutTime := Value;
  if Init then Exit;
  WorkOutTimeChange := True;
  DataChange := True;
end;

end.
