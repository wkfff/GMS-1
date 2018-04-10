unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, AdvProgr,Data.Win.ADODB,ActiveX;

type
  TfmMain = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ed_ZTBMSPort: TEdit;
    ed_ZTBMSUserID: TEdit;
    ed_ZTBMSUserPW: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_GMSIP: TEdit;
    ed_GMSPort: TEdit;
    ed_GMSUserID: TEdit;
    ed_GMSUserPW: TEdit;
    btn_DataBaseConnect: TButton;
    btn_Convert: TButton;
    Progress: TAdvProgress;
    Label9: TLabel;
    ed_ZTBMSDBName: TEdit;
    Label10: TLabel;
    ed_GMSDBName: TEdit;
    lb_Message: TLabel;
    lb_count: TLabel;
    ed_ZTBMSIP: TEdit;
    rg_Mssql: TRadioButton;
    RadioButton2: TRadioButton;
    procedure btn_DataBaseConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_ConvertClick(Sender: TObject);
  private
    L_nCardType:integer; //0.����4byte,1.����ī��,2.KT���
    L_stHeadQuartersCode : string;
    AddDeviceIDList : TStringList;
    { Private declarations }
    function ConvertTB_ACCESSDEVICE : Boolean;
    function ConvertTB_ARMAREA : Boolean;
    function ConvertTB_CARD : Boolean;
    function ConvertTB_CARDFINGER:Boolean;
    function ConvertTB_COMPANY : Boolean;
    function ConvertTB_DEVICECARDNO : Boolean;
    function ConvertTB_DEVICESCHEDULE : Boolean;
    function ConvertTB_DOOR : Boolean;
    function ConvertTB_EMPLOYEE : Boolean;
    function ConvertTB_HOLIDAY : Boolean;
    function ConvertTB_LOCATION : Boolean;
    function ConvertTB_POSI : Boolean;
    function ConvertTB_TIMECODE : Boolean;
    function ConvertTB_ZONEDEVICE : Boolean;

    function CreateTB_BuildingCode(aCode,aName,aDeepSeq:string;aViewSeq:string='1') : Boolean;
    function CreateTB_COMPANYCode(aCode,aName,aDeepSeq:string;aViewSeq:string='1') : Boolean;
  private
    function GetTB_SLOCAL_Code(aCode,aLocalCode,aSLocalCode:string):string;
    function GetTB_SLOCAL_Code_Building(aCode,aLocalCode,aSLocalCode:string):string;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses
  uMIAMSDataBase,
  uKTAMSDataBase,
  uCommonFunction,
  uCommonVariable;
{$R *.dfm}

procedure TfmMain.btn_ConvertClick(Sender: TObject);
var
  stheadQuartersName : string;
  i : integer;
begin
  btn_Convert.enabled := False;
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('ATTEND','USE','1');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('CARD','CARDREGISTFORM','0');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('CARD','DEFAULTARMPERMITTYPE','2'); //��ü���Ѿ���
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('CARD','DEFAULTDOORPERMITTYPE','2');  //��ü���Ѿ���
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('CARD','EMPLOYEESEARCH','1');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('CARD','FPTYPE','1');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('CARDDELETE','APPLYTYPE','1');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('CARDDELETE','DAYTERM','90');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('CARDDELETE','DELETETYPE','2');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('COMMON','ATAUTO','1');  //�����ڵ����Ѻο�
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('COMMON','FDAUTO','1');  //�ļ��ڵ����Ѻο�
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('COMMON','CARDBUTTONSTAT','0');  //���Թ�ư ��� ����
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('COMMON','MAXDOORCOUNT','8');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('COMMON','PGTYPE','2');    //0.�Ϲ�,1.�бⱹ��,2.��Ÿ
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('COMMON','PROTOCOL','0');  //0.Ȯ�����,1.����ġ����
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('COMMON','ACEVENT','0');//��ü�̷�
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('DAEMON','PACKETTYPE','3'); //0.KTT,1.STEC,2.SK,3.KTT�Ϲ�
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('DAEMON','USEARMLEN','TRUE');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('DATABASE','AC_DELETE','720');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('DATABASE','AT_DELETE','720');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('DATABASE','FD_DELETE','720');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('DATABASE','PT_DELETE','720');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('FIRE','USEFIREOPEN','1');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('FOOD','USE','1');
  dmGMSDataBase.UpdateGMSTB_CONFIG_Value('REPORT','SEARCHTYPE','1');

  dmGMSDataBase.UpdateGMSTB_ALARMEVENTSTATEPCCODE_Sound('000LT000','1');

  ConvertTB_LOCATION;
  ConvertTB_ACCESSDEVICE;
  ConvertTB_ARMAREA;

  ConvertTB_COMPANY;
  ConvertTB_POSI;
  ConvertTB_EMPLOYEE;

  ConvertTB_CARD;
  ConvertTB_CARDFINGER;

  ConvertTB_DOOR;
  ConvertTB_DEVICECARDNO;
  ConvertTB_HOLIDAY;
  ConvertTB_DEVICESCHEDULE;
  ConvertTB_TIMECODE;
  ConvertTB_ZONEDEVICE;

  showmessage('��ȯ�Ϸ�');

  btn_Convert.enabled := False;
  btn_DataBaseConnect.Enabled := True;
end;

procedure TfmMain.btn_DataBaseConnectClick(Sender: TObject);
var
  stSql : string;
  stValue : string;
