unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, AdvSmoothLabel,
  Vcl.StdCtrls, AdvAppStyler, AdvSmoothLedLabel,System.IniFiles,ActiveX,ADODB,
  Vcl.ExtCtrls, AdvSmoothPanel, Vcl.Imaging.pngimage, AdvSmoothCircularProgress;

type
  TFoodCodeDetail = class(TComponent)
  private
    FStartTime: string;
    FAmt: integer;
    FEndTime: string;
    FFoodCode: string;
    FYesterDayTime: string;
    FInitTime: string;
  public
    property FoodCode : string read FFoodCode write FFoodCode;
    property StartTime : string read FStartTime write FStartTime;
    property EndTime : string read FEndTime write FEndTime;
    property Amt : integer read FAmt write FAmt;
    property YesterDayTime : string read FYesterDayTime write FYesterDayTime;
    property InitTime : string read FInitTime write FInitTime;
  end;

  TfmMain = class(TForm)
    FoodCodeCheckTimer: TTimer;
    ServerConnectTimer: TTimer;
    pan_Main: TAdvSmoothPanel;
    AdvSmoothPanel1: TAdvSmoothPanel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    AdvSmoothPanel2: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    btn_FoodOut: TAdvGlowButton;
    AdvSmoothPanel3: TAdvSmoothPanel;
    lb_CurrentFoodCount: TAdvSmoothLedLabel;
    AdvSmoothPanel4: TAdvSmoothPanel;
    lb_CurrentFoodOutCount: TAdvSmoothLedLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    pan_Body: TPanel;
    Image2: TImage;
    Progress1: TAdvSmoothCircularProgress;
    Img_Out: TImage;
    Image3: TImage;
    lb_Date: TLabel;
    lb_Time: TLabel;
    lb_Weekend: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Image8: TImage;
    btn_Close: TImage;
    Timer2: TTimer;
    Label1: TLabel;
    lb_TotFoodCount: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    lb_Count: TLabel;
    Label6: TLabel;
    Image5: TImage;
    Image6: TImage;
    ImgMon: TImage;
    ImgTUE: TImage;
    ImgWED: TImage;
    ImgTHU: TImage;
    ImgFRI: TImage;
    ImgSAT: TImage;
    Panel3: TPanel;
    ImgMon_E: TImage;
    ImgTUE_E: TImage;
    ImgWED_E: TImage;
    ImgTHU_E: TImage;
    ImgFRI_E: TImage;
    ImgSAT_E: TImage;
    ImgMon_a: TImage;
    ImgTUE_a: TImage;
    ImgWED_a: TImage;
    ImgTHU_a: TImage;
    ImgFRI_a: TImage;
    ImgSAT_a: TImage;
    Img_Sunny: TImage;
    Img_CloudyLittle: TImage;
    Img_Cloudy: TImage;
    Img_Rain: TImage;
    Img_OutA: TImage;
    Img_OutE: TImage;
    Image4: TImage;
    Image7: TImage;
    Label2: TLabel;
    Label3: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_FoodOutClick(Sender: TObject);
    procedure FoodCodeCheckTimerTimer(Sender: TObject);
    procedure ServerConnectTimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Img_OutMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Img_OutMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    Function GetCurrentFoodCode : string;
    Function GetCurrentFoodCount(aFoodDate,aFDType,aFoodCode:string):integer;
    function GetCurrentFoodOutCount(aFoodDate,aFDType,aFoodCode:string):integer;
    Function GetFoodCodeList(aFDType:string): Boolean;
    Function GetFoodDateList(aFDType:string): Boolean;
    Function GetFoodReaderList(aFDType:string): Boolean;
    Function GetTB_Config : Boolean;
  private
    L_stOldDate : string;
    L_stFDType : string;
    L_stFoodDate : string;    //식수날짜.
    L_nMaxWindow : integer;
    FoodCodeList : TStringList;
    FoodReaderList : TStringList; //식수리더번호
    FFoodCode: string;
    FCurrentFoodOutcount: integer;
    FCurrentFoodCount: integer;
    FInitType: integer;
    { Private declarations }
    procedure AlarmConfirm(Sender: TObject);
    procedure DeviceAlarmEvent(Sender: TObject;aNodeNo,aECUID,aExtendID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                             aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange, aAlarmView,aAlarmSound,aAlarmColor:string;aRealTime:Boolean=True);
    procedure DeviceCardAccessEvent(Sender: TObject;aTime,aNodeNo, aEcuID,aDoorNo,aReaderNo,aInOut,aCardMode,aDoorMode,
                             aChangeState,aAccessResult,aDoorState,aATButton,aType,aArmAreaNo,aCardno,aCompanyCode,
                             aCompanyName,aEmSeq,aEmCode,aEmName,aPosiCode,aPosiName:string);
    procedure ServerConnected(Sender: TObject; aConnected:Boolean);
    procedure ServerPacketView(Sender: TObject;  aClientIP,aTxRx,aData,aResult:string);
    procedure SetFoodCode(const Value: string);
    procedure SetCurrentFoodCount(const Value: integer);
    procedure SetCurrentFoodOutcount(const Value: integer);
    procedure ScreenRefresh;
    procedure WndProc(var Message: TMessage); override;
  public
    { Public declarations }
    property CurrentFoodCount : integer read FCurrentFoodCount write SetCurrentFoodCount;
    property CurrentFoodOutcount : integer read FCurrentFoodOutcount write SetCurrentFoodOutcount;
    property FoodCode : string read FFoodCode write SetFoodCode;
    property InitType : integer read FInitType write FInitType;
  end;

