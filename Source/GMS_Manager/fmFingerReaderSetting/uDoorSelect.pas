unit uDoorSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, AdvGlowButton,
  Vcl.StdCtrls, AdvEdit, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, AdvSmoothLabel,
  Vcl.ExtCtrls, AdvSplitter, AdvSmoothPanel, W7Classes, W7Panels, AdvOfficePager,
  AdvAppStyler, AdvOfficePagerStylers, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  Vcl.ImgList,Data.Win.ADODB,uSubForm, CommandArray, Vcl.Imaging.pngimage,ActiveX;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmDoorSelect = class(TfmASubForm)
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    AdvSplitter1: TAdvSplitter;
    AdvSmoothPanel1: TAdvSmoothPanel;
    lb_BuildingList: TLabel;
    sg_Door: TAdvStringGrid;
    pan_left: TAdvSmoothPanel;
    Label1: TLabel;
    tv_List: TTreeView;
    tv_Code: TTreeView;
    btn_Select: TAdvGlowButton;
    MenuImageList16: TImageList;
    procedure FormActivate(Sender: TObject);
    procedure tv_ListClick(Sender: TObject);
    procedure btn_SelectClick(Sender: TObject);
    procedure sg_DoorDblClick(Sender: TObject);
  private
    L_stSelectBuildingCode : string;
    FSelectBuildingCode: string;
    FSelectDoorName: string;
    FSelectDoorID: string;
    { Private declarations }
    procedure SearchDoorList(aCode:string;aTopRow:integer=0);
  public
    { Public declarations }
    property SelectBuildingCode : string read FSelectBuildingCode write FSelectBuildingCode;
    property SelectDoorID : string read FSelectDoorID write FSelectDoorID;
    property SelectDoorName : string read FSelectDoorName write FSelectDoorName;
  end;

var
  fmDoorSelect: TfmDoorSelect;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uDataBase;

{$R *.dfm}

procedure TfmDoorSelect.btn_SelectClick(Sender: TObject);
begin
  inherited;
  SelectDoorID := '1' + FillZeroStrNum(sg_Door.cells[3,sg_Door.Row],G_nNodeCodeLength) +
                    FillZeroStrNum(sg_Door.cells[4,sg_Door.Row],2) +
                    FillZeroStrNum(sg_Door.cells[5,sg_Door.Row],2) +
                    FillZeroStrNum(sg_Door.cells[6,sg_Door.Row],2);
  SelectDoorName := sg_Door.cells[0,sg_Door.Row];
  Close;
end;

procedure TfmDoorSelect.FormActivate(Sender: TObject);
begin
  LoadBuildingTreeView(SelectBuildingCode,tv_List,tv_Code,con_LocalBuildingImageIndex);
  tv_ListClick(tv_List);
//
end;

procedure TfmDoorSelect.SearchDoorList(aCode: string; aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_Door,1,2,False);
  stSql := ' Select a.*,c.BC_BUILDINGNAME,d.DG_NAME from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';   //컨트롤러 사용중인거에서
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND b.DE_EXTENDID = 0 ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Left Join TB_BUILDINGCODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE = c.BC_BUILDINGCODE ) ';
  stSql := stSql + ' Left Join TB_DOORGUBUN d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.DG_CODE = d.DG_CODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
  stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + L_stSelectBuildingCode + '%'' ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ ';
  Try
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
      if recordcount < 1 then Exit;
      with sg_Door do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('DO_DOORNAME').AsString;
          cells[1,nRow] := FindField('BC_BUILDINGNAME').AsString;
          cells[2,nRow] := FindField('DG_NAME').AsString;
          cells[3,nRow] := FindField('ND_NODENO').AsString;
          cells[4,nRow] := FindField('DE_ECUID').AsString;
          cells[5,nRow] := FindField('DE_EXTENDID').AsString;
          cells[6,nRow] := FindField('DO_DOORNO').AsString;

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmDoorSelect.sg_DoorDblClick(Sender: TObject);
begin
  inherited;
  btn_SelectClick(btn_Select);
end;

procedure TfmDoorSelect.tv_ListClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if tv_List.Selected = nil then tv_List.Items[0].Selected := True;

  lb_BuildingList.Caption := tv_List.Selected.Text;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;

  if L_stSelectBuildingCode = stCode then Exit;
  L_stSelectBuildingCode :=  stCode;
  SearchDoorList('');
end;

end.
