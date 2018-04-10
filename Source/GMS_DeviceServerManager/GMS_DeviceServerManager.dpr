program GMS_DeviceServerManager;

uses
  Classes,
  IniFiles,
  System.SysUtils,
  Windows,
  Winapi.Messages,
  Vcl.Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uCommonFunction in '..\..\Lib\common\uCommonFunction.pas',
  uCommonVariable in '..\..\Lib\common\uCommonVariable.pas',
  uDataBase in '..\..\Lib\DataBase\uDataBase.pas' {dmDataBase: TDataModule},
  uDataBaseConfig in '..\..\Lib\DataBase\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDBCreate in '..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uDBFunction in '..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  uDBInsert in '..\..\Lib\DataBase\uDBInsert.pas' {dmDBInsert: TDataModule},
  uSubForm in '..\..\Lib\Form\uSubForm.pas' {fmASubForm},
  uPCComMonitoring in 'fmPCComMonitoring\uPCComMonitoring.pas' {fmPCComMonitoring},
  uSharedMemory in '..\..\Lib\Common\SharedMemory\uSharedMemory.pas',
  uFormVariable in '..\..\Lib\Form\uFormVariable.pas',
  uCommonEvent in '..\..\Lib\Common\uCommonEvent.pas',
  uSolarLunar in '..\..\Lib\Date\uSolarLunar.pas',
  uDBFormMessage in '..\..\Lib\DataBase\uDBFormMessage.pas' {dmFormMessage: TDataModule},
  uDBUpdate in '..\..\Lib\DataBase\uDBUpdate.pas' {dmDBUpdate: TDataModule},
  uDBFormName in '..\..\Lib\DataBase\uDBFormName.pas' {dmFormName: TDataModule},
  uDeviceVariable in '..\..\Lib\Device\uDeviceVariable.pas',
  uDevicePacket in '..\..\Lib\Device\uDevicePacket.pas' {dmDevicePacket: TDataModule},
  u_c_basic_object in '..\..\Lib\Device\Winsockclasses\u_c_basic_object.pas',
  u_c_byte_buffer in '..\..\Lib\Device\Winsockclasses\u_c_byte_buffer.pas',
  u_c_display in '..\..\Lib\Device\Winsockclasses\u_c_display.pas',
  u_c_log in '..\..\Lib\Device\Winsockclasses\u_c_log.pas',
  u_winsock in '..\..\Lib\Device\Winsocket\u_winsock.pas',
  u_characters in '..\..\Lib\Device\Winsockunits\u_characters.pas',
  u_dir in '..\..\Lib\Device\Winsockunits\u_dir.pas',
  u_display_hex_2 in '..\..\Lib\Device\Winsockunits\u_display_hex_2.pas',
  u_file in '..\..\Lib\Device\Winsockunits\u_file.pas',
  u_strings in '..\..\Lib\Device\Winsockunits\u_strings.pas',
  u_types_constants in '..\..\Lib\Device\Winsockunits\u_types_constants.pas',
  uDBDelete in '..\..\Lib\DataBase\uDBDelete.pas' {dmDBDelete: TDataModule},
  uDBCardPermit in '..\..\Lib\DataBase\uDBCardPermit.pas' {dmDBCardPermit: TDataModule},
  uCard in '..\..\Lib\Common\uCard.pas' {dmCard: TDataModule},
  uDeviceCardNo in '..\..\Lib\Common\uDeviceCardNo.pas' {dmDeviceCardNo: TDataModule};

{$R *.res}
{$R manifest.RES}

var
hMutex : LongInt;
ini_fun : TiniFile;
DaemonGubun:string;
FindHandle: THandle;
ProcessList : TStringList;
i : integer;
ProcId: DWORD;
hProcess: THandle;
//TermSucc: BOOL;
pSelfID : DWORD;
begin
  ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Config.INI');
  G_nDecoderNo := ini_fun.ReadInteger('DECODER','NO',1);
  G_stEventDataDir := ini_fun.ReadString('DECODER','EventDataDir','');
  G_nMonitoringType := ini_fun.ReadInteger('MONITORING','TYPE',1);  //0.�Ϲ�,1.�бⱹ��

  ProcessList := TStringList.Create;
  ProcessList.Clear;
  Process32List(ProcessList);
  GetWindowThreadProcessId(Application.Handle, @pSelfID);
  for i := 0 to ProcessList.Count - 1 do
  begin
    if ProcessList.Strings[i] = ExtractFileName(Application.ExeName) then  //���� �ǰ� ������
    begin
      ProcId := DWORD(ProcessList.Objects[i]);
      if ProcID <> pSelfID then
      begin
        Exit; //���� ��Ű�� ����...
      end;
    end;
  end;
  Application.Initialize;
  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDataBase, dmDataBase);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmFormName, dmFormName);
  Application.CreateForm(TdmDevicePacket, dmDevicePacket);
  Application.CreateForm(TdmDBDelete, dmDBDelete);
  Application.CreateForm(TdmDBCardPermit, dmDBCardPermit);
  Application.CreateForm(TdmCard, dmCard);
  Application.CreateForm(TdmDeviceCardNo, dmDeviceCardNo);
  Application.Run;
end.