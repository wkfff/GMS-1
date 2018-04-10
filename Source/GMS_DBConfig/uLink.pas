unit uLink;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons,iniFiles,JclMime, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    RzOpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edserverip: TEdit;
    edPort: TEdit;
    edUserID: TEdit;
    edPass: TEdit;
    ed_DataBase: TEdit;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    rg_FireGroup: TRadioGroup;
    Label9: TLabel;
    rg_ATPermit: TRadioGroup;
    Label10: TLabel;
    rg_FDPermit: TRadioGroup;
    RadioButton2: TRadioButton;
    rg_Window: TRadioButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    L_DBTYPE :string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uDataBaseConfig,
  uDBUpdate;

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  ini_fun : TiniFile;
  ExeFolder : string;
  FileList:TStringList;
  nMonitoringType : integer;
  nProgramType : integer;
begin
    nMonitoringType := -1;

    ExeFolder  := ExtractFileDir(Application.ExeName);
    Try
      BitBtn1.Enabled := False;
      ini_fun := TiniFile.Create(ExeFolder + '\MIAMS.INI');

      with ini_fun do
      begin
        if rg_Window.Checked then WriteInteger('DBConfig','WindowAuth',1)
        else WriteInteger('DBConfig','WindowAuth',0);

        Writestring('DBConfig','Host',Trim(edserverip.Text));
        Writestring('DBConfig','Port',Trim(edPort.Text));
        Writestring('DBConfig','UserID',Trim(edUserID.Text));
        Writestring('DBConfig','UserPW',MimeEncodeString(Trim(edPass.Text)));
        Writestring('DBConfig','DBNAME',Trim(ed_DataBase.Text));

        Writestring('EVENTDBConfig','Host',Trim(edserverip.Text));
        Writestring('EVENTDBConfig','Port',Trim(edPort.Text));
        Writestring('EVENTDBConfig','UserID',Trim(edUserID.Text));
        Writestring('EVENTDBConfig','UserPW',MimeEncodeString(Trim(edPass.Text)));
        Writestring('EVENTDBConfig','DBNAME',Trim(ed_DataBase.Text));

        Writestring('LOGDBConfig','Host',Trim(edserverip.Text));
        Writestring('LOGDBConfig','Port',Trim(edPort.Text));
        Writestring('LOGDBConfig','UserID',Trim(edUserID.Text));
        Writestring('LOGDBConfig','UserPW',MimeEncodeString(Trim(edPass.Text)));
        Writestring('LOGDBConfig','DBNAME',Trim(ed_DataBase.Text));
      end;

    Finally
      ini_fun.Free;
    End;

    TDataBaseConfig.GetObject.DataBaseConnect(False);
    if Not TDataBaseConfig.GetObject.DBConnected then
    begin
      showmessage('���� ����.�����ͺ��̽� ȯ�� ������ �߸� �Ǿ����ϴ�.');
      Exit;
    end;
    Try
      ini_fun := TiniFile.Create(ExeFolder + '\Config.INI');
      nMonitoringType := ini_fun.ReadInteger('MONITORING','TYPE',-1); //0.�Ϲ�,1.�бⱹ��,2.SK��������(��������),3.SG��Ȱ����
      nProgramType := ini_fun.ReadInteger('PROGRAM','TYPE',-1);
    Finally
      ini_fun.Free;
    End;

    if nMonitoringType = 1 then    //�бⱹ�� Ÿ���̸�...
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CARDNOTYPE','CO_CONFIGVALUE','0'); //'0.4Byte,1.16BYTE,2.KT���'
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CAPOSINUM','CO_CONFIGVALUE','0'); //ī�� ��ġ���� �������
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ALARMMONITORING','CO_CONFIGVALUE','0'); //�˶� ����͸� ��� ����
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PROTOCOL','CO_CONFIGVALUE','1'); //����͸���������Ÿ�� 0.Ȯ�����,1.����ġ����
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','MAXDOORCOUNT','CO_CONFIGVALUE','1'); //�ִ����Թ�����
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ONLYMAINCOUNT','CO_CONFIGVALUE','100'); //��Ŷ�� ��尹��
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('DAEMON','PACKETTYPE','CO_CONFIGVALUE','0'); //0.KTT,1.STEC,2.SK
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('CARD','FPTYPE','CO_CONFIGVALUE','1'); //1.ī��߱޻�����,2.ī��߱޻��  CARDREGISTFORM
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('CARD','CARDREGISTFORM','CO_CONFIGVALUE','0'); //0.ī��߱޸޴�������
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PGTYPE','CO_CONFIGVALUE','1'); //0.�Ϲ�,1.�бⱹ��,2.SK ����͸� ���

    end else if nMonitoringType = 2 then //SK��������(���������̸�)
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CARDNOTYPE','CO_CONFIGVALUE','1'); //'0.4Byte,1.16BYTE,2.KT���'
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CAPOSINUM','CO_CONFIGVALUE','0'); //ī�� ��ġ���� �������
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ALARMMONITORING','CO_CONFIGVALUE','0'); //�˶� ����͸� ��� ����
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PROTOCOL','CO_CONFIGVALUE','1'); //����͸���������Ÿ�� 0.Ȯ�����,1.����ġ����
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','MAXDOORCOUNT','CO_CONFIGVALUE','4'); //�ִ����Թ�����
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ONLYMAINCOUNT','CO_CONFIGVALUE','25'); //��Ŷ�� ��尹��
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('DAEMON','PACKETTYPE','CO_CONFIGVALUE','2'); //0.KTT,1.STEC,2.SK
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PGTYPE','CO_CONFIGVALUE','2'); //0.�Ϲ�,1.�бⱹ��,2.SK ����͸� ���
    end else if nMonitoringType = 3 then //SG��Ȱ����
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CARDNOTYPE','CO_CONFIGVALUE','1'); //'0.4Byte,1.16BYTE,2.KT���'
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CAPOSINUM','CO_CONFIGVALUE','0'); //ī�� ��ġ���� �������
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ALARMMONITORING','CO_CONFIGVALUE','1'); //�˶� ����͸� ��� ����
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PROTOCOL','CO_CONFIGVALUE','0'); //����͸���������Ÿ�� 0.Ȯ�����,1.����ġ����
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','MAXDOORCOUNT','CO_CONFIGVALUE','4'); //�ִ����Թ�����
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ONLYMAINCOUNT','CO_CONFIGVALUE','25'); //��Ŷ�� ��尹��
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('DAEMON','PACKETTYPE','CO_CONFIGVALUE','3'); //0.KTT,1.STEC,2.SK,3.SG��Ȱ����
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PGTYPE','CO_CONFIGVALUE','2'); //0.�Ϲ�,1.�бⱹ��,2.SK ����͸� ���
    end;

