unit uComboBoxCodeLoad;

interface
uses ADODB,StdCtrls,Classes,SysUtils,ActiveX,Vcl.ComCtrls,AdvCombo;

procedure LoadAdminGRADECode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadAlarmDeviceType(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadAlarmEventGroup(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadAlarmEventPCCode(aGroupCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadArmArea(aBuildingCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadArmMode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadAttendCode(aAWCODE:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadAttendPosition(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadAttendWorkType(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadBuildingTreeView(aCode: string;aListView,aCodeView:TTreeview;aImageIndex:integer);
procedure LoadCardGubun(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadCardGrade(cmb_Box:TComboBox);
procedure LoadCardState(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadCompanyTreeView(aCode: string;aListView,aCodeView:TTreeview;aImageIndex:integer);
procedure LoadDevice(aNodeNo:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadDoor(aBuildingCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadDoorGubun(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadEmployeeGroupTreeView(aCode: string;aListView,aCodeView:TTreeview;aImageIndex:integer);
procedure LoadEmployeeGubunCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadEmployeeStateCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadFireGroupCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadFoodCodeList(aFdType:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadFoodGROUP(cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadFoodTypeCode(cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadMenuGroupCode(aProgramGroupCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadNode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadNodeDeviceType(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadPosiCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadProgramGroupCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadSearchETC(cmb_Box:TAdvComboBox);
procedure LoadServerNo(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
procedure LoadTimeHH(cmb_Box:TAdvComboBox);
procedure LoadTimeMM(cmb_Box:TAdvComboBox);


implementation
uses
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uDataBase,
  uDBFunction;

procedure LoadAdminGRADECode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select AG_GRADECODE,AG_GRADECODENAME as NAME from TB_ADMINGRADECODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' order by AG_GRADECODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('NAME').AsString);
        aStringList.Add(FindField('AG_GRADECODE').AsString);
        Next;
      end;
      cmb_Box.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadAlarmDeviceType(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select AL_ALARMDEVICETYPE,AL_ALARMDEVICETYPENAME as NAME from TB_ALARMDEVICETYPE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' order by AL_ALARMDEVICETYPE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('NAME').AsString);
        aStringList.Add(FindField('AL_ALARMDEVICETYPE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadAlarmEventGroup(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select AG_ALARMGROUPCODE,AG_NAME' + inttostr(G_nFormLanguageType) + ' as NAME from TB_ALARMEVENTSTATEGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' order by AG_ALARMGROUPCODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('NAME').AsString);
        aStringList.Add(FindField('AG_ALARMGROUPCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadAlarmEventPCCode(aGroupCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select AP_EVENTSTATEPCCODE,AP_EVENTSTATEPCCODENAME' + inttostr(G_nFormLanguageType) + ' as NAME from TB_ALARMEVENTSTATEPCCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if (aGroupCode <> '') and (aGroupCode <> '0') then stSql := stSql + ' AND AG_ALARMGROUPCODE = ' + aGroupCode + '';
  stSql := stSql + ' order by AP_EVENTSTATEPCCODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('NAME').AsString);
        aStringList.Add(FindField('AP_EVENTSTATEPCCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadArmArea(aBuildingCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select * from TB_ARMAREA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AR_VIEW = ''1'' ';
  if aBuildingCode <> '' then
     stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  stSql := stSql + ' order by AR_VIEWSEQ ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('AR_ARMAREANAME').AsString);
        aStringList.Add(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('AR_ARMAREANO').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadArmMode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select AM_ARMMODECODE,AM_ARMMODENAME' + inttostr(G_nFormLanguageType) + ' as NAME from TB_ALARMMODECODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' order by AM_ARMMODECODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('NAME').AsString);
        aStringList.Add(FindField('AM_ARMMODECODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;
procedure LoadAttendCode(aAWCODE:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select AT_ATCODE,AT_CODENAME from TB_ATTENDCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND AW_CODE = ' + aAWCODE + ' ';
  stSql := stSql + ' order by AT_ATCODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('AT_CODENAME').AsString);
        aStringList.Add(FindField('AT_ATCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadAttendPosition(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select AP_CODE,AP_NAME from TB_ATTENDPOSITION ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' order by AP_CODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('AP_NAME').AsString);
        aStringList.Add(FindField('AP_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadAttendWorkType(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select AW_CODE,AW_NAME as NAME from TB_ATTENDWORKTYPE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' order by AW_CODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('NAME').AsString);
        aStringList.Add(FindField('AW_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadBuildingTreeView(aCode: string;aListView,aCodeView:TTreeview;aImageIndex:integer);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
  bFirst : Boolean;
begin
  aTreeView := aListView;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := aCodeView;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;
  bFirst := True;

  stSql := ' Select * from TB_BUILDINGCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_CODEUSE = ''1'' ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingType = 0 then
        stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + G_stAdminBuildingCode + '%'' ';
  end;
  stSql := stSql + ' Order by BC_DEEPSEQ,BC_VIEWSEQ,BC_BUILDINGCODE ';
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
        if bFirst then
        begin
          bFirst := False;
          aNode := aTreeView.Items.Add(nil,FindField('BC_BUILDINGNAME').AsString);
          aNode.ImageIndex := aImageIndex;
          aNode.SelectedIndex := aImageIndex;
          vTreeView.Items.AddChild(nil,FindField('BC_BUILDINGCODE').AsString);
          if aCode = FindField('BC_BUILDINGCODE').AsString  then
          begin
            if aNode <> nil then aNode.Selected := True;
          end;
          aNode.Expanded := True;
        end else
        begin
          nDeepSeq := FindField('BC_DEEPSEQ').AsInteger;
          stParentCode := copy(FindField('BC_BUILDINGCODE').AsString,1,1 + ((nDeepSeq - 1) * G_nBuildingCodeLength) );
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,FindField('BC_BUILDINGNAME').AsString);
              cNode.ImageIndex := aImageIndex;
              cNode.SelectedIndex := aImageIndex;
              bNode.Expanded := True;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then
            begin
              vNode3:= vTreeView.Items.AddChild(vNode2,FindField('BC_BUILDINGCODE').AsString);
            end;
            vNode1.Expanded := True;
            if aCode = FindField('BC_BUILDINGCODE').AsString  then
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
  //aListView.SetFocus;
end;

procedure LoadCardGubun(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select * from TB_CARDGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDGUBUN <> 0 ';    //�������� ī��� ��ȸ ���� ����.
  stSql := stSql + ' order by CA_CARDGUBUN ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('CA_CARDGUBUNNAME').AsString);
        aStringList.Add(FindField('CA_CARDGUBUN').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure LoadCardState(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select CA_STATECODE,CA_STATECODENAME' + inttostr(G_nFormLanguageType) + ' as STATENAME from TB_CARDSTATE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('STATENAME').AsString);
        aStringList.Add(FindField('CA_STATECODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadCardGrade(cmb_Box:TComboBox);
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add(dmFormFunction.GetFormName('2','1','BM3_017'));
  cmb_Box.Items.Add(dmFormFunction.GetFormName('2','1','BM3_018'));
  cmb_Box.Items.Add(dmFormFunction.GetFormName('0','2','COMMONPERSONGRADE'));
  cmb_Box.ItemIndex := 0;
end;

procedure LoadCompanyTreeView(aCode: string;aListView,aCodeView:TTreeview;aImageIndex:integer);
var
  aTreeView1 : TTreeview;
  vTreeView1 : TTreeview;
  aNode1,bNode1,cNode1 : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
  bFirst : Boolean;
begin

  aTreeView1 := aListView;
  aTreeView1.ReadOnly:= True;
  aTreeView1.Items.Clear;
  vTreeView1 := aCodeView;
  vTreeView1.ReadOnly := True;
  vTreeView1.Items.Clear;
  bFirst := True;

  stSql := ' Select * from TB_COMPANYCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_CODEUSE = ''1'' ';
  if Not G_bIsMaster then stSql := stSql + ' AND CO_COMPANYCODE Like ''' + G_stAdminCompanyCode + '%'' ';
  stSql := stSql + ' Order by CO_DEEPSEQ,CO_VIEWSEQ,CO_COMPANYCODE ';
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
        Try
          if bFirst then
          begin
            bFirst := False;
            aNode1 := aTreeView1.Items.Add(nil,FindField('CO_COMPANYNAME').AsString);
            vTreeView1.Items.AddChild(nil,FindField('CO_COMPANYCODE').AsString);
            aNode1.Expanded := True;
            if aCode = FindField('CO_COMPANYCODE').AsString  then
            begin
              if aNode1 <> nil then aNode1.Selected := True;
            end;
          end else
          begin
            nDeepSeq := FindField('CO_DEEPSEQ').AsInteger;
            stParentCode := copy(FindField('CO_COMPANYCODE').AsString,1,1 + ((nDeepSeq - 1) * G_nCompanyCodeLength) );
            vNode1:= GetNodeByText(vTreeView1,stParentCode,True);
            if vNode1 <> nil then
            begin
              bNode1 := aTreeView1.Items.Item[vNode1.AbsoluteIndex];
              if bNode1 <> nil then
              begin
                cNode1:= aTreeView1.Items.AddChild(bNode1,FindField('CO_COMPANYNAME').AsString);
                cNode1.ImageIndex := aImageIndex;
                cNode1.SelectedIndex := aImageIndex;
                if aCode = FindField('CO_COMPANYCODE').AsString  then
                begin
                  if cNode1 <> nil then cNode1.Selected := True;
                end;
                bNode1.Expanded := True;
              end;
              vNode2:= vTreeView1.Items.Item[vNode1.AbsoluteIndex];
              if vNode2 <> nil then
              begin
                vNode3:= vTreeView1.Items.AddChild(vNode2,FindField('CO_COMPANYCODE').AsString);
              end;
              vNode1.Expanded := True;
            end;
          end;
          Next;
        Except
          Exit;
        End;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  //aListView.SetFocus;
end;

procedure LoadDevice(aNodeNo:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select ND_NODENO,DE_ECUID,DE_DEVICENAME from TB_DEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND DE_DEVICEUSE = ''1'' ';
  if Not isDigit(aNodeNo) then Exit;
  stSql := stSql + ' AND ND_NODENO = ' + inttostr(strtoint(aNodeNo)) + ' ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('DE_DEVICENAME').AsString);
        aStringList.Add(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadDoor(aBuildingCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select a.* from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_DEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ND_NODENO = b.ND_NODENO ';
  stSql := stSql + ' AND a.DE_ECUID = b.DE_ECUID ';
  stSql := stSql + ' AND b.DE_DEVICEUSE = ''1'') ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.DO_VIEW = ''1'' ';
  stSql := stSql + ' AND a.DO_DOORUSE = ''1'' ';
  if aBuildingCode <> '' then
     stSql := stSql + ' AND a.BC_BUILDINGCODE Like ''' + aBuildingCode + '%'' ';
  stSql := stSql + ' order by a.DO_VIEWSEQ ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('DO_DOORNAME').AsString);
        aStringList.Add(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DO_DOORNO').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadDoorGubun(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select * from TB_DOORGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' order by DG_CODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('DG_NAME').AsString);
        aStringList.Add(FindField('DG_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadEmployeeGroupTreeView(aCode: string;aListView,aCodeView:TTreeview;aImageIndex:integer);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
  bFirst : Boolean;
begin
  aTreeView := aListView;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := aCodeView;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  stSql := ' Select * from TB_EMPLOYEEGROUPCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_GROUPCODE Like ''' + G_stAdminEmGroupCode + '%'' ';
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
      bFirst := True;
      While Not Eof do
      begin
        //if FindField('EM_DEEPSEQ').AsInteger = 0 then
        if bFirst then
        begin
          bFirst := False;
          aNode := aTreeView.Items.Add(nil,FindField('EM_GROUPCODENAME').AsString);
          aNode.ImageIndex := aImageIndex;
          aNode.SelectedIndex := aImageIndex;
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
            bNode.ImageIndex := aImageIndex;
            bNode.SelectedIndex := aImageIndex;
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
  //aListView.SetFocus;
end;

procedure LoadEmployeeGubunCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select * from TB_EMPLOYEEGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' order by EM_VIEWSEQ,EM_GUBUNCODENAME ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('EM_GUBUNCODENAME').AsString);
        aStringList.Add(FindField('EM_GUBUNCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadEmployeeStateCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select * from TB_EMPLOYEESTATECODE ';
  stSql := stSql + ' order by EM_STATECODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('EM_STATECODENAME').AsString);
        aStringList.Add(FindField('EM_STATECODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadFireGroupCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select * from TB_FIREGROUP ';
  stSql := stSql + ' order by FG_GROUPCODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('FG_GROUPCODENAME').AsString);
        aStringList.Add(FindField('FG_GROUPCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadFoodCodeList(aFdType:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  if aFdType = '0' then Exit;
  stSql := 'select * from TB_FOODCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND RE_FDTYPE = ''' + aFdType + ''' ';
  stSql := stSql + ' order by RE_FDTYPE,FO_CODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('FO_NAME').AsString);
        aStringList.Add(FindField('RE_FDTYPE').AsString + FillZeroNumber(FindField('FO_CODE').AsInteger,G_nFoodCodeLength));
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadFoodGROUP(cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select * from TB_FOODGROUP ';
  stSql := stSql + ' order by FG_CODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('FG_CODE').AsString + '.' + FindField('FG_NAME').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure LoadFoodTypeCode(cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select * from TB_FOODTYPE ';
  stSql := stSql + ' order by RE_FDTYPE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('RE_FDTYPE').AsString + '.' + FindField('RE_FDTYPENAME').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadMenuGroupCode(aProgramGroupCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stTemp : string;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;

  stSql := ' select FN_NAMECODE,FN_NAME' + inttostr(G_nFormLanguageType) + ' as NAME from TB_FORMNAME ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + aProgramGroupCode + ''' ';
  stSql := stSql + ' AND FN_MENUGUBUN = ''1'' ';
  stSql := stSql + ' AND FN_MENUGROUP = ''0'' ';



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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('NAME').AsString);
        aStringList.Add(FindField('FN_NAMECODE').AsString);
        Next;
      end;
      if RecordCount = 1 then
      begin
        if aAll then cmb_Box.ItemIndex := 1
        else cmb_Box.ItemIndex := 0;
      end else
      begin
        if cmb_Box.Items.Count > 0 then
           cmb_Box.ItemIndex := 0;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadNode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stTemp : string;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;

  stSql := ' select ND_NODENO,ND_NODENAME from TB_NODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';

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

      if RecordCount < 1 then  Exit;
      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('ND_NODENAME').AsString);
        aStringList.Add(FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength));
        Next;
      end;
      cmb_Box.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure LoadNodeDeviceType(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stTemp : string;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;

  stSql := ' select ND_DEVICETYPE,ND_DEVICETYPENAME' + inttostr(G_nFormLanguageType) + ' as NAME from TB_NODEDEVICETYPECODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND ND_PGTYPE = ' + inttostr(G_nProgramType) + ' ';

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

      if RecordCount < 1 then  Exit;
      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('NAME').AsString);
        aStringList.Add(inttostr(FindField('ND_DEVICETYPE').AsInteger));
        Next;
      end;
      cmb_Box.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadPosiCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;
  stSql := 'select * from TB_POSICODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND (CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' OR CO_COMPANYCODE = ''0'') ';    //��ü�� �ش� ȸ���ڵ忡 ���ؼ�
  stSql := stSql + ' order by PO_VIEWSEQ,CO_COMPANYCODE,PO_POSICODE ';

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
        Exit;
      End;

      if RecordCount < 1 then  Exit;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('PO_POSICODENAME').AsString);
        aStringList.Add(FindField('PO_POSICODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadProgramGroupCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stTemp : string;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;

  stSql := ' select FN_NAMECODE,FN_NAME' + inttostr(G_nFormLanguageType) + ' as NAME from TB_FORMNAME ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND FN_PROGRAMGUBUN = ''0'' ';
  stSql := stSql + ' AND FN_MENUGUBUN = ''0'' ';
  stSql := stSql + ' AND FN_MENUGROUP = ''0'' ';



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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('NAME').AsString);
        aStringList.Add(FindField('FN_NAMECODE').AsString);
        Next;
      end;
      if RecordCount = 1 then
      begin
        if aAll then cmb_Box.ItemIndex := 1
        else cmb_Box.ItemIndex := 0;
      end else
      begin
        if cmb_Box.Items.Count > 0 then
           cmb_Box.ItemIndex := 0;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadSearchETC(cmb_Box:TAdvComboBox);
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEENAME'));  //�̸�
  cmb_Box.Items.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECODE'));  //���
  cmb_Box.Items.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEECOMPANYPHONE')); //�系��ȭ��ȣ
  cmb_Box.Items.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEHANDPHONE'));    //�ڵ���
  cmb_Box.Items.Add(dmFormFunction.GetFormName('0','2','COMMONCARDNUMBER'));           //ī���ȣ
  cmb_Box.Items.Add(dmFormFunction.GetFormName('0','2','COMMONEMPLOYEEETCINFO'));              //��Ÿ
end;

procedure LoadServerNo(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True;aAllData:string = '');
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stTemp : string;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  if aAll then
  begin
    cmb_Box.Items.Add(aAllData);
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;

  stSql := ' select ND_DECODERNO,ND_DECODERNAME as NAME from TB_DECODER ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';

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

      if RecordCount < 1 then  Exit;
      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('NAME').AsString);
        aStringList.Add(FindField('ND_DECODERNO').AsString);
        Next;
      end;
      cmb_Box.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadTimeHH(cmb_Box:TAdvComboBox);
var
  i : integer;
begin
  cmb_Box.Clear;
  for i := 0 to 24 do
  begin
    cmb_Box.Items.Add(FillZeroNumber(i,2));
  end;
  cmb_Box.ItemIndex := 0;
end;

procedure LoadTimeMM(cmb_Box:TAdvComboBox);
var
  i : integer;
begin
  cmb_Box.Clear;
  for i := 0 to 6 do
  begin
    cmb_Box.Items.Add(FillZeroNumber(i * 10,2));
  end;
  cmb_Box.ItemIndex := 0;
end;

end.