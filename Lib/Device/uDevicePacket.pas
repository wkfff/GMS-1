unit uDevicePacket;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmDevicePacket = class(TDataModule)
  private
    { Private declarations }
    procedure ClearBitB(var b:byte; BitToClear: integer);
    function CheckDataPacket(aData: RawByteString;aProgramType:integer; var aLeavePacketData:RawByteString;var aPacketData:RawByteString):integer;
    function CheckDecorderDataPacket(aData: String;var aLeavePacketData: RawByteString;var aPacketData:RawByteString):integer;
    Function DataConvert1(aMakeValue:Byte;aData:String):String;
    Function DataConvert2(aMakeValue:Byte;aData:String):String;
    function getCheckSumData(aData: RawByteString;aLength:integer): String;
  public
    { Public declarations }
    function ChekCSData(aData: RawByteString;aLength,aProgramType:integer): Boolean;
    function EncodeData(aKey:Byte; aData: String): String;
    function GetCardDataPacketData(aCardType,aCardNo,aPositionNum:string;aCardPermit:Boolean;aDoorPermit,aArmAreaPermit,aRegDate,aEndDate,aTimeCodeUse,
                                   aTimeCode,aTimeGroup,aWeekCode,aEmState:string):string;
    function GetFixedCardNoCheck(aCardNo:string;bCardFixedUse:Boolean;
             aCardFixedFillChar:string;nCardFixedPosition,nCardFixedLength:integer):string;
    Function MakeCSData(aData: RawByteString;nCSType:integer=0;aLength:integer=-1):String;
    function MakeSum(aData:RawByteString;nCSType:integer=0;aLength:integer=-1):Char;
    function PacketCreate(aProgramType:integer;aLen,aVer,aDeviceID,aCmd,aData,aMsgNo:string;aKey:char;var aPacket:string):string;
    function PacketFormatCheck(aData: RawByteString;aProgramType:integer; var aLeavePacketData,aPacketData: RawByteString): integer;
  end;

var
  dmDevicePacket: TdmDevicePacket;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uDeviceVariable;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmDevicePacket }

function TdmDevicePacket.CheckDataPacket(aData: RawByteString; aProgramType: integer;
  var aLeavePacketData, aPacketData: RawByteString): integer;
var
  stLen: String;
  nDefinedDataLength: Integer;
  stBuff: String;
  stTemp : RawByteString;
  aKey: Byte;
begin
  result := -1; //������ ����

  aPacketData:= '';
  if Length(aData) < 5 then
  begin
    result := -2; //�ڸ����� �۰� ���� ���
    aLeavePacketData:= aData;           //���ڸ� ���� ��  ����
    Exit;
  end;

  stLen:= Copy(aData,2,3);
  //������ ���� ��ġ �����Ͱ� ���ڰ� �ƴϸ�...
  if not isDigit(stLen) then
  begin
    //Delete(aData,1,1);       //1'st STX ����
    aLeavePacketData:= aData;           //���ڸ� ���� ��  ����
    Exit;
  end;

  //��Ŷ�� ���ǵ� ����
  nDefinedDataLength:= StrtoInt(stLen);
  //��Ŷ�� ���ǵ� ���̺��� ���� �����Ͱ� ������
  if Length(aData) < nDefinedDataLength then
  begin
    result := -2; //�ڸ����� �۰� ���� ���
    aLeavePacketData:= aData;
    Exit;
  end;

  // ���ǵ� ���� ������ �����Ͱ� ETX�� �´°�?
  if aData[nDefinedDataLength] = ETX then
  begin

    stBuff:= Copy(aData,1,nDefinedDataLength);
    // 2010.11.22 ��Ŷ üũ �κп��� üũ����� üũ�� ���� �ϱ� ���ؼ� �۾� ��.
    //31:Q++()./,-**s*S^**+()./,-()
    aKey:= Ord(stBuff[5]);
    //stTemp:= Copy(stBuff,1,5) + EncodeData(aKey,Copy(stBuff,6,Length(stBuff)-6))+stBuff[Length(stBuff)];
    stTemp:= Copy(stBuff,1,5) + EncodeData(aKey,Copy(stBuff,6,nDefinedDataLength-6))+stBuff[nDefinedDataLength];

    if Not ChekCSData(stTemp,nDefinedDataLength,aProgramType) then   //2014.02.07 DL09 ���� ��� üũ���� üũ ���� ����
    begin
      //Delete(aData,1,1);
      aLeavePacketData:= aData;
      Exit;
    end;

    result := 1; //STX ������ �´�
    Delete(aData, 1, nDefinedDataLength);
    aLeavePacketData:= aData;
    aPacketData:=stTemp;
  end else
  begin
    aLeavePacketData:= aData;
  end;
end;

function TdmDevicePacket.CheckDecorderDataPacket(aData: String;
  var aLeavePacketData, aPacketData: RawByteString): integer;
var
  stLen: String;
  nDefinedDataLength: Integer;
  stBuff: String;
begin
  result := -1;

  aPacketData:= '';
  stLen:= Copy(aData,2,3);
  //������ ���� ��ġ �����Ͱ� ���ڰ� �ƴϸ�...
  if not isDigit(stLen) then
  begin
    aLeavePacketData:= aData;
    Exit;
  end;

  //��Ŷ�� ���ǵ� ����
  nDefinedDataLength:= StrtoInt(stLen);
  //��Ŷ�� ���ǵ� ���̺��� ���� �����Ͱ� ������
  if Length(aData) < nDefinedDataLength then
  begin
    result := -2;  // 2010.11.25 ���� �۰� ��� �� ����
    aLeavePacketData:= aData;
    Exit;
  end;

  // ���ǵ� ���� ������ �����Ͱ� ETX�� �´°�?
  if aData[nDefinedDataLength] = EOH then
  begin
    result := 2; //Decorder Format �� ����
    stBuff:= Copy(aData,1,nDefinedDataLength);
    aPacketData:=stBuff;
    Delete(aData, 1, nDefinedDataLength);
    aLeavePacketData:= aData;
  end else
  begin
    aLeavePacketData:= aData;
  end;
end;


function TdmDevicePacket.ChekCSData(aData: RawByteString; aLength,
  aProgramType: integer): Boolean;
var
  stCheckSum : string;
  stMakeCS : string;
begin
  result := False;
  stCheckSum := getCheckSumData(aData,aLength);
  stMakeCS := MakeCSData(copy(aData,1,aLength - 3) + ETX,aProgramType,(aLength - 3) + 1);
  if stMakeCS = stCheckSum then result := True;

end;

procedure TdmDevicePacket.ClearBitB(var b: byte; BitToClear: integer);
begin
  if (BitToClear < 0) or (BitToClear > 7) then exit;
  b := b and not (1 shl BitToClear);
end;

{���� ��ȣ��(BIT4,BIT3,BIT2,BIT1,BIT0) �� data�� XOR �Ѵ�.}
function TdmDevicePacket.DataConvert1(aMakeValue: Byte; aData: String): String;
var
  I: Integer;
  bData: String;
begin
  bData:= aData;
  for I:= 1 to Length(bData) do
  begin
    bData[I]:= Char(ord(bData[I]) XOR aMakeValue);
  end;
  Result:= bData;
end;

{ ���� ��ȣ��(BIT4,BIT3,BIT2,BIT1,BIT0) �� data�� XOR �� Message No�� ���� Nibble�� �ٽ� XOR �Ѵ�.}
function TdmDevicePacket.DataConvert2(aMakeValue: Byte; aData: String): String;
var
  I: Integer;
  bMakeValue: Byte;
  bData: String;
  TempByte: Byte;
begin
  bData:= aData;
  {13���� Byte �� MessageNo}
  bMakeValue:= Ord(aData[13]) and $F;
  Result:= '';
  for I:= 1 to Length(bData) do
  begin
    if I <> 13 then
    begin
      TempByte:= ord(bData[I]) XOR aMakeValue;
      bData[I]:= Char(TempByte XOR bMakeValue);
    end;
  end;
  Result:= bData;
end;

function TdmDevicePacket.EncodeData(aKey: Byte; aData: String): String;
var
  Encodetype: Integer;
  aMakeValue: Byte;
  I: Integer;
begin
  EncodeType:= aKey SHR 6; //7,6 �� Bit�� ���ڵ� Ÿ��
  aMakeValue:= aKey;
  for I:= 5 to 7 do ClearBitB(aMakeValue,I); //1,2,3,4,5 Bit�� ������ȣ

  case EncodeType of
    0: Result:= DataConvert1(aMakeValue,aData);
    1: Result:= DataConvert2(aMakeValue,aData);
    else Result:= aData;
  end;
end;

function TdmDevicePacket.GetCardDataPacketData(aCardType, aCardNo, aPositionNum:string;aCardPermit:Boolean;
  aDoorPermit, aArmAreaPermit, aRegDate, aEndDate, aTimeCodeUse,
  aTimeCode, aTimeGroup, aWeekCode,aEmState: string): string;
var
  stCardData : string;
  nCardLength : integer;
  stCardPositionNum : string;
  stPermitCMD : string;
  stArmAccessType : string;   //0.����,1.���,2.���+����
  stDoorRegCode : string;     //0.1+2,1.1�����Ա���,2.2�����Ա���
  nDoorCount : integer;
  stDoorPermit : string;
  stArmAreaPermit : string;
  stTimeCode : string;
  stCardWeekCode : string;
begin
  result := '';
  nCardLength := 0;

  if (aCardType = AUTOKT811) or (aCardType = COMMON811) then
  begin
    aCardNo := copy(aCardNo,1,8);
    stCardData := EncodeCardNo(aCardNo);
  end else if (aCardType = KT811) then
  begin
    if aCardNo[10] = '*' then //�ø��� Ÿ�� �̸�
      aCardNo := copy(aCardNo,1,8) + '0**';
    aCardNo := copy(aCardNo,1,11);
    if Length(aCardNo) <> 11 then aCardNo := FillCharString(aCardNo,'*',11,False);
    stCardData := Ascii2Hex(aCardNo);
    nCardLength := Length(stCardData);
  end else if (aCardType = UNIVER811) then
  begin
    stCardData := aCardNo;
    if Length(stCardData) <> 16 then stCardData := FillCharString(stCardData,'*',16,False);
    nCardLength := Length(stCardData);
  end else if (aCardType = MERGECARD) then
  begin
    stCardData := aCardNo;
    if Length(stCardData) <> 16 then stCardData := FillCharString(stCardData,'*',16,False);
    nCardLength := Length(stCardData);
  end else
  begin
    Exit;
  end;

  if Length(aEndDate) <> 8 then aEndDate := '000000'
  else aEndDate := copy(aEndDate,3,6);

  if Not IsDigit(aEndDate) then aEndDate := '000000';
  stCardPositionNum := FillCharString(aPositionNum,'0',5,True);

  if Not aCardPermit then stPermitCMD := 'N'
  else
  begin
    if G_bCardPositionUse then stPermitCMD := 'J'
    else stPermitCMD := 'L';
  end;
  if aEmState <> '1' then stPermitCMD := 'N'; //�������°� �ƴϸ� ���ѻ���

  stArmAccessType := '0';
  stDoorRegCode := '0';
  nDoorCount := Length(aDoorPermit);
  if Pos('1',aDoorPermit) > 0 then //���Ա����� �ְ�
  begin
    if Pos('1',aArmAreaPermit) > 0 then stArmAccessType := '2' //��������� ������  ��� + ����
    else stArmAccessType := '0'; //��������
    if (aDoorPermit[nDoorCount] = '1') and (aDoorPermit[nDoorCount - 1] = '1') then stDoorRegCode := '0'
    else if aDoorPermit[nDoorCount] = '1' then stDoorRegCode := '1'
    else if aDoorPermit[nDoorCount-1] = '1' then stDoorRegCode := '2'
    else stDoorRegCode := '3';
  end else
  begin
    if Pos('1',aArmAreaPermit) > 0 then stArmAccessType := '1' //��������� ������   �������
    else stPermitCMD := 'N';
  end;

  if G_nMonitoringType = 1 then stArmAccessType := '2'; //�бⱹ��� ������ ��� + �����̴�.


  stDoorPermit := Hex2ASCII(BinaryToHex('0100' + copy(aDoorPermit,1,4)) + BinaryToHex('0100' + copy(aDoorPermit,5,4)));
  stArmAreaPermit := Hex2ASCII(BinaryToHex('0100' + copy(aArmAreaPermit,1,4)) + BinaryToHex('0100' + copy(aArmAreaPermit,5,4)));
  if aTimeCodeUse = '' then aTimeCodeUse := '0';
  if Length(aTimeCode) <> 4 then aTimeCode := FillCharString(aTimeCode,'0',4,True);
  stTimeCode := BinaryToHex(aTimeCode);
  if aTimeGroup = '' then aTimeGroup := '0';
  if Length(aWeekCode) <> 7 then aWeekCode := FillCharString(aWeekCode,'0',7,False);
  stCardWeekCode := aTimeCodeUse[1] + aWeekCode;
  stCardWeekCode := BinaryToHex(stCardWeekCode);

  result := stPermitCMD +
          '0'+
          stDoorRegCode+                  //����ڵ�(0:1,2   1:1����,  2:2����, 3:�������)
          '  '+                           //RecordCount #$20 #$20
          '0'+                            //����
          FillZeroNumber(nCardLength,2) + //ī�����
          stCardData +                    //ī���ȣ
          aEndDate+                       //��ȿ�Ⱓ
          '0'+                            //��� ���
          stArmAccessType+                //ī�����(0:��������,1:�������,2:���+����)
          stTimeCode +                     //Ÿ������
          stCardPositionNum +                    //ī�� id ��ȣ
          stArmAreaPermit +               //�����������
          stDoorPermit +                //���Թ� ����
          aTimeGroup +
          stTimeCode +
          stCardWeekCode +
          '24';                          //��ȿ�Ⱓ �ð� �߰�


end;

function TdmDevicePacket.getCheckSumData(aData: RawByteString;
  aLength: integer): String;
begin
  result := copy(aData,aLength - 2,2);
end;

function TdmDevicePacket.GetFixedCardNoCheck(aCardNo: string;
  bCardFixedUse: Boolean; aCardFixedFillChar: string; nCardFixedPosition,
  nCardFixedLength: integer): string;
var
  bFront : Boolean;
begin
  result := aCardNo;
  if Not bCardFixedUse then Exit; //�������� ������� ������ �� ī�嵥���� ����
  bFront := True;
  if nCardFixedPosition <> 0 then bFront := False;//�ڿ� ä���� ä��� ���
  result := FillCharString(aCardNo,aCardFixedFillChar[1],nCardFixedLength,bFront);

end;

function TdmDevicePacket.MakeCSData(aData: RawByteString; nCSType: integer=0;aLength:integer=-1): String;
var
  aSum: Integer;
  st: string;
begin
  aSum:= Ord(MakeSum(aData,nCSType,aLength));
  aSum:= aSum*(-1);
  st:= Dec2Hex(aSum,2);

  Result:= copy(st,Length(st)-1,2);
end;

function TdmDevicePacket.MakeSum(aData: RawByteString; nCSType: integer=0;aLength:integer=-1): Char;
var
  i: Integer;
  aBcc: Byte;
  BCC: string;
  nOrd : integer;
//  nSumOrd : integer;
  stAnsiTemp : WideString;
  bs : TBytesStream;
begin
  if aLength = -1 then
  begin
    bs := TBytesStream.Create(BytesOf(aData));
    aLength := bs.Size;
    bs.Free;
  end;

  nOrd := Ord(aData[1]);
  aBcc := nOrd;
  for i := 2 to aLength do
  begin
    nOrd := Ord(aData[i]);
//    nSumOrd := nSumOrd + nOrd;
    aBcc := aBcc + nOrd; //Ord(st[i]);
  end;
  if nCSType = 1 then
  begin
    aBcc := aBcc + Ord(#$A7);
  end else if nCSType = 2 then
  begin
    aBcc := aBcc + Ord(#$9E);
  end else if nCSType = 3 then
  begin
//    aBcc := aBcc + Ord(#$53);
  end;
  BCC := Chr(aBcc);
  Result := BCC[1];
end;

function TdmDevicePacket.PacketCreate(aProgramType: integer; aLen, aVer,
  aDeviceID, aCmd, aData, aMsgNo: string;aKey:char;var aPacket:string): string;
var
  stPacket : string;
  nKey : integer;
begin
  stPacket := STX + aLen + aKey + aVer + aDeviceID + aCmd + aMsgNo + aData;
  stPacket  := stPacket + MakeCSData(stPacket + ETX,aProgramType) + ETX;
  aPacket := stPacket;
  nKey    := ord(aKey);
  result := Copy(stPacket, 1, 5) + EncodeData(nKey,
    Copy(stPacket, 6, Length(stPacket) - 6)) + ETX;
end;

function TdmDevicePacket.PacketFormatCheck(aData: RawByteString; aProgramType: integer;
  var aLeavePacketData, aPacketData: RawByteString): integer;
begin
  aPacketData := '';
  result := -1; //������ ����

  if aData[1] = SOH then
  begin
    result := CheckDecorderDataPacket(aData,aLeavePacketData,aPacketData);
  end else if aData[1] = STX then
  begin
    result:= CheckDataPacket(aData,aProgramType,aLeavePacketData,aPacketData);
  end else
  begin
    aLeavePacketData := aData;
  end;
end;

end.