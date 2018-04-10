unit uEmployeeRelay;

interface

uses
  System.SysUtils, System.Classes,ActiveX,ADODB,Vcl.Forms;

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

  TdmEmployeeRelay = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    RelayDoorList : TStringList;
    { Private declarations }
    function CheckCompanyName(aCOMPANY_NAME:string;var aCompanyCode:string):integer;
    function CheckEHRCompanyCode(aCOMPANY_SEQ:string;var aCompanyCode:string):integer;
    function CheckEHRDepartCode(aCOMPANY_SEQ,aDEPT_SEQ:string; var aDepartCode:string):integer;
    function CheckEHREmployee(aUserSeq:string;var aEmSeq:string):integer;
    function CheckPosiName(aPOSITION_NAME:string; var aPosiCode:string):integer;

    function ChangeEmployee_SKGAS(aUSER_SEQ,aUSER_ID,aUSER_NAME,aCOMPANY_SEQ,aDEPT_SEQ,aPOSITION_NAME,aSTATE_CODE,aOFFICE_PHONE,aHOME_PHONE,
                           aMOBILE_PHONE,aUSER_EMAIL,aUSER_ENTER,aUSER_RETIRE,aUSER_CARDNUM,aCOMPANY_NAME,aDEPT_NAME:string):Boolean;
//    Function EmployeePermitToCardDeviceLoad(aNodeNo,aEcuID,aEmSeq:string):Boolean;
    function GetNextTB_EMPLOYEE_EmSeq:string;
    function GetNextPosiCode:string;
  private
    FLastRelayTime: string;
    procedure CreateCompanyCode(aCOMPANY_NAME,aCOMPANY_SEQ:string; var aCompanyCode:string);
    procedure CreateDepartCode(stCompanyCode,aDEPT_NAME,aCOMPANY_SEQ,aDEPT_SEQ:string; var aDepartCode:string);
    procedure CreatePosiCode(aCompanyCode,aPosition_Name:string;var aPosiCode:string);
    procedure SetLastRelayTime(const Value: string);
  public
    procedure ChungnamEmployeeDataProcess(aCompanyName,aEmCode,aEmName,aCardNo,aJijumName,aParentName,aDepartName,aEmStateName,aEmGroupName:string);
  public
    { Public declarations }
    procedure Relay_SKGAS_Start;
  public
    function GetTB_DOOR_NoFromRelayNo(aNo:string;aIndex:integer;var aNodeNo:string;var aEcuID:string;var aDoorNo:string;var aNextIndex:integer):integer;
    function Relay_SKChungcheong_Start(aType:string;aEvent:Boolean=True):Boolean;
    procedure EmployeeDoorPermit(aEmSeq,aNodeNo,aEcuID,aDoorNo,aDayPermit,aNightPermit:string);
    procedure EmployeePermitCreate(aEmSeq,aDayPermit,aNightPermit:string);
    Function EmployeeTimePermit(aEmseq,aNodeNo,aEcuID,aDoorNo,aDayPermit,aNightPermit:string):Boolean; //SK증평에만 해당 한다.
    Function GetNewEmployeeFromServer(aType:string) :Boolean; //신규 입력 대상자 가져 오자.
    Function GetUpdateEmployeeFromServer(aType:string) :Boolean; //변경 대상자 가져 오자.
    Function GetDeleteEmployeeFromServer(aType:string) :Boolean; //삭제 대상자 가져 오자.
    procedure RelayNumberClear;
    procedure SetRelayNumberFromDoorNO(aRelayNo,aNodeNo,aEcuID,aDoorNo:string);
    procedure ChungcheongAccessEventRelay;
    procedure ChungcheongFoodEventRelay;
  public
    function InsertIntoIF_IO_TAG_Value(aEmCode,aEmName,aCardNo:string):Boolean;
    function UpdateIF_IO_TAG_Field_StringValue(aEmCode,aFieldName,aValue:string):Boolean;
    function UpdateTB_VISIT_DOC_CardCreate(aEmCode,aCardNo:string):Boolean;
    function UpdateTB_VISIT_DOC_CardReturnTime(aEmCode:string):Boolean;
    procedure CardInfoSKChungcheongRelay(aEmCode,aEmName,aCardNo:string);
    procedure VisitCardCreateTime(aEmCode,aCardNo:string);
    function CheckIF_IO_TAG_EmCode(aEmCode:string):integer;
    function CheckTB_VISIT_DOC_EmCode(aEmCode:string):integer;
  public
    property LastRelayTime : string read FLastRelayTime write SetLastRelayTime;
  end;

var
  dmEmployeeRelay: TdmEmployeeRelay;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBDelete,
  uDBFunction,
  uDBInsert,
  uDBRelay,
  uDBUpdate,
  uDBCardPermit;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmEmployeeRelay }

procedure TdmEmployeeRelay.CardInfoSKChungcheongRelay(aEmCode, aEmName,
  aCardNo: string);
var
  nTemp : int64;
begin
  if Length(aCardNo) > 10 then
  begin
    if aCardNo[9] = '*' then
    begin
      aCardNo := copy(aCardNo,1,8);
      nTemp := Hex2Dec64(aCardNO);
      aCardNo := FillZeroNumber(nTemp,10);
    end else
    begin
      aCardNo := copy(aCardNO,1,10);
    end;
  end;
  if CheckIF_IO_TAG_EmCode(aEmCode) = 1 then
  begin
    UpdateIF_IO_TAG_Field_StringValue(aEmCode,'TAG',aCardNo);
  end else
  begin
    InsertIntoIF_IO_TAG_Value(aEmCode,aEmName,aCardNo);
  end;
end;

function TdmEmployeeRelay.ChangeEmployee_SKGAS(aUSER_SEQ, aUSER_ID, aUSER_NAME,
  aCOMPANY_SEQ, aDEPT_SEQ, aPOSITION_NAME, aSTATE_CODE, aOFFICE_PHONE,
  aHOME_PHONE, aMOBILE_PHONE, aUSER_EMAIL, aUSER_ENTER, aUSER_RETIRE,
  aUSER_CARDNUM, aCOMPANY_NAME, aDEPT_NAME: string): Boolean;
var
  stCompanyCode : string;
  stDepartCode : string;
  stEmSeq : string;
  stStateCode : string;
  stEmGroupCode : string;
  stCardGroupType : string;
  stGubunCode : string;
  stPosiCode : string;
  stCardUse : string;
