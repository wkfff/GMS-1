﻿unit uAttendManger;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, W7Classes, W7Panels, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvSmoothPanel, Vcl.ExtCtrls, AdvSmoothLabel,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvToolBtn,ADODB,ActiveX, uSubForm, CommandArray, AdvCombo, AdvGroupBox,
  Vcl.Mask, AdvSpin, AdvOfficeButtons, AdvPanel, Vcl.ComCtrls, AdvListV,
  Vcl.ImgList, Vcl.Menus, AdvMenus, AdvExplorerTreeview, paramtreeview,
  System.iniFiles, Vcl.Samples.Gauges,
  AdvSmoothTabPager, AdvGlassButton, AdvEdBtn, AdvToolBar, AdvToolBarStylers,
  Vcl.Imaging.pngimage, AdvGlowButton, AdvOfficePager, AdvOfficePagerStylers,
  AdvAppStyler;


const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmAttendManger = class(TfmASubForm)
    Image1: TImage;
    BodyPanel: TAdvSmoothPanel;
    lb_SearchETCName: TAdvSmoothLabel;
    ImageList1: TImageList;
    pop_Menu: TAdvPopupMenu;
    mn_Update: TMenuItem;
    toolslist: TImageList;
    ed_name: TAdvEdit;
    SaveDialog1: TSaveDialog;
    AdvSmoothLabel2: TAdvSmoothLabel;
    dt_endDate: TDateTimePicker;
    dt_StartDate: TDateTimePicker;
    cmb_Posi: TAdvComboBox;
    cmb_EmpGubun: TAdvComboBox;
    lb_EtcSearch: TAdvSmoothLabel;
    cmb_ETC: TAdvComboBox;
    eb_CompanyName: TAdvEditBtn;
    ed_CompanyCode: TAdvEdit;
    ed_BuildingCode: TAdvEdit;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    sg_report: TAdvStringGrid;
    tv_AddCompanyCode: TTreeView;
    MenuImageList16: TImageList;
    lb_SearchDate: TAdvSmoothLabel;
    lb_CompanyName: TAdvSmoothLabel;
    lb_PosiName: TAdvSmoothLabel;
    lb_empType: TAdvSmoothLabel;
    btn_Search: TAdvGlowButton;
    btn_Add: TAdvGlowButton;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    tv_AddCompanyName: TTreeView;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    btn_Update: TAdvGlowButton;
    lb_list: TAdvSmoothLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_AddNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ed_nameKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure cmb_ETCChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sg_reportColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure btn_SearchClick(Sender: TObject);
    procedure eb_CompanyNameClickBtn(Sender: TObject);
    procedure tv_AddCompanyNameDblClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure ed_nameChange(Sender: TObject);
    procedure cmb_EmpGubunChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure eb_CompanyNameChange(Sender: TObject);
    procedure dt_StartDateCloseUp(Sender: TObject);
    procedure dt_endDateCloseUp(Sender: TObject);
    procedure sg_reportClick(Sender: TObject);
    procedure mn_UpdateClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure sg_reportMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg_reportDblClick(Sender: TObject);
  private
    L_stMenuID : string;
    L_stCloseCaption : string;
    L_stAllName : string;
    BuildingCodeList : TStringList;
    CardStateList : TStringList;
    CompanyCodeList : TStringList;
    DoorCodeList : TStringList;
    PosiCodeList : TStringList;
    EmployeeGubunCodeList : TStringList;
    ReportHeaderNameList : TStringList;
    ReportFieldNameList : TStringList;
    L_nMaxReportColCount : integer;
    L_nShowCount : integer;
    L_arrAttendReportIndexArray:Array of integer; //출입이벤트 리스트 순서 배열
    L_arrRelAttendReportIndexArray:Array of integer; //출입이벤트 실제 위치
    L_arrAttendReportShowTable : Array of integer;  //출입이벤트 조회 항목테이블
    L_arrAttendReportSizeTable : Array of integer;
    FATChange: Boolean;  //출입이벤트 Cell Size
    { Private declarations }
    function AttendReportHeaderNameSetting(aList: TAdvStringGrid):Boolean;
    function AttendReportFieldNameSetting:Boolean;
    procedure ChangeAttendReportIndex(FromIndex,ToIndex:integer);
    Function FormComboBoxInitialize:Boolean;
    Function FormGridInitialize:Boolean;
    Function FormNameSetting:Boolean;
    procedure FontSetting;
    Function MemoryCreate : Boolean;
    Function MemoryFree:Boolean;
    Function SearchReport(aTopRow:integer=0;aRow:integer=0):Boolean;
    function ReportCellHide(aList:TAdvStringGrid):Boolean;
    function ReportConfigRead:Boolean;
    function ReportHeaderNameSetting:Boolean;
    function WriteIniConfig:Boolean;
    procedure SetATChange(const Value: Boolean);

  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  public
    property ATChange : Boolean read FATChange write SetATChange;
  end;

