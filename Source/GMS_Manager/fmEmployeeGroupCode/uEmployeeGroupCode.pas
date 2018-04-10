﻿unit uEmployeeGroupCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, AdvOfficeTabSetStylers, AdvToolBar,
  AdvToolBarStylers, AdvGlowButton, AdvOfficePager, AdvOfficePagerStylers,
  AdvAppStyler, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfmEmployeeGroupCode = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    tv_emGroupList: TTreeView;
    tv_emGroupCode: TTreeView;
    pm_Work: TPopupMenu;
    pm_ChiledCodeAdd: TMenuItem;
    pm_DeleteCode: TMenuItem;
    pm_UpdateCode: TMenuItem;
    Pan_EMGroupcode: TAdvSmoothPanel;
    ed_EmGroupName: TAdvEdit;
    ed_SelectCode: TAdvEdit;
    MenuImageList16: TImageList;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    btn_Add: TAdvGlowButton;
    btn_Update: TAdvGlowButton;
    btn_Delete: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    lb_WorkType: TLabel;
    lb_Name: TAdvSmoothLabel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tv_emGroupListClick(Sender: TObject);
    procedure pm_ChiledCodeAddClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_EmGroupNameKeyPress(Sender: TObject; var Key: Char);
    procedure pm_DeleteCodeClick(Sender: TObject);
    procedure tv_emGroupListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tv_emGroupListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tv_emGroupListDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    procedure FormNameSetting;
    procedure FontSetting;
//    procedure SearchList(aCode:string);
    function ChangeEmGroupCode(aOrgCode,aCode,aDeepSeq,aViewSeq:string):Boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmEmployeeGroupCode: TfmEmployeeGroupCode;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBCardPermit,
  uDBDelete,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmEmployeeGroupCode.btn_AddClick(Sender: TObject);
begin
  inherited;
  pm_ChiledCodeAddClick(pm_ChiledCodeAdd);
end;

procedure TfmEmployeeGroupCode.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_EMGroupcode.Visible := False;
end;

procedure TfmEmployeeGroupCode.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmEmployeeGroupCode.btn_DeleteClick(Sender: TObject);
begin
  inherited;
  pm_DeleteCodeClick(pm_DeleteCode);
end;

procedure TfmEmployeeGroupCode.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  WindowState := wsNormal;
end;

procedure TfmEmployeeGroupCode.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stParentCode : string;
  stCode,stDeepSeq,stViewSeq : string;
