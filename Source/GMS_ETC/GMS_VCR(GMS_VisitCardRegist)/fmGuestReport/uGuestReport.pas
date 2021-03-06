unit uGuestReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  AdvAppStyler, AdvPanel, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, AdvGlowButton,
  AdvEdBtn, Vcl.ComCtrls, Vcl.StdCtrls, AdvCombo, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, Vcl.ImgList,ActiveX,AdoDB, uSubForm, CommandArray;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmGuestReport = class(TfmASubForm)
    AdvFormStyler1: TAdvFormStyler;
    Image1: TImage;
    BodyPanel: TAdvSmoothPanel;
    lb_SearchETCName: TAdvSmoothLabel;
    lb_BuildingName: TAdvSmoothLabel;
    lb_SearchDate: TAdvSmoothLabel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    lb_DoorName: TAdvSmoothLabel;
    lb_StartHH: TAdvSmoothLabel;
    lb_StartMM: TAdvSmoothLabel;
    AdvSmoothLabel18: TAdvSmoothLabel;
    lb_EndHH: TAdvSmoothLabel;
    lb_EndMM: TAdvSmoothLabel;
    ed_name: TAdvEdit;
    cmb_Door: TAdvComboBox;
    dt_endDate: TDateTimePicker;
    dt_StartDate: TDateTimePicker;
    cmb_StartHH: TAdvComboBox;
    cmb_StartMM: TAdvComboBox;
    cmb_EndHH: TAdvComboBox;
    cmb_EndMM: TAdvComboBox;
    eb_BuildingName: TAdvEditBtn;
    btn_Excel: TAdvGlowButton;
    btn_Print: TAdvGlowButton;
    btn_Search: TAdvGlowButton;
    ed_CompanyName: TAdvEdit;
    AdvSmoothLabel1: TAdvSmoothLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    sg_report: TAdvStringGrid;
    tv_buildingCode: TTreeView;
    MenuImageList16: TImageList;
    ed_BuildingCode: TAdvEdit;
    tv_buildingName: TTreeView;
    procedure BodyPanelResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
  private
    DoorCodeList : TStringList;
    { Private declarations }
    Function SearchReport:Boolean;
  public
    { Public declarations }
  end;

var
  fmGuestReport: TfmGuestReport;

implementation

uses
uComboBoxCodeLoad,
uCommonFunction,
uCommonVariable,
uDataBase;

{$R *.dfm}

procedure TfmGuestReport.BodyPanelResize(Sender: TObject);
begin
  sg_report.Height := BodyPanel.Height - 200;
end;

procedure TfmGuestReport.btn_SearchClick(Sender: TObject);
begin
  SearchReport;
end;

procedure TfmGuestReport.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;

end;

procedure TfmGuestReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DoorCodeList.free;
end;

procedure TfmGuestReport.FormCreate(Sender: TObject);
begin
  dt_StartDate.Date := Now;
  dt_endDate.Date := now;
  LoadTimeHH(cmb_StartHH);
  cmb_StartHH.ItemIndex := 0;
  LoadTimeMM(cmb_StartMM);
  cmb_StartMM.ItemIndex := 0;
  LoadTimeHH(cmb_EndHH);
  cmb_EndHH.ItemIndex := 24;
  LoadTimeMM(cmb_EndMM);
  cmb_EndMM.ItemIndex := 0;

  DoorCodeList := TStringList.Create;
end;


procedure TfmGuestReport.FormShow(Sender: TObject);
begin
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);
end;

