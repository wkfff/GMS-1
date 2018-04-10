unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, AdvToolBar,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, AdvToolBarStylers, AdvMenus, AdvMenuStylers,
  Vcl.Menus, Vcl.ImgList, AdvPreviewMenu, AdvPreviewMenuStylers,ActiveX,ADODB,uSubForm,
  CommandArray, Vcl.Imaging.pngimage,DateUtils, AdvAppStyler;

type
  TFoodDetail = class(TComponent)
  private
    FStartTime: string;
    FAmt: integer;
    FEndTime: string;
    FFoodCode: string;
  public
    property FoodCode : string read FFoodCode write FFoodCode;
    property StartTime : string read FStartTime write FStartTime;
    property EndTime : string read FEndTime write FEndTime;
    property Amt : integer read FAmt write FAmt;
  end;
  TFoodCode = class(TComponent)
  private
    FoodCodeList : TStringList;
    FFoodCodeName: string;
    FFoodType: string;
    FYesterDayTime: string;
  published
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property FoodType : string read FFoodType write FFoodType;
    property FoodCodeName : string read FFoodCodeName write FFoodCodeName;
    property YesterDayTime : string read FYesterDayTime  write FYesterDayTime;
  public
    procedure AddFoodCode(aFoodType,aFoodCode,aFoodCodeName,aStartTime,aEndTime,aAmt:string);
    function GetFoodCode(aTime:string;var aFoodCode,aFoodAmt:string):Boolean;
  end;

  TfmMain = class(TfmASubForm)
    StartMenu: TAdvPreviewMenu;
    AdvPreviewMenuOfficeStyler2: TAdvPreviewMenuOfficeStyler;
    TrayIcon1: TTrayIcon;
    TrayImageList: TImageList;
    pm_TrayMenu: TPopupMenu;
    mn_trayVisible: TMenuItem;
    N2: TMenuItem;
    mn_trayClose: TMenuItem;
    TrayTimer: TTimer;
    AdvPreviewMenuOfficeStyler1: TAdvPreviewMenuOfficeStyler;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    Image1: TImage;
    at_Menu: TAdvToolBarPager;
    AdvPage7: TAdvPage;
    ATTimer: TTimer;
    FoodTimer: TTimer;
    AdvFormStyler1: TAdvFormStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    mn_CodeAdmin: TAdvToolBar;
    btn_ConfigSetting: TAdvGlowButton;
    mn_Upgrade: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    MenuImageList32: TImageList;
    MenuDisImageList32: TImageList;
    RelayTimer: TTimer;
    RelayAdoConnectCheckTimer1: TTimer;
    RelayAdoConnectCheckTimer2: TTimer;
    AdvToolBar1: TAdvToolBar;
    btn_ATReaderSetting: TAdvGlowButton;
    AdvToolBar2: TAdvToolBar;
    btn_FoodReaderSetting: TAdvGlowButton;
    btn_AtResummery: TAdvGlowButton;
    pm_NowRelay: TMenuItem;
    N3: TMenuItem;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mn_trayCloseClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure mn_trayVisibleClick(Sender: TObject);
    procedure TrayTimerTimer(Sender: TObject);
    procedure ATTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ConfigSettingClick(Sender: TObject);
    procedure CommandArrayCommandsTFORMENABLEExecute(Command: TCommand;
      Params: TStringList);
    procedure FormShow(Sender: TObject);
    procedure mn_UpgradeClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FoodTimerTimer(Sender: TObject);
    procedure btn_ATReaderSettingClick(Sender: TObject);
    procedure btn_FoodReaderSettingClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RelayAdoConnectCheckTimer1Timer(Sender: TObject);
    procedure RelayTimerTimer(Sender: TObject);
    procedure RelayAdoConnectCheckTimer2Timer(Sender: TObject);
    procedure btn_AtResummeryClick(Sender: TObject);
    procedure pm_NowRelayClick(Sender: TObject);
  private
    WorkTypeList : TStringList;      //근무환경타입에 따라 변경됨
    DeviceATTypeList : TStringList;      //근무지역에 따른 근태처리형태
    EmployeeList : TStringList;      //사원정보리스트
    FoodTypeList : TStringList;
    L_dtRelayActionTime : TDatetime;
    L_stLogDirectory : string;
    L_stFoodWorkTime : string;
    L_bAcademyAttend : Boolean;
    L_bAttendUse : Boolean;
    L_bAttendDataCreate : Boolean;
    L_bFoodDataCreate : Boolean;
    L_bClose : Boolean;
    procedure AttendDataCreate;
    procedure FoodDataCreate;
    procedure FoodDataSummary;
    procedure MemoryCreate;
    procedure MemoryFree;
    Procedure MDIChildShow(FormName:String);

    Function GetEmployeeAttendWorkType(aEmSeq:string) : string;
    Function GetFoodType : Boolean;
    Function GetTB_Config_Attend : Boolean;
    Function GetTB_ATTENDWORKTYPE : Boolean;
    Function GetTB_ATTENDPOSITION : Boolean;
    Function LoadDoorRelayCode(aAll:Boolean=True) : Boolean;

    Function DeviceATTypeListClear : Boolean;
    Function FoodTypeListClear : Boolean;
    Function WorkTypeListClear : Boolean;

    Procedure RelayDBConnected(Sender: TObject; aSessionNo:integer; DBConnected: Boolean); //AdoConnected
    procedure RelayDBEvent(Sender: TObject; aSession:integer; aData:string);

  private
    { Private declarations }
    wmTaskbar : word;
    procedure AppException( Sender:  TObject;  E:  Exception) ;
    procedure DefaultHandler(var Message);override;
  public
    L_bATReSummary : Boolean;
    L_stWorkTime : string;
    L_bATSummary : Boolean;
    { Public declarations }
    Function LoadConfig : Boolean;
  end;

var
  fmMain: TfmMain;

implementation
uses
  uATReSummary,
  uAttendEvent,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDataBaseConfig,
  uDBCardPermit,
  uDBSelect,
  uDBUpdate,
  uDBFunction,
  uDBInsert,
  uDBRelay,
  uEmployeeRelay,
  uFormVariable;

{$R *.dfm}

{ TfmMain }

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
  LogSave(L_stLogDirectory + '\AFServerApplication' + FormatDateTime('yyyymmdd',now) + '.log',sObj);