(*    if nProgramType <> -1 then
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('DAEMON','PACKETTYPE','CO_CONFIGVALUE',inttostr(nProgramType)); //����͸���������Ÿ�� 0.Ȯ�����,1.����ġ����
    end;
*)
    if rg_FireGroup.ItemIndex = 0 then
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FIRE','USEFIREOPEN','CO_CONFIGVALUE','0'); //'0.ȭ�����ľ���,1.ȭ������'
    end else
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FIRE','USEFIREOPEN','CO_CONFIGVALUE','1'); //'0.ȭ�����ľ���,1.ȭ������'
    end;

    if rg_ATPermit.ItemIndex = 0 then
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ATAUTO','CO_CONFIGVALUE','0'); //'0.ȭ�����ľ���,1.ȭ������'
    end else
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ATAUTO','CO_CONFIGVALUE','1'); //'0.ȭ�����ľ���,1.ȭ������'
    end;

    if rg_FdPermit.ItemIndex = 0 then
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FDAUTO','CO_CONFIGVALUE','0'); //'0.ȭ�����ľ���,1.ȭ������'
    end else
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FDAUTO','CO_CONFIGVALUE','1'); //'0.ȭ�����ľ���,1.ȭ������'
    end;

    showmessage('������ �Ϸ�Ǿ����ϴ�.');
    Close;

end;

procedure TForm1.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  ExeFolder : string;
begin
    ExeFolder  := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(ExeFolder + '\MIAMS.INI');

    L_DBTYPE := ini_fun.ReadString('DBConfig','TYPE','MSSQL');
    if ini_fun.ReadInteger('DBConfig','WindowAuth',0) = 1 then rg_Window.Checked := True
    else RadioButton2.Checked := True;

    if UpperCase(L_DBTYPE) = 'PG' then
    begin
      Label4.Visible := False;
      edPort.Visible := False;
      Label5.Visible := True;
      edUserID.Visible := True;
      edServerIp.Text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      edPort.Text := ini_fun.ReadString('DBConfig','Port','5432');
      edUserID.Text := ini_fun.ReadString('DBConfig','UserID','postgres');
      edPass.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','MQ=='));
    end else if UpperCase(L_DBTYPE) = 'MSSQL' then
    begin
      Label4.Visible := True;
      edPort.Visible := True;
      Label5.Visible := True;
      edUserID.Visible := True;
      edServerIp.Text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      edPort.Text := ini_fun.ReadString('DBConfig','Port','1433');
      edUserID.Text := ini_fun.ReadString('DBConfig','UserID','sa');
      edPass.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','c2FwYXNzd2Q='));
    end else if UpperCase(L_DBTYPE) = 'FB' then
    begin
      Label4.Visible := True;
      edPort.Visible := True;
      Label5.Visible := True;
      edUserID.Visible := True;
      edServerIp.Text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      edPort.Text := ini_fun.ReadString('DBConfig','Port','3050');
      edUserID.Text := ini_fun.ReadString('DBConfig','UserID','SYSDBA');
      edPass.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW',''));
    end;
    ed_DataBase.Text := ini_fun.ReadString('DBConfig','DBNAME','GMS');

    ini_fun.Free;

end;

end.