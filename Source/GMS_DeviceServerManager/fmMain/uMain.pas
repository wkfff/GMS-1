unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvToolBar, AdvShapeButton,
  AdvGlowButton, Vcl.ExtCtrls, Vcl.Menus, AdvPreviewMenu, AdvToolBarStylers,
  AdvMenus, AdvMenuStylers, AdvPreviewMenuStylers, Vcl.ImgList,
  Data.DB,Data.Win.ADODB,ActiveX,iniFiles,
  uSharedMemory, uSubForm, CommandArray, Vcl.Imaging.pngimage,Winapi.ShellAPI,
  AdvOfficeStatusBar;

const
  con_CheckDataBaseHoliday = 0;
  con_CheckDataBaseSchedule = 1;
  con_CheckDataBaseTimeCodeUse = 2;
  con_CheckDataBaseTimeDeviceCode = 3;
  con_CheckDataBaseDoorMemLoadChange = 4;
  con_CheckDataBaseDoorScheduleUse = 5;
  con_CheckDataBaseEmployeeChange = 6;
  con_CheckDataBaseEmployeePermitChange = 7;
  con_CheckDataBaseCardPermitSendStandby = 8;
  con_CheckDataBasePasswordPermitSendStandby = 9;
  con_CheckDataBaseReaderTelNumberChange = 10;
  con_CheckDataBaseNodeServerChange = 11;
  con_CheckDataBaseNodeMemLoadChange = 12;
  con_CheckDataBaseDeviceArmAreaUseChange = 13;
  con_CheckDataBaseCardFTPChange = 14;
  con_CheckDataBaseDeviceChange = 15;
  con_CheckDataBaseCardInfoChange = 16;

type

  TfmMain = class(TfmASubForm)
    MenuImageList32: TImageList;
    MenuDisImageList32: TImageList;
    AdvPreviewMenuOfficeStyler1: TAdvPreviewMenuOfficeStyler;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    ImageList2: TImageList;
    MenuImageList16: TImageList;
    StartMenu: TAdvPreviewMenu;
    AdvPreviewMenuOfficeStyler2: TAdvPreviewMenuOfficeStyler;
    TrayImageList: TImageList;
    pm_TrayMenu: TPopupMenu;
    mn_trayVisible: TMenuItem;
    N2: TMenuItem;
    mn_trayClose: TMenuItem;
    TrayIcon1: TTrayIcon;
    at_Menu: TAdvToolBarPager;
    ApManager: TAdvPage;
    AdvToolBar1: TAdvToolBar;
    mn_PCMonitor: TAdvGlowButton;
    AdvShapeButton1: TAdvShapeButton;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    TrayTimer: TTimer;
    MemoryReadTimer: TTimer;
    ServerCheckTimer: TTimer;
    sb_Status: TAdvOfficeStatusBar;
    DataBaseChangeCheckTimer: TTimer;
    ServerSendTimer: TTimer;
    FileToDBTimer: TTimer;
    NowTimer: TTimer;
    CardPermitCheckTimer: TTimer;
    AdoConnectCheckTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TrayTimerTimer(Sender: TObject);
    procedure MemoryReadTimerTimer(Sender: TObject);
    procedure mn_PCMonitorClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure mn_trayVisibleClick(Sender: TObject);
    procedure mn_trayCloseClick(Sender: TObject);
    procedure StartMenuMenuItems1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DataBaseChangeCheckTimerTimer(Sender: TObject);
    procedure ServerSendTimerTimer(Sender: TObject);
    procedure FileToDBTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ServerCheckTimerTimer(Sender: TObject);
    procedure NowTimerTimer(Sender: TObject);
    procedure CardPermitCheckTimerTimer(Sender: TObject);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);
  private
    Function  GetEmInfoFromCardNo(aCardNo,aLastDate :string;aSearchType:integer; var aCompanyCode,aCompanyName,aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aATUSE,aFDUSE,aPrintNo,aHandPhone:UnicodeString):Boolean;
    function  LoadCardPermit(aNodeNo,aECUID,aCardNo:string):integer;
    function  LoadCardPermitSendStandby : Boolean;
    function  LoadCardFTPChangeData : Boolean;
    function  LoadDeviceArmAreaUseChangeData:Boolean;
    function  LoadDeviceChangeData:Boolean;
    function  LoadEmployeeChangeData:Boolean;          //����� ��� ���� �ε� �ϴ°ǵ� �������� ����... ������ �������� �ִ� ���� ���� ���� �߻�
    function  LoadEmployeePermitChangeData:Boolean;   //����� ��� ������ ������ ī��������� ���� �Ѵ�.
    function  LoadEmployeePermitToCard(aEmSeq:string):Boolean;  //������� �ε��Ͽ� ī��������� ����
//    function  LoadEmployeePermitToDeviceCard(aNodeNo,aEcuID,aEmSeq:string):Boolean;
    function  LoadNodeMemLoadChangeData : Boolean;
    function  LoadNodeServerChangeData : Boolean;
    function  LoadPasswordPermit(aNodeNo,aECUID,aCardNo:string):integer;
    function  LoadPasswordPermitSendStandby : Boolean;
    function  LoadReaderTelNumberChangeData : Boolean;
    function  LoadTB_CARDHIS_Change : Boolean;
  private
    //�̺�Ʈ
    procedure AdoConnected(Sender: TObject;  Connected:Boolean);
    procedure CardChangePacket(Sender: TObject;  aCmd: integer;aCardNo:string; aData:string);
    procedure DecoderToServerPacket(Sender: TObject;aTxRxType,aPCIP,aPacketData:string);
  private
    L_bClose : Boolean;
    L_bEmployeePermitLoad : Boolean;
    L_bFileToDBLoad : Boolean;
    L_bMemoryRead : Boolean;
    L_bSendControlAck : Boolean;
    L_bSendEventAck : Boolean;
    L_bServerDirectSend : Boolean;
    L_nDataBaseCheckStep : integer;
    L_stHolidaySendYear : string;
    L_stCardHisLoadTime : string;
    CardEmList : TStringList;
    CardNodeList : TStringList;
    DecoderServerList : TStringList;
    SendControlMessageList : TStringList;
    SendEventMessageList : TStringList;
    L_dtDeviceServerAliveTime : TDateTime;
    L_dtDeviceServerManagerAliveTime : TDateTime;
    oControlSendMemory : TfisSharedMemory;
    oEventSendMemory : TfisSharedMemory;
    oControlRecvMemory : TfisSharedMemory;
    oEventRecvMemory : TfisSharedMemory;
    { Private declarations }
    function ControlTimechar2DecType(aControlTime:char):string;
    procedure MIAMS_DeviceServerControlMessageDataSend(aCmd:integer;aMessage:UnicodeString);
    procedure MIAMS_DeviceServerEventMessageDataSend(aCmd: integer;aMessage: UniCodeString);
    Function MIAMS_DeviceServerExecute : Boolean;
    Function MIAMS_DeviceServerTerminate : Boolean;
    Function FileToDBLoad:Boolean;
    Function FileToDBInsertAlarmEvent(aFileName:string):Boolean;
    Function FileToDBInsertCardAccessEvent(aFileName:string):Boolean;
    Function FileToDBInsertDeviceRegEvent(aFileName:string):Boolean;
    Function FileToDBInsertDoorStateEvent(aFileName:string):Boolean;
    Function FileToDBInsertTelAccessEvent(aFileName:string):Boolean;
    Function FileToDBInsertCardRcvAckEvent(aFileName:string):Boolean;
    procedure GetIniConfig;
    procedure LoadTB_CONFIG;
    Procedure MDIChildShow(FormName:String);
    Function  MDIForm(FormName:string):TForm;
    Function ReceiveDoorHolidayRegist(aNodeNo,aEcuID,amsgCode,aRealData:string):Boolean;
    Function ReceiveDoorScheduleRegist(aNodeNo,aEcuID,amsgCode,aRealData:string):Boolean;
    Function ReceiveDoorSettingInformtion(aNodeNo,aEcuID,amsgCode,aRealData:string):Boolean;
    Function RcvDeviceTimeCodeRegProcess(aNodeNo,aEcuID,amsgCode,aRealData:string):Boolean;
    function SetNodeToCardPermitInitialize(aNodeNo,aEcuID,aCardNo,aCardPermit,aCardState,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
          aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8,aRcvAck,aPositionNum,
          aTimeCodeUse,aTCGroup,aTime1,aTime2,aTime3,aTime4,aTCWeekCode,aRegDate,aEndDate,aEmState:string):integer;
  private
    FNowDate: String;
    Function CheckDeviceCardGrade(aNodeNo,aECUID,aExtID,aDoorNo,aArmAreaNo,aCardNo,aResult,aTime:string):integer;
    Function CheckDeviceHolidaySend(aYear:string):Boolean; //Manager���� Holiday ���� �Ǽ� �ִ��� üũ ����.
    Function CheckeDoorMemLoadChange : Boolean;
    Function CheckDoorScheduleChange : Boolean;
    Function CheckDoorScheduleUse(aType:integer) : integer;
    Function CheckDoorTimeCodeUseChange : Boolean;
    Function CheckTimeDeviceCodeChange : Boolean;
    Function DoorSchedule_UseChangeSend : integer;
    Function DoorSettingInfo_Search : integer;
    procedure MemoryEvent(aEventType,aTxRx,aData:string);
    procedure WndProc(var Message: TMessage); override;
    procedure SetNowDate(const Value: String);
  public
    { Public declarations }
    procedure FORMENABLE(aName:integer;aValue:string);
    procedure  AppException( Sender:  TObject;  E:  Exception) ;
  public
    property NowDate : String read FNowDate write SetNowDate; //��¥�� �ٲ�� ó���Ұ͵��� ó�� ����.
  end;

var
  fmMain: TfmMain;

implementation
 uses
  uCard,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDataBaseConfig,
  uDBCardPermit,
  uDBDelete,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDeviceCardNo,
  uDevicePacket,
  uDeviceVariable,
  uFormVariable,
  uPCComMonitoring;

{$R *.dfm}

procedure TfmMain.AdoConnectCheckTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  Try
    AdoConnectCheckTimer.Enabled := False;
    if Not TDataBaseConfig.GetObject.DBConnected then
    begin
      TDataBaseConfig.GetObject.DataBaseConnect(False);
    end;
  Finally
    AdoConnectCheckTimer.Enabled := Not TDataBaseConfig.GetObject.DBConnected;
  End;
end;

procedure TfmMain.AdoConnected(Sender: TObject; Connected: Boolean);
begin
  AdoConnectCheckTimer.Enabled := Not Connected;
end;

procedure TfmMain.AppException(Sender: TObject; E: Exception);
var
  sObj : string;
  ctrl : TControl;
  Comp : TComponent;
begin
  sObj := '';
  if Sender <> nil then
  begin
    if Sender.InheritsFrom(TControl) then
    begin
      ctrl := TControl(Sender);
      While (ctrl <> nil) do
      begin
        sObj := ctrl.Name + '->' + sObj;
        ctrl := ctrl.Parent;
      end;
    end else if Sender.InheritsFrom(TComponent) then
    begin
      Comp := TComponent(Sender);
      sObj := Comp.Name;
      if (Comp.Owner <> nil) then
      begin
        sObj := comp.Owner.Name + '->' + sObj;
      end;
    end;
  end;
  LogSave(G_stExeFolder + '\..\log\GMS_DeviceServerManager' + FormatDateTime('yyyymmdd',now) + '.log',sObj);

end;

procedure TfmMain.CardChangePacket(Sender: TObject; aCmd: integer; aCardNo,
  aData: string);
begin
  dmDBUpdate.UpdateTB_CARD_Field_StringValue(aCardNo,'CA_LASTUSEDATE',aData);
end;

procedure TfmMain.CardPermitCheckTimerTimer(Sender: TObject);
begin
  inherited;
  Exit; //GMS_ServerManager �� ���� ���� �ϵ��� ����... �ʹ� ���� �ֵ��� ���� �ؼ� �� ���� �� ���� �����̴�.
  if G_bApplicationTerminate then Exit;
  Try
    CardPermitCheckTimer.Enabled := False;
    LoadEmployeePermitChangeData;
  Finally
    CardPermitCheckTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

function TfmMain.CheckDeviceCardGrade(aNodeNo, aECUID, aExtID, aDoorNo,
  aArmAreaNo, aCardNo, aResult,aTime: string): integer;
var
  nIndex : integer;
  oCardNode : TvNodeCard;
begin
  if G_bApplicationTerminate then Exit;

  result := -1;
  nIndex := CardNodeList.IndexOf(aNodeNo);
  if nIndex < 0 then
  begin
    oCardNode := TvNodeCard.Create(nil);
    oCardNode.NodeNo := aNodeNo;
    CardNodeList.AddObject(aNodeNo,oCardNode);
    nIndex := CardNodeList.IndexOf(aNodeNo);
  end;
  if nIndex < 0 then Exit; //���⿡�� ���� ������ ���� ������ �ִ°Ŵ�.
  result := TvNodeCard(CardNodeList.Objects[nIndex]).CheckDeviceCardGrade(aECUID, aExtID, aDoorNo,aArmAreaNo, aCardNo, aResult,aTime);
end;

