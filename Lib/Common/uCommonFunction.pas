unit uCommonFunction;

interface
uses
  System.SysUtils,Winapi.Windows,Vcl.Forms,Vcl.ComCtrls,System.Classes,
  System.iniFiles,Winapi.WinSock,Winapi.Nb30,Winapi.Messages,JclMime,ShellApi,
  TlHelp32,IPHlpApi,IpTypes,DateUtils,System.RegularExpressions;
type
 TNBLanaResources = (lrAlloc, lrFree);

type
 PMACAddress = ^TMACAddress;
 TMACAddress = array[0..5] of Byte;
type
  TPIDandHWND = record
    pID: DWORD;
    hWindow: THandle;
  end;
const
  HexString : String = '0123456789ABCDEF';
  Alpha = ['A'..'Z', 'a'..'z'];
  AlphaNumeric = Alpha + ['0'..'9'];

function LogSave(aFileName,ast:string):Boolean;

function ApplicationBuildInfo: String;

function AnsiToWide(const aAnsiBuf: PAnsiChar; aAnsiLen: Integer; aCodePage: UINT): WideString;
function Ascii2Bytes(aData:string;aLen:integer;Var aBytes:TBytes):Boolean;
function Ascii2Hex(aData:string;bReverse:Boolean = False;bConvert:Boolean=False;aConvertDec:integer=30):string;
function AsciiLen2Hex(aBuf:PAnsiChar;aDataLen:integer):string;
function BinaryToHex(Binary:string):string;
Function BinToHexStr(aData:string):string;
Function BinToInt(Value : String) : Integer;
Function ByteCopy(p:pAnsiChar;n:cardinal):RawByteString;
Function BytesToAscii(aBytes:TBytes;aLen:integer=0):string;

//인증키값을 비교하자
Function CompareKey(aSaupId,aKey:string):Boolean;
Function CompareKey2(aSaupId,aKey:string):Boolean;
Function CompareKey3(aSaupId,aKey:string):Boolean;
Function CompareKey4(aSaupId,aKey:string;aSeq:integer=0):Boolean;

function Dec2Hex(N: int64; A: Byte): string;
function DecodeCardNo(aCardNo: string;aLength : integer = 8;bHex:Boolean = False): String;
function Delay(MSecs: Longint):Boolean;
function EncodeCardNo(aCardNo: string;bHex : Boolean = True): String;
function EnumWindowsProc(hWindow: HWND; var lParam: TPIDandHWND): Bool; stdcall;
function ExecFileAndWait(const aCmdLine: String; Hidden, doWait: Boolean): Boolean;
function ExecuteDOSCommand(cmdline:String; hidden: Boolean): integer;
function ExecuteShellCommand(cmdline:String; bWait: Boolean = True): integer;
Function FindCharCopy(SourceStr : String; Index : integer; aChar:Char) : String;
Function FileAppend(aFileName,ast:string;aDirCheck:Boolean=True):Boolean;
Function FileTimeToDateTime(FileTime:TFileTime):TDateTime;
function FillCharString(aNo:String;aChar:char; aLength:Integer;bFront:Boolean = False): string;
function FillZeroNumber(aNo:Int64; aLength:Integer): string;
function FillZeroStrNum(aNo:String; aLength:Integer;bFront:Boolean = True): string;
//인증키를 가져오자
Function GetAuthKey(aGubun:string;aSeq:integer=0) : string;
Function GetBuildInfo(var V1, V2, V3, V4: Word):Boolean;
//고객사 ID를 가져오자
Function GetCustomerId(aGubun:string;aSeq:integer=0) : string;
Function GetInstallDate(aGubun:string):string;
Function GetIpFromDomain(aDomain:string):string;
function GetLocalIPAddr : string;
function GetMacAddress: string;
function GetMacAddressXe2(LanaNum: Byte; MACAddress: PMACAddress): Byte;
function GetMacAddress3(aSeq:integer=0): string;
function GetMacFromIP(IP:string):string;
function GetNodeByText(ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
function GetWinHandle(dwProcessID:DWORD):THandle;
function GetWindowFromProcessID(pID: DWORD): HWND;

function Hex2Ascii(St: String;bConvert:Boolean=False;aConvertDec:integer=30): String;
function Hex2Binary(Hexadecimal: string): string;
function Hex2Dec(const S: string): Longint;
function Hex2Dec64(const S: string): int64;
Function Hex2DecStr(S:String):String;
function Hex2ViewData(St: String):String;
function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,MSecs: Integer): TDateTime;
function IntToBin(Value: Longint; Digits:Integer): string;
function IsAlphaNumeric(st:string):Boolean;
function IsDate(aDate:string):Boolean;
function Isdigit(st: string):Boolean;
function IsHangul(st:string):Boolean;
function IsIPTypeCheck(ip: string): Boolean;
Function MakeDatetimeStr(aTime: String;aTimeForamt:Boolean=True):String;
Function MakePhoneNumber(aNumber:string):string;
Function MakeTimeStr(aTime: String):String;
Function MakeWorkTime_Minute(aEndTime,aStartTime:string;aCheck:integer):integer;
Function MinuteToString(aMinute:integer):string;
function MyF_UsingWinNT: Boolean;
Function MyProcessMessage:Boolean;
Function MyRunDosCommand(Command : string;  nShow : Boolean = False; bWait:Boolean = True):Boolean;
function pCopy(p:pAnsiChar;n:cardinal):ansiString;
function ProcIDFromWnd( ahwnd : HWND):int64;  // 윈도우 핸들로 프로세스 아이디 얻기
procedure Process32List(Slist: TStringList);
function ResetLana(LanaNum, ReqSessions, ReqNames: Byte;LanaRes: TNBLanaResources): Byte;
function SetSpacelength(st : String; aLength : Integer) : String;
function ShellExecute_AndWait(FileName:String;Params:String):Boolean;
Function StringToBin(aData:string):string;
function ToHexStrNoSpace(st:string):String;
function WideToAnsi(const aWideBuf: PWideChar; aWideLen: Integer; aCodePage: UINT): String;
function WinExecAndWait32(Path: PChar; Visibility: Word): integer;
function WindowFromProcessID(pID: DWORD): HWND;

implementation
function SendARP(Destip,scrip:DWORD;pmacaddr:PDWORD;VAR phyAddrlen:DWORD):DWORD; stdcall; external 'iphlpapi.dll';

var regex: String = '.*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*';


function LogSave(aFileName,ast:string):Boolean;
Var
  f: TextFile;
  st: string;
  stDir : string;
begin
  result := False;
  Try
    {$I-}
    stDir := ExtractFilePath(aFileName);
    if not DirectoryExists(stDir) then CreateDir(stDir);

    AssignFile(f, aFileName);
    Append(f);
    if IOResult <> 0 then Rewrite(f);
    st := FormatDateTIme('yyyy-mm-dd hh:nn:ss:zzz">"',Now) + ' ' + ast;
    WriteLn(f,st);
    System.Close(f);
    result := True;
    {$I+}
  Except
    Exit;
  End;
end;

function ApplicationBuildInfo: String;
var
  V1, V2, V3, V4: Word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' +
            IntToStr(V2) + '.' +
            IntToStr(V3) + '.' +
            IntToStr(V4);
