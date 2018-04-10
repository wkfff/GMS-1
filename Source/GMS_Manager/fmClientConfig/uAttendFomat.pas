unit uAttendFomat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvCombo, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid,uSubForm, CommandArray, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,ActiveX,ADODB;

type
  TfmAttendFomat = class(TfmASubForm)
    sg_List: TAdvStringGrid;
    cmb_Work: TComboBox;
    ed_work: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sg_ListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ed_workExit(Sender: TObject);
    procedure cmb_WorkExit(Sender: TObject);
    procedure cmb_WorkChange(Sender: TObject);
    procedure ed_workKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    L_nSelectCol : integer;
    L_nSelectRow : integer;
    FieldNameList : TStringList;
    FieldCodeList : TStringList;
    { Private declarations }
    function GetFieldName(aField:string):String;
    procedure LoadFieldUse(aBox: TComboBox);
    procedure LoadFieldName(aBox: TComboBox);
    procedure LoadFrontRear(aBox: TComboBox);
    procedure LoadGubun(aBox: TComboBox);
    procedure SetFieldName;
  public
    { Public declarations }
    procedure SearchAttendFormat(aSeq: string;aTopRow:integer=0);
  end;

var
  fmAttendFomat: TfmAttendFomat;

implementation

uses
  uCommonFunction,
  uDataBase,
  uDBUpdate;

{$R *.dfm}

{ TfmAttendFomat }

procedure TfmAttendFomat.cmb_WorkChange(Sender: TObject);
begin
  inherited;
  if L_nSelectCol = 1 then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_IntValue(sg_List.Cells[0,L_nSelectRow],'AF_USE',inttostr(cmb_Work.ItemIndex))
  else if L_nSelectCol = 2 then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_StringValue(sg_List.Cells[0,L_nSelectRow],'AF_FIELDNAME',FieldCodeList.Strings[cmb_Work.ItemIndex])
  else if L_nSelectCol = 5 then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_IntValue(sg_List.Cells[0,L_nSelectRow],'AF_FRONTREAR',inttostr(cmb_Work.ItemIndex))
  else if L_nSelectCol = 11 then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_IntValue(sg_List.Cells[0,L_nSelectRow],'AF_GUBUN',inttostr(cmb_Work.ItemIndex))
  ;

  sg_List.Cells[L_nSelectCol,L_nSelectRow] := cmb_Work.Text;
  if L_nSelectCol = 2 then sg_List.Cells[12,L_nSelectRow] := FieldCodeList.Strings[cmb_Work.ItemIndex]
  else if L_nSelectCol = 11 then sg_List.Cells[13,L_nSelectRow] := inttostr(cmb_Work.ItemIndex)
  ;
end;

procedure TfmAttendFomat.cmb_WorkExit(Sender: TObject);
begin
  inherited;
  cmb_Work.Visible := False;
end;

procedure TfmAttendFomat.ed_workExit(Sender: TObject);
begin
  inherited;
  ed_work.Visible := False;
end;

procedure TfmAttendFomat.ed_workKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if L_nSelectCol = 3 then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_StringValue(sg_List.Cells[0,L_nSelectRow],'AF_FILLCHAR',ed_work.Text)
  else if L_nSelectCol = 4 then
  begin
    if isDigit(sg_List.Cells[L_nSelectCol,L_nSelectRow]) then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_IntValue(sg_List.Cells[0,L_nSelectRow],'AF_LENGTH',ed_work.Text);
  end else if L_nSelectCol = 6 then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_StringValue(sg_List.Cells[0,L_nSelectRow],'AF_DATEFORMATE',ed_work.Text)
  else if L_nSelectCol = 7 then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_StringValue(sg_List.Cells[0,L_nSelectRow],'AF_WORKINTYPE',ed_work.Text)
  else if L_nSelectCol = 8 then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_StringValue(sg_List.Cells[0,L_nSelectRow],'AF_WORKOUTTYPE',ed_work.Text)
  else if L_nSelectCol = 9 then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_StringValue(sg_List.Cells[0,L_nSelectRow],'AF_BUSINESSOUTTYPE',ed_work.Text)
  else if L_nSelectCol = 10 then dmDBUpdate.UpdateTB_ATTENDFILEFORMAT_Field_StringValue(sg_List.Cells[0,L_nSelectRow],'AF_BUSINESSINTYPE',ed_work.Text);

  sg_List.Cells[L_nSelectCol,L_nSelectRow] := ed_work.Text;
