unit uAttendEvent;

interface

uses
  System.SysUtils, System.Classes,DateUtils;

type
  TAttendEmployee = class(TComponent)
  private
    FAWCODE: string;
    FCOMPANYCODE: string;
    FEMSEQ: integer;
    FEMNAME: string;
    FEMCODE: string;
    FPOSICODE: string;
    FLoadingDate: string;
  published
    property EMSEQ : integer read FEMSEQ write FEMSEQ;
    property EMCODE : string read FEMCODE write FEMCODE;
    property EMNAME : string read FEMNAME write FEMNAME;
    property COMPANYCODE : string read FCOMPANYCODE write FCOMPANYCODE;
    property POSICODE : string read FPOSICODE write FPOSICODE;
    property AWCODE : string read FAWCODE write FAWCODE;
    property LoadingDate : string read FLoadingDate write FLoadingDate;
  end;

  TAttendPosition = class(TComponent)
  private
    FOFFBUTTON: string;
    FWORKINBUTTON: string;
    FDEVICETYPE: string;
    FAPNAME: string;
    FINOUTDEVICETYPE: string;
    FAPCODE: string;
    FSTARTBUTTON: string;
    FWORKOUTBUTTON: string;  
  published
    property APCODE : string read FAPCODE write FAPCODE;
    property APNAME : string read FAPNAME write FAPNAME;
    property DEVICETYPE : string read FDEVICETYPE write FDEVICETYPE;
    property STARTBUTTON : string read FSTARTBUTTON write FSTARTBUTTON;
    property OFFBUTTON : string read FOFFBUTTON write FOFFBUTTON;
    property INOUTDEVICETYPE : string read FINOUTDEVICETYPE write FINOUTDEVICETYPE;
    property WORKOUTBUTTON : string read FWORKOUTBUTTON write FWORKOUTBUTTON;
    property WORKINBUTTON : string read FWORKINBUTTON write FWORKINBUTTON;
  end;
  
  TAttendCode = class(TComponent)
  private
    FSWORKENDTIME: string;
    FSEARLYADD: string;
    FNIGHTTIME: string;
    FHNIGHTTIME: string;
    FINFROMTIME: string;
    FHINFROMTIME: string;
    FSEXTENDTIME: string;
    FWORKENDTIME: string;
    FCODENAME: string;
    FHWORKENDTIME: string;
    FEARLYADD: string;
    FHEARLYADD: string;
    FSNIGHTADD: string;
    FEXTENDTIME: string;
    FHEXTENDTIME: string;
    FATCODE: string;
    FSNORMALADD: string;
    FSINTOTIME: string;
    FSJIGAKADD: string;
    FNIGHTADD: string;
    FHNIGHTADD: string;
    FSJOTAEADD: string;
    FSOUTRANGE: string;
    FSWORKSTARTTIME: string;
    FSEXTENDADD: string;
    FYESTERDAYTIME: string;
    FNORMALADD: string;
    FHNORMALADD: string;
    FINTOTIME: string;
    FHINTOTIME: string;
    FSNIGHTTIME: string;
    FJIGAKADD: string;
    FHJIGAKADD: string;
    FSINFROMTIME: string;
    FJOTAEADD: string;
    FOUTRANGE: string;
    FHJOTAEADD: string;
    FWORKSTARTTIME: string;
    FHOUTRANGE: string;
    FHWORKSTARTTIME: string;
    FEXTENDADD: string;
    FHEXTENDADD: string;
  published
    property ATCODE : string read FATCODE write FATCODE;
    property CODENAME : string read FCODENAME write FCODENAME;
    property YESTERDAYTIME : string read FYESTERDAYTIME write FYESTERDAYTIME;
    property WORKSTARTTIME : string read FWORKSTARTTIME write FWORKSTARTTIME;
    property WORKENDTIME : string read FWORKENDTIME write FWORKENDTIME;
    property INFROMTIME : string read FINFROMTIME write FINFROMTIME;
    property INTOTIME : string read FINTOTIME write FINTOTIME;
    property EXTENDTIME : string read FEXTENDTIME write FEXTENDTIME;
    property NIGHTTIME : string read FNIGHTTIME write FNIGHTTIME;
    property NORMALADD : string read FNORMALADD write FNORMALADD;
    property EARLYADD : string read FEARLYADD write FEARLYADD;
    property JIGAKADD : string read FJIGAKADD write FJIGAKADD;
    property JOTAEADD : string read FJOTAEADD write FJOTAEADD;
    property EXTENDADD : string read FEXTENDADD write FEXTENDADD;
    property NIGHTADD : string read FNIGHTADD write FNIGHTADD;
    property SWORKSTARTTIME : string read FSWORKSTARTTIME write FSWORKSTARTTIME;
    property SWORKENDTIME : string read FSWORKENDTIME write FSWORKENDTIME;
    property SINFROMTIME : string read FSINFROMTIME write FSINFROMTIME;
    property SINTOTIME : string read FSINTOTIME write FSINTOTIME;
    property SEXTENDTIME : string read FSEXTENDTIME write FSEXTENDTIME;
    property SNIGHTTIME : string read FSNIGHTTIME write FSNIGHTTIME;
    property SNORMALADD : string read FSNORMALADD write FSNORMALADD;
    property SEARLYADD : string read FSEARLYADD write FSEARLYADD;
    property SJIGAKADD : string read FSJIGAKADD write FSJIGAKADD;
    property SJOTAEADD : string read FSJOTAEADD write FSJOTAEADD;
    property SEXTENDADD : string read FSEXTENDADD write FSEXTENDADD;
    property SNIGHTADD : string read FSNIGHTADD write FSNIGHTADD;
    property HWORKSTARTTIME : string read FHWORKSTARTTIME write FHWORKSTARTTIME;
    property HWORKENDTIME : string read FHWORKENDTIME write FHWORKENDTIME;
    property HINFROMTIME : string read FHINFROMTIME write FHINFROMTIME;
    property HINTOTIME : string read FHINTOTIME write FHINTOTIME;
    property HEXTENDTIME : string read FHEXTENDTIME write FHEXTENDTIME;
    property HNIGHTTIME : string read FHNIGHTTIME write FHNIGHTTIME;
    property HNORMALADD : string read FHNORMALADD write FHNORMALADD;
    property HEARLYADD : string read FHEARLYADD write FHEARLYADD;
    property HJIGAKADD : string read FHJIGAKADD write FHJIGAKADD;
    property HJOTAEADD : string read FHJOTAEADD write FHJOTAEADD;
    property HEXTENDADD : string read FHEXTENDADD write FHEXTENDADD;
    property HNIGHTADD : string read FHNIGHTADD write FHNIGHTADD;
    property OUTRANGE : string read FOUTRANGE write FOUTRANGE;
    property SOUTRANGE : string read FSOUTRANGE write FSOUTRANGE;
    property HOUTRANGE : string read FHOUTRANGE write FHOUTRANGE;
  end;

  TdmAttendEvent = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    function UpdateTypeAttendProcess(aEmSeq, aEMCODE, aEMNAME, aCOMPANYCODE,
              aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,aBUTTON, aDEVICETYPE,
              aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE, aWORKOUTBUTTON,
              aWORKINBUTTON,aATToDate:string;aReSummary:Boolean):integer;
    function FixTypeAttendProcess(aATINOUTType,aEmSeq, aEMCODE, aEMNAME, aCOMPANYCODE,
              aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,aBUTTON, aDEVICETYPE,
              aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE, aWORKOUTBUTTON,
              aWORKINBUTTON,aATToDate:string;aReSummary:Boolean):integer;
  private
    AttendCodeList : TStringList; //근태코드리스트
    FATWorkNotBackupType: integer;
    FSaturdayType: integer;
    FATOutFixedType: integer;
    FAttendWorkTypeCode: integer;
    { Private declarations }
  public
    { Public declarations }
    procedure StringListClear;
    procedure AttendCode_Add(aATCODE,aCODENAME,aYESTERDAYTIME,aWORKSTARTTIME,aWORKENDTIME,aINFROMTIME,aINTOTIME,
                         aEXTENDTIME,aNIGHTTIME,aNORMALADD,aEARLYADD,aJIGAKADD,aJOTAEADD,aEXTENDADD,aNIGHTADD,aSWORKSTARTTIME,
                         aSWORKENDTIME, aSINFROMTIME, aSINTOTIME, aSEXTENDTIME,aSNIGHTTIME,aSNORMALADD,aSEARLYADD,aSJIGAKADD,aSJOTAEADD,aSEXTENDADD,aSNIGHTADD,
                         aHWORKSTARTTIME,aHWORKENDTIME,aHINFROMTIME,aHINTOTIME,aHEXTENDTIME,aHNIGHTTIME,aHNORMALADD,
                         aHEARLYADD,aHJIGAKADD,aHJOTAEADD,aHEXTENDADD,aHNIGHTADD,aOUTRANGE,aSOUTRANGE,aHOUTRANGE:string);
    function AttendProcess(aEmSeq,aEMCODE,aEMNAME,aCOMPANYCODE,aAccessTime,aAtReaderNo,aDOORNO,aCARDNO,aCONTROLTYPECODE,aBUTTON,aDEVICETYPE,aSTARTBUTTON,
                           aOFFBUTTON,aINOUTDEVICETYPE,aWORKOUTBUTTON,aWORKINBUTTON:string;aATToDate:string='';aReSummary:Boolean=False):integer;
  published
    property AttendWorkTypeCode : integer read FAttendWorkTypeCode write FAttendWorkTypeCode;
    property SaturdayType : integer read FSaturdayType write FSaturdayType; //0:토요일 공휴일 처리, 1:토요일 반휴일 처리,2:토요일 평일 처리
    property ATWorkNotBackupType : integer read FATWorkNotBackupType write FATWorkNotBackupType; ////외출 후 미복귀 처리0:미복귀시퇴근처리,1:미복귀시정상퇴근
    property ATOutFixedType : integer read FATOutFixedType write FATOutFixedType;  //정시출퇴근사용유무 - 0:사용안함,1:사용함
  end;

