unit uCardDelete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, AdvGroupBox,
  AdvGlowButton, AdvEdit, AdvSmoothLabel, AdvSmoothPanel,ActiveX,AdoDB;

type
  TfmCardDelete = class(TForm)
    pan_CardReturn: TAdvSmoothPanel;
    AdvSmoothLabel9: TAdvSmoothLabel;
    AdvSmoothLabel10: TAdvSmoothLabel;
    AdvSmoothLabel11: TAdvSmoothLabel;
    AdvSmoothLabel12: TAdvSmoothLabel;
    ed_GLCode1: TAdvEdit;
    ed_emSeq1: TAdvEdit;
    ed_CompanyName1: TAdvEdit;
    ed_Name1: TAdvEdit;
    ed_Handphone1: TAdvEdit;
    AdvSmoothPanel6: TAdvSmoothPanel;
    btn_CardreturnApply: TAdvGlowButton;
    btn_CardreturnCancel: TAdvGlowButton;
    AdvEdit6: TAdvEdit;
    AdvGroupBox1: TAdvGroupBox;
    ed_RegCardNo1: TAdvEdit;
    pan_ReturnCard: TPanel;
    ed_GlSeq1: TAdvEdit;
    AdvGlowButton4: TAdvGlowButton;
    AdvSmoothLabel3: TAdvSmoothLabel;
    procedure btn_CardreturnCancelClick(Sender: TObject);
    procedure btn_CardreturnApplyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FReaderUse: Boolean;
    { Private declarations }
    function GetTB_GUESTLIST_CardNo(aCardNo:string):Boolean;
    function GetVisitTable(aCardNo:string):Boolean;
    Function EmployeePermitToCardLoad(aEmSeq:string):Boolean;
  public
    { Public declarations }
    property ReaderUse : Boolean read FReaderUse write FReaderUse;
  end;

var
  fmCardDelete: TfmCardDelete;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBCardPermit,
  uDBDelete,
  uDBUpdate,
  uDBRelay,
  uEmployeeRelay,
  uFingerVariable,
  uSupremaFinger;

{$R *.dfm}

procedure TfmCardDelete.btn_CardreturnApplyClick(Sender: TObject);
begin
  if ed_glCode1.Text = '' then
  begin
    showmessage('카드 반납할 방문객이 없습니다.');
    Exit;
  end;
  if (G_nSystmRelayUse = 1) and (G_nSystmRelayCustomerNo = 2) then
  begin
    dmEmployeeRelay.UpdateTB_VISIT_DOC_CardReturnTime(ed_glCode1.text);
  end;
  if ed_GlSeq1.Text = '' then
  begin
    Close;
    Exit;
  end;

  //방문자 테이블에 변경이력 저장하자.
  dmDBUpdate.UpdateTB_GUESTLIST_Field_IntValue(ed_GlSeq1.Text,'GL_WORKFLAG','3');
  dmDBUpdate.UpdateTB_GUESTLIST_Field_StringValue(ed_GlSeq1.Text,'GL_OUTTIME',formatDateTime('hhnnss',now));
  dmDBUpdate.UpdateTB_EMPLOYEE_Field_IntValue(ed_emSeq1.Text,'EM_STATECODE','2');
//  dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(ed_emSeq1.Text,'EM_ENDDATE',FormatDateTime('yyyymmdd',now-1)) ; //유효기간을 전일로 설정하여 권한 정지
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(ed_emSeq1.Text,'N'); //해당 사번의 권한 적용 부분을 재 작업 - 삭제된 카드가 있거나 추가된 카드가 있으므로
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(ed_emSeq1.Text,'','','','','N');
  EmployeePermitToCardLoad(ed_emSeq1.Text);
  dmDBDelete.DeleteTB_CARD_Key(ed_RegCardNo1.Text);

  Close;
end;

procedure TfmCardDelete.btn_CardreturnCancelClick(Sender: TObject);
begin
  Close;
end;

function TfmCardDelete.EmployeePermitToCardLoad(aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,'N','R');

  stSql := ' Select ND_NODENO,DE_ECUID,EM_SEQ from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND CP_APPLY = ''R'' ';
  stSql := stSql + ' GROUP BY ND_NODENO,DE_ECUID,EM_SEQ ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        dmDBCardPermit.EmployeePermitToCardDeviceLoad(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('EM_SEQ').AsString);
        Next;
      end;
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,'R','Y');
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

