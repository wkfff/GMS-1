unit uDBRelay;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,Winapi.ActiveX,uCommonEvent,
  Vcl.Forms,Vcl.Dialogs,Winapi.Windows;

type
  TdmSHFDBRelay = class(TDataModule)
    ADOConnection: TADOConnection;
  private
    function SHFDBCreate(aDBType:integer;aDBIP,aDBPort,aDBUserID,aDBUserPw,aDBName:string;aWindowMode:integer):Boolean;
    function CheckTB_TERMINAL(aterminalid:string):integer;
    function CheckFdmsUser(aEmSeq:string):integer;
    function CheckSyncUserterminal(aPOSITIONNUM,aFINGERDEVICEID:string):integer;
  private
    FDBConnected: Boolean;
    FOnAdoConnected: TAdoConnectedEvent;
    procedure SetDBConnected(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Function DataBaseConnect(aDBType:integer;aDBIP,aDBPort,aDBUserID,aDBUserPw,aDBName:string;aWindowMode:integer=0;aMessage:Boolean=False):Boolean;
    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
  public
    Function RelayFingerDevice(aDEVICESEQ,aFINGERDEVICEID,aDEVICEIP,aDEVICEPORT,aDEVICENAME:string):Boolean;
    Function RelayFingerUser(aEMSEQ,aCardNo,aPOSITIONNUM:string):Boolean;
    Function RelayFingerUserPermit(aFINGERDEVICEID,aPOSITIONNUM,aPermit,aEMSEQ,aCardNo:string):Boolean;
  published
    property DBConnected : Boolean read FDBConnected write SetDBConnected;
  published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;

function SQLConfigDataSource(hwndParent : HWND; fRequest : WORD; lpszDriver : LPCSTR; lpszAttributes : LPCSTR) : Boolean; stdcall; external 'ODBCCP32.DLL';

var
  dmSHFDBRelay: TdmSHFDBRelay;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBFormMessage;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmSHFDBRelay }

function TdmSHFDBRelay.CheckFdmsUser(aEmSeq: string): integer;
var
  TempQuery :TADOQuery;
  stSql : string;
