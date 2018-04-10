﻿unit uDeviceSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSubForm, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, CommandArray, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, AdvSmoothLabel, AdvSmoothPanel, W7Classes,
  W7Panels, AdvGlassButton,ADODB,ActiveX, frmshape, Vcl.Mask, AdvSpin,
  DBAdvSmoothLabel, AdvSmoothProgressBar, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ImgList, AdvSplitter, AdvGroupBox, Vcl.Imaging.pngimage, Vcl.Menus,
  AdvPageControl, AdvOfficeButtons, AdvGlowButton, AdvOfficePager, AdvAppStyler,
  AdvOfficePagerStylers, AdvEdBtn;

const
  con_DeviceUseImageIndex = 0;
  con_DeviceNotUseImageIndex = 1;
  con_ArmAreaImageIndex = 7;
  con_ArmAreaDisImageIndex = 8;
  con_DoorImageIndex = 3;
  con_DoorDisImageIndex = 9;
  con_CardReaderUseImageIndex = 4;
  con_CardReaderNotUseImageIndex = 5;
  con_ZoneImageIndex = 6;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmDeviceSetting = class(TfmASubForm)
    MenuImageList16: TImageList;
    tv_List: TTreeView;
    tv_Code: TTreeView;
    AdvSplitter1: TAdvSplitter;
    lb_NodeName: TAdvSmoothLabel;
    ed_NodeName: TAdvEdit;
    ed_NodeNo: TAdvEdit;
    gb_IconState: TAdvGroupBox;
    Image1: TImage;
    Image2: TImage;
    lb_UseControl: TLabel;
    lb_NotUseControl: TLabel;
    Image3: TImage;
    lb_ExArmArea: TLabel;
    Image4: TImage;
    lb_ExDoor: TLabel;
    Image5: TImage;
    Label5: TLabel;
    Image6: TImage;
    Label6: TLabel;
    Tv_Node: TTreeView;
    tv_State: TTreeView;
    Label7: TLabel;
    Image7: TImage;
    pm_CardReader: TPopupMenu;
    mn_CardReaderUse: TMenuItem;
    mn_CardReaderNotUse: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    mn_CardReaderDoorInPosition: TMenuItem;
    mn_CardReaderDoorOutPosition: TMenuItem;
    N5: TMenuItem;
    mn_CardReaderBuildingInPosition: TMenuItem;
    mn_CardReaderBuildingOutPosition: TMenuItem;
    N8: TMenuItem;
    mn_CardReaderCommonType: TMenuItem;
    mn_CardReaderFingerType: TMenuItem;
    pm_port: TPopupMenu;
    N3: TMenuItem;
    mn_ZoneType0: TMenuItem;
    mn_ZoneType1: TMenuItem;
    mn_ZoneType2: TMenuItem;
    mn_ZoneType3: TMenuItem;
    mn_ZoneType4: TMenuItem;
    mn_ZoneType5: TMenuItem;
    mn_ZoneType6: TMenuItem;
    N4: TMenuItem;
    mn_ZoneDelay0: TMenuItem;
    mn_ZoneDelay1: TMenuItem;
    N6: TMenuItem;
    mn_ZoneRecovery0: TMenuItem;
    mn_ZoneRecovery1: TMenuItem;
    mn_ZoneArmArea: TMenuItem;
    mn_ZoneArmArea1: TMenuItem;
    mn_ZoneArmArea2: TMenuItem;
    mn_ZoneArmArea3: TMenuItem;
    mn_ZoneArmArea4: TMenuItem;
    mn_ZoneArmArea5: TMenuItem;
    mn_ZoneArmArea6: TMenuItem;
    mn_ZoneArmArea7: TMenuItem;
    mn_ZoneArmArea8: TMenuItem;
    pm_Door: TPopupMenu;
    N9: TMenuItem;
    mn_controltime0: TMenuItem;
    mn_controltime1: TMenuItem;
    mn_controltime2: TMenuItem;
    mn_controltime3: TMenuItem;
    N7: TMenuItem;
    mn_longopenEventTime0: TMenuItem;
    mn_longopenEventTime1: TMenuItem;
    mn_longopenEventTime2: TMenuItem;
    mn_longopenEventTime3: TMenuItem;
    mn_LongOpenAlarmSound: TMenuItem;
    mn_LongOpenAlarmSound0: TMenuItem;
    mn_LongOpenAlarmSound1: TMenuItem;
    mn_Schedule: TMenuItem;
    mn_Schedule0: TMenuItem;
    mn_Schedule1: TMenuItem;
    N18: TMenuItem;
    mn_FireOpen0: TMenuItem;
    mn_FireOpen1: TMenuItem;
    N21: TMenuItem;
    mn_LockType0: TMenuItem;
    mn_LockType1: TMenuItem;
    mn_LockType2: TMenuItem;
    mn_LockType3: TMenuItem;
    mn_DoorOpenState: TMenuItem;
    mn_DoorOpenState0: TMenuItem;
    mn_DoorOpenState1: TMenuItem;
    mn_DsCheck: TMenuItem;
    mn_DsCheck0: TMenuItem;
    mn_DsCheck1: TMenuItem;
    mn_ArmDSCheck: TMenuItem;
    mn_ArmDSCheck0: TMenuItem;
    mn_ArmDSCheck1: TMenuItem;
    mn_Javara: TMenuItem;
    mn_JavaraArmClose: TMenuItem;
    mn_JavaraAutoClose: TMenuItem;
    pm_device: TPopupMenu;
    pg_DeviceSetting: TAdvPageControl;
    tb_MainSetting: TAdvTabSheet;
    tb_ArmExtentionSkill: TAdvTabSheet;
    GroupBox32: TGroupBox;
    Label52: TLabel;
    cmb_ArmExtensionSelect: TComboBox;
    pan_ArmExtension: TPanel;
    pan_ArmExtensionMessage: TPanel;
    Group_MainToLocalDevice: TGroupBox;
    chk_ArmExtension00: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    CheckBox42: TCheckBox;
    CheckBox43: TCheckBox;
    CheckBox44: TCheckBox;
    CheckBox45: TCheckBox;
    CheckBox46: TCheckBox;
    CheckBox47: TCheckBox;
    CheckBox48: TCheckBox;
    CheckBox49: TCheckBox;
    CheckBox50: TCheckBox;
    CheckBox51: TCheckBox;
    CheckBox52: TCheckBox;
    CheckBox53: TCheckBox;
    CheckBox54: TCheckBox;
    CheckBox55: TCheckBox;
    CheckBox56: TCheckBox;
    CheckBox57: TCheckBox;
    CheckBox58: TCheckBox;
    CheckBox59: TCheckBox;
    CheckBox60: TCheckBox;
    CheckBox61: TCheckBox;
    CheckBox66: TCheckBox;
    CheckBox69: TCheckBox;
    CheckBox70: TCheckBox;
    CheckBox71: TCheckBox;
    Group_MainToLocalAll: TGroupBox;
    chkMainToLocal1: TCheckBox;
    CheckBox103: TCheckBox;
    CheckBox104: TCheckBox;
    CheckBox105: TCheckBox;
    CheckBox106: TCheckBox;
    CheckBox107: TCheckBox;
    CheckBox108: TCheckBox;
    chkAllMainToLocal: TCheckBox;
    mn_Door2: TMenuItem;
    mn_Door2NotUse: TMenuItem;
    mn_AlarmRelay: TMenuItem;
    mn_ArmRelay: TMenuItem;
    N13: TMenuItem;
    mn_AcWatchOff: TMenuItem;
    mn_AcWatchON: TMenuItem;
    mn_ArmDelayTime: TMenuItem;
    mn_ArmDelayTime0: TMenuItem;
    mn_ArmDelayTime2: TMenuItem;
    mn_ArmDelayTime1: TMenuItem;
    mn_JaejungDelay: TMenuItem;
    mn_JaejungDelay0: TMenuItem;
    mn_JaejungDelay1: TMenuItem;
    mn_ArmArea: TMenuItem;
    mn_ArmArea0: TMenuItem;
    mn_ArmArea1: TMenuItem;
    mn_ArmRelayType: TMenuItem;
    mn_ArmRelayType0: TMenuItem;
    mn_ArmRelayType1: TMenuItem;
    mn_ExtendUse: TMenuItem;
    mn_ExtendUse1: TMenuItem;
    mn_ExtendUse2: TMenuItem;
    mn_ExtendUse3: TMenuItem;
    mn_ExtendUse4: TMenuItem;
    mn_ExtendUse5: TMenuItem;
    mn_ExtendUse6: TMenuItem;
    mn_ExtendUse7: TMenuItem;
    mn_ExtendUse8: TMenuItem;
    mn_ExtendUse10: TMenuItem;
    mn_ExtendUse11: TMenuItem;
    mn_ExtendUse12: TMenuItem;
    mn_ExtendUse20: TMenuItem;
    mn_ExtendUse21: TMenuItem;
    mn_ExtendUse22: TMenuItem;
    mn_ExtendUse30: TMenuItem;
    mn_ExtendUse31: TMenuItem;
    mn_ExtendUse32: TMenuItem;
    mn_ExtendUse40: TMenuItem;
    mn_ExtendUse41: TMenuItem;
    mn_ExtendUse42: TMenuItem;
    mn_ExtendUse50: TMenuItem;
    mn_ExtendUse51: TMenuItem;
    mn_ExtendUse52: TMenuItem;
    mn_ExtendUse60: TMenuItem;
    mn_ExtendUse61: TMenuItem;
    mn_ExtendUse62: TMenuItem;
    mn_ExtendUse70: TMenuItem;
    mn_ExtendUse71: TMenuItem;
    mn_ExtendUse80: TMenuItem;
    mn_ExtendUse81: TMenuItem;
    AdvGroupBox2: TAdvGroupBox;
    ed_LinkusID: TEdit;
    ed_LinkusTel1: TEdit;
    ed_LinkusTel2: TEdit;
    lb_KttSystemID: TLabel;
    lb_LinkusTel1: TLabel;
    lb_LinkusTel2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    se_KttArmRingCount: TAdvSpinEdit;
    se_KttDisArmRingCount: TAdvSpinEdit;
    gb_Dvr: TAdvGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    rg_DvrUse: TAdvOfficeRadioGroup;
    ed_DvrIP: TEdit;
    ed_DvrPort: TEdit;
    mn_DeviceNotUse: TMenuItem;
    mn_DeviceUse: TMenuItem;
    N37: TMenuItem;
    mn_DoorArmType: TMenuItem;
    mn_DoorArmType_: TMenuItem;
    mn_DoorArmType0: TMenuItem;
    mn_DoorArmType1: TMenuItem;
    N10: TMenuItem;
    mn_DoorMonitoring0: TMenuItem;
    mn_DoorMonitoring1: TMenuItem;
    pm_ArmArea: TPopupMenu;
    mn_ArmAreaMonitoring0: TMenuItem;
    mn_ArmAreaMonitoring1: TMenuItem;
    mn_TimeCodeUse: TMenuItem;
    mn_TimeCodeUse0: TMenuItem;
    mn_TimeCodeUse1: TMenuItem;
    mn_CardReaderWigend26: TMenuItem;
    mn_CardReaderWigend34: TMenuItem;
    mn_CardReaderWigend26_Non: TMenuItem;
    mn_CardReaderWigend34_Non: TMenuItem;
    mn_LockType4: TMenuItem;
    N11: TMenuItem;
    mn_AtDedicateUse: TMenuItem;
    mn_FdDedicateUse: TMenuItem;
    mn_AtDedicateUse0: TMenuItem;
    mn_AtDedicateUse1: TMenuItem;
    mn_FdDedicateUse0: TMenuItem;
    mn_FdDedicateUse1: TMenuItem;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    pan_Center: TAdvSmoothPanel;
    pan_Top: TAdvSmoothPanel;
    pan_left: TAdvSmoothPanel;
    lb_List: TLabel;
    btn_Search: TAdvGlowButton;
    lb_iconState: TLabel;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    mn_SelectDoor: TMenuItem;
    mn_LockType5: TMenuItem;
    mn_AntiPassGroup: TMenuItem;
    mn_Antigroup0: TMenuItem;
    mn_Antigroup1: TMenuItem;
    mn_Antigroup2: TMenuItem;
    mn_Antigroup3: TMenuItem;
    mn_Antigroup4: TMenuItem;
    mn_Antigroup5: TMenuItem;
    mn_Antigroup6: TMenuItem;
    mn_Antigroup7: TMenuItem;
    mn_Antigroup8: TMenuItem;
    mn_Controler: TMenuItem;
    lb_SearchBuildingName: TAdvSmoothLabel;
    eb_BuildingName: TAdvEditBtn;
    ed_BuildingCode: TAdvEdit;
    tv_buildingCode: TTreeView;
    ImageList1: TImageList;
    tv_buildingName: TTreeView;
    mn_DoorNameUpdate: TMenuItem;
    Pan_Workcode: TAdvSmoothPanel;
    lb_WorkType: TLabel;
    lb_Name: TAdvSmoothLabel;
    lb_EtcCode: TAdvSmoothLabel;
    lb_DoorMemo: TAdvSmoothLabel;
    ed_Name: TAdvEdit;
    ed_SelectCode: TAdvEdit;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    mem_DoorMemo: TMemo;
    ed_RelayCode: TAdvEdit;
    mn_DoorBuildingcode: TMenuItem;
    pan_Building: TAdvSmoothPanel;
    lb_Building: TLabel;
    tvDoorBuildingName: TTreeView;
    btn_BuildingSelect: TAdvGlowButton;
    btn_BuildingCancel: TAdvGlowButton;
    ImageList2: TImageList;
    tvDoorBuildingCode: TTreeView;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CommandArrayCommandsTMENUIDExecute(Command: TCommand;
      Params: TStringList);
    procedure ed_NodeIpKeyPress(Sender: TObject; var Key: Char);
    procedure CommandArrayCommandsTFORMNAMEExecute(Command: TCommand;
      Params: TStringList);
    procedure btn_SearchClick(Sender: TObject);
    procedure Tv_NodeDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tv_ListClick(Sender: TObject);
    procedure mn_CardReaderUseClick(Sender: TObject);
    procedure mn_CardReaderNotUseClick(Sender: TObject);
    procedure tv_ListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tv_ListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure mn_CardReaderDoorInPositionClick(Sender: TObject);
    procedure mn_CardReaderDoorOutPositionClick(Sender: TObject);
    procedure mn_CardReaderBuildingInPositionClick(Sender: TObject);
    procedure mn_CardReaderBuildingOutPositionClick(Sender: TObject);
    procedure mn_CardReaderCommonTypeClick(Sender: TObject);
    procedure mn_CardReaderFingerTypeClick(Sender: TObject);
    procedure mn_ZoneType0Click(Sender: TObject);
    procedure mn_ZoneDelay0Click(Sender: TObject);
    procedure mn_ZoneRecovery0Click(Sender: TObject);
    procedure mn_ZoneArmArea0Click(Sender: TObject);
    procedure mn_controltime0Click(Sender: TObject);
    procedure mn_longopenEventTime0Click(Sender: TObject);
    procedure mn_LongOpenAlarmSound0Click(Sender: TObject);
    procedure mn_Schedule0Click(Sender: TObject);
    procedure mn_FireOpen0Click(Sender: TObject);
    procedure mn_LockType0Click(Sender: TObject);
    procedure mn_DoorOpenState0Click(Sender: TObject);
    procedure mn_DsCheck0Click(Sender: TObject);
    procedure mn_ArmDSCheck0Click(Sender: TObject);
    procedure mn_JavaraArmCloseClick(Sender: TObject);
    procedure mn_JavaraAutoCloseClick(Sender: TObject);
    procedure cmb_ArmExtensionSelectChange(Sender: TObject);
    procedure chkMainToLocal1Click(Sender: TObject);
    procedure chk_ArmExtension00Click(Sender: TObject);
    procedure ed_LinkusIDKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_LinkusTel1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_LinkusTel2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure se_KttArmRingCountChange(Sender: TObject);
    procedure se_KttDisArmRingCountChange(Sender: TObject);
    procedure mn_DeviceNotUseClick(Sender: TObject);
    procedure mn_Door2NotUseClick(Sender: TObject);
    procedure mn_AcWatchOffClick(Sender: TObject);
    procedure mn_ArmDelayTime0Click(Sender: TObject);
    procedure mn_JaejungDelay0Click(Sender: TObject);
    procedure mn_ArmArea0Click(Sender: TObject);
    procedure mn_ArmRelayType0Click(Sender: TObject);
    procedure mn_ExtendUse10Click(Sender: TObject);
    procedure mn_DoorArmType0Click(Sender: TObject);
    procedure mn_DoorMonitoring0Click(Sender: TObject);
    procedure mn_ArmAreaMonitoring0Click(Sender: TObject);
    procedure mn_TimeCodeUse0Click(Sender: TObject);
    procedure mn_AtDedicateUse0Click(Sender: TObject);
    procedure mn_FdDedicateUse0Click(Sender: TObject);
    procedure pan_leftResize(Sender: TObject);
    procedure lb_iconStateMouseEnter(Sender: TObject);
    procedure lb_iconStateMouseLeave(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure mn_Antigroup0Click(Sender: TObject);
    procedure mn_DeviceUseClick(Sender: TObject);
    procedure mn_ArmArea1Click(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure mn_DoorNameUpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure mn_DoorBuildingcodeClick(Sender: TObject);
    procedure btn_BuildingSelectClick(Sender: TObject);
    procedure btn_BuildingCancelClick(Sender: TObject);
  private
    L_bGroupBoxClear : boolean;
    L_bMainSettingInitalize : Boolean;
    L_bArmExtentionInitialize : Boolean;
    L_nPageListMaxCount : integer;
    L_nCheckCount : integer;
    L_nProgress : integer;
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stButtonPreCaption : string;
    L_stNodeAddCaption : string;
    L_stNodeUpdateCaption : string;
    L_stSelectNodeNo : string;
    L_stSelectEcuID : string;
    L_stSelectDoorNo : string;
    L_stOrgRelayCode : string;
    L_stWork : string;
    { Private declarations }
    function MoveCardReaderArmArea(aNodeNo,aEcuID,aCardReaderNo,aArmAreaNo:string):Boolean;
    function MoveCardReaderDoorNo(aNodeNo,aEcuID,aCardReaderNo,aDoorNo:string):Boolean;
    function MoveDoorAccessOnly(aNodeNo,aEcuID,aDoorNo,aEcuNo:string):Boolean;
    function MoveDoorArmArea(aNodeNo,aEcuID,aDoorNo,aArmAreaNo:string):Boolean;
    function MoveZoneArmArea(aNodeNo,aEcuID,aExtendID,aZoneNo,aArmAreaNo:string):Boolean;
    function FormNameSetting : Boolean;
    procedure SearchDeviceList(aNodeNo,aSelectCode:string);
    procedure TreeViewCopy;
    procedure AddEcuTreeView(aNode,vNode :TTreeNode; aNodeNo,aEcuID:string);
    procedure RemoveChildNodes(aNode :TTreeNode);
  private
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure ArmAreaClick(aEcuID,aArmAreaNo:string;aImageIndex:integer);
    procedure CardReaderClick(aImageIndex:integer;aEcuID,aReaderNo:string);
    procedure DoorClick(aEcuID,aDoorNo:string;aImageIndex:integer);
    procedure EcuClick(aImageIndex:integer;aEcuID:string);
    procedure Ecu_GroupCreate(aGroup:TGroupBox;aCount:integer);
    procedure GroupBoxClear(aGroup:TGroupBox);
    procedure GroupBoxFree(aGroup:TGroupBox);
    procedure GroupBoxItemSetting(aGroup:TGroupBox;aIndex:integer;aCaption:string);
    procedure GroupCheckItem(aGroup:TGroupBox;aGroupIndex:integer;aChecked:Boolean);
    procedure PortClick(aEcuID,aExtendID,aSubNo:string);
  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
  end;

var
  fmDeviceSetting: TfmDeviceSetting;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBCardPermit,
  uDBDelete,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDBSelect,
  uFormVariable,
  uFormFunction,
  uDeviceVariable,
  uMain;
{$R *.dfm}

procedure TfmDeviceSetting.AddEcuTreeView(aNode, vNode: TTreeNode; aNodeNo,
  aEcuID: string);
var
  aNode2,aNode3 : TTreeNode;
  vNode2,vNode3 : TTreeNode;
  stEcuName,stEcuUse,stArmAreaUse : string;
  stArmAreaName,stArmAreaView : string;
  stDoorName,stDoorView,stDoorMemo : string;
  nArmAreaCount : integer;
  nDoorCount : integer;
  j : integer;
begin
  nArmAreaCount := 8;
  nDoorCount := 8;
  dmDBFunction.GetTB_DEVICE_DeviceInfo(aNodeNo,aEcuID,stEcuName,stEcuUse,stArmAreaUse);
  aNode.Text := aEcuID + ':' + stEcuName;
  if stEcuUse = '1' then
  begin
    aNode.ImageIndex := con_DeviceUseImageIndex;
    aNode.SelectedIndex := con_DeviceUseImageIndex;
    //방범구역 추가하자.
    if stArmAreaUse = '1' then
    begin
      for j := 1 to nArmAreaCount do
      begin
        dmDBFunction.GetTB_ARMAREA_ArmAreaInfo(aNodeNo,aEcuID,inttostr(j),stArmAreaName,stArmAreaView);
        aNode2:= tv_List.Items.AddChild(aNode,inttostr(j) + ':' + stArmAreaName);
        vNode2 := tv_Code.Items.AddChild(vNode,'A' + aEcuID + FillZeroNumber(j,2)); //방범구역
        if stArmAreaView = '1' then
        begin
          aNode2.ImageIndex := con_ArmAreaImageIndex;
          aNode2.SelectedIndex := con_ArmAreaImageIndex;
        end else
        begin
          aNode2.ImageIndex := con_ArmAreaDisImageIndex;
          aNode2.SelectedIndex := con_ArmAreaDisImageIndex;
        end;
      end;
    end else
    begin
      dmDBFunction.GetTB_ARMAREA_ArmAreaInfo(aNodeNo,aEcuID,'0',stArmAreaName,stArmAreaView);
      aNode2:= tv_List.Items.AddChild(aNode,stArmAreaName);
      vNode2 := tv_Code.Items.AddChild(vNode,'A' + aEcuID + FillZeroNumber(0,2)); //방범구역
      if stArmAreaView = '1' then
      begin
        aNode2.ImageIndex := con_ArmAreaImageIndex;
        aNode2.SelectedIndex := con_ArmAreaImageIndex;
      end else
      begin
        aNode2.ImageIndex := con_ArmAreaDisImageIndex;
        aNode2.SelectedIndex := con_ArmAreaDisImageIndex;
      end;
    end;
    //출입문 추가하자.
    for j := 1 to nDoorCount do
    begin
      dmDBFunction.GetTB_DOOR_DoorInfo(aNodeNo,aEcuID,inttostr(j),stDoorName,stDoorView,stDoorMemo);
      aNode2:= tv_List.Items.AddChild(aNode,inttostr(j) + ':' + stDoorName);
      vNode2 := tv_Code.Items.AddChild(vNode,'D' + aEcuID + FillZeroNumber(j,2)); //방범구역
      if stDoorView = '1' then
      begin
        aNode2.ImageIndex := con_DoorImageIndex;
        aNode2.SelectedIndex := con_DoorImageIndex;
      end else
      begin
        aNode2.ImageIndex := con_DoorDisImageIndex;
        aNode2.SelectedIndex := con_DoorDisImageIndex;
      end;
    end;
  end;

end;

procedure TfmDeviceSetting.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmDeviceSetting.ArmAreaClick(aEcuID, aArmAreaNo: string;aImageIndex:integer);
begin
  if aImageIndex = con_ArmAreaImageIndex then
  begin
    mn_ArmAreaMonitoring0.Checked := False;
    mn_ArmAreaMonitoring1.Checked := True;
  end else
  begin
    mn_ArmAreaMonitoring0.Checked := True;
    mn_ArmAreaMonitoring1.Checked := False;
  end;

end;

procedure TfmDeviceSetting.btn_BuildingCancelClick(Sender: TObject);
begin
  inherited;
  pan_Building.Visible := False;
end;

procedure TfmDeviceSetting.btn_BuildingSelectClick(Sender: TObject);
var
  stMessage : string;
  stBuildingCode : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if tv_buildingName.Selected = nil then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_BuildingSelect.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stBuildingCode := tvDoorBuildingCode.Items.Item[tvDoorBuildingName.Selected.AbsoluteIndex].Text;

  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(L_stSelectNodeNo,L_stSelectEcuID,L_stSelectDoorNo,'0','BC_BUILDINGCODE',stBuildingCode);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(L_stSelectNodeNo,L_stSelectEcuID,L_stSelectDoorNo,'0','DO_NAMECHANGE','1');

  pan_Building.Visible := False;
end;

procedure TfmDeviceSetting.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := False;
end;

procedure TfmDeviceSetting.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmDeviceSetting.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmDeviceSetting.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stParentCode : string;
  stCode : string;
  stNodeNo,stEcuID,stExtendID,stDoorNo: string;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  if Trim(ed_Name.Text) = '' then
  begin
    stMessage := dmFormMessage.GetMessage('BLANKFIELD');
    stMessage := StringReplace(stMessage,'$WORK',lb_Name.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;

  stCode := ed_SelectCode.Text;
  stNodeNo := ed_NodeNo.Text;
  stEcuID := copy(stCode,2,2);
  stExtendID := '0';
  stDoorNo := copy(stCode,4,2);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_DOORNAME',ed_Name.Text);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_MEMO',mem_DoorMemo.Text);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_NAMECHANGE','1');
  if L_stOrgRelayCode <> ed_RelayCode.Text then
  begin
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_RELAYID',ed_RelayCode.Text);
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,stExtendID,stDoorNo,'DO_RELAYIDCHANGE','Y');
  end;

  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stDoorNo, con_ComLogTYPE_DOOR, L_stMenuID + '(' + Caption + '): Change');
  tv_List.Items.Item[tv_List.Selected.AbsoluteIndex].Text := ed_Name.Text;
  tv_List.SetFocus;


  Pan_Workcode.Visible := False;