var
  dmAttendEvent: TdmAttendEvent;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uDBFunction,
  uDBInsert,
  uDBUpdate;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmAttendEvent }

procedure TdmAttendEvent.AttendCode_Add(aATCODE, aCODENAME, aYESTERDAYTIME,
  aWORKSTARTTIME, aWORKENDTIME, aINFROMTIME, aINTOTIME, aEXTENDTIME, aNIGHTTIME,
  aNORMALADD, aEARLYADD, aJIGAKADD, aJOTAEADD, aEXTENDADD, aNIGHTADD,
  aSWORKSTARTTIME, aSWORKENDTIME, aSINFROMTIME, aSINTOTIME, aSEXTENDTIME, aSNIGHTTIME, aSNORMALADD, aSEARLYADD,
  aSJIGAKADD, aSJOTAEADD, aSEXTENDADD, aSNIGHTADD, aHWORKSTARTTIME,
  aHWORKENDTIME, aHINFROMTIME, aHINTOTIME, aHEXTENDTIME, aHNIGHTTIME,
  aHNORMALADD, aHEARLYADD, aHJIGAKADD, aHJOTAEADD, aHEXTENDADD, aHNIGHTADD,
  aOUTRANGE, aSOUTRANGE, aHOUTRANGE: string);
var
  oAttendCode : TAttendCode;
  nIndex : integer;
begin
  if Not isDigit(aYESTERDAYTIME) then aYESTERDAYTIME := '0400';

  nIndex := AttendCodeList.IndexOf(aATCODE);
  if nIndex > -1 then
  begin
    TAttendCode(AttendCodeList.Objects[nIndex]).ATCODE := aATCODE;
    TAttendCode(AttendCodeList.Objects[nIndex]).CODENAME := aCODENAME;
    TAttendCode(AttendCodeList.Objects[nIndex]).YESTERDAYTIME := aYESTERDAYTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).WORKSTARTTIME := aWORKSTARTTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).WORKENDTIME := aWORKENDTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).INFROMTIME := aINFROMTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).INTOTIME := aINTOTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).EXTENDTIME := aEXTENDTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).NIGHTTIME := aNIGHTTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).NORMALADD := aNORMALADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).EARLYADD := aEARLYADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).JIGAKADD := aJIGAKADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).JOTAEADD := aJOTAEADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).EXTENDADD := aEXTENDADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).NIGHTADD := aNIGHTADD;

    TAttendCode(AttendCodeList.Objects[nIndex]).SWORKSTARTTIME := aSWORKSTARTTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).SWORKENDTIME := aSWORKENDTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).SINFROMTIME := aSINFROMTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).SINTOTIME := aSINTOTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).SEXTENDTIME := aSEXTENDTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).SNIGHTTIME := aSNIGHTTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).SNORMALADD := aSNORMALADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).SEARLYADD := aSEARLYADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).SJIGAKADD := aSJIGAKADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).SJOTAEADD := aSJOTAEADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).SEXTENDADD := aSEXTENDADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).SNIGHTADD := aSNIGHTADD;

    TAttendCode(AttendCodeList.Objects[nIndex]).HWORKSTARTTIME := aHWORKSTARTTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).HWORKENDTIME := aHWORKENDTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).HINFROMTIME := aHINFROMTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).HINTOTIME := aHINTOTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).HEXTENDTIME := aHEXTENDTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).HNIGHTTIME := aHNIGHTTIME;
    TAttendCode(AttendCodeList.Objects[nIndex]).HNORMALADD := aHNORMALADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).HEARLYADD := aHEARLYADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).HJIGAKADD := aHJIGAKADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).HJOTAEADD := aHJOTAEADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).HEXTENDADD := aHEXTENDADD;
    TAttendCode(AttendCodeList.Objects[nIndex]).HNIGHTADD := aHNIGHTADD;
  end else
  begin
    oAttendCode := TAttendCode.Create(nil);
    oAttendCode.ATCODE := aATCODE;
    oAttendCode.CODENAME := aCODENAME;
    oAttendCode.YESTERDAYTIME := aYESTERDAYTIME;
    oAttendCode.WORKSTARTTIME := aWORKSTARTTIME;
    oAttendCode.WORKENDTIME := aWORKENDTIME;
    oAttendCode.INFROMTIME := aINFROMTIME;
    oAttendCode.INTOTIME := aINTOTIME;
    oAttendCode.EXTENDTIME := aEXTENDTIME;
    oAttendCode.NIGHTTIME := aNIGHTTIME;
    oAttendCode.NORMALADD := aNORMALADD;
    oAttendCode.EARLYADD := aEARLYADD;
    oAttendCode.JIGAKADD := aJIGAKADD;
    oAttendCode.JOTAEADD := aJOTAEADD;
    oAttendCode.EXTENDADD := aEXTENDADD;
    oAttendCode.NIGHTADD := aNIGHTADD;

    oAttendCode.SWORKSTARTTIME := aSWORKSTARTTIME;
    oAttendCode.SWORKENDTIME := aSWORKENDTIME;
    oAttendCode.SINFROMTIME := aSINFROMTIME;
    oAttendCode.SINTOTIME := aSINTOTIME;
    oAttendCode.SEXTENDTIME := aSEXTENDTIME;
    oAttendCode.SNIGHTTIME := aSNIGHTTIME;
    oAttendCode.SNORMALADD := aSNORMALADD;
    oAttendCode.SEARLYADD := aSEARLYADD;
    oAttendCode.SJIGAKADD := aSJIGAKADD;
    oAttendCode.SJOTAEADD := aSJOTAEADD;
    oAttendCode.SEXTENDADD := aSEXTENDADD;
    oAttendCode.SNIGHTADD := aSNIGHTADD;

    oAttendCode.HWORKSTARTTIME := aHWORKSTARTTIME;
    oAttendCode.HWORKENDTIME := aHWORKENDTIME;
    oAttendCode.HINFROMTIME := aHINFROMTIME;
    oAttendCode.HINTOTIME := aHINTOTIME;
    oAttendCode.HEXTENDTIME := aHEXTENDTIME;
    oAttendCode.HNIGHTTIME := aHNIGHTTIME;
    oAttendCode.HNORMALADD := aHNORMALADD;
    oAttendCode.HEARLYADD := aHEARLYADD;
    oAttendCode.HJIGAKADD := aHJIGAKADD;
    oAttendCode.HJOTAEADD := aHJOTAEADD;
    oAttendCode.HEXTENDADD := aHEXTENDADD;
    oAttendCode.HNIGHTADD := aHNIGHTADD;

    AttendCodeList.AddObject(aATCODE,oAttendCode);
  end;
end;

function TdmAttendEvent.AttendProcess(aEmSeq, aEMCODE, aEMNAME, aCOMPANYCODE,
  aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,aBUTTON, aDEVICETYPE,
  aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE, aWORKOUTBUTTON,
  aWORKINBUTTON: string;aATToDate:string='';aReSummary:Boolean=False):integer;
var
  stAtDate : string;
  stWorkType : string;
  stATCode : string;
  stATINOUTType : string;
begin
  result := 0;
  if aDEVICETYPE = '' then Exit;
  case aDEVICETYPE[1] of
    '0' : begin //업데이트방식
      //업데이트 방식으로 근태 처리하자.
      result := UpdateTypeAttendProcess(aEmSeq, aEMCODE, aEMNAME, aCOMPANYCODE,
          aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,aBUTTON, aDEVICETYPE,
          aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE, aWORKOUTBUTTON,
          aWORKINBUTTON,aATToDate,aReSummary);
    end;
    '1' : begin //카드리더방식
      if aSTARTBUTTON = aOFFBUTTON then
      begin
        result := UpdateTypeAttendProcess(aEmSeq, aEMCODE, aEMNAME, aCOMPANYCODE,
          aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,aBUTTON, aDEVICETYPE,
          aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE, aWORKOUTBUTTON,
          aWORKINBUTTON,aATToDate,aReSummary);
      end else
      begin
        if pos(aAtReaderNo[ G_nNodeCodeLength + 2 + 1 + 1 ],aSTARTBUTTON) > 0 then stATINOUTType := '1'
        else if pos(aAtReaderNo[ G_nNodeCodeLength + 2 + 1 + 1 ],aOFFBUTTON) > 0 then stATINOUTType := '2'
        else if pos(aAtReaderNo[ G_nNodeCodeLength + 2 + 1 + 1 ],aWORKOUTBUTTON) > 0 then stATINOUTType := '3'
        else if pos(aAtReaderNo[ G_nNodeCodeLength + 2 + 1 + 1 ],aWORKINBUTTON) > 0 then stATINOUTType := '4'
        else stATINOUTType := '';