function TfmGuestReport.SearchReport: Boolean;
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
  if Length(stDoorCode) > (G_nNodeCodeLength + 2) then
  begin
    stNodeNo := copy(stDoorCode,1,G_nNodeCodeLength);
    stEcuID := copy(stDoorCode,G_nNodeCodeLength + 1,2);
    stDoorNo := copy(stDoorCode,G_nNodeCodeLength + 2 + 1,1);
  end else stDoorNo := '';

  stSql :=  'select a.AE_DATE,a.AE_TIME,c.BC_BUILDINGNAME as BUILDINGNAME1,d.BC_BUILDINGNAME as BUILDINGNAME2,b.DO_DOORNAME, ';
  stSql := stSql + ' a.CA_CARDNO,f.GL_COMPANYNAME,f.GL_NAME,f.GL_TELNUMBER,g.AP_PERMITCODENAME1 ';
  stSql := stSql + ' from TB_GUESTEVENT a ';
  if (stNodeNo = '') and (stBuildingCode = '0') then stSql := stSql + ' Left Join TB_DOOR b '
  else stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength ) + ') = c.BC_BUILDINGCODE ';
  stSql := stSql + ' AND c.BC_DEEPSEQ = 1 ) ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND substr(b.BC_BUILDINGCODE,1,' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND substring(b.BC_BUILDINGCODE From 1 for ' + inttostr( 1 + G_nBuildingCodeLength * 2 ) + ') = d.BC_BUILDINGCODE ';
  stSql := stSql + ' AND d.BC_DEEPSEQ = 2 ) ';
  stSql := stSql + ' Left Join TB_GUESTLIST f ';
  stSql := stSql + ' ON(a.AE_DATE = f.GL_DATE ';
  stSql := stSql + ' AND a.GL_CODE = f.GL_CODE )';
  stSql := stSql + ' Left Join TB_ACCESSPERMITCODE g ';
  stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND a.AP_PERMITCODE = g.AP_PERMITCODE )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AE_DATE BETWEEN ''' + stStartDate + ''' AND ''' + stEndDate + ''' ';
  stSql := stSql + ' AND a.AE_TIME BETWEEN ''' + stStartTime + ''' AND ''' + stEndTime + ''' ';
  if stNodeNo = '' then
  begin
    if stBuildingCode <> '0' then stSql := stSql + ' AND b.BC_BUILDINGCODE Like ''' + stBuildingCode + '%'' ';
  end else
  begin
    if stNodeNo <> '' then stSql := stSql + ' AND a.ND_NODENO = ' + stNodeNo + ' ';
    if stEcuID <> '' then stSql := stSql + ' AND a.DE_ECUID = ''' + stEcuID + ''' ';
    if stDoorNo <> '' then stSql := stSql + ' AND a.DO_DOORNO = ' + stDoorNo + ' ';
  end;
  if ed_CompanyName.Text <> '' then
  begin
    stSql := stSql + ' AND f.GL_COMPANYNAME Like N''%' + ed_CompanyName.Text + '%'' ';
  end;
  if ed_name.Text <> '' then
  begin
    stSql := stSql + ' AND f.GL_NAME Like N''%' + ed_name.Text + '%'' ';
  end;


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
        Exit;
      End;
      if recordcount < 1 then Exit;
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
          cells[0,nRow] := MakeDatetimeStr(FindField('AE_DATE').AsString+FindField('AE_TIME').AsString);
          cells[1,nRow] := FindField('BUILDINGNAME1').AsString;
          cells[2,nRow] := FindField('BUILDINGNAME2').AsString;
          cells[3,nRow] := FindField('DO_DOORNAME').AsString;
          cells[4,nRow] := FindField('CA_CARDNO').AsString;
          cells[5,nRow] := FindField('GL_COMPANYNAME').AsString;
          cells[6,nRow] := FindField('GL_NAME').AsString;
          cells[7,nRow] := FindField('GL_TELNUMBER').AsString;
          cells[8,nRow] := FindField('AP_PERMITCODENAME1').AsString;
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

procedure TfmGuestReport.tv_buildingNameDblClick(Sender: TObject);
begin
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  LoadDoor(ed_BuildingCode.Text,DoorCodeList,TComboBox(cmb_Door),True,'��ü');

end;

end.