begin
  btn_DataBaseConnect.Enabled := True;
  btn_Convert.Enabled := False;

  dmZTBMSDataBase.DataBaseDisConnect;
  if rg_Mssql.Checked then
    dmZTBMSDataBase.DataBaseConnect(MSSQL,ed_ZTBMSIP.Text,ed_ZTBMSPort.Text,ed_ZTBMSUserID.Text,ed_ZTBMSUserPW.Text,ed_ZTBMSDBName.Text,False)
  else dmZTBMSDataBase.DataBaseConnect(POSTGRESQL,ed_ZTBMSIP.Text,ed_ZTBMSPort.Text,ed_ZTBMSUserID.Text,ed_ZTBMSUserPW.Text,ed_ZTBMSDBName.Text,False);
  if Not dmZTBMSDataBase.DBConnected then
  begin
    showmessage('ZTBMS �����ͺ��̽� ȯ�漳���� Ȯ���� �ּ���.');
    Exit;
  end;
  stSql := 'ALTER TABLE tb_device_cardno ADD RELAY char(1) ';
  dmZTBMSDataBase.ProcessExecSQL(stSql);

  dmGMSDataBase.DataBaseDisConnect;
  dmGMSDataBase.DataBaseConnect(MSSQL,ed_GMSIP.Text,ed_GMSPort.Text,ed_GMSUserID.Text,ed_GMSUserPW.Text,ed_GMSDBName.Text,False);
  if Not dmGMSDataBase.DBConnected then
  begin
    showmessage('GMS �����ͺ��̽� ȯ�漳���� Ȯ���� �ּ���.');
    Exit;
  end;
  stValue := dmZTBMSDataBase.GetTB_CONFIG_Value('COMMON','CARDNOTYPE');
  L_nCardType := strtoint(stValue);
  btn_DataBaseConnect.Enabled := False;
  btn_Convert.Enabled := True;
  //btn_passwordchange.Enabled := True;
end;

function TfmMain.ConvertTB_ACCESSDEVICE: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  stBuildingCode : string;
  stDeviceID : string;
  stEcuID : string;
  stDoorNo : string;
  stArmAreaNo : string;
  stServerNo : string;
  stDeviceType : string;
  nNodeNo : integer;
  nViewDoor : integer;
  nDoorViewSeq : integer;
  nArmAreaViewSeq : integer;
  i,j,k : integer;
begin
  lb_Message.Caption := 'TB_ACCESSDEVICE Converting...';
  stSql := 'Select * from TB_ACCESSDEVICE order by AC_NODENO,AC_ECUID';
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        stBuildingCode := '0';
        if(FindField('LO_DONGCODE').AsString <> '000') then
        begin
          stBuildingCode := stBuildingCode + FindField('LO_DONGCODE').AsString;
          if(FindField('LO_FLOORCODE').AsString <> '000') then
          begin
            stBuildingCode := stBuildingCode + FindField('LO_FLOORCODE').AsString;
            if(FindField('LO_AREACODE').AsString <> '000') then  stBuildingCode := stBuildingCode + FindField('LO_AREACODE').AsString;
          end;
        end;

        stDeviceType := '0'; //'0'.��Ʈ�ѷ�,'1'.�������
        stServerNo := '1';
        nNodeNo := FindField('AC_NODENO').AsInteger;
        stEcuID := FindField('AC_ECUID').AsString;
        if (stEcuID = '00') and  (dmGMSDataBase.CheckTB_NODE_NodeNo(inttostr(nNodeNo)) <> 1) then
        begin
          dmGMSDataBase.InsertIntoGMSTB_NODE_Value(inttostr(nNodeNo),'1','0000000',FindField('AC_MCUIP').AsString,FindField('AC_DEVICENAME').AsString,stDeviceType,stServerNo,stBuildingCode,'','','');
          dmGMSDataBase.InsertIntoGMSTB_NODERCV_NodeNo(inttostr(nNodeNo));
        end;
        dmGMSDataBase.InsertIntoGMSTB_DEVICE_DeviceInit(inttostr(nNodeNo),stEcuID,'0',FindField('AC_DEVICENAME').AsString,stBuildingCode,'1');
        dmGMSDataBase.InsertIntoGMSTB_DEVICERCV_DeviceInit(inttostr(nNodeNo),stEcuID,'0');
        //Ÿ���ڵ� -> Ÿ���ڵ������̺� ����
        dmGMSDataBase.InsertIntoGMSTB_TIMECODEDEVICE_TimeCodeToDevice(inttostr(nNodeNo),stEcuID,'0');
        dmGMSDataBase.copyHoliDayToDevice(inttostr(nNodeNo),stEcuID);
        for j := 1 to 8 do
        begin
          dmGMSDataBase.InsertIntoGMSTB_DOOR_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('AC_DEVICENAME').AsString ,stBuildingCode,'0','0' );
          dmGMSDataBase.InsertIntoGMSTB_DOORRCV_DeviceDoorInit(inttostr(nNodeNo),stEcuID,inttostr(j));

          Application.ProcessMessages;
        end;
        for j := 0 to 8 do
        begin
          dmGMSDataBase.InsertIntoGMSTB_ARMAREA_DeviceArmAreaInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('AC_DEVICENAME').AsString ,stBuildingCode,'0','0','0' );
          Application.ProcessMessages;
        end;
        for j := 0 to 8 do
        begin
          for k := 1 to 8 do
          begin
            dmGMSDataBase.InsertIntoGMSTB_ZONE_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),inttostr(k),FindField('AC_DEVICENAME').AsString + '_' + inttostr(k),stBuildingCode);
            dmGMSDataBase.InsertIntoGMSTB_ZONERCV_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),inttostr(k));
            Application.ProcessMessages;
          end;
          if j = 0 then
            dmGMSDataBase.InsertIntoGMSTB_ZONEEXTENTION_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('AC_DEVICENAME').AsString + inttostr(j),'1')
          else dmGMSDataBase.InsertIntoGMSTB_ZONEEXTENTION_ZoneInit(inttostr(nNodeNo),stEcuID,inttostr(j),FindField('AC_DEVICENAME').AsString + '_' + inttostr(j),'0');
        end;
        for j := 1 to 8 do
        begin
          dmGMSDataBase.InsertIntoGMSTB_READER_ReaderInit(inttostr(nNodeNo),stEcuID,inttostr(j));
          dmGMSDataBase.InsertIntoGMSTB_READERRCV_ReaderInit(inttostr(nNodeNo),stEcuID,inttostr(j));
          Application.ProcessMessages;
        end;

        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_ACCESSDEVICE Convert Success';
