﻿unit uDeviceVersionReport;

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
  AdvAppStyler,Vcl.Clipbrd;


const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmDeviceVersionReport = class(TfmASubForm)
    Image1: TImage;
    BodyPanel: TAdvSmoothPanel;
    pop_PermitAdd: TAdvPopupMenu;
    mn_addpermitListDelete: TMenuItem;
    sg_report: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    cmb_Node: TAdvComboBox;
    cmb_Controler: TAdvComboBox;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_NodeName: TAdvSmoothLabel;
    lb_Controler: TAdvSmoothLabel;
    btn_Search: TAdvGlowButton;
    btn_Option: TAdvGlowButton;
    btn_Print: TAdvGlowButton;
    btn_Excel: TAdvGlowButton;
    pan_Option: TAdvSmoothPanel;
    lb_SearchOption: TLabel;
    gb_SearchOption: TAdvOfficeCheckGroup;
    btn_OptionSave: TAdvGlowButton;
    btn_OptionCancel: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_list: TAdvSmoothLabel;
    lb_BuildingName: TAdvSmoothLabel;
    eb_BuildingName: TAdvEditBtn;
    MenuImageList16: TImageList;
    ImageList1: TImageList;
    toolslist: TImageList;
    tv_buildingCode: TTreeView;
    tv_buildingName: TTreeView;
    ed_BuildingCode: TAdvEdit;
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
    procedure cmb_NodeChange(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure sg_reportKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    L_stMenuID : string;
    L_stCloseCaption : string;
    L_stAllName : string;
    NodeCodeList : TStringList;
    DeviceCodeList : TStringList;
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
    function ReportFieldNameSetting:Boolean;
    function ReportHeaderNameSetting:Boolean;
    function WriteIniConfig:Boolean;
  private

  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmDeviceVersionReport: TfmDeviceVersionReport;

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


function TfmDeviceVersionReport.AccessReportHeaderNameSetting(aList: TAdvStringGrid): Boolean;
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

procedure TfmDeviceVersionReport.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmDeviceVersionReport.btn_ExcelClick(Sender: TObject);
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
      Try
        sg_Report.SaveToXLS(stSaveFileName);
      Except
        sg_Report.SaveToCSV(stSaveFileName);
      End;
//      advgridexcelio1.XLSExport(stSaveFileName);
    end;
  end;
  btn_Excel.Enabled := IsUpdateGrade;

end;

procedure TfmDeviceVersionReport.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmDeviceVersionReport.btn_OptionCancelClick(Sender: TObject);
begin
  inherited;
  Pan_Option.Visible := False;
end;

procedure TfmDeviceVersionReport.btn_OptionClick(Sender: TObject);
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

procedure TfmDeviceVersionReport.btn_OptionSaveClick(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\DeviceVerReport.INI');
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

procedure TfmDeviceVersionReport.btn_PrintClick(Sender: TObject);
begin
  sg_Report.Print;
end;

procedure TfmDeviceVersionReport.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchReport;
end;

procedure TfmDeviceVersionReport.ChangeAccessReportIndex(FromIndex, ToIndex: integer);
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

procedure TfmDeviceVersionReport.cmb_NodeChange(Sender: TObject);
var
  stNodeNo : string;
begin
  inherited;
  if cmb_Node.itemIndex > 0 then
    stNodeNo := NodeCodeList.Strings[cmb_Node.itemIndex];
  LoadDevice(stNodeNo,DeviceCodeList,TComboBox(cmb_Controler),True,L_stAllName);
end;

procedure TfmDeviceVersionReport.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;

end;

procedure TfmDeviceVersionReport.ed_AddNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfmDeviceVersionReport.ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
  end;

end;

procedure TfmDeviceVersionReport.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
  *)
end;

procedure TfmDeviceVersionReport.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfmDeviceVersionReport.FormChangeEvent(aFormName: integer);
begin
end;

procedure TfmDeviceVersionReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteIniConfig;

  fmMain.FORMENABLE(con_FormBMOSDeviceVersionREPORT,'FALSE');

  MemoryFree;
  Action := caFree;
end;

function TfmDeviceVersionReport.FormComboBoxInitialize: Boolean;
begin
  LoadNode(NodeCodeList,TComboBox(cmb_Node),True,L_stAllName);
  LoadDevice('',DeviceCodeList,TComboBox(cmb_Controler),True,L_stAllName);
end;

procedure TfmDeviceVersionReport.FormCreate(Sender: TObject);
begin

  MemoryCreate;
  FontSetting;
end;


procedure TfmDeviceVersionReport.FormGradeRefresh;
begin
//    btn_Excel.Enabled := IsUpdateGrade;
//    btn_Print.Enabled := IsInsertGrade;
end;

function TfmDeviceVersionReport.FormGridInitialize: Boolean;
begin
  GridInitialize(sg_Report);
  ReportCellHide(sg_Report);
end;

procedure TfmDeviceVersionReport.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmDeviceVersionReport.FormNameSetting: Boolean;
var
  i : integer;
begin
  ReportHeaderNameSetting;

  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','COMMONREPORT');
  lb_List.Caption.Text := dmFormFunction.GetFormName('2','1','BM4_016');
  lb_BuildingName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');

  lb_NodeName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  lb_Controler.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDEVICE');

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

procedure TfmDeviceVersionReport.FormResize(Sender: TObject);
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

procedure TfmDeviceVersionReport.FormShow(Sender: TObject);
begin
  fmMain.FORMENABLE(con_FormBMOSDeviceVersionREPORT,'TRUE');

  FormNameSetting;
  FormComboBoxInitialize;
  ReportConfigRead;
  FormGridInitialize;
  AccessReportHeaderNameSetting(sg_Report);
  ReportFieldNameSetting;

  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);

  if Not FileExists(G_stExeFolder + '\Excel-d.png') then
  begin
    ExcelDisImage.Picture.SaveToFile(G_stExeFolder + '\Excel-d.png');
  end;
  btn_Excel.Picture.LoadFromFile(G_stExeFolder + '\Excel-d.png');