begin
  result := -1;
  stSql := 'Select * from tb_employe where str_empCode = ''ep_' + FillZeroNumber(strtoint(aEmSeq),7) + ''' ';
  Try
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := ADOConnection;
    TempQuery.DisableControls;
    with TempQuery do
    begin
      Close;
      SQL.Text:= stSql;
      try
        //LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log','Start' + aSql);
        Open;
        //LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log','End' + aSql);
      except
      ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + stSql);

          if Pos('no connection to the server',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('���Ͽ� �׼����� �� ���ų� �޸� �Ǵ� ��ũ ������ �����Ͽ�',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('������ �����߽��ϴ�',E.Message) > 0 then
          begin
            DBConnected := False;
          end;

          Exit;
        end
      end;
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempQuery.EnableControls;
    TempQuery.Free;
    CoUninitialize;
  End;
end;

function TdmSHFDBRelay.CheckSyncUserterminal(aPOSITIONNUM,
  aFINGERDEVICEID: string): integer;
var
  TempQuery :TADOQuery;
  stSql : string;
begin
  result := -1;
  stSql := 'Select * from tb_syncuserterminal ';
  stSql := stSql + ' where str_emptmId = ''' + FillZeroNumber(strtoint(aPOSITIONNUM),G_nFPUserIDLength) + ''' ';
  stSql := stSql + ' and int_terminalAddress = ' + aFINGERDEVICEID + ' ';

  Try
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := ADOConnection;
    TempQuery.DisableControls;
    with TempQuery do
    begin
      Close;
      SQL.Text:= stSql;
      try
        //LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log','Start' + aSql);
        Open;
        //LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log','End' + aSql);
      except
      ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + stSql);

          if Pos('no connection to the server',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('���Ͽ� �׼����� �� ���ų� �޸� �Ǵ� ��ũ ������ �����Ͽ�',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('������ �����߽��ϴ�',E.Message) > 0 then
          begin
            DBConnected := False;
          end;

          Exit;
        end
      end;
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempQuery.EnableControls;
    TempQuery.Free;
    CoUninitialize;
  End;
end;

function TdmSHFDBRelay.CheckTB_TERMINAL(aterminalid: string): integer;
var
  TempQuery :TADOQuery;
  stSql : string;
begin
  result := -1;
  stSql := 'Select * from tb_terminal where str_terminalCode = ''' + aterminalid + ''' ';
  Try
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := ADOConnection;
    TempQuery.DisableControls;
    with TempQuery do
    begin
      Close;
      SQL.Text:= stSql;
      try
        //LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log','Start' + aSql);
        Open;
        //LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log','End' + aSql);
      except
      ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + stSql);

          if Pos('no connection to the server',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('���Ͽ� �׼����� �� ���ų� �޸� �Ǵ� ��ũ ������ �����Ͽ�',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('������ �����߽��ϴ�',E.Message) > 0 then
          begin
            DBConnected := False;
          end;

          Exit;
        end
      end;
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempQuery.EnableControls;
    TempQuery.Free;
    CoUninitialize;
  End;

end;

function TdmSHFDBRelay.DataBaseConnect(aDBType: integer; aDBIP, aDBPort,
  aDBUserID, aDBUserPw, aDBName: string;aWindowMode:integer=0; aMessage: Boolean=False): Boolean;
var
  stConnectString : string;
begin
  result := False;
  SHFDBCreate(aDBType,aDBIP,aDBPort,aDBUserID,aDBUserPw,aDBName,aWindowMode);
  if aDBType = 1 then
  begin
    if aWindowMode = 1 then
    begin
      stConnectString := 'PROVIDER=SQLOLEDB.1;SERVER=localhost;DATABASE=' + G_stDBName + ';TRUSTED_CONNECTION=YES';
    end else
    begin
      stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
      stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
      stConnectString := stConnectString + 'Persist Security Info=True;';
      stConnectString := stConnectString + 'User ID=' + aDBUserID + ';';
      stConnectString := stConnectString + 'Initial Catalog=' + aDBName + ';';
      stConnectString := stConnectString + 'Data Source=' + aDBIP  + ',' + aDBPort;
    end;
  end;

  with ADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := stConnectString;
      LoginPrompt:= false ;
      Connected := True;
      //CommandTimeout := 0;
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
            ShowMessage(dmFormMessage.GetMessage('DBCONNECTFAIL') );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    //CursorLocation := clUseClient;
  end;
  DBConnected := True;
  result := True;
end;

function TdmSHFDBRelay.ProcessExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  //������Ű��
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      CommandTimeOut := 600;
      Close;
      SQL.Text:= aSql;
      try
        //LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log','Start' + aSql);
        nResult := ExecSQL;
        //LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log','End' + aSql);
      except
      ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + aSql);

          if Pos('no connection to the server',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('���Ͽ� �׼����� �� ���ų� �޸� �Ǵ� ��ũ ������ �����Ͽ�',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('������ �����߽��ϴ�',E.Message) > 0 then
          begin
            DBConnected := False;
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

function TdmSHFDBRelay.RelayFingerDevice(aDEVICESEQ, aFINGERDEVICEID, aDEVICEIP,
  aDEVICEPORT, aDEVICENAME: string): Boolean;
var
  stSql : string;
  stTermianalCode : string;
begin
  stTermianalCode := 'tm_' + FillZeroNumber(strtoint(aDEVICESEQ),4);

  if CheckTB_TERMINAL(stTermianalCode) = 1 then
  begin
    stSql := ' Update tb_terminal set ';
    stSql := stSql + 'int_terminalAddress = ' + aFINGERDEVICEID + ',';
    stSql := stSql + 'str_terminalIP = ''' + aDEVICEIP + ''',';
    stSql := stSql + 'int_terminalPort = ' + aDEVICEPORT + ',';
    stSql := stSql + 'str_terminalPlace = ''' + aDEVICENAME + ''' ';
    stSql := stSql + ' where str_terminalCode = ''' + stTermianalCode + ''' ';
  end else
  begin
    stSql := ' Insert Into tb_terminal(str_terminalCode,int_terminalAddress,str_terminalIP,int_terminalPort,str_terminalPlace) ';
    stSql := stSql + ' Values(';
    stSql := stSql + ' ''' + stTermianalCode + ''', ';
    stSql := stSql + ' ' + aFINGERDEVICEID + ', ';
    stSql := stSql + ' ''' + aDEVICEIP + ''', ';
    stSql := stSql + ' ' + aDEVICEPORT + ', ';
    stSql := stSql + ' ''' + aDEVICENAME + ''') ';
  end;
  result := ProcessExecSQL(stSql);
end;

function TdmSHFDBRelay.RelayFingerUser(aEMSEQ,aCardNo,aPOSITIONNUM: string): Boolean;
var
  TempQuery :TADOQuery;
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_EMPLOYEE where EM_SEQ = ' + aEmSeq + ' ';
  Try
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := dmDataBase.ADOConnection;
    TempQuery.DisableControls;
    with TempQuery do
    begin
      Close;
      SQL.Text:= stSql;
      try
        //LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log','Start' + aSql);
        Open;
        //LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log','End' + aSql);
      except
        Exit;
      end;

      if recordcount < 1 then Exit;
      if CheckFdmsUser(aEmSeq) = 1 then
      begin
        stSql := ' Update tb_employe set ';
        stSql := stSql + 'str_empNum = ''' + FindField('EM_CODE').AsString + ''',';
        stSql := stSql + 'str_empName = ''' + FindField('EM_NAME').AsString + ''',';
        stSql := stSql + 'str_empTel = ''' + FindField('EM_HANDPHONE').AsString + ''',';
        stSql := stSql + 'str_emptmId = ''' + FillZeroNumber(strtoint(aPOSITIONNUM),G_nFPUserIDLength) + ''',';
        //if (aCardNo <> '') then stSql := stSql + 'str_emptmCardnum = ''' + FillCharString(aCardNo,'F',FIXFDMSCARDNO); + ''', ';  //ī���ȣ�� ������� ����.
        stSql := stSql + 'byte_empMainControlModify = ''2'' ';
        //stSql := stSql + ' where str_empCode = ''' + 'ep_' + FillZeroNumber(strtoint(aFDMS_ID),7)  + ''' ';
        stSql := stSql + ' where str_empCode = ''ep_' + FillZeroNumber(strtoint(aEmSeq),7) + ''' ';
      end else
      begin
        stSql := ' Insert Into tb_employe(';
        stSql := stSql + 'str_empnum,';
        stSql := stSql + 'str_empCode,';
        stSql := stSql + 'str_empName,';
        stSql := stSql + 'str_empPostCode,';
        stSql := stSql + 'str_empPositionCode,';
        stSql := stSql + 'str_empJumin,';
        stSql := stSql + 'str_empTel,';
        stSql := stSql + 'str_empUserTimetableName,';
        stSql := stSql + 'str_empUserTimetableData,';
        stSql := stSql + 'str_emptmId,';