end;

function TfmMain.ConvertTB_ARMAREA: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  stBuildingCode : string;
  stDeviceID : string;
  stEcuID : string;
  stDoorNo : string;
  stArmAreaNo : string;
  stServerNo : string;
  stDeviceType : string;
  nNodeNo : integer;
  nViewDoor : integer;
  nDoorViewSeq : integer;
  nArmAreaViewSeq : integer;
  i,j,k : integer;
begin
  lb_Message.Caption := 'TB_ARMAREA Converting...';
  stSql := 'Select * from TB_ARMAREA  ';
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        stBuildingCode := '0';
        if(FindField('LO_DONGCODE').AsString <> '000') then
        begin
          stBuildingCode := stBuildingCode + FindField('LO_DONGCODE').AsString;
          if(FindField('LO_FLOORCODE').AsString <> '000') then
          begin
            stBuildingCode := stBuildingCode + FindField('LO_FLOORCODE').AsString;
            if(FindField('LO_AREACODE').AsString <> '000') then  stBuildingCode := stBuildingCode + FindField('LO_AREACODE').AsString;
          end;
        end;
        nNodeNo := FindField('AC_NODENO').AsInteger;
        stEcuID := FindField('AC_ECUID').AsString;
        stArmAreaNo := inttostr(FindField('AR_AREANO').AsInteger);
        dmGMSDataBase.UpdateGMSTB_ARMAREA_Field_StringValue(inttostr(nNodeNo),stEcuID,'0',stArmAreaNo,'AR_ARMAREANAME',FindField('AR_NAME').AsString );
        dmGMSDataBase.UpdateGMSTB_ARMAREA_Field_StringValue(inttostr(nNodeNo),stEcuID,'0',stArmAreaNo,'BC_BUILDINGCODE',stBuildingCode );

        if FindField('AR_USE').AsString = 'Y' then
        begin
          dmGMSDataBase.UpdateGMSTB_ARMAREA_Field_IntValue(inttostr(nNodeNo),stEcuID,'0',stArmAreaNo,'AR_ARMAREAUSE','1' );
          dmGMSDataBase.UpdateGMSTB_ARMAREA_Field_IntValue(inttostr(nNodeNo),stEcuID,'0',stArmAreaNo,'AR_VIEW','1' );
        end;
        dmGMSDataBase.UpdateGMSTB_ARMAREA_Field_IntValue(inttostr(nNodeNo),stEcuID,'0',stArmAreaNo,'AR_VIEWSEQ',FindField('AR_VIEWSEQ').AsString );

        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_ARMAREA Convert Success';
end;

function TfmMain.ConvertTB_Card: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  stCompanyCode : string;
  nEmSeq : integer;
  stEmCode : string;
  stRegDate : string;
  stValidDate : string;
  stCardNo : string;
  nPositionNum : integer;
  nTemp : integer;
begin
  lb_Message.Caption := 'TB_Card Converting...';
  stSql := 'Select a.*,b.EM_SEQ from TB_CARD a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        stCardNo := FindField('CA_CARDNO').AsString;
        if L_nCardType = 0 then stCardNo := dmGMSDataBase.ConvertCardnoDigitTo16Byte(stCardNo);

        if FindField('EM_SEQ').IsNull then
        begin
          nEmSeq := dmGMSDataBase.GetTB_EMPLOYEE_NextEmSeq;
          stEmCode := dmGMSDataBase.GetTB_EMPLOYEE_NextEmCode;
          stRegDate := FormatDateTime('yyyymmdd',now); // FindField('REG_DAY').AsString;
          stValidDate := '99991231';
          dmGMSDataBase.InsertIntoGMSTB_EMPLOYEE_Value(inttostr(nEmSeq), stEmCode,
                          stCardNo, '0', '0', '0','','','', '', stRegDate, stValidDate, '1', '1', '1',
                          '0', '3', '0', '1', '1');
        end else
        begin
          nEmSeq := FindField('EM_SEQ').AsInteger;
        end;
        nPositionNum := FindField('POSITIONNUM').AsInteger;
        if dmGMSDataBase.CheckTB_CARD(stCardNo,nTemp) <> 1 then
          dmGMSDataBase.InsertIntoGMSTB_CARD_Value(stCardNo,'1','1',inttostr(nPositionNum),inttostr(nPositionNum),'0',inttostr(nEmSeq),'');


        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_Card Convert Success';
end;



function TfmMain.ConvertTB_CARDFINGER: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  stCompanyCode : string;
  nEmSeq : integer;
  stEmCode : string;
  stRegDate : string;
  stValidDate : string;
  stCardNo : string;
  nPositionNum : integer;
  stPositionNum : string;
  nTemp : integer;
  stFingerCardNo : string;
  stRelayID : string;