begin
  inherited;
  if Trim(ed_EmGroupName.Text) = '' then
  begin
    stMessage := dmFormMessage.GetMessage('BLANKFIELD');
    stMessage := StringReplace(stMessage,'$WORK',lb_Name.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;

  if L_stWork = 'CHILDCODEADD' then
  begin
    stParentCode := ed_SelectCode.Text;
    dmDBFunction.GetNextTB_EMPLOYEEGROUPCODE_ChildEmGroupCode(stParentCode,stCode,stDeepSeq,stViewSeq);
    dmDBInsert.InsertIntoTB_EMPLOYEEGROUPCODE_All(stCode,ed_EmGroupName.Text,stDeepSeq,'1',stViewSeq);
    if G_nMonitoringType <> 1 then
    begin
      stMessage := dmFormMessage.GetMessage('PARENTGRADECOPY');
      //여기에서 권한 복사하자.
      if (Application.MessageBox(pchar(stMessage),'Information',MB_OKCANCEL) = IDOK) then
      begin
        dmDBDelete.DeleteTB_CARDPERMITEMPLOYEEGROUP_EmGroupCode(stCode); //혹시 생성되는 코드의 권한이 있으면 모두 삭제
        dmDBFunction.CopyTB_CARDPERMITEMPLOYEEGROUP_ChiledCode(stParentCode,stCode,stDeepSeq);
        dmDBCardPermit.EmGroupGradeToEmployeeGrade;
      end;
    end;
    LoadEmployeeGroupTreeView(stParentCode,tv_emGroupList,tv_emGroupCode,0);
    tv_emGroupList.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSEMGROUPCODE,'');
  end else if L_stWork = 'EXTCODEADD' then
  begin
    stParentCode := copy(ed_SelectCode.Text,1,Length(ed_SelectCode.Text) - G_nEmployeeGroupLength);
    dmDBFunction.GetNextTB_EMPLOYEEGROUPCODE_ChildEmGroupCode(stParentCode,stCode,stDeepSeq,stViewSeq);
    dmDBInsert.InsertIntoTB_EMPLOYEEGROUPCODE_All(stCode,ed_EmGroupName.Text,stDeepSeq,'1',stViewSeq);
    if G_nMonitoringType <> 1 then
    begin
      stMessage := dmFormMessage.GetMessage('PARENTGRADECOPY');
      //여기에서 권한 복사하자.
      if (Application.MessageBox(pchar(stMessage),'Information',MB_OKCANCEL) = IDOK) then
      begin
        dmDBDelete.DeleteTB_CARDPERMITEMPLOYEEGROUP_EmGroupCode(stCode); //혹시 생성되는 코드의 권한이 있으면 모두 삭제
        dmDBFunction.CopyTB_CARDPERMITEMPLOYEEGROUP_ChiledCode(stParentCode,stCode,stDeepSeq);
        dmDBCardPermit.EmGroupGradeToEmployeeGrade;
      end;
    end;
    LoadEmployeeGroupTreeView(stParentCode,tv_emGroupList,tv_emGroupCode,0);
    tv_emGroupList.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSEMGROUPCODE,'');
  end else if L_stWork = 'SELECTCODEUPDATE' then
  begin
    stCode := ed_SelectCode.Text;
    dmDBUpdate.UpdateTB_EMPLOYEEGROUPCODE_Field_StringValue(stCode,'EM_GROUPCODENAME',ed_EmGroupName.Text);
    tv_emGroupList.Selected.Text := ed_EmGroupName.Text;
    tv_emGroupList.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSEMGROUPCODE,'');
    //SearchList(stCode);
  end;

  Pan_EMGroupcode.Visible := False;
end;

procedure TfmEmployeeGroupCode.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(pm_UpdateCode);
end;

