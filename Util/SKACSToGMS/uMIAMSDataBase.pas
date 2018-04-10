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
    Function CheckTB_CARD(aCardNo:string):integer;
    function CheckTB_CARDPERMITEMPLOYEECODE_Permit(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber:string):integer;
    function CheckTB_CARDPERMIT_DeviceCardNo(aNodeNo,aEcuID,aExtendID,aCardNo:string):integer;
    Function CheckTB_CARDPERMIT_Value(aNodeNo,aEcuID,aExtendID,aCardNo:string):integer;
    Function CheckTB_CARDPRINTLIST(aPrintNo:string):integer;
    Function CheckTB_COMPANYCODE_Code(aCode,aDeepSeq:string):integer;
    function CheckTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq,aNodeNo,aEcuID:string):integer;
    Function CheckTB_EMPLOYEEFINGER(aEmSeq:string):integer;
    Function CheckTB_EMPLOYEE_EMCODE(aEmCode:string;var aEmSeq:string):integer;
    function CheckTB_FINGERDEVICECARD_Value(aFnSeq,aCardPOSITIONNUM:string):integer;
    function CheckTB_GUESTLIST_GLCode(aGlCode:string;var aGlSeq:string):integer;
    Function CheckTB_NODE_DeviceID(aDeviceID:string):integer;
    Function CheckTB_NODE_NodeIP(aNodeIP:string):integer;
    Function ConvertCardnoDigitTo16Byte(aCardNo:string):string;
    function copyHoliDayToDevice(aNodeNo,aEcuID:string):Boolean;
  public
    Function DeleteTB_ARMAREA_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_COMPANYCODE_Key(aCompanyCode:string):integer;
    Function DeleteTB_DEVICE_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_DEVICERCV_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_DOORRCV_DoorNo(aNodeNo,aEcuID,aDoorID:string):integer;
    Function DeleteTB_DOOR_DoorNo(aNodeNo,aEcuID,aDoorID:string):integer;
    Function DeleteTB_FINGERDEVICE_All:integer;
    Function DeleteTB_HOLIDAYDEVICE_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_Node_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_NODERCV_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_READER_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_READERRCV_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_TIMECODE_All : integer;
    Function DeleteTB_TIMECODEDEVICE_All:integer;
    Function DeleteTB_TIMECODEDEVICE_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_ZONE_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_ZONERCV_NodeNo(aNodeNo:string):integer;
    Function DeleteTB_ZONEEXTENTION_NodeNo(aNodeNo:string):integer;
  public
    Function GetTB_ArmArea_NextViewSeq:integer;
    Function GetTB_BUILDING_NextSeq(aCode,aDeepSeq:string;var aViewSeq:integer):integer;
    Function GetTB_CARD_NextPositionNum:integer;
    Function GetTB_COMPANYCODE_CodeFromBaseName(aCompanyCode,aName:string):string;
    Function GetTB_COMPANYCODE_CodeFromRelayCode(aCode:string;var aCompanyName:string):string;
    Function GetTB_COMPANY_NextSeq(aCode,aDeepSeq:string;var aViewSeq:integer):integer;
    Function GetTB_DOOR_NextViewSeq : integer;
    Function GetTB_DOOR_NoFromRelayNo(aNo:string; var aNodeNo:string;var aEcuID:string; var aDoorNo:string):integer;
    Function GetTB_EMPLOYEEGUBUN_CodeFromName(aName:string):string;
    Function GetTB_EMPLOYEEGUBUN_CodeFromRelayCode(aRelayCode:string;var aName:string):string;
    Function GetTB_EMPLOYEEGUBUN_NextCode : string;
    Function GetTB_EMPLOYEE_EmSeqFromEmCode(aEmCode:string):string;
    function GetTB_EMPLOYEE_NextEmCode:string;
    function GetTB_EMPLOYEE_NextEmSeq:integer;
    function GetTB_NODE_DeviceIDNodeNo(aDeviceID,aServerNo:string):integer;
    function GetTB_NODE_NextNodeNo : integer;
    function GetTB_POSICODE_CodeFromName(aName:string) : string;
    function GetTB_POSICODE_NextCode : string;
    function GetNextTB_FINGERDEVICE_ID : string;
  public
    Function InsertIntoMiamsTB_ARMAREA_DeviceARMAREAInit(aNodeNo,aEcuID,aArmAreaNo,aArmAreaName,aBuildingCode,aViewSeq:string;aArmAreaUse:string='0';aArmAreaView:string='0' ):Boolean;
    Function InsertIntoMiamsTB_BUILDINGCODE_Value(aCode,aName,aDeepSeq,aUse,aViewSeq:string):Boolean;
    Function InsertIntoMiamsTB_CARD_Value(aCardNo,aCardState,aCardGubun,aPositionNum,aRelayID,aGradeUse,aEmSeq,aCardPrintNo:string):Boolean;
    Function InsertIntoMiamsTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber,aPermit,aApply:string):Boolean;
    Function InsertIntoMiamsTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,aExtendID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
               aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8:string;aPassword:string='';aCardType:string='1'):Boolean;
    Function InsertIntoMiamsTB_CARDPRINTLIST(aPrintNo,aCardNo:string):Boolean;
    Function InsertIntoMiamsTB_COMPANYCODE_Value(aCode,aName,aDeepSeq,aUse,aViewSeq:string):Boolean;
    Function InsertIntoMiamsTB_DEVICERCV_DeviceInit(aNodeNo,aEcuID,aExtendNo:string ):Boolean;
    Function InsertIntoMiamsTB_DEVICE_DeviceInit(aNodeNo,aEcuID,aExtendNo,aDeviceName,aView,aBuildingCode:string;aUse:string='0' ):Boolean;
    Function InsertIntoMiamsTB_DOOR_DeviceDoorInit(aNodeNo,aEcuID,aDoorNo,aDoorName,aBuildingCode,aDoorViewSeq:string;aDoorUse:string='0';aDoorView:string='0';aRelayID:string='0';aTimeCodeUse:string='1'):Boolean;
    Function InsertIntoMiamsTB_DOORRCV_DeviceDoorInit(aNodeNo,aEcuID,aDoorNo:string ):Boolean;
    Function InsertIntoMiamsTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq,aNodeNo,aEcuID,aTimeCodeUse,aTimeGroup,aTime1,aTime2,aTime3,aTime4,aWeek:string):Boolean;
    Function InsertIntoMiamsTB_EMPLOYEEFINGER_Template(aEmSeq,aFingerSeq,aFingerTemplate1_1,aFingerTemplate1_2,aFingerTemplate2_1,aFingerTemplate2_2,aFingerTemplate3_1,aFingerTemplate3_2:string):Boolean;
    Function InsertIntoMiamsTB_EMPLOYEEGUBUN_Value(aCode,aName,aViewSeq,aRelayCode:string):Boolean;
    Function InsertMiamsIntoTB_EMPLOYEEHIS_CopyEmployee(aEmSeq,aWorkMode:string):Boolean;
    Function InsertIntoMiamsTB_EMPLOYEE_Value(aEmSeq,aEmCode,aEmName,aCompanyCode,aPosiCode,aGubunCode,aCompanyPhone,aHomePhone,ahandPhone,aEmninfo,
             aRegDate,aEndDate,aACType,aATType,aFdType,aEmGroupCode,aGradeType,aFingerUse,aEmStateCode,aAWCode:string;aCardUse:string='0';aRelayUse:string='0';aRelayCode:string='01'):Boolean;
    Function InsertIntoMiamsTB_FINGERDEVICECARD_Value(aFnSeq,aCardPOSITIONNUM,aEMSEQ,aPermit,aSend:string):Boolean;
    Function InsertIntoMiamsTB_FINGERDEVICE_Value(aFingerID,aFingerIP,aDoorName,aPort,aDeviceType,aCPType,aNodeNo,aEcuID,aDoorNo:string):Boolean;
    Function InsertIntoMiamsTB_GUESTLIST_Value(aEmSeq,aGlCode,aGlName,aGlFromTime,aGlToTime,aCompanyName,aHandPhone,aCardNo,aChange,aWorkFlag:string):Boolean;
    Function InsertIntoMiamsTB_NODE_Value(aNodeNo,aSockType,aDeviceID,aNodeIP,aNodeName,aNodeDeviceType,aServerNo:string;aBuildingCode:string='0';aTelNumber:string='';aAddr:string='';aAddDate:string=''):Boolean;
    Function InsertIntoMiamsTB_NODERCV_NodeNo(aNodeNo:string):Boolean;
    Function InsertIntoMiamsTB_POSICODE_Value(aCode,aName,aCompanyCode,aViewSeq:string):Boolean;
    Function InsertIntoMiamsTB_READERRCV_ReaderInit(aNodeNo,aEcuID,aReaderNo:string ):Boolean;
    Function InsertIntoMiamsTB_READER_ReaderInit(aNodeNo,aEcuID,aReaderNo:string ):Boolean;
    Function InsertIntoMiamsTB_READER_TELNO(aNodeNo,aNO,aTELNumber:string):Boolean;
    Function InsertIntoMiamsTB_SYSTEMLOG_All(aDate,aTime,aClientIP,aOperator,aNodeNo,aEcuID,aCardNo,aNumber,aType,aLogData:string):Boolean;
    Function InsertIntoMiamsTB_TIMECODE_BuildingChildAll(aBuildingCode,aGroup,aTime1,aTime2,aTime3,aTime4,aApply:string):Boolean;
    Function InsertIntoMiamsTB_TIMECODEDEVICE_BuildingChildAllDevice(aBuildingCode,aGroup,aTime1,aTime2,aTime3,aTime4,aChange:string):Boolean;
    Function InsertIntoMiamsTB_TIMECODEDEVICE_TimeCodeToDevice(aNodeNo,aEcuID,aBuildingCode:string):Boolean;
    Function InsertIntoMiamsTB_ZONEEXTENTION_ZoneInit(aNodeNo,aEcuID,aExtNo,aName,aType:string):Boolean;
    Function InsertIntoMiamsTB_ZONERCV_ZoneInit(aNodeNo,aEcuID,aExtNo,aZoneNo:string):Boolean;
    Function InsertIntoMiamsTB_ZONE_ZoneInit(aNodeNo,aEcuID,aExtNo,aZoneNo,aZoneName:string):Boolean;
    Function InsertIntoMiamsVW_APPROVE_LABOR(aJUMIN_NO,aLBR_NAME,aTAG,aAPP_FROM,aAPP_TO,aLS_CODE,aLS_GBN,aCO_CODE,aCO_NAME,aADDR,
                                             aHEIGHT,aWEIGHT,aJIKWI,aTEL,aCHG_DATE,aDEL_YN,aAPP_GATE,aAPP_GATE_NIGHT,aAPP_YN,
                                             aPHOTO_PATH,aCAUSE_CODE,aCAUSE_DESC,aCONST_CODE,aCONST_NAME,aCARD_NO,aIO_AREA,aBIRTH,
                                             aAREA_CD,aOLD_JUMINNO,aCHANGE_FLAG,aWORK_FLAG:string):Boolean;
  public
    Function updateMiamsTB_CARD_EmSeq(aCardNo,aEmSeq:string):Boolean;
    Function UpdateMiamsTB_CARDPERMITEMPLOYEECODE_DeviceToFingerApply(aNodeNo,aEcuID,aExtendID,aType,aNumber,aData:string;aPermit:string=''):Boolean;
    Function UpdateMiamsTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(aEM_SEQ,aFingerApply:string):Boolean;
    Function UpdateMiamsTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,aOldApply,aNewApply:string;aNodeNo:string='';aEcuID:string=''):Boolean;
    Function UpdateMiamsTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo,aEcuID,aExtendID,aType,aNumber,aFieldName,aData:string):Boolean;
    Function UpdateMiamsTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,aExtendID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
               aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8:string;aPassword:string='';aCardType:string=''):Boolean;
    Function UpdateMiamsTB_COMPANYCODE_Field_StringValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateMiamsTB_COMPANYCODE_Name(aCompanyCode,aCompanyName:string):Boolean;
    Function UpdateMiamsTB_CONFIG_Field_StringValue(aGroup,aCode,aFieldName,aData:string):Boolean;
    Function UpdateMiamsTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq,aNodeNo,aEcuID,aTimeCodeUse,aTimeGroup,aTime1,aTime2,aTime3,aTime4,aWeek:string):Boolean;
    Function UpdateMiamsTB_EMPLOYEEFINGER_Field_StringValue(aEmSeq,aFingerSeq,aFieldName,aData:string):Boolean;
    Function UpdateMiamsTB_EMPLOYEE_AllValue(aEmSeq,aEmCode,aEmName,aCompanyCode,aPosiCode,aEmGubunCode,aStateCode,
                                            aCompanyPhone,aHandPhone,aAddr,aStartDate,aEndDate,aACUse,aGradeType,aRelayUse,aRelayCode:string):Boolean;
    Function UpdateMiamsTB_EMPLOYEE_Field_IntValue(aEMSeq,aFieldName,aData:string):Boolean;
    Function UpdateMiamsTB_EMPLOYEE_Field_StringValue(aEMSeq,aFieldName,aData:string):Boolean;
    Function UpdateMiamsTB_EMPLOYEEGUBUN_Name(aCode,aName:string):Boolean;
    Function UpdateMiamsTB_EMPLOYEEGUBUN_Field_StringValue(aCode,aFieldName,aData:string):Boolean;
    Function UpdateMiamsTB_FINGERDEVICECARD_Value(aFnSeq,aCardPOSITIONNUM,aEMSEQ,aPermit,aSend:string):Boolean;
    Function UpdateMiamsTB_GUESTLIST_Value(aGlSeq,aEmName,aStartDate,aEndDate,aCompanyName,aHandPhone,aChangeFlag:string):Boolean;
  public
    Function EmployeeDoorPermitAdd(aEmSeq,aNodeNo,aEcuID,aExtendID,aDoorNo:string):Boolean;  //개인별 출입문 개별 등록
    Function EmployeeDoorPermitDelete(aEmSeq,aNodeNo,aEcuID,aExtendID,aDoorNo:string):Boolean;  //개인별 출입문 개별 삭제
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