end;

// 안시 문자열을 유니코드로...
function AnsiToWide(const aAnsiBuf: PAnsiChar; aAnsiLen: Integer; aCodePage: UINT): WideString;
var
  Str: String;
  WideStrLen: Integer;
begin
  WideStrLen :=
    MultiByteToWideChar(
      aCodePage,
      MB_PRECOMPOSED,
      aAnsiBuf,
      aAnsiLen,
      nil,
      0
    );

  SetLength(Result, WideStrLen);

  MultiByteToWideChar(
    aCodePage,
    MB_PRECOMPOSED,
    aAnsiBuf,
    aAnsiLen,
    PWideChar(Result),
    WideStrLen
  );
end;

//XE2에서는 데이터 전송시 Bytes 형으로 전송 해야만 0x80 이후 데이터가 손실이 없다.
function Ascii2Bytes(aData:string;aLen:integer;Var aBytes:TBytes):Boolean;
var
  i : integer;
begin
  if aLen = 0 then aLen := Length(aData);
  SetLength(aBytes, aLen);
  for i := 1 to aLen do
  begin
    aBytes[i-1] := ord(aData[i]);
  end;
    {
    aData := Ascii2Hex(aData);
    for i := 1 to (Length(aData) div 2) do
    begin
      aBytes[i-1] := Hex2Dec(copy(aData,(i*2)-1,2));
    end;   }
    result := True;
end;

function Ascii2Hex(aData:string;bReverse:Boolean = False;bConvert:Boolean=False;aConvertDec:integer=30):string;
var
  i : integer;
  stHex : string;
  nOrd : integer;
begin
  stHex := '';
  for i:= 1 to Length(aData) do
  begin
    nOrd := Ord(aData[i]);
    if bConvert then
    begin
      if nOrd = aConvertDec then nOrd := 0;
    end;
    if Not bReverse then stHex := stHex + Dec2Hex(nOrd,2)
    else stHex := Dec2Hex(nOrd,2) + stHex;
  end;
  result := stHex;
end;

function AsciiLen2Hex(aBuf:PAnsiChar;aDataLen:integer):string;
var
  i : integer;
  stHex : string;
  nOrd : integer;
begin
  stHex := '';
  for i:= 0 to aDataLen - 1 do
  begin
    nOrd := Ord(aBuf[i]);
    stHex := stHex + Dec2Hex(nOrd,2) ;
  end;
  result := stHex;
end;

function BinaryToHex(Binary:string):string;
  function Bit2Dec(aBit:string):integer;
  begin
    result := 0;
    if Length(aBit) <> 4 then Exit;
    result := strtoint(aBit[1]) * 8 +
              strtoint(aBit[2]) * 4 +
              strtoint(aBit[3]) * 2 +
              strtoint(aBit[4]) * 1;
  end;
var
  nReminder : integer;
  i : integer;
  nDiv : integer;
  nDec : integer;
begin
  result := '';
  nReminder := length(Binary) mod 4;
  if nReminder <> 0 then
  begin
    for i := nReminder to 3 do
    begin
      Binary := '0' + Binary;
    end;
  end;
  nDiv := length(Binary) div 4;
  if length(Binary) = 0 then Exit;
  for i := 1 to nDiv do
  begin
    nDec := Bit2Dec(copy(Binary,(i - 1) * 4 + 1,4));
    result := result + Dec2Hex(nDec,1);
  end;
end;

Function BinToHexStr(aData:string):string;
var
  stTemp : string;
  nTemp : integer;
  i : integer;
  stResult : string;
begin
  if (Length(aData) mod 4) <> 0 then Exit;

  stResult := '';
  for i:= 0 to (Length(aData) div 4) -1 do
  begin
    stTemp := copy(aData,(i * 4) + 1,4);
    nTemp := BinToInt(stTemp);
    stResult := stResult + Dec2Hex(nTemp,1);
  end;
  result := stResult;
end;

Function BinToInt(Value : String) : Integer;
var
  i   : Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result shl 1;
    Result := Result + Integer((Value[i] = '1'));
  end;
end;

Function ByteCopy(p:pAnsiChar;n:cardinal):RawByteString;
var
  rP:pAnsiChar;
begin
  setLength(result,n);
  rP:=pAnsiChar(result);
  while n <> 0 do
  begin
    rP^:=p^;
    inc(rP);
    inc(p);
    dec(n);
  end;
end;

Function BytesToAscii(aBytes:TBytes;aLen:integer=0):string;
var
  stTemp : string;
  i : integer;
begin
  stTemp := '';
  if aLen = 0 then aLen := High(aBytes);
  for i := 0 to aLen do
  begin
    stTemp := stTemp + char(aBytes[i]);
  end;
  result := stTemp;
end;

//인증키값을 비교하자
Function CompareKey(aSaupId,aKey:string):Boolean;
var
  nSaupID : integer;
  stMac : string;
  nMac : integer;
  stTemp :string;
  i : integer;
  stKey : string;
//  MACAddress: PMACAddress;
//  RetCode: Byte;
begin
  result := False;
  nSaupId := 0;
  for i:=1 to Length(aSaupId) do
  begin
    nSaupId := nSaupId + Ord(aSaupId[i]);
  end;
  stMac := UpperCase(GetMacAddress);
  nMac := 0;
  for i:=1 to Length(stMac) do
  begin
    nMac := nMac + Ord(stMac[i]);
  end;
  nSaupId := nSaupId + nMac;
  stTemp := inttostr(nSaupId);
  stTemp := StringToBin(stTemp);
  stTemp := FillZeroStrNum(stTemp,40);
  stTemp := copy(stTemp,21,Length(stTemp)-20) +copy(stTemp,11,10) + copy(stTemp,1,10);
  stTemp := copy(stTemp,16,Length(stTemp)-15) + copy(stTemp,1,15);
  stTemp := copy(stTemp,30,Length(stTemp)-29) +copy(stTemp,16,14) + copy(stTemp,1,15);

  stTemp := BinToHexStr(stTemp);
  stKey := copy(stTemp,1,3) + '-' + copy(stTemp,4,4) + '-' + copy(stTemp,8,3);

  if stKey = aKey then Result := True;
end;

Function CompareKey2(aSaupId,aKey:string):Boolean;
var
  nSaupID : integer;
  stMac : string;
  nMac : integer;
  stTemp :string;
  i : integer;
  stKey : string;
begin
  result := False;
  nSaupId := 0;
  for i:=1 to Length(aSaupId) do
  begin
    nSaupId := nSaupId + Ord(aSaupId[i]);
  end;
  stMac := UpperCase(GetMacFromIP(GetLocalIPAddr));
  nMac := 0;
  for i:=1 to Length(stMac) do
  begin
    nMac := nMac + Ord(stMac[i]);
  end;
  nSaupId := nSaupId + nMac;
  stTemp := inttostr(nSaupId);
  stTemp := StringToBin(stTemp);
  stTemp := FillZeroStrNum(stTemp,40);
  stTemp := copy(stTemp,21,Length(stTemp)-20) +copy(stTemp,11,10) + copy(stTemp,1,10);
  stTemp := copy(stTemp,16,Length(stTemp)-15) + copy(stTemp,1,15);
  stTemp := copy(stTemp,30,Length(stTemp)-29) +copy(stTemp,16,14) + copy(stTemp,1,15);

  stTemp := BinToHexStr(stTemp);
  stKey := copy(stTemp,1,3) + '-' + copy(stTemp,4,4) + '-' + copy(stTemp,8,3);

  if stKey = aKey then Result := True;