(*        if aAtReaderNo[ G_nNodeCodeLength + 2 + 1 + 1 ] = aSTARTBUTTON then stATINOUTType := '1'
        else if aAtReaderNo[ G_nNodeCodeLength + 2 + 1 + 1 ] = aOFFBUTTON then stATINOUTType := '2'
        else if aAtReaderNo[ G_nNodeCodeLength + 2 + 1 + 1 ] = aWORKOUTBUTTON then stATINOUTType := '3'
        else if aAtReaderNo[ G_nNodeCodeLength + 2 + 1 + 1 ] = aWORKINBUTTON then stATINOUTType := '4'
        else stATINOUTType := '';   *)
        if stATINOUTType <> '' then
           result := FixTypeAttendProcess(stATINOUTType,aEmSeq, aEMCODE, aEMNAME, aCOMPANYCODE,
              aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,aBUTTON, aDEVICETYPE,
              aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE, aWORKOUTBUTTON,
              aWORKINBUTTON,aATToDate,aReSummary);
      end;
    end;
    '2' : begin //버튼방식
      if aSTARTBUTTON = aOFFBUTTON then
      begin
        result := UpdateTypeAttendProcess(aEmSeq, aEMCODE, aEMNAME, aCOMPANYCODE,
          aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,aBUTTON, aDEVICETYPE,
          aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE, aWORKOUTBUTTON,
          aWORKINBUTTON,aATToDate,aReSummary);
      end else
      begin
        if pos(aBUTTON,aSTARTBUTTON) > 0 then stATINOUTType := '1'
        else if pos(aBUTTON,aOFFBUTTON) > 0 then stATINOUTType := '2'
        else if pos(aBUTTON,aWORKOUTBUTTON) > 0 then stATINOUTType := '3'
        else if pos(aBUTTON,aWORKINBUTTON) > 0 then stATINOUTType := '4'
        else stATINOUTType := '';
(*        if aBUTTON = aSTARTBUTTON then stATINOUTType := '1'
        else if aBUTTON = aOFFBUTTON then stATINOUTType := '2'
        else if aBUTTON = aWORKOUTBUTTON then stATINOUTType := '3'
        else if aBUTTON = aWORKINBUTTON then stATINOUTType := '4'
        else stATINOUTType := ''; *)
        if stATINOUTType <> '' then
           result := FixTypeAttendProcess(stATINOUTType,aEmSeq, aEMCODE, aEMNAME, aCOMPANYCODE,
              aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,aBUTTON, aDEVICETYPE,
              aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE, aWORKOUTBUTTON,
              aWORKINBUTTON,aATToDate,aReSummary);
      end;
    end;
    '3' : begin //출입문방식
      if aSTARTBUTTON = aOFFBUTTON then
      begin
        result := UpdateTypeAttendProcess(aEmSeq, aEMCODE, aEMNAME, aCOMPANYCODE,
          aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,aBUTTON, aDEVICETYPE,
          aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE, aWORKOUTBUTTON,
          aWORKINBUTTON,aATToDate,aReSummary);
      end else
      begin
        if pos(aDOORNO,aSTARTBUTTON) > 0 then stATINOUTType := '1'
        else if pos(aDOORNO,aOFFBUTTON) > 0 then stATINOUTType := '2'
        else if pos(aDOORNO,aWORKOUTBUTTON) > 0 then stATINOUTType := '3'
        else if pos(aDOORNO,aWORKINBUTTON) > 0 then stATINOUTType := '4'
        else stATINOUTType := '';
(*        if aDOORNO = aSTARTBUTTON then stATINOUTType := '1'
        else if aDOORNO = aOFFBUTTON then stATINOUTType := '2'
        else if aDOORNO = aWORKOUTBUTTON then stATINOUTType := '3'
        else if aDOORNO = aWORKINBUTTON then stATINOUTType := '4'
        else stATINOUTType := ''; *)
        if stATINOUTType <> '' then
           result := FixTypeAttendProcess(stATINOUTType,aEmSeq, aEMCODE, aEMNAME, aCOMPANYCODE,
              aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,aBUTTON, aDEVICETYPE,
              aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE, aWORKOUTBUTTON,
              aWORKINBUTTON,aATToDate,aReSummary);
      end;

    end;
  end;

end;

procedure TdmAttendEvent.DataModuleCreate(Sender: TObject);
begin
  AttendCodeList := TStringList.Create;
end;


function TdmAttendEvent.FixTypeAttendProcess(aATINOUTType, aEmSeq, aEMCODE,
  aEMNAME, aCOMPANYCODE, aAccessTime, aAtReaderNo, aDOORNO, aCARDNO,
  aCONTROLTYPECODE, aBUTTON, aDEVICETYPE, aSTARTBUTTON, aOFFBUTTON,
  aINOUTDEVICETYPE, aWORKOUTBUTTON, aWORKINBUTTON,aATToDate: string;aReSummary:Boolean): integer;
var
  stNodeNo,stEcuID,stExtendID,stReaderNo : string;
  stINFROMTIME : string;
  stINTOTIME : string;
  bYesterDay : Boolean;
  wYear    : word;
  wMonth   : word;
  wDay     : word;
  wHour    : word;
  wMinute  : word;
  wSecond  : word;
  dtPresent: TDatetime;
  dtYesterDay : TDatetime;
  nWeekCode : integer;
  stTime : string;
  i : integer;

  stATDate : string;
  stATCode : string;
  stInTime : string;
  stOutTime : string;
  bTemp : Boolean;
  bATWork : Boolean;

  stInResult : string;
  stOutResult : string;
  nIndex : integer;
  stWorkStartTime:string;
  stWorkEndTime : string;
  stExtendTime : string;
  stNightTime : string;

  nBeforWorkMM : integer;
  nWorkMM : integer;
  nExtendWorkMM : integer;
  nNightWorkMM : integer;
  nJiGakCount : integer;
  nJoTaeCount : integer;
  nBeforWorkCount : integer;
  nWorkCount : integer;
  nExtendWorkCount : integer;
  nNightWorkCount : integer;
  nInsert : integer;
  stEndTime : string;
  nTempTime : integer;
  nResult : integer;
  bResult : Boolean;