procedure TfmCardDelete.FormActivate(Sender: TObject);
var
  stCardNo : string;
  nResult : UF_RET_CODE;
begin
  if ReaderUse and (G_nCardRegisterType = 1) then
  begin
    Try
      if Not dmSupremaFinger.Connected then
      begin
        dmSupremaFinger.DeviceIP := G_stCardRegisterIP;
        dmSupremaFinger.DevicePort := strtoint(G_stCardRegisterFingerPort);
        dmSupremaFinger.SocketOPEN := True;
      end;
      if Not dmSupremaFinger.Connected then
      begin
        showmessage('지문리더 연결 실패');
        pan_CardReturn.Visible := False;
        Exit;
      end;
      pan_ReturnCard.Caption := '카드를 지문리더에 태그하여 주세요';
      pan_ReturnCard.Visible := True;
      Application.ProcessMessages;
      nResult := dmSupremaFinger.GetReadCardNo(stCardNo);
      dmSupremaFinger.SocketOPEN := False;
      if nResult = UF_RET_SUCCESS then
      begin
        ed_RegCardNo1.Text := stCardNo;
        pan_ReturnCard.Visible := False;
      end else
      begin
        showmessage('카드 읽기에 실패 하였습니다.');
        pan_ReturnCard.Visible := False;
        dmSupremaFinger.SocketOPEN := False;
        Exit;
      end;
    Finally

    End;

  end;

  if ed_RegCardNo1.Text <> '' then
  begin
    ed_RegCardNo1.Text := FillCharString(ed_RegCardNo1.Text,'*',16,False);
    if Not GetTB_GUESTLIST_CardNo(ed_RegCardNo1.Text) then
    begin
      GetVisitTable(ed_RegCardNo1.Text);
    end;
  end;

end;

function TfmCardDelete.GetTB_GUESTLIST_CardNo(aCardNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := ' Select * from TB_GUESTLIST ';
  stSql := stSql + ' Where GL_DATE = ''' + formatDateTime('yyyymmdd',now) + ''' ';
  stSql := stSql + ' AND GL_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GL_WORKFLAG = 2 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        //showmessage('반납할 카드가 존재하지 않습니다.');
        Exit;
      end;
      ed_GlSeq1.Text := FindField('GL_SEQ').AsString;
      ed_emSeq1.Text := FindField('EM_SEQ').AsString;
      ed_GLCode1.Text := FindField('GL_CODE').AsString;
      ed_CompanyName1.Text := FindField('GL_COMPANYNAME').AsString;
      ed_Name1.Text := FindField('GL_NAME').AsString;
      ed_Handphone1.Text := FindField('GL_TELNUMBER').AsString;
      result := True;
    end;


  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

function TfmCardDelete.GetVisitTable(aCardNo: string): Boolean;
var
  nCardNo : int64;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  nCardNo := Hex2Dec64(copy(aCardNO,1,8));
  aCardNo := FillZeroNumber(nCardNo,10);

  if Not dmDBRelay.DB1Connected then
  begin
    dmDBRelay.AdoRelay1Connected(G_stSystmRelayDB1Type, G_stSystmRelayDB1IP, G_stSystmRelayDB1PORT,
                      G_stSystmRelayDB1USERID, G_stSystmRelayDB1USERPW, G_stSystmRelayDB1NAME);
  end;
  result := False;
  if Not dmDBRelay.DB1Connected then Exit;

  stSql := ' Select * from TB_VISIT_DOC where CARD_NO = ''' + aCardNo + ''' ' ;
  stSql := stSql + ' AND IO_DATE = ''' + formatDateTime('yyyymmdd',now) + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBRelay.ADOConnection1;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := False
      else
      begin
        result := True;
        ed_GLCode1.Text := FindField('DOC_NO').AsString;
        ed_CompanyName1.Text := FindField('CO_NAME').AsString;
        ed_Name1.Text := FindField('REQ_MAN').AsString;
        ed_Handphone1.Text := FindField('MAN_TEL').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

end.
