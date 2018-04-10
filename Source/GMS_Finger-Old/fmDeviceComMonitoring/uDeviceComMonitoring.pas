﻿unit uDeviceComMonitoring;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, W7Classes, W7Panels, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvSmoothPanel, Vcl.ExtCtrls, AdvSmoothLabel,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvToolBtn,ADODB,ActiveX, uSubForm, CommandArray, AdvCombo, AdvGroupBox,
  Vcl.Mask, AdvSpin, AdvOfficeButtons, AdvPanel, Vcl.ComCtrls, AdvListV,
  Vcl.ImgList, Vcl.Menus, AdvMenus, AdvExplorerTreeview, paramtreeview,
  Vcl.Clipbrd, Vcl.Imaging.pngimage;


type
  TfmDeviceComMonitoring = class(TfmASubForm)
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    BodyPanel: TW7Panel;
    menuTab: TAdvOfficeTabSet;
    pan_DoorList: TAdvPanel;
    pan_CardListHeader: TAdvSmoothPanel;
    ImageList1: TImageList;
    pop_PermitAdd: TAdvPopupMenu;
    mn_addpermitListDelete: TMenuItem;
    toolslist: TImageList;
    sg_ComMonitoring: TAdvStringGrid;
    SearchTimer: TTimer;
    btn_Clear: TSpeedButton;
    lb_NodeName: TAdvSmoothLabel;
    cmb_FingerDevice: TComboBox;
    btnStart: TSpeedButton;
    btn_FileSave: TSpeedButton;
    SaveDialog1: TSaveDialog;
    procedure menuTabChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_AddNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure CommandArrayCommandsTMENUIDExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTFORMNAMEExecute(Command: TCommand;
      Params: TStringList);
    procedure btnStartClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure sg_ComMonitoringKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    L_bStart : Boolean;
    L_bClear : Boolean;
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stButtonPlayName : string;
    L_stButtonStopName : string;

    FingerDeviceIPList : TStringList;
    DisplayList : TStringList;
    { Private declarations }
  private
    Function FormNameSetting:Boolean;

  public
    { Public declarations }
    procedure Form_Close;
    procedure FingerCardEvent(aIP,aCmd,aData1,aData2,aData3:string);
  end;

var
  fmDeviceComMonitoring: TfmDeviceComMonitoring;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,uDBVariable,
  uFormDevice,
  uFormVariable;

{$R *.dfm}


procedure TfmDeviceComMonitoring.btnStartClick(Sender: TObject);
begin
  inherited;
  if btnStart.Caption = L_stButtonStopName then
  begin
    btnStart.Caption := L_stButtonPlayName;
    btnStart.Glyph := Img_Start.Picture.Bitmap;
  end else
  begin
    btnStart.Caption := L_stButtonStopName;
    btnStart.Glyph := Img_Stop.Picture.Bitmap;
  end;
end;

procedure TfmDeviceComMonitoring.btn_ClearClick(Sender: TObject);
begin
  inherited;
  L_bClear := True;
  GridInitialize(sg_ComMonitoring);

end;

procedure TfmDeviceComMonitoring.btn_FileSaveClick(Sender: TObject);
var
  stSaveFileName : string;
begin
  inherited;
  SaveDialog1.FileName := pan_CardListHeader.Caption.Text;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      //sg_Report.SaveToXLS(stSaveFileName,True);
      if fileexists(stSaveFileName) then
        deletefile(stSaveFileName);
      sg_ComMonitoring.SaveToXLS(stSaveFileName,True);
      //advgridexcelio1.XLSExport(stSaveFileName);
    end;
  end;

end;

procedure TfmDeviceComMonitoring.CommandArrayCommandsTFORMNAMEExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Caption := Params.Values['CAPTION'];

end;

procedure TfmDeviceComMonitoring.CommandArrayCommandsTMENUIDExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  L_stMenuID := Params.Values['ID'];

end;


procedure TfmDeviceComMonitoring.ed_AddNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfmDeviceComMonitoring.FingerCardEvent(aIP, aCmd, aData1, aData2,
  aData3: string);
var
  stFingerDeviceIP : string;
begin
  if btnStart.Caption <> L_stButtonStopName then Exit;
  stFingerDeviceIP := '';
  if cmb_FingerDevice.ItemIndex > -1 then
    stFingerDeviceIP := FingerDeviceIPList.Strings[cmb_FingerDevice.ItemIndex];

  if stFingerDeviceIP <> '' then
  begin
    if aIP <> stFingerDeviceIP then Exit;
  end;

  with sg_ComMonitoring do
  begin
    if RowCount >= 10000 then  rowCount := 9999;

    if Not L_bClear then InsertRows(1,1);
    L_bClear := False;

    Cells[0,1] := FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
    Cells[1,1] :=  aIP ;
    Cells[2,1] :=  aCmd ;
    Cells[3,1] :=  aData1 ;
    Cells[4,1] :=  aData2 ;
    Cells[5,1] :=  aData3 ;
  end;
end;

procedure TfmDeviceComMonitoring.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfmDeviceComMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FingerDeviceIPList.Free;
  DisplayList.Free;

  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(conFORMFINGERCOMMONITORING);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;

  Action := caFree;
end;

procedure TfmDeviceComMonitoring.FormCreate(Sender: TObject);
var
  stFingerDeviceID : string;