begin
  result := -1;
  nResult := -1;
  if aATINOUTType = '' then
  begin
    result := 0;
    Exit;
  end;
  stNodeNo := copy(aAtReaderNo,1,G_nNodeCodeLength);
  stEcuID := copy(aAtReaderNo,1 + G_nNodeCodeLength,2);
  stExtendID := copy(aAtReaderNo,1 + G_nNodeCodeLength + 2 ,1);
  stReaderNo := copy(aAtReaderNo,1 + G_nNodeCodeLength + 2 + 1,1);
  if AttendCodeList.Count < 1 then
  begin
    result := 0;
    Exit;
  end;
  wYear  := StrtoInt(Copy(aAccessTime,1,4));
  wMonth := StrtoInt(Copy(aAccessTime,5,2));
  wDay   := StrtoInt(Copy(aAccessTime,7,2));
  wHour  := StrtoInt(Copy(aAccessTime,9,2));
  wMinute:= StrtoInt(Copy(aAccessTime,11,2));
  wSecond:= StrtoInt(Copy(aAccessTime,13,2));
  dtPresent:= EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, wSecond,00);
  dtYesterDay := dtPresent - 1;
  stTime := copy(aAccessTime,9,4);
  bTemp := False;
  bResult := False;
  nInsert := -1;
  (*
    1.출근이면
    어제 근태일인지 오늘 근태일인지 어떻게 찾나?
    AttendCode를 찾아 봐서 출입가능시간을 찾는다.
  *)

  //근태코드를 찾자.
  for i := 0 to AttendCodeList.Count - 1 do
  begin
    if aATINOUTType = '1' then  //출근이면
    begin
      if strtoint(stTime) < strtoint(TAttendCode(AttendCodeList.Objects[i]).YESTERDAYTIME) then //현재시간이 어제 근무일자보다 작으면
      begin
        bYesterDay := True;
        nWeekCode := DayOfWeek(dtYesterDay); //어제 요일 체크 하여 출근 가능 시간을 가져 오자.
        if nWeekCode = 1 then  //일요일
        begin
          stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).HINFROMTIME;
          stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).HINTOTIME;
        end else if nWeekCode = 7 then //토요일
        begin
          stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).SINFROMTIME;
          stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).SINTOTIME;
        end else  //평일
        begin
          stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).INFROMTIME;
          stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).INTOTIME;
        end;
        if Not isDigit(stINFROMTIME) then continue;
        if Not isDigit(stINTOTIME) then continue;
        if ( (strtoint(stINFROMTIME) <= strtoint(stINTOTIME)) and  //퇴근가능시간이 출근가능시간보다 큰경우
             ((strtoint(stTime) >= strtoint(stINFROMTIME)) and
              (strtoint(stTime) <= strtoint(stINTOTIME)) ) ) or
           ( (strtoint(stINFROMTIME) > strtoint(stINTOTIME)) and   // 24시간을 넘어서 전일 오후 23시부터 새벽 2시인 경우
             ((strtoint(stTime) >= strtoint(stINFROMTIME)) or
              (strtoint(stTime) <= strtoint(stINTOTIME)) ) )
        then
        begin
          //어제날짜로 근태 코드를 찾았다.
          stATDate := FormatDateTime('yyyymmdd',dtYesterDay);
          stATCode := AttendCodeList.Strings[i];
          stInTime := aAccessTime;
          stOutTime := '';
          bResult := True;
          nResult := dmDBFunction.CheckTB_ATTENDEVENT_EmSeqATType(stATDate, aEmSeq,inttostr(AttendWorkTypeCode),TAttendCode(AttendCodeList.Objects[i]).ATCODE, stInTime, stOutTime);
          if nResult < 0 then Exit;
          if nResult = 1 then
          begin
            stATCode := TAttendCode(AttendCodeList.Objects[i]).ATCODE;
            //근태 데이터가 있으면 업데이트 할지를 판단하자.
            stATCode := TAttendCode(AttendCodeList.Objects[i]).ATCODE;
            nInsert := 1;
            if stInTime = '' then
            begin
              stInTime := aAccessTime;
            end else
            begin
              if aAccessTime < stInTime  then
              begin
                stInTime := aAccessTime;
              end else
              begin
                result := 1;
                Exit; //처리하지 말고 빠져 나가자.
              end;
            end;
            (*
            if stAWCode <> inttostr(AttendWorkTypeCode) then  //만약에 틀린경우 왜 틀렸는지 분석해 보자...
            begin
              stAWCode := inttostr(AttendWorkTypeCode);
              stATCode := AttendCodeList.Strings[i];
            end else
            begin
              if stATCode <> AttendCodeList.Strings[i] then stATCode := AttendCodeList.Strings[i];
            end;  *)
            break;
          end;
          nInsert := 0;
        end;
      end else
      begin
        bYesterDay := False;
        nWeekCode := DayOfWeek(dtPresent); //오늘 요일 체크 하여 출근 가능 시간을 가져 오자.
        if nWeekCode = 1 then  //일요일
        begin
          stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).HINFROMTIME;
          stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).HINTOTIME;
        end else if nWeekCode = 7 then //토요일
        begin
          stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).SINFROMTIME;
          stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).SINTOTIME;
        end else  //평일
        begin
          stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).INFROMTIME;
          stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).INTOTIME;
        end;
        if Not isDigit(stINFROMTIME) then continue;
        if Not isDigit(stINTOTIME) then continue;
        if ( (strtoint(stINFROMTIME) <= strtoint(stINTOTIME)) and  //퇴근가능시간이 출근가능시간보다 큰경우
             ((strtoint(stTime) >= strtoint(stINFROMTIME)) and
              (strtoint(stTime) <= strtoint(stINTOTIME)) ) ) or
           ( (strtoint(stINFROMTIME) > strtoint(stINTOTIME)) and   // 24시간을 넘어서 전일 오후 23시부터 새벽 2시인 경우
             ((strtoint(stTime) >= strtoint(stINFROMTIME)) or
              (strtoint(stTime) <= strtoint(stINTOTIME)) ) )
        then
        begin
          //오늘날짜로 근태 코드를 찾았다.
          stATDate := FormatDateTime('yyyymmdd',dtPresent);
          stATCode := AttendCodeList.Strings[i];
          stInTime := aAccessTime;
          stOutTime := '';
          bResult := True;
          break;
        end;
      end;
    end else  //퇴근,외출 복귀이면
    begin
      if strtoint(stTime) < strtoint(TAttendCode(AttendCodeList.Objects[i]).YESTERDAYTIME) then //현재시간이 어제 근무일자보다 작으면
      begin
        bYesterDay := True;
        stATDate := FormatDateTime('yyyymmdd',dtYesterDay);  //어제날짜의 근태내역을 찾는다.

        nResult := dmDBFunction.CheckTB_ATTENDEVENT_EmSeqATType(stATDate, aEmSeq,inttostr(AttendWorkTypeCode),TAttendCode(AttendCodeList.Objects[i]).ATCODE, stInTime, stOutTime);
        if nResult < 0 then Exit;
        if nResult = 1 then
        begin
          stATCode := TAttendCode(AttendCodeList.Objects[i]).ATCODE;
          nInsert := 1;
          if stOutTime = '' then
          begin
            stOutTime := aAccessTime;
          end else
          begin
            if (aAccessTime < stOutTime) then continue;  //오늘날짜의 다른 근태가 존재 하는지 찾아 봐야 함.
            stOutTime := aAccessTime;
          end;
          (*
          if stAWCode <> inttostr(AttendWorkTypeCode) then  //만약에 틀린경우 왜 틀렸는지 분석해 보자...
          begin
            stAWCode := inttostr(AttendWorkTypeCode);
            stATCode := AttendCodeList.Strings[i];
          end else
          begin
            if stATCode <> AttendCodeList.Strings[i] then stATCode := AttendCodeList.Strings[i];
          end;  *)
          bResult := True;
          break;
        end else  //어제날짜에 근태내역이 없어도 일단 셋팅해 놓는다.
        begin
          nInsert := 0;
          bTemp := True;    //임시저장하자.
          stOutTime := aAccessTime;
          stATCode := AttendCodeList.Strings[i];
          bResult := True;
        end;
      end else
      begin
        bYesterDay := False;
        stATDate := FormatDateTime('yyyymmdd',dtPresent);  //오늘날짜의 근태내역을 찾는다.
        nResult := dmDBFunction.CheckTB_ATTENDEVENT_EmSeqATType(stATDate, aEmSeq,inttostr(AttendWorkTypeCode),TAttendCode(AttendCodeList.Objects[i]).ATCODE, stInTime, stOutTime);
        if nResult < 0 then Exit;
        if nResult = 1 then
        begin
          stATCode := TAttendCode(AttendCodeList.Objects[i]).ATCODE;
          nInsert := 1;
          if stOutTime = '' then
          begin
            stOutTime := aAccessTime;
          end else
          begin
            if (aAccessTime < stOutTime) then
            begin
              result := 1;
              Exit;  //오늘날짜의 근태가 이미 생성 되어 있다.
            end;
            stOutTime := aAccessTime;
          end;
          (*
          if stAWCode <> inttostr(AttendWorkTypeCode) then  //만약에 틀린경우 왜 틀렸는지 분석해 보자...
          begin
            stAWCode := inttostr(AttendWorkTypeCode);
            stATCode := AttendCodeList.Strings[i];
          end else
          begin
            if stATCode <> AttendCodeList.Strings[i] then stATCode := AttendCodeList.Strings[i];
          end;  *)
          bResult := True;
          break;
        end else  //오늘날짜에 근태내역이 없으면서 어제 버퍼에 저장되어 있지 않은 경우 일단 셋팅해 놓는다.
        begin
          nInsert := 0;
          if Not bTemp then    //임시저장하자.
          begin
            stOutTime := aAccessTime;
            stATCode := AttendCodeList.Strings[i];
          end else
          begin
            bYesterDay := True;
            //어제 근태코드에 더 중점을 두자.
          end;
        end;
      end;
    end;
  end;

  if bYesterDay then
  begin
    stATDate := FormatDateTime('yyyymmdd',dtYesterDay);
    nWeekCode := DayOfWeek(dtYesterDay);
  end else
  begin
    stATDate := FormatDateTime('yyyymmdd',dtPresent);
    nWeekCode := DayOfWeek(dtPresent);
  end;

  if Not bResult then
  begin
    if stATCode = '' then stATCode := '1';
  end;

  stInResult := '';
  stOutResult := '';
  nIndex := AttendCodeList.IndexOf(stATCode);
  if nIndex < 0 then
  begin
    result := 0;
    Exit; //근태 코드를 찾지 못한 경우
  end;
  if nWeekCode = 1 then  //일요일
  begin
    stWorkStartTime := TAttendCode(AttendCodeList.Objects[nIndex]).HWORKSTARTTIME;
    stWorkEndTime  := TAttendCode(AttendCodeList.Objects[nIndex]).HWORKENDTIME;
    stExtendTime := TAttendCode(AttendCodeList.Objects[nIndex]).HEXTENDTIME;
    stNightTime := TAttendCode(AttendCodeList.Objects[nIndex]).HNIGHTTIME;
  end else if nWeekCode = 7 then //토요일
  begin
    stWorkStartTime := TAttendCode(AttendCodeList.Objects[nIndex]).SWORKSTARTTIME;
    stWorkEndTime  := TAttendCode(AttendCodeList.Objects[nIndex]).SWORKENDTIME;
    stExtendTime := TAttendCode(AttendCodeList.Objects[nIndex]).SEXTENDTIME;
    stNightTime := TAttendCode(AttendCodeList.Objects[nIndex]).SNIGHTTIME;
  end else  //평일
  begin
    stWorkStartTime := TAttendCode(AttendCodeList.Objects[nIndex]).WORKSTARTTIME;
    stWorkEndTime  := TAttendCode(AttendCodeList.Objects[nIndex]).WORKENDTIME;
    stExtendTime := TAttendCode(AttendCodeList.Objects[nIndex]).EXTENDTIME;
    stNightTime := TAttendCode(AttendCodeList.Objects[nIndex]).NIGHTTIME;
  end;

  if Not isDigit(stWorkStartTime) then stWorkStartTime := '2400';
  if Not isDigit(stWorkEndTime) then stWorkEndTime := '0000';

  if aATINOUTType = '1' then  //출근인경우  지각 유무 판단 하자.
  begin
    nJiGakCount := 0;
    if strtoint(stTime) <= strtoint(stWorkStartTime)  then stInResult := '1'
    else
    begin
      nJiGakCount := 1;
      stInResult := '2';
    end;
    nWorkCount := 1;
    bATWork := True;
    if isDigit(aATToDate) then
    begin
      if strtoint(aATToDate) < strtoint(stATDate)  then bATWork := False;
    end;
    if bATWork  then
    begin
      nResult := dmDBFunction.CheckTB_ATTENDEVENT_MasterWorkIn(stATDate, aEmSeq);
      if nResult < 0 then Exit;
      if nResult <> 1 then //사용자가 업데이트 한 내역이 없는 경우에만 처리하자.
      begin
        if nInsert = 0 then
          dmDBInsert.InsertIntoTB_ATTENDEVENT_WorkIn(stATDate, aEmSeq, aEmCode,
            aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
            stWorkEndTime, aAccessTime, stInResult, inttostr(nWorkCount),inttostr(nJiGakCount))
        else dmDBUpdate.UpdateTB_ATTENDEVENT_WorkIn(stATDate, aEmSeq,aEmCode,
            aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
            stWorkEndTime, aAccessTime, stInResult, inttostr(nWorkCount),inttostr(nJiGakCount));
      end;
      if Not aReSummary then
      begin
        if dmDBFunction.CheckTB_ATTENTEVENTLIST_Value(stATDate,aEmSeq,'1') = 1 then
            dmDBUpdate.UpdateTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'1',aEmCode,
            aEmName, aCompanyCode, stInResult, aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0')
        else
            dmDBInsert.InsertIntoTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'1',aEmCode,
            aEmName, aCompanyCode, stInResult, aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0');
      end;
    end;

  end else if aATINOUTType = '2' then //퇴근인 경우 조퇴유무 판단하자.
  begin
    nBeforWorkMM := 0;
    nBeforWorkCount := 0;
    nExtendWorkMM := 0;
    nNightWorkMM := 0;
    nExtendWorkCount := 0;
    nNightWorkCount := 0;
    nJoTaeCount := 0;
    stTime := FillZeroStrNum(stTime,4);
    //stTime :=copy(aAccessTime,9,4)
    if copy(stInTime,9,4) < stTime then stEndTime := stTime    //24시 지나기 전 퇴근이면
    else
    begin
      nTempTime := strtoint(copy(stTime,1,2));
      stEndTime := FillZeroNumber(nTempTime + 24,2) + copy(stTime,3,2);
    end;
    if isDigit(stInTime) then
    begin
      nWorkMM := MakeWorkTime_Minute(stEndTime,copy(stInTime,9,4),3);
    end;
    if strtoint(stEndTime) >= strtoint(stWorkEndTime)  then
    begin
      stOutResult := '11';    //퇴근
      if isDigit(stExtendTime) then
      begin
        if stWorkStartTime  < stExtendTime then    //연장 근무 시간이 24시 이전이면
        begin
          if strtoint(stEndTime) > strtoint(stExtendTime)  then //연장근무시간이 지났으면
          begin
            nExtendWorkMM := MakeWorkTime_Minute(stEndTime,stExtendTime,3);
            stOutResult := '13'; //연장근무
            nExtendWorkCount := 1;
          end;
        end else
        begin
          nTempTime := strtoint(copy(stExtendTime,1,2));
          stExtendTime := FillZeroNumber(nTempTime + 24,2) + copy(stExtendTime,3,2);
          if strtoint(stEndTime) > strtoint(stExtendTime)  then //연장근무시간이 지났으면
          begin
            nExtendWorkMM := MakeWorkTime_Minute(stEndTime,stExtendTime,3);
            stOutResult := '13'; //연장근무
            nExtendWorkCount := 1;
          end;
        end;
      end;
      if isDigit(stNightTime) then
      begin
        if stWorkStartTime  < stNightTime then    //야간 근무 시간이 24시 이전이면
        begin
          if strtoint(stEndTime) > strtoint(stNightTime)  then //야간근무시간이 지났으면
          begin
            nNightWorkMM := MakeWorkTime_Minute(stEndTime,stNightTime,3);
            stOutResult := '14'; //야간근무
            nExtendWorkCount := 0;
            nNightWorkCount := 1;
          end;
        end else
        begin
          nTempTime := strtoint(copy(stNightTime,1,2));
          stNightTime := FillZeroNumber(nTempTime + 24,2) + copy(stNightTime,3,2);
          if strtoint(stEndTime) > strtoint(stNightTime)  then //연장근무시간이 지났으면
          begin
            nExtendWorkMM := MakeWorkTime_Minute(stEndTime,stNightTime,3);
            stOutResult := '14'; //야간근무
            nExtendWorkCount := 0;
            nNightWorkCount := 1;
          end;
        end;
      end;
    end
    else
    begin
      nJoTaeCount := 1;
      stOutResult := '12'; //조퇴
    end;
    nWorkCount := 1;

    bATWork := True;
    if isDigit(aATToDate) then
    begin
      if strtoint(aATToDate) < strtoint(stATDate)  then bATWork := False;
    end;
    if bATWork  then
    begin
      nResult := dmDBFunction.CheckTB_ATTENDEVENT_MasterWorkOut(stATDate, aEmSeq);
      if nResult < 0 then Exit;
      if nResult <> 1 then //사용자가 업데이트 한 내역이 없는 경우에만 처리하자.
      begin
        if nInsert = 0 then
          dmDBInsert.InsertIntoTB_ATTENDEVENT_WorkOut(stATDate, aEmSeq,aEmCode,
              aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
              stWorkEndTime, aAccessTime, stOutResult,inttostr(nBeforWorkMM),inttostr(nWorkMM),inttostr(nExtendWorkMM),inttostr(nNightWorkMM),
              inttostr(nBeforWorkCount),inttostr(nWorkCount),inttostr(nJoTaeCount),inttostr(nExtendWorkCount),inttostr(nNightWorkCount))
        else
        dmDBUpdate.UpdateTB_ATTENDEVENT_WorkOut(stATDate, aEmSeq,aEmCode,
              aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
              stWorkEndTime, stOutTime, stOutResult,inttostr(nBeforWorkMM),inttostr(nWorkMM),inttostr(nExtendWorkMM),inttostr(nNightWorkMM),
              inttostr(nBeforWorkCount),inttostr(nWorkCount),inttostr(nJoTaeCount),inttostr(nExtendWorkCount),inttostr(nNightWorkCount));
      end;
      if Not aReSummary then
      begin
        if dmDBFunction.CheckTB_ATTENTEVENTLIST_Value(stATDate,aEmSeq,'2') = 1 then
            dmDBUpdate.UpdateTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'2',aEmCode,
            aEmName, aCompanyCode, stOutResult, aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0')
        else
            dmDBInsert.InsertIntoTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'2',aEmCode,
            aEmName, aCompanyCode, stOutResult, aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0');
      end;
    end;
  end else if aATINOUTType = '3' then //외출인 경우 업데이트만 하자
  begin
    nResult := dmDBFunction.CheckTB_ATTENDEVENT_MasterOutWork(stATDate, aEmSeq);
    if nResult < 0 then Exit;
    if nResult <> 1 then //사용자가 업데이트 한 내역이 없는 경우에만 처리하자.
    begin
      if nInsert = 0 then
        dmDBInsert.InsertIntoTB_ATTENDEVENT_OutWork(stATDate, aEmSeq, aEmCode,
          aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
          stWorkEndTime, aAccessTime, '1')
      else dmDBUpdate.UpdateTB_ATTENDEVENT_OutWork(stATDate, aEmSeq,aAccessTime, '1');
    end;
    if Not aReSummary then
    begin
      if dmDBFunction.CheckTB_ATTENTEVENTLIST_Value(stATDate,aEmSeq,'3') = 1 then
          dmDBUpdate.UpdateTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'3',aEmCode,
          aEmName, aCompanyCode, '21', aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0')
      else
          dmDBInsert.InsertIntoTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'3',aEmCode,
          aEmName, aCompanyCode, '21', aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0');
    end;
  end else if aATINOUTType = '4' then //복귀인 경우 업데이트만 하자
  begin
    nResult := dmDBFunction.CheckTB_ATTENDEVENT_MasterInWork(stATDate, aEmSeq);
    if nResult < 0 then Exit;
    if nResult <> 1 then //사용자가 업데이트 한 내역이 없는 경우에만 처리하자.
    begin
      if nInsert = 0 then
        dmDBInsert.InsertIntoTB_ATTENDEVENT_InWork(stATDate, aEmSeq, aEmCode,
          aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
          stWorkEndTime, aAccessTime, '1')
      else dmDBUpdate.UpdateTB_ATTENDEVENT_InWork(stATDate, aEmSeq,aAccessTime, '1');
    end;
    if Not aReSummary then
    begin
      if dmDBFunction.CheckTB_ATTENTEVENTLIST_Value(stATDate,aEmSeq,'4') = 1 then
          dmDBUpdate.UpdateTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'4',aEmCode,
          aEmName, aCompanyCode, '22', aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0')
      else
          dmDBInsert.InsertIntoTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'4',aEmCode,
          aEmName, aCompanyCode, '22', aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0');
    end;
  end;
