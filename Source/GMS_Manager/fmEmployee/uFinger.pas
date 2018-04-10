unit uFinger;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,Winapi.ShellAPI;

type
  TfmFinger = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FAppWnd: DWORD;
    { Private declarations }
  public
    { Public declarations }
    property AppWnd : DWORD read FAppWnd write FAppWnd;
  end;

var
  fmFinger: TfmFinger;

implementation

uses
  uCommonFunction,
  uCommonVariable;

{$R *.dfm}

procedure TfmFinger.FormActivate(Sender: TObject);
begin
  Timer1.Enabled := True;

end;

procedure TfmFinger.Timer1Timer(Sender: TObject);
var
  exInfo : TShellExecuteInfo;
  Ph : DWORD;
  RetryCount : integer;
  ProcessList : TStringList;
  i : integer;
  HInstance : LongInt;
begin
  Timer1.Enabled := False;
  FillChar( exInfo, Sizeof(exInfo), 0 );

  with exInfo do
  begin
    cbSize:= Sizeof( exInfo );
    //fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Handle;
    ExInfo.lpVerb := 'runas';
    ExInfo.lpParameters := PChar('');
    lpFile:= PChar(G_stExeFolder + '\frmFPControl.exe');
    nShow := SW_SHOW;
  end;
  if ShellExecuteEx(@exInfo)then
  begin
    Ph := exInfo.HProcess;
  end;
  Try
    ProcessList := TStringList.Create;
    FAppWnd := 0;
    repeat
      ProcessList.Clear;
      Process32List(ProcessList);
      for i := ProcessList.Count - 1 downto 0 do
      begin
        if ProcessList.Strings[i] = ExtractFileName('frmFPControl.exe') then  //���� �ǰ� ������
        begin
          FAppWnd := DWORD(ProcessList.Objects[i]);
          break;
        end;
      end;
    until (FAppWnd <> 0) or (RetryCount > 10);
  Finally
    ProcessList.Clear;
    ProcessList.Free;
  End;

  //HInstance := ShellExecute(Self.Handle,'runas',PChar(G_stExeFolder + '\frmFPControl.exe'),nil,nil,SW_ShowNormal);// ShellExecuteEx(@exInfo);
(*  if ShellExecuteEx(@exInfo) then
  begin
    Ph := exInfo.HProcess;

    // ���� �� �ٷ� ã�� �� ���� ������ �ڵ� ã�� ��õ�
    RetryCount := 0;
    repeat
      GetWindowThreadProcessId(Ph, @FAppWnd);
      //FAppWnd := GetWinHandle(HInstance);//GetWindowFromProcessID(Ph);
      Sleep(100);
      Inc(RetryCount);
    until (FAppWnd <> 0) or (RetryCount > 10);
  end
  else
  begin
    exit;
  end;
*)
    FAppWnd := GetWinHandle(FAppWnd);
// �θ���, �׵θ�����, �ִ�ȭ
    if FAppWnd <> 0 then
    begin
      SetWindowPos(FAppWnd,HWND_TOPMOST,0,0,500,500,SWP_SHOWWINDOW);
//      SetWindowPos(FAppWnd,HWND_TOPMOST,Left,Top,Width,Height,SWP_SHOWWINDOW);
(*      WinAPI.Windows.SetParent(FAppWnd, exInfo.Wnd);
      SetWindowLong(FAppWnd, GWL_STYLE,
              GetWindowLong(Handle, GWL_STYLE)
// ���� ��Ÿ�Ͽ���
          and not WS_BORDER
// ũ������ �׵θ� - ����
          and not WS_THICKFRAME
// �β��� ������ - ����
          and not WS_DLGFRAME
// ���� �׵θ� - ����
      );
      ShowWindow(FAppWnd, SW_SHOWMAXIMIZED);
*)
    end;

  //SetWindowPos(FAppWnd, 0, 0, 0, Panel1.Width, Panel1.Height, SWP_ASYNCWINDOWPOS)

  while WaitForSingleObject(ExInfo.hProcess, 50) <> WAIT_OBJECT_0 do
    Application.ProcessMessages;
  CloseHandle(Ph);
  Close;


end;

end.