function TfmEmployeeGroupCode.ChangeEmGroupCode(aOrgCode, aCode, aDeepSeq,
  aViewSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stChildCode,stDeepSeq,stViewSeq : string;
  stOrgDeepSeq : string;
begin
  stOrgDeepSeq := dmDBFunction.GetTB_EMPLOYEEGROUPCODE_CurrentDeepSeq(aOrgCode);
  stSql := ' Update TB_EMPLOYEEGROUPCODE Set ';
  stSql := stSql + ' EM_GROUPCODE = ''' + aCode + ''',';
  stSql := stSql + ' EM_DEEPSEQ = ' + aDeepSeq + ',';
  stSql := stSql + ' EM_VIEWSEQ = ' + aViewSeq + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ''' + aOrgCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

  //여기서 그룹코드별 카드권한 테이블 변경
  stSql := ' Update TB_CARDPERMITEMPLOYEEGROUP set EM_GROUPCODE = ''' + aCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ''' + aOrgCode + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);

  //여기서 사원테이블 정보를 변경 하자
  stSql := ' Update TB_EMPLOYEE set EM_GROUPCODE = ''' + aCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE = ''' + aOrgCode + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'Select * from TB_EMPLOYEEGROUPCODE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND EM_GROUPCODE Like ''' + aOrgCode + '%'' ';
    stSql := stSql + ' AND EM_DEEPSEQ = ' + inttostr(strtoint(stOrgDeepSeq) + 1) + '';
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
        dmDBFunction.GetNextTB_EMPLOYEEGROUPCODE_ChildEmGroupCode(aCode,stChildCode,stDeepSeq,stViewSeq); //신규 코드가 부모가 됨
        ChangeEmGroupCode(FindField('EM_GROUPCODE').AsString,stChildCode,stDeepSeq,stViewSeq);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmEmployeeGroupCode.ed_EmGroupNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;
end;


procedure TfmEmployeeGroupCode.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmEmployeeGroupCode.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsNormal;

end;

procedure TfmEmployeeGroupCode.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmEmployeeGroupCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fmMain.FORMENABLE(con_FormBMOSEMGROUPCODE,'FALSE');

  Action := caFree;
end;

procedure TfmEmployeeGroupCode.FormCreate(Sender: TObject);
begin
  inherited;
  if G_nFormLanguageType = 1 then
  begin
    ed_EmGroupName.ImeMode := imSHanguel;// imHanguel;
    ed_EmGroupName.ImeName := '';
  end else if G_nFormLanguageType = 2 then
  begin
    ed_EmGroupName.ImeMode := imAlpha;
    ed_EmGroupName.ImeName := '';
  end;
  FontSetting;
end;

procedure TfmEmployeeGroupCode.FormGradeRefresh;
begin
  Try
    if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
    pm_ChiledCodeAdd.Enabled := IsInsertGrade;
    btn_Add.Enabled := IsInsertGrade;
    pm_DeleteCode.Enabled := IsDeleteGrade;
    btn_Delete.Enabled := False;
    pm_UpdateCode.Enabled := IsUpdateGrade;
    btn_Update.Enabled := IsUpdateGrade;
  Except
    Exit;
  End;
end;

procedure TfmEmployeeGroupCode.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmEmployeeGroupCode.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('2','1','BM2_017');//dmFormFunction.GetFormName('0','2','COMMONLIST01');
  pm_ChiledCodeAdd.Caption := dmFormFunction.GetFormName('2','2','BM2_017pm001');
  btn_Add.Caption := dmFormFunction.GetFormName('2','2','BM2_017pm001');
  pm_DeleteCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  btn_Delete.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  pm_UpdateCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Update.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_Name.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEGROUP');
end;

procedure TfmEmployeeGroupCode.FormResize(Sender: TObject);
begin
  inherited;
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  tv_emGroupList.Height := List.Height - tv_emGroupList.Top - 30;
  tv_emGroupList.Width := List.Width - (tv_emGroupList.Left * 2);

  Pan_EMGroupcode.Left := (Width div 2) - (Pan_EMGroupcode.Width div 2);
  Pan_EMGroupcode.top := (Height div 2) - (Pan_EMGroupcode.Height div 2);

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;
end;

procedure TfmEmployeeGroupCode.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSEMGROUPCODE,'TRUE');

  LoadEmployeeGroupTreeView('',tv_emGroupList,tv_emGroupCode,0);

  FormResize(self);
  Left := 0;
  Top := 0;
end;

procedure TfmEmployeeGroupCode.Form_Close;
begin
  Close;
end;

procedure TfmEmployeeGroupCode.pm_ChiledCodeAddClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_emGroupList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_ChiledCodeAdd.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  Pan_EMGroupcode.Visible := True;
  lb_WorkType.Caption := pm_ChiledCodeAdd.Caption;
  ed_SelectCode.Text := tv_emGroupCode.Items.Item[tv_emGroupList.Selected.AbsoluteIndex].Text;
  L_stWork := 'CHILDCODEADD';
  ed_EmGroupName.Text := '';
  ed_EmGroupName.SetFocus;
end;

procedure TfmEmployeeGroupCode.pm_DeleteCodeClick(Sender: TObject);
var
  stMessage : string;
  stCode : string;
  stSql : string;