//        stSql := stSql + 'str_emptmCardnum,';
        stSql := stSql + 'byte_empMainControlModify,';
        stSql := stSql + 'date_empAccountDate) ';
        stSql := stSql + ' Values(';
        stSql := stSql + '''' + FindField('EM_CODE').AsString + ''',';
        stSql := stSql + '''' + 'ep_' + FillZeroNumber(strtoint(aEmSeq),7) +  ''',';
        stSql := stSql + '''' + FindField('EM_NAME').AsString + ''',';
        stSql := stSql + '''��������'',';
        stSql := stSql + '''��������'',';
        stSql := stSql + '''000000-0000000'',';
        stSql := stSql + '''' + FindField('EM_HANDPHONE').AsString + ''',';
        stSql := stSql + '''�⺻��'',';
        stSql := stSql + '''FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
        stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
        stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
        stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
        stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
        stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
        stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
        stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFF'',';
        stSql := stSql + ''''+ FillZeroNumber(strtoint(aPOSITIONNUM),G_nFPUserIDLength)+''',';
//        stSql := stSql + '''' + stCardNo + ''',';
        stSql := stSql + '''1'',';
        if G_nFingerRelayDBType = 0 then //MDB
        begin
          stSql := stSql + '''' + formatDateTime('yyyy-mm-dd AMPM HH:MM:SS',Now) + ''')' ;
        end else if G_nFingerRelayDBType = 1 then
        begin
          stSql := stSql + '''' + formatDateTime('yyyy-mm-dd HH:MM:SS',Now) + ''')' ;
        end
      end;
      result := ProcessExecSQL(stSql);
    end;
  Finally
    TempQuery.EnableControls;
    TempQuery.Free;
    CoUninitialize;
  End;
