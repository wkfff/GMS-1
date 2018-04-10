unit uSupremaFinger;

interface

uses
  System.SysUtils, System.Classes,Winapi.Windows,uFingerVariable,Vcl.Dialogs,
  System.DateUtils;

type
  TdmSupremaFinger = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    L_nLibHandle : integer;
    L_nSockethandle : integer;
  private
    FConnected: Boolean;
    FDeviceIP: string;
    FSocketOPEN: Boolean;
    FDevicePort: integer;
    procedure SetSocketOPEN(const Value: Boolean);
    { Private declarations }
  public
    function GetFingerImage(aFileName:string):UF_RET_CODE;
    function GetFingerTemplate(aIndex:integer;var aFingerTemplate:string):UF_RET_CODE;
    function GetReadCardNo(var aCardNo:string):UF_RET_CODE;
    function SendDeleteFingerTemplate(aCardPosition:string):UF_RET_CODE;
    function SendFingerTemplate(aCardNo,aCardPosition,aTemplate1_1,aTemplate1_2,aTemplate2_1,aTemplate2_2,aExpireDate:string):UF_RET_CODE;
  public
    { Public declarations }
    property Connected : Boolean read FConnected write FConnected;
    property DeviceIP : string read FDeviceIP write FDeviceIP;
    property DevicePort : integer read FDevicePort write FDevicePort;
    property SocketOPEN : Boolean read FSocketOPEN write SetSocketOPEN;
  end;

var
  dmSupremaFinger: TdmSupremaFinger;

implementation

uses
  uCommonFunction;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmSupremaFinger }

procedure TdmSupremaFinger.DataModuleCreate(Sender: TObject);
var
  BS_InitSDK : T_BS_InitSDK;
  nResult : UF_RET_CODE;
begin
  L_nLibHandle := -1;
  L_nLibHandle := LoadLibrary('BioStar16.dll');
  if L_nLibHandle > 0 then
  begin
    @BS_InitSDK := GetProcAddress(L_nLibHandle,'F_BS_InitSDK');
    if Not(@BS_InitSDK = nil)  then
    begin
      nResult := BS_InitSDK();
      if nResult <> UF_RET_SUCCESS then L_nLibHandle := 0;
    end else
    begin
      L_nLibHandle := 0;
      showmessage('F_BS_InitSDK Fail');
    end;
  end else
  begin
    showmessage('BioStar16 Load Fail');
  end;
  DevicePort := 1471;
end;

function TdmSupremaFinger.GetFingerImage(aFileName: string): UF_RET_CODE;
var
  nResult : UF_RET_CODE;
  GetScanReadImage : T_BS_ReadImage;
  imageLen : integer;
  bitmapImage : pAnsichar;
  i : integer;
  FileStream      : TFileStream;
begin
  result := UF_ERR_CANNOT_OPEN_SERIAL;
  if L_nLibHandle = 0 then
  begin
    SocketOpen := False;
    Exit;
  end;
  @GetScanReadImage := GetProcAddress(L_nLibHandle,'F_BS_ReadImage');
  if Not(@GetScanReadImage = nil)  then
  begin
    bitmapImage := AllocMem(10 * 1024 * 1024 ); //충분하게 10M 까지 잡자
    nResult := GetScanReadImage(L_nSockethandle,255,bitmapImage,imageLen);   //1471
    if nResult = UF_RET_SUCCESS then
    begin
      FileStream:=Tfilestream.Create(aFileName,fmCreate ,fmShareDenyWrite );
      try
        FileStream.WriteBuffer(bitmapImage[0],imageLen);
      finally
        FileStream.Free;
      end;
    end;
    if bitmapImage <> Nil then FreeMem(bitmapImage);
  end;
  result := nResult;
end;

function TdmSupremaFinger.GetFingerTemplate(aIndex: integer;var
  aFingerTemplate: string): UF_RET_CODE;