end;

procedure TfmMain.AttendDataCreate;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stAccessTime : string;
  stEmSeq : string;
  stAWCode : string;
  stAtReaderNo : string;
  nDeviceIndex : integer;
  nWorkCodeIndex : integer;
  stTemp : string;
  nResult : integer;
  stInstate,stOutstate : string;
  stAcademyAtType,stSMSMessage,stPhoneNum : string;
  dtTempTime : TDate;
begin
  if L_bATReSummary then Exit;
  stSql := ' Update TB_ACCESSEVENT set AE_ATSUMMARY = ''R'' where AE_ATSUMMARY is null ';
  dmDataBase.ProcessExecSQL(stSql);
  //stSql := dmDBSelect.SelectTB_ACCESSEVENT_ATWork(L_stWorkTime);
  stSql := dmDBSelect.SelectTB_ACCESSEVENT_ATSUMMARY;
  Try
    L_bATSummary := True;
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
      if recordCount < 1 then Exit;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;

        stAccessTime := FindField('AE_DATE').AsString + FindField('AE_TIME').AsString;
        stEmSeq := FindField('EM_SEQ').AsString;
//        if stEmSeq = '539' then
//        begin
//          stTemp := stEmSeq;
//        end;
        stAWCode := GetEmployeeAttendWorkType(stEmSeq);
        stAtReaderNo := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString  + FindField('DE_EXTENDID').AsString + FindField('RE_READERNO').AsString;
        nDeviceIndex := DeviceATTypeList.IndexOf(stAtReaderNo);
        if nDeviceIndex > -1 then
        begin
          //근태리더 처리하자.
          nWorkCodeIndex := WorkTypeList.IndexOf(stAWCode);
          if nWorkCodeIndex > -1 then
          begin
            nResult := TdmAttendEvent(WorkTypeList.Objects[nWorkCodeIndex]).AttendProcess(stEmSeq,FindField('EM_CODE').AsString,FindField('EM_NAME').AsString,FindField('CO_COMPANYCODE').AsString,
                           stAccessTime,stAtReaderNo,FindField('DO_DOORNO').AsString,FindField('CA_CARDNO').AsString,FindField('AE_CONTROLTYPECODE').AsString,FindField('AE_BUTTON').AsString,
                           TAttendPosition(DeviceATTypeList.Objects[nDeviceIndex]).DEVICETYPE,TAttendPosition(DeviceATTypeList.Objects[nDeviceIndex]).STARTBUTTON,
                           TAttendPosition(DeviceATTypeList.Objects[nDeviceIndex]).OFFBUTTON,TAttendPosition(DeviceATTypeList.Objects[nDeviceIndex]).INOUTDEVICETYPE,
                           TAttendPosition(DeviceATTypeList.Objects[nDeviceIndex]).WORKOUTBUTTON,TAttendPosition(DeviceATTypeList.Objects[nDeviceIndex]).WORKINBUTTON);
            if nResult < 0 then Exit;
          end;
        end;
        L_stWorkTime := FindField('AE_INSERTTIME').AsString;
        dmDBUpdate.UpdateTB_ACCESSEVENT_Field_StringValue(FindField('AE_DATE').AsString,FindField('AE_TIME').AsString,
                   FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,
                   FindField('DO_DOORNO').AsString,FindField('CA_CARDNO').AsString,'AE_ATSUMMARY','Y');  //근태 집계 셋팅

        if L_bAcademyAttend then
        begin
          stAcademyAtType := '';
          if dmDBFunction.CheckTB_ACademyAttend_Key(FormatDateTime('yyyymmdd',now),stEmSeq,stInstate,stOutstate) = 1 then
          begin
            if(stInstate='') and (stOutstate = '') then
            begin
              //여기는 등원 처리하자.
              dmDBUpdate.UpdateTB_ACademyAttend_Field_StringValue(FindField('AE_DATE').AsString,stEmSeq,'AA_INTIME',FindField('AE_TIME').AsString);
              dmDBUpdate.UpdateTB_ACademyAttend_Field_StringValue(FindField('AE_DATE').AsString,stEmSeq,'AA_INOPERATOR','SYSTEM');
              stAcademyAtType := '1'; //등원이다.
            end else if (stOutstate = '') then
            begin
              dtTempTime:= EncodeDatetime(strtoint(formatdatetime('yyyy',now)), strtoint(formatdatetime('mm',now)), strtoint(formatdatetime('dd',now)), strtoint(copy(stInstate,1,2)), strtoint(copy(stInstate,3,2)), strtoint(copy(stInstate,5,2)),00);
              if dtTempTime < now - ((1 div (24 *60)) * 10)  then  //출석 후 10분 이내에 찍는 경우는 무시하자.
              begin
                //여기는 하원 처리하자.
                dmDBUpdate.UpdateTB_ACademyAttend_Field_StringValue(FindField('AE_DATE').AsString,stEmSeq,'AA_OUTTIME',FindField('AE_TIME').AsString);
                dmDBUpdate.UpdateTB_ACademyAttend_Field_StringValue(FindField('AE_DATE').AsString,stEmSeq,'AA_INOPERATOR','SYSTEM');
                stAcademyAtType := '2'; //하원이다.
              end;
            end else
            begin
              //여기는 출석부에서 등원해제 한경우이다. 아무것도 하지 말자. 이경우는 나오면 안됨
            end;
          end else
          begin
            //여기는 등원 처리하자.
            dmDBInsert.InsertIntoTB_ACademyAttend_Value(FindField('AE_DATE').AsString,stEmSeq,FindField('AE_TIME').AsString,'','SYSTEM','');
            stAcademyAtType := '1'; //등원이다.
          end;
          if stAcademyAtType <> '' then
          begin
            if (FormatDateTime('yyyymmdd',now) = FindField('AE_DATE').AsString) and (FindField('AE_TIME').AsString >= Formatdatetime('hhnnss',now - 1 div 24))  then  //1시간 넘은 데이터는 문자 보내지 말자.
            begin
              if dmDBFunction.CheckTB_AcademySMSSend_EmSeq(FindField('AE_DATE').AsString,stEmSeq,'1',stAcademyAtType) <> 1 then //한번 전송한 경우에는 전송하지 말자.
              begin
                stSMSMessage := dmDBFunction.GetTB_AcademySMSMessage_Message('1',stAcademyAtType);
                stSMSMessage := stringReplace(stSMSMessage,'$NAME',FindField('EM_NAME').AsString,[rfReplaceAll]);
                stPhoneNum := dmDBFunction.GetTB_EMPLOYEE_CompanyPhone(stEmSeq);
                if (stSMSMessage <> '') and (stPhoneNum <> '') then
                begin
                  dmDBInsert.InsertIntoTB_ACademySMSSend_Value(FormatDateTime('yyyymmdd',now),stEmSeq,'1',stAcademyAtType,stPhoneNum,stSMSMessage,'N',FormatDateTime('yyyymmddhhnnsszzz',now));
                end;
              end;
            end;
          end;
        end;

        Application.ProcessMessages;
        Next;
      end;
      //stSql := ' Update TB_ACCESSEVENT set AE_ATSUMMARY = ''Y'' where AE_ATSUMMARY = ''R'' ';
      //dmDataBase.ProcessExecSQL(stSql);
      //dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('ATTEND','WORKTIME','CO_CONFIGVALUE',L_stWorkTime);
    end;
  Finally
    L_bATSummary := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.ATTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  if L_bFoodDataCreate then Exit; //식수 작업 중이면 대기

  ATTimer.Enabled := False;
  Try
    L_bAttendDataCreate := True;
    AttendDataCreate;
  Finally
    ATTimer.Enabled := Not G_bApplicationTerminate;
    L_bAttendDataCreate := False;
  End;