begin
  lb_Message.Caption := 'TB_CARDFINGER Converting...';
  stSql := 'Select a.*,b.POSITIONNUM,c.EM_SEQ from TB_CARDFINGER a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(a.FP_CARDNO = b.CA_CARDNO) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = c.EM_CODE ) ';
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        if dmGMSDataBase.CheckTB_EMPLOYEEFINGER_Value(FindField('EM_SEQ').AsString,'1') < 1 then
        begin
          stPositionNum := inttostr(dmGMSDataBase.GetTB_CARD_NextPositionNum);
          stFingerCardNo := dmGMSDataBase.GetTB_CARD_FingerCardNo(stPositionNum);      //Finger Card ���� ��� ����.
          stRelayID := dmGMSDataBase.GetNextTB_CARD_RelayID;
          dmGMSDataBase.InsertIntoGMSTB_CARD_Value(stFingerCardNo,'1','0',stPositionNum,stRelayID,'0',FindField('EM_SEQ').AsString,'');
          dmGMSDataBase.InsertIntoGMSTB_EMPLOYEEFINGER_Template(FindField('EM_SEQ').AsString,'1',FindField('FP_DATA').AsString,'','','','','');
          dmGMSDataBase.UpdateGMSTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_FINGERUSE','1');
        end;
        dmGMSDataBase.UpdateGMSTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(FindField('EM_SEQ').AsString,'N');

        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_CARDFINGER Convert Success';
end;

function TfmMain.ConvertTB_COMPANY: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  nViewSeq : integer;
  stCode : string;
begin
  lb_Message.Caption := 'TB_COMPANY Converting...';
  stSql := 'Select * from TB_COMPANY order by CO_COMPANYCODE,CO_JIJUMCODE,CO_DEPARTCODE,CO_GUBUN';
  nViewSeq := 0;
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        inc(nViewSeq);
        stCode := '0' + FindField('CO_COMPANYCODE').AsString;
        if FindField('CO_GUBUN').AsInteger > 1 then stCode := stCode + FindField('CO_JIJUMCODE').AsString;
        if FindField('CO_GUBUN').AsInteger > 2 then stCode := stCode + FindField('CO_DEPARTCODE').AsString;

        CreateTB_CompanyCode(stCode,FindField('CO_NAME').AsString,inttostr(FindField('CO_GUBUN').AsInteger),FindField('CO_VIEWSEQ').AsString );

        Progress.Position := Progress.Position + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_COMPANY Convert Success';
end;

function TfmMain.ConvertTB_DEVICECARDNO: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  stBuildingCode : string;
  stDeviceID : string;
  stEcuID : string;
  stDoorNo : string;
  stArmAreaNo : string;
  stServerNo : string;
  stDeviceType : string;
  nNodeNo : integer;
  nViewDoor : integer;
  nDoorViewSeq : integer;
  nArmAreaViewSeq : integer;
  i,j,k : integer;
  stCardNo : string;
  stPermit : string;
  stEmSeq : string;
  stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8 : string;
  stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8:string;