end;

procedure TfmDeviceSetting.btn_SearchClick(Sender: TObject);
var
  aTreeView : TTreeview;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  inherited;
  if Tv_Node.Visible then
  begin
    Tv_Node.Visible := Not Tv_Node.Visible;
    Exit;
  end;
  Tv_Node.Visible := True;
  Tv_Node.Left := pan_Top.Left + btn_Search.Left;
  Tv_Node.Top :=  pan_Top.Top + btn_Search.Top + btn_Search.Height + 1;

  aTreeView := Tv_Node;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  stSql := ' Select * from TB_NODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if (ed_BuildingCode.Text <> '') and (ed_BuildingCode.Text <> '0') then  stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + ed_BuildingCode.Text + '%'' ';
  stSql := stSql + ' Order by ND_NODENO ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        aTreeView.Items.Add(nil,FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + ':' + FindField('ND_NODENAME').AsString);
        Next;
      end;
    end;
  Finally

  End;
end;

procedure TfmDeviceSetting.Button1Click(Sender: TObject);
begin
  inherited;
  TreeViewCopy;
end;

procedure TfmDeviceSetting.CardReaderClick(aImageIndex: integer; aEcuID,
  aReaderNo: string);
var
  nIndex : integer;
  stTemp : string;
  nWinSocket : integer;
begin
(*  if aImageIndex = con_CardReaderUseImageIndex then //사용중이면
  begin
    mn_CardReaderUse.Visible := False;
    mn_CardReaderNotUse.Visible := True;
  end else
  begin
    mn_CardReaderUse.Visible := True;
    mn_CardReaderNotUse.Visible := False;
  end;
  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdDoorPosition,aEcuID,aReaderNo);
    if stTemp = '0' then //내부
    begin
      mn_CardReaderDoorInPosition.Checked := True;
      mn_CardReaderDoorOutPosition.Checked := False;
    end else if stTemp = '1' then //외부
    begin
      mn_CardReaderDoorInPosition.Checked := False;
      mn_CardReaderDoorOutPosition.Checked := True;
    end else
    begin
      mn_CardReaderDoorInPosition.Checked := False;
      mn_CardReaderDoorOutPosition.Checked := False;
    end;
    stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdBuildingPositionCode,aEcuID,aReaderNo);
    if stTemp = '0' then //내부
    begin
      mn_CardReaderBuildingInPosition.Checked := True;
      mn_CardReaderBuildingOutPosition.Checked := False;
    end else if stTemp = '1' then //외부
    begin
      mn_CardReaderBuildingInPosition.Checked := False;
      mn_CardReaderBuildingOutPosition.Checked := True;
    end else
    begin
      mn_CardReaderBuildingInPosition.Checked := False;
      mn_CardReaderBuildingOutPosition.Checked := False;
    end;
    stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdType,aEcuID,aReaderNo);
    if stTemp = '0' then
    begin
      mn_CardReaderCommonType.Checked := True;
      mn_CardReaderFingerType.Checked := False;
      mn_CardReaderWigend26.Checked := False;
      mn_CardReaderWigend34.Checked := False;
      mn_CardReaderWigend26_non.Checked := False;
      mn_CardReaderWigend34_non.Checked := False;
    end else if stTemp = '1' then
    begin
      mn_CardReaderCommonType.Checked := False;
      mn_CardReaderFingerType.Checked := True;
      mn_CardReaderWigend26.Checked := False;
      mn_CardReaderWigend34.Checked := False;
      mn_CardReaderWigend26_non.Checked := False;
      mn_CardReaderWigend34_non.Checked := False;
    end else if stTemp = '2' then
    begin
      mn_CardReaderCommonType.Checked := False;
      mn_CardReaderFingerType.Checked := False;
      mn_CardReaderWigend26.Checked := True;
      mn_CardReaderWigend34.Checked := False;
      mn_CardReaderWigend26_non.Checked := False;
      mn_CardReaderWigend34_non.Checked := False;
    end else if stTemp = '3' then
    begin
      mn_CardReaderCommonType.Checked := False;
      mn_CardReaderFingerType.Checked := False;
      mn_CardReaderWigend26.Checked := False;
      mn_CardReaderWigend34.Checked := True;
      mn_CardReaderWigend26_non.Checked := False;
      mn_CardReaderWigend34_non.Checked := False;
    end else if stTemp = '4' then
    begin
      mn_CardReaderCommonType.Checked := False;
      mn_CardReaderFingerType.Checked := False;
      mn_CardReaderWigend26.Checked := False;
      mn_CardReaderWigend34.Checked := False;
      mn_CardReaderWigend26_non.Checked := True;
      mn_CardReaderWigend34_non.Checked := False;
    end else if stTemp = '5' then
    begin
      mn_CardReaderCommonType.Checked := False;
      mn_CardReaderFingerType.Checked := False;
      mn_CardReaderWigend26.Checked := False;
      mn_CardReaderWigend34.Checked := False;
      mn_CardReaderWigend26_non.Checked := False;
      mn_CardReaderWigend34_non.Checked := True;
    end else
    begin
      mn_CardReaderCommonType.Checked := False;
      mn_CardReaderFingerType.Checked := False;
      mn_CardReaderWigend26.Checked := False;
      mn_CardReaderWigend34.Checked := False;
      mn_CardReaderWigend26_non.Checked := False;
      mn_CardReaderWigend34_non.Checked := False;
    end;
  end else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdDoorPosition,aEcuID,aReaderNo);
      if stTemp = '0' then //내부
      begin
        mn_CardReaderDoorInPosition.Checked := True;
        mn_CardReaderDoorOutPosition.Checked := False;
      end else if stTemp = '1' then //외부
      begin
        mn_CardReaderDoorInPosition.Checked := False;
        mn_CardReaderDoorOutPosition.Checked := True;
      end else
      begin
        mn_CardReaderDoorInPosition.Checked := False;
        mn_CardReaderDoorOutPosition.Checked := False;
      end;
      stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdBuildingPositionCode,aEcuID,aReaderNo);
      if stTemp = '0' then //내부
      begin
        mn_CardReaderBuildingInPosition.Checked := True;
        mn_CardReaderBuildingOutPosition.Checked := False;
      end else if stTemp = '1' then //외부
      begin
        mn_CardReaderBuildingInPosition.Checked := False;
        mn_CardReaderBuildingOutPosition.Checked := True;
      end else
      begin
        mn_CardReaderBuildingInPosition.Checked := False;
        mn_CardReaderBuildingOutPosition.Checked := False;
      end;
      stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdType,aEcuID,aReaderNo);
      if stTemp = '0' then
      begin
        mn_CardReaderCommonType.Checked := True;
        mn_CardReaderFingerType.Checked := False;
        mn_CardReaderWigend26.Checked := False;
        mn_CardReaderWigend34.Checked := False;
        mn_CardReaderWigend26_non.Checked := False;
        mn_CardReaderWigend34_non.Checked := False;
      end else if stTemp = '1' then
      begin
        mn_CardReaderCommonType.Checked := False;
        mn_CardReaderFingerType.Checked := True;
        mn_CardReaderWigend26.Checked := False;
        mn_CardReaderWigend34.Checked := False;
        mn_CardReaderWigend26_non.Checked := False;
        mn_CardReaderWigend34_non.Checked := False;
      end else if stTemp = '2' then
      begin
        mn_CardReaderCommonType.Checked := False;
        mn_CardReaderFingerType.Checked := False;
        mn_CardReaderWigend26.Checked := True;
        mn_CardReaderWigend34.Checked := False;
        mn_CardReaderWigend26_non.Checked := False;
        mn_CardReaderWigend34_non.Checked := False;
      end else if stTemp = '3' then
      begin
        mn_CardReaderCommonType.Checked := False;
        mn_CardReaderFingerType.Checked := False;
        mn_CardReaderWigend26.Checked := False;
        mn_CardReaderWigend34.Checked := True;
        mn_CardReaderWigend26_non.Checked := False;
        mn_CardReaderWigend34_non.Checked := False;
      end else if stTemp = '4' then
      begin
        mn_CardReaderCommonType.Checked := False;
        mn_CardReaderFingerType.Checked := False;
        mn_CardReaderWigend26.Checked := False;
        mn_CardReaderWigend34.Checked := False;
        mn_CardReaderWigend26_non.Checked := True;
        mn_CardReaderWigend34_non.Checked := False;
      end else if stTemp = '5' then
      begin
        mn_CardReaderCommonType.Checked := False;
        mn_CardReaderFingerType.Checked := False;
        mn_CardReaderWigend26.Checked := False;
        mn_CardReaderWigend34.Checked := False;
        mn_CardReaderWigend26_non.Checked := False;
        mn_CardReaderWigend34_non.Checked := True;
      end else
      begin
        mn_CardReaderCommonType.Checked := False;
        mn_CardReaderFingerType.Checked := False;
        mn_CardReaderWigend26.Checked := False;
        mn_CardReaderWigend34.Checked := False;
        mn_CardReaderWigend26_non.Checked := False;
        mn_CardReaderWigend34_non.Checked := False;
      end;
    end;

  end;
  *)