end;

procedure TfmMain.btn_ATReaderSettingClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmATReaderSetting');

end;

procedure TfmMain.btn_AtResummeryClick(Sender: TObject);
begin
  inherited;
  L_bATReSummary := True;
  fmAtResummery := TfmAtResummery.Create(nil);
  fmAtResummery.ShowModal;
  L_bATReSummary := False;
end;

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.btn_ConfigSettingClick(Sender: TObject);
begin
  MDIChildShow('TfmConfigSetting');
end;

procedure TfmMain.btn_FoodReaderSettingClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmFoodReaderSetting');
end;

procedure TfmMain.CommandArrayCommandsTFORMENABLEExecute(Command: TCommand;
  Params: TStringList);
var
  stName : string;
  bValue : Boolean;
begin
  stName := Params.Values['NAME'];
  if UpperCase(Params.Values['VALUE']) = 'TRUE' then bValue := True
  else bValue := False;

  if Not isDigit(stName) then Exit;
  G_bFormEnabled[strtoint(stName)] := bValue;   //해당 폼

  case strtoint(stName) of
    con_FormAFSConfig : begin  //환경설정 창 종료시
      if Not bValue then LoadConfig;
    end;
    con_FormAFSATReader : begin
      if Not bValue then LoadConfig;
    end;
    con_FormAFSFoodReader : begin
      if Not bValue then LoadConfig;
    end;
  end;

end;

procedure TfmMain.DefaultHandler(var Message);
begin
  inherited DefaultHandler(Message);
  with Tmessage(message) do
  begin
    if Msg = wmTaskbar then
    begin
      if TrayIcon1 = nil then
      begin
        TrayIcon1 := TTrayIcon.Create(self);
      end;
      {사라진 트레이 재생}

      TrayIcon1.Visible := False;
      TrayIcon1.Visible := True;
    end;
  end;//with
end;

function TfmMain.DeviceATTypeListClear: Boolean;
var
  i : integer;
begin
  for i := 0 to DeviceATTypeList.Count - 1 do
  begin
    TAttendPosition(DeviceATTypeList.Objects[i]).Free;
  end;
  DeviceATTypeList.Clear;
end;

procedure TfmMain.FoodDataCreate;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stFoodCode : string;
  stFoodAmt : string;
  stYesterdayTime : string;
  stFoodDate : string;
  nIndex : integer;
  bContinue:Boolean;
  dtYesterDay : TDatetime;
  dtPresent :  TDatetime;
begin
  stSql := dmDBSelect.SelectTB_ACCESSEVENT_FoodWork(L_stFoodWorkTime);
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
      if recordCount < 1 then Exit;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        L_stFoodWorkTime := FindField('AE_INSERTTIME').AsString;
        stFoodDate := FindField('AE_DATE').AsString;
        dtPresent:= EncodeDatetime(strtoint(copy(FindField('AE_DATE').AsString,1,4)), strtoint(copy(FindField('AE_DATE').AsString,5,2)), strtoint(copy(FindField('AE_DATE').AsString,7,2)), 00, 00, 00,00);
        dtYesterDay := dtPresent - 1;
        stFoodCode := '';
        bContinue := False;
        nIndex := FoodTypeList.IndexOf(FindField('RE_FDTYPE').AsString);
        if nIndex > -1 then
        begin
          if Not TFoodCode(FoodTypeList.Objects[nIndex]).GetFoodCode(copy(FindField('AE_TIME').AsString,1,4),stFoodCode,stFoodAmt) then
          begin
            bContinue := True;
          end;
          stYesterdayTime := TFoodCode(FoodTypeList.Objects[nIndex]).YesterDayTime;
          if FindField('AE_DATE').AsString < stYesterdayTime  then
          begin
            stFoodDate := formatDateTime('yyyymmdd',dtYesterDay);
          end;
        end;
        if Not G_bFoodDupEvent then
        begin
          if dmDBFunction.CheckTB_FOODEVENT_FDTYPE(stFoodDate,FindField('EM_SEQ').AsString,FindField('RE_FDTYPE').AsString,stFoodCode) = 1 then
          begin
            bContinue := True;
          end;
        end;
        if stFoodCode = '' then bContinue := True; //식수코드를 찾지 못했으면 삽입하지 말자.
        if FindField('AP_PERMITCODE').AsString <> '1' then bContinue := True;  //식수 미승인 건은 식수처리 하지 말자.

        if Not bContinue then
        begin
          if dmDBFunction.checkTB_FOODEVENT_Value(stFoodDate,FindField('AE_TIME').AsString,FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('RE_READERNO').AsString) = 0 then
             dmDBInsert.InsertIntoTB_FOODEVENT_Value(stFoodDate,FindField('AE_TIME').AsString,FindField('EM_SEQ').AsString,
                                                  FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('RE_READERNO').AsString,
                                                  FindField('DE_EXTENDID').AsString,FindField('DO_DOORNO').AsString,FindField('RE_FDTYPE').AsString,
                                                  stFoodCode,FindField('EM_CODE').AsString,FindField('EM_NAME').AsString,FindField('CO_COMPANYCODE').AsString,
                                                  FindField('AP_PERMITCODE').AsString,stFoodAmt,FindField('FG_CODE').AsString,FindField('CA_CARDNO').AsString);
        end;
        Application.ProcessMessages;
        Next;
      end;
      dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('FOOD','WORKTIME','CO_CONFIGVALUE',L_stFoodWorkTime);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.FoodDataSummary;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nResult : integer;
