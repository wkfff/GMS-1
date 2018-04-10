unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls,DB, ADODB,ActiveX, AdvAppStyler,AdvToolBar,
  AdvGlowButton,JclMime;

type

  TLogin = class(TComponent)
  private
    FLogined: Boolean;
    FSYSADMIN: Boolean;
    procedure SetLogined(const Value: Boolean);
    class function FindSelf:TComponent;
    { Private declarations }
  public
    { Public declarations }
    EmpSn : Integer;    //사원번호
    ProgIDs,UserID,UserName,CompanyCode,DepartCode,Grade : String;
    Procedure ShowLoginDlg(aProgramGubun:string);
    procedure SetSysAdmin(const Value: Boolean);
    class Function GetObject:TLogin;   //자기자신을 찾는것  class 는 폼생성전에도 사용가능
    Property SYSADMIN : Boolean read FSYSADMIN write SetSYSADMIN;
  Published
    { Published declarations }
    Property Logined : Boolean read FLogined write SetLogined;

  end;

  TfmLogin = class(TAdvToolBarForm)
    lb_UserPW: TLabel;
    lb_UserID: TLabel;
    Bevel1: TBevel;
    edPassword: TEdit;
    edUserID: TEdit;
    ADOQuery1: TADOQuery;
    AdvFormStyler1: TAdvFormStyler;
    sbLogin: TAdvGlowButton;
    sbCancel: TAdvGlowButton;
    procedure sbLoginClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edUserIDKeyPress(Sender: TObject; var Key: Char);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FProgramGubun: string;
    { Private declarations }
    Function MasterCheck(stUserID:string):Boolean;
    Function FormNameSetting:Boolean;
  public
    { Public declarations }
    property ProgramGubun : string read FProgramGubun write FProgramGubun;
  end;

var
  fmLogin: TfmLogin;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBFunction,
  uLoginVariable,
  uDBInsert,
  uDBFormMessage,
  uFormFunction;

{$R *.dfm}


procedure TfmLogin.sbLoginClick(Sender: TObject);
var
  stGrade: String;
  stUserName: String;
  stSql: String;
  TempAdoQuery : TADOQuery;
  stMessage : string;
  stTime : string;
  stClientIP : string;
begin
  stClientIP:= GetLocalIPAddr;
  G_bIsMaster := False;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

    TLogin.GetObject.ProgIDs:=''; //사용가능한 프로그램 목록 초기화

    If TLogin.GetObject.FSYSADMIN then
    begin
      G_bIsMaster := True;
      G_nAdminCompanyGrade := 0;
      G_nAdminBuildingType :=0; //0:전체,1:빌딩,2:층,3:구역,4:출입문단위
      G_stAdminEmGroupCode := '0';

      //시스템 어드민 이면 비밀번호만 체크
      TLogin.GetObject.Logined  := True ;
      //모든 권한을 다 줌
      G_LogInfo.Log_Note:= 'Login Success';
      dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,'SYSADMIN','0','00','','0',con_ComLogTYPE_PROGRAM,'Login Success');

      if G_bIsMaster then
      begin
        TLogin.GetObject.ProgIDs:='';
        With  TempAdoQuery  do
        Begin
            //모든 권한을 셋팅
            stSql := 'Select FN_NAMECODE from TB_FORMNAME';
            stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
            stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + ProgramGubun + ''' ';
            stSql := stSql + ' AND FN_MENUGUBUN = ''1'' ';
            Close;
            SQL.Clear;
            SQL.Text := stSql;

            Try
              Open;
            Except
              on E : EDatabaseError do
                begin
                  ShowMessage(E.Message );
                  Exit;
                end;
            End;   //Try End

            While Not Eof do Begin
               TLogin.GetObject.ProgIDs:=
                   TLogin.GetObject.ProgIDs + Trim(FieldByName('FN_NAMECODE').AsString) + ';' ;
               Next;
            End //While End
        End;   //With End
      end;

      TLogin.GetObject.UserID := 'SYSADMIN';
      TLogin.GetObject.UserName := 'System';
      G_stAdminCompanyCode := '0';
      TLogin.GetObject.Grade := '1';
      Close;
      exit;
    End;  //IF End

    with  TempAdoQuery  do
    begin
      stSql := 'Select * from TB_ADMIN ';
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + Trim(edUserID.text) + ''' ';
      stSql := stSql + ' AND AD_USERPW = ''' + MimeEncodeString(Trim(edPassword.text)) + ''' ';
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
         TLogin.GetObject.Logined  := False ;
         Exit;
      End;

      if RecordCount < 1 then
      begin
        stMessage := dmFormMessage.GetMessage('PASSWORDCHECKERROR');
        Application.messagebox(PChar(stMessage),PChar('Fail'),mb_OK);
        TLogin.GetObject.Logined  := False ;
        Exit;
      end;

      stGrade:=  FindField('AG_GRADECODE').asString;
      stUserName:=   FindField('AD_USERNAME').asString;
      if FindField('AD_MASTER').AsString = '1' then
      begin
        G_bIsMaster := True ;
        G_nAdminCompanyGrade := 0;
        G_nAdminBuildingType := 0;
        G_stAdminCompanyCode := '0';
        G_stAdminEmGroupCode := '0';
      end else
      begin
        G_bIsMaster := False;
        G_stAdminCompanyCode := FindField('CO_COMPANYCODE').AsString;
        G_stAdminBuildingCode := FindField('BC_BUILDINGCODE').AsString;
        if Not IsDigit(FindField('AD_BUILDINGTYPE').AsString) then G_nAdminBuildingType := 1
        else G_nAdminBuildingType := FindField('AD_BUILDINGTYPE').Asinteger;
        G_stAdminEmGroupCode := FindField('EM_GROUPCODE').AsString;
      end;
    end;
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,edUserID.text,'0','00','','0',con_ComLogTYPE_PROGRAM,'Login Success');

    //로그인 성공시
    TLogin.GetObject.UserID := edUserID.text;
    TLogin.GetObject.UserName := stUserName;
    TLogin.GetObject.Logined  := True ;
    TLogin.GetObject.Grade := stGrade;

    //IsMaster := MasterCheck(edUserID.text);

    if G_bIsMaster then
    begin
      TLogin.GetObject.ProgIDs:='';
      With  TempAdoQuery  do
      Begin
          //모든 권한을 셋팅
          stSql := 'Select FN_NAMECODE from TB_FORMNAME';
          stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
          stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + ProgramGubun + ''' ';
          stSql := stSql + ' AND FN_MENUGUBUN = ''1'' ';
          Close;
          SQL.Clear;
          SQL.Text := stSql;

          Try
            Open;
          Except
            on E : EDatabaseError do
              begin
                ShowMessage(E.Message );
                Exit;
              end;
          End;   //Try End

          While Not Eof do Begin
             TLogin.GetObject.ProgIDs:=
                 TLogin.GetObject.ProgIDs + Trim(FieldByName('FN_NAMECODE').AsString) + ';' ;
             Next;
          End //While End
      End;   //With End
    end else
    begin
      //권한체크
      TLogin.GetObject.ProgIDs:='';
      With  TempAdoQuery  do
      Begin
          //모든 권한을 셋팅
          stSql := 'Select FN_NAMECODE from TB_ADMINGRADEPROGRAM ';
          stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
          stSql := stSql + ' AND AG_GRADECODE = ''' + stGrade + ''' ';
          stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + ProgramGubun + ''' ';
          stSql := stSql + ' AND FN_MENUGUBUN = ''1'' ';
          Close;
          SQL.Clear;
          SQL.Text := stSql;
          Try
            Open;
          Except
            on E : EDatabaseError do
              begin
                ShowMessage(E.Message  );
                Exit;
              end;
          End;   //Try End
          While Not Eof do Begin
             TLogin.GetObject.ProgIDs:=
                 TLogin.GetObject.ProgIDs + Trim(FieldByName('FN_NAMECODE').AsString) + ';' ;
             Next;
          End //While End
      End;   //With End
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  Close;

end;

{ TLogin }

class function TLogin.FindSelf: TComponent;
var
  Loop:Integer;
begin
  Result:=Nil;
  for Loop:=0 to Application.ComponentCount-1 do begin
      if Application.Components[Loop] is TLogin then begin
          Result:= Application.Components[Loop];
          Break;
      end;
  end;
end;

class function TLogin.GetObject: TLogin;
begin
   If FindSelf = Nil then TLogin.Create(Application);
   Result := TLogin(FindSelf);

end;

procedure TLogin.SetLogined(const Value: Boolean);
begin
  FLogined := Value;
end;

procedure TLogin.SetSYSADMIN(const Value: Boolean);
begin
  FSYSADMIN := Value;
end;

procedure TLogin.ShowLoginDlg(aProgramGubun:string);
begin
  FLogined := False;

  fmLogin:=TfmLogin.Create(Nil);
  Try
    fmLogin.ProgramGubun := aProgramGubun;
    fmLogin.ShowModal;
  Finally
    fmLogin.Free;
  End;
end;

procedure TfmLogin.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLogin.FormCreate(Sender: TObject);
begin
  edUserID.Text:= '';
  edPassword.Text := '';
end;

function TfmLogin.FormNameSetting: Boolean;
begin
  Caption := dmFormFunction.GetFormName('0','2','COMMONLOGIN');
  lb_UserID.Caption := dmFormFunction.GetFormName('0','2','COMMONUSERID');
  lb_UserPW.Caption := dmFormFunction.GetFormName('0','2','COMMONUSERPW');

  sbLogin.Caption := dmFormFunction.GetFormName('0','2','COMMONCONFIRM');
  sbCancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
end;

procedure TfmLogin.FormResize(Sender: TObject);
begin
  sbLogin.Left := (width div 2) - sbLogin.Width - 5;
  sbCancel.Left := (width div 2) + 5;
end;

procedure TfmLogin.FormShow(Sender: TObject);
begin
  FormNameSetting;
end;

procedure TfmLogin.edUserIDKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    edPassword.SetFocus;
  end;
end;

procedure TfmLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    sbLogin.click;
  end;
end;

function TfmLogin.MasterCheck(stUserID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_CONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''MASTERID'' ';
  stSql := stSql + ' AND CO_CONFIGVALUE = ''' + stUserID + ''' ';

  With ADOQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
  end;
  result := True;
end;

end.