(*  end else if aATINOUTType = '2' then //퇴근인 경우 조퇴유무 판단하자.
  begin
    nBeforWorkMM := 0;
    nBeforWorkCount := 0;
    nExtendWorkMM := 0;
    nNightWorkMM := 0;
    nExtendWorkCount := 0;
    nNightWorkCount := 0;
    nJoTaeCount := 0;
    if isDigit(stInTime) then
    begin
      nWorkMM := MakeWorkTime_Minute(stTime,stInTime,3);
    end;
    if strtoint(stTime) >= strtoint(stWorkEndTime)  then
    begin
      stOutResult := '11';    //퇴근
      if isDigit(stExtendTime) then
      begin
        if strtoint(stTime) > strtoint(stExtendTime)  then //연장근무시간이 지났으면
        begin
          nExtendWorkMM := MakeWorkTime_Minute(stTime,stExtendTime,3);
          stOutResult := '13'; //연장근무
          nExtendWorkCount := 1;
        end;
      end;
      if isDigit(stNightTime) then
      begin
        if strtoint(stTime) > strtoint(stNightTime)  then //야간근무시간이 지났으면
        begin
          nNightWorkMM := MakeWorkTime_Minute(stTime,stNightTime,3);
          stOutResult := '14'; //야간근무
          nExtendWorkCount := 0;
          nNightWorkCount := 1;
        end;
      end;
    end
    else
    begin
      nJoTaeCount := 1;
      stOutResult := '12'; //조퇴
    end;
    nWorkCount := 1;
    if nInsert = 0 then
      dmDBInsert.InsertIntoTB_ATTENDEVENT_WorkOut(stATDate, aEmSeq,aEmCode,
          aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
          stWorkEndTime, aAccessTime, stOutResult,inttostr(nBeforWorkMM),inttostr(nWorkMM),inttostr(nExtendWorkMM),inttostr(nNightWorkMM),
          inttostr(nBeforWorkCount),inttostr(nWorkCount),inttostr(nJoTaeCount),inttostr(nExtendWorkCount),inttostr(nNightWorkCount))
    else
    dmDBUpdate.UpdateTB_ATTENDEVENT_WorkOut(stATDate, aEmSeq,aEmCode,
          aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
          stWorkEndTime, stOutTime, stOutResult,inttostr(nBeforWorkMM),inttostr(nWorkMM),inttostr(nExtendWorkMM),inttostr(nNightWorkMM),
          inttostr(nBeforWorkCount),inttostr(nWorkCount),inttostr(nJoTaeCount),inttostr(nExtendWorkCount),inttostr(nNightWorkCount));
    if dmDBFunction.CheckTB_ATTENTEVENTLIST_Value(stATDate,aEmSeq,'2') = 1 then
        dmDBUpdate.UpdateTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'2',aEmCode,
        aEmName, aCompanyCode, stOutResult, aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0')
    else
        dmDBInsert.InsertIntoTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'2',aEmCode,
        aEmName, aCompanyCode, stOutResult, aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0');
  end else if aATINOUTType = '3' then //외출인 경우 업데이트만 하자
  begin
    if nInsert = 0 then
      dmDBInsert.InsertIntoTB_ATTENDEVENT_OutWork(stATDate, aEmSeq, aEmCode,
        aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
        stWorkEndTime, aAccessTime, '1')
    else dmDBUpdate.UpdateTB_ATTENDEVENT_OutWork(stATDate, aEmSeq,aAccessTime, '1');
    if dmDBFunction.CheckTB_ATTENTEVENTLIST_Value(stATDate,aEmSeq,'3') = 1 then
        dmDBUpdate.UpdateTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'3',aEmCode,
        aEmName, aCompanyCode, '21', aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0')
    else
        dmDBInsert.InsertIntoTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'3',aEmCode,
        aEmName, aCompanyCode, '21', aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0');
  end else if aATINOUTType = '4' then //복귀인 경우 업데이트만 하자
  begin
    if nInsert = 0 then
      dmDBInsert.InsertIntoTB_ATTENDEVENT_InWork(stATDate, aEmSeq, aEmCode,
        aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
        stWorkEndTime, aAccessTime, '1')
    else dmDBUpdate.UpdateTB_ATTENDEVENT_InWork(stATDate, aEmSeq,aAccessTime, '1');
    if dmDBFunction.CheckTB_ATTENTEVENTLIST_Value(stATDate,aEmSeq,'4') = 1 then
        dmDBUpdate.UpdateTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'4',aEmCode,
        aEmName, aCompanyCode, '22', aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0')
    else
        dmDBInsert.InsertIntoTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'4',aEmCode,
        aEmName, aCompanyCode, '22', aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0');
  end;   *)
  result := 1;