end;

function TdmSHFDBRelay.RelayFingerUserPermit(aFINGERDEVICEID, aPOSITIONNUM,
  aPermit, aEMSEQ,aCardNo: string): Boolean;
var
  stSql : string;
  stPermit : string;
begin
  RelayFingerUser(aEMSEQ,aCardNo,aPOSITIONNUM);
  if aPermit = '0' then stPermit := 'D'
  else stPermit := 'I';

  if CheckSyncUserterminal(aPOSITIONNUM,aFINGERDEVICEID) = 1 then
  begin
    stSql := ' Update tb_syncuserterminal ';
    stSql := stSql + ' set str_mode = ''' + stPermit + ''',';
    stSql := stSql + ' str_result = ''F'' ';
    stSql := stSql + ' where str_emptmId = ''' + FillZeroNumber(strtoint(aPOSITIONNUM),G_nFPUserIDLength) + ''' ';
    stSql := stSql + ' and int_terminalAddress = ' + aFINGERDEVICEID + ' ';
  end else
  begin
    stSql := ' Insert Into tb_syncuserterminal( ';
    stSql := stSql + 'str_emptmId,';
    stSql := stSql + 'int_terminalAddress,';
    stSql := stSql + 'str_mode,';
    stSql := stSql + 'str_result,';
    stSql := stSql + 'regdate) ';
    stSql := stSql + ' values(';
    stSql := stSql + '''' + FillZeroNumber(strtoint(aPOSITIONNUM),G_nFPUserIDLength) + ''', ';
    stSql := stSql + '' + aFINGERDEVICEID + ', ';
    stSql := stSql + '''' + stPermit + ''', ';
    stSql := stSql + '''F'', ';
    stSql := stSql + 'getdate() ) ';
  end;
  result := ProcessExecSQL(stSql);
end;

procedure TdmSHFDBRelay.SetDBConnected(const Value: Boolean);
begin
  if FDBConnected = Value then Exit;

  FDBConnected := Value;
  if Assigned(FOnAdoConnected) then
  begin
    OnAdoConnected(Self,Value);
  end;

end;

function TdmSHFDBRelay.SHFDBCreate(aDBType: integer; aDBIP, aDBPort, aDBUserID,
  aDBUserPw, aDBName: string; aWindowMode: integer): Boolean;
var
  stConnectString : string;
  stSql : string;
begin
  if aDBType = 1 then
  begin
    if aWindowMode = 1 then
    begin
      stConnectString := 'PROVIDER=SQLOLEDB.1;SERVER=localhost;DATABASE=master;TRUSTED_CONNECTION=YES';
    end else
    begin
      stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
      stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
      stConnectString := stConnectString + 'Persist Security Info=True;';
      stConnectString := stConnectString + 'User ID=' + aDBUserID + ';';
      stConnectString := stConnectString + 'Initial Catalog=master;';
      stConnectString := stConnectString + 'Data Source=' + aDBIP  + ',' + aDBPort;
    end;
  end else if aDBType = 2 then
  begin
    stConnectString := 'Provider=PostgreSQL OLE DB Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBIP + ';'   ;
    stConnectString := stConnectString + 'location=postgres;';
    stConnectString := stConnectString + 'User Id='+ aDBUserID + ';';
    stConnectString := stConnectString + 'password=' + aDBUserPw;
  end else if aDBType = 3 then
  begin
    Exit;
    //IBOLE.dll ������ ��� �Ұ�
  end else //����Ʈ�� MDB�� �ν�����
  begin
    if Not FileExists(G_stExeFolder + '\BMS.mdb') then
    begin
      ChDir(G_stExeFolder);
      SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=BMS.mdb General'));
    end;
    if Not FileExists(G_stExeFolder + '\BMSEvent.mdb') then
    begin
      ChDir(G_stExeFolder);
      SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=BMSEvent.mdb General'));
    end;
    Exit;
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
          Exit;
        end;
      else
        begin
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
  end;
  stSql := 'Create DataBase ' + aDBName ;
  ProcessExecSQL(stSql);

end;

end.