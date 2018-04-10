unit uConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,System.IniFiles;

type
  TfmConfig = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmb_ReaderType: TComboBox;
    btn_Save: TButton;
    btn_close: TButton;
    gb_RelayType: TGroupBox;
    Label2: TLabel;
    cmb_RelayType: TComboBox;
    gb_RelayDBConfig: TGroupBox;
    Label3: TLabel;
    cmb_RelayDBType: TComboBox;
    Label4: TLabel;
    ed_RelayDBIP: TEdit;
    Label5: TLabel;
    ed_RelayDBPort: TEdit;
    Label6: TLabel;
    ed_RelayDBUserID: TEdit;
    Label7: TLabel;
    ed_RelayDBUserPW: TEdit;
    Label8: TLabel;
    ed_RelayDBName: TEdit;
    Label9: TLabel;
    ed_UserIDLen: TEdit;
    Label10: TLabel;
    ed_CardNoLen: TEdit;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_ReaderTypeChange(Sender: TObject);
    procedure cmb_RelayTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConfig: TfmConfig;

implementation
uses
  uCommonVariable,
  uDBUpdate;

{$R *.dfm}

procedure TfmConfig.btn_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TfmConfig.btn_SaveClick(Sender: TObject);
begin
  G_nFingerReaderType :=  cmb_ReaderType.ItemIndex + 1;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FINGER','TYPE','CO_CONFIGVALUE',inttostr(G_nFingerReaderType));
  G_nFingerRelayType :=  cmb_RelayType.ItemIndex + 1;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FINGER','RELAYTYPE','CO_CONFIGVALUE',inttostr(G_nFingerRelayType));
  G_nFingerRelayDBType :=  cmb_RelayDBType.ItemIndex + 1;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FINGER','RELAYDBTYPE','CO_CONFIGVALUE',inttostr(G_nFingerRelayDBType));
  G_stFingerRelayDBIP := ed_RelayDBIP.Text; //
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FINGER','RELAYDBIP','CO_CONFIGVALUE',G_stFingerRelayDBIP);
  G_stFingerRelayDBPort := ed_RelayDBPort.Text; //
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FINGER','RELAYDBPORT','CO_CONFIGVALUE',G_stFingerRelayDBPort);
  G_stFingerRelayDBUserID := ed_RelayDBUserID.Text; //
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FINGER','RELAYDBUSER','CO_CONFIGVALUE',G_stFingerRelayDBUserID);
  G_stFingerRelayDBUserPW := ed_RelayDBUserPW.Text; //
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FINGER','RELAYDBUSERPW','CO_CONFIGVALUE',G_stFingerRelayDBUserPW);
  G_stFingerRelayDBName := ed_RelayDBName.Text; //
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FINGER','RELAYDBNAME','CO_CONFIGVALUE',G_stFingerRelayDBName);
  G_nFPUserIDLength := strtoint(ed_UserIDLen.Text); //
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FINGER','READERUSERLEN','CO_CONFIGVALUE',inttostr(G_nFPUserIDLength));
  G_nFPUserCardLength := strtoint(ed_CardNoLen.Text); //
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FINGER','READERCARDLEN','CO_CONFIGVALUE',inttostr(G_nFPUserCardLength));


end;

procedure TfmConfig.cmb_ReaderTypeChange(Sender: TObject);
begin
  if cmb_ReaderType.ItemIndex = 0 then
  begin
    gb_RelayType.Visible := True;
  end else
  begin
    gb_RelayType.Visible := False;
  end;
end;

procedure TfmConfig.cmb_RelayTypeChange(Sender: TObject);
begin
  if cmb_RelayType.ItemIndex = 1 then
  begin
    gb_RelayDBConfig.Visible := True;
  end else
  begin
    gb_RelayDBConfig.Visible := False;
  end;

end;

procedure TfmConfig.FormActivate(Sender: TObject);
begin
  cmb_ReaderType.ItemIndex := G_nFingerReaderType - 1;
  cmb_ReaderTypeChange(cmb_ReaderType);
  cmb_RelayType.ItemIndex := G_nFingerRelayType - 1;
  cmb_RelayTypeChange(cmb_RelayType);
  cmb_RelayDBType.ItemIndex := G_nFingerRelayDBType - 1;
  ed_RelayDBIP.Text := G_stFingerRelayDBIP ; //
  ed_RelayDBPort.Text := G_stFingerRelayDBPort ; //
  ed_RelayDBUserID.Text := G_stFingerRelayDBUserID ; //
  ed_RelayDBUserPW.Text := G_stFingerRelayDBUserPW; //
  ed_RelayDBName.Text := G_stFingerRelayDBName; //
  ed_UserIDLen.Text := inttostr(G_nFPUserIDLength); //
  ed_CardNoLen.Text := inttostr(G_nFPUserCardLength); //
end;

end.
