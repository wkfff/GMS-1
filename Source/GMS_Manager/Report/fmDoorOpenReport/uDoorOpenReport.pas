﻿unit uDoorOpenReport;

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
  Vcl.Imaging.pngimage, AdvGlowButton, AdvOfficePager, AdvAppStyler,
  AdvOfficePagerStylers;


const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmDoorOpenReport = class(TfmASubForm)
    Image1: TImage;
    BodyPanel: TAdvSmoothPanel;
    ImageList1: TImageList;
    pop_PermitAdd: TAdvPopupMenu;
    mn_addpermitListDelete: TMenuItem;
    toolslist: TImageList;
    sg_report: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    cmb_Door: TAdvComboBox;
    AdvSmoothLabel2: TAdvSmoothLabel;
    dt_endDate: TDateTimePicker;
    dt_StartDate: TDateTimePicker;
    cmb_StartHH: TAdvComboBox;
    lb_StartHH: TAdvSmoothLabel;
    cmb_StartMM: TAdvComboBox;
    lb_StartMM: TAdvSmoothLabel;
    AdvSmoothLabel18: TAdvSmoothLabel;
    cmb_EndHH: TAdvComboBox;
    lb_EndHH: TAdvSmoothLabel;
    cmb_EndMM: TAdvComboBox;
    lb_EndMM: TAdvSmoothLabel;
    pan_Option: TAdvSmoothPanel;
    eb_BuildingName: TAdvEditBtn;
    ed_BuildingCode: TAdvEdit;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    btn_Search: TAdvGlowButton;
    btn_Option: TAdvGlowButton;
    btn_Print: TAdvGlowButton;
    btn_Excel: TAdvGlowButton;
    lb_SearchDate: TAdvSmoothLabel;
    lb_BuildingName: TAdvSmoothLabel;
    lb_DoorName: TAdvSmoothLabel;
    gb_SearchOption: TAdvOfficeCheckGroup;
    lb_SearchOption: TLabel;
    btn_OptionSave: TAdvGlowButton;
    btn_OptionCancel: TAdvGlowButton;
    tv_buildingCode: TTreeView;
    tv_buildingName: TTreeView;
    MenuImageList16: TImageList;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_list: TAdvSmoothLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_AddNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ed_nameKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_OptionClick(Sender: TObject);
    procedure btn_OptionCancelClick(Sender: TObject);
    procedure btn_OptionSaveClick(Sender: TObject);
    procedure sg_reportColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure btn_SearchClick(Sender: TObject);
    procedure CommandArrayCommandsTMENUIDExecute(Command: TCommand;
      Params: TStringList);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure cmb_DoorChange(Sender: TObject);
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
  fmDoorOpenReport: TfmDoorOpenReport;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uComboBoxCodeLoad,
  uDataBase,
  uDBFunction,
  uDBSelect,
  uFormFunction,
  uFormVariable,
  uFormUtil,
  uMain;

{$R *.dfm}


function TfmDoorOpenReport.AccessReportFieldNameSetting: Boolean;
begin
  ReportFieldNameList.Clear;
  ReportFieldNameList.Add('DE_DATE');
  ReportFieldNameList.Add('DE_TIME');
  ReportFieldNameList.Add('BUILDINGNAME1');
  ReportFieldNameList.Add('BUILDINGNAME2');
  ReportFieldNameList.Add('BUILDINGNAME3');
  ReportFieldNameList.Add('DO_DOORNAME');
  ReportFieldNameList.Add('DE_DOORSTATENAME');
end;

function TfmDoorOpenReport.AccessReportHeaderNameSetting(aList: TAdvStringGrid): Boolean;
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

procedure TfmDoorOpenReport.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmDoorOpenReport.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  btn_Excel.Enabled := False;
  aFileName:=Caption;
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      //sg_Report.SaveToXLS(stSaveFileName,True);
      if fileexists(stSaveFileName) then
        deletefile(stSaveFileName);
      if G_nReportFileFormat = 0 then sg_Report.SaveToXLS(stSaveFileName)
      else sg_Report.SaveToCSV(stSaveFileName);
//      sg_Report.SaveToXLS(stSaveFileName);
//      advgridexcelio1.XLSExport(stSaveFileName);
    end;
  end;
//  btn_Excel.Enabled := True;
  btn_Excel.Enabled := IsUpdateGrade;

end;

procedure TfmDoorOpenReport.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmDoorOpenReport.btn_OptionCancelClick(Sender: TObject);
begin
  inherited;
  Pan_Option.Visible := False;
end;

procedure TfmDoorOpenReport.btn_OptionClick(Sender: TObject);
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