end;

Function CompareKey3(aSaupId,aKey:string):Boolean;
var
  nSaupID : integer;
  stMac : string;
  nMac : integer;
  stTemp :string;
  i : integer;
  stKey : string;
  MACAddress: PMACAddress;
  RetCode: Byte;
begin
  result := False;
  nSaupId := 0;
  for i:=1 to Length(aSaupId) do
  begin
    nSaupId := nSaupId + Ord(aSaupId[i]);
  end;
  RetCode := ResetLana(0, 0, 0, lrAlloc);

  New(MACAddress);
  try
    RetCode := GetMACAddressXe2(0, MACAddress);
    if RetCode = NRC_GOODRET then
    begin
      stMac := Format('%2.2x%2.2x%2.2x%2.2x%2.2x%2.2x',
        [MACAddress[0], MACAddress[1], MACAddress[2],
         MACAddress[3], MACAddress[4], MACAddress[5]]);
    end else
    begin
      stMac := '';
    end;
  finally
    Dispose(MACAddress);
  end;


  //stMac := UpperCase(GetMacFromIP(GetLocalIPAddr));
  nMac := 0;
  for i:=1 to Length(stMac) do
  begin
    nMac := nMac + Ord(stMac[i]);
  end;
  nSaupId := nSaupId + nMac;
  stTemp := inttostr(nSaupId);
  stTemp := StringToBin(stTemp);
  stTemp := FillZeroStrNum(stTemp,40);
  stTemp := copy(stTemp,21,Length(stTemp)-20) +copy(stTemp,11,10) + copy(stTemp,1,10);
  stTemp := copy(stTemp,16,Length(stTemp)-15) + copy(stTemp,1,15);
  stTemp := copy(stTemp,30,Length(stTemp)-29) +copy(stTemp,16,14) + copy(stTemp,1,15);

  stTemp := BinToHexStr(stTemp);
  stKey := copy(stTemp,1,3) + '-' + copy(stTemp,4,4) + '-' + copy(stTemp,8,3);

  if stKey = aKey then Result := True;
end;


Function CompareKey4(aSaupId,aKey:string;aSeq:integer=0):Boolean;
var
  nSaupID : integer;
  stMac : string;
  nMac : integer;
  stTemp :string;
  i : integer;
  stKey : string;
begin
  result := False;
  nSaupId := 0;
  for i:=1 to Length(aSaupId) do
  begin
    nSaupId := nSaupId + Ord(aSaupId[i]);
  end;
  stMac := UpperCase(GetMacAddress3(aSeq));
  nMac := 0;
  for i:=1 to Length(stMac) do
  begin
    nMac := nMac + Ord(stMac[i]);
  end;
  nSaupId := nSaupId + nMac;
  stTemp := inttostr(nSaupId);
  stTemp := StringToBin(stTemp);
  stTemp := FillZeroStrNum(stTemp,40);
  stTemp := copy(stTemp,21,Length(stTemp)-20) +copy(stTemp,11,10) + copy(stTemp,1,10);
  stTemp := copy(stTemp,16,Length(stTemp)-15) + copy(stTemp,1,15);
  stTemp := copy(stTemp,30,Length(stTemp)-29) +copy(stTemp,16,14) + copy(stTemp,1,15);

  stTemp := BinToHexStr(stTemp);
  stKey := copy(stTemp,1,3) + '-' + copy(stTemp,4,4) + '-' + copy(stTemp,8,3);

  if stKey = aKey then Result := True;
end;

function Dec2Hex(N: int64; A: Byte): string;
begin
  Result := IntToHex(N, A);
end;

function DecodeCardNo(aCardNo: string;aLength : integer = 8;bHex:Boolean = False): String;
var
  I: Integer;
  st: string;
  bCardNo: int64;
  nOrd1,nOrd2 : integer;
  asCardNo : AnsiString;
  stTemp : string;
begin
  asCardNo := AnsiString(aCardNo);
  st := '';
  for I := 1 to aLength do
  begin

    if (I mod 2) <> 0 then
    begin
      nOrd1 := ord(asCardNo[I]);
      asCardNo[I] := AnsiChar((Ord(asCardNo[I]) shl 4));
      nOrd1 := ord(asCardNo[I]);
    end else
    begin
      asCardNo[I] := AnsiChar(Ord(asCardNo[I]) - $30); //상위니블을 0으로 만든다.
      //st:= st + char(ord(aCardNo[I-1]) +ord(aCardNo[I]));
      nOrd1 := ord(asCardNo[I-1]);
      nOrd2 := ord(asCardNo[I]);
      //st:= st + Ansichar(nOrd1 + nOrd2);  //93 -> 3F 로 변경 됨
      st:= st + dec2Hex(nOrd1 + nOrd2,2);
    end;
    //aCardNo[I] := Char(Ord(aCardNo[I]) - $30);
    //st := st + aCardNo[I];
  end;


//  st:= tohexstrNospace(st);


  if Not bHex then  //숫자 변환이면
  begin
    bCardNo:= Hex2Dec64(st);
    st:= FillZeroNumber(bCardNo,10);
  end;
  //SHowMessage(st);
  Result:= st;

end;

function Delay(MSecs: Longint):Boolean;
var
  Tick: DWORD;
  Event: THandle;
begin
  result := False;
  Event := CreateEvent(nil, False, False, nil);
  try
    Tick := GetTickCount + DWORD(MSecs);
    while (MSecs > 0) and
      (MsgWaitForMultipleObjects(1, Event, False, MSecs,
      QS_ALLINPUT) <> WAIT_TIMEOUT) do
    begin
      sleep(1);
      MyProcessMessage;
      Try
      //Application.ProcessMessages;
        MSecs := Tick - GetTickCount;
      Except
        Exit;
      End;
    end;
  finally
    CloseHandle(Event);
  end;
  result := True;
end;

function EncodeCardNo(aCardNo: string;bHex : Boolean = True): String;
var
  I: Integer;
  xCardNo: String;
  st: AnsiString;
begin
  result := '';
  Try
    if Not bHex then aCardNo:= Dec2Hex(StrtoInt64(aCardNo),8);
    xCardNo:= Hex2Ascii(aCardNo);
    for I:= 1 to 4 do
    begin
      st := st + AnsiChar((Ord(xCardNo[I]) shr 4) + $30) + AnsiChar((Ord(xCardNo[I]) and $F) + $30);
    end;
    Result:= String(st);
  Except
    Exit;
  End;
end;

function EnumWindowsProc(hWindow: HWND; var lParam: TPIDandHWND): Bool; stdcall;
var
  pID: DWORD;
  sCaption : string;
begin
  GetWindowThreadProcessID(hWindow, @pID);
  //sCaption := GetWindowText(hWindow);
  if lParam.pID = pID Then
  begin
    lParam.hWindow := hWindow;
    Result := False;
  end else result := true;
end;