end;

procedure TfmDeviceSetting.chkMainToLocal1Click(Sender: TObject);
var
  i : integer;
  oCheckBox : TCheckBox;
begin
  inherited;
  if Sender <> chkAllMainToLocal then
  begin
    GroupCheckItem(Group_MainToLocalDevice,TCheckBox(Sender).Tag,TCheckBox(Sender).Checked);
  end else
  begin
    for i:=0 to 6 do
    begin
      oCheckBox := dmFormFunction.TravelCheckBoxTagItem(Group_MainToLocalAll,i);
      if oCheckBox <> nil then
      begin
        oCheckBox.Checked := TCheckBox(Sender).Checked;
      end;
    end;
  end;

end;

procedure TfmDeviceSetting.chk_ArmExtension00Click(Sender: TObject);
var
  nIndex : integer;
  nTag : integer;
  nWinSocket : integer;
begin
  inherited;
(*  if L_bArmExtentionInitialize then Exit;
  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  nTag := TCheckBox(Sender).tag;
  if nIndex > -1 then
  begin
    if cmb_ArmExtensionSelect.ItemIndex = 1 then
    begin
      if TCheckBox(Sender).Checked then
        TNode(NodeList.Objects[nIndex]).SetNodeIndexInformation(con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,nTag + 2,'1')
      else TNode(NodeList.Objects[nIndex]).SetNodeIndexInformation(con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,nTag + 2,'0');
      TNode(NodeList.Objects[nIndex]).ARMEXTENTIONMAINTOLOCALRCV := 'U';
    end else if cmb_ArmExtensionSelect.ItemIndex = 2 then
    begin
      if TCheckBox(Sender).Checked then
        TNode(NodeList.Objects[nIndex]).SetNodeIndexInformation(con_DeviceCmdARMEXTENTIONMAINTOLOCAL,nTag + 2,'1')
      else TNode(NodeList.Objects[nIndex]).SetNodeIndexInformation(con_DeviceCmdARMEXTENTIONMAINTOLOCAL,nTag + 2,'0');
      TNode(NodeList.Objects[nIndex]).ARMEXTENTIONMAINFROMLOCALRCV := 'U';
    end;
  end else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      if cmb_ArmExtensionSelect.ItemIndex = 1 then
      begin
        if TCheckBox(Sender).Checked then
          dmNodeServer.DeviceNodeServer_SetNodeIndexInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,nTag + 2,'1')
        else dmNodeServer.DeviceNodeServer_SetNodeIndexInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,nTag + 2,'0');
        dmNodeServer.DeviceNodeServer_SetNodeRCVInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,'U');
      end else if cmb_ArmExtensionSelect.ItemIndex = 2 then
      begin
        if TCheckBox(Sender).Checked then
          dmNodeServer.DeviceNodeServer_SetNodeIndexInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINTOLOCAL,nTag + 2,'1')
        else dmNodeServer.DeviceNodeServer_SetNodeIndexInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINTOLOCAL,nTag + 2,'0');
        dmNodeServer.DeviceNodeServer_SetNodeRCVInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINTOLOCAL,'U');
      end;
    end;
  end;
  *)
end;

procedure TfmDeviceSetting.cmb_ArmExtensionSelectChange(Sender: TObject);
var
  nIndex : integer;
  stTemp : string;
  stTemp1 : string;
  i : integer;
  oChkBox : TCheckBox;
  nWinSocket : integer;
begin
  inherited;
(*  Try
    nIndex := NodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      TNode(NodeList.Objects[nIndex]).ARMEXTENTIONGUBUN := inttostr(cmb_ArmExtensionSelect.ItemIndex);
      if cmb_ArmExtensionSelect.ItemIndex = 0 then
      begin
        pan_ArmExtension.Visible := False;
        if Not L_bArmExtentionInitialize then TNode(NodeList.Objects[nIndex]).ARMEXTENTIONMAINTOLOCALRCV := 'U';
        if Not L_bArmExtentionInitialize then TNode(NodeList.Objects[nIndex]).ARMEXTENTIONMAINFROMLOCALRCV := 'U'; //두개 모두 Clear 하는 전문 전송
      end else
      begin
        pan_ArmExtension.Visible := True;
        if cmb_ArmExtensionSelect.ItemIndex = 1 then
        begin
          stTemp := TNode(NodeList.Objects[nIndex]).ARMEXTENTIONMAINTOLOCAL;
          if Not L_bArmExtentionInitialize then TNode(NodeList.Objects[nIndex]).ARMEXTENTIONMAINTOLOCALRCV := 'U';
          pan_ArmExtensionMessage.Caption := '메인에서 경계 하면 아래 체크되어 있는 로컬을 경계하는 기능입니다.';
        end else
        begin
          stTemp := TNode(NodeList.Objects[nIndex]).ARMEXTENTIONMAINFROMLOCAL;
          if Not L_bArmExtentionInitialize then TNode(NodeList.Objects[nIndex]).ARMEXTENTIONMAINFROMLOCALRCV := 'U';
          pan_ArmExtensionMessage.Caption := '로컬이 경계 된 후 메인을 경계 시킬 수 있는 기능입니다.';
        end;

        L_bArmExtentionInitialize := True;
        for i := 1 to TNode(NodeList.Objects[nIndex]).MaxEcuCount do
        begin
          oChkBox := dmFormFunction.TravelCheckBoxTagItem(Group_MainToLocalDevice,i - 1);
          if oChkBox <> nil then
          begin
            if Length(stTemp) < i + 1 then break;

            if stTemp[i + 1] = '1' then oChkBox.Checked := True
            else oChkBox.Checked := False;
          end;
        end;
      end;
    end else
    begin
      nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
      if nIndex > -1 then
      begin
        nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
        dmNodeServer.DeviceNodeServer_SetNodeInformation(nWinSocket,con_DeviceCmdARMEXTENTIONGUBUN,inttostr(cmb_ArmExtensionSelect.ItemIndex));
        if cmb_ArmExtensionSelect.ItemIndex = 0 then
        begin
          pan_ArmExtension.Visible := False;
          if Not L_bArmExtentionInitialize then dmNodeServer.DeviceNodeServer_SetNodeRCVInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINTOLOCAL,'U');
          if Not L_bArmExtentionInitialize then dmNodeServer.DeviceNodeServer_SetNodeRCVInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINFROMLOCAL,'U');
        end else
        begin
          pan_ArmExtension.Visible := True;
          if cmb_ArmExtensionSelect.ItemIndex = 1 then
          begin
            stTemp := dmNodeServer.DeviceNodeServer_GetNodeIndexInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINTOLOCAL);
            if Not L_bArmExtentionInitialize then dmNodeServer.DeviceNodeServer_SetNodeRCVInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINTOLOCAL,'U');
            pan_ArmExtensionMessage.Caption := '메인에서 경계 하면 아래 체크되어 있는 로컬을 경계하는 기능입니다.';
          end else
          begin
            stTemp := dmNodeServer.DeviceNodeServer_GetNodeIndexInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINTOLOCAL);
            if Not L_bArmExtentionInitialize then dmNodeServer.DeviceNodeServer_SetNodeRCVInformation(nWinSocket,con_DeviceCmdARMEXTENTIONMAINTOLOCAL,'U');
            pan_ArmExtensionMessage.Caption := '로컬이 경계 된 후 메인을 경계 시킬 수 있는 기능입니다.';
          end;

          L_bArmExtentionInitialize := True;
          stTemp1 := dmNodeServer.DeviceNodeServer_GetNodeIndexInformation(nWinSocket,con_NodeCmdEcuMaxCount);
          if Not isDigit(stTemp1) then stTemp1 := '63';

          for i := 1 to strtoint(stTemp1) do
          begin
            oChkBox := dmFormFunction.TravelCheckBoxTagItem(Group_MainToLocalDevice,i - 1);
            if oChkBox <> nil then
            begin
              if Length(stTemp) < i + 1 then break;

              if stTemp[i + 1] = '1' then oChkBox.Checked := True
              else oChkBox.Checked := False;
            end;
          end;
        end;
      end;
    end;
  Finally
    L_bArmExtentionInitialize := False;
  End;
  *)
end;

procedure TfmDeviceSetting.CommandArrayCommandsTFORMNAMEExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  Caption := Params.Values['CAPTION'];

end;

procedure TfmDeviceSetting.CommandArrayCommandsTMENUIDExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  L_stMenuID := Params.Values['ID'];
end;

procedure TfmDeviceSetting.DoorClick(aEcuID, aDoorNo: string;aImageIndex:integer);
var
  stNodeNo : string;
  stTemp : string;
begin
  if aImageIndex = con_DoorImageIndex then
  begin
    mn_DoorMonitoring0.Checked := False;
    mn_DoorMonitoring1.Checked := True;
    mn_DoorNameUpdate.Visible := True;
  end else
  begin
    mn_DoorMonitoring0.Checked := True;
    mn_DoorMonitoring1.Checked := False;
    mn_DoorNameUpdate.Visible := False;
  end;

  stNodeNo := ed_NodeNo.Text;
  stTemp := dmDBFunction.GetTB_DOOR_ScheduleUse(stNodeNo,aEcuID,aDoorNo);

  if stTemp = '1' then
  begin
    mn_Schedule0.Checked := False;
    mn_Schedule1.Checked := True;
  end else
  begin
    mn_Schedule0.Checked := True;
    mn_Schedule1.Checked := False;
  end;

  stTemp :=  dmDBFunction.GetTB_DOOR_TimeCodeUse(stNodeNo,aEcuID,aDoorNo);
  if stTemp = '1' then
  begin
    mn_TimeCodeUse0.Checked := False;
    mn_TimeCodeUse1.Checked := True;
  end else
  begin
    mn_TimeCodeUse0.Checked := True;
    mn_TimeCodeUse1.Checked := False;
  end;

  stTemp :=  dmDBFunction.GetTB_DOOR_AtDedicateUse(stNodeNo,aEcuID,aDoorNo);
  if stTemp = '1' then
  begin
    mn_AtDedicateUse0.Checked := False;
    mn_AtDedicateUse1.Checked := True;
  end else
  begin
    mn_AtDedicateUse0.Checked := True;
    mn_AtDedicateUse1.Checked := False;
  end;
  stTemp :=  dmDBFunction.GetTB_DOOR_FdDedicateUse(stNodeNo,aEcuID,aDoorNo);
  if stTemp = '1' then
  begin
    mn_FdDedicateUse0.Checked := False;
    mn_FdDedicateUse1.Checked := True;
  end else
  begin
    mn_FdDedicateUse0.Checked := True;
    mn_FdDedicateUse1.Checked := False;
  end;

  stTemp :=  dmDBFunction.GetTB_DOOR_FireDoorOpen(stNodeNo,aEcuID,aDoorNo);
  if stTemp = '1' then
  begin
    mn_FireOpen0.Checked := False;
    mn_FireOpen1.Checked := True;
  end else
  begin
    mn_FireOpen0.Checked := True;
    mn_FireOpen1.Checked := False;
  end;

end;

procedure TfmDeviceSetting.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Left := pan_Top.Left + eb_BuildingName.Left;
  tv_buildingName.Top :=  pan_Top.Top + eb_BuildingName.Top + eb_BuildingName.Height + 1;

end;

procedure TfmDeviceSetting.EcuClick(aImageIndex:integer;aEcuID: string);
var
  stEcuName : string;
  stEcuUse : string;
  stArmAreaUse : string;
  i,j : integer;
  stType : string;
  oMenu : TMenuItem;
  oMenu1 : TMenuItem;
begin
  if aEcuID = '00' then
  begin
    mn_Controler.Visible := False;
    //mn_DeviceNotUse.Visible := False;
    //mn_DeviceUse.Visible := False;
  end else
  begin
    mn_Controler.Visible := True;
    //mn_DeviceNotUse.Visible := True;
    //mn_DeviceUse.Visible := True;
  end;

  if aImageIndex = con_DeviceUseImageIndex then
  begin
    mn_DeviceNotUse.Checked := False;
    mn_DeviceUse.Checked := True;
    mn_ArmArea.Visible := True;
    if Not IsDigit(ed_NodeNo.Text) then Exit;
    dmDBFunction.GetTB_DEVICE_DeviceInfo(ed_NodeNo.Text,aEcuID,stEcuName,stEcuUse,stArmAreaUse);

    if stArmAreaUse = '1' then
    begin
      mn_ArmArea0.Checked := False;
      mn_ArmArea1.Checked := True;
    end else
    begin
      mn_ArmArea0.Checked := True;
      mn_ArmArea1.Checked := False;
    end;
  end else
  begin
    mn_DeviceNotUse.Checked := True;
    mn_DeviceUse.Checked := False;
    mn_ArmArea.Visible := False;
  end;

  if mn_ExtendUse.Visible then
  begin
    for i := 1 to 8 do
    begin
      stType := dmDBFunction.GetTB_ZONEEXTENTION_Type(ed_NodeNo.Text,aEcuID,inttostr(i));
      if stType = '' then stType := '0';

      for j := 0 to 2 do
      begin
        oMenu := dmFormFunction.TravelMenuSubItem(mn_ExtendUse,'mn_ExtendUse',i);
        if oMenu <> nil then
        begin
          oMenu1 := dmFormFunction.TravelMenuSubItem(oMenu,'mn_ExtendUse' + inttostr(i),j);
          if oMenu1 <> nil then
          begin
            if strtoint(stType) = j then oMenu1.Checked := True
            else oMenu1.Checked := False;
          end;
        end;
      end;
    end;
  end;

end;

procedure TfmDeviceSetting.Ecu_GroupCreate(aGroup: TGroupBox; aCount: integer);
var
  i : integer;
begin
  GroupBoxClear(aGroup);
  GroupBoxFree(aGroup);

  for I:= 1 to aCount do
  begin
    GroupBoxItemSetting(aGroup,I-1,FillZeroNumber(i,2));
  end;
end;

procedure TfmDeviceSetting.ed_LinkusIDKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nIndex : integer;
  nWinSocket : integer;
begin
  inherited;
(*  if (ed_LinkusID.Text <> '') or (ed_LinkusID.Text <> 'AAAA') then
  begin
    if Not isDigit(ed_LinkusID.Text) then
    begin
      Showmessage(lb_KttSystemID.Caption + ' 은 숫자만 입력이 가능 합니다.');
      Exit;
    end;
  end;
  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).KTTSYSTEMID := ed_LinkusID.Text;
    if Length(ed_LinkusID.Text) = 4 then TNode(NodeList.Objects[nIndex]).KTTSYSTEMIDRCV := 'U';
  end else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetNodeInformation(nWinSocket,con_DeviceCmdKTTSystemID,ed_LinkusID.Text);
      if Length(ed_LinkusID.Text) = 4 then dmNodeServer.DeviceNodeServer_SetNodeRcvInformation(nWinSocket,con_DeviceCmdKTTSystemID,'U');
    end;
  end;
  *)
end;