var
  fmMain: TfmMain;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDataBaseConfig,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uPCClient,
  uRelayDataBase,
  uRelayDataBaseConfig;

{$R *.dfm}

procedure TfmMain.AlarmConfirm(Sender: TObject);
begin

end;

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.btn_FoodOutClick(Sender: TObject);
begin
  btn_FoodOut.Enabled := False;
  Try

    if dmDBFunction.checkTB_FOODOUTCOUNT(L_stFoodDate,L_stFDType,FoodCode) = 1 then
    begin
      dmDBUpdate.UpdateTB_FOODOUTCOUNT_AddCount(L_stFoodDate,L_stFdType,FoodCode);
    end else
    begin
      dmDBInsert.InsertIntoTB_FOODOUTCOUNT_Value(L_stFoodDate,L_stFdType,FoodCode,'1');
    end;
    CurrentFoodOutcount := GetCurrentFoodOutCount(L_stFoodDate,L_stFDType,FoodCode);
  Finally
    btn_FoodOut.Enabled := True;
  End;
end;

procedure TfmMain.DeviceAlarmEvent(Sender: TObject; aNodeNo, aECUID, aExtendID,
  aCmd, aMsgNo, aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode,
  aLoop, aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange, aAlarmView, aAlarmSound,
  aAlarmColor: string; aRealTime: Boolean);
begin

end;

procedure TfmMain.DeviceCardAccessEvent(Sender: TObject; aTime, aNodeNo, aEcuID,
  aDoorNo, aReaderNo, aInOut, aCardMode, aDoorMode, aChangeState, aAccessResult,
  aDoorState, aATButton, aType, aArmAreaNo, aCardno, aCompanyCode, aCompanyName,
  aEmSeq, aEmCode, aEmName, aPosiCode, aPosiName: string);
var
  stFoodReaderNo : string;
  nIndex : integer;
begin
  stFoodReaderNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + FillZeroNumber(strtoint(aReaderNo),2);
  nIndex := FoodReaderList.IndexOf(stFoodReaderNo);
  if nIndex < 0 then Exit;
  if Not isDigit(aAccessResult) then Exit;  //미승인 건
  //CurrentFoodCount := CurrentFoodCount + 1;
end;