var
  fmAttendManger: TfmAttendManger;

implementation
uses
  uAttendUpdate,
  uCommonFunction,
  uCommonVariable,
  uComboBoxCodeLoad,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBSelect,
  uFormFunction,
  uFormVariable,
  uFormUtil,
  uMain;

{$R *.dfm}


function TfmAttendManger.AttendReportFieldNameSetting: Boolean;
begin
  ReportFieldNameList.Clear;
  ReportFieldNameList.Add('AT_DATE');          //0
  if G_nReportCompanyStep > 0 then ReportFieldNameList.Add('COMPANYNAME1');
  if G_nReportCompanyStep > 1 then ReportFieldNameList.Add('COMPANYNAME2');
  if G_nReportCompanyStep > 2 then ReportFieldNameList.Add('COMPANYNAME3');
  if G_nReportCompanyStep > 3 then ReportFieldNameList.Add('COMPANYNAME4');
  if G_nReportCompanyStep > 4 then ReportFieldNameList.Add('COMPANYNAME5');
  if G_nReportCompanyStep > 5 then ReportFieldNameList.Add('COMPANYNAME6');
  if G_nReportCompanyStep > 6 then ReportFieldNameList.Add('COMPANYNAME7');
  ReportFieldNameList.Add('PO_POSICODENAME');  //4
  ReportFieldNameList.Add('EM_CODE');          //5
  ReportFieldNameList.Add('EM_NAME');          //6
  ReportFieldNameList.Add('AW_NAME');          //7
  ReportFieldNameList.Add('AT_CODENAME');      //8
  ReportFieldNameList.Add('AE_ATINTIME');      //9
  ReportFieldNameList.Add('AE_ATWORKOUTTIME'); //10
  ReportFieldNameList.Add('AE_ATWORKINTIME');  //11
  ReportFieldNameList.Add('AE_ATOUTTIME');     //12
  ReportFieldNameList.Add('EM_SEQ');           //13
  ReportFieldNameList.Add('AW_CODE');          //14근태타입
  ReportFieldNameList.Add('AT_ATCODE');        //15근태코드
  ReportFieldNameList.Add('AE_ATTYPEUSER');    //16근태타입 수정자
  ReportFieldNameList.Add('AE_INUSER');        //17출근 수정자
  ReportFieldNameList.Add('AE_WORKOUTUSER');   //18외출 수정자
  ReportFieldNameList.Add('AE_WORKINUSER');    //19복귀 수정자
  ReportFieldNameList.Add('AE_OUTUSER');       //20퇴근 수정자

end;

function TfmAttendManger.AttendReportHeaderNameSetting(
  aList: TAdvStringGrid): Boolean;
var
  i : integer;
begin
  aList.ColCount := ReportHeaderNameList.Count;
  for i := LOW(L_arrAttendReportIndexArray) to HIGH(L_arrAttendReportIndexArray) do
  begin
    if (aList.ColCount - 1) < i then Exit;
    if (ReportHeaderNameList.Count - 1) < i then Exit;

    aList.cells[L_arrAttendReportIndexArray[i],0] := ReportHeaderNameList[i];
  end;

end;

procedure TfmAttendManger.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmAttendManger.btn_CancelClick(Sender: TObject);
begin
  ATChange := False;
  SearchReport;
end;

procedure TfmAttendManger.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmAttendManger.btn_SaveClick(Sender: TObject);
begin
  sg_Report.Print;
end;

procedure TfmAttendManger.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchReport;
end;

