﻿unit uCertificateReceiptSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls, AdvSplitter, AdvPanel, Vcl.ImgList,
  AdvOfficeButtons, AdvGroupBox,Data.DB,Vcl.Imaging.jpeg, AdvSmoothTabPager,
  ToolPanels, AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers,
  AdvGlowButton, AdvOfficePager, AdvAppStyler, AdvOfficePagerStylers,
  Vcl.Imaging.pngimage,DateUtils, AdvProgressBar,Winapi.ShellAPI, AdvCombo,
  AdvEdBtn;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmCertificateReceiptSearch = class(TfmASubForm)
    BodyPanel: TW7Panel;
    pm_Work: TPopupMenu;
    AdvSmoothPanel1: TAdvSmoothPanel;
    pan_EmployeeList: TAdvSmoothPanel;
    MenuImageList16: TImageList;
    pm_EmployeeAdd: TMenuItem;
    OpenDialog1: TOpenDialog;
    pm_Employee: TPopupMenu;
    pm_EmUpdate: TMenuItem;
    pm_EmDelete: TMenuItem;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    SaveDialog1: TSaveDialog;
    ProgressBar2: TProgressBar;
    pan_Message: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    AdvProgressBar1: TAdvProgressBar;
    btn_AccessConfirm: TAdvGlassButton;
    SearchTimer: TTimer;
    tv_List: TTreeView;
    tv_Code: TTreeView;
    AdvSmoothPanel3: TAdvSmoothPanel;
    Label1: TLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    ed_SerchSelectCompanyCode: TAdvEdit;
    btn_EmployeeSearch: TAdvGlowButton;
    btn_EmployeeClassSelect: TAdvGlowButton;
    ed_SearchEmployeeClassName: TAdvEdit;
    AdvSmoothPanel2: TAdvSmoothPanel;
    lb_Caption: TLabel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    AdvSmoothLabel4: TAdvSmoothLabel;
    ed_SerchSelectCertificatdClassCode: TAdvEdit;
    cmb_Certificate: TAdvComboBox;
    btn_ClassSelect: TAdvGlowButton;
    ed_CertificateClass: TAdvEdit;
    AdvSmoothLabel6: TAdvSmoothLabel;
    ed_SearchName: TAdvEdit;
    AdvSmoothLabel7: TAdvSmoothLabel;
    ed_SearchPhone: TAdvEdit;
    tv_EmployeeClassList: TTreeView;
    tv_EmployeeClassCode: TTreeView;
    sg_EmployeeList: TAdvStringGrid;
    AdvSmoothLabel5: TAdvSmoothLabel;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    AdvSmoothLabel8: TAdvSmoothLabel;
    cmb_Work: TComboBox;
    pan_PassGrade: TAdvSmoothPanel;
    Label2: TLabel;
    AdvSmoothLabel9: TAdvSmoothLabel;
    cmb_State: TAdvComboBox;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tv_ListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tv_ListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure pan_EmployeeListResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_SaveMouseEnter(Sender: TObject);
    procedure btn_SaveMouseLeave(Sender: TObject);
    procedure dt_IndateChange(Sender: TObject);
    procedure dt_OutDateChange(Sender: TObject);
    procedure sg_EmployeeListResize(Sender: TObject);
    procedure Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_emPermitAdminMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_PositionInfoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_AccessConfirmClick(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure sg_TuitionCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure tv_ListDblClick(Sender: TObject);
    procedure btn_ClassSelectClick(Sender: TObject);
    procedure cmb_CertificateChange(Sender: TObject);
    procedure sg_EmployeeListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure tv_EmployeeClassListDblClick(Sender: TObject);
    procedure btn_EmployeeSearchClick(Sender: TObject);
    procedure ed_SearchPhoneKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_EmployeeClassSelectClick(Sender: TObject);
    procedure cmb_WorkChange(Sender: TObject);
    procedure cmb_WorkExit(Sender: TObject);
    procedure sg_EmployeeListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    DragOrigin: TPoint;
    MouseDowning : BOOLEAN;
  private
    L_stMenuID : string;
    L_stAllName : string;
    L_stWork : string;
    L_nEmployeeCheckCount : integer;
    L_nSelectCol : integer;
    L_nPageListMaxCount : integer;
    L_nUpdateEmStateIndex : integer;
    L_bVisitEditMode : Boolean;
    L_bEmployeeGradeChange : Boolean;
    L_bFingerImageUpdate : Boolean;
    L_bFingerUse : Boolean;
    CertificateCodeList : TStringList;
    CertificatePlanList : TStringList;
    CertificatePassGradeList :TStringList;
    procedure FormNameSetting;
    procedure LoadApplyState;
    procedure LoadCertificatePass;
    procedure LoadPaymentState;
    procedure SearchEmployeeList(aCode:string;aTopRow:integer = 0);
  private
    L_bFormClose : Boolean;
    L_bSearchBreak : Boolean;
    L_bSearchEnd : Boolean;
    { Private declarations }
    procedure employeePanelClear;

    procedure ViewTimeGroupCode(aTimeGroup:string);
    function JpegStartsInBlob(PicField:TBlobField):integer;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    procedure FormSearchEnable(aEnabled:Boolean);
    procedure Form_Close;
    procedure FontSetting;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmCertificateReceiptSearch: TfmCertificateReceiptSearch;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uEmployeeRelay,
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
  uSupremaFinger,
  uFingerVariable,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmCertificateReceiptSearch.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmCertificateReceiptSearch.btn_AccessConfirmClick(Sender: TObject);
begin
  inherited;
  L_bSearchBreak := True;
  Pan_Message.Visible := False;

end;

procedure TfmCertificateReceiptSearch.btn_CancelClick(Sender: TObject);
begin
  inherited;
  sg_EmployeeList.Enabled := True;
  pan_PassGrade.Visible := False;
end;

procedure TfmCertificateReceiptSearch.btn_ClassSelectClick(Sender: TObject);
begin
  inherited;
  tv_List.Visible := Not tv_List.Visible;
  tv_List.Top := btn_ClassSelect.Top + btn_ClassSelect.Height + 30;
  tv_List.Left := btn_ClassSelect.Left + btn_ClassSelect.Width - tv_List.Width;
end;

procedure TfmCertificateReceiptSearch.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmCertificateReceiptSearch.btn_EmployeeClassSelectClick(Sender: TObject);
begin
  inherited;
  tv_EmployeeClassList.Visible := Not tv_EmployeeClassList.Visible;
  tv_EmployeeClassList.Top := AdvSmoothPanel2.Height + btn_EmployeeClassSelect.Top + btn_EmployeeClassSelect.Height + 30;
  tv_EmployeeClassList.Left := btn_EmployeeClassSelect.Left + btn_EmployeeClassSelect.Width - tv_EmployeeClassList.Width;

end;

procedure TfmCertificateReceiptSearch.btn_EmployeeSearchClick(Sender: TObject);
begin
  inherited;
  SearchEmployeeList('');
end;

procedure TfmCertificateReceiptSearch.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;

end;

procedure TfmCertificateReceiptSearch.btn_SaveClick(Sender: TObject);
var
  stDate : string;
  stGrade : string;
begin
  inherited;
  if cmb_State.ItemIndex < 0 then
  begin
    showmessage('등급을 선택하지 않았습니다.');
    Exit;
  end;
  stGrade := CertificatePassGradeList.Strings[cmb_State.ItemIndex];
  with sg_EmployeeList do
  begin
    stDate := cells[3,row];
    stDate := stringreplace(stDate,'-','',[rfReplaceAll]);
    stDate := stringreplace(stDate,' ','',[rfReplaceAll]);
    dmDBUpdate.UpdateTB_CertificateReceipt_Field_IntValue(cells[23,row],stDate,cells[22,row],'CG_CODE',stGrade);
    cells[7,row] := cmb_State.Text;
  end;
  sg_EmployeeList.Enabled := True;
  pan_PassGrade.Visible := False;

end;

procedure TfmCertificateReceiptSearch.btn_SaveMouseEnter(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clYellow;
end;

procedure TfmCertificateReceiptSearch.btn_SaveMouseLeave(Sender: TObject);
begin
  inherited;
  TAdvGlassButton(Sender).ShineColor := clGray;
end;

procedure TfmCertificateReceiptSearch.cmb_CertificateChange(Sender: TObject);
begin
  inherited;
  SearchEmployeeList('');
end;

procedure TfmCertificateReceiptSearch.cmb_WorkChange(Sender: TObject);
var
  stTemp: string;
  stMessage : string;
  stDate : string;
begin
  with cmb_Work do
  begin
    if L_nSelectCol = 6 then
    begin
      hide;
      if ItemIndex >= 0 then
      begin
        with sg_EmployeeList do
        begin
          Cells[Col, row] := Text;
          stDate := cells[3,row];
          stDate := stringreplace(stDate,'-','',[rfReplaceAll]);
          stDate := stringreplace(stDate,' ','',[rfReplaceAll]);
          dmDBUpdate.UpdateTB_CertificateReceipt_Field_IntValue(cells[23,row],stDate,cells[22,row],'CR_CertificatePass',inttostr(ItemIndex));
          Cells[16, row] := inttostr(ItemIndex);
        end;
      end;
      if ItemIndex = 1 then
      begin
        sg_EmployeeList.Enabled := False;
        pan_PassGrade.Visible := True;
        cmb_State.ItemIndex := 0;
      end;
    end else if L_nSelectCol = 9 then
    begin
      hide;
      if ItemIndex >= 0 then
      begin
        with sg_EmployeeList do
        begin
          Cells[Col, row] := Text;
          stDate := cells[3,row];
          stDate := stringreplace(stDate,'-','',[rfReplaceAll]);
          stDate := stringreplace(stDate,' ','',[rfReplaceAll]);
          dmDBUpdate.UpdateTB_CertificateReceipt_Field_IntValue(cells[23,row],stDate,cells[22,row],'CR_RECEIPTAMT',inttostr(ItemIndex));
          Cells[17, row] := inttostr(ItemIndex);
        end;
      end;
    end else if L_nSelectCol = 11 then
    begin
      hide;
      if ItemIndex >= 0 then
      begin
        with sg_EmployeeList do
        begin
          Cells[Col, row] := Text;
          stDate := cells[3,row];
          stDate := stringreplace(stDate,'-','',[rfReplaceAll]);
          stDate := stringreplace(stDate,' ','',[rfReplaceAll]);
          dmDBUpdate.UpdateTB_CertificateReceipt_Field_IntValue(cells[23,row],stDate,cells[22,row],'CR_CertificateIssu',inttostr(ItemIndex));
          Cells[18, row] := inttostr(ItemIndex);
        end;
      end;
    end else if L_nSelectCol = 12 then
    begin
      hide;
      if ItemIndex >= 0 then
      begin
        with sg_EmployeeList do
        begin
          Cells[Col, row] := Text;
          stDate := cells[3,row];
          stDate := stringreplace(stDate,'-','',[rfReplaceAll]);
          stDate := stringreplace(stDate,' ','',[rfReplaceAll]);
          dmDBUpdate.UpdateTB_CertificateReceipt_Field_IntValue(cells[23,row],stDate,cells[22,row],'CR_CertificateIssuAMT',inttostr(ItemIndex));
          Cells[19, row] := inttostr(ItemIndex);
        end;
      end;
    end else if L_nSelectCol = 14 then
    begin
      hide;
      if ItemIndex >= 0 then
      begin
        with sg_EmployeeList do
        begin
          Cells[Col, row] := Text;
          stDate := cells[3,row];
          stDate := stringreplace(stDate,'-','',[rfReplaceAll]);
          stDate := stringreplace(stDate,' ','',[rfReplaceAll]);
          dmDBUpdate.UpdateTB_CertificateReceipt_Field_IntValue(cells[23,row],stDate,cells[22,row],'CR_CertificateMasterIssu',inttostr(ItemIndex));
          Cells[20, row] := inttostr(ItemIndex);
        end;
      end;
    end else if L_nSelectCol = 15 then
    begin
      hide;
      if ItemIndex >= 0 then
      begin
        with sg_EmployeeList do
        begin
          Cells[Col, row] := Text;
          stDate := cells[3,row];
          stDate := stringreplace(stDate,'-','',[rfReplaceAll]);
          stDate := stringreplace(stDate,' ','',[rfReplaceAll]);
          dmDBUpdate.UpdateTB_CertificateReceipt_Field_IntValue(cells[23,row],stDate,cells[22,row],'CR_CertificateMasterIssuAMT',inttostr(ItemIndex));
          Cells[21, row] := inttostr(ItemIndex);
        end;
      end;
    end;
  end;
end;

procedure TfmCertificateReceiptSearch.cmb_WorkExit(Sender: TObject);
begin
  inherited;
  cmb_Work.hide;
end;

procedure TfmCertificateReceiptSearch.dt_IndateChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True;  //유효기간 변경시 카드데이터 재전송
end;

procedure TfmCertificateReceiptSearch.dt_OutDateChange(Sender: TObject);
begin
  inherited;
  L_bEmployeeGradeChange := True; //유효기간 변경시 카드데이터 재전송
end;

procedure TfmCertificateReceiptSearch.ed_SearchPhoneKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  btn_EmployeeSearchClick(btn_EmployeeSearch);
end;

procedure TfmCertificateReceiptSearch.employeePanelClear;
begin
  L_bEmployeeGradeChange := False;
  L_bFingerImageUpdate := False;
end;


procedure TfmCertificateReceiptSearch.FontSetting;
begin

end;

procedure TfmCertificateReceiptSearch.FormChangeEvent(aNumber: integer);
var
  stSelectCode1 : string;
  stSelectCode2 : string;
  nIndex : integer;
begin
end;

procedure TfmCertificateReceiptSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dmSupremaFinger.Connected then
  begin
    dmSupremaFinger.SocketOPEN := False;
  end;
  //dmSupremaFinger.Free;
  L_bFormClose := True;
  L_bSearchBreak := True;
  Delay(1000);

  CertificateCodeList.Free;
  CertificatePlanList.Free;
  CertificatePassGradeList.Free;

  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'FALSE');

  Action := caFree;
end;

procedure TfmCertificateReceiptSearch.FormCreate(Sender: TObject);
begin
  inherited;
  CertificateCodeList := TStringList.Create;
  CertificatePlanList := TStringList.Create;
  CertificatePassGradeList := TStringList.Create;
  FontSetting;
  L_bSearchEnd := True;
  //dmSupremaFinger := TdmSupremaFinger.Create(nil);

end;

procedure TfmCertificateReceiptSearch.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then tv_List.PopupMenu := pm_Work
  else tv_List.PopupMenu := nil;
  if IsUpdateGrade or IsDeleteGrade then sg_EmployeeList.PopupMenu := pm_Employee
  else sg_EmployeeList.PopupMenu := nil;
  pm_EmployeeAdd.Enabled := IsInsertGrade;
  pm_EmDelete.Enabled := IsDeleteGrade;
  pm_EmUpdate.Enabled := IsUpdateGrade;
end;

procedure TfmCertificateReceiptSearch.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmCertificateReceiptSearch.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  pm_EmployeeAdd.Caption := dmFormFunction.GetFormName('0','2','COMMONADD');
  pm_EmDelete.Caption := dmFormFunction.GetFormName('0','2','COMMONDELETE');


  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');

end;

procedure TfmCertificateReceiptSearch.FormResize(Sender: TObject);
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

  pan_Message.Left := (Width div 2) - (pan_Message.Width div 2);
  pan_Message.Top := (Height div 2) - (pan_Message.Height div 2);

  pan_PassGrade.Left := (Width div 2) - (pan_PassGrade.Width div 2);
  pan_PassGrade.Top := (Height div 2) - (pan_PassGrade.Height div 2);


  pan_EmployeeListResize(pan_EmployeeList);

end;

procedure TfmCertificateReceiptSearch.FormSearchEnable(aEnabled: Boolean);
begin
  tv_List.Enabled := aEnabled;
end;

procedure TfmCertificateReceiptSearch.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  dt_FromDate.Date := Now - 7;
  dt_ToDate.Date := Now;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSEMPLOYEE,'TRUE');

  LoadCertificateClassTreeView('',tv_List,tv_Code,con_LocalCompanyImageIndex);
  tv_List.Items[0].Selected := True;
  tv_ListDBlClick(self);

  LoadCompanyTreeView('',tv_EmployeeClassList,tv_EmployeeClassCode,con_LocalCompanyImageIndex,'',True);
  tv_EmployeeClassListDblClick(tv_EmployeeClassList);

  LoadCertificatePassGrade(CertificatePassGradeList,TComboBox(cmb_state),False);
  if L_bFormClose or G_bApplicationTerminate then Exit;

  L_bVisitEditMode := True;

