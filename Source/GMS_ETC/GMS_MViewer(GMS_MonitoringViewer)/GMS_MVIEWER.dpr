program GMS_MVIEWER;

uses
  Vcl.Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uRelayDataBase in 'DataBase\uRelayDataBase.pas' {dmRelayDataBase: TDataModule},
  uRelayDataBaseConfig in 'DataBase\uRelayDataBaseConfig.pas' {fmRelayDataBaseConfig},
  uDBAlter in '..\..\..\Lib\DataBase\uDBAlter.pas' {dmDBAlter: TDataModule},
  uDBCardPermit in '..\..\..\Lib\DataBase\uDBCardPermit.pas' {dmDBCardPermit: TDataModule},
  uDBCreate in '..\..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uDBDelete in '..\..\..\Lib\DataBase\uDBDelete.pas' {dmDBDelete: TDataModule},
  uDBFormMessage in '..\..\..\Lib\DataBase\uDBFormMessage.pas' {dmFormMessage: TDataModule},
  uDBFormName in '..\..\..\Lib\DataBase\uDBFormName.pas' {dmFormName: TDataModule},
  uDBFunction in '..\..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  uDBInsert in '..\..\..\Lib\DataBase\uDBInsert.pas' {dmDBInsert: TDataModule},
  uDBSelect in '..\..\..\Lib\DataBase\uDBSelect.pas' {dmDBSelect: TDataModule},
  uDBUpdate in '..\..\..\Lib\DataBase\uDBUpdate.pas' {dmDBUpdate: TDataModule},
  uDBVariable in '..\..\..\Lib\DataBase\uDBVariable.pas',
  uCommonFunction in '..\..\..\Lib\Common\uCommonFunction.pas',
  uCommonVariable in '..\..\..\Lib\Common\uCommonVariable.pas',
  uFormVariable in '..\..\..\Lib\DockForm\uFormVariable.pas',
  uLoginVariable in '..\..\..\Lib\Login\uLoginVariable.pas',
  uDeviceFunction in '..\..\..\Lib\Device\uDeviceFunction.pas' {dmDeviceFunction: TDataModule},
  uDeviceVariable in '..\..\..\Lib\Device\uDeviceVariable.pas',
  uSolarLunar in '..\..\..\Lib\Date\uSolarLunar.pas',
  uPCClient in '..\..\..\Lib\PCSocket\uPCClient.pas' {dmPCClient: TDataModule},
  uFormDeviceState in '..\..\..\Lib\DockForm\uFormDeviceState.pas' {DataModule2: TDataModule},
  uDataBase in '..\..\..\Lib\DataBase\uDataBase.pas' {dmDataBase: TDataModule},
  uDataBaseConfig in '..\..\..\Lib\DataBase\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCommonEvent in '..\..\..\Lib\Common\uCommonEvent.pas',
  uServerClientVariable in '..\..\..\Lib\MIAMSServer\uServerClientVariable.pas',
  uServerClientFunction in '..\..\..\Lib\MIAMSServer\uServerClientFunction.pas',
  u_c_basic_object in '..\..\..\Lib\Device\Winsockclasses\u_c_basic_object.pas',
  u_c_byte_buffer in '..\..\..\Lib\Device\Winsockclasses\u_c_byte_buffer.pas',
  u_c_display in '..\..\..\Lib\Device\Winsockclasses\u_c_display.pas',
  u_c_log in '..\..\..\Lib\Device\Winsockclasses\u_c_log.pas',
  u_winsock in '..\..\..\Lib\Device\Winsocket\u_winsock.pas',
  u_characters in '..\..\..\Lib\Device\Winsockunits\u_characters.pas',
  u_dir in '..\..\..\Lib\Device\Winsockunits\u_dir.pas',
  u_display_hex_2 in '..\..\..\Lib\Device\Winsockunits\u_display_hex_2.pas',
  u_file in '..\..\..\Lib\Device\Winsockunits\u_file.pas',
  u_strings in '..\..\..\Lib\Device\Winsockunits\u_strings.pas',
  u_types_constants in '..\..\..\Lib\Device\Winsockunits\u_types_constants.pas',
  uOption in 'fmOption\uOption.pas' {fmOption},
  uRederSetting in 'fmReaderSetting\uRederSetting.pas' {fmReaderSetting},
  uSubForm in '..\..\..\Lib\Form\uSubForm.pas' {fmASubForm},
  uFormFunction in '..\..\..\Lib\Form\uFormFunction.pas' {dmFormFunction: TDataModule},
  uGroupCardReaderAdd in 'fmReaderSetting\uGroupCardReaderAdd.pas' {fmGroupCardReaderAdd},
  uComboBoxCodeLoad in '..\..\..\Lib\DockForm\uComboBoxCodeLoad.pas',
  uReaderMonitoring in 'fmMain\uReaderMonitoring.pas' {fmReaderMonitoring},
  uDisplay in 'fmDisplay\uDisplay.pas' {fmDisplay};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDataBase, dmDataBase);
  Application.CreateForm(TdmRelayDataBase, dmRelayDataBase);
  Application.CreateForm(TdmPCClient, dmPCClient);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmReaderMonitoring, fmReaderMonitoring);
  Application.CreateForm(TfmDisplay, fmDisplay);
  Application.Run;
end.