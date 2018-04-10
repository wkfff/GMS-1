﻿unit uAttendAbsentReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls, AdvSplitter, AdvPanel, Vcl.ImgList,
  AdvOfficeButtons, AdvGroupBox,Data.DB,Vcl.Imaging.jpeg, AdvSmoothTabPager,
  ToolPanels, AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers,
  AdvGlowButton, AdvOfficePager, AdvAppStyler, AdvOfficePagerStylers,
  Vcl.Imaging.pngimage,DateUtils, AdvProgressBar,Winapi.ShellAPI, AdvCombo;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmAttendAbsentReport = class(TfmASubForm)
    BodyPanel: TW7Panel;
    pm_Work: TPopupMenu;
    AdvSmoothPanel1: TAdvSmoothPanel;
    pan_EmployeeList: TAdvSmoothPanel;
    AdvSmoothPanel2: TAdvSmoothPanel;
    sg_EmployeeList: TAdvStringGrid;
    MenuImageList16: TImageList;
    pm_EmployeeAdd: TMenuItem;
    OpenDialog1: TOpenDialog;
    ed_SearchName: TAdvEdit;
    lb_EtcDetail: TAdvSmoothLabel;
    ed_SerchSelectLectureCode: TAdvEdit;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_SearchCount1: TAdvSmoothLabel;
    lb_SearchCount: TAdvSmoothLabel;
    lb_Count1: TAdvSmoothLabel;
    SaveDialog1: TSaveDialog;
    ProgressBar2: TProgressBar;
    pan_Message: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    AdvProgressBar1: TAdvProgressBar;
    btn_AccessConfirm: TAdvGlassButton;
    SearchTimer: TTimer;
    AdvSmoothLabel1: TAdvSmoothLabel;
    ed_SearchPhone: TAdvEdit;
    dt_FromDate: TDateTimePicker;
    AdvSmoothLabel3: TAdvSmoothLabel;
    dt_ToDate: TDateTimePicker;
    AdvSmoothLabel4: TAdvSmoothLabel;
    lb_Search: TLabel;
    btn_MakeLessonSelect: TAdvGlowButton;
    pan_MakeLesson: TAdvSmoothPanel;
    Label1: TLabel;
    AdvSmoothLabel5: TAdvSmoothLabel;
    cmb_State: TAdvComboBox;
    AdvSmoothLabel6: TAdvSmoothLabel;
    ed_MaktLessonTime: TAdvEdit;
    AdvSmoothLabel7: TAdvSmoothLabel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ed_CompanyNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure pan_EmployeeListResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_SaveMouseEnter(Sender: TObject);
    procedure btn_SaveMouseLeave(Sender: TObject);
    procedure Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sg_EmployeeListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_emPermitAdminMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_PositionInfoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_AccessConfirmClick(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure btn_LectureCompleteClick(Sender: TObject);
    procedure btn_LectureCancelClick(Sender: TObject);
    procedure pan_employeeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ed_SearchNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_MakeLessonSelectClick(Sender: TObject);
    procedure pan_MakeLessonMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    DragOrigin: TPoint;
    MouseDowning : BOOLEAN;
  private
    L_stMenuID : string;
    L_stAllName : string;
    L_stButtonCloseCaption : string;
    L_stDeleteCaption : string;
    L_stEmCodeCaption : string;
    L_stEmCompanyPhoneCaption : string;
    L_stEmEtcCaption : string;
    L_stEmHandPhoneCaption : string;
    L_stEmNameCaption : string;
    L_stCardNoCaption : string;
    L_stFingerTemplate1_1 : string;
    L_stFingerTemplate1_2 : string;
    L_stWork : string;
    L_nEmployeeCheckCount : integer;             //
    CardGubunCodeList :TStringList;
    CardSearchStateCodeList :TStringList;
    CardStateCodeList :TStringList;
    EmployeeGubunCodeList : TStringList;
    EmployeeGubunSearchCodeList : TStringList;
    EmployeeStateCodeList : TStringList;
    PosiCodeList : TStringList;
    PosiSearchCodeList : TStringList;
    WorkCardGubunCodeList :TStringList;
    WorkCardStateCodeList :TStringList;
    AddCardNoList : TStringList; //추가되는 카드번호 리스트를 가지고 있자
    ChangeCardNoList : TStringList; //변경되는 카드번호 리스트를 가지고 있자
    DeleteCardNoList : TStringList; //삭제 카드 리스트를 가지고 있자
    BuildingArmAreaCodeList : TStringList; //빌딩별 방범구역 코드 리스트를 가지고 있자.
    BuildingDoorCodeList : TStringList; //빌딩별 출입문 코드 리스트를 가지고 있자.
    TuitionOffCodeList : TStringList;
    procedure FormNameSetting;
    procedure SearchEmployeeList(aCode:string;aTopRow:integer = 0);
  private
    L_bFormClose : Boolean;
    L_bSearchBreak : Boolean;
    L_bSearchEnd : Boolean;
    FFingerDeviceType: Boolean;
    FFingerDeviceID: integer;
    FFingerUserID: String;
    FFingerEMSeq: integer;
    FFingerDeviceSeq: integer;
    FFingerDeviceIP: string;
    { Private declarations }

    function JpegStartsInBlob(PicField:TBlobField):integer;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    procedure FormSearchEnable(aEnabled:Boolean);
    procedure Form_Close;
    procedure FontSetting;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
    procedure CardRegistEvent(aCardNo:string);
  public
    property FingerDeviceID : integer read FFingerDeviceID write FFingerDeviceID;
    property FingerDeviceSeq : integer read FFingerDeviceSeq write FFingerDeviceSeq;
    property FingerDeviceIP : string read FFingerDeviceIP write FFingerDeviceIP;
    property FingerUserID : String read FFingerUserID write FFingerUserID;
    property FingerEMSeq : integer read FFingerEMSeq write FFingerEMSeq;
  end;

var
  fmAttendAbsentReport: TfmAttendAbsentReport;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uEmployeeRelay,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDBDelete,
  uDBCardPermit,
  uDBSelect,
  uSupremaFinger,
  uFingerVariable,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmAttendAbsentReport.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmAttendAbsentReport.btn_AccessConfirmClick(Sender: TObject);
begin
  inherited;
  L_bSearchBreak := True;
  Pan_Message.Visible := False;

end;

procedure TfmAttendAbsentReport.btn_CancelClick(Sender: TObject);
begin
  inherited;
  pan_MakeLesson.Visible := False;
  sg_EmployeeList.Enabled := True;
end;

procedure TfmAttendAbsentReport.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmAttendAbsentReport.btn_LectureCancelClick(Sender: TObject);
var
  i : integer;
  bCheckState : Boolean;
  stLectureSeq : string;
  stEmSeq : string;
begin
  inherited;
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage(dmFormMessage.GetMessage('NOTSELECTEMPLOYEE'));
    Exit;
  end;
  Try
    with sg_EmployeeList do
    begin
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          stEmSeq := cells[5,i];
          stLectureSeq := cells[6,i];
          dmDBUpdate.UpdateTB_EMPLOYEELecture_Field_IntValue(stEmSeq,stLectureSeq,'EL_STATE','2');
          dmDBUpdate.UpdateTB_EMPLOYEELecture_Field_StringValue(stEmSeq,stLectureSeq,'EL_ENDDATE',formatDateTime('yyyymmdd',now));
          dmDBInsert.InsertIntoTB_EMPLOYEELectureHIS_Value(stEmSeq,stLectureSeq,Cells[7,i],'','2',FormatDateTime('yyyymmdd',now),'');
        end;
        Application.ProcessMessages;
      end;
    end;
  Finally
  End;
end;

procedure TfmAttendAbsentReport.btn_LectureCompleteClick(Sender: TObject);
var
  i : integer;
  bCheckState : Boolean;
  stLectureSeq : string;
  stEmSeq : string;
begin
  inherited;
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage(dmFormMessage.GetMessage('NOTSELECTEMPLOYEE'));
    Exit;
  end;
  Try
    with sg_EmployeeList do
    begin
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          stEmSeq := cells[5,i];
          stLectureSeq := cells[6,i];
          dmDBUpdate.UpdateTB_EMPLOYEELecture_Field_IntValue(stEmSeq,stLectureSeq,'EL_STATE','3');
          dmDBUpdate.UpdateTB_EMPLOYEELecture_Field_StringValue(stEmSeq,stLectureSeq,'EL_ENDDATE',formatDateTime('yyyymmdd',now));
          dmDBInsert.InsertIntoTB_EMPLOYEELectureHIS_Value(stEmSeq,stLectureSeq,Cells[7,i],'','3',FormatDateTime('yyyymmdd',now),'');
        end;
        Application.ProcessMessages;
      end;
    end;
  Finally
  End;

end;

procedure TfmAttendAbsentReport.btn_MakeLessonSelectClick(Sender: TObject);
begin
  inherited;
  if L_nEmployeeCheckCount < 1 then
  begin
    showmessage('보강신청 할 학생을 선택하여 주세요.');
    Exit;
  end;
  pan_MakeLesson.Visible := True;
  sg_EmployeeList.Enabled := False;
end;

procedure TfmAttendAbsentReport.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

procedure TfmAttendAbsentReport.btn_SaveClick(Sender: TObject);
var
  stState : string;
  i : integer;
  bCheckState : Boolean;
  stDate,stEmSeq : string;
  nSeq : integer;
begin
  inherited;
  if Not isDigit(ed_MaktLessonTime.Text) then ed_MaktLessonTime.Text := '0';

  stState := inttostr(cmb_State.ItemIndex+2);
  with sg_EmployeeList do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        stDate := cells[6,i];
        stEmSeq := cells[7,i];
        nSeq := dmDBFunction.GetNextTB_ACademyAttendMakeupLesson_Seq(stDate,stEmSeq);
        dmDBInsert.InsertIntoTB_ACademyAttendMakeupLesson_Value(stDate,stEmSeq,inttostr(nSeq),ed_MaktLessonTime.Text);
        dmDBUpdate.UpdateTB_ACademyAttendSummary_Field_IntValue(stDate,stEmSeq,'AS_ATTYPE',stState);
      end;
      Application.ProcessMessages;
    end;
  end;
  pan_MakeLesson.Visible := False;
  sg_EmployeeList.Enabled := True;
  SearchEmployeeList('');
end;

procedure TfmAttendAbsentReport.btn_SaveMouseEnter(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clYellow;
end;

procedure TfmAttendAbsentReport.btn_SaveMouseLeave(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clGray;
end;

procedure TfmAttendAbsentReport.CardRegistEvent(aCardNo: string);
begin

end;


procedure TfmAttendAbsentReport.ed_CompanyNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
  end;
end;

procedure TfmAttendAbsentReport.ed_SearchNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  SearchEmployeeList('');
end;

procedure TfmAttendAbsentReport.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmAttendAbsentReport.FormChangeEvent(aNumber: integer);
var
  stSelectCode1 : string;
  stSelectCode2 : string;
  nIndex : integer;
begin
  case aNumber of
    con_FormBMOSCOMPANYCODE : begin
    end;
    con_FormBMOSBUILDINGCODE : begin
//      LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
    end;
    con_FormBMOSPOSICODE : begin

    end;
    con_FormBMOSEMPLOYEEGUBUN : begin
    end;

  end;
end;

procedure TfmAttendAbsentReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dmSupremaFinger.Connected then
  begin
    dmSupremaFinger.SocketOPEN := False;
  end;
  //dmSupremaFinger.Free;
  L_bFormClose := True;
  L_bSearchBreak := True;
  Delay(1000);

  PosiCodeList.Free;
  PosiSearchCodeList.Free;
  EmployeeGubunCodeList.Free;
  EmployeeGubunSearchCodeList.Free;
  EmployeeStateCodeList.Free;
  CardGubunCodeList.Free;
  WorkCardGubunCodeList.Free;
  WorkCardStateCodeList.Free;
  AddCardNoList.Free;
  ChangeCardNoList.Free;
  CardStateCodeList.Free;
  CardSearchStateCodeList.Free;
  DeleteCardNoList.Free;
  BuildingDoorCodeList.Free;
  BuildingArmAreaCodeList.Free;
  TuitionOffCodeList.Free;

  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'FALSE');

  Action := caFree;
end;

procedure TfmAttendAbsentReport.FormCreate(Sender: TObject);
begin
  inherited;
  PosiCodeList := TStringList.Create;
  PosiSearchCodeList := TStringList.Create;
  EmployeeGubunCodeList:= TStringList.Create;
  EmployeeGubunSearchCodeList := TStringList.Create;
  EmployeeStateCodeList := TStringList.Create;
  CardGubunCodeList := TStringList.Create;
  WorkCardGubunCodeList := TStringList.Create;
  WorkCardStateCodeList := TStringList.Create;
  AddCardNoList := TStringList.Create;
  ChangeCardNoList:= TStringList.Create;
  CardStateCodeList := TStringList.Create;
  CardSearchStateCodeList := TStringList.Create;
  DeleteCardNoList := TStringList.Create;
  BuildingDoorCodeList := TStringList.Create;
  BuildingArmAreaCodeList := TStringList.Create;

  TuitionOffCodeList := TStringList.Create;
  FontSetting;
  L_bSearchEnd := True;

  dt_FromDate.Date := Now - 30;
  dt_ToDate.Date := Now ;
  //dmSupremaFinger := TdmSupremaFinger.Create(nil);

end;

procedure TfmAttendAbsentReport.FormGradeRefresh;
begin
end;

procedure TfmAttendAbsentReport.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmAttendAbsentReport.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');


  L_stDeleteCaption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stCardNoCaption := dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');

  L_stEmCodeCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  L_stEmNameCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  L_stEmHandPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  L_stEmCompanyPhoneCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  L_stEmEtcCaption:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  lb_Count1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  lb_SearchCount1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
end;

procedure TfmAttendAbsentReport.FormResize(Sender: TObject);
begin
  inherited;

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

  pan_Message.Left := (Width div 2) - (pan_Message.Width div 2);
  pan_Message.Top := (Height div 2) - (pan_Message.Height div 2);


  pan_MakeLesson.Left := (Width div 2) - (pan_MakeLesson.Width div 2);
  pan_MakeLesson.Top := (Height div 2) - (pan_MakeLesson.Height div 2);

  pan_EmployeeListResize(pan_EmployeeList);

end;

procedure TfmAttendAbsentReport.FormSearchEnable(aEnabled: Boolean);
begin
end;

procedure TfmAttendAbsentReport.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'TRUE');

  if L_bFormClose or G_bApplicationTerminate then Exit;

  SearchEmployeeList('');  //tv_ListClick 에서 먼저 조회 함
end;

procedure TfmAttendAbsentReport.Form_Close;
begin
  Close;
end;

function TfmAttendAbsentReport.JpegStartsInBlob(PicField: TBlobField): integer;
var
  bS : TADOBlobStream;
  buffer : Word;
  hx : string;
begin
  Result := -1;
  bS := TADOBlobStream.Create(PicField, bmRead);
  try
    while (Result = -1) and
      (bS.Position + 1 < bS.Size) do
    begin
      bS.ReadBuffer(buffer, 1);
      hx:=IntToHex(buffer, 2);
      if hx = 'FF' then begin
        bS.ReadBuffer(buffer, 1);
        hx:=IntToHex(buffer, 2);
        if hx = 'D8' then Result := bS.Position - 2
        else if hx = 'FF' then
        bS.Position := bS.Position-1;
      end; //if
    end; //while
  finally
    bS.Free
  end; //try
end;

procedure TfmAttendAbsentReport.Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
(*    if (Button = mbLeft) and (MouseDowning = False) then
    begin
        // DRAG POINT 저장
        DragOrigin := Point (X,Y);
        // MOUSE DOWN = TRUE 설정
        MouseDowning := True;
    end;
*)
end;

procedure TfmAttendAbsentReport.Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
(*  inherited;
    // MOUSE DOWN = TRUE CHECK
    if (MouseDowning = True) then
    begin
        // IMAGE TOP 위치 설정
        (Sender as TAdvSmoothPanel).Top := (Sender as TAdvSmoothPanel).Top + Y - DragOrigin.Y;
        // IMAGE LEFT 위치 설정
        (Sender as TAdvSmoothPanel).Left := (Sender as TAdvSmoothPanel).Left + X - DragOrigin.X;
    end;
 *)
end;

procedure TfmAttendAbsentReport.Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = FALSE 설정
//    MouseDowning := False;
end;

procedure TfmAttendAbsentReport.pan_emPermitAdminMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);