begin
  lb_Message.Caption := 'TB_DEVICECARDNO Converting...';
  stSql := 'Select a.*,c.EM_SEQ from TB_DEVICECARDNO a  ';
  stSql := stSql + ' Inner Join TB_CARD b ';
  stSql := stSql + ' ON(a.CA_CARDNO = b.CA_CARDNO) ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = c.EM_CODE ) ';
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        nNodeNo := FindField('AC_NODENO').AsInteger;
        stEcuID := FindField('AC_ECUID').AsString;
        stServerNo := '1';
        stCardNo := FindField('CA_CARDNO').AsString;
        if L_nCardType = 0 then stCardNo := dmGMSDataBase.ConvertCardnoDigitTo16Byte(stCardNo);
        if Uppercase(FindField('DE_PERMIT').AsString) = 'L' then stPermit := '1'
        else stPermit := '0';
        stEmSeq := FindField('EM_SEQ').AsString;

        if Uppercase(FindField('DE_DOOR1').AsString) = 'Y' then stDoor1 := '1'
        else stDoor1 := '0';
        if Uppercase(FindField('DE_DOOR2').AsString) = 'Y' then stDoor2 := '1'
        else stDoor2 := '0';
        if Uppercase(FindField('DE_DOOR3').AsString) = 'Y' then stDoor3 := '1'
        else stDoor3 := '0';
        if Uppercase(FindField('DE_DOOR4').AsString) = 'Y' then stDoor4 := '1'
        else stDoor4 := '0';
        if Uppercase(FindField('DE_DOOR5').AsString) = 'Y' then stDoor5 := '1'
        else stDoor5 := '0';
        if Uppercase(FindField('DE_DOOR6').AsString) = 'Y' then stDoor6 := '1'
        else stDoor6 := '0';
        if Uppercase(FindField('DE_DOOR7').AsString) = 'Y' then stDoor7 := '1'
        else stDoor7 := '0';
        if Uppercase(FindField('DE_DOOR8').AsString) = 'Y' then stDoor8 := '1'
        else stDoor8 := '0';

        if Uppercase(FindField('DE_ALARM0').AsString) = 'Y' then stArmArea0 := '1'
        else stArmArea0 := '0';
        if Uppercase(FindField('DE_ALARM1').AsString) = 'Y' then stArmArea1 := '1'
        else stArmArea1 := '0';
        if Uppercase(FindField('DE_ALARM2').AsString) = 'Y' then stArmArea2 := '1'
        else stArmArea2 := '0';
        if Uppercase(FindField('DE_ALARM3').AsString) = 'Y' then stArmArea3 := '1'
        else stArmArea3 := '0';
        if Uppercase(FindField('DE_ALARM4').AsString) = 'Y' then stArmArea4 := '1'
        else stArmArea4 := '0';
        if Uppercase(FindField('DE_ALARM5').AsString) = 'Y' then stArmArea5 := '1'
        else stArmArea5 := '0';
        if Uppercase(FindField('DE_ALARM6').AsString) = 'Y' then stArmArea6 := '1'
        else stArmArea6 := '0';
        if Uppercase(FindField('DE_ALARM7').AsString) = 'Y' then stArmArea7 := '1'
        else stArmArea7 := '0';
        if Uppercase(FindField('DE_ALARM8').AsString) = 'Y' then stArmArea8 := '1'
        else stArmArea8 := '0';

        if isDigit(stEmSeq) then
        begin
          if dmGMSDataBase.CheckTB_CARDPERMIT_Value(inttostr(nNodeNo),stEcuID,'0',stCardNo) <> 1 then
          begin
            dmGMSDataBase.InsertIntoGMSTB_CARDPERMIT_VALUE(inttostr(nNodeNo),stEcuID,'0',stCardNo,stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
               stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
          end;
          if stDoor1 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','1',stEmSeq) <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','1','1',stPermit,'Y');
            end;
          end;
          if stDoor2 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','2',stEmSeq) <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','1','2',stPermit,'Y');
            end;
          end;
          if stDoor3 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','3',stEmSeq) <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','1','3',stPermit,'Y');
            end;
          end;
          if stDoor4 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','4',stEmSeq) <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','1','4',stPermit,'Y');
            end;
          end;
          if stDoor5 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','5',stEmSeq) <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','1','5',stPermit,'Y');
            end;
          end;
          if stDoor6 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','6',stEmSeq) <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','1','6',stPermit,'Y');
            end;
          end;
          if stDoor7 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','7',stEmSeq) <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','1','7',stPermit,'Y');
            end;
          end;
          if stDoor8 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','8',stEmSeq) <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','1','8',stPermit,'Y');
            end;
          end;
          if stArmArea0 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','0',stEmSeq,'2') <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','2','0',stPermit,'Y');
            end;
          end;
          if stArmArea1 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','1',stEmSeq,'2') <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','2','1',stPermit,'Y');
            end;
          end;
          if stArmArea2 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','2',stEmSeq,'2') <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','2','2',stPermit,'Y');
            end;
          end;
          if stArmArea3 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','3',stEmSeq,'2') <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','2','3',stPermit,'Y');
            end;
          end;
          if stArmArea4 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','4',stEmSeq,'2') <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','2','4',stPermit,'Y');
            end;
          end;
          if stArmArea5 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','5',stEmSeq,'2') <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','2','5',stPermit,'Y');
            end;
          end;
          if stArmArea6 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','6',stEmSeq,'2') <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','2','6',stPermit,'Y');
            end;
          end;
          if stArmArea7 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','7',stEmSeq,'2') <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','2','7',stPermit,'Y');
            end;
          end;
          if stArmArea8 = '1' then
          begin
            if dmGMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_VALUE(inttostr(nNodeNo),stEcuID,'0','8',stEmSeq,'2') <> 1 then
            begin
              dmGMSDataBase.InsertIntoGMSTB_CARDPERMITEMPLOYEECODE_VALUE(stEmSeq,inttostr(nNodeNo),stEcuID,'0','2','8',stPermit,'Y');
            end;
          end;
        end;

        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_DEVICECARDNO Convert Success';
end;

function TfmMain.ConvertTB_DEVICESCHEDULE: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  stBuildingCode : string;
  stDeviceID : string;
  stEcuID : string;
  stDoorNo : string;
  stArmAreaNo : string;
  stServerNo : string;
  stDeviceType : string;
  nNodeNo : integer;
  nViewDoor : integer;
  nDoorViewSeq : integer;
  nArmAreaViewSeq : integer;
  i,j,k : integer;
begin
  lb_Message.Caption := 'TB_DEVICESCHEDULE Converting...';
  stSql := 'Select * from TB_DEVICESCHEDULE  ';
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        if dmGMSDataBase.CheckTB_DOORSCHEDULE_DayCode(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,inttostr(FindField('DO_DOORNO').AsInteger),FindField('DE_DAYCODE').AsString ) = 0 then
        begin
          dmGMSDataBase.InsertIntoGMSTB_DOORSCHEDULE_All(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,inttostr(FindField('DO_DOORNO').AsInteger),FindField('DE_DAYCODE').AsString,FindField('DE_CELL1TIME').AsString,
                                               FindField('DE_CELL2TIME').AsString,FindField('DE_CELL3TIME').AsString,FindField('DE_CELL4TIME').AsString,FindField('DE_CELL5TIME').AsString,
                                               FindField('DE_CELL1MODE').AsString,FindField('DE_CELL2MODE').AsString,FindField('DE_CELL3MODE').AsString,FindField('DE_CELL4MODE').AsString,FindField('DE_CELL5MODE').AsString,'Y');
        end;


        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_DEVICESCHEDULE Convert Success';
end;

