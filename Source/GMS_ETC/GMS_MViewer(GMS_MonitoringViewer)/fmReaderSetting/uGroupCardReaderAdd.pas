unit uGroupCardReaderAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvAppStyler, Vcl.StdCtrls, AdvCombo;

type
  TfmGroupCardReaderAdd = class(TForm)
    AdvFormStyler1: TAdvFormStyler;
    lb_node: TLabel;
    cmb_Node: TAdvComboBox;
    lb_ControlerID: TLabel;
    cmb_Device: TAdvComboBox;
    lb_ReaderNo: TLabel;
    cmb_Reader: TAdvComboBox;
    btn_Add: TButton;
    btn_Cancel: TButton;
    Label1: TLabel;
    cmb_InOut: TAdvComboBox;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_NodeChange(Sender: TObject);
  private
    DeviceList : TStringList;
    NodeList : TStringList;
    FSave: Boolean;
    FEcuID: string;
    FReaderNo: string;
    FNodeNo: string;
    FInOutType: string;
    FNodeIP: string;
    FUpdateType: integer;
    { Private declarations }
    procedure FormNameSetting;
    procedure SetUpdateType(const Value: integer);
  public
    { Public declarations }
    property Save : Boolean read FSave write FSave;

    property NodeNo : string read FNodeNo write FNodeNo;
    property NodeIP : string read FNodeIP write FNodeIP;
    property EcuID : string read FEcuID write FEcuID;
    property ReaderNo : string read FReaderNo write FReaderNo;
    property InOutType : string read FInOutType write FInOutType;

    property UpdateType : integer read FUpdateType write SetUpdateType;
  end;

var
  fmGroupCardReaderAdd: TfmGroupCardReaderAdd;

implementation

uses
  uComboBoxCodeLoad,
  uFormFunction;

{$R *.dfm}

{ TfmGroupCardReaderAdd }

procedure TfmGroupCardReaderAdd.btn_AddClick(Sender: TObject);
begin
  NodeNo := NodeList.Strings[cmb_Node.ItemIndex];
  NodeIP := cmb_Node.Text;
  EcuID := cmb_Device.Text;
  ReaderNo := cmb_Reader.Text;
  InOutType := inttostr(cmb_InOut.ItemIndex);

  Save := True;
  Close;
end;

procedure TfmGroupCardReaderAdd.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGroupCardReaderAdd.cmb_NodeChange(Sender: TObject);
var
  stNode : string;
begin
  stNode := NodeList.Strings[cmb_Node.ItemIndex];
  LoadDevice(stNode,DeviceList,TComboBox(cmb_Device),False,'',1);
  if cmb_Device.Items.Count > 0 then cmb_Device.ItemIndex := 0;

end;

procedure TfmGroupCardReaderAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceList.free;
  NodeList.free;
end;

procedure TfmGroupCardReaderAdd.FormCreate(Sender: TObject);
var
  stNode : string;
  i : integer;
begin
  DeviceList := TStringList.Create;
  NodeList := TStringList.Create;
  FormNameSetting;
  LoadNode(NodeList,TComboBox(cmb_Node),False,'',1);
  if cmb_Node.Items.Count > 0 then cmb_Node.ItemIndex := 0;
  stNode := NodeList.Strings[cmb_Node.ItemIndex];
  cmb_NodeChange(cmb_Node);
  cmb_Reader.Clear;
  for i := 1 to 8 do cmb_Reader.Items.Add(inttostr(i));
  cmb_Reader.ItemIndex := 0;
end;

procedure TfmGroupCardReaderAdd.FormNameSetting;
begin
  lb_node.Caption := dmFormFunction.GetFormName('0','2','COMMONNODEIP01');
  lb_ControlerID.Caption := dmFormFunction.GetFormName('0','2','COMMONCONTROLERID');
  lb_ReaderNo.Caption := dmFormFunction.GetFormName('0','2','COMMONREADERNO');
end;

procedure TfmGroupCardReaderAdd.SetUpdateType(const Value: integer);
var
  nIndex : integer;
begin
  FUpdateType := Value;
  if Value = 1 then
  begin
    nIndex := NodeList.IndexOf(NodeNo);
    cmb_Node.ItemIndex := nIndex;
    cmb_NodeChange(cmb_Node);
    nIndex := DeviceList.IndexOf(NodeNo + EcuID);
    cmb_Device.ItemIndex := nIndex;
    cmb_Reader.ItemIndex := strtoint(ReaderNo) -1;
    cmb_inout.ItemIndex := strtoint(InOutType);
  end;
end;

end.