unit uMIAMSDataBase;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,Vcl.Forms,Winapi.Windows,Vcl.Dialogs,ActiveX,
  uCommonVariable;

type
  TdmMIAMSDataBase = class(TDataModule)
    ADOConnection: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FDBConnected: Boolean;
    FCancel: Boolean;
    FOnAdoConnected: TAdoConnectedEvent;
    procedure SetDBConnected(const Value: Boolean);
    procedure SetCancel(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Function DataBaseConnect(aDBType:integer;aDBHost,aDBPort,aDBUserID,aDBUserPw,aDBName:string;aMessage: Boolean):Boolean;
    Function DataBaseDisConnect:Boolean;
    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
  public
    Function CheckTB_BUILDINGCODE_Code(aCode,aDeepSeq:string):integer;
    Function CheckTB_CARD(aCardNo:string;var nEmSeq:integer):integer;
    function CheckTB_CARDPERMITEMPLOYEECODE_Value(aNodeNo,aEcuID,aExtendID,aDoorNo,aEmSeq:string):integer;
    function CheckTB_CARDPERMIT_DeviceCardNo(aNodeNo,aEcuID,aExtendID,aCardNo:string):integer;
    Function CheckTB_CARDPERMIT_Value(aNodeNo,aEcuID,aExtendID,aCardNo:string):integer;
    Function CheckTB_CARDPRINTLIST(aPrintNo:string):integer;
    Function CheckTB_COMPANYCODE_Code(aCode,aDeepSeq:string):integer;
    Function CheckTB_NODE_DeviceID(aDeviceID:string):integer;
    Function CheckTB_NODE_NodeIP(aNodeIP:string):integer;
    Function ConvertCardnoDigitTo16Byte(aCardNo:string):string;
    function copyHoliDayToDevice(aNodeNo,aEcuID:string):Boolean;
  public
    Function GetTB_ArmArea_NextViewSeq:integer;
    Function GetTB_BUILDINGCODE_LevelCode(aBuildingName,aParentCode,aBuildingLevel:string):string;
    Function GetTB_BUILDING_NextSeq(aCode,aDeepSeq:string;var aViewSeq:integer):integer;
    Function GetTB_CARD_NextPositionNum:integer;
    Function GetTB_CARD_EmSeqFromCardNo(aCardNo:string):string;
    Function GetTB_COMPANYCODE_LevelCode(aName,aParentCode,aLevel:string):string;
    Function GetTB_COMPANY_NextSeq(aCode,aDeepSeq:string;var aViewSeq:integer):integer;
    Function GetTB_DOOR_NextViewSeq : integer;
    function GetTB_EMPLOYEE_NextEmCode:string;
    function GetTB_EMPLOYEE_NextEmSeq:integer;
    function GetTB_NODE_DeviceIDNodeNo(aDeviceID,aServerNo:string):integer;
    function GetTB_NODE_NextNodeNo : integer;
  public
    Function InsertIntoMiamsTB_ARMAREA_DeviceARMAREAInit(aNodeNo,aEcuID,aArmAreaNo,aArmAreaName,aBuildingCode,aViewSeq:string;aArmAreaUse:string='0';aArmAreaView:string='0' ):Boolean;
    Function InsertIntoMiamsTB_BUILDINGCODE_Value(aCode,aName,aDeepSeq,aUse,aViewSeq:string):Boolean;
    Function InsertIntoMiamsTB_CARDGUBUN_Value(aCardGubun,aName:string):Boolean;
    Function InsertIntoMiamsTB_CARD_Value(aCardNo,aCardState,aCardGubun,aPositionNum,aRelayID,aGradeUse,aEmSeq,aCardPrintNo:string):Boolean;
    Function InsertIntoMiamsTB_CARDPERMITEMPLOYEECODE_VALUE(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber,aPermit,aApply:string):Boolean;
    Function InsertIntoMiamsTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,aExtendID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
               aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8:string;aPassword:string='';aCardType:string='1'):Boolean;
    Function InsertIntoMiamsTB_CARDPRINTLIST(aPrintNo,aCardNo:string):Boolean;
    Function InsertIntoMiamsTB_COMPANYCODE_Value(aCode,aName,aDeepSeq,aUse,aViewSeq:string):Boolean;
    Function InsertIntoMiamsTB_DEVICERCV_DeviceInit(aNodeNo,aEcuID,aExtendNo:string ):Boolean;
    Function InsertIntoMiamsTB_DEVICE_DeviceInit(aNodeNo,aEcuID,aExtendNo,aDeviceName,aBuildingCode:string;aUse:string='0' ):Boolean;
    Function InsertIntoMiamsTB_DOOR_DeviceDoorInit(aNodeNo,aEcuID,aDoorNo,aDoorName,aBuildingCode,aDoorViewSeq:string;aDoorUse:string='0';aDoorView:string='0' ):Boolean;
    Function InsertIntoMiamsTB_DOORRCV_DeviceDoorInit(aNodeNo,aEcuID,aDoorNo:string ):Boolean;
    Function InsertIntoMiamsTB_EMPLOYEE_Value(aEmSeq,aEmCode,aEmName,aCompanyCode,aPosiCode,aGubunCode,aCompanyPhone,aHomePhone,ahandPhone,aEmninfo,
             aRegDate,aEndDate,aACType,aATType,aFdType,aEmGroupCode,aGradeType,aFingerUse,aEmStateCode,aAWCode:string):Boolean;
    Function InsertIntoMiamsTB_FINGERDEVICE_Value(aFnSeq,aDeviceIP,aDeviceName,aPort,aDeviceType,aCPType,aNodeNo,aEcuID,aExtendID,aDoorNo,aFingerDeviceID:string;aBuildingCode:string='0'):Boolean;
    Function InsertIntoMiamsTB_NODE_Value(aNodeNo,aSockType,aDeviceID,aNodeIP,aNodeName,aNodeDeviceType,aServerNo:string;aBuildingCode:string='0';aTelNumber:string='';aAddr:string='';aAddDate:string=''):Boolean;
    Function InsertIntoMiamsTB_NODERCV_NodeNo(aNodeNo:string):Boolean;
    Function InsertIntoMiamsTB_READERRCV_ReaderInit(aNodeNo,aEcuID,aReaderNo:string ):Boolean;
    Function InsertIntoMiamsTB_READER_ReaderInit(aNodeNo,aEcuID,aReaderNo:string ):Boolean;
    Function InsertIntoMiamsTB_READER_TELNO(aNodeNo,aNO,aTELNumber:string):Boolean;
    Function InsertIntoMiamsTB_TIMECODEDEVICE_TimeCodeToDevice(aNodeNo,aEcuID,aBuildingCode:string):Boolean;
    Function InsertIntoMiamsTB_ZONEEXTENTION_ZoneInit(aNodeNo,aEcuID,aExtNo,aName,aType:string):Boolean;
    Function InsertIntoMiamsTB_ZONERCV_ZoneInit(aNodeNo,aEcuID,aExtNo,aZoneNo:string):Boolean;
    Function InsertIntoMiamsTB_ZONE_ZoneInit(aNodeNo,aEcuID,aExtNo,aZoneNo,aZoneName:string):Boolean;

    Function UpdateMiamsTB_ALARMEVENTSTATEPCCODE_Sound(aCode,aSound:string):Boolean;
    Function UpdateMiamsTB_BuildingCode_Name(aBuildingCode,aName:string):Boolean;
    Function UpdateMiamsTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,aExtendID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
               aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8:string;aPassword:string='';aCardType:string=''):Boolean;
    Function UpdateMiamsTB_CARDPERMITEMPLOYEECODE_DeviceToFingerApply(aNodeNo,aEcuID,aExtendID,aType,aNumber,aData:string;aPermit:string=''):Boolean;
    Function UpdateMiamsTB_CARDGUBUN_Value(aCardType,aName:string):Boolean;
    Function UpdateMiamsTB_COMPANYCODE_Name(aCompanyCode,aCompanyName:string):Boolean;
    Function UpdateMiamsTB_CONFIG_Value(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aCONFIGDETAIL:string=''):Boolean;
    Function UpdateMiamsTB_EMPLOYEE_Field_IntValue(aEmSeq,aFieldName,aValue:string):Boolean;
    Function UpdateMiamsTB_FORMNAME_Name(aPROGRAMGUBUN,aNAMECODE,aName:string):Boolean;
  public
    Property Cancel:Boolean read FCancel write SetCancel;
    Property DBConnected : Boolean read FDBConnected write SetDBConnected;
  Published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;