function TfmMain.CheckDeviceHolidaySend(aYear: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stNodeNo : string;
  stEcuID : string;
  stOldNodeNo : string;
  stOldEcuID : string;
  nIndex : integer;
  bNodeSetting : Boolean;
  i : integer;
begin
  result := False;

  stSql := ' Select a.* from TB_HOLIDAYDEVICE a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' INNER JOIN TB_NODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
  stSql := stSql + ' AND c.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.HD_SEND = ''N'' ';
  if G_nDBType = MSSQL then
    stSql := stSql + ' AND SUBSTRING(a.HO_DAY,1,4) = ''' + aYear + ''' '
  else if G_nDBType = POSTGRESQL then
    stSql := stSql + ' AND SUBSTR(a.HO_DAY,1,4) = ''' + aYear + ''' '
  else if G_nDBType = FIREBIRD then
    stSql := stSql + ' AND SUBSTRING(a.HO_DAY From 1 for 4) = ''' + aYear + ''' ';
  stSql := stSql + ' Order by a.ND_NODENO,a.DE_ECUID ';

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
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DeviceHolidaySend');
        Exit;
      End;

      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        dmDBUpdate.UpdateTB_HOLIDAYDEVICE_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('HO_DAY').AsString,'HD_SEND','R');

        Next;
      end;
      //dmDBUpdate.UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(aYear,'N','R'); //
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckDoorScheduleChange: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try

    stSql := 'SELECT a.* ';
    stSql := stSql + ' FROM TB_DOORSCHEDULE a ';
    stSql := stSql + ' INNER JOIN TB_NODE c ';
    stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND c.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DS_DEVICESYNC = ''N'' ' ;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        //Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DoorScheduleSend');
          Exit;
        End;

        if RecordCount < 1 then Exit;
        while Not Eof do
        begin
          dmDBUpdate.UpdateTB_DOORSCHEDULE_Field_StringValue(FindField('ND_NODENO').asstring,FindField('DE_ECUID').asstring,FindField('DE_EXTENDID').asstring,FindField('DO_DOORNO').asstring,FindField('DS_DAYCODE').asstring,'DS_DEVICESYNC','R');
          Next;
        end;
        result := True;
        //dmDBUpdate.UpdateTB_DOORSCHEDULE_SendStatus('N','R'); //

      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Send_DoorScheduleInfo');
  End;
end;

function TfmMain.CheckDoorScheduleUse(aType:integer): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;

  Try

    stSql := 'SELECT top 1 a.* ';
    stSql := stSql + ' FROM TB_DOORRCV a ';
    stSql := stSql + ' INNER JOIN TB_NODE b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND b.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_DOORSCHUSE = ''N'' ' ;
    if aType = 0 then   //����Ȱ� �߿� ���ŵ��� ����
    begin
      stSql := stSql + ' AND (a.DO_SETTINGINFO = ''N'' OR a.DO_SETTINGINFO is NULL) ';
    end else if aType = 1 then   //����Ȱ� �߿� ���ſϷ� �Ȱ��� ������
    begin
      stSql := stSql + ' AND a.DO_SETTINGINFO = ''Y'' ';
    end;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        //Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DoorScheduleSend');
          Exit;
        End;

        if RecordCount < 1 then Exit;
        result := 1;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Send_DoorScheduleInfo');
  End;
end;

function TfmMain.CheckDoorTimeCodeUseChange: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try

    stSql := 'SELECT a.* ';
    stSql := stSql + ' FROM TB_DEVICERCV a ';
    stSql := stSql + ' INNER JOIN TB_NODE c ';
    stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND c.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DE_TIMECODEUSE = ''U'' ' ;    //������Ʈ �Ȱ��� �ִ��� üũ

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        //Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','CheckDoorTimeCodeUseChange');
          Exit;
        End;

        if RecordCount < 1 then Exit;
        while Not Eof do
        begin
          dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,'DE_TIMECODEUSE','R');
          Next;
        end;
//        dmDBUpdate.UpdateTB_DEVICERCV_TIMECODEUSEAllChange('U','S');
        result := True;

      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Send_DoorScheduleInfo');
  End;

end;

function TfmMain.CheckeDoorMemLoadChange: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  Try
    stSql := 'SELECT top 1 a.* ';
    stSql := stSql + ' FROM TB_DOOR a ';
    stSql := stSql + ' INNER JOIN TB_NODE b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND b.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DO_MEMLOAD = ''N'' ' ;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        //Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','CheckeDoorMemLoadChange');
          Exit;
        End;

        if RecordCount < 1 then Exit;
        result := True;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','CheckeDoorMemLoadChange');
  End;
end;

function TfmMain.CheckTimeDeviceCodeChange: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try
    stSql := 'SELECT a.* ';
    stSql := stSql + ' FROM TB_TIMECODEDEVICE a ';
    stSql := stSql + ' INNER JOIN TB_NODE b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND b.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.TC_SEND = ''N'' ' ;
 //   stSql := stSql + ' order by ND_NODENO,DE_ECUID ';

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        //Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DoorScheduleSend');
          Exit;
        End;

        if RecordCount < 1 then Exit;
        while Not Eof  do
        begin
          dmDBUpdate.UpdateTB_TIMECODEDEVICE_Field_StringValue(FindField('ND_NODENO').asstring,FindField('DE_ECUID').asstring,'TC_SEND','R');

          Next;
        end;
        result := True;

      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','Send_DoorScheduleInfo');
  End;
end;

function TfmMain.ControlTimechar2DecType(aControlTime: char): string;
var
   nDoorControlTime : integer;
   nOrd : integer;
   nMsec : integer;
begin
  if aControlTime >= #$30 then
  begin
   if aControlTime < #$40 then  result := aControlTime
   else
   begin
      if (aControlTime >= 'A') and (aControlTime <= 'Z') then  nDoorControlTime := Ord(aControlTime) - Ord('A')
      else nDoorControlTime := Ord(aControlTime) - Ord('a') + 26;
      nDoorControlTime := nDoorControlTime * 5;
      result := inttostr( 10 + nDoorControlTime );
   end;
  end else
  begin
    nOrd := Ord(aControlTime);
    nMsec := (nOrd - $20) * 100;
    result := inttostr(nMsec) + 'ms';
  end;
end;

procedure TfmMain.DataBaseChangeCheckTimerTimer(Sender: TObject);
var
  stSendMessage : string;
  nResult : integer;
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  Try
    DataBaseChangeCheckTimer.Enabled := False;
    case L_nDataBaseCheckStep of
      con_CheckDataBaseHoliday : begin
        if L_stHolidaySendYear <> formatDateTime('yyyy',now) then       //Ư���� ���� �޽��� ������...
        begin
          L_stHolidaySendYear := formatDateTime('yyyy',now);
          stSendMessage := inttostr(con_cmdManagerToServerDeviceHoliday) + DATADELIMITER;
          SendControlMessageList.Add(stSendMessage);
        end else if CheckDeviceHolidaySend(L_stHolidaySendYear) then
        begin
          stSendMessage := inttostr(con_cmdManagerToServerDeviceHoliday) + DATADELIMITER;
          SendControlMessageList.Add(stSendMessage);
        end;
        L_nDataBaseCheckStep := con_CheckDataBaseSchedule;
      end;
      con_CheckDataBaseSchedule : begin   //������ ����
        if CheckDoorScheduleChange then
        begin
          stSendMessage := inttostr(con_cmdManagerToServerDoorScheduleChange) + DATADELIMITER;
          SendControlMessageList.Add(stSendMessage);
        end;
        L_nDataBaseCheckStep := con_CheckDataBaseTimeCodeUse;
      end;
      con_CheckDataBaseTimeCodeUse : begin   //Ÿ���ڵ� ����
        if CheckDoorTimeCodeUseChange then
        begin
          stSendMessage := inttostr(con_cmdManagerToServerDoorTimeCodeUseChange) + DATADELIMITER;
          SendControlMessageList.Add(stSendMessage);
        end;
        L_nDataBaseCheckStep := con_CheckDataBaseTimeDeviceCode;
      end;
      con_CheckDataBaseTimeDeviceCode : begin
        if CheckTimeDeviceCodeChange then
        begin
          stSendMessage := inttostr(con_cmdManagerToServerTimeDeviceCodeChange) + DATADELIMITER;
          SendControlMessageList.Add(stSendMessage);
        end;
        L_nDataBaseCheckStep := con_CheckDataBaseDoorMemLoadChange;
      end;
      con_CheckDataBaseDoorMemLoadChange : begin
        if CheckeDoorMemLoadChange then
        begin
          stSendMessage := inttostr(con_cmdManagerToServerDoorMemLoadChange) + DATADELIMITER;
          SendControlMessageList.Add(stSendMessage);
        end;

        if G_nMonitoringType = 1 then L_nDataBaseCheckStep := con_CheckDataBaseEmployeeChange
        else L_nDataBaseCheckStep := con_CheckDataBaseDoorScheduleUse;
      end;
      con_CheckDataBaseDoorScheduleUse : begin
        nResult := CheckDoorScheduleUse(0);
        if nResult = 1 then
        begin
          //���Թ� ������ �������� ���� �����Ͱ� ������ ���� ó�� ����...
          DoorSettingInfo_Search;
        end;
        nResult := CheckDoorScheduleUse(1);
        if nResult = 1 then
        begin
          //��� ���� �� �Ŀ� ���Թ� ������ ������� ���� �Ȱ� ������ �۽� ó�� ����.
          DoorSchedule_UseChangeSend;
        end;
        L_nDataBaseCheckStep := con_CheckDataBaseCardInfoChange;
      end;
      con_CheckDataBaseCardInfoChange : begin  //ī�� ���� �Ǵ� ���� ������ ������ �ٽ� �ε� ����.
        LoadTB_CARDHIS_Change;
        L_nDataBaseCheckStep := con_CheckDataBaseEmployeePermitChange;
      end;
      con_CheckDataBaseEmployeeChange : begin
        //LoadEmployeeChangeData; //������� ���� �� ���� ������ �ε�����... ���۾��� ���� ����... ���� �ٸ� ������ ���� �ؼ� ������ �����.
        L_nDataBaseCheckStep := con_CheckDataBaseEmployeePermitChange;
      end;
      con_CheckDataBaseEmployeePermitChange : begin
        //LoadEmployeePermitChangeData; // ��� ���� ���� �� ���� ������ �ε�����...
        L_nDataBaseCheckStep := con_CheckDataBaseCardPermitSendStandby;
      end;
      con_CheckDataBaseCardPermitSendStandby : begin
        LoadCardPermitSendStandby;
        L_nDataBaseCheckStep := con_CheckDataBasePasswordPermitSendStandby;
      end;
      con_CheckDataBasePasswordPermitSendStandby : begin
        LoadPasswordPermitSendStandby;
        if G_nMonitoringType = 1 then   //�бⱹ���̸�
           L_nDataBaseCheckStep := con_CheckDataBaseReaderTelNumberChange
        else L_nDataBaseCheckStep := con_CheckDataBaseNodeServerChange;
      end;
      con_CheckDataBaseReaderTelNumberChange : begin
        LoadReaderTelNumberChangeData;
        L_nDataBaseCheckStep := con_CheckDataBaseNodeServerChange;
      end;
      con_CheckDataBaseNodeServerChange : begin
        LoadNodeServerChangeData;  //������ ����� ��� ���� �������� ��带 ���� ����
        L_nDataBaseCheckStep := con_CheckDataBaseDeviceChange;
      end;
      con_CheckDataBaseDeviceChange : begin
        LoadDeviceChangeData;  //��Ʈ�ѷ��� ���� �� ��� ��Ʈ�ѷ��� �� �ε� ����.
        L_nDataBaseCheckStep := con_CheckDataBaseNodeMemLoadChange;
      end;
      con_CheckDataBaseNodeMemLoadChange : begin
        LoadNodeMemLoadChangeData; //ip ���� �Ǵ� �߰� �� ��� ��带 �߰� ����.
        L_nDataBaseCheckStep := con_CheckDataBaseDeviceArmAreaUseChange;
      end;
      con_CheckDataBaseDeviceArmAreaUseChange : begin
        LoadDeviceArmAreaUseChangeData; //�������������� ����� ���� ������ ������ �˷� ����.
        L_nDataBaseCheckStep := con_CheckDataBaseCardFTPChange;
      end;
      con_CheckDataBaseCardFTPChange : begin
        LoadCardFTPChangeData;  //FTP ���� ī�� ������ Ȯ�� �Ͽ� ������ �˷� ����
        if G_nMonitoringType = 1 then L_nDataBaseCheckStep := con_CheckDataBaseDoorMemLoadChange
        else L_nDataBaseCheckStep := con_CheckDataBaseHoliday;
      end;
    end;

  Finally
    DataBaseChangeCheckTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

procedure TfmMain.DecoderToServerPacket(Sender: TObject; aTxRxType, aPCIP,
  aPacketData: string);
var
  fmTemp : TForm;
begin
  //
  if G_bFormEnabled[conFORMPCCOMMONITORING] then
  begin
    fmTemp := MDIForm('TfmPCComMonitoring');
    if fmTemp <> nil then TfmPCComMonitoring(fmTemp).MonitorPacket(aTxRxType,aPCIP,aPacketData);
  end;
end;

function TfmMain.DoorSchedule_UseChangeSend: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDOORNO : string;
  stSendData : string;
begin
  result := -1;

  Try
    stSql := 'SELECT top 1 a.* ';
    stSql := stSql + ' FROM TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_DOORRCV b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    stSql := stSql + ' INNER JOIN TB_NODE c ';
    stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND c.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' WHERE b.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND b.DO_DOORSCHUSE = ''N'' ' ;
    stSql := stSql + ' AND b.DO_SETTINGINFO = ''Y'' ';

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        //Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DoorScheduleSend');
          Exit;
        End;

        if RecordCount < 1 then Exit;
        stNodeNo := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength);
        stEcuID := FindField('DE_ECUID').AsString;
        stExtendID := '0'; //FindField('DE_EXTENDID').AsString;
        stDOORNO := FillZeroNumber(FindField('DO_DOORNO').AsInteger,G_nDoorCodeLength);

        stSendData := stNodeNo + stEcuID + stExtendID + stDOORNO;
        if Not FindField('DO_DOORUSE').IsNull then
          stSendData := stSendData + FindField('DO_DOORUSE').AsString[1]  //1�ڸ�
        else stSendData := stSendData + '0';
(*
        if Not FindField('DO_DOORTYPE').IsNull then
          stSendData := stSendData + FindField('DO_DOORTYPE').AsString[1]  //1�ڸ� (�������/���+����/��������)
        else stSendData := stSendData + '0';
*)
        stSendData := stSendData + FillCharstring(FindField('DO_CONTROLTIME').AsString,' ',10);  //10�ڸ�
        stSendData := stSendData + FillCharstring(FindField('DO_LONGOPENTIME').AsString,' ',10);  //10�ڸ�
        if Not FindField('DO_LONGOPENALARM').IsNull then
          stSendData := stSendData + FindField('DO_LONGOPENALARM').AsString[1]  //1�ڸ�
        else stSendData := stSendData + '0';
        if Not FindField('DO_SCHEDULEUSE').IsNull then
          stSendData := stSendData + FindField('DO_SCHEDULEUSE').AsString[1]  //1�ڸ� ������ �������
        else stSendData := stSendData + '0';
        if Not FindField('DO_DOORSTATE').IsNull then
          stSendData := stSendData + FindField('DO_DOORSTATE').AsString[1]  //1�ڸ� ���Թ� ��������
        else stSendData := stSendData + '1';
        stSendData := stSendData + FillZeroNumber(FindField('AG_ANTINO').AsInteger,2); //2�ڸ� ��Ƽ�н� ������� �� �׷��ȣ
        if Not FindField('DO_LOCKTYPE').IsNull then
          stSendData := stSendData + FindField('DO_LOCKTYPE').AsString[1]  //1�ڸ� ��Ÿ��
        else stSendData := stSendData + '1';
        if Not FindField('DO_FIREDOOROPEN').IsNull then
          stSendData := stSendData + FindField('DO_FIREDOOROPEN').AsString[1]  //1�ڸ� ȭ��� ���Թ�����
        else stSendData := stSendData + '0';
        if Not FindField('DO_DSOPENSTATE').IsNull then
          stSendData := stSendData + FindField('DO_DSOPENSTATE').AsString[1]  //1�ڸ� ���Թ���������
        else stSendData := stSendData + '0';
        if Not FindField('DO_REMOTEDISARMDOOROPEN').IsNull then
          stSendData := stSendData + FindField('DO_REMOTEDISARMDOOROPEN').AsString[1]  //1�ڸ� ���������� ���Թ� ����
        else stSendData := stSendData + '0';


        stSendData := inttostr(con_cmdManagerToServerDoorSettingRegist) + DATADELIMITER + stSendData + DATADELIMITER;
        if SendControlMessageList.indexOf(stSendData) < 0 then
          SendControlMessageList.Add(stSendData);

        dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('DO_DOORNO').AsString,'DO_DOORSCHUSE','S'); //�غ� ���·� ���� �ϰ� �ٽ� ������ ����...

        result := 1;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DoorSchedule_UseChangeSend');
  End;
end;

function TfmMain.DoorSettingInfo_Search: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stNodeNo : string;
  stEcuID : string;
  stExtendID : string;
  stDOORNO : string;
  stSendData : string;
begin
  result := -1;

  Try
    stSql := 'SELECT top 1 a.* ';
    stSql := stSql + ' FROM TB_DOOR a ';
    stSql := stSql + ' Inner Join TB_DOORRCV b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    stSql := stSql + ' INNER JOIN TB_NODE c ';
    stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = c.ND_NODENO ';
    stSql := stSql + ' AND c.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND b.DO_DOORSCHUSE = ''N'' ' ;
    stSql := stSql + ' AND (b.DO_SETTINGINFO = ''N'' OR b.DO_SETTINGINFO is NULL) ';

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;

      with TempAdoQuery do
      begin
        Close;
        //Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DoorScheduleSend');
          Exit;
        End;

        if RecordCount < 1 then Exit;
        stNodeNo := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength);
        stEcuID := FindField('DE_ECUID').AsString;
        stExtendID := FindField('DE_EXTENDID').AsString;
        stDOORNO := FillZeroNumber(FindField('DO_DOORNO').AsInteger,G_nDoorCodeLength);

        stSendData := stNodeNo + stEcuID + stExtendID + stDOORNO;
        if Not FindField('DO_DOORUSE').IsNull then
          stSendData := stSendData + FindField('DO_DOORUSE').AsString[1]  //1�ڸ�
        else stSendData := stSendData + '0';
        stSendData := inttostr(con_cmdManagerToServerDoorSettingSearch) + DATADELIMITER + stSendData + DATADELIMITER;
        if SendControlMessageList.indexOf(stSendData) < 0 then
          SendControlMessageList.Add(stSendData);

        dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('DO_DOORNO').AsString,'DO_SETTINGINFO','R'); //�غ� ���·� ���� �ϰ� �ٽ� ������ ����...

        result := 1;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','DoorSettingInfo_Search');
  End;
end;

function TfmMain.FileToDBInsertAlarmEvent(aFileName: string): Boolean;
var
  AlarmEventList : TStringList;
  stTemp : string;
  stNodeNo : string;
  stEcuID : string;
  stCmd : string;
  stMsgNo : string;
  stTime : string;
  stSubCLass : string;
  stSubAddr : string;
  stArmArea : string;
  stMode : string;
  stAlarmStateCode : string;
  stLoop : string;
  stZoneState : string;
  stAlarmStatePCCode : string;
  stArmModeChange : string;
  stAlarmView : string;
  stAlarmSound : string;
  stAlarmColor : string;
  stInsertTime : string;
  stOperater : string;
  stExtendID : string;
  stSendEventData : string;
  stAlarmEvent : string;
  stAlarmStateCodeName : string;
  stAlarmStatePCCodeName : string;
  i : integer;
begin
  result := False;
  Try
    AlarmEventList := TStringList.Create;
    AlarmEventList.LoadFromFile(aFileName);
    if AlarmEventList.Count > 0 then
    begin
      Try
        for i := 0 to AlarmEventList.Count - 1 do
        begin
          stAlarmEvent := AlarmEventList.Strings[i];
          stTemp := stAlarmEvent ;
  (*        stNodeNo := copy(stTemp,1,G_nNodeCodeLength);
          stEcuID := copy(stTemp,1 + G_nNodeCodeLength,2);
          stCmd := stTemp[1 + G_nNodeCodeLength + 2];
          stMsgNo := stTemp[1 + G_nNodeCodeLength + 3];
          stTime := copy(stTemp,1 + G_nNodeCodeLength + 4,14);
          stSubCLass := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14,2);
          stSubAddr := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14 + 2,2);
          stArmArea := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 2];
          stMode := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 3];
          stAlarmStateCode := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14 + 2 + 4,2);
          stLoop := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2];
          stZoneState := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1];
          stAlarmStatePCCode := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1,8);
          stArmModeChange := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 8];
          stAlarmView := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 9];
          stAlarmSound := stTemp[1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 10];
          stAlarmColor := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 11,10);
          stInsertTime := copy(stTemp,1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 11 + 10,17);
          Delete(stTemp,1,1 + G_nNodeCodeLength + 4 + 14 + 2 + 4 + 2 + 1 + 1 + 11 + 10 + 16 );
          stOperater := stTemp;
  *)
  //00001
          stNodeNo := copy(stTemp,1,G_nNodeCodeLength);
  //00
          stEcuID := copy(stTemp,1 + G_nNodeCodeLength,2);
          Delete(stTemp,1,G_nNodeCodeLength + 2);
  //0
          stExtendID := stTemp[1];
          Delete(stTemp,1,1);
  //A
          stCmd := stTemp[1];
          Delete(stTemp,1,1);
  //0
          stMsgNo := stTemp[1];
          Delete(stTemp,1,1);
  //20150707113305
          stTime := copy(stTemp,1,14);
          Delete(stTemp,1,14);
  //MN
          stSubCLass := copy(stTemp,1,2);
          Delete(stTemp,1,2);
  //00
          stSubAddr := copy(stTemp,1,2);
          Delete(stTemp,1,2);
  //00
          stArmArea := copy(stTemp,1,2);
          Delete(stTemp,1,2);
  //n
          stMode := copy(stTemp,1,1);
          Delete(stTemp,1,1);
  //MN0NR0000*,****************,��ź���,MN0NR000,����ġ ��Ŵܼ�����,0,1,0,16777215
          stAlarmStateCode := copy(stTemp,1,2);
          Delete(stTemp,1,2);
          stLoop := copy(stTemp,1,2);
          if isDigit(stLoop) then stLoop := inttostr(strtoint(stLoop))
          else stLoop := '0';
          Delete(stTemp,1,2);
          stZoneState := copy(stTemp,1,1);
          Delete(stTemp,1,1);
          Delete(stTemp,1,1); //',' ����
          stOperater := FindCharCopy(stTemp,0,',');
          stAlarmStateCodeName := FindCharCopy(stTemp,1,',');
          stAlarmStatePCCode := FindCharCopy(stTemp,2,',');
  //        stAlarmStatePCCodeName := FindCharCopy(stTemp,3,',');
          stArmModeChange := FindCharCopy(stTemp,4,',');

          if Not dmDBFunction.GetTB_ALARMEVENTSTATEPCCODE_State(stAlarmStatePCCode,stAlarmStatePCCodeName,stAlarmView,stAlarmSound,stAlarmColor) then
          begin
            stAlarmView := FindCharCopy(stTemp,5,',');
            stAlarmSound := FindCharCopy(stTemp,6,',');
            stAlarmColor := FindCharCopy(stTemp,7,',');
          end else
          begin
            stAlarmEvent := stNodeNo + stEcuID + stExtendID[1] + stCmd[1] + stMsgNo[1] + stTime + stSubCLass + stSubAddr +
                         stArmArea + stMode + stAlarmStateCode + FillZeroStrNum(stLoop,2,True) +
                         stZoneState + ',' + stOperater + ',' + stAlarmStateCodeName + ',' + stAlarmStatePCCode + ',' + stAlarmStatePCCodeName + ',' + stArmModeChange + ',' + stAlarmView + ',' +
                         stAlarmSound + ',' + stAlarmColor;
          end;



          if stSubCLass = 'EL' then
          begin
            if isDigit(stSubAddr) then stExtendID := inttostr(strtoint(stSubAddr));
          end;
          Try
            if dmDBFunction.CheckTB_ALARMEVENT_Value(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,stExtendID, stMsgNo) = 0 then
            begin
              if Not dmDBInsert.InsertIntoTB_ALARMEVENT_All(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,
                stExtendID, stMsgNo, stSubCLass, stSubAddr, stArmArea, stMode, stLoop,
                stZoneState, stAlarmStateCode, stAlarmStatePCCode, stOperater,stArmModeChange,
                stAlarmView,stAlarmSound,stAlarmColor,FormatDateTime('yyyymmddhhnnsszzz',now)) then
              begin
                LogSave(G_stLogDirectory + '\AlarmEvent'+FormatDateTime('yyyymmdd',now) + '.log',AlarmEventList.Strings[i]);
              end else
              begin
                stSendEventData := inttostr(con_cmdManagerToServerAlarmEvent) + DATADELIMITER ;
                stSendEventData := stSendEventData + stAlarmEvent + DATADELIMITER ;

                SendEventMessageList.Add(stSendEventData);
              end;
            end;

            if (stEcuID = '00') and ( (stAlarmStateCode='NF') or (stAlarmStateCode = 'NR')) then
            begin
              dmDBUpdate.UpdateTB_NODE_Field_StringValue(stNodeNo,'ND_LASTNETSTATE',stAlarmStateCode);
              dmDBUpdate.UpdateTB_NODE_Field_StringValue(stNodeNo,'ND_LASTNETTIME',FormatDateTime('yyyymmddhhnnss',now));
  //            dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stECUID,'0','1','DO_NETSTAT',stAlarmStateCode); //����� NETSTATE Ȯ���ϸ� �ȴ�
            end;
            if (stAlarmStateCode = G_stLongTimeStateCode) OR (stAlarmStateCode = G_stLongTimeRecoveryCode) then
            begin
              dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stECUID,'0',stSubAddr[2],'DO_LTSTATE',stAlarmStateCode);
              dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stSubAddr[2],'DO_LASTLDTIME',FormatDateTime('yyyymmddhhnnss',now));
            end;

          Except
            LogSave(G_stLogDirectory + '\AlarmEvent'+FormatDateTime('yyyymmdd',now) + '.log',AlarmEventList.Strings[i]);
            Exit;
          End;
          Application.ProcessMessages;
        end;
      Except
        DeleteFile(aFileName);
      End;
      result := True;
    end;
  Finally
    AlarmEventList.Free;
  End;

end;

function TfmMain.FileToDBInsertCardAccessEvent(aFileName: string): Boolean;
var
  CardEventList : TStringList;
  i : integer;
  stCardAccessEvent : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stReaderNo : string;
  stInOut : string;
  stTime : string;
  stCardMode : string;
  stDoorMode : string;
  stChangeState : string;
  stAccessResult : string;
  stDoorState : string;
  stATButton : string;
  stCardNo : string;
  stType : string;
  stArmAreaNo : string;
  stCompanyCode,stCompanyName,stEmSeq,stEmCode, stEmName,stPosiCode,stPosiName,stATUse,stFDUse,stPrintNo,stHandPhone : UnicodeString;
  stATCheck,stFDCheck : string;
  bResult : Boolean;
  nResult : integer;
  stSendData : string;
  stSendEventData : string;
  nIndex : integer;
  stCardPermit : string;
  stInsertCardNo : string;
begin

  result := False;
  if G_bApplicationTerminate then Exit;

  Try
    CardEventList := TStringList.Create;
    CardEventList.LoadFromFile(aFileName);
    if CardEventList.Count > 0 then
    begin
      bResult := True;
      for i := 0 to CardEventList.Count - 1 do
      begin
        if G_bApplicationTerminate then
        begin
          bResult := False;
          Exit;
        end;

        Try
          stCardAccessEvent := CardEventList.Strings[i];
          if stCardAccessEvent = '' then continue;
          stCompanyCode:='';
          stCompanyName:='';
          stEmSeq:='';
          stEmCode:='';
          stEmName:='';
          stPosiCode:='';
          stPosiName:='';
          stATUse:='';
          stFDUse:='';
          stPrintNo:='';
          stHandPhone:='';

          stNodeNo := copy(stCardAccessEvent,1,G_nNodeCodeLength);
          stEcuID := copy(stCardAccessEvent,1 + G_nNodeCodeLength,2);
          stDoorNo := stCardAccessEvent[1 + G_nNodeCodeLength + 2];
          stReaderNo := stCardAccessEvent[1 + G_nNodeCodeLength + 3];
          stInOut := stCardAccessEvent[1 + G_nNodeCodeLength + 4];
          stTime := copy(stCardAccessEvent,1 + G_nNodeCodeLength + 5,14);
          stCardMode := stCardAccessEvent[1 + G_nNodeCodeLength + 5 + 14];
          stDoorMode := stCardAccessEvent[1 + G_nNodeCodeLength + 5 + 15];
          stChangeState := stCardAccessEvent[1 + G_nNodeCodeLength + 5 + 16];
          stAccessResult := stCardAccessEvent[1 + G_nNodeCodeLength + 5 + 17];
          stDoorState := stCardAccessEvent[1 + G_nNodeCodeLength + 5 + 18];
          stATButton := stCardAccessEvent[1 + G_nNodeCodeLength + 5 + 19];
          stCardNo := copy(stCardAccessEvent,1 + G_nNodeCodeLength + 5 + 20,16);
          stType := stCardAccessEvent[1 + G_nNodeCodeLength + 5 + 20 + 16];
          stArmAreaNo := stCardAccessEvent[1 + G_nNodeCodeLength + 5 + 20 + 17];
          if stChangeState = 'C' then //ī���Է��� ���
          begin
             if Not GetEmInfoFromCardNo(stCardNo,copy(stTime,1,8),G_nMonitoringType,stCompanyCode,stCompanyName,stEmSeq,stEmCode, stEmName,stPosiCode,stPosiName,stATUse,stFDUse,stPrintNo,stHandPhone) then
             begin
                if G_nMonitoringType = 1 then GetEmInfoFromCardNo(stCardNo,copy(stTime,1,8),0,stCompanyCode,stCompanyName,stEmSeq,stEmCode, stEmName,stPosiCode,stPosiName,stATUse,stFDUse,stPrintNo,stHandPhone); //�бⱹ�翡�� �Ϸù�ȣ�� �� ã���� ī���ȣ�� ã��.
             end;
          end
          else stEmName := ' ';
          if stEmSeq = '' then stEmSeq := '0';
          //if stATUse = '1' then stATCheck := 'N'
          //else stATCheck := 'Y';
          stATCheck := 'N';
          //if stFDUse = '1' then stFDCheck := 'N'
          //else stFDCheck := 'Y';
          stFDCheck := 'N';// ���� �ļ� ���α׷����� �۾� ����.

          stInsertCardNo := stCardNo;
          if (stChangeState = 'P') OR (stChangeState = 'R') then  //��ȭ��й�ȣ �� ���������ΰ��
          begin
            if stChangeState = 'P' then
            begin
              stInsertCardNo := copy(stInsertCardNo,1,8);
              stInsertCardNo := inttostr(Hex2Dec(stInsertCardNo));
            end else
            begin
              stInsertCardNo := 'Remote';
            end;

            //���⿡�� DoorTelEvent���̺��� �μ�Ʈ ����.
            if dmDBFunction.CheckTB_DOORTELEVENT_Key(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0', stDoorNo) = 0 then
            begin
              dmDBInsert.InsertIntoTB_DOORTELEVENT_Password(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0', stDoorNo,stInsertCardNo);
            end else
            begin
              dmDBUpdate.UpdateTB_DOORTELEVENT_Field_StringValue(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0', stDoorNo,'DE_PASSWORD',stInsertCardNo);
            end;
          end;

          if dmDBFunction.CheckTB_ACCESSEVENT(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0', stDoorNo, stInsertCardNo) = 0 then
          begin
            if Not dmDBInsert.InsertIntoTB_ACCESSEVENT_All(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0', stDoorNo, stInsertCardNo, stReaderNo, stATButton, stInOut,'', stChangeState, stDoorMode, stCardMode, stAccessResult,
              stArmAreaNo, stCompanyCode, stEmSeq,stEmCode, stEmName, 'SYSTEM',FormatDateTime('yyyymmddhhnnsszzz',now),stATCheck,stFDCheck,stPrintNo) then
            begin
              bResult := False;
              sb_Status.Panels[2].Text :=  'InsertIntoTB_ACCESSEVENT_All Fail...';
              LogSave(G_stLogDirectory + '\CardAccessEvent'+ FormatDateTime('yyyymmdd',now) + '.log',CardEventList.Strings[i]);
            end else
            begin
              (*
              stSendEventData := inttostr(con_cmdManagerToServerAccessEvent) + DATADELIMITER ;
              stSendEventData := stSendEventData + AnsiString(stCardAccessEvent) + DATADELIMITER ;
              stSendEventData := stSendEventData + AnsiString(stCompanyCode) + DATADELIMITER ;
              stSendEventData := stSendEventData + AnsiString(stCompanyName) + DATADELIMITER ;
              stSendEventData := stSendEventData + AnsiString(stEmSeq) + DATADELIMITER ;
              stSendEventData := stSendEventData + AnsiString(stEmCode) + DATADELIMITER ;
              stSendEventData := stSendEventData + AnsiString(stEmName) + DATADELIMITER ;
              stSendEventData := stSendEventData + AnsiString(stPosiCode) + DATADELIMITER ;
              stSendEventData := stSendEventData + AnsiString(stPosiName) + DATADELIMITER ;
              stSendEventData := stSendEventData + AnsiString(stPrintNo) + DATADELIMITER ;
              stSendEventData := stSendEventData + AnsiString(stHandPhone) + DATADELIMITER ;
              *)
              stSendEventData := inttostr(con_cmdManagerToServerAccessEvent) + DATADELIMITER ;
              stSendEventData := stSendEventData + stCardAccessEvent + DATADELIMITER ;
              stSendEventData := stSendEventData + stCompanyCode + DATADELIMITER ;
              stSendEventData := stSendEventData + stCompanyName + DATADELIMITER ;
              stSendEventData := stSendEventData + stEmSeq + DATADELIMITER ;
              stSendEventData := stSendEventData + stEmCode + DATADELIMITER ;
              stSendEventData := stSendEventData + stEmName + DATADELIMITER ;
              stSendEventData := stSendEventData + stPosiCode + DATADELIMITER ;
              stSendEventData := stSendEventData + stPosiName + DATADELIMITER ;
              stSendEventData := stSendEventData + stPrintNo + DATADELIMITER ;
              stSendEventData := stSendEventData + stHandPhone + DATADELIMITER ;

              SendEventMessageList.Add(stSendEventData);

              if dmDBFunction.CheckTB_ACCESSEVENT(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0', stDoorNo, stInsertCardNo) <> 1 then bResult := False;    //������ ������ �Է� ����
            end;

            if isDigit(stAccessResult) and ((stChangeState = 'C') or (stChangeState = 'P')) then
            begin
              dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stECUID,'0',stDoorNo,'DO_LASTACCESSTIME',stTime);   //���� ���� �ð�
              dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stECUID,'0',stDoorNo,'DO_LASTACCESSCARD',stInsertCardNo);   //���� ���� ī���ȣ ���
            end;
          end;
          if (G_nVisitUse = 1) and (stCompanyCode = G_stVisitCode) then
          begin
            //�湮���̷� ���̺��� �Է�
            dmDBInsert.InsertIntoTB_GUESTEVENT_Value(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0', stDoorNo, stInsertCardNo, stReaderNo, stATButton, stInOut,'', stChangeState, stDoorMode, stCardMode, stAccessResult,
              stArmAreaNo,FormatDateTime('yyyymmdd',now),stEmCode);
          end;

          if G_bCardButtonEventStatictcs and isDigit(stAccessResult) then    //���Խ����� �� ��츸 ��� ����
          begin
            if dmDBFunction.CheckTB_CARDBUTTONEVENTSTAT(copy(stTime,1,8),stNodeNo,stEcuID,'0',stDoorNo) <> 1 then
            begin
              dmDBInsert.InsertIntoTB_CARDBUTTONEVENTSTAT_Init(copy(stTime,1,8),stNodeNo,stEcuID,'0',stDoorNo);
            end;

            if stChangeState = 'B' then
            begin
              dmDBUpdate.UpdateTB_CARDBUTTONEVENTSTAT_Field_CountAdd(copy(stTime,1,8),stNodeNo,stEcuID,'0',stDoorNo,'CB_BUTTONEVENT');
            end else if stChangeState = 'C' then
            begin
              dmDBUpdate.UpdateTB_CARDBUTTONEVENTSTAT_Field_CountAdd(copy(stTime,1,8),stNodeNo,stEcuID,'0',stDoorNo,'CB_CARDEVENT');
            end else if stChangeState = 'P' then
            begin
              dmDBUpdate.UpdateTB_CARDBUTTONEVENTSTAT_Field_CountAdd(copy(stTime,1,8),stNodeNo,stEcuID,'0',stDoorNo,'CB_TELEVENT');
            end else if stChangeState = 'R' then
            begin
              dmDBUpdate.UpdateTB_CARDBUTTONEVENTSTAT_Field_CountAdd(copy(stTime,1,8),stNodeNo,stEcuID,'0',stDoorNo,'CB_REMOTEEVENT');
            end else if stChangeState = 'S' then
            begin
              dmDBUpdate.UpdateTB_CARDBUTTONEVENTSTAT_Field_CountAdd(copy(stTime,1,8),stNodeNo,stEcuID,'0',stDoorNo,'CB_SCHEDULEEVENT');
            end else if UpperCase(stChangeState) = 'F' then
            begin
              dmDBUpdate.UpdateTB_CARDBUTTONEVENTSTAT_Field_CountAdd(copy(stTime,1,8),stNodeNo,stEcuID,'0',stDoorNo,'CB_FIREEVENT');
            end else
            begin
              dmDBUpdate.UpdateTB_CARDBUTTONEVENTSTAT_Field_CountAdd(copy(stTime,1,8),stNodeNo,stEcuID,'0',stDoorNo,'CB_ETCEVENT');
            end;
          end;

          if (stChangeState = 'C') OR (stChangeState = 'P') then
          begin
            nResult := CheckDeviceCardGrade(stNodeNo,stECUID,'0',stDoorNo,stArmAreaNo,stCardNo,stAccessResult,stTime);
            if nResult = -1  then
            begin
              if stChangeState = 'P' then LoadPasswordPermit(stNodeNo,stECUID,stCardNo)
              //ī�� �ε��� �ȵ� ���
              else
              begin
                if LoadCardPermit(stNodeNo,stECUID,stCardNo) = -1 then continue; //���� �ε��� ���� �ϸ�
              end;
              //ī�� �ε� �� �ٽ� ���� üũ ����.
              nResult := CheckDeviceCardGrade(stNodeNo,stECUID,'0',stDoorNo,stArmAreaNo,stCardNo,stAccessResult,stTime);
            end;
            if G_bCardSync  and (nResult = -1) then  //������ ���� ���
            begin
              if isDigit(stAccessResult) then
              begin
                //���⼭ ������ ����...
                stSendData := stNodeNo + stEcuID + stCardNo;
                stSendData := stSendData + '00000';  //5�ڸ�
                stSendData := stSendData + '0';  //1�ڸ�
                stSendData := stSendData + '00000000';  //8�ڸ�
                stSendData := stSendData + '000000000';  //9�ڸ�
                stSendData := stSendData + '00000000';  //8�ڸ�
                stSendData := stSendData + '00000000';  //8�ڸ�
                stSendData := stSendData + '0';  //1�ڸ�
                stSendData := stSendData + '0000';  //4�ڸ�
                stSendData := stSendData + '0';  //1�ڸ�
                stSendData := stSendData + '0000000';  //7�ڸ�
                stSendData := stSendData + '0';  //1�ڸ�
                stSendData := inttostr(con_cmdManagerToServerCardSend) + DATADELIMITER + stSendData + DATADELIMITER;
   //(* TEST������ ���� ���� ������
                if Not G_bDebug then
                begin
                  if SendControlMessageList.indexOf(stSendData) < 0 then
                     SendControlMessageList.Add(stSendData);
                end;
   //*)
              end;
            end else if G_bCardSync  and (nResult = 0) then  // ����ȭ ���� �ϸ鼭 ������ Ʋ�����
            begin
              (*  ������ �� �� ���ӽ� ��� ������ �߻� ����� ���� ������
              if Not isDigit(stAccessResult) and (stCardPermit = '1') then   //�̽����ε� ���Ա��� �ִ� ���
              begin
                stSendData := stNodeNo + stEcuID + '0' + stDoorNo;
                stSendData := inttostr(con_cmdManagerToServerDoorOpen) + DATADELIMITER + stSendData + DATADELIMITER; //���Թ� ���� ����
                if SendControlMessageList.indexOf(stSendData) < 0 then
                  SendControlMessageList.Add(stSendData);
              end;
              *)

              //���⿡�� ���� ������ ��Ŷ �����Ͽ� Server �� ��������.
                nIndex := CardNodeList.IndexOf(stNodeNo);
                if nIndex > -1 then
                begin
                  stSendData := stNodeNo + stEcuID + stCardNo;
                  stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardPositionNum(stEcuID,stCardNo);  //5�ڸ�
                  stCardPermit := TvNodeCard(CardNodeList.Objects[nIndex]).GetCardPermit(stEcuID,stCardNo);
                  if stCardPermit = '' then continue;
                  stSendData := stSendData + stCardPermit;  //1�ڸ�
                  stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardDoorPermit(stEcuID,stCardNo),'0',8);  //8�ڸ�
                  stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardArmAreaPermit(stEcuID,stCardNo),'0',9);  //9�ڸ�
                  stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardStartDate(stEcuID,stCardNo),'0',8,True);  //8�ڸ�
                  stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardEndDate(stEcuID,stCardNo),'0',8,True);  //8�ڸ�
                  stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardTimeCodeUse(stEcuID,stCardNo);  //1�ڸ�
                  stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardTimeCode(stEcuID,stCardNo),'0',4,True);  //4�ڸ�
                  stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardTimeGroup(stEcuID,stCardNo);  //1�ڸ�
                  stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardWeekCode(stEcuID,stCardNo),'0',7,True);  //7�ڸ�
                  stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardEMState(stEcuID,stCardNo);  //1�ڸ�

                  stSendData := inttostr(con_cmdManagerToServerCardSend) + DATADELIMITER + stSendData + DATADELIMITER;
   //(* TEST������ ���� ���� ������
                  if Not G_bDebug then
                  begin
                      if SendControlMessageList.indexOf(stSendData) < 0 then SendControlMessageList.Add(stSendData);
                  end;
   //*)
                end;
            end;
          end;
        Except
          bResult := False;
          sb_Status.Panels[2].Text :=  'InsertIntoTB_ACCESSEVENT_All Except Fail...';
          LogSave(G_stLogDirectory + '\CardAccessEvent'+FormatDateTime('yyyymmdd',now) + '.log',CardEventList.Strings[i]);
          continue;
        End;

        Application.ProcessMessages;
      end;
    end else
    begin
      bResult := True;
    end;
    CardEventList.Clear;
    result := bResult;
  Finally
    CardEventList.Free;
  End;
end;

function TfmMain.FileToDBInsertCardRcvAckEvent(aFileName: string): Boolean;
var
  CardRcvAckEventList : TStringList;
  i : integer;
  stNodeNo : string;
  stEcuID : string;
  stCardNo : string;
  stPermit : string;
  stTemp : string;
begin
  result := False;
  if G_bApplicationTerminate then Exit;
  Try
    CardRcvAckEventList := TStringList.Create;
    CardRcvAckEventList.LoadFromFile(aFileName);
    if CardRcvAckEventList.Count > 0 then
    begin
      for i := 0 to CardRcvAckEventList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;

        Try
          stTemp := CardRcvAckEventList.Strings[i];
          if stTemp = '' then continue;

          stNodeNo := copy(stTemp,1,G_nNodeCodeLength);
          stEcuID := copy(stTemp,1 + G_nNodeCodeLength,2);
          stCardNo := copy(stTemp,1 + G_nNodeCodeLength + 2,G_nCardLength);
          stPermit := copy(stTemp,1 + G_nNodeCodeLength + 2 + G_nCardLength,1);
          if Not isDigit(stNodeNo) then Exit;

          dmDBUpdate.UpdateTB_CARDPERMIT_CARDRCVACKSUSCECCESS(stNodeNo,stEcuID,'0',stCardNo,'Y');

          if stPermit='0' then   //������ ������ ��쿡�� �������̺����� ���� ����.
          begin
            dmDBDelete.DeleteTB_CARDPERMIT_CARDRCVACKSUCESSECSS(stNodeNo,stEcuID,'0',stCardNo);
          end;

        Except
          Exit;
        End;
        Application.ProcessMessages;
      end;
    end;
    CardRcvAckEventList.Clear;
    result := True;
  Finally
    CardRcvAckEventList.Free;
  End;
end;

function TfmMain.FileToDBInsertDeviceRegEvent(aFileName: string): Boolean;
var
  RegEventList : TStringList;
  bResult : Boolean;
  i : integer;
  stRegEvent : string;
  stNodeNo : string;
  stEcuID : string;
  msgCode: Char;
begin
  result := False;
  if G_bApplicationTerminate then Exit;

  Try
    RegEventList := TStringList.Create;
    RegEventList.LoadFromFile(aFileName);
    if RegEventList.Count > 0 then
    begin
      bResult := True;
      for i := 0 to RegEventList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;

        Try
          stRegEvent := RegEventList.Strings[i];
          if stRegEvent = '' then continue;
          stNodeNo := copy(stRegEvent,1,G_nNodeCodeLength);
          Delete(stRegEvent,1,G_nNodeCodeLength);
          stEcuID := copy(stRegEvent,1,2);
          Delete(stRegEvent,1,2);
          msgCode := stRegEvent[1];

          case msgCode of
            'a','g': begin  //���Թ� ���� ���� ���
              bResult := ReceiveDoorSettingInformtion(stNodeNo,stEcuID,msgCode,stRegEvent);
            end;
            'b' : begin     //���Թ� ���� ��ȸ
              bResult := ReceiveDoorSettingInformtion(stNodeNo,stEcuID,msgCode,stRegEvent);
            end;
            'q' : begin    //���ϵ�� ����
              bResult := ReceiveDoorHolidayRegist(stNodeNo,stEcuID,msgCode,stRegEvent);
            end;
            's' : begin   //������ ������ ��� ���� �� �������� ���� ó�� ����... �ڵ庰�� ������ �ؾ� �ϴ� �κ� �߻�
              //bResult := ReceiveDoorScheduleRegist(stNodeNo,stEcuID,msgCode,stRegEvent);
              bResult := True;
            end;
            't','u': begin                     // Ÿ���ڵ� ���� �� �������� ���� ó�� ����... �ڵ庰�� ������ �ؾ� �ϴ� �κ� �߻�
              //bResult := RcvDeviceTimeCodeRegProcess(stNodeNo,stEcuID,msgCode,stRegEvent);
              bResult := True;
            end;
          end;

        Finally

        End;
      end;
    end;
    result := bResult;
  Finally
    RegEventList.Free;
  End;

end;

function TfmMain.FileToDBInsertDoorStateEvent(aFileName: string): Boolean;
var
  DoorStateEventList : TStringList;
  i : integer;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stReaderNo : string;
  stTime : string;
  stDoorStateEvent : string;
  stTemp : string;
begin
  result := False;
  if G_bApplicationTerminate then Exit;
  Try
    DoorStateEventList := TStringList.Create;
    DoorStateEventList.LoadFromFile(aFileName);
    if DoorStateEventList.Count > 0 then
    begin
      for i := 0 to DoorStateEventList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;

        Try
          stDoorStateEvent := DoorStateEventList.Strings[i];
          if stDoorStateEvent = '' then continue;

          stNodeNo := copy(stDoorStateEvent,1,G_nNodeCodeLength);
          stEcuID := copy(stDoorStateEvent,1 + G_nNodeCodeLength,2);
          stDoorNo := stDoorStateEvent[1 + G_nNodeCodeLength + 2];
          stTime := copy(stDoorStateEvent,1 + G_nNodeCodeLength + 3,14);

          stTemp := stDoorStateEvent[1 + G_nNodeCodeLength + 3 + 14];
          if stTemp <> '' then
          begin
            if dmDBFunction.CheckTB_DOORSTATEEVENT_Key(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0',stDoorNo) = 0 then
            begin
              if Not dmDBInsert.InsertIntoTB_DOORSTATEEVENT_Value(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,
                '0',stDoorNo,stTemp,FormatDateTime('yyyymmddhhnnss',now)) then
              begin
                LogSave(G_stLogDirectory + '\DOORDS'+FormatDateTime('yyyymmdd',now) + '.log',DoorStateEventList.Strings[i]);
              end;
            end;
            dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stECUID,'0',stDoorNo,'DO_DOOROPENSTATE',stTemp[1]);
            if stTemp = 'O' then dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stECUID,'0',stDoorNo,'DO_DOTIME',FormatDateTime('yyyymmddhhnnss',now));
          end;
        Except
          Exit;
        End;
        Application.ProcessMessages;
      end;
    end;
    DoorStateEventList.Clear;
    result := True;
  Finally
    DoorStateEventList.Free;
  End;
end;

function TfmMain.FileToDBInsertTelAccessEvent(aFileName: string): Boolean;
var
  TelEventList : TStringList;
  i : integer;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stReaderNo : string;
  stTime : string;
  stTelNumber : string;
  stTelAccessEvent : string;
  stTemp : string;
begin
  result := False;
  if G_bApplicationTerminate then Exit;
  Try
    TelEventList := TStringList.Create;
    TelEventList.LoadFromFile(aFileName);
    if TelEventList.Count > 0 then
    begin
      for i := 0 to TelEventList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;

        Try
          stTelAccessEvent := TelEventList.Strings[i];
          if stTelAccessEvent = '' then continue;

          stNodeNo := copy(stTelAccessEvent,1,G_nNodeCodeLength);
          stEcuID := copy(stTelAccessEvent,1 + G_nNodeCodeLength,2);
          stDoorNo := stTelAccessEvent[1 + G_nNodeCodeLength + 2];
          stReaderNo := stTelAccessEvent[1 + G_nNodeCodeLength + 3];
          stTime := copy(stTelAccessEvent,1 + G_nNodeCodeLength + 4,14);

          stTemp := stTelAccessEvent[1 + G_nNodeCodeLength + 4 + 14 + 10];
          if isDigit(stTemp) then
            stTelNumber := copy(stTelAccessEvent,1 + G_nNodeCodeLength + 4 + 14,11)
          else stTelNumber := copy(stTelAccessEvent,1 + G_nNodeCodeLength + 4 + 14,10);
          //���⿡�� DoorTelEvent���̺��� �μ�Ʈ ����.
          if dmDBFunction.CheckTB_DOORTELEVENT_Key(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0', stDoorNo) = 0 then
          begin
            dmDBInsert.InsertIntoTB_DOORTELEVENT_TelNumber(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0', stDoorNo,stTelNumber);
          end else
          begin
            dmDBUpdate.UpdateTB_DOORTELEVENT_Field_StringValue(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,'0', stDoorNo,'DE_TELNUMBER',stTelNumber);
          end;

          if dmDBFunction.CheckTB_ACCESSEVENT_TelTime(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID) <> 1 then
          begin
            Exit;
          end;
          if Not dmDBUpdate.UpdateTB_ACCESSEVENT_TelNumber(copy(stTime,1,8), copy(stTime,9,6), stNodeNo, stEcuID,stTelNumber) then
          begin
            Exit;
          end;
          dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stECUID,'0','1','DO_LASTACCESSCARD',stTelNumber);
        Except
          Exit;
        End;
        Application.ProcessMessages;
      end;
    end;
    TelEventList.Clear;
    result := True;
  Finally
    TelEventList.Free;
  End;
end;

function TfmMain.FileToDBLoad: Boolean;
var
	iFindResult: integer;
	srSchRec : TSearchRec;
  EventFileNameList : TStringList;
  i : integer;
  stFileName : string;
  bResult : Boolean;
  stCreateTime : string;
  stNowTime : string;
begin
  if G_bApplicationTerminate then Exit;
  if L_bFileToDBLoad then Exit;
  L_bFileToDBLoad := True;
  Try

    EventFileNameList := TStringList.Create;
    iFindResult := FindFirst(G_stEventDataDir + '\*.*', faAnyFile - faDirectory, srSchRec);
    while iFindResult = 0 do
    begin
      if G_bApplicationTerminate then Exit;
      stCreateTime := FormatDateTime('yyyymmddhhnnss',FileTimeToDateTime(srSchRec.FindData.ftCreationTime));
      stNowTime := FormatDateTime('yyyymmddhhnnss',Now - (2/(24*60*60)));    //2�� ���� ������ �ε�����.
      if stCreateTime <= stNowTime  then  //���� Add �ϰ� �ִ� ������ �ǵ帮�� �ȵ�...
      begin
        EventFileNameList.Add(srSchRec.Name);
      end;
      iFindResult := FindNext(srSchRec);
      Application.ProcessMessages;
    end;
    FindClose(srSchRec);

    if EventFileNameList.Count < 1 then Exit;
    EventFileNameList.Sort;

    for i := 0 to EventFileNameList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      sb_Status.Panels[2].Text :=  EventFileNameList.Strings[i] + ' File Insert(' + inttostr(i) + '/' + inttostr(EventFileNameList.Count - 1) + ')';

      bResult := False;
      if UpperCase(copy(EventFileNameList.Strings[i],1,length('CardAccessEvent'))) = UpperCase('CardAccessEvent') then
      begin
        stFileName := G_stEventDataDir + '\' + EventFileNameList.Strings[i];
        bResult := FileToDBInsertCardAccessEvent(stFileName);
      end else if UpperCase(copy(EventFileNameList.Strings[i],1,length('AlarmEvent'))) = UpperCase('AlarmEvent') then
      begin
        stFileName := G_stEventDataDir + '\' + EventFileNameList.Strings[i];
        bResult := FileToDBInsertAlarmEvent(stFileName);
      end else if UpperCase(copy(EventFileNameList.Strings[i],1,length('DeviceRegEvent'))) = UpperCase('DeviceRegEvent') then
      begin
        stFileName := G_stEventDataDir + '\' + EventFileNameList.Strings[i];
        bResult := FileToDBInsertDeviceRegEvent(stFileName);
      end else if UpperCase(copy(EventFileNameList.Strings[i],1,length('TelAccessEvent'))) = UpperCase('TelAccessEvent') then
      begin
        stFileName := G_stEventDataDir + '\' + EventFileNameList.Strings[i];
        bResult := FileToDBInsertTelAccessEvent(stFileName);
      end else if UpperCase(copy(EventFileNameList.Strings[i],1,length('DOORDS'))) = UpperCase('DOORDS') then
      begin
        stFileName := G_stEventDataDir + '\' + EventFileNameList.Strings[i];
        bResult := FileToDBInsertDoorStateEvent(stFileName);
      end else if UpperCase(copy(EventFileNameList.Strings[i],1,length('CardRcvAck'))) = UpperCase('CardRcvAck') then
      begin
        stFileName := G_stEventDataDir + '\' + EventFileNameList.Strings[i];
        bResult := FileToDBInsertCardRcvAckEvent(stFileName);
      end;
      Try
        if bResult then
        begin
          DeleteFile(stFileName);
          sb_Status.Panels[2].Text := stFileName + ' Delete ';
        end else
        begin
          sb_Status.Panels[2].Text := stFileName + ' Insert Fail';
        end;
      Except
        continue;
      End;
      sleep(1);
      Application.ProcessMessages;
    end;

  Finally
    //sb_Status.Panels[2].Text := 'FileToDBLoad Finally';
    EventFileNameList.Free;
    L_bFileToDBLoad := False;
  End;
end;

procedure TfmMain.FileToDBTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  //sb_Status.Panels[2].Text :=  'FileToDBTimerTimer Start';

  FileToDBTimer.Enabled := False;
  Try
    FileToDBLoad;
  Finally
    if FileToDBTimer <> nil then
       FileToDBTimer.Enabled := Not G_bApplicationTerminate;
  End;
  sb_Status.Panels[2].Text :=  'FileToDBTimerTimer End';
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  inherited;
  G_bApplicationTerminate := True;


  MemoryReadTimer.Enabled := False;
  MemoryReadTimer.Free;

  DataBaseChangeCheckTimer.Enabled := False;
  DataBaseChangeCheckTimer.Free;
  CardPermitCheckTimer.Enabled := False;
  CardPermitCheckTimer.Free;

  ServerCheckTimer.Enabled := False;
  ServerCheckTimer.Free;

  ServerSendTimer.Enabled := False;
  ServerSendTimer.Free;

  FileToDBTimer.Enabled := False;
  FileToDBTimer.Free;


  TrayTimer.Enabled := False;
  TrayTimer.Free;

  NowTimer.Enabled := False;
  NowTimer.Free;

  Delay(1000);
  if CardNodeList.count > 0 then
  begin
    for i := CardNodeList.count - 1 downto 0 do
       TvNodeCard(CardNodeList.objects[i]).free;
  end;
  CardNodeList.free;

  if CardEmList.Count > 0 then
  begin
    for i := CardEmList.Count - 1 downto 0 do
    begin
      TCard(CardEmList.Objects[i]).Free;
    end;
  end;
  CardEmList.free;
  DecoderServerList.Free;
  SendControlMessageList.Free;
  SendEventMessageList.Free;

  oControlSendMemory.Free;
  oEventSendMemory.Free;
  oControlRecvMemory.Free;
  oEventRecvMemory.Free;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if L_bClose = False then
  begin
    CanClose := False;
    Hide();
    WindowState := wsMinimized;
  end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  inherited;
  CardEmList := TStringList.Create;
  CardNodeList := TStringList.Create;
  DecoderServerList := TStringList.Create;
  SendControlMessageList := TStringList.Create;
  SendEventMessageList := TStringList.Create;

  Application.OnException := AppException;

  G_bApplicationTerminate := False;

  dmDataBase.OnAdoConnected := AdoConnected;

  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('�����ͺ��̽� ���� ����.�����ͺ��̽����� ȯ�漳���� �ٽ� �ϼ���.');
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;

  GetIniConfig;
  LoadTB_CONFIG;

  if not DirectoryExists(G_stEventDataDir) then
  begin
   if Not CreateDir(G_stEventDataDir) then
   begin
      G_stEventDataDir := G_stExeFolder;
   end;
  end;
  if FileExists(G_stExeFolder + '\logo.ico') then
  begin
    self.Icon.LoadFromFile(G_stExeFolder + '\logo.ico');
    Application.Icon.LoadFromFile(G_stExeFolder + '\logo.ico');
  end;
  TrayIcon1.BalloonHint := 'DecoderLoader Start';
  TrayTimer.Enabled := True;

  Caption := 'GMS_DEVICESERVERMANAGER'+inttostr(G_nDecoderNo);

  oControlSendMemory := TfisSharedMemory.Create(nil);
  oControlSendMemory.ShareName := 'DEVICESERVERMANAGERCONTROL'+inttostr(G_nDecoderNo);
  oControlSendMemory.CreateMMF_Info;
  oEventSendMemory := TfisSharedMemory.Create(nil);
  oEventSendMemory.ShareName := 'DEVICESERVERMANAGEREVENT'+inttostr(G_nDecoderNo);
  oEventSendMemory.CreateMMF_Info;

  oControlRecvMemory := TfisSharedMemory.Create(nil);
  oControlRecvMemory.ShareName := 'DEVICESERVERCONTROL'+inttostr(G_nDecoderNo);
  oControlRecvMemory.CreateMMF_Info;
  oEventRecvMemory := TfisSharedMemory.Create(nil);
  oEventRecvMemory.ShareName := 'DEVICESERVEREVENT'+inttostr(G_nDecoderNo);
  oEventRecvMemory.CreateMMF_Info;

  MemoryReadTimer.Enabled := True;

  L_dtDeviceServerAliveTime := now;
  ServerCheckTimer.Enabled := True;
  NowTimer.Enabled := True;
  L_stCardHisLoadTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  if G_nMonitoringType = 1 then L_nDataBaseCheckStep := con_CheckDataBaseEmployeeChange
  else L_nDataBaseCheckStep := con_CheckDataBaseHoliday;
end;

procedure TfmMain.FORMENABLE(aName: integer; aValue: string);
var
  bValue : Boolean;
begin
  if UpperCase(aValue) = 'TRUE' then bValue := True
  else bValue := False;

  G_bFormEnabled[aName] := bValue;   //�ش� ��

end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  inherited;
(* //�� �κ��� Now Date ���濡�� �۾� �Ѵ�.
  dmDBUpdate.UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(FormatDateTime('yyyy',now),'R','N',inttostr(G_nDecoderNo)); //������ ������ �� ������ ������ ����.
  //dmDBUpdate.UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(FormatDateTime('yyyy',now),'S','N'); //������ ������ �� ������ ������ ����.

  dmDBUpdate.UpdateTB_DOORSCHEDULE_SendStatus('R','N',inttostr(G_nDecoderNo));  //���Թ������� ������� �����۰� ������ ����������.
  //dmDBUpdate.UpdateTB_DOORSCHEDULE_SendStatus('S','N');

  dmDBUpdate.UpdateTB_DEVICERCV_TIMECODEUSEAllChange('R','U',inttostr(G_nDecoderNo));  //���Թ� Ÿ���ڵ� ������� �����۰� ������ ����������.
  //dmDBUpdate.UpdateTB_DEVICERCV_TIMECODEUSEAllChange('S','U');

  dmDBUpdate.UpdateTB_TIMECODEDEVICE_SendStatus('R','N',inttostr(G_nDecoderNo));    //��Ʈ�ѷ� �ð� ������
  //dmDBUpdate.UpdateTB_TIMECODEDEVICE_SendStatus('S','N');

  //dmDBUpdate.UpdateTB_CARDPERMIT_AllRCVACK('S','N',inttostr(G_nDecoderNo)); //���� �����۰��� ������ ����.  ���� ���� ��
  dmDBFunction.ChangeTB_CARDPERMIT_AllRCVACK('S','N',inttostr(G_nDecoderNo)); //���� �����۰��� ������ ����.

  dmDBUpdate.UpdateTB_DOORRCV_AllRcvAck('DO_DOORSCHUSE','S','N',inttostr(G_nDecoderNo));

  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL0','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL1','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL2','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL3','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL4','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL5','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL6','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL7','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL8','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL9','S','C',inttostr(G_nDecoderNo));
*)
  DataBaseChangeCheckTimer.Interval := 1 * 1000; //1�� �ֱ�� üũ ����.
  DataBaseChangeCheckTimer.Enabled := True;
//  CardPermitCheckTimer.Enabled := True;
  ServerSendTimer.Enabled := True;
  FileToDBTimer.Enabled := True;
end;

function TfmMain.GetEmInfoFromCardNo(aCardNo, aLastDate: string;aSearchType:integer;
  var aCompanyCode, aCompanyName, aEmSeq, aEmCode, aEmName, aPosiCode,
  aPosiName, aATUSE, aFDUSE,aPrintNo,aHandPhone: UnicodeString): Boolean;
var
  nIndex : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
  oCard : TCard;
  stTemp : string;
begin
  result := False;
  nIndex := CardEmList.IndexOf(aCardNo);
  if nIndex > -1 then
  begin
    if G_nVisitUse = 1 then  //�湮�� ����ϴ� ���
    begin
      if TCard(CardEmList.Objects[nIndex]).COMPANYCODE <> G_stVisitCode then   //�湮�� ����ϸ鼭 �湮�� �ڵ尡 �ƴѰ�� - �湮�� �ڵ�� �ǽð����� ������ ���� ����.
      begin
        if TCard(CardEmList.Objects[nIndex]).LoadDate = FormatDateTime('yyyymmdd',Now) then   //�ε��� ��¥�� �����̸�
        begin
          aCompanyCode := TCard(CardEmList.Objects[nIndex]).COMPANYCODE;
          aCompanyName := TCard(CardEmList.Objects[nIndex]).COMPANYNAME;
          aEmSeq := inttostr(TCard(CardEmList.Objects[nIndex]).EMSEQ);
          aEmCode := TCard(CardEmList.Objects[nIndex]).EMCODE;
          aEmName := TCard(CardEmList.Objects[nIndex]).EMNAME;
          aPosiCode := TCard(CardEmList.Objects[nIndex]).POSICODE;
          aPosiName := TCard(CardEmList.Objects[nIndex]).POSINAME;
          aATUSE := TCard(CardEmList.Objects[nIndex]).ATUSE;
          aFDUSE := TCard(CardEmList.Objects[nIndex]).FDUSE;
          aPrintNo := TCard(CardEmList.Objects[nIndex]).PRINTNO;
          aHandPhone := TCard(CardEmList.Objects[nIndex]).HandPhoneNum;
          TCard(CardEmList.Objects[nIndex]).LastUseDate := aLastDate;
          result := True;
          Exit;
        end;
      end;
    end else
    begin
      if TCard(CardEmList.Objects[nIndex]).LoadDate = FormatDateTime('yyyymmdd',Now) then   //�ε��� ��¥�� �����̸�
      begin
        aCompanyCode := TCard(CardEmList.Objects[nIndex]).COMPANYCODE;
        aCompanyName := TCard(CardEmList.Objects[nIndex]).COMPANYNAME;
        aEmSeq := inttostr(TCard(CardEmList.Objects[nIndex]).EMSEQ);
        aEmCode := TCard(CardEmList.Objects[nIndex]).EMCODE;
        aEmName := TCard(CardEmList.Objects[nIndex]).EMNAME;
        aPosiCode := TCard(CardEmList.Objects[nIndex]).POSICODE;
        aPosiName := TCard(CardEmList.Objects[nIndex]).POSINAME;
        aATUSE := TCard(CardEmList.Objects[nIndex]).ATUSE;
        aFDUSE := TCard(CardEmList.Objects[nIndex]).FDUSE;
        aPrintNo := TCard(CardEmList.Objects[nIndex]).PRINTNO;
        aHandPhone := TCard(CardEmList.Objects[nIndex]).HandPhoneNum;
        TCard(CardEmList.Objects[nIndex]).LastUseDate := aLastDate;
        result := True;
        Exit;
      end;
    end;
  end;

  if aSearchType = 1 then   //�бⱹ���̸�
  begin
    stSql := 'Select b.EM_SEQ,b.CA_LASTUSEDATE,a.CA_PRINTNO,c.EM_CODE,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ATUSE,c.EM_FDUSE,c.EM_HANDPHONE,d.CO_COMPANYNAME,c.PO_POSICODE,e.PO_POSICODENAME ';
    stSql := stSql + ' From TB_CARDPRINTLIST a ';
    stSql := stSql + ' Left Join TB_CARD b';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND b.EM_SEQ = c.EM_SEQ) ';
    stSql := stSql + ' Left Join TB_COMPANYCODE d ';
    stSql := stSql + ' ON(c.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND c.CO_COMPANYCODE = d.CO_COMPANYCODE )';
    stSql := stSql + ' Left Join TB_POSICODE e ';
    stSql := stSql + ' ON(c.GROUP_CODE = e.GROUP_CODE ';
    stSql := stSql + ' AND c.PO_POSICODE = e.PO_POSICODE ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';
  end else
  begin
    stSql := 'Select a.EM_SEQ,a.CA_LASTUSEDATE,a.CA_PRINTNO,b.EM_CODE,b.EM_NAME,b.CO_COMPANYCODE,b.EM_ATUSE,b.EM_FDUSE,b.EM_HANDPHONE,c.CO_COMPANYNAME,b.PO_POSICODE,d.PO_POSICODENAME ';
    stSql := stSql + ' From TB_CARD a';
    stSql := stSql + ' Left Join TB_EMPLOYEE b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ) ';
    stSql := stSql + ' Left Join TB_COMPANYCODE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE )';
    stSql := stSql + ' Left Join TB_POSICODE d ';
    stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND b.PO_POSICODE = d.PO_POSICODE ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';
  end;

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','GetEmInfoFromCardNo');
        Exit;
      End;

      if RecordCount < 1 then Exit;
      First;
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aCompanyName := FindField('CO_COMPANYNAME').AsString;
      aEmSeq := FindField('EM_SEQ').AsString;
      aEmCode := FindField('EM_CODE').AsString;
      aEmName := FindField('EM_NAME').AsString;
      aPosiCode := FindField('PO_POSICODE').AsString;
      aPosiName := FindField('PO_POSICODENAME').AsString;
      aATUSE := FindField('EM_ATUSE').AsString;
      aFDUSE := FindField('EM_FDUSE').AsString;
      aPrintNo := FindField('CA_PRINTNO').AsString;
      aHandPhone := FindField('EM_HANDPHONE').AsString;

      nIndex := CardEmList.IndexOf(aCardNo);
      if nIndex < 0 then
      begin
        oCard := TCard.Create(nil);
        oCard.CARDNO := aCardNo;
        oCard.COMPANYCODE := aCompanyCode;
        oCard.COMPANYNAME := aCompanyName;
        oCard.EMSEQ := FindField('EM_SEQ').AsInteger;
        oCard.EMCODE := aEmCode;
        oCard.EMNAME := aEmName;
        oCard.POSICODE := aPosiCode;
        oCard.POSINAME := aPosiName;
        oCard.ATUSE := aATUSE;
        oCard.FDUSE := aFDUSE;
        oCard.PRINTNO := aPrintNo;
        oCard.HandPhoneNum := aHandPhone;
        oCard.LastUseDate := FindField('CA_LASTUSEDATE').AsString;
        oCard.OnCardChangePacket := CardChangePacket;
        oCard.LastUseDate := aLastDate;
        oCard.LoadDate := FormatDateTime('yyyymmdd',Now);
        CardEmList.AddObject(aCardNo,oCard);
      end else
      begin
        TCard(CardEmList.Objects[nIndex]).COMPANYCODE := aCompanyCode;
        TCard(CardEmList.Objects[nIndex]).COMPANYNAME := aCompanyName;
        TCard(CardEmList.Objects[nIndex]).EMSEQ := FindField('EM_SEQ').AsInteger;
        TCard(CardEmList.Objects[nIndex]).EMCODE := aEmCode;
        TCard(CardEmList.Objects[nIndex]).EMNAME := aEmName;
        TCard(CardEmList.Objects[nIndex]).POSICODE := aPosiCode;
        TCard(CardEmList.Objects[nIndex]).POSINAME := aPosiName;
        TCard(CardEmList.Objects[nIndex]).ATUSE := aATUSE;
        TCard(CardEmList.Objects[nIndex]).FDUSE := aFDUSE;
        TCard(CardEmList.Objects[nIndex]).PRINTNO := aPrintNo;
        TCard(CardEmList.Objects[nIndex]).HandPhoneNum := aHandPhone;
        TCard(CardEmList.Objects[nIndex]).LastUseDate := aLastDate;
        TCard(CardEmList.Objects[nIndex]).LoadDate := FormatDateTime('yyyymmdd',Now);
      end;
      //dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(aEmSeq,'EM_MEMLOAD','Y');
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.GetIniConfig;
var
  ini_fun : TiniFile;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MIAMS.ini');
    with ini_fun do
    begin
      if ReadInteger('TEST','Debug',0) = 1 then G_bDebug := True
      else G_bDebug := False;
    end;
  Finally
    ini_fun.Free;
  End;
end;

function TfmMain.LoadCardFTPChangeData: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stSendData : string;
  stNodeNo : string;
  stEcuID : string;
begin
  if G_bApplicationTerminate then Exit;

  result := False;
  Try
    stSql := ' select top 1 a.* from (select * from TB_CARDFTPDOWNLIST where CF_RCVACK = ''N'') a ';
    stSql := stSql + ' INNER JOIN (select * from TB_NODE where ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ') b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO )';
    stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + '''';
    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardFTPChangeData');
          //����ó��
          Exit;
        End;
        result := True;
        if RecordCount < 1 then Exit;
        First;
        dmDBUpdate.UpdateTB_CARDFTPDOWNLIST_Field_StringValue(FindField('ND_NODENO').asstring,FindField('DE_ECUID').asstring,'CF_RCVACK','S');
        stNodeNo := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength);
        stEcuID := FindField('DE_ECUID').AsString;
        stSendData := stNodeNo + stEcuID;

        stSendData := inttostr(con_cmdManagerToServerCardFTP) + DATADELIMITER + stSendData + DATADELIMITER;
        if SendControlMessageList.indexOf(stSendData) < 0 then
          SendControlMessageList.Add(stSendData);
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
  End;
