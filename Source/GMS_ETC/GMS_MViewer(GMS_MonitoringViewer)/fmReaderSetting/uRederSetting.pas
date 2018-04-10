unit uRederSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, AdvAppStyler,System.Types,System.StrUtils,
  Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,uSubForm, CommandArray,
  Vcl.Imaging.pngimage;

type
  TfmReaderSetting = class(TfmASubForm)
    Panel1: TPanel;
    btn_Close: TButton;
    AdvFormStyler1: TAdvFormStyler;
    pan_Body: TPanel;
    sg_Reader: TAdvStringGrid;
    btn_Add: TButton;
    btn_Delete: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_ReaderCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure sg_ReaderDblClick(Sender: TObject);
  private
    L_nCheckCount : integer;
    FPanelNo: integer;
    { Private declarations }
    procedure FormNameSetting;
    procedure LoadStringGridFromCSV(aFileName:string;aGrid:TAdvStringGrid);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    property PanelNo : integer read FPanelNo write FPanelNo;
  end;

var
  fmReaderSetting: TfmReaderSetting;

implementation

uses
  uCommonVariable,
  uFormFunction,
  uDBFormMessage,
  uDBFunction,
  uGroupCardReaderAdd;
{$R *.dfm}

procedure TfmReaderSetting.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmReaderSetting.btn_AddClick(Sender: TObject);
var
  nRow : integer;
begin
  inherited;
  fmGroupCardReaderAdd := TfmGroupCardReaderAdd.create(nil);
  fmGroupCardReaderAdd.Caption := btn_Add.Caption;
  fmGroupCardReaderAdd.showmodal;
  if fmGroupCardReaderAdd.Save then
  begin
    nRow := sg_Reader.RowCount - 1;
    if sg_Reader.Cells[5,nRow] <> '' then
    begin
      sg_Reader.AddRow;
      nRow := sg_Reader.RowCount - 1;
    end;
    sg_Reader.AddCheckBox(0,nRow,False,False);
    with sg_Reader do
    begin
      cells[1,nRow] := fmGroupCardReaderAdd.NodeIP;
      cells[2,nRow] := fmGroupCardReaderAdd.EcuID;
      cells[3,nRow] := fmGroupCardReaderAdd.ReaderNo;
      if (fmGroupCardReaderAdd.InOutType = '0') then cells[4,nRow] := 'IN'
      else cells[4,nRow] := 'OUT';
      cells[5,nRow] := fmGroupCardReaderAdd.NodeNo;
      cells[6,nRow] := fmGroupCardReaderAdd.InOutType;
    end;
  end;
  fmGroupCardReaderAdd.free;
end;

procedure TfmReaderSetting.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmReaderSetting.btn_DeleteClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_Delete.Caption,[rfReplaceAll]);
  if L_nCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  with sg_Reader do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        if RowCount > 2 then RemoveRows(i,1)
        else ClearRows(i,1);
      end;
    end;
  end;

end;

procedure TfmReaderSetting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  sg_Reader.SaveToCSV(G_stExeFolder + '\Reader' + inttostr(PanelNo) + '.dat' );
end;

procedure TfmReaderSetting.FormNameSetting;
begin
  with sg_Reader do
  begin
    Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONNODEIP01');
    Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONCONTROLERID');
    Cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONREADERNO');
    Cells[4,0] := 'IN/OUT';
    Cells[5,0] := 'NodeNo';
    Cells[6,0] := 'In/OutType';
  end;
end;

procedure TfmReaderSetting.FormShow(Sender: TObject);
begin
  GridInit(sg_Reader,5,2,True);
  if FileExists(G_stExeFolder + '\Reader' + inttostr(PanelNo) + '.dat') then LoadStringGridFromCSV(G_stExeFolder + '\Reader' + inttostr(PanelNo) + '.dat',sg_Reader);
  FormNameSetting;
end;

procedure TfmReaderSetting.LoadStringGridFromCSV(aFileName: string;
  aGrid: TAdvStringGrid);
var
  Strings: TStringList;
  Row, Col: Integer;
  Items: TStringDynArray;
begin
  aGrid.RowCount := 2;//clear any previous data
  Strings := TStringList.Create;
  try
    Strings.LoadFromFile(aFileName);
    if Strings.Count < 2 then Exit;

    aGrid.RowCount := Strings.Count;
    for Row := 1 to Strings.Count-1 do
    begin
      Items := SplitString(Strings[Row], ',');
      for Col := 0 to aGrid.ColCount-1 do
      begin
        if Col = 0 then
        begin
          aGrid.AddCheckBox(0,Row,False,False);
        end else if Col = 5 then
        begin
          aGrid.Cells[Col, Row] := StringReplace(Items[Col],'"','',[rfReplaceAll]);
          aGrid.Cells[1, Row] := dmDBFunction.GetTB_NODE_NodeIP(aGrid.Cells[Col, Row]);
        end else
        begin
          if Col<Length(Items) then
            aGrid.Cells[Col, Row] := StringReplace(Items[Col],'"','',[rfReplaceAll])
          else
            aGrid.Cells[Col, Row] := ' ';
        end;
      end;
    end;
  finally
    Strings.Free;
  end;

end;

procedure TfmReaderSetting.sg_ReaderCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //��ü���� �Ǵ� ����
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

procedure TfmReaderSetting.sg_ReaderDblClick(Sender: TObject);
begin
  inherited;
  fmGroupCardReaderAdd := TfmGroupCardReaderAdd.create(nil);
  fmGroupCardReaderAdd.Caption := 'Update';
  with sg_Reader do
  begin
    fmGroupCardReaderAdd.NodeIP := cells[1,Row];
    fmGroupCardReaderAdd.EcuID := cells[2,Row];
    fmGroupCardReaderAdd.ReaderNo := cells[3,Row];
    fmGroupCardReaderAdd.NodeNo := cells[5,Row];
    fmGroupCardReaderAdd.InOutType := cells[6,Row];
    fmGroupCardReaderAdd.UpdateType := 1;
  end;
  fmGroupCardReaderAdd.showmodal;
  if fmGroupCardReaderAdd.Save then
  begin
    with sg_Reader do
    begin
      cells[1,Row] := fmGroupCardReaderAdd.NodeIP;
      cells[2,Row] := fmGroupCardReaderAdd.EcuID;
      cells[3,Row] := fmGroupCardReaderAdd.ReaderNo;
      if (fmGroupCardReaderAdd.InOutType = '0') then cells[4,Row] := 'IN'
      else cells[4,Row] := 'OUT';
      cells[5,Row] := fmGroupCardReaderAdd.NodeNo;
      cells[6,Row] := fmGroupCardReaderAdd.InOutType;
    end;
  end;
  fmGroupCardReaderAdd.free;
end;

end.