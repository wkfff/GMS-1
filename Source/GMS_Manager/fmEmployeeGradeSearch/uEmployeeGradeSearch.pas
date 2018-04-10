﻿unit uEmployeeGradeSearch;

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
  AdvGlowButton, AdvOfficePager, AdvAppStyler, AdvOfficePagerStylers,
  Vcl.Imaging.pngimage;


const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmEmployeeGradeSearch = class(TfmASubForm)
    Image1: TImage;
    ImageList1: TImageList;
    pop_PermitAdd: TAdvPopupMenu;
    mn_addpermitListDelete: TMenuItem;
    toolslist: TImageList;
    sg_report: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    pan_Option: TAdvSmoothPanel;
    MenuImageList16: TImageList;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_BuildingName: TAdvSmoothLabel;
    eb_BuildingName: TAdvEditBtn;
    lb_CompanyName: TAdvSmoothLabel;
    eb_CompanyName: TAdvEditBtn;
    lb_EtcSearch: TAdvSmoothLabel;
    cmb_ETC: TAdvComboBox;
    lb_DoorName: TAdvSmoothLabel;
    cmb_Door: TAdvComboBox;
    lb_PosiName: TAdvSmoothLabel;
    cmb_Posi: TAdvComboBox;
    lb_SearchETCName: TAdvSmoothLabel;
    ed_name: TAdvEdit;
    lb_CardState: TAdvSmoothLabel;
    cmb_CardRegType: TAdvComboBox;
    lb_empType: TAdvSmoothLabel;
    cmb_EmpGubun: TAdvComboBox;
    ed_BuildingCode: TAdvEdit;
    ed_CompanyCode: TAdvEdit;
    lb_List: TLabel;
    btn_Search: TAdvGlowButton;
    btn_Option: TAdvGlowButton;
    btn_Print: TAdvGlowButton;
    btn_Excel: TAdvGlowButton;
    BodyPanel: TAdvSmoothPanel;
    btn_OptionSave: TAdvGlowButton;
    btn_OptionCancel: TAdvGlowButton;
    gb_SearchOption: TAdvOfficeCheckGroup;
    lb_SearchOption: TLabel;
    ButtonImageList32: TImageList;
    tv_AddCompanyCode: TTreeView;
    tv_AddCompanyName: TTreeView;
    tv_buildingCode: TTreeView;
    tv_buildingName: TTreeView;
    lb_DoorNotPermitCountName: TAdvSmoothLabel;
    lb_SearchCount: TAdvSmoothLabel;
    lb_Count1: TAdvSmoothLabel;
    lb_EmployeeGroupCode: TAdvSmoothLabel;
    ed_CardGroupName: TAdvEditBtn;
    tv_EmGroupName: TTreeView;
    tv_EmGroupCode: TTreeView;
    ed_CardGroupCode: TAdvEdit;
    check_NotPermit: TAdvOfficeCheckBox;
    lb_CardGrade: TAdvSmoothLabel;
    cmb_gradeType: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_AddNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ed_nameKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure cmb_ETCChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_OptionClick(Sender: TObject);
    procedure btn_OptionCancelClick(Sender: TObject);
    procedure btn_OptionSaveClick(Sender: TObject);
    procedure sg_reportColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure btn_SearchClick(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure eb_CompanyNameClickBtn(Sender: TObject);
    procedure tv_AddCompanyNameDblClick(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure ed_CardGroupNameClickBtn(Sender: TObject);
    procedure tv_EmGroupNameDblClick(Sender: TObject);
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
    L_arrAccessReportIndexArray:Array of integer; //출입이벤트 리스트 순서 배열
    L_arrRelAccessReportIndexArray:Array of integer; //출입이벤트 실제 위치
    L_arrAccessReportShowTable : Array of integer;  //출입이벤트 조회 항목테이블
    L_arrAccessReportSizeTable : Array of integer;  //출입이벤트 Cell Size
    { Private declarations }
    function AccessReportHeaderNameSetting(aList: TAdvStringGrid):Boolean;
    function AccessReportFieldNameSetting:Boolean;
    procedure ChangeAccessReportIndex(FromIndex,ToIndex:integer);
    Function FormComboBoxInitialize:Boolean;
    Function FormGridInitialize:Boolean;
    Function FormNameSetting:Boolean;
    procedure FontSetting;
    Function MemoryCreate : Boolean;
    Function MemoryFree:Boolean;
    Function SearchReport:Boolean;
    function ReportCellHide(aList:TAdvStringGrid):Boolean;
    function ReportConfigRead:Boolean;
    function ReportHeaderNameSetting:Boolean;
    function WriteIniConfig:Boolean;
  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmEmployeeGradeSearch: TfmEmployeeGradeSearch;

implementation
uses
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


function TfmEmployeeGradeSearch.AccessReportFieldNameSetting: Boolean;
begin
  ReportFieldNameList.Clear;
  ReportFieldNameList.Add('EM_SEQ');
  ReportFieldNameList.Add('EM_CODE');
  ReportFieldNameList.Add('EM_NAME');
  ReportFieldNameList.Add('CA_CARDNO');
  ReportFieldNameList.Add('CA_CARDGUBUNNAME');
  ReportFieldNameList.Add('DO_DOORNAME');
  ReportFieldNameList.Add('CP_PERMIT');
  ReportFieldNameList.Add('CP_RCVACK');
  //ReportFieldNameList.Add('CP_APPLY');
  ReportFieldNameList.Add('CP_FINGERAPPLY');
end;

function TfmEmployeeGradeSearch.AccessReportHeaderNameSetting(aList: TAdvStringGrid): Boolean;
var
  i : integer;
begin
  aList.ColCount := ReportHeaderNameList.Count;
  for i := LOW(L_arrAccessReportIndexArray) to HIGH(L_arrAccessReportIndexArray) do
  begin
    if (aList.ColCount - 1) < i then Exit;
    if (ReportHeaderNameList.Count - 1) < i then Exit;

    aList.cells[L_arrAccessReportIndexArray[i],0] := ReportHeaderNameList[i];
  end;

end;

procedure TfmEmployeeGradeSearch.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmEmployeeGradeSearch.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  btn_Excel.Enabled := False;
  aFileName:=dmFormFunction.GetFormName('2','1','BM3_024');//'출입보고서';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      //sg_Report.SaveToXLS(stSaveFileName,True);
      if fileexists(stSaveFileName) then
        deletefile(stSaveFileName);
      sg_Report.SaveToXLS(stSaveFileName);
//      advgridexcelio1.XLSExport(stSaveFileName);
    end;
  end;
  btn_Excel.Enabled := True;

end;

procedure TfmEmployeeGradeSearch.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmEmployeeGradeSearch.btn_OptionCancelClick(Sender: TObject);
begin
  inherited;
  Pan_Option.Visible := False;
end;

procedure TfmEmployeeGradeSearch.btn_OptionClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := LOW(L_arrAccessReportShowTable) to HIGH(L_arrAccessReportShowTable) do
  begin
    if i < gb_SearchOption.Items.Count then
    begin
      if L_arrAccessReportShowTable[i] = 1 then gb_SearchOption.Checked[i] := True
      else gb_SearchOption.Checked[i] := False;
    end;
  end;
  Pan_Option.Visible := True;
end;

procedure TfmEmployeeGradeSearch.btn_OptionSaveClick(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\EmployeeGradeSearch.INI');
    with ini_fun do
    begin
      for i := 0 to gb_SearchOption.Items.Count - 1 do
      begin
        if gb_SearchOption.Checked[i] then
        begin
          L_arrAccessReportShowTable[i] := 1;
          WriteInteger('ACCESSREPORT','RelAccessShowArray'+inttostr(i),1);
        end else
        begin
          L_arrAccessReportShowTable[i] := 0;
          WriteInteger('ACCESSREPORT','RelAccessShowArray'+inttostr(i),0);
        end;
      end;
    end;
  Finally
    ini_fun.Free;
  End;
  Pan_Option.Visible := False;
  ReportCellHide(sg_Report);
end;

procedure TfmEmployeeGradeSearch.btn_PrintClick(Sender: TObject);
begin
  sg_Report.Print;
end;

procedure TfmEmployeeGradeSearch.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchReport;
end;

procedure TfmEmployeeGradeSearch.ChangeAccessReportIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelAccessReportIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelAccessReportIndexArray[i] := L_arrRelAccessReportIndexArray[i - 1];
    end;
    L_arrRelAccessReportIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelAccessReportIndexArray[i] := L_arrRelAccessReportIndexArray[i + 1];
    end;
    L_arrRelAccessReportIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelAccessReportIndexArray) to HIGH(L_arrRelAccessReportIndexArray) do
  begin
    L_arrAccessReportIndexArray[L_arrRelAccessReportIndexArray[i]] := i;
  end;

end;

procedure TfmEmployeeGradeSearch.cmb_ETCChange(Sender: TObject);
begin
  inherited;
  lb_SearchETCName.Caption.Text := cmb_ETC.Text;
end;

procedure TfmEmployeeGradeSearch.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;

end;

procedure TfmEmployeeGradeSearch.eb_CompanyNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_AddCompanyName.Visible := True;
  tv_AddCompanyName.Top := eb_CompanyName.Top + eb_CompanyName.Height;
  tv_AddCompanyName.Left := eb_CompanyName.Left;

end;

procedure TfmEmployeeGradeSearch.ed_AddNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfmEmployeeGradeSearch.ed_CardGroupNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_EmGroupName.Visible := Not tv_EmGroupName.Visible;
  tv_EmGroupName.Top := ed_CardGroupName.Top + ed_CardGroupName.Height;
  tv_EmGroupName.Left := ed_CardGroupName.Left;
end;

procedure TfmEmployeeGradeSearch.ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    SearchReport;
  end;

end;

procedure TfmEmployeeGradeSearch.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmEmployeeGradeSearch.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfmEmployeeGradeSearch.FormChangeEvent(aFormName: integer);
begin
end;

procedure TfmEmployeeGradeSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteIniConfig;

  fmMain.FORMENABLE(con_FormBMOSEMPLOYEEGRADESEARCH,'FALSE');

  MemoryFree;
  Action := caFree;
end;

function TfmEmployeeGradeSearch.FormComboBoxInitialize: Boolean;
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
  LoadCardState(CardStateList,TComboBox(cmb_CardRegType),True,L_stAllName);
  LoadCardGrade(cmb_GradeType,True,L_stAllName);

  cmb_GradeType.ItemIndex := 0;
  cmb_ETC.ItemIndex := 0;
  lb_SearchETCName.Caption.Text := cmb_ETC.Text;

end;

procedure TfmEmployeeGradeSearch.FormCreate(Sender: TObject);
begin

  MemoryCreate;
  FontSetting;
end;


procedure TfmEmployeeGradeSearch.FormGradeRefresh;
begin

end;

function TfmEmployeeGradeSearch.FormGridInitialize: Boolean;
begin
  GridInitialize(sg_Report);
  ReportCellHide(sg_Report);
end;

procedure TfmEmployeeGradeSearch.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmEmployeeGradeSearch.FormNameSetting: Boolean;
var
  i : integer;
begin
  ReportHeaderNameSetting;

  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','COMMONREPORT');
  lb_List.Caption := dmFormFunction.GetFormName('2','1','BM3_024');
  lb_BuildingName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  lb_DoorName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  lb_CompanyName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  lb_PosiName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSINAME');
  lb_CardState.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCARDSTATE');
  lb_empType.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGUBUN');
  lb_EtcSearch.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONETCNAME');
  lb_EmployeeGroupCode.Caption.Text:= dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGROUP');
  check_NotPermit.Caption := dmFormFunction.GetFormName('0','2','COMMONNOTACCPERMIT');
  lb_CardGrade.Caption.Text :=  dmFormFunction.GetFormName('0','2','COMMONCARDGRADE');

  L_stCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');

  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');
  btn_Option.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCHOPTION');
  lb_SearchOption.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCHOPTION');
  btn_Print.Caption := dmFormFunction.GetFormName('0','2','COMMONPRINT');
  btn_Excel.Caption := dmFormFunction.GetFormName('0','2','BUTTONFILESAVE002');

  btn_OptionSave.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_OptionCancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');

  gb_SearchOption.Items.Clear;

  for i := 0 to ReportHeaderNameList.Count - 1 do
  begin
    gb_SearchOption.Items.Add(ReportHeaderNameList.Strings[i]);
  end;
end;

procedure TfmEmployeeGradeSearch.FormResize(Sender: TObject);
begin
  inherited;
  pan_Option.Left := (width div 2) - (pan_Option.Width div 2);
  pan_Option.Top := (Height div 2) - (pan_Option.Height div 2);

  btn_OptionSave.Left := pan_Option.Width div 2 - btn_OptionSave.Width  - 5;
  btn_OptionCancel.Left := pan_Option.Width div 2 + 5;

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

procedure TfmEmployeeGradeSearch.FormShow(Sender: TObject);
begin
  fmMain.FORMENABLE(con_FormBMOSEMPLOYEEGRADESEARCH,'TRUE');

  FormNameSetting;
  FormComboBoxInitialize;
  ReportConfigRead;
  FormGridInitialize;
  AccessReportHeaderNameSetting(sg_Report);
  AccessReportFieldNameSetting;
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  LoadCompanyTreeView('',tv_AddCompanyName,tv_AddCompanyCode,con_LocalCompanyImageIndex);
  LoadEmployeeGroupTreeView('',tv_EmGroupName,tv_EmGroupCode,con_LocalCompanyImageIndex,'0');
  tv_buildingNameDblClick(Self);
  tv_AddCompanyNameDblClick(Self);
  tv_EmGroupNameDblClick(Self);

  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

  if G_nMonitoringType = 1 then
  begin
    sg_Report.ColWidths[L_arrAccessReportIndexArray[8]] := 0; //분기국사에서는 지문전송 유무를 확인하지 말자
  end;
end;


function TfmEmployeeGradeSearch.MemoryCreate: Boolean;
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

  SetLength(L_arrAccessReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrRelAccessReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrAccessReportShowTable,L_nMaxReportColCount + 1);
  SetLength(L_arrAccessReportSizeTable,L_nMaxReportColCount + 1);
end;

function TfmEmployeeGradeSearch.MemoryFree: Boolean;
begin
  BuildingCodeList.Free;
  CardStateList.Free;
  CompanyCodeList.Free;
  DoorCodeList.Free;
  PosiCodeList.Free;
  EmployeeGubunCodeList.Free;
  ReportHeaderNameList.Free;
  ReportFieldNameList.Free;

  L_arrAccessReportIndexArray := nil;
  Finalize(L_arrAccessReportIndexArray);
  L_arrRelAccessReportIndexArray := nil;
  Finalize(L_arrRelAccessReportIndexArray);
  L_arrAccessReportShowTable := nil;
  Finalize(L_arrAccessReportShowTable);
  L_arrAccessReportSizeTable := nil;
  Finalize(L_arrAccessReportSizeTable);
end;

function TfmEmployeeGradeSearch.ReportCellHide(aList: TAdvStringGrid): Boolean;
var
  i : integer;
begin
  for i := 0 to aList.ColCount - 1 do
  begin
    if L_arrAccessReportShowTable[i] = 0 then
    begin
      aList.ColWidths[L_arrAccessReportIndexArray[i]] := 0;
    end else
    begin
      if L_arrAccessReportSizeTable[L_arrAccessReportIndexArray[i]] <> 0 then aList.ColWidths[L_arrAccessReportIndexArray[i]] := L_arrAccessReportSizeTable[L_arrAccessReportIndexArray[i]]
      else aList.ColWidths[L_arrAccessReportIndexArray[i]] := 90;
    end;
  end;
end;

function TfmEmployeeGradeSearch.ReportConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\EmployeeGradeSearch.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrAccessReportIndexArray) to HIGH(L_arrAccessReportIndexArray) do
      begin
        L_arrAccessReportIndexArray[i] := ReadInteger('ACCESSREPORT','AccessIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelAccessReportIndexArray) to HIGH(L_arrRelAccessReportIndexArray) do
      begin
        L_arrRelAccessReportIndexArray[i] := ReadInteger('ACCESSREPORT','RelAccessIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrAccessReportShowTable) to HIGH(L_arrAccessReportShowTable) do
      begin
        L_arrAccessReportShowTable[i] := ReadInteger('ACCESSREPORT','RelAccessShowArray'+inttostr(i),1);
        L_nShowCount := L_nShowCount + L_arrAccessReportShowTable[i];
      end;
      nSize := sg_Report.Width div 6;
      for i := LOW(L_arrAccessReportSizeTable) to HIGH(L_arrAccessReportSizeTable) do
      begin
        L_arrAccessReportSizeTable[i] := ReadInteger('ACCESSREPORT','RelAccessSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

end;

function TfmEmployeeGradeSearch.ReportHeaderNameSetting: Boolean;
begin
  ReportHeaderNameList.Clear;
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMSEQ'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCARDTYPE'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDOORNAME'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONACCPERMIT'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONSEND'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONFINGERSEND'));

  result := True;

end;

function TfmEmployeeGradeSearch.SearchReport: Boolean;
var
  stBuildingCode : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDoorCode : string;
  stCompanyCode : string;
  stPosiCode : string;
  stCardRegState : string;
  stEmGroupCode : string;
  stEmpGubun : string;
  stEtcType : string;
  stEtcName : string;
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  i : integer;
  stTemp : string;
begin
  lb_SearchCount.Caption.Text := '0';
  stBuildingCode := ed_BuildingCode.Text;
  if cmb_Door.ItemIndex > 0 then stDoorCode := DoorCodeList.Strings[cmb_Door.ItemIndex]
  else stDoorCode := '';
  stNodeNo := '';
  stEcuID := '';
  if Length(stDoorCode) > (G_nNodeCodeLength + 2) then
  begin
    stNodeNo := copy(stDoorCode,1,G_nNodeCodeLength);
    stEcuID := copy(stDoorCode,G_nNodeCodeLength + 1,2);
    stDoorNo := copy(stDoorCode,G_nNodeCodeLength + 2 + 1,1);
  end else stDoorNo := '';
  stCompanyCode := ed_CompanyCode.Text;
  if cmb_Posi.ItemIndex > 0 then stPosiCode := PosiCodeList.Strings[cmb_Posi.ItemIndex]
  else stPosiCode := '';
  stCardRegState := '';
  if cmb_CardRegType.ItemIndex > 0 then stCardRegState := CardStateList.Strings[cmb_CardRegType.ItemIndex];
  stEmpGubun := '';
  if cmb_EmpGubun.ItemIndex > 0 then stEmpGubun := EmployeeGubunCodeList.Strings[cmb_EmpGubun.ItemIndex];
  stEtcType := '0';
  if cmb_ETC.ItemIndex > 0 then stEtcType := inttostr(cmb_ETC.ItemIndex);
  stEtcName := Trim(ed_name.Text);
  stEmGroupCode := ed_CardGroupCode.Text;
  if stEmGroupCode = '' then stEmGroupCode := '0';

  stSql :=  dmDBSelect.SelectTB_CARDPERMITEMPLOYEECODE_GradeReport(stBuildingCode, stNodeNo, stEcuID, stDoorNo, stCompanyCode,
            stPosiCode, stCardRegState, stEmpGubun, stEtcType, stEtcName,stEmGroupCode,1,check_NotPermit.Checked,inttostr(cmb_gradeType.ItemIndex));


  btn_Excel.Enabled := False;
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');
  btn_Print.Enabled := False;
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
        LogSave(G_stExeFolder + '\..\Log\DBError' + FormatDateTime('yyyymmdd',Now) + '.log',stSql);
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      lb_SearchCount.Caption.Text := inttostr(recordcount);
      btn_Excel.Enabled := True;
      if Not FileExists(G_stExeFolder + '\Excel-a.png') then
      begin
        ExcelEnImage.Picture.SaveToFile(G_stExeFolder + '\Excel-a.png');
      end;
      btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-a.png');
      btn_Print.Enabled := True;
      with sg_Report do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          if G_bApplicationTerminate then Exit;

          for i := 0 to ReportFieldNameList.Count - 1 do
          begin
            if ReportFieldNameList.Strings[i] = 'CP_RCVACK' then
            begin
              if FindField('CP_APPLY').AsString = 'Y' then stTemp := FindField(ReportFieldNameList.Strings[i]).AsString
              else stTemp := 'N';
            end else if ReportFieldNameList.Strings[i] = 'CP_PERMIT' then
            begin
              if FindField(ReportFieldNameList.Strings[i]).AsString = '0' then stTemp := dmFormMessage.GetMessage('NOTACCESSPERMIT')
              else if FindField(ReportFieldNameList.Strings[i]).AsString = '1' then stTemp := dmFormMessage.GetMessage('ACCESSPERMIT')
              else stTemp := FindField(ReportFieldNameList.Strings[i]).AsString;
            end else
              stTemp := FindField(ReportFieldNameList.Strings[i]).AsString;
            cells[L_arrAccessReportIndexArray[i],nRow] := stTemp;
          end;
          nRow := nRow + 1;
          Application.ProcessMessages;
          Next;
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

procedure TfmEmployeeGradeSearch.sg_reportColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeAccessReportIndex(FromIndex,ToIndex);

end;

procedure TfmEmployeeGradeSearch.tv_AddCompanyNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_AddCompanyName.Selected = nil then tv_AddCompanyName.Items[0].Selected := True;

  ed_CompanyCode.Text := tv_AddCompanyCode.Items.Item[tv_AddCompanyName.Selected.AbsoluteIndex].Text;
  eb_CompanyName.Text := tv_AddCompanyName.Selected.Text;
  tv_AddCompanyName.Visible := False;
  LoadPosiCode(copy(ed_CompanyCode.Text,1,1+G_nCompanyCodeLength),PosiCodeList,TComboBox(cmb_Posi),True,L_stAllName);
end;

procedure TfmEmployeeGradeSearch.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  LoadDoor(ed_BuildingCode.Text,DoorCodeList,TComboBox(cmb_Door),True,L_stAllName);

end;

procedure TfmEmployeeGradeSearch.tv_EmGroupNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_EmGroupName.Selected = nil then tv_EmGroupName.Items[0].Selected := True;

  ed_CardGroupCode.Text := tv_EmGroupCode.Items.Item[tv_EmGroupName.Selected.AbsoluteIndex].Text;
  ed_CardGroupName.Text := tv_EmGroupName.Selected.Text;
  tv_EmGroupName.Visible := False;

end;

function TfmEmployeeGradeSearch.WriteIniConfig: Boolean;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(G_stExeFolder + '\EmployeeGradeSearch.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrAccessReportIndexArray) to HIGH(L_arrAccessReportIndexArray) do
      begin
        WriteInteger('ACCESSREPORT','AccessIndexArray'+inttostr(i),L_arrAccessReportIndexArray[i]);
      end;
      for i := LOW(L_arrRelAccessReportIndexArray) to HIGH(L_arrRelAccessReportIndexArray) do
      begin
        WriteInteger('ACCESSREPORT','RelAccessIndexArray'+inttostr(i),L_arrRelAccessReportIndexArray[i]);
      end;
      for i := 0 to sg_Report.ColCount - 1 do
      begin
        if i > HIGH(L_arrAccessReportSizeTable) then break;

        L_arrAccessReportSizeTable[i] := sg_Report.ColWidths[i];
        WriteInteger('ACCESSREPORT','RelAccessSizeArray' + inttostr(i),sg_Report.ColWidths[i]);
      end;
    end;
  Finally
    ini_fun.Free;
  End;
end;

initialization
  RegisterClass(TfmEmployeeGradeSearch);
Finalization
  UnRegisterClass(TfmEmployeeGradeSearch);

end.