end;

function TfmMain.LoadCardPermit(aNodeNo, aECUID, aCardNo: string):integer;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  if G_bApplicationTerminate then Exit;

  result := -1;
  Try
    stSql := ' select ';
    stSql := stSql + ' a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CA_CARDNO,a.CP_PERMIT,f.EM_STATE,a.CP_DOOR1,a.CP_DOOR2,a.CP_DOOR3,';
    stSql := stSql + ' a.CP_DOOR4,a.CP_DOOR5,a.CP_DOOR6,a.CP_DOOR7,a.CP_DOOR8,a.CP_ARMAREA0,a.CP_ARMAREA1,a.CP_ARMAREA2,';
    stSql := stSql + ' a.CP_ARMAREA3,a.CP_ARMAREA4,a.CP_ARMAREA5,a.CP_ARMAREA6,a.CP_ARMAREA7,a.CP_ARMAREA8,a.CP_RCVACK,';
    stSql := stSql + ' b.CA_POSITIONNUM,b.CA_STATECODE,c.EM_SEQ,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ACUSE,c.EM_ATUSE,c.EM_FDUSE,';
    stSql := stSql + ' e.EM_TIMECODEUSE,e.TC_GROUP,e.TC_TIME1,e.TC_TIME2,e.TC_TIME3,e.TC_TIME4,e.TC_WEEKCODE,c.EM_REGDATE,c.EM_ENDDATE ';
    stSql := stSql + ' from TB_CARDPERMIT a  ';
    stSql := stSql + ' Left Join TB_CARD b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND b.EM_SEQ = c.EM_SEQ) ';
    stSql := stSql + ' Inner Join TB_DEVICE d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
    stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEEDEVICETIMECODE e ';
    stSql := stSql + ' ON(b.EM_SEQ = e.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = e.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = e.DE_ECUID ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEESTATECODE f ';
    stSql := stSql + ' ON(c.EM_STATECODE = f.EM_STATECODE ) ';
    stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + '''';
    stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + '';
    stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + '''';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + '''';

//    if CardNodeList = nil then Exit;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
          //����ó��
          Exit;
        End;
        result := 0;
        if RecordCount < 1 then Exit;
        result := 1;
        First;
        SetNodeToCardPermitInitialize(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength), FindField('DE_ECUID').AsString, FindField('CA_CARDNO').AsString,FindField('CP_PERMIT').AsString,FindField('CA_STATECODE').AsString,
        FindField('CP_DOOR1').AsString,FindField('CP_DOOR2').AsString,FindField('CP_DOOR3').AsString,
        FindField('CP_DOOR4').AsString,FindField('CP_DOOR5').AsString,FindField('CP_DOOR6').AsString,
        FindField('CP_DOOR7').AsString,FindField('CP_DOOR8').AsString,FindField('CP_ARMAREA0').AsString,
        FindField('CP_ARMAREA1').AsString,FindField('CP_ARMAREA2').AsString,FindField('CP_ARMAREA3').AsString,
        FindField('CP_ARMAREA4').AsString,FindField('CP_ARMAREA5').AsString,FindField('CP_ARMAREA6').AsString,
        FindField('CP_ARMAREA7').AsString,FindField('CP_ARMAREA8').AsString,FindField('CP_RCVACK').AsString,
        FindField('CA_POSITIONNUM').AsString,FindField('EM_TIMECODEUSE').AsString,FindField('TC_GROUP').AsString,
        FindField('TC_TIME1').AsString,FindField('TC_TIME2').AsString,FindField('TC_TIME3').AsString,
        FindField('TC_TIME4').AsString,FindField('TC_WEEKCODE').AsString,FindField('EM_REGDATE').AsString,FindField('EM_ENDDATE').AsString,
        FindField('EM_STATE').AsString);
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
  End;
end;

function TfmMain.LoadCardPermitSendStandby: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  nIndex : integer;
  stTemp : string;
  stNodeNo : string;
  stEcuID : string;
  stCardNo : string;
  stCardPermit : string;
  stSendData : string;
begin
  if G_bApplicationTerminate then Exit;

  //dmDBUpdate.UpdateTB_CARDPERMIT_AllRCVACK('N','R');       //���� �غ� ���·� �ٲ��� �غ���¸� �о �ε� ����... �ε� �߿� ������ �ٲ�� �ִ�.
  Try
    stSql := ' select top 100 a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CA_CARDNO,a.CP_PERMIT,f.EM_STATE,a.CP_DOOR1,a.CP_DOOR2,a.CP_DOOR3,';
    stSql := stSql + ' a.CP_DOOR4,a.CP_DOOR5,a.CP_DOOR6,a.CP_DOOR7,a.CP_DOOR8,a.CP_ARMAREA0,a.CP_ARMAREA1,a.CP_ARMAREA2,';
    stSql := stSql + ' a.CP_ARMAREA3,a.CP_ARMAREA4,a.CP_ARMAREA5,a.CP_ARMAREA6,a.CP_ARMAREA7,a.CP_ARMAREA8,a.CP_RCVACK,';
    stSql := stSql + ' b.CA_POSITIONNUM,b.CA_STATECODE,c.EM_SEQ,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ACUSE,c.EM_ATUSE,c.EM_FDUSE,';
    stSql := stSql + ' e.EM_TIMECODEUSE,e.TC_GROUP,e.TC_TIME1,e.TC_TIME2,e.TC_TIME3,e.TC_TIME4,e.TC_WEEKCODE,c.EM_REGDATE,c.EM_ENDDATE ';
    stSql := stSql + ' from TB_CARDPERMIT a  ';
    stSql := stSql + ' Left Join TB_CARD b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE c ';
    stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND b.EM_SEQ = c.EM_SEQ) ';
    stSql := stSql + ' Inner Join TB_DEVICE d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
    stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEEDEVICETIMECODE e ';
    stSql := stSql + ' ON(b.EM_SEQ = e.EM_SEQ ';
    stSql := stSql + ' AND a.ND_NODENO = e.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = e.DE_ECUID ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEESTATECODE f ';
    stSql := stSql + ' ON(c.EM_STATECODE = f.EM_STATECODE ) ';
    stSql := stSql + ' INNER JOIN TB_NODE g ';
    stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = g.ND_NODENO ';
    stSql := stSql + ' AND g.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + '''';
    stSql := stSql + ' AND a.CP_RCVACK = ''N''';

    if CardNodeList = nil then Exit;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then
        begin
          Exit;
        end;
        First;
        while Not Eof do
        begin
          stNodeNo := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength);
          stEcuID := FindField('DE_ECUID').AsString;
          stCardNo := FindField('CA_CARDNO').AsString;
          stCardPermit := FindField('CP_PERMIT').AsString;
          if stCardPermit = '' then stCardPermit := '0';

          SetNodeToCardPermitInitialize(stNodeNo,stEcuID ,stCardNo ,stCardPermit,FindField('CA_STATECODE').AsString,
          FindField('CP_DOOR1').AsString,FindField('CP_DOOR2').AsString,FindField('CP_DOOR3').AsString,
          FindField('CP_DOOR4').AsString,FindField('CP_DOOR5').AsString,FindField('CP_DOOR6').AsString,
          FindField('CP_DOOR7').AsString,FindField('CP_DOOR8').AsString,FindField('CP_ARMAREA0').AsString,
          FindField('CP_ARMAREA1').AsString,FindField('CP_ARMAREA2').AsString,FindField('CP_ARMAREA3').AsString,
          FindField('CP_ARMAREA4').AsString,FindField('CP_ARMAREA5').AsString,FindField('CP_ARMAREA6').AsString,
          FindField('CP_ARMAREA7').AsString,FindField('CP_ARMAREA8').AsString,FindField('CP_RCVACK').AsString,
          FindField('CA_POSITIONNUM').AsString,FindField('EM_TIMECODEUSE').AsString,FindField('TC_GROUP').AsString,
          FindField('TC_TIME1').AsString,FindField('TC_TIME2').AsString,FindField('TC_TIME3').AsString,
          FindField('TC_TIME4').AsString,FindField('TC_WEEKCODE').AsString,FindField('EM_REGDATE').AsString,FindField('EM_ENDDATE').AsString,
          FindField('EM_STATE').AsString);

          dmDBUpdate.UpdateTB_CARDPERMIT_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CA_CARDNO').AsString,'CP_RCVACK','S');  //������ ���� ����...

          //���⿡�� ���� ������ ��Ŷ �����Ͽ� Server �� ��������.
          nIndex := CardNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            stSendData := stNodeNo + stEcuID + stCardNo;
            stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardPositionNum(stEcuID,stCardNo);  //5�ڸ�
            stSendData := stSendData + stCardPermit[1];  //1�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardDoorPermit(stEcuID,stCardNo),'0',8);  //8�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardArmAreaPermit(stEcuID,stCardNo),'0',9);  //9�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardStartDate(stEcuID,stCardNo),'0',8,True);  //8�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardEndDate(stEcuID,stCardNo),'0',8,True);  //8�ڸ�
            stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardTimeCodeUse(stEcuID,stCardNo);  //1�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardTimeCode(stEcuID,stCardNo),'0',4,True);  //4�ڸ�
            stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardTimeGroup(stEcuID,stCardNo);  //1�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardWeekCode(stEcuID,stCardNo),'0',7,True);  //7�ڸ�
            stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardEMState(stEcuID,stCardNo);  //1�ڸ�

            stSendData := inttostr(con_cmdManagerToServerCardUpdate) + DATADELIMITER + stSendData + DATADELIMITER;
            if SendControlMessageList.indexOf(stSendData) < 0 then
              SendControlMessageList.Add(stSendData);
          end;

          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
  End;