end;

procedure TfmCertificateReceiptSearch.Form_Close;
begin
  Close;
end;

function TfmCertificateReceiptSearch.JpegStartsInBlob(PicField: TBlobField): integer;
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

procedure TfmCertificateReceiptSearch.LoadApplyState;
begin
  cmb_Work.Items.Clear;
  cmb_Work.Items.Add('미신청');
  cmb_Work.Items.Add('신청완료');
end;

procedure TfmCertificateReceiptSearch.LoadCertificatePass;
begin
  cmb_Work.Items.Clear;
  cmb_Work.Items.Add('');
  cmb_Work.Items.Add('합격');
  cmb_Work.Items.Add('불합격');

end;

procedure TfmCertificateReceiptSearch.LoadPaymentState;
begin
  cmb_Work.Items.Clear;
  cmb_Work.Items.Add('미수납');
  cmb_Work.Items.Add('수납완료');
end;

procedure TfmCertificateReceiptSearch.Pan_EmcodeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
(*    if (Button = mbLeft) and (MouseDowning = False) then
    begin
        // DRAG POINT 저장
        DragOrigin := Point (X,Y);
        // MOUSE DOWN = TRUE 설정
        MouseDowning := True;
    end;
*)
end;

procedure TfmCertificateReceiptSearch.Pan_EmcodeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
(*  inherited;
    // MOUSE DOWN = TRUE CHECK
    if (MouseDowning = True) then
    begin
        // IMAGE TOP 위치 설정
        (Sender as TAdvSmoothPanel).Top := (Sender as TAdvSmoothPanel).Top + Y - DragOrigin.Y;
        // IMAGE LEFT 위치 설정
        (Sender as TAdvSmoothPanel).Left := (Sender as TAdvSmoothPanel).Left + X - DragOrigin.X;
    end;
 *)
