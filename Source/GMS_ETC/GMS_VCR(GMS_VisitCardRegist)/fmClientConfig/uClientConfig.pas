unit uClientConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, Vcl.StdCtrls,System.IniFiles,Winapi.WinSpool;

type
  TfmClientConfig = class(TForm)
    GroupBox1: TGroupBox;
    lb_RegCardType: TLabel;
    cmb_RegType: TComboBox;
    lb_cardPort: TLabel;
    cmb_Comport: TComboBox;
    ed_FingerIP: TEdit;
    btn_Save: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    ed_FingerPort: TEdit;
    Label1: TLabel;
    ed_AreaCD: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_RegTypeChange(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    ComPortList : TStringList;
    { Private declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;
  public
    { Public declarations }
  end;

var
  fmClientConfig: TfmClientConfig;

implementation
uses
  uCommonVariable;
{$R *.dfm}

procedure TfmClientConfig.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmClientConfig.btn_SaveClick(Sender: TObject);
var
  nComPort : integer;
  i : integer;
  ini_fun : TiniFile;
begin
  nComPort := 0;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\GMS_VCR.INI');
    with ini_fun do
    begin
      WriteInteger('Config','CardRegType',cmb_RegType.ItemIndex);
      WriteString('Config','CardRegIP',ed_FingerIP.Text);
      WriteString('Config','CardRegFingerPort',ed_FingerPort.Text);
      WriteString('Config','AREACD',ed_AreaCD.Text);
      G_stCardRegisterFingerPort := ed_FingerPort.Text;
      if ComPortList.Count > 0 then
      begin
        if cmb_ComPort.ItemIndex > -1 then
        begin
          if cmb_ComPort.ItemIndex = 0 then nComPort := 0
          else
          begin
            nComPort := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex - 1]);
          end;
          WriteInteger('Config','CardRegPort',nComPort);
          G_nCardRegisterPort := nComPort;
        end;
      end;
    end;
  Finally
    ini_fun.free;
  End;
  Close;
end;

procedure TfmClientConfig.cmb_RegTypeChange(Sender: TObject);
begin
  if cmb_RegType.ItemIndex = 0 then
  begin
    lb_cardPort.Caption := 'ī�帮�� ��Ʈ';
    cmb_Comport.Visible := True;
    ed_FingerIP.Visible := False;
    ed_FingerPort.Visible := False;
  end else if cmb_RegType.ItemIndex = 1 then
  begin
    lb_cardPort.Caption := '��������������';
    cmb_Comport.Visible := False;
    ed_FingerIP.Visible := True;
    ed_FingerIP.Left := cmb_Comport.Left;
    ed_FingerPort.Visible := True;
  end;
end;

function TfmClientConfig.DecodeCommportName(PortName: String): WORD;
var
 Pt : Integer;
begin
 PortName := UpperCase(PortName);
 if (Copy(PortName, 1, 3) = 'COM') then begin
    Delete(PortName, 1, 3);
    Pt := Pos(':', PortName);
    if Pt = 0 then Result := 0
       else Result := StrToInt(Copy(PortName, 1, Pt-1));
 end
 else if (Copy(PortName, 1, 7) = '\\.\COM') then begin
    Delete(PortName, 1, 7);
    Result := StrToInt(PortName);
 end
 else Result := 0;

end;

function TfmClientConfig.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

procedure TfmClientConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ComPortList.Free;
end;

procedure TfmClientConfig.FormCreate(Sender: TObject);
var
  nCount : integer;
  i : integer;
  stComPort : string;
  nIndex : integer;
begin
  cmb_RegType.ItemIndex := G_nCardRegisterType;
  cmb_RegTypeChange(self);
  ed_FingerIP.Text := G_stCardRegisterIP;
  ed_FingerPort.Text := G_stCardRegisterFingerPort;
  ed_AreaCD.Text := G_stGuestAreaCode;
  ComPortList := TStringList.Create;
  ComPortList.Clear;

  nCount := GetSerialPortList(ComPortList,False);
  cmb_ComPort.Clear;
  cmb_ComPort.Items.add('Not Use');
  cmb_ComPort.ItemIndex := -1;
  if nCount = 0 then
  begin
    Exit;
  end;

  for i:= 0 to nCount - 1 do
  begin
    cmb_ComPort.items.Add(ComPortList.Strings[i])
  end;
  if G_nCardRegisterPort > 0 then
  begin
    stComPort := EncodeCommportName(G_nCardRegisterPort);
    nIndex := cmb_ComPort.Items.IndexOf(stComPort);
    if nIndex > -1 then cmb_ComPort.ItemIndex := nIndex;
  end else
    cmb_ComPort.ItemIndex := 0;

end;

function TfmClientConfig.GetSerialPortList(List: TStringList;
  const doOpenTest: Boolean): LongWord;
type
 TArrayPORT_INFO_1 = array[0..0] Of PORT_INFO_1;
 PArrayPORT_INFO_1 = ^TArrayPORT_INFO_1;
var
{$IF USE_ENUMPORTS_API}
 PL : PArrayPORT_INFO_1;
 TotalSize, ReturnCount : LongWord;
 Buf : String;
 CommNum : WORD;
{$IFEND}
 I : LongWord;
 CHandle : THandle;
begin
 List.Clear;
{$IF USE_ENUMPORTS_API}
 EnumPorts(nil, 1, nil, 0, TotalSize, ReturnCount);
 if TotalSize < 1 then begin
    Result := 0;
    Exit;
    end;
 GetMem(PL, TotalSize);
 EnumPorts(nil, 1, PL, TotalSize, TotalSize, Result);

 if Result < 1 then begin
    FreeMem(PL);
    Exit;
    end;

 for I:=0 to Result-1 do begin
    Buf := UpperCase(PL^[I].pName);
    CommNum := DecodeCommportName(PL^[I].pName);
    if CommNum = 0 then Continue;
    List.AddObject(EncodeCommportName(CommNum), Pointer(CommNum));
    end;
{$ELSE}
 for I:=1 to 255 do List.AddObject(EncodeCommportName(I), Pointer(I));
{$IFEND}
 // Open Test
 if List.Count > 0 then for I := List.Count-1 downto 0 do begin
    CHandle := CreateFile(PChar(List[I]), GENERIC_WRITE or GENERIC_READ,
     0, nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL,
     0);
    if CHandle = INVALID_HANDLE_VALUE then begin
if doOpenTest or (GetLastError() <> ERROR_ACCESS_DENIED) then List.Delete(I);
Continue;
end;
    CloseHandle(CHandle);
    end;

 Result := List.Count;
{$IF USE_ENUMPORTS_API}
 if Assigned(PL) then FreeMem(PL);
{$IFEND}

end;

end.