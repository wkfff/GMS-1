﻿unit uAlarmEventReport;

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
  TfmAlarmEventReport = class(TfmASubForm)
    Image1: TImage;
    BodyPanel: TAdvSmoothPanel;
    lb_SearchETCName: TAdvSmoothLabel;
    ImageList1: TImageList;
    pop_PermitAdd: TAdvPopupMenu;
    mn_addpermitListDelete: TMenuItem;
    toolslist: TImageList;
    ed_name: TAdvEdit;
    SaveDialog1: TSaveDialog;
    cmb_ArmArea: TAdvComboBox;
    AdvSmoothLabel2: TAdvSmoothLabel;
    dt_endDate: TDateTimePicker;
    dt_StartDate: TDateTimePicker;
    lb_ArmAreaName: TAdvSmoothLabel;
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
    lb_AlarmModeName: TAdvSmoothLabel;
    cmb_AlarmMode: TAdvComboBox;
    lb_AlarmGroupName: TAdvSmoothLabel;
    cmb_AlarmGroup: TAdvComboBox;
    cmb_AlarmType: TAdvComboBox;
    lb_AlarmTypeName: TAdvSmoothLabel;
    lb_AlarmDeviceTypeName: TAdvSmoothLabel;
    cmb_DeviceType: TAdvComboBox;
    cmb_DateType: TAdvComboBox;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    Panel1: TPanel;
    Label3: TLabel;
    Gauge2: TGauge;
    sg_report: TAdvStringGrid;
    btn_Search: TAdvGlowButton;
    btn_Option: TAdvGlowButton;
    btn_Print: TAdvGlowButton;
    btn_Excel: TAdvGlowButton;
    lb_SearchDate: TAdvSmoothLabel;
    lb_BuildingName: TAdvSmoothLabel;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    tv_buildingCode: TTreeView;
    tv_buildingName: TTreeView;
    MenuImageList16: TImageList;
    gb_SearchOption: TAdvOfficeCheckGroup;
    lb_SearchOption: TLabel;
    btn_OptionSave: TAdvGlowButton;
    btn_OptionCancel: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
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
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure cmb_AlarmGroupChange(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure ed_nameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmb_ArmAreaChange(Sender: TObject);
  private
    L_stMenuID : string;
    L_stFormType : string;
    L_stSearchID : string;
    L_stCloseCaption : string;
    L_stAllName : string;
    BuildingCodeList : TStringList;
    ArmModeList : TStringList;
    AlarmEventGroupList : TStringList;
    AlarmEventPCCodeList : TStringList;
    ArmAreaCodeList : TStringList;
    AlarmDeviceCodeList : TStringList;
    ReportHeaderNameList : TStringList;
    ReportFieldNameList : TStringList;
    L_nMaxReportColCount : integer;
    L_nShowCount : integer;
    L_arrReportIndexArray:Array of integer; //이벤트 리스트 순서 배열
    L_arrRelReportIndexArray:Array of integer; //이벤트 실제 위치
    L_arrReportShowTable : Array of integer;  //이벤트 조회 항목테이블
    L_arrReportSizeTable : Array of integer;  //이벤트 Cell Size
    { Private declarations }
    function AlarmReportHeaderNameSetting(aList: TAdvStringGrid):Boolean;
    function AlarmReportFieldNameSetting:Boolean;
    procedure ChangeReportIndex(FromIndex,ToIndex:integer);
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
    procedure FORMREPORT(aFormID,aFormType:string);
  end;

var
  fmAlarmEventReport: TfmAlarmEventReport;

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


function TfmAlarmEventReport.AlarmReportFieldNameSetting: Boolean;
begin
  ReportFieldNameList.Clear;
  ReportFieldNameList.Add('AE_DATE');
  ReportFieldNameList.Add('AE_TIME');
  ReportFieldNameList.Add('BUILDINGNAME1');
  ReportFieldNameList.Add('BUILDINGNAME2');
  ReportFieldNameList.Add('BUILDINGNAME3');
  ReportFieldNameList.Add('AR_ARMAREANAME');
  ReportFieldNameList.Add('ARMMODENAME');
  ReportFieldNameList.Add('AL_ALARMDEVICETYPENAME');
  ReportFieldNameList.Add('AE_SUBADDR');
  ReportFieldNameList.Add('ZN_ZONENO');
  ReportFieldNameList.Add('ZN_ZONENAME');
  ReportFieldNameList.Add('PORTSTATENAME');
  ReportFieldNameList.Add('AE_EVENTSTATECODE');
  ReportFieldNameList.Add('EVENTSTATEPCCODENAME');
  ReportFieldNameList.Add('AE_OPERATOR');
  ReportFieldNameList.Add('EM_CODE');
  ReportFieldNameList.Add('EM_NAME');
  ReportFieldNameList.Add('AE_CHECKMSG');
  ReportFieldNameList.Add('AD_USERID');
  ReportFieldNameList.Add('AE_CHECKTIME');

end;

function TfmAlarmEventReport.AlarmReportHeaderNameSetting(aList: TAdvStringGrid): Boolean;
var
  i : integer;
begin
  aList.ColCount := ReportHeaderNameList.Count;
  for i := LOW(L_arrReportIndexArray) to HIGH(L_arrReportIndexArray) do
  begin
    if (aList.ColCount - 1) < i then Exit;
    if (ReportHeaderNameList.Count - 1) < i then Exit;

    aList.cells[L_arrReportIndexArray[i],0] := ReportHeaderNameList[i];
  end;

end;

procedure TfmAlarmEventReport.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmAlarmEventReport.btn_ExcelClick(Sender: TObject);
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
  btn_Excel.Enabled := IsUpdateGrade;

end;

procedure TfmAlarmEventReport.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmAlarmEventReport.btn_OptionCancelClick(Sender: TObject);
begin
  inherited;
  Pan_Option.Visible := False;
end;

procedure TfmAlarmEventReport.btn_OptionClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := LOW(L_arrReportShowTable) to HIGH(L_arrReportShowTable) do
  begin
    if i < gb_SearchOption.Items.Count then
    begin
      if L_arrReportShowTable[i] = 1 then gb_SearchOption.Checked[i] := True
      else gb_SearchOption.Checked[i] := False;
    end;
  end;
  Pan_Option.Visible := True;
end;

procedure TfmAlarmEventReport.btn_OptionSaveClick(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\AlarmEventReport.INI');
    with ini_fun do
    begin
      for i := 0 to gb_SearchOption.Items.Count - 1 do
      begin
        if gb_SearchOption.Checked[i] then
        begin
          L_arrReportShowTable[i] := 1;
          WriteInteger('REPORT','RelShowArray'+inttostr(i),1);
        end else
        begin
          L_arrReportShowTable[i] := 0;
          WriteInteger('REPORT','RelShowArray'+inttostr(i),0);
        end;
      end;
    end;
  Finally
    ini_fun.Free;
  End;
  Pan_Option.Visible := False;
  ReportCellHide(sg_Report);
end;

procedure TfmAlarmEventReport.btn_PrintClick(Sender: TObject);
begin
  sg_Report.Print;
end;

procedure TfmAlarmEventReport.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchReport;
end;

procedure TfmAlarmEventReport.ChangeReportIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := L_arrRelReportIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      L_arrRelReportIndexArray[i] := L_arrRelReportIndexArray[i - 1];
    end;
    L_arrRelReportIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      L_arrRelReportIndexArray[i] := L_arrRelReportIndexArray[i + 1];
    end;
    L_arrRelReportIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(L_arrRelReportIndexArray) to HIGH(L_arrRelReportIndexArray) do
  begin
    L_arrReportIndexArray[L_arrRelReportIndexArray[i]] := i;
  end;

end;

procedure TfmAlarmEventReport.cmb_AlarmGroupChange(Sender: TObject);
var
  stAlarmEventGroup : string;
begin
  inherited;
  stAlarmEventGroup := '';
  if cmb_AlarmGroup.ItemIndex > 0 then stAlarmEventGroup := AlarmEventGroupList.Strings[cmb_AlarmGroup.ItemIndex];
  LoadAlarmEventPCCode(stAlarmEventGroup,AlarmEventPCCodeList,TComboBox(cmb_AlarmType),True,L_stAllName);
  if G_nReportSearchType = 1 then  SearchReport;
end;

procedure TfmAlarmEventReport.cmb_ArmAreaChange(Sender: TObject);
begin
  inherited;
  if G_nReportSearchType = 1 then  SearchReport;
end;

procedure TfmAlarmEventReport.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;

end;

procedure TfmAlarmEventReport.ed_AddNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfmAlarmEventReport.ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    SearchReport;
  end;

end;

procedure TfmAlarmEventReport.ed_nameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if G_nReportSearchType = 1 then  SearchReport;
end;

procedure TfmAlarmEventReport.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1); *)
end;