procedure TfmMain.FoodCodeCheckTimerTimer(Sender: TObject);
begin
  FoodCode := GetCurrentFoodCode;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if L_nMaxWindow = 1 then WindowState := wsMaximized;
  ScreenRefresh;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  G_bApplicationTerminate := True;
//  dmPCClient.SocketConnect := False;
  if FoodCodeList.Count > 0 then
  begin
    for i := FoodCodeList.Count - 1 downto 0 do
      TFoodCodeDetail(FoodCodeList.Objects[i]).Free;
  end;
  FoodCodeList.Clear;
  FoodReaderList.Clear;
  FoodCodeCheckTimer.Enabled := False;
  ServerConnectTimer.Enabled := False;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  FoodCodeList := TStringList.Create;
  FoodReaderList := TStringList.Create;
(*  dmPCClient.OnAlarmConfirm := AlarmConfirm;
  dmPCClient.OnDeviceAlarmEvent := DeviceAlarmEvent;
  dmPCClient.OnDeviceCardAccessEvent := DeviceCardAccessEvent;
  dmPCClient.OnSeverConnected := ServerConnected;
  dmPCClient.OnServerPacketView := ServerPacketView;
*)
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
(*  btn_Close.Top := 5;
  btn_Close.Left := Width - btn_Close.Width - 10;

  pan_Body.Top := ((Height - panel1.Height - 95) div 2) - (pan_Body.Height div 2);
  pan_Body.Left := (width div 2) - (pan_Body.Width div 2);
*)
(*  pan_Main.Top := (Height div 2) - (pan_Main.Height div 2);
  pan_Main.Left := (width div 2) - (pan_Main.width div 2);

  AdvSmoothPanel3.Left := 20;
  AdvSmoothPanel4.Left := 20;
  AdvSmoothPanel3.Width := AdvSmoothPanel1.Width - (AdvSmoothPanel3.Left * 2);
  AdvSmoothPanel4.Width := AdvSmoothPanel2.Width - (AdvSmoothPanel4.Left * 2);
  *)
  ScreenRefresh;
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('데이터베이스 접속 실패.데이터베이스접속 환경설정을 다시 하세요.');
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;
  TRelayDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TRelayDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('연동데이터베이스 접속 실패.데이터베이스접속 환경설정을 다시 하세요.');
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;

  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\BMOS.INI');
    L_stFDType := ini_fun.ReadString('FOOD','FDTYPE','1');
    InitType := ini_fun.ReadInteger('FOOD','InitTYPE',1);   //1:식수시간별 초기화,2:식수날짜별 초기화
    L_nMaxWindow := ini_fun.ReadInteger('CONFIG','MaxWindow',0);
  Finally
    ini_fun.Free;
  End;
  GetTB_Config;
  if InitType = 1 then            //식수코드별
  begin
    GetFoodCodeList(L_stFDType);
  end else if InitType = 2 then  //식수날짜별
  begin
    GetFoodDateList(L_stFDType);
  end;
  FoodCode := GetCurrentFoodCode;

  GetFoodReaderList(L_stFDType);
(*  dmPCClient.ServerIP := G_stDaemonControlServerIP;
  dmPCClient.ServerPort := strtoint(G_stDaemonControlPort);
  dmPCClient.SocketConnect := True;
*)
  CurrentFoodCount := GetCurrentFoodCount(L_stFoodDate,L_stFDType,FoodCode);
  CurrentFoodCount := 0;
  CurrentFoodOutcount := GetCurrentFoodOutCount(L_stFoodDate,L_stFDType,FoodCode);
  //lb_CurrentFoodCount.Caption.Value := CurrentFoodCount;
  //lb_CurrentFoodOutCount.Caption.Value := CurrentFoodOutcount;
  FoodCodeCheckTimer.Enabled := True;
end;

function TfmMain.GetCurrentFoodCode: string;
var
  i : integer;
  stTime : string;
begin
  result := '1';
