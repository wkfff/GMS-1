unit uDBAlter;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmDBAlter = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function AlterTB_ACCESSEVENT_CONTROLTYPECODE_LanguageTypeChange:Boolean;
  end;

var
  dmDBAlter: TdmDBAlter;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
uses
  uDataBase,
  uCommonVariable;

{$R *.dfm}

{ TdmDBAlter }

function TdmDBAlter.AlterTB_ACCESSEVENT_CONTROLTYPECODE_LanguageTypeChange: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE <> MSSQL then Exit;
  stSql := 'ALTER TABLE TB_ACCESSEVENT ';
  stSql := stSql + ' ALTER COLUMN AE_CONTROLTYPECODE char(1) COLLATE Korean_Wansung_CS_AS';
  result := dmDataBase.ProcessExecSQL(stSql);
end;

end.