procedure TfmDeviceSetting.ed_LinkusTel1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nIndex : integer;
  nWinSocket : integer;
begin
  inherited;
(*  if (ed_LinkusTel1.Text <> '') then
  begin
    if Not isDigit(ed_LinkusTel1.Text) then
    begin
      Showmessage(lb_LinkusTel1.Caption + ' 은 숫자만 입력이 가능 합니다.');
      Exit;
    end;
  end;
  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    if ed_LinkusTel1.Text <> TNode(NodeList.Objects[nIndex]).KTTTELNUMBER1 then
    begin
      TNode(NodeList.Objects[nIndex]).KTTTELNUMBER1 := ed_LinkusTel1.Text;
      if Length(ed_LinkusTel1.Text) > 7 then TNode(NodeList.Objects[nIndex]).KTTTELNUMBERRCV := 'U';
    end;
  end else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      if ed_LinkusTel1.Text <> dmNodeServer.DeviceNodeServer_GetNodeIndexInformation(nWinSocket,con_DeviceCmdKTTTelNumber1) then
      begin
        dmNodeServer.DeviceNodeServer_SetNodeInformation(nWinSocket,con_DeviceCmdKTTTelNumber1,ed_LinkusTel1.Text);
        if Length(ed_LinkusTel1.Text) > 7 then dmNodeServer.DeviceNodeServer_SetNodeRcvInformation(nWinSocket,con_DeviceCmdKTTTelNumber1,'U');
      end;
    end;
  end;
  *)

end;

procedure TfmDeviceSetting.ed_LinkusTel2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nIndex : integer;
  nWinSocket : integer;
begin
  inherited;
(*  if (ed_LinkusTel2.Text <> '') then
  begin
    if Not isDigit(ed_LinkusTel2.Text) then
    begin
      Showmessage(lb_LinkusTel2.Caption + ' 은 숫자만 입력이 가능 합니다.');
      Exit;
    end;
  end;
  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    if ed_LinkusTel2.Text <> TNode(NodeList.Objects[nIndex]).KTTTELNUMBER2 then
    begin
      TNode(NodeList.Objects[nIndex]).KTTTELNUMBER2 := ed_LinkusTel2.Text;
      if Length(ed_LinkusTel2.Text) > 7 then TNode(NodeList.Objects[nIndex]).KTTTELNUMBERRCV := 'U';
    end;
  end else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      if ed_LinkusTel2.Text <> dmNodeServer.DeviceNodeServer_GetNodeIndexInformation(nWinSocket,con_DeviceCmdKTTTelNumber2) then
      begin
        dmNodeServer.DeviceNodeServer_SetNodeInformation(nWinSocket,con_DeviceCmdKTTTelNumber2,ed_LinkusTel2.Text);
        if Length(ed_LinkusTel1.Text) > 7 then dmNodeServer.DeviceNodeServer_SetNodeRcvInformation(nWinSocket,con_DeviceCmdKTTTelNumber2,'U');
      end;
    end;
  end;
  *)
end;

procedure TfmDeviceSetting.ed_NodeIpKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Char(VK_RETURN) then
      Perform(WM_NEXTDLGCTL,0,0);

end;

procedure TfmDeviceSetting.FormChangeEvent(aFormName: integer);
begin
//  case aFormName of
//  end;
end;

procedure TfmDeviceSetting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fmMain.FORMENABLE(con_FormBMOSDEVICEMANAGER,'FALSE');
  Action := caFree;
end;

procedure TfmDeviceSetting.FormCreate(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := 17;
  tv_List.Items.Clear;
end;

function TfmDeviceSetting.FormNameSetting: Boolean;
begin

  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_NodeName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  L_stNodeAddCaption := dmFormFunction.GetFormName('0','2','COMMONNODELIST02');
  L_stNodeUpdateCaption := dmFormFunction.GetFormName('0','2','COMMONNODELIST03');
  btn_Search.Caption  := dmFormFunction.GetFormName('0','2','BUTTONSEARCH002');
  lb_List.Caption := dmFormFunction.GetFormName('0','2','COMMONDEVICELIST');
  lb_iconState.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  mn_Controler.Caption := dmFormFunction.GetFormName('0','2','COMMONCONTROLUSED');
  mn_DeviceNotUse.Caption := dmFormFunction.GetFormName('0','2','COMMONHIDE');
  mn_DeviceUse.Caption := dmFormFunction.GetFormName('0','2','COMMONVISIBLE');
  mn_ArmArea.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREAUSED');
  mn_ArmArea0.Caption := dmFormFunction.GetFormName('0','2','COMNOTUSE');
  mn_ArmArea1.Caption := dmFormFunction.GetFormName('0','2','COMUSE');
  mn_ArmAreaMonitoring0.Caption := dmFormFunction.GetFormName('0','2','COMMONHIDE');
  mn_ArmAreaMonitoring1.Caption := dmFormFunction.GetFormName('0','2','COMMONVISIBLE');
  mn_DoorMonitoring0.Caption := dmFormFunction.GetFormName('0','2','COMMONHIDE');
  mn_DoorMonitoring1.Caption := dmFormFunction.GetFormName('0','2','COMMONVISIBLE');
  mn_Schedule.Caption := dmFormFunction.GetFormName('0','2','COMDOORSCHUSE');
  mn_Schedule0.Caption := dmFormFunction.GetFormName('0','2','COMNOTUSE');
  mn_Schedule1.Caption := dmFormFunction.GetFormName('0','2','COMUSE');
  mn_TimeCodeUse.Caption := dmFormFunction.GetFormName('0','2','COMMONTIMEDOORUSE');
  mn_TimeCodeUse0.Caption := dmFormFunction.GetFormName('0','2','COMNOTUSE');
  mn_TimeCodeUse1.Caption := dmFormFunction.GetFormName('0','2','COMUSE');
  mn_AtDedicateUse.Caption := dmFormFunction.GetFormName('0','2','COMMONATDOOR');
  mn_AtDedicateUse0.Caption := dmFormFunction.GetFormName('0','2','COMNOTUSE');
  mn_AtDedicateUse1.Caption := dmFormFunction.GetFormName('0','2','COMUSE');
  mn_FdDedicateUse.Caption := dmFormFunction.GetFormName('0','2','COMMONFDDOOR');
  mn_FdDedicateUse0.Caption := dmFormFunction.GetFormName('0','2','COMNOTUSE');
  mn_FdDedicateUse1.Caption := dmFormFunction.GetFormName('0','2','COMUSE');
  gb_IconState.Caption := dmFormFunction.GetFormName('2','2','BM3_012Example');
  lb_UseControl.Caption := dmFormFunction.GetFormName('0','2','COMMONUSECONTROLER');
  lb_NotUseControl.Caption := dmFormFunction.GetFormName('0','2','COMMONNOTUSECONTROLER');
  lb_ExArmArea.Caption := dmFormFunction.GetFormName('0','2','COMMONARMAREA');
  lb_ExDoor.Caption := dmFormFunction.GetFormName('0','2','COMMONDOOR');

  lb_Name.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  lb_DoorMemo.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORMEMO');
  lb_EtcCode.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORRELAYCODE');
end;

procedure TfmDeviceSetting.FormResize(Sender: TObject);
begin
  inherited;
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  Pan_Workcode.Left := (Width div 2) - (Pan_Workcode.Width div 2);
  Pan_Workcode.top := (Height div 2) - (Pan_Workcode.Height div 2);

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

  tv_List.Left := 10;
  tv_List.Width := pan_left.Width - (tv_List.Left * 2);
  tv_List.Height := pan_left.Height - (tv_List.Top + 10);

  pan_leftResize(pan_left);
end;

procedure TfmDeviceSetting.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSDEVICEMANAGER,'TRUE');

  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);

end;

procedure TfmDeviceSetting.GroupBoxClear(aGroup: TGroupBox);
var
  i : integer;
  oCheckBox : TCheckBox;
begin
  L_bGroupBoxClear := True;
  for i := 0 to 100 do
  begin
    oCheckBox := dmFormFunction.TravelCheckBoxTagItem(aGroup,i);
    if oCheckBox <> nil then
    begin
      oCheckBox.Checked := False;
    end;
  end;
  L_bGroupBoxClear := False;
end;

procedure TfmDeviceSetting.GroupBoxFree(aGroup: TGroupBox);
var
  i : integer;
  oCheckBox : TCheckBox;
begin
  for i := 0 to 100 do
  begin
    oCheckBox := dmFormFunction.TravelCheckBoxTagItem(aGroup,i);
    if oCheckBox <> nil then
    begin
      oCheckBox.Visible := False;
    end;
  end;
end;

procedure TfmDeviceSetting.GroupBoxItemSetting(aGroup: TGroupBox;
  aIndex: integer; aCaption: string);
var
  oCheckBox : TCheckBox;
begin
  oCheckBox := dmFormFunction.TravelCheckBoxTagItem(aGroup,aIndex);
  if oCheckBox <> nil then
  begin
    oCheckBox.Visible := True;
    oCheckBox.Caption := aCaption;
  end;
end;

procedure TfmDeviceSetting.GroupCheckItem(aGroup: TGroupBox;
  aGroupIndex: integer; aChecked: Boolean);
var
  i : integer;
  nGroupIndexStart,nGroupIndexEnd : integer;
  oCheckBox : TCheckBox;
begin
  nGroupIndexStart := aGroupIndex * 10;
  nGroupIndexEnd := nGroupIndexStart + 9;
  for i := nGroupIndexStart to nGroupIndexEnd do
  begin
    oCheckBox := dmFormFunction.TravelCheckBoxTagItem(aGroup,i);
    if oCheckBox <> nil then
    begin
      oCheckBox.Checked := aChecked;
    end;
  end;
end;

procedure TfmDeviceSetting.lb_iconStateMouseEnter(Sender: TObject);
begin
  inherited;
  gb_IconState.Visible := True;
end;

procedure TfmDeviceSetting.lb_iconStateMouseLeave(Sender: TObject);
begin
  inherited;
  gb_IconState.Visible := False;
end;

procedure TfmDeviceSetting.mn_AcWatchOffClick(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stType : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdWATCHACPOWER,stEcuID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdSystemInformation,stEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(nWinSocket,con_DeviceCmdWATCHACPOWER,stEcuID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdSystemInformation,stEcuID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_Antigroup0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := inttostr(TmenuItem(Sender).tag);

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdAntiNo,stEcuID,stDoorNo,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdAntiNo,stEcuID,stDoorNo,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_ArmArea0Click(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stNodeNo : string;
  stEcuID : string;
  stMessage : string;
  j : integer;
begin
  inherited;

  if mn_ArmArea0.Checked then Exit; //이미 미사용 중이면 처리 할 필요 없다.

  if tv_List.Selected = nil then
  begin
    Exit;
  end;

  stNodeNo := ed_NodeNo.Text;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;
  stEcuID := copy(stCode,2,2);

  stMessage := dmFormMessage.GetMessage('WORKMESSAGE');
  stMessage := stringReplace(stMessage,'$WORK',mn_ArmArea0.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;

  dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','DE_ARMAREAUSE','0');
  dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','DE_ARMAREAUSECHANGE','Y');
  for j := 0 to G_nDefaultArmAreaCount do
  begin
    if j = 0 then
    begin
      dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,'0',inttostr(j),'AR_ARMAREAUSE','1');
      dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,'0',inttostr(j),'AR_VIEW','1');
    end else
    begin
      dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,'0',inttostr(j),'AR_ARMAREAUSE','0');
      dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,'0',inttostr(j),'AR_VIEW','0');
    end;

    Application.ProcessMessages;
  end;
  RemoveChildNodes(tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex]);
  RemoveChildNodes(tv_List.Selected);
  AddEcuTreeView(tv_List.Selected,tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex],stNodeNo,stEcuID);
  tv_List.Refresh;
  tv_ListClick(tv_List);
end;

procedure TfmDeviceSetting.mn_ArmArea1Click(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stNodeNo : string;
  stEcuID : string;
  stMessage : string;
  j : integer;
begin
  inherited;

  if mn_ArmArea1.Checked then Exit; //이미 미사용 중이면 처리 할 필요 없다.

  if tv_List.Selected = nil then
  begin
    Exit;
  end;

  stNodeNo := ed_NodeNo.Text;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;
  stEcuID := copy(stCode,2,2);

  stMessage := dmFormMessage.GetMessage('WORKMESSAGE');
  stMessage := stringReplace(stMessage,'$WORK',mn_ArmArea1.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','DE_ARMAREAUSE','1');
  dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','DE_ARMAREAUSECHANGE','Y');

  for j := 0 to G_nDefaultArmAreaCount do
  begin
    if j = 0 then
    begin
      dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,'0',inttostr(j),'AR_ARMAREAUSE','0');
      dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,'0',inttostr(j),'AR_VIEW','0');
    end else
    begin
      dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,'0',inttostr(j),'AR_ARMAREAUSE','1');
      dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,'0',inttostr(j),'AR_VIEW','1');
    end;

    Application.ProcessMessages;
  end;
  RemoveChildNodes(tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex]);
  RemoveChildNodes(tv_List.Selected);
  AddEcuTreeView(tv_List.Selected,tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex],stNodeNo,stEcuID);
  tv_List.Refresh;
  tv_ListClick(tv_List);
end;

procedure TfmDeviceSetting.mn_ArmAreaMonitoring0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo :string;
  stArmAreaName : string;
  stTemp1,stTemp2:string;
begin
  inherited;
  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stNodeNo := ed_NodeNo.Text;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'A' then Exit;
  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stArmAreaNo := copy(stCode,4,2);
  if isDigit(stArmAreaNo) then stArmAreaNo := inttostr(strtoint(stArmAreaNo))
  else stArmAreaNo := '0';
  if dmDBFunction.CheckTB_ARMAREA(stNodeNo,stEcuID,'0',stArmAreaNo) = 0 then
  begin
    dmDBFunction.GetTB_DEVICE_DeviceInfo(stNodeNo,stEcuID,stArmAreaName,stTemp1,stTemp2);
    stArmAreaName := stArmAreaName + '_' + stArmAreaNo;
    dmDBInsert.InsertIntoTB_ARMAREA_DeviceARMAREAInit(stNodeNo,stEcuID,stArmAreaNo,stArmAreaName,stType,stType);
  end else
  begin
    dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,'0',stArmAreaNo,'AR_ARMAREAUSE',stType);
    dmDBUpdate.UpdateTB_ARMAREA_Field_StringValue(stNodeNo,stEcuID,'0',stArmAreaNo,'AR_VIEW',stType);
  end;
  if stType = '1' then
  begin
    tv_List.Selected.ImageIndex := con_ArmAreaImageIndex;
    tv_List.Selected.SelectedIndex := con_ArmAreaImageIndex;
  end else
  begin
    tv_List.Selected.ImageIndex := con_ArmAreaDisImageIndex;
    tv_List.Selected.SelectedIndex := con_ArmAreaDisImageIndex;
    dmDBDelete.DeleteTB_ARMAREA_Value(stNodeNo,stEcuID,'0',stArmAreaNo);
  end;
  tv_ListClick(tv_List);
end;

