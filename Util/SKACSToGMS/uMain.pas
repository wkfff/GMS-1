unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, AdvProgr,Data.Win.ADODB,ActiveX,
  Data.DB;


type
  TRelayDoor = class(TComponent)
  private
    DoorList : TstringList;
    FRelayDoorNo: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    function SetDoorList(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    function GetIndexDeviceInfo(aIndex:integer;var aNodeNo:string;var aEcuID:string;var aDoorNo:string;var aNextIndex:integer):integer;
  public
    property RelayDoorNo : string read FRelayDoorNo write FRelayDoorNo;
  end;

  TfmMain = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ed_KTAMSPort: TEdit;
    ed_KTAMSUserID: TEdit;
    ed_KTAMSUserPW: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_MIAMSIP: TEdit;
    ed_MIAMSPort: TEdit;
    ed_MIAMSUserID: TEdit;
    ed_MIAMSUserPW: TEdit;
    btn_DataBaseConnect: TButton;
    btn_Convert: TButton;
    Progress: TAdvProgress;
    Label9: TLabel;
    ed_KTAMSDBName: TEdit;
    Label10: TLabel;
    ed_MIAMSDBName: TEdit;
    lb_Message: TLabel;
    lb_count: TLabel;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ed_SKDBPort: TEdit;
    ed_SKDBUserID: TEdit;
    ed_SKDBUserPW: TEdit;
    ed_SKDBName: TEdit;
    ed_SKDBIP: TEdit;
    ed_SKACSIP: TEdit;
    Label16: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    lb_PerCount: TLabel;
    Label17: TLabel;
    ed_empno: TEdit;
    btn_GetEmpno: TButton;
    ed_ReaderPort: TEdit;
    Label18: TLabel;
    Button1: TButton;
    MDBADOConnection: TADOConnection;
    ADOTempQuery: TADOQuery;
    Button2: TButton;
    procedure btn_DataBaseConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_ConvertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_GetEmpnoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    RelayDoorList : TStringList;
    { Private declarations }
    procedure GetFinger_EmpCode(aEmCode:string);
    procedure ConvertTB_BUILDINGCODE;
    procedure ConvertTB_Node;
    procedure ConvertTB_DOOR;
    procedure ConvertTB_EMPLOYEEFromInsa;
    procedure UnLoadRelayDoorList;
    function GetTB_DOOR_NoFromRelayNo(aNo:string;aIndex:integer;var aNodeNo:string;var aEcuID:string;var aDoorNo:string;var aNextIndex:integer):integer;
    function GetMDBCardNo(aEmCode:string;var aPositionNum:string):string;
    procedure EmCodeToCardChange(aEmSeq,aEmCode:string);
    procedure EmCodeToFingerDataSave(aEmSeq,aEmCode,aFingerCardNo:string;aPositionNum:string);
    procedure EmployeeDoorPermit(aEmSeq,aNodeNo,aEcuID,aDoorNo,aDayPermit,aNightPermit:string);
    procedure EmployeePermitCreate(aEmSeq,aDayPermit,aNightPermit:string);
    Function EmployeePermitToCardLoad(aEmSeq:string):Boolean;
    Function EmployeePermitToCardDeviceLoad(aNodeNo,aEcuID,aEmSeq:string):Boolean;
    Function EmployeePermitToFingerLoad(aEmSeq: string): Boolean;
    Function EmployeeTimePermit(aEmseq,aNodeNo,aEcuID,aDoorNo,aDayPermit,aNightPermit:string):Boolean;
  private
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses
  uMIAMSDataBase,
  uSKACSDataBase,
  uSKOrgDataBase,
  uCommonFunction,
  uCommonVariable;
{$R *.dfm}

procedure TfmMain.btn_ConvertClick(Sender: TObject);
var
  stSql : string;
begin
  btn_Convert.enabled := False;
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('SYSTEMRELAY','USE','CO_CONFIGVALUE','1');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('SYSTEMRELAY','CUSTMOR','CO_CONFIGVALUE','2'); //SK증평
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('SYSTEMRELAY','CYCLE','CO_CONFIGVALUE','0'); //실시간연동
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1DBNAME','CO_CONFIGVALUE','SKIOMS'); //
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1IP','CO_CONFIGVALUE','168.154.8.47'); //
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1PORT','CO_CONFIGVALUE','1433'); //
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1TYPE','CO_CONFIGVALUE','1'); //MSSQL
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1USERID','CO_CONFIGVALUE','infouser'); //MSSQL
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('SYSTEMRELAY','DB1USERPW','CO_CONFIGVALUE','SK1234567'); //MSSQL

  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('CARD','FPTYPE','CO_CONFIGVALUE','2');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('CARD','CARDREGISTFORM','CO_CONFIGVALUE','1');
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('DAEMON','PACKETTYPE','CO_CONFIGVALUE','2'); //SK
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('VISIT','USE','CO_CONFIGVALUE','1'); //방문자그룹 사용
  dmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue('VISIT','CODE','CO_CONFIGVALUE','0003'); //방문자소속코드
  dmMIAMSDataBase.UpdateMiamsTB_COMPANYCODE_Name('0','소속');
  dmMIAMSDataBase.DeleteTB_COMPANYCODE_Key('0001');
  dmMIAMSDataBase.InsertIntoMiamsTB_COMPANYCODE_Value('0001','SK','1','1','1');
  dmMIAMSDataBase.DeleteTB_COMPANYCODE_Key('0002');
  dmMIAMSDataBase.InsertIntoMiamsTB_COMPANYCODE_Value('0002','협력사','1','1','1');
  dmMIAMSDataBase.DeleteTB_COMPANYCODE_Key('0003');
  dmMIAMSDataBase.InsertIntoMiamsTB_COMPANYCODE_Value('0003','방문자','1','1','1');
  dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEGUBUN_Name('1','임직원');
  dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEGUBUN_Name('2','장기인원');
  //기기 먼저 변환해야 한다.
  //위치코드 변환하자.
  ConvertTB_BUILDINGCODE;
  //노드변환하자.
  ConvertTB_Node;

  //출입문 변환하자
  ConvertTB_DOOR;

  //기기 타임코드 생성하자.
  dmMIAMSDataBase.DeleteTB_TIMECODEDEVICE_All;
  dmMIAMSDataBase.InsertIntoMiamsTB_TIMECODEDEVICE_BuildingChildAllDevice('0','0','07001900','19002400','00000700','00002400','N');
  dmMIAMSDataBase.InsertIntoMiamsTB_TIMECODEDEVICE_BuildingChildAllDevice('0','1','07001900','19002400','00000700','00002400','N');
  dmMIAMSDataBase.DeleteTB_TIMECODE_All;
  dmMIAMSDataBase.InsertIntoMiamsTB_TIMECODE_BuildingChildAll('0','0','07001900','19002400','00000700','00002400','Y');
  dmMIAMSDataBase.InsertIntoMiamsTB_TIMECODE_BuildingChildAll('0','1','07001900','19002400','00000700','00002400','Y');
  //기기 변환완료
  ConvertTB_EMPLOYEEFromInsa;

  stSql := ' Update TB_FINGERDEVICECARD set FD_SEND = ''Y'' ';   //지문 전송 하지 말자.
  dmMIAMSDataBase.ProcessExecSQL(stSql);


//  stSql := ' Update TB_CARDPERMITEMPLOYEECODE set CP_FINGERAPPLY = ''Y'' ';   //
//  dmMIAMSDataBase.ProcessExecSQL(stSql);

  btn_Convert.enabled := True;
  btn_DataBaseConnect.Enabled := True;
end;

procedure TfmMain.btn_DataBaseConnectClick(Sender: TObject);
var
  stDataBaseIP : string;
begin
  btn_DataBaseConnect.Enabled := True;
  btn_Convert.Enabled := False;
  stDataBaseIP := ed_SKACSIP.Text;

  dmSKACSDataBase.DataBaseDisConnect;
  dmSKACSDataBase.DataBaseConnect(MSSQL,stDataBaseIP,ed_KTAMSPort.Text,ed_KTAMSUserID.Text,ed_KTAMSUserPW.Text,ed_KTAMSDBName.Text,False);
  if Not dmSKACSDataBase.DBConnected then
  begin
    showmessage('SKACS 데이터베이스 환경설정을 확인해 주세요.');
    Exit;
  end;

  if Not dmSKACSDataBase.MDBDataBaseConnect('EqMaster') then
  begin
    showmessage('EqMaster.vmd 파일을 확인하세요.');
    Exit;
  end;

  if Not dmSKACSDataBase.BiostarDataBaseConnect('Biostar') then
  begin
    showmessage('Biostar 환경설정을 확인하세요.');
    Exit;
  end;

  dmSKOrgDataBase.DataBaseDisConnect;
  dmSKOrgDataBase.DataBaseConnect(MSSQL,ed_SKDBIP.Text,ed_SKDBPort.Text,ed_SKDBUserID.Text,ed_SKDBUserPW.Text,ed_SKDBName.Text,False);
  if Not dmSKOrgDataBase.DBConnected then
  begin
    showmessage('SK총무지원 데이터베이스 환경설정을 확인해 주세요.');
    Exit;
  end;

  dmMIAMSDataBase.DataBaseDisConnect;
  dmMIAMSDataBase.DataBaseConnect(MSSQL,ed_MIAMSIP.Text,ed_MIAMSPort.Text,ed_MIAMSUserID.Text,ed_MIAMSUserPW.Text,ed_MIAMSDBName.Text,False);
  if Not dmMIAMSDataBase.DBConnected then
  begin
    showmessage('GMS 데이터베이스 환경설정을 확인해 주세요.');
    Exit;
  end;
  btn_DataBaseConnect.Enabled := False;
  btn_Convert.Enabled := True;
  btn_GetEmpno.Enabled := True;
end;


procedure TfmMain.btn_GetEmpnoClick(Sender: TObject);
begin
  GetFinger_EmpCode(ed_empno.Text);

end;

procedure TfmMain.Button1Click(Sender: TObject);
var
  stSql : string;
  TempMiamsAdoQuery : TAdoQuery;
  stCardNo,stPositionNum: string;
begin
  stSql := ' select * from tb_employee where EM_CARDUSE <> 1 ';
  Try
    CoInitialize(nil);
    TempMiamsAdoQuery := TADOQuery.Create(nil);
    TempMiamsAdoQuery.Connection := dmMIAMSDataBase.ADOConnection;
    TempMiamsAdoQuery.DisableControls;
    with TempMiamsAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      lb_Message.Caption := 'TB_BUILDINGCODE';
      lb_Message.Refresh;
      Progress.Max := ReCordcount;
      Progress.Position := 0;
      while Not Eof do
      begin
        Progress.Position := Progress.Position + 1;
        lb_PerCount.caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        stCardNo := GetMDBCardNo(FindField('EM_CODE').AsString,stPositionNum);
        if stCardNo <> '' then
        begin
          dmMIAMSDataBase.InsertIntoMiamsTB_CARD_Value(stCardNo,'1','0',stPositionNum,stPositionNum,'0',FindField('EM_SEQ').AsString,'');
          dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_CARDUSE','1');
          EmployeePermitToCardLoad(FindField('EM_SEQ').AsString);  //해당 사원의 권한을 디바이스 권한으로 옮기자.
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempMiamsAdoQuery.EnableControls;
    TempMiamsAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.Button2Click(Sender: TObject);
var
  stSql : string;
  TempMiamsAdoQuery : TAdoQuery;
  stCardNo,stPositionNum: string;
  stEmSeq : string;
  nCardNo : int64;
begin
  stSql := ' SELECT  * FROM IF_TAG';
  stSql := stSql + ' where TAG is not null and TAG <> ''''';
  stSql := stSql + ' order by CHG_DATE ';
  Try
    CoInitialize(nil);
    TempMiamsAdoQuery := TADOQuery.Create(nil);
    TempMiamsAdoQuery.Connection := dmSKOrgDataBase.ADOConnection;
    TempMiamsAdoQuery.DisableControls;
    with TempMiamsAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      lb_Message.Caption := 'TB_BUILDINGCODE';
      lb_Message.Refresh;
      Progress.Max := ReCordcount;
      Progress.Position := 0;
      while Not Eof do
      begin
        Progress.Position := Progress.Position + 1;
        lb_PerCount.caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        nCardNo := StrToInt64(FindField('TAG').AsString);
        stCardNo := Dec2Hex(nCardNo,8) + '********';
        if stCardNo <> '' then
        begin
          stEmSeq := dmMIAMSDataBase.GetTB_EMPLOYEE_EmSeqFromEmCode(FindField('DOC_NO').AsString);
          if stEmSeq <> '' then
          begin
            if dmMIAMSDataBase.CheckTB_CARD(stCardNo) = 1 then
            begin
              dmMIAMSDataBase.updateMiamsTB_CARD_EmSeq(stCardNo,stEmSeq);
            end else
            begin
              stPositionNum := inttostr(dmMIAMSDataBase.GetTB_CARD_NextPositionNum);
              dmMIAMSDataBase.InsertIntoMiamsTB_CARD_Value(stCardNo,'1','0',stPositionNum,stPositionNum,'0',stEmSeq,'');
            end;
            dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_CARDUSE','1');
            EmployeePermitToCardLoad(stEmSeq);  //해당 사원의 권한을 디바이스 권한으로 옮기자.
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempMiamsAdoQuery.EnableControls;
    TempMiamsAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.ConvertTB_BUILDINGCODE;
var
  TempSKACSAdoQuery : TAdoQuery;
  stSql : string;
  stBuildingCode : string;
  stBuildingSeq : string;
begin
  stSql := ' select * from EqMaster ';
  stSql := stSql + ' where eqcode = 100 ';
  stSql := stSql + ' Order by BuildingID,FloorID,SectorID ';
  Try
    CoInitialize(nil);
    TempSKACSAdoQuery := TADOQuery.Create(nil);
    TempSKACSAdoQuery.Connection := dmSKACSDataBase.MDBADOConnection;
    TempSKACSAdoQuery.DisableControls;
    with TempSKACSAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      lb_Message.Caption := 'TB_BUILDINGCODE';
      lb_Message.Refresh;
      Progress.Max := ReCordcount;
      Progress.Position := 0;
      while Not Eof do
      begin
        Progress.Position := Progress.Position + 1;
        lb_PerCount.caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        stBuildingCode := '0';
        stBuildingCode := stBuildingCode + FillZeroNumber(FindField('BuildingID').AsInteger,3);
        stBuildingSeq := '1';
        if FindField('FloorID').AsInteger <> 0 then
        begin
          stBuildingSeq := '2';
          stBuildingCode := stBuildingCode + FillZeroNumber(FindField('FloorID').AsInteger,3);
          if FindField('SectorID').AsInteger <> 0 then
          begin
            stBuildingSeq := '3';
            stBuildingCode := stBuildingCode + FillZeroNumber(FindField('SectorID').AsInteger,3);
          end;
        end;
        if dmMIAMSDataBase.CheckTB_BUILDINGCODE_Code(stBuildingCode,stBuildingSeq) = 1 then
        begin
        end else
        begin
          dmMIAMSDataBase.InsertIntoMiamsTB_BUILDINGCODE_Value(stBuildingCode, FindField('EqName').AsString,stBuildingSeq, '1', '1');
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempSKACSAdoQuery.EnableControls;
    TempSKACSAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.ConvertTB_DOOR;
var
  TempSKACSAdoQuery : TAdoQuery;
  stSql : string;
  stNodeNo : string;
  stDoorName : string;
  stEcuID : string;
  stDoorID : string;
  stDoorViewSeq : string;
  stFingerID : string;
  stFingerIP : string;
  stBuildingCode : string;
  oRelayDoor : TRelayDoor;
  nIndex : integer;
  stTemp : string;
begin
  UnLoadRelayDoorList;

  stEcuID := '00';
  stSql := ' select * from EqMaster ';
  stSql := stSql + ' where eqcode = 254 ';
  stSql := stSql + ' and eqtype = 1 ';
  stSql := stSql + ' and point = 1 ';
  stSql := stSql + ' and Loop <> 0 ';
  stSql := stSql + ' Order by Trend';
//  stSql := stSql + ' Order by Trend, master,local,point ';
  Try
    CoInitialize(nil);
    TempSKACSAdoQuery := TADOQuery.Create(nil);
    TempSKACSAdoQuery.Connection := dmSKACSDataBase.MDBADOConnection;
    TempSKACSAdoQuery.DisableControls;
    with TempSKACSAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      dmMIAMSDataBase.DeleteTB_FINGERDEVICE_All;
      lb_Message.Caption := 'TB_DOOR';
      lb_Message.Refresh;
      Progress.Max := ReCordcount;
      Progress.Position := 0;

      while Not Eof do
      begin
        Progress.Position := Progress.Position + 1;
        lb_PerCount.caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        stNodeNo := FindField('Master').AsString;
        stDoorID := FindField('Loop').AsString;
        stDoorName := FindField('EqName').AsString;
        stDoorViewSeq := FindField('Trend').AsString;

        nIndex := RelayDoorList.IndexOf(stDoorViewSeq);
        if nIndex < 0 then
        begin
          oRelayDoor := TRelayDoor.Create(nil);
          oRelayDoor.RelayDoorNo := stDoorViewSeq;
          oRelayDoor.SetDoorList(stNodeNo,'00',stDoorID);
          RelayDoorList.AddObject(stDoorViewSeq,oRelayDoor);
        end else
        begin
          TRelayDoor(RelayDoorList.Objects[nIndex]).RelayDoorNo := stDoorViewSeq;
          TRelayDoor(RelayDoorList.Objects[nIndex]).SetDoorList(stNodeNo,'00',stDoorID);
        end;

        stBuildingCode := '0';
        if FindField('BuildingID').AsInteger <> 0 then
        begin
          stTemp := stBuildingCode + FillZeroNumber(FindField('BuildingID').AsInteger,3);
          if dmMIAMSDataBase.CheckTB_BUILDINGCODE_Code(stTemp,'1') = 1 then
          begin
            stBuildingCode := stTemp;
            if FindField('FloorID').AsInteger <> 0 then
            begin
              stTemp := stBuildingCode + FillZeroNumber(FindField('FloorID').AsInteger,3);
              if dmMIAMSDataBase.CheckTB_BUILDINGCODE_Code(stTemp,'2') = 1 then
              begin
                stBuildingCode := stTemp;
                if FindField('SectorID').AsInteger <> 0 then
                begin
                  stTemp := stBuildingCode + FillZeroNumber(FindField('SectorID').AsInteger,3);
                  if dmMIAMSDataBase.CheckTB_BUILDINGCODE_Code(stTemp,'3') = 1 then stBuildingCode := stTemp;
                end;
              end;
            end;
          end;
        end;


        dmMIAMSDataBase.DeleteTB_DOOR_DoorNo(stNodeNo,stEcuID,stDoorID);
        dmMIAMSDataBase.DeleteTB_DOORRCV_DoorNo(stNodeNo,stEcuID,stDoorID);
        dmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(stNodeNo,stEcuID,stDoorID,stDoorName,stBuildingCode,stDoorViewSeq,'1','1',stDoorViewSeq,'1' );
        dmMIAMSDataBase.InsertIntoMiamsTB_DOORRCV_DeviceDoorInit(stNodeNo,stEcuID,stDoorID);
        stFingerID := dmMIAMSDataBase.GetNextTB_FINGERDEVICE_ID;
        stFingerIP := FindField('TargetIP').AsString;
        dmMIAMSDataBase.InsertIntoMiamsTB_FINGERDEVICE_Value(stFingerID,stFingerIP,stDoorName,ed_ReaderPort.text,'2','1',stNodeNo,stEcuID,stDoorID);
        //dmMIAMSDataBase.UpdateMiamsTB_CARDPERMITEMPLOYEECODE_DeviceToFingerApply(stNodeNo,stEcuID,'0','1',stDoorID,'Y','1');
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempSKACSAdoQuery.EnableControls;
    TempSKACSAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.ConvertTB_EMPLOYEEFromInsa;
var
  TempInsaAdoQuery : TAdoQuery;
  stSql : string;
  stBaseCompanyCode : string;
  stEmGubunCode : string;
  stCompanyCode : string;
  stAddr : string;
  stPosiCode : string;
  stEmCode : string;
  stEmSeq : string;
  stEmName : string;
  stStartDate : string;
  stEndDate : string;
  stHandPhone : string;
  stCompanyPhone : string;
  stRelayCode1 : string;
  stTemp : string;
  nTemp : integer;
  stFingerID : string;
  stCardNo : string;
  nFingerUse : integer;
begin

  stSql := ' select * from VW_APPROVE_LABOR ';
  Try
    CoInitialize(nil);
    TempInsaAdoQuery := TADOQuery.Create(nil);
    TempInsaAdoQuery.Connection := dmSKOrgDataBase.ADOConnection;
    TempInsaAdoQuery.DisableControls;
    with TempInsaAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      lb_Message.Caption := 'TB_EMPLOYEE';
      lb_Message.Refresh;
      Progress.Max := ReCordcount;
      Progress.Position := 0;
      while Not Eof do
      begin
        Progress.Position := Progress.Position + 1;
        lb_PerCount.caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);

        if Trim(FindField('LS_CODE').AsString) = 'L' then stBaseCompanyCode := '0002'
        else if Trim(FindField('LS_CODE').AsString) = 'V' then stBaseCompanyCode := '0003'
        else stBaseCompanyCode := '0001';
        stEmGubunCode := dmMiAmsDataBase.GetTB_EMPLOYEEGUBUN_CodeFromRelayCode(FindField('LS_CODE').AsString,stTemp);
        if stEmGubunCode = '' then
        begin
          stEmGubunCode := dmMiAmsDataBase.GetTB_EMPLOYEEGUBUN_CodeFromName(FindField('LS_GBN').AsString);
          if stEmGubunCode = '' then
          begin
            stEmGubunCode := dmMiAmsDataBase.GetTB_EMPLOYEEGUBUN_NextCode;
            dmMiAmsDataBase.InsertIntoMiamsTB_EMPLOYEEGUBUN_Value(stEmGubunCode,FindField('LS_GBN').AsString,stEmGubunCode,FindField('LS_CODE').AsString)
          end else
          begin
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEEGUBUN_Field_StringValue(stEmGubunCode,'EM_RELAYCODE',FindField('LS_CODE').AsString);   //연동 구분 코드 입력
          end;
        end else
        begin
          if stTemp <> FindField('LS_GBN').AsString then  //구분 명칭이 다르면
          begin
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEEGUBUN_Name(stEmGubunCode,FindField('LS_GBN').AsString);//구분 명칭 변경
          end;
        end;
        stCompanyCode := dmMiAmsDataBase.GetTB_COMPANYCODE_CodeFromRelayCode(FindField('CO_CODE').AsString,stTemp);
        if FindField('LS_CODE').AsString <> 'V' then    //방문객이면 회사코드 생성하지 말자.
        begin
          if stCompanyCode = '' then
          begin
            stCompanyCode := dmMiAmsDataBase.GetTB_COMPANYCODE_CodeFromBaseName(stBaseCompanyCode,FindField('CO_NAME').AsString);
            if stCompanyCode = '' then
            begin
              stCompanyCode :=stBaseCompanyCode + FillZeroNumber(dmMiAmsDataBase.GetTB_COMPANY_NextSeq(stBaseCompanyCode,'2',nTemp),3);
              dmMiAmsDataBase.InsertIntoMiamsTB_COMPANYCODE_Value(stCompanyCode,FindField('CO_NAME').AsString,'2','1',inttostr(nTemp));
            end else
            begin
              dmMiAmsDataBase.UpdateMiamsTB_COMPANYCODE_Field_StringValue(stCompanyCode,'CO_RELAYCOMPANYCODE',FindField('CO_CODE').AsString);
            end;
          end else
          begin
            if stTemp <> FindField('CO_NAME').AsString then  //소속명이 바뀌었으면 소속명을 바꿔 주자
            begin
              dmMiAmsDataBase.UpdateMiamsTB_COMPANYCODE_Field_StringValue(stCompanyCode,'CO_COMPANYNAME',FindField('CO_NAME').AsString);
            end;
          end;
        end else
        begin
          stCompanyCode := stBaseCompanyCode;
        end;
        stEmCode := FindField('JUMIN_NO').AsString;
        stEmName := FindField('LBR_NAME').AsString;
        stStartDate := FindField('APP_FROM').AsString;
        stEndDate := FindField('APP_TO').AsString;
        stHandPhone := FindField('TEL').AsString;
        stCompanyPhone := FindField('CAUSE_DESC').AsString;
        stAddr := FindField('ADDR').AsString;
        stRelayCode1 := FindField('AREA_CD').AsString;
        if FindField('JIKWI').AsString <> '' then
        begin
          stPosiCode := dmMiAmsDataBase.GetTB_POSICODE_CodeFromName(FindField('JIKWI').AsString);
          if stPosiCode = '' then
          begin
            stPosiCode := dmMiAmsDataBase.GetTB_POSICODE_NextCode;
            dmMiAmsDataBase.InsertIntoMiamsTB_POSICODE_Value(stPosiCode,FindField('JIKWI').AsString,'0',stPosiCode);
          end;
        end else stPosiCode := '0';
        if Not Isdigit(stPosiCode) then stPosiCode := '0';
        if Not Isdigit(stEmGubunCode) then stEmGubunCode := '0';

        stEmSeq := '';
        if FindField('JUMIN_NO').AsString <> FindField('OLD_JUMINNO').AsString then
        begin
          if dmMiAmsDataBase.CheckTB_EMPLOYEE_EMCODE(FindField('OLD_JUMINNO').AsString,stEmSeq) = 1 then
          begin
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_AllValue(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stEmGubunCode,'1',
                                                            stCompanyPhone,stHandPhone,stAddr,stStartDate,stEndDate,'1','3','1',FindField('AREA_CD').AsString);
(*            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_CODE',stEmCode); //사원번호 변경
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_NAME',stEmName); //이름
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'CO_COMPANYCODE',stCompanyCode); //소속
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_IntValue(stEmSeq,'PO_POSICODE',stPosiCode); //직위
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_IntValue(stEmSeq,'EM_GUBUNCODE',stEmGubunCode); //구분코드
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_IntValue(stEmSeq,'EM_STATECODE','1'); //상태
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_COMPANYPHONE',stCompanyPhone); //
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_HANDPHONE',stHandPhone); //
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_EMINFO',stAddr); //
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_REGDATE',stStartDate); //
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_ENDDATE',stEndDate); //
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_ACUSE','1'); //
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_intValue(stEmSeq,'EM_GRADETYPE','3'); //개별권한 그룹으로 등록됨
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_Field_intValue(stEmSeq,'EM_RELAYUSE','1'); //
*)
          end;
        end;
        if stEmSeq = '' then
        begin
          if dmMiAmsDataBase.CheckTB_EMPLOYEE_EMCODE(FindField('JUMIN_NO').AsString,stEmSeq) = 1 then
          begin
            dmMiAmsDataBase.UpdateMiamsTB_EMPLOYEE_AllValue(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stEmGubunCode,'1',
                                                              stCompanyPhone,stHandPhone,stAddr,stStartDate,stEndDate,'1','3','1',FindField('AREA_CD').AsString);
            dmMiAmsDataBase.InsertMiamsIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_UPDATE); //사원정보 Update 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음
          end;
        end;
        if stEmSeq = '' then
        begin
          //신규 사원 정보가 들어 온 것임
          stEmSeq := inttostr(dmMiAmsDataBase.GetTB_EMPLOYEE_NextEmSeq);
          dmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stEmGubunCode,stCompanyPhone,'',stHandPhone,stAddr,
                                                           stStartDate,stEndDate,'1','1','1','0','3','0','1','1','0','1',FindField('AREA_CD').AsString);
          dmMIAMSDataBase.InsertMiamsIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_INSERT); //사원정보 InSert 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음
        end;

        //사원 권한 입력 하자.
        (*

        *)
        EmployeePermitCreate(stEmSeq,FindField('APP_GATE').AsString,FindField('APP_GATE_NIGHT').AsString);
        EmCodeToCardChange(stEmSeq,stEmCode);


        dmMIAMSDataBase.InsertIntoMiamsVW_APPROVE_LABOR(FindField('JUMIN_NO').AsString,
                                                        FindField('LBR_NAME').AsString,
                                                        FindField('TAG').AsString,
                                                        FindField('APP_FROM').AsString,
                                                        FindField('APP_TO').AsString,
                                                        FindField('LS_CODE').AsString,
                                                        FindField('LS_GBN').AsString,
                                                        FindField('CO_CODE').AsString,
                                                        FindField('CO_NAME').AsString,
                                                        FindField('ADDR').AsString,
                                                        FindField('HEIGHT').AsString,
                                                        FindField('WEIGHT').AsString,
                                                        FindField('JIKWI').AsString,
                                                        FindField('TEL').AsString,
                                                        FindField('CHG_DATE').AsString,
                                                        FindField('DEL_YN').AsString,
                                                        FindField('APP_GATE').AsString,
                                                        FindField('APP_GATE_NIGHT').AsString,
                                                        FindField('APP_YN').AsString,
                                                        FindField('PHOTO_PATH').AsString,
                                                        FindField('CAUSE_CODE').AsString,
                                                        FindField('CAUSE_DESC').AsString,
                                                        FindField('CONST_CODE').AsString,
                                                        FindField('CONST_NAME').AsString,
                                                        FindField('CARD_NO').AsString,
                                                        FindField('IO_AREA').AsString,
                                                        FindField('BIRTH').AsString,
                                                        FindField('AREA_CD').AsString,
                                                        FindField('OLD_JUMINNO').AsString,
                                                        'N',
                                                        '1');
        if Trim(FindField('LS_CODE').AsString) = 'V' then //방문자인경우는 방문자 리스트에 입력 하자.
        begin
          if dmMIAMSDataBase.CheckTB_GUESTLIST_GLCode(stEmCode,stTemp)= 1 then
          begin
            dmMIAMSDataBase.UpdateMiamsTB_GUESTLIST_Value(stTemp,stEmName,stStartDate,stEndDate,FindField('CO_NAME').AsString,stHandPhone,'Y');
          end else
          begin
            dmMIAMSDataBase.InsertIntoMiamsTB_GUESTLIST_Value(stEmSeq,stEmCode,stEmName,stStartDate,stEndDate,FindField('CO_NAME').AsString,stHandPhone,'','N','1');
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempInsaAdoQuery.EnableControls;
    TempInsaAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.ConvertTB_Node;
var
  TempSKACSAdoQuery : TAdoQuery;
  stSql : string;
  stNodeNo : string;
  stNodeIP : string;
  stDeviceID : string;
  stNodeName : string;
  i,k : integer;
  stEcuID : string;
begin
  stDeviceID := FillZeroNumber(0,7);
  stEcuID := '00';

  stSql := ' select * from EqMaster ';
  stSql := stSql + ' where eqcode = 254 ';
  stSql := stSql + ' and eqtype = 1 ';
  stSql := stSql + ' and point = 0 ';
  stSql := stSql + ' Order by Master ';
//  stSql := stSql + ' Order by master,local,point ';
  Try
    CoInitialize(nil);
    TempSKACSAdoQuery := TADOQuery.Create(nil);
    TempSKACSAdoQuery.Connection := dmSKACSDataBase.MDBADOConnection;
    TempSKACSAdoQuery.DisableControls;
    with TempSKACSAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      lb_Message.Caption := 'TB_Node';
      lb_Message.Refresh;
      Progress.Max := ReCordcount;
      Progress.Position := 0;
      while Not Eof do
      begin
        Progress.Position := Progress.Position + 1;
        lb_PerCount.caption := inttostr(Progress.Position) + '/' + inttostr(Progress.Max);
        stNodeNo := FindField('Master').AsString;
        stNodeIP := FindField('Content').AsString;
        System.Delete(stNodeIP,1,Length('11-181N19200:00000bb8'));
        stNodeName := FindField('EqName').AsString;

        dmMIAMSDataBase.DeleteTB_Node_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_NODERCV_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_ZONE_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_ZONERCV_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_ZONEEXTENTION_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_READER_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_READERRCV_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_DEVICE_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_DEVICERCV_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_TIMECODEDEVICE_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_HOLIDAYDEVICE_NodeNo(stNodeNo);
        dmMIAMSDataBase.DeleteTB_ARMAREA_NodeNo(stNodeNo);

        dmMIAMSDataBase.InsertIntoMiamsTB_NODE_Value(stNodeNo,'1',stDeviceID,stNodeIP,stNodeName,'0','1');
        dmMIAMSDataBase.InsertIntoMiamsTB_NODERCV_NodeNo(stNodeNo);
        for i := 0 to 8 do
        begin
          for k := 1 to 8 do
          begin
            dmMIAMSDataBase.InsertIntoMiamsTB_ZONE_ZoneInit(stNodeNo,stEcuID,inttostr(i),inttostr(k),stNodeName + '_' + stEcuID + '_' + inttostr(i)+ '_' + inttostr(k));
            dmMIAMSDataBase.InsertIntoMiamsTB_ZONERCV_ZoneInit(stNodeNo,stEcuID,inttostr(i),inttostr(k));
            Application.ProcessMessages;
          end;
          if i = 0 then
            dmMIAMSDataBase.InsertIntoMiamsTB_ZONEEXTENTION_ZoneInit(stNodeNo,stEcuID,inttostr(i),stNodeName + '_' + stEcuID + '_' + inttostr(i),'1')
          else dmMIAMSDataBase.InsertIntoMiamsTB_ZONEEXTENTION_ZoneInit(stNodeNo,stEcuID,inttostr(i),stNodeName + '_' + stEcuID + '_' + inttostr(i),'0');
        end;
        for i := 1 to 8 do
        begin
          dmMIAMSDataBase.InsertIntoMiamsTB_READER_ReaderInit(stNodeNo,stEcuID,inttostr(i));
          dmMIAMSDataBase.InsertIntoMiamsTB_READERRCV_ReaderInit(stNodeNo,stEcuID,inttostr(i));
          Application.ProcessMessages;
        end;
        for i := 0 to 8 do
        begin
          if i = 0 then
            dmMIAMSDataBase.InsertIntoMiamsTB_ARMAREA_DeviceArmAreaInit(stNodeNo,stEcuID,inttostr(i),stNodeName + '_' + inttostr(i),'0','1','1','1' )
          else dmMIAMSDataBase.InsertIntoMiamsTB_ARMAREA_DeviceArmAreaInit(stNodeNo,stEcuID,inttostr(i),stNodeName + '_' + inttostr(i),'0','0','0','0' );
          Application.ProcessMessages;
        end;

        //for j := 0 to G_nDefaultExtentionCount do
        begin
          //dmDBInsert.InsertIntoTB_DEVICE_DeviceInit(stNodeNo,stEcuID,inttostr(j),ed_NodeName.Text + '_' + stEcuID + '_' + inttostr(j),'1');
          dmMIAMSDataBase.InsertIntoMiamsTB_DEVICE_DeviceInit(stNodeNo,stEcuID,inttostr(0),stNodeName ,'1','0','1');
          dmMIAMSDataBase.InsertIntoMiamsTB_DEVICERCV_DeviceInit(stNodeNo,stEcuID,inttostr(0));
          Application.ProcessMessages;
        end;

        //타임코드 -> 타임코드기기테이블 복사
        dmMIAMSDataBase.InsertIntoMiamsTB_TIMECODEDEVICE_TimeCodeToDevice(stNodeNo,stEcuID,'0');
        dmMIAMSDataBase.copyHoliDayToDevice(stNodeNo,stEcuID);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempSKACSAdoQuery.EnableControls;
    TempSKACSAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.EmCodeToCardChange(aEmSeq, aEmCode: string);
var
  stSql : string;
  TempSKACSAdoQuery : TAdoQuery;
  stCardNo : string;
  stPositionNum : string;
  stFingerUse : string;
  nCardNo : int64;
begin
  stSql := ' Select * from CardID ';
  stSql := stSql + ' Where PNo = ''' + aEmCode + ''' ';
  Try
    CoInitialize(nil);
    TempSKACSAdoQuery := TADOQuery.Create(nil);
    TempSKACSAdoQuery.Connection := dmSKACSDataBase.ADOConnection;
    TempSKACSAdoQuery.DisableControls;
    with TempSKACSAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        stCardNo := FindField('pID').AsString;
        if isDigit(stCardNo) then
        begin
          Try
            nCardNo := StrToInt64(stCardNo);
            stCardNo := Dec2Hex(nCardNo,8) + '********';
          Except
            Exit;
          End;
          stFingerUse := '1';
          //stPositionNum := '';
          //if stPositionNum = '' then
          stPositionNum := FindField('FRUSER').AsString;
          dmMIAMSDataBase.InsertIntoMiamsTB_CARD_Value(stCardNo,'1','0',stPositionNum,stPositionNum,'0',aEmSeq,'');
          dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(aEmSeq,'EM_CARDUSE','1');
          EmployeePermitToCardLoad(aEmSeq);  //해당 사원의 권한을 디바이스 권한으로 옮기자.
          if FindField('fFingerTemplate1').IsNull or (Trim(FindField('fFingerTemplate1').AsString) = '') then
          begin
            stFingerUse := '0';
          end;
          if stFingerUse = '1' then
          begin
            //여기에서 카드와 지문아이디 검색 해서 지문정보 등록 하자.
            EmCodeToFingerDataSave(aEmSeq,aEmCode,FindField('pID').AsString,stPositionNum);
          end;
          EmployeePermitToFingerLoad(aEmSeq);
          dmMIAMSDataBase.UpdateMiamsTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(aEmSeq,'Y'); //해당권한의 지문을 설정완료 하자.
        end;
        Next;
      end;
    end;
  Finally
    TempSKACSAdoQuery.EnableControls;
    TempSKACSAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.EmCodeToFingerDataSave(aEmSeq, aEmCode, aFingerCardNo: string;aPositionNum:string);
var
  stSql : string;
  TempBiostarAdoQuery : TAdoQuery;
  bs: TBytesStream;
  Template : array[0..384 - 1] of LongWord;
  stFingerTemplate : string;
  i : integer;
  nLen : integer;
begin
(*  stSql := ' Select * from ';
  stSql := stSql + ' TB_USER_TEMPLATE  ';
  stSql := stSql + ' Where nUserIdn = ' + aFingerNo + ' ';
*)
  aFingerCardNo := inttostr(strtoint64(aFingerCardNo));

  stSql := 'select b.* from (select nUserIdn from TB_USER where sUserID = ''' + aPositionNum + ''' group by nUserIdn) a ';
  //stSql := stSql + 'inner join (select * from tb_user_template where nIndex = 1) b ';
  stSql := stSql + 'inner join (select * from tb_user_template ) b ';
  stSql := stSql + 'on(a.nUserIdn = b.nUserIdn) ';
  Try
    CoInitialize(nil);
    TempBiostarAdoQuery := TADOQuery.Create(nil);
    TempBiostarAdoQuery.Connection := dmSKACSDataBase.BiostarADOConnection;
    TempBiostarAdoQuery.DisableControls;
    with TempBiostarAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if recordcount < 1 then
      begin
        //여기서 로그 남기자.
        LogSave('FingerError.Log','사번:' + aEmCode + ',카드번호:' + aFingerCardNo);
        memo1.Lines.Add('사번:' + aEmCode + ',카드번호:' + aFingerCardNo);
        Exit;
      end;

      while Not Eof do
      begin
        Try
          //aPositionNum :=  Findfield('nUserIdn').AsString;
          bs := TBytesStream.Create(Findfield('bTemplate').AsBytes);
          bs.Position := 0;
          while bs.Position < bs.Size do
          begin
            bs.Read(Template, 384);
          end;
          stFingerTemplate := '';
          for i := 0 to 384 - 1 do
            stFingerTemplate := stFingerTemplate + FillZeroNumber(Template[i],10);

          if FindField('nIndex').AsInteger = 1 then
          begin
            if Findfield('nTemplateIndex').AsInteger = 0 then
            begin
              if dmMIAMSDataBase.CheckTB_EMPLOYEEFINGER(aEmSeq) = 1 then dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEFINGER_Field_StringValue(aEmSeq,'1','EF_TEMPLATE1_1',stFingerTemplate)
              else dmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEEFINGER_Template(aEmSeq,'1',stFingerTemplate,'','','','','');
            end else if Findfield('nTemplateIndex').AsInteger = 1 then
            begin
              if dmMIAMSDataBase.CheckTB_EMPLOYEEFINGER(aEmSeq) = 1 then dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEFINGER_Field_StringValue(aEmSeq,'1','EF_TEMPLATE1_2',stFingerTemplate)
              else dmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEEFINGER_Template(aEmSeq,'1','',stFingerTemplate,'','','','');
            end;
          end else if FindField('nIndex').AsInteger = 2 then
          begin
            if Findfield('nTemplateIndex').AsInteger = 0 then
            begin
              if dmMIAMSDataBase.CheckTB_EMPLOYEEFINGER(aEmSeq) = 1 then dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEFINGER_Field_StringValue(aEmSeq,'1','EF_TEMPLATE2_1',stFingerTemplate)
              else dmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEEFINGER_Template(aEmSeq,'1','','',stFingerTemplate,'','','');
            end else if Findfield('nTemplateIndex').AsInteger = 1 then
            begin
              if dmMIAMSDataBase.CheckTB_EMPLOYEEFINGER(aEmSeq) = 1 then dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEFINGER_Field_StringValue(aEmSeq,'1','EF_TEMPLATE2_2',stFingerTemplate)
              else dmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEEFINGER_Template(aEmSeq,'1','','','',stFingerTemplate,'','');
            end;
          end;

           nLen := Length(stFingerTemplate);
           // Do something with the Icon?
           //Result := true;

        Finally
          bs.Free;
        End;
        Next;
      end;
      dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(aEmSeq,'EM_FINGERUSE','1');//지문사용으로 설정 하고
    end;
  Finally
    TempBiostarAdoQuery.EnableControls;
    TempBiostarAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.EmployeeDoorPermit(aEmSeq, aNodeNo, aEcuID, aDoorNo,
  aDayPermit, aNightPermit: string);
var
  stPermit : string;
  stTime : string;
begin
  stPermit := '0';
  stTime := FormatDateTime('yyyymmddhhnnss',now);
  if (aDayPermit = '1') or (aNightPermit = '1') then stPermit := '1';

  if stPermit = '1' then
  begin
    dmMIAMSDataBase.EmployeeDoorPermitAdd(aEmSeq,aNodeNo,aEcuID,'0',aDoorNo);
    EmployeeTimePermit(aEmseq,aNodeNo,aEcuID,aDoorNo,aDayPermit,aNightPermit);
  end else
  begin
    dmMIAMSDataBase.EmployeeDoorPermitDelete(aEmSeq,aNodeNo,aEcuID,'0',aDoorNo);
  end;
  //dmMIAMSDataBase.InsertIntoMiamsTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),'127.0.0.1','Relay',aNodeNo,aEcuID,'E' + aEmSeq,aDoorNo,con_ComLogTYPE_DOOR,'Init:Permit Add');
end;

procedure TfmMain.EmployeePermitCreate(aEmSeq, aDayPermit,
  aNightPermit: string);
var
  i,j : integer;
  nLen : integer;
  stDayPermit : string;
  stNightPermit : string;
  stNodeNo,stEcuID,stDoorNo : string;
  nNextIndex : integer;
begin
  if Length(aDayPermit) > Length(aNightPermit) then nLen := Length(aDayPermit)
  else nLen := Length(aNightPermit);

  for i := 1 to nLen do
  begin
    stDayPermit := '0';
    stNightPermit := '0';
    if Length(aDayPermit) >= i then
    begin
      stDayPermit := aDayPermit[i];
    end;
    if Length(aNightPermit) >= i then
    begin
      stNightPermit := aNightPermit[i];
    end;
    for j := 0 to 7 do
    begin
      if GetTB_DOOR_NoFromRelayNo(inttostr(i),j,stNodeNo,stEcuID,stDoorNo,nNextIndex) = 1 then
      begin
        EmployeeDoorPermit(aEmSeq,stNodeNo,stEcuID,stDoorNo,stDayPermit,stNightPermit); //개별 출입문 권한
        if nNextIndex = 0 then break;
      end else break;
    end;
    {to do 여기에서 주간인경우 0-1,야간인경우 0-2,3 적용}
    //durlfmf wkrdjqgkfrjt
  end;

end;

function TfmMain.EmployeePermitToCardDeviceLoad(aNodeNo, aEcuID,
  aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stOldCardNo : string;
  //stNodeNo : string;
  nIndex : integer;
  bNodeSetting : Boolean;
  stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8 : string;
  stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8:string;
begin
  result := True;
  stSql := ' Select ';
  stSql := stSql + ' a.EM_SEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CP_TYPE,f.EM_STATE,';
  stSql := stSql + ' a.CP_NUMBER,a.CP_PERMIT,b.CA_CARDNO,b.CA_STATECODE,b.CA_POSITIONNUM, ';
  stSql := stSql + ' c.EM_CODE,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ACUSE,c.EM_ATUSE,c.EM_FDUSE,';
  stSql := stSql + ' e.EM_TIMECODEUSE,e.TC_GROUP,e.TC_TIME1,e.TC_TIME2,e.TC_TIME3,e.TC_TIME4,e.TC_WEEKCODE,c.EM_REGDATE,c.EM_ENDDATE ';
  stSql := stSql + ' from TB_CARDPERMITEMPLOYEECODE a ';
  stSql := stSql + ' INNER Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = c.EM_SEQ) ';
  stSql := stSql + ' Inner Join TB_DEVICE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID  ';
  stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEEDEVICETIMECODE e ';
  stSql := stSql + ' ON(a.EM_SEQ = e.EM_SEQ ';
  stSql := stSql + ' AND a.ND_NODENO = e.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = e.DE_ECUID ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEESTATECODE f ';
  stSql := stSql + ' ON(c.EM_STATECODE = f.EM_STATECODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' Order by b.CA_CARDNO';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmMIAMSDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;

      stOldCardNo := '';
      stPermit := '0';
      stDoor1:= '0';
      stDoor2:= '0';
      stDoor3:= '0';
      stDoor4:= '0';
      stDoor5:= '0';
      stDoor6:= '0';
      stDoor7:= '0';
      stDoor8:= '0';
      stArmArea0:= '0';
      stArmArea1:= '0';
      stArmArea2:= '0';
      stArmArea3:= '0';
      stArmArea4:= '0';
      stArmArea5:= '0';
      stArmArea6:= '0';
      stArmArea7:= '0';
      stArmArea8:= '0';



      First;
      bNodeSetting := True;
      while Not Eof do
      begin
        //stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
        if stOldCardNo <> '' then  //카드번호가 변경 된 경우
        begin
          if stOldCardNo <> FindField('CA_CARDNO').AsString then
          begin
            //여기에서 TB_CARDPERMIT 테이블에 인서트 하자.
            if dmMIAMSDataBase.CheckTB_CARDPERMIT_DeviceCardNo(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',stOldCardNo) = 1 then
            begin
              dmMIAMSDataBase.UpdateMiamsTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',stOldCardNo,
                         stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                         stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
            end else
            begin
              dmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',stOldCardNo,
                         stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                         stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
            end;
            stOldCardNo := FindField('CA_CARDNO').AsString;
            stPermit := '0';
            stDoor1:= '0';
            stDoor2:= '0';
            stDoor3:= '0';
            stDoor4:= '0';
            stDoor5:= '0';
            stDoor6:= '0';
            stDoor7:= '0';
            stDoor8:= '0';
            stArmArea0:= '0';
            stArmArea1:= '0';
            stArmArea2:= '0';
            stArmArea3:= '0';
            stArmArea4:= '0';
            stArmArea5:= '0';
            stArmArea6:= '0';
            stArmArea7:= '0';
            stArmArea8:= '0';
            bNodeSetting := True;
          end;
        end;
        if FindField('CP_TYPE').AsString = '1' then //락 타입
        begin
          if FindField('CP_NUMBER').AsString = '1' then  stDoor1:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '2' then  stDoor2:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '3' then  stDoor3:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '4' then  stDoor4:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '5' then  stDoor5:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '6' then  stDoor6:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '7' then  stDoor7:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '8' then  stDoor8:= FindField('CP_PERMIT').AsString;
          stPermit := '1';
          bNodeSetting := False;
        end else if FindField('CP_TYPE').AsString = '2' then   //방번구역
        begin
          if FindField('CP_NUMBER').AsString = '0' then  stArmArea0:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '1' then  stArmArea1:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '2' then  stArmArea2:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '3' then  stArmArea3:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '4' then  stArmArea4:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '5' then  stArmArea5:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '6' then  stArmArea6:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '7' then  stArmArea7:= FindField('CP_PERMIT').AsString
          else if FindField('CP_NUMBER').AsString = '8' then  stArmArea8:= FindField('CP_PERMIT').AsString;
          bNodeSetting := False;
        end;
        stOldCardNo := FindField('CA_CARDNO').AsString;
        Application.ProcessMessages;
        Next;
      end;
      if Not bNodeSetting then    //마지막 셋팅 안한게 있으면 셋팅 하자.
      begin
        if dmMIAMSDataBase.CheckTB_CARDPERMIT_DeviceCardNo(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString) = 1 then
        begin
          dmMIAMSDataBase.UpdateMiamsTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString,
                     stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                     stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
        end else
        begin
          dmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString,
                     stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                     stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.EmployeePermitToCardLoad(aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  dmMIAMSDataBase.UpdateMiamsTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,'N','R');

  stSql := ' Select ND_NODENO,DE_ECUID,EM_SEQ from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND CP_APPLY = ''R'' ';
  stSql := stSql + ' GROUP BY ND_NODENO,DE_ECUID,EM_SEQ ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmMIAMSDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        EmployeePermitToCardDeviceLoad(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('EM_SEQ').AsString);
        Next;
      end;
      dmMIAMSDataBase.UpdateMiamsTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,'R','Y');
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmMain.EmployeePermitToFingerLoad(aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := ' Select a.EM_SEQ,b.FN_DEVICESEQ,c.CA_POSITIONNUM,a.CP_PERMIT,a.ND_NODENO,a.DE_ECUID,a.CP_TYPE,a.CP_NUMBER';
  stSql := stSql + ' from TB_CARDPERMITEMPLOYEECODE a ';
  stSql := stSql + ' INNER Join TB_FINGERDEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO  ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID  ';
  stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID  ';
  stSql := stSql + ' AND a.CP_TYPE = b.CP_TYPE  ';
  stSql := stSql + ' AND a.CP_NUMBER = b.DO_DOORNO)';
  stSql := stSql + ' INNER Join TB_CARD c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = c.EM_SEQ  ';
  stSql := stSql + ' AND c.CA_CARDGUBUN <> 999 ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmMIAMSDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;

      First;
      while Not Eof do
      begin
        if dmMIAMSDataBase.CheckTB_FINGERDEVICECARD_Value(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString) = 1 then
        begin
          dmMIAMSDataBase.UpdateMiamsTB_FINGERDEVICECARD_Value(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString,FindField('EM_SEQ').AsString,FindField('CP_PERMIT').AsString,'Y');
        end else
        begin
          dmMIAMSDataBase.InsertIntoMiamsTB_FINGERDEVICECARD_Value(FindField('FN_DEVICESEQ').AsString,FindField('CA_POSITIONNUM').AsString,FindField('EM_SEQ').AsString,FindField('CP_PERMIT').AsString,'Y');
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmMain.EmployeeTimePermit(aEmseq, aNodeNo, aEcuID, aDoorNo,
  aDayPermit, aNightPermit: string): Boolean;
var
  stTimeCodeUse : string;
  stTimeGroup : string;
  stTime1,stTime2,stTime3,stTime4 : string;
  stWeek : string;
begin
  stTimeCodeUse := '1';
  stTimeGroup := '0';
  if aDayPermit = '1' then  stTime1 := '1'
  else stTime1 := '0';
  if aNightPermit = '1' then
  begin
    stTime2 := '1';
    stTime3 := '1';
  end else
  begin
    stTime2 := '0';
    stTime3 := '0';
  end;
  stTime4 := '0';
  stWeek := '1111111';
  if dmMIAMSDataBase.CheckTB_EMPLOYEEDEVICETIMECODE_Value(aEmseq,aNodeNo,aEcuID) = 1 then
  begin
    dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEDEVICETIMECODE_Value(aEmseq,aNodeNo,aEcuID,
               stTimeCodeUse,stTimeGroup,stTime1,stTime2,stTime3,stTime4,stWeek);
  end else
  begin
    dmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEEDEVICETIMECODE_Value(aEmseq,aNodeNo,aEcuID,
               stTimeCodeUse,stTimeGroup,stTime1,stTime2,stTime3,stTime4,stWeek);
  end;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UnLoadRelayDoorList;
  RelayDoorList.Free;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  RelayDoorList := TStringList.Create;
end;

procedure TfmMain.GetFinger_EmpCode(aEmCode: string);
var
  stSql : string;
  TempSKACSAdoQuery : TAdoQuery;
  stCardNo : string;
  stPositionNum : string;
  stFingerUse : string;
  nCardNo : int64;
  stEmSeq : string;
begin
  stEmSeq := dmMIAMSDataBase.GetTB_EMPLOYEE_EmSeqFromEmCode(aEmCode);
  if stEmSeq = '' then
  begin
    showmessage('찾을 수 없는 사번입니다.');
    Exit;
  end;
  stSql := ' Select * from CardID ';
  stSql := stSql + ' Where PNo = ''' + aEmCode + ''' ';
  Try
    CoInitialize(nil);
    TempSKACSAdoQuery := TADOQuery.Create(nil);
    TempSKACSAdoQuery.Connection := dmSKACSDataBase.ADOConnection;
    TempSKACSAdoQuery.DisableControls;
    with TempSKACSAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        stCardNo := FindField('pID').AsString;
        if isDigit(stCardNo) then
        begin
          Try
            nCardNo := StrToInt64(stCardNo);
            stCardNo := Dec2Hex(nCardNo,8) + '********';
          Except
            Exit;
          End;
          stFingerUse := '1';
          //stPositionNum := '';
          //if stPositionNum = '' then
          stPositionNum := FindField('FRUSER').AsString;
          if dmMIAMSDataBase.CheckTB_CARD(stCardNo) <> 1 then
          begin
            dmMIAMSDataBase.InsertIntoMiamsTB_CARD_Value(stCardNo,'1','0',stPositionNum,stPositionNum,'0',stEmSeq,'');
          end;
          dmMIAMSDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_CARDUSE','1');
          EmployeePermitToCardLoad(stEmSeq);  //해당 사원의 권한을 디바이스 권한으로 옮기자.
          if FindField('fFingerTemplate1').IsNull or (Trim(FindField('fFingerTemplate1').AsString) = '') then
          begin
            stFingerUse := '0';
          end;
          if stFingerUse = '1' then
          begin
            //여기에서 카드와 지문아이디 검색 해서 지문정보 등록 하자.
            EmCodeToFingerDataSave(stEmSeq,aEmCode,FindField('pID').AsString,stPositionNum);
          end;

          EmployeePermitToFingerLoad(stEmSeq);
          dmMIAMSDataBase.UpdateMiamsTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(stEmSeq,'Y'); //해당권한의 지문을 설정완료 하자.
        end;
        Next;
      end;
    end;
  Finally
    TempSKACSAdoQuery.EnableControls;
    TempSKACSAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetMDBCardNo(aEmCode: string;var aPositionNum:string): string;
var
  stConnectString : string;
  stSql : string;
  stCardNo : string;
  nCardNo : int64;
begin
  result := '';
  if Not MDBADOConnection.Connected then
  begin
    G_stExeFolder  := ExtractFileDir(Application.ExeName);
      stConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      stConnectString := stConnectString + 'Data Source=' + G_stExeFolder + '\CardID.mdb' + ';';
      stConnectString := stConnectString + 'Persist Security Info=True;';
      stConnectString := stConnectString + 'Jet OLEDB:Database ';

    with MDBADOConnection do
    begin
      Connected := False;
      Try
        ConnectionString := stConnectString;
        LoginPrompt:= false ;
        Connected := True;
      Except
        on E : EDatabaseError do
          begin
            ShowMessage(stConnectString + E.Message );
            Exit;
          end;
        else
          begin
            ShowMessage('MDB데이터베이스 접속에러' );
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
    end;
  end;

  stSql := 'select * from CardID where pNo = ''' + aEmCode + ''' ' ;

  With ADOTempQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    stCardNo := FindField('pID').AsString;
    aPositionNum := FindField('FRUSER').AsString;
    if isDigit(stCardNo) then
    begin
      Try
        nCardNo := StrToInt64(stCardNo);
        stCardNo := Dec2Hex(nCardNo,8) + '********';
      Except
        Exit;
      End;
      result := stCardNo;
    end;
  end;


end;

function TfmMain.GetTB_DOOR_NoFromRelayNo(aNo: string;aIndex:integer; var aNodeNo, aEcuID,
  aDoorNo: string;var aNextIndex:integer): integer;
var
  nIndex : integer;
begin
  result := -1;
  nIndex := RelayDoorList.IndexOf(aNo);
  if nIndex < 0 then Exit;
  result := TRelayDoor(RelayDoorList.Objects[nIndex]).GetIndexDeviceInfo(aIndex,aNodeNo,aEcuID,aDoorNo,aNextIndex);
end;

procedure TfmMain.UnLoadRelayDoorList;
var
  i : integer;
begin
  if RelayDoorList.Count > 0 then
  begin
    for i := RelayDoorList.Count - 1 downto 0 do TRelayDoor(RelayDoorList.Objects[i]).Free;
    RelayDoorList.Clear;
  end;
end;

{ TRelayDoor }

constructor TRelayDoor.Create(AOwner: TComponent);
begin
  inherited;
  DoorList := TstringList.Create;

end;

destructor TRelayDoor.Destroy;
begin
  DoorList.Free;

  inherited;
end;

function TRelayDoor.GetIndexDeviceInfo(aIndex: integer; var aNodeNo, aEcuID,
  aDoorNo: string; var aNextIndex: integer): integer;
begin
  result := -1;
  if aIndex > DoorList.Count - 1 then Exit;
  aNodeNo := copy(DoorList.Strings[aIndex],1,G_nNodeCodeLength);
  aEcuID := copy(DoorList.Strings[aIndex],1 + G_nNodeCodeLength,2);
  aDoorNo := copy(DoorList.Strings[aIndex],1 + G_nNodeCodeLength + 2,1);
  result := 1;
  if aIndex < DoorList.Count - 1 then aNextIndex := aIndex + 1 //다음 출입문이 있는 거다.
  else aNextIndex := 0;
end;

function TRelayDoor.SetDoorList(aNodeNo, aEcuID, aDoorNo: string): Boolean;
var
  nIndex : integer;
  stDoorID : string;
begin
  result := False;
  stDoorID := FillZeroStrNum(aNodeNo,G_nNodeCodeLength) + aEcuID + aDoorNo;
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex < 0 then DoorList.Add(stDoorID);
  result := True;

end;

end.