begin
  dmDBUpdate.UpdateTB_FOODEVENT_Summary_Ready; //집계 준비

  stSql := dmDBSelect.SelectTB_FOODEVENT_Summary('R');
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
      if recordCount < 1 then Exit;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;

        nResult := dmDBFunction.CheckTB_FOODCODECOUNT_Value(FindField('FE_DATE').AsString,FindField('RE_FDTYPE').AsString,FindField('FO_CODE').AsString);
        if nResult = 0 then
        begin
           if dmDBInsert.InsertIntoTB_FOODCODECOUNT_Value(FindField('FE_DATE').AsString,FindField('RE_FDTYPE').AsString,FindField('FO_CODE').AsString,'1') then
           begin
             dmDBUpdate.UpdateTB_FOODEVENT_Field_StringValue(FindField('FE_DATE').AsString,FindField('FE_TIME').AsString,FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('RE_READERNO').AsString,'FE_FDSUMMARY','Y');
           end;
        end else if nResult > 0 then
        begin
          if dmDBUpdate.UpdateTB_FOODCODECOUNT_AddCount(FindField('FE_DATE').AsString,FindField('RE_FDTYPE').AsString,FindField('FO_CODE').AsString) then
          begin
             dmDBUpdate.UpdateTB_FOODEVENT_Field_StringValue(FindField('FE_DATE').AsString,FindField('FE_TIME').AsString,FindField('EM_SEQ').AsString,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('RE_READERNO').AsString,'FE_FDSUMMARY','Y');
          end;
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
end;

procedure TfmMain.FoodTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if L_bAttendDataCreate then Exit;

  FoodTimer.Enabled := False;
  Try
    L_bFoodDataCreate := True;
    FoodDataCreate;
    FoodDataSummary;
  Finally
    FoodTimer.Enabled :=  Not G_bApplicationTerminate;
    L_bFoodDataCreate := False;
  End;

end;

function TfmMain.FoodTypeListClear: Boolean;
var
  i : integer;
begin
  for i := 0 to FoodTypeList.Count - 1 do
  begin
    TFoodCode(FoodTypeList.Objects[i]).Free;
  end;
  FoodTypeList.Clear;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  G_bApplicationTerminate := True;
  MemoryFree;
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
  Self.ModuleID := 'Main';

  wmTaskbar := RegisterWindowMessage('TaskbarCreated');
  L_stLogDirectory := ExtractFileDir(Application.ExeName) + '\..\log';


  TrayIcon1.Hint := 'AttendFoodServer Start';
  TrayIcon1.AnimateInterval := 1000;

  { Set up a hint balloon. }
  TrayIcon1.BalloonTitle := 'AttendFood Server.';
  TrayIcon1.BalloonFlags := bfInfo;

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
    showmessage('데이터베이스 접속 실패.데이터베이스접속 환경설정을 다시 하세요.');
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;

  if FileExists(G_stExeFolder + '\logo.ico') then
  begin
    self.Icon.LoadFromFile(G_stExeFolder + '\logo.ico');
    Application.Icon.LoadFromFile(G_stExeFolder + '\logo.ico');
  end;

  MemoryCreate;

  Application.OnException := AppException;
  LoadConfig;
  TrayTimer.Enabled := True;

  dmDBRelay.OnRelayConnected := RelayDBConnected;
  dmDBRelay.OnRelayEvent := RelayDBEvent;

  LoadDoorRelayCode(True); //증평 권한 로딩건으로 출입문 전체 로딩 하자.

  L_dtRelayActionTime := Now; //시작 되자 마자 한번 연동 하자.
end;

procedure TfmMain.FormResize(Sender: TObject);
var
  nImageWidth : integer;
  nImageHight : integer;
begin
  inherited;
  nImageWidth := 1919;
  nImageHight := 928;

  Image1.Width := Width;
  Image1.Height := nImageHight * width div nImageWidth;

  Image1.Top := at_Menu.Height + (Height - at_Menu.Height) div 2 - (Image1.Height div 2) - 20;
  Image1.Left := 0;

end;

procedure TfmMain.FormShow(Sender: TObject);
var
  stLogoFile : string;
begin
  inherited;
  stLogoFile := G_stExeFolder + '\Logo.JPG';
  if FileExists(stLogoFile) then
    Image1.Picture.LoadFromFile(stLogoFile);

end;

function TfmMain.GetEmployeeAttendWorkType(aEmSeq:string): string;
var
  stSql : string;
  nIndex : integer;
  TempAdoQuery : TADOQuery;
  oEmployee : TAttendEmployee;
  stNowDate : string;