end;


function TfmDeviceVersionReport.MemoryCreate: Boolean;
begin
  L_nMaxReportColCount := 30;
  L_nShowCount := 0;

  NodeCodeList := TStringList.Create;
  DeviceCodeList := TStringList.Create;
  ReportHeaderNameList := TStringList.Create;
  ReportFieldNameList := TStringList.Create;

  SetLength(L_arrAccessReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrRelAccessReportIndexArray,L_nMaxReportColCount + 1);
  SetLength(L_arrAccessReportShowTable,L_nMaxReportColCount + 1);
  SetLength(L_arrAccessReportSizeTable,L_nMaxReportColCount + 1);
end;

function TfmDeviceVersionReport.MemoryFree: Boolean;
begin
  NodeCodeList.Free;
  DeviceCodeList.Free;
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

function TfmDeviceVersionReport.ReportCellHide(aList: TAdvStringGrid): Boolean;
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

function TfmDeviceVersionReport.ReportConfigRead: Boolean;
var
  ini_fun : TiniFile;
  nShowCount : integer;
  nSize : integer;
  i : integer;
begin
  L_nShowCount := 0;
  ini_fun := TiniFile.Create(G_stExeFolder + '\DeviceVerReport.INI');
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
      for i := LOW(L_arrAccessReportSizeTable) to HIGH(L_arrAccessReportSizeTable) do
      begin
        if i <> 3 then nSize := 200
        else nSize := 1000;
        L_arrAccessReportSizeTable[i] := ReadInteger('ACCESSREPORT','RelAccessSizeArray'+inttostr(i),nSize);
      end;
    end;
  Finally
    ini_fun.Free;
  End;

end;

function TfmDeviceVersionReport.ReportFieldNameSetting: Boolean;
begin
  ReportFieldNameList.Clear;
  ReportFieldNameList.Add('ND_NODENAME');
  ReportFieldNameList.Add('ND_NODEIP');
  ReportFieldNameList.Add('DE_ECUID');
  ReportFieldNameList.Add('DE_DEVICENAME');
  ReportFieldNameList.Add('DE_DEVICEVER');
end;

function TfmDeviceVersionReport.ReportHeaderNameSetting: Boolean;
begin

  ReportHeaderNameList.Clear;
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODENAME01'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONNODEIP01'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONCONTROLERID'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDEVICE'));
  ReportHeaderNameList.Add(dmFormFunction.GetFormName('0','2','COMMONDEVICEVER'));

  result := True;

end;


function TfmDeviceVersionReport.SearchReport: Boolean;
var
  stNodeNo : string;
  stEcuID : string;
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  i : integer;
  stTemp : string;
begin
  stNodeNo := '';
  stEcuID := '';
  if cmb_Controler.ItemIndex > 0 then
  begin
    stNodeNo := copy(DeviceCodeList.Strings[cmb_Controler.ItemIndex],1,G_nNodeCodeLength);
    stEcuID := copy(DeviceCodeList.Strings[cmb_Controler.ItemIndex],1 + G_nNodeCodeLength,2);
  end else
  begin
    if cmb_Node.ItemIndex > 0 then
      stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
  end;

  stSql :=  dmDBSelect.SelectTB_DEVICE_DeviceVersion(stNodeNo, stEcuID,ed_BuildingCode.Text);

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

procedure TfmDeviceVersionReport.sg_reportColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  ChangeAccessReportIndex(FromIndex,ToIndex);

end;

procedure TfmDeviceVersionReport.sg_reportKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  stTemp: string;
  stMessage : string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      stTemp:= Cells[1,Row];

      if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
      stMessage := dmFormMessage.GetMessage('CLIPDATACOPY');
      stMessage := stringReplace(stMessage,'$DATA',stTemp,[rfReplaceAll]);
      fmMain.FORMSTATUSMSG(2,stMessage);
      //showmessage(stTemp + ' 가 ClipBoard에 복사 되었습니다.');
    end;
  end;

end;

procedure TfmDeviceVersionReport.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  if G_nReportSearchType = 1 then  SearchReport;

end;

function TfmDeviceVersionReport.WriteIniConfig: Boolean;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(G_stExeFolder + '\DeviceVerReport.INI');
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
  RegisterClass(TfmDeviceVersionReport);
Finalization
  UnRegisterClass(TfmDeviceVersionReport);

end.