procedure TfmAttendManger.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  mn_UpdateClick(mn_Update);
end;

procedure TfmAttendManger.ChangeAttendReportIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelAttendReportIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelAttendReportIndexArray[i] := L_arrRelAttendReportIndexArray[i - 1];
    end;
    L_arrRelAttendReportIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelAttendReportIndexArray[i] := L_arrRelAttendReportIndexArray[i + 1];
    end;
    L_arrRelAttendReportIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelAttendReportIndexArray) to HIGH(L_arrRelAttendReportIndexArray) do
  begin
    L_arrAttendReportIndexArray[L_arrRelAttendReportIndexArray[i]] := i;
  end;

end;

procedure TfmAttendManger.cmb_EmpGubunChange(Sender: TObject);
begin
  inherited;
  btn_SearchClick(btn_Search);
end;

procedure TfmAttendManger.cmb_ETCChange(Sender: TObject);
begin
  inherited;
  lb_SearchETCName.Caption.Text := cmb_ETC.Text;
//  btn_SearchClick(btn_Search);
end;

procedure TfmAttendManger.cmb_PosiChange(Sender: TObject);
begin
  inherited;
  btn_SearchClick(btn_Search);
end;

procedure TfmAttendManger.dt_endDateCloseUp(Sender: TObject);
begin
  inherited;
  btn_SearchClick(btn_Search);

end;

procedure TfmAttendManger.dt_StartDateCloseUp(Sender: TObject);
begin
  inherited;
  btn_SearchClick(btn_Search);
end;

procedure TfmAttendManger.eb_CompanyNameChange(Sender: TObject);
begin
  inherited;
  btn_SearchClick(btn_Search);
end;

procedure TfmAttendManger.eb_CompanyNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_AddCompanyName.Visible := True;
  tv_AddCompanyName.Top := eb_CompanyName.Top + eb_CompanyName.Height;
  tv_AddCompanyName.Left := eb_CompanyName.Left;

end;

procedure TfmAttendManger.ed_AddNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfmAttendManger.ed_nameChange(Sender: TObject);
begin
  inherited;
  btn_SearchClick(btn_Search);
end;

procedure TfmAttendManger.ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
  end;

end;

procedure TfmAttendManger.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
  *)
end;

procedure TfmAttendManger.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfmAttendManger.FormChangeEvent(aFormName: integer);
begin
end;

procedure TfmAttendManger.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //WriteIniConfig;

  fmMain.FORMENABLE(con_FormBMOSATREPORT,'FALSE');

  MemoryFree;
  Action := caFree;
end;

function TfmAttendManger.FormComboBoxInitialize: Boolean;
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
begin
  stCompanyCode := copy(ed_CompanyCode.Text,1,1 + G_nCompanyCodeLength);
  LoadPosiCode(stCompanyCode,PosiCodeList,TComboBox(cmb_Posi),True,L_stAllName);
  LoadEmployeeGubunCode(EmployeeGubunCodeList,TComboBox(cmb_EmpGubun),True,L_stAllName);
  LoadSearchETC(cmb_ETC);

  cmb_ETC.ItemIndex := 0;
  lb_SearchETCName.Caption.Text := cmb_ETC.Text;

end;

procedure TfmAttendManger.FormCreate(Sender: TObject);
begin

  dt_StartDate.Date := Now;
  dt_endDate.Date := now;

  MemoryCreate;
  FontSetting;
  ATChange := False;
end;


procedure TfmAttendManger.FormGradeRefresh;
begin

end;

function TfmAttendManger.FormGridInitialize: Boolean;
begin
  GridInitialize(sg_Report);
  ReportCellHide(sg_Report);
end;

procedure TfmAttendManger.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmAttendManger.FormNameSetting: Boolean;
var
  i : integer;
begin
  ReportHeaderNameSetting;

  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','COMMONREPORT');
  lb_List.Caption.Text := dmFormFunction.GetFormName('2','1','BM4_021');
  lb_SearchDate.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHDATE');

  lb_CompanyName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  lb_PosiName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSINAME');
  lb_empType.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGUBUN');
  lb_EtcSearch.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONETCNAME');

  L_stCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');

  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');
  btn_Add.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  btn_Update.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  mn_Update.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