procedure TfmDeviceSetting.mn_ArmDelayTime0Click(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stType : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdArmInDelay,stEcuID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdArmOutDelay,stEcuID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdSystemInformation,stEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(nWinSocket,con_DeviceCmdArmInDelay,stEcuID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(nWinSocket,con_DeviceCmdArmOutDelay,stEcuID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdSystemInformation,stEcuID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_ArmDSCheck0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdARMDSCHECK,stEcuID,stDoorNo,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdARMDSCHECK,stEcuID,stDoorNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdARMDSCHECK,stEcuID,stDoorNo,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdARMDSCHECK,stEcuID,stDoorNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_ArmRelayType0Click(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stType : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdArmRelay,stEcuID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdArmRelay,stEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(nWinSocket,con_DeviceCmdArmRelay,stEcuID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdArmRelay,stEcuID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_AtDedicateUse0Click(Sender: TObject);
var
  stMessage : string;
  stData : string;
  stCode : string;
  stEcuID : string;
  stDoorNo : string;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;
  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stMessage := '근태전용 출입문 설정 변경시 권한 작업이 변경 될 수 있습니다. 계속 진행 하시겠습니까?';
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  stData := inttostr(TMenuItem(Sender).tag);
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(ed_NodeNo.Text,stEcuID,'0',stDoorNo,'DO_ATTYPE',stData);

(*  if stData = '0' then  //근태 전용에서 빠지면...
  begin
    if G_nCardDefaultDoorPermitType = 1 then //전체 권한을 가지고 시작 하는 타입이면
    begin
      dmDBFunction.CopyDeviceToCardPermitEmployeeCode(ed_NodeNo.Text,stEcuID,'0','1',stDoorNo,'1','N');
    end else
    begin
      dmDBFunction.CopyDeviceToCardPermitEmployeeCode(ed_NodeNo.Text,stEcuID,'0','1',stDoorNo,'0','Y');    //삭제는 전송하지 말자
    end;
  end; *)
  if stData = '1' then
  begin
    //근태 전용으로 변경 시에 근태 사용자를 모두 입력 하자.
    dmDBCardPermit.DoorAttendEmployeeGradePermitAdd(ed_NodeNo.Text,stEcuID,stDoorNo,con_ComLogTYPE_DOOR,'1','N');
  end;

  tv_ListClick(tv_List);
end;

procedure TfmDeviceSetting.mn_CardReaderBuildingInPositionClick(
  Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stCardReaderNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'C' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stCardReaderNo := copy(stCode,4,2);
  if isDigit(stCardReaderNo) then
  begin
    stCardReaderNo := inttostr(strtoint(stCardReaderNo));
  end else stCardReaderNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdBuildingPositionCode,stEcuID,stCardReaderNo,'0');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdBuildingPositionCode,stEcuID,stCardReaderNo,'0');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_CardReaderBuildingOutPositionClick(
  Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stCardReaderNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'C' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stCardReaderNo := copy(stCode,4,2);
  if isDigit(stCardReaderNo) then
  begin
    stCardReaderNo := inttostr(strtoint(stCardReaderNo));
  end else stCardReaderNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdBuildingPositionCode,stEcuID,stCardReaderNo,'1');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdBuildingPositionCode,stEcuID,stCardReaderNo,'1');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_CardReaderCommonTypeClick(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stCardReaderNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'C' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stCardReaderNo := copy(stCode,4,2);
  if isDigit(stCardReaderNo) then
  begin
    stCardReaderNo := inttostr(strtoint(stCardReaderNo));
  end else stCardReaderNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdType,stEcuID,stCardReaderNo,inttostr(TMenuItem(sender).Tag));
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdCardReaderType,stEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdType,stEcuID,stCardReaderNo,inttostr(TMenuItem(sender).Tag));
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdCardReaderType,stEcuID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_CardReaderDoorInPositionClick(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stCardReaderNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'C' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stCardReaderNo := copy(stCode,4,2);
  if isDigit(stCardReaderNo) then
  begin
    stCardReaderNo := inttostr(strtoint(stCardReaderNo));
  end else stCardReaderNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdDoorPosition,stEcuID,stCardReaderNo,'0');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdDoorPosition,stEcuID,stCardReaderNo,'0');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_CardReaderDoorOutPositionClick(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stCardReaderNo : string;
  nWinSocket : integer;
begin
  inherited;
(*
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'C' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stCardReaderNo := copy(stCode,4,2);
  if isDigit(stCardReaderNo) then
  begin
    stCardReaderNo := inttostr(strtoint(stCardReaderNo));
  end else stCardReaderNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdDoorPosition,stEcuID,stCardReaderNo,'1');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdDoorPosition,stEcuID,stCardReaderNo,'1');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
*)
end;

procedure TfmDeviceSetting.mn_CardReaderFingerTypeClick(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stCardReaderNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'C' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stCardReaderNo := copy(stCode,4,2);
  if isDigit(stCardReaderNo) then
  begin
    stCardReaderNo := inttostr(strtoint(stCardReaderNo));
  end else stCardReaderNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdType,stEcuID,stCardReaderNo,'1');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdCardReaderType,stEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdType,stEcuID,stCardReaderNo,'1');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdCardReaderType,stEcuID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
*)
end;

procedure TfmDeviceSetting.mn_CardReaderNotUseClick(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stCardReaderNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'C' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stCardReaderNo := copy(stCode,4,2);
  if isDigit(stCardReaderNo) then
  begin
    stCardReaderNo := inttostr(strtoint(stCardReaderNo));
  end else stCardReaderNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdUse,stEcuID,stCardReaderNo,'0');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdUse,stEcuID,stCardReaderNo,'0');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
*)
end;

procedure TfmDeviceSetting.mn_CardReaderUseClick(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stCardReaderNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'C' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stCardReaderNo := copy(stCode,4,2);
  if isDigit(stCardReaderNo) then
  begin
    stCardReaderNo := inttostr(strtoint(stCardReaderNo));
  end else stCardReaderNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdUse,stEcuID,stCardReaderNo,'1');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdUse,stEcuID,stCardReaderNo,'1');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,stEcuID,stCardReaderNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_controltime0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdCONTROLTIME,stEcuID,stDoorNo,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdCONTROLTIME,stEcuID,stDoorNo,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_DeviceNotUseClick(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stNodeNo : string;
  stEcuID : string;
  stType : string;
  stMessage : string;
begin
  inherited;

  if mn_DeviceNotUse.Checked then Exit; //이미 미사용 중이면 처리 할 필요 없다.

  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;

  stNodeNo := ed_NodeNo.Text;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;
  stEcuID := copy(stCode,2,2);
  if stEcuID = '00' then Exit; //주장치는 노드삭제에서만 삭제 할수 있다.

  stMessage := dmFormMessage.GetMessage('WORKMESSAGE');
  stMessage := stringReplace(stMessage,'$WORK',mn_DeviceNotUse.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  stMessage := dmFormMessage.GetMessage('DEVICEUNUSED');
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  dmDBDelete.DeleteTB_ARMAREA_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_CARDPERMIT_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_CARDPERMITCOMPANYGROUP_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_CARDPERMITEMPLOYEECODE_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_CARDPERMITEMPLOYEEGROUP_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_DEVICE_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_DEVICERCV_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_DOOR_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_DOORRCV_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_HOLIDAYDEVICE_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_READER_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_READERRCV_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_TIMECODEDEVICE_DeviceAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_ZONE_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_ZONERCV_ECUAll(stNodeNo,stEcuID);
  dmDBDelete.DeleteTB_ZONEEXTENTION_ECUAll(stNodeNo,stEcuID);

  RemoveChildNodes(tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex]);
  RemoveChildNodes(tv_List.Selected);
  tv_List.Selected.ImageIndex := con_DeviceNotUseImageIndex;
  tv_List.Selected.SelectedIndex := con_DeviceNotUseImageIndex;
  tv_ListClick(tv_List);
end;

procedure TfmDeviceSetting.mn_DeviceUseClick(Sender: TObject);
var
  stCode : string;
  stNodeNo : string;
  stEcuID : string;
  stNodeName : string;
  j,k : integer;
  nViewDoor : integer;
begin
  inherited;
  if mn_DeviceUse.Checked then Exit; //이미 미사용 중이면 처리 할 필요 없다.
  if tv_List.Selected = nil then
  begin
    Exit;
  end;

  if G_nProgramType = 2 then nViewDoor := 4
  else nViewDoor := 2;

  stNodeNo := ed_NodeNo.Text;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;
  stEcuID := copy(stCode,2,2);
  if stEcuID = '00' then Exit; //주장치는 노드관리에서만 관리 할수 있다.

  stNodeName := dmDBFunction.GetTB_NODE_NodeName(stNodeNo);

  if dmDBFunction.CheckTB_DEVICE_Value(stNodeNo,stEcuID,'0') = 0 then
  begin
    for j := 1 to G_nDefaultDoorCount do
    begin
      if j <= nViewDoor then
         dmDBInsert.InsertIntoTB_DOOR_DeviceDoorInit(stNodeNo,stEcuID,inttostr(j),stNodeName + '_' + stEcuID + '_' + inttostr(j),'1','1' )
      else
         dmDBInsert.InsertIntoTB_DOOR_DeviceDoorInit(stNodeNo,stEcuID,inttostr(j),stNodeName + '_' + stEcuID + '_' + inttostr(j),'0','0' );
      dmDBInsert.InsertIntoTB_DOORRCV_DeviceDoorInit(stNodeNo,stEcuID,inttostr(j));

      Application.ProcessMessages;
    end;
    for j := 0 to G_nDefaultArmAreaCount do
    begin
      if j = 0 then
        dmDBInsert.InsertIntoTB_ARMAREA_DeviceArmAreaInit(stNodeNo,stEcuID,inttostr(j),stNodeName + '_' + stEcuID + '_' + inttostr(j),'1','1' )
      else dmDBInsert.InsertIntoTB_ARMAREA_DeviceArmAreaInit(stNodeNo,stEcuID,inttostr(j),stNodeName + '_' + stEcuID + '_' + inttostr(j),'0','0' );
      Application.ProcessMessages;
    end;
    for j := 0 to G_nDefaultExtentionCount do
    begin
      for k := 1 to G_nDefaultZoneCount do
      begin
        dmDBInsert.InsertIntoTB_ZONE_ZoneInit(stNodeNo,stEcuID,inttostr(j),inttostr(k),stNodeName + '_' + stEcuID + '_' + inttostr(j)+ '_' + inttostr(k));
        dmDBInsert.InsertIntoTB_ZONERCV_ZoneInit(stNodeNo,stEcuID,inttostr(j),inttostr(k));
        Application.ProcessMessages;
      end;
      if j = 0 then
        dmDBInsert.InsertIntoTB_ZONEEXTENTION_ZoneInit(stNodeNo,stEcuID,inttostr(j),stNodeName + '_' + stEcuID + '_' + inttostr(j),'1')
      else dmDBInsert.InsertIntoTB_ZONEEXTENTION_ZoneInit(stNodeNo,stEcuID,inttostr(j),stNodeName + '_' + stEcuID + '_' + inttostr(j),'0');
    end;
    for j := 1 to G_nDefaultReaderCount do
    begin
      dmDBInsert.InsertIntoTB_READER_ReaderInit(stNodeNo,stEcuID,inttostr(j));
      dmDBInsert.InsertIntoTB_READERRCV_ReaderInit(stNodeNo,stEcuID,inttostr(j));
      Application.ProcessMessages;
    end;

//    for j := 0 to G_nDefaultExtentionCount do  //존의 위치를파악하기 위해서는 존확장기 위치를 가져가야 한다.
    begin
      j:=0;   //확장기 하나에만 적용하자.
      dmDBInsert.InsertIntoTB_DEVICE_DeviceInit(stNodeNo,stEcuID,inttostr(j),stNodeName + '_' + stEcuID + '_' + inttostr(j) ,'1');
      dmDBInsert.InsertIntoTB_DEVICERCV_DeviceInit(stNodeNo,stEcuID,inttostr(j));
      Application.ProcessMessages;
    end;

  end else
  begin
    dmDBUpdate.UpdateTB_DEVICE_DeviceUse(stNodeNo,stEcuID,'0','1');
  end;
  //타임코드 -> 타임코드기기테이블 복사
  dmDBInsert.InsertIntoTB_TIMECODEDEVICE_TimeCodeToDevice(stNodeNo,stEcuID,'0');
  dmDBFunction.copyHoliDayToDevice(stNodeNo,stEcuID);

  AddEcuTreeView(tv_List.Selected,tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex],stNodeNo,stEcuID);

  tv_List.Selected.ImageIndex := con_DeviceUseImageIndex;
  tv_List.Selected.SelectedIndex := con_DeviceUseImageIndex;
  tv_ListClick(tv_List);
end;

procedure TfmDeviceSetting.mn_Door2NotUseClick(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stType : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdDeviceDoor2RelayType,stEcuID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdDeviceDoor2RelayType,stEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(nWinSocket,con_DeviceCmdDeviceDoor2RelayType,stEcuID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdDeviceDoor2RelayType,stEcuID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_DoorArmType0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  stEcuID : string;
  stDoorNo :string;
  nIndex : integer;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;
  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';
  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdType,stEcuID,stDoorNo,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdSystemInformation,stEcuID,'U');
  end else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdType,stEcuID,stDoorNo,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdSystemInformation,stEcuID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_DoorBuildingcodeClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;
  if Not IsDigit(ed_NodeNo.Text) then Exit;
  L_stSelectNodeNo := ed_NodeNo.Text;
  L_stSelectEcuID := copy(stCode,2,2);
  L_stSelectDoorNo := copy(stCode,4,2);
  if isDigit(L_stSelectDoorNo) then L_stSelectDoorNo := inttostr(strtoint(L_stSelectDoorNo))
  else L_stSelectDoorNo := '0';


  pan_Building.Visible := True;
  lb_Building.Caption := mn_DoorBuildingcode.Caption;

  LoadBuildingTreeView('',tvDoorBuildingName,tvDoorBuildingCode,con_LocalBuildingImageIndex);
end;

procedure TfmDeviceSetting.mn_DoorMonitoring0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo :string;
  stDoorName : string;
  stTemp1,stTemp2 : string;
  stBuildingCode : string;
begin
  inherited;
  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;
  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stNodeNo := ed_NodeNo.Text;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  stBuildingCode := dmDBFunction.GetTB_DEVICE_BuildingCode(stNodeNo,stEcuID,'0');
  if dmDBFunction.CheckTB_Door(stNodeNo,stEcuID,stDoorNo) = 0 then
  begin
    dmDBFunction.GetTB_DEVICE_DeviceInfo(stNodeNo,stEcuID,stDoorName,stTemp1,stTemp2);
    stDoorName := stDoorName + '_' + stDoorNo;
    dmDBInsert.InsertIntoTB_DOOR_DeviceDoorInit(stNodeNo,stEcuID,stDoorNo,stDoorName,stType,stType);
    dmDBInsert.InsertIntoTB_DOORRCV_DeviceDoorInit(stNodeNo,stEcuID,stDoorNo);
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'BC_BUILDINGCODE',stBuildingCode);
  end else
  begin
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_VIEW',stType);
    dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_DOORUSE',stType);
    //dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'BC_BUILDINGCODE',stBuildingCode);
  end;

  if stType = '1' then
  begin
    tv_List.Selected.ImageIndex := con_DoorImageIndex;
    tv_List.Selected.SelectedIndex := con_DoorImageIndex;
  end else
  begin
    tv_List.Selected.ImageIndex := con_DoorDisImageIndex;
    tv_List.Selected.SelectedIndex := con_DoorDisImageIndex;
    dmDBDelete.DeleteTB_DOOR_Value(stNodeNo,stEcuID,'0',stDoorNo);
    dmDBDelete.DeleteTB_DOORRCV_Value(stNodeNo,stEcuID,'0',stDoorNo);
  end;
  tv_ListClick(tv_List);
end;

procedure TfmDeviceSetting.mn_DoorNameUpdateClick(Sender: TObject);
var
  stType : string;
  stCode : string;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo :string;
  stDoorName : string;
  stTemp1,stTemp2 : string;
begin
  inherited;
  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  ed_SelectCode.Text := stCode;
  if copy(stCode,1,1) <> 'D' then Exit;
  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stNodeNo := ed_NodeNo.Text;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  Pan_Workcode.Visible := True;
  lb_WorkType.Caption := '출입문 명칭 수정';
  ed_Name.Text := dmDBFunction.GetTB_DOOR_DoorName(stNodeNo,stEcuID,stDoorNo);
  mem_DoorMemo.Text := dmDBFunction.GetTB_Door_DoorMemo(stNodeNo,stEcuID,stDoorNo);
  ed_RelayCode.Text := dmDBFunction.GetTB_Door_RelayNo(stNodeNo,stEcuID,stDoorNo);
  L_stOrgRelayCode := ed_RelayCode.Text;
  ed_Name.SetFocus;


end;

procedure TfmDeviceSetting.mn_DoorOpenState0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdDSOPENSTATE,stEcuID,stDoorNo,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdDSOPENSTATE,stEcuID,stDoorNo,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_DsCheck0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
begin
  inherited;
