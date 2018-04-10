unit uServerClientFunction;

interface
  uses System.SysUtils;


  function GetPacketData(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData:string):string;
  function PacketFormatCheck(aData: String;var aLeavePacketData,aPacketData: String): integer;

implementation
uses
  uServerClientVariable,
  uCommonFunction,
  uCommonVariable;

function GetPacketData(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData:string):string;
var
  stSendData : string;
begin
  if Not isDigit(aNodeNo) then aNodeNo := '0';

  stSendData := aCMD + aDeviceType + aSubCmd + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aData;
  //stSendData := String2Hex(stSendData);
  result := SCSTX + FillZeroNumber(Length(stSendData),3) + stSendData + SCETX;
end;

function PacketFormatCheck(aData: String;var aLeavePacketData,aPacketData: String): integer;
var
  stLen: String;
  nDefinedDataLength: Integer;
  stBuff: String;
  aKey: Byte;
  stData : string;
begin
  result := -1; //비정상 전문
  if aData[1] <> SCSTX then
  begin
    aLeavePacketData:= aData;
    Exit;
  end;

  aPacketData:= '';
  if Length(aData) < 4 then
  begin
    result := -2; //자릿수가 작게 들어온 경우
    aLeavePacketData:= aData;
    Exit;
  end;
  stLen:= Copy(aData,2,3);
  //데이터 길이 위치 데이터가 숫자가 아니면...
  if not isDigit(stLen) then
  begin
    aLeavePacketData:= aData;           //리턴 후 한자리 삭제
    Exit;
  end;

  //패킷에 정의된 길이
  nDefinedDataLength:= StrtoInt(stLen);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < nDefinedDataLength then
  begin
    result := -2; //자릿수가 작게 들어온 경우
    aLeavePacketData:= aData;
    Exit;
  end;

  // 정의된 길이 마지막 데이터가 ETX가 맞는가?
  if aData[nDefinedDataLength + 3 + 2] = SCETX then
  begin
    stBuff:= Copy(aData,1,nDefinedDataLength + 3 + 2);
    result := 1;                             //STX 포맷이 맞다
    Delete(aData, 1, nDefinedDataLength + 3 + 2 );
    aLeavePacketData:= aData;
    aPacketData:= stBuff ;//copy(stBuff,1,4) + Hex2UTF8String(copy(stBuff,5,nDefinedDataLength)) + SCETX;
  end else
  begin
    aLeavePacketData:= aData;
  end;
end;
end.
