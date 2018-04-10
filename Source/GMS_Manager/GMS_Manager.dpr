program GMS_Manager;

uses
  IniFiles,
  System.SysUtils,
  Forms,
  uAccessTimeAdmin in 'fmAccessTimeAdmin\uAccessTimeAdmin.pas',
  uAdminClassCode in 'fmAdminClassCode\uAdminClassCode.pas' {fmAdminClassCode},
  uAdminClassGrade in 'fmAdminClassGrade\uAdminClassGrade.pas' {fmAdminClassGrade},
  uAdminUserID in 'fmAdminUserID\uAdminUserID.pas' {fmAdminUserID},
  uAdminUserIDDoorGrade in 'fmAdminUserID\fmAdminUserIDDoorGrade\uAdminUserIDDoorGrade.pas' {fmAdminUserIDDoorGrade},
  uCardGubun in 'fmCardGubun\uCardGubun.pas' {fmCardGubun},
  uZoneMapAdmin in 'fmZoneMap\uZoneMapAdmin.pas' {fmZoneMapAdmin},
  uBuilding in 'fmBuilding\uBuilding.pas' {fmBuilding},
  uBuildingMapAdmin in 'fmBuildingMapAdmin\uBuildingMapAdmin.pas' {fmBuildingMapAdmin},
  uClientConfig in 'fmClientConfig\uClientConfig.pas' {fmClientConfig},
  uCompany in 'fmCompany\uCompany.pas' {fmCompany},
  systeminfos in '..\..\Lib\Common\systeminfos.pas',
  uCommonFunction in '..\..\Lib\Common\uCommonFunction.pas',
  uCommonVariable in '..\..\Lib\Common\uCommonVariable.pas',
  uDoorList in 'fmDoor\uDoorList.pas' {fmDoorList},
  uDoorMapAdmin in 'fmDoorMapAdmin\uDoorMapAdmin.pas' {fmDoorMapAdmin},
  uDoorSchedule in 'fmDoorSchedule\uDoorSchedule.pas' {fmDoorSchedule},
  uEmGroupGrade in 'fmEmGroupGrade\uEmGroupGrade.pas' {fmEmGroupGrade},
  uKTEmployee in 'fmKTEmployee\uKTEmployee.pas' {fmKTEmployee},
  uEmployeeGradeSearch in 'fmEmployeeGradeSearch\uEmployeeGradeSearch.pas' {fmEmployeeGradeSearch},
  uEmployeeGroupCode in 'fmEmployeeGroupCode\uEmployeeGroupCode.pas' {fmEmployeeGroupCode},
  uEmployeeGubunCode in 'fmEmployeeGubunCode\uEmployeeGubunCode.pas' {fmEmployeeGubunCode},
  uHolidayAdd in 'fmHoliday\uHolidayAdd.pas' {fmHolidayAdd},
  uMain in 'fmMain\uMain.pas' {fmMain},
  uPosiCode in 'fmPosiCode\uPosiCode.pas' {fmPosiCode},
  uSprash in 'fmSprash\uSprash.pas' {fmSprash},
  uTimeCodeAdmin in 'fmTimeCodeAdmin\uTimeCodeAdmin.pas' {fmTimeCodeAdmin},
  uNewZoneAdmin in 'fmZoneAdmin\uNewZoneAdmin.pas' {fmNewZoneAdmin},
  uDoorOpenReport in 'Report\fmDoorOpenReport\uDoorOpenReport.pas' {fmDoorOpenReport},
  uTelAccessReport in 'Report\fmTelAccessReport\uTelAccessReport.pas' {fmTelAccessReport},
  uDoorAlarmReport in 'Report\fmDoorAlarmReport\uDoorAlarmReport.pas' {fmDoorAlarmReport},
  uAlarmManagementReport in 'Report\fmAlarmManagementReport\uAlarmManagementReport.pas' {fmAlarmManagementReport},
  uArmAreaAccessReport in 'Report\fmArmAreaAccessReport\uArmAreaAccessReport.pas' {fmArmAreaAccessReport},
  uAttendManger in 'Report\fmAttendManger\uAttendManger.pas' {fmAttendManger},
  uDeviceVersionReport in 'Report\fmDeviceVersionReport\uDeviceVersionReport.pas' {fmDeviceVersionReport},
  uNotCardUseReport in 'Report\fmNotCardUseReport\uNotCardUseReport.pas' {fmNotCardUseReport},
  uFoodEventReport in 'Report\fmFoodEventReport\uFoodEventReport.pas' {fmFoodEventReport},
  uFoodDepartStateReport in 'Report\fmFoodDepartStateReport\uFoodDepartStateReport.pas' {fmFoodDepartStateReport},
  uPCClient in '..\..\Lib\PCSocket\uPCClient.pas' {dmPCClient: TDataModule},
  uDataBase in '..\..\Lib\DataBase\uDataBase.pas' {dmDataBase: TDataModule},
  uDataBaseConfig in '..\..\Lib\DataBase\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDBAlter in '..\..\Lib\DataBase\uDBAlter.pas' {dmDBAlter: TDataModule},
  uDBCardPermit in '..\..\Lib\DataBase\uDBCardPermit.pas' {dmDBCardPermit: TDataModule},
  uDBCreate in '..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uDBDelete in '..\..\Lib\DataBase\uDBDelete.pas' {dmDBDelete: TDataModule},
  uDBFormMessage in '..\..\Lib\DataBase\uDBFormMessage.pas' {dmFormMessage: TDataModule},
  uDBFormName in '..\..\Lib\DataBase\uDBFormName.pas' {dmFormName: TDataModule},
  uDBFunction in '..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  uDBInsert in '..\..\Lib\DataBase\uDBInsert.pas' {dmDBInsert: TDataModule},
  uDBSelect in '..\..\Lib\DataBase\uDBSelect.pas' {dmDBSelect: TDataModule},
  uDBUpdate in '..\..\Lib\DataBase\uDBUpdate.pas' {dmDBUpdate: TDataModule},
  uSolarLunar in '..\..\Lib\Date\uSolarLunar.pas',
  uComPort in '..\..\Lib\Device\uComPort.pas' {dmComPort: TDataModule},
  uDeviceFunction in '..\..\Lib\Device\uDeviceFunction.pas' {dmDeviceFunction: TDataModule},
  uDeviceVariable in '..\..\Lib\Device\uDeviceVariable.pas',
  u_c_basic_object in '..\..\Lib\Device\Winsockclasses\u_c_basic_object.pas',
  u_c_byte_buffer in '..\..\Lib\Device\Winsockclasses\u_c_byte_buffer.pas',
  u_c_display in '..\..\Lib\Device\Winsockclasses\u_c_display.pas',
  u_c_log in '..\..\Lib\Device\Winsockclasses\u_c_log.pas',
  u_characters in '..\..\Lib\Device\Winsockunits\u_characters.pas',
  u_dir in '..\..\Lib\Device\Winsockunits\u_dir.pas',
  u_display_hex_2 in '..\..\Lib\Device\Winsockunits\u_display_hex_2.pas',
  u_file in '..\..\Lib\Device\Winsockunits\u_file.pas',
  u_strings in '..\..\Lib\Device\Winsockunits\u_strings.pas',
  u_types_constants in '..\..\Lib\Device\Winsockunits\u_types_constants.pas',
  uSupremaServer in '..\..\Lib\FingerReader\uSupremaServer.pas' {dmSupremaServer: TDataModule},
  uAdvToolBarSubForm in '..\..\Lib\Form\uAdvToolBarSubForm.pas' {fmAdvToolBarSubForm},
  uBuildingAlarmConfirm in '..\..\Lib\DockForm\fmBuildingCodeArmareaState\uBuildingAlarmConfirm.pas' {fmBuildingAlarmConfirm},
  uCCTV in '..\..\Lib\DockForm\fmCCTV\uCCTV.pas' {fmCCTV},
  uHitronCCTV in '..\..\Lib\DockForm\fmCCTV\uHitronCCTV.pas' {fmHitronCCTV},
  uSecurityEventConfirm in '..\..\Lib\DockForm\fmSecurityMonitoringEvent\uSecurityEventConfirm.pas' {fmSecurityEventConfirm},
  uPCComMonitoring in '..\..\Lib\DockForm\PCServerClient\fmPCComMonitoring\uPCComMonitoring.pas' {fmPCComMonitoring},
  uFormDevice in '..\..\Lib\DockForm\uFormDevice.pas' {dmFormDevice: TDataModule},
  uFormDeviceState in '..\..\Lib\DockForm\uFormDeviceState.pas' {DataModule2: TDataModule},
  uFormFunction in '..\..\Lib\DockForm\uFormFunction.pas' {dmFormFunction: TDataModule},
  uFormUtil in '..\..\Lib\DockForm\uFormUtil.pas' {dmFormUtil: TDataModule},
  uFormVariable in '..\..\Lib\DockForm\uFormVariable.pas',
  uFingerVariable in '..\..\Lib\FingerReader\uFingerVariable.pas',
  uSupremaFinger in '..\..\Lib\FingerReader\uSupremaFinger.pas' {dmSupremaFinger: TDataModule},
  uLogin in '..\..\Lib\Login\uLogin.pas' {fmLogin},
  uLoginVariable in '..\..\Lib\Login\uLoginVariable.pas',
  uEmployeeGrade in 'fmEmployeeGrade\uEmployeeGrade.pas' {fmEmployeeGrade},
  uRemoteControl in '..\..\Lib\DockForm\fmRemoteControl\uRemoteControl.pas' {fmRemoteControl},
  uSubForm in '..\..\Lib\Form\uSubForm.pas' {fmASubForm},
  uZoneMapMonitoring in 'fmMonitoring\fmZoneMapMonitoring\uZoneMapMonitoring.pas' {fmZoneMapMonitoring},
  uFoodReader in '..\..\Lib\Food\uFoodReader.pas' {dmFoodReader: TDataModule},
  uFoodMonitoring in 'fmMonitoring\fmFoodMonitoring\uFoodMonitoring.pas' {fmFoodMonitoring},
  uNameChange in 'fmNameChange\uNameChange.pas' {fmNameChange},
  uAttendReport in 'Report\fmAttendReport\uAttendReport.pas' {fmAttendReport},
  uAttendUpdate in 'Report\fmAttendManger\uAttendUpdate.pas' {fmAttendUpdate},
  uAttendEvent in '..\..\Lib\Attend\uAttendEvent.pas' {dmAttendEvent: TDataModule},
  uAttendSummary in 'Report\fmAttendSummary\uAttendSummary.pas' {fmAttendSummary},
  uBuildingMonitoring in 'fmMonitoring\fmBuildingMonitoring\uBuildingMonitoring.pas' {fmBuildingMonitoring},
  uComboBoxCodeLoad in '..\..\Lib\DockForm\uComboBoxCodeLoad.pas',
  uFoodStateReport in 'Report\fmFoodStateReport\uFoodStateReport.pas' {fmFoodStateReport},
  uCommonEvent in '..\..\Lib\Common\uCommonEvent.pas',
  uServerClientFunction in '..\..\Lib\MIAMSServer\uServerClientFunction.pas',
  uServerClientVariable in '..\..\Lib\MIAMSServer\uServerClientVariable.pas',
  uServerManager in 'fmServerManager\uServerManager.pas' {fmServerManager},
  uFireGroup in 'fmFireGroup\uFireGroup.pas' {fmFireGroup},
  uDeviceSetting in 'fmDeviceSetting\uDeviceSetting.pas' {fmDeviceSetting},
  uReaderPassword in 'fmReaderPassword\uReaderPassword.pas' {fmRederPassword},
  uNodeManager in 'fmNodeManager\uNodeManager.pas' {fmNodeManager},
  utelephoneOfficeManager in 'fmtelephoneOfficeManager\utelephoneOfficeManager.pas' {fmtelephoneOfficeManager},
  uReaderTelNumber in 'fmReaderTelNumber\uReaderTelNumber.pas' {fmRederTelNumber},
  uEmployeeCardCreate in 'fmEmployeeCardCreate\uEmployeeCardCreate.pas' {fmEmployeeCardCreate},
  uFoodGubun in '..\GMS_AFServer\fmFoodGubun\uFoodGubun.pas' {fmFoodGubun},
  uFoodReaderSetting in '..\GMS_AFServer\fmFoodReaderSetting\uFoodReaderSetting.pas' {fmFoodReaderSetting},
  uButtonEventReport in 'Report\fmButtonEventReport\uButtonEventReport.pas' {fmButtonEventReport},
  uAlarmEventReport in 'Report\fmAlarmEventReport\uAlarmEventReport.pas' {fmAlarmEventReport},
  uEmployee in 'fmEmployee\uEmployee.pas' {fmEmployee},
  uFPCardEmployee in 'fmFPCardEmployee\uFPCardEmployee.pas' {fmFPCardEmployee},
  uDBRelay in '..\..\Lib\DataBase\uDBRelay.pas' {dmDBRelay: TDataModule},
  uEmployeeRelay in '..\..\Lib\EmployeeRelay\uEmployeeRelay.pas' {dmEmployeeRelay: TDataModule},
  uCriticalForm in 'fmCriticalForm\uCriticalForm.pas' {fmCriticalForm},
  uAccessHisReport in 'Report\fmAccessHisReport\uAccessHisReport.pas' {fmAccessHisReport},
  uAccessReport in 'Report\fmAccessReport\uAccessReport.pas' {fmAccessReport},
  uFingerRegistDevice in 'fmEmployee\uFingerRegistDevice.pas' {fmFingerRegistDevice},
  FINGERAPI22 in '..\..\Lib\SHFPReader\FINGERAPI22.PAS',
  uSyFpReaderFunction in '..\..\Lib\SHFPReader\uSyFpReaderFunction.pas',
  uFingerReaderSetting in 'fmFingerReaderSetting\uFingerReaderSetting.pas' {fmFingerReaderSetting},
  uDoorSelect in 'fmFingerReaderSetting\uDoorSelect.pas' {fmDoorSelect},
  uAntiGroupCode in 'fmAntiPassGroup\uAntiGroupCode.pas' {fmAntiGroupcode},
  uFinger in 'fmEmployee\uFinger.pas' {fmFinger},
  uCompanyGrade in 'fmCompanyGrade\uCompanyGrade.pas' {fmCompanyGrade},
  uPermitReSend in 'fmPermitReSend\uPermitReSend.pas' {fmPermitReSend},
  uDoorOpenAlarmDoorSetting in 'fmClientConfig\uDoorOpenAlarmDoorSetting.pas' {fmDoorOpenAlarmDoorSetting},
  uSHFingerDeviceReg in 'fmEmployee\uSHFingerDeviceReg.pas' {fmSHFingerDeviceReg},
  uSHFDBRelay in '..\..\Lib\SHFPReader\uSHFDBRelay.pas' {dmSHFDBRelay: TDataModule},
  uCardManagementReport in 'Report\fmCardManagementReport\uCardManagementReport.pas' {fmCardManagementReport},
  uEmployeeHisReport in 'Report\fmEmployeeHisReport\uEmployeeHisReport.pas' {fmEmployeeHisReport},
  uSHFReaderServer in '..\..\Lib\SHFPReader\uSHFReaderServer.pas' {dmSHFReaderServer: TDataModule},
  uSHFingerRegistDevice in '..\..\Lib\SHFPReader\fmSHFingerRegistDevice\uSHFingerRegistDevice.pas' {fmSHFingerRegistDevice},
  uMonitoring in 'fmMonitoring\uMonitoring.pas' {fmMonitoring},
  uDoorManagementReport in 'Report\fmDoorManagementReport\uDoorManagementReport.pas' {fmDoorManagementReport},
  uArmArea in 'fmArmArea\uArmArea.pas' {fmArmArea},
  uAlarmStateCode in 'fmAlarmStateCode\uAlarmStateCode.pas' {fmAlarmStateCode},
  uArmAreaMapAdmin in 'fmArmAreaMapAdmin\uArmAreaMapAdmin.pas' {fmArmAreaMapAdmin},
  uMapMonitoring in 'fmMonitoring\uMapMonitoring.pas' {fmMapMonitoring},
  uAttendFomat in 'fmClientConfig\uAttendFomat.pas' {fmAttendFomat},
  uRelayFilecreate in 'fmRelayFilecreate\uRelayFilecreate.pas' {fmRelayFilecreate};

{$R *.res}
{$R manifest.RES}     //SG��û

var
  ini_fun : TiniFile;

begin
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Config.INI');
    G_nProgramType := ini_fun.ReadInteger('PROGRAM','TYPE',0);
    G_nMonitoringType := ini_fun.ReadInteger('MONITORING','TYPE',1);
  Finally
    ini_fun.Free;
  End;

  Application.Initialize;
  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  Application.CreateForm(TdmComPort, dmComPort);
  Application.CreateForm(TdmDataBase, dmDataBase);
  Application.CreateForm(TdmDBCardPermit, dmDBCardPermit);
  Application.CreateForm(TdmDBRelay, dmDBRelay);
  Application.CreateForm(TdmSHFDBRelay, dmSHFDBRelay);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmAttendFomat, fmAttendFomat);
  Application.CreateForm(TfmRelayFilecreate, fmRelayFilecreate);
  Application.Run;
end.