begin
  result := '';
  nIndex := EmployeeList.IndexOf(aEmSeq);
  stNowDate := FormatDateTime('yyyymmdd',now);
  if nIndex > -1 then
  begin
    if TAttendEmployee(EmployeeList.Objects[nIndex]).LoadingDate = stNowDate then
    begin
      result := TAttendEmployee(EmployeeList.Objects[nIndex]).AWCODE;
      Exit;
    end;
  end;

  stSql := 'Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        nIndex := EmployeeList.IndexOf(aEmSeq);
        if nIndex < 0 then
        begin
          oEmployee := TAttendEmployee.Create(nil);
          oEmployee.EMSEQ := FindField('EM_SEQ').AsInteger;
          oEmployee.EMCODE := FindField('EM_CODE').AsString;
          oEmployee.EMNAME := FindField('EM_NAME').AsString;
          oEmployee.COMPANYCODE := FindField('CO_COMPANYCODE').AsString;
          oEmployee.POSICODE := FindField('PO_POSICODE').AsString;
          oEmployee.AWCODE := FindField('AW_CODE').AsString;
          oEmployee.LoadingDate := stNowDate;
          result := FindField('AW_CODE').AsString;
          EmployeeList.AddObject(FindField('EM_SEQ').AsString,oEmployee);
        end else
        begin
          TAttendEmployee(EmployeeList.Objects[nIndex]).EMSEQ := FindField('EM_SEQ').AsInteger;
          TAttendEmployee(EmployeeList.Objects[nIndex]).EMCODE := FindField('EM_CODE').AsString;
          TAttendEmployee(EmployeeList.Objects[nIndex]).EMNAME := FindField('EM_NAME').AsString;
          TAttendEmployee(EmployeeList.Objects[nIndex]).COMPANYCODE := FindField('CO_COMPANYCODE').AsString;
          TAttendEmployee(EmployeeList.Objects[nIndex]).POSICODE := FindField('PO_POSICODE').AsString;
          TAttendEmployee(EmployeeList.Objects[nIndex]).AWCODE := FindField('AW_CODE').AsString;
          TAttendEmployee(EmployeeList.Objects[nIndex]).LoadingDate := stNowDate;
          result := FindField('AW_CODE').AsString;
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

function TfmMain.GetFoodType: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
  oFoodCode :TFoodCode;
  nIndex : integer;
begin
  Result := False;
  if FoodTypeList.Count > 0 then FoodTypeListClear;
  FoodTypeList.Clear;

  stSql := 'select a.*,b.FT_YESTERDAYTIME from TB_FOODCODE a ';
  stSql := stSql + ' Inner Join TB_FOODTYPE b ';
  stSql := stSql + ' ON (a.RE_FDTYPE = b.RE_FDTYPE  ) ';
  stSql := stSql + ' Order by a.RE_FDTYPE,a.FO_CODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        nIndex := FoodTypeList.IndexOf(FindField('RE_FDTYPE').AsString);
        if nIndex < 0 then
        begin
          oFoodCode:= TFoodCode.Create(Self);
          oFoodCode.YesterDayTime := FindField('FT_YESTERDAYTIME').AsString;
          oFoodCode.AddFoodCode(FindField('RE_FDTYPE').AsString,FindField('FO_CODE').AsString,FindField('FO_NAME').AsString,FindField('FO_STARTTIME').AsString,FindField('FO_ENDTIME').AsString,FindField('FO_AMT').AsString);
          FoodTypeList.AddObject(FindField('RE_FDTYPE').AsString,oFoodCode);
        end else
        begin
          TFoodCode(FoodTypeList.Objects[nIndex]).YesterDayTime := FindField('FT_YESTERDAYTIME').AsString;
          TFoodCode(FoodTypeList.Objects[nIndex]).AddFoodCode(FindField('RE_FDTYPE').AsString,FindField('FO_CODE').AsString,FindField('FO_NAME').AsString,FindField('FO_STARTTIME').AsString,FindField('FO_ENDTIME').AsString,FindField('FO_AMT').AsString);
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Result := True;
end;

function TfmMain.GetTB_ATTENDPOSITION: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
  oAttendPosition :TAttendPosition;
  stReaderID : string;
begin
  Result := False;
  if DeviceATTypeList.Count > 0 then DeviceATTypeListClear;
  DeviceATTypeList.Clear;

  stSql := 'select a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.RE_READERNO,b.* from TB_READER a ';
  stSql := stSql + ' Inner Join TB_ATTENDPOSITION b ';
  stSql := stSql + ' ON(a.AP_CODE = b.AP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.RE_ATTYPE = ''1'' ';
  stSql := stSql + ' Order by a.ND_NODENO,a.DE_ECUID,a.DE_EXTENDID,a.RE_READERNO ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        oAttendPosition:= TAttendPosition.Create(Self);
        oAttendPosition.APCODE := FindField('AP_CODE').AsString;
        oAttendPosition.APNAME := FindField('AP_NAME').AsString;
        oAttendPosition.DEVICETYPE := FindField('AP_DEVICETYPE').AsString;
        oAttendPosition.STARTBUTTON := FindField('AP_ATSTARTBUTTON').AsString;
        oAttendPosition.OFFBUTTON := FindField('AP_ATOFFBUTTON').AsString;
        oAttendPosition.INOUTDEVICETYPE := FindField('AP_INOUTDEVICETYPE').AsString;
        oAttendPosition.WORKOUTBUTTON := FindField('AP_WORKOUTBUTTON').AsString;
        oAttendPosition.WORKINBUTTON := FindField('AP_WORKINBUTTON').AsString;
        stReaderID := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('RE_READERNO').AsString;
        DeviceATTypeList.AddObject(stReaderID,oAttendPosition);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Result := True;
end;

function TfmMain.GetTB_ATTENDWORKTYPE: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  dmAttend : TdmAttendEvent;
  stWorkTypeCode : string;
  nWorkTypeIndex : integer;
  i : integer;