begin
  result := False;
  if copy(aUSER_RETIRE,1,2) < '20' then aUSER_RETIRE := '99' + copy(aUSER_RETIRE,3,6);

  Try
    stEmGroupCode := '0';
    stCardGroupType := '1';   //회사권한 1,그룹권한 2
    stGubunCode := '1'; //정직원
    stCardUse := '0';

    if Not isDigit(aSTATE_CODE) then aSTATE_CODE := '1';

    stCompanyCode := '0';
    stDepartCode := '';
    if CheckEHRCompanyCode(aCOMPANY_SEQ,stCompanyCode) <> 1 then   //EhrCompanyCode 로 회사 코드 체크
    begin
      if aCOMPANY_NAME <> '' then
      begin
        if CheckCompanyName(aCOMPANY_NAME,stCompanyCode) = 1 then
        begin
          dmDBUpdate.UpdateTB_COMPANYCODE_Field_IntValue(stCompanyCode,'EH_COMPANYSEQ',aCOMPANY_SEQ);
        end else
        begin
          CreateCompanyCode(aCOMPANY_NAME,aCOMPANY_SEQ,stCompanyCode);
        end;
      end;
    end;
    if aDEPT_NAME <> '' then
    begin
      if CheckEHRDepartCode(aCOMPANY_SEQ,aDEPT_SEQ,stDepartCode) <> 1 then   //EhrDepartCode 로 부서 코드 체크
      begin
        CreateDepartCode(stCompanyCode,aDEPT_NAME,aCOMPANY_SEQ,aDEPT_SEQ,stDepartCode);
      end;
    end;

    if stDepartCode <> '' then stCompanyCode := stDepartCode;

    if CheckPosiName(aPOSITION_NAME,stPosiCode) <> 1 then
    begin
      CreatePosiCode('0',aPosition_Name,stPosiCode);
    end;




    if aUSER_CARDNUM <> '' then
    begin
      //여기서 카드번호 인서트 하자.
      //stCardUse := '1';
    end;

    if CheckEHREmployee(aUser_Seq,stEmSeq) = 1 then  //EHR User_Seq 로 중복 체크 하자.
    begin
      //있으면 업데이트
      dmDBUpdate.UpdateTB_EMPLOYEE_Value(stEmSeq,aUser_ID,aUser_Name,stCompanyCode,stPosiCode,'',aOFFICE_PHONE,aHome_Phone,aMobile_Phone,
                                         aUser_Email,aUser_Enter,aUser_Retire,'','','','','','',aSTATE_CODE,'0',False,'');
      dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_UPDATE); //사원정보 InSert 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음
    end else
    begin
      //없으면 인서트
      stEmSeq := GetNextTB_EMPLOYEE_EmSeq;
      dmDBInsert.InsertIntoTB_EMPLOYEE_Value(stEmSeq,aUser_ID,aUser_Name,stCompanyCode,stPosiCode,stGubunCode,aOFFICE_PHONE,aHome_Phone,aMobile_Phone,
                                             aUser_Email,aUser_Enter,aUser_Retire,'1','1','1',stEmGroupCode,stCardGroupType,'0',aSTATE_CODE,'0','0' );

      dmDBUpdate.UpdateTB_EMPLOYEE_Field_IntValue(stEmSeq,'EHR_SEQ',aUser_Seq);
      dmDBCardPermit.EmployeeGradeChange_Process(stEmSeq,stCompanyCode,stEmGroupCode,stCardGroupType,True);
      dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_INSERT); //사원정보 InSert 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음
      dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);
    end;

    dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_MEMLOAD','N');  //서버에서 메모리 로딩하자.
    result := True;
  Except
    Exit;
  End;

end;

