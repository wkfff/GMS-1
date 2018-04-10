unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,IniFiles, Vcl.StdCtrls, AdvGroupBox,Winapi.ShellAPI,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ImgList, Vcl.Menus,ActiveX,AdoDB,System.DateUtils,
  Data.DB, Vcl.ComCtrls;

const
  con_MaxCount = 13;

type
  TServerState = class(TComponent)
    ServerPanel : TPanel;
  private
    DeviceServerCheckTimer : TTimer;
    DeviceServerManagerCheckTimer : TTimer;
    FDeviceServerManagerStart: Boolean;
    FDeviceServerStart: Boolean;
    FDecoderNumber: integer;
    FStart: Boolean;
    procedure SetDeviceServerManagerStart(const Value: Boolean);
    procedure SetDeviceServerStart(const Value: Boolean);
    procedure SetStart(const Value: Boolean);
    procedure DeviceServerCheckTimerTimer(Sender:TObject);
    procedure DeviceServerManagerCheckTimerTimer(Sender:TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    property Start : Boolean read FStart write SetStart;
    property DecoderNumber : integer read FDecoderNumber write FDecoderNumber;
    property DeviceServerStart : Boolean read FDeviceServerStart write SetDeviceServerStart;
    property DeviceServerManagerStart : Boolean read FDeviceServerManagerStart write SetDeviceServerManagerStart;
  end;

  TfmMain = class(TForm)
    AdvGroupBox1: TAdvGroupBox;
    btn_PGUpdate: TSpeedButton;
    btn_ServerRestart: TSpeedButton;
    ScrollBox1: TScrollBox;
    FlowPanel1: TFlowPanel;
    pan_state1: TPanel;
    lb_DeviceState1: TLabel;
    btn_Start1: TSpeedButton;
    btn_Stop1: TSpeedButton;
    pan_DeviceState1: TPanel;
    pan_state2: TPanel;
    lb_DeviceState2: TLabel;
    btn_Start2: TSpeedButton;
    btn_Stop2: TSpeedButton;
    pan_DeviceState2: TPanel;
    pan_state3: TPanel;
    lb_DeviceState3: TLabel;
    btn_Start3: TSpeedButton;
    btn_Stop3: TSpeedButton;
    pan_DeviceState3: TPanel;
    pan_state4: TPanel;
    lb_DeviceState4: TLabel;
    btn_Start4: TSpeedButton;
    btn_Stop4: TSpeedButton;
    pan_DeviceState4: TPanel;
    pan_state5: TPanel;
    lb_DeviceState5: TLabel;
    btn_Start5: TSpeedButton;
    btn_Stop5: TSpeedButton;
    pan_DeviceState5: TPanel;
    pan_state6: TPanel;
    lb_DeviceState6: TLabel;
    btn_Start6: TSpeedButton;
    btn_Stop6: TSpeedButton;
    pan_DeviceState6: TPanel;
    pan_state7: TPanel;
    lb_DeviceState7: TLabel;
    btn_Start7: TSpeedButton;
    btn_Stop7: TSpeedButton;
    pan_DeviceState7: TPanel;
    pan_state8: TPanel;
    lb_DeviceState8: TLabel;
    btn_Start8: TSpeedButton;
    btn_Stop8: TSpeedButton;
    pan_DeviceState8: TPanel;
    pan_state9: TPanel;
    lb_DeviceState9: TLabel;
    btn_Start9: TSpeedButton;
    btn_Stop9: TSpeedButton;
    pan_DeviceState9: TPanel;
    pan_state10: TPanel;
    lb_DeviceState10: TLabel;
    btn_Start10: TSpeedButton;
    btn_Stop10: TSpeedButton;
    pan_DeviceState10: TPanel;
    pan_state11: TPanel;
    lb_DeviceState11: TLabel;
    btn_Start11: TSpeedButton;
    btn_Stop11: TSpeedButton;
    pan_DeviceState11: TPanel;
    pan_state12: TPanel;
    lb_DeviceState12: TLabel;
    btn_Start12: TSpeedButton;
    btn_Stop12: TSpeedButton;
    pan_DeviceState12: TPanel;
    btn_ServerShow1: TSpeedButton;
    btn_ServerShow2: TSpeedButton;
    btn_ServerShow3: TSpeedButton;
    btn_ServerShow4: TSpeedButton;
    btn_ServerShow5: TSpeedButton;
    btn_ServerShow6: TSpeedButton;
    btn_ServerShow7: TSpeedButton;
    btn_ServerShow8: TSpeedButton;
    btn_ServerShow9: TSpeedButton;
    btn_ServerShow10: TSpeedButton;
    btn_ServerShow11: TSpeedButton;
    btn_ServerShow12: TSpeedButton;
    TrayIcon1: TTrayIcon;
    pm_TrayMenu: TPopupMenu;
    mn_trayVisible: TMenuItem;
    N2: TMenuItem;
    mn_trayClose: TMenuItem;
    TrayImageList: TImageList;
    TrayTimer: TTimer;
    ETCServerCheckTimer: TTimer;
    btn_DataBaseBackupConfig: TSpeedButton;
    ADOBackupQuery: TADOQuery;
    pan_state13: TPanel;
    lb_DeviceState13: TLabel;
    btn_Start13: TSpeedButton;
    btn_Stop13: TSpeedButton;
    btn_ServerShow13: TSpeedButton;
    pan_DeviceState13: TPanel;
    DateTimer1: TTimer;
    MemoryClearTimer: TTimer;
    CardPermitCheckTimer: TTimer;
    StatusBar1: TStatusBar;
    btn_DbBackup: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_Start1Click(Sender: TObject);
    procedure btn_Stop1Click(Sender: TObject);
    procedure btn_PGUpdateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ServerRestartClick(Sender: TObject);
    procedure btn_ServerShow1Click(Sender: TObject);
    procedure TrayTimerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mn_trayVisibleClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure mn_trayCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ETCServerCheckTimerTimer(Sender: TObject);
    procedure btn_DataBaseBackupConfigClick(Sender: TObject);
    procedure DateTimer1Timer(Sender: TObject);
    procedure MemoryClearTimerTimer(Sender: TObject);
    procedure CardPermitCheckTimerTimer(Sender: TObject);
    procedure btn_DbBackupClick(Sender: TObject);
  private
    L_bClose : Boolean;
    L_bDataBaseBackupLock : Boolean;
    L_bEmployeePermitLoad : Boolean;
    L_bFormActive : Boolean;
    L_bProgramAllStop : Boolean;
    L_dtDBBackupTime : TDateTime;  //데이터 베이스 백업 동작 시간
    L_stDataBaseLastBackupDate : string;
    L_stDeleteDir : string;

    ServerStateList : TStringList;
    FDate: string;
    { Private declarations }
    Function LoadIniConfig:Boolean;
    Function LogDelete:Boolean;
    function LoadEmployeePermitChangeData:Boolean;   //변경된 사원 권한이 있으면 카드권한으로 변경 한다.
    function LoadEmployeePermitToCard(aEmSeq:string):Boolean;  //사원정보 로딩하여 카드권한으로 변경
    Function GetTB_BMSCONFIG : Boolean;
    Function GetTB_Config : Boolean;
    Function DataBaseBackup(aAuto:Boolean=True) : Boolean;
    Function DataBaseBackupMDBType(aBackupDir:string):Boolean;
    Function DataBaseBackupMSSQLTableLayoutCreate(aBackupDir,aTableName:string):Boolean;
    Function DataBaseBackupMSSQLType(aBackupDir:string;aFileCreate:Boolean=True):Boolean;
    Function DataBaseBackupPGTableLayoutCreate(aBackupDir,aTableName:string):Boolean;
    Function DataBaseBackupPostgreSqlType(aBackupDir:string):Boolean;
    procedure DataBaseBackupInfomationCreate(aFile:string);
    Function DataBaseTableToFileBackup(aBackupDir,aTableName:string):Boolean;
    Function FileDataBaseBackup(bFull:Boolean):Boolean;   //배치성 백업
    procedure PanelShow;
    procedure ProgramAllStart;
    procedure ProgramAllStop;
    procedure ProgramAllUpdate;
    function ProcessAllStopCheck:Boolean;
    procedure WndProc(var Message: TMessage); override;
    procedure SetDate(const Value: string);
  public
    { Public declarations }
    property Date : string read FDate write SetDate;
  end;

var
  fmMain: TfmMain;
  G_stExeFolder : string;
  G_bCardPermitLoading : Boolean;
  G_nServerStartNumber : integer;
  G_nServerEndNumber : integer;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uConfig,
  uDataBase,
  uDataBaseConfig,
  uDBCardPermit,
  uDBDelete,
  uDBUpdate,
  uDeviceVariable,
  uSharedMemory;
{$R *.dfm}


function AFServerCheck: Boolean;
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
  result := False;
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_AFServer.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            result := True;
            break;
          end;
        end;
      end;
    end;
  Finally
    ProcessList.Clear;
    ProcessList.Free;
  End;
end;

function AFServerProcessStart: Boolean;
begin
  result := False;
  //여기에서 프로그램 실행 시키자.
  if FileExists(G_stExeFolder + '\GMS_AFServer.exe') then
  begin
    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\GMS_AFServer.exe'),'','', SW_Normal);
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar(G_stExeFolder + '\GMS_AFServer.exe'),'', SW_HIDE);
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar('"' +G_stExeFolder + '\GMS_AFServer.exe"'),'', SW_HIDE);
//    Winexec(pAnsiChar('GMS_AFServer.exe'),SW_SHOW);
    result := True;
  end;