function TfmMain.ConvertTB_DOOR: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  stBuildingCode : string;
  stDeviceID : string;
  stEcuID : string;
  stDoorNo : string;
  stArmAreaNo : string;
  stServerNo : string;
  stDeviceType : string;
  nNodeNo : integer;
  nViewDoor : integer;
  nDoorViewSeq : integer;
  nArmAreaViewSeq : integer;
  i,j,k : integer;
begin
  lb_Message.Caption := 'TB_DOOR Converting...';
  stSql := 'Select * from TB_DOOR  ';
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        stBuildingCode := '0';
        if(FindField('LO_DONGCODE').AsString <> '000') then
        begin
          stBuildingCode := stBuildingCode + FindField('LO_DONGCODE').AsString;
          if(FindField('LO_FLOORCODE').AsString <> '000') then
          begin
            stBuildingCode := stBuildingCode + FindField('LO_FLOORCODE').AsString;
            if(FindField('LO_AREACODE').AsString <> '000') then  stBuildingCode := stBuildingCode + FindField('LO_AREACODE').AsString;
          end;
        end;
        nNodeNo := FindField('AC_NODENO').AsInteger;
        stEcuID := FindField('AC_ECUID').AsString;

        dmGMSDataBase.UpdateGMSTB_DOOR_Field_StringValue(inttostr(nNodeNo),stEcuID,'0',FindField('DO_DOORNO').AsString,'DO_DOORNAME',FindField('DO_DOORNONAME').AsString );
        dmGMSDataBase.UpdateGMSTB_DOOR_Field_StringValue(inttostr(nNodeNo),stEcuID,'0',FindField('DO_DOORNO').AsString,'DO_DOORUSE','1' );
        dmGMSDataBase.UpdateGMSTB_DOOR_Field_StringValue(inttostr(nNodeNo),stEcuID,'0',FindField('DO_DOORNO').AsString,'DO_SCHEDULEUSE',FindField('DO_SCHUSE').AsString );
        dmGMSDataBase.UpdateGMSTB_DOOR_Field_StringValue(inttostr(nNodeNo),stEcuID,'0',FindField('DO_DOORNO').AsString,'DO_VIEW','1' );
        dmGMSDataBase.UpdateGMSTB_DOOR_Field_IntValue(inttostr(nNodeNo),stEcuID,'0',FindField('DO_DOORNO').AsString,'DO_VIEWSEQ',FindField('DO_VIEWSEQ').AsString );
        dmGMSDataBase.UpdateGMSTB_DOOR_Field_StringValue(inttostr(nNodeNo),stEcuID,'0',FindField('DO_DOORNO').AsString,'DO_NAMECHANGE','1' );


        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_DOOR Convert Success';
end;

function TfmMain.ConvertTB_EMPLOYEE: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  stCompanyCode : string;
  nEmSeq : integer;
  stEmCode : string;
  stRegDate : string;
  stValidDate : string;
  stCardNo : string;
  nPositionNum : integer;
  stPosiCode : string;
begin
  lb_Message.Caption := 'TB_EMPLOYEE Converting...';

  dmZTBMSDataBase.AlterTB_EMPLOYEE_EMSEQ_ADD;
  stSql := 'Select * from TB_EMPLOYEE ';
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        if FindField('EM_SEQ').IsNull or (FindField('EM_SEQ').AsInteger = 0)  then
        begin
          nEmSeq := dmGMSDataBase.GetTB_EMPLOYEE_NextEmSeq;
          dmZTBMSDataBase.UpdateTB_EMPLOYEE_Field_IntValue(FindField('CO_COMPANYCODE').AsString,FindField('EM_CODE').AsString,'EM_SEQ',inttostr(nEmSeq));
        end else
        begin
          nEmSeq := FindField('EM_SEQ').AsInteger;
        end;
        stEmCode := FindField('EM_CODE').AsString;
        stRegDate := FindField('EM_JOINDATE').AsString;
        stValidDate := FindField('EM_RETIREDATE').AsString;
        stCompanyCode := '0';
        if(FindField('CO_COMPANYCODE').AsString <> '000') then
        begin
          stCompanyCode := stCompanyCode + FindField('CO_COMPANYCODE').AsString;
          if(FindField('CO_JIJUMCODE').AsString <> '000') then
          begin
            stCompanyCode := stCompanyCode + FindField('CO_JIJUMCODE').AsString;
            if(FindField('CO_DEPARTCODE').AsString <> '000') then  stCompanyCode := stCompanyCode + FindField('CO_DEPARTCODE').AsString;
          end;
        end;
        stPosiCode := FindField('PO_POSICODE').AsString;
        if Not isDigit(stPosiCode) then stPosiCode := '0';

        dmGMSDataBase.InsertIntoGMSTB_EMPLOYEE_Value(inttostr(nEmSeq), stEmCode,
                        FindField('EM_NAME').AsString, stCompanyCode, stPosiCode, '0',FindField('EM_COPHONE').AsString,FindField('EM_HOMEPHONE').AsString,
                        FindField('EM_HANDPHONE').AsString, FindField('EM_ADDR1').AsString + FindField('EM_ADDR2').AsString, stRegDate, stValidDate, '1', '1', '1',
                        '0', '3', '0', '1', '1');

        Progress.Position := Progress.Position + 1;
        lb_count.Caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_EMPLOYEE Convert Success';

end;

function TfmMain.ConvertTB_HOLIDAY: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  nViewSeq : integer;
  stCode : string;