(*
  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKUSE,stEcuID,stDoorNo,'1');
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKTIME,stEcuID,stDoorNo,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKUSE,stEcuID,stDoorNo,'U');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKTIME,stEcuID,stDoorNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKUSE,stEcuID,stDoorNo,'1');
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKTIME,stEcuID,stDoorNo,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKUSE,stEcuID,stDoorNo,'U');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKTIME,stEcuID,stDoorNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_ExtendUse10Click(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stType : string;
  stExtendID : string;
  stNodeName : string;
  i : integer;
begin
  inherited;
  stType := TmenuItem(Sender).hint;
  if Length(stType) < 2 then
  begin
    showmessage('프로그램 오류');
    Exit;
  end;
  stExtendID := stType[1];
  Delete(stType,1,1);

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stNodeName := dmDBFunction.GetTB_NODE_NodeName(ed_NodeNo.Text);
  if stType <> '0' then
  begin
    if dmDBFunction.CheckTB_DEVICE_Value(ed_NodeNo.Text,stEcuID,stExtendID) = 0 then
    begin
      dmDBInsert.InsertIntoTB_DEVICE_DeviceInit(ed_NodeNo.Text,stEcuID,stExtendID,stNodeName + '_' + stEcuID + '_' + stExtendID ,'1');
      dmDBInsert.InsertIntoTB_DEVICERCV_DeviceInit(ed_NodeNo.Text,stEcuID,stExtendID);
    end else
    begin
      dmDBUpdate.UpdateTB_DEVICE_DeviceUse(ed_NodeNo.Text,stEcuID,stExtendID,'1');
    end;
  end else
  begin
    dmDBDelete.DeleteTB_DEVICE_Extend(ed_NodeNo.Text,stEcuID,stExtendID);
    dmDBDelete.DeleteTB_DEVICERCV_Extend(ed_NodeNo.Text,stEcuID,stExtendID);
  end;

  if dmDBFunction.CheckTB_ZONEEXTENTION_Key(ed_NodeNo.Text,stEcuID,stExtendID) = 1 then
  begin
    dmDBUpdate.UpdateTB_ZONEEXTENTION_Field_StringValue(ed_NodeNo.Text,stEcuID,stExtendID,'ZE_TYPE',stType);
  end else if stType <> '0' then
  begin
    dmDBInsert.InsertIntoTB_ZONEEXTENTION_ZoneInit(ed_NodeNo.Text,stEcuID,stExtendID,ed_NodeName.Text + '_' + stEcuID + '_' + stExtendID,stType);
  end;
  if stType <> '0' then
  begin
    for i := 1 to 8 do
    begin
      if dmDBFunction.CheckTB_ZONE_Key(ed_NodeNo.Text,stEcuID,stExtendID,inttostr(i)) <> 1 then
      begin
        dmDBInsert.InsertIntoTB_ZONE_ZoneInit(ed_NodeNo.Text,stEcuID,stExtendID,inttostr(i),ed_NodeName.Text + '_' + stEcuID + '_' + stExtendID+ '_' + inttostr(i));
      end;
    end;
  end else
  begin
    dmDBDelete.DeleteTB_ZONE_ExtendAll(ed_NodeNo.Text,stEcuID,stExtendID);
  end;

  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);

end;

procedure TfmDeviceSetting.mn_FdDedicateUse0Click(Sender: TObject);
var
  stMessage : string;
  stData : string;
  stCode : string;
  stEcuID : string;
  stDoorNo : string;
  nIndex : integer;
  bDeviceServerMode : Boolean;
  nWinSocket : integer;
  stTemp : string;
  i : integer;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;
  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stMessage := '식수전용 출입문 설정 변경시 권한 작업이 변경 될 수 있습니다. 계속 진행 하시겠습니까?';
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  stData := inttostr(TMenuItem(Sender).tag);
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(ed_NodeNo.Text,stEcuID,'0','1','DO_FDTYPE',stData);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(ed_NodeNo.Text,stEcuID,'0','2','DO_FDTYPE',stData);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(ed_NodeNo.Text,stEcuID,'0','3','DO_FDTYPE',stData);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(ed_NodeNo.Text,stEcuID,'0','4','DO_FDTYPE',stData);
  if G_bFoodDedicateDoorUse then
  begin
    if stData = '1' then
    begin
      dmDBDelete.DeleteTB_CARDPERMITCOMPANYGROUP_FDType;
      dmDBDelete.DeleteTB_CARDPERMITEMPLOYEEGROUP_FDType;
      // --- 식수권한 재작업
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FDTypeAdd;
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_FDNotTypeDelete;
      dmDBInsert.InsertIntoTB_CARDPERMITEMPLOYEECODE_FDTypeAdd;
    end;
  end;

  if stData = '1' then
  begin
    //식수 전용으로 변경 시에 식수 사용자를 모두 입력 하자.
    dmDBCardPermit.DoorFoodEmployeeGradePermitAdd(ed_NodeNo.Text,stEcuID,stDoorNo,con_ComLogTYPE_DOOR,'1','N');
  end;

  tv_ListClick(tv_List);

end;

procedure TfmDeviceSetting.mn_FireOpen0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
  stNodeNo : string;
begin
  inherited;

  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;
  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stNodeNo := ed_NodeNo.Text;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_FIREDOOROPEN',stType);
  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_MEMLOAD','N');

(*  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdFIREDOOROPEN,stEcuID,stDoorNo,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdFIREDOOROPEN,stEcuID,stDoorNo,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_JaejungDelay0Click(Sender: TObject);
var
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stType : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;
  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdJaeJungDelayUse,stEcuID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdJaeJungDelayUse,stEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(nWinSocket,con_DeviceCmdJaeJungDelayUse,stEcuID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdJaeJungDelayUse,stEcuID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_JavaraArmCloseClick(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  if TmenuItem(Sender).Checked then stType := '1'
  else stType := '0';

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdJAVARAARMCLOSE,stEcuID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdJAVARAARMCLOSE,stEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(nWinSocket,con_DeviceCmdJAVARAARMCLOSE,stEcuID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdJAVARAARMCLOSE,stEcuID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_JavaraAutoCloseClick(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  if TmenuItem(Sender).Checked then stType := '1'
  else stType := '0';

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDInformation(con_DeviceCmdJAVARAAUTOCLOSE,stEcuID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdJAVARAAUTOCLOSE,stEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDInformation(nWinSocket,con_DeviceCmdJAVARAAUTOCLOSE,stEcuID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdJAVARAAUTOCLOSE,stEcuID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_LockType0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
  stOpenDoorTime : string;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';
  stOpenDoorTime := '3';
  if (stType = '6') OR (stType = '8') OR (stType = '10') then stOpenDoorTime := '500ms';

  if stType = '10' then
  begin
    if stDoorNo = '2' then  stType := '11'; //자바라 타입이면서 출입문 번호가 2번이면 무조건 자바라 열림으로 설정
  end;


  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdLOCKTYPE,stEcuID,stDoorNo,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdCONTROLTIME,stEcuID,stDoorNo,stOpenDoorTime);
    if stType = '3' then   //데드볼트이면
    begin
      TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKUSE,stEcuID,stDoorNo,'1');
      TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKTIME,stEcuID,stDoorNo,'1');
    end;
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdLOCKTYPE,stEcuID,stDoorNo,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdCONTROLTIME,stEcuID,stDoorNo,stOpenDoorTime);
      if stType = '3' then
      begin
        dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKUSE,stEcuID,stDoorNo,'1');
        dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdDeadBoltDSCHECKTIME,stEcuID,stDoorNo,'1');
      end;
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_LongOpenAlarmSound0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdLONGOPENALARM,stEcuID,stDoorNo,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdLONGOPENALARM,stEcuID,stDoorNo,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_longopenEventTime0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stDoorNo : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdLONGOPENTIME,stEcuID,stDoorNo,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdLONGOPENTIME,stEcuID,stDoorNo,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_Schedule0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
begin
  inherited;
  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stNodeNo := ed_NodeNo.Text;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';

  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_SCHEDULEUSE',stType);
  dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_DOORSCHUSE','N');
  dmDBUpdate.UpdateTB_DOORRCV_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_SETTINGINFO','N');   //이건 굳이 처리 할 필요 없다.  'N'으로 변경시 컨트롤러에서 출입문 정보를 수신하여 전송
  tv_ListClick(tv_List);
end;

procedure TfmDeviceSetting.mn_TimeCodeUse0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
begin
  inherited;
  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'D' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stNodeNo := ed_NodeNo.Text;
  stEcuID := copy(stCode,2,2);
  stDoorNo := copy(stCode,4,2);
  if isDigit(stDoorNo) then stDoorNo := inttostr(strtoint(stDoorNo))
  else stDoorNo := '0';


  dmDBUpdate.UpdateTB_DOOR_Field_StringValue(stNodeNo,stEcuID,'0',stDoorNo,'DO_TIMECODEUSE',stType);
  dmDBUpdate.UpdateTB_DEVICERCV_Field_StringValue(stNodeNo,stEcuID,'0','DE_TIMECODEUSE','U');
  tv_ListClick(tv_List);


end;

procedure TfmDeviceSetting.mn_ZoneArmArea0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stZoneID : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'Z' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stZoneID := copy(stCode,4,4);

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeZone,con_ZoneCmdArmArea,stEcuID,stZoneID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeZone,con_ZoneCmdSetting,stEcuID,stZoneID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdArmArea,stEcuID,stZoneID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdSetting,stEcuID,stZoneID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_ZoneDelay0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stZoneID : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'Z' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stZoneID := copy(stCode,4,4);

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeZone,con_ZoneCmdDelayUse,stEcuID,stZoneID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeZone,con_ZoneCmdSetting,stEcuID,stZoneID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdDelayUse,stEcuID,stZoneID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdSetting,stEcuID,stZoneID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_ZoneRecovery0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stZoneID : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'Z' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stZoneID := copy(stCode,4,4);

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeZone,con_ZoneCmdRecovery,stEcuID,stZoneID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeZone,con_ZoneCmdSetting,stEcuID,stZoneID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdRecovery,stEcuID,stZoneID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdSetting,stEcuID,stZoneID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

procedure TfmDeviceSetting.mn_ZoneType0Click(Sender: TObject);
var
  stType : string;
  stCode : string;
  nIndex : integer;
  stEcuID : string;
  stZoneID : string;
  nWinSocket : integer;
begin
  inherited;
(*  stType := TmenuItem(Sender).hint;

  if tv_List.Selected = nil then
  begin
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'Z' then Exit;

  if Not IsDigit(ed_NodeNo.Text) then Exit;
  stEcuID := copy(stCode,2,2);
  stZoneID := copy(stCode,4,4);

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeZone,con_ZoneCmdType,stEcuID,stZoneID,stType);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeZone,con_ZoneCmdSetting,stEcuID,stZoneID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdType,stEcuID,stZoneID,stType);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdSetting,stEcuID,stZoneID,'U');
    end;
  end;
  TreeViewCopy;
  SearchDeviceList(ed_NodeNo.Text,stCode);
  tv_ListClick(self);
  *)
end;

function TfmDeviceSetting.MoveCardReaderArmArea(aNodeNo,aEcuID,aCardReaderNo,aArmAreaNo: string): Boolean;
var
  nIndex : integer;
  nWinSocket : integer;
begin
  result := False;
(*  nIndex := NodeList.IndexOf(aNodeNo);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdDoorNo,aEcuID,aCardReaderNo,'0');
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdArmAreaNo,aEcuID,aCardReaderNo,aArmAreaNo);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,aEcuID,aCardReaderNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdDoorNo,aEcuID,aCardReaderNo,'0');
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_CardReaderCmdArmAreaNo,con_CardReaderCmdDoorNo,aEcuID,aCardReaderNo,aArmAreaNo);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,aEcuID,aCardReaderNo,'U');
    end;
  end;
  result := True;
  *)
end;

function TfmDeviceSetting.MoveCardReaderDoorNo(aNodeNo, aEcuID, aCardReaderNo,
  aDoorNo: string): Boolean;
var
  nIndex : integer;
  nWinSocket : integer;
begin
  result := False;
(*  nIndex := NodeList.IndexOf(aNodeNo);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdDoorNo,aEcuID,aCardReaderNo,aDoorNo);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,aEcuID,aCardReaderNo,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdDoorNo,aEcuID,aCardReaderNo,aDoorNo);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeCardReader,con_CardReaderCmdSettingInfo,aEcuID,aCardReaderNo,'U');
    end;
  end;
  result := True;
  *)
end;

function TfmDeviceSetting.MoveDoorAccessOnly(aNodeNo, aEcuID, aDoorNo,
  aEcuNo: string): Boolean;
var
  nIndex : integer;
  nWinSocket : integer;
begin
  result := False;
(*  nIndex := NodeList.IndexOf(aNodeNo);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdType,aEcuID,aDoorNo,'1');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdSystemInformation,aEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdType,aEcuID,aDoorNo,'1');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdSystemInformation,aEcuID,'U');
    end;
  end;
  result := True;
  *)
end;

function TfmDeviceSetting.MoveDoorArmArea(aNodeNo, aEcuID, aDoorNo,
  aArmAreaNo: string): Boolean;
var
  nIndex : integer;
  nWinSocket : integer;
  stTemp : string;
begin
  result := False;
(*  nIndex := NodeList.IndexOf(aNodeNo);
  if nIndex > -1 then
  begin
    stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdType,aEcuID,aDoorNo);
    if stTemp = '1' then     //출입전용이면 출입 + 방범으로 변경
    begin
      TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdType,aEcuID,aDoorNo,'2');
      TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdSystemInformation,aEcuID,'U');
    end;
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdArmArea,aEcuID,aDoorNo,aArmAreaNo);
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdDeviceDoorArmArea,aEcuID,'U');
    TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdSystemInformation,aEcuID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdType,aEcuID,aDoorNo);
      if stTemp = '1' then     //출입전용이면 출입 + 방범으로 변경
      begin
        dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdType,aEcuID,aDoorNo,'2');
        dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdSystemInformation,aEcuID,'U');
      end;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdArmArea,aEcuID,aDoorNo,aArmAreaNo);
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdDeviceDoorArmArea,aEcuID,'U');
      dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdSystemInformation,aEcuID,'U');
    end;
  end;
  result := True;
  *)
end;

function TfmDeviceSetting.MoveZoneArmArea(aNodeNo, aEcuID,aExtendID, aZoneNo,
  aArmAreaNo: string): Boolean;
var
  nIndex : integer;
  nWinSocket : integer;
  stZoneID : string;
begin
  result := False;
(*  nIndex := NodeList.IndexOf(aNodeNo);
  stZoneID := FillZeroNumber(strtoint(aExtendID),2) + FillZeroNumber(strtoint(aZoneNo),2);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeZone,con_ZoneCmdArmArea,aEcuID,stZoneID,aArmAreaNo);
    TNode(NodeList.Objects[nIndex]).SetDeviceRCVIDSubInformation(con_DeviceTypeZone,con_ZoneCmdSetting,aEcuID,stZoneID,'U');
  end
  else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdArmArea,stZoneID,aZoneNo,aArmAreaNo);
      dmNodeServer.DeviceNodeServer_SetDeviceRCVIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdSetting,aEcuID,stZoneID,'U');
    end;
  end;
  result := True;
  *)
end;

procedure TfmDeviceSetting.pan_leftResize(Sender: TObject);
begin
  inherited;
  tv_List.Left := 10;
  tv_List.Width := pan_left.Width - (tv_List.Left * 2);
  tv_List.Height := pan_left.Height - (tv_List.Top + 10);

  lb_iconState.Left := tv_List.Left + tv_List.Width - lb_iconState.Width;
  gb_IconState.Left := tv_List.Left;
  gb_IconState.top := tv_List.top;
  gb_IconState.Width := tv_List.Width;
end;

procedure TfmDeviceSetting.PortClick(aEcuID, aExtendID, aSubNo: string);
var
  nIndex : integer;
  stTemp : string;
  stZoneID : string;
  bDeviceServerMode : Boolean;
  nWinSocket : integer;