begin

  FingerDeviceIPList := TStringList.Create;
  DisplayList := TStringList.Create;

  menuTab.ActiveTabIndex := 1;
  menuTabChange(self);

  dmFormDevice.LoadFingerDevice(TComboBox(cmb_FingerDevice),FingerDeviceIPList,True);
  stFingerDeviceID := '';
  if cmb_FingerDevice.ItemIndex > -1 then
    stFingerDeviceID := FingerDeviceIPList.Strings[cmb_FingerDevice.ItemIndex];
  L_bClear := True;
  L_bStart := True;
end;


function TfmDeviceComMonitoring.FormNameSetting: Boolean;
var
  stSql : string;
  nCommonLength : integer;
  nButtonLength : integer;
  nMenuLength : integer;
  TempAdoQuery : TADOQuery;
begin
  nButtonLength := length('BUTTON');
  nCommonLength := length('COMMON');
  nMenuLength := length(L_stMenuID);
  stSql := ' Select FN_NAMECODE,FN_NAME' + inttostr(G_nFormLanguageType) + ' AS FORMNAME from TB_FORMNAME ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_MENUGUBUN = ''2'' '; //화면
  if G_nDBType = MSSQL then
  begin
    stSql := stSql + ' AND ( substring(FN_NAMECODE,1,' + inttostr(nCommonLength) + ') = ''COMMON'' ';
    stSql := stSql + ' OR substring(FN_NAMECODE,1,' + inttostr(nButtonLength) + ') = ''BUTTON'' ';
    stSql := stSql + ' OR substring(FN_NAMECODE,1,' + inttostr(nMenuLength) + ') = ''' + L_stMenuID + ''') ';
  end else if G_nDBType = POSTGRESQL then
  begin
    stSql := stSql + ' AND (substr(FN_NAMECODE,1,' + inttostr(nCommonLength) + ') = ''COMMON'' ';
    stSql := stSql + ' OR substr(FN_NAMECODE,1,' + inttostr(nButtonLength) + ') = ''BUTTON'' ';
    stSql := stSql + ' OR substr(FN_NAMECODE,1,' + inttostr(nMenuLength) + ') = ''' + L_stMenuID + ''') ';
  end else if G_nDBType = MDB then
  begin
    stSql := stSql + ' AND (LEFT(FN_NAMECODE,' + inttostr(nCommonLength) + ') = ''COMMON'' ';
    stSql := stSql + ' OR LEFT(FN_NAMECODE,' + inttostr(nButtonLength) + ') = ''BUTTON'' ';
    stSql := stSql + ' OR LEFT(FN_NAMECODE,' + inttostr(nMenuLength) + ') = ''' + L_stMenuID + ''') ';
  end else if G_nDBType = FIREBIRD then
  begin
    stSql := stSql + ' AND (substring(FN_NAMECODE From 1 for ' + inttostr(nCommonLength) + ') = ''COMMON'' ';
    stSql := stSql + ' OR substring(FN_NAMECODE From 1 for ' + inttostr(nButtonLength) + ') = ''BUTTON'' ';
    stSql := stSql + ' OR substring(FN_NAMECODE From 1 for ' + inttostr(nMenuLength) + ') = ''' + L_stMenuID + ''') ';
  end;
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
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        if FindField('FN_NAMECODE').AsString = 'BUTTONMENU001' then
        begin
          menuTab.AdvOfficeTabs[0].Caption := FindField('FORMNAME').AsString;
          L_stButtonCloseCaption := FindField('FORMNAME').AsString;
        end else if FindField('FN_NAMECODE').AsString = 'BUTTONMENU005' then
        begin
          menuTab.AdvOfficeTabs[1].Caption := FindField('FORMNAME').AsString;
        end else if FindField('FN_NAMECODE').AsString = 'BUTTONCLEAR001' then
        begin
          btn_Clear.Caption := FindField('FORMNAME').AsString;
        end else if FindField('FN_NAMECODE').AsString = 'BUTTONPLAY001' then
        begin
          L_stButtonPlayName := FindField('FORMNAME').AsString;
        end else if FindField('FN_NAMECODE').AsString = 'BUTTONPLAY002' then
        begin
          L_stButtonStopName := FindField('FORMNAME').AsString;
        end else if FindField('FN_NAMECODE').AsString = 'BUTTONFILESAVE001' then
        begin
          btn_FileSave.Caption := FindField('FORMNAME').AsString;
        end;
        Next;
      end;
      btnStart.Caption := L_stButtonStopName;
      btnStart.Glyph := Img_Stop.Picture.Bitmap;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDeviceComMonitoring.FormShow(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(conFORMFINGERCOMMONITORING);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;
  FormNameSetting;
end;

procedure TfmDeviceComMonitoring.Form_Close;
begin
  Close;
end;


procedure TfmDeviceComMonitoring.menuTabChange(Sender: TObject);
var
  stBuildingCode : string;
  stAreaCode : string;
  nIndex : integer;
begin
  if menuTab.ActiveTabIndex = 0 then //Ȩ
  begin
    if menuTab.AdvOfficeTabs.Items[0].Caption = L_stButtonCloseCaption then Close
    else
    begin
      menuTab.ActiveTabIndex := 1;
      menuTabChange(self);
    end;
  end;
end;



procedure TfmDeviceComMonitoring.sg_ComMonitoringKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  stTemp: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      stTemp:= Cells[Col,Row];

      if stTemp <> '' then ClipBoard.SetTextBuf(PChar(stTemp));
      showmessage(stTemp + ' 가 ClipBoard에 복사 되었습니다.');
    end;
  end;

end;

initialization
  RegisterClass(TfmDeviceComMonitoring);
Finalization
  UnRegisterClass(TfmDeviceComMonitoring);

end.