end;

procedure TfmAttendManger.FormResize(Sender: TObject);
begin
  inherited;

  sg_report.Height := BodyPanel.Height - (btn_Search.Top + btn_Search.Height + 10);
  sg_report.Left := 5;
  sg_report.Width := BodyPanel.Width - (sg_report.Left * 2);
  sg_report.Top := btn_Search.Top + btn_Search.Height + 10;

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

procedure TfmAttendManger.FormShow(Sender: TObject);
begin
  fmMain.FORMENABLE(con_FormBMOSATREPORT,'TRUE');

  FormNameSetting;
  FormComboBoxInitialize;
  ReportConfigRead;
  FormGridInitialize;
  AttendReportHeaderNameSetting(sg_Report);
  AttendReportFieldNameSetting;
  LoadCompanyTreeView('',tv_AddCompanyName,tv_AddCompanyCode,con_LocalCompanyImageIndex);
  tv_AddCompanyNameDblClick(Self);

end;


function TfmAttendManger.MemoryCreate: Boolean;
begin
  L_nMaxReportColCount := 30;
  L_nShowCount := 0;

  BuildingCodeList := TStringList.Create;
  CardStateList := TStringList.Create;
  CompanyCodeList := TStringList.Create;
  DoorCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  EmployeeGubunCodeList := TStringList.Create;
  ReportHeaderNameList := TStringList.Create;
  ReportFieldNameList := TStringList.Create;

  SetLength(L_arrAttendReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrRelAttendReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrAttendReportShowTable,L_nMaxReportColCount + 1);
  SetLength(L_arrAttendReportSizeTable,L_nMaxReportColCount + 1);
end;

function TfmAttendManger.MemoryFree: Boolean;
begin
  BuildingCodeList.Free;
  CardStateList.Free;
  CompanyCodeList.Free;
  DoorCodeList.Free;
  PosiCodeList.Free;
  EmployeeGubunCodeList.Free;
  ReportHeaderNameList.Free;
  ReportFieldNameList.Free;

  L_arrAttendReportIndexArray := nil;
  Finalize(L_arrAttendReportIndexArray);
  L_arrRelAttendReportIndexArray := nil;
  Finalize(L_arrRelAttendReportIndexArray);
  L_arrAttendReportShowTable := nil;
  Finalize(L_arrAttendReportShowTable);
  L_arrAttendReportSizeTable := nil;
  Finalize(L_arrAttendReportSizeTable);
end;

procedure TfmAttendManger.mn_UpdateClick(Sender: TObject);
var
  stInTime : string;
  stWorkOutTime : string;
  stWorkInTime : string;
  stOutTime : string;
  stAtDate : string;
begin
  inherited;
  with sg_report do
  begin
    if Cells[13 + (G_nReportCompanyStep-3) ,Row] = '' then exit;
    stAtDate := Cells[0,Row];
    stAtDate := stringReplace(stAtDate,'-','',[rfReplaceAll]);
    stAtDate := stringReplace(stAtDate,':','',[rfReplaceAll]);
    stAtDate := stringReplace(stAtDate,' ','',[rfReplaceAll]);

    stInTime := Cells[9 + (G_nReportCompanyStep-3),Row];
    stInTime := stringReplace(stInTime,'-','',[rfReplaceAll]);
    stInTime := stringReplace(stInTime,':','',[rfReplaceAll]);
    stInTime := stringReplace(stInTime,' ','',[rfReplaceAll]);
    stWorkOutTime := Cells[10 + (G_nReportCompanyStep-3),Row];
    stWorkOutTime := stringReplace(stWorkOutTime,'-','',[rfReplaceAll]);
    stWorkOutTime := stringReplace(stWorkOutTime,':','',[rfReplaceAll]);
    stWorkOutTime := stringReplace(stWorkOutTime,' ','',[rfReplaceAll]);
    stWorkInTime := Cells[11 + (G_nReportCompanyStep-3),Row];
    stWorkInTime := stringReplace(stWorkInTime,'-','',[rfReplaceAll]);
    stWorkInTime := stringReplace(stWorkInTime,':','',[rfReplaceAll]);
    stWorkInTime := stringReplace(stWorkInTime,' ','',[rfReplaceAll]);
    stOutTime := Cells[12 + (G_nReportCompanyStep-3),Row];
    stOutTime := stringReplace(stOutTime,'-','',[rfReplaceAll]);
    stOutTime := stringReplace(stOutTime,':','',[rfReplaceAll]);
    stOutTime := stringReplace(stOutTime,' ','',[rfReplaceAll]);
    fmAttendUpdate := TfmAttendUpdate.Create(Self);
    fmAttendUpdate.Init := True;
    fmAttendUpdate.ATCODE := Cells[15 + (G_nReportCompanyStep-3),Row];
    fmAttendUpdate.ATDATE := stAtDate;
    fmAttendUpdate.AWCODE := Cells[14 + (G_nReportCompanyStep-3),Row];
    fmAttendUpdate.EMSEQ := Cells[13 + (G_nReportCompanyStep-3),Row];
    fmAttendUpdate.InTime := stInTime;
    fmAttendUpdate.WorkOutTime := stWorkOutTime;
    fmAttendUpdate.WorkInTime := stWorkInTime;
    fmAttendUpdate.OutTime := stOutTime;
    fmAttendUpdate.Init := False;

    fmAttendUpdate.lb_List.Caption.Text := mn_Update.Caption;
    fmAttendUpdate.ed_EmCode.Text := Cells[5 + (G_nReportCompanyStep-3),Row];
    fmAttendUpdate.ed_EmName.Text := Cells[6 + (G_nReportCompanyStep-3),Row];
    fmAttendUpdate.ShowModal;
    if fmAttendUpdate.DataChange then
    begin
      SearchReport(sg_Report.TopRow,sg_Report.Row);
    end;

    fmAttendUpdate.Free;
  end;
end;

function TfmAttendManger.ReportCellHide(aList: TAdvStringGrid): Boolean;
var
  i : integer;
begin
  for i := 0 to aList.ColCount - 1 do
  begin
    if L_arrAttendReportShowTable[i] = 0 then
    begin
      aList.ColWidths[L_arrAttendReportIndexArray[i]] := 0;
    end else
    begin
      if L_arrAttendReportSizeTable[L_arrAttendReportIndexArray[i]] <> 0 then aList.ColWidths[L_arrAttendReportIndexArray[i]] := L_arrAttendReportSizeTable[L_arrAttendReportIndexArray[i]]
      else aList.ColWidths[L_arrAttendReportIndexArray[i]] := 90;
    end;

    if i > 12 then aList.ColWidths[i] := 0;
  end;
end;

function TfmAttendManger.ReportConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\ATTENDMANAGER.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrAttendReportIndexArray) to HIGH(L_arrAttendReportIndexArray) do
      begin
        L_arrAttendReportIndexArray[i] := ReadInteger('ATTENDREPORT','AccessIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelAttendReportIndexArray) to HIGH(L_arrRelAttendReportIndexArray) do
      begin
        L_arrRelAttendReportIndexArray[i] := ReadInteger('ATTENDREPORT','RelAccessIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrAttendReportShowTable) to HIGH(L_arrAttendReportShowTable) do
      begin
        L_arrAttendReportShowTable[i] := ReadInteger('ATTENDREPORT','RelAccessShowArray'+inttostr(i),1);
        L_nShowCount := L_nShowCount + L_arrAttendReportShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrAttendReportSizeTable) to HIGH(L_arrAttendReportSizeTable) do
      begin
        L_arrAttendReportSizeTable[i] := ReadInteger('ATTENDREPORT','RelAccessSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

end;

function TfmAttendManger.ReportHeaderNameSetting: Boolean;
begin

  ReportHeaderNameList.Clear;
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONATTENDDATE'));         //근태날짜
  if G_nReportCompanyStep > 0 then ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '1');
  if G_nReportCompanyStep > 1 then ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '2');
  if G_nReportCompanyStep > 2 then ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '3');
  if G_nReportCompanyStep > 3 then ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '4');
  if G_nReportCompanyStep > 4 then ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '5');
  if G_nReportCompanyStep > 5 then ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '6');
  if G_nReportCompanyStep > 6 then ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME') + '7');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSINAME'));   //직위
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE'));       //사번
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME'));       //이름
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONATTENDTYPE'));         //근태타입
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONATTENDCODE'));         //근태코드
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONATINTIME'));           //출근시간
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONATWORKOUTTIME'));      //외출시간
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONATWORKINTIME'));       //복귀시간
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONATOUTTIME'));          //퇴근시간
  ReportHeaderNameList.Add('EMSEQ');               //사원관리번호
  ReportHeaderNameList.Add('ATTENDTYPE');          //근태타입
  ReportHeaderNameList.Add('ATTENDCODE');          //근태코드
  ReportHeaderNameList.Add('ATTYPEUSER');          //근태타입 수정자
  ReportHeaderNameList.Add('INUSER');              //출근 수정자
  ReportHeaderNameList.Add('WORKOUTUSER');         //외출 수정자
  ReportHeaderNameList.Add('WORKINUSER');          //복귀 수정자
  ReportHeaderNameList.Add('OUTUSER');             //퇴근 수정자
  ReportHeaderNameList.Add('ADD');                 //ADD 여부
  ReportHeaderNameList.Add('ATTYPEDATE');            //UPDATE여부
  ReportHeaderNameList.Add('INUPDATE');            //UPDATE여부
  ReportHeaderNameList.Add('WORKOUTUPDATE');       //UPDATE여부
  ReportHeaderNameList.Add('WORKINUPDATE');        //UPDATE여부
  ReportHeaderNameList.Add('OUTUPDATE');           //UPDATE여부
  ReportHeaderNameList.Add('DELETE');              //DELETE 여부

  result := True;