end;

procedure TfmCertificateReceiptSearch.Pan_EmcodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    // MOUSE DOWN = FALSE 설정
//    MouseDowning := False;
end;

procedure TfmCertificateReceiptSearch.pan_emPermitAdminMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);

end;

procedure TfmCertificateReceiptSearch.pan_EmployeeListResize(Sender: TObject);
begin
  inherited;
  sg_EmployeeList.Width := pan_EmployeeList.Width - sg_EmployeeList.Left - 20;
  sg_EmployeeList.Height := pan_EmployeeList.Height - sg_EmployeeList.Top - 50;
//  sg_EmployeeList.ColWidths[4] := sg_EmployeeList.Width - sg_EmployeeList.ColWidths[0] - sg_EmployeeList.ColWidths[1] - sg_EmployeeList.ColWidths[2] - sg_EmployeeList.ColWidths[3] - 10;
//  if sg_EmployeeList.ColWidths[4] < 100 then sg_EmployeeList.ColWidths[4] := 100;

end;

procedure TfmCertificateReceiptSearch.pan_FingerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmCertificateReceiptSearch.pan_PositionInfoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
(* ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
 *)
end;


procedure TfmCertificateReceiptSearch.SearchEmployeeList(aCode: string;
  aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stTemp : string;
  stFromDate : string;
  stToDate : string;
  stCertificateCode : string;
begin
  L_nEmployeeCheckCount := 0;

  GridInit(sg_EmployeeList,16,2,False);
  stFromDate := FormatDateTime('yyyymmdd',dt_FromDate.Date);
  stToDate := FormatDateTime('yyyymmdd',dt_toDate.Date);
  stCertificateCode := CertificateCodeList.Strings[cmb_Certificate.ItemIndex];

  stSql := ' Select a.*,b.EM_NAME,b.EM_BIRTHDAY,b.EM_REGDATE,b.EM_REGDATE,b.EM_SEQ,c.CO_COMPANYNAME,';
  stSql := stSql + 'd.CF_NAME,d.CF_AMT,d.CF_CERTIISSUAMT,d.CF_MASTERAMT,e.CP_SEQ,e.CP_RECEIPTFROM,e.CP_RECEIPTTO,e.CP_RESULTDATE,f.CG_NAME from TB_CertificateReceipt a ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stsql + ' ON(a.EM_SEQ = b.EM_SEQ) ';
  stSql := stSql + ' Left Join TB_COMPANYCODE c ';
  stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ) ';
  stSql := stSql + ' Inner Join TB_CertificateCode d ';
  stSql := stSql + ' ON(a.CF_CODE = d.CF_CODE) ';
  stSql := stSql + ' Left Join TB_CertificatePlan e ';
  stSql := stSql + ' ON(a.CF_CODE = e.CF_CODE';
  stSql := stSql + ' AND a.CP_DATE = e.CP_DATE)';
  stSql := stSql + ' Left Join TB_CertificatePassGrade f ';
  stSql := stSql + ' ON(a.CG_CODE = f.CG_CODE)';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND d.CC_CODE Like ''' + ed_SerchSelectCertificatdClassCode.Text + '%'' ';
  stSql := stSql + ' AND b.CO_COMPANYCODE Like ''' + ed_SerchSelectCompanyCode.Text + '%'' ';
  stSql := stSql + ' AND a.CP_DATE between ''' + stFromDate + '''  and ''' + stToDate + ''' ';
  if stCertificateCode <> '' then stSql := stSql + ' AND a.CF_CODE = ' + stCertificateCode + ' ';
  if ed_SearchName.Text <> '' then
    stSql := stSql + ' AND b.EM_NAME Like N''%' + ed_SearchName.Text + '%'' ';
  if ed_SearchPhone.Text <> '' then
    stSql := stSql + ' AND (b.EM_HANDPHONE Like ''%' + ed_SearchPhone.Text + '%'' OR b.EM_COMPANYPHONE Like ''%' + ed_SearchPhone.Text + '%'' ) ';

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

      with sg_EmployeeList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
(*
이름
자격증
회차
응시일
접수기간
발표일
합격여부
합격등급
응시료
응시료납부현황
자격증발급비
자격증발급신청유무
자격증발급비납부현황
마스터자격증발급비
마스터자격증발급신청유무
마스터자격증발급비납부현황
*)

          cells[0,nRow] := FindField('EM_NAME').AsString;        //학생 이름
          cells[1,nRow] := FindField('CF_NAME').AsString;        //자격증
          cells[2,nRow] := FindField('CP_SEQ').AsString;        //회차
          cells[3,nRow] := MakeDateTimeStr(FindField('CP_DATE').AsString); //응시일
          cells[4,nRow] := MakeDatetimeStr(FindField('CP_RECEIPTFROM').AsString) + '~' + MakeDatetimeStr(FindField('CP_RECEIPTTO').AsString) ; //등록기간
          cells[5,nRow] := MakeDateTimeStr(FindField('CP_RESULTDATE').AsString);
          if FindField('CR_CertificatePass').IsNull or (FindField('CR_CertificatePass').AsString = '0')  then
          begin
            cells[6,nRow] := '';
          end else if FindField('CR_CertificatePass').AsString = '1' then
          begin
            cells[6,nRow] := '합격';
          end else
          begin
            cells[6,nRow] := '불합격';
          end;
          cells[7,nRow] := FindField('CG_NAME').AsString ;
          cells[8,nRow] := FindField('CF_AMT').AsString ;
          if FindField('CR_RECEIPTAMT').AsString = '0'  then
          begin
            cells[9,nRow] := '미수납';
          end else
          begin
            cells[9,nRow] := '수납완료';
          end;
          cells[10,nRow] := FindField('CF_CERTIISSUAMT').AsString ;
          if FindField('CR_CertificateIssu').AsString = '0'  then
          begin
            cells[11,nRow] := '미신청';
          end else
          begin
            cells[11,nRow] := '신청완료';
          end;
          if FindField('CR_CertificateIssuAMT').AsString = '0'  then
          begin
            cells[12,nRow] := '미수납';
          end else
          begin
            cells[12,nRow] := '수납완료';
          end;

          cells[13,nRow] := FindField('CF_MASTERAMT').AsString ;
          if FindField('CR_CertificateMasterIssu').AsString = '0'  then
          begin
            cells[14,nRow] := '미신청';
          end else
          begin
            cells[14,nRow] := '신청완료';
          end;
          if FindField('CR_CertificateMasterIssuAMT').AsString = '0'  then
          begin
            cells[15,nRow] := '미수납';
          end else
          begin
            cells[15,nRow] := '수납완료';
          end;


          cells[16,nRow] := FindField('CR_CertificatePass').AsString; //합격여부
          cells[17,nRow] := FindField('CR_RECEIPTAMT').AsString; //응시료납부현황
          cells[18,nRow] := FindField('CR_CertificateIssu').AsString; //자격증발급신청유무
          cells[19,nRow] := FindField('CR_CertificateIssuAMT').AsString; //자격증발급비납부현황
          cells[20,nRow] := FindField('CR_CertificateMasterIssu').AsString; //마스터자격증발급신청유무
          cells[21,nRow] := FindField('CR_CertificateMasterIssuAMT').AsString; //마스터자격증발급비납부현황
          cells[22,nRow] := FindField('EM_SEQ').AsString; //학생코드
          cells[23,nRow] := FindField('CF_CODE').AsString;



          nRow := nRow + 1;
          Application.ProcessMessages;
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

procedure TfmCertificateReceiptSearch.SearchTimerTimer(Sender: TObject);
begin
  inherited;
  SearchTimer.Enabled := False;
  SearchEmployeeList('');
end;

procedure TfmCertificateReceiptSearch.sg_EmployeeListCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
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

procedure TfmCertificateReceiptSearch.sg_EmployeeListResize(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := sg_EmployeeList.Height div sg_EmployeeList.DefaultRowHeight;
end;

procedure TfmCertificateReceiptSearch.sg_EmployeeListSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  nIndex : integer;
  Rect: TRect;
begin
  inherited;
  if Trim(sg_EmployeeList.Cells[22, ARow]) = '' then Exit;

  L_nSelectCol := ACol;

  Rect := sg_EmployeeList.CellRect(ACol, ARow);
  if ACol = 6 then   //합격여부
  begin

    LoadCertificatePass;
    With cmb_Work do
    begin
      Visible := true;
      Left := Rect.Left ;
      Top := Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);

      nIndex := Items.IndexOf(Trim(sg_EmployeeList.Cells[ACol, ARow]));
      ItemIndex := nIndex;
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end else if (ACol = 9) or (ACol=12) OR (ACol=15) then
  begin
    LoadPaymentState;
    With cmb_Work do
    begin
      Visible := true;
      Left := Rect.Left ;
      Top := Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      nIndex := Items.IndexOf(Trim(sg_EmployeeList.Cells[ACol, ARow]));
      ItemIndex := nIndex;
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end else if (ACol = 11) or (ACol=14) then
  begin
    LoadApplyState;
    With cmb_Work do
    begin
      Visible := true;
      Left := Rect.Left ;
      Top := Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      nIndex := Items.IndexOf(Trim(sg_EmployeeList.Cells[ACol, ARow]));
      ItemIndex := nIndex;
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end;

end;

procedure TfmCertificateReceiptSearch.sg_TuitionCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;
end;


procedure TfmCertificateReceiptSearch.tv_EmployeeClassListDblClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if tv_EmployeeClassList.Selected = nil then tv_EmployeeClassList.Items[0].Selected := True;

  ed_SearchEmployeeClassName.Text := tv_EmployeeClassList.Selected.Text;
  stCode := tv_EmployeeClassCode.Items.Item[tv_EmployeeClassList.Selected.AbsoluteIndex].Text;

  ed_SerchSelectCompanyCode.Text := stCode;
  SearchEmployeeList('');
  tv_EmployeeClassList.Visible := False;

end;

procedure TfmCertificateReceiptSearch.tv_ListDblClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if tv_List.Selected = nil then tv_Code.Items[0].Selected := True;
  ed_CertificateClass.Text := tv_List.Selected.Text;

  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;

  if ed_SerchSelectCertificatdClassCode.Text <> stCode then
  begin
    ed_SerchSelectCertificatdClassCode.Text := stCode;
    LoadCertificateCode(ed_SerchSelectCertificatdClassCode.Text,CertificateCodeList,TComboBox(cmb_Certificate),True,'전체');
    cmb_CertificateChange(cmb_Certificate);
  end;
  tv_List.Visible := False;
end;

procedure TfmCertificateReceiptSearch.tv_ListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stCompanyCode : string;
  stEmSeq : string;
  stDeepSeq,stViewSeq : string;
  stSql : string;
begin
  inherited;
  if Sender = Source then
  begin
    with TTreeView(Sender) do
    begin
      dropItem :=GetNodeAt(X,Y);
      currentItem := Selected;
      if currentItem.AbsoluteIndex = 0 then Exit;   //루트디렉토리가 움직일수는 없다
      stCompanyCode := tv_Code.Items[dropItem.AbsoluteIndex].Text;
      if copy(stCompanyCode,1,1) = 'E' then Exit; //옮기려는 위치가 사원정보이면 빠져 나가자
      stOrgCode := tv_Code.Items[currentItem.AbsoluteIndex].Text;
      if copy(stOrgCode,1,1) <> 'E' then Exit;
      stEmSeq := stOrgCode;
      Delete(stEmSeq,1,1);
      dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'CO_COMPANYCODE',stCompanyCode);
      dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_MEMLOAD','N');  //서버에서 메모리 로딩하자.
    end;
  end;
  LoadCertificateClassTreeView('',tv_List,tv_Code,con_LocalCompanyImageIndex);

end;

procedure TfmCertificateReceiptSearch.tv_ListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_List;

end;

procedure TfmCertificateReceiptSearch.ViewTimeGroupCode(aTimeGroup: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'Select * from TB_TIMECODE ';
  stSql := stSql + ' Where TC_GROUP = ''' + aTimeGroup + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
{      chk_TimeGroup.Items.Clear;
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME1').AsString,1,2) + ':' + copy(FindField('TC_TIME1').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME1').AsString,5,2) + ':' + copy(FindField('TC_TIME1').AsString,7,2));
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME2').AsString,1,2) + ':' + copy(FindField('TC_TIME2').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME2').AsString,5,2) + ':' + copy(FindField('TC_TIME2').AsString,7,2));
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME3').AsString,1,2) + ':' + copy(FindField('TC_TIME3').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME3').AsString,5,2) + ':' + copy(FindField('TC_TIME3').AsString,7,2));
      chk_TimeGroup.Items.Add(copy(FindField('TC_TIME4').AsString,1,2) + ':' + copy(FindField('TC_TIME4').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME4').AsString,5,2) + ':' + copy(FindField('TC_TIME4').AsString,7,2));

}
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

initialization
  RegisterClass(TfmCertificateReceiptSearch);
Finalization
  UnRegisterClass(TfmCertificateReceiptSearch);

end.