function ExecFileAndWait(const aCmdLine: String; Hidden, doWait: Boolean): Boolean;
var
StartupInfo : TStartupInfo;
ProcessInfo : TProcessInformation;
begin
{setup the startup information for the application }
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do
  begin
    cb:= SizeOf(TStartupInfo);
    dwFlags:= STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    if Hidden
    then wShowWindow:= SW_HIDE
    else wShowWindow:= SW_SHOWNORMAL;
  end;

  Result := CreateProcess(nil,PChar(aCmdLine), nil, nil, False,
  NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
  if doWait then
  if Result then
  begin
  WaitForInputIdle(ProcessInfo.hProcess, INFINITE);
  WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
  end;
end;

function ExecuteDOSCommand(cmdline:String; hidden: Boolean): integer;
const
  flags: array [Boolean] of Integer = (SW_SHOWNORMAL, SW_HIDE);
var
  cmdbuffer: array [0..MAX_PATH] of Char;
  cmd: String;
begin
  // Windows 95/98의 환경변수 COMSPEC는 command.com 입니다
  GetEnvironmentVariable('COMSPEC', cmdBUffer, Sizeof(cmdBuffer));
  // command.com의 /C 파라미터는 명령 실행 후 되돌아 가라는 옵션입니다
  cmd := cmdbuffer + ' /C ' + cmdline;
  // 실행이 종료될때까지 대기
  Result := WinExecAndWait32(PChar(cmd), flags[hidden]); // SW_HIDE 로 실행
end;

function ExecuteShellCommand(cmdline:String; bWait: Boolean = True): integer;
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
  ExecuteFile, ParamString, StartInString: string;
begin
  ExecuteFile := 'notepad.exe'; // 실행할 프로그램
  ParamString := 'c:\winzip.log'; // 프로그램의 명령행 파라미터
  StartInString := 'c:\'; // 시작 위치
  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TShellExecuteInfo);

with SEInfo do
begin
  fMask := SEE_MASK_NOCLOSEPROCESS;
  Wnd := Application.Handle;
  lpFile := PChar(ExecuteFile);
  lpParameters := PChar(ParamString);
  lpDirectory := PChar(StartInString);
  nShow := SW_SHOWNORMAL;
end;
if ShellExecuteEx(@SEInfo) then
begin
repeat
  Application.ProcessMessages;
  GetExitCodeProcess(SEInfo.hProcess, ExitCode);
until (ExitCode <> STILL_ACTIVE) or Application.Terminated;
  Exit;
end
else Exit;
end;

Function FindCharCopy(SourceStr : String; Index : integer; aChar:Char) : String;
Var
  a, b : Integer;
  st   : String;
begin
  a := 0;
  b := 1;
  st := '';
  if (Length(SourceStr) < 1) then begin result:= ''; exit;  end;
  for b:=1 to Length(SourceStr) do
  begin
    if a = index then break;
    if SourceStr[b] = aChar then Inc(a);
  end;
  if (a = Index) then
  begin
    while (b <= Length(SourceStr)) and (SourceStr[b] <> aChar) do
    begin
      st := st + SourceStr[b];
      Inc(b);
    end;
  end;
  Result := st;
end;

Function FileAppend(aFileName,ast:string;aDirCheck:Boolean=True):Boolean;
Var
  f: TextFile;
  st: string;
  stDir : string;
begin
  result := False;
  Try
    {$I-}
    if aDirCheck then
    begin
      stDir := ExtractFilePath(aFileName);
      if not DirectoryExists(stDir) then CreateDir(stDir);
    end;

    AssignFile(f, aFileName);
    Append(f);
    if IOResult <> 0 then Rewrite(f);
    st := ast;
    WriteLn(f,st);
    System.Close(f);
    {$I+}
    result := True;
  Except
    Exit;
  End;
end;

function FileTimeToDateTime(FileTime: TFileTime): TDateTime;
var
  SystemTime  : TSystemTime;
begin
  FileTimeToLocalFileTime(FileTime, FileTime);
  FileTimeToSystemTime(FileTime, SystemTime);
  Result  := SystemTimeToDateTime(SystemTime);
end;

function FillCharString(aNo:String;aChar:char; aLength:Integer;bFront:Boolean = False): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= aNo;
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+ aChar;
    if bFront then  St:= St + StrNo
    else St:= StrNo + St;

    FillCharString := st;
  end else FillCharString := copy(Strno,1,aLength);
end;


function FillZeroNumber(aNo:Int64; aLength:Integer): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= InttoStr(aNo);
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+'0';
    St:= St + StrNo;
    FillZeroNumber:= st;
  end else FillZeroNumber:= copy(Strno,1,aLength);
end;

function FillZeroStrNum(aNo:String; aLength:Integer;bFront:Boolean = True): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= aNo;
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+'0';
    if bFront then  St:= St + StrNo
    else St:= StrNo + St;

    FillZeroStrNum:= st;
  end else FillZeroStrNum:= copy(Strno,1,aLength);
end;


//인증키를 가져오자
Function GetAuthKey(aGubun:string;aSeq:integer=0) : string;
var
  stExeFolder : string;
  ini_fun : TiniFile;
begin
  stExeFolder := ExtractFileDir(Application.ExeName);
  if aSeq = 0 then
    ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key.ini')
  else if aSeq = 1 then
    ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key1.ini');
  result := ini_fun.ReadString('Company','Key' + aGubun,'');
  ini_fun.Free;
end;

Function GetBuildInfo(var V1, V2, V3, V4: Word):Boolean;
var
   VerInfoSize,
   VerValueSize,
   Dummy       : DWORD;
   VerInfo	   : Pointer;
   VerValue	   : PVSFixedFileInfo;
begin
	 VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
	 GetMem(VerInfo, VerInfoSize);
	 GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
	 VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
	 With VerValue^ do
	 begin
	 	V1 := dwFileVersionMS shr 16;
		V2 := dwFileVersionMS and $FFFF;
		V3 := dwFileVersionLS shr 16;
		V4 := dwFileVersionLS and $FFFF;
	end;
	FreeMem(VerInfo, VerInfoSize);
end;

//고객사 ID를 가져오자
Function GetCustomerId(aGubun:string;aSeq:integer=0) : string;
var
  stExeFolder : string;
  ini_fun : TiniFile;
begin
  stExeFolder := ExtractFileDir(Application.ExeName);
  if aSeq = 0 then
    ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key.ini')
  else if aSeq = 1 then
    ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key1.ini');
  result := ini_fun.ReadString('Company','ID','');
  ini_fun.Free;
end;

Function GetInstallDate(aGubun:string):string;
var
  stDate : string;
  stExeFolder : string;
  ini_fun : TiniFile;
begin
  result := '';
  stExeFolder := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key.ini');
  stDate := ini_fun.ReadString('Company','Date'+ aGubun,'');
  if stDate = '' then exit;
  result := MimeDecodeString(stDate);
end;

Function GetIpFromDomain(aDomain:string):string;
var
  WSAData1: WSADATA;
  HostEnt: PHostEnt;
  pAddr: PAnsiChar;
  addr: in_addr;
begin
  Result:='';

  // GetHostByName 을 쓰기 위해 WSAStartup 을 한번 해줘야 함
  if WSAStartup(MAKEWORD(2, 2), WSAData1)<>0 then Exit;

  // WSAStartup 호출이 제대로 되지 않음을 체크(?)
  if (LOBYTE(WSAData1.wVersion)<>2) or (HIBYTE(WSAData1.wVersion)<>2) then begin
    WSACleanup;
    Exit;
  end;

  // HostEnt 로 매개변수로 받아온 도메인이름의 정보를 받아옴
  HostEnt := GetHostByName(pAnsiChar(aDomain));
  if HostEnt=nil then Exit;

  // PChar 형 변수로 ip 주소를 옮김
  pAddr := HostEnt^.h_addr_list^;
  if pAddr=nil then Exit;

  // 옮긴 ip 주소를 in_addr 로 적절히 변환
  addr.S_un_b.s_b1 := pAddr[0];
  addr.S_un_b.s_b2 := pAddr[1];
  addr.S_un_b.s_b3 := pAddr[2];
  addr.S_un_b.s_b4 := pAddr[3];

  // 변환된 ip 주소를 반환
  Result := inet_ntoa(addr);
end;

function GetLocalIPAddr : string;
var
  wData: WSADATA;
  HostName: String;
  pHostInfo: pHostEnt;
begin
  WSAStartup(MAKEWORD(2, 2), wData);
  GetHostName(PAnsiChar(HostName), 512);
  pHostInfo := GetHostByName(PAnsiChar(HostName));
  if Assigned(pHostInfo) then
    Result := IntToStr(ord(pHostInfo.h_addr_list^[0]))
            + '.' + IntToStr(ord(pHostInfo.h_addr_list^[1])) + '.'
            + IntToStr(ord(pHostInfo.h_addr_list^[2])) + '.'
            + IntToStr(ord(pHostInfo.h_addr_list^[3]))
  else    Result := '';
  WSACleanup;
end;

(* type
   TaPInAddr = array [0..10] of PInAddr;
   PaPInAddr = ^TaPInAddr;
 var
   phe : PHostEnt;
   pptr : PaPInAddr;
   Buffer : array [0..63] of char;
   I : Integer;
   GInitData : TWSADATA;
   stHostName : string;
begin
 try
   WSAStartup($101, GInitData);
   Result := '';
   GetHostName(Buffer, SizeOf(Buffer));
   phe := GetHostByName(buffer);
   if phe = nil then Exit;
   pptr := PaPInAddr(Phe^.h_addr_list);
   i := 0;
   result := '';
   while pptr^[I] <> nil do
   begin
     result:= result + StrPas(inet_ntoa(pptr^[I]^)) + ' ';
     Inc(I);
   end;
 finally WSACleanup; end;
end;  *)

function GetMACAddress:String;
var
  UuidCreateFunc : function (var guid: TGUID):HResult;stdcall;
  handle : THandle;
  g:TGUID;
  WinVer:_OSVersionInfoA;
  i:integer;
begin
  WinVer.dwOSVersionInfoSize := sizeof(WinVer);
  getversionexA(WinVer);

  handle := LoadLibrary('RPCRT4.DLL');
  if WinVer.dwMajorVersion >= 5 then {Windows 2000 }
    @UuidCreateFunc := GetProcAddress(Handle, 'UuidCreateSequential')
  else
    @UuidCreateFunc := GetProcAddress(Handle, 'UuidCreate') ;

  UuidCreateFunc(g);
  result:='';
  for i:=2 to 7 do
    result:=result+IntToHex(g.d4[i],2);
end;

function GetMACAddressXe2(LanaNum: Byte; MACAddress: PMACAddress): Byte;
var
  AdapterStatus: PAdapterStatus;
  StatNCB: PNCB;
begin
  New(StatNCB);
  ZeroMemory(StatNCB, SizeOf(TNCB));
  StatNCB.ncb_length := SizeOf(TAdapterStatus) +  255 * SizeOf(TNameBuffer);
  GetMem(AdapterStatus, StatNCB.ncb_length);
  try
    with StatNCB^ do
    begin
      ZeroMemory(MACAddress, SizeOf(TMACAddress));
      ncb_buffer := PAnsiChar(AdapterStatus);
      ncb_callname := '*              ' + #0;
      ncb_lana_num := AnsiChar(LanaNum);
      ncb_command  := AnsiChar(NCBASTAT);
      NetBios(StatNCB);
      Result := Byte(ncb_cmd_cplt);
      if Result = NRC_GOODRET then
        MoveMemory(MACAddress, AdapterStatus, SizeOf(TMACAddress));
    end;
  finally
    FreeMem(AdapterStatus);
    Dispose(StatNCB);
  end;
end;
function GetMacAddress3(aSeq:integer=0): string;
var
  NumInterfaces: Cardinal;
  AdapterInfo: array of TIpAdapterInfo;
  OutBufLen: ULONG;
begin
  GetNumberOfInterfaces(NumInterfaces);
  SetLength(AdapterInfo, NumInterfaces);
  if NumInterfaces <= aSeq then Exit;
  OutBufLen := NumInterfaces * SizeOf(TIpAdapterInfo);
  GetAdaptersInfo(@AdapterInfo[0], OutBufLen);
  if NumInterfaces > 0 then
    result := Format('%.2x%.2x%.2x%.2x%.2x%.2x',
      [AdapterInfo[aSeq].Address[0], AdapterInfo[aSeq].Address[1],
       AdapterInfo[aSeq].Address[2], AdapterInfo[aSeq].Address[3],
       AdapterInfo[aSeq].Address[4], AdapterInfo[aSeq].Address[5]])

  (*
  for i := 0 to NumInterfaces - 1 do begin
    Memo1.Lines.Add(Format('%.2x:%.2x:%.2x:%.2x:%.2x:%.2x',
      [AdapterInfo[i].Address[0], AdapterInfo[i].Address[1],
       AdapterInfo[i].Address[2], AdapterInfo[i].Address[3],
       AdapterInfo[i].Address[4], AdapterInfo[i].Address[5]]));
  end;*)
end;

function GetMacFromIP(IP:string):string;
type
  Tinfo = array[0..7] of byte;
var
  dwTargetIP:dword;
  dwMacAddress:array[0..1] of DWORD;
  dwMacLen : DWORD;
  dwResult : DWORD;
  X:Tinfo;
  stemp:string;
  iloop:integer;
begin
  dwTargetIP := Inet_Addr(PAnsiChar(ip));
  dwMacLen := 6;
  dwResult := SendARP(dwtargetip,0,@dwmacaddress[0],dwMaclen);
  if dwResult = NO_ERROR then
  begin
    x:= tinfo(dwMacAddress);
    for iloop :=0 to 5 do
    begin
      stemp := stemp + inttohex(x[iloop],2);
    end;
    result := stemp;
  end;
end;

function GetNodeByText(ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
var
    Node: TTreeNode;
begin

  Result := nil;
  if ATree.Items.Count = 0 then Exit;
  Node := ATree.Items[0];
  while Node <> nil do
  begin
    if UpperCase(Node.Text) = UpperCase(AValue) then
    begin
      Result := Node;
      if AVisible then
        Result.MakeVisible;
      Break;
    end;
    Node := Node.GetNext;
  end;
end;

function GetWinHandle(dwProcessID:DWORD):THandle;   // 프로세스 아이디로 윈도우 핸들 얻기
var
  hWnd: THandle;
  dwProcessID2: DWORD;
  //sCaption : string;
//  WinCaption : pChar;
begin
  hWnd := FindWindow(nil, nil); // 최상위 윈도우 핸들 찾기
  Result := 0;
  while( hWnd <> 0 ) do
  begin
//     GetWindowText(hWnd,WinCaption,255);

    if( 0 = GetParent(hWnd)) then // 최상위 핸들인지 체크, 버튼 등도 핸들을 가질 수 있으므로 무시하기 위해
    begin
      GetWindowThreadProcessId( hWnd, @dwProcessID2 );
      if( dwProcessID2 = dwProcessID ) then
      begin
        //sCaption := GetWindowText(hWnd) ;
        Result := hWnd;
        break;
      end;
    end;
    hWnd := GetWindow(hWnd, GW_HWNDNEXT); // 다음 윈도우 핸들 찾기
  end;
end;

function GetWindowFromProcessID(pID: DWORD): HWND;
var
  Param: TPIDandHWND;
begin
  Param.pID := pID;
  Param.hWindow := 0;
  EnumWindows(@EnumWindowsProc, integer(@Param));
  result := Param.hWindow;
end;

function Hex2Ascii(St: String;bConvert:Boolean=False;aConvertDec:integer=30): String;
var
  st2: string;
  I: Integer;
  aLength: Integer;
  aa: Integer;
begin
  st2:= '';
  for I:= 1 to Length(st) do
  begin
    if st[i] <> #$20 then st2:= st2 + st[I];
  end;
  if Length(st2) MOD 2 <> 0 then
  begin
    aLength:= Length(st2);
    st:= copy(st2,1,aLength-1) + '0'+ st2[aLength];
  end else
  begin
   st:= st2;
  end;

  st2:= '';
  while st <> '' do
  begin
    aa:= Hex2Dec(copy(st,1,2));
    if bConvert then
    begin
      if aa = 0 then aa := aConvertDec;
    end;
    st2:= st2 + Char(aa);
    delete(st,1,2);
  end;
  Hex2Ascii:= st2;
end;

function Hex2Binary(Hexadecimal: string): string;
const
  BCD: array [0..15] of string =
    ('0000', '0001', '0010', '0011', '0100', '0101', '0110', '0111',
    '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111');
var
  i: integer;
begin
  result := '';
  Try
    for i := Length(Hexadecimal) downto 1 do
      Result := BCD[StrToInt('$' + Hexadecimal[i])] + Result;
  Except
    Exit;
  End;
end;


function Hex2Dec(const S: string): Longint;
var
  HexStr: string;
begin
  result := -1;
  Try
    if Pos('$', S) = 0 then HexStr := '$' + S
    else HexStr := S;
    Result := StrToIntDef(HexStr, 0);
  Except
    Exit;
  End;
end;

function Hex2Dec64(const S: string): int64;
var
  HexStr: string;
begin
  result := -1;
  Try
    if Pos('$', S) = 0 then HexStr := '$' + S
    else HexStr := S;
    Result := StrToInt64Def(HexStr, 0);
  Except
    Exit;
  End;
end;

Function Hex2DecStr(S:String):String;
var
  i: longint;
  L: int64;
begin
  Result := '';
  if Length(s) = 0 then Exit;
  L:=0;
  for i := 1 to length(S) do L:=L*16 + pos(S[i],HexString)-1;
  Result:=intToStr(L);
end;


function Hex2ViewData(St: String):String;
var
  st2: string;
  I: Integer;
  aLength: Integer;
  aa: Integer;
begin
  st2:= '';
  for I:= 1 to Length(st) do
  begin
    if st[i] <> #$20 then st2:= st2 + st[I];
  end;
  if Length(st2) MOD 2 <> 0 then
  begin
    aLength:= Length(st2);
    st:= copy(st2,1,aLength-1) + '0'+ st2[aLength];
  end else
  begin
   st:= st2;
  end;

  st2:= '';
  while st <> '' do
  begin
    if pos(st[1],'34567') = 0 then st2 := st2+'['+copy(st,1,2) + ']'
    else
    begin
      aa:= Hex2Dec(copy(st,1,2));
      st2:= st2 + Char(aa);
    end;
    delete(st,1,2);
  end;
  result := st2;
end;

function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,MSecs: Integer): TDateTime;
begin
  Result := ATime + (Hours div 24) + (((Hours mod 24) * 3600000 +
    Minutes * 60000 + Seconds * 1000 + MSecs) / MSecsPerDay);
  if Result < 0 then Result := Result + 1;
end;


function IntToBin(Value: Longint; Digits:Integer): string;
begin
  Result := '';
  Try
    if Digits > 32 then Digits := 32;
    while Digits > 0 do begin
      Dec(Digits);
      Result := Result + IntToStr((Value shr Digits) and 1);
    end;
  Except
    Exit;
  End;
end;

function IsAlphaNumeric(st:string):Boolean;
var
  i : integer;
begin
  result := True;
  for i := 1 to length(st) do
  begin
    if not(st[i] in AlphaNumeric) then
    begin
      result := False;
      break;
    end;
  end;
end;

function IsDate(aDate:string):Boolean;
var
  dtTime : TDateTime;
begin
  result := False;
  Try
    aDate := stringReplace(aDate,'-','',[rfReplaceAll]);
    aDate := stringReplace(aDate,':','',[rfReplaceAll]);
    aDate := stringReplace(aDate,' ','',[rfReplaceAll]);
    dtTime := EncodeDateTime(strtoint(copy(aDate,1,4)),
                                             strtoint(copy(aDate,5,2)),
                                             strtoint(copy(aDate,7,2)),
                                             0,0,0,0);
    //dtTime := strtoDate(aDate);
  Except
    Exit;
  End;
  result := True;
end;

function Isdigit(st: string):Boolean;
var
  I: Integer;
begin
  result:=True;
  if Length(st) < 1 then
  begin
    result:=False;
    Exit;
  end;
  for I:=1 to Length(st) do
    if (st[I]< '0') or (st[I] > '9')  then result:=False
end;


function IsHangul(st:string):Boolean;
begin
  if TRegEx.IsMatch(st, regex) then result := True
  else result := False;
end;

function IsIPTypeCheck(ip: string): Boolean;
var
   z, i: byte;
   st: array[1..3] of byte;
const
   ziff = ['0'..'9'];
begin
   st[1]  := 0;
   st[2]  := 0;
   st[3]  := 0;
   z      := 0;
   Result := False;
   for i := 1 to Length(ip) do
   if ip[i] in ziff then
   else
   begin
     if ip[i] = '.' then
     begin
       Inc(z);
       if z < 4 then st[z] := i
       else
       begin
         Exit;
       end;
     end
     else
     begin
       Exit;
     end;
   end;
   if (z <> 3) or (st[1] < 2) or (st[3] = Length(ip)) or (st[1] + 2 > st[2]) or
     (st[2] + 2 > st[3]) or (st[1] > 4) or (st[2] > st[1] + 4) or (st[3] > st[2] + 4) then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, 1, st[1] - 1));
   if (z > 255) or (ip[1] = '0') then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, st[1] + 1, st[2] - st[1] - 1));
   if (z > 255) or ((z <> 0) and (ip[st[1] + 1] = '0')) then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, st[2] + 1, st[3] - st[2] - 1));
   if (z > 255) or ((z <> 0) and (ip[st[2] + 1] = '0')) then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, st[3] + 1, Length(ip) - st[3]));
   if (z > 255) or ((z <> 0) and (ip[st[3] + 1] = '0')) then
   begin
     Exit;
   end;
   result := True;
end;

Function MakeDatetimeStr(aTime: String;aTimeForamt:Boolean=True):String;
var
  stResult : string;
begin
  if Length(aTime) < 8 then stResult := aTime
  else
  begin
    stResult:= Copy(aTime,1,4)+'-'+Copy(aTime,5,2)+'-'+Copy(aTime,7,2) ;
    if aTimeForamt then
    begin
      if Length(aTime) = 14 then
         stResult:= stResult + ' ' + Copy(aTime,9,2)+':'+Copy(aTime,11,2)+':'+Copy(aTime,13,2);
    end;
  end;
  Result := stResult;
end;
Function MakePhoneNumber(aNumber:string):string;
var
  stResult : string;
begin
  aNumber := StringReplace(aNumber,'-','',[rfReplaceAll]);
  if Length(aNumber) < 9 then result := aNumber
  else
  begin
    if copy(aNumber,1,2) = '02' then
    begin
      if Length(aNumber) = 9 then result := copy(aNumber,1,2) + '-' + copy(aNumber,3,3) + '-' + copy(aNumber,6,4)
      else result := copy(aNumber,1,2) + '-' + copy(aNumber,3,4) + '-' + copy(aNumber,7,4);
    end else
    begin
      if Length(aNumber) = 10 then result := copy(aNumber,1,3) + '-' + copy(aNumber,4,3) + '-' + copy(aNumber,7,4)
      else result := copy(aNumber,1,3) + '-' + copy(aNumber,4,4) + '-' + copy(aNumber,8,4);
    end;
  end;

end;

Function MakeTimeStr(aTime: String):String;
var
  stResult : string;
begin
  if Length(aTime) < 6 then stResult := aTime
  else
  begin
    if Length(aTime) = 6 then
      stResult:= Copy(aTime,1,2)+':'+Copy(aTime,3,2)+':'+Copy(aTime,5,2)
    else stResult:= Copy(aTime,1,4)+'-'+Copy(aTime,5,2)+'-'+Copy(aTime,7,2) + ' ' + Copy(aTime,9,2)+':'+Copy(aTime,11,2)+':'+Copy(aTime,13,2);
  end;
  Result := stResult;
end;

Function MakeWorkTime_Minute(aEndTime,aStartTime:string;aCheck:integer):integer;
var
  stHH,stMM : string;
  nHH,nMM : integer;
begin
  result := 0;

  if Not isDigit(aEndTime) then aEndTime := '0000';
  if Not isDigit(aStartTime) then aStartTime := '0000';
  if Length(aEndTime) <> 4 then aEndTime := FillZeroStrNum(Trim(aEndTime),4,False);
  if Length(aStartTime) <> 4 then aStartTime := FillZeroStrNum(copy(aStartTime,9,4),4,False);
  if aCheck = 1 then
  begin
    if aEndTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
  end else if aCheck = 2 then
  begin
    if aStartTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
  end else if aCheck = 3 then
  begin
    if aEndTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
    if aStartTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
  end;

  if strtoint(aEndTime) >= strtoint(aStartTime) then
  begin
    //정상적인 경우
    nHH := strtoint(copy(aEndTime,1,2)) - strtoint(copy(aStartTime,1,2));
    nMM := strtoint(copy(aEndTime,3,2)) - strtoint(copy(aStartTime,3,2));
    result := (nHH * 60) + nMM;
  end else
  begin
    //퇴근시간이 오전이고 출근시간이 전일인경우
    nHH := 24 - strtoint(copy(aStartTime,1,2)) + strtoint(copy(aEndTime,1,2));
    nMM := 0 - strtoint(copy(aStartTime,3,2)) + strtoint(copy(aEndTime,3,2));
    result := (nHH * 60) + nMM;
  end;

end;


Function MinuteToString(aMinute:integer):string;
var
  nDD : integer;
  nHH : integer;
  nMM : integer;
begin
  result := '';
  Try
    nHH := aMinute div 60;
    nMM := aMinute mod 60; //분...
    if nHH = 0 then
    begin
      result := inttostr(nMM) + '분';
      Exit;
    end;
    nDD := nHH div 60;
    nHH := nHH mod 60; //시간
    if nDD = 0 then
    begin
      result := inttostr(nHH) + '시간 ' + inttostr(nMM) + '분';
      Exit;
    end;
    result := inttostr(nDD) + '일 ' +inttostr(nHH) + '시간 ' + inttostr(nMM) + '분';
  Except
    Exit;
  End;

end;

function MyF_UsingWinNT: Boolean;
var
  OS: TOSVersionInfo;
begin
  OS.dwOSVersionInfoSize := Sizeof(OS);
  GetVersionEx(OS);
  if OS.dwPlatformId = VER_PLATFORM_WIN32_NT then Result:= True
  else Result:= False;
end;

Function MyProcessMessage:Boolean;
var
  Msg: TMsg;
begin
  if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
  begin
    if Msg.Message = WM_QUIT then
    begin
      PostQuitMessage(0);
    end else
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end;
end;

Function MyRunDosCommand(Command : string;  nShow : Boolean = False; bWait:Boolean = True):Boolean;
var
  hReadPipe : THandle;
  hWritePipe : THandle;
  SI : TStartUpInfo;
  PI : TProcessInformation;
  SA : TSecurityAttributes;
  SD : TSecurityDescriptor;
  BytesRead : DWORD;
  Dest : array[0..1023] of char;
  CmdLine : array[0..512] of char;
  TmpList : TStringList;
  S, Param : string;
  Avail, ExitCode, wrResult : DWORD;
begin
  if MyF_UsingWinNT then begin
    InitializeSecurityDescriptor(@SD, SECURITY_DESCRIPTOR_REVISION);
    SetSecurityDescriptorDacl(@SD, True, nil, False);
    SA.nLength := SizeOf(SA);
    SA.lpSecurityDescriptor := @SD;
    SA.bInheritHandle := True;
    Createpipe(hReadPipe, hWritePipe, @SA, 1024);
  end else begin
    Createpipe(hReadPipe, hWritePipe, nil, 1024);
  end;
  try
     //Screen.Cursor := crHourglass;
     FillChar(SI, SizeOf(SI), 0);
     SI.cb := SizeOf(TStartUpInfo);
     if nShow then begin
       SI.wShowWindow := SW_SHOWNORMAL
     end else begin
       SI.wShowWindow := SW_HIDE;
     end;
     SI.dwFlags := STARTF_USESHOWWINDOW;
     SI.dwFlags := SI.dwFlags or STARTF_USESTDHANDLES;
     SI.hStdOutput := hWritePipe;
     SI.hStdError := hWritePipe;
     StrPCopy(CmdLine, Command);
     if CreateProcess(nil,CmdLine , nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, SI, PI) then begin
     //if CreateProcess(nil,pAnsichar(Command) , nil, nil, True,  DETACHED_PROCESS, nil, nil, SI, PI) then begin
       if bWait then
       begin
         ExitCode := 0;
         while ExitCode = 0 do begin
           wrResult := WaitForSingleObject(PI.hProcess, 50);
           if PeekNamedPipe(hReadPipe, nil, 0, nil, @Avail, nil) then begin
             if Avail > 0 then begin
               TmpList := TStringList.Create;
               try
                 FillChar(Dest, SizeOf(Dest), 0);
                 ReadFile(hReadPipe, Dest, Avail, BytesRead, nil);
               finally
                 TmpList.Free;
               end;
             end;
           end;
           if wrResult <> WAIT_TIMEOUT then begin
             ExitCode := 1;
           end;
           Application.ProcessMessages;
         end;
         GetExitCodeProcess(PI.hProcess, ExitCode);
         CloseHandle(PI.hProcess);
         CloseHandle(PI.hThread);
       end;
     end;
  finally
     CloseHandle(hReadPipe);
     CloseHandle(hWritePipe);
  end;
end;

function pCopy(p:pAnsiChar;n:cardinal):ansiString;
var
  rP:pAnsiChar;
begin
  setLength(result,n);
  rP:=pAnsiChar(result);
  while n <> 0 do
  begin
    rP^:=p^;
    inc(rP);
    inc(p);
    dec(n);
  end;
end;

function ProcIDFromWnd( ahwnd : HWND):int64;  // 윈도우 핸들로 프로세스 아이디 얻기
var
  idProc : int64;
begin
  GetWindowThreadProcessId( ahwnd, @idProc );
  result := idProc;
end;

procedure Process32List(Slist: TStringList);
var
  Process32: TProcessEntry32;
  SHandle: THandle; // the handle of the Windows object
  Next: BOOL;
begin
  Process32.dwSize := SizeOf(TProcessEntry32);
  SHandle := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);

  if Process32First(SHandle, Process32) then
  begin
    // 실행화일명과 process object 저장
    Slist.AddObject(Process32.szExeFile, TObject(Process32.th32ProcessID));
    repeat
      Next := Process32Next(SHandle, Process32);
      if Next then
        Slist.AddObject(Process32.szExeFile, TObject(Process32.th32ProcessID));
    until not Next;
  end;
  CloseHandle(SHandle); // closes an open object handle
end;

function ResetLana(LanaNum, ReqSessions, ReqNames: Byte;
  LanaRes: TNBLanaResources): Byte;
var
  ResetNCB: PNCB;
begin
  New(ResetNCB);
  ZeroMemory(ResetNCB, SizeOf(TNCB));
  try
    with ResetNCB^ do
    begin
      ncb_lana_num := Ansichar(LanaNum);        // Set Lana_Num
      ncb_lsn := Ansichar(LanaRes);             // Allocation of new resources
      ncb_callname[0] := Ansichar(ReqSessions); // Query of max sessions
      ncb_callname[1] := #0;                // Query of max NCBs (default)
      ncb_callname[2] := Ansichar(ReqNames);    // Query of max names
      ncb_callname[3] := #0;                // Query of use NAME_NUMBER_1
      ncb_command  := Ansichar(NCBRESET);
      NetBios(ResetNCB);
      Result := Byte(ncb_cmd_cplt);
    end;
  finally
    Dispose(ResetNCB);
  end;
end;

function SetSpacelength(st : String; aLength : Integer) : String;
begin
  result := st;
  while Length(Result) < aLength do
    Result := Result + ' ';
  Result := Copy(Result,1,aLength);
end;

function ShellExecute_AndWait(FileName:String;Params:String):Boolean;
var
  exInfo : TShellExecuteInfo;
  Ph : DWORD;
begin
  FillChar( exInfo, Sizeof(exInfo), 0 );
  with exInfo do
  begin
    cbSize:= Sizeof( exInfo );
    fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
    Wnd := GetActiveWindow();
    ExInfo.lpVerb := 'runas';
    ExInfo.lpParameters := PChar(Params);
    lpFile:= PChar(FileName);
    nShow := SW_SHOWNORMAL;
  end;
  if ShellExecuteEx(@exInfo) then
  begin
    Ph := exInfo.HProcess;
  end
  else
  begin
    exit;
  end;
  while WaitForSingleObject(ExInfo.hProcess, 50) <> WAIT_OBJECT_0 do
    Application.ProcessMessages;
  CloseHandle(Ph);
end;

Function StringToBin(aData:string):string;
var
  i:integer;
  stTemp : string;
begin
  result := '';
  Try
    stTemp := '';
    for i:=1 to Length(aData) do
    begin
      stTemp := stTemp + IntToBin(strtoint(aData[i]),4);
    end;
    result := stTemp;
  Except
    Exit;
  End;
end;

function ToHexStrNoSpace(st:string):String;
var
  I : Integer;
  st2: string;
  st3: string[3];
begin
  for I:= 1 to length(st) do
  begin
    st3:= Dec2Hex(ord(st[I]),1);
    if Length(st3) < 2 then st3:= '0'+ st3;
    st2:=st2 +st3;
  end;
  ToHexStrnospace:= st2;
end;


// 유니코드를 안시문자열로...
function WideToAnsi(const aWideBuf: PWideChar; aWideLen: Integer; aCodePage: UINT): String;
var
  AnsiStrLen: Integer;
begin
  AnsiStrLen :=
    WideCharToMultiByte(
      aCodePage,
      0,
      aWideBuf,
      aWideLen,
      nil,
      0,
      nil,
      nil
    );

  SetLength(Result, AnsiStrLen);

  WideCharToMultiByte(
    aCodePage,
    0,
    aWideBuf,
    aWideLen,
    PAnsiChar(Result),
    AnsiStrLen,
    nil,
    nil
  );
end;

function WinExecAndWait32(Path: PChar; Visibility: Word): integer;
var
  Msg: TMsg;
  lpExitCode : DWORD;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do
  begin
    cb := SizeOf(TStartupInfo);
    dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    wShowWindow := visibility;
  end;
  if CreateProcess(nil, path, nil, nil, False,
      NORMAL_PRIORITY_CLASS OR CREATE_SEPARATE_WOW_VDM,
      nil, nil, StartupInfo, ProcessInfo) then
  begin
    repeat
      while PeekMessage(Msg, 0, 0, 0, pm_Remove) do
      begin
        if Msg.Message = wm_Quit then
          Halt(Msg.WParam);
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;
      GetExitCodeProcess(ProcessInfo.hProcess,lpExitCode);
    until (lpExitCode <> Still_Active);
    with ProcessInfo do
    begin
      CloseHandle(hThread);
      CloseHandle(hProcess);
    end;
    Result := 0; {sucess}
  end
  else
    Result := GetLastError; {error occurs during CreateProcess}
end;

function WindowFromProcessID(pID: DWORD): HWND;
var
  Param: TPIDandHWND;
begin
  Param.pID := pID;
  Param.hWindow := 0;
  EnumWindows(@EnumWindowsProc, NativeInt(@Param));
  result := Param.hWindow;
end;

end.