var
  nResult : UF_RET_CODE;
  GetScanTemplate : T_BS_ScanTemplate;
  stFingerTemplate : string;
  fnTemplate : PFingerTemplate;
  i : integer;
begin
  stFingerTemplate := '';
  result := UF_ERR_CANNOT_OPEN_SERIAL;
  if L_nLibHandle = 0 then
  begin
    SocketOpen := False;
    Exit;
  end;
  @GetScanTemplate := GetProcAddress(L_nLibHandle,'F_BS_ScanTemplate');
  if Not(@GetScanTemplate = nil)  then
  begin
    Try
      New(fnTemplate);
      nResult := GetScanTemplate(L_nSockethandle,aIndex,fnTemplate);   //1471
      if nResult = UF_RET_SUCCESS then
      begin
        if aIndex = 1 then
        begin
          for i := 0 to SF_TEMPLATE_SIZE - 1 do
            stFingerTemplate := stFingerTemplate + FillZeroNumber(fnTemplate.Template1[i],10);
        end else if aIndex = 2 then
        begin
          for i := 0 to SF_TEMPLATE_SIZE - 1 do
            stFingerTemplate := stFingerTemplate + FillZeroNumber(fnTemplate.Template2[i],10);
        end else if aIndex = 3 then
        begin
          for i := 0 to SF_TEMPLATE_SIZE - 1 do
            stFingerTemplate := stFingerTemplate + FillZeroNumber(fnTemplate.Template3[i],10);
        end else if aIndex = 4 then
        begin
          for i := 0 to SF_TEMPLATE_SIZE - 1 do
            stFingerTemplate := stFingerTemplate + FillZeroNumber(fnTemplate.Template4[i],10);
        end;
      end;
    Finally
      Dispose(fnTemplate);
    End;
  end;
  aFingerTemplate := stFingerTemplate;
  result := nResult;
end;

function TdmSupremaFinger.GetReadCardNo(var aCardNo: string): UF_RET_CODE;
var
  nResult : UF_RET_CODE;
  GetReadCardNo : T_BS_ReadCardNo;
  nCardNo : Longword;
  nCustomerID : integer;
begin
  aCardNo := '';
  result := UF_ERR_CANNOT_OPEN_SERIAL;
  if L_nLibHandle = 0 then
  begin
    SocketOpen := False;
    Exit;
  end;
  @GetReadCardNo := GetProcAddress(L_nLibHandle,'F_BS_ReadCardNo');
  if Not(@GetReadCardNo = nil)  then
  begin
    nResult := GetReadCardNo(L_nSockethandle,nCardNo, nCustomerID);   //1471
    if nResult = UF_RET_SUCCESS then
    begin
      aCardNo := dec2Hex(int64(nCardNo),8);
    end;
  end;
  result := nResult;
end;

function TdmSupremaFinger.SendDeleteFingerTemplate(
  aCardPosition: string): UF_RET_CODE;
var
  SetDeleteUser : T_BS_DeleteUser;
  nUserID : integer;
begin
  @SetDeleteUser := GetProcAddress(L_nLibHandle,'F_BS_DeleteUser');
  if Not(@SetDeleteUser = nil)  then
  begin
    nUserID := strtoint(aCardPosition);
    Result := SetDeleteUser(L_nSockethandle,nUserID);
  end else
  begin
    SocketOpen := False; //함수 로딩 실패시
  end;

end;

function TdmSupremaFinger.SendFingerTemplate(aCardNo,aCardPosition,aTemplate1_1,aTemplate1_2,aTemplate2_1,aTemplate2_2,aExpireDate:string): UF_RET_CODE;
var
  nResult : UF_RET_CODE;
  SetScanTemplateADD : T_BS_ScanTemplateADD;
  SetDeleteUser : T_BS_DeleteUser;
  nCardNo : Longword;
  stExpiretime : string;
  expireTime : double;
  nExpireTime : int64;
  nFingerCount : integer;
  nUserID : integer;
  fnTemplate : PFingerTemplate;
  i,j : integer;

