program GMS_FingerServer;

uses
  Vcl.Forms,
  IniFiles,
  SysUtils,
  Windows,
  Winapi.Messages,
  uMain in 'uMain.pas' {fmMain},
  uCommonFunction in '..\..\Lib\Common\uCommonFunction.pas',
  uCommonVariable in '..\..\Lib\Common\uCommonVariable.pas',
  uSubForm in '..\..\Lib\Form\uSubForm.pas' {fmASubForm},
  uDataBase in '..\..\Lib\DataBase\uDataBase.pas' {dmDataBase: TDataModule},
  uDataBaseConfig in '..\..\Lib\DataBase\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDBVariable in '..\..\Lib\DataBase\uDBVariable.pas',
  uDBAlter in '..\..\Lib\DataBase\uDBAlter.pas' {dmDBAlter: TDataModule},
  uDBCreate in '..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uDBFormMessage in '..\..\Lib\DataBase\uDBFormMessage.pas' {dmFormMessage: TDataModule},
  uDBFormName in '..\..\Lib\DataBase\uDBFormName.pas' {dmFormName: TDataModule},
  uDBFunction in '..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  uDBInsert in '..\..\Lib\DataBase\uDBInsert.pas' {dmDBInsert: TDataModule},
  uFormVariable in '..\..\Lib\Form\uFormVariable.pas',
  uLoginVariable in '..\..\Lib\Login\uLoginVariable.pas',
  uDeviceFunction in '..\..\Lib\Device\uDeviceFunction.pas' {dmDeviceFunction: TDataModule},
  uSolarLunar in '..\..\Lib\Date\uSolarLunar.pas',
  uFingerDeviceState in 'fmFingerDeviceState\uFingerDeviceState.pas' {fmFingerDeviceState},
  uDBDelete in '..\..\Lib\DataBase\uDBDelete.pas' {dmDBDelete: TDataModule},
  uDBUpdate in '..\..\Lib\DataBase\uDBUpdate.pas' {dmDBUpdate: TDataModule},
  uDBSelect in '..\..\Lib\DataBase\uDBSelect.pas' {dmDBSelect: TDataModule},
  uSupremaServer in '..\..\Lib\FingerReader\uSupremaServer.pas' {dmSupremaServer: TDataModule},
  uFingerVariable in '..\..\Lib\FingerReader\uFingerVariable.pas',
  uFingerDevice in 'fmFingerDevice\uFingerDevice.pas' {fmFingerDevice},
  uDeviceComMonitoring in 'fmDeviceComMonitoring\uDeviceComMonitoring.pas' {fmDeviceComMonitoring},
  uFormDevice in '..\..\Lib\Form\uFormDevice.pas' {dmFormDevice: TDataModule},
  uCommonEvent in '..\..\Lib\Common\uCommonEvent.pas',
  systeminfos in '..\..\Lib\Common\systeminfos.pas',
  uConfig in 'fmConfig\uConfig.pas' {fmConfig},
  u_c_log in '..\..\Lib\Device\Winsockclasses\u_c_log.pas',
  u_c_basic_object in '..\..\Lib\Device\Winsockclasses\u_c_basic_object.pas',
  u_c_byte_buffer in '..\..\Lib\Device\Winsockclasses\u_c_byte_buffer.pas',
  u_c_display in '..\..\Lib\Device\Winsockclasses\u_c_display.pas',
  u_winsock in '..\..\Lib\Device\Winsocket\u_winsock.pas',
  u_characters in '..\..\Lib\Device\Winsockunits\u_characters.pas',
  u_dir in '..\..\Lib\Device\Winsockunits\u_dir.pas',
  u_display_hex_2 in '..\..\Lib\Device\Winsockunits\u_display_hex_2.pas',
  u_file in '..\..\Lib\Device\Winsockunits\u_file.pas',
  u_strings in '..\..\Lib\Device\Winsockunits\u_strings.pas',
  u_types_constants in '..\..\Lib\Device\Winsockunits\u_types_constants.pas',
  uDeviceVariable in '..\..\Lib\Device\uDeviceVariable.pas',
  uSyFpReaderFunction in '..\..\Lib\SHFPReader\uSyFpReaderFunction.pas',
  uComboBoxCodeLoad in '..\..\Lib\DockForm\uComboBoxCodeLoad.pas',
  uFormFunction in '..\..\Lib\Form\uFormFunction.pas' {dmFormFunction: TDataModule},
  uSyFpEncrypt in '..\..\Lib\SHFPReader\uSyFpEncrypt.pas',
  uSHFDBRelay in '..\..\Lib\SHFPReader\uSHFDBRelay.pas' {dmSHFDBRelay: TDataModule},
  uSHFReaderServer in '..\..\Lib\SHFPReader\uSHFReaderServer.pas' {dmSHFReaderServer: TDataModule};

{$R *.res}
{$R manifest.RES}

var
hMutex : LongInt;
FindHandle: THandle;
begin
  hMutex := OpenMutex( MUTEX_ALL_ACCESS, False, pchar('FINGERSERVER') );
  If hMutex <> 0 Then
  Begin
    FindHandle := FindWindow(nil,pchar('슈프리마지문리더서버'));
    If FindHandle <> 0 then
    begin
       SendMessage(FindHandle,WM_USER,SC_MAXIMIZE,0);
    end;
    CloseHandle( hMutex );
    Exit;
  End;
  hMutex := CreateMutex( Nil, False, pchar('FINGERSERVER') );

  Application.Initialize;
  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDataBase, dmDataBase);
  Application.CreateForm(TdmSHFDBRelay, dmSHFDBRelay);
  Application.CreateForm(TdmSHFReaderServer, dmSHFReaderServer);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
