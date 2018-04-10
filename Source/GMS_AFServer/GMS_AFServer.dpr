program GMS_AFServer;

uses
  Vcl.Forms,
  System.SysUtils,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uCommonFunction in '..\..\Lib\Common\uCommonFunction.pas',
  uCommonVariable in '..\..\Lib\Common\uCommonVariable.pas',
  uDataBase in '..\..\Lib\DataBase\uDataBase.pas' {dmDataBase: TDataModule},
  uDataBaseConfig in '..\..\Lib\DataBase\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDBAlter in '..\..\Lib\DataBase\uDBAlter.pas' {dmDBAlter: TDataModule},
  uDBCreate in '..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uDBFormMessage in '..\..\Lib\DataBase\uDBFormMessage.pas' {dmFormMessage: TDataModule},
  uDBFormName in '..\..\Lib\DataBase\uDBFormName.pas' {dmFormName: TDataModule},
  uDBFunction in '..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  uDBInsert in '..\..\Lib\DataBase\uDBInsert.pas' {dmDBInsert: TDataModule},
  uSolarLunar in '..\..\Lib\Date\uSolarLunar.pas',
  uDeviceFunction in '..\..\Lib\Device\uDeviceFunction.pas' {dmDeviceFunction: TDataModule},
  uDeviceVariable in '..\..\Lib\Device\uDeviceVariable.pas',
  uFormVariable in '..\..\Lib\Form\uFormVariable.pas',
  uLoginVariable in '..\..\Lib\Login\uLoginVariable.pas',
  uDBSelect in '..\..\Lib\DataBase\uDBSelect.pas' {dmDBSelect: TDataModule},
  uDBUpdate in '..\..\Lib\DataBase\uDBUpdate.pas' {dmDBUpdate: TDataModule},
  uAttendEvent in '..\..\Lib\Attend\uAttendEvent.pas' {dmAttendEvent: TDataModule},
  uSubForm in '..\..\Lib\Form\uSubForm.pas' {fmASubForm},
  uFoodReaderSetting in 'fmFoodReaderSetting\uFoodReaderSetting.pas' {fmFoodReaderSetting},
  uDBDelete in '..\..\Lib\DataBase\uDBDelete.pas' {dmDBDelete: TDataModule},
  uComboBoxCodeLoad in '..\..\Lib\Form\uComboBoxCodeLoad.pas',
  uConfigSetting in 'fmConfigSetting\uConfigSetting.pas' {fmConfigSetting},
  uATReaderSetting in 'fmATReaderSetting\uATReaderSetting.pas' {fmATReaderSetting},
  uFoodGubun in 'fmFoodGubun\uFoodGubun.pas' {fmFoodGubun},
  uFormFunction in '..\..\Lib\DockForm\uFormFunction.pas' {dmFormFunction: TDataModule},
  uATReSummary in 'fmATReSummary\uATReSummary.pas' {fmAtResummery},
  uDBCardPermit in '..\..\Lib\DataBase\uDBCardPermit.pas' {dmDBCardPermit: TDataModule},
  uEmployeeRelay in '..\..\Lib\EmployeeRelay\uEmployeeRelay.pas' {dmEmployeeRelay: TDataModule},
  uFoodType in 'fmFoodType\uFoodType.pas' {fmFoodType},
  uCommonEvent in '..\..\Lib\Common\uCommonEvent.pas',
  uDBRelay in '..\..\Lib\DataBase\uDBRelay.pas' {dmDBRelay: TDataModule},
  uDBFingerRelay in '..\..\Lib\DataBase\uDBFingerRelay.pas' {dmFingerDBRelay: TDataModule};

{$R *.res}
{$R manifest.RES}

begin
  Application.Initialize;
  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDataBase, dmDataBase);
  Application.CreateForm(TdmDBRelay, dmDBRelay);
  Application.CreateForm(TdmEmployeeRelay, dmEmployeeRelay);
  Application.CreateForm(TdmDBCardPermit, dmDBCardPermit);
  Application.CreateForm(TdmDBRelay, dmDBRelay);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmFingerDBRelay, dmFingerDBRelay);
  Application.Run;
end.