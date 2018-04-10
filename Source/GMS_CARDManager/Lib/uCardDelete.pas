unit uCardDelete;

interface

uses
  System.SysUtils, System.Classes,ActiveX,ADODB,Vcl.Forms;

type
  TWorkComplete = procedure(Sender: TObject;  aValue:Boolean) of object;

  TdmCardDelete = class(TDataModule)
  private
    L_bCardDeleting : Boolean;
    FWeek: integer;
    FWorkWeekday: string;
    FWorkTue: Boolean;
    FWorkWed: Boolean;
    FWorkMon: Boolean;
    FWorkSun: Boolean;
    FWorkThu: Boolean;
    FWorkSat: Boolean;
    FWorkFri: Boolean;
    FWorkComplete: Boolean;
    FWorkTime: string;
    FApplyType: string;
    FDeleteCount: integer;
    FDeleteType: string;
    FDeleteDayTerm: integer;
    FOnWorkComplete: TWorkComplete;
    procedure SetWeek(const Value: integer);
    procedure SetWorkWeekday(const Value: string);
    procedure SetWorkTime(const Value: string);
    procedure SetApplyType(const Value: string);
    procedure SetDeleteCount(const Value: integer);
    procedure SetDeleteType(const Value: string);
    procedure SetDeleteDayTerm(const Value: integer);
    procedure AllCardDelete;
    procedure CompanyCardDelete;
    procedure GroupCardDelete;
    procedure SetWorkComplete(const Value: Boolean);
    { Private declarations }
  public
    procedure CardDeleteStart;
    procedure CountTypeDelete(aEmSeq,aPreDate,aNowDate,aEndDate:string);
  public
    { Public declarations }
    property ApplyType : string read FApplyType write SetApplyType; //'1'.전체,'2'.소속,'3'.그룹,'4'.소속+그룹
    property DeleteCount : integer read FDeleteCount write SetDeleteCount;
    property DeleteDayTerm : integer read FDeleteDayTerm write SetDeleteDayTerm;
    property DeleteType : string read FDeleteType write SetDeleteType;      //1.횟수,2.미사용 기간
    property WorkComplete : Boolean read FWorkComplete write SetWorkComplete;
    property WorkTime : string read FWorkTime write SetWorkTime;
    property WorkWeekday : string read FWorkWeekday write SetWorkWeekday;
    property Week :integer read FWeek write SetWeek;
    property WorkSun : Boolean read FWorkSun write FWorkSun;
    property WorkMon : Boolean read FWorkMon write FWorkMon;
    property WorkTue : Boolean read FWorkTue write FWorkTue;
    property WorkWed : Boolean read FWorkWed write FWorkWed;
    property WorkThu : Boolean read FWorkThu write FWorkThu;
    property WorkFri : Boolean read FWorkFri write FWorkFri;
    property WorkSat : Boolean read FWorkSat write FWorkSat;
  public
    property OnWorkComplete : TWorkComplete read FOnWorkComplete write FOnWorkComplete;
  end;

var
  dmCardDelete: TdmCardDelete;

implementation
uses
  uDataBase,
  uDBCardPermit,
  uDBDelete,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uCommonFunction,
  uCommonVariable;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCardDelete }

procedure TdmCardDelete.AllCardDelete;
var
  stSql : string;
  stNowDate : string;
  stPreDate : string;
  TempAdoQuery : TADOQuery;