end;

function AFServerProcessStop: Boolean;
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
//  Exit;
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_AFServer.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            // 명시한 process를 강제 종료시킨다
            TerminateProcess(hProcess, 0);
          end;
        end;
      end;
    end;
  Finally
    ProcessList.clear;
    ProcessList.Free;
  End;
end;


function CardServerCheck: Boolean;
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
  result := False;
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_CardManager.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            result := True;
            break;
          end;
        end;
      end;
    end;
  Finally
    ProcessList.Free;
  End;
end;

function CardServerProcessStart: Boolean;
begin
  result := False;
  //여기에서 프로그램 실행 시키자.
  if FileExists(G_stExeFolder + '\GMS_CardManager.exe') then
  begin
    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\GMS_CardManager.exe'),'','', SW_Normal);
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar(G_stExeFolder + '\GMS_CardManager.exe'),'', SW_HIDE);
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar('"' +G_stExeFolder + '\GMS_CardManager.exe"'),'', SW_HIDE);
    result := True;
  end;
end;

function CardServerProcessStop: Boolean;
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
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_CardManager.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            // 명시한 process를 강제 종료시킨다
            TerminateProcess(hProcess, 0);
          end;
        end;
      end;
    end;
  Finally
    ProcessList.Free;
  End;
end;

function DeviceServerManagerCheck(aDecoderNumber: integer): Boolean;
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
  result := False;
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_DeviceServerManager' +inttostr(aDecoderNumber) + '.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          result := True;
          break;
        end;
      end;
    end;
  Finally
    ProcessList.Free;
  End;
end;

function DeviceServerCheck(aDecoderNumber: integer): Boolean;
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
  result := False;
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_DeviceServer' +inttostr(aDecoderNumber) + '.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            result := True;
            break;
          end;
        end;
      end;
    end;
  Finally
    ProcessList.Free;
  End;
end;

function DeviceServerManagerProcessStart(aDecoderNumber: integer): Boolean;
var
  hProcess:THandle;