begin
(*  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then bDeviceServerMode := True
  else
  begin
     nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
     if nIndex > -1 then
     begin
      bDeviceServerMode := False;
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
     end else Exit;
  end;

  stZoneID := FillZeroNumber(strtoint(aExtendID),2) + FillZeroNumber(strtoint(aSubNo),2);
  if bDeviceServerMode then
    stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeZone,con_ZoneCmdType,aEcuID,stZoneID)
  else stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdType,aEcuID,stZoneID);
  if Not isDigit(stTemp) then stTemp := '0';
  case stTemp[1] of
    '0' : begin
      mn_ZoneType0.Checked := True;
      mn_ZoneType1.Checked := False;
      mn_ZoneType2.Checked := False;
      mn_ZoneType3.Checked := False;
      mn_ZoneType4.Checked := False;
      mn_ZoneType5.Checked := False;
      mn_ZoneType6.Checked := False;
    end;
    '1' : begin
      mn_ZoneType0.Checked := False;
      mn_ZoneType1.Checked := True;
      mn_ZoneType2.Checked := False;
      mn_ZoneType3.Checked := False;
      mn_ZoneType4.Checked := False;
      mn_ZoneType5.Checked := False;
      mn_ZoneType6.Checked := False;
    end;
    '2' : begin
      mn_ZoneType0.Checked := False;
      mn_ZoneType1.Checked := False;
      mn_ZoneType2.Checked := True;
      mn_ZoneType3.Checked := False;
      mn_ZoneType4.Checked := False;
      mn_ZoneType5.Checked := False;
      mn_ZoneType6.Checked := False;
    end;
    '3' : begin
      mn_ZoneType0.Checked := False;
      mn_ZoneType1.Checked := False;
      mn_ZoneType2.Checked := False;
      mn_ZoneType3.Checked := True;
      mn_ZoneType4.Checked := False;
      mn_ZoneType5.Checked := False;
      mn_ZoneType6.Checked := False;
    end;
    '4' : begin
      mn_ZoneType0.Checked := False;
      mn_ZoneType1.Checked := False;
      mn_ZoneType2.Checked := False;
      mn_ZoneType3.Checked := False;
      mn_ZoneType4.Checked := True;
      mn_ZoneType5.Checked := False;
      mn_ZoneType6.Checked := False;
    end;
    '5' : begin
      mn_ZoneType0.Checked := False;
      mn_ZoneType1.Checked := False;
      mn_ZoneType2.Checked := False;
      mn_ZoneType3.Checked := False;
      mn_ZoneType4.Checked := False;
      mn_ZoneType5.Checked := True;
      mn_ZoneType6.Checked := False;
    end;
    '6' : begin
      mn_ZoneType0.Checked := False;
      mn_ZoneType1.Checked := False;
      mn_ZoneType2.Checked := False;
      mn_ZoneType3.Checked := False;
      mn_ZoneType4.Checked := False;
      mn_ZoneType5.Checked := False;
      mn_ZoneType6.Checked := True;
    end;
  end;

  if bDeviceServerMode then
    stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeZone,con_ZoneCmdDelayUse,aEcuID,stZoneID)
  else stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdDelayUse,aEcuID,stZoneID);
  if Not isDigit(stTemp) then stTemp := '0';
  case stTemp[1] of
    '0' : begin
      mn_ZoneDelay0.Checked := True;
      mn_ZoneDelay1.Checked := False;
    end;
    '1' : begin
      mn_ZoneDelay0.Checked := False;
      mn_ZoneDelay1.Checked := True;
    end;
  end;

  if bDeviceServerMode then
    stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeZone,con_ZoneCmdRecovery,aEcuID,stZoneID)
  else stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdRecovery,aEcuID,stZoneID);
  if Not isDigit(stTemp) then stTemp := '0';
  case stTemp[1] of
    '0' : begin
      mn_ZoneRecovery0.Checked := True;
      mn_ZoneRecovery1.Checked := False;
    end;
    '1' : begin
      mn_ZoneRecovery0.Checked := False;
      mn_ZoneRecovery1.Checked := True;
    end;
  end;

  if bDeviceServerMode then
    stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIDInformation(con_DeviceCmdArmAreaUse,aEcuID)
  else stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIDInformation(nWinSocket,con_DeviceCmdArmAreaUse,aEcuID);
  if stTemp = '' then stTemp := '0';
  case stTemp[1] of
    '0' : begin
      mn_ZoneArmArea.Visible := False;
    end;
    '1' : begin
      mn_ZoneArmArea.Visible := True;
      if bDeviceServerMode then
        stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIDSubInformation(con_DeviceTypeZone,con_ZoneCmdArmArea,aEcuID,stZoneID)
      else stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIDSubInformation(nWinSocket,con_DeviceTypeZone,con_ZoneCmdArmArea,aEcuID,stZoneID);
      if Not isDigit(stTemp) then stTemp := '1';
      case strtoint(stTemp) of
        1 : begin
          mn_ZoneArmArea1.Checked := True;
          mn_ZoneArmArea2.Checked := False;
          mn_ZoneArmArea3.Checked := False;
          mn_ZoneArmArea4.Checked := False;
          mn_ZoneArmArea5.Checked := False;
          mn_ZoneArmArea6.Checked := False;
          mn_ZoneArmArea7.Checked := False;
          mn_ZoneArmArea8.Checked := False;
        end;
        2 : begin
          mn_ZoneArmArea1.Checked := False;
          mn_ZoneArmArea2.Checked := True;
          mn_ZoneArmArea3.Checked := False;
          mn_ZoneArmArea4.Checked := False;
          mn_ZoneArmArea5.Checked := False;
          mn_ZoneArmArea6.Checked := False;
          mn_ZoneArmArea7.Checked := False;
          mn_ZoneArmArea8.Checked := False;
        end;
        3 : begin
          mn_ZoneArmArea1.Checked := False;
          mn_ZoneArmArea2.Checked := False;
          mn_ZoneArmArea3.Checked := True;
          mn_ZoneArmArea4.Checked := False;
          mn_ZoneArmArea5.Checked := False;
          mn_ZoneArmArea6.Checked := False;
          mn_ZoneArmArea7.Checked := False;
          mn_ZoneArmArea8.Checked := False;
        end;
        4 : begin
          mn_ZoneArmArea1.Checked := False;
          mn_ZoneArmArea2.Checked := False;
          mn_ZoneArmArea3.Checked := False;
          mn_ZoneArmArea4.Checked := True;
          mn_ZoneArmArea5.Checked := False;
          mn_ZoneArmArea6.Checked := False;
          mn_ZoneArmArea7.Checked := False;
          mn_ZoneArmArea8.Checked := False;
        end;
        5 : begin
          mn_ZoneArmArea1.Checked := False;
          mn_ZoneArmArea2.Checked := False;
          mn_ZoneArmArea3.Checked := False;
          mn_ZoneArmArea4.Checked := False;
          mn_ZoneArmArea5.Checked := True;
          mn_ZoneArmArea6.Checked := False;
          mn_ZoneArmArea7.Checked := False;
          mn_ZoneArmArea8.Checked := False;
        end;
        6 : begin
          mn_ZoneArmArea1.Checked := False;
          mn_ZoneArmArea2.Checked := False;
          mn_ZoneArmArea3.Checked := False;
          mn_ZoneArmArea4.Checked := False;
          mn_ZoneArmArea5.Checked := False;
          mn_ZoneArmArea6.Checked := True;
          mn_ZoneArmArea7.Checked := False;
          mn_ZoneArmArea8.Checked := False;
        end;
        7 : begin
          mn_ZoneArmArea1.Checked := False;
          mn_ZoneArmArea2.Checked := False;
          mn_ZoneArmArea3.Checked := False;
          mn_ZoneArmArea4.Checked := False;
          mn_ZoneArmArea5.Checked := False;
          mn_ZoneArmArea6.Checked := False;
          mn_ZoneArmArea7.Checked := True;
          mn_ZoneArmArea8.Checked := False;
        end;
        8 : begin
          mn_ZoneArmArea1.Checked := False;
          mn_ZoneArmArea2.Checked := False;
          mn_ZoneArmArea3.Checked := False;
          mn_ZoneArmArea4.Checked := False;
          mn_ZoneArmArea5.Checked := False;
          mn_ZoneArmArea6.Checked := False;
          mn_ZoneArmArea7.Checked := False;
          mn_ZoneArmArea8.Checked := True;
        end;
      end;
    end;
  end;
  *)
end;

procedure TfmDeviceSetting.RemoveChildNodes(aNode: TTreeNode);
begin
  aNode.DeleteChildren;
end;

procedure TfmDeviceSetting.SearchDeviceList(aNodeNo,aSelectCode: string);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  sTreeView : TTreeview;
  aNode1,aNode2,aNode3 : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  sNode1,sNode2 : TTreeNode;
  nDeviceCount : integer;
  nDoorArmAreaNo : integer;
  nCardReaderCount : integer;
  nCardReaderDoorNo : integer;
  nCardReaderArmAreaNo : integer;
  nExtentionCount : integer;
  nZoneCount : integer;
  nZoneArmAreaNo : integer;
  bArmAreaUse : Boolean;
  bDoorArmAreaUse : Boolean; //출입문 방범구역 사용유무
  bCardReaderUse : Boolean;  //카드리더 사용유무
  bZoneExtentionUse : Boolean; //존확장기 사용유무
  stDeviceUseState : string;
  stZoneName : string;
  stTemp : string;
  i,j,k : integer;

  stEcuUse : string;
  stArmAreaUse : string;
  stEcuID : string;
  stEcuName : string;
  stArmAreaName : string;
  stArmAreaView : string;
  stDoorName : string;
  stDoorView : string;
  stDoorMemo : string;
  nArmAreaCount : integer;
  nDoorCount : integer;
begin
  aTreeView := tv_List;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := tv_Code;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;
  sTreeView := tv_State;

  nArmAreaCount := 8;
  nDoorCount := 8;

  for i := 0 to 63 do
  begin
    stEcuID := FillZeroNumber(i,2);
    dmDBFunction.GetTB_DEVICE_DeviceInfo(aNodeNo,stEcuID,stEcuName,stEcuUse,stArmAreaUse);
    aNode1 := aTreeView.Items.Add(nil,stEcuID + ':' + stEcuName);
    vNode1 := vTreeView.Items.Add(nil,'E' + stEcuID);
    if stEcuUse = '1' then
    begin
      aNode1.ImageIndex := con_DeviceUseImageIndex;
      aNode1.SelectedIndex := con_DeviceUseImageIndex;
      //방범구역 추가하자.
      if stArmAreaUse = '1' then
      begin
        for j := 1 to nArmAreaCount do
        begin
          dmDBFunction.GetTB_ARMAREA_ArmAreaInfo(aNodeNo,stEcuID,inttostr(j),stArmAreaName,stArmAreaView);
          if stArmAreaName = '' then stArmAreaName := stEcuID + '_' + inttostr(j);

          aNode2:= aTreeView.Items.AddChild(aNode1,inttostr(j) + ':' + stArmAreaName);
          vNode2 := vTreeView.Items.AddChild(vNode1,'A' + stEcuID + FillZeroNumber(j,2)); //방범구역
          if stArmAreaView = '1' then
          begin
            aNode2.ImageIndex := con_ArmAreaImageIndex;
            aNode2.SelectedIndex := con_ArmAreaImageIndex;
          end else
          begin
            aNode2.ImageIndex := con_ArmAreaDisImageIndex;
            aNode2.SelectedIndex := con_ArmAreaDisImageIndex;
          end;
        end;
      end else
      begin
        dmDBFunction.GetTB_ARMAREA_ArmAreaInfo(aNodeNo,stEcuID,'0',stArmAreaName,stArmAreaView);
        if stArmAreaName = '' then stArmAreaName := stEcuID ;
        aNode2:= aTreeView.Items.AddChild(aNode1,stArmAreaName);
        vNode2 := vTreeView.Items.AddChild(vNode1,'A' + stEcuID + FillZeroNumber(0,2)); //방범구역
        if stArmAreaView = '1' then
        begin
          aNode2.ImageIndex := con_ArmAreaImageIndex;
          aNode2.SelectedIndex := con_ArmAreaImageIndex;
        end else
        begin
          aNode2.ImageIndex := con_ArmAreaDisImageIndex;
          aNode2.SelectedIndex := con_ArmAreaDisImageIndex;
        end;
      end;
      //출입문 추가하자.
      for j := 1 to nDoorCount do
      begin
        dmDBFunction.GetTB_DOOR_DoorInfo(aNodeNo,stEcuID,inttostr(j),stDoorName,stDoorView,stDoorMemo);
        aNode2:= aTreeView.Items.AddChild(aNode1,inttostr(j) + ':' + stDoorName);
        vNode2 := vTreeView.Items.AddChild(vNode1,'D' + stEcuID + FillZeroNumber(j,2)); //방범구역
        if stDoorView = '1' then
        begin
          aNode2.ImageIndex := con_DoorImageIndex;
          aNode2.SelectedIndex := con_DoorImageIndex;
        end else
        begin
          aNode2.ImageIndex := con_DoorDisImageIndex;
          aNode2.SelectedIndex := con_DoorDisImageIndex;
        end;
      end;
      (*//카드리더 추가하자.
      for j := 1 to 8 do
      begin
        aNode2:= aTreeView.Items.AddChild(aNode1,FillZeroNumber(j,2));
        vNode2 := vTreeView.Items.AddChild(vNode1,'C' + stEcuID + FillZeroNumber(j,2)); //방범구역
        aNode2.ImageIndex := con_CardReaderUseImageIndex;
        aNode2.SelectedIndex := con_CardReaderUseImageIndex;
      end;
      *)
    end else
    begin
      aNode1.ImageIndex := con_DeviceNotUseImageIndex;
      aNode1.SelectedIndex := con_DeviceNotUseImageIndex;
    end;
  end;