function TdmEmployeeRelay.CheckCompanyName(aCOMPANY_NAME: string;
  var aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;

  stSql := ' Select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where CO_DEEPSEQ = 1 ';
  stSql := stSql + ' AND EH_COMPANYSEQ is null ';
  stSql := stSql + ' AND CO_COMPANYNAME = ''' + aCOMPANY_NAME + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      result := 0;
      if recordcount < 1 then Exit;
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmEmployeeRelay.CheckEHRCompanyCode(aCOMPANY_SEQ: string;
  var aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;

  stSql := ' Select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where CO_DEEPSEQ = 1 ';
  stSql := stSql + ' AND EH_COMPANYSEQ = ' + aCOMPANY_SEQ + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      result := 0;
      if recordcount < 1 then Exit;
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmEmployeeRelay.CheckEHRDepartCode(aCOMPANY_SEQ, aDEPT_SEQ: string;
  var aDepartCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;

  stSql := ' Select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where CO_DEEPSEQ > 1 ';
  stSql := stSql + ' AND EH_COMPANYSEQ = ' + aCOMPANY_SEQ + ' ';
  stSql := stSql + ' AND EH_DEPTSEQ = ' + aDEPT_SEQ + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      result := 0;
      if recordcount < 1 then Exit;
      aDepartCode := FindField('CO_COMPANYCODE').AsString;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmEmployeeRelay.CheckEHREmployee(aUserSeq: string;
  var aEmSeq: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;

  stSql := ' Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where EHR_SEQ = ' + aUserSeq + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      result := 0;
      if recordcount < 1 then Exit;
      aEmSeq := FindField('EM_SEQ').AsString;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmEmployeeRelay.CheckIF_IO_TAG_EmCode(aEmCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  if Not dmDBRelay.DB1Connected then
  begin
    dmDBRelay.AdoRelay1Connected(G_stSystmRelayDB1Type, G_stSystmRelayDB1IP, G_stSystmRelayDB1PORT,
                      G_stSystmRelayDB1USERID, G_stSystmRelayDB1USERPW, G_stSystmRelayDB1NAME);
  end;
  result := -1;
  if Not dmDBRelay.DB1Connected then Exit;

  stSql := ' Select * from IF_TAG where DOC_NO = ''' + aEmCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBRelay.ADOConnection1;
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
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmEmployeeRelay.CheckPosiName(aPOSITION_NAME: string;
  var aPosiCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;

  stSql := ' Select * from TB_POSICODE ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''0'' ';
  stSql := stSql + ' AND PO_POSICODENAME = ''' + aPOSITION_NAME + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      result := 0;
      if recordcount < 1 then Exit;
      aPosiCode := FindField('PO_POSICODE').AsString;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmEmployeeRelay.CheckTB_VISIT_DOC_EmCode(aEmCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  if Not dmDBRelay.DB1Connected then
  begin
    dmDBRelay.AdoRelay1Connected(G_stSystmRelayDB1Type, G_stSystmRelayDB1IP, G_stSystmRelayDB1PORT,
                      G_stSystmRelayDB1USERID, G_stSystmRelayDB1USERPW, G_stSystmRelayDB1NAME);
  end;
  result := -1;
  if Not dmDBRelay.DB1Connected then Exit;

  stSql := ' Select * from TB_VISIT_DOC where DOC_NO = ''' + aEmCode + ''' ' ;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBRelay.ADOConnection1;
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
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TdmEmployeeRelay.ChungcheongAccessEventRelay;
var
  stSql : string;
  stRelaySql : string;
  TempAdoQuery : TADOQuery;
  stCardNO : string;
  stIOFlag : string;
  stPermit : string;
  nTemp : int64;
begin
  stSql := ' select A.*,B.DO_RELAYID from ';
  stSql := stSql + ' ( select * from TB_ACCESSEVENT where AE_RELAY is null or AE_RELAY = ''N'') A ';
  stSql := stSql + ' INNER JOIN TB_DOOR B ';
  stSql := stSql + ' ON(A.GROUP_CODE = B.GROUP_CODE ';
  stSql := stSql + ' AND A.ND_NODENO = B.ND_NODENO ';
  stSql := stSql + ' AND A.DE_ECUID = B.DE_ECUID ';
  stSql := stSql + ' AND A.DE_EXTENDID = B.DE_EXTENDID ';
  stSql := stSql + ' AND A.DO_DOORNO = B.DO_DOORNO) ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        if isDigit(FindField('DO_RELAYID').AsString) then
        begin
          stCardNo := FindField('CA_CARDNO').AsString;
          stCardNo := copy(stCardNo,1,8);
          nTemp := Hex2Dec64(stCardNo);
          stCardNo := FillZeroNumber(nTemp,10);
          stIOFlag := 'I';
          if FindField('RP_DOORPOSITIONCODE').AsString <> '1' then stIOFlag := 'O'; 
          stPermit := 'N';
          if isDigit(FindField('AP_PERMITCODE').AsString) then stPermit := 'Y'; 
          stRelaySql := ' Insert Into IF_IO_LABOR(BARCODE,';
          stRelaySql := stRelaySql + 'IO_DATE, ';
          stRelaySql := stRelaySql + 'IO_TIME, ';
          stRelaySql := stRelaySql + 'IO_FLAG, ';
          stRelaySql := stRelaySql + 'CTL_ID, ';
          stRelaySql := stRelaySql + 'GATE_ID, ';
          stRelaySql := stRelaySql + 'AREA, ';
          stRelaySql := stRelaySql + 'PLANT, ';
          stRelaySql := stRelaySql + 'IO_APP, ';
          stRelaySql := stRelaySql + 'IO_COMMENT, ';
          stRelaySql := stRelaySql + 'UP_DATE, ';
          stRelaySql := stRelaySql + 'AREA_CD, ';
          stRelaySql := stRelaySql + 'INPUT_METHOD) ';
          stRelaySql := stRelaySql + 'VALUES( ';
          stRelaySql := stRelaySql + '''' + stCardNo + ''', ';
          stRelaySql := stRelaySql + '''' + FindField('AE_DATE').AsString + ''', ';
          stRelaySql := stRelaySql + '''' + FindField('AE_TIME').AsString + ''', ';
          stRelaySql := stRelaySql + '''' + stIOFlag+ ''', ';
          stRelaySql := stRelaySql + '''' + G_stRelayCode1 + ''', ';
          stRelaySql := stRelaySql + '''' + FindField('DO_RELAYID').AsString + ''', ';
          stRelaySql := stRelaySql + '''' + G_stRelayCode2 + ''', ';
          stRelaySql := stRelaySql + '''' + G_stRelayCode3 + ''', ';
          stRelaySql := stRelaySql + '''' + stPermit + ''', ';
          stRelaySql := stRelaySql + ''''', ';
          stRelaySql := stRelaySql + 'getdate(), ';
          stRelaySql := stRelaySql + '''' + G_stRelayCode4 + ''', ';
          stRelaySql := stRelaySql + '''C'') ';

          if dmDBRelay.Process1ExecSQL(stRelaySql) then
          begin
            dmDBUpdate.UpdateTB_ACCESSEVENT_Field_StringValue(FindField('AE_DATE').AsString,FindField('AE_TIME').AsString,
                                                              FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,
                                                              FindField('DE_EXTENDID').AsString,FindField('DO_DOORNO').AsString,
                                                              FindField('CA_CARDNO').AsString,'AE_RELAY','Y');                                                                                                    
          end;
        end else
        begin        
          dmDBUpdate.UpdateTB_ACCESSEVENT_Field_StringValue(FindField('AE_DATE').AsString,FindField('AE_TIME').AsString,
                                                            FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,
                                                            FindField('DE_EXTENDID').AsString,FindField('DO_DOORNO').AsString,
                                                            FindField('CA_CARDNO').AsString,'AE_RELAY','Y');                                                                                                    
        end;
        
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TdmEmployeeRelay.ChungcheongFoodEventRelay;
var
  stSql : string;
  stRelaySql : string;
  TempAdoQuery : TADOQuery;
  stCardNO : string;
  stIOFlag : string;
  stPermit : string;
  nTemp : int64;
  stLSGBN : string;
begin
  stSql := ' select A.*,B.DO_RELAYID,C.CO_COMPANYCODE,D.CO_RELAYCOMPANYCODE,C.EM_NAME as EM_NAME1 from ';
  stSql := stSql + ' ( select * from TB_FOODEVENT where FG_RELAYUSE is null or FG_RELAYUSE = ''N'') A ';
  stSql := stSql + ' INNER JOIN TB_DOOR B ';
  stSql := stSql + ' ON(A.GROUP_CODE = B.GROUP_CODE ';
  stSql := stSql + ' AND A.ND_NODENO = B.ND_NODENO ';
  stSql := stSql + ' AND A.DE_ECUID = B.DE_ECUID ';
  stSql := stSql + ' AND A.DE_EXTENDID = B.DE_EXTENDID ';
  stSql := stSql + ' AND A.DO_DOORNO = B.DO_DOORNO) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE C ' ;
  stSql := stSql + ' ON(A.EM_SEQ = C.EM_SEQ) ';
  stSql := stSql + ' Left Join TB_COMPANYCODE D ';
  stSql := stSql + ' ON(C.CO_COMPANYCODE = D.CO_COMPANYCODE) ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        if copy(FindField('CO_COMPANYCODE').AsString,1,4) = '0002' then stLSGBN := '장기인원'
        else if copy(FindField('CO_COMPANYCODE').AsString,1,4) = '0003' then stLSGBN := '방문객'
        else stLSGBN := '임직원';
        stCardNo := FindField('CA_CARDNO').AsString;
        stCardNo := copy(stCardNo,1,8);
        nTemp := Hex2Dec64(stCardNo);
        stCardNo := FillZeroNumber(nTemp,10);

        if isDigit(FindField('DO_RELAYID').AsString) then
        begin
          stRelaySql := ' Insert Into MEAL_TAKE_LOG(JUMIN_NO,';
          stRelaySql := stRelaySql + 'IO_DATE, ';
          stRelaySql := stRelaySql + 'IO_TIME, ';
          stRelaySql := stRelaySql + 'AREA_CD, ';
          stRelaySql := stRelaySql + 'REG_DATE, ';
          stRelaySql := stRelaySql + 'LS_GBN, ';
          stRelaySql := stRelaySql + 'CO_CODE, ';
          stRelaySql := stRelaySql + 'TAG_NO, ';
          stRelaySql := stRelaySql + 'CTL_ID, ';
          stRelaySql := stRelaySql + 'LBR_NAME, ';
          stRelaySql := stRelaySql + 'GATE_ID, ';
          stRelaySql := stRelaySql + 'FM_GBN) ';
          stRelaySql := stRelaySql + 'VALUES( ';
          stRelaySql := stRelaySql + '''' + FindField('EM_CODE').AsString + ''', ';
          stRelaySql := stRelaySql + '''' + FindField('FE_DATE').AsString + ''', ';
          stRelaySql := stRelaySql + '''' + FindField('FE_TIME').AsString + ''', ';
          stRelaySql := stRelaySql + '''' + G_stRelayCode2 + ''', ';
          stRelaySql := stRelaySql + 'getdate(), ';
          stRelaySql := stRelaySql + '''' + stLSGBN + ''', ';
          stRelaySql := stRelaySql + '''' + FindField('CO_RELAYCOMPANYCODE').AsString + ''', ';
          stRelaySql := stRelaySql + '''' + stCardNo + ''', ';
          stRelaySql := stRelaySql + '''' + G_stRelayCode1 + ''', ';
          stRelaySql := stRelaySql + '''' + FindField('EM_NAME1').AsString + ''', ';
          stRelaySql := stRelaySql + '''' + FillZeroNumber(FindField('DO_RELAYID').AsInteger,3) + ''', ';
          stRelaySql := stRelaySql + '''M'') ';

          if dmDBRelay.Process1ExecSQL(stRelaySql) then
          begin
            dmDBUpdate.UpdateTB_FOODEVENT_Field_StringValue(FindField('FE_DATE').AsString,FindField('FE_TIME').AsString,
                                                              FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,
                                                              FindField('DE_ECUID').AsString,FindField('RE_READERNO').AsString,'FG_RELAYUSE','Y');
          end;
        end else
        begin
          dmDBUpdate.UpdateTB_FOODEVENT_Field_StringValue(FindField('FE_DATE').AsString,FindField('FE_TIME').AsString,
                                                              FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,
                                                              FindField('DE_ECUID').AsString,FindField('RE_READERNO').AsString,'FG_RELAYUSE','Y');
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TdmEmployeeRelay.ChungnamEmployeeDataProcess(aCompanyName, aEmCode,
  aEmName, aCardNo, aJijumName, aParentName, aDepartName, aEmStateName,
  aEmGroupName: string);
var
  stParentCode,stChildCode : string;
  stDeepSeq : string;
  stViewSeq : string;
  stTemp : string;
  stEmGroupCode : string;
  stCompanyCode : string;
  stEmStateCode : string;
  stEmSeq,stACType,stATType,stFDType,stEmName,stValidDate : string;
  stCardType,stEmCode,stPositionNum,stRelayID : string;
  stCardUse : string;
begin
  stCardUse := '0';
  aEmName := Trim(aEmName);
  aCompanyName := Trim(aCompanyName);
  aJijumName := Trim(aJijumName);
  aParentName := Trim(aParentName);
  aDepartName := Trim(aDepartName);
  aEmStateName := Trim(aEmStateName);
  aEmGroupName := Trim(aEmGroupName);
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  aCompanyName := StringReplace(aCompanyName,'''','',[rfReplaceAll]);
  aJijumName := StringReplace(aJijumName,'''','',[rfReplaceAll]);
  aParentName := StringReplace(aParentName,'''','',[rfReplaceAll]);
  aDepartName := StringReplace(aDepartName,'''','',[rfReplaceAll]);
  aEmStateName := StringReplace(aEmStateName,'''','',[rfReplaceAll]);
  aEmGroupName := StringReplace(aEmGroupName,'''','',[rfReplaceAll]);
  if aCardNo <> '' then
  begin
    aCardNo := FillCharString(aCardNo,'*',16,False);
    stCardUse := '1';
  end;
  stParentCode := dmdBFunction.GetTB_CompanyCode_codeFromName(aCompanyName,'1',stDeepSeq);
  if stParentCode = '' then
  begin
    dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode('0',stParentCode,stDeepSeq,stViewSeq);
    dmDBInsert.InsertIntoTB_COMPANYCODE_All(stParentCode,aCompanyName,stDeepSeq,'1',stViewSeq);
  end;
  stChildCode := dmdBFunction.GetTB_CompanyCode_codeFromName(aJijumName,'2',stDeepSeq);
  if stChildCode = '' then
  begin
    dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stParentCode,stChildCode,stDeepSeq,stViewSeq);
    dmDBInsert.InsertIntoTB_COMPANYCODE_All(stChildCode,aJijumName,stDeepSeq,'1',stViewSeq);
  end;
  stParentCode := dmdBFunction.GetTB_CompanyCode_codeFromName(aParentName,'',stDeepSeq);
  if stParentCode <> '' then
  begin
    stChildCode := dmdBFunction.GetTB_CompanyCode_codeFromName(aDepartName,'',stTemp);
    if stChildCode = '' then
    begin
      dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stParentCode,stChildCode,stDeepSeq,stViewSeq);
      dmDBInsert.InsertIntoTB_COMPANYCODE_All(stChildCode,aDepartName,stDeepSeq,'1',stViewSeq);
    end;
  end;
  stCompanyCode := stChildCode;
  if Not isDigit(stCompanyCode) then stCompanyCode := '0';

  stEmGroupCode := dmDBFunction.GetTB_EMPLOYEEGROUPCODE_codeFromName(aEmGroupName,'',stDeepSeq);
  if stEmGroupCode = '' then
  begin
    dmDBFunction.GetNextTB_EMPLOYEEGROUPCODE_ChildEmGroupCode(G_stAdminEmGroupCode,stTemp,stDeepSeq,stViewSeq);
    dmDBInsert.InsertIntoTB_EMPLOYEEGROUPCODE_All(stTemp,aEmGroupName,stDeepSeq,'1',stViewSeq);
    stEmGroupCode := stTemp;
  end;

  stEmStateCode := dmDBFunction.GetTB_EMPLOYEESTATECODE_codeFromName(aEmStateName);
  if stEmStateCode = '' then
  begin
    stEmStateCode := dmDBFunction.GetNextTB_EMPLOYEESTATECODE_Code;
    dmDBInsert.InsertIntoTB_EMPLOYEESTATECODE_Value(stEmStateCode,aEmStateName,'1');
  end;

  if dmDBFunction.checkTB_EMPLOYEE_EMCODE_Variable(aEmCode,stEmSeq,stACType,stATType,stFDType,stEmName,stValidDate) = 1 then
  begin
    dmDBUpdate.UpdateTB_EMPLOYEE_Value(stEmSeq,aEmCode,aEmName,stCompanyCode,'0','1',
               '','','','','','','1','','',stEmGroupCode,'','',stEmStateCode,'1',False,stCardUse);
    dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_UPDATE); //사원정보 InSert 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음
    dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_MEMLOAD','N');  //서버에서 메모리 로딩하자.
  end else
  begin
    stEmSeq := dmDBFunction.GetNextTB_EMPLOYEE_EmSeq;
    dmDBInsert.InsertIntoTB_EMPLOYEE_Value(stEmSeq,aEmCode,aEmName,stCompanyCode,'0','1','','','','',formatDateTime('yyyymmdd',now),'99991231','1','1','1',stEmGroupCode,'2','0',stEmStateCode,'1',stCardUse);
    dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_INSERT); //사원정보 InSert 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음
    dmDBCardPermit.EmployeeGradeChange_Process(stEmSeq,stCompanyCode,stEmGroupCode,'2');
    dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_MEMLOAD','N');  //서버에서 메모리 로딩하자.
  end;
  if aCardNo = '' then Exit;
  if dmDBFunction.CheckTB_CARD_CARDNO(aCardNo,stCardType,stTemp,stEmCode,stEmName) = 1 then
  begin
    if (stEmCode <> aEmCode) or (stCardType <> '1') then
      dmDBUpdate.UpdateTB_CARD_Value(aCardNo,'1','',aEmCode);
  end else
  begin
    stPositionNum := dmDBFunction.GetNextTB_CARD_PositionNum;
    stRelayID := dmDBFunction.GetNextTB_CARD_RelayID;
    dmDBInsert.InsertIntoTB_CARD_Value(aCardNo,'1','1',stPositionNum,stRelayID,'0',stEmSeq);
    dmDBInsert.InsertIntoTB_CARDHIS_CopyCard(aCardNo,aCardNo,con_ComWorkType_INSERT); //카드 입력 이력 남기자.
  end;
end;

procedure TdmEmployeeRelay.CreateCompanyCode(aCOMPANY_NAME, aCOMPANY_SEQ:string; var aCompanyCode: string);
var
  stDeepSeq : string;
  stViewSeq : string;
begin
    dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode('0',aCompanyCode,stDeepSeq,stViewSeq);
    dmDBInsert.InsertIntoTB_COMPANYCODE_All(aCompanyCode,aCOMPANY_NAME,stDeepSeq,'1',stViewSeq);
    dmDBUpdate.UpdateTB_COMPANYCODE_Field_IntValue(aCompanyCode,'EH_COMPANYSEQ',aCompany_Seq);
end;

procedure TdmEmployeeRelay.CreateDepartCode(stCompanyCode, aDEPT_NAME,aCOMPANY_SEQ,aDEPT_SEQ: string;
  var aDepartCode: string);
var
  stDeepSeq : string;
  stViewSeq : string;
begin
  aDepartCode := '';
  dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stCompanyCode,aDepartCode,stDeepSeq,stViewSeq);
  dmDBInsert.InsertIntoTB_COMPANYCODE_All(aDepartCode,aDEPT_NAME,stDeepSeq,'1',stViewSeq);
  dmDBUpdate.UpdateTB_COMPANYCODE_Field_IntValue(aDepartCode,'EH_COMPANYSEQ',aCompany_Seq);
  dmDBUpdate.UpdateTB_COMPANYCODE_Field_IntValue(aDepartCode,'EH_DEPTSEQ',aDEPT_SEQ);
end;

procedure TdmEmployeeRelay.CreatePosiCode(aCompanyCode, aPosition_Name: string;
  var aPosiCode: string);
begin
  aPosiCode := GetNextPosiCode;
  dmDBInsert.InsertIntoTB_POSICODE_DefaultValue(aPosiCode,aPosition_Name,aCompanyCode,aPosiCode);
end;

procedure TdmEmployeeRelay.DataModuleCreate(Sender: TObject);
begin
  RelayDoorList := TStringList.Create;
end;

procedure TdmEmployeeRelay.DataModuleDestroy(Sender: TObject);
var
  i : integer;
begin
  if RelayDoorList.Count > 0 then
  begin
    for i := RelayDoorList.Count - 1 downto 0 do TRelayDoor(RelayDoorList.Objects[i]).Free;
    RelayDoorList.Clear;
  end;
end;

procedure TdmEmployeeRelay.EmployeeDoorPermit(aEmSeq, aNodeNo, aEcuID, aDoorNo,
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
    EmployeeTimePermit(aEmseq,aNodeNo,aEcuID,aDoorNo,aDayPermit,aNightPermit);
    if dmDBCardPermit.EmployeeDoorPermitAdd(aEmSeq,aNodeNo,aEcuID,'0',aDoorNo) then
    begin
      dmDBInsert.InsertIntoTB_SYSTEMLOG_All(FormatDateTime('yyyymmdd',now),FormatDateTime('hhnnss',now),'127.0.0.1','Relay',aNodeNo,aEcuID,'E' + aEmSeq,aDoorNo,con_ComLogTYPE_DOOR,'Init:Permit Update');
    end;
  end else
  begin
    if dmDBCardPermit.EmployeeDoorPermitDelete(aEmSeq,aNodeNo,aEcuID,'0',aDoorNo) then
    begin
      dmDBInsert.InsertIntoTB_SYSTEMLOG_All(FormatDateTime('yyyymmdd',now),FormatDateTime('hhnnss',now),'127.0.0.1','Relay',aNodeNo,aEcuID,'E' + aEmSeq,aDoorNo,con_ComLogTYPE_DOOR,'Init:Permit Delete');
    end;
  end;
end;

procedure TdmEmployeeRelay.EmployeePermitCreate(aEmSeq, aDayPermit,
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
    for j := 0 to (8 - 1) do
    begin
      if GetTB_DOOR_NoFromRelayNo(inttostr(i),j,stNodeNo,stEcuID,stDoorNo,nNextIndex) = 1 then
      begin
        EmployeeDoorPermit(aEmSeq,stNodeNo,stEcuID,stDoorNo,stDayPermit,stNightPermit); //개별 출입문 권한
        if nNextIndex = 0 then break;    //다음 출입문이 없다.
      end else break;
    end;
    Application.ProcessMessages;
  end;

end;

(*
function TdmEmployeeRelay.EmployeePermitToCardDeviceLoad(aNodeNo, aEcuID,
  aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stOldCardNo : string;
  stNodeNo : string;
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
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
        stNodeNo := FillZeroNumber(FindField('ND_NODENO').asInteger,G_nNodeCodeLength);
        if stOldCardNo <> '' then  //카드번호가 변경 된 경우
        begin
          if stOldCardNo <> FindField('CA_CARDNO').AsString then
          begin
            //여기에서 TB_CARDPERMIT 테이블에 인서트 하자.
            if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString) = 1 then
            begin
              dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString,
                         stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                         stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
            end else
            begin
              dmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString,
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
          if FindField('CP_PERMIT').AsString ='1' then stPermit := '1';
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
          if FindField('CP_PERMIT').AsString ='1' then stPermit := '1';
          bNodeSetting := False;
        end;
        stOldCardNo := FindField('CA_CARDNO').AsString;
        Application.ProcessMessages;
        Next;
      end;
      if Not bNodeSetting then    //마지막 셋팅 안한게 있으면 셋팅 하자.
      begin
        if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString) = 1 then
        begin
          dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString,
                     stPermit,stDoor1,stDoor2,stDoor3,stDoor4,stDoor5,stDoor6,stDoor7,stDoor8,
                     stArmArea0,stArmArea1,stArmArea2,stArmArea3,stArmArea4,stArmArea5,stArmArea6,stArmArea7,stArmArea8);
        end else
        begin
          dmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CA_CARDNO').AsString,
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
*)


function TdmEmployeeRelay.EmployeeTimePermit(aEmseq, aNodeNo, aEcuID, aDoorNo,
  aDayPermit, aNightPermit: string): Boolean;
var
  stTimeCodeUse : string;
  stTimeGroup : string;
  stTime1,stTime2,stTime3,stTime4 : string;
  stWeek : string;
  stTemp,stTemp0,stTemp1,stTemp2,stTemp3,stTemp4,stTemp5 : string;
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
  if dmDBFunction.CheckTB_EMPLOYEEDEVICETIMECODE_ValueTime(aEmseq,aNodeNo,aEcuID,stTemp,stTemp0,stTemp1,stTemp2,stTemp3,stTemp4,stTemp5) = 1 then
  begin
    if (stTemp <> stTimeCodeUse) OR      //시간이 변경된 경우에만 작업하자.
       (stTemp0 <> stTimeGroup) OR
       (stTemp1 <> stTime1) OR
       (stTemp2 <> stTime2) OR
       (stTemp3 <> stTime3) OR
       (stTemp4 <> stTime4) OR
       (stTemp5 <> stWeek) 
     then
     begin
        dmDBUpdate.UpdateTB_EMPLOYEEDEVICETIMECODE_Value(aEmseq,aNodeNo,aEcuID,
                   stTimeCodeUse,stTimeGroup,stTime1,stTime2,stTime3,stTime4,stWeek);
        dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, '0', con_ComLogTYPE_DOOR, aDoorNo, 'CP_APPLY','N');
        dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, '0', con_ComLogTYPE_DOOR, aDoorNo, 'CP_FINGERAPPLY','N');
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(FormatDateTime('yyyymmdd',now),FormatDateTime('hhnnss',now),'127.0.0.1','Relay',aNodeNo,aEcuID,'E' + aEmSeq,aDoorNo,con_ComLogTYPE_DOOR,'Init:Time Update');
     end;    
  end else
  begin
    dmDBInsert.InsertIntoTB_EMPLOYEEDEVICETIMECODE_Value(aEmseq,aNodeNo,aEcuID,
               stTimeCodeUse,stTimeGroup,stTime1,stTime2,stTime3,stTime4,stWeek);
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, '0', con_ComLogTYPE_DOOR, aDoorNo, 'CP_APPLY','N');
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(aEmSeq,aNodeNo, aEcuID, '0', con_ComLogTYPE_DOOR, aDoorNo, 'CP_FINGERAPPLY','N');
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(FormatDateTime('yyyymmdd',now),FormatDateTime('hhnnss',now),'127.0.0.1','Relay',aNodeNo,aEcuID,'E' + aEmSeq,aDoorNo,con_ComLogTYPE_DOOR,'Init:Time Insert');
  end;
end;

function TdmEmployeeRelay.GetDeleteEmployeeFromServer(aType:string): Boolean;
var
  stSql : string;
begin
  stSql := 'update A SET WORK_FLAG = ''3'', ';//삭제
  stSql := stSql + '     CHG_DATE = ''' + FormatDateTime('yyyymmddhhnnss',now) + ''', ';
  stSql := stSql + '     CHANGE_FLAG = ''Y'' ';
  stSql := stSql + ' From VW_APPROVE_LABOR A,';
  stSql := stSql + ' ( ';
  stSql := stSql + ' select JUMIN_NO from (select * from VW_APPROVE_LABOR  ';
//  if aType = 'V' then stSql := stSql + ' where LS_CODE = ''V''  '
//  else  stSql := stSql + ' where LS_CODE <> ''V'' ';
  stSql := stSql + ' ) aa';
  stSql := stSql + ' where Not Exists (select * from  [link_server].[SKIOMS].[dbo].[VW_APPROVE_LABOR]  bb ';
  stSql := stSql + ' where aa.JUMIN_NO collate Korean_Wansung_CI_AS = bb.JUMIN_NO collate Korean_Wansung_CI_AS and aa.LS_CODE collate Korean_Wansung_CI_AS = bb.LS_CODE collate Korean_Wansung_CI_AS)';
  stSql := stSql + ' ) B ';
  stSql := stSql + ' Where A.JUMIN_NO collate Korean_Wansung_CI_AS = B.JUMIN_NO collate Korean_Wansung_CI_AS ';

  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmEmployeeRelay.GetNewEmployeeFromServer(aType:string): Boolean;
var
  stSql : string;
begin
  stSql := 'insert into VW_APPROVE_LABOR(JUMIN_NO,';
  stSql := stSql + 'LBR_NAME,';
  stSql := stSql + 'TAG,';
  stSql := stSql + 'APP_FROM,';
  stSql := stSql + 'APP_TO,';
  stSql := stSql + 'LS_CODE,';
  stSql := stSql + 'LS_GBN,';
  stSql := stSql + 'CO_CODE,';
  stSql := stSql + 'CO_NAME,';
  stSql := stSql + 'ADDR,';
  stSql := stSql + 'HEIGHT,';
  stSql := stSql + 'WEIGHT,';
  stSql := stSql + 'JIKWI,';
  stSql := stSql + 'TEL,';
  stSql := stSql + 'CHG_DATE,';
  stSql := stSql + 'DEL_YN,';
  stSql := stSql + 'APP_GATE,';
  stSql := stSql + 'APP_GATE_NIGHT,';
  stSql := stSql + 'APP_YN,';
  stSql := stSql + 'PHOTO_PATH,';
  stSql := stSql + 'CAUSE_CODE,';
  stSql := stSql + 'CAUSE_DESC,';
  stSql := stSql + 'CONST_CODE,';
  stSql := stSql + 'CONST_NAME,';
  stSql := stSql + 'CARD_NO,';
  stSql := stSql + 'IO_AREA,';
  stSql := stSql + 'BIRTH,';
  stSql := stSql + 'AREA_CD,';
  stSql := stSql + 'OLD_JUMINNO,';
  stSql := stSql + 'CHANGE_FLAG,';
  stSql := stSql + 'WORK_FLAG)';
  stSql := stSql + ' (select a.JUMIN_NO,';
  stSql := stSql + ' a.LBR_NAME,';
  stSql := stSql + ' a.TAG,';
  stSql := stSql + ' a.APP_FROM,';
  stSql := stSql + ' a.APP_TO,';
  stSql := stSql + ' a.LS_CODE,';
  stSql := stSql + ' a.LS_GBN,';
  stSql := stSql + ' a.CO_CODE,';
  stSql := stSql + ' a.CO_NAME,';
  stSql := stSql + ' a.ADDR,';
  stSql := stSql + ' a.HEIGHT,';
  stSql := stSql + ' a.WEIGHT,';
  stSql := stSql + ' a.JIKWI,';
  stSql := stSql + ' a.TEL,';
  stSql := stSql + ' ''' + FormatDateTime('yyyymmddhhnnss',now) + ''', ';
//  stSql := stSql + ' a.CHG_DATE,';     //가져오는 시간으로 바꾸자.
  stSql := stSql + ' a.DEL_YN,';
  stSql := stSql + ' a.APP_GATE,';
  stSql := stSql + ' a.APP_GATE_NIGHT,';
  stSql := stSql + ' a.APP_YN,';
  stSql := stSql + ' a.PHOTO_PATH,';
  stSql := stSql + ' a.CAUSE_CODE,';
  stSql := stSql + ' a.CAUSE_DESC,';
  stSql := stSql + ' a.CONST_CODE,';
  stSql := stSql + ' a.CONST_NAME,';
  stSql := stSql + ' a.CARD_NO,';
  stSql := stSql + ' a.IO_AREA,';
  stSql := stSql + ' a.BIRTH,';
  stSql := stSql + ' a.AREA_CD,';
  stSql := stSql + ' a.OLD_JUMINNO,';
  stSql := stSql + ' ''Y'',';
  stSql := stSql + ' ''1'' ';
  stSql := stSql + ' from (select * from [link_server].[SKIOMS].[dbo].[VW_APPROVE_LABOR] ';
//  if aType = 'V' then stSql := stSql + ' where LS_CODE = ''V''  '
//  else  stSql := stSql + ' where LS_CODE <> ''V'' ';
  stSql := stSql + ') a ';
  stSql := stSql + ' where NOT EXISTS (select * from VW_APPROVE_LABOR b where a.JUMIN_NO collate Korean_Wansung_CI_AS = b.JUMIN_NO collate Korean_Wansung_CI_AS ';
//  if aType = 'V' then stSql := stSql + ' and b.LS_CODE = ''V'' '
//  else  stSql := stSql + ' and b.LS_CODE <> ''V''  ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' ) ';

  result := dmDataBase.ProcessExecSQL(stSql); 
end;

function TdmEmployeeRelay.GetNextPosiCode: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := inttostr(1);
  stSql := 'Select Max(PO_POSICODE) as PO_POSICODE from TB_POSICODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordCount < 1 then Exit;
      result := inttostr(FindField('PO_POSICODE').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmEmployeeRelay.GetNextTB_EMPLOYEE_EmSeq: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin

  result := '1';

  stSql := 'Select Max(EM_SEQ) as EM_SEQ from TB_EMPLOYEE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if RecordCount < 1 then Exit;
      if FindField('EM_SEQ').IsNull then Exit;
      result := inttostr(FindField('EM_SEQ').AsInteger + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmEmployeeRelay.GetTB_DOOR_NoFromRelayNo(aNo: string;aIndex:integer; var aNodeNo,
  aEcuID, aDoorNo: string;var aNextIndex:integer): integer;
var
  nIndex : integer;
  oRelayDoor : TRelayDoor;
begin
  result := -1;
  nIndex := RelayDoorList.IndexOf(aNo);
  if nIndex < 0 then Exit;
  result := TRelayDoor(RelayDoorList.Objects[nIndex]).GetIndexDeviceInfo(aIndex,aNodeNo,aEcuID,aDoorNo,aNextIndex);
end;

function TdmEmployeeRelay.GetUpdateEmployeeFromServer(aType:string): Boolean;
var
  stSql : string;
begin
  stSql := 'update A SET ';//변경
  stSql := stSql + '     LBR_NAME = B.LBR_NAME, ';
  stSql := stSql + '     APP_TO = B.APP_TO, ';
  stSql := stSql + '     LS_CODE = B.LS_CODE, ';
  stSql := stSql + '     LS_GBN = B.LS_GBN, ';
  stSql := stSql + '     CO_CODE = B.CO_CODE, ';
  stSql := stSql + '     CO_NAME = B.CO_NAME, ';
  stSql := stSql + '     JIKWI = B.JIKWI, ';
  stSql := stSql + '     TEL = B.TEL, ';
  stSql := stSql + '     CHG_DATE = ''' + FormatDateTime('yyyymmddhhnnss',now) + ''', ';
  stSql := stSql + '     APP_GATE = B.APP_GATE, ';
  stSql := stSql + '     APP_GATE_NIGHT = B.APP_GATE_NIGHT, ';
  stSql := stSql + '     WORK_FLAG = ''2'', ';
  stSql := stSql + '     CHANGE_FLAG = ''Y'' ';
  stSql := stSql + ' From VW_APPROVE_LABOR A,';
  stSql := stSql + ' (select * from [link_server].[SKIOMS].[dbo].[VW_APPROVE_LABOR] ';
//  if aType = 'V' then stSql := stSql + ' where LS_CODE = ''V''  '
//  else  stSql := stSql + ' where LS_CODE <> ''V'' ';
  stSql := stSql + ' ) B';
  stSql := stSql + ' Where A.JUMIN_NO collate Korean_Wansung_CI_AS = B.JUMIN_NO collate Korean_Wansung_CI_AS';
  stSql := stSql + ' AND(A.APP_TO collate Korean_Wansung_CI_AS <> B.APP_TO collate Korean_Wansung_CI_AS ';
  stSql := stSql + '    OR A.CO_CODE collate Korean_Wansung_CI_AS <> B.CO_CODE collate Korean_Wansung_CI_AS';
  stSql := stSql + '    OR A.TEL collate Korean_Wansung_CI_AS <> B.TEL collate Korean_Wansung_CI_AS';
  stSql := stSql + '    OR A.APP_GATE collate Korean_Wansung_CI_AS <> B.APP_GATE collate Korean_Wansung_CI_AS';
  stSql := stSql + '    OR A.APP_GATE_NIGHT collate Korean_Wansung_CI_AS <> a.APP_GATE_NIGHT collate Korean_Wansung_CI_AS';
  stSql := stSql + '    OR A.CO_CODE collate Korean_Wansung_CI_AS <> B.CO_CODE collate Korean_Wansung_CI_AS ';
  stSql := stSql + ' ) ';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

function TdmEmployeeRelay.InsertIntoIF_IO_TAG_Value(aEmCode, aEmName,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into IF_TAG ( ';
  stSql := stsql + ' DOC_NO,';
  stSql := stsql + ' LBR_NAME,';
  stSql := stsql + ' TAG,';
  stSql := stsql + ' LS_GBN,';
  stSql := stsql + ' DEL_YN,';
  stSql := stsql + ' CHG_DATE,';
  stSql := stsql + ' CHG_DESC,';
  stSql := stsql + ' AREA_CD )';
  stSql := stsql + ' VALUES(';
  stSql := stsql + ' ''' + aEmCode + ''',';
  stSql := stsql + ' ''' + aEmName + ''',';
  stSql := stsql + ' ''' + aCardNo + ''',';
  stSql := stsql + ' '''',';
  stSql := stsql + ' '''',';
  stSql := stsql + ' ''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stsql + ' '''',';
  stSql := stsql + ' ''' + G_stRelayCode2 + ''')';

  result := dmDBRelay.Process1ExecSQL(stSql);
end;

procedure TdmEmployeeRelay.RelayNumberClear;
var
  i : integer;
begin
  if RelayDoorList = nil then RelayDoorList := TStringList.Create;
  
  if RelayDoorList.Count > 0 then
  begin
    for i := RelayDoorList.Count - 1 downto 0 do TRelayDoor(RelayDoorList.Objects[i]).Free;
    RelayDoorList.Clear;
  end;

end;

function TdmEmployeeRelay.Relay_SKChungcheong_Start(aType:string;aEvent:Boolean=True):Boolean;
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
  stTemp1,stTemp2,stTemp3,stTemp4,stTemp5 : string;
  stDate : string;
begin
  result := False;
  //증평 청주 View 에서 테이블 읽어서 처리 하는 부분.
  GetNewEmployeeFromServer(aType); //신규 입력 대상자 가져 오자.
  GetUpdateEmployeeFromServer(aType); //변경 대상자 가져 오자.
  if Not GetDeleteEmployeeFromServer(aType) then Exit; //삭제 대상자 가져 오자.
  stDate := FormatDateTime('yyyymmdd',now);

  stSql := ' select * from VW_APPROVE_LABOR where CHANGE_FLAG = ''Y'' ';
  //if aType = 'V' then stSql := stSql + ' AND LS_CODE = ''V'' '
  //else stSql := stSql + ' AND LS_CODE <> ''V'' ';


  Try
    CoInitialize(nil);
    TempInsaAdoQuery := TADOQuery.Create(nil);
    TempInsaAdoQuery.Connection := dmDataBase.ADOConnection;
    TempInsaAdoQuery.DisableControls;
    with TempInsaAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := True;
      while Not Eof do
      begin

        if FindField('WORK_FLAG').AsString = '3' then
        begin
          if dmDBFunction.checkTB_EMPLOYEE_EMCODE_Variable(FindField('JUMIN_NO').AsString,stEmSeq,stTemp1,stTemp2,stTemp3,stTemp4,stTemp5) = 1 then
          begin
            dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_STATECODE','2') ; //퇴직으로 변경 하여 정지
            dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N'); //해당 사번의 권한 적용 부분을 재 작업 - 삭제된 카드가 있거나 추가된 카드가 있으므로
            dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(stEmSeq,'','','','','N');
          end;
          if Trim(FindField('LS_CODE').AsString) = 'V' then //방문자인경우는 방문자 리스트를 삭제하자.
          begin
            //dmDBDelete.DeleteTB_GUESTLIST_GLCode(stDate,FindField('JUMIN_NO').AsString);
            dmDBDelete.DeleteTB_EMPLOYEE_GuestID('0003',FindField('JUMIN_NO').AsString);
          end;
        end else
        begin
          if (Trim(FindField('LS_CODE').AsString) = 'L') OR (Trim(FindField('LS_CODE').AsString) = 'S') then stBaseCompanyCode := '0002'
          else if Trim(FindField('LS_CODE').AsString) = 'V' then stBaseCompanyCode := '0003'
          else stBaseCompanyCode := '0001';
          stEmGubunCode := dmDBFunction.GetTB_EMPLOYEEGUBUN_CodeFromRelayCode(FindField('LS_CODE').AsString,stTemp);
          if stEmGubunCode = '' then
          begin
            stEmGubunCode := dmDBFunction.GetTB_EMPLOYEEGUBUN_CodeFromName(FindField('LS_GBN').AsString);
            if stEmGubunCode = '' then
            begin
              stEmGubunCode := dmDBFunction.GetNextTB_EMPLOYEEGUBUN_Code;
              dmDBInsert.InsertIntoTB_EMPLOYEEGUBUN_Value(stEmGubunCode,FindField('LS_GBN').AsString,stEmGubunCode,FindField('LS_CODE').AsString)
            end else
            begin
              dmDBUpdate.UpdateTB_EMPLOYEEGUBUN_Field_StringValue(stEmGubunCode,'EM_RELAYCODE',FindField('LS_CODE').AsString);   //연동 구분 코드 입력
            end;
          end else
          begin
            if stTemp <> FindField('LS_GBN').AsString then  //구분 명칭이 다르면
            begin
              dmDBUpdate.UpdateTB_EMPLOYEEGUBUN_Field_StringValue(stEmGubunCode,'EM_GUBUNCODENAME',FindField('LS_GBN').AsString);//구분 명칭 변경
            end;
          end;
          if Trim(FindField('LS_CODE').AsString) <> 'V' then  //방문객이 아닌 경우에만 처리 하자. 방문객은 방문객 프로그램에서 처리 하자.
          begin
            stCompanyCode := dmDBFunction.GetTB_COMPANYCODE_CodeFromRelayCode(Trim(FindField('CO_CODE').AsString),stTemp);
            if stCompanyCode = '' then
            begin
              stCompanyCode := dmDBFunction.GetTB_COMPANYCODE_CodeFromBaseName(stBaseCompanyCode,Trim(FindField('CO_NAME').AsString));
              if stCompanyCode = '' then
              begin
                dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(stBaseCompanyCode,stCompanyCode,stTemp1,stTemp2);
                //stCompanyCode :=stBaseCompanyCode + FillZeroNumber(nTemp,3);
                dmDBInsert.InsertIntoTB_COMPANYCODE_All(stCompanyCode,Trim(FindField('CO_NAME').AsString),'2','1',stTemp2,FindField('CO_CODE').AsString);
              end else
              begin
                dmDBUpdate.UpdateTB_COMPANYCODE_Field_StringValue(stCompanyCode,'CO_RELAYCOMPANYCODE',Trim(FindField('CO_CODE').AsString));
              end;
            end else
            begin
              if stTemp <> FindField('CO_NAME').AsString then  //소속명이 바뀌었으면 소속명을 바꿔 주자
              begin
                dmDBUpdate.UpdateTB_COMPANYCODE_Field_StringValue(stCompanyCode,'CO_COMPANYNAME',FindField('CO_NAME').AsString);
              end;
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
              stPosiCode := dmDBFunction.GetTB_POSICODE_CodeFromName('0',FindField('JIKWI').AsString);
              if stPosiCode = '' then
              begin
                stPosiCode := dmDBFunction.GetNextTB_POSICODE;
                dmDBInsert.InsertIntoTB_POSICODE_DefaultValue(stPosiCode,FindField('JIKWI').AsString,'0',stPosiCode);
              end;
            end else stPosiCode := '0';
            if Not Isdigit(stPosiCode) then stPosiCode := '0';
            if Not Isdigit(stEmGubunCode) then stEmGubunCode := '0';

            stEmSeq := '';
            if FindField('JUMIN_NO').AsString <> FindField('OLD_JUMINNO').AsString then
            begin
              if dmDBFunction.checkTB_EMPLOYEE_EMCODE_Variable(FindField('OLD_JUMINNO').AsString,stEmSeq,stTemp1,stTemp2,stTemp3,stTemp4,stTemp5) = 1 then
              begin
                if stEndDate <> stTemp5 then dmDBUpdate.UpdateTB_CARDPERMIT_EmSeqReSend(stEmSeq); //유효기간 변경 되면 카드 재전송하자.
                dmDBUpdate.UpdateTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stEmGubunCode,stCompanyPhone,'',stHandPhone,stAddr,
                                                   stStartDate,stEndDate,'1',stTemp2,stTemp3,'0','3','','1','1',False,'','1',FormatDateTime('yyyymmdd',now),FindField('AREA_CD').AsString);
                dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_UPDATE); //사원정보 Update 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음
              end;
            end;
            if stEmSeq = '' then
            begin
              if dmDBFunction.checkTB_EMPLOYEE_EMCODE_Variable(FindField('JUMIN_NO').AsString,stEmSeq,stTemp1,stTemp2,stTemp3,stTemp4,stTemp5) = 1 then
              begin
                if stEndDate <> stTemp5 then dmDBUpdate.UpdateTB_CARDPERMIT_EmSeqReSend(stEmSeq);
                dmDBUpdate.UpdateTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stEmGubunCode,stCompanyPhone,'',stHandPhone,stAddr,
                                                   stStartDate,stEndDate,'1',stTemp2,stTemp3,'0','3','','1','1',False,'','1',FormatDateTime('yyyymmdd',now),FindField('AREA_CD').AsString);
                dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_UPDATE); //사원정보 Update 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음
              end;
            end;
            if stEmSeq = '' then
            begin
              //신규 사원 정보가 들어 온 것임
              stEmSeq := dmDBFunction.GetNextTB_EMPLOYEE_EmSeq;
              dmDBInsert.InsertIntoTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stEmGubunCode,stCompanyPhone,'',stHandPhone,stAddr,
                                                               stStartDate,stEndDate,'1','1','1','0','3','0','1','1','0','1',FormatDateTime('yyyymmdd',now),FindField('AREA_CD').AsString);
              dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_INSERT); //사원정보 Update 정보 남기자. 카드를 처리 하고 사원정보 입력 후에 남겨야 연동시 문제 없음
            end;

            //사원 권한 입력 하자.
            EmployeePermitCreate(stEmSeq,FindField('APP_GATE').AsString,FindField('APP_GATE_NIGHT').AsString);
          end;
          //EmCodeToCardChange(stEmSeq,stEmCode);  //지문 변환하는 모듈로 필요 없다.
          if Trim(FindField('LS_CODE').AsString) = 'V' then //방문자인경우는 방문자 리스트에 입력 하자.
          begin
            (*    //방문자 리스트는 방문객 관리 프로그램에서 입력 하자.
            if dmDBFunction.CheckTB_GUESTLIST_GLCode(stDate,stEmCode,stTemp1)= 1 then
            begin
              dmDBUpdate.UpdateTB_GUESTLIST_Value(stTemp1,stEmName,stStartDate,stEndDate,FindField('CO_NAME').AsString,stHandPhone,'Y');
            end else
            begin
              dmDBInsert.InsertIntoTB_GUESTLIST_Value(stDate,stEmSeq,stEmCode,stEmName,stStartDate,stEndDate,FindField('CO_NAME').AsString,stHandPhone,'','N','1',FindField('AREA_CD').AsString);
            end;
            *)
          end;
        end;
        dmDBCardPermit.EmployeePermitToCardLoad(stEmSeq);  //해당 사원의 권한을 디바이스 권한으로 옮기자.
        if FindField('WORK_FLAG').AsString = '3' then
        begin
          dmDBDelete.DeleteVW_APPROVE_LABOR_Key(FindField('JUMIN_NO').AsString);
        end else
        begin
          dmDBUpdate.UpdateVW_APPROVE_LABOR_Field_StringValue(FindField('JUMIN_NO').AsString,'CHANGE_FLAG','N');  //적용완료 설정
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

procedure TdmEmployeeRelay.Relay_SKGAS_Start;
var
  stSql : string;
begin
  stSql := 'Update T_INUS_USER set DATA_FLAG = ''R'' ';
  stSql := stsql + ' Where DATA_FLAG is Null ';
  stSql := stSql + ' OR DATA_FLAG <> ''Y'' ';
  dmDBRelay.Process2ExecSQL(stSql);

  stSql := ' Select a.*,b.COMPANY_NAME,c.DEPT_NAME from T_INUS_USER a ';
  stSql := stSql + ' Left Join T_INUS_COMPANY b ';
  stSql := stSql + ' ON(a.COMPANY_SEQ = b.COMPANY_SEQ ) ';
  stSql := stSql + ' Left Join T_INUS_DEPT c ';
  stSql := stSql + ' ON(a.COMPANY_SEQ = c.COMPANY_SEQ ';
  stSql := stSql + ' AND a.DEPT_SEQ = c.DEPT_SEQ ) ';
  stSql := stsql + ' Where a.DATA_FLAG = ''R'' ';

  with dmDBRelay.ADOQuery2 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;

    while Not Eof do
    begin
      if ChangeEmployee_SKGAS(FindField('USER_SEQ').AsString,FindField('USER_ID').AsString,FindField('USER_NAME').AsString,
                           FindField('COMPANY_SEQ').AsString,FindField('DEPT_SEQ').AsString,FindField('POSITION_NAME').AsString,
                           FindField('STATE_CODE').AsString,FindField('OFFICE_PHONE').AsString,FindField('HOME_PHONE').AsString,
                           FindField('MOBILE_PHONE').AsString,FindField('USER_EMAIL').AsString,FormatDateTime('yyyymmdd',FindField('USER_ENTER').AsDateTime),
                           FormatDateTime('yyyymmdd',FindField('USER_RETIRE').AsDateTime),FindField('USER_CARDNUM').AsString,FindField('COMPANY_NAME').AsString,
                           FindField('DEPT_NAME').AsString) then
      begin
        stSql := 'Update T_INUS_USER set DATA_FLAG = ''Y'' ';
        stSql := stsql + ' Where USER_SEQ = ' + FindField('USER_SEQ').AsString;
        stSql := stsql + ' AND DATA_FLAG = ''R'' ';
        dmDBRelay.Process2ExecSQL(stSql);
      end;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

procedure TdmEmployeeRelay.SetLastRelayTime(const Value: string);
begin
  if FLastRelayTime = Value then Exit;

  FLastRelayTime := Value;
end;

procedure TdmEmployeeRelay.SetRelayNumberFromDoorNO(aRelayNo, aNodeNo, aEcuID,
  aDoorNo: string);
var
  nIndex : integer;
  oRelayDoor : TRelayDoor;
begin
  nIndex := RelayDoorList.IndexOf(aRelayNo);
  if nIndex < 0 then
  begin
    oRelayDoor := TRelayDoor.Create(nil);
    oRelayDoor.RelayDoorNo := aRelayNo;
    oRelayDoor.SetDoorList(aNodeNo,aEcuID,aDoorNo);
    RelayDoorList.AddObject(aRelayNo,oRelayDoor);
  end else
  begin
    TRelayDoor(RelayDoorList.Objects[nIndex]).RelayDoorNo := aRelayNo;
    TRelayDoor(RelayDoorList.Objects[nIndex]).SetDoorList(aNodeNo,aEcuID,aDoorNo);
  end;

end;

function TdmEmployeeRelay.UpdateIF_IO_TAG_Field_StringValue(aEmCode, aFieldName,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update IF_TAG set ' + aFieldName + ' = ''' + aValue + ''', ';
  stSql := stSql + ' CHG_DATE = ''' + FormatDateTime('yyyymmddhhnnss',now) + ''' ';
  stSql := stSql + ' Where DOC_NO = ''' + aEmCode + ''' ';

  result := dmDBRelay.Process1ExecSQL(stSql);
end;

function TdmEmployeeRelay.UpdateTB_VISIT_DOC_CardCreate(aEmCode,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_VISIT_DOC set CARD_NO = ''' + aCardNo + ''', ';
  stSql := stSql + ' VISIT_IN_TIME = getdate() ';
  stSql := stSql + ' Where DOC_NO = ''' + aEmCode + ''' ';

  result := dmDBRelay.Process1ExecSQL(stSql);
end;

function TdmEmployeeRelay.UpdateTB_VISIT_DOC_CardReturnTime(
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_VISIT_DOC set VISIT_OUT_TIME = getdate() ';
  stSql := stSql + ' Where DOC_NO = ''' + aEmCode + ''' ';

  result := dmDBRelay.Process1ExecSQL(stSql);
end;

procedure TdmEmployeeRelay.VisitCardCreateTime(aEmCode, aCardNo: string);
var
  nTemp : int64;
begin
  if Length(aCardNo) > 10 then
  begin
    if aCardNo[9] = '*' then
    begin
      aCardNo := copy(aCardNo,1,8);
      nTemp := Hex2Dec64(aCardNO);
      aCardNo := FillZeroNumber(nTemp,10);
    end else
    begin
      aCardNo := copy(aCardNO,1,10);
    end;
  end;
  if CheckTB_VISIT_DOC_EmCode(aEmCode) = 1 then
  begin
    UpdateTB_VISIT_DOC_CardCreate(aEmCode,aCardNo);
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
  stDoorID := FillZeroStrNum(aNodeNo,G_nNodeCodeLength)+ aEcuID + aDoorNo;
  nIndex := DoorList.IndexOf(stDoorID);
  if nIndex < 0 then DoorList.Add(stDoorID);
  result := True;

end;

end.