procedure TfmAlarmEventReport.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfmAlarmEventReport.FormChangeEvent(aFormName: integer);
begin
end;

procedure TfmAlarmEventReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteIniConfig;

  fmMain.FORMENABLE(con_FormBMOSALARMEVENTREPORT,'FALSE');

  MemoryFree;
  Action := caFree;
end;

function TfmAlarmEventReport.FormComboBoxInitialize: Boolean;
var
  stAlarmEventGroup : string;
begin
  LoadArmMode(ArmModeList,TComboBox(cmb_AlarmMode),True,L_stAllName);
  LoadAlarmEventGroup(AlarmEventGroupList,TComboBox(cmb_AlarmGroup),True,L_stAllName);
  stAlarmEventGroup := '';
  if cmb_AlarmGroup.ItemIndex > 0 then stAlarmEventGroup := AlarmEventGroupList.Strings[cmb_AlarmGroup.ItemIndex];
  LoadAlarmEventPCCode(stAlarmEventGroup,AlarmEventPCCodeList,TComboBox(cmb_AlarmType),True,L_stAllName);
  LoadAlarmDeviceType(AlarmDeviceCodeList,TComboBox(cmb_DeviceType),True,L_stAllName);

  LoadTimeHH(cmb_StartHH);
  cmb_StartHH.ItemIndex := 0;
  LoadTimeMM(cmb_StartMM);
  cmb_StartMM.ItemIndex := 0;
  LoadTimeHH(cmb_EndHH);
  cmb_EndHH.ItemIndex := 24;
  LoadTimeMM(cmb_EndMM);
  cmb_EndMM.ItemIndex := 0;

