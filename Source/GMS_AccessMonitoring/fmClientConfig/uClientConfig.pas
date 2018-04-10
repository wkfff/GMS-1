unit uClientConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  ComCtrls, DB, ADODB,WinSpool, ExtCtrls,ActiveX, uSubForm, CommandArray,
  System.IniFiles, AdvPanel, FindFile, AdvCombo, Vcl.MPlayer, AdvToolBar,
  AdvToolBarStylers, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficeButtons,
  AdvAppStyler,AdvStyleIF, Vcl.Imaging.pngimage, AdvGlowButton, AdvGroupBox;

type
  TfmClientConfig = class(TfmASubForm)
    RzOpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    AlarmTab: TTabSheet;
    gb_AlarmConfig: TGroupBox;
    lb_AlarmFile: TLabel;
    chk_PTAlarm: TCheckBox;
    MonitoringTab: TTabSheet;
    gb_monitoring: TGroupBox;
    lb_MonitoringStart: TLabel;
    lb_MonitoringType: TLabel;
    cmb_LoginStart: TComboBox;
    chk_PTMessage: TCheckBox;
    fdmsADOQuery: TADOQuery;
    tab_regPort: TTabSheet;
    lb_cardPort: TLabel;
    cmb_Comport: TComboBox;
    cmb_MonitorType: TComboBox;
    lb_AlarmCount: TLabel;
    ed_AlarmSoundCount: TEdit;
    lb_cnt: TLabel;
    FindFile: TFindFile;
    cmb_AlarmFile: TAdvComboBox;
    btn_Play: TSpeedButton;
    MediaPlayer1: TMediaPlayer;
    lb_RegCardType: TLabel;
    cmb_RegType: TComboBox;
    ed_FingerIP: TEdit;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    chk_BuildingView: TAdvOfficeCheckBox;
    TabAccess: TTabSheet;
    gb_AccessEvent: TGroupBox;
    lb_AccessAlarmFile: TLabel;
    lb_AccessAlarmCount: TLabel;
    lb_AccessAlarmCnt: TLabel;
    btn_AccessAlarmPlay: TSpeedButton;
    ed_AccessSoundCount: TEdit;
    cmb_AccessAlarmFile: TAdvComboBox;
    chk_CardMode: TAdvOfficeCheckBox;
    TabSheet1: TTabSheet;
    AdvFormStyler1: TAdvFormStyler;
    Label6: TLabel;
    cmb_FormStyle: TComboBox;
    btn_Save: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    rg_MonitoringType: TAdvOfficeRadioGroup;
    Tab_Report: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmb_ReportStart: TComboBox;
    lb_buildingDeep: TLabel;
    cmb_buildingStep: TComboBox;
    ed_FingerPort: TEdit;
    chk_DoorStateUse: TAdvOfficeCheckBox;
    chk_AlarmUse: TAdvOfficeCheckBox;
    chk_AccessMessage: TAdvOfficeCheckBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btn_BuildingMapPositionClick(Sender: TObject);
    procedure FindFileFileMatch(Sender: TObject; const FileInfo: TFileDetails);
    procedure btn_PlayClick(Sender: TObject);
    procedure cmb_RegTypeChange(Sender: TObject);
    procedure cmb_MonitorTypeChange(Sender: TObject);
    procedure btn_AccessAlarmPlayClick(Sender: TObject);
  private
    L_bActive : Boolean;
    EmpTypeCodeList : TStringList;
    ComPortList : TStringList;
    { Private declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;

    procedure AlarmSoundFileSearch;
    procedure FontSetting;
    procedure FormNameSetting;
  public
    { Public declarations }
  end;

var
  fmClientConfig: TfmClientConfig;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDBUpdate,
  uFormFunction,
  uFormVariable,
  uFormUtil,
  uMain;

{$R *.dfm}

procedure TfmClientConfig.AlarmSoundFileSearch;
var
  stDir : string;
begin
  cmb_AlarmFile.Items.Clear;
  cmb_AccessAlarmFile.Items.Clear;
  stDir := G_stExeFolder + '\..\sound\';
  // Sets FileFile properties
  FindFile.Threaded := False;
  // - Name & Location
  with FindFile.Criteria.Files do
  begin
    FileName := '*.*';
    Location := stDir;
    Subfolders := False;
  end;
  // Begins search
  FindFile.Execute;
  cmb_AlarmFile.Sorted := True;
  cmb_AccessAlarmFile.Sorted := True;
end;

procedure TfmClientConfig.btn_AccessAlarmPlayClick(Sender: TObject);
begin
  inherited;
  if FileExists(G_stExeFolder + '\..\sound\' + cmb_AccessAlarmFile.Text) then
  begin
    btn_AccessAlarmPlay.enabled := False;
    MediaPlayer1.FileName := G_stExeFolder + '\..\sound\' + cmb_AccessAlarmFile.Text;
    try
      MediaPlayer1.Open;
      //MediaPlayer1.Stop;
      MediaPlayer1.Play;
      while Not ( (MediaPlayer1.NotifyValue = nvSuccessful) and (MediaPlayer1.Mode = mpStopped) )  do
      begin
        Application.ProcessMessages;
      end;
    finally
      btn_AccessAlarmPlay.enabled := True;
      MediaPlayer1.Close;
    end;
  end;

end;

procedure TfmClientConfig.btn_BuildingMapPositionClick(Sender: TObject);
begin
  inherited;
{  fmBuildingMapPosition := TfmBuildingMapPosition.create(self);
  fmBuildingMapPosition.BuildingICONWidth := ed_BuildingICON_W.Text;
  fmBuildingMapPosition.BuildingICONHeight := ed_BuildingICON_H.Text;
  fmBuildingMapPosition.BuildingMapFile := ed_BuildingMapFile.Text;
  fmBuildingMapPosition.ShowModal;
  fmBuildingMapPosition.Free;
}
end;

procedure TfmClientConfig.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmClientConfig.btn_PlayClick(Sender: TObject);
begin
  inherited;
  if FileExists(G_stExeFolder + '\..\sound\' + cmb_AlarmFile.Text) then
  begin
    MediaPlayer1.FileName := G_stExeFolder + '\..\sound\' + cmb_AlarmFile.Text;
    Try
      btn_Play.enabled := False;
      MediaPlayer1.Open;
      MediaPlayer1.Play;
      while Not ( (MediaPlayer1.NotifyValue = nvSuccessful) and (MediaPlayer1.Mode = mpStopped) )  do
      begin
        Application.ProcessMessages;
      end;
    Finally
      btn_Play.enabled := True;
      MediaPlayer1.Close;
    End;
  end;
end;

procedure TfmClientConfig.btn_SaveClick(Sender: TObject);
var
  nComPort : integer;
  stWorkStartTime : string;
  stWorkEndTime : string;
  chkBox : TCheckBox;
  i : integer;
  ini_fun : TiniFile;
  nCount : integer;
begin
  nComPort := 0;
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\ACCMonitoring.INI');
    with ini_fun do
    begin
      if chk_AlarmUse.checked then
      begin
        WriteString('Config','AccessAlarmEventSound','Y');
        G_bAccessAlarmEventSoundOnUse := True;
      end else
      begin
        WriteString('Config','AccessAlarmEventSound','N');
        G_bAccessAlarmEventSoundOnUse := False;
      end;
      if chk_AccessMessage.checked then
      begin
        WriteString('Config','AccessMessage','Y');
        G_bAccessEventMessageUse := True;
      end else
      begin
        WriteString('Config','AccessMessage','N');
        G_bAccessEventMessageUse := False;
      end;


      if chk_PTAlarm.Checked then
      begin
        WriteString('Config','AlarmEventSound','Y');
        G_bAlarmEventSoundOnUse := True;
      end else
      begin
        WriteString('Config','AlarmEventSound','N');
        G_bAlarmEventSoundOnUse := False;
      end;
      if chk_PTMessage.Checked then
      begin
        WriteString('Config','AlarmMessage','Y');
        G_bAlarmEventMessageUse := True;
      end else
      begin
        WriteString('Config','AlarmMessage','N');
        G_bAlarmEventMessageUse := False;
      end;
      WriteString('Config','AlarmEventFile',cmb_AlarmFile.Text);
      G_stAlarmEventAlaramFile := cmb_AlarmFile.Text;
      nCount := 1;
      if isDigit(ed_AlarmSoundCount.Text) then nCount := strtoint(ed_AlarmSoundCount.Text);
      if nCount < 0 then nCount := 1;
      WriteInteger('Config','AlarmCount',nCount);
      G_nAlarmSoundCount := nCount;

      WriteString('Config','AccessAlarmFile',cmb_AccessAlarmFile.Text);
      G_stAccessEventAlaramFile := cmb_AccessAlarmFile.Text;
      nCount := 1;
      if isDigit(ed_AccessSoundCount.Text) then nCount := strtoint(ed_AccessSoundCount.Text);
      if nCount < 0 then nCount := 1;
      WriteInteger('Config','AccessAlarmCount',nCount);
      G_nAccessSoundCount := nCount;

      if chk_CardMode.Checked then
      begin
        WriteInteger('Config','CardManageModeView',1);
        G_bCardModeShow := True;
      end else
      begin
        WriteInteger('Config','CardManageModeView',0);
        G_bCardModeShow := False;
      end;

      WriteInteger('Config','LoginMonitorStart',cmb_LoginStart.ItemIndex);
      G_nMoitorLoginStart := cmb_LoginStart.ItemIndex;
      WriteInteger('Config','Monitoring',cmb_MonitorType.ItemIndex);
      G_nMonitorGubun := cmb_MonitorType.ItemIndex;
      if chk_BuildingView.Checked then
      begin
        WriteInteger('Config','BuildingSearch',1);
        G_bBuildingMonitoringShow := True;
      end else
      begin
        WriteInteger('Config','BuildingSearch',0);
        G_bBuildingMonitoringShow := False;
      end;
      if rg_MonitoringType.ItemIndex = 0 then
      begin
        G_bAlarmMonitoringUse := True;
        G_bAccessMonitoringUse := True;
      end else if rg_MonitoringType.ItemIndex = 1 then
      begin
        G_bAccessMonitoringUse := True;
        G_bAlarmMonitoringUse := False;
      end else if rg_MonitoringType.ItemIndex = 2 then
      begin
        G_bAlarmMonitoringUse := True;
        G_bAccessMonitoringUse := False;
      end;
      WriteInteger('Config','ACPTType',rg_MonitoringType.ItemIndex);
      if chk_DoorStateUse.Checked then G_nDoorStateUse := 1
      else G_nDoorStateUse := 0;
      WriteInteger('Config','DOORSTATEUSE',G_nDoorStateUse);

      WriteInteger('Config','CardRegType',cmb_RegType.ItemIndex);
      G_nCardRegisterType := cmb_RegType.ItemIndex;
      WriteString('Config','CardRegIP',ed_FingerIP.Text);
      G_stCardRegisterIP := ed_FingerIP.Text;
      WriteString('Config','CardFingerRegPort',ed_FingerPort.Text);
      G_stCardRegisterFingerPort := ed_FingerPort.Text;
      if ComPortList.Count > 0 then
      begin
        if cmb_ComPort.ItemIndex > -1 then
        begin
          if cmb_ComPort.ItemIndex = 0 then nComPort := 0
          else
          begin
            nComPort := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex - 1]);
          end;
          WriteInteger('Config','CardRegPort',nComPort);
          G_nCardRegisterPort := nComPort;
        end;
      end;
      WriteInteger('Config','Building',cmb_buildingStep.ItemIndex + 1);
      G_nBuildingStep := cmb_buildingStep.ItemIndex + 1;


    end;
  Finally
    ini_fun.free;
  End;
  G_nReportSearchType := cmb_ReportStart.ItemIndex + 1;
  dmDBUpdate.UpdateTB_CONFIG_Field_StringValue('REPORT','SEARCHTYPE','CO_CONFIGVALUE',inttostr(G_nReportSearchType));;
  Close;
end;

procedure TfmClientConfig.cmb_MonitorTypeChange(Sender: TObject);
begin
  inherited;
  if (cmb_MonitorType.ItemIndex = 1) then
  begin
    chk_BuildingView.Visible := True;
//    lb_buildingDeep.Visible := True;
//    cmb_buildingStep.Visible := True;
  end else
  begin
    chk_BuildingView.Visible := False;
//    lb_buildingDeep.Visible := False;
//    cmb_buildingStep.Visible := False;
  end;

end;

procedure TfmClientConfig.cmb_RegTypeChange(Sender: TObject);
begin
  inherited;
  if cmb_RegType.ItemIndex = 0 then
  begin
    lb_cardPort.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGCARDPORT');
    cmb_Comport.Visible := True;
    ed_FingerIP.Visible := False;
    ed_FingerPort.Visible := False;
  end else if cmb_RegType.ItemIndex = 1 then
  begin
    lb_cardPort.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGCARDIP');
    cmb_Comport.Visible := False;
    ed_FingerIP.Visible := True;
    ed_FingerPort.Visible := True;
    ed_FingerIP.Left := cmb_Comport.Left;
  end;
end;

procedure TfmClientConfig.FormCreate(Sender: TObject);
var
  nCount : integer;
  i : integer;
  stComPort : string;
  nIndex : integer;
  chkBox : TCheckBox;
  ini_fun : TiniFile;
begin

  AlarmSoundFileSearch;
  EmpTypeCodeList := TStringList.Create;
  FormNameSetting;

  chk_AlarmUse.checked := G_bAccessAlarmEventSoundOnUse;
  chk_AccessMessage.Checked := G_bAccessEventMessageUse;
  chk_PTAlarm.Checked := G_bAlarmEventSoundOnUse;
  chk_PTMessage.Checked := G_bAlarmEventMessageUse;
  nIndex := cmb_AlarmFile.Items.IndexOf(G_stAlarmEventAlaramFile);
  cmb_AlarmFile.ItemIndex := nIndex;
  ed_AlarmSoundCount.Text := inttostr(G_nAlarmSoundCount);
  nIndex := cmb_AccessAlarmFile.Items.IndexOf(G_stAccessEventAlaramFile);
  cmb_AccessAlarmFile.ItemIndex := nIndex;
  ed_AccessSoundCount.Text := inttostr(G_nAccessSoundCount);
  cmb_LoginStart.ItemIndex := G_nMoitorLoginStart;
  cmb_MonitorType.ItemIndex := G_nMonitorGubun;
  cmb_MonitorTypeChange(self);
  cmb_RegType.ItemIndex := G_nCardRegisterType;
  cmb_RegTypeChange(self);
  ed_FingerIP.Text := G_stCardRegisterIP;

  ed_FingerPort.Text := G_stCardRegisterFingerPort;
  cmb_ReportStart.ItemIndex := G_nReportSearchType - 1;
  cmb_buildingStep.ItemIndex := G_nBuildingStep - 1;

  ComPortList := TStringList.Create;
  ComPortList.Clear;
  if G_bBuildingMonitoringShow then chk_BuildingView.Checked := True
  else chk_BuildingView.Checked := False;

  if G_bAlarmMonitoringUse then
  begin
    if G_bAccessMonitoringUse then rg_MonitoringType.ItemIndex := 0
    else rg_MonitoringType.ItemIndex := 2;
  end
  else rg_MonitoringType.ItemIndex := 1;

  if G_bCardModeShow then chk_CardMode.Checked := True
  else chk_CardMode.Checked := False;

  if G_nDoorStateUse = 1 then chk_DoorStateUse.Checked := True
  else chk_DoorStateUse.Checked := False;


  nCount := GetSerialPortList(ComPortList,False);
  cmb_ComPort.Clear;
  cmb_ComPort.Items.add('Not Use');
  cmb_ComPort.ItemIndex := -1;
  if nCount = 0 then
  begin
    Exit;
  end;

  for i:= 0 to nCount - 1 do
  begin
    cmb_ComPort.items.Add(ComPortList.Strings[i])
  end;
  if G_nCardRegisterPort > 0 then
  begin
    stComPort := EncodeCommportName(G_nCardRegisterPort);
    nIndex := cmb_ComPort.Items.IndexOf(stComPort);
    if nIndex > -1 then cmb_ComPort.ItemIndex := nIndex;
  end else
    cmb_ComPort.ItemIndex := 0;

  FontSetting;
end;

procedure TfmClientConfig.FormNameSetting;
begin
  Caption := dmFormFunction.GetFormName('2','1','BM6_02');
  AlarmTab.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGALARMSET');
  gb_AlarmConfig.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGALARM');
  chk_PTAlarm.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGALARMEVENT');
  chk_PTMessage.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGZONEDETECTION');
  lb_AlarmFile.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGALARMFILE');
  lb_AlarmCount.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGALARMCOUNT');
  lb_cnt.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGALARMCNTTXT');

  TabAccess.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGACCESSSET');
  gb_AccessEvent.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGACCESSEVENT');
  lb_AccessAlarmFile.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGALARMFILE');
  lb_AccessAlarmCount.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGALARMCOUNT');
  lb_AccessAlarmCnt.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGALARMCNTTXT');
  chk_CardMode.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGCARDMODE');
  lb_MonitoringStart.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGLOGINSTART');
  lb_MonitoringType.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGMONITORTYPE');
  lb_MonitoringType.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGMONITORTYPE');
  chk_BuildingView.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGBUILDINGVIEW');
  lb_RegCardType.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGCARDTYPE');
  lb_cardPort.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGCARDPORT');

  MonitoringTab.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGMONISET');
  gb_monitoring.Caption := dmFormFunction.GetFormName('0','2','COMMOCONGIG');
  lb_MonitoringStart.Caption := dmFormFunction.GetFormName('0','2','COMLOGINMONISTART');
  lb_MonitoringType.Caption := dmFormFunction.GetFormName('0','2','COMMONITYPE');
  cmb_LoginStart.Items.Clear;
  cmb_LoginStart.Items.Add(dmFormFunction.GetFormName('0','2','COMMONIAUTOSTART'));
  cmb_LoginStart.Items.Add(dmFormFunction.GetFormName('0','2','COMMONINOTSTART'));
  cmb_MonitorType.items.Clear;
  cmb_MonitorType.Items.Add('0.' + dmFormFunction.GetFormName('0','2','COMMONMONITORING'));
  cmb_MonitorType.Items.Add('1.' + dmFormFunction.GetFormName('0','2','COMMONMAPMONITORING'));

  tab_regPort.Caption := dmFormFunction.GetFormName('0','2','COMCONFIGREGPORTSET');


  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Close.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
end;

procedure TfmClientConfig.FindFileFileMatch(Sender: TObject;
  const FileInfo: TFileDetails);
begin
  inherited;
  cmb_AlarmFile.Items.Add(FileInfo.Name);
  cmb_AccessAlarmFile.Items.Add(FileInfo.Name);
end;

procedure TfmClientConfig.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmClientConfig.FormActivate(Sender: TObject);
begin
  inherited;
  if L_bActive then Exit;
  L_bActive := True;

  PageControl1.ActivePageIndex := 1;
end;

procedure TfmClientConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EmpTypeCodeList.Free;
  ComPortList.Free;
end;

function TfmClientConfig.DecodeCommportName(PortName: String): WORD;
var
 Pt : Integer;
begin
 PortName := UpperCase(PortName);
 if (Copy(PortName, 1, 3) = 'COM') then begin
    Delete(PortName, 1, 3);
    Pt := Pos(':', PortName);
    if Pt = 0 then Result := 0
       else Result := StrToInt(Copy(PortName, 1, Pt-1));
 end
 else if (Copy(PortName, 1, 7) = '\\.\COM') then begin
    Delete(PortName, 1, 7);
    Result := StrToInt(PortName);
 end
 else Result := 0;

end;

function TfmClientConfig.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

function TfmClientConfig.GetSerialPortList(List: TStringList;
  const doOpenTest: Boolean): LongWord;
type
 TArrayPORT_INFO_1 = array[0..0] Of PORT_INFO_1;
 PArrayPORT_INFO_1 = ^TArrayPORT_INFO_1;
var
{$IF USE_ENUMPORTS_API}
 PL : PArrayPORT_INFO_1;
 TotalSize, ReturnCount : LongWord;
 Buf : String;
 CommNum : WORD;
{$IFEND}
 I : LongWord;
 CHandle : THandle;
begin
 List.Clear;
{$IF USE_ENUMPORTS_API}
 EnumPorts(nil, 1, nil, 0, TotalSize, ReturnCount);
 if TotalSize < 1 then begin
    Result := 0;
    Exit;
    end;
 GetMem(PL, TotalSize);
 EnumPorts(nil, 1, PL, TotalSize, TotalSize, Result);

 if Result < 1 then begin
    FreeMem(PL);
    Exit;
    end;

 for I:=0 to Result-1 do begin
    Buf := UpperCase(PL^[I].pName);
    CommNum := DecodeCommportName(PL^[I].pName);
    if CommNum = 0 then Continue;
    List.AddObject(EncodeCommportName(CommNum), Pointer(CommNum));
    end;
{$ELSE}
 for I:=1 to 255 do List.AddObject(EncodeCommportName(I), Pointer(I));
{$IFEND}
 // Open Test
 if List.Count > 0 then for I := List.Count-1 downto 0 do begin
    CHandle := CreateFile(PChar(List[I]), GENERIC_WRITE or GENERIC_READ,
     0, nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL,
     0);
    if CHandle = INVALID_HANDLE_VALUE then begin
if doOpenTest or (GetLastError() <> ERROR_ACCESS_DENIED) then List.Delete(I);
Continue;
end;
    CloseHandle(CHandle);
    end;

 Result := List.Count;
{$IF USE_ENUMPORTS_API}
 if Assigned(PL) then FreeMem(PL);
{$IFEND}

end;


end.