end;

function TfmMain.LoadDeviceArmAreaUseChangeData: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stSendMessage : string;
begin
  if G_bApplicationTerminate then Exit;
  result := False;
  Try
    stSql := ' select a.* ';
    stSql := stSql + ' from TB_DEVICE a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND b.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DE_ARMAREAUSECHANGE = ''Y'' ';
    stSql := stSql + ' AND DE_DEVICEUSE = ''1'' ';

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadDeviceArmAreaUseChangeData');
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        result := True;
        First;
        while Not Eof do
        begin
          stSendMessage := inttostr(con_cmdManagerToServerDeviceArmAreaUseChange) + DATADELIMITER + FindField('ND_NODENO').AsString + DATADELIMITER + FindField('DE_ECUID').AsString + DATADELIMITER; //�������������� ����
          SendControlMessageList.Add(stSendMessage);

          dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0','DE_ARMAREAUSECHANGE','N');
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
  End;
end;


function TfmMain.LoadDeviceChangeData: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stSendMessage : string;
begin
  if G_bApplicationTerminate then Exit;
  result := False;
  Try
    stSql := ' select a.* ';
    stSql := stSql + ' from TB_DEVICE a ';
    stSql := stSql + ' Inner Join TB_NODE b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND b.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.DE_DEVICEHANGE = ''Y'' ';
    stSql := stSql + ' AND DE_DEVICEUSE = ''1'' ';

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadDeviceChangeData');
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        result := True;
        First;
        while Not Eof do
        begin
          stSendMessage := inttostr(con_cmdManagerToServerDeviceChange) + DATADELIMITER + FindField('ND_NODENO').AsString + DATADELIMITER + FindField('DE_ECUID').AsString + DATADELIMITER; //�������������� ����
          SendControlMessageList.Add(stSendMessage);

          dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0','DE_DEVICEHANGE','N');
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
  End;