end;

procedure TfmAlarmEventReport.FormCreate(Sender: TObject);
begin

  dt_StartDate.Date := Now;
  dt_endDate.Date := now;

  MemoryCreate;
  FontSetting;
end;


procedure TfmAlarmEventReport.FormGradeRefresh;
begin
//    btn_Excel.Enabled := IsUpdateGrade;
//    btn_Print.Enabled := IsInsertGrade;

end;

function TfmAlarmEventReport.FormGridInitialize: Boolean;
begin
  GridInitialize(sg_Report);
  ReportCellHide(sg_Report);
end;

procedure TfmAlarmEventReport.FormIDSetting(aID: string);
var
  nIndex : integer;
begin
  L_stMenuID := aID;
  FormNameSetting;
  FormComboBoxInitialize;
  ReportConfigRead;
  FormGridInitialize;
  AlarmReportHeaderNameSetting(sg_Report);
  AlarmReportFieldNameSetting;
  if L_stFormType = 'BUILDING' then LoadBuildingTreeView(L_stSearchID,tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex)
  else
     LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);
  if L_stFormType = 'ALARM' then
  begin
    nIndex := ArmAreaCodeList.IndexOf(L_stSearchID);
    if nIndex > -1 then cmb_ArmArea.ItemIndex := nIndex;
  end;
//  btn_SearchClick(self);
  if G_nReportSearchType = 1 then  SearchReport;
end;

function TfmAlarmEventReport.FormNameSetting: Boolean;
var
  i : integer;
begin
  ReportHeaderNameSetting;

  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','COMMONREPORT');
  lb_List.Caption.Text := dmFormFunction.GetFormName('2','1','BM4_013');
  lb_SearchDate.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHDATE');
  lb_StartHH.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartMM.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndHH.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndMM.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONMM');

  lb_BuildingName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  lb_ArmAreaName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONARMAREANAME');
  lb_AlarmModeName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONARMMODE');
  lb_AlarmGroupName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONARMEVENTGROUP');
  lb_AlarmTypeName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONARMEVENTTYPE');
  lb_AlarmDeviceTypeName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDEVICETYPE');
  lb_SearchETCName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONALARMCONFIRMNAME');

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

procedure TfmAlarmEventReport.FORMREPORT(aFormID,aFormType: string);
var
  nIndex : integer;
begin
  inherited;
  L_stFormType := aFormType;
  L_stSearchID := aFormID;
  FormNameSetting;
  FormComboBoxInitialize;
  ReportConfigRead;
  FormGridInitialize;
  AlarmReportHeaderNameSetting(sg_Report);
  AlarmReportFieldNameSetting;
  if L_stFormType = 'BUILDING' then LoadBuildingTreeView(L_stSearchID,tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex)
  else
     LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);
  if L_stFormType = 'ALARM' then
  begin
    nIndex := ArmAreaCodeList.IndexOf(L_stSearchID);
    if nIndex > -1 then cmb_ArmArea.ItemIndex := nIndex;
  end;
  //btn_SearchClick(self);
  if G_nReportSearchType = 1 then  SearchReport;