end;

procedure TfmAttendFomat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FieldNameList.Free;
  FieldCodeList.Free;
end;

procedure TfmAttendFomat.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNameList := TStringList.Create;
  FieldCodeList := TStringList.Create;

  SetFieldName;
  SearchAttendFormat('',0);
end;

function TfmAttendFomat.GetFieldName(aField: string): String;
var
  nIndex : integer;
begin
  result := '';
  nIndex := FieldCodeList.IndexOf(aField);
  if nIndex < 0 then Exit;
  result := FieldNameList.Strings[nIndex];
end;

procedure TfmAttendFomat.LoadFieldName(aBox: TComboBox);
var
  i : integer;
begin
  TComboBox(aBox).Clear;
  if FieldCodeList.Count < 1 then Exit;
  for i:=0 to FieldCodeList.Count - 1 do
  begin
    TComboBox(aBox).Items.Add(FieldNameList.Strings[i]);
  end;

end;

procedure TfmAttendFomat.LoadFieldUse(aBox: TComboBox);
begin
  TComboBox(aBox).Clear;
  TComboBox(aBox).Items.Add('�̻��');
  TComboBox(aBox).Items.Add('���');
end;

procedure TfmAttendFomat.LoadFrontRear(aBox: TComboBox);
begin
  TComboBox(aBox).Clear;
  TComboBox(aBox).Items.Add('��');
  TComboBox(aBox).Items.Add('��');
end;

procedure TfmAttendFomat.LoadGubun(aBox: TComboBox);
begin
  TComboBox(aBox).Clear;
  TComboBox(aBox).Items.Add('�̻��');
  TComboBox(aBox).Items.Add('TAB');
end;