end;

function TfmMain.LoadEmployeeChangeData: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stCompanyCode : string;
  stCompanyName : string;
  stEmSeq : string;
  stEmCode : string;
  stEmName : string;
  stPosiCode : string;
  stPosiName : string;
  stATUSE : string;
  stFDUSE : string;
  stCardNo : string;
  nIndex : integer;
  oCard : TCard;
  stTemp : string;
begin
  result := False;
  stSql := 'Select top 3 b.CA_CARDNO,a.EM_SEQ,b.CA_LASTUSEDATE,a.EM_CODE,a.EM_NAME,a.CO_COMPANYCODE,a.EM_ATUSE,a.EM_FDUSE,c.CO_COMPANYNAME,a.PO_POSICODE,d.PO_POSICODENAME ';
  stSql := stSql + ' From TB_EMPLOYEE a  ';
  stSql := stSql + ' Left Join TB_CARD b';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ) ';
  stSql := stSql + ' Left Join TB_COMPANYCODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE )';
  stSql := stSql + ' Left Join TB_POSICODE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.PO_POSICODE = d.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_MEMLOAD = ''N'' ';

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadEmployeeChangeData');
        Exit;
      End;

      if RecordCount < 1 then Exit;
      result := True;
      First;
      while Not Eof do
      begin
        stCardNo := FindField('CA_CARDNO').AsString;
        stCompanyCode := FindField('CO_COMPANYCODE').AsString;
        stCompanyName := FindField('CO_COMPANYNAME').AsString;
        stEmSeq := FindField('EM_SEQ').AsString;
        stEmCode := FindField('EM_CODE').AsString;
        stEmName := FindField('EM_NAME').AsString;
        stPosiCode := FindField('PO_POSICODE').AsString;
        stPosiName := FindField('PO_POSICODENAME').AsString;
        stATUSE := FindField('EM_ATUSE').AsString;
        stFDUSE := FindField('EM_FDUSE').AsString;
        nIndex := CardEmList.IndexOf(stCardNo);

        if nIndex > -1 then
        begin
          TCard(CardEmList.Objects[nIndex]).COMPANYCODE := stCompanyCode;
          TCard(CardEmList.Objects[nIndex]).COMPANYNAME := stCompanyName;
          TCard(CardEmList.Objects[nIndex]).EMSEQ := FindField('EM_SEQ').AsInteger;
          TCard(CardEmList.Objects[nIndex]).EMCODE := stEmCode;
          TCard(CardEmList.Objects[nIndex]).EMNAME := stEmName;
          TCard(CardEmList.Objects[nIndex]).POSICODE := stPosiCode;
          TCard(CardEmList.Objects[nIndex]).POSINAME := stPosiName;
          TCard(CardEmList.Objects[nIndex]).ATUSE := stATUSE;
          TCard(CardEmList.Objects[nIndex]).FDUSE := stFDUSE;
          //TCard(CardEmList.Objects[nIndex]).LastUseDate := FindField('CA_LASTUSEDATE').AsString;
        end else
        begin
          oCard := TCard.Create(nil);
          oCard.CARDNO := stCardNo;
          oCard.COMPANYCODE := stCompanyCode;
          oCard.COMPANYNAME := stCompanyName;
          oCard.EMSEQ := FindField('EM_SEQ').AsInteger;
          oCard.EMCODE := stEmCode;
          oCard.EMNAME := stEmName;
          oCard.POSICODE := stPosiCode;
          oCard.POSINAME := stPosiName;
          oCard.ATUSE := stATUSE;
          oCard.FDUSE := stFDUSE;
          oCard.LastUseDate := FindField('CA_LASTUSEDATE').AsString;
          oCard.OnCardChangePacket := CardChangePacket;
          CardEmList.AddObject(stCardNo,oCard);
        End;
        dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_MEMLOAD','Y');
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.LoadEmployeePermitChangeData: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stEmSeq : string;
begin
  result := False;
  Try
    L_bEmployeePermitLoad := True;
    //����͸����� �� �۾� ���� ���� �ϰ� ���⼭�� TB_CARDPERMIT �� ����
    stSql := ' Select ';
    if G_nDBType = MSSQL then
        stSql := stSql + ' top 1 ';
    stSql := stSql + ' A.EM_SEQ from TB_CARDPERMITEMPLOYEECODE A ';
    stSql := stSql + ' Inner Join TB_EMPLOYEE B ';     //20160211 ī�尡 �ִ� ��쿡�� ī�� ���� �۾� ����.
    stSql := stSql + ' ON(A.EM_SEQ = B.EM_SEQ ';
    if G_nProgramType = 2 then stSql := stSql + ' AND (B.EM_FINGERUSE = ''1'' OR B.EM_CARDUSE = 1) ';   //SK������ üũ����
    stSql := stSql + ' ) ';
    stSql := stSql + ' Where A.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND A.CP_APPLY <> ''Y'' ';
    //stSql := stSql + ' AND A.EM_APPROVE = 1 ' ; //������ �� �ǿ� ���ؼ� ������ ���� ����.
    stSql := stSql + ' GROUP BY A.EM_SEQ ';
    if G_nDBType = POSTGRESQL then stSql := stSql + ' LIMIT 1 OFFSET 0 ';
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
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','EmployeePermitLoad');
          Exit;
        End;
        if recordcount < 1 then Exit;
        result := True;
        while not Eof do
        begin
          stEmSeq := FindField('EM_SEQ').AsString;
          if LoadEmployeePermitToCard(stEmSeq) then
          begin