begin
  lb_Message.Caption := 'TB_HOLIDAY Converting...';
  stSql := 'Select * from TB_HOLIDAY where HO_STATE =''I''';

  nViewSeq := 0;
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        dmGMSDataBase.InsertIntoGMSTB_HOLIDAY_Value(FindField('HO_DAY').AsString,FindField('HO_DESC').AsString,'1','1',FindField('HO_TYPE').AsString);
        dmGMSDataBase.DeleteTB_HOLIDAYDEVICE_DayAll(FindField('HO_DAY').AsString);      //��ü ��� ���� ��
        dmGMSDataBase.CopyHolidayToAllDevice(FindField('HO_DAY').AsString,FindField('HO_TYPE').AsString);           //��ü ��� Ư������ �Է� ����.

        Progress.Position := Progress.Position + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_HOLIDAY Convert Success';
end;

function TfmMain.ConvertTB_LOCATION: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  nViewSeq : integer;
  stCode : string;
begin
  lb_Message.Caption := 'TB_LOCATION Converting...';
  stSql := 'Select * from TB_LOCATION order by LO_VIEWSEQ,LO_DONGCODE,LO_FLOORCODE,LO_AREACODE';
  nViewSeq := 0;
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        inc(nViewSeq);
        stCode := '0' + FindField('LO_DONGCODE').AsString;
        if FindField('LO_GUBUN').AsInteger > 0 then stCode := stCode + FindField('LO_FLOORCODE').AsString;
        if FindField('LO_GUBUN').AsInteger > 1 then stCode := stCode + FindField('LO_AREACODE').AsString;

        CreateTB_BuildingCode(stCode,FindField('LO_NAME').AsString,inttostr(FindField('LO_GUBUN').AsInteger + 1),inttostr(nViewSeq));

        Progress.Position := Progress.Position + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_LOCATION Convert Success';
end;

function TfmMain.ConvertTB_POSI: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
  nViewSeq : integer;
  stCode : string;
  stCompanyCode : string;
begin
  lb_Message.Caption := 'TB_POSI Converting...';
  stSql := 'Select * from TB_POSI order by CO_COMPANYCODE,PO_POSICODE';
  nViewSeq := 0;
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        inc(nViewSeq);
        stCompanyCode := '0';// + FindField('CO_COMPANYCODE').AsString;

        dmGMSDataBase.InsertIntoGMSTB_POSICODE_Value(inttostr(FindField('PO_POSICODE').AsInteger),FindField('PO_NAME').AsString,stCompanyCode,FindField('PO_VIEWSEQ').AsString );

        Progress.Position := Progress.Position + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_POSI Convert Success';
end;

function TfmMain.ConvertTB_TIMECODE: Boolean;
begin
  //�̰� ���� ��������.
end;

function TfmMain.ConvertTB_ZONEDEVICE: Boolean;
var
  TempZTBMSAdoQuery : TAdoQuery;
  stSql : string;
begin
  lb_Message.Caption := 'TB_ZONEDEVICE Converting...';
  stSql := 'Select * from TB_ZONEDEVICE';
  Try
    CoInitialize(nil);
    TempZTBMSAdoQuery := TADOQuery.Create(nil);
    TempZTBMSAdoQuery.Connection := dmZTBMSDataBase.ADOConnection;
    TempZTBMSAdoQuery.DisableControls;

    with TempZTBMSAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;
      Progress.Max := Recordcount;
      Progress.Position := 0;

      while Not Eof do
      begin

        dmGMSDataBase.UpdateGMSTB_ZONE_Field_StringValue(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'0',FindField('AL_ZONENUM').AsString,'ZN_ZONENAME',FindField('AL_ZONENAME').AsString );
        dmGMSDataBase.UpdateGMSTB_ZONE_Field_StringValue(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'0',FindField('AL_ZONENUM').AsString,'ZN_NAMECHANGE','1');

        Progress.Position := Progress.Position + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempZTBMSAdoQuery.EnableControls;
    TempZTBMSAdoQuery.Free;
    CoUninitialize;
  End;
  lb_Message.Caption := 'TB_POSI Convert Success';
end;

function TfmMain.CreateTB_BuildingCode(aCode,aName,aDeepSeq:string;aViewSeq:string='1'): Boolean;
var
  stSql : string;
begin
  if dmGMSDataBase.CheckTB_BUILDINGCODE_Code(aCode,aDeepSeq) <> 1 then
  begin
    dmGMSDataBase.InsertIntoGMSTB_BUILDINGCODE_Value(aCode,aName,aDeepSeq,'1',aViewSeq);
  end;
  result := True;

end;

function TfmMain.CreateTB_COMPANYCode(aCode,aName,aDeepSeq:string;aViewSeq:string='1'): Boolean;
var
  stSql : string;
begin
  if dmGMSDataBase.CheckTB_COMPANYCODE_Code(aCode,aDeepSeq) <> 1 then
  begin
    dmGMSDataBase.InsertIntoGMSTB_COMPANYCODE_Value(aCode,aName,aDeepSeq,'1',aViewSeq);
  end;
  result := True;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  lb_Message.Caption := '';
  G_stExeFolder := ExtractFileDir(Application.ExeName);
  AddDeviceIDList := TStringList.Create;
end;

function TfmMain.GetTB_SLOCAL_Code(aCode, aLocalCode,
  aSLocalCode: string): string;
var
  stCompanyCode : string;
  stCompanyName : string;
  nNextSeq : integer;
  nViewSeq : integer;
  nDeepSeq : integer;
