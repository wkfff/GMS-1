unit uDoorMemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfmDoorMemo = class(TForm)
    Label1: TLabel;
    ed_DoorName: TEdit;
    Label2: TLabel;
    mem_doorMemo: TMemo;
    btn_Save: TSpeedButton;
    btn_Cancel: TSpeedButton;
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    FEcuID: string;
    FNodeNo: integer;
    FSave: Boolean;
    FDoorName: string;
    FDoorNo: integer;
    procedure SetDoorName(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property NodeNo : integer read FNodeNo write FNodeNo;
    property EcuID : string read FEcuID write FEcuID;
    property DoorNo : integer read FDoorNo write FDoorNo;
    property DoorName : string read FDoorName write SetDoorName;
    property Save : Boolean read FSave write FSave;
  end;

var
  fmDoorMemo: TfmDoorMemo;

implementation
uses
  uDBUpdate;

{$R *.dfm}

{ TfmDoorMemo }

procedure TfmDoorMemo.btn_CancelClick(Sender: TObject);
begin
  Save := False;
  Close;
end;

procedure TfmDoorMemo.btn_SaveClick(Sender: TObject);
begin
  if dmDBUpdate.UpdateTB_DOOR_Field_StringValue(inttostr(NodeNo),EcuID,'0',inttostr(DoorNo),'DO_MEMO',mem_DoorMemo.text) then
  begin
    Save := True;
    Close;
  end else
  begin
    showmessage('출입문 메모 저장 실패');
  end;
end;

procedure TfmDoorMemo.SetDoorName(const Value: string);
begin
  FDoorName := Value;
  ed_DoorName.Text := Value;
end;

end.