//            if dmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N','','') < 1 then //������ �����Ͱ� ������
//               dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'Y','','');
          end;
          //dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(stEmSeq,'R','N','','');  //������ ���� ������ ��ε� �ؾ� �ȴ�.
          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
    L_bEmployeePermitLoad := False;
  End;
end;

function TfmMain.LoadEmployeePermitToCard(aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stOldNodeNo : string;
  stOldEcuID : string;
  stOldCardNo : string;
  stNodeNo : string;
  nIndex : integer;
  bNodeSetting : Boolean;
begin
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,'N','R','','');
  stSql := ' Select a.ND_NODENO,a.DE_ECUID,a.EM_SEQ,a.EM_APPROVE from TB_CARDPERMITEMPLOYEECODE a ';
//  stSql := ' Select a.* from TB_CARDPERMITEMPLOYEECODE a ';
  stSql := stSql + ' Inner Join TB_NODE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND b.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND a.CP_APPLY = ''R'' ';
  stSql := stSql + ' AND a.EM_APPROVE = 1 '; //������ �� �ǿ� ���ؼ�
  stSql := stSql + ' GROUP BY a.ND_NODENO,a.DE_ECUID,a.EM_SEQ,a.EM_APPROVE ';

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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','EmployeePermitToCardLoad');
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        if dmDBCardPermit.EmployeePermitToCardDeviceLoad(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('EM_SEQ').AsString) then
        //LoadEmployeePermitToDeviceCard(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('EM_SEQ').AsString) then
        begin
          dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,'R','Y',FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString);
        end;
        //dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,'0',FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,'CP_APPLY','R');
        Application.ProcessMessages;
        Next;
      end;
      dmDBDelete.DeleteTB_CARDPERMITEMPLOYEECODE_EmSeqApplyFromNotPermit(aEmSeq);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

(*
function TfmMain.LoadEmployeePermitToDeviceCard(aNodeNo, aEcuID,
  aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stOldCardNo : string;
  nIndex : integer;
  bNodeSetting : Boolean;
  stNodeNo : string;
  stPermit : string;
  stDoorPermit : string;
  stArmAreaPermit : string;
  i: integer;
  stNowDate : string;
begin
  result := False;
  stNowDate := FormatDateTime('yyyymmdd',now);

  stSql := ' Select ';
  stSql := stSql + ' a.EM_SEQ,a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CP_TYPE,f.EM_STATE,';
  stSql := stSql + ' a.CP_NUMBER,a.CP_PERMIT,b.CA_CARDNO,b.CA_STATECODE,b.CA_POSITIONNUM, ';
  stSql := stSql + ' c.EM_CODE,c.EM_NAME,c.CO_COMPANYCODE,c.EM_ACUSE,c.EM_ATUSE,c.EM_FDUSE,c.EM_ENDDATE,c.EM_STATECODE,';
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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','EmployeePermitToCardDeviceLoad');
        Exit;
      End;
      result := True;
      if recordcount < 1 then Exit;

      stOldCardNo := '';
      First;
      stPermit := '0';
      bNodeSetting := True;
      stDoorPermit := '';
      stArmAreaPermit := '';
      for i := 0 to 9 do
      begin
        stDoorPermit := stDoorPermit + '0';
        stArmAreaPermit := stArmAreaPermit + '0';
      end;
      while Not Eof do
      begin
        if stOldCardNo <> '' then  //ī���ȣ�� ���� �� ���
        begin
          if stOldCardNo <> FindField('CA_CARDNO').AsString then
          begin
            if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(aNodeNo,aEcuID,'0',stOldCardNo) = 1 then
            begin
              //ī����� ������Ʈ
              if Not dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,'0',stOldCardNo,stPermit,
                         stDoorPermit[1],stDoorPermit[2],stDoorPermit[3],stDoorPermit[4],stDoorPermit[5],stDoorPermit[6],stDoorPermit[7],stDoorPermit[8],
                         stArmAreaPermit[1],stArmAreaPermit[2],stArmAreaPermit[3],stArmAreaPermit[4],stArmAreaPermit[5],stArmAreaPermit[6],stArmAreaPermit[7],stArmAreaPermit[8],stArmAreaPermit[9]) then
              result := False;
            end else
            begin
              //ī����� �μ�Ʈ
              if Not dmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,'0',stOldCardNo,stPermit,
                         stDoorPermit[1],stDoorPermit[2],stDoorPermit[3],stDoorPermit[4],stDoorPermit[5],stDoorPermit[6],stDoorPermit[7],stDoorPermit[8],
                         stArmAreaPermit[1],stArmAreaPermit[2],stArmAreaPermit[3],stArmAreaPermit[4],stArmAreaPermit[5],stArmAreaPermit[6],stArmAreaPermit[7],stArmAreaPermit[8],stArmAreaPermit[9]) then
              result := False;
            end;

            stPermit := '0';
            stDoorPermit := '';
            stArmAreaPermit := '';
            for i := 0 to 9 do
            begin
              stDoorPermit := stDoorPermit + '0';
              stArmAreaPermit := stArmAreaPermit + '0';
            end;
            bNodeSetting := True;
          end;
        end;

        if FindField('CP_PERMIT').AsString = '1' then stPermit := '1';
        //if FindField('EM_ENDDATE').AsString < stNowDate then stPermit := '0'; //��ȿ�Ⱓ ���� ��� ���ѻ���
        //if FindField('EM_STATECODE').AsString <> '1' then stPermit := '0'; //�������°� �ƴ� ��� ���ѻ���

        if FindField('CP_TYPE').AsString = '1' then  //���Թ�
        begin
          stDoorPermit[FindField('CP_NUMBER').AsInteger] := FindField('CP_PERMIT').AsString[1];
        end else if FindField('CP_TYPE').AsString = '2' then  //�������
        begin
          stArmAreaPermit[FindField('CP_NUMBER').AsInteger + 1] := FindField('CP_PERMIT').AsString[1];
        end;

        stOldCardNo := FindField('CA_CARDNO').AsString;
        bNodeSetting := False;
        //Application.ProcessMessages;
        Next;
      end;
      if Not bNodeSetting then    //������ ���� ���Ѱ� ������ ���� ����.
      begin
          if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(aNodeNo,aEcuID,'0',stOldCardNo) = 1 then
          begin
            //ī����� ������Ʈ
            if Not dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,'0',stOldCardNo,stPermit,
                       stDoorPermit[1],stDoorPermit[2],stDoorPermit[3],stDoorPermit[4],stDoorPermit[5],stDoorPermit[6],stDoorPermit[7],stDoorPermit[8],
                       stArmAreaPermit[1],stArmAreaPermit[2],stArmAreaPermit[3],stArmAreaPermit[4],stArmAreaPermit[5],stArmAreaPermit[6],stArmAreaPermit[7],stArmAreaPermit[8],stArmAreaPermit[9]) then
                       result := False;
          end else
          begin
            //ī����� �μ�Ʈ
            if Not dmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(aNodeNo,aEcuID,'0',stOldCardNo,stPermit,
                       stDoorPermit[1],stDoorPermit[2],stDoorPermit[3],stDoorPermit[4],stDoorPermit[5],stDoorPermit[6],stDoorPermit[7],stDoorPermit[8],
                       stArmAreaPermit[1],stArmAreaPermit[2],stArmAreaPermit[3],stArmAreaPermit[4],stArmAreaPermit[5],stArmAreaPermit[6],stArmAreaPermit[7],stArmAreaPermit[8],stArmAreaPermit[9]) then
                       result := False;
          end;
      end;
      //dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_Field_StringValue(FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CP_TYPE').AsString,FindField('CP_NUMBER').AsString,'CP_APPLY','I');
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;
*)

function TfmMain.LoadNodeMemLoadChangeData: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stSendMessage : string;
begin
  if G_bApplicationTerminate then Exit;

  result := False;
  Try
    stSql := ' select * ';
    stSql := stSql + ' from TB_NODE ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';
    stSql := stSql + ' AND ND_MEMLOAD = ''N'' ';
    stSql := stSql + ' AND ND_DECODERNO = ' + inttostr(G_nDecoderNo) + '';

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        result := True;
        First;
        while Not Eof do
        begin
          stSendMessage := inttostr(con_cmdManagerToServerNodeChange) + DATADELIMITER + FindField('ND_NODENO').AsString + DATADELIMITER + '1' + DATADELIMITER; //��� �߰�
          SendControlMessageList.Add(stSendMessage);
          dmDBUpdate.UpdateTB_NODE_Field_StringValue(FindField('ND_NODENO').AsString,'ND_MEMLOAD','R');
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
  End;
end;

function TfmMain.LoadNodeServerChangeData: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stSendMessage : string;
begin
  if G_bApplicationTerminate then Exit;

  result := False;
  Try
    stSql := ' select * ';
    stSql := stSql + ' from TB_NODE ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + '''';
    stSql := stSql + ' AND ND_DECODERNOCHANGE = ''Y'' ';
    stSql := stSql + ' AND ND_OLDDECORDERNO = ' + inttostr(G_nDecoderNo) + '';

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        result := True;
        First;
        while Not Eof do
        begin
          stSendMessage := inttostr(con_cmdManagerToServerNodeChange) + DATADELIMITER + FindField('ND_NODENO').AsString + DATADELIMITER + '0' + DATADELIMITER; //��� ����
          SendControlMessageList.Add(stSendMessage);

          dmDBUpdate.UpdateTB_NODE_Field_StringValue(FindField('ND_NODENO').AsString,'ND_DECODERNOCHANGE','N');
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
  End;
end;

function TfmMain.LoadPasswordPermit(aNodeNo, aECUID, aCardNo: string): integer;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  if G_bApplicationTerminate then Exit;

  result := -1;
  Try
    stSql := ' select ';
    stSql := stSql + ' a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CA_CARDNO,a.CP_PERMIT,a.CP_DOOR1,a.CP_DOOR2,a.CP_DOOR3,';
    stSql := stSql + ' a.CP_DOOR4,a.CP_DOOR5,a.CP_DOOR6,a.CP_DOOR7,a.CP_DOOR8,a.CP_ARMAREA0,a.CP_ARMAREA1,a.CP_ARMAREA2,';
    stSql := stSql + ' a.CP_ARMAREA3,a.CP_ARMAREA4,a.CP_ARMAREA5,a.CP_ARMAREA6,a.CP_ARMAREA7,a.CP_ARMAREA8,a.CP_RCVACK ';
    stSql := stSql + ' from TB_CARDPERMIT a  ';
    stSql := stSql + ' Inner Join TB_DEVICE d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
    stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
    stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + '''';
    stSql := stSql + ' AND a.ND_NODENO = ' + aNodeNo + '';
    stSql := stSql + ' AND a.DE_ECUID = ''' + aEcuID + '''';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + '''';