(*      //방범구역 추가

      if TNode(NodeList.Objects[aIndex]).GetDeviceIndexInformation(con_DeviceCmdArmAreaUse,i) = '1' then bArmAreaUse := True
      else bArmAreaUse := False;

      if bArmAreaUse then
      begin
        stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexInformation(con_DeviceCmdArmAreaCount,i);
        if isDigit(stTemp) then nArmAreaCount := strtoint(stTemp)
        else nArmAreaCount := 0;
        if nArmAreaCount > 0 then
        begin
          for j := 1 to nArmAreaCount do
          begin
            stArmAreaName := TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeArmArea,con_ArmAreaCmdName,i,j);
            aNode2:= aTreeView.Items.AddChild(aNode1,FillZeroNumber(j,2) + ':' + stArmAreaName);
            vNode2 := vTreeView.Items.AddChild(vNode1,'A' + stEcuID + FillZeroNumber(j,2)); //방범구역
            aNode2.ImageIndex := con_ArmAreaImageIndex;
            aNode2.SelectedIndex := con_ArmAreaImageIndex;
          end;
        end;
      end else
      begin
        stArmAreaName := TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeArmArea,con_ArmAreaCmdName,i,0);
        aNode2:= aTreeView.Items.AddChild(aNode1,FillZeroNumber(0,2) + ':' + stArmAreaName);
        vNode2 := vTreeView.Items.AddChild(vNode1,'A' + stEcuID + FillZeroNumber(0,2)); //방범구역
        aNode2.ImageIndex := con_ArmAreaImageIndex;
        aNode2.SelectedIndex := con_ArmAreaImageIndex;
      end;
      //출입문 추가
      stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexInformation(con_DeviceCmdDoorCount,i);
      if isDigit(stTemp) then nDoorCount := strtoint(stTemp)
      else nDoorCount := 0;

      if nDoorCount > 0 then
      begin
        for j := 0 to nDoorCount - 1 do   //1번 출입문은 Index 0
        begin
          if TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeDoor,con_DoorCmdUse,i,j) = '1' then
          begin
            stDoorName := TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeDoor,con_DoorCmdName,i,j);
            stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeDoor,con_DoorCmdArmAreaUse,i,j);
            if stTemp = '1' then bDoorArmAreaUse := True
            else bDoorArmAreaUse := False;

            if bDoorArmAreaUse then
            begin
              stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeDoor,con_DoorCmdArmAreaNo,i,j);
              if isDigit(stTemp) then nDoorArmAreaNo := strtoint(stTemp)
              else nDoorArmAreaNo := 0;

              vNode2:= GetNodeByText(vTreeView,'A' + stEcuID + FillZeroNumber(nDoorArmAreaNo,2),True);
              if vNode2 <> nil then
              begin
                aNode2 := aTreeView.Items.Item[vNode2.AbsoluteIndex];
                if aNode2 <> nil then
                begin
                  aNode3 := aTreeView.Items.AddChild(aNode2,FillZeroNumber(j + 1,2) + ':' + stDoorName);
                  vNode3 := vTreeView.Items.AddChild(vNode2,'D' + stEcuID + FillZeroNumber(j + 1,2));
                  aNode3.ImageIndex := con_DoorImageIndex;
                  aNode3.SelectedIndex := con_DoorImageIndex;
                end;
              end else
              begin
                aNode2:= aTreeView.Items.AddChild(aNode1,FillZeroNumber(j + 1,2) + ':' + stDoorName);
                vNode2 := vTreeView.Items.AddChild(vNode1,'D' + stEcuID + FillZeroNumber(j + 1,2)); //출입문
                aNode2.ImageIndex := con_DoorImageIndex;
                aNode2.SelectedIndex := con_DoorImageIndex;
              end;
            end else
            begin
              aNode2:= aTreeView.Items.AddChild(aNode1,FillZeroNumber(j + 1,2) + ':' + stDoorName);
              vNode2 := vTreeView.Items.AddChild(vNode1,'D' + stEcuID + FillZeroNumber(j + 1,2)); //출입문
              aNode2.ImageIndex := con_DoorImageIndex;
              aNode2.SelectedIndex := con_DoorImageIndex;
            end;
          end;
        end;
      end;

      //카드리더 추가
      stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexInformation(con_DeviceCmdCardReaderCount,i);
      if isDigit(stTemp) then nCardReaderCount := strtoint(stTemp)
      else nCardReaderCount := 0;

      if nCardReaderCount > 0 then
      begin
        for j := 0 to nCardReaderCount - 1 do   //1번 카드리더은 Index 0
        begin
          stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdUse,i,j);
          if stTemp = '1' then bCardReaderUse := True
          else bCardReaderUse := False;

          stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdDoorNo,i,j);
          if isDigit(stTemp) then nCardReaderDoorNo := strtoint(stTemp)
          else nCardReaderDoorNo := 0;

          if nCardReaderDoorNo > 0 then
          begin
            vNode2:= GetNodeByText(vTreeView,'D' + stEcuID + FillZeroNumber(nCardReaderDoorNo,2),True);
            if vNode2 <> nil then
            begin
              aNode2 := aTreeView.Items.Item[vNode2.AbsoluteIndex];
              if aNode2 <> nil then
              begin
                aNode3 := aTreeView.Items.AddChild(aNode2,FillZeroNumber(j+1,2));
                vNode3 := vTreeView.Items.AddChild(vNode2,'C' + stEcuID + FillZeroNumber(j + 1,2));
                if bCardReaderUse then
                begin
                  aNode3.ImageIndex := con_CardReaderUseImageIndex;
                  aNode3.SelectedIndex := con_CardReaderUseImageIndex;
                end else
                begin
                  aNode3.ImageIndex := con_CardReaderNotUseImageIndex;
                  aNode3.SelectedIndex := con_CardReaderNotUseImageIndex;
                end;
              end;
            end;
          end else   //방범전용
          begin
            stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeCardReader,con_CardReaderCmdArmAreaNo,i,j);
            if isDigit(stTemp) then nCardReaderArmAreaNo := strtoint(stTemp)
            else nCardReaderArmAreaNo := 0;
            vNode2:= GetNodeByText(vTreeView,'A' + stEcuID + FillZeroNumber(nCardReaderArmAreaNo,2),True);
            if vNode2 <> nil then
            begin
              aNode2 := aTreeView.Items.Item[vNode2.AbsoluteIndex];
              if aNode2 <> nil then
              begin
                aNode3 := aTreeView.Items.AddChild(aNode2,FillZeroNumber(j+1,2));
                vNode3 := vTreeView.Items.AddChild(vNode2,'C' + stEcuID + FillZeroNumber(j + 1,2));
                if bCardReaderUse then
                begin
                  aNode3.ImageIndex := con_CardReaderUseImageIndex;
                  aNode3.SelectedIndex := con_CardReaderUseImageIndex;
                end else
                begin
                  aNode3.ImageIndex := con_CardReaderNotUseImageIndex;
                  aNode3.SelectedIndex := con_CardReaderNotUseImageIndex;
                end;
              end;
            end else
            begin
              vNode2:= GetNodeByText(vTreeView,'E' + stEcuID,True);
              if vNode2 <> nil then
              begin
                aNode2 := aTreeView.Items.Item[vNode2.AbsoluteIndex];
                if aNode2 <> nil then
                begin
                  aNode3 := aTreeView.Items.AddChild(aNode2,FillZeroNumber(j+1,2));
                  vNode3 := vTreeView.Items.AddChild(vNode2,'C' + stEcuID + FillZeroNumber(j + 1,2));
                  if bCardReaderUse then
                  begin
                    aNode3.ImageIndex := con_CardReaderUseImageIndex;
                    aNode3.SelectedIndex := con_CardReaderUseImageIndex;
                  end else
                  begin
                    aNode3.ImageIndex := con_CardReaderNotUseImageIndex;
                    aNode3.SelectedIndex := con_CardReaderNotUseImageIndex;
                  end;
                end;
              end ;
            end;
          end;
        end;
      end;
      //감지존 추가
      stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexInformation(con_DeviceCmdZoneExtentionCount,i);
      if isDigit(stTemp) then nExtentionCount := strtoint(stTemp)
      else nExtentionCount := 0;
      if nExtentionCount > 0 then
      begin
        for j := 0 to nExtentionCount - 1 do   //확장기
        begin
          stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeExtention,con_ExtentionCmdZoneUse,i,j);
          if stTemp = '1' then bZoneExtentionUse := True
          else bZoneExtentionUse := False;

          if bZoneExtentionUse then
          begin
            stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexSubInformation(con_DeviceTypeExtention,con_ExtentionCmdZoneCount,i,j);
            if isDigit(stTemp) then nZoneCount := strtoint(stTemp)
            else nZoneCount := 0;
            for k := 1 to nZoneCount do
            begin
              stZoneName := TNode(NodeList.Objects[aIndex]).GetDeviceIndexZoneInformation(con_ZoneCmdName,i,j,k);
              if bArmAreaUse then
              begin
                stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIndexZoneInformation(con_ZoneCmdArmArea,i,j,k);
                if isDigit(stTemp) then nZoneArmAreaNo := strtoint(stTemp)
                else nZoneArmAreaNo := 0;
              end else
              begin
                nZoneArmAreaNo := 0;
              end;
              vNode2:= GetNodeByText(vTreeView,'A' + stEcuID + FillZeroNumber(nZoneArmAreaNo,2),True);
              if vNode2 <> nil then
              begin
                aNode2 := aTreeView.Items.Item[vNode2.AbsoluteIndex];
                if aNode2 <> nil then
                begin
                  aNode3 := aTreeView.Items.AddChild(aNode2,FillZeroNumber(j,2) + '-' + FillZeroNumber(k,2) + ':' + stZoneName);
                  vNode3 := vTreeView.Items.AddChild(vNode2,'Z' + stEcuID + FillZeroNumber(j,2) + FillZeroNumber(k,2));
                  aNode3.ImageIndex := con_ZoneImageIndex;
                  aNode3.SelectedIndex := con_ZoneImageIndex;
                end;
              end else
              begin
                vNode2:= GetNodeByText(vTreeView,'E' + stEcuID,True);
                if vNode2 <> nil then
                begin
                  aNode2 := aTreeView.Items.Item[vNode2.AbsoluteIndex];
                  if aNode2 <> nil then
                  begin
                    aNode3 := aTreeView.Items.AddChild(aNode2,FillZeroNumber(j,2) + '-' + FillZeroNumber(k,2) + ':' + stZoneName);
                    vNode3 := vTreeView.Items.AddChild(vNode2,'Z' + stEcuID + FillZeroNumber(j,2) + FillZeroNumber(k,2));
                    aNode3.ImageIndex := con_ZoneImageIndex;
                    aNode3.SelectedIndex := con_ZoneImageIndex;
                  end;
                end ;
              end;
            end;
          end;
        end;
      end;
    end else
    begin
      aNode1.ImageIndex := con_DeviceNotUseImageIndex;
      aNode1.SelectedIndex := con_DeviceNotUseImageIndex;
    end;
  end;

  if vTreeView.Items.Count < 1 then Exit;
  for i := 0 to vTreeView.Items.Count - 1 do
  begin
    stTemp := vTreeView.Items.Item[i].Text;
    sNode1 := GetNodeByText(sTreeView,stTemp,False);
    if sNode1 <> nil then
    begin
      aTreeView.Items.Item[i].Expanded := sNode1.Expanded;
    end;
  end;
  aTreeView.TopItem := sTreeView.TopItem;

  if aSelectCode <> '' then
  begin
    vNode2 := GetNodeByText(vTreeView,aSelectCode,True);
    if vNode2 <> nil then
    begin
      aNode2 := aTreeView.Items.Item[vNode2.AbsoluteIndex];
      if aNode2 <> nil then
        aNode2.Selected := True;
    end;
  end;
*)
end;

procedure TfmDeviceSetting.se_KttArmRingCountChange(Sender: TObject);
var
  nIndex : integer;
  nWinSocket : integer;
begin
  inherited;
(*  if L_bMainSettingInitalize then Exit;

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).KTTREMOTEARMRINGCOUNT := se_KttArmRingCount.Value;
    TNode(NodeList.Objects[nIndex]).KTTREMOTERINGCOUNTRCV := 'U';
  end else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetNodeInformation(nWinSocket,con_DeviceCmdKTTREMOTEARMRINGCOUNT,inttostr(se_KttArmRingCount.Value));
      if Length(ed_LinkusID.Text) = 4 then dmNodeServer.DeviceNodeServer_SetNodeRcvInformation(nWinSocket,con_DeviceCmdKTTREMOTEARMRINGCOUNT,'U');
    end;
  end;
  *)
end;

procedure TfmDeviceSetting.se_KttDisArmRingCountChange(Sender: TObject);
var
  nIndex : integer;
  nWinSocket : integer;
begin
  inherited;
(*  if L_bMainSettingInitalize then Exit;

  nIndex := NodeList.IndexOf(ed_NodeNo.Text);
  if nIndex > -1 then
  begin
    TNode(NodeList.Objects[nIndex]).KTTREMOTEDISARMRINGCOUNT := se_KttDisArmRingCount.Value;
    TNode(NodeList.Objects[nIndex]).KTTREMOTERINGCOUNTRCV := 'U';
  end else
  begin
    nIndex := ServerNodeList.IndexOf(ed_NodeNo.Text);
    if nIndex > -1 then
    begin
      nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
      dmNodeServer.DeviceNodeServer_SetNodeInformation(nWinSocket,con_DeviceCmdKTTREMOTEDISARMRINGCOUNT,inttostr(se_KttDisArmRingCount.Value));
      if Length(ed_LinkusID.Text) = 4 then dmNodeServer.DeviceNodeServer_SetNodeRcvInformation(nWinSocket,con_DeviceCmdKTTREMOTEARMRINGCOUNT,'U');
    end;
  end;
  *)
end;

procedure TfmDeviceSetting.TreeViewCopy;
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  sTreeView : TTreeview;
  aNode1,aNode2,aNode3 : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  sNode1,sNode2 : TTreeNode;
  i : integer;
begin
  aTreeView := tv_List;
  vTreeView := tv_Code;
  sTreeView := tv_State;

  sTreeView.Items.Clear;
  sTreeView.Items.BeginUpdate;
  sTreeView.Items.Assign(vTreeView.Items);
  sTreeView.Items.EndUpdate;

  if aTreeView.Items.Count < 1 then Exit;

  for i := 0 to aTreeView.Items.Count - 1 do
  begin
    aNode1 := aTreeView.Items.Item[i];
    if aNode1 <> nil then
    begin
      sTreeView.Items.Item[i].Expanded := aNode1.Expanded;
    end;
  end;
  sTreeView.TopItem := aTreeView.TopItem;

end;

procedure TfmDeviceSetting.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  btn_SearchClick(self);
  Tv_NodeDblClick(self);
end;

procedure TfmDeviceSetting.tv_ListClick(Sender: TObject);
var
  stCode : string;
  stEcuID : string;
  stExtendID : string;
  stSubNo : string;
  stTemp : string;
begin
  inherited;
  popupmenu := nil;
  pg_DeviceSetting.Visible := False;
  if tv_List.Selected = nil then Exit;

  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;

  case stCode[1] of
    'A' : begin   //방범구역
      popupmenu := pm_ArmArea;
      stEcuID := copy(stCode,2,2);
      stSubNo := copy(stCode,4,2);
      if isDigit(stSubNo) then
      begin
        stSubNo := inttostr(strtoint(stSubNo));
      end else stSubNo := '0';

      ArmAreaClick(stEcuID,stSubNo,tv_List.Selected.ImageIndex);
    end;
    'C' : begin   //카드리더
      popupmenu := pm_CardReader;

      stEcuID := copy(stCode,2,2);
      stSubNo := copy(stCode,4,2);
      if isDigit(stSubNo) then
      begin
        stSubNo := inttostr(strtoint(stSubNo));
      end else stSubNo := '0';

      CardReaderClick(tv_List.Items.Item[tv_List.Selected.AbsoluteIndex].ImageIndex,stEcuID,stSubNo);
    end;
    'D' : begin  //출입문
      popupmenu := pm_Door;

      mn_SelectDoor.Caption := tv_List.Selected.Text;

      stEcuID := copy(stCode,2,2);
      stSubNo := copy(stCode,4,2);
      if isDigit(stSubNo) then
      begin
        stSubNo := inttostr(strtoint(stSubNo));
      end else stSubNo := '0';
      DoorClick(stEcuID,stSubNo,tv_List.Selected.ImageIndex);
    end;
    'E' : begin
      popupmenu := pm_device;
      stEcuID := copy(stCode,2,2);
      EcuClick(tv_List.Selected.ImageIndex,stEcuID);
    end;
    'Z' : begin  //포트
      popupmenu := pm_port;

      stEcuID := copy(stCode,2,2);
      stExtendID := copy(stCode,4,2);
      if isDigit(stExtendID) then
      begin
        stExtendID := inttostr(strtoint(stExtendID));
      end else stExtendID := '0';

      stSubNo := copy(stCode,6,2);
      if isDigit(stSubNo) then
      begin
        stSubNo := inttostr(strtoint(stSubNo));
      end else stSubNo := '0';

      PortClick(stEcuID,stExtendID,stSubNo);
    end;
  end;
 end;

procedure TfmDeviceSetting.tv_ListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stTargetCode : string;
  stNodeNo,stEcuID,stOrgSubNo,stTargetSubNo:string;
  stTemp : string;
begin
  inherited;
  if Sender = Source then
  begin
    with TTreeView(Sender) do
    begin
      dropItem :=GetNodeAt(X,Y);
      currentItem := Selected;
      if currentItem.AbsoluteIndex = 0 then Exit;   //루트디렉토리가 움직일수는 없다
      stTargetCode := tv_Code.Items[dropItem.AbsoluteIndex].Text;
      if copy(stTargetCode,1,1) = 'C' then Exit; //옮기려는 위치가 카드리더 이면 빠져 나가자
      stOrgCode := tv_Code.Items[currentItem.AbsoluteIndex].Text;
      if copy(stOrgCode,1,1) = 'E' then Exit; //컨트롤러 위치는 옮길수 없다.
      if copy(stTargetCode,1,1) = copy(stOrgCode,1,1) then Exit; //같은 타입은 옮길 수 없다.
      if copy(stTargetCode,2,2) <> copy(stOrgCode,2,2) then Exit; //전혀 다른 확장기로는 옮길 수 없다.

      stNodeNo := ed_NodeNo.Text;
      stEcuID := copy(stTargetCode,2,2);
      stOrgSubNo := copy(stOrgCode,4,2);
      if isDigit(stOrgSubNo) then stOrgSubNo := inttostr(strtoint(stOrgSubNo))
      else stOrgSubNo := '0';

      stTargetSubNo := copy(stTargetCode,4,2);
      if isDigit(stTargetSubNo) then stTargetSubNo := inttostr(strtoint(stTargetSubNo))
      else stTargetSubNo := '0';

      case stOrgCode[1] of
        'C' : begin  //카드리더를 옮기는 경우
          if stTargetCode[1] = 'E' then Exit //컨트롤러에 옮길수는 없다.
          else if stTargetCode[1] = 'A' then  //카드리더를 방범 전용으로 하며 방범구역 번호를 설정 한다.
          begin
            MoveCardReaderArmArea(stNodeNo,stEcuID,stOrgSubNo,stTargetSubNo);
          end else if stTargetCode[1] = 'D' then
          begin
            MoveCardReaderDoorNo(stNodeNo,stEcuID,stOrgSubNo,stTargetSubNo);
          end;
        end;
        'D' : begin  //출입문를 옮기는 경우
          if stTargetCode[1] = 'C' then Exit //카드리더 위치에 옮길수는 없다.
          else if stTargetCode[1] = 'E' then  //출입전용
          begin
            MoveDoorAccessOnly(stNodeNo,stEcuID,stOrgSubNo,stTargetSubNo);
          end else if stTargetCode[1] = 'A' then //방범 + 출입전용
          begin
            MoveDoorArmArea(stNodeNo,stEcuID,stOrgSubNo,stTargetSubNo);
          end;
        end;
        'Z' : begin  //존을 옮기는 경우
          stTemp := copy(stOrgCode,6,2); //존번호
          if isDigit(stTemp) then stTemp := inttostr(strtoint(stTemp))
          else stTemp := '0';

          if stTargetCode[1] = 'A' then
          begin
            MoveZoneArmArea(stNodeNo,stEcuID,stOrgSubNo,stTemp,stTargetSubNo);
          end else Exit; //방범구역 내가 아니면 옮길 수 없다.
        end;
      end;
    end;
    TreeViewCopy;
    SearchDeviceList(ed_NodeNo.Text,stOrgCode);
    tv_ListClick(self);
  end;
end;

procedure TfmDeviceSetting.tv_ListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_List;
end;

procedure TfmDeviceSetting.Tv_NodeDblClick(Sender: TObject);
var
  stName : string;
begin
  inherited;
  if tv_Node.Selected = nil then
  begin
    if tv_Node.Items.Count > 0 then
      tv_Node.Items[0].Selected := True
    else Exit;
  end;
  stName := tv_Node.Items.Item[tv_Node.Selected.AbsoluteIndex].Text;
  ed_NodeNo.Text := copy(stName,1,G_nNodeCodeLength);
  Delete(stName,1,G_nNodeCodeLength + 1);
  ed_NodeName.Text := stName;
  Tv_Node.Visible := False;
  tv_State.Items.Clear;
  SearchDeviceList(ed_NodeNo.Text,'');
end;

initialization
  RegisterClass(TfmDeviceSetting);
Finalization
  UnRegisterClass(TfmDeviceSetting);

end.