begin
  result := False;
  //여기에서 프로그램 실행 시키자.
  if FileExists(G_stExeFolder + '\' + inttostr(aDecoderNumber) + '\GMS_DeviceServerManager' +inttostr(aDecoderNumber) + '.exe') then
  begin
    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\' + inttostr(aDecoderNumber) + '\GMS_DeviceServerManager' +inttostr(aDecoderNumber) + '.exe'),'','', SW_Normal);
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar('"' +G_stExeFolder + '\' + inttostr(aDecoderNumber) + '\GMS_DeviceServerManager' +inttostr(aDecoderNumber) + '.exe"'),'', SW_HIDE);
    result := True;
  end;
  hProcess := OpenProcess(PROCESS_SET_QUOTA,false,GetCurrentProcessId);   //메모리 누수에 도움이 될까?
  try
    SetProcessWorkingSetSize(hProcess, $FFFFFFFF, $FFFFFFFF);
  finally
    CloseHandle(hProcess);
  end;

end;

function DeviceServerManagerProcessStop(aDecoderNumber: integer): Boolean;
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
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_DeviceServerManager' +inttostr(aDecoderNumber) + '.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            // 명시한 process를 강제 종료시킨다
            TerminateProcess(hProcess, 0);
          end;
        end;
      end;
    end;
  Finally
    ProcessList.Free;
  End;
end;

function DeviceServerProcessStart(aDecoderNumber: integer): Boolean;
var
  hProcess:THandle;
begin
  result := False;
  //여기에서 프로그램 실행 시키자.
  if FileExists(G_stExeFolder +'\' + inttostr(aDecoderNumber) + '\GMS_DeviceServer' +inttostr(aDecoderNumber) + '.exe') then
  begin
    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\' + inttostr(aDecoderNumber) + '\GMS_DeviceServer' +inttostr(aDecoderNumber) + '.exe'),'','', SW_Normal);
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar('"' +G_stExeFolder + '\' + inttostr(aDecoderNumber) + '\GMS_DeviceServer' +inttostr(aDecoderNumber) + '.exe"'),'', SW_HIDE);
    result := True;
  end;
  hProcess := OpenProcess(PROCESS_SET_QUOTA,false,GetCurrentProcessId);   //메모리 누수에 도움이 될까?
  try
    SetProcessWorkingSetSize(hProcess, $FFFFFFFF, $FFFFFFFF);
  finally
    CloseHandle(hProcess);
  end;
end;

function DeviceServerProcessStop(aDecoderNumber: integer): Boolean;
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
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_DeviceServer' +inttostr(aDecoderNumber) + '.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            // 명시한 process를 강제 종료시킨다
            TerminateProcess(hProcess, 0);
          end;
        end;
      end;
    end;
  Finally
    ProcessList.Free;
  End;
end;

function FingerServerCheck: Boolean;
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
  result := False;
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_FingerServer.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            result := True;
            break;
          end;
        end;
      end;
    end;
  Finally
    ProcessList.Free;
  End;
end;


function FingerServerProcessStart: Boolean;
begin
  result := False;
  //여기에서 프로그램 실행 시키자.
  if FileExists(G_stExeFolder +'\GMS_FingerServer.exe') then
  begin
    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\GMS_FingerServer.exe'),'','', SW_Normal);
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar('"' +G_stExeFolder + '\GMS_FingerServer.exe"'),'', SW_HIDE);
    result := True;
  end;
end;


function FingerServerProcessStop: Boolean;
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
      if UpperCase(ProcessList.Strings[i]) = UpperCase('GMS_FingerServer.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            // 명시한 process를 강제 종료시킨다
            TerminateProcess(hProcess, 0);
          end;
        end;
      end;
    end;
  Finally
    ProcessList.Free;
  End;
end;


function TravelLabelItem(aPanel: TPanel; stName: string;
  no: Integer): TLabel;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to aPanel.ControlCount-1 do
  Begin
    If LowerCase(aPanel.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TLabel(aPanel.Controls[Loop]);
      exit;
    End;
  End;

end;

function TravelPanelItem_FlowPanel(FlowPanel: TFlowPanel; stName: string;
  no: Integer): TPanel;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to FlowPanel.ControlCount-1 do
  Begin
    If LowerCase(FlowPanel.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TPanel(FlowPanel.Controls[Loop]);
      exit;
    End;
  End;

end;

function TravelPanelItem_Panel(aPanel: TPanel; stName: string;
  no: Integer): TPanel;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to aPanel.ControlCount-1 do
  Begin
    If LowerCase(aPanel.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TPanel(aPanel.Controls[Loop]);
      exit;
    End;
  End;
end;

function TravelSpeedButtonItem(aPanel: TPanel; stName: string;
  no: Integer): TSpeedButton;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to aPanel.ControlCount-1 do
  Begin
    If LowerCase(aPanel.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TSpeedButton(aPanel.Controls[Loop]);
      exit;
    End;
  End;

end;


procedure TfmMain.btn_DataBaseBackupConfigClick(Sender: TObject);
begin
  fmConfig := TfmConfig.Create(nil);
  fmConfig.ServerStartNumber := G_nServerStartNumber;
  fmConfig.ServerEndNumber := G_nServerEndNumber;
  fmConfig.CardPermitLoading := G_bCardPermitLoading;
  fmConfig.showmodal;
  G_nServerStartNumber := fmConfig.ServerStartNumber;
  G_nServerEndNumber := fmConfig.ServerEndNumber;
  G_bCardPermitLoading := fmConfig.CardPermitLoading;
  fmConfig.free;
  CardPermitCheckTimer.Enabled := G_bCardPermitLoading;
end;

procedure TfmMain.btn_DbBackupClick(Sender: TObject);
begin
  DataBaseBackup(False);
end;

procedure TfmMain.btn_PGUpdateClick(Sender: TObject);
begin
  if Not FileExists(G_stExeFolder + '\GMS_ServerManager_Update\SmartUpdate.exe') then
  begin
    showmessage('Not Install ' + btn_PGUpdate.Caption + ' Tools');
    Exit;
  end;
  ProgramAllStop;

  ShellExecute(0, 'open', pchar(G_stExeFolder + '\GMS_ServerManager_Update\SmartUpdate.exe'),'','', SW_Normal);
end;

procedure TfmMain.btn_ServerRestartClick(Sender: TObject);
begin
  ProgramAllStop;
  ProgramAllStart;
end;

procedure TfmMain.btn_ServerShow1Click(Sender: TObject);
var
  oControlSendMemory : TfisSharedMemory;     //수신부
  nDecoderNo : integer;
  mmf_data : array [0..k_max_info_size-1] of char;
begin
  StrPCopy(mmf_data, inttostr(con_cmdManagerToServerFormShow) + DATADELIMITER);
  nDecoderNo := TSpeedButton(Sender).Tag;
  Try
    oControlSendMemory := TfisSharedMemory.Create(nil);
    oControlSendMemory.ShareName := 'DEVICESERVERMANAGERCONTROL'+inttostr(nDecoderNo);
    oControlSendMemory.CreateMMF_Info;
    oControlSendMemory.Write_Info(mmf_data);
  Finally
    oControlSendMemory.Free;
  End;
end;

procedure TfmMain.btn_Start1Click(Sender: TObject);
var
  nIndex : integer;
begin
  TSpeedButton(Sender).Enabled := False;
  nIndex := ServerStateList.IndexOf(inttostr(TSpeedButton(Sender).Tag));
  if nIndex > -1 then TServerState(ServerStateList.Objects[nIndex]).Start := True;
end;

procedure TfmMain.btn_Stop1Click(Sender: TObject);
var
  nIndex : integer;
begin
  TSpeedButton(Sender).Enabled := False;
  nIndex := ServerStateList.IndexOf(inttostr(TSpeedButton(Sender).Tag));
  if nIndex > -1 then TServerState(ServerStateList.Objects[nIndex]).Start := False;
end;


procedure TfmMain.CardPermitCheckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  Try
//    StatusBar1.Panels[0].Text := 'CardPermitCheckTimerTimer';
    CardPermitCheckTimer.Enabled := False;
    LoadEmployeePermitChangeData;
  Finally
    CardPermitCheckTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

function TfmMain.DataBaseBackup(aAuto:Boolean=True): Boolean;
var
  bResult : Boolean;
  stDate : string;
begin
  Try
    if G_bApplicationTerminate then Exit;
    if aAuto and (L_dtDBBackupTime > Now) then Exit;
    if aAuto then L_dtDBBackupTime := L_dtDBBackupTime + G_nDataBaseBackupCycle;    //다음 주기를 구해 놓자

    //DataBaseBackupInfomationCreate(G_stDataBaseBackupDir + '\' + FormatDateTime('yyyymmdd',Now) + '\Backup.ini');
    bResult := FileDataBaseBackup(False);
    if bResult then
    begin
      stDate := FormatdateTime('yyyymmdd',Now - G_nDataBaseACEventdeleteDay);
      dmDBDelete.DeleteTB_ACCESSEVENT_ToDate(stDate);
      stDate := FormatdateTime('yyyymmdd',Now - G_nDataBasePTEventdeleteDay);
      dmDBDelete.DeleteTB_ALARMEVENT_ToDate(stDate);

      dmDBUpdate.UpdateTB_BMSCONFIG_Value('BMS','LASTBACKUP',FormatDateTime('yyyymmdd',now));
    end;
  Except
    LogSave(G_stLogDirectory + '\DataBaseBackup' + FormatDateTime('yyyymmdd',now) + '.log','DataBaseBackup Error');
  End;

end;

procedure TfmMain.DataBaseBackupInfomationCreate(aFile: string);
var
  ini_fun : TiniFile;
  stDBType : string;
begin
  if G_nDBType = MSSQL then stDBType := 'MSSQL'
  else if G_nDBType = POSTGRESQL then stDBType := 'PG'
  else if G_nDBType = MDB then stDBType := 'MDB'
  else if G_nDBType = FIREBIRD then stDBType := 'FB';
  if not DirectoryExists(ExtractFileDir(aFile)) then
  begin
   if Not CreateDir(ExtractFileDir(aFile)) then
   begin
      Exit;
   end;
  end;

  Try
    ini_fun := TiniFile.Create(aFile);
    ini_fun.WriteString('Config','DBTYPE',stDBType);
    ini_fun.WriteInteger('Config','VER',1);
  Finally
    ini_fun.Free;
  End;
end;

function TfmMain.DataBaseBackupMDBType(aBackupDir: string): Boolean;
var
  ini_fun : TiniFile;
  stExeFolder : String;
  stDBDir : string;
begin
  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\BMSSERVER.INI');
  stDBDir := ini_fun.ReadString('DBConfig','DBPATH',stExeFolder + '/../DB');
  ini_fun.Free;

  if FileExists(stDBDir + '/BMS.mdb') then
    CopyFile(pchar(stDBDir + '/BMS.mdb'),pchar(aBackupDir + '/BMS.mdb'),True);
  if FileExists(stDBDir + '/BMSEVENT.mdb') then
    CopyFile(pchar(stDBDir + '/BMSEVENT.mdb'),pchar(aBackupDir + '/BMSEVENT.mdb'),True );
  if FileExists(stDBDir + '/BMSLOG.mdb') then
    CopyFile(pchar(stDBDir + '/BMSLOG.mdb'),pchar(aBackupDir + '/BMSLOG.mdb'),True );

end;

function TfmMain.DataBaseBackupMSSQLTableLayoutCreate(aBackupDir,
  aTableName: string): Boolean;
var
  stSql : string;
  FileList : TStringList;
begin
  result := False;

  Try
    stSql := ' declare @table varchar(100) ';
    stSql := stSql + ' set @table = ''' + aTableName + ''' ';
    stSql := stSql + ' declare @sql table(s varchar(1000), id int identity)  ';
    stSql := stSql + ' insert into  @sql(s) values (''create table ['' + @table + ''] ('') ';
    stSql := stSql + ' insert into @sql(s) select      ''  [''+column_name+''] '' +      data_type + coalesce(''(''+cast(character_maximum_length as varchar)+'')'','''') + '' '' +   ';
    stSql := stSql + ' case when exists (   ';
    stSql := stSql + '  select id from syscolumns   ';
    stSql := stSql + '  where object_name(id)=@table   ';
    stSql := stSql + '  and name=column_name  ';
    stSql := stSql + '  and columnproperty(id,name,''IsIdentity'') = 1  ';
    stSql := stSql + ' ) then  ';
    stSql := stSql + '  ''IDENTITY('' +  ';
    stSql := stSql + '  cast(ident_seed(@table) as varchar) + '','' +   ';
    stSql := stSql + '  cast(ident_incr(@table) as varchar) + '')''  ';
    stSql := stSql + '  else ''''   ';
    stSql := stSql + '  end + '' '' +   ';
    stSql := stSql + '  ( case when IS_NULLABLE = ''No'' then ''NOT '' else '''' end ) + ''NULL '' +  ';
    stSql := stSql + '  coalesce(''DEFAULT ''+COLUMN_DEFAULT,'''') + '',''  ';
    stSql := stSql + ' from information_schema.columns where table_name = @table  ';
    stSql := stSql + ' order by ordinal_position  ';
    stSql := stSql + ' declare @pkname varchar(100)  ';
    stSql := stSql + ' select @pkname = constraint_name from information_schema.table_constraints  ';
    stSql := stSql + ' where table_name = @table and constraint_type=''PRIMARY KEY''  ';
    stSql := stSql + ' if ( @pkname is not null ) begin  ';
    stSql := stSql + '  insert into @sql(s) values(''  PRIMARY KEY ('')  ';
    stSql := stSql + '  insert into @sql(s)  ';
    stSql := stSql + '  select ''   [''+COLUMN_NAME+''],'' from information_schema.key_column_usage  ';
    stSql := stSql + '  where constraint_name = @pkname  ';
    stSql := stSql + '  order by ordinal_position  ';
    stSql := stSql + '  update @sql set s=left(s,len(s)-1) where id=@@identity  ';
    stSql := stSql + '  insert into @sql(s) values (''  )'')  ';
    stSql := stSql + ' end else begin  ';
    stSql := stSql + '  update @sql set s=left(s,len(s)-1) where id=@@identity  ';
    stSql := stSql + ' end  ';
    stSql := stSql + ' insert into @sql(s) values( '')'' )  ';
    stSql := stSql + ' select s as data from @sql order by id  ';

    FileList := TStringList.Create;
    with ADOBackupQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
      Except
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DataBaseBackup');
        Exit;
      End;

      if recordcount < 1 then Exit;
      FileList.Clear;
      while Not Eof do
      begin
        FileList.Add(FindField('data').AsString);
        Application.ProcessMessages;
        Next;
      end;
      FileList.Add(';');
    end;
    result := True;
  Finally
    FileList.SaveToFile(aBackupDir + '\' + aTableName + '.csql');
    FileList.Free;
  End;
end;

function TfmMain.DataBaseBackupMSSQLType(aBackupDir: string;aFileCreate:Boolean=True): Boolean;
var
  stSql : string;
  f: TextFile;
begin
  if aFileCreate then
  begin
    Try
      AssignFile(f, aBackupDir + '\' + G_stDBName + '.dat');
      Rewrite(f);
      CloseFile(f);
    Except
      LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DataBaseBackupMSSQLType');
    End;
  end;

  stSql := 'backup database ' + G_stDBName + ' to disk=''' + aBackupDir + '\' + G_stDBName + '.dat'' WITH FORMAT, MEDIANAME = ''Z_SQLServerBackups'',NAME = ''Full Backup of ' + G_stDBName + '''';
  result := dmDataBase.ProcessExecSQL(stSql);
  StatusBar1.Panels[0].Text := stSql;
end;

function TfmMain.DataBaseBackupPGTableLayoutCreate(aBackupDir,
  aTableName: string): Boolean;
var
  stSql : string;
  stType : string;
  stDefault : string;
  stCreateSql : string;
  FileList : TStringList;
  stTemp : string;
  bFirst : Boolean;
begin
  result := False;

  Try
    stSql := 'SELECT  attnum,attname , typname , atttypmod-4 as typmode , attnotnull ,atthasdef ,adsrc AS def ';
    stSql := stSql + ' FROM pg_attribute, pg_class, pg_type, pg_attrdef ';
    stSql := stSql + ' WHERE pg_class.oid=attrelid ';
    stSql := stSql + ' AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum ';
    stSql := stSql + ' AND atthasdef=''t'' AND lower(relname)=''' + lowerCase(aTableName) + ''' UNION ';
    stSql := stSql + ' SELECT attnum,attname , typname , atttypmod-4 , attnotnull , atthasdef ,'''' AS def ';
    stSql := stSql + ' FROM pg_attribute, pg_class, pg_type WHERE pg_class.oid=attrelid ';
    stSql := stSql + ' AND pg_type.oid=atttypid AND attnum>0 AND atthasdef=''f'' AND lower(relname)=''' + lowerCase(aTableName) + ''' ';
    stSql := stSql + ' order by attnum ';

    FileList := TStringList.Create;
    with ADOBackupQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
      Except
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DataBaseBackup');
        Exit;
      End;

      if recordcount < 1 then Exit;

      stCreateSql := 'CREATE TABLE ' + aTableName;
      stCreateSql := stCreateSql + ' ( ';
      bFirst := True;
      While Not Eof do
      begin
        if Not bFirst then
          stCreateSql := stCreateSql + ',';
        bFirst := False;
        stCreateSql := stCreateSql + ' ' + FindField('attname').AsString;
        if UpperCase(FindField('typname').AsString) = 'INT4' then stType := 'INTEGER'
        else if UpperCase(FindField('typname').AsString) = 'BPCHAR' then stType := 'CHAR'
        else stType := UpperCase(FindField('typname').AsString);
        stCreateSql := stCreateSql + ' ' + stType;
        if UpperCase(FindField('typname').AsString) <> 'INT4' then
        begin
          stCreateSql := stCreateSql + '(' + FindField('typmode').AsString + ')';
        end;
        stTemp := UpperCase(FindField('attnotnull').AsString);
        if (stTemp = 'T') OR (stTemp = 'TRUE') OR (stTemp = '1') then
        begin
          stCreateSql := stCreateSql + ' NOT NULL ';
        end;
        stTemp := UpperCase(FindField('atthasdef').AsString);
        if (stTemp = 'T') OR (stTemp = 'TRUE') OR (stTemp = '1') then
        begin
          stCreateSql := stCreateSql + ' DEFAULT ';
          if UpperCase(FindField('typname').AsString) <> 'INT4' then
          begin
            stCreateSql := stCreateSql + ' ''';
            stDefault := FindField('def').AsString;
            stDefault:= FindCharCopy(stDefault,1,'''');
            stCreateSql := stCreateSql + stDefault;
            stCreateSql := stCreateSql + ''' ';
          end else stCreateSql := stCreateSql + FindField('def').AsString;
        end;
        Application.ProcessMessages;
        Next;
      end;
      stCreateSql := stCreateSql + ' ); ';
      FileList.Add(stCreateSql);
    End;

    stSql := 'SELECT pg_index.indisprimary,';
    stSql := stSql + ' pg_catalog.pg_get_indexdef(pg_index.indexrelid) as pkey ';
    stSql := stSql + ' FROM pg_catalog.pg_class c, pg_catalog.pg_class c2,';
    stSql := stSql + ' pg_catalog.pg_index AS pg_index ';
    stSql := stSql + ' WHERE c.relname = ''' + lowerCase(aTableName) + ''' ';
    stSql := stSql + ' AND c.oid = pg_index.indrelid ';
    stSql := stSql + ' AND pg_index.indexrelid = c2.oid ';
    stSql := stSql + ' AND pg_index.indisprimary ';

    with ADOBackupQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
      Except
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DataBaseBackup');
        Exit;
      End;

      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        stCreateSql := ' ALTER TABLE ' + aTableName;
        stCreateSql := stCreateSql + '   ADD CONSTRAINT ' + aTableName +'_pkey PRIMARY KEY ';

        stTemp := FindField('pkey').AsString;

        stTemp := stringReplace(stTemp,'(',')',[rfReplaceAll]);
        stTemp := FindCharCopy(stTemp,1,')');

        stCreateSql := stCreateSql + '(' + stTemp + ');';
        FileList.Add(stCreateSql);

        Application.ProcessMessages;
        Next;
      end;
    end;
    result := True;
  Finally
    FileList.SaveToFile(aBackupDir + '\' + aTableName + '.csql');
    FileList.Free;
  End;

end;

function TfmMain.DataBaseBackupPostgreSqlType(aBackupDir: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' SELECT relname AS tablename ';
  stSql := stSql + ' FROM pg_class WHERE relkind IN (''r'') ';
  stSql := stSql + ' AND relname NOT LIKE ''pg_%'' AND relname NOT LIKE ''sql_%'' ORDER BY tablename ';
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
        LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DataBaseBackupPostgreSqlType');
        Exit;
      End;

      While Not Eof do
      begin
        DataBaseBackupPGTableLayoutCreate(aBackupDir,UpperCase(FindField('tablename').AsString));
        DataBaseTableToFileBackup(aBackupDir,UpperCase(FindField('tablename').AsString));
        Delay(1000);
        if G_bApplicationTerminate then Exit;
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

function TfmMain.DataBaseTableToFileBackup(aBackupDir,
  aTableName: string): Boolean;
var
  stBackupDir : string;
  stSql : string;
begin
  stBackupDir := aBackupDir;
  if not DirectoryExists(stBackupDir) then
  begin
   if Not CreateDir(stBackupDir) then
   begin
      //showmessage(stBackupDir + ' 은 생성할수 없는 디렉토리입니다. 환경설정을 확인 후 재기동하여 주세요. ');
      Exit;
   end;
  end;
  if (G_nDBTYPE = MSSQL) or (G_nDBTYPE = MDB) then
  begin
    stSql := ' select * from ' + aTableName ;
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := 'copy( select * from ' + aTableName  + ') to ''' + stringReplace(stBackupDir,'\','\\',[rfReplaceAll]) + '\\' + aTableName + '.BAK''' ;
  end;

  with ADOBackupQuery do
  begin
    Close;
    //SQL.Clear;
    SQL.Text := stSql;
    Try
      if (G_nDBTYPE = MSSQL) or (G_nDBTYPE = MDB) then
      begin
        Open;
      end else if G_nDBTYPE = POSTGRESQL then
      begin
        ExecSql;
      end;
    Except
      LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DataBaseBackupPostgreSqlType1');
      Exit;
    End;
    Try
      if (G_nDBTYPE = MSSQL) or (G_nDBTYPE = MDB) then SaveToFile(stBackupDir + '\' + aTableName + '.BAK');
    Except
      LogSave(G_stLogDirectory + '\Err' + FormatDateTime('yyyymmdd',now) + '.log','DataBaseBackupPostgreSqlType1');
      Exit;
    End;
  end;
  result := True;
end;

procedure TfmMain.DateTimer1Timer(Sender: TObject);
begin
//  StatusBar1.Panels[0].Text := 'DateTimer1Timer';
  Date := FormatDateTime('yyyymmdd',now);
end;

procedure TfmMain.ETCServerCheckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
//  StatusBar1.Panels[0].Text := 'ETCServerCheckTimerTimer';
//TEST
  Try
    ETCServerCheckTimer.Enabled := False;
    if Not AFServerCheck then
    begin
      AFServerProcessStart;
    end;
    if Not FingerServerCheck then
    begin
      FingerServerProcessStart;
    end;
    if Not CardServerCheck then
    begin
      CardServerProcessStart;
    end;
    LogDelete;
    if G_bDataBaseAutoBackup then DataBaseBackup;
  Finally
    ETCServerCheckTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

function TfmMain.FileDataBaseBackup(bFull: Boolean): Boolean;
var
  stBackupDir : string;
begin
  Result := False;

  if not DirectoryExists(G_stDataBaseBackupDir) then
  begin
   if Not CreateDir(G_stDataBaseBackupDir) then
   begin
      Exit;
   end;
  end;
  if L_bDataBaseBackupLock then Exit;
  Try
    L_bDataBaseBackupLock := True;
    TrayIcon1.BalloonHint := 'DataBase 백업중...';
    stBackupDir := G_stDataBaseBackupDir + '\' + FormatDateTime('yyyymmdd',Now);

    if not DirectoryExists(stBackupDir) then
    begin
     if Not CreateDir(stBackupDir) then Exit;
    end;

    DataBaseBackupInfomationCreate(stBackupDir + '\Backup.ini');
    if G_nDBType = POSTGRESQL then result := DataBaseBackupPostgreSqlType(stBackupDir)
    else if G_nDBType = MSSQL then result := DataBaseBackupMSSQLType(stBackupDir,G_bBackupFileCreate)
    else if G_nDBType = MDB then result := DataBaseBackupMDBType(stBackupDir);

    TrayIcon1.BalloonHint := 'DataBase 백업완료';
    //result := True;

  Finally
    L_bDataBaseBackupLock := False;
  End;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  L_bFormActive := True;
  DateTimer1.Enabled := True;
  CardPermitCheckTimer.Enabled := G_bCardPermitLoading;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TrayIcon1.Visible := False;
  G_bApplicationTerminate := True;    //프로그램 Stop 후 종료
  ETCServerCheckTimer.enabled := False;
  CardPermitCheckTimer.Enabled := False;

  ProgramAllStop;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if L_bClose = False then
  begin
    CanClose := False;
    Hide();
    WindowState := wsMinimized;
  end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  G_bApplicationTerminate := False;
  L_bFormActive := False;
  L_bDataBaseBackupLock := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  LoadIniConfig;
  ServerStateList := TStringList.Create;
  PanelShow;

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
  LoadIniConfig;
  GetTB_Config;
  GetTB_BMSCONFIG;

  TrayTimer.Enabled := True;
end;

function TfmMain.GetTB_BMSCONFIG: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  L_stDataBaseLastBackupDate := FormatDateTime('yyyymmdd',now);
  if G_stDataBaseBackupTime = '' then G_stDataBaseBackupTime := '0100';


  stSql := 'select * from TB_BMSCONFIG ';
  stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
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
        LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','GetTB_BMSCONFIG');
        Exit;
      End;
      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        if FindField('BC_CONFIGCODE').AsString = 'LASTBACKUP' then
          L_stDataBaseLastBackupDate := FindField('BC_CONFIGVALUE').AsString;
        Application.ProcessMessages;
        Next;
      end;
      if isdigit(L_stDataBaseLastBackupDate) then
      begin
        L_dtDBBackupTime := EncodeDateTime(strtoint(copy(L_stDataBaseLastBackupDate,1,4)),
                                       strtoint(copy(L_stDataBaseLastBackupDate,5,2)),
                                       strtoint(copy(L_stDataBaseLastBackupDate,7,2)),
                                       strtoint(copy(G_stDataBaseBackupTime,1,2)),
                                       strtoint(copy(G_stDataBaseBackupTime,3,2)),
                                       0,0);
        L_dtDBBackupTime := L_dtDBBackupTime + G_nDataBaseBackupCycle ; // 마지막 백업 시간 + 백업 주기 => 다음에 백업할 시간임
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

    G_nCardNoType := 0; //디폴트로 고정 4Byte 사용
    G_nFormLanguageType := 1;       //폼 언어 타입 1.KOR,2.ENG
    G_nCompanyCodeLength := 3;       //
    G_nBuildingCodeLength := 3;       //

    G_stDaemonControlPort := '5101';
    G_stLongTimeStateCode := '';

    G_bCardPositionUse := False; //카드 위치정보 사용 유무
    G_bExitButtonEventUse := False;   //출입이력만 남기자.
    G_bDoorLongTimeOpenEventUse := False;  //장시간출입문열림시 알람 이벤트 남길지 여부
    G_bDeviceCommLogSave := False;
    G_nScheduleDevice := 0;  //0.컨트롤러스케줄,1.PC스케줄
    G_bAlarmEventLengthUse := False; //알람 이벤트 처리시 고정으로 처리함(STX/KT/기타)
    G_nAlarmEventLength := 10;

//    G_bDataBaseAutoBackup := TRUE;
    G_stDataBaseBackupTime := '0100';
    G_nDataBaseBackupCycle := 10;
    G_nDataBaseACEventdeleteDay := 360;
    G_nDataBasePTEventdeleteDay := 360;
    G_bAlarmMonitoringUse := False;
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
          end else if FindField('CO_CONFIGCODE').AsString = 'CONTROLPORT' then G_stDaemonControlPort := FindField('CO_CONFIGVALUE').asstring;
        end else if FindField('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then G_nCardNoType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CAPOSINUM' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bCardPositionUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'ACEVENT' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bExitButtonEventUse := False
            else G_bExitButtonEventUse := True;
          end
          else if FindField('CO_CONFIGCODE').AsString = 'LANGUAGE' then G_nFormLanguageType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'COMPANYCODELENGTH' then G_nCompanyCodeLength := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'BUILDINGCODELENGTH' then G_nBuildingCodeLength := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ATAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAttendDedicateDoorUse := True
            else G_bAttendDedicateDoorUse := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFoodDedicateDoorUse := True
            else G_bFoodDedicateDoorUse := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'ALARMMONITORING' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then G_bAlarmMonitoringUse := True;
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
          if FindField('CO_CONFIGCODE').AsString = 'BACKTIME' then  G_stDataBaseBackupTime := FindField('CO_CONFIGVALUE').AsString
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
          end else if FindField('CO_CONFIGCODE').AsString = 'ANTISTIME' then
          begin
            G_stGlobalAntiInitStartTime := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'ANTIETIME' then
          begin
            G_stGlobalAntiInitEndTime := FindField('CO_CONFIGVALUE').AsString;
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
  result := True;
end;

function TfmMain.LoadEmployeePermitChangeData: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stEmSeq : string;
begin
  StatusBar1.Panels.Items[0].Text := 'LoadEmployeePermitChangeData_' + formatdateTime('yyyymmddhhnnss',now) ;
  result := False;
  Try
    L_bEmployeePermitLoad := True;
    //모니터링에서 이 작업 까지 수행 하고 여기서는 TB_CARDPERMIT 을 읽자
    stSql := ' Select ';
    if G_nDBType = MSSQL then
        stSql := stSql + ' top 1 ';
    stSql := stSql + ' A.EM_SEQ from (select * from TB_CARDPERMITEMPLOYEECODE where CP_APPLY <> ''Y'') A ';
    stSql := stSql + ' Inner Join TB_EMPLOYEE B ';     //20160211 카드가 있는 경우에만 카드 권한 작업 하자.
    stSql := stSql + ' ON(A.EM_SEQ = B.EM_SEQ ';
    if G_nProgramType = 2 then stSql := stSql + ' AND (B.EM_FINGERUSE = ''1'' OR B.EM_CARDUSE = 1) ';   //SK에서만 체크하자
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join TB_CARD c ';
    stSql := stSql + ' ON(A.EM_SEQ = c.EM_SEQ )';  //카드 내역이 존재 하는 것만 옮기자.
    stSql := stSql + ' Inner Join TB_DEVICE d ';
    stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
    stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID  ';
    stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
    stSql := stSql + ' Where A.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    //stSql := stSql + ' AND A.CP_APPLY <> ''Y'' ';
    //stSql := stSql + ' AND A.EM_APPROVE = 1 ' ; //승인이 난 건에 한해서 권한을 가져 오자.
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
          StatusBar1.Panels.Items[0].Text := 'LoadEmployeePermitChangeDataStart:' + stEmSeq;
          if LoadEmployeePermitToCard(stEmSeq) then
          begin
//            if dmDBFunction.CheckTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N','','') < 1 then //미전송 데이터가 없으면
//               dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'Y','','');
          end;
          //dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(stEmSeq,'R','N','','');  //실패한 건이 있으면 재로딩 해야 된다.
          Application.ProcessMessages;
          Next;
        end;
        StatusBar1.Panels.Items[0].Text := 'LoadEmployeePermitChangeDataEnd:' + stEmSeq;
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
//  stSql := stSql + ' AND b.ND_DECODERNO = ' + inttostr(G_nDecoderNo) +
  stSql := stSql + ' )';
  stSql := stSql + ' Inner Join TB_DEVICE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = d.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = d.DE_ECUID  ';
  stSql := stSql + ' AND d.DE_DEVICEUSE = ''1'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND a.CP_APPLY = ''R'' ';
//  stSql := stSql + ' AND a.EM_APPROVE = 1 '; //승인이 난 건에 한해서
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

function TfmMain.LoadIniConfig: Boolean;
var
  ini_fun : TiniFile;
begin
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Config.INI');
    G_nServerStartNumber := ini_fun.ReadInteger('DECODER','STARTNO',1);
    G_nServerEndNumber := ini_fun.ReadInteger('DECODER','ENDNO',1);
    if ini_fun.ReadInteger('SERVER','DBBACKUP',1) = 1 then G_bDataBaseAutoBackup := True
    else G_bDataBaseAutoBackup := False;
    if ini_fun.ReadInteger('SERVER','CARDLOADING',1) = 1 then G_bCardPermitLoading := True
    else G_bCardPermitLoading := False;
    G_stDataBaseBackupDir := ini_fun.ReadString('SERVER','BACKUPDIR','c:\Backup');
    if ini_fun.ReadInteger('SERVER','RESTART',1) = 1 then G_bDaemonServerRestart := True
    else G_bDaemonServerRestart := False;
    if ini_fun.ReadInteger('SERVER','BACKUPFILECREATE',1) = 1 then G_bBackupFileCreate := True
    else G_bBackupFileCreate := False;

    L_stDeleteDir := ini_fun.ReadString('DELETE','DIR','');

  Finally
    ini_fun.Free;
  End;

end;

function TfmMain.LogDelete: Boolean;
var
	iFindResult: integer;
	srSchRec : TSearchRec;
  stDir : string;
begin
	result := False;

  stDir := G_stExeFolder + '\..\log';
	iFindResult := FindFirst(stDir + '\' + '*.*', faAnyFile - faDirectory, srSchRec);
	while iFindResult = 0 do
	begin
		if FileDateToDateTime( FileAge(stDir + '\' + srSchRec.Name) ) < now - 10 then
    begin
      DeleteFile(stDir + '\' + srSchRec.Name);
    end;
		iFindResult := FindNext(srSchRec);
	end;
  stDir := G_stExeFolder + '\log';
	iFindResult := FindFirst(stDir + '\' + '*.*', faAnyFile - faDirectory, srSchRec);
	while iFindResult = 0 do
	begin
		if FileDateToDateTime( FileAge(stDir + '\' + srSchRec.Name) ) < now - 10 then
    begin
      DeleteFile(stDir + '\' + srSchRec.Name);
    end;
		iFindResult := FindNext(srSchRec);
	end;

  if L_stDeleteDir <> '' then    //삭제 폴더 파일 삭제
  begin
    StatusBar1.Panels[0].Text := L_stDeleteDir + '-Delete';
    stDir := L_stDeleteDir;
    iFindResult := FindFirst(stDir + '\' + '*.*', faAnyFile - faDirectory, srSchRec);
    while iFindResult = 0 do
    begin
      if FileDateToDateTime( FileAge(stDir + '\' + srSchRec.Name) ) <= now - 1 then
      begin
        DeleteFile(stDir + '\' + srSchRec.Name);
      end;
      iFindResult := FindNext(srSchRec);
    end;

  end;
	result := True;

end;

procedure TfmMain.MemoryClearTimerTimer(Sender: TObject);
var
  hProcess:THandle;
begin
  inherited;
//워킹 셋 메모리 Clear;
  hProcess := OpenProcess(PROCESS_SET_QUOTA,false,GetCurrentProcessId);   //메모리 누수에 도움이 될까?
  try
    SetProcessWorkingSetSize(hProcess, $FFFFFFFF, $FFFFFFFF);
  finally
    CloseHandle(hProcess);
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

procedure TfmMain.PanelShow;
var
  nCount : integer;
  i : integer;
  oServerState : TServerState;
  oPanel : TPanel;
  oLabel : TLabel;
  oSpeedButton1 : TSpeedButton;
  oSpeedButton2 : TSpeedButton;
  oSpeedButton3 : TSpeedButton;
  stServerName : string;
  ini_fun : TiniFile;
begin
  if ServerStateList.count > 0 then
  begin
    for i := ServerStateList.count - 1 downto 0 do
      TServerState(ServerStateList.objects[i]).free;
  end;
  ServerStateList.Clear;
  nCount := G_nServerEndNumber - G_nServerStartNumber + 1;

  if G_nServerStartNumber = 0 then Exit;

  if nCount < 1 then Exit;

  if nCount > con_MaxCount then nCount := con_MaxCount;
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Config.INI');

    for i := 0 to nCount - 1 do
    begin
      oServerState := TServerState.Create(nil);
      oPanel := TravelPanelItem_FlowPanel(FlowPanel1,'pan_state' , i + 1);
      oPanel.Visible := True;
      oLabel := TravelLabelItem(oPanel,'lb_DeviceState',oPanel.Tag);
      stServerName := 'DeviceServer  ' + inttostr(G_nServerStartNumber + i);
      stServerName := ini_fun.ReadString('NAME',inttostr(G_nServerStartNumber + i),stServerName);
      oLabel.Caption := stServerName + ' 상태';
      oSpeedButton1 := TravelSpeedButtonItem(oPanel,'btn_Start',oPanel.Tag);
      oSpeedButton1.Tag := G_nServerStartNumber + i;
      oSpeedButton2 := TravelSpeedButtonItem(oPanel,'btn_Stop',oPanel.Tag);
      oSpeedButton2.Tag := G_nServerStartNumber + i;
      oSpeedButton3 := TravelSpeedButtonItem(oPanel,'btn_ServerShow',oPanel.Tag);
      oSpeedButton3.Tag := G_nServerStartNumber + i;
      oServerState.ServerPanel := oPanel;
      oServerState.DecoderNumber := G_nServerStartNumber + i;
      ServerStateList.AddObject(inttostr(G_nServerStartNumber + i),oServerState);
    end;
  Finally
    ini_fun.Free;
  End;


end;

function TfmMain.ProcessAllStopCheck: Boolean;
var
  i : integer;
begin
  result := True;
  if ServerStateList.Count < 1 then
  begin
    Exit;
  end;
  for i := 0 to ServerStateList.Count - 1 do
  begin
    if TServerState(ServerStateList.Objects[i]).DeviceServerManagerStart then
    begin
      result := False;
      Exit;
    end;
  end;
end;

procedure TfmMain.ProgramAllStart;
var
  nCount : integer;
  i : integer;
begin
  AFServerProcessStart;
  CardServerProcessStart;
  FingerServerProcessStart;
  if G_nServerStartNumber = 0 then Exit;

  nCount := G_nServerEndNumber - G_nServerStartNumber + 1;
  ETCServerCheckTimer.Enabled := True;

  if nCount < 1 then Exit;

  if nCount > con_MaxCount then nCount := con_MaxCount;
  for i := 0 to ServerStateList.Count - 1 do
  begin
    TServerState(ServerStateList.Objects[i]).Start := True;
    while Not TServerState(ServerStateList.Objects[i]).DeviceServerManagerStart do
    begin
      if G_bApplicationTerminate then Exit;

      Delay(10);
      Application.ProcessMessages;
    end;
    Delay(3000);
  end;
end;

procedure TfmMain.ProgramAllStop;
var
  nCount : integer;
  i : integer;
begin
  AFServerProcessStop;
  CardServerProcessStop;
  FingerServerProcessStop;
  ETCServerCheckTimer.Enabled := False;

  nCount := G_nServerEndNumber - G_nServerStartNumber + 1;

  if nCount < 1 then Exit;

  if nCount > con_MaxCount then nCount := con_MaxCount;
  for i := 0 to ServerStateList.Count - 1 do
  begin
    TServerState(ServerStateList.Objects[i]).Start := False;
  end;
  while Not ProcessAllStopCheck do
  begin
    if G_bApplicationTerminate then Exit;
    sleep(100);
    Application.ProcessMessages;
  end;

end;

procedure TfmMain.ProgramAllUpdate;
var
  i : integer;
  ini_fun : TiniFile;
begin
  if ServerStateList.Count < 1 then Exit;
  for i := 0 to ServerStateList.Count - 1 do
  begin
    if not DirectoryExists(G_stExeFolder + '\' + ServerStateList.Strings[i]) then
    begin
     if Not CreateDir(G_stExeFolder + '\' + ServerStateList.Strings[i]) then
     begin
     end;
    end;
    if CopyFile(pchar(G_stExeFolder + '\GMS_DeviceServer.exe'), pchar(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\GMS_DeviceServer' + ServerStateList.Strings[i] + '.exe' ), False) then
    begin

    end;
    if CopyFile(pchar(G_stExeFolder + '\GMS_DeviceServerManager.exe'), pchar(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\GMS_DeviceServerManager' + ServerStateList.Strings[i] + '.exe' ), False) then
    begin

    end;
    if CopyFile(pchar(G_stExeFolder + '\MyExec.exe'), pchar(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\MyExec.exe' ), False) then
    begin

    end;
    if CopyFile(pchar(G_stExeFolder + '\Config.ini'), pchar(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\Config.ini' ), False) then
    begin
      Try
        ini_fun := TiniFile.Create(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\Config.ini');
        ini_fun.WriteInteger('DECODER','NO',strtoint(ServerStateList.Strings[i]));
      Finally
        ini_fun.Free;
      End;

    end;
    if CopyFile(pchar(G_stExeFolder + '\MIAMS.INI'), pchar(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\MIAMS.INI' ), False) then
    begin

    end;

  end;

end;


procedure TfmMain.SetDate(const Value: string);
begin
  if FDate = Value then Exit;

  FDate := Value;
  if G_bDaemonServerRestart then btn_ServerRestartClick(btn_ServerRestart);
end;

procedure TfmMain.trayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  Show();
  WindowState := wsNormal;
  Application.BringToFront();

end;

procedure TfmMain.trayTimerTimer(Sender: TObject);
var
  nCount : integer;
begin
  if G_bApplicationTerminate then Exit;
  if Not L_bFormActive then Exit;

  TrayTimer.Enabled := False;
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;

  nCount := G_nServerEndNumber - G_nServerStartNumber + 1;

  if nCount < 1 then Exit;

  L_bProgramAllStop := False;

  ProgramAllStop;
  ProgramAllUpdate;
  Date := FormatDateTime('yyyymmdd',now);
  if Not G_bDaemonServerRestart then
  begin
    btn_ServerRestartClick(btn_ServerRestart);
  end;
(*  while Not L_bProgramAllStop do
  begin
    if L_bApplicationTerminate then Exit;
    sleep(1);
    Application.ProcessMessages;
  end;
*)
  //btn_PGUpdateClick(btn_PGUpdate);
  //btn_ServerRestartClick(btn_PGUpdate);
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

{ TServerState }

constructor TServerState.Create(AOwner: TComponent);
begin
  inherited;
  DeviceServerCheckTimer := TTimer.Create(nil);
  DeviceServerCheckTimer.Interval := 1000;
  DeviceServerCheckTimer.OnTimer := DeviceServerCheckTimerTimer;
  DeviceServerCheckTimer.Enabled := True;

  DeviceServerManagerCheckTimer := TTimer.Create(nil);
  DeviceServerManagerCheckTimer.Interval := 1000;
  DeviceServerManagerCheckTimer.OnTimer := DeviceServerManagerCheckTimerTimer;
  DeviceServerManagerCheckTimer.Enabled := True;

end;

destructor TServerState.Destroy;
begin
  DeviceServerCheckTimer.Enabled := False;
  DeviceServerManagerCheckTimer.Enabled := False;
  inherited;
end;

procedure TServerState.DeviceServerCheckTimerTimer(Sender: TObject);
begin
  if DeviceServerCheck(DecoderNumber) <> Start then
  begin
    if Start then DeviceServerProcessStart(DecoderNumber)
    else DeviceServerProcessStop(DecoderNumber);
  end;
end;

procedure TServerState.DeviceServerManagerCheckTimerTimer(Sender: TObject);
begin
  DeviceServerManagerStart := DeviceServerManagerCheck(DecoderNumber);
end;

procedure TServerState.SetDeviceServerManagerStart(const Value: Boolean);
var
  oLabel : TLabel;
  oSpeedButton1 : TSpeedButton;
  oSpeedButton2 : TSpeedButton;
  oSpeedButton3 : TSpeedButton;
  oPanel : TPanel;
begin
  if FDeviceServerManagerStart = Value  then Exit;

  FDeviceServerManagerStart := Value;
  oSpeedButton1 := TravelSpeedButtonItem(ServerPanel,'btn_Start',DecoderNumber - G_nServerStartNumber + 1);
  oSpeedButton2 := TravelSpeedButtonItem(ServerPanel,'btn_Stop',DecoderNumber - G_nServerStartNumber + 1);
  oSpeedButton3 := TravelSpeedButtonItem(ServerPanel,'btn_ServerShow',DecoderNumber - G_nServerStartNumber + 1);
  oPanel := TravelPanelItem_Panel(ServerPanel,'pan_DeviceState',DecoderNumber - G_nServerStartNumber + 1);

  if Value then
  begin
    oPanel.Caption := '기동중';
    oPanel.Color := clLime;
    oSpeedButton1.Enabled := False;
    oSpeedButton2.Enabled := True;
    oSpeedButton3.Enabled := True;
  end else
  begin
    oPanel.Caption := '정지';
    oPanel.Color := clRed;
    oSpeedButton1.Enabled := True;
    oSpeedButton2.Enabled := False;
    oSpeedButton3.Enabled := False;
  end;
end;

procedure TServerState.SetDeviceServerStart(const Value: Boolean);
begin
  FDeviceServerStart := Value;
end;

procedure TServerState.SetStart(const Value: Boolean);
begin
  FStart := Value;
  if Not Value then
  begin
    DeviceServerManagerProcessStop(DecoderNumber);
    DeviceServerProcessStop(DecoderNumber);
  end
  else
  begin
    //DeviceServerManagerProcessStart(DecoderNumber);
    DeviceServerProcessStart(DecoderNumber);
  end;
end;

end.