//    if CardNodeList = nil then Exit;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
          //����ó��
          Exit;
        End;
        result := 0;
        if RecordCount < 1 then Exit;
        result := 1;
        First;
        SetNodeToCardPermitInitialize(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength), FindField('DE_ECUID').AsString, FindField('CA_CARDNO').AsString,FindField('CP_PERMIT').AsString,'1',
          FindField('CP_DOOR1').AsString,FindField('CP_DOOR2').AsString,FindField('CP_DOOR3').AsString,
          FindField('CP_DOOR4').AsString,FindField('CP_DOOR5').AsString,FindField('CP_DOOR6').AsString,
          FindField('CP_DOOR7').AsString,FindField('CP_DOOR8').AsString,FindField('CP_ARMAREA0').AsString,
          FindField('CP_ARMAREA1').AsString,FindField('CP_ARMAREA2').AsString,FindField('CP_ARMAREA3').AsString,
          FindField('CP_ARMAREA4').AsString,FindField('CP_ARMAREA5').AsString,FindField('CP_ARMAREA6').AsString,
          FindField('CP_ARMAREA7').AsString,FindField('CP_ARMAREA8').AsString,FindField('CP_RCVACK').AsString,
          '','','','','','','','','','19991231','1');
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','LoadCardPermit');
  End;
end;

function TfmMain.LoadPasswordPermitSendStandby: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  nIndex : integer;
  stTemp : string;
  stNodeNo : string;
  stEcuID : string;
  stCardNo : string;
  stCardPermit : string;
  stSendData : string;
begin
  if G_bApplicationTerminate then Exit;

  //dmDBUpdate.UpdateTB_CARDPERMIT_AllRCVACK('N','R');       //���� �غ� ���·� �ٲ��� �غ���¸� �о �ε� ����... �ε� �߿� ������ �ٲ�� �ִ�.
  Try
    stSql := ' select top 10 a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.CA_CARDNO,a.CP_PERMIT,a.CP_DOOR1,a.CP_DOOR2,a.CP_DOOR3,';
    stSql := stSql + ' a.CP_DOOR4,a.CP_DOOR5,a.CP_DOOR6,a.CP_DOOR7,a.CP_DOOR8,a.CP_ARMAREA0,a.CP_ARMAREA1,a.CP_ARMAREA2,';
    stSql := stSql + ' a.CP_ARMAREA3,a.CP_ARMAREA4,a.CP_ARMAREA5,a.CP_ARMAREA6,a.CP_ARMAREA7,a.CP_ARMAREA8,a.CP_RCVACK ';
    stSql := stSql + ' from TB_CARDPERMIT a  ';
    stSql := stSql + ' Inner Join TB_DEVICE d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
    stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
    stSql := stSql + ' INNER JOIN TB_NODE g ';
    stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = g.ND_NODENO ';
    stSql := stSql + ' AND g.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + '''';
    stSql := stSql + ' AND a.CP_RCVACK = ''N''';
    stSql := stSql + ' AND a.CP_CARDTYPE = ''2'''; //��й�ȣ

    if CardNodeList = nil then Exit;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          stNodeNo := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength);
          stEcuID := FindField('DE_ECUID').AsString;
          stCardNo := FindField('CA_CARDNO').AsString;
          stCardPermit := FindField('CP_PERMIT').AsString;
          if stCardPermit = '' then stCardPermit := '0';

          SetNodeToCardPermitInitialize(stNodeNo,stEcuID ,stCardNo ,stCardPermit,'1',
          FindField('CP_DOOR1').AsString,FindField('CP_DOOR2').AsString,FindField('CP_DOOR3').AsString,
          FindField('CP_DOOR4').AsString,FindField('CP_DOOR5').AsString,FindField('CP_DOOR6').AsString,
          FindField('CP_DOOR7').AsString,FindField('CP_DOOR8').AsString,FindField('CP_ARMAREA0').AsString,
          FindField('CP_ARMAREA1').AsString,FindField('CP_ARMAREA2').AsString,FindField('CP_ARMAREA3').AsString,
          FindField('CP_ARMAREA4').AsString,FindField('CP_ARMAREA5').AsString,FindField('CP_ARMAREA6').AsString,
          FindField('CP_ARMAREA7').AsString,FindField('CP_ARMAREA8').AsString,FindField('CP_RCVACK').AsString,
          '','','','','','','','','','19991231','1');

          dmDBUpdate.UpdateTB_CARDPERMIT_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('CA_CARDNO').AsString,'CP_RCVACK','S');  //������ ���� ����...

          //���⿡�� ���� ������ ��Ŷ �����Ͽ� Server �� ��������.
          nIndex := CardNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            stSendData := stNodeNo + stEcuID + stCardNo;
            stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardPositionNum(stEcuID,stCardNo);  //5�ڸ�
            stSendData := stSendData + stCardPermit[1];  //1�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardDoorPermit(stEcuID,stCardNo),'0',8);  //8�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardArmAreaPermit(stEcuID,stCardNo),'0',9);  //9�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardStartDate(stEcuID,stCardNo),'0',8,True);  //8�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardEndDate(stEcuID,stCardNo),'0',8,True);  //8�ڸ�
            stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardTimeCodeUse(stEcuID,stCardNo);  //1�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardTimeCode(stEcuID,stCardNo),'0',4,True);  //4�ڸ�
            stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardTimeGroup(stEcuID,stCardNo);  //1�ڸ�
            stSendData := stSendData + FillCharString(TvNodeCard(CardNodeList.Objects[nIndex]).GetCardWeekCode(stEcuID,stCardNo),'0',7,True);  //7�ڸ�
            stSendData := stSendData + TvNodeCard(CardNodeList.Objects[nIndex]).GetCardEMState(stEcuID,stCardNo);  //1�ڸ�

            stSendData := inttostr(con_cmdManagerToServerCardUpdate) + DATADELIMITER + stSendData + DATADELIMITER;
            if SendControlMessageList.indexOf(stSendData) < 0 then
              SendControlMessageList.Add(stSendData);
          end;

          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
  End;
end;

function TfmMain.LoadReaderTelNumberChangeData: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  nIndex : integer;
  stTemp : string;
  stNodeNo : string;
  stEcuID : string;
  stReaderNo : string;
  stSendData : string;
