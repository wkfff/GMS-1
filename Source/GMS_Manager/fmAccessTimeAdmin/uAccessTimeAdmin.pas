﻿unit uAccessTimeAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls, AdvSplitter, AdvPanel, Vcl.ImgList,
  AdvOfficeButtons, AdvGroupBox,Data.DB,Vcl.Imaging.jpeg, AdvSmoothTabPager,
  AdvCombo, AdvEdBtn, AdvSmoothProgressBar, AdvProgr, AdvOfficeTabSetStylers,
  AdvToolBar, AdvToolBarStylers, AdvGlowButton, AdvOfficePager,
  AdvOfficePagerStylers, AdvAppStyler, Vcl.Imaging.pngimage;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmAccessTimeAdmin = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    AdvSplitter1: TAdvSplitter;
    AdvSmoothPanel1: TAdvSmoothPanel;
    pan_DeviceList: TAdvSmoothPanel;
    sg_EmployeeList: TAdvStringGrid;
    tv_CompanyCode: TTreeView;
    MenuImageList16: TImageList;
    lb_SearchCount: TAdvSmoothLabel;
    sg_Device: TAdvStringGrid;
    tv_buildingName: TTreeView;
    tv_buildingCode: TTreeView;
    AdvProgress1: TAdvProgress;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_EmployeeList: TLabel;
    lb_CompanyName: TAdvSmoothLabel;
    eb_CompanyName: TAdvEditBtn;
    ed_CompanyCode: TAdvEdit;
    lb_PosiName: TAdvSmoothLabel;
    cmb_Posi: TAdvComboBox;
    lb_empType: TAdvSmoothLabel;
    cmb_EmpGubun: TAdvComboBox;
    lb_EtcSearch: TAdvSmoothLabel;
    cmb_ETC: TAdvComboBox;
    lb_SearchETCName: TAdvSmoothLabel;
    ed_name: TAdvEdit;
    btn_Search: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_BuildingName: TAdvSmoothLabel;
    eb_BuildingName: TAdvEditBtn;
    lb_SelectEmployee: TAdvSmoothLabel;
    lb_SelectEmName: TAdvSmoothLabel;
    ed_selectEmSeq: TAdvEdit;
    ed_BuildingCode: TAdvEdit;
    lb_ControlerTime: TLabel;
    btn_Apply: TAdvGlowButton;
    lb_SearchCnt: TAdvSmoothLabel;
    lb_Count1: TAdvSmoothLabel;
    tv_CompanyName: TTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pan_DeviceListResize(Sender: TObject);
    procedure btn_SaveMouseEnter(Sender: TObject);
    procedure btn_SaveMouseLeave(Sender: TObject);
    procedure btn_PositionAddClick(Sender: TObject);
    procedure btn_EmployeeGubunAddClick(Sender: TObject);
    procedure sg_CardCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure btn_CardGroupSelectClick(Sender: TObject);
    procedure dt_IndateChange(Sender: TObject);
    procedure dt_OutDateChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_PositionSearchClick(Sender: TObject);
    procedure cmb_EmpGubunSearchClick(Sender: TObject);
    procedure ed_etcSearchChange(Sender: TObject);
    procedure sg_EmployeeListResize(Sender: TObject);
    procedure sg_PermitDoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure pm_GroupPermitClick(Sender: TObject);
    procedure cmb_ETCChange(Sender: TObject);
    procedure tv_CompanyNameDblClick(Sender: TObject);
    procedure eb_CompanyNameClickBtn(Sender: TObject);
    procedure sg_EmployeeListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_EmpGubunChange(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure sg_EmployeeListClick(Sender: TObject);
    procedure sg_DeviceCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_ApplyClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListResize(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
  private
    L_stMenuID : string;
    L_stAllName : string;
    L_stButtonCloseCaption : string;
    L_stDeleteCaption : string;
    L_stEmCodeCaption : string;
    L_stEmCompanyPhoneCaption : string;
    L_stEmEtcCaption : string;
    L_stEmHandPhoneCaption : string;
    L_stEmNameCaption : string;
    L_stWork : string;
    L_nSelectCol : integer;
    L_nPageListMaxCount : integer;
    L_nBuildingNotPermitDoorCount : integer;     //빌딩별 미등록 권한 출입문
    L_nBuildingPermitDoorCount : integer;        //빌딩별 등록 권한 출입문
    L_nBuildingNotPermitArmAreaCount : integer;  //빌딩별 미등록 권한 방범구역
    L_nBuildingPermitArmAreaCount : integer;
    L_nPermitArmAreaCheckCount : integer;           //삭제시 방범구역 선택 갯수
    L_nNotPermitArmAreaCheckCount : integer;        //등록시 방범구역 선택 갯수
    L_nPermitDoorCheckCount : integer;           //삭제시 출입문 선택 갯수
    L_nNotPermitDoorCheckCount : integer;        //등록시 출입문 선택 갯수
    L_nEmployeeCheckCount : integer;
    L_bVisitEditMode : Boolean;
    L_bEmployeeGradeChange : Boolean;
    CardGubunCodeList :TStringList;
    CardStateCodeList :TStringList;
    EmployeeGubunCodeList : TStringList;
    PosiSearchCodeList : TStringList;
    WorkCardGubunCodeList :TStringList;
    WorkCardStateCodeList :TStringList;
    AddCardNoList : TStringList; //추가되는 카드번호 리스트를 가지고 있자
    ChangeCardNoList : TStringList; //변경되는 카드번호 리스트를 가지고 있자
    FingerCardNoDupList : TStringList; //지문카드 중복에 따른 지문카드 재 작업을 해야 됨
    DeleteCardNoList : TStringList; //삭제 카드 리스트를 가지고 있자
    BuildingArmAreaCodeList : TStringList; //빌딩별 방범구역 코드 리스트를 가지고 있자.
    BuildingDoorCodeList : TStringList; //빌딩별 출입문 코드 리스트를 가지고 있자.
    function GetDeviceTimeCode(aNodeNo:integer;aEcuID:string;var aTime11,aTime12,aTime13,aTime14,aTime21,aTime22,aTime23,aTime24:string):Boolean;
    procedure FormNameSetting;
    procedure FontSetting;
    procedure SearchDeviceList(aCode:string);
    procedure SearchEmployeeList(aCode:string;aTopRow:integer = 0);
    procedure LoadBuildingAlarmAll(aBuildingCode:string;sgList:TAdvStringGrid); //전체 출입문을 리스트에 추가 하자
    procedure LoadBuildingDoorAll(aBuildingCode:string;sgList:TAdvStringGrid); //전체 출입문을 리스트에 추가 하자
    procedure GridMerge;
  private
    { Private declarations }
    function JpegStartsInBlob(PicField:TBlobField):integer;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmAccessTimeAdmin: TfmAccessTimeAdmin;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDBDelete,
  uDBCardPermit,
  uDBSelect,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmAccessTimeAdmin.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := True;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;

end;

procedure TfmAccessTimeAdmin.eb_CompanyNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_CompanyName.Visible := Not tv_CompanyName.Visible;
  tv_CompanyName.Top := eb_CompanyName.Top + eb_CompanyName.Height;
  tv_CompanyName.Left := eb_CompanyName.Left;

end;

procedure TfmAccessTimeAdmin.ed_etcSearchChange(Sender: TObject);
begin
  inherited;
  if G_nReportSearchType = 1 then SearchEmployeeList('');
end;

procedure TfmAccessTimeAdmin.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmAccessTimeAdmin.btn_ApplyClick(Sender: TObject);
var
  nMaxCount : integer;
  nDeviceRowCount : integer;
  stMessage : string;
  i,j,k : integer;
  bChecked : Boolean;
  stEmSeq : string;
  stTimeCodeUse : string;
  stTimeGroup : string;
  stTime1,stTime2,stTime3,stTime4 : string;
  stWeek : string;
  stDeviceID : string;
  nPosition : integer;
begin
  inherited;
  nDeviceRowCount := sg_Device.RowCount - 2;
  nMaxCount := (sg_EmployeeList.RowCount - 1) * nDeviceRowCount;
  if L_nEmployeeCheckCount = 0 then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := StringReplace(stMessage,'$WORK',btn_Apply.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  AdvProgress1.Visible := True;
  AdvProgress1.Max := nMaxCount;
  nPosition := 0;
  AdvProgress1.Position := nPosition;
  for i := 1 to sg_EmployeeList.RowCount - 1 do
  begin
    stEmSeq := sg_EmployeeList.Cells[13,i];
    sg_EmployeeList.GetCheckBoxState(0,i, bChecked);
    if bChecked then
    begin
      for j := 2 to sg_Device.RowCount - 1  do
      begin
        sg_Device.GetCheckBoxState(1,j, bChecked);
        if bChecked then stTimeCodeUse := '1'
        else stTimeCodeUse := '0';
        stTimeGroup := '1'; //초기화
        sg_Device.GetCheckBoxState(2,j, bChecked);
        if bChecked then
        begin
          stTimeGroup := '0';
          stTime1 := '1'
        end else stTime1 := '0';
        sg_Device.GetCheckBoxState(3,j, bChecked);
        if bChecked then
        begin
          stTimeGroup := '0';
          stTime2 := '1'
        end else stTime2 := '0';
        sg_Device.GetCheckBoxState(4,j, bChecked);
        if bChecked then
        begin
          stTimeGroup := '0';
          stTime3 := '1'
        end else stTime3 := '0';
        sg_Device.GetCheckBoxState(5,j, bChecked);
        if bChecked then
        begin
          stTimeGroup := '0';
          stTime4 := '1'
        end else stTime4 := '0';
        if stTimeGroup = '1' then
        begin
          sg_Device.GetCheckBoxState(6,j, bChecked);
          if bChecked then
          begin
            stTimeGroup := '1';
            stTime1 := '1'
          end else stTime1 := '0';
          sg_Device.GetCheckBoxState(7,j, bChecked);
          if bChecked then
          begin
            stTimeGroup := '1';
            stTime2 := '1'
          end else stTime2 := '0';
          sg_Device.GetCheckBoxState(8,j, bChecked);
          if bChecked then
          begin
            stTimeGroup := '1';
            stTime3 := '1'
          end else stTime3 := '0';
          sg_Device.GetCheckBoxState(9,j, bChecked);
          if bChecked then
          begin
            stTimeGroup := '1';
            stTime4 := '1'
          end else stTime4 := '0';
        end;
        stWeek := '0000000';
        for k := 1 to 7 do
        begin
          sg_Device.GetCheckBoxState(9 + k,j, bChecked);
          if bChecked then stWeek[8 - k] := '1';  //주간은 거꾸로
        end;
        stDeviceID := sg_Device.Cells[17,j];

        //두 그룹중 한그룹만 출입 가능하다.
        if dmDBFunction.CheckTB_EMPLOYEEDEVICETIMECODE_Value(stEmSeq,copy(stDeviceID,1,G_nNodeCodeLength),copy(stDeviceID,1 + G_nNodeCodeLength,2)) = 1 then
        begin
          dmDBUpdate.UpdateTB_EMPLOYEEDEVICETIMECODE_Value(stEmSeq,copy(stDeviceID,1,G_nNodeCodeLength),copy(stDeviceID,1 + G_nNodeCodeLength,2),
                     stTimeCodeUse,stTimeGroup,stTime1,stTime2,stTime3,stTime4,stWeek);
        end else
        begin
          dmDBInsert.InsertIntoTB_EMPLOYEEDEVICETIMECODE_Value(stEmSeq,copy(stDeviceID,1,G_nNodeCodeLength),copy(stDeviceID,1 + G_nNodeCodeLength,2),
                     stTimeCodeUse,stTimeGroup,stTime1,stTime2,stTime3,stTime4,stWeek);
        end;
        nPosition := nPosition + 1;
        AdvProgress1.Position := nPosition;
        Application.ProcessMessages;
      end;
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N'); //카드권한 재전송
    end else
    begin
      nPosition := nPosition + nDeviceRowCount;
      AdvProgress1.Position := nPosition;
      Application.ProcessMessages;
    end;
  end;
  AdvProgress1.Visible := False;

end;

procedure TfmAccessTimeAdmin.btn_CardGroupSelectClick(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True;
end;

procedure TfmAccessTimeAdmin.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmAccessTimeAdmin.btn_EmployeeGubunAddClick(Sender: TObject);
begin
  inherited;
  fmMain.FormShowEvent(con_FormBMOSEMPLOYEEGUBUN,TRUE);
end;

procedure TfmAccessTimeAdmin.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmAccessTimeAdmin.btn_PositionAddClick(Sender: TObject);
begin
  inherited;
  fmMain.FormShowEvent(con_FormBMOSPOSICODE,TRUE);
end;

procedure TfmAccessTimeAdmin.btn_SaveMouseEnter(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clYellow;
end;

procedure TfmAccessTimeAdmin.btn_SaveMouseLeave(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clBlue;
end;

procedure TfmAccessTimeAdmin.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchEmployeeList('');
end;

procedure TfmAccessTimeAdmin.cmb_EmpGubunChange(Sender: TObject);
begin
  inherited;
  SearchEmployeeList('');
end;

procedure TfmAccessTimeAdmin.cmb_EmpGubunSearchClick(Sender: TObject);
begin
  inherited;
  if G_nReportSearchType = 1 then SearchEmployeeList('');
end;

procedure TfmAccessTimeAdmin.cmb_ETCChange(Sender: TObject);
begin
  inherited;
  lb_SearchETCName.Caption.Text := cmb_ETC.Text;
  ed_name.Text := '';
end;

procedure TfmAccessTimeAdmin.cmb_PosiChange(Sender: TObject);
begin
  inherited;
  SearchEmployeeList('');
end;

procedure TfmAccessTimeAdmin.cmb_PositionSearchClick(Sender: TObject);
begin
  inherited;
  if G_nReportSearchType = 1 then SearchEmployeeList('');
end;

procedure TfmAccessTimeAdmin.dt_IndateChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True;  //유효기간 변경시 카드데이터 재전송
end;

procedure TfmAccessTimeAdmin.dt_OutDateChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True; //유효기간 변경시 카드데이터 재전송
end;

procedure TfmAccessTimeAdmin.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmAccessTimeAdmin.FormChangeEvent(aNumber: integer);
var
  stSelectCode1 : string;
  stSelectCode2 : string;
  nIndex : integer;
begin
  case aNumber of
    con_FormBMOSCOMPANYCODE : begin
      LoadCompanyTreeView('',tv_CompanyName,tv_CompanyCode,con_LocalCompanyImageIndex);
    end;
    con_FormBMOSBUILDINGCODE : begin
      LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
    end;
    con_FormBMOSPOSICODE : begin
    end;
    con_FormBMOSEMPLOYEEGUBUN : begin
    end;

  end;
end;

procedure TfmAccessTimeAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  PosiSearchCodeList.Free;
  EmployeeGubunCodeList.Free;
  CardGubunCodeList.Free;
  WorkCardGubunCodeList.Free;
  WorkCardStateCodeList.Free;
  AddCardNoList.Free;
  ChangeCardNoList.Free;
  CardStateCodeList.Free;
  FingerCardNoDupList.Free;
  DeleteCardNoList.Free;
  BuildingDoorCodeList.Free;
  BuildingArmAreaCodeList.Free;

  fmMain.FORMENABLE(con_FormBMOSACCESSTIME,'FALSE');
  Action := caFree;
end;

procedure TfmAccessTimeAdmin.FormCreate(Sender: TObject);
begin
  inherited;
  PosiSearchCodeList := TStringList.Create;
  EmployeeGubunCodeList:= TStringList.Create;
  CardGubunCodeList := TStringList.Create;
  WorkCardGubunCodeList := TStringList.Create;
  WorkCardStateCodeList := TStringList.Create;
  AddCardNoList := TStringList.Create;
  ChangeCardNoList:= TStringList.Create;
  CardStateCodeList := TStringList.Create;
  FingerCardNoDupList := TStringList.Create;
  DeleteCardNoList := TStringList.Create;
  BuildingDoorCodeList := TStringList.Create;
  BuildingArmAreaCodeList := TStringList.Create;
  FontSetting;
  lb_SelectEmName.Caption.Text := '';
end;

procedure TfmAccessTimeAdmin.FormGradeRefresh;
begin

end;

procedure TfmAccessTimeAdmin.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmAccessTimeAdmin.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_EmployeeList.Caption := dmFormFunction.GetFormName('2','2','BM3_011List');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  btn_Apply.Caption := dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  L_stEmCodeCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  sg_EmployeeList.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE');
  L_stEmNameCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  sg_EmployeeList.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME');
  sg_EmployeeList.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  lb_CompanyName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');
  lb_PosiName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSI');
  sg_EmployeeList.Cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEPOSI');
  lb_empType.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGUBUN');
  sg_EmployeeList.Cells[4,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGUBUN');
  L_stEmHandPhoneCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  sg_EmployeeList.Cells[5,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE');
  L_stEmCompanyPhoneCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  sg_EmployeeList.Cells[6,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE');
  L_stEmEtcCaption := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  sg_EmployeeList.Cells[7,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO');
  sg_EmployeeList.Cells[8,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEINDATE');
  sg_EmployeeList.Cells[9,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEOUTDATE');
  sg_EmployeeList.Cells[11,0] := dmFormFunction.GetFormName('0','2','COMMONFOODNAME');
  sg_EmployeeList.Cells[12,0] := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGROUP');
  lb_EtcSearch.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONETCNAME');
  lb_BuildingName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  sg_Device.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONDEVICENAME');
  sg_Device.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONTIMEDOORUSE');
  sg_Device.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONTIMEGROUP') + '1';
  sg_Device.Cells[6,0] := dmFormFunction.GetFormName('0','2','COMMONTIMEGROUP') + '2';
  sg_Device.Cells[10,0] := dmFormFunction.GetFormName('0','2','COMMONTIMEWEEK');
  sg_Device.Cells[2,1] := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '1';
  sg_Device.Cells[3,1] := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '2';
  sg_Device.Cells[4,1] := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '3';
  sg_Device.Cells[5,1] := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '4';
  sg_Device.Cells[6,1] := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '1';
  sg_Device.Cells[7,1] := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '2';
  sg_Device.Cells[8,1] := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '3';
  sg_Device.Cells[9,1] := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '4';
  sg_Device.Cells[10,1] := dmFormFunction.GetFormName('0','2','COMMONTIMEWEEKSUN');
  sg_Device.Cells[11,1] := dmFormFunction.GetFormName('0','2','COMMONTIMEWEEKMON');
  sg_Device.Cells[12,1] := dmFormFunction.GetFormName('0','2','COMMONTIMEWEEKTUE');
  sg_Device.Cells[13,1] := dmFormFunction.GetFormName('0','2','COMMONTIMEWEEKWED');
  sg_Device.Cells[14,1] := dmFormFunction.GetFormName('0','2','COMMONTIMEWEEKTHU');
  sg_Device.Cells[15,1] := dmFormFunction.GetFormName('0','2','COMMONTIMEWEEKFRI');
  sg_Device.Cells[16,1] := dmFormFunction.GetFormName('0','2','COMMONTIMEWEEKSAT');
  lb_SearchCnt.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSEARCHCOUNT01');
  lb_Count1.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOUNT');
  lb_SelectEmployee.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONSELECTEMP');
  lb_ControlerTime.Caption := dmFormFunction.GetFormName('0','2','COMMONCONTROLERTIME');
end;

procedure TfmAccessTimeAdmin.FormResize(Sender: TObject);
begin
  inherited;

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

end;

procedure TfmAccessTimeAdmin.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  GridMerge;

  FormNameSetting;

  fmMain.FORMENABLE(con_FormBMOSACCESSTIME,'TRUE');

  LoadCompanyTreeView('',tv_CompanyName,tv_CompanyCode,con_LocalCompanyImageIndex);
  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  LoadEmployeeGubunCode(EmployeeGubunCodeList,TComboBox(cmb_EmpGubun),True,L_stAllName);
  LoadSearchETC(cmb_ETC);
  cmb_ETC.ItemIndex := 0;
  lb_SearchETCName.Caption.Text := cmb_ETC.Text;
  tv_CompanyNameDblClick(Self);

  tv_buildingNameDblClick(Self);

  L_bVisitEditMode := True;
end;

procedure TfmAccessTimeAdmin.Form_Close;
begin
  Close;
end;

function TfmAccessTimeAdmin.GetDeviceTimeCode(aNodeNo: integer; aEcuID: string;
  var aTime11, aTime12, aTime13, aTime14, aTime21, aTime22, aTime23, aTime24: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  aTime11 := '00000000';
  aTime12 := '00000000';
  aTime13 := '00000000';
  aTime14 := '00000000';
  aTime21 := '00000000';
  aTime22 := '00000000';
  aTime23 := '00000000';
  aTime24 := '00000000';

  stSql := dmDBSelect.SelectTB_TIMECODEDEVICE_Device(inttostr(aNodeNo),aEcuID);
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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
      if recordcount < 1 then Exit;

      while Not Eof do
      begin
        if FindField('TC_GROUP').AsString = '0' then
        begin
          aTime11 := FindField('TC_TIME1').AsString;
          aTime12 := FindField('TC_TIME2').AsString;
          aTime13 := FindField('TC_TIME3').AsString;
          aTime14 := FindField('TC_TIME4').AsString;
        end else if FindField('TC_GROUP').AsString = '1' then
        begin
          aTime21 := FindField('TC_TIME1').AsString;
          aTime22 := FindField('TC_TIME2').AsString;
          aTime23 := FindField('TC_TIME3').AsString;
          aTime24 := FindField('TC_TIME4').AsString;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAccessTimeAdmin.GridMerge;
begin
  with sg_Device do
  begin
    MergeCells(0,0,1,2);
    MergeCells(1,0,1,2);
    MergeCells(2,0,4,1);
    MergeCells(6,0,4,1);
    MergeCells(10,0,7,1);
  end;
end;

function TfmAccessTimeAdmin.JpegStartsInBlob(PicField: TBlobField): integer;
var
  bS : TADOBlobStream;
  buffer : Word;
  hx : string;
begin
  Result := -1;
  bS := TADOBlobStream.Create(PicField, bmRead);
  try
    while (Result = -1) and
      (bS.Position + 1 < bS.Size) do
    begin
      bS.ReadBuffer(buffer, 1);
      hx:=IntToHex(buffer, 2);
      if hx = 'FF' then begin
        bS.ReadBuffer(buffer, 1);
        hx:=IntToHex(buffer, 2);
        if hx = 'D8' then Result := bS.Position - 2
        else if hx = 'FF' then
        bS.Position := bS.Position-1;
      end; //if
    end; //while
  finally
    bS.Free
  end; //try
end;

procedure TfmAccessTimeAdmin.ListResize(Sender: TObject);
begin
  inherited;
  sg_EmployeeList.left := 10;
  sg_EmployeeList.Width := List.Width - (sg_EmployeeList.left * 2);
  sg_EmployeeList.Height := List.Height - sg_EmployeeList.Top - 50;
end;

procedure TfmAccessTimeAdmin.LoadBuildingAlarmAll(aBuildingCode: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stAlarmAreaCode : string;
begin
  GridInit(sgList,2,2,true);
  BuildingArmAreaCodeList.Clear;

  stSql := dmDBSelect.SelectTB_ARMAREA_BuildingCode(aBuildingCode);
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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
      L_nBuildingNotPermitArmAreaCount := recordCount;
      if recordcount < 1 then Exit;
      with sgList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('AR_ARMAREANAME').AsString;
          cells[2,nRow] := FindField('ND_NODENO').AsString;
          cells[3,nRow] := FindField('DE_ECUID').AsString;
          cells[4,nRow] := FindField('DE_EXTENDID').AsString;
          cells[5,nRow] := FindField('AR_ARMAREANO').AsString;
          stAlarmAreaCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('AR_ARMAREANO').AsString;
          if BuildingArmAreaCodeList.IndexOf(stAlarmAreaCode) < 0 then BuildingArmAreaCodeList.Add(stAlarmAreaCode);
          cells[6,nRow] := stAlarmAreaCode;
          cells[7,nRow] := FindField('AR_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAccessTimeAdmin.LoadBuildingDoorAll(aBuildingCode: string;
  sgList: TAdvStringGrid);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stDoorCode : string;
begin
  GridInit(sgList,2,2,true);
  BuildingDoorCodeList.Clear;

  stSql := dmDBSelect.SelectTB_DOOR_BuildingCode(aBuildingCode,True);
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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
      L_nBuildingNotPermitDoorCount := recordCount;
      if recordcount < 1 then Exit;
      with sgList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('DO_DOORNAME').AsString;
          cells[2,nRow] := FindField('ND_NODENO').AsString;
          cells[3,nRow] := FindField('DE_ECUID').AsString;
          cells[4,nRow] := FindField('DE_EXTENDID').AsString;
          cells[5,nRow] := FindField('DO_DOORNO').AsString;
          stDoorCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DE_EXTENDID').AsString + FindField('DO_DOORNO').AsString;
          if BuildingDoorCodeList.IndexOf(stDoorCode) < 0 then BuildingDoorCodeList.Add(stDoorCode);
          cells[6,nRow] := stDoorCode;
          cells[7,nRow] := FindField('DO_VIEWSEQ').AsString;

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure TfmAccessTimeAdmin.pan_DeviceListResize(Sender: TObject);
begin
  inherited;
  sg_Device.Width := pan_DeviceList.Width - (sg_Device.Left * 2);
  sg_Device.Height := pan_DeviceList.Height - sg_Device.Top - 50;
  AdvProgress1.Top := ( sg_Device.Top + sg_Device.Height ) + 5;
  AdvProgress1.Width := pan_DeviceList.Width - 120;
  btn_Apply.Left := sg_Device.Left + sg_Device.Width - btn_Apply.Width;
  btn_Apply.Top := AdvProgress1.Top;
end;

procedure TfmAccessTimeAdmin.pm_GroupPermitClick(Sender: TObject);
begin
  inherited;
  dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(sg_EmployeeList.Cells[13,sg_EmployeeList.Row],'EM_GRADETYPE',inttostr(G_nCardDefaultGroupType)); //원래 그룹으로 환원 시킴
  dmDBCardPermit.EmployeeGradeChange_Process(sg_EmployeeList.Cells[13,sg_EmployeeList.Row],sg_EmployeeList.cells[14,sg_EmployeeList.Row],sg_EmployeeList.cells[17,sg_EmployeeList.Row],inttostr(G_nCardDefaultGroupType));   //권한재작업
  dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(sg_EmployeeList.Cells[13,sg_EmployeeList.Row],con_ComWorkType_UPDATE); //변경이력 남기자.
  SearchEmployeeList(sg_EmployeeList.Cells[13,sg_EmployeeList.Row]);
end;
(*
procedure TfmAccessTimeAdmin.SearchCompanyList(aCode: string);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
  stEmployeeAllCode : string;
begin
  aTreeView := tv_CompanyName;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := tv_CompanyCode;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  stSql := ' Select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_CODEUSE = ''1'' ';
  stSql := stSql + ' Order by CO_DEEPSEQ,CO_VIEWSEQ ';
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
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        if FindField('CO_DEEPSEQ').AsInteger = 0 then
        begin
          aNode := aTreeView.Items.Add(nil,FindField('CO_COMPANYNAME').AsString);
          vTreeView.Items.AddChild(nil,FindField('CO_COMPANYCODE').AsString);
          aNode.Expanded := True;
        end else
        begin
          nDeepSeq := FindField('CO_DEEPSEQ').AsInteger;
          stParentCode := copy(FindField('CO_COMPANYCODE').AsString,1,1 + ((nDeepSeq - 1) * G_nCompanyCodeLength) );
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,FindField('CO_COMPANYNAME').AsString);
              cNode.ImageIndex := con_LocalCompanyImageIndex;
              cNode.SelectedIndex := con_LocalCompanyImageIndex;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then
            begin
              vNode3:= vTreeView.Items.AddChild(vNode2,FindField('CO_COMPANYCODE').AsString);
            end;
            bNode.Expanded := True;
            vNode1.Expanded := True;
            if aCode = FindField('CO_COMPANYCODE').AsString  then
            begin
              if cNode <> nil then cNode.Selected := True;
            end;

          end;
        end;
        Next;
      end;
      Exit; //트리 구조에는 소속 정보만 넣자
      if G_nEmployeeSearchType <> 1 then Exit;
      stSql := ' Select * from TB_EMPLOYEE ';
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' Order by EM_NAME ';
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        stParentCode := FindField('CO_COMPANYCODE').AsString;
        if Trim(stParentCode) = '' then stParentCode := '0';
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,FindField('EM_NAME').AsString);
            cNode.ImageIndex := con_LocalEmployeeImageIndex;
            cNode.SelectedIndex := con_LocalEmployeeImageIndex;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            stEmployeeAllCode := 'E' + FindField('EM_SEQ').AsString;
            vNode3:= vTreeView.Items.AddChild(vNode2,stEmployeeAllCode);
          end;
          bNode.Expanded := True;
          vNode1.Expanded := True;
          if aCode = stEmployeeAllCode  then
          begin
            if cNode <> nil then cNode.Selected := True;
          end;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;
*)
procedure TfmAccessTimeAdmin.SearchDeviceList(aCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stBuildingCode : string;
  stDeviceCode : string;
  stTime11,stTime12,stTime13,stTime14:string;
  stTime21,stTime22,stTime23,stTime24:string;
  stEmSeq : string;
begin
  GridInit(sg_Device,17,3,False,2);

  stBuildingCode := ed_BuildingCode.Text;
  if stBuildingCode = '' then stBuildingCode := '0';
  stEmSeq := ed_selectEmSeq.Text;
  if stEmSeq = '' then stEmSeq := '0';

  stSql := dmDBSelect.SelectTB_DEVICE_BuildingEmCodeLike(stBuildingCode,stEmSeq);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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
      if recordcount < 1 then Exit;

      with sg_Device do
      begin
        nRow := 2;
        RowCount := RecordCount + 2;
        while Not Eof do
        begin
          stDeviceCode := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString;
          GetDeviceTimeCode(FindField('ND_NODENO').AsInteger,FindField('DE_ECUID').AsString,stTime11,stTime12,stTime13,stTime14,stTime21,stTime22,stTime23,stTime24);
          if stTime11 = '' then stTime11 := '00000000';
          if stTime12 = '' then stTime12 := '00000000';
          if stTime13 = '' then stTime13 := '00000000';
          if stTime14 = '' then stTime14 := '00000000';
          if stTime21 = '' then stTime21 := '00000000';
          if stTime22 = '' then stTime22 := '00000000';
          if stTime23 = '' then stTime23 := '00000000';
          if stTime24 = '' then stTime24 := '00000000';

          if FindField('EM_TIMECODEUSE').AsString = '1' then AddCheckBox(1,nRow,True,False)
          else AddCheckBox(1,nRow,False,False);
          if FindField('TC_GROUP').AsString = '0' then
          begin
            if FindField('TC_TIME1').AsString = '1' then AddCheckBox(2,nRow,True,False)
            else AddCheckBox(2,nRow,False,False);
            if FindField('TC_TIME2').AsString = '1' then AddCheckBox(3,nRow,True,False)
            else AddCheckBox(3,nRow,False,False);
            if FindField('TC_TIME3').AsString = '1' then AddCheckBox(4,nRow,True,False)
            else AddCheckBox(4,nRow,False,False);
            if FindField('TC_TIME4').AsString = '1' then AddCheckBox(5,nRow,True,False)
            else AddCheckBox(5,nRow,False,False);
            AddCheckBox(6,nRow,False,False);
            AddCheckBox(7,nRow,False,False);
            AddCheckBox(8,nRow,False,False);
            AddCheckBox(9,nRow,False,False);
          end else if FindField('TC_GROUP').AsString = '1' then
          begin
            AddCheckBox(2,nRow,False,False);
            AddCheckBox(3,nRow,False,False);
            AddCheckBox(4,nRow,False,False);
            AddCheckBox(5,nRow,False,False);
            if FindField('TC_TIME1').AsString = '1' then AddCheckBox(6,nRow,True,False)
            else AddCheckBox(6,nRow,False,False);
            if FindField('TC_TIME2').AsString = '1' then AddCheckBox(7,nRow,True,False)
            else AddCheckBox(7,nRow,False,False);
            if FindField('TC_TIME3').AsString = '1' then AddCheckBox(8,nRow,True,False)
            else AddCheckBox(8,nRow,False,False);
            if FindField('TC_TIME4').AsString = '1' then AddCheckBox(9,nRow,True,False)
            else AddCheckBox(9,nRow,False,False);
          end else
          begin
            AddCheckBox(2,nRow,False,False);
            AddCheckBox(3,nRow,False,False);
            AddCheckBox(4,nRow,False,False);
            AddCheckBox(5,nRow,False,False);
            AddCheckBox(6,nRow,False,False);
            AddCheckBox(7,nRow,False,False);
            AddCheckBox(8,nRow,False,False);
            AddCheckBox(9,nRow,False,False);
          end;
          if Length(FindField('TC_WEEKCODE').AsString) = 7 then
          begin
            if FindField('TC_WEEKCODE').AsString[1] = '1' then AddCheckBox(10,nRow,True,False)
            else AddCheckBox(10,nRow,False,False);
            if FindField('TC_WEEKCODE').AsString[2] = '1' then AddCheckBox(11,nRow,True,False)
            else AddCheckBox(11,nRow,False,False);
            if FindField('TC_WEEKCODE').AsString[3] = '1' then AddCheckBox(12,nRow,True,False)
            else AddCheckBox(12,nRow,False,False);
            if FindField('TC_WEEKCODE').AsString[4] = '1' then AddCheckBox(13,nRow,True,False)
            else AddCheckBox(13,nRow,False,False);
            if FindField('TC_WEEKCODE').AsString[5] = '1' then AddCheckBox(14,nRow,True,False)
            else AddCheckBox(14,nRow,False,False);
            if FindField('TC_WEEKCODE').AsString[6] = '1' then AddCheckBox(15,nRow,True,False)
            else AddCheckBox(15,nRow,False,False);
            if FindField('TC_WEEKCODE').AsString[7] = '1' then AddCheckBox(16,nRow,True,False)
            else AddCheckBox(16,nRow,False,False);
          end else
          begin
            AddCheckBox(10,nRow,True,False);
            AddCheckBox(11,nRow,True,False);
            AddCheckBox(12,nRow,True,False);
            AddCheckBox(13,nRow,True,False);
            AddCheckBox(14,nRow,True,False);
            AddCheckBox(15,nRow,True,False);
            AddCheckBox(16,nRow,True,False);
          end;
          cells[0,nRow] := FindField('DE_DEVICENAME').AsString;
          cells[2,nRow] := copy(stTime11,1,2) + ':' + copy(stTime11,3,2) + '-' + copy(stTime11,5,2) + ':' + copy(stTime11,7,2);
          cells[3,nRow] := copy(stTime12,1,2) + ':' + copy(stTime12,3,2) + '-' + copy(stTime12,5,2) + ':' + copy(stTime12,7,2);
          cells[4,nRow] := copy(stTime13,1,2) + ':' + copy(stTime13,3,2) + '-' + copy(stTime13,5,2) + ':' + copy(stTime13,7,2);
          cells[5,nRow] := copy(stTime14,1,2) + ':' + copy(stTime14,3,2) + '-' + copy(stTime14,5,2) + ':' + copy(stTime14,7,2);
          cells[6,nRow] := copy(stTime21,1,2) + ':' + copy(stTime21,3,2) + '-' + copy(stTime21,5,2) + ':' + copy(stTime21,7,2);
          cells[7,nRow] := copy(stTime22,1,2) + ':' + copy(stTime22,3,2) + '-' + copy(stTime22,5,2) + ':' + copy(stTime22,7,2);
          cells[8,nRow] := copy(stTime23,1,2) + ':' + copy(stTime23,3,2) + '-' + copy(stTime23,5,2) + ':' + copy(stTime23,7,2);
          cells[9,nRow] := copy(stTime24,1,2) + ':' + copy(stTime24,3,2) + '-' + copy(stTime24,5,2) + ':' + copy(stTime24,7,2);
          cells[17,nRow] := stDeviceCode;

          nRow := nRow + 1;
          Next;
        end;

      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmAccessTimeAdmin.SearchEmployeeList(aCode: string; aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stCompanyCode : string;
  stPosiCode : string;
  stEmployeeGubun : string;
  stEtcType : string;
  stEtcName : string;
begin
  GridInit(sg_EmployeeList,13,2,True);
  lb_SearchCount.Caption.Text := FormatFloat('#,##0',0);

  stCompanyCode := ed_CompanyCode.Text;
  if stCompanyCode = '' then stCompanyCode := '0';

  stPosiCode := '';
  if cmb_Posi.ItemIndex > 0 then stPosiCode := PosiSearchCodeList.Strings[cmb_Posi.ItemIndex];

  stEmployeeGubun := '';
  if cmb_EmpGubun.ItemIndex > 0 then stEmployeeGubun := EmployeeGubunCodeList.Strings[cmb_EmpGubun.ItemIndex];

  if cmb_ETC.ItemIndex > -1 then stEtcType := inttostr(cmb_ETC.ItemIndex)
  else stEtcType := '0';
  stEtcName := Trim(ed_name.Text);


  stSql := dmDBSelect.SelectTB_EMPLOYE_EtcType(stCompanyCode,stPosiCode,stEmployeeGubun,stEtcType,stEtcName);  //출입타입

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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
      lb_SearchCount.Caption.Text := FormatFloat('#,##0',recordCount);
      if recordcount < 1 then Exit;

      with sg_EmployeeList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[0,nRow] := FindField('EM_CODE').AsString;
          cells[1,nRow] := FindField('EM_NAME').AsString;
          cells[2,nRow] := FindField('CO_COMPANYNAME').AsString;
          cells[3,nRow] := FindField('PO_POSICODENAME').AsString;
          cells[4,nRow] := FindField('EM_GUBUNCODENAME').AsString;
          cells[5,nRow] := FindField('EM_HANDPHONE').AsString;
          cells[6,nRow] := FindField('EM_COMPANYPHONE').AsString;
          cells[7,nRow] := FindField('EM_EMINFO').AsString;
          cells[8,nRow] := FindField('EM_REGDATE').AsString;
          cells[9,nRow] := FindField('EM_ENDDATE').AsString;
          cells[10,nRow] := FindField('EM_ATUSE').AsString;
          cells[11,nRow] := FindField('EM_FDUSE').AsString;
          cells[12,nRow] := FindField('EM_GROUPCODENAME').AsString;
          cells[13,nRow] := FindField('EM_SEQ').AsString;
          cells[14,nRow] := FindField('CO_COMPANYCODE').AsString;
          cells[15,nRow] := FindField('PO_POSICODE').AsString;
          cells[16,nRow] := FindField('EM_GUBUNCODE').AsString;
          cells[17,nRow] := FindField('EM_GROUPCODE').AsString;
          cells[18,nRow] := FindField('EM_GRADETYPE').AsString;
          if FindField('EM_SEQ').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;
          if FindField('EM_GRADETYPE').AsString = '3' then RowColor[nRow] := clYellow //$00EACAB6
          else RowColor[nRow] := clWhite;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow = 0 then
        begin
          if Row > (L_nPageListMaxCount - 1) then TopRow := Row - L_nPageListMaxCount;
        end else
        begin
          TopRow := aTopRow;
        end;

      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;


procedure TfmAccessTimeAdmin.sg_CardCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;

end;

procedure TfmAccessTimeAdmin.sg_DeviceCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
var
  i : integer;
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nEmployeeCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nEmployeeCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if (ACol >= 2) and (ACol <= 5) then
    begin
      if State then
      begin
        for i := 1 to 4 do
          sg_Device.SetCheckBoxState(i + 5,ARow,False);
      end;
    end else if (ACol >= 6) and (ACol <= 9) then
    begin
      if State then
      begin
        for i := 1 to 4 do
          sg_Device.SetCheckBoxState(i + 1,ARow,False);
      end;
    end;
  end;

end;

procedure TfmAccessTimeAdmin.sg_EmployeeListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nEmployeeCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nEmployeeCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nEmployeeCheckCount := L_nEmployeeCheckCount + 1
    else L_nEmployeeCheckCount := L_nEmployeeCheckCount - 1 ;
  end;
end;

procedure TfmAccessTimeAdmin.sg_EmployeeListClick(Sender: TObject);
begin
  inherited;
  lb_SelectEmName.Caption.Text := sg_EmployeeList.Cells[1,sg_EmployeeList.Row];
  ed_selectEmSeq.Text := sg_EmployeeList.Cells[13,sg_EmployeeList.Row];
  tv_buildingNameDblClick(self);
end;

procedure TfmAccessTimeAdmin.sg_EmployeeListResize(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := sg_EmployeeList.Height div sg_EmployeeList.DefaultRowHeight;
end;

procedure TfmAccessTimeAdmin.sg_NotPermitAlarmCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nNotPermitArmAreaCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nNotPermitArmAreaCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nNotPermitArmAreaCheckCount := L_nNotPermitArmAreaCheckCount + 1
    else L_nNotPermitArmAreaCheckCount := L_nNotPermitArmAreaCheckCount - 1 ;
  end;
end;

procedure TfmAccessTimeAdmin.sg_NotPermitDoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nNotPermitDoorCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nNotPermitDoorCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nNotPermitDoorCheckCount := L_nNotPermitDoorCheckCount + 1
    else L_nNotPermitDoorCheckCount := L_nNotPermitDoorCheckCount - 1 ;
  end;
end;

procedure TfmAccessTimeAdmin.sg_PermitAlarmCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nPermitArmAreaCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nPermitArmAreaCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nPermitArmAreaCheckCount := L_nPermitArmAreaCheckCount + 1
    else L_nPermitArmAreaCheckCount := L_nPermitArmAreaCheckCount - 1 ;
  end;
end;

procedure TfmAccessTimeAdmin.sg_PermitDoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nPermitDoorCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nPermitDoorCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nPermitDoorCheckCount := L_nPermitDoorCheckCount + 1
    else L_nPermitDoorCheckCount := L_nPermitDoorCheckCount - 1 ;
  end;

end;

procedure TfmAccessTimeAdmin.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;
  SearchDeviceList('');
end;

procedure TfmAccessTimeAdmin.tv_CompanyNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_CompanyName.Selected = nil then tv_CompanyName.Items[0].Selected := True;

  ed_CompanyCode.Text := tv_CompanyCode.Items.Item[tv_CompanyName.Selected.AbsoluteIndex].Text;
  eb_CompanyName.Text := tv_CompanyName.Selected.Text;
  tv_CompanyName.Visible := False;
  LoadPosiCode(copy(ed_CompanyCode.Text,1,1+G_nCompanyCodeLength),PosiSearchCodeList,TComboBox(cmb_Posi),True,L_stAllName);
  SearchEmployeeList('');
end;

initialization
  RegisterClass(TfmAccessTimeAdmin);
Finalization
  UnRegisterClass(TfmAccessTimeAdmin);

end.