end;

procedure TfmAlarmEventReport.FormResize(Sender: TObject);
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

procedure TfmAlarmEventReport.FormShow(Sender: TObject);
begin
  fmMain.FORMENABLE(con_FormBMOSALARMEVENTREPORT,'TRUE');
  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

end;


function TfmAlarmEventReport.MemoryCreate: Boolean;
begin
  L_nMaxReportColCount := 30;
  L_nShowCount := 0;

  BuildingCodeList := TStringList.Create;
  ArmModeList := TStringList.Create;
  AlarmEventGroupList := TStringList.Create;
  ArmAreaCodeList := TStringList.Create;
  AlarmDeviceCodeList := TStringList.Create;
  AlarmEventPCCodeList := TStringList.Create;
  ReportHeaderNameList := TStringList.Create;
  ReportFieldNameList := TStringList.Create;

  SetLength(L_arrReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrRelReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrReportShowTable,L_nMaxReportColCount + 1);
  SetLength(L_arrReportSizeTable,L_nMaxReportColCount + 1);
end;

function TfmAlarmEventReport.MemoryFree: Boolean;
begin
  BuildingCodeList.Free;
  ArmModeList.Free;
  AlarmEventGroupList.Free;
  ArmAreaCodeList.Free;
  AlarmDeviceCodeList.Free;
  AlarmEventPCCodeList.Free;
  ReportHeaderNameList.Free;
  ReportFieldNameList.Free;

  L_arrReportIndexArray := nil;
  Finalize(L_arrReportIndexArray);
  L_arrRelReportIndexArray := nil;
  Finalize(L_arrRelReportIndexArray);
  L_arrReportShowTable := nil;
  Finalize(L_arrReportShowTable);
  L_arrReportSizeTable := nil;
  Finalize(L_arrReportSizeTable);
end;

function TfmAlarmEventReport.ReportCellHide(aList: TAdvStringGrid): Boolean;
var
  i : integer;
begin
  for i := 0 to aList.ColCount - 1 do
  begin
    if L_arrReportShowTable[i] = 0 then
    begin
      aList.ColWidths[L_arrReportIndexArray[i]] := 0;
    end else
    begin
      if L_arrReportSizeTable[L_arrReportIndexArray[i]] <> 0 then aList.ColWidths[L_arrReportIndexArray[i]] := L_arrReportSizeTable[L_arrReportIndexArray[i]]
      else aList.ColWidths[L_arrReportIndexArray[i]] := 90;
    end;
  end;
end;

function TfmAlarmEventReport.ReportConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\AlarmEventReport.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrReportIndexArray) to HIGH(L_arrReportIndexArray) do
      begin
        L_arrReportIndexArray[i] := ReadInteger('REPORT','IndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrRelReportIndexArray) to HIGH(L_arrRelReportIndexArray) do
      begin
        L_arrRelReportIndexArray[i] := ReadInteger('REPORT','RelIndexArray'+inttostr(i),i);
      end;
      for i := LOW(L_arrReportShowTable) to HIGH(L_arrReportShowTable) do
      begin
        L_arrReportShowTable[i] := ReadInteger('REPORT','RelShowArray'+inttostr(i),1);
        L_nShowCount := L_nShowCount + L_arrReportShowTable[i];
      end;
      nSize := 90;
      for i := LOW(L_arrReportSizeTable) to HIGH(L_arrReportSizeTable) do
      begin
        L_arrReportSizeTable[i] := ReadInteger('REPORT','RelSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

end;

function TfmAlarmEventReport.ReportHeaderNameSetting: Boolean;
begin
  ReportHeaderNameList.Clear;
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDATE'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMTIME'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '1');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '2');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME') + '3');
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMAREANAME'));     //방범구역명
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONARMMODE'));         //방범모드
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICETYPE'));//기기타입
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMDEVICENO'));  //기기번호
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMZONENO'));    //존번호

  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMZONENAME'));  //존명칭
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMZONESTATE'));  //존상태
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCODE'));       //알람코드
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCODENAME'));   //알람내용
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMOPER'));       //알람생성자
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE'));    //사번
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME'));    //이름
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCONFIRMNAME'));   //조치내용
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCONFIRMID'));     //확인자아이디
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONALARMCONFIRMTIME'));   //확인시간

  result := True;

end;


function TfmAlarmEventReport.SearchReport: Boolean;
var
  stStartDate : string;
  stStartTime : string;
  stEndDate : string;
  stEndTime : string;
  stBuildingCode : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stArmAreaCode : string;
  stArmMode : string;
  stAlarmEventGroup : string;
  stAlarmEventPCCode : string;
  stAlarmDeviceType : string;
  stAlarmConfirm : string;
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
  if cmb_ArmArea.ItemIndex > 0 then stArmAreaCode := ArmAreaCodeList.Strings[cmb_ArmArea.ItemIndex]
  else stArmAreaCode := '';
  stNodeNo := '';
  stEcuID := '';
  if Length(stArmAreaCode) > (G_nNodeCodeLength + 2) then
  begin
    stNodeNo := copy(stArmAreaCode,1,G_nNodeCodeLength);
    stEcuID := copy(stArmAreaCode,G_nNodeCodeLength + 1,2);
    stArmAreaNo := copy(stArmAreaCode,G_nNodeCodeLength + 2 + 1,1);
  end else stArmAreaNo := '';
  stArmMode := '';
  if cmb_AlarmMode.ItemIndex > 0 then stArmMode := ArmModeList.Strings[cmb_AlarmMode.ItemIndex];
  stAlarmEventGroup := '';
  if cmb_AlarmGroup.ItemIndex > 0 then stAlarmEventGroup := AlarmEventGroupList.Strings[cmb_AlarmGroup.ItemIndex];
  stAlarmEventPCCode := '';
  if cmb_AlarmType.ItemIndex > 0 then stAlarmEventPCCode := AlarmEventPCCodeList.Strings[cmb_AlarmType.ItemIndex];
  stAlarmDeviceType := '';
  if cmb_DeviceType.ItemIndex > 0 then stAlarmDeviceType := AlarmDeviceCodeList.Strings[cmb_DeviceType.ItemIndex];
  stAlarmConfirm := ed_name.Text;
  if cmb_DateType.ItemIndex < 0 then cmb_DateType.ItemIndex := 0;

  stSql :=  dmDBSelect.SelectTB_ALARMEVENT_AlarmReport(stStartDate, stStartTime,
            stEndDate, stEndTime, stBuildingCode, stNodeNo, stEcuID, stArmAreaNo, Uppercase(stArmMode),
            stAlarmEventGroup, stAlarmEventPCCode, stAlarmDeviceType, stAlarmConfirm ,1,cmb_DateType.ItemIndex);

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
            if ReportFieldNameList.Strings[i] = 'AE_DATE' then stTemp := MakeDatetimeStr(stTemp)
            else if ReportFieldNameList.Strings[i] = 'AE_TIME' then stTemp := MaketimeStr(stTemp)
            else if ReportFieldNameList.Strings[i] = 'AE_CHECKTIME' then stTemp := MakeDatetimeStr(stTemp);
            cells[L_arrReportIndexArray[i],nRow] := stTemp;
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

procedure TfmAlarmEventReport.sg_reportColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeReportIndex(FromIndex,ToIndex);

end;

procedure TfmAlarmEventReport.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  LoadArmArea(ed_BuildingCode.Text,ArmAreaCodeList,TComboBox(cmb_ArmArea),True,L_stAllName);
  if G_nReportSearchType = 1 then  SearchReport;
end;

function TfmAlarmEventReport.WriteIniConfig: Boolean;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(G_stExeFolder + '\AlarmEventReport.INI');
  Try
    with ini_fun do
    begin
      for i := LOW(L_arrReportIndexArray) to HIGH(L_arrReportIndexArray) do
      begin
        WriteInteger('REPORT','IndexArray'+inttostr(i),L_arrReportIndexArray[i]);
      end;
      for i := LOW(L_arrRelReportIndexArray) to HIGH(L_arrRelReportIndexArray) do
      begin
        WriteInteger('REPORT','RelIndexArray'+inttostr(i),L_arrRelReportIndexArray[i]);
      end;
      for i := 0 to sg_Report.ColCount - 1 do
      begin
        if i > HIGH(L_arrReportSizeTable) then break;

        L_arrReportSizeTable[i] := sg_Report.ColWidths[i];
        WriteInteger('REPORT','RelSizeArray' + inttostr(i),sg_Report.ColWidths[i]);
      end;
    end;
  Finally
    ini_fun.Free;
  End;
end;

initialization
  RegisterClass(TfmAlarmEventReport);
Finalization
  UnRegisterClass(TfmAlarmEventReport);

end.