begin
  if G_bApplicationTerminate then Exit;

  Try
    stSql := ' select a.*,';
    stSql := stSql + ' b.RE_CARDREADERTEL0 as TEL0RCV,b.RE_CARDREADERTEL1 as TEL1RCV,b.RE_CARDREADERTEL2 as TEL2RCV,b.RE_CARDREADERTEL3 as TEL3RCV,b.RE_CARDREADERTEL4 as TEL4RCV,';
    stSql := stSql + ' b.RE_CARDREADERTEL5 as TEL5RCV,b.RE_CARDREADERTEL6 as TEL6RCV,b.RE_CARDREADERTEL7 as TEL7RCV,b.RE_CARDREADERTEL8 as TEL8RCV,b.RE_CARDREADERTEL9 as TEL9RCV ';
    stSql := stSql + ' from TB_READER a  ';
    stSql := stSql + ' Inner Join TB_READERRCV b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
    stSql := stSql + ' AND a.DE_EXTENDID = b.DE_EXTENDID ';
    stSql := stSql + ' AND a.RE_READERNO = b.RE_READERNO ';
    stSql := stSql + ' AND ( b.RE_CARDREADERTEL0 = ''C''  ';    //���⿡�� N �� �ε� �ϸ� ū�ϳ���... ���� ��� ī�帮���� �� N �̴�.
    stSql := stSql + ' OR  b.RE_CARDREADERTEL1 = ''C''  ';
    stSql := stSql + ' OR  b.RE_CARDREADERTEL2 = ''C''  ';
    stSql := stSql + ' OR  b.RE_CARDREADERTEL3 = ''C''  ';
    stSql := stSql + ' OR  b.RE_CARDREADERTEL4 = ''C''  ';
    stSql := stSql + ' OR  b.RE_CARDREADERTEL5 = ''C''  ';
    stSql := stSql + ' OR  b.RE_CARDREADERTEL6 = ''C''  ';
    stSql := stSql + ' OR  b.RE_CARDREADERTEL7 = ''C''  ';
    stSql := stSql + ' OR  b.RE_CARDREADERTEL8 = ''C''  ';
    stSql := stSql + ' OR  b.RE_CARDREADERTEL9 = ''C'' ';
    stSql := stSql + '     ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join TB_DEVICE d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID ';
    stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
    stSql := stSql + ' INNER JOIN TB_NODE g ';
    stSql := stSql + ' ON(a.GROUP_CODE = g.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = g.ND_NODENO ';
    stSql := stSql + ' AND g.ND_DECODERNO = ' + inttostr(G_nDecoderNo) + ')';
    stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + '''';

    if CardNodeList = nil then Exit;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          stNodeNo := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength);
          stEcuID := FindField('DE_ECUID').AsString;
          stReaderNo := FindField('RE_READERNO').AsString;

          if (FindField('TEL0RCV').AsString = 'C') OR (FindField('TEL0RCV').AsString = 'N') then
          begin
             stSendData := stNodeNo + stEcuID + stReaderNo;
             stSendData := stSendData + '0' + FindField('RE_CARDREADERTEL0').AsString;
             stSendData := inttostr(con_cmdManagerToServerReaderTelNumber) + DATADELIMITER + stSendData + DATADELIMITER;
             if SendControlMessageList.indexOf(stSendData) < 0 then
                SendControlMessageList.Add(stSendData);
             dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('RE_READERNO').AsString,'RE_CARDREADERTEL0','S');
          end;
          if (FindField('TEL1RCV').AsString = 'C') OR (FindField('TEL1RCV').AsString = 'N') then
          begin
             stSendData := stNodeNo + stEcuID + stReaderNo;
             stSendData := stSendData + '1' + FindField('RE_CARDREADERTEL1').AsString;
             stSendData := inttostr(con_cmdManagerToServerReaderTelNumber) + DATADELIMITER + stSendData + DATADELIMITER;
             if SendControlMessageList.indexOf(stSendData) < 0 then
                SendControlMessageList.Add(stSendData);
             dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('RE_READERNO').AsString,'RE_CARDREADERTEL1','S');
          end;
          if (FindField('TEL2RCV').AsString = 'C') OR (FindField('TEL2RCV').AsString = 'N') then
          begin
             stSendData := stNodeNo + stEcuID + stReaderNo;
             stSendData := stSendData + '2' + FindField('RE_CARDREADERTEL2').AsString;
             stSendData := inttostr(con_cmdManagerToServerReaderTelNumber) + DATADELIMITER + stSendData + DATADELIMITER;
             if SendControlMessageList.indexOf(stSendData) < 0 then
                SendControlMessageList.Add(stSendData);
             dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('RE_READERNO').AsString,'RE_CARDREADERTEL2','S');
          end;
          if (FindField('TEL3RCV').AsString = 'C') OR (FindField('TEL3RCV').AsString = 'N') then
          begin
             stSendData := stNodeNo + stEcuID + stReaderNo;
             stSendData := stSendData + '3' + FindField('RE_CARDREADERTEL3').AsString;
             stSendData := inttostr(con_cmdManagerToServerReaderTelNumber) + DATADELIMITER + stSendData + DATADELIMITER;
             if SendControlMessageList.indexOf(stSendData) < 0 then
                SendControlMessageList.Add(stSendData);
             dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('RE_READERNO').AsString,'RE_CARDREADERTEL3','S');
          end;
          if (FindField('TEL4RCV').AsString = 'C') OR (FindField('TEL4RCV').AsString = 'N') then
          begin
             stSendData := stNodeNo + stEcuID + stReaderNo;
             stSendData := stSendData + '4' + FindField('RE_CARDREADERTEL4').AsString;
             stSendData := inttostr(con_cmdManagerToServerReaderTelNumber) + DATADELIMITER + stSendData + DATADELIMITER;
             if SendControlMessageList.indexOf(stSendData) < 0 then
                SendControlMessageList.Add(stSendData);
             dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('RE_READERNO').AsString,'RE_CARDREADERTEL4','S');
          end;
          if (FindField('TEL5RCV').AsString = 'C') OR (FindField('TEL5RCV').AsString = 'N') then
          begin
             stSendData := stNodeNo + stEcuID + stReaderNo;
             stSendData := stSendData + '5' + FindField('RE_CARDREADERTEL5').AsString;
             stSendData := inttostr(con_cmdManagerToServerReaderTelNumber) + DATADELIMITER + stSendData + DATADELIMITER;
             if SendControlMessageList.indexOf(stSendData) < 0 then
                SendControlMessageList.Add(stSendData);
             dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('RE_READERNO').AsString,'RE_CARDREADERTEL5','S');
          end;
          if (FindField('TEL6RCV').AsString = 'C') OR (FindField('TEL6RCV').AsString = 'N') then
          begin
             stSendData := stNodeNo + stEcuID + stReaderNo;
             stSendData := stSendData + '6' + FindField('RE_CARDREADERTEL6').AsString;
             stSendData := inttostr(con_cmdManagerToServerReaderTelNumber) + DATADELIMITER + stSendData + DATADELIMITER;
             if SendControlMessageList.indexOf(stSendData) < 0 then
                SendControlMessageList.Add(stSendData);
             dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('RE_READERNO').AsString,'RE_CARDREADERTEL6','S');
          end;
          if (FindField('TEL7RCV').AsString = 'C') OR (FindField('TEL7RCV').AsString = 'N') then
          begin
             stSendData := stNodeNo + stEcuID + stReaderNo;
             stSendData := stSendData + '7' + FindField('RE_CARDREADERTEL7').AsString;
             stSendData := inttostr(con_cmdManagerToServerReaderTelNumber) + DATADELIMITER + stSendData + DATADELIMITER;
             if SendControlMessageList.indexOf(stSendData) < 0 then
                SendControlMessageList.Add(stSendData);
             dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('RE_READERNO').AsString,'RE_CARDREADERTEL7','S');
          end;
          if (FindField('TEL8RCV').AsString = 'C') OR (FindField('TEL8RCV').AsString = 'N') then
          begin
             stSendData := stNodeNo + stEcuID + stReaderNo;
             stSendData := stSendData + '8' + FindField('RE_CARDREADERTEL8').AsString;
             stSendData := inttostr(con_cmdManagerToServerReaderTelNumber) + DATADELIMITER + stSendData + DATADELIMITER;
             if SendControlMessageList.indexOf(stSendData) < 0 then
                SendControlMessageList.Add(stSendData);
             dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('RE_READERNO').AsString,'RE_CARDREADERTEL8','S');
          end;
          if (FindField('TEL9RCV').AsString = 'C') OR (FindField('TEL9RCV').AsString = 'N') then
          begin
             stSendData := stNodeNo + stEcuID + stReaderNo;
             stSendData := stSendData + '9' + FindField('RE_CARDREADERTEL9').AsString;
             stSendData := inttostr(con_cmdManagerToServerReaderTelNumber) + DATADELIMITER + stSendData + DATADELIMITER;
             if SendControlMessageList.indexOf(stSendData) < 0 then
                SendControlMessageList.Add(stSendData);
             dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('RE_READERNO').AsString,'RE_CARDREADERTEL9','S');
          end;


          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
  End;
end;

function TfmMain.LoadTB_CARDHIS_Change: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  nIndex : integer;
  stTemp : string;
  stNodeNo : string;
  stEcuID : string;
  stReaderNo : string;
  stSendData : string;
begin
  if G_bApplicationTerminate then Exit;
  Try
    stSql := ' select * from TB_CARDHIS';
    stSql := stSql + ' Where CA_INSERTTIME > ''' + L_stCardHisLoadTime + ''' ';
    if CardNodeList = nil then Exit;

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        sql.Text := stSql;

        Try
          Open;
        Except
          //����ó��
          Exit;
        End;
        if RecordCount < 1 then Exit;
        First;
        while Not Eof do
        begin
          nIndex := CardEmList.IndexOf(FindField('CA_OLDCARDNO').AsString);
          if (nIndex > -1) then CardEmList.Delete(nIndex);
          L_stCardHisLoadTime := FindField('CA_INSERTTIME').AsString;
          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
  End;
end;

procedure TfmMain.LoadTB_CONFIG;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    G_nCardNoType := 0; //����Ʈ�� ���� 4Byte ���
    G_nFormLanguageType := 1;       //�� ��� Ÿ�� 1.KOR,2.ENG
    G_nCompanyCodeLength := 3;       //
    G_nBuildingCodeLength := 3;       //

    G_stDaemonControlPort := '5101';
    G_stLongTimeStateCode := '';

    G_bCardPositionUse := False; //ī�� ��ġ���� ��� ����
    G_bExitButtonEventUse := False;   //�����̷¸� ������.
    G_bDoorLongTimeOpenEventUse := False;  //��ð����Թ������� �˶� �̺�Ʈ ������ ����
    G_bDeviceCommLogSave := False;
    G_nScheduleDevice := 0;  //0.��Ʈ�ѷ�������,1.PC������
    G_bAlarmEventLengthUse := False; //�˶� �̺�Ʈ ó���� �������� ó����(STX/KT/��Ÿ)
    G_nAlarmEventLength := 10;

    G_bDataBaseAutoBackup := TRUE;
    G_stDataBaseBackupDir := 'c:\Backup';
    G_nDataBaseBackupCycle := 10;
    G_nDataBaseACEventdeleteDay := 360;
    G_nDataBasePTEventdeleteDay := 360;
    G_bAlarmMonitoringUse := False;
    G_bCardButtonEventStatictcs := False;
    G_bCardSync := True;

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
(*    stSql := stSql + ' AND (CO_CONFIGGROUP = ''DAEMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''CARD'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''FIRE'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''DATABASE'') ';  *)

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','GetTB_Config');
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGGROUP').AsString = 'DAEMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ALARMLEN' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nAlarmEventLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'COMMLOG' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bDeviceCommLogSave := False
            else G_bDeviceCommLogSave := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'CONTROLPORT' then G_stDaemonControlPort := FindField('CO_CONFIGVALUE').asstring
          else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMEALARMUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bDoorLongTimeOpenEventUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMECD' then
          begin
            G_stLongTimeStateCode := Trim(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'SCHDEVICE' then G_nScheduleDevice := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'USEARMLEN' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'TRUE' then G_bAlarmEventLengthUse := False
            else G_bAlarmEventLengthUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'HOLIDAYSENDYEAR' + inttostr(G_nDecoderNo) then
          begin
            L_stHolidaySendYear := FindField('CO_CONFIGVALUE').AsString;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ACEVENT' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bExitButtonEventUse := False
            else G_bExitButtonEventUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'ALARMMONITORING' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAlarmMonitoringUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'ATAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAttendDedicateDoorUse := True
            else G_bAttendDedicateDoorUse := False;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'BUILDINGCODELENGTH' then G_nBuildingCodeLength := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CARDBUTTONSTAT' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bCardButtonEventStatictcs := True
            else G_bCardButtonEventStatictcs := False;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then G_nCardNoType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CAPOSINUM' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bCardPositionUse := True;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'COMPANYCODELENGTH' then G_nCompanyCodeLength := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'LANGUAGE' then G_nFormLanguageType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'FDAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFoodDedicateDoorUse := True
            else G_bFoodDedicateDoorUse := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'NODELENGTH' then
          begin
            G_nNodeCodeLength := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'PGTYPE' then
          begin
            G_nMonitoringType := FindField('CO_CONFIGVALUE').AsInteger;
          end
          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'CARD' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'DEFAULTDOORPERMITTYPE' then
          begin
            G_nCardDefaultDoorPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTARMPERMITTYPE' then
          begin
            G_nCardDefaultArmPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'SYNC' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '0' then G_bCardSync := False;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'DATABASE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'AUTO' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'FALSE' then G_bDataBaseAutoBackup := False;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'BACKDIR' then G_stDataBaseBackupDir := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'BACKCYCLE' then  G_nDataBaseBackupCycle := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'AC_DELETE' then G_nDataBaseACEventdeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'PT_DELETE' then G_nDataBasePTEventdeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGGROUP').AsString = 'FIRE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'USEFIREOPEN' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bFireDoorOpenUse := False
            else G_bFireDoorOpenUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'STATECODE' then
          begin
            G_stFireStateCode := FindField('CO_CONFIGVALUE').AsString;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'ANTIPASS' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ANTIFREE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
               G_nAntiFreeTimeUse := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'ANTIFREETIME' then
          begin
            G_stAntiFreeTime := FindField('CO_CONFIGVALUE').AsString;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'VISIT' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'USE' then
          begin
            G_nVisitUse := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'CODE' then
          begin
            G_stVisitCode := FindField('CO_CONFIGVALUE').AsString;
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;

    if G_nAntiFreeTimeUse = 0 then G_stAntiFreeTime := '0'
    else
    begin
      if Not isDigit(G_stAntiFreeTime) then G_stAntiFreeTime := '0';
    end;


  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.MDIChildShow(FormName: String);
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        if Screen.ActiveForm = Screen.Forms[i] then
        begin
          //Screen.Forms[i].WindowState := wsMaximized;
          Exit;
        end;
        Screen.Forms[i].Show;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    tmpForm.Show;
  end;
end;

function TfmMain.MDIForm(FormName: string): TForm;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        result := Screen.Forms[i];
        Exit;
      end;
    end;
  end;
end;

procedure TfmMain.MemoryEvent(aEventType, aTxRx, aData: string);
var
  fmTemp : TForm;
begin
  if G_bFormEnabled[conFORMPCCOMMONITORING] then
  begin
    fmTemp := MDIForm('TfmPCComMonitoring');
    if fmTemp <> nil then TfmPCComMonitoring(fmTemp).MemoryEvent(aEventType, aTxRx, aData);
  end;
  //LogSave(G_stLogDirectory + '\MemoryEvent' + FormatDateTime('yyyymmdd',now) + inttostr(G_nDecoderNo) + '.log',aEventType + aTxRx + aData);
end;

procedure TfmMain.MemoryReadTimerTimer(Sender: TObject);
var
  mmf_data : array [0..k_max_info_size-1] of WideChar;
  i : integer;
  nIndex : integer;
begin
  if G_bApplicationTerminate then Exit;
  if L_bMemoryRead then Exit;
  Try
    L_bMemoryRead := True;

    if oControlRecvMemory.Read_Info (mmf_data) = true then
    begin
      L_dtDeviceServerAliveTime := now;
      //���⿡�� Control ���۸� ��������.
      nIndex := SendControlMessageList.IndexOf(UnicodeString(mmf_data));
      if nIndex > -1 then
      begin
        SendControlMessageList.Delete(nIndex);
        L_bSendControlAck := True;
      end;
      MemoryEvent('Control','RX',UnicodeString(mmf_data));

      for i := Low (mmf_data) to High (mmf_data) do
      begin
        mmf_data [i] := char (0);
      end;
      oControlRecvMemory.Write_Info(mmf_data);
    end;
    if oEventRecvMemory.Read_Info (mmf_data) = true then
    begin
      L_dtDeviceServerAliveTime := now;
      //���⿡�� Event ���۸� ���� ����.
      nIndex := SendEventMessageList.IndexOf(UnicodeString(mmf_data));
      if nIndex > -1 then
      begin
        SendEventMessageList.Delete(nIndex);
        L_bSendEventAck := True;
      end;
      MemoryEvent('Event','RX',UnicodeString(mmf_data));
      for i := Low (mmf_data) to High (mmf_data) do
      begin
        mmf_data [i] := char (0);
      end;
      oEventRecvMemory.Write_Info(mmf_data);
    end;
  Finally
    L_bMemoryRead := False;
  End;
end;

procedure TfmMain.MIAMS_DeviceServerControlMessageDataSend(aCmd: integer;
  aMessage: UnicodeString);
var
  mmf_data : array [0..k_max_info_size-1] of char;
begin
  StrPCopy (mmf_data, aMessage);
  oControlSendMemory.Write_Info(mmf_data);

  MemoryEvent('Control','TX',aMessage);
end;

procedure TfmMain.MIAMS_DeviceServerEventMessageDataSend(aCmd: integer;
  aMessage: UniCodeString);
var
  mmf_data : array [0..k_max_info_size-1] of Widechar;
begin
  StrPCopy (mmf_data, aMessage);
  oEventSendMemory.Write_Info(mmf_data);
  MemoryEvent('Event','TX',aMessage);
end;


function TfmMain.MIAMS_DeviceServerExecute: Boolean;
begin
  result := False;
  L_dtDeviceServerAliveTime := now;

  //���⿡�� ���α׷� ���� ��Ű��.
  if FileExists(G_stExeFolder + '\GMS_DeviceServer' +inttostr(G_nDecoderNo) + '.exe') then
  begin
    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\GMS_DeviceServer' +inttostr(G_nDecoderNo) + '.exe'),'','', SW_Normal);
    sb_Status.Panels[2].Text := G_stExeFolder + '\GMS_DeviceServer' +inttostr(G_nDecoderNo) + '.exe';
    result := True;
  end;
end;

function TfmMain.MIAMS_DeviceServerTerminate: Boolean;
var
  hMutex : LongInt;
  DaemonGubun:string;
  FindHandle: THandle;
  ProcessList : TStringList;
  i : integer;
  ProcId: DWORD;
  hProcess: THandle;
  pSelfID : DWORD;
begin
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_DeviceServer' +inttostr(G_nDecoderNo) + '.exe') then  //���� �ǰ� ������
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            // ������ process�� ���� �����Ų��
            TerminateProcess(hProcess, 0);
          end;
        end;
      end;
    end;
  Finally
    ProcessList.Free;
  End;
end;

procedure TfmMain.mn_PCMonitorClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmPCComMonitoring');
  self.FindClassForm('TfmPCComMonitoring').FindCommand('FORMNAME').Params.Values['CAPTION'] := mn_PCMonitor.Caption;
  self.FindClassForm('TfmPCComMonitoring').FindCommand('FORMNAME').Execute;

end;

procedure TfmMain.mn_trayCloseClick(Sender: TObject);
begin
  inherited;
  L_bClose := True;
  Close;

end;

procedure TfmMain.mn_trayVisibleClick(Sender: TObject);
begin
  inherited;
  TrayIcon1DblClick(self);

end;


procedure TfmMain.NowTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  Try
    NowTimer.Enabled := False;
    NowDate := FormatDateTime('yyyymmdd',Now);
  Finally
    NowTimer.Enabled := Not G_bApplicationTerminate;
  End;

end;

function TfmMain.RcvDeviceTimeCodeRegProcess(aNodeNo, aEcuID, amsgCode,
  aRealData: string): Boolean;
begin
 result := True;
end;

function TfmMain.ReceiveDoorHolidayRegist(aNodeNo, aEcuID, amsgCode,
  aRealData: string): Boolean;
var
  stDoorNo : string;
  stUse : string;
  stMonth : string;
  stDate : string;
begin
  if aRealData[5] = 'A' then stUse := '1'
  else stUse := '0';
  stMonth := copy(aRealData,6,2);
  stDate := copy(aRealData,6,4);

  case amsgCode[1] of
    'q' : begin
      result := dmDBUpdate.UpdateTB_HOLIDAYDEVICE_DaySendStatus(aNodeNo,aEcuID,Formatdatetime('yyyy',now) + stDate,stUse,'Y');
    end;
  end;
end;

function TfmMain.ReceiveDoorScheduleRegist(aNodeNo, aEcuID, amsgCode,
  aRealData: string): Boolean;
var
  stDoorNo : string;
  stDayCode : string;
begin
  result := False;
  stDoorNo:=  aRealData[3];
  stDayCode := aRealData[5];

end;

function TfmMain.ReceiveDoorSettingInformtion(aNodeNo,aEcuID,amsgCode, aRealData: string): Boolean;
var
  stDoorNo : string;
  stCardMode : string;
  stDOORMODE : string;
  stCONTROLTIME : string;
  stLONGOPENTIME : string;
  stSCHEDULEUSE : string;
  stDOORSTATE : string;
  nAntiPassNo : integer;
  stLONGOPENALARM : string;
  nLOCKTYPE : integer;
  stFIREDOOROPEN : string;
  stDSOPENSTATE : string;
  stREMOTEDISARMDOOROPEN : string;
begin
  result := False;
  stDoorNo:=  aRealData[3];
  stCardMode := aRealData[6];
  stDOORMODE := aRealData[7];
  stCONTROLTIME := ControlTimechar2DecType(aRealData[8]);
  stLONGOPENTIME := inttostr(Ord(aRealData[9]) - $30);
  stSCHEDULEUSE := aRealData[10];
  stDOORSTATE := aRealData[11];
  if isDigit(aRealData[13]) then nAntiPassNo := strtoint(aRealData[13]) //AntiPassNo
  else nAntiPassNo := 0;
  stLONGOPENALARM := aRealData[14];          //��ð� ���� �������
  nLOCKTYPE := ord(aRealData[16]) - $30;   //������ Ÿ��
  stFIREDOOROPEN := aRealData[17];          //ȭ�� �߻��� ������
//  DSLSCHECK := aRealData[18];             //DS LS �˻�(������:����)
  stDSOPENSTATE := aRealData[19];           //���Թ��������� (DS OPEN 0x30,DS CLOSE 0x31)
  stREMOTEDISARMDOOROPEN := aRealData[20];  //���������� (DoorOpen 0x30,DoorClose 0x31)

  case amsgCode[1] of
    'a','g' : begin    //��Ͻÿ��� ������ ��������� ��������...
      result := dmDBUpdate.UpdateTB_DOOR_DOORSettingInfoValue(aNodeNo, aEcuID,'0',
        stDoorNo, stCardMode, stDoorMode, stControlTime, stLongOpenTime, stScheduleUse,
        stDoorState, inttostr(nAntiPassNo), stLongOpenAlarm, inttostr(nLOCKTYPE), stFIREDOOROPEN, stDSOPENSTATE,
        stREMOTEDISARMDOOROPEN);
      dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(aNodeNo,aEcuID,'0',stDoorNo,'DO_SETTINGINFO','Y');
      dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(aNodeNo,aEcuID,'0',stDoorNo,'DO_DOORSCHUSE','Y');

    end;
    'b' : begin        //��ȸ �ÿ��� ������ ��������� �������� ����...
      result := dmDBUpdate.UpdateTB_DOOR_DOORSettingInfoValue(aNodeNo, aEcuID,'0',
        stDoorNo, stCardMode, stDoorMode, stControlTime, stLongOpenTime, '',
        stDoorState, inttostr(nAntiPassNo), stLongOpenAlarm, inttostr(nLOCKTYPE), stFIREDOOROPEN, stDSOPENSTATE,
        stREMOTEDISARMDOOROPEN);
      dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(aNodeNo,aEcuID,'0',stDoorNo,'DO_SETTINGINFO','Y');
    end;
  end;
end;

procedure TfmMain.ServerCheckTimerTimer(Sender: TObject);
var
  dtTimeOut : TDateTime;
begin
  inherited;
  if G_bApplicationTerminate then Exit;

  Try
    dtTimeOut:= IncTime(L_dtDeviceServerManagerAliveTime,0,0,30,0);   //30�� ���� �ְ����� �����Ͱ� ������ ALIVE �� �����Ѵ�.
    if Now > dtTimeOut then
    begin
      L_dtDeviceServerManagerAliveTime := now;
      MIAMS_DeviceServerControlMessageDataSend(0,inttostr(con_cmdManagerToServerACK) + DATADELIMITER + 'ALIVE' + DATADELIMITER);
    end;

    dtTimeOut:= IncTime(L_dtDeviceServerAliveTime,0,1,0,0);   //1�� ���� �ְ����� �����Ͱ� ������ ���ڴ��δ��� ���� �� �ٽ� �⵿ ��Ű��.
    if Now > dtTimeOut then
    begin
      MIAMS_DeviceServerTerminate;
      MIAMS_DeviceServerExecute;
    end;

  Except
  End;
end;

procedure TfmMain.ServerSendTimerTimer(Sender: TObject);
var
  i : integer;
  FirstTickCount : double;
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if L_bServerDirectSend then Exit;
  Try
    L_bServerDirectSend := True;

    L_bSendControlAck := False;
    if SendControlMessageList.Count > 0 then
    begin
      L_dtDeviceServerManagerAliveTime := now;
      MIAMS_DeviceServerControlMessageDataSend(0,SendControlMessageList.strings[0]);
    end else L_bSendControlAck := True;
    FirstTickCount := GetTickCount + 1000;   //1�ʵ��� �������.
    while Not L_bSendControlAck do
    begin
      if GetTickCount > FirstTickCount then Break;
      sleep(1);
      Application.ProcessMessages;
    end;
    if G_bApplicationTerminate then Exit;
    L_bSendEventAck := False;
    if SendEventMessageList.Count > 0 then
    begin
      L_dtDeviceServerManagerAliveTime := now;
      MIAMS_DeviceServerEventMessageDataSend(0,SendEventMessageList.strings[0]);
    end else L_bSendEventAck := True;
    FirstTickCount := GetTickCount + 3000;   //1�ʵ��� �������.
    while Not L_bSendEventAck do
    begin
      if GetTickCount > FirstTickCount then Break;
      sleep(1);
      Application.ProcessMessages;
    end;
  Finally
    L_bServerDirectSend := False;
  End;
end;

function TfmMain.SetNodeToCardPermitInitialize(aNodeNo, aEcuID, aCardNo,
  aCardPermit, aCardState, aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6,
  aDoor7, aDoor8, aArmArea0, aArmArea1, aArmArea2, aArmArea3, aArmArea4,
  aArmArea5, aArmArea6, aArmArea7, aArmArea8, aRcvAck, aPositionNum,
  aTimeCodeUse, aTCGroup, aTime1, aTime2, aTime3, aTime4, aTCWeekCode, aRegDate,
  aEndDate, aEmState: string):integer;
var
  nIndex : integer;
  oCardNode : TvNodeCard;
begin
  if G_bApplicationTerminate then Exit;

  result := -1;
  nIndex := CardNodeList.IndexOf(aNodeNo);
  if nIndex < 0 then
  begin
    oCardNode := TvNodeCard.Create(nil);
    oCardNode.NodeNo := aNodeNo;
    CardNodeList.AddObject(aNodeNo,oCardNode);
    nIndex := CardNodeList.IndexOf(aNodeNo);
  end;
  if nIndex < 0 then Exit; //���⿡�� ���� ������ ���� ������ �ִ°Ŵ�.
  result := TvNodeCard(CardNodeList.Objects[nIndex]).SetNodeToCardPermitInitialize(aEcuID,aCardNo,aCardPermit,aCardState,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
          aArmArea0,aArmArea1,aArmArea2,aArmArea3,aArmArea4,aArmArea5,aArmArea6,aArmArea7,aArmArea8,aRcvAck,aPositionNum,
          aTimeCodeUse,aTCGroup,aTime1,aTime2,aTime3,aTime4,aTCWeekCode,aRegDate,aEndDate,aEmState);

end;

procedure TfmMain.SetNowDate(const Value: String);
var
  i : integer;
begin
  if FNowDate = Value then Exit;

  FNowDate := Value;
  dmDBUpdate.UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(FormatDateTime('yyyy',now),'R','N',inttostr(G_nDecoderNo)); //������ ������ �� ������ ������ ����.
  //dmDBUpdate.UpdateTB_HOLIDAYDEVICE_CurrentYearSendStatus(FormatDateTime('yyyy',now),'S','N'); //������ ������ �� ������ ������ ����.

  dmDBUpdate.UpdateTB_DOORSCHEDULE_SendStatus('R','N',inttostr(G_nDecoderNo));  //���Թ������� ������� �����۰� ������ ����������.
  //dmDBUpdate.UpdateTB_DOORSCHEDULE_SendStatus('S','N');

  dmDBUpdate.UpdateTB_DEVICERCV_TIMECODEUSEAllChange('R','U',inttostr(G_nDecoderNo));  //���Թ� Ÿ���ڵ� ������� �����۰� ������ ����������.
  //dmDBUpdate.UpdateTB_DEVICERCV_TIMECODEUSEAllChange('S','U');

  dmDBUpdate.UpdateTB_TIMECODEDEVICE_SendStatus('R','N',inttostr(G_nDecoderNo));    //��Ʈ�ѷ� �ð� ������
  //dmDBUpdate.UpdateTB_TIMECODEDEVICE_SendStatus('S','N');

  //�̼۽� ī�� ���� ������ ������
  dmDBFunction.ChangeTB_CARDPERMIT_AllRCVACK('S','N',inttostr(G_nDecoderNo));

  dmDBUpdate.UpdateTB_DOORRCV_AllRcvAck('DO_DOORSCHUSE','S','N',inttostr(G_nDecoderNo));

  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL0','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL1','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL2','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL3','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL4','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL5','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL6','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL7','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL8','S','C',inttostr(G_nDecoderNo));
  dmDBUPdate.UpdateTB_READERRCV_AllRCVACK('RE_CARDREADERTEL9','S','C',inttostr(G_nDecoderNo));

  //Employee �޸� Clear
  if CardEmList.Count > 1 then
  begin
    for i := CardEmList.Count - 1 downto 0 do
    begin
      TCard(CardEmList.Objects[i]).Free;
    end;
    CardEmList.Clear;
  end;

end;

procedure TfmMain.StartMenuMenuItems1Click(Sender: TObject);
begin
  inherited;
  mn_trayCloseClick(mn_trayClose);
end;

procedure TfmMain.TrayIcon1DblClick(Sender: TObject);
begin
  inherited;
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  Show();
  WindowState := wsNormal;
  Application.BringToFront();

end;

procedure TfmMain.TrayTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  TrayTimer.Enabled := False;
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  WindowState := wsMinimized;
  exit;
  { Show the animated tray icon and also a hint balloon. }
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;


procedure TfmMain.WndProc(var Message: TMessage);
begin
  inherited;
  if Message.Msg=WM_ENDSESSION then begin
    if Not G_bApplicationTerminate then
    begin
      L_bClose := True;
      Close;
    end;
  end else if Message.Msg = WM_QUERYENDSESSION then begin
    if Not G_bApplicationTerminate then
    begin
      L_bClose := True;
      Close;
    end;
    Message.Result := 1;
  end;
end;

end.