begin
  Result := False;
  if WorkTypeList.Count > 0 then WorkTypeListClear;
  WorkTypeList.Clear;

  stSql := 'select * from TB_ATTENDWORKTYPE ';
  stSql := stSql + ' Order by AW_CODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        dmAttend:= TdmAttendEvent.Create(Self);
        dmAttend.StringListClear;
        dmAttend.AttendWorkTypeCode := FindField('AW_CODE').AsInteger;
        if isDigit(FindField('AW_SATURDAYTYPE').AsString) then
          dmAttend.SaturdayType := strtoint(FindField('AW_SATURDAYTYPE').AsString)
        else dmAttend.SaturdayType := 0;
        if isDigit(FindField('AW_FIXATTYPE').AsString) then
          dmAttend.ATOutFixedType := strtoint(FindField('AW_FIXATTYPE').AsString)
        else dmAttend.ATOutFixedType := 0;
        if isDigit(FindField('AW_NOTBACKUPTYPE').AsString) then
          dmAttend.ATWorkNotBackupType := strtoint(FindField('AW_NOTBACKUPTYPE').AsString)
        else dmAttend.ATWorkNotBackupType := 0;

        WorkTypeList.AddObject(FindField('AW_CODE').AsString,dmAttend);
        Next;
      end;
    end;

    stSql := 'select * from TB_ATTENDCODE ';
    stSql := stSql + 'where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;

      if recordCount < 1 then Exit;
      First;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        stWorkTypeCode := '1';
        if Not FindField('AW_CODE').IsNull then
        begin
          if FindField('AW_CODE').AsString <> '' then stWorkTypeCode := FindField('AW_CODE').AsString;
        end;
        nWorkTypeIndex := WorkTypeList.IndexOf(stWorkTypeCode);
        if nWorkTypeIndex > -1 then
        begin
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendCode_Add(FindField('AT_ATCODE').AsString,FindField('AT_CODENAME').AsString,
                         FindField('AT_YESTERDAYTIME').AsString,FindField('AT_WORKSTARTTIME').AsString,FindField('AT_WORKENDTIME').AsString,FindField('AT_INFROMTIME').AsString,FindField('AT_INTOTIME').AsString,
                         FindField('AT_EXTENDTIME').AsString,FindField('AT_NIGHTTIME').AsString,FindField('AT_NORMALADD').AsString,FindField('AT_EARLYADD').AsString,FindField('AT_JIGAKADD').AsString,
                         FindField('AT_JOTAEADD').AsString,FindField('AT_EXTENDADD').AsString,FindField('AT_NIGHTADD').AsString,
                         FindField('AT_SWORKSTARTTIME').AsString,FindField('AT_SWORKENDTIME').AsString,FindField('AT_SINFROMTIME').AsString,FindField('AT_SINTOTIME').AsString,
                         FindField('AT_SEXTENDTIME').AsString,FindField('AT_SNIGHTTIME').AsString,FindField('AT_SNORMALADD').AsString,FindField('AT_SEARLYADD').AsString,FindField('AT_SJIGAKADD').AsString,
                         FindField('AT_SJOTAEADD').AsString,FindField('AT_SEXTENDADD').AsString,FindField('AT_SNIGHTADD').AsString,
                         FindField('AT_HWORKSTARTTIME').AsString,FindField('AT_HWORKENDTIME').AsString,FindField('AT_HINFROMTIME').AsString,FindField('AT_HINTOTIME').AsString,
                         FindField('AT_HEXTENDTIME').AsString,FindField('AT_HNIGHTTIME').AsString,FindField('AT_HNORMALADD').AsString,FindField('AT_HEARLYADD').AsString,FindField('AT_HJIGAKADD').AsString,
                         FindField('AT_HJOTAEADD').AsString,FindField('AT_HEXTENDADD').AsString,FindField('AT_HNIGHTADD').AsString,
                         FindField('AT_OUTRANGE').AsString,FindField('AT_SOUTRANGE').AsString,FindField('AT_HOUTRANGE').AsString);
        end;

        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Result := True;
end;

function TfmMain.GetTB_Config_Attend: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    L_bAcademyAttend := False;
    L_stWorkTime := '';
    G_nSystmRelayUse := 0;
    G_nSystmRelayCustomerNo := 0;
    G_nSystmRelayCyle := 5;
    G_stSystmRelayDB1Type := '1';
    G_stSystmRelayDB1IP := '127.0.0.1';
    G_stSystmRelayDB1PORT := '1433';
    G_stSystmRelayDB1USERID := 'sa';
    G_stSystmRelayDB1USERPW := 'sapasswd';
    G_stSystmRelayDB1NAME := 'BMOS';
    G_stSystmRelayDB2Type := '3';
    G_stSystmRelayDB2IP := '127.0.0.1';
    G_stSystmRelayDB2PORT := '1521';
    G_stSystmRelayDB2USERID := 'sys' ;
    G_stSystmRelayDB2USERPW := 'master';
    G_stSystmRelayDB2NAME := 'BMOS';

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND (CO_CONFIGGROUP = ''ATTEND'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''FOOD'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''SYSTEMRELAY'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''DAEMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''ACADEMY'' ';
    stSql := stSql + ' ) ';

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGGROUP').AsString = 'ACADEMY' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ATTEND' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then L_bAcademyAttend := True;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'ATTEND' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'WORKTIME' then
          begin
            L_stWorkTime := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'USE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '0' then L_bAttendUse := False
            else L_bAttendUse := True;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'DAEMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'PACKETTYPE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nProgramType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'FOOD' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'WORKTIME' then
          begin
            L_stFoodWorkTime := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DUPEVENT' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '0' then G_bFoodDupEvent := False
            else G_bFoodDupEvent := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'USE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '0' then G_bFoodUse := False
            else G_bFoodUse := True;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ATAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAttendDedicateDoorUse := True
            else G_bAttendDedicateDoorUse := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFoodDedicateDoorUse := True
            else G_bFoodDedicateDoorUse := False;
          end;
        end else if FindField('CO_CONFIGGROUP').AsString = 'SYSTEMRELAY' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'USE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
              G_nSystmRelayUse := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'CUSTMOR' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
             G_nSystmRelayCustomerNo := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'CYCLE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
             G_nSystmRelayCyle := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1TYPE' then
          begin
            G_stSystmRelayDB1Type := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1IP' then
          begin
            G_stSystmRelayDB1IP := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1PORT' then
          begin
            G_stSystmRelayDB1PORT := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1USERID' then
          begin
            G_stSystmRelayDB1USERID := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1USERPW' then
          begin
            G_stSystmRelayDB1USERPW := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB1DBNAME' then
          begin
            G_stSystmRelayDB1NAME := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2TYPE' then
          begin
            G_stSystmRelayDB2Type := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2IP' then
          begin
            G_stSystmRelayDB2IP := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2PORT' then
          begin
            G_stSystmRelayDB2PORT := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2USERID' then
          begin
            G_stSystmRelayDB2USERID := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2USERPW' then
          begin
            G_stSystmRelayDB2USERPW := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DB2DBNAME' then
          begin
            G_stSystmRelayDB2NAME := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'RELAYCODE1' then
          begin
            G_stRelayCode1 := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'RELAYCODE2' then
          begin
            G_stRelayCode2 := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'RELAYCODE3' then
          begin
            G_stRelayCode3 := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'RELAYCODE4' then
          begin
            G_stRelayCode4 := FindField('CO_CONFIGVALUE').AsString;
          end;
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

function TfmMain.LoadConfig: Boolean;
begin
  ATTimer.Enabled := False;
  FoodTimer.Enabled := False;

  while L_bAttendDataCreate do
  begin
    sleep(1);
    Application.ProcessMessages;
  end;
  while L_bFoodDataCreate do
  begin
    sleep(1);
    Application.ProcessMessages;
  end;

  GetTB_Config_Attend;
  GetTB_ATTENDWORKTYPE;
  GetTB_ATTENDPOSITION;
  GetFoodType;
  ATTimer.Enabled := L_bAttendUse;
  FoodTimer.Enabled := G_bFoodUse;
  if G_nSystmRelayUse = 1 then RelayTimer.Enabled := True
  else RelayTimer.Enabled := False;
end;

function TfmMain.LoadDoorRelayCode(aAll:Boolean=True): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  if aAll then
  begin
    stSql := ' Update TB_DOOR Set DO_RELAYIDCHANGE = ''Y'' ';
    dmDataBase.ProcessExecSQL(stSql);
  end;

  stSql := ' Select * from TB_DOOR Where DO_RELAYIDCHANGE = ''Y'' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      if aAll then dmEmployeeRelay.RelayNumberClear;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        dmEmployeeRelay.SetRelayNumberFromDoorNO(FindField('DO_RELAYID').AsString,FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DO_DOORNO').AsString);
        dmDBUpdate.UpdateTB_DOOR_Field_StringValue(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('DE_EXTENDID').AsString,FindField('DO_DOORNO').AsString,'DO_RELAYIDCHANGE','N');
        Next;
      end;
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