procedure TfmDoorOpenReport.btn_OptionSaveClick(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\DoorOpenReport.INI');
    with ini_fun do
    begin
      for i := 0 to gb_SearchOption.Items.Count - 1 do
      begin
        if gb_SearchOption.Checked[i] then
        begin
          L_arrAccessReportShowTable[i] := 1;
          WriteInteger('DOOROPENREPORT','RelAccessShowArray'+inttostr(i),1);
        end else
        begin
          L_arrAccessReportShowTable[i] := 0;
          WriteInteger('DOOROPENREPORT','RelAccessShowArray'+inttostr(i),0);
        end;
      end;
    end;
  Finally
    ini_fun.Free;
  End;
  Pan_Option.Visible := False;
  ReportCellHide(sg_Report);
end;

procedure TfmDoorOpenReport.btn_PrintClick(Sender: TObject);
begin
  sg_Report.Print;
end;

procedure TfmDoorOpenReport.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchReport;
end;

procedure TfmDoorOpenReport.ChangeAccessReportIndex(FromIndex, ToIndex: integer);
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

procedure TfmDoorOpenReport.cmb_DoorChange(Sender: TObject);
begin
  inherited;
  if G_nReportSearchType = 1 then  SearchReport;
end;

procedure TfmDoorOpenReport.CommandArrayCommandsTMENUIDExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  L_stMenuID := Params.Values['ID'];

end;

procedure TfmDoorOpenReport.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;

end;

procedure TfmDoorOpenReport.ed_AddNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfmDoorOpenReport.ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
  end;

end;

procedure TfmDoorOpenReport.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmDoorOpenReport.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfmDoorOpenReport.FormChangeEvent(aFormName: integer);
begin
end;

procedure TfmDoorOpenReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteIniConfig;

  fmMain.FORMENABLE(con_FormBMOSDOOROPENREPORT,'FALSE');

  MemoryFree;
  Action := caFree;
end;

function TfmDoorOpenReport.FormComboBoxInitialize: Boolean;
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
begin
  LoadTimeHH(cmb_StartHH);
  cmb_StartHH.ItemIndex := 0;
  LoadTimeMM(cmb_StartMM);
  cmb_StartMM.ItemIndex := 0;
  LoadTimeHH(cmb_EndHH);
  cmb_EndHH.ItemIndex := 24;
  LoadTimeMM(cmb_EndMM);
  cmb_EndMM.ItemIndex := 0;

end;

procedure TfmDoorOpenReport.FormCreate(Sender: TObject);
begin
  dt_StartDate.Date := Now;
  dt_endDate.Date := now;

  MemoryCreate;
  FontSetting;
end;


procedure TfmDoorOpenReport.FormGradeRefresh;
begin

end;

function TfmDoorOpenReport.FormGridInitialize: Boolean;
begin
  GridInitialize(sg_Report);
  ReportCellHide(sg_Report);
end;

procedure TfmDoorOpenReport.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmDoorOpenReport.FormNameSetting: Boolean;
var
  i : integer;
begin
  ReportHeaderNameSetting;

  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','COMMONREPORT');
  //lb_List.Caption.Text := dmFormFunction.GetFormName('2','1','BM4_012');
  lb_SearchDate.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHDATE');
  lb_StartHH.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartMM.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndHH.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndMM.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONMM');

  lb_BuildingName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  lb_DoorName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');

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

procedure TfmDoorOpenReport.FormResize(Sender: TObject);
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

procedure TfmDoorOpenReport.FormShow(Sender: TObject);
begin
  fmMain.FORMENABLE(con_FormBMOSDOOROPENREPORT,'TRUE');

  FormNameSetting;
  FormComboBoxInitialize;
  ReportConfigRead;
  FormGridInitialize;
  AccessReportHeaderNameSetting(sg_Report);
  AccessReportFieldNameSetting;
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');
end;


function TfmDoorOpenReport.MemoryCreate: Boolean;
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

function TfmDoorOpenReport.MemoryFree: Boolean;
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

function TfmDoorOpenReport.ReportCellHide(aList: TAdvStringGrid): Boolean;
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

function TfmDoorOpenReport.ReportConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\DoorOpenReport.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrAccessReportIndexArray) to HIGH(L_arrAccessReportIndexArray) do
      begin
        L_arrAccessReportIndexArray[i] := ReadInteger('DoorOpenReport','AccessIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelAccessReportIndexArray) to HIGH(L_arrRelAccessReportIndexArray) do
      begin
        L_arrRelAccessReportIndexArray[i] := ReadInteger('DoorOpenReport','RelAccessIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrAccessReportShowTable) to HIGH(L_arrAccessReportShowTable) do
      begin
        L_arrAccessReportShowTable[i] := ReadInteger('DoorOpenReport','RelAccessShowArray'+inttostr(i),1);
        L_nShowCount := L_nShowCount + L_arrAccessReportShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrAccessReportSizeTable) to HIGH(L_arrAccessReportSizeTable) do
      begin
        L_arrAccessReportSizeTable[i] := ReadInteger('DoorOpenReport','RelAccessSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

end;

function TfmDoorOpenReport.ReportHeaderNameSetting: Boolean;
begin

  ReportHeaderNameList.Clear;
  ReportHeaderNameList.Add('날짜');
  ReportHeaderNameList.Add('시간');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '1');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '2');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '3');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDOORNAME'));
  ReportHeaderNameList.Add('출입문상태');

  result := True;