end;

function TfmAttendManger.SearchReport(aTopRow:integer=0;aRow:integer=0): Boolean;
var
  stStartDate : string;
  stEndDate : string;
  stCompanyCode : string;
  stPosiCode : string;
  stEmpGubun : string;
  stEtcType : string;
  stEtcName : string;
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  i : integer;
  stTemp : string;
  stMessage : string;
  bUser : Boolean;
begin
  if ATChange then
  begin
    stMessage := dmFormMessage.GetMessage('NOTSAVEWORK');
    if (Application.MessageBox(PChar(dmFormMessage.GetMessage('CARDGROUPCHANGE')),'Information',MB_OKCANCEL) = IDCANCEL) then Exit;
  end;
  stStartDate := FormatDateTime('yyyymmdd',dt_StartDate.Date);
  stEndDate := FormatDateTime('yyyymmdd',dt_EndDate.Date);
  stCompanyCode := ed_CompanyCode.Text;
  if cmb_Posi.ItemIndex > 0 then stPosiCode := PosiCodeList.Strings[cmb_Posi.ItemIndex]
  else stPosiCode := '';
  stEmpGubun := '';
  if cmb_EmpGubun.ItemIndex > 0 then stEmpGubun := EmployeeGubunCodeList.Strings[cmb_EmpGubun.ItemIndex];
  stEtcType := '0';
  if cmb_ETC.ItemIndex > 0 then stEtcType := inttostr(cmb_ETC.ItemIndex);
  stEtcName := Trim(ed_name.Text);
  stSql :=  dmDBSelect.SelectTB_ATTENDEVENT_AttendReport(stStartDate,stEndDate, stCompanyCode,
            stPosiCode, stEmpGubun, stEtcType, stEtcName);

