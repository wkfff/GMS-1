unit uLecturePayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.ExtCtrls, AdvGroupBox,
  AdvOfficeButtons, AdvGlowButton,ADODB,ActiveX,uSubForm, CommandArray,
  Vcl.Imaging.pngimage, AdvEdBtn, Vcl.ComCtrls;

type
  TfmLecturePayment = class(TfmASubForm)
    lb_EmployeeName: TAdvSmoothLabel;
    ed_Name: TAdvEdit;
    ed_emSeq: TAdvEdit;
    sg_EmployeeLectureList: TAdvStringGrid;
    AdvSmoothLabel1: TAdvSmoothLabel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    ed_LectureAmt: TAdvEdit;
    rg_tuitionOff: TAdvOfficeRadioGroup;
    Panel1: TPanel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    ed_TutituionOffAmt: TAdvEdit;
    AdvSmoothLabel4: TAdvSmoothLabel;
    ed_PaymentAmt: TAdvEdit;
    rg_PayType: TAdvOfficeRadioGroup;
    btn_Save: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvSmoothLabel5: TAdvSmoothLabel;
    mem_text: TMemo;
    AdvSmoothLabel6: TAdvSmoothLabel;
    AdvSmoothLabel7: TAdvSmoothLabel;
    ed_PayMonth: TAdvEditBtn;
    MonthCalendar1: TMonthCalendar;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg_EmployeeLectureListResize(Sender: TObject);
    procedure sg_EmployeeLectureListCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rg_tuitionOffClick(Sender: TObject);
    procedure ed_LectureAmtKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_PayMonthClickBtn(Sender: TObject);
    procedure MonthCalendar1DblClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    L_nPageListMaxCount : integer;
    L_nFormDefaultHeight : integer;

    TuitionOffCodeList : TStringList;
    TuitionOffGubunList : TStringList;
    TuitionOffValueList : TStringList;
    { Private declarations }
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure LoadEmployeeInfo;
    procedure LoadTuitionOffCode;
    procedure paymentCalc;
    procedure SearchTB_EMPLOYEELecture(aCode:string;aTopRow:integer = 0);
    procedure TuitionOffCalc;
  public
    { Public declarations }
  end;

var
  fmLecturePayment: TfmLecturePayment;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBInsert,
  uDBUPdate;

{$R *.dfm}


procedure TfmLecturePayment.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmLecturePayment.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLecturePayment.btn_SaveClick(Sender: TObject);
var
  stPayMonth : string;
begin
  inherited;
  btn_Save.Enabled := False;
  stPayMonth := ed_PayMonth.Text;
  stPayMonth := stringReplace(stPayMonth,'년','',[rfReplaceAll]);
  stPayMonth := stringReplace(stPayMonth,'월','',[rfReplaceAll]);
  stPayMonth := stringReplace(stPayMonth,' ','',[rfReplaceAll]);
  if rg_tuitionOff.ItemIndex <0 then rg_tuitionOff.ItemIndex := 0;

  dmDBInsert.InsertIntoTB_LecturePayment(ed_emSeq.Text,stPayMonth,ed_LectureAmt.Text,TuitionOffCodeList.Strings[rg_tuitionOff.ItemIndex],ed_TutituionOffAmt.Text,inttostr(rg_PayType.ItemIndex), ed_PaymentAmt.Text,formatDateTime('yyyymmdd',now),mem_text.Text);
  dmDBUPdate.UpdateTB_EMPLOYEE_Field_StringValue(ed_emSeq.Text,'EM_LASTPAYMONTH',stPayMonth);
  Close;
end;

procedure TfmLecturePayment.ed_LectureAmtKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TuitionOffCalc;
end;

procedure TfmLecturePayment.ed_PayMonthClickBtn(Sender: TObject);
begin
  inherited;
  MonthCalendar1.Visible := Not MonthCalendar1.Visible;
end;

procedure TfmLecturePayment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TuitionOffCodeList.Free;
  TuitionOffGubunList.Free;
  TuitionOffValueList.Free;
end;

procedure TfmLecturePayment.FormCreate(Sender: TObject);
begin
  inherited;
  TuitionOffCodeList := TStringList.Create;
  TuitionOffGubunList := TStringList.Create;
  TuitionOffValueList := TStringList.Create;

  LoadTuitionOffCode;
  MonthCalendar1.Date := now;