begin
  inherited;
  if tv_emGroupList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;

  stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;

  stCode := tv_emGroupCode.Items.Item[tv_emGroupList.Selected.AbsoluteIndex].Text;
  if dmDBFunction.CheckTB_EMPLOYEE_EmGroupCodeLike(stCode) = 1 then
  begin
    if (Application.MessageBox(PChar('해당 그룹권한을 사용중인 사원이 존재 합니다.그래도 삭제 하시겠습니까?'),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
    dmDBUpdate.UpdateTB_EMPLOYEE_EmGradeTypeFromGroupCode(stCode,'3');//개별권한으로 변경 처리 합니다.
  end;

  //stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
  //if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  (*
  stSql := ' Update TB_EMPLOYEEGROUPCODE set EM_CODEUSE = ''0'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE LIKE ''' + stCode + '%'' ';
  dmDataBase.ProcessExecSQL(stSql);
  *)

  dmDBDelete.DeleteTB_EMPLOYEEGROUPCODE_LikeCode(stCode);
  dmDBDelete.DeleteTB_CARDPERMITEMPLOYEEGROUP_LikeCode(stCode); //그룹권한 삭제 하자

  LoadEmployeeGroupTreeView(stCode,tv_emGroupList,tv_emGroupCode,0);
end;

procedure TfmEmployeeGroupCode.pm_UpdateCodeClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_emGroupList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_UpdateCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  Pan_EMGroupcode.Visible := True;
  lb_WorkType.Caption := pm_UpdateCode.Caption;
  ed_SelectCode.Text := tv_emGroupCode.Items.Item[tv_emGroupList.Selected.AbsoluteIndex].Text;
  ed_EmGroupName.Text := tv_emGroupList.Selected.Text;
  L_stWork := 'SELECTCODEUPDATE';
  ed_EmGroupName.SetFocus;
end;
(*
procedure TfmEmployeeGroupCode.SearchList(aCode: string);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
begin
  aTreeView := tv_emGroupList;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := tv_emGroupCode;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  stSql := ' Select * from TB_EMPLOYEEGROUPCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_CODEUSE = ''1'' ';
  stSql := stSql + ' Order by EM_DEEPSEQ,EM_VIEWSEQ ';
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
        if FindField('EM_DEEPSEQ').AsInteger = 0 then
        begin
          aNode := aTreeView.Items.Add(nil,FindField('EM_GROUPCODENAME').AsString);
          vTreeView.Items.AddChild(nil,FindField('EM_GROUPCODE').AsString);
          aNode.Expanded := True;
        end else
        begin
          nDeepSeq := FindField('EM_DEEPSEQ').AsInteger;
          stParentCode := copy(FindField('EM_GROUPCODE').AsString,1,1 + ((nDeepSeq - 1) * G_nEmployeeGroupLength) );
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,FindField('EM_GROUPCODENAME').AsString);
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then
            begin
              vNode3:= vTreeView.Items.AddChild(vNode2,FindField('EM_GROUPCODE').AsString);
            end;
            bNode.Expanded := True;
            vNode1.Expanded := True;
            if aCode = FindField('EM_GROUPCODE').AsString  then
            begin
              if cNode <> nil then cNode.Selected := True;
            end;
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
  tv_emGroupList.SetFocus;
end;
*)
procedure TfmEmployeeGroupCode.tv_emGroupListClick(Sender: TObject);
begin
  inherited;
  if tv_emGroupList.Selected = nil then Exit;

  if tv_emGroupList.Selected.AbsoluteIndex = 0 then
  begin
    pm_DeleteCode.Visible := False;
    btn_Delete.Enabled := False;
  end else
  begin
    //pm_ExtendCodeAdd.Visible := True;
    pm_DeleteCode.Visible := True;
    btn_Delete.Enabled := IsDeleteGrade;
  end;

end;

procedure TfmEmployeeGroupCode.tv_emGroupListDblClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(Sender);
end;

procedure TfmEmployeeGroupCode.tv_emGroupListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stTargetParentCode : string;
  stCode : string;
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
      if currentItem.AbsoluteIndex = 0 then Exit;
      stTargetParentCode := tv_emGroupCode.Items[dropItem.AbsoluteIndex].Text;
      stOrgCode := tv_emGroupCode.Items[currentItem.AbsoluteIndex].Text;
      if copy(stTargetParentCode,1,Length(stOrgCode)) = stOrgCode then Exit; //자신의 하위디렉토리로 갈수는 없다
      dmDBFunction.GetNextTB_EMPLOYEEGROUPCODE_ChildEmGroupCode(stTargetParentCode,stCode,stDeepSeq,stViewSeq);
      ChangeEmGroupCode(stOrgCode,stCode,stDeepSeq,stViewSeq);
    end;
  end;
  LoadEmployeeGroupTreeView(stCode,tv_emGroupList,tv_emGroupCode,0);
end;

procedure TfmEmployeeGroupCode.tv_emGroupListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_emGroupList;
end;

initialization
  RegisterClass(TfmEmployeeGroupCode);
Finalization
  UnRegisterClass(TfmEmployeeGroupCode);

end.