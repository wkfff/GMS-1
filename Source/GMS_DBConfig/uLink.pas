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
      showmessage('접속 실패.데이터베이스 환경 설정이 잘못 되었습니다.');
      Exit;
    end;
    Try
      ini_fun := TiniFile.Create(ExeFolder + '\Config.INI');
      nMonitoringType := ini_fun.ReadInteger('MONITORING','TYPE',-1); //0.일반,1.분기국사,2.SK출입전용(메인전용),3.SG생활안전
      nProgramType := ini_fun.ReadInteger('PROGRAM','TYPE',-1);
    Finally
      ini_fun.Free;
    End;

    if nMonitoringType = 1 then    //분기국사 타입이면...
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CARDNOTYPE','CO_CONFIGVALUE','0'); //'0.4Byte,1.16BYTE,2.KT사옥'
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CAPOSINUM','CO_CONFIGVALUE','0'); //카드 위치정보 사용유무
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ALARMMONITORING','CO_CONFIGVALUE','0'); //알람 모니터링 사용 유무
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PROTOCOL','CO_CONFIGVALUE','1'); //모니터링프로토콜타입 0.확장기사용,1.주장치전용
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','MAXDOORCOUNT','CO_CONFIGVALUE','1'); //최대출입문갯수
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ONLYMAINCOUNT','CO_CONFIGVALUE','100'); //패킷당 노드갯수
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('DAEMON','PACKETTYPE','CO_CONFIGVALUE','0'); //0.KTT,1.STEC,2.SK
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('CARD','FPTYPE','CO_CONFIGVALUE','1'); //1.카드발급사용안함,2.카드발급사용  CARDREGISTFORM
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('CARD','CARDREGISTFORM','CO_CONFIGVALUE','0'); //0.카드발급메뉴사용안함
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PGTYPE','CO_CONFIGVALUE','1'); //0.일반,1.분기국사,2.SK 모니터링 방법

    end else if nMonitoringType = 2 then //SK출입전용(메인전용이면)
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CARDNOTYPE','CO_CONFIGVALUE','1'); //'0.4Byte,1.16BYTE,2.KT사옥'
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CAPOSINUM','CO_CONFIGVALUE','0'); //카드 위치정보 사용유무
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ALARMMONITORING','CO_CONFIGVALUE','0'); //알람 모니터링 사용 유무
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PROTOCOL','CO_CONFIGVALUE','1'); //모니터링프로토콜타입 0.확장기사용,1.주장치전용
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','MAXDOORCOUNT','CO_CONFIGVALUE','4'); //최대출입문갯수
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ONLYMAINCOUNT','CO_CONFIGVALUE','25'); //패킷당 노드갯수
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('DAEMON','PACKETTYPE','CO_CONFIGVALUE','2'); //0.KTT,1.STEC,2.SK
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PGTYPE','CO_CONFIGVALUE','2'); //0.일반,1.분기국사,2.SK 모니터링 방법
    end else if nMonitoringType = 3 then //SG생활안전
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CARDNOTYPE','CO_CONFIGVALUE','1'); //'0.4Byte,1.16BYTE,2.KT사옥'
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','CAPOSINUM','CO_CONFIGVALUE','0'); //카드 위치정보 사용유무
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ALARMMONITORING','CO_CONFIGVALUE','1'); //알람 모니터링 사용 유무
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PROTOCOL','CO_CONFIGVALUE','0'); //모니터링프로토콜타입 0.확장기사용,1.주장치전용
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','MAXDOORCOUNT','CO_CONFIGVALUE','4'); //최대출입문갯수
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ONLYMAINCOUNT','CO_CONFIGVALUE','25'); //패킷당 노드갯수
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('DAEMON','PACKETTYPE','CO_CONFIGVALUE','3'); //0.KTT,1.STEC,2.SK,3.SG생활안전
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','PGTYPE','CO_CONFIGVALUE','2'); //0.일반,1.분기국사,2.SK 모니터링 방법
    end;

(*    if nProgramType <> -1 then
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('DAEMON','PACKETTYPE','CO_CONFIGVALUE',inttostr(nProgramType)); //모니터링프로토콜타입 0.확장기사용,1.주장치전용
    end;
*)
    if rg_FireGroup.ItemIndex = 0 then
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FIRE','USEFIREOPEN','CO_CONFIGVALUE','0'); //'0.화재전파안함,1.화재전파'
    end else
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FIRE','USEFIREOPEN','CO_CONFIGVALUE','1'); //'0.화재전파안함,1.화재전파'
    end;

    if rg_ATPermit.ItemIndex = 0 then
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ATAUTO','CO_CONFIGVALUE','0'); //'0.화재전파안함,1.화재전파'
    end else
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','ATAUTO','CO_CONFIGVALUE','1'); //'0.화재전파안함,1.화재전파'
    end;

    if rg_FdPermit.ItemIndex = 0 then
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FDAUTO','CO_CONFIGVALUE','0'); //'0.화재전파안함,1.화재전파'
    end else
    begin
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('COMMON','FDAUTO','CO_CONFIGVALUE','1'); //'0.화재전파안함,1.화재전파'
    end;

    showmessage('적용이 완료되었습니다.');
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
