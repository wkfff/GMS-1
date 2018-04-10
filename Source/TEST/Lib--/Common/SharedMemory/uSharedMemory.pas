unit uSharedMemory;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

const
  k_max_info_size = 4096;           // �����޸� ũ��

type

  TfisSharedMemory = class(TComponent)
  private
    FShareName: String;
    FHandle: THandle;
    { Private declarations }
  public
      constructor Create(AOwner: TComponent);override;
      destructor Destroy;override;
  public
      // �ܺ� �Լ� ----------------------------------
      function CreateMMF_Info () : boolean;               // �����޸� ����
      procedure CloseMMF_Info ();                         // �����޸� ����

      function Read_Info (mmf_data : PChar) : boolean;    // ����޸� �б��Լ�
      function Write_Info (mmf_data : PChar) : boolean;   // ����޸� �����Լ�
  published
    { Published declarations }
      property Handle : THandle read FHandle write FHandle;
      property ShareName: String read FShareName write FShareName;
  end;

implementation

{ TfisSharedMemory }

procedure TfisSharedMemory.CloseMMF_Info;
begin
  CloseHandle (Handle);
end;

constructor TfisSharedMemory.Create(AOwner: TComponent);
begin
  inherited;
  ShareName := '';
end;

function TfisSharedMemory.CreateMMF_Info: boolean;
begin
  Handle := CreateFileMapping (THandle ($FFFFFFFF),
                                     nil, PAGE_READWRITE, 0,
                                     k_max_info_size, pchar(ShareName));
  if Handle = THandle (nil) then
    Handle := CreateFileMapping (THandle ($FFFFFFFF),
                                       nil, PAGE_READWRITE, 0,
                                       k_max_info_size, pchar(ShareName));

  if Handle <> THandle (nil) then result := true
  else
end;

destructor TfisSharedMemory.Destroy;
begin
  CloseMMF_Info;
  inherited;
end;

function TfisSharedMemory.Read_Info(mmf_data: PChar): boolean;
var
  p_data : pChar;
begin
  p_data := nil;
  result := false;
  if mmf_data = nil then                exit;
  if Handle = THandle (nil) then  exit;

  try
  begin
    p_data := MapViewOfFile (Handle, FILE_MAP_WRITE, 0, 0, 0);
    if p_data <> nil then
    begin
      StrCopy (mmf_data, p_data);   // mmf_data <- p_data (�����޸�)
      if integer (mmf_data [0]) <> 0 then result := true;
    end;
  end;
  finally
    UnmapViewOfFile (p_data);
  end;
end;

function TfisSharedMemory.Write_Info(mmf_data: PChar): boolean;
var
  p_data : pChar;
begin
  p_data := nil;
  result := false;
  if mmf_data = nil then                exit;
  if Handle = THandle (nil) then  exit;

  try
  begin
    p_data := MapViewOfFile (Handle, FILE_MAP_WRITE, 0, 0, 0);
    if p_data <> nil then
    begin
      StrCopy (p_data, mmf_data);   // mmf_data -> p_data (�����޸�)
      if integer (mmf_data [0]) <> 0 then result := true;
    end;
  end;
  finally
    UnmapViewOfFile (p_data);
  end;
end;

end.