//  if InitType = 2 then Exit;
  Try
    stTime := FormatDateTime('hhnn',now);
    L_stFoodDate := FormatDateTime('yyyymmdd',now);
    for I := 0 to FoodCodeList.Count - 1 do
    begin
      if TFoodCodeDetail(FoodCodeList.Objects[i]).StartTime < TFoodCodeDetail(FoodCodeList.Objects[i]).InitTime  then
      begin
        if (TFoodCodeDetail(FoodCodeList.Objects[i]).StartTime <= stTime) and
           (TFoodCodeDetail(FoodCodeList.Objects[i]).InitTime >= stTime)
          then
        begin
          result := FoodCodeList.Strings[i];
          //if TFoodCodeDetail(FoodCodeList.Objects[i]).YesterDayTime > stTime then L_stFoodDate := FormatDateTime('yyyymmdd',now - 1);
          break;
        end;
      end else
      begin
        if InitType = 1 then
        begin
          if (TFoodCodeDetail(FoodCodeList.Objects[i]).StartTime <= stTime) or
             (TFoodCodeDetail(FoodCodeList.Objects[i]).InitTime >= stTime)
            then
          begin
            result := FoodCodeList.Strings[i];
            if TFoodCodeDetail(FoodCodeList.Objects[i]).YesterDayTime > stTime then L_stFoodDate := FormatDateTime('yyyymmdd',now - 1);
            break;
          end;
        end else if InitType = 2 then  //날짜별
        begin
          result := FoodCodeList.Strings[i];
          if (TFoodCodeDetail(FoodCodeList.Objects[i]).StartTime > stTime) then
          begin
            if L_stFoodDate <> FormatDateTime('yyyymmdd',now - 1)  then
            begin
              //CurrentFoodCount := 0;
              //lb_CurrentFoodCount.Caption.Value := CurrentFoodCount;
              CurrentFoodOutcount := 0;
              lb_CurrentFoodOutCount.Caption.Value := CurrentFoodOutcount;
              L_stFoodDate := FormatDateTime('yyyymmdd',now - 1);
            end;
          end;
        end;
      end;
    end;
  Except
    Exit;
  End;
end;