procedure TfmMain.MemoryCreate;
begin
  WorkTypeList := TStringList.Create;
  DeviceATTypeList := TStringList.Create;
  EmployeeList := TStringList.Create;
  FoodTypeList := TStringList.Create;
end;

procedure TfmMain.MemoryFree;
var
  i : integer;
begin
  if WorkTypeList <> nil then
  begin
    if WorkTypeList.Count > 0 then
    begin
      for i := WorkTypeList.Count - 1 to 0 do TdmAttendEvent(WorkTypeList.Objects[i]).Free;
    end;
    WorkTypeList.Free;
    WorkTypeList := nil;
  end;
  if DeviceATTypeList <> nil then
  begin
    if DeviceATTypeList.Count > 0 then
    begin
      for i := DeviceATTypeList.Count - 1 to 0 do TAttendPosition(DeviceATTypeList.Objects[i]).Free;
    end;
    DeviceATTypeList.Free;
    DeviceATTypeList := nil;
  end;
  if EmployeeList <> nil then
  begin
    if EmployeeList.Count > 0 then
    begin
      for i := EmployeeList.Count - 1 to 0 do TAttendEmployee(EmployeeList.Objects[i]).Free;
    end;
    EmployeeList.Free;
    EmployeeList := nil;
  end;
  if FoodTypeList <> nil then
  begin
    if FoodTypeList.Count > 0 then
    begin
      for i := FoodTypeList.Count - 1 to 0 do TFoodCode(FoodTypeList.Objects[i]).Free;
    end;
    FoodTypeList.Free;
    FoodTypeList := nil;
  end;
end;