//  memo1.Text := stSql;
 
  GridInitialize(sg_Report);
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
      with sg_Report do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          bUser := False;
          for i := 0 to ReportFieldNameList.Count - 1 do
          begin
            stTemp := FindField(ReportFieldNameList.Strings[i]).AsString;
            if ReportFieldNameList.Strings[i] = 'AT_DATE' then stTemp := MakeDatetimeStr(stTemp)
            else if (ReportFieldNameList.Strings[i] = 'AE_ATINTIME') or
              (ReportFieldNameList.Strings[i] = 'AE_ATWORKOUTTIME') or
              (ReportFieldNameList.Strings[i] = 'AE_ATWORKINTIME') or
              (ReportFieldNameList.Strings[i] = 'AE_ATOUTTIME')
            then
            begin
              //if Length(stTemp) > 8 then System.Delete(stTemp,1,8);
              stTemp := MaketimeStr(stTemp);
            end
            else if (ReportFieldNameList.Strings[i] = 'AE_WORKMM') or
              (ReportFieldNameList.Strings[i] = 'AE_EXTENDWORKMM') or
              (ReportFieldNameList.Strings[i] = 'AE_NIGHTWORKMM') then
            begin
              if stTemp = '0' then stTemp := '';
              if isDigit(stTemp) then stTemp := MinuteToString(strtoint(stTemp));
            end else if (ReportFieldNameList.Strings[i] = 'AE_ATTYPEUSER') or
              (ReportFieldNameList.Strings[i] = 'AE_INUSER') or
              (ReportFieldNameList.Strings[i] = 'AE_WORKOUTUSER') or
              (ReportFieldNameList.Strings[i] = 'AE_WORKINUSER') or
              (ReportFieldNameList.Strings[i] = 'AE_OUTUSER') then
            begin
              if stTemp <> '' then bUser := True;
            end;
            cells[L_arrAttendReportIndexArray[i],nRow] := stTemp;
            if bUser then RowColor[nRow] := clYellow
            else RowColor[nRow] := clWhite;
          end;
          nRow := nRow + 1;
          Next;
        end;
        if aTopRow > 0 then TopRow := aTopRow;
        if aRow > 0 then Row := aRow;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  ATChange := False;
  result := True;
end;

procedure TfmAttendManger.SetATChange(const Value: Boolean);
begin
  FATChange := Value;
  btn_Save.Enabled := Value;
  btn_Cancel.Enabled := Value;
end;

procedure TfmAttendManger.sg_reportClick(Sender: TObject);
begin
  inherited;
  with sg_report do
  begin
    if Cells[13 + (G_nReportCompanyStep-3),Row] <> '' then popupmenu := pop_Menu
    else popupmenu := nil;

  end;
end;

procedure TfmAttendManger.sg_reportColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeAttendReportIndex(FromIndex,ToIndex);

end;

procedure TfmAttendManger.sg_reportDblClick(Sender: TObject);
begin
  inherited;
  mn_UpdateClick(mn_Update);
end;

procedure TfmAttendManger.sg_reportMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  sg_report.Repaint;
end;

procedure TfmAttendManger.tv_AddCompanyNameDblClick(Sender: TObject);
begin
  inherited;
  Try
    if tv_AddCompanyName.Selected = nil then tv_AddCompanyName.Items[0].Selected := True;

    ed_CompanyCode.Text := tv_AddCompanyCode.Items.Item[tv_AddCompanyName.Selected.AbsoluteIndex].Text;
    eb_CompanyName.Text := tv_AddCompanyName.Selected.Text;
    tv_AddCompanyName.Visible := False;
    LoadPosiCode(copy(ed_CompanyCode.Text,1,1+G_nCompanyCodeLength),PosiCodeList,TComboBox(cmb_Posi),True,L_stAllName);
    btn_SearchClick(btn_Search);
  Except
    Exit;
  End;
end;

function TfmAttendManger.WriteIniConfig: Boolean;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(G_stExeFolder + '\ATTENDMANAGER.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrAttendReportIndexArray) to HIGH(L_arrAttendReportIndexArray) do
      begin
        WriteInteger('ATTENDREPORT','AccessIndexArray'+inttostr(i),L_arrAttendReportIndexArray[i]);
      end;
      for i := LOW(L_arrRelAttendReportIndexArray) to HIGH(L_arrRelAttendReportIndexArray) do
      begin
        WriteInteger('ATTENDREPORT','RelAccessIndexArray'+inttostr(i),L_arrRelAttendReportIndexArray[i]);
      end;
      for i := 0 to sg_Report.ColCount - 1 do
      begin
        if i > HIGH(L_arrAttendReportSizeTable) then break;

        L_arrAttendReportSizeTable[i] := sg_Report.ColWidths[i];
        WriteInteger('ATTENDREPORT','RelAccessSizeArray' + inttostr(i),sg_Report.ColWidths[i]);
      end;
    end;
  Finally
    ini_fun.Free;
  End;
end;

initialization
  RegisterClass(TfmAttendManger);
Finalization
  UnRegisterClass(TfmAttendManger);

end.