begin
  result := UF_ERR_CANNOT_OPEN_SERIAL;
  if L_nLibHandle = 0 then Exit;  //Dll 로드 실패시 빠져 나감.
  @SetScanTemplateADD := GetProcAddress(L_nLibHandle,'F_BS_ScanTemplateADD');
  if Not(@SetScanTemplateADD = nil)  then
  begin
    nCardNo := Hex2Dec64(copy(aCardNo,1,8));
    stExpiretime := aExpireDate;
    expireTime := EncodeDateTime(strtoint(copy(stExpiretime,1,4)),
                                   strtoint(copy(stExpiretime,5,2)),
                                   strtoint(copy(stExpiretime,7,2)),
                                   23,59,59,0);
    nExpireTime := (Trunc(expireTime) - SF_EpochDiff) * SF_SecsInDay;
    nUserID := strtoint(aCardPosition);
    Try
      New(fnTemplate);
      nFingerCount := 0;
      if (aTemplate1_1 <> '') and
         (aTemplate1_2 <> '')
        then
      begin
        Try
          nFingerCount := 1;
          for j := 0 to SF_TEMPLATE_SIZE - 1 do
            fnTemplate.Template1[j] := strtoint64(copy(aTemplate1_1,1 + (j * 10),10));
          for j := 0 to SF_TEMPLATE_SIZE - 1 do
            fnTemplate.Template2[j] := strtoint64(copy(aTemplate1_2,1 + (j * 10),10));
          if (aTemplate2_1 <> '') and
             (aTemplate2_2 <> '')
            then
          begin
            nFingerCount := 2;
            for j := 0 to SF_TEMPLATE_SIZE - 1 do
              fnTemplate.Template3[j] := strtoint64(copy(aTemplate2_1,1 + (j * 10),10));
            for j := 0 to SF_TEMPLATE_SIZE - 1 do
              fnTemplate.Template4[j] := strtoint64(copy(aTemplate2_2,1 + (j * 10),10));
          end;
        Except
          nFingerCount := 0;
        End;
      end;

      nResult := SetScanTemplateADD(L_nSockethandle,nFingerCount,nUserID,0,fnTemplate^,nCardNo,nExpireTime);   //1471
      result := nResult;
    Finally
      Dispose(fnTemplate);
    End;
  end;
end;

procedure TdmSupremaFinger.SetSocketOPEN(const Value: Boolean);
var
  BS_OpenSocket : T_BS_OpenSocket;
  BS_CloseSocket : T_BS_CloseSocket;
  nResult : UF_RET_CODE;
begin
  if FSocketOPEN = Value then Exit;
  FSocketOPEN := Value;

  if Value then
  begin
    if L_nLibHandle < 1 then
    begin
      SocketOPEN := False;
      Exit;
    end;
    @BS_OpenSocket := GetProcAddress(L_nLibHandle,'F_BS_OpenSocket');
    if Not(@BS_OpenSocket = nil)  then
    begin
      nResult := BS_OpenSocket(pAnsiChar(AnsiString(DeviceIP)), DevicePort, L_nSockethandle);   //1471
      //nResult := BS_OpenSocket(pAnsiChar(AnsiString(DeviceIP)), strtoint('1471'), L_nSockethandle);   //1471
      if nResult = UF_RET_SUCCESS then
      begin
        Connected := True;
      end else
      begin
        showmessage(inttostr(integer(nResult)) + DeviceIP);
        L_nSockethandle := -1;
        SocketOPEN := False;
      end;
    end else
    begin
      SocketOPEN := False;
    end;
  end else
  begin
    Connected := False;
    if L_nSockethandle <> -1 then
    begin
      @BS_CloseSocket := GetProcAddress(L_nLibHandle,'F_BS_CloseSocket');
      if Not(@BS_CloseSocket = nil)  then
      begin
        Try
          nResult := BS_CloseSocket(L_nSockethandle);   //1471
        Except
          Exit;
        End;
      end;
    end;
  end;
end;


end.