end;

procedure TdmAttendEvent.StringListClear;
var
  i : integer;
begin
  if AttendCodeList.Count > 0 then
  begin
    for i := AttendCodeList.Count - 1 downto 0 do
    begin
      TAttendCode(AttendCodeList.Objects[i]).Free;
    end;
    AttendCodeList.Clear;
  end;
end;

function TdmAttendEvent.UpdateTypeAttendProcess(aEmSeq, aEMCODE, aEMNAME,
  aCOMPANYCODE, aAccessTime, aAtReaderNo, aDOORNO, aCARDNO, aCONTROLTYPECODE,
  aBUTTON, aDEVICETYPE, aSTARTBUTTON, aOFFBUTTON, aINOUTDEVICETYPE,
  aWORKOUTBUTTON, aWORKINBUTTON,aATToDate: string;aReSummary:Boolean): integer;
var
  i : integer;
  stTime : string;
  bYesterDay : Boolean;
  wYear    : word;
  wMonth   : word;
  wDay     : word;
  wHour    : word;
  wMinute  : word;
  wSecond  : word;
  dtPresent: TDatetime;
  dtYesterDay : TDatetime;
  nWeekCode : integer;
  stINFROMTIME : string;
  stINTOTIME : string;
  bATWork : Boolean;

  stATDate : string;
  stATCode, stInTime, stOutTime : string;
  stATINOUTType : string; //근태타입 '1'.출근,'2'.퇴근,'3'.외출,'4'.복귀
  nInsert : Integer;
  nIndex : integer;
  stWorkStartTime,stWorkEndTime:string;
  stExtendTime,stNightTime:string;
  stInResult,stOutResult : string;
  nBeforWorkMM : integer;
  nWorkMM : integer;
  nExtendWorkMM : integer;
  nNightWorkMM : integer;
  nBeforWorkCount : integer;
  nWorkCount : integer;
  nExtendWorkCount : integer;
  nNightWorkCount : integer;
  nJiGakCount : integer;
  nJoTaeCount : integer;
  nTemp1,nTemp2 : integer;
  stNodeNo,stEcuID,stExtendID,stReaderNo : string;
  stEndTime : string;
  nTempTime : integer;
  nResult :integer;
  bResult : Boolean;