function TdmMIAMSDataBase.CheckTB_CARD(aCardNo: string): integer;
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
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.CheckTB_CARDPERMITEMPLOYEECODE_Permit(aEmSeq, aNodeNo,
  aEcuID, aExtendID, aType, aNumber: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' ';
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

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


function TdmMIAMSDataBase.CheckTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq, aNodeNo,
  aEcuID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEEDEVICETIMECODE ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';

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

function TdmMIAMSDataBase.CheckTB_EMPLOYEEFINGER(aEmSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEEFINGER ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND EF_SEQ = 1 ';

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
      result := 0 ;
      if recordcount = 0 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.CheckTB_EMPLOYEE_EMCODE(aEmCode:string;var aEmSeq:string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' where EM_CODE = ''' + aEmCode + '''';

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
      result := 0 ;
      if recordcount = 0 then Exit;
      result := 1;
      aEmSeq := FindField('EM_SEQ').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.CheckTB_FINGERDEVICECARD_Value(aFnSeq,
  aCardPOSITIONNUM: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_FINGERDEVICECARD ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ = ' + aFnSeq + ' ';
  stSql := stSql + ' AND CA_POSITIONNUM = ' + aCardPOSITIONNUM + '';

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

function TdmMIAMSDataBase.CheckTB_GUESTLIST_GLCode(aGlCode: string;
  var aGlSeq: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_GUESTLIST ';
  stSql := stSql + ' Where GL_CODE = ''' + aGlCode + ''' ';

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
        aGlSeq := FindField('GL_SEQ').AsString;
      end;
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
    stConnectString := 'PROVIDER=SQLOLEDB.1;SERVER=localhost;DATABASE=' + aDBName + ';TRUSTED_CONNECTION=YES';
    (*stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'User ID=' + aDBUserID + ';';
    stConnectString := stConnectString + 'Initial Catalog=' + aDBName + ';';
    stConnectString := stConnectString + 'Data Source=' + aDBHost  + ',' + aDBPort; *)
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

function TdmMIAMSDataBase.DeleteTB_ARMAREA_NodeNo(aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ARMAREA where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_COMPANYCODE_Key(
  aCompanyCode: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_COMPANYCODE where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_DEVICERCV_NodeNo(aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICERCV where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_DEVICE_NodeNo(aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICE where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_DOORRCV_DoorNo(aNodeNo, aEcuID,
  aDoorID: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DOORRCV ';
  stSql := stSql + ' where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorID + ' ';

  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_DOOR_DoorNo(aNodeNo, aEcuID,
  aDoorID: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DOOR ';
  stSql := stSql + ' where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorID + ' ';

  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_FINGERDEVICE_All: integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_FINGERDEVICE ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_HOLIDAYDEVICE_NodeNo(
  aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_HOLIDAYDEVICE where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_NODERCV_NodeNo(aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_NODERCV where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_Node_NodeNo(aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_Node where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_READERRCV_NodeNo(aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_READERRCV where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_READER_NodeNo(aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_READER where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_TIMECODEDEVICE_All: integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_TIMECODEDEVICE ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_TIMECODEDEVICE_NodeNo(
  aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_TIMECODEDEVICE where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_TIMECODE_All: integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_TIMECODE ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_ZONEEXTENTION_NodeNo(
  aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ZONEEXTENTION where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_ZONERCV_NodeNo(aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ZONERCV where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.DeleteTB_ZONE_NodeNo(aNodeNo: string): integer;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ZONE where ND_NODENO = ' + aNodeNo + ' ';
  ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.EmployeeDoorPermitAdd(aEmSeq, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string): Boolean;
begin
  if CheckTB_CARDPERMITEMPLOYEECODE_Permit(aEmSeq,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDoorNo) = 1 then
  begin
    result := UpdateMiamsTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_PERMIT','1');
              UpdateMiamsTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_APPLY','N');
              UpdateMiamsTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_FINGERAPPLY','N');
  end else
  begin
    result := InsertIntoMiamsTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,aNodeNo,aEcuID,aExtendID,con_ComLogTYPE_DOOR,aDOORNO,'1','N');
  end;
end;

function TdmMIAMSDataBase.EmployeeDoorPermitDelete(aEmSeq, aNodeNo, aEcuID,
  aExtendID, aDoorNo: string): Boolean;
begin
  result := UpdateMiamsTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_PERMIT','0');
  UpdateMiamsTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_APPLY','N');
  UpdateMiamsTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, aExtendID, con_ComLogTYPE_DOOR, aDoorNo, 'CP_FINGERAPPLY','N');
end;

function TdmMIAMSDataBase.GetNextTB_FINGERDEVICE_ID: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := '1';

  stSql := 'Select Max(FN_DEVICESEQ) as FN_DEVICESEQ from TB_FINGERDEVICE ';
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
      if Not isDigit(FindField('FN_DEVICESEQ').AsString) then Exit;
      result := inttostr(FindField('FN_DEVICESEQ').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
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

function TdmMIAMSDataBase.GetTB_COMPANYCODE_CodeFromBaseName(aCompanyCode,
  aName: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := ' Select * from TB_COMPANYCODE ';
  stSql := stSql + ' where CO_COMPANYCODE Like ''' + aCompanyCode + '%'' ';
  stSql := stSql + ' AND CO_COMPANYNAME = ''' + aName + ''' ';
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
      result := FindField('CO_COMPANYCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_COMPANYCODE_CodeFromRelayCode(
  aCode: string;var aCompanyName:string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := ' Select * from TB_COMPANYCODE where CO_RELAYCOMPANYCODE = ''' + aCode + ''' ';
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
      result := FindField('CO_COMPANYCODE').AsString;
      aCompanyName := FindField('CO_COMPANYNAME').AsString;
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

function TdmMIAMSDataBase.GetTB_DOOR_NoFromRelayNo(aNo: string; var aNodeNo,
  aEcuID, aDoorNo: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := 1;

  stSql := 'Select * from TB_DOOR ';
  stSql := stSql + ' Where DO_RELAYID = ' + aNo + ' ';
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
      result := 0;
      if RecordCount < 1 then Exit;
      result := 1;
      aNodeNo := FindField('ND_NODENO').AsString;
      aEcuID := FindField('DE_ECUID').AsString;
      aDoorNo := FindField('DO_DOORNO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_EMPLOYEEGUBUN_CodeFromName(
  aName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '';
  stSql := ' select * from TB_EMPLOYEEGUBUN where EM_GUBUNCODENAME = N''' + aName + ''' ';
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
      result := FindField('EM_GUBUNCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmMIAMSDataBase.GetTB_EMPLOYEEGUBUN_CodeFromRelayCode(
  aRelayCode: string;var aName:string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '';
  stSql := ' select * from TB_EMPLOYEEGUBUN where EM_RELAYCODE = ''' + aRelayCode + ''' ';
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
      result := FindField('EM_GUBUNCODE').AsString;
      aName := FindField('EM_GUBUNCODENAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_EMPLOYEEGUBUN_NextCode: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '1';
  stSql := ' select Max(EM_GUBUNCODE) as EM_GUBUNCODE from TB_EMPLOYEEGUBUN ';
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
      result := inttostr(FindField('EM_GUBUNCODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_EMPLOYEE_EmSeqFromEmCode(
  aEmCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
  stEmCode : string;
begin

  result := '';

  stSql := 'Select EM_SEQ from TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmCode +'''';
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
  stSql := stSql + ' AND ND_DECODERNO = ' + aServerNo + '';

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

function TdmMIAMSDataBase.GetTB_POSICODE_CodeFromName(aName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '';
  stSql := 'Select * from TB_POSICODE ';
  stSql := stSql + ' Where PO_POSICODENAME = ''' + aName + ''' ';

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
      result := FindField('PO_POSICODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmMIAMSDataBase.GetTB_POSICODE_NextCode: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '1';
  stSql := 'Select Max(PO_POSICODE) as PO_POSICODE from TB_POSICODE ';

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
      if FindField('PO_POSICODE').IsNull then Exit;
      result := inttostr(FindField('PO_POSICODE').AsInteger + 1);
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

function TdmMIAMSDataBase.InsertIntoMiamsTB_CARDPERMITEMPLOYEECODE_Value(aEmSeq,
  aNodeNo, aEcuID, aExtendID, aType, aNumber, aPermit, aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARDPERMITEMPLOYEECODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_SEQ,';
  stSql := stSql + 'ND_NODENO,';
  stSql := stSql + 'DE_ECUID,';
  stSql := stSql + 'DE_EXTENDID,';
  stSql := stSql + 'CP_TYPE,';
  stSql := stSql + 'CP_NUMBER,';
  stSql := stSql + 'CP_PERMIT,';
  stSql := stSql + 'CP_APPLY, ';
  stSql := stSql + 'CP_FINGERAPPLY ) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + G_stGroupCode + ''',';
  stSql := stSql + ''+ aEmSeq +',';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '' + aExtendID + ',';
  stSql := stSql + '''' + aType + ''',';    //출입문타입 1 방범구역 타입 2
  stSql := stSql + '' + aNumber + ',';
  stSql := stSql + '''' + aPermit + ''',';    //권한 부여
  stSql := stSql + '''' + aApply + ''', ';
  stSql := stSql + '''' + aApply + ''') ';    //권한 부여 처리 여부

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
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DE_TIMECODEUSE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendNo + ', ';
  stSql := stSql + '''U'') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_DEVICE_DeviceInit(aNodeNo, aEcuID,
  aExtendNo, aDeviceName,aView,aBuildingCode, aUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_DEVICE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DE_EXTENDID,';
  stSql := stSql + ' DE_DEVICENAME, ';
  stSql := stSql + ' DE_VIEWSEQ, ';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + ' DE_DEVICEUSE ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aExtendNo + ', ';
  stSql := stSql + 'N''' + aDeviceName + ''', ';
  stSql := stSql + '' + aView + ', ';
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
  aDoorNo, aDoorName,aBuildingCode,aDoorViewSeq, aDoorUse, aDoorView,aRelayID,aTimeCodeUse: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aDoorViewSeq) then aDoorViewSeq := '1';
  if Not isDigit(aRelayID) then aRelayID := '0';
  if Not isDigit(aTimeCodeUse) then aTimeCodeUse := '1';

  stSql := 'Insert Into TB_DOOR (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' DO_DOORUSE,';
  stSql := stSql + ' DO_VIEW,';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + ' DO_VIEWSEQ, ';
  stSql := stSql + ' DO_DOORNAME, ';
  stSql := stSql + ' DO_NAMECHANGE, ';
  stSql := stSql + ' DO_RELAYID, ';
  stSql := stSql + ' DO_TIMECODEUSE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '' + aDoorNo + ',';
  stSql := stSql + '''' + aDoorUse + ''', ';
  stSql := stSql + '''' + aDoorView + ''', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '' + aDoorViewSeq + ',';
  stSql := stSql + 'N''' + aDoorName + ''', ';
  stSql := stSql + '''1'',';
  stSql := stSql + '' + aRelayID + ',';
  stSql := stSql + '' + aTimeCodeUse + ')';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq,
  aNodeNo, aEcuID, aTimeCodeUse, aTimeGroup, aTime1, aTime2, aTime3, aTime4,
  aWeek: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEEDEVICETIMECODE (';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' EM_TIMECODEUSE,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_WEEKCODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '''' + aTimeCodeUse + ''', ';
  stSql := stSql + '''' + aTimeGroup + ''', ';
  stSql := stSql + '''' + aTime1 + ''', ';
  stSql := stSql + '''' + aTime2 + ''', ';
  stSql := stSql + '''' + aTime3 + ''', ';
  stSql := stSql + '''' + aTime4 + ''', ';
  stSql := stSql + '''' + aWeek + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEEFINGER_Template(aEmSeq,
  aFingerSeq, aFingerTemplate1_1, aFingerTemplate1_2, aFingerTemplate2_1,
  aFingerTemplate2_2, aFingerTemplate3_1, aFingerTemplate3_2: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEEFINGER(';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' EF_SEQ,';
  stSql := stSql + ' EF_TEMPLATE1_1, ';
  stSql := stSql + ' EF_TEMPLATE1_2, ';
  stSql := stSql + ' EF_TEMPLATE2_1, ';
  stSql := stSql + ' EF_TEMPLATE2_2, ';
  stSql := stSql + ' EF_TEMPLATE3_1, ';
  stSql := stSql + ' EF_TEMPLATE3_2) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '' + aFingerSeq + ', ';
  stSql := stSql + '''' + aFingerTemplate1_1 + ''', ';
  stSql := stSql + '''' + aFingerTemplate1_2 + ''', ';
  stSql := stSql + '''' + aFingerTemplate2_1 + ''', ';
  stSql := stSql + '''' + aFingerTemplate2_2 + ''', ';
  stSql := stSql + '''' + aFingerTemplate3_1 + ''', ';
  stSql := stSql + '''' + aFingerTemplate3_2 + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEEGUBUN_Value(aCode, aName,
  aViewSeq,aRelayCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEEGUBUN(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_GUBUNCODE,';
  stSql := stSql + ' EM_GUBUNCODENAME, ';
  stSql := stSql + ' EM_VIEWSEQ, ';
  stSql := stSql + ' EM_RELAYCODE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '' + aViewSeq + ', ';
  stSql := stSql + '''' + aRelayCode + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_EMPLOYEE_Value(aEmSeq, aEmCode,
  aEmName, aCompanyCode, aPosiCode, aGubunCode, aCompanyPhone, aHomePhone,
  ahandPhone, aEmninfo, aRegDate, aEndDate, aACType, aATType, aFdType,
  aEmGroupCode, aGradeType, aFingerUse, aEmStateCode, aAWCode: string;aCardUse:string='0';aRelayUse:string='0';aRelayCode:string='01'): Boolean;
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
  stSql := stSql + ' AW_CODE, ';
  stSql := stSql + ' EM_CARDUSE, ';
  stSql := stSql + ' EM_RELAYUSE, ';
  stSql := stSql + ' EM_RELAYDATE, ';
  stSql := stSql + ' EM_RELAYCODE) ';
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
  stSql := stSql + '' + aAWCode + ', ';
  stSql := stSql + '' + aCardUse + ', ';
  stSql := stSql + '' + aRelayUse + ', ';
  stSql := stSql + '''' + formatDateTime('yyyymmdd',now) + ''', ';
  stSql := stSql + '''' + aRelayCode + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_FINGERDEVICECARD_Value(aFnSeq,
  aCardPOSITIONNUM, aEMSEQ, aPermit, aSend: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FINGERDEVICECARD(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FN_DEVICESEQ,';
  stSql := stSql + ' CA_POSITIONNUM,';
  stSql := stSql + ' EM_SEQ,';
  stSql := stSql + ' CP_PERMIT,';
  stSql := stSql + ' FD_SEND) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '' + aFnSeq + ', ';
  stSql := stSql + '' + aCardPOSITIONNUM + ', ';
  stSql := stSql + '' + aEMSEQ + ', ';
  stSql := stSql + '''' + aPermit + ''', ';
  stSql := stSql + '''' + aSend + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_FINGERDEVICE_Value(aFingerID,
  aFingerIP,aDoorName,aPort,aDeviceType,aCPType,aNodeNo,aEcuID,aDoorNo: string): Boolean;
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
  stSql := stSql + ' DO_DOORNO) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aFingerID + ', ';
  stSql := stSql + '''' + aFingerIP + ''', ';
  stSql := stSql + 'N''' + aDoorName + ''', ';
  stSql := stSql + '''' + aPort + ''', ';
  stSql := stSql + '' + aDeviceType + ', ';
  stSql := stSql + '''' + aCPType + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '0, ';
  stSql := stSql + '' + aDoorNo + ') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_GUESTLIST_Value(aEmSeq, aGlCode,
  aGlName, aGlFromTime, aGlToTime, aCompanyName, aHandPhone, aCardNo, aChange,
  aWorkFlag: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_GUESTLIST(';
  stSql := stSql + ' EM_SEQ ,';
  stSql := stSql + ' GL_CODE ,';
  stSql := stSql + ' GL_NAME,';
  stSql := stSql + ' GL_FROMTIME ,';
  stSql := stSql + ' GL_TOTIME,';
  stSql := stSql + ' GL_COMPANYNAME ,';
  stSql := stSql + ' GL_TELNUMBER , ';
  stSql := stSql + ' GL_CARDNO , ';
//  stSql := stSql + ' GL_APPGATE  , ';
//  stSql := stSql + ' GL_APPGATENIGHT, ';
  stSql := stSql + ' GL_CHANGEFLAG , ';
  stSql := stSql + ' GL_WORKFLAG , ';
  stSql := stSql + ' GL_UPDATETIME) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '' + aEmSeq + ', ';
  stSql := stSql + '''' + aGlCode + ''', ';
  stSql := stSql + 'N''' + aGlName + ''', ';
  stSql := stSql + '''' + aGlFromTime + ''', ';
  stSql := stSql + '''' + aGlToTime + ''', ';
  stSql := stSql + 'N''' + aCompanyName + ''', ';
  stSql := stSql + '''' + aHandPhone + ''', ';
  stSql := stSql + '''' + aCardNo + ''', ';
//  stSql := stSql + '''' + aAppGate + ''', ';
//  stSql := stSql + '''' + aAppGateNight + ''', ';
  stSql := stSql + '''' + aChange + ''', ';
  stSql := stSql + '' + aWorkFlag + ', ';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''') ';

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
  stSql := stSql + ' ND_NODENAME,';
  stSql := stSql + ' ND_DEVICETYPE,';
  stSql := stSql + ' ND_DECODERNO,';
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
  stSql := stSql + 'N''' + aNodeName + ''', ';
  stSql := stSql + '' + aNodeDeviceType + ', ';
  stSql := stSql + '' + aServerNo + ', ';
  stSql := stSql + '''' + aBuildingCode + ''', ';
  stSql := stSql + '''' + aTelNumber + ''', ';
  stSql := stSql + '''' + aAddr + ''', ';
  stSql := stSql + '''' + aAddDate + ''', ';
  stSql := stSql + '''N'') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_POSICODE_Value(aCode, aName,
  aCompanyCode, aViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_POSICODE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' PO_POSICODENAME,';
  stSql := stSql + ' CO_COMPANYCODE, ';
  stSql := stSql + ' PO_VIEWSEQ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'', ';
  stSql := stSql + '' + aCode + ', ';
  stSql := stSql + 'N''' + aName + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '' + aViewSeq + ') ';

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

function TdmMIAMSDataBase.InsertIntoMiamsTB_SYSTEMLOG_All(aDate, aTime,
  aClientIP, aOperator, aNodeNo, aEcuID, aCardNo, aNumber, aType,
  aLogData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_SYSTEMLOG (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' SY_DATE,';
  stSql := stSql + ' SY_TIME,';
  stSql := stSql + ' SY_CLIENTIP,';
  stSql := stSql + ' SY_OPERATOR,';
  stSql := stSql + ' ND_NODENO,';
  stSql := stSql + ' DE_ECUID,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' SY_NUMBER,';
  stSql := stSql + ' SY_TYPE,';
  stSql := stSql + ' SY_LOGDATA) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + G_stGroupCode + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '''' + aClientIP + ''', ';
  stSql := stSql + '''' + aOperator + ''', ';
  stSql := stSql + '' + aNodeNo + ', ';
  stSql := stSql + '''' + aEcuID + ''', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aNumber + ''', ';
  stSql := stSql + '''' + aType + ''', ';
  stSql := stSql + 'N''' + aLogData + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertIntoMiamsTB_TIMECODEDEVICE_BuildingChildAllDevice(
  aBuildingCode, aGroup, aTime1, aTime2, aTime3, aTime4,
  aChange: string): Boolean;
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
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_SEND )';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE, ';
  stSql := stSql + ' ND_NODENO, ';
  stSql := stSql + ' DE_ECUID, ';
  stSql := stSql + ' ''' + aGroup + ''',';
  stSql := stSql + ' ''' + aTime1 + ''',';
  stSql := stSql + ' ''' + aTime2 + ''',';
  stSql := stSql + ' ''' + aTime3 + ''',';
  stSql := stSql + ' ''' + aTime4 + ''', ';
  stSql := stSql + ' ''' + aChange + ''' ';
  stSql := stSql + ' from TB_DEVICE ';
  stSql := stSql + ' Where BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  stSql := stSql + ' AND DE_EXTENDID = 0';
  stSql := stSql + ' AND DE_TIMECODETYPE = 0';

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

function TdmMIAMSDataBase.InsertIntoMiamsTB_TIMECODE_BuildingChildAll(
  aBuildingCode, aGroup, aTime1, aTime2, aTime3, aTime4,
  aApply: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TIMECODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' BC_BUILDINGCODE,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_APPLY )';
  stSql := stSql + ' Select';
  stSql := stSql + ' GROUP_CODE, ';
  stSql := stSql + ' BC_BUILDINGCODE, ';
  stSql := stSql + '''' + aGroup + ''', ';
  stSql := stSql + '''' + aTime1 + ''', ';
  stSql := stSql + '''' + aTime2 + ''', ';
  stSql := stSql + '''' + aTime3 + ''', ';
  stSql := stSql + '''' + aTime4 + ''', ';
  stSql := stSql + '''' + aApply + ''' ';
  stSql := stSql + ' FROM TB_BUILDINGCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''1234567890'' ';
  stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';

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


function TdmMIAMSDataBase.InsertIntoMiamsVW_APPROVE_LABOR(aJUMIN_NO, aLBR_NAME,
  aTAG, aAPP_FROM, aAPP_TO, aLS_CODE, aLS_GBN, aCO_CODE, aCO_NAME, aADDR,
  aHEIGHT, aWEIGHT, aJIKWI, aTEL, aCHG_DATE, aDEL_YN, aAPP_GATE,
  aAPP_GATE_NIGHT, aAPP_YN, aPHOTO_PATH, aCAUSE_CODE, aCAUSE_DESC, aCONST_CODE,
  aCONST_NAME, aCARD_NO, aIO_AREA, aBIRTH, aAREA_CD, aOLD_JUMINNO, aCHANGE_FLAG,
  aWORK_FLAG: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into VW_APPROVE_LABOR( ';
  stSql := stSql + ' JUMIN_NO,';
  stSql := stSql + ' LBR_NAME,';
  stSql := stSql + ' TAG,';
  stSql := stSql + ' APP_FROM,';
  stSql := stSql + ' APP_TO,';
  stSql := stSql + ' LS_CODE,';
  stSql := stSql + ' LS_GBN,';
  stSql := stSql + ' CO_CODE,';
  stSql := stSql + ' CO_NAME,';
  stSql := stSql + ' ADDR,';
  stSql := stSql + ' HEIGHT,';
  stSql := stSql + ' WEIGHT,';
  stSql := stSql + ' JIKWI,';
  stSql := stSql + ' TEL,';
  stSql := stSql + ' CHG_DATE,';
  stSql := stSql + ' DEL_YN,';
  stSql := stSql + ' APP_GATE,';
  stSql := stSql + ' APP_GATE_NIGHT,';
  stSql := stSql + ' APP_YN,';
  stSql := stSql + ' PHOTO_PATH,';
  stSql := stSql + ' CAUSE_CODE,';
  stSql := stSql + ' CAUSE_DESC,';
  stSql := stSql + ' CONST_CODE,';
  stSql := stSql + ' CONST_NAME,';
  stSql := stSql + ' CARD_NO,';
  stSql := stSql + ' IO_AREA,';
  stSql := stSql + ' BIRTH,';
  stSql := stSql + ' AREA_CD,';
  stSql := stSql + ' OLD_JUMINNO,';
  stSql := stSql + ' CHANGE_FLAG,';
  stSql := stSql + ' WORK_FLAG ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aJUMIN_NO + ''',';
  stSql := stSql + '''' + aLBR_NAME + ''',';
  stSql := stSql + '''' + aTAG + ''',';
  stSql := stSql + '''' + aAPP_FROM + ''',';
  stSql := stSql + '''' + aAPP_TO + ''',';
  stSql := stSql + '''' + aLS_CODE + ''',';
  stSql := stSql + '''' + aLS_GBN + ''',';
  stSql := stSql + '''' + aCO_CODE + ''',';
  stSql := stSql + '''' + aCO_NAME + ''',';
  stSql := stSql + '''' + aADDR + ''',';
  stSql := stSql + '''' + aHEIGHT + ''',';
  stSql := stSql + '''' + aWEIGHT + ''',';
  stSql := stSql + '''' + aJIKWI + ''',';
  stSql := stSql + '''' + aTEL + ''',';
  stSql := stSql + '''' + aCHG_DATE + ''',';
  stSql := stSql + '''' + aDEL_YN + ''',';
  stSql := stSql + '''' + aAPP_GATE + ''',';
  stSql := stSql + '''' + aAPP_GATE_NIGHT + ''',';
  stSql := stSql + '''' + aAPP_YN + ''',';
  stSql := stSql + '''' + aPHOTO_PATH + ''',';
  stSql := stSql + '''' + aCAUSE_CODE + ''',';
  stSql := stSql + '''' + aCAUSE_DESC + ''',';
  stSql := stSql + '''' + aCONST_CODE + ''',';
  stSql := stSql + '''' + aCONST_NAME + ''',';
  stSql := stSql + '''' + aCARD_NO + ''',';
  stSql := stSql + '''' + aIO_AREA + ''',';
  stSql := stSql + '''' + aBIRTH + ''',';
  stSql := stSql + '''' + aAREA_CD + ''',';
  stSql := stSql + '''' + aOLD_JUMINNO + ''',';
  stSql := stSql + '''' + aCHANGE_FLAG + ''',';
  stSql := stSql + '''' + aWORK_FLAG + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.InsertMiamsIntoTB_EMPLOYEEHIS_CopyEmployee(aEmSeq,
  aWorkMode: string): Boolean;
var
  stSql : string;
  stInsertTime : string;
begin
  stInsertTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  //stSql := ' SET IDENTITY_INSERT  TB_EMPLOYEEHIS ON ';
  //result := dmDataBase.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_EMPLOYEEHIS( ';
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
  stSql := stSql + ' EM_GRADETYPE,';
  stSql := stSql + ' EM_WORKMODE,';
  stSql := stSql + ' EM_INSERTTIME,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' EM_PCIP ) ';
  stSql := stSql + ' select ';
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
  stSql := stSql + ' EM_GRADETYPE,';
  stSql := stSql + '''' + aWorkMode + ''',';
  stSql := stSql + '''' + stInsertTime + ''',';
  stSql := stSql + '''RELAY'',';
  stSql := stSql + '''127.0.0.1''  ';
  stSql := stSql + ' From TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + '';
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

function TdmMIAMSDataBase.UpdateMiamsTB_CARDPERMITEMPLOYEECODE_EmSeqAllFingerApply(
  aEM_SEQ, aFingerApply: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_FINGERAPPLY = ''' + aFingerApply + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEM_SEQ + ' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(
  aEmSeq, aOldApply, aNewApply, aNodeNo, aEcuID: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ';
  stSql := stSql + ' CP_APPLY = ''' + aNewApply + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND CP_APPLY = ''' + aOldApply + ''' ';
  if aEcuID <> '' then
  begin
    stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  end;

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_CARDPERMITEMPLOYEECODE_Field_StringValue(
  aEmSeq, aNodeNo, aEcuID, aExtendID, aType, aNumber, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARDPERMITEMPLOYEECODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_EXTENDID = ' + aExtendID + ' ';
  stSql := stSql + ' AND CP_TYPE = ''' + aType + ''' '; //aType 1.출입,2.방범
  stSql := stSql + ' AND CP_NUMBER = ' + aNumber + ' ';

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

function TdmMIAMSDataBase.updateMiamsTB_CARD_EmSeq(aCardNo,
  aEmSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CARD set EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_COMPANYCODE_Field_StringValue(aCode,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if UpperCase(aFieldName) = 'CO_COMPANYNAME' then
    stSql := 'Update TB_COMPANYCODE set ' + aFieldName + ' = N''' + aData + ''' '
  else
    stSql := 'Update TB_COMPANYCODE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCode + ''' ';

  result := ProcessExecSQL(stSql);
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

function TdmMIAMSDataBase.UpdateMiamsTB_CONFIG_Field_StringValue(aGroup, aCode,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if UpperCase(aFieldName) = 'CO_CONFIGDETAIL' then stSql := 'Update TB_CONFIG set ' + aFieldName + ' = N''' + aData + ''' '
  else stSql := 'Update TB_CONFIG set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aGroup + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCode + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEDEVICETIMECODE_Value(aEmSeq,
  aNodeNo, aEcuID, aTimeCodeUse, aTimeGroup, aTime1, aTime2, aTime3, aTime4,
  aWeek: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEEDEVICETIMECODE set  EM_TIMECODEUSE = ''' + aTimeCodeUse + ''' ' ;
  stSql := stSql + ',TC_GROUP = ''' + aTimeGroup + ''' ';
  stSql := stSql + ',TC_TIME1 = ''' + aTime1 + ''' ';
  stSql := stSql + ',TC_TIME2 = ''' + aTime2 + ''' ';
  stSql := stSql + ',TC_TIME3 = ''' + aTime3 + ''' ';
  stSql := stSql + ',TC_TIME4 = ''' + aTime4 + ''' ';
  stSql := stSql + ',TC_WEEKCODE = ''' + aWeek + ''' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''' + aEcuID + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEFINGER_Field_StringValue(aEmSeq,
  aFingerSeq, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEEFINGER set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND EF_SEQ = ' + aFingerSeq + ' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEGUBUN_Field_StringValue(aCode,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_EMPLOYEEGUBUN set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where EM_GUBUNCODE = ' + aCode + '';

  result := ProcessExecSql(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_EMPLOYEEGUBUN_Name(aCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  result := True;

  stSql := ' Update TB_EMPLOYEEGUBUN set EM_GUBUNCODENAME = N''' + aName + ''' ';
  stSql := stSql + ' Where EM_GUBUNCODE = ' + aCode + '';

  result := ProcessExecSql(stSql);

end;

function TdmMIAMSDataBase.UpdateMiamsTB_EMPLOYEE_AllValue(aEmSeq, aEmCode,
  aEmName, aCompanyCode, aPosiCode, aEmGubunCode, aStateCode, aCompanyPhone,
  aHandPhone, aAddr, aStartDate, aEndDate, aACUse, aGradeType,
  aRelayUse,aRelayCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set EM_CODE = ''' + aEmCode + ''', ';
  stSql := stSql + ' EM_NAME = N''' + aEmName + ''', ';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCompanyCode + ''', ';
  stSql := stSql + ' PO_POSICODE = ' + aPosiCode + ', ';
  stSql := stSql + ' EM_GUBUNCODE = ' + aEmGubunCode + ', ';
  stSql := stSql + ' EM_STATECODE = ''' + aStateCode + ''', ';
  stSql := stSql + ' EM_COMPANYPHONE = ''' + aCompanyPhone + ''', ';
  stSql := stSql + ' EM_HANDPHONE = ''' + aHandPhone + ''', ';
  stSql := stSql + ' EM_EMINFO = N''' + aAddr + ''', ';
  stSql := stSql + ' EM_REGDATE = ''' + aStartDate + ''', ';
  stSql := stSql + ' EM_ENDDATE = ''' + aEndDate + ''', ';
  stSql := stSql + ' EM_ACUSE = ''' + aACUse + ''', ';
  stSql := stSql + ' EM_GRADETYPE = ' + aGradeType + ', ';
  stSql := stSql + ' EM_RELAYUSE = ' + aRelayUse + ', ';
  stSql := stSql + ' EM_RELAYDATE = ''' + formatDateTime('yyyymmdd',now) + ''', ';
  stSql := stSql + ' EM_RELAYCODE = ''' + aRelayCode + ''' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEMSeq + ' ';

  result := ProcessExecSQL(stSql);

end;

function TdmMIAMSDataBase.UpdateMiamsTB_EMPLOYEE_Field_IntValue(aEMSeq,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set ' + aFieldName + ' = ' + aData + ' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEMSeq + ' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_EMPLOYEE_Field_StringValue(aEMSeq,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  if (Uppercase(aFieldName) = 'EM_NAME') or (Uppercase(aFieldName) = 'EM_EMINFO') then
    stSql := 'Update TB_EMPLOYEE set ' + aFieldName + ' = N''' + aData + ''' '
  else
    stSql := 'Update TB_EMPLOYEE set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where EM_SEQ = ' + aEMSeq + ' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_FINGERDEVICECARD_Value(aFnSeq,
  aCardPOSITIONNUM, aEMSEQ, aPermit, aSend: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FINGERDEVICECARD set ';
  stSql := stSql + ' EM_SEQ = ' + aEMSEQ + ',';
  stSql := stSql + ' CP_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + ' FD_SEND = ''' + aSend + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_DEVICESEQ = ' + aFnSeq + ' ';
  stSql := stSql + ' AND CA_POSITIONNUM = ' + aCardPOSITIONNUM + ' ';

  result := ProcessExecSQL(stSql);
end;

function TdmMIAMSDataBase.UpdateMiamsTB_GUESTLIST_Value(aGlSeq, aEmName,
  aStartDate, aEndDate, aCompanyName, aHandPhone, aChangeFlag: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_GUESTLIST set GL_NAME = N''' + aEmName + ''', ';
  stSql := stSql + ' GL_FROMTIME = ''' + aStartDate + ''', ';
  stSql := stSql + ' GL_TOTIME = ''' + aEndDate + ''', ';
  stSql := stSql + ' GL_COMPANYNAME = N''' + aCompanyName + ''', ';
  stSql := stSql + ' GL_TELNUMBER = ''' + aHandPhone + ''', ';
  stSql := stSql + ' GL_CHANGEFLAG = ''' + aChangeFlag + ''' ';
  stSql := stSql + ' Where GL_SEQ = ' + aGlSeq + ' ';

  result := ProcessExecSQL(stSql);
end;

end.