begin
  stCompanyCode := dmZTBMSDataBase.GetTB_SLOCAL_CompanyCode(aSLocalCode,stCompanyName);

  if Trim(stCompanyCode) = '' then
  begin
    if dmZTBMSDataBase.CheckTB_LOCAL_Code(aLocalCode) <> 1 then  //���� ���� �ڵ尡 ���� ���� ������ ���� �Ҽ����� ó�� ����.
    begin
      stCompanyCode := aCode;
    end else
    begin
      if stCompanyName = '' then
      begin
        stCompanyCode := aCode;
      end else
      begin
        if dmGMSDataBase.CheckTB_COMPANYCODE_Code(aCode + aLocalCode,'2') = 1 then  //���� �����ڵ尡 ��� �Ǿ� ������ �ش� ���� �ؿ� �ڵ带 ��� �Ѵ�.
        begin
          nNextSeq := dmGMSDataBase.GetTB_COMPANY_NextSeq(aCode + aLocalCode,'3',nViewSeq);
          stCompanyCode := aCode + aLocalCode + FillZeroNumber(nNextSeq,3);
          dmGMSDataBase.InsertIntoGMSTB_COMPANYCODE_Value(stCompanyCode,stCompanyName,'3','1',inttostr(nViewSeq));
          dmZTBMSDataBase.UpdateTB_SLOCAL_CompanyCode(aSLocalCode,stCompanyCode);
        end else
        begin
          stCompanyCode := aCode; //������ ��� �Ǿ� ���� ������ ���� �Ҽ����� ���´�.
        end;
      end;
    end;
  end else
  begin
    nDeepSeq := Length(stCompanyCode) div 3;
    //Ȥ�� ���⿡�� ȸ�� �ڵ尡 ���� ���� ������ �ٽ� �Ҵ� �޾ƾ� �Ѵ�. �׽�Ʈ �Ŀ� ���� ����� �� ��ƾ�� Ÿ�� �ȴ�.
    if dmGMSDataBase.CheckTB_COMPANYCODE_Code(stCompanyCode,inttostr(nDeepSeq)) <> 1 then
    begin
      if stCompanyName = '' then
      begin
        stCompanyCode := aCode;
      end else
      begin
        nNextSeq := dmGMSDataBase.GetTB_COMPANY_NextSeq(aCode + aLocalCode,inttostr(nDeepSeq),nViewSeq);
        stCompanyCode := aCode + FillZeroNumber(nNextSeq,3);
        dmGMSDataBase.InsertIntoGMSTB_COMPANYCODE_Value(stCompanyCode,stCompanyName,inttostr(nDeepSeq),'1',inttostr(nViewSeq));
        dmZTBMSDataBase.UpdateTB_SLOCAL_CompanyCode(aSLocalCode,stCompanyCode);
      end;
    end;
  end;
  result := stCompanyCode;
end;

function TfmMain.GetTB_SLOCAL_Code_Building(aCode, aLocalCode,
  aSLocalCode: string): string;
var
  stBuildingCode : string;
  stBuildingName : string;
  nNextSeq : integer;
  nViewSeq : integer;
begin
  stBuildingCode := dmZTBMSDataBase.GetTB_SLOCAL_BuildingCode(aSLocalCode,stBuildingName);

  if Trim(stBuildingCode) = '' then
  begin
    if dmZTBMSDataBase.CheckTB_LOCAL_Code(aLocalCode) <> 1 then  //���� ���� �ڵ尡 ���� ���� ������ ���� �Ҽ����� ó�� ����.
    begin
      stBuildingCode := aCode;
    end else
    begin
      if stBuildingName = '' then
      begin
        stBuildingCode := aCode;
      end else
      begin
        if dmGMSDataBase.CheckTB_BUILDINGCODE_Code(aCode + aLocalCode,'2') = 1 then  //���� �����ڵ尡 ��� �Ǿ� ������ �ش� ���� �ؿ� �ڵ带 ��� �Ѵ�.
        begin
          nNextSeq := dmGMSDataBase.GetTB_BUILDING_NextSeq(aCode + aLocalCode,'3',nViewSeq);
          stBuildingCode := aCode + aLocalCode + FillZeroNumber(nNextSeq,3);
          dmGMSDataBase.InsertIntoGMSTB_BUILDINGCODE_Value(stBuildingCode,stBuildingName,'3','1',inttostr(nViewSeq));
          dmZTBMSDataBase.UpdateTB_SLOCAL_BUILDINGCode(aSLocalCode,stBuildingCode);
        end else
        begin
          stBuildingCode := aCode; //������ ��� �Ǿ� ���� ������ ���� �Ҽ����� ���´�.
        end;
      end;
    end;
  end else
  begin
    //Ȥ�� ���⿡�� ȸ�� �ڵ尡 ���� ���� ������ �ٽ� �Ҵ� �޾ƾ� �Ѵ�. �׽�Ʈ �Ŀ� ���� ����� �� ��ƾ�� Ÿ�� �ȴ�.
    if dmGMSDataBase.CheckTB_BUILDINGCODE_Code(stBuildingCode,'3') <> 1 then
    begin
      if stBuildingName = '' then
      begin
        stBuildingCode := aCode;
      end else
      begin
        nNextSeq := dmGMSDataBase.GetTB_BUILDING_NextSeq(aCode + aLocalCode,'3',nViewSeq);
        stBuildingCode := aCode + FillZeroNumber(nNextSeq,3);
        dmGMSDataBase.InsertIntoGMSTB_BUILDINGCODE_Value(stBuildingCode,stBuildingName,'3','1',inttostr(nViewSeq));
        dmZTBMSDataBase.UpdateTB_SLOCAL_BUILDINGCode(aSLocalCode,stBuildingCode);
      end;
    end;
  end;
  result := stBuildingCode;

end;

end.