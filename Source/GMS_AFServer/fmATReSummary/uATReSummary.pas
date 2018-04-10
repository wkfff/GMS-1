unit uATReSummary;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfmAtResummery = class(TForm)
    Label1: TLabel;
    dmDate: TDateTimePicker;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAtResummery: TfmAtResummery;

implementation
uses
  uMain,
  uDataBase;

{$R *.dfm}

procedure TfmAtResummery.Button1Click(Sender: TObject);
var
  stSql : string;
begin
  if fmMain.L_bATSummary then
  begin
    while fmMain.L_bATSummary do
    begin
      Application.ProcessMessages;
    end;
  end;

  fmMain.L_stWorkTime := FormatDateTime('yyyymmdd',dmDate.DateTime) + '000000000';
  stSql := ' Delete From TB_ATTENDEVENT ';
  stSql := stSql + ' where AT_DATE >= ''' + FormatDateTime('yyyymmdd',dmDate.DateTime) + ''' ';
  stSql := stSql + ' AND AE_ATTYPEUSER is null ';
  stSql := stSql + ' AND AE_INUSER is null ';
  stSql := stSql + ' AND AE_WORKOUTUSER is null ';
  stSql := stSql + ' AND AE_WORKINUSER is null ';
  stSql := stSql + ' AND AE_OUTUSER is null ';
  dmDataBase.ProcessEventExecSQL(stSql);

  stSql := ' Delete From TB_ATTENDEVENTLIST where AT_DATE >= ''' + FormatDateTime('yyyymmdd',dmDate.DateTime) + ''' ';
  dmDataBase.ProcessEventExecSQL(stSql);

  stSql := ' Update TB_ACCESSEVENT Set AE_ATSUMMARY = null where AE_DATE >= ''' + FormatDateTime('yyyymmdd',dmDate.DateTime) + ''' ';
  dmDataBase.ProcessEventExecSQL(stSql);
  Close;
end;

procedure TfmAtResummery.FormCreate(Sender: TObject);
begin
  dmDate.DateTime := now;
end;

end.