procedure TfmMain.mn_trayCloseClick(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.mn_trayVisibleClick(Sender: TObject);
begin
  TrayIcon1DblClick(self);
end;

procedure TfmMain.mn_UpgradeClick(Sender: TObject);
begin
  inherited;
  if Not FileExists(G_stExeFolder + '\AFServer\SmartUpdate.exe') then
  begin
    showmessage(mn_Upgrade.Caption + ' 도구가 설치되어 있지 않습니다.');
    Exit;
  end;

  MyRunDosCommand(G_stExeFolder + '\AFServer\SmartUpdate.exe',False,False);
  Close;

end;

procedure TfmMain.pm_NowRelayClick(Sender: TObject);
var
  bResult1 : boolean;
  bResult2 : Boolean;
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  Try
    RelayTimer.Enabled:=False;
    if G_nSystmRelayCustomerNo = 0 then //중국하이닉스 연동
    begin
      if Not dmDBRelay.DB1Connected then
      begin
        RelayAdoConnectCheckTimer1.Enabled := True;
      end else
      begin
        //여기서 근태 연동 하자.
      end;
      if Not dmDBRelay.DB2Connected then
      begin
        RelayAdoConnectCheckTimer2.Enabled := True;
      end else
      begin
        //여기서 인적사항연동
      end;
    end else if G_nSystmRelayCustomerNo = 1 then //SK가스
    begin

      if Not dmDBRelay.DB2Connected then
      begin
        RelayAdoConnectCheckTimer2.Enabled := True;
      end else
      begin
        //여기서 인적사항연동
        dmEmployeeRelay.Relay_SKGAS_Start;
      end;
    end else if G_nSystmRelayCustomerNo = 2 then //SK증평
    begin
      if Not dmDBRelay.DB1Connected then
      begin
        RelayAdoConnectCheckTimer1.Enabled := True;
      end else
      begin
        LoadDoorRelayCode(False);
        //여기서 인적사항연동
        dmEmployeeRelay.Relay_SKChungcheong_Start('E');    //직원연동
        dmEmployeeRelay.ChungcheongAccessEventRelay;       //이벤트 전송
        dmEmployeeRelay.ChungcheongFoodEventRelay;       //식수이벤트 전송
      end;
    end;
  Finally
    RelayTimer.Enabled:= Not G_bApplicationTerminate;
  End;

end;

procedure TfmMain.RelayAdoConnectCheckTimer1Timer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  RelayAdoConnectCheckTimer1.Enabled := False;
  if Not dmDBRelay.DB1Connected then
  begin
    if Not dmDBRelay.AdoRelay1Connected(G_stSystmRelayDB1Type, G_stSystmRelayDB1IP, G_stSystmRelayDB1PORT,
                      G_stSystmRelayDB1USERID, G_stSystmRelayDB1USERPW, G_stSystmRelayDB1NAME) then
    begin
      RelayAdoConnectCheckTimer1.Interval := 1000 * 600; //10분에 한번씩 체크 하자.
      RelayAdoConnectCheckTimer1.Enabled := True;
    end;
  end;
end;

procedure TfmMain.RelayAdoConnectCheckTimer2Timer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  RelayAdoConnectCheckTimer2.Enabled := False;
  if Not dmDBRelay.DB2Connected then
  begin
    if Not dmDBRelay.AdoRelay2Connected(G_stSystmRelayDB2Type, G_stSystmRelayDB2IP, G_stSystmRelayDB2PORT,
                      G_stSystmRelayDB2USERID, G_stSystmRelayDB2USERPW, G_stSystmRelayDB2NAME) then
    begin
      RelayAdoConnectCheckTimer2.Interval := 1000 * 600; //10분에 한번씩 체크 하자.
      RelayAdoConnectCheckTimer2.Enabled := True;
    end;
  end;
end;

procedure TfmMain.RelayDBConnected(Sender: TObject; aSessionNo: integer;
  DBConnected: Boolean);
begin
  if aSessionNo = 1 then
    RelayAdoConnectCheckTimer1.Enabled := Not DBConnected;
  if aSessionNo = 2 then
    RelayAdoConnectCheckTimer2.Enabled := Not DBConnected;
end;

procedure TfmMain.RelayDBEvent(Sender: TObject; aSession: integer;
  aData: string);
begin

end;

procedure TfmMain.RelayTimerTimer(Sender: TObject);
var
  bResult1 : boolean;
  bResult2 : Boolean;
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if G_nSystmRelayCyle <> 0 then //즉시 연동이 아닌경우 시간 체크하자.
  begin
    if L_dtRelayActionTime > now then Exit;
  end;
  Try
    RelayTimer.Enabled:=False;
    if G_nSystmRelayCustomerNo = 0 then //중국하이닉스 연동
    begin
      if Not dmDBRelay.DB1Connected then
      begin
        RelayAdoConnectCheckTimer1.Enabled := True;
      end else
      begin
        //여기서 근태 연동 하자.
      end;
      if Not dmDBRelay.DB2Connected then
      begin
        RelayAdoConnectCheckTimer2.Enabled := True;
      end else
      begin
        //여기서 인적사항연동
      end;
    end else if G_nSystmRelayCustomerNo = 1 then //SK가스
    begin

      if Not dmDBRelay.DB2Connected then
      begin
        RelayAdoConnectCheckTimer2.Enabled := True;
      end else
      begin
        //여기서 인적사항연동
        dmEmployeeRelay.Relay_SKGAS_Start;
      end;
    end else if G_nSystmRelayCustomerNo = 2 then //SK증평
    begin
      if Not dmDBRelay.DB1Connected then
      begin
        RelayAdoConnectCheckTimer1.Enabled := True;
      end else
      begin
        LoadDoorRelayCode(False);
        //여기서 인적사항연동
        dmEmployeeRelay.Relay_SKChungcheong_Start('E');    //직원연동
        dmEmployeeRelay.ChungcheongAccessEventRelay;       //이벤트 전송
        dmEmployeeRelay.ChungcheongFoodEventRelay;       //식수이벤트 전송
      end;
    end;
    if G_nSystmRelayCyle <> 0 then      //G_nSystmRelayCyle 인 경우 즉시 연동이다.
       L_dtRelayActionTime := IncTime(Now,0,G_nSystmRelayCyle,0,0);  //
  Finally
    RelayTimer.Enabled:= Not G_bApplicationTerminate;
  End;

end;

procedure TfmMain.TrayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure TfmMain.TrayTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;

  TrayTimer.Enabled := False;
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

function TfmMain.WorkTypeListClear: Boolean;
var
  i : integer;
begin
  for i := 0 to WorkTypeList.Count - 1 do
  begin
    TdmAttendEvent(WorkTypeList.Objects[i]).Free;
  end;
  WorkTypeList.Clear;
end;

{ TFoodCode }

procedure TFoodCode.AddFoodCode(aFoodType,aFoodCode,aFoodCodeName, aStartTime, aEndTime, aAmt: string);
var
  nIndex : integer;
  oFoodDetail : TFoodDetail;
begin
  FoodType := aFoodType;
  FoodCodeName := aFoodCodeName;
  nIndex := FoodCodeList.IndexOf(aFoodCode);
  if nIndex > -1 then Exit;
  oFoodDetail:= TFoodDetail.Create(Self);
  oFoodDetail.FoodCode := aFoodCode;
  oFoodDetail.StartTime := aStartTime;
  oFoodDetail.EndTime := aEndTime;
  oFoodDetail.Amt := strtoint(aAmt);
  FoodCodeList.AddObject(aFoodCode,oFoodDetail);

end;

constructor TFoodCode.Create(AOwner: TComponent);
begin
  inherited;
  FoodCodeList := TstringList.Create;
end;

destructor TFoodCode.Destroy;
var
  i : integer;
begin
  if FoodCodeList.Count > 0 then
  begin
    for i := FoodCodeList.Count - 1 downto 0 do
      TFoodDetail(FoodCodeList.Objects[i]).free;
  end;
  FoodCodeList.Free;
  inherited;
end;

function TFoodCode.GetFoodCode(aTime: string;var aFoodCode,aFoodAmt:string):Boolean;
var
  i : integer;
  stTemp : string;
begin
  result := False;
  aFoodCode := '0';
  for I := 0 to FoodCodeList.Count - 1 do
  begin
    if TFoodDetail(FoodCodeList.Objects[i]).StartTime < TFoodDetail(FoodCodeList.Objects[i]).EndTime  then
    begin
      if (TFoodDetail(FoodCodeList.Objects[i]).StartTime <= aTime) and
         (TFoodDetail(FoodCodeList.Objects[i]).EndTime >= aTime)
        then
      begin
        aFoodCode := FoodCodeList.Strings[i];
        aFoodAmt :=  inttostr(TFoodDetail(FoodCodeList.Objects[i]).Amt);
        result := True;
        break;
      end;
    end else
    begin
      if (TFoodDetail(FoodCodeList.Objects[i]).StartTime <= aTime) or
         (TFoodDetail(FoodCodeList.Objects[i]).EndTime >= aTime)
        then
      begin
        aFoodCode := FoodCodeList.Strings[i];
        aFoodAmt :=  inttostr(TFoodDetail(FoodCodeList.Objects[i]).Amt);
        result := True;
        break;
      end;
    end;
    if (aTime > '1200') and (aFoodCode = '1') then
    begin
      stTemp := '1';
    end;

  end;
  if result = False then
  begin
      stTemp := '1';
  end;
end;

end.