procedure TfmAttendFomat.SearchAttendFormat(aSeq: string; aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stTemp : string;
begin
  GridInit(sg_List,12,2,False);

  stSql := 'Select * from TB_ATTENDFILEFORMAT order by AF_SEQ ';

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

      with sg_List do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('AF_SEQ').AsString;
          if FindField('AF_USE').AsInteger = 0 then stTemp := '�̻��'
          else stTemp := '���';
          cells[1,nRow] := stTemp;
          stTemp := GetFieldName(FindField('AF_FIELDNAME').AsString);
          cells[2,nRow] := stTemp;
          cells[12,nRow] := FindField('AF_FIELDNAME').AsString;
          cells[3,nRow] := FindField('AF_FILLCHAR').AsString;
          cells[4,nRow] := FindField('AF_LENGTH').AsString;
          if FindField('AF_FRONTREAR').AsInteger = 0 then stTemp := '��'
          else stTemp := '��';
          cells[5,nRow] := stTemp;
          if (FindField('AF_FIELDNAME').AsString = 'AT_DATE')
             or (FindField('AF_FIELDNAME').AsString = 'AE_INTIME') then cells[6,nRow] := FindField('AF_DATEFORMATE').AsString
          else cells[6,nRow] := '';
          if (FindField('AF_FIELDNAME').AsString = 'AC_INOUTTYPE') then
          begin
            cells[7,nRow] := FindField('AF_WORKINTYPE').AsString;
            cells[8,nRow] := FindField('AF_WORKOUTTYPE').AsString;
            cells[9,nRow] := FindField('AF_BUSINESSOUTTYPE').AsString;
            cells[10,nRow] := FindField('AF_BUSINESSINTYPE').AsString;
          end else
          begin
            cells[7,nRow] := '';
            cells[8,nRow] := '';
            cells[9,nRow] := '';
            cells[10,nRow] := '';
          end;
          cells[13,nRow] := FindField('AF_GUBUN').AsString;
          if (cells[13,nRow] = '') or (cells[13,nRow]='0') then cells[11,nRow] := '�̻��'
          else if (cells[13,nRow] = '1') then cells[11,nRow] := 'TAB';

          if (FindField('AF_SEQ').AsString = aSeq) then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow <> 0 then
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

procedure TfmAttendFomat.SetFieldName;
begin
  FieldNameList.Clear;
  FieldCodeList.Clear;

  FieldNameList.Add('��������');
  FieldCodeList.Add('AT_DATE');
  FieldNameList.Add('���');
  FieldCodeList.Add('EM_CODE');
  FieldNameList.Add('����Ÿ��');
  FieldCodeList.Add('AC_INOUTTYPE');
  FieldNameList.Add('�̸�');
  FieldCodeList.Add('EM_NAME');
  FieldNameList.Add('�ð�');
  FieldCodeList.Add('AE_INTIME');

end;

procedure TfmAttendFomat.sg_ListSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  nIndex : integer;
  Rect: TRect;
begin
  inherited;
  if Trim(sg_List.Cells[0, ARow]) = '' then Exit;

  L_nSelectCol := ACol;
  L_nSelectRow := ARow;
  Rect := sg_List.CellRect(ACol, ARow);
  if ACol = 1 then
  begin
    LoadFieldUse(cmb_Work);
    With cmb_Work do
    begin
      Visible := true;
      Left := sg_List.Left + Rect.Left ;
      Top := sg_List.Top + Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      nIndex := Items.IndexOf(Trim(sg_List.Cells[ACol, ARow]));
      ItemIndex := nIndex;
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end else if ACol = 2 then
  begin
    LoadFieldName(cmb_Work);
    With cmb_Work do
    begin
      Visible := true;
      Left := sg_List.Left + Rect.Left ;
      Top := sg_List.Top + Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      nIndex := Items.IndexOf(Trim(sg_List.Cells[ACol, ARow]));
      ItemIndex := nIndex;
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end else if ACol = 3 then
  begin
    With ed_work do
    begin
      Visible := true;
      Left := sg_List.Left + Rect.Left ;
      Top := sg_List.Top + Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text :=sg_List.Cells[ACol, ARow];
      MaxLength := 1;
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end else if ACol = 4 then
  begin
    With ed_work do
    begin
      Visible := true;
      Left := sg_List.Left + Rect.Left ;
      Top := sg_List.Top + Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text :=sg_List.Cells[ACol, ARow];
      MaxLength := 10;
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end else if ACol = 5 then
  begin
    LoadFrontRear(cmb_Work);
    With cmb_Work do
    begin
      Visible := true;
      Left := sg_List.Left + Rect.Left ;
      Top := sg_List.Top + Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      nIndex := Items.IndexOf(Trim(sg_List.Cells[ACol, ARow]));
      ItemIndex := nIndex;
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end else if ACol = 6 then
  begin
    if (sg_List.Cells[12, ARow] <> 'AT_DATE') and (sg_List.Cells[12, ARow] <> 'AE_INTIME') then Exit;

    With ed_work do
    begin
      Visible := true;
      Left := sg_List.Left + Rect.Left ;
      Top := sg_List.Top + Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text :=sg_List.Cells[ACol, ARow];
      MaxLength := 30;
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end else if (ACol = 7) or (ACol = 8) or (ACol = 9) or (ACol = 10)  then
  begin
    if (sg_List.Cells[12, ARow] <> 'AC_INOUTTYPE')  then Exit;

    With ed_work do
    begin
      Visible := true;
      Left := sg_List.Left + Rect.Left ;
      Top := sg_List.Top + Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text :=sg_List.Cells[ACol, ARow];
      MaxLength := 10;
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end else if ACol = 11 then
  begin
    LoadGubun(cmb_Work);
    With cmb_Work do
    begin
      Visible := true;
      Left := sg_List.Left + Rect.Left ;
      Top := sg_List.Top + Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      nIndex := Items.IndexOf(Trim(sg_List.Cells[ACol, ARow]));
      ItemIndex := nIndex;
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end;
end;

end.