function SQLConfigDataSource(hwndParent : HWND; fRequest : WORD; lpszDriver : LPCSTR; lpszAttributes : LPCSTR) : Boolean; stdcall; external 'ODBCCP32.DLL';

var
  dmMIAMSDataBase: TdmMIAMSDataBase;

implementation

uses
  uCommonFunction ;


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmMIAMSDataBase }

function TdmMIAMSDataBase.CheckTB_BUILDINGCODE_Code(aCode,
  aDeepSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_BUILDINGCODE ';
  stSql := stSql + ' where BC_BUILDINGCODE = ''' + aCode + '''';
  stSql := stSql + ' AND BC_DEEPSEQ = ' + aDeepSeq + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.CheckTB_CARD(aCardNo: string;var nEmSeq:integer): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else
      begin
        result := 1;
        nEmSeq := FindField('EM_SEQ').AsInteger;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_Value(aNodeNo, aEcuID,
  aExtendID, aDoorNo, aEmSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''1'' ';
  stSql := stSql + ' AND CP_NUMBER = ' + aDoorNo + ' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.CheckTB_CARDPERMIT_DeviceCardNo(aNodeNo, aEcuID,
  aExtendID, aCardNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMIT ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.CheckTB_CARDPERMIT_Value(aNodeNo, aEcuID, aExtendID,
  aCardNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMIT ';
  stSql := stSql + ' where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.CheckTB_CARDPRINTLIST(aPrintNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPRINTLIST where CA_PRINTNO = ''' + aPrintNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.CheckTB_COMPANYCODE_Code(aCode,
  aDeepSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_COMPANYCODE ';
  stSql := stSql + ' where CO_COMPANYCODE = ''' + aCode + '''';
  stSql := stSql + ' AND CO_DEEPSEQ = ' + aDeepSeq + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


function TdmMIAMSDataBase.CheckTB_NODE_DeviceID(aDeviceID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_NODE ';
  stSql := stSql + ' where ND_DEVICEID = ''' + aDeviceID + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.CheckTB_NODE_NodeIP(aNodeIP: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_NODE ';
  stSql := stSql + ' where ND_NODEIP = ''' + aNodeIP + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.ConvertCardnoDigitTo16Byte(aCardNo: string): string;
var
  stCardNo : string;
begin
  result :='';
  if Not isDigit(aCardNo) then Exit;

  stCardNo := Dec2Hex(StrToInt64(aCardNo),8);
  stCardNo := FillCharString(stCardNo,'*',16);
  result := stCardNo;
end;

function TdmMIAMSDataBase.copyHoliDayToDevice(aNodeNo, aEcuID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_HOLIDAYDEVICE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'HO_DAY,';
  stSql := stSql + 'HD_USE,';
  stSql := stSql + 'HD_SEND) ';
  stSql := stSql + 'select GROUP_CODE,' ;
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + 'HO_DAY,';
  stSql := stSql + 'HO_ACUSE,';
  stSql := stSql + '''N'' ';
  stSql := stSql + ' From TB_HOLIDAY ';
  stSql := stSql + ' Where GROUP_CODE = ''1234567890'' ';
  stSql := stSql + ' AND HO_ACUSE = ''1'' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DataBaseConnect(aDBType:integer;aDBHost,aDBPort,aDBUserID,aDBUserPw,aDBName:string;aMessage: Boolean): Boolean;
var
  stConnectString : string;
  stDBType : string;
begin
  if DBConnected then Exit;
  result := False;
  CanCel := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  if aDBType = MSSQL then
  begin
    stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'User ID=' + aDBUserID + ';';
    stConnectString := stConnectString + 'Initial Catalog=' + aDBName + ';';
    stConnectString := stConnectString + 'Data Source=' + aDBHost  + ',' + aDBPort;
  end else if aDBType = POSTGRESQL then
  begin
    stConnectString := 'Provider=PostgreSQL OLE DB Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBHost + ';'   ;
    stConnectString := stConnectString + 'location=' + aDBName + ';';
    stConnectString := stConnectString + 'User Id='+ aDBUserID + ';';
    stConnectString := stConnectString + 'password=' + aDBUserPw;
  end else if aDBType = FIREBIRD then
  begin
    stConnectString := 'Provider=ZStyle IBOLE Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBHost + ':' + aDBName + ';';
    stConnectString := stConnectString + 'UID='+ aDBUserID + ';';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'DIALECT=3;';
  end else //디폴트로 MDB로 인식하자
  begin
    if Not FileExists(G_stExeFolder + '\..\db\SAC.mdb') then
    begin
      ChDir(G_stExeFolder + '\..\db');
      SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=SAC.mdb General'));
    end;

    stConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    stConnectString := stConnectString + 'Data Source=' + G_stExeFolder + '\..\db\SAC.mdb' + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'Jet OLEDB:Database ';
  end;

  with ADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := stConnectString;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          if aMessage then
            ShowMessage(stConnectString + E.Message );
          Exit;
        end;
      else
        begin
          if aMessage then
            ShowMessage('데이터베이스 접속에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    //CursorLocation := clUseClient;
  end;

  DBConnected := True;
  result := True;

end;

function TdmMIAMSDataBase.DataBaseDisConnect: Boolean;
begin
  DBConnected := False;
  with ADOConnection do
  begin
    Connected := False;
  end;
end;

procedure TdmMIAMSDataBase.DataModuleCreate(Sender: TObject);
begin
  DBConnected := False;
end;

function TdmMIAMSDataBase.GetTB_ArmArea_NextViewSeq: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select Max(AR_VIEWSEQ) as AR_VIEWSEQ from TB_ARMAREA ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('AR_VIEWSEQ').AsString) then Exit;
      result := FindField('AR_VIEWSEQ').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_BUILDINGCODE_LevelCode(aBuildingName,
  aParentCode, aBuildingLevel: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select BC_BUILDINGCODE from TB_BUILDINGCODE ';
  stSql := stSql + ' where BC_BUILDINGCODE Like ''' + aParentCode + '%''';
  stSql := stSql + ' AND BC_DEEPSEQ = ' + aBuildingLevel + '';
  stSql := stSql + ' AND BC_BUILDINGNAME = ''' + aBuildingName + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := FindField('BC_BUILDINGCODE').AsString;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_BUILDING_NextSeq(aCode, aDeepSeq: string;
  var aViewSeq: integer): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stCode : string;
begin
  result := 1;
  aViewSeq := 1;
  stSql := 'select Max(BC_BUILDINGCODE) as BC_BUILDINGCODE,Max(BC_VIEWSEQ) as BC_VIEWSEQ from TB_BUILDINGCODE ';
  stSql := stSql + ' where BC_BUILDINGCODE Like ''' + aCode + '%''';
  stSql := stSql + ' AND BC_DEEPSEQ = ' + aDeepSeq + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      if Trim(FindField('BC_BUILDINGCODE').AsString) = '' then Exit;
      stCode := FindField('BC_BUILDINGCODE').AsString;
      stCode := copy(stCode,2 + ( 3 * (strtoint(aDeepSeq) - 1) ) ,3);
      if Not isDigit(stCode) then Exit;
      result := strtoint(stCode) + 1;
      if Not isDigit(FindField('BC_VIEWSEQ').AsString) then Exit;
      aViewSeq := FindField('BC_VIEWSEQ').AsInteger + 1;
      //0001001025
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_CARD_EmSeqFromCardNo(aCardNo: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := '';

  stSql := 'Select EM_SEQ from TB_CARD Where CA_CARDNO = ''' + aCardNo + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;

      result := FindField('EM_SEQ').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_CARD_NextPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select Max(CA_POSITIONNUM) as CA_POSITIONNUM from TB_CARD ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('CA_POSITIONNUM').AsString) then Exit;
      result := FindField('CA_POSITIONNUM').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_COMPANYCODE_LevelCode(aName, aParentCode,
  aLevel: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select CO_COMPANYCODE from TB_COMPANYCODE ';
  stSql := stSql + ' where CO_COMPANYCODE Like ''' + aParentCode + '%''';
  stSql := stSql + ' AND CO_DEEPSEQ = ' + aLevel + '';
  stSql := stSql + ' AND CO_COMPANYNAME = ''' + aName + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := FindField('CO_COMPANYCODE').AsString;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_COMPANY_NextSeq(aCode,
  aDeepSeq: string;var aViewSeq:integer): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stCode : string;
begin
  result := 1;
  aViewSeq := 1;
  stSql := 'select Max(CO_COMPANYCODE) as CO_COMPANYCODE,Max(CO_VIEWSEQ) as CO_VIEWSEQ from TB_COMPANYCODE ';
  stSql := stSql + ' where CO_COMPANYCODE Like ''' + aCode + '%''';
  stSql := stSql + ' AND CO_DEEPSEQ = ' + aDeepSeq + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      if Trim(FindField('CO_COMPANYCODE').AsString) = '' then Exit;
      stCode := FindField('CO_COMPANYCODE').AsString;
      stCode := copy(stCode,2 + ( 3 * (strtoint(aDeepSeq) - 1) ) ,3);
      if Not isDigit(stCode) then Exit;
      result := strtoint(stCode) + 1;
      if Not isDigit(FindField('CO_VIEWSEQ').AsString) then Exit;
      aViewSeq := FindField('CO_VIEWSEQ').AsInteger + 1;
      //0001001025
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_DOOR_NextViewSeq: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select Max(DO_VIEWSEQ) as DO_VIEWSEQ from TB_DOOR ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('DO_VIEWSEQ').AsString) then Exit;
      result := FindField('DO_VIEWSEQ').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_EMPLOYEE_NextEmCode: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
  stEmCode : string;
begin

  result := 'KT00000001';

  stSql := 'Select Max(EM_CODE) as EM_CODE from TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_CODE Like ''KT%''';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      stEmCode := FindField('EM_CODE').AsString;
      if Trim(stEmCode) = '' then Exit;
      stEmCode := copy(stEmCode,3,8);
      if Not isDigit(stEmCode) then Exit;
      result := 'KT' + FillZeroNumber(strtoint(stEmCode) + 1,8);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_EMPLOYEE_NextEmSeq: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select Max(EM_SEQ) as EM_SEQ from TB_EMPLOYEE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('EM_SEQ').AsString) then Exit;
      result := FindField('EM_SEQ').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_NODE_DeviceIDNodeNo(aDeviceID,aServerNo: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := -1;

  stSql := 'Select ND_NODENO from TB_NODE ';
  stSql := stSql + ' Where ND_DEVICEID = ''' + aDeviceID + ''' ';
  if aServerNo <> '' then stSql := stSql + ' AND ND_DECODERNO = ' + aServerNo + '';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('ND_NODENO').AsString) then Exit;
      result := FindField('ND_NODENO').AsInteger;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_NODE_NextNodeNo: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select Max(ND_NODENO) as ND_NODENO from TB_NODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if Not isDigit(FindField('ND_NODENO').AsString) then Exit;
      result := FindField('ND_NODENO').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_ARMAREA_DeviceARMAREAInit(aNodeNo,
  aEcuID, aArmAreaNo, aArmAreaName,aBuildingCode,aViewSeq, aArmAreaUse, aArmAreaView: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aViewSeq) then aViewSeq := '1';

  stSql := 'Insert Into TB_ARMAREA (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' AR_ARMAREANO,';
  stSql := stSql + ' AR_ARMAREAUSE,';
  stSql := stSql + ' AR_VIEW,';
  stSql := stSql + ' AR_VIEWSEQ,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' AR_ARMAREANAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aArmAreaNo + ',';
  stSql := stSql + '''' + aArmAreaUse + ''', ';
  stSql := stSql + '''' + aArmAreaView + ''', ';
  stSql := stSql + '' + aViewSeq + ',';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + 'N''' + aArmAreaName + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_BUILDINGCODE_Value(aCode, aName,
  aDeepSeq, aUse, aViewSeq: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Insert Into TB_BUILDINGCODE (';
  stSql := stSql + 'BC_BUILDINGCODE,';
  stSql := stSql + 'BC_BUILDINGNAME,';
  stSql := stSql + 'BC_DEEPSEQ,';
  stSql := stSql + 'BC_CODEUSE,';
  stSql := stSql + 'BC_VIEWSEQ) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCode + ''',' ;
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '' + aDeepSeq + ',';
  stSql := stSql + '''' + aUse + ''',';
  stSql := stSql + '' + aViewSeq + ')';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_CARDGUBUN_Value(aCardGubun,
  aName: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Insert Into TB_CARDGUBUN (';
  stSql := stSql + 'CA_CARDGUBUN,';
  stSql := stSql + 'CA_CARDGUBUNNAME,';
  stSql := stSql + 'CA_RELAYTYPE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '' + aCardGubun + ',' ;
  stSql := stSql + 'N''' + aName + ''',';
  stSql := stSql + '''0'')';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMITEMPLOYEECODE_VALUE(aEmSeq,
  aNodeNo, aEcuID, aExtendID, aType, aNumber, aPermit, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CP_TYPE,';
  stSql := stSql + ' CP_NUMBER,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_APPLY,';
  stSql := stSql + ' CP_FINGERAPPLY ) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aType + ''', ';
  stSql := stSql + '' + aNumber + ', ';
  stSql := stSql + '''' + aPermit + ''', ';
  stSql := stSql + '''' + aApply + ''', ';
  stSql := stSql + '''' + aApply + ''' ) ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMIT_VALUE(aNodeNo, aEcuID,
  aExtendID, aCardNo, aPermit, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6,
  aDoor7, aDoor8, aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4,
  aArmArea5, aArmArea6, aArmArea7, aArmArea8, aPassword,
  aCardType: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMIT(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' CP_DOOR1,';
  stSql := stSql + ' CP_DOOR2,';
  stSql := stSql + ' CP_DOOR3,';
  stSql := stSql + ' CP_DOOR4,';
  stSql := stSql + ' CP_DOOR5,';
  stSql := stSql + ' CP_DOOR6,';
  stSql := stSql + ' CP_DOOR7,';
  stSql := stSql + ' CP_DOOR8,';
  stSql := stSql + ' CP_ARMAREA0,';
  stSql := stSql + ' CP_ARMAREA1,';
  stSql := stSql + ' CP_ARMAREA2,';
  stSql := stSql + ' CP_ARMAREA3,';
  stSql := stSql + ' CP_ARMAREA4,';
  stSql := stSql + ' CP_ARMAREA5,';
  stSql := stSql + ' CP_ARMAREA6,';
  stSql := stSql + ' CP_ARMAREA7,';
  stSql := stSql + ' CP_ARMAREA8,';
  stSql := stSql + ' CP_RCVACK,';
  stSql := stSql + ' CP_MEMLOAD , ';
  stSql := stSql + ' CP_PASSWD , ';
  stSql := stSql + ' CP_CARDTYPE ) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aPermit + ''', ';
  stSql := stSql + '''' + aDoor1 + ''', ';
  stSql := stSql + '''' + aDoor2 + ''', ';
  stSql := stSql + '''' + aDoor3 + ''', ';
  stSql := stSql + '''' + aDoor4 + ''', ';
  stSql := stSql + '''' + aDoor5 + ''', ';
  stSql := stSql + '''' + aDoor6 + ''', ';
  stSql := stSql + '''' + aDoor7 + ''', ';
  stSql := stSql + '''' + aDoor8 + ''', ';
  stSql := stSql + '''' + aArmArea0 + ''', ';
  stSql := stSql + '''' + aArmArea1 + ''', ';
  stSql := stSql + '''' + aArmArea2 + ''', ';
  stSql := stSql + '''' + aArmArea3 + ''', ';
  stSql := stSql + '''' + aArmArea4 + ''', ';
  stSql := stSql + '''' + aArmArea5 + ''', ';
  stSql := stSql + '''' + aArmArea6 + ''', ';
  stSql := stSql + '''' + aArmArea7 + ''', ';
  stSql := stSql + '''' + aArmArea8 + ''', ';
  stSql := stSql + '''Y'' , ';
  stSql := stSql + '''N'' , ';
  stSql := stSql + '''' + aPassword + ''' , ';
  stSql := stSql + '''' + aCardType + ''' ) ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_CARDPRINTLIST(aPrintNo,
  aCardNo: string): Boolean;
var
  stCardNo : string;
  stSql : string;
begin
  result := True;
  if CheckTB_CARDPRINTLIST(aPrintNo) = 1 then Exit;
  result := False;

  stCardNo := ConvertCardnoDigitTo16Byte(aCardNo);
  if stCardNo = '' then Exit;

  stSql := ' Insert Into TB_CARDPRINTLIST (CA_PRINTNO,CA_CARDNO) ';
  stSql := stSql + ' Values(''' + aPrintNo + ''',''' + stCardNo + ''') ';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_CARD_Value(aCardNo, aCardState,
  aCardGubun, aPositionNum, aRelayID, aGradeUse, aEmSeq,
  aCardPrintNo: string): Boolean;
var
  stSql : string;
  stUpdateTime : string;
begin
  stUpdateTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  stSql := 'Insert Into TB_CARD (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CA_STATECODE, ';
  stSql := stSql + ' CA_CARDGUBUN, ';
  stSql := stSql + ' CA_POSITIONNUM, ';
  stSql := stSql + ' CA_RELAYID, ';
  stSql := stSql + ' CA_GRADEUSE, ';
  stSql := stSql + ' EM_SEQ, ';
  stSql := stSql + ' CA_PRINTNO, ';
  stSql := stSql + ' CA_UPDATETIME, ';
  stSql := stSql + ' AD_USERID) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aCardState + ''', ';
  stSql := stSql + '' + aCardGubun + ', ';
  stSql := stSql + '' + aPositionNum + ', ';
  stSql := stSql + '' + aRelayID + ', ';
  stSql := stSql + '''' + aGradeUse + ''', ';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + aCardPrintNo + ''', ';
  stSql := stSql + '''' + stUpdateTime + ''', ';
  stSql := stSql + '''SYSTEM'') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_COMPANYCODE_Value(aCode, aName,
  aDeepSeq, aUse, aViewSeq: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Insert Into TB_COMPANYCODE (';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_COMPANYNAME,';
  stSql := stSql + 'CO_DEEPSEQ,';
  stSql := stSql + 'CO_CODEUSE,';
  stSql := stSql + 'CO_VIEWSEQ) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCode + ''',' ;
  stSql := stSql + 'N''' + aName + ''',';
  stSql := stSql + '' + aDeepSeq + ',';
  stSql := stSql + '''' + aUse + ''',';
  stSql := stSql + '' + aViewSeq + ')';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_DEVICERCV_DeviceInit(aNodeNo,
  aEcuID, aExtendNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DEVICERCV (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' DE_EXTENDID)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_DEVICE_DeviceInit(aNodeNo, aEcuID,
  aExtendNo, aDeviceName,aBuildingCode, aUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DE_DEVICENAME, ';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + ' DE_DEVICEUSE ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendNo + ', ';
  stSql := stSql + 'N''' + aDeviceName + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aUse + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_DOORRCV_DeviceDoorInit(aNodeNo,
  aEcuID, aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DOORRCV (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DO_DOORNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '''' + aDoorNo + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_DOOR_DeviceDoorInit(aNodeNo, aEcuID,
  aDoorNo, aDoorName,aBuildingCode,aDoorViewSeq, aDoorUse, aDoorView: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aDoorViewSeq) then aDoorViewSeq := '1';

  stSql := 'Insert Into TB_DOOR (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' DO_DOORUSE,';
  stSql := stSql + ' DO_VIEW,';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + ' DO_VIEWSEQ, ';
  stSql := stSql + ' DO_DOORNAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aDoorUse + ''', ';
  stSql := stSql + '''' + aDoorView + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '' + aDoorViewSeq + ',';
  stSql := stSql + 'N''' + aDoorName + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEE_Value(aEmSeq, aEmCode,
  aEmName, aCompanyCode, aPosiCode, aGubunCode, aCompanyPhone, aHomePhone,
  ahandPhone, aEmninfo, aRegDate, aEndDate, aACType, aATType, aFdType,
  aEmGroupCode, aGradeType, aFingerUse, aEmStateCode, aAWCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEE(';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' EM_GUBUNCODE,';
  stSql := stSql + ' EM_COMPANYPHONE,';
  stSql := stSql + ' EM_HOMEPHONE,';
  stSql := stSql + ' EM_HANDPHONE,';
  stSql := stSql + ' EM_EMINFO,';
  stSql := stSql + ' EM_REGDATE,';
  stSql := stSql + ' EM_ENDDATE,';
  stSql := stSql + ' EM_ACUSE,';
  stSql := stSql + ' EM_ATUSE,';
  stSql := stSql + ' EM_FDUSE,';
  stSql := stSql + ' EM_GROUPCODE,';
  stSql := stSql + ' EM_GRADETYPE, ';
  stSql := stSql + ' EM_FINGERUSE, ';
  stSql := stSql + ' EM_STATECODE, ';
  stSql := stSql + ' AW_CODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + 'N''' + aEmCode + ''', ';
  stSql := stSql + 'N''' + aEmName + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '' + aPosiCode + ', ';
  stSql := stSql + '' + aGubunCode + ', ';
  stSql := stSql + 'N''' + aCompanyPhone + ''', ';
  stSql := stSql + '''' + aHomePhone + ''', ';
  stSql := stSql + '''' + ahandPhone + ''', ';
  stSql := stSql + 'N''' + aEmninfo + ''', ';
  stSql := stSql + '''' + aRegDate + ''', ';
  stSql := stSql + '''' + aEndDate + ''', ';
  stSql := stSql + '''' + aACType + ''', ';
  stSql := stSql + '''' + aATType + ''', ';
  stSql := stSql + '''' + aFdType + ''', ';
  stSql := stSql + '''' + aEmGroupCode + ''', ';
  stSql := stSql + '' + aGradeType + ', ';
  stSql := stSql + '''' + aFingerUse + ''', ';
  stSql := stSql + '' + aEmStateCode + ', ';
  stSql := stSql + '' + aAWCode + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_FINGERDEVICE_Value(aFnSeq,
  aDeviceIP, aDeviceName, aPort, aDeviceType, aCPType, aNodeNo, aEcuID,
  aExtendID, aDoorNo, aFingerDeviceID, aBuildingCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FINGERDEVICE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FN_DEVICESEQ,';
  stSql := stSql + ' FN_DEVICEIP,';
  stSql := stSql + ' FN_DEVICENAME,';
  stSql := stSql + ' FN_DEVICEPORT,';
  stSql := stSql + ' FN_DEVICETYPE,';
  stSql := stSql + ' CP_TYPE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DO_DOORNO, ';
  stSql := stSql + ' FN_FINGERDEVICEID, ';
  stSql := stSql + ' BC_BUILDINGCODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aFnSeq + ', ';
  stSql := stSql + '''' + aDeviceIP + ''', ';
  stSql := stSql + 'N''' + aDeviceName + ''', ';
  stSql := stSql + '''' + aPort + ''', ';
  stSql := stSql + '' + aDeviceType + ', ';
  stSql := stSql + '''' + aCPType + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendID + ', ';
  stSql := stSql + '' + aDoorNo + ', ';
  stSql := stSql + '' + aFingerDeviceID + ', ';
  stSql := stSql + '''' + aBuildingCode + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_NODERCV_NodeNo(
  aNodeNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_NODERCV(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_NODE_Value(aNodeNo, aSockType,
  aDeviceID, aNodeIP, aNodeName, aNodeDeviceType, aServerNo, aBuildingCode,
  aTelNumber, aAddr, aAddDate: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aNodeDeviceType) then aNodeDeviceType := '0';
  if Not isDigit(aServerNo) then aServerNo := '1';

  stSql := 'Insert Into TB_NODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' ND_SOCKETTYPE,';
  stSql := stSql + ' ND_DEVICEID,';
  stSql := stSql + ' ND_NODEIP,';
  stSql := stSql + ' ND_NODEPORT,';
  stSql := stSql + ' ND_NODENAME,';
  stSql := stSql + ' ND_DEVICETYPE,';
  stSql := stSql + ' ND_DECODERNO,';
  stSql := stSql + ' ND_OLDDECORDERNO,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' ND_TELNUM,';
  stSql := stSql + ' ND_ADDR ,';
  stSql := stSql + ' ND_ADDDATE,';
  stSql := stSql + ' ND_MEMLOAD )';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aSockType + ''', ';
  stSql := stSql + '''' + aDeviceID + ''', ';
  stSql := stSql + '''' + aNodeIP + ''', ';
  stSql := stSql + '''3000'', ';
  stSql := stSql + 'N''' + aNodeName + ''', ';
  stSql := stSql + '' + aNodeDeviceType + ', ';
  stSql := stSql + '' + aServerNo + ', ';
  stSql := stSql + '' + aServerNo + ', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aTelNumber + ''', ';
  stSql := stSql + '''' + aAddr + ''', ';
  stSql := stSql + '''' + aAddDate + ''', ';
  stSql := stSql + '''N'') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_READERRCV_ReaderInit(aNodeNo,
  aEcuID, aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_READERRCV (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' RE_READERNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aReaderNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_READER_ReaderInit(aNodeNo, aEcuID,
  aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_READER (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' RE_READERNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aReaderNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_READER_TELNO(aNodeNo, aNO,
  aTELNumber: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_READER set RE_CARDREADERTEL' + aNO + ' = ''' + aTELNumber + ''' ';
  stSql := stsql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''00'' ';
  stSql := stSql + ' AND DE_EXTENDID = 0';
  stSql := stSql + ' AND RE_READERNO = 1';
  result := ProcessExecSQL(stSql);

  stSql := ' Update TB_READERRCV set RE_CARDREADERTEL' + aNO + ' = ''Y'' ';
  stSql := stsql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''00'' ';
  stSql := stSql + ' AND DE_EXTENDID = 0';
  stSql := stSql + ' AND RE_READERNO = 1';
  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_TIMECODEDEVICE_TimeCodeToDevice(
  aNodeNo, aEcuID, aBuildingCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TIMECODEDEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4 )';
  stSql := stSql + ' select ';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4 ';
  stSql := stSql + ' from TB_TIMECODE ';
  stSql := stSql + ' Where BC_BUILDINGCODE = ''' + aBuildingCode + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_ZONEEXTENTION_ZoneInit(aNodeNo,
  aEcuID, aExtNo, aName, aType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ZONEEXTENTION (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' ZE_EXTENTIONNAME,';
  stSql := stSql + ' ZE_TYPE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtNo + ',';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aType + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_ZONERCV_ZoneInit(aNodeNo, aEcuID,
  aExtNo, aZoneNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ZONERCV(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' ZN_ZONENO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtNo + ',';
  stSql := stSql + '' + aZoneNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_ZONE_ZoneInit(aNodeNo, aEcuID,
  aExtNo, aZoneNo, aZoneName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ZONE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' ZN_ZONENO,';
  stSql := stSql + ' ZN_ZONENAME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtNo + ',';
  stSql := stSql + '' + aZoneNo + ',';
  stSql := stSql + 'N''' + aZoneName + ''') ';

  result := ProcessExecSQL(stSql);
end;


function TdmMIAMSDataBase.ProcessExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  //원복시키자
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
//        LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log',aSql);
      except
      ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + aSql);

          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;

          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
      LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError(UPDATE)' + aSql);
    end;
  end else
  begin
    Result:= True;
  end;
end;

procedure TdmMIAMSDataBase.SetCancel(const Value: Boolean);
begin
  FCancel := Value;
end;

procedure TdmMIAMSDataBase.SetDBConnected(const Value: Boolean);
begin
  FDBConnected := Value;
end;

function TdmMIAMSDataBase.UpdateMiamsTB_CARDPERMITEMPLOYEECODE_DeviceToFingerApply(
  aNodeNo, aEcuID, aExtendID, aType, aNumber, aData, aPermit: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_FINGERAPPLY = ''' + aData + ''' ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' '; //aType 1.출입,2.방범
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';
  if aPermit <> '' then stSql := stSql + ' AND CP_PERMIT = ''' + aPermit + ''' ';


  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_CARDPERMIT_VALUE(aNodeNo, aEcuID,
  aExtendID, aCardNo, aPermit, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6,
  aDoor7, aDoor8, aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4,
  aArmArea5, aArmArea6, aArmArea7, aArmArea8, aPassword,
  aCardType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMIT set ';
  stSql := stSql + ' CP_PERMIT = ''' + aPermit + ''', ';
  stSql := stSql + ' CP_DOOR1 = ''' + aDoor1 + ''', ';
  stSql := stSql + ' CP_DOOR2 = ''' + aDoor2 + ''', ';
  stSql := stSql + ' CP_DOOR3 = ''' + aDoor3 + ''', ';
  stSql := stSql + ' CP_DOOR4 = ''' + aDoor4 + ''', ';
  stSql := stSql + ' CP_DOOR5 = ''' + aDoor5 + ''', ';
  stSql := stSql + ' CP_DOOR6 = ''' + aDoor6 + ''', ';
  stSql := stSql + ' CP_DOOR7 = ''' + aDoor7 + ''', ';
  stSql := stSql + ' CP_DOOR8 = ''' + aDoor8 + ''', ';
  stSql := stSql + ' CP_ARMAREA0 = ''' + aArmArea0 + ''', ';
  stSql := stSql + ' CP_ARMAREA1 = ''' + aArmArea1 + ''', ';
  stSql := stSql + ' CP_ARMAREA2 = ''' + aArmArea2 + ''', ';
  stSql := stSql + ' CP_ARMAREA3 = ''' + aArmArea3 + ''', ';
  stSql := stSql + ' CP_ARMAREA4 = ''' + aArmArea4 + ''', ';
  stSql := stSql + ' CP_ARMAREA5 = ''' + aArmArea5 + ''', ';
  stSql := stSql + ' CP_ARMAREA6 = ''' + aArmArea6 + ''', ';
  stSql := stSql + ' CP_ARMAREA7 = ''' + aArmArea7 + ''', ';
  stSql := stSql + ' CP_ARMAREA8 = ''' + aArmArea8 + ''', ';
  stSql := stSql + ' CP_RCVACK = ''Y'', ';
  stSql := stSql + ' CP_MEMLOAD = ''N'' ';
  if aPassword <> '' then stSql := stSql + ', CP_PASSWD = ''' + aPassword + '''  ';
  if aCardType <> '' then stSql := stSql + ', CP_CARDTYPE = ''' + aCardType + '''  ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_ALARMEVENTSTATEPCCODE_Sound(aCode,
  aSound: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_ALARMEVENTSTATEPCCODE set AP_SOUND = ' + aSound + ' ';
  stSql := stSql + ' Where AP_EVENTSTATEPCCODE = ''' + aCode + '''';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_BuildingCode_Name(aBuildingCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_BUILDINGCODE set BC_BUILDINGNAME = N''' + aName + ''' ';
  stSql := stSql + ' Where BC_BUILDINGCODE = ''' + aBuildingCode + '''';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_CARDGUBUN_Value(aCardType,
  aName: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_CARDGUBUN set CA_CARDGUBUNNAME = N''' + aName + ''' ';
  stSql := stSql + ' Where CA_CARDGUBUN = ' + aCardType + '';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_COMPANYCODE_Name(aCompanyCode,
  aCompanyName: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_COMPANYCODE set CO_COMPANYNAME = N''' + aCompanyName + ''' ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + '''';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_CONFIG_Value(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE, aCONFIGDETAIL: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_CONFIG set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  if aCONFIGDETAIL <> '' then stSql := stSql + ' ,CO_CONFIGDETAIL = ''' + aCONFIGDETAIL + ''' ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''' + aCONFIGGROUP + '''';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + '''';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_EMPLOYEE_Field_IntValue(aEmSeq,
  aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  result := True;
  stSql := ' Update TB_EMPLOYEE set ' + aFieldName + ' = ' + aValue + ' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_FORMNAME_Name(aPROGRAMGUBUN, aNAMECODE,
  aName: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_FORMNAME set FN_NAME1 = N''' + aName + ''' ';
  stSql := stSql + ' Where FN_PROGRAMGUBUN = ''' + aPROGRAMGUBUN + '''';
  stSql := stSql + ' AND FN_NAMECODE = ''' + aNAMECODE + '''';

  result := ProcessExecSql(stSql);
end;

end.