end;

procedure TfmAttendAbsentReport.pan_EmployeeListResize(Sender: TObject);
begin
  inherited;
  sg_EmployeeList.Width := pan_EmployeeList.Width - sg_EmployeeList.Left - 20;
  sg_EmployeeList.Height := pan_EmployeeList.Height - sg_EmployeeList.Top - 50;

end;

procedure TfmAttendAbsentReport.pan_employeeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);

end;

procedure TfmAttendAbsentReport.pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmAttendAbsentReport.pan_MakeLessonMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmAttendAbsentReport.pan_PositionInfoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
(* ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
 *)
end;




procedure TfmAttendAbsentReport.SearchEmployeeList(aCode: string; aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stTemp : string;
begin

  L_nEmployeeCheckCount := 0;
  sg_EmployeeList.Enabled := True;
  GridInit(sg_EmployeeList,6,2,True);

  stSql := ' Select a.*,b.EM_NAME,b.EM_BIRTHDAY,b.EM_REGDATE,b.EM_HANDPHONE,b.EM_COMPANYPHONE,b.EM_SCHOOL ';
  stSql := stSql + ' from TB_ACademyAttendSummary a ';
  stSql := stSql + ' inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON (a.EM_SEQ = b.EM_SEQ ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AS_DATE BETWEEN ''' + formatDateTime('yyyymmdd',dt_FromDate.Date) + ''' and ''' + formatDateTime('yyyymmdd',dt_ToDate.Date) + '''';
  stSql := stSql + ' AND a.AS_ATTYPE > -1 ';
  stSql := stSql + ' AND (a.AS_ATTYPE = 0 OR a.AS_ATTYPE = 2)';
  if ed_SearchName.Text <> '' then
    stSql := stSql + ' AND b.EM_NAME Like N''%' + ed_SearchName.Text + '%'' ';
  if ed_SearchPhone.Text <> '' then
    stSql := stSql + ' AND (b.EM_HANDPHONE Like ''%' + ed_SearchPhone.Text + '%'' OR b.EM_COMPANYPHONE Like ''%' + ed_SearchPhone.Text + '%'' ) ';
  stSql := stSql + ' Order by a.AS_DATE,b.EM_NAME ';

  Try
    if (G_nFormEnable = 1) then FormSearchEnable(False);
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

       pan_Message.Visible := G_bDataLoadingView;
      AdvProgressBar1.Max := recordcount;
      AdvProgressBar1.Position := 0;
      with sg_EmployeeList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          if L_bSearchBreak then
          begin
            Exit;
          end;
          if L_bFormClose or G_bApplicationTerminate then Exit;

(*
날짜
이름
등원상태
등원시간
하원시간
*)
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := MakeDateTimeStr(FindField('AS_DATE').AsString);        //날짜
          cells[2,nRow] := FindField('EM_NAME').AsString;        //학생명

          case FindField('AS_ATTYPE').AsInteger of
            0 : begin
              cells[3,nRow] := '미등원';
            end;
            1 : begin
              cells[3,nRow] := '등원';
            end;
            2 : begin
              cells[3,nRow] := '부분보강';
            end;
            3 : begin
              cells[3,nRow] := '보강완료';
            end;
          end;
          cells[4,nRow] := MakePhoneNumber(FindField('EM_HANDPHONE').AsString);    //등원시간
          cells[5,nRow] := MakePhoneNumber(FindField('EM_COMPANYPHONE').AsString);    //하원시간
          cells[6,nRow] := FindField('AS_DATE').AsString;
          cells[7,nRow] := FindField('EM_SEQ').AsString;

          nRow := nRow + 1;
          Application.ProcessMessages;
          Next;
        end;
      end;

    end;
  Finally
    L_bSearchEnd := True;
    FormSearchEnable(True);
    pan_Message.Visible := False;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;


procedure TfmAttendAbsentReport.SearchTimerTimer(Sender: TObject);
begin
  inherited;
  SearchTimer.Enabled := False;
end;


procedure TfmAttendAbsentReport.sg_EmployeeListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nEmployeeCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nEmployeeCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nEmployeeCheckCount := L_nEmployeeCheckCount + 1
    else L_nEmployeeCheckCount := L_nEmployeeCheckCount - 1 ;
  end;

end;

initialization
  RegisterClass(TfmAttendAbsentReport);
Finalization
  UnRegisterClass(TfmAttendAbsentReport);

end.