begin
  stNowDate := FormatDateTime('yyyymmdd',now - 1);
  stPreDate := FormatDateTime('yyyymmdd',now - DeleteDayTerm - 1);
  stSql := ' Select a.EM_SEQ,a.EM_ENDDATE,b.CNT,b.CA_CARDNO from (select * from TB_EMPLOYEE where EM_ENDDATE > ''' + stNowDate + ''' and EM_REGDATE < ''' + stPreDate + ''' ) a ';
  if DeleteType = '1' then stSql := stSql + ' Left Join (select EM_SEQ,'''' as CA_CARDNO,count(*) as CNT from TB_ACCESSEVENT where AE_DATE between ''' + stPreDate + ''' and ''' + stNowDate + ''' group by EM_SEQ) b ';
  if DeleteType = '2' then stSql := stSql + ' Inner Join (select EM_SEQ,CA_LASTUSEDATE as CNT,CA_CARDNO from TB_CARD where CA_LASTUSEDATE is null or CA_LASTUSEDATE < ''' + stPreDate + ''') b ';
  stSql := stSql + ' ON(a.EM_SEQ = b.EM_SEQ) ';
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

      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if DeleteType = '1' then     //횟수
        begin
          if FindField('CNT').IsNull or (FindField('CNT').AsInteger < DeleteCount) then
          begin
            if G_stCardDeleteStopType = '1' then
            begin
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
              dmDBDelete.DeleteTB_CARD_Key(FindField('CA_CARDNO').AsString) ; //카드삭제
              if dmDBFunction.GetTB_CARD_CardCount(FindField('EM_SEQ').AsString) = 0 then
              begin
                dmDBDelete.DeleteTB_EMPLOYEE_EmSeq(FindField('EM_SEQ').AsString);
              end;
            end else if G_stCardDeleteStopType = '2' then
            begin
              dmDBUpdate.UpdateTB_CARD_Field_StringValue(FindField('CA_CARDNO').AsString,'CA_STATECODE','3');
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
            end else
            begin
              dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
              //재전송하자.
              dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
            end;
            (*
            dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
            //재전송하자.
            dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
            *)
            //History 남기자.
            dmDBInsert.InsertIntoTB_CARDDELETEHISTORY_Value(FormatDateTime('yyyymmdd',Now),FindField('EM_SEQ').AsString,FindField('EM_ENDDATE').AsString,stNowDate);
          end;
        end else if DeleteType = '2' then    //미사용기간
        begin
          if Not(FindField('CA_CARDNO').IsNull or (FindField('CA_CARDNO').AsString = '')) then
          begin
            dmDBCardPermit.TB_CARDPERMIT_PermitDELETE(FindField('CA_CARDNO').AsString);  //카드권한삭제

            if G_stCardDeleteStopType = '1' then
            begin
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
              dmDBDelete.DeleteTB_CARD_Key(FindField('CA_CARDNO').AsString) ; //카드삭제
              if dmDBFunction.GetTB_CARD_CardCount(FindField('EM_SEQ').AsString) = 0 then
              begin
                dmDBDelete.DeleteTB_EMPLOYEE_EmSeq(FindField('EM_SEQ').AsString);
              end;
            end else if G_stCardDeleteStopType = '2' then
            begin
              dmDBUpdate.UpdateTB_CARD_Field_StringValue(FindField('CA_CARDNO').AsString,'CA_STATECODE','3');
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
            end else
            begin
              dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
              //재전송하자.
              dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
            end;
            //History 남기자.
            dmDBInsert.InsertIntoTB_CARDDELETEHISTORY_Value(FormatDateTime('yyyymmdd',Now),FindField('EM_SEQ').AsString,FindField('EM_ENDDATE').AsString,stNowDate);
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

procedure TdmCardDelete.CardDeleteStart;
begin
  if WorkComplete then Exit;  //작업 완료 시 빠져 나감.
  if WorkTime > formatDateTime('hhmm',now) then Exit;
  if (Week = 1) and Not WorkSun then Exit; //오늘이 일요일인데 일요일엔 스케줄 계획 없으면 빠져 나가자.
  if (Week = 2) and Not WorkMon then Exit;
  if (Week = 3) and Not WorkTue then Exit;
  if (Week = 4) and Not WorkWed then Exit;
  if (Week = 5) and Not WorkThu then Exit;
  if (Week = 6) and Not WorkFri then Exit;
  if (Week = 7) and Not WorkSat then Exit;

  if L_bCardDeleting then Exit;
  Try
    L_bCardDeleting := True;
    if ApplyType = '1' then  //전체 직원 모두 적용
    begin
      AllCardDelete;
    end else if ApplyType = '2' then //소속별 적용
    begin
      CompanyCardDelete;
    end else if ApplyType = '3' then //그룹별 적용
    begin
      GroupCardDelete;
    end else if ApplyType = '4' then //소속 + 그룹별 적용
    begin
      CompanyCardDelete;
      GroupCardDelete;
    end;
  Finally
    WorkComplete := True;
    L_bCardDeleting := False;
  End;
end;

procedure TdmCardDelete.CompanyCardDelete;
var
  stSql : string;
  stNowDate : string;
  stPreDate : string;
  TempAdoQuery : TADOQuery;
  stPreEmSeq : string;
begin
  stNowDate := FormatDateTime('yyyymmdd',now - 1);
  stPreDate := FormatDateTime('yyyymmdd',now - DeleteDayTerm - 1);                                                                                               //and EM_GRADETYPE = 1
  stSql := ' Select a.EM_SEQ,a.EM_ENDDATE';
  if DeleteType = '2' then stSql := stSql + ',c.CNT,c.CA_CARDNO ';
  stSql := stSql + ' from (select * from TB_EMPLOYEE where EM_ENDDATE > ''' + stNowDate + ''' and EM_REGDATE < ''' + stPreDate + ''' ';
  stSql := stSql + ') a '; //소속별 권한
  stSql := stSql + ' Inner Join (select * from TB_COMPANYCODE where CO_AutoPermitDelete = 1 ) b ';
  stSql := stSql + ' ON(a.CO_COMPANYCODE Like b.CO_COMPANYCODE + ''%'') ';
  //if DeleteType = '1' then stSql := stSql + ' Left Join (select EM_SEQ,'''' as CA_CARDNO,count(*) as CNT from TB_ACCESSEVENT where AE_DATE between ''' + stPreDate + ''' and ''' + stNowDate + ''' group by EM_SEQ) c ';
  if DeleteType = '2' then
  begin
    stSql := stSql + ' Inner Join (select EM_SEQ,CA_LASTUSEDATE as CNT,CA_CARDNO from TB_CARD where CA_LASTUSEDATE is null or CA_LASTUSEDATE < ''' + stPreDate + ''') c ';
    stSql := stSql + ' ON(a.EM_SEQ = c.EM_SEQ) ';
  end;
  //stSql := stSql + ' Left Join (select EM_SEQ,count(*) as CNT from TB_ACCESSEVENT where AE_DATE between ''' + stPreDate + ''' and ''' + stNowDate + ''' group by EM_SEQ) c ';
  if G_stCardDeleteStopType = '2' then
  begin
    stSql := stSql + ' Inner Join (select EM_SEQ from TB_CARD where CA_STATECODE = ''1'') d ';   //정상 카드가 있는 경우만
    stSql := stSql + ' ON(a.EM_SEQ = d.EM_SEQ) ';
  end;
  stSql := stSql + ' order by a.EM_SEQ ';

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

      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if DeleteType = '1' then   //횟수 미만 시
        begin
          if stPreEmSeq <> FindField('EM_SEQ').AsString then
          begin
            CountTypeDelete(FindField('EM_SEQ').AsString,stPreDate,stNowDate,FindField('EM_ENDDATE').AsString);
            stPreEmSeq := FindField('EM_SEQ').AsString;
          end;
          (*
          if FindField('CNT').IsNull or (FindField('CNT').AsInteger < DeleteCount) then
          begin
            if G_stCardDeleteStopType = '1' then
            begin
              dmDBDelete.DeleteTB_CARD_Key(FindField('CA_CARDNO').AsString) ; //카드삭제
              if dmDBFunction.GetTB_CARD_CardCount(FindField('EM_SEQ').AsString) = 0 then
              begin
                dmDBDelete.DeleteTB_EMPLOYEE_EmSeq(FindField('EM_SEQ').AsString);
              end;
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
            end else if G_stCardDeleteStopType = '2' then
            begin
              dmDBUpdate.UpdateTB_CARD_Field_StringValue(FindField('CA_CARDNO').AsString,'CA_STATECODE','3');
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
            end else
            begin
              dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
              //재전송하자.
              dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
            end;
//           dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
            //재전송하자.
//            dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
            //History 남기자.
            dmDBInsert.InsertIntoTB_CARDDELETEHISTORY_Value(FormatDateTime('yyyymmdd',Now),FindField('EM_SEQ').AsString,FindField('EM_ENDDATE').AsString,stNowDate);
          end;
          *)
        end else if DeleteType = '2' then
        begin
          if FindField('CNT').IsNull or (FindField('CNT').AsInteger < 1) then
          begin
            if G_stCardDeleteStopType = '1' then
            begin
              dmDBDelete.DeleteTB_CARD_Key(FindField('CA_CARDNO').AsString) ; //카드삭제
              if dmDBFunction.GetTB_CARD_CardCount(FindField('EM_SEQ').AsString) = 0 then
              begin
                dmDBDelete.DeleteTB_EMPLOYEE_EmSeq(FindField('EM_SEQ').AsString);
              end;
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
            end else if G_stCardDeleteStopType = '2' then
            begin
              dmDBUpdate.UpdateTB_CARD_Field_StringValue(FindField('CA_CARDNO').AsString,'CA_STATECODE','3');
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
            end else
            begin
              dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
              //재전송하자.
              dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
            end;
//            dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
            //재전송하자.
            //History 남기자.
            dmDBInsert.InsertIntoTB_CARDDELETEHISTORY_Value(FormatDateTime('yyyymmdd',Now),FindField('EM_SEQ').AsString,FindField('EM_ENDDATE').AsString,stNowDate);
          end;

        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TdmCardDelete.CountTypeDelete(aEmSeq,aPreDate,aNowDate,aEndDate: string);
var
  stSql : string;
  stNowDate : string;
  stPreDate : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select count(*) as CNT from TB_ACCESSEVENT ';
  stSql := stSql + ' where AE_DATE between ''' + aPreDate + ''' and ''' + aNowDate + '''';
  stSql := stSql + ' and EM_SEQ = ' + aEmSeq + ' ';
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

      if RecordCount < 1 then Exit;
      if FindField('CNT').IsNull or (FindField('CNT').AsInteger < DeleteCount) then
      begin
        if G_stCardDeleteStopType = '1' then
        begin
          dmDBUpdate.UpdateTB_CARDPERMIT_EmSeqStop(aEmSeq);
          dmDBDelete.DeleteTB_CARD_EmSeq(aEmSeq) ; //카드삭제
          dmDBDelete.DeleteTB_EMPLOYEE_EmSeq(aEmSeq);
        end else if G_stCardDeleteStopType = '2' then
        begin
          dmDBUpdate.UpdateTB_CARDPERMIT_EmSeqStop(aEmSeq);
          dmDBUpdate.UpdateTB_CARD_State_EmSeq(aEmSeq,'3');
        end else
        begin
          dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(aEmSeq,'EM_ENDDATE',aNowDate);
          //재전송하자.
          dmDBCardPermit.ReSendEmSeqCardNo(aEmSeq);
        end;
//           dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
        //재전송하자.
//            dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
        //History 남기자.
        dmDBInsert.InsertIntoTB_CARDDELETEHISTORY_Value(FormatDateTime('yyyymmdd',Now),aEmSeq,aEndDate,stNowDate);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TdmCardDelete.GroupCardDelete;
var
  stSql : string;
  stNowDate : string;
  stPreDate : string;
  TempAdoQuery : TADOQuery;
begin
  stNowDate := FormatDateTime('yyyymmdd',now - 1);                                                                                                              // 제거
  stPreDate := FormatDateTime('yyyymmdd',now - DeleteDayTerm - 1);
  stSql := ' Select a.EM_SEQ,a.EM_ENDDATE,c.CNT from (select * from TB_EMPLOYEE where EM_ENDDATE > ''' + stNowDate + ''' and EM_REGDATE < ''' + stPreDate + ''' and EM_GRADETYPE = 2 ) a ';  //그룹별 권한
  stSql := stSql + ' Inner Join (select * from TB_EMPLOYEEGROUPCODE where EM_AutoPermitDelete = 1 ) b ';
  stSql := stSql + ' ON(a.EM_GROUPCODE Like b.EM_GROUPCODE + ''%'') ';
  if DeleteType = '1' then stSql := stSql + ' Left Join (select EM_SEQ,'''' as CA_CARDNO,count(*) as CNT from TB_ACCESSEVENT where AE_DATE between ''' + stPreDate + ''' and ''' + stNowDate + ''' group by EM_SEQ) c ';
  if DeleteType = '2' then stSql := stSql + ' Inner Join (select EM_SEQ,CA_LASTUSEDATE as CNT,CA_CARDNO from TB_CARD where CA_LASTUSEDATE is null or CA_LASTUSEDATE < ''' + stPreDate + ''') c ';
//  stSql := stSql + ' Left Join (select EM_SEQ,count(*) as CNT from TB_ACCESSEVENT where AE_DATE between ''' + stPreDate + ''' and ''' + stNowDate + ''' group by EM_SEQ) c ';
  stSql := stSql + ' ON(a.EM_SEQ = c.EM_SEQ) ';
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

      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if DeleteType = '1' then
        begin
          if FindField('CNT').IsNull or (FindField('CNT').AsInteger < DeleteCount) then
          begin
            if G_stCardDeleteStopType = '1' then
            begin
              dmDBDelete.DeleteTB_CARD_Key(FindField('CA_CARDNO').AsString) ; //카드삭제
              if dmDBFunction.GetTB_CARD_CardCount(FindField('EM_SEQ').AsString) = 0 then
              begin
                dmDBDelete.DeleteTB_EMPLOYEE_EmSeq(FindField('EM_SEQ').AsString);
              end;
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
            end else if G_stCardDeleteStopType = '2' then
            begin
              dmDBUpdate.UpdateTB_CARD_Field_StringValue(FindField('CA_CARDNO').AsString,'CA_STATECODE','3');
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
            end else
            begin
              dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
              //재전송하자.
              dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
            end;
//            dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
            //재전송하자.
//            dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
            //History 남기자.
            dmDBInsert.InsertIntoTB_CARDDELETEHISTORY_Value(FormatDateTime('yyyymmdd',Now),FindField('EM_SEQ').AsString,FindField('EM_ENDDATE').AsString,stNowDate);
          end;
        end else if DeleteType = '2' then
        begin
          if FindField('CNT').IsNull or (FindField('CNT').AsInteger < 1) then
          begin
            if G_stCardDeleteStopType = '1' then
            begin
              dmDBDelete.DeleteTB_CARD_Key(FindField('CA_CARDNO').AsString) ; //카드삭제
              if dmDBFunction.GetTB_CARD_CardCount(FindField('EM_SEQ').AsString) = 0 then
              begin
                dmDBDelete.DeleteTB_EMPLOYEE_EmSeq(FindField('EM_SEQ').AsString);
              end;
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
            end else if G_stCardDeleteStopType = '2' then
            begin
              dmDBUpdate.UpdateTB_CARD_Field_StringValue(FindField('CA_CARDNO').AsString,'CA_STATECODE','3');
              dmDBUpdate.UpdateTB_CARDPERMIT_CardStop(FindField('CA_CARDNO').AsString);
            end else
            begin
              dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
              //재전송하자.
              dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
            end;
            //dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(FindField('EM_SEQ').AsString,'EM_ENDDATE',stNowDate);
            //재전송하자.
            //dmDBCardPermit.ReSendEmSeqCardNo(FindField('EM_SEQ').AsString);
            //History 남기자.
            dmDBInsert.InsertIntoTB_CARDDELETEHISTORY_Value(FormatDateTime('yyyymmdd',Now),FindField('EM_SEQ').AsString,FindField('EM_ENDDATE').AsString,stNowDate);
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

procedure TdmCardDelete.SetApplyType(const Value: string);
begin
  if FApplyType = Value then Exit;

  FApplyType := Value;
  WorkComplete := False;
end;

procedure TdmCardDelete.SetDeleteCount(const Value: integer);
begin
  if FDeleteCount = Value then Exit;

  FDeleteCount := Value;
  if DeleteType = '1' then WorkComplete := False;
end;

procedure TdmCardDelete.SetDeleteDayTerm(const Value: integer);
begin
  if FDeleteDayTerm = Value then Exit;
  FDeleteDayTerm := Value;
  WorkComplete := False;
end;

procedure TdmCardDelete.SetDeleteType(const Value: string);
begin
  if FDeleteType = Value then Exit;

  FDeleteType := Value;
  WorkComplete := False;
end;

procedure TdmCardDelete.SetWeek(const Value: integer);
begin
  if FWeek = Value then Exit;

  FWeek := Value;
  WorkComplete := False;
end;

procedure TdmCardDelete.SetWorkComplete(const Value: Boolean);
begin
  if FWorkComplete = Value then Exit;

  FWorkComplete := Value;

  if Value then
  begin
    if Assigned(FOnWorkComplete) then
    begin
      OnWorkComplete(Self,Value);
    end;
  end;
end;

procedure TdmCardDelete.SetWorkTime(const Value: string);
begin
  if FWorkTime = Value then Exit;

  FWorkTime := Value;
end;

procedure TdmCardDelete.SetWorkWeekday(const Value: string);
begin
  if FWorkWeekday = Value then Exit;

  FWorkWeekday := Value;
  if Value[1] = '1' then WorkMon := True
  else WorkMon := False;
  if Value[2] = '1' then WorkTue := True
  else WorkTue := False;
  if Value[3] = '1' then WorkWed := True
  else WorkWed := False;
  if Value[4] = '1' then WorkThu := True
  else WorkThu := False;
  if Value[5] = '1' then WorkFri := True
  else WorkFri := False;
  if Value[6] = '1' then WorkSat := True
  else WorkSat := False;
  if Value[7] = '1' then WorkSun := True
  else WorkSun := False;

end;

end.