end;

procedure TfmLecturePayment.FormResize(Sender: TObject);
begin
  btn_Save.Left := width div 2 - btn_Save.Width - 10;
  btn_Close.Left := width div 2 + 10;

  mem_text.Width := width - mem_text.Left - 40;
  rg_PayType.Width := width - rg_PayType.Left - 40;
  rg_tuitionOff.Width := width - rg_tuitionOff.Left - 40;
  sg_EmployeeLectureList.Width := width - sg_EmployeeLectureList.Left - 40;

  MonthCalendar1.Top := ed_PayMonth.Top + ed_PayMonth.Height;
  MonthCalendar1.Left := ed_PayMonth.Left + ed_PayMonth.Width - ed_PayMonth.Width;
end;

procedure TfmLecturePayment.FormShow(Sender: TObject);
begin
  ed_PayMonth.Text := formatDateTime('yyyy년 mm월',now);
  LoadEmployeeInfo;
  SearchTB_EMPLOYEELecture('');

  L_nFormDefaultHeight := Height;
  if (rg_tuitionOff.Height > 40) then
  begin
    Height := L_nFormDefaultHeight + rg_tuitionOff.Height - 40;
  end;
end;

procedure TfmLecturePayment.LoadEmployeeInfo;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_SEQ = ' + ed_emSeq.Text + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if recordCount < 1 then Exit;

      rg_tuitionOff.ItemIndex := FindField('TO_CODE').AsInteger;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmLecturePayment.LoadTuitionOffCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  rg_tuitionOff.Items.Clear;
  TuitionOffCodeList.Clear;
  rg_tuitionOff.Items.Add('사용안함');
  TuitionOffCodeList.Add('0');
  TuitionOffGubunList.Add('');
  TuitionOffValueList.Add('');
  stSql := 'Select * from TB_TuitionOFF ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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
      if recordCount < 1 then Exit;
      while Not Eof do
      begin
        rg_tuitionOff.Items.Add(FindField('TO_NAME').AsString);
        TuitionOffCodeList.Add(FindField('TO_CODE').AsString);
        TuitionOffGubunList.Add(FindField('TO_GUBUN').AsString);
        TuitionOffValueList.Add(FindField('TO_VALUE').AsString);
        Next;
      end;

      rg_tuitionOff.Height := ((recordcount div 4) + 1) * 40;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmLecturePayment.MonthCalendar1DblClick(Sender: TObject);
begin
  inherited;
  ed_PayMonth.Text := formatDateTime('yyyy년 mm월',MonthCalendar1.Date);

  MonthCalendar1.Visible := False;
end;

procedure TfmLecturePayment.paymentCalc;
begin
  if Not isDigit(ed_LectureAmt.Text) then ed_LectureAmt.Text := '0';
  if Not isDigit(ed_TutituionOffAmt.Text) then ed_TutituionOffAmt.Text := '0';
  ed_PaymentAmt.Text := inttostr( strtoint(ed_LectureAmt.Text) - strtoint(ed_TutituionOffAmt.Text));
end;

procedure TfmLecturePayment.rg_tuitionOffClick(Sender: TObject);
begin
  inherited;
  TuitionOffCalc;
end;

procedure TfmLecturePayment.SearchTB_EMPLOYEELecture(aCode: string;
  aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stEmCode : string;
  stTemp : string;
  nTemp : integer;
  bCheckState : Boolean;
  i : integer;
  nTotAmt : integer;
begin
  stEmCode := ed_emSeq.Text;
  GridInit(sg_EmployeeLectureList,7,2,True);
  stSql := ' Select a.*,b.CC_NAME,b.CC_BOOKNAME,b.CC_MONTH,c.EM_PAYMENTDAY,c.TO_CODE,c.EM_LASTPAYMONTH,d.TO_GUBUN,d.TO_VALUE,e.TU_VALUE ';
  stSql := stSql + ' From TB_EMPLOYEELecture a ';
  stSql := stSql + ' Left Join TB_CurriculumCode b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CC_CODE = b.CC_CODE ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(a.EM_SEQ = c.EM_SEQ) ';
  stSql := stSql + ' Left Join TB_TuitionOFF d ';
  stSql := stSql + ' ON(c.TO_CODE = d.TO_CODE) ';
  stSql := stSql + ' Left Join TB_Tuition e ';
  stSql := stSql + ' ON(a.CC_CODE = e.CC_CODE ';
  stSql := stSql + ' AND substring(c.CO_COMPANYCODE,1,len(e.CO_COMPANYCODE))= e.CO_COMPANYCODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.EM_SEQ = ' + stEmCode + ' ';
  stSql := stSql + ' AND a.EL_STATE = 1 ';

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
      //lb_SearchCount.Caption.Text := FormatFloat('#,##0',recordCount);
      if recordcount < 1 then Exit;

      with sg_EmployeeLectureList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
(*

과정명
등록기간
교재
결제일
수납월
수강료
수납현황
종강처리
수강취소
*)

          cells[1,nRow] := FindField('CC_NAME').AsString;        //과정명
          stTemp := FindField('EL_REGDATE').AsString;
          stTemp := MakeDatetimeStr(stTemp);
          cells[2,nRow] := stTemp + '~' + FormatDateTime('yyyy-mm-dd',IncMonth(strtodate(stTemp),FindField('CC_MONTH').AsInteger)); //등록기간
          cells[3,nRow] := FindField('CC_BOOKNAME').AsString;    //교재
          cells[4,nRow] := FindField('EM_PAYMENTDAY').AsString;   //결재일
          cells[5,nRow] := FindField('EM_LASTPAYMONTH').AsString;//수납월
          cells[6,nRow] := FindField('TU_VALUE').AsString ;
          if( cells[5,nRow] = '' ) then cells[7,nRow] := '미수납'
          else if( cells[5,nRow] + formatdatetime('dd',now) < formatdatetime('yyyymmdd',IncMonth(strtodate(formatdatetime('yyyy-mm-',now) + FillzeroNumber(FindField('EL_PAYDATE').AsInteger,2)),-1))) then cells[7,nRow] := '미수납'
          else cells[7,nRow] := '수납완료';

          cells[8,nRow] := FindField('EM_SEQ').AsString;
          cells[9,nRow] := FindField('CC_CODE').AsString;
          cells[10,nRow] := FindField('EL_REGDATE').AsString;

          if cells[7,nRow] = '수납완료' then AddCheckBox(0,nRow,False,False)
          else AddCheckBox(0,nRow,True,False);

          if FindField('CC_CODE').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

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
  with sg_EmployeeLectureList do
  begin
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          nTotAmt := nTotAmt + strtoint(cells[6,i]);
        end;
        Application.ProcessMessages;
      end;
  end;
  ed_LectureAmt.Text := inttostr(nTotAmt);
  TuitionOffCalc;
end;

procedure TfmLecturePayment.sg_EmployeeLectureListCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
var
  i : integer;
  bCheckState : Boolean;
  nTotAmt : integer;
begin
  inherited;
  nTotAmt := 0;
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

  with TAdvStringGrid(Sender) do
  begin
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bCheckState);
        if bCheckState then
        begin
          nTotAmt := nTotAmt + strtoint(cells[6,i]);
        end;
        Application.ProcessMessages;
      end;
  end;
  ed_LectureAmt.Text := inttostr(nTotAmt);
  TuitionOffCalc;
end;

procedure TfmLecturePayment.sg_EmployeeLectureListResize(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := sg_EmployeeLectureList.Height div sg_EmployeeLectureList.DefaultRowHeight;

end;

procedure TfmLecturePayment.TuitionOffCalc;
var
  nTemp : integer;
begin
  if (rg_tuitionOff.ItemIndex < 1) or Not isDigit(ed_LectureAmt.Text) then
  begin
    ed_TutituionOffAmt.Text := '0';
    paymentCalc;
    Exit;
  end;

  if TuitionOffGubunList.strings[rg_tuitionOff.ItemIndex] = '0' then
  begin
    nTemp := strtoint(ed_LectureAmt.Text) * strToint(TuitionOffValueList.Strings[rg_tuitionOff.ItemIndex]) div 100;
    nTemp := (nTemp div 1000) * 1000;
    ed_TutituionOffAmt.Text := inttostr(nTemp);
  end else if TuitionOffGubunList.strings[rg_tuitionOff.ItemIndex] = '1' then
  begin
    ed_TutituionOffAmt.Text := TuitionOffValueList.Strings[rg_tuitionOff.ItemIndex];
  end else
  begin
    ed_TutituionOffAmt.Text := '0';
  end;

  paymentCalc;

end;

end.