function TfmMain.GetCurrentFoodCount(aFoodDate,aFDType, aFoodCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stStartTime : string;
  stEndTime : string;
  nIndex : integer;
  stFoodCode : string;
begin
  result := 0;
  if Not TRelayDataBaseConfig.GetObject.DBConnected then
  begin
    TRelayDataBaseConfig.GetObject.DataBaseConnect(False);
    Exit;
  end;

  if aFoodCode = '1' then stFoodCode := '10'
  else if aFoodCode = '2' then stFoodCode := '30'
  else if aFoodCode = '3' then stFoodCode := '50'
  else Exit;

  stSql := ' select * from dayfood_vw ';
  stSql := stSql + ' where fdate = ''' + aFoodDate + ''' ';
  stSql := stSql + ' AND time_cd = ''' + stFoodCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmRelayDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        TRelayDataBaseConfig.GetObject.DBConnected := False;
        Exit;
      End;
      if recordCount < 1 then Exit;
      result := FindField('qty').AsInteger;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  (*
  nIndex := FoodCodeList.IndexOf(aFoodCode);
  if nIndex < 0 then Exit;

  if TFoodCodeDetail(FoodCodeList.Objects[nIndex]).StartTime < TFoodCodeDetail(FoodCodeList.Objects[nIndex]).EndTime  then
  begin
    stStartTime := FormatDateTime('yyyymmdd',now) + TFoodCodeDetail(FoodCodeList.Objects[nIndex]).StartTime;
    stEndTime := FormatDateTime('yyyymmdd',now) + TFoodCodeDetail(FoodCodeList.Objects[nIndex]).EndTime;
  end else
  begin
    if formatdatetime('hhnn',now) > stStartTime then
    begin
      stStartTime := FormatDateTime('yyyymmdd',now) + TFoodCodeDetail(FoodCodeList.Objects[nIndex]).StartTime;
      stEndTime := FormatDateTime('yyyymmdd',now + 1) + TFoodCodeDetail(FoodCodeList.Objects[nIndex]).EndTime;
    end else
    begin
      stStartTime := FormatDateTime('yyyymmdd',now - 1) + TFoodCodeDetail(FoodCodeList.Objects[nIndex]).StartTime;
      stEndTime := FormatDateTime('yyyymmdd',now) + TFoodCodeDetail(FoodCodeList.Objects[nIndex]).EndTime;
    end;
  end;
*)
//  stSql := ' Select count(*) as CNT from TB_ACCESSEVENT a ';
(*  stSql := stSql + ' Inner Join TB_READER b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND a.RE_READERNO = b.RE_READERNO ';
  stSql := stSql + ' AND b.RE_FDTYPE is not null ';
  stSql := stSql + ' AND b.RE_FDTYPE <> ''0'' ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AE_DATE + a.AE_TIME >= ''' + stStartTime + ''' ';
  stSql := stSql + ' AND a.AE_DATE + a.AE_TIME <= ''' + stEndTime + ''' ';
*)



end;

function TfmMain.GetCurrentFoodOutCount(aFoodDate,aFDType,aFoodCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stStartTime : string;
  stEndTime : string;
  nIndex : integer;
begin
  Try
    result := 0;

    if Not TDataBaseConfig.GetObject.DBConnected then
    begin
      TDataBaseConfig.GetObject.DataBaseConnect(False);
      Exit;
    end;

    stSql := ' Select * from TB_FOODOUTCOUNT  ';
    stSql := stSql + ' WHERE GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND FC_DATE = ''' + aFoodDate + ''' ';
    stSql := stSql + ' AND RE_FDTYPE is not null ';
    stSql := stSql + ' AND RE_FDTYPE <> ''0'' ';
    //stSql := stSql + ' AND RE_FDTYPE = ''' + aFDType + ''' ';
    stSql := stSql + ' AND FO_CODE = ''' + aFoodCode + ''' ';

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
          TDataBaseConfig.GetObject.DBConnected := False;
          Exit;
        End;
        if recordCount < 1 then Exit;
        result := FindField('FC_COUNT').AsInteger;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    Exit;
  End;
end;

function TfmMain.GetFoodCodeList(aFDType: string):Boolean;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TADOQuery;
  oFoodCodeDetail :TFoodCodeDetail;
  nIndex : integer;
begin
  if FoodCodeList.Count > 0 then
  begin
    for i := FoodCodeList.Count - 1 downto 0 do
      TFoodCodeDetail(FoodCodeList.Objects[i]).Free;
  end;
  FoodCodeList.Clear;

  Result := False;

  stSql := 'select a.*,b.FT_YESTERDAYTIME from TB_FOODCODE a ';
  stSql := stSql + ' Inner Join TB_FOODTYPE b ';
  stSql := stSql + ' ON (a.RE_FDTYPE = b.RE_FDTYPE  ) ';
  stSql := stSql + ' Where a.RE_FDTYPE = ''' + aFDType + ''' ';
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
        nIndex := FoodCodeList.IndexOf(FindField('FO_CODE').AsString);
        if nIndex < 0 then
        begin
          oFoodCodeDetail:= TFoodCodeDetail.Create(Self);
          oFoodCodeDetail.YesterDayTime := FindField('FT_YESTERDAYTIME').AsString;
          oFoodCodeDetail.StartTime := FindField('FO_STARTTIME').AsString;
          oFoodCodeDetail.EndTime := FindField('FO_ENDTIME').AsString;
          oFoodCodeDetail.FoodCode := FindField('FO_CODE').AsString;
          if FindField('FO_INITTIME').AsString = '' then oFoodCodeDetail.InitTime := FindField('FO_ENDTIME').AsString
          else oFoodCodeDetail.InitTime := FindField('FO_INITTIME').AsString;
          FoodCodeList.AddObject(FindField('FO_CODE').AsString,oFoodCodeDetail);
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

function TfmMain.GetFoodDateList(aFDType: string): Boolean;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TADOQuery;
  oFoodCodeDetail :TFoodCodeDetail;
  nIndex : integer;
begin
  if FoodCodeList.Count > 0 then
  begin
    for i := FoodCodeList.Count - 1 downto 0 do
      TFoodCodeDetail(FoodCodeList.Objects[i]).Free;
  end;
  FoodCodeList.Clear;

  Result := False;

  stSql := 'select FT_YESTERDAYTIME from TB_FOODTYPE';
  stSql := stSql + ' Where RE_FDTYPE = ''' + aFDType + ''' ';
  stSql := stSql + ' Order by RE_FDTYPE ';
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
        nIndex := FoodCodeList.IndexOf('0');
        if nIndex < 0 then
        begin
          oFoodCodeDetail:= TFoodCodeDetail.Create(Self);
          oFoodCodeDetail.YesterDayTime := FindField('FT_YESTERDAYTIME').AsString;
          oFoodCodeDetail.StartTime := FindField('FT_YESTERDAYTIME').AsString;
          oFoodCodeDetail.EndTime := FindField('FT_YESTERDAYTIME').AsString;
          oFoodCodeDetail.FoodCode := '0';
          oFoodCodeDetail.InitTime := FindField('FT_YESTERDAYTIME').AsString;
          FoodCodeList.AddObject('0',oFoodCodeDetail);
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

function TfmMain.GetFoodReaderList(aFDType: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  FoodReaderList.Clear;

  stSql := ' Select * from TB_READER ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND RE_FDTYPE is not null ';
  stSql := stSql + ' AND RE_FDTYPE <> ''0'' ';
  //stSql := stSql + ' AND RE_FDTYPE = ''' + aFDType + ''' ';

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
      while Not Eof do
      begin
        FoodReaderList.Add(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FillZeroNumber(FindField('RE_READERNO').AsInteger,2));
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetTB_Config: Boolean;
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

    G_nEmployeeSearchType := 1;
    G_nFormLanguageType := 1;       //폼 언어 타입 1.KOR,2.ENG
    G_bFingerRelayUse := False;     //지문리더 연동 유무
    G_stDaemonControlPort := '5101';
    G_stDaemonControlServerIP := '127.0.0.1';
    G_stFireStateCode := 'FI';
    G_bFingerDeleteUse := False;
    G_stLongTimeStateCode := 'LT';
    G_nProgramGrade := 1;

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
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

      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGGROUP').AsString = 'CARD' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'EMPLOYEESEARCH' then G_nEmployeeSearchType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTDOORPERMITTYPE' then G_nCardDefaultDOORPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTARMPERMITTYPE' then G_nCardDefaultArmPermitType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEFAULTGRADEGROUP' then G_nCardDefaultGroupType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'LANGUAGE' then G_nFormLanguageType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ATAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAttendDedicateDoorUse := True
            else G_bAttendDedicateDoorUse := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFoodDedicateDoorUse := True
            else G_bFoodDedicateDoorUse := False;
          end
          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'DAEMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'CONTROLPORT' then G_stDaemonControlPort := FindField('CO_CONFIGVALUE').asstring
          else if FindField('CO_CONFIGCODE').AsString = 'SERVERIP' then G_stDaemonControlServerIP := FindField('CO_CONFIGVALUE').asstring
          else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMECD' then G_stLongTimeStateCode := FindField('CO_CONFIGVALUE').asstring
          else if FindField('CO_CONFIGCODE').AsString = 'CARDGRADE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nProgramGrade := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end
          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'DATABASE' then
        begin
        end else if FindField('CO_CONFIGGROUP').AsString = 'FIRE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'STATECODE' then G_stFireStateCode := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGGROUP').AsString = 'MONITORING' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'MAPTYPE' then G_nMonitorMapType := FindField('CO_CONFIGVALUE').AsInteger
          else if FindField('CO_CONFIGCODE').AsString = 'MAPBUILDING' then G_nMonitorMapBuilding := FindField('CO_CONFIGVALUE').AsInteger

          ;
        end else if FindField('CO_CONFIGGROUP').AsString = 'RELAY' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'FINGERRELAYUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFingerRelayUse := True;  //지문 연동 사용시
          end else if FindField('CO_CONFIGCODE').AsString = 'EMPLOYEETYPE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nEmployeeRelayType := strtoint(FindField('CO_CONFIGVALUE').AsString);  //
          end else if FindField('CO_CONFIGCODE').AsString = 'FINGERDELETEUSE' then
          begin
             if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFingerDeleteUse := True;  //지문 연동 사용시
          end;

        end else if FindField('CO_CONFIGGROUP').AsString = 'REPORT' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'SEARCHTYPE' then
          begin
            G_nReportSearchType := FindField('CO_CONFIGVALUE').AsInteger;
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

procedure TfmMain.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfmMain.Img_OutMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Try
    Img_Out.Picture := Img_OutE.Picture;
  Except
    Exit;
  End;
end;

procedure TfmMain.Img_OutMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Try
    Img_Out.Picture := Img_OutA.Picture;
  Except
    Exit;
  End;
end;

procedure TfmMain.ScreenRefresh;
begin
  Try
    Panel2.Repaint;
    Image1.Refresh;
    Image2.Refresh;
    Image3.Refresh;
    Img_Out.Refresh;
    Image7.Refresh;
    Image8.Refresh;
    Label2.Refresh;
    Label3.Refresh;
    Progress1.Refresh;
  Except
    Exit;
  End;
end;

procedure TfmMain.ServerConnected(Sender: TObject; aConnected: Boolean);
begin
  Try
    ServerConnectTimer.Enabled := Not aConnected;
    if aConnected then   // 연결 시점에 현재 식수 Count 다시 조회 하자.
    begin
      CurrentFoodCount := GetCurrentFoodCount(L_stFoodDate,L_stFDType,FoodCode);
      CurrentFoodOutcount := GetCurrentFoodOutCount(L_stFoodDate,L_stFDType,FoodCode);
    end;
  Except
    Exit;
  End;
end;

procedure TfmMain.ServerConnectTimerTimer(Sender: TObject);
begin
(*  if Not dmPCClient.Connected then
  begin
    dmPCClient.SocketConnect := True;
  end;
*)
end;

procedure TfmMain.ServerPacketView(Sender: TObject; aClientIP, aTxRx, aData,
  aResult: string);
begin
//  memo1.Lines.Add(aData);
end;

procedure TfmMain.SetCurrentFoodCount(const Value: integer);
var
  nPositoin : integer;
begin
  Try
    if FCurrentFoodCount = Value then Exit;
    FCurrentFoodCount := Value;
    lb_CurrentFoodCount.Caption.Value := Value;
    lb_TotFoodCount.Caption := inttostr(Value);
    lb_CurrentFoodCount.Refresh;
    lb_TotFoodCount.Refresh;


    if CurrentFoodOutcount > CurrentFoodCount then
    begin
      CurrentFoodOutcount := CurrentFoodCount;
    end else
    begin
      if CurrentFoodCount <> 0 then
      begin
        nPositoin := (CurrentFoodOutcount * 100) div CurrentFoodCount;
        Progress1.Position := nPositoin;
      end else Progress1.Position := 0;
    end;

    Progress1.Refresh;
  Except
    Exit;
  End;
end;

procedure TfmMain.SetCurrentFoodOutcount(const Value: integer);
var
  nPositoin : integer;
begin
  Try
    if FCurrentFoodOutcount = Value then Exit;
    if Value > CurrentFoodCount then
    begin
      CurrentFoodOutcount := CurrentFoodCount;
      Exit;
    end;

    FCurrentFoodOutcount := Value;
    lb_CurrentFoodOutCount.Caption.Value := Value;
    lb_Count.Caption := inttostr(Value);
    lb_CurrentFoodOutCount.Refresh;
    lb_Count.Refresh;

     //20160127 식수 잔반 에러 때문에 막아 놓음
    if CurrentFoodCount > 0 then
    begin
      if CurrentFoodOutcount > 0 then
      begin
        nPositoin := (CurrentFoodOutcount * 100) div CurrentFoodCount;
        Progress1.Position := nPositoin;
      end else Progress1.Position := 0;
    end else
    begin
      Progress1.Position := 0;
    end;
    Progress1.Refresh;
  Except
    Exit;
  End;
end;

procedure TfmMain.SetFoodCode(const Value: string);
begin
  Try
    if FFoodCode =  Value then Exit;

    FFoodCode := Value;
    CurrentFoodCount := GetCurrentFoodCount(L_stFoodDate,L_stFDType,FoodCode);
    //lb_CurrentFoodCount.Caption.Value := CurrentFoodCount;
    //lb_CurrentFoodCount.Refresh;
    CurrentFoodOutcount := GetCurrentFoodOutCount(L_stFoodDate,L_stFDType,FoodCode);
    //lb_CurrentFoodOutCount.Caption.Value := CurrentFoodOutcount;
    //lb_CurrentFoodOutCount.Refresh;
  Except
    Exit;
  End;
end;

procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  Try
    CurrentFoodCount := GetCurrentFoodCount(L_stFoodDate,L_stFDType,FoodCode);
    CurrentFoodOutcount := GetCurrentFoodOutCount(L_stFoodDate,L_stFDType,FoodCode);

    //lb_CurrentFoodCount.Repaint;
    lb_CurrentFoodOutCount.Repaint;
  Except
    Exit;
  End;

end;

procedure TfmMain.Timer2Timer(Sender: TObject);
var
  nDay : integer;
  days: array[1..7] of string;
begin
  Try
    lb_Time.Caption := FormatDateTime('hh:nn am/pm',now);

    if L_stOldDate = FormatDateTime('yyyymmdd',now) then Exit;
    L_stOldDate := FormatDateTime('yyyymmdd',now);

    lb_Date.Caption := FormatDateTime('yyyy mm dd',now);
    nDay := DayOfWeek(now);
    days[1] := '日';
    days[2] := '月';
    days[3] := '火';
    days[4] := '水';
    days[5] := '木';
    days[6] := '金';
    days[7] := '土';

    lb_Weekend.Caption := days[DayOfWeek(now)];

    ImgMon.Picture := ImgMon_E.Picture;
    ImgTUE.Picture := ImgTUE_E.Picture;
    ImgWED.Picture := ImgWED_E.Picture;
    ImgTHU.Picture := ImgTHU_E.Picture;
    ImgFRI.Picture := ImgFRI_E.Picture;
    ImgSAT.Picture := ImgSAT_E.Picture;

    case nDay of
      2 : begin
        ImgMon.Picture := ImgMon_a.Picture;
      end;
      3 : begin
        ImgTUE.Picture := ImgTUE_a.Picture;
      end;
      4 : begin
        ImgWED.Picture := ImgWED_a.Picture;
      end;
      5 : begin
        ImgTHU.Picture := ImgTHU_a.Picture;
      end;
      6 : begin
        ImgFRI.Picture := ImgFRI_a.Picture;
      end;
      7 : begin
        ImgSAT.Picture := ImgSAT_a.Picture;
      end;
    end;
  Except
    Exit;
  End;
end;

procedure TfmMain.WndProc(var Message: TMessage);
begin
  inherited;
  if Message.Msg=WM_ENDSESSION then begin
    if Not G_bApplicationTerminate then Close;
  end else if Message.Msg = WM_QUERYENDSESSION then begin
    if Not G_bApplicationTerminate then Close;
    Message.Result := 1;
  end;
end;

end.