end;

function TfmDoorOpenReport.SearchReport: Boolean;
var
  stStartDate : string;
  stStartTime : string;
  stEndDate : string;
  stEndTime : string;
  stBuildingCode : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stDoorCode : string;
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  i : integer;
  stTemp : string;
begin
  stStartDate := FormatDateTime('yyyymmdd',dt_StartDate.Date);
  stEndDate := FormatDateTime('yyyymmdd',dt_EndDate.Date);
  stStartTime := FillZeroStrNum(cmb_StartHH.Text,2) + FillZeroStrNum(cmb_StartMM.Text,2);
  stEndTime := FillZeroStrNum(cmb_EndHH.Text,2) + FillZeroStrNum(cmb_EndMM.Text,2);
  stBuildingCode := ed_BuildingCode.Text;
  if cmb_Door.ItemIndex > 0 then stDoorCode := DoorCodeList.Strings[cmb_Door.ItemIndex]
  else stDoorCode := '';
  stNodeNo := '';
  stEcuID := '';
  stDoorNo := '';
  if Length(stDoorCode) > (G_nNodeCodeLength + 2) then
  begin
    stNodeNo := copy(stDoorCode,1,G_nNodeCodeLength);
    stEcuID := copy(stDoorCode,G_nNodeCodeLength + 1,2);
    stDoorNo := copy(stDoorCode,G_nNodeCodeLength + 2 + 1,1);
  end else stDoorNo := '';
  stSql :=  dmDBSelect.SelectTB_DOORSTATEEVENT_Report(stStartDate, stStartTime,
            stEndDate, stEndTime, stBuildingCode, stNodeNo, stEcuID, stDoorNo,1);


  btn_Print.Enabled := False;
  btn_Excel.Enabled := False;
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');
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
      btn_Excel.Enabled := IsUpdateGrade;
      btn_Print.Enabled := IsInsertGrade;
      if Not FileExists(G_stExeFolder + '\Excel-a.png') then
      begin
        ExcelEnImage.Picture.SaveToFile(G_stExeFolder + '\Excel-a.png');
      end;
      btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-a.png');
      with sg_Report do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          for i := 0 to ReportFieldNameList.Count - 1 do
          begin
            stTemp := FindField(ReportFieldNameList.Strings[i]).AsString;
            if ReportFieldNameList.Strings[i] = 'DE_DATE' then stTemp := MakeDatetimeStr(stTemp)
            else if ReportFieldNameList.Strings[i] = 'DE_TIME' then stTemp := MaketimeStr(stTemp);
            cells[L_arrAccessReportIndexArray[i],nRow] := stTemp;
          end;
          nRow := nRow + 1;
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

procedure TfmDoorOpenReport.sg_reportColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeAccessReportIndex(FromIndex,ToIndex);

end;

procedure TfmDoorOpenReport.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  LoadDoor(ed_BuildingCode.Text,DoorCodeList,TComboBox(cmb_Door),True,L_stAllName);
  if G_nReportSearchType = 1 then  SearchReport;
end;

function TfmDoorOpenReport.WriteIniConfig: Boolean;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(G_stExeFolder + '\DoorOpenReport.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrAccessReportIndexArray) to HIGH(L_arrAccessReportIndexArray) do
      begin
        WriteInteger('DOOROPENREPORT','AccessIndexArray'+inttostr(i),L_arrAccessReportIndexArray[i]);
      end;
      for i := LOW(L_arrRelAccessReportIndexArray) to HIGH(L_arrRelAccessReportIndexArray) do
      begin
        WriteInteger('DOOROPENREPORT','RelAccessIndexArray'+inttostr(i),L_arrRelAccessReportIndexArray[i]);
      end;
      for i := 0 to sg_Report.ColCount - 1 do
      begin
        if i > HIGH(L_arrAccessReportSizeTable) then break;

        L_arrAccessReportSizeTable[i] := sg_Report.ColWidths[i];
        WriteInteger('DOOROPENREPORT','RelAccessSizeArray' + inttostr(i),sg_Report.ColWidths[i]);
      end;
    end;
  Finally
    ini_fun.Free;
  End;
end;

initialization
  RegisterClass(TfmDoorOpenReport);
Finalization
  UnRegisterClass(TfmDoorOpenReport);

end.