begin
  bResult := False;
  nResult := -1;
  nInsert := -1;
  result := -1;
  stATINOUTType := '';
  stNodeNo := copy(aAtReaderNo,1,G_nNodeCodeLength);
  stEcuID := copy(aAtReaderNo,1 + G_nNodeCodeLength,2);
  stExtendID := copy(aAtReaderNo,1 + G_nNodeCodeLength + 2 ,1);
  stReaderNo := copy(aAtReaderNo,1 + G_nNodeCodeLength + 2 + 1,1);

  if AttendCodeList.Count < 1 then
  begin
    result := 0;
    Exit;
  end;

  wYear  := StrtoInt(Copy(aAccessTime,1,4));
  wMonth := StrtoInt(Copy(aAccessTime,5,2));
  wDay   := StrtoInt(Copy(aAccessTime,7,2));
  wHour  := StrtoInt(Copy(aAccessTime,9,2));
  wMinute:= StrtoInt(Copy(aAccessTime,11,2));
  wSecond:= StrtoInt(Copy(aAccessTime,13,2));
  dtPresent:= EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, wSecond,00);
  dtYesterDay := dtPresent - 1;

  stTime := copy(aAccessTime,9,4);
  for i := 0 to AttendCodeList.Count - 1 do
  begin
    bYesterDay := False;
    if strtoint(stTime) < strtoint(TAttendCode(AttendCodeList.Objects[i]).YESTERDAYTIME) then
    begin
      bYesterDay := True;
      nWeekCode := DayOfWeek(dtYesterDay); //요일 체크 하여 출근 가능 시간을 가져 오자.
      if nWeekCode = 1 then  //일요일
      begin
        stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).HINFROMTIME;
        stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).HINTOTIME;
      end else if nWeekCode = 7 then //토요일
      begin
        stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).SINFROMTIME;
        stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).SINTOTIME;
      end else  //평일
      begin
        stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).INFROMTIME;
        stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).INTOTIME;
      end;
      if Not isDigit(stINFROMTIME) then stINFROMTIME := '0000';
      if Not isDigit(stINTOTIME) then stINTOTIME := '2400';

      if ( (strtoint(stINFROMTIME) <= strtoint(stINTOTIME)) and  //퇴근가능시간이 출근가능시간보다 큰경우
           ((strtoint(stTime) >= strtoint(stINFROMTIME)) and
            (strtoint(stTime) <= strtoint(stINTOTIME)) ) ) or
         ( (strtoint(stINFROMTIME) > strtoint(stINTOTIME)) and   // 24시간을 넘어서 전일 오후 23시부터 새벽 2시인 경우
           ((strtoint(stTime) >= strtoint(stINFROMTIME)) or
            (strtoint(stTime) <= strtoint(stINTOTIME)) ) )
      then
      begin
        //출근가능 시간대이다.
        bResult := True;
        stATDate := FormatDateTime('yyyymmdd',dtYesterDay);
        nResult := dmDBFunction.CheckTB_ATTENDEVENT_EmSeqATType(stATDate, aEmSeq,inttostr(AttendWorkTypeCode),TAttendCode(AttendCodeList.Objects[i]).ATCODE, stInTime, stOutTime);
        if nResult < 0 then  Exit;
        if nResult = 1 then
        begin
          stATCode := TAttendCode(AttendCodeList.Objects[i]).ATCODE;
          //근태 데이터가 있으면 출근인지 퇴근인지 판별하자. - 어제는 퇴근만 존재 한다.
          nInsert := 1;
          if stInTime = '' then
          begin
            stInTime := aAccessTime;
            stATINOUTType := '1';
            bYesterDay := False;
          end else
          begin
            if aAccessTime < stInTime  then
            begin
              stInTime := aAccessTime;
              stATINOUTType := '1';
              bYesterDay := False;
            end else
            begin
              if stOutTime = '' then
              begin
                stOutTime := aAccessTime;
                stATINOUTType := '2';
              end else
              begin
                if aAccessTime < stOutTime then
                begin
                  result := 1;
                  Exit;   //처리하지 말고 빠져 나가자. 이미  결론이 난 출퇴근 시간 중 중간 데이터이므로
                end;
                stOutTime := aAccessTime;
                stATINOUTType := '2';
              end;
            end;
          end;
          (*
          if stAWCode <> inttostr(AttendWorkTypeCode) then  //만약에 틀린경우 왜 틀렸는지 분석해 보자...
          begin
            stAWCode := inttostr(AttendWorkTypeCode);
            stATCode := AttendCodeList.Strings[i];
          end else
          begin
            if stATCode <> AttendCodeList.Strings[i] then stATCode := AttendCodeList.Strings[i];
          end; *)
          bResult := True;
          break;
        end else
        begin
          //어제날짜의 출근은 없다
          //출근이다.
          //nInsert := 0;
          //stAWCode := inttostr(AttendWorkTypeCode);
          //stATCode := AttendCodeList.Strings[i];
          //stInTime := aAccessTime;
          //stOutTime := '';
          //stATINOUTType := '1';
          //bYesterDay := False;
        end;
      end else
      begin
        //퇴근만 가능한 시간대이다.
        stATDate := FormatDateTime('yyyymmdd',dtYesterDay);
        //어제 내역에 출근한 내역이 있으면 퇴근으로 처리 하고 없으면 다음 근태코드를 찾는다.
        nResult := dmDBFunction.CheckTB_ATTENDEVENT_EmSeqATType(stATDate, aEmSeq,inttostr(AttendWorkTypeCode),TAttendCode(AttendCodeList.Objects[i]).ATCODE, stInTime, stOutTime);
        if nResult < 0 then Exit;

        if nResult = 1 then
        begin
          stATCode := TAttendCode(AttendCodeList.Objects[i]).ATCODE;
          if stOutTime = '' then
          begin
            stOutTime := aAccessTime;
            stATINOUTType := '2';
          end else
          begin
            if aAccessTime < stOutTime then
            begin
              result := 1;
              Exit;   //처리하지 말고 빠져 나가자. 이미  결론이 난 출퇴근 시간 중 중간 데이터이므로
            end;
            stOutTime := aAccessTime;
            stATINOUTType := '2';
          end;
          (*
          if stAWCode <> inttostr(AttendWorkTypeCode) then  //만약에 틀린경우 왜 틀렸는지 분석해 보자...
          begin
            stAWCode := inttostr(AttendWorkTypeCode);
            stATCode := AttendCodeList.Strings[i];
          end else
          begin
            //if stATCode <> AttendCodeList.Strings[i] then stATCode := AttendCodeList.Strings[i];
          end; *)
          nInsert := 1;
          bResult := True;
          break;
        end;
      end;
    end;
  end;
  if Not bResult then  //어제 근무가 아닌 오늘 근무이다.
  begin
    stATDate := FormatDateTime('yyyymmdd',dtPresent); //근태일자는 오늘이다.
    nWeekCode := DayOfWeek(dtPresent); //요일 체크 하여 출근 가능 시간을 가져 오자.
    for i := 0 to AttendCodeList.Count - 1 do
    begin
      if nWeekCode = 1 then  //일요일
      begin
        stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).HINFROMTIME;
        stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).HINTOTIME;
      end else if nWeekCode = 7 then //토요일
      begin
        stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).SINFROMTIME;
        stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).SINTOTIME;
      end else  //평일
      begin
        stINFROMTIME := TAttendCode(AttendCodeList.Objects[i]).INFROMTIME;
        stINTOTIME := TAttendCode(AttendCodeList.Objects[i]).INTOTIME;
      end;
      if Not isDigit(stINFROMTIME) then stINFROMTIME := '0000';
      if Not isDigit(stINTOTIME) then stINTOTIME := '2400';

      if ( (strtoint(stINFROMTIME) <= strtoint(stINTOTIME)) and  //퇴근가능시간이 출근가능시간보다 큰경우
           ((strtoint(stTime) >= strtoint(stINFROMTIME)) and
            (strtoint(stTime) <= strtoint(stINTOTIME)) ) ) or
         ( (strtoint(stINFROMTIME) > strtoint(stINTOTIME)) and   // 24시간을 넘어서 전일 오후 23시부터 새벽 2시인 경우
           ((strtoint(stTime) >= strtoint(stINFROMTIME)) or
            (strtoint(stTime) <= strtoint(stINTOTIME)) ) )
      then
      begin
        //출근가능 시간대이다.
        nResult := dmDBFunction.CheckTB_ATTENDEVENT_EmSeqATType(stATDate, aEmSeq,inttostr(AttendWorkTypeCode),TAttendCode(AttendCodeList.Objects[i]).ATCODE, stInTime, stOutTime);
        if nResult < 0 then Exit;
        if nResult = 1 then
        begin
          stATCode := TAttendCode(AttendCodeList.Objects[i]).ATCODE;
          //근태 데이터가 있으면 출근인지 퇴근인지 판별하자.
          nInsert := 1;
          if stInTime = '' then
          begin
            stInTime := aAccessTime;
            stATINOUTType := '1';
          end else
          begin
            if aAccessTime < stInTime  then
            begin
              stInTime := aAccessTime;
              stATINOUTType := '1';
            end else
            begin
              if stOutTime = '' then
              begin
                stOutTime := aAccessTime;
                stATINOUTType := '2';
              end else
              begin
                if aAccessTime < stOutTime then
                begin
                  result := 1;
                  Exit;   //처리하지 말고 빠져 나가자. 이미  결론이 난 출퇴근 시간 중 중간 데이터이므로
                end;
                stOutTime := aAccessTime;
                stATINOUTType := '2';
              end;
            end;
          end;
          (*
          if stAWCode <> inttostr(AttendWorkTypeCode) then  //만약에 틀린경우 왜 틀렸는지 분석해 보자...
          begin
            stAWCode := inttostr(AttendWorkTypeCode);
            stATCode := AttendCodeList.Strings[i];
          end else
          begin
            //if stATCode <> AttendCodeList.Strings[i] then stATCode := AttendCodeList.Strings[i];
          end; *)
        end else
        begin
          //출근이다.
          nInsert := 0;
          stATCode := AttendCodeList.Strings[i];
          stInTime := aAccessTime;
          stOutTime := '';
          stATINOUTType := '1';
        end;
        bResult := True;
        break;
      end else
      begin
        //퇴근만 가능한 시간대이다.
        nResult := dmDBFunction.CheckTB_ATTENDEVENT_EmSeqATType(stATDate, aEmSeq,inttostr(AttendWorkTypeCode),TAttendCode(AttendCodeList.Objects[i]).ATCODE, stInTime, stOutTime);
        if nResult < 0 then Exit; //Select 에러시 작업 취소 후 재작업 하자.
        if nResult = 1 then
        begin
            stATCode := TAttendCode(AttendCodeList.Objects[i]).ATCODE;
            //오늘날짜의 출근 내역이 있으면 오늘날짜의 퇴근으로 처리 하wk
            if stOutTime = '' then
            begin
              stOutTime := aAccessTime;
              stATINOUTType := '2';
            end else
            begin
              if aAccessTime < stOutTime then
              begin
                result := 1;
                Exit;   //처리하지 말고 빠져 나가자. 이미  결론이 난 출퇴근 시간 중 중간 데이터이므로
              end;
              stOutTime := aAccessTime;
              stATINOUTType := '2';
            end;
            (*
            if stAWCode <> inttostr(AttendWorkTypeCode) then  //만약에 틀린경우 왜 틀렸는지 분석해 보자...
            begin
              stAWCode := inttostr(AttendWorkTypeCode);
              stATCode := AttendCodeList.Strings[i];
            end else
            begin
              //if stATCode <> AttendCodeList.Strings[i] then stATCode := AttendCodeList.Strings[i];
            end; *)
            nInsert := 0;
            bResult := True;
            break;
        end else
        begin
          (*
          stATDate := FormatDateTime('yyyymmdd',dtYesterDay);
          //어제 내역에 출근한 내역이 있으면 퇴근으로 처리 하고 없으면 다음 근태코드를 찾는다.
          if dmDBFunction.CheckTB_ATTENDEVENT_EmSeqATType(stATDate, aEmSeq,TAttendCode(AttendCodeList.Objects[i]).ATCODE,stAWCode,stATCode, stInTime, stOutTime) = 1 then
          begin
            stATCode := TAttendCode(AttendCodeList.Objects[i]).ATCODE;
            if stOutTime = '' then
            begin
              stOutTime := aAccessTime;
              stATINOUTType := '2';
            end else
            begin
              if aAccessTime < stOutTime then Exit;   //처리하지 말고 빠져 나가자. 이미  결론이 난 출퇴근 시간 중 중간 데이터이므로
              stOutTime := aAccessTime;
              stATINOUTType := '2';
            end;
            if stAWCode <> inttostr(AttendWorkTypeCode) then  //만약에 틀린경우 왜 틀렸는지 분석해 보자...
            begin
              stAWCode := inttostr(AttendWorkTypeCode);
              stATCode := AttendCodeList.Strings[i];
            end else
            begin
              if stATCode <> AttendCodeList.Strings[i] then stATCode := AttendCodeList.Strings[i];
            end;
            nInsert := 0;
            break;
          end;
          *)
        end;
      end;
    end;
  end;
  if Not bResult then
  begin
    stInTime := aAccessTime;
    stOutTime := '';
    stATINOUTType := '1';
    stATCode := '1';
    //못찾으면 오늘날짜의 출근 시간으로 그냥 입력하자.
    //Exit;//오늘근무나 어제 근무에서 찾지 못한 경우
  end;
  stInResult := '';
  stOutResult := '';
  nIndex := AttendCodeList.IndexOf(stATCode);
  if nIndex < 0 then
  begin
    result := 0;
    Exit; //근태 코드를 찾지 못한 경우
  end;
  if nWeekCode = 1 then  //일요일
  begin
    stWorkStartTime := TAttendCode(AttendCodeList.Objects[nIndex]).HWORKSTARTTIME;
    stWorkEndTime  := TAttendCode(AttendCodeList.Objects[nIndex]).HWORKENDTIME;
    stExtendTime := TAttendCode(AttendCodeList.Objects[nIndex]).HEXTENDTIME;
    stNightTime := TAttendCode(AttendCodeList.Objects[nIndex]).HNIGHTTIME;
  end else if nWeekCode = 7 then //토요일
  begin
    stWorkStartTime := TAttendCode(AttendCodeList.Objects[nIndex]).SWORKSTARTTIME;
    stWorkEndTime  := TAttendCode(AttendCodeList.Objects[nIndex]).SWORKENDTIME;
    stExtendTime := TAttendCode(AttendCodeList.Objects[nIndex]).SEXTENDTIME;
    stNightTime := TAttendCode(AttendCodeList.Objects[nIndex]).SNIGHTTIME;
  end else  //평일
  begin
    stWorkStartTime := TAttendCode(AttendCodeList.Objects[nIndex]).WORKSTARTTIME;
    stWorkEndTime  := TAttendCode(AttendCodeList.Objects[nIndex]).WORKENDTIME;
    stExtendTime := TAttendCode(AttendCodeList.Objects[nIndex]).EXTENDTIME;
    stNightTime := TAttendCode(AttendCodeList.Objects[nIndex]).NIGHTTIME;
  end;

  if Not isDigit(stWorkStartTime) then stWorkStartTime := '2400';
  if Not isDigit(stWorkEndTime) then stWorkEndTime := '0000';


  if stATINOUTType = '1' then  //출근인경우  지각 유무 판단 하자.
  begin
    nJiGakCount := 0;
    if strtoint(stTime) <= strtoint(stWorkStartTime)  then stInResult := '1'
    else
    begin
      nJiGakCount := 1;
      stInResult := '2';
    end;
    nWorkCount := 1;

    bATWork := True;
    if isDigit(aATToDate) then
    begin
      if strtoint(aATToDate) < strtoint(stATDate)  then bATWork := False;
    end;
    if bATWork  then
    begin
      nResult := dmDBFunction.CheckTB_ATTENDEVENT_MasterWorkIn(stATDate, aEmSeq);
      if nResult < 0 then Exit;
      if nResult <> 1 then //사용자가 업데이트 한 내역이 없는 경우에만 처리하자.
      begin
        if nInsert = 0 then
          dmDBInsert.InsertIntoTB_ATTENDEVENT_WorkIn(stATDate, aEmSeq, aEmCode,
            aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
            stWorkEndTime, aAccessTime, stInResult, inttostr(nWorkCount),inttostr(nJiGakCount))
        else dmDBUpdate.UpdateTB_ATTENDEVENT_WorkIn(stATDate, aEmSeq,aEmCode,
            aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
            stWorkEndTime, aAccessTime, stInResult, inttostr(nWorkCount),inttostr(nJiGakCount));
      end;
      if Not aReSummary then
      begin
        if dmDBFunction.CheckTB_ATTENTEVENTLIST_Value(stATDate,aEmSeq,'1') = 1 then
            dmDBUpdate.UpdateTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'1',aEmCode,
            aEmName, aCompanyCode, stInResult, aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0')
        else
            dmDBInsert.InsertIntoTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'1',aEmCode,
            aEmName, aCompanyCode, stInResult, aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0');
      end;
    end;
  end else if stATINOUTType = '2' then //퇴근인 경우 조퇴유무 판단하자.
  begin
    nBeforWorkMM := 0;
    nBeforWorkCount := 0;
    nExtendWorkMM := 0;
    nNightWorkMM := 0;
    nExtendWorkCount := 0;
    nNightWorkCount := 0;
    nJoTaeCount := 0;
    stTime := FillZeroStrNum(stTime,4);
    //stTime :=copy(aAccessTime,9,4)
    if copy(stInTime,9,4) < stTime then stEndTime := stTime    //24시 지나기 전 퇴근이면
    else                                                       //새벽 퇴근이면
    begin
      nTempTime := strtoint(copy(stTime,1,2));
      stEndTime := FillZeroNumber(nTempTime + 24,2) + copy(stTime,3,2);
    end;
    if isDigit(stInTime) then
    begin
      nWorkMM := MakeWorkTime_Minute(stEndTime,copy(stInTime,9,4),3);
    end;
    if strtoint(stEndTime) >= strtoint(stWorkEndTime)  then
    begin
      stOutResult := '11';    //퇴근
      if isDigit(stExtendTime) then
      begin
        if stWorkStartTime  < stExtendTime then    //연장 근무 시간이 24시 이전이면
        begin
          if strtoint(stEndTime) > strtoint(stExtendTime)  then //연장근무시간이 지났으면
          begin
            nExtendWorkMM := MakeWorkTime_Minute(stEndTime,stExtendTime,3);
            stOutResult := '13'; //연장근무
            nExtendWorkCount := 1;
          end;
        end else
        begin
          nTempTime := strtoint(copy(stExtendTime,1,2));
          stExtendTime := FillZeroNumber(nTempTime + 24,2) + copy(stExtendTime,3,2);
          if strtoint(stEndTime) > strtoint(stExtendTime)  then //연장근무시간이 지났으면
          begin
            nExtendWorkMM := MakeWorkTime_Minute(stEndTime,stExtendTime,3);
            stOutResult := '13'; //연장근무
            nExtendWorkCount := 1;
          end;
        end;
      end;
      if isDigit(stNightTime) then
      begin
        if stWorkStartTime < stNightTime then    //야간 근무 시간이 24시 이전이면
        begin
          if strtoint(stEndTime) > strtoint(stNightTime)  then //야간근무시간이 지났으면
          begin
            nNightWorkMM := MakeWorkTime_Minute(stEndTime,stNightTime,3);
            stOutResult := '14'; //야간근무
            nExtendWorkCount := 0;
            nNightWorkCount := 1;
          end;
        end else
        begin
          nTempTime := strtoint(copy(stNightTime,1,2));
          stNightTime := FillZeroNumber(nTempTime + 24,2) + copy(stNightTime,3,2);
          if strtoint(stEndTime) > strtoint(stNightTime)  then //연장근무시간이 지났으면
          begin
            nExtendWorkMM := MakeWorkTime_Minute(stEndTime,stNightTime,3);
            stOutResult := '14'; //야간근무
            nExtendWorkCount := 0;
            nNightWorkCount := 1;
          end;
        end;
      end;
    end
    else
    begin
      nJoTaeCount := 1;
      stOutResult := '12'; //조퇴
    end;
    nWorkCount := 1;

    bATWork := True;
    if isDigit(aATToDate) then
    begin
      if strtoint(aATToDate) < strtoint(stATDate)  then bATWork := False;
    end;
    if bATWork  then
    begin
      nResult := dmDBFunction.CheckTB_ATTENDEVENT_MasterWorkOut(stATDate, aEmSeq);
      if nResult < 0 then Exit;
      if nResult <> 1 then //사용자가 업데이트 한 내역이 없는 경우에만 처리하자.
      begin
        //업데이트 방식에서는 퇴근은 업데이트만 존재 한다.
        dmDBUpdate.UpdateTB_ATTENDEVENT_WorkOut(stATDate, aEmSeq,aEmCode,
              aEmName, aCompanyCode, inttostr(AttendWorkTypeCode), stATCode, inttostr(nWeekCode), stWorkStartTime,
              stWorkEndTime, stOutTime, stOutResult,inttostr(nBeforWorkMM),inttostr(nWorkMM),inttostr(nExtendWorkMM),inttostr(nNightWorkMM),
              inttostr(nBeforWorkCount),inttostr(nWorkCount),inttostr(nJoTaeCount),inttostr(nExtendWorkCount),inttostr(nNightWorkCount));
      end;
      if Not aReSummary then
      begin
        if dmDBFunction.CheckTB_ATTENTEVENTLIST_Value(stATDate,aEmSeq,'2') = 1 then
            dmDBUpdate.UpdateTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'2',aEmCode,
            aEmName, aCompanyCode, stOutResult, aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0')
        else
            dmDBInsert.InsertIntoTB_ATTENDEVENTLIST_Work(stATDate, aEmSeq,'2',aEmCode,
            aEmName, aCompanyCode, stOutResult, aAccessTime,stNodeNo,stEcuID,stExtendID,aDoorNo,stReaderNo,aBUTTON,'0');
      end;
    end;
  end;
  result := 1;
end;

end.
