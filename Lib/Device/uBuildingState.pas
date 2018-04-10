unit uBuildingState;

interface
uses  System.Classes,System.SysUtils,
      uDeviceEvent,uDeviceVariable;
type
  TBuildingState = Class(TComponent)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    BuildingDoorList : TStringList;
    BuildingAlarmAreaList : TStringList;
  private
    FBuildingName: string;
    FBuildingCode: string;
    FBuildingAlaramMode: TWatchMode;
    FBuildingAlaramEvent: TAlarmEventState;
    FOnBuildingAlarmEventState: TBuildingAlarmEventStateChange;
    procedure SetBuildingAlaramMode(const Value: TWatchMode);
    procedure SetBuildingAlaramEvent(const Value: TAlarmEventState);
  public
    procedure AlarmEventStateRefresh;
    procedure BuildingAlarmAreaAdd(aNodeNo,aEcuID,aAlarmArea:string);
    procedure BuildingDoorAdd(aNodeNo,aEcuID,aDoorNo:string);
  public
    property OnBuildingAlarmEventState : TBuildingAlarmEventStateChange read FOnBuildingAlarmEventState write FOnBuildingAlarmEventState;
  public
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property BuildingName : string read FBuildingName write FBuildingName;
    property BuildingAlaramMode : TWatchMode read FBuildingAlaramMode write SetBuildingAlaramMode;
    property BuildingAlaramEvent : TAlarmEventState read FBuildingAlaramEvent write SetBuildingAlaramEvent;
  end;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDeviceState;

{ TBuildingState }

procedure TBuildingState.AlarmEventStateRefresh;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
  stAlarmArea : string;
  nNodeIndex : integer;
  stTempState : TAlarmEventState;
begin
  if BuildingAlarmAreaList.Count < 1 then Exit;
  stTempState := aeNothing;
  for i := 0 to BuildingAlarmAreaList.Count - 1 do
  begin
    stNodeNo := copy(BuildingAlarmAreaList.Strings[i],1,G_nNodeCodeLength);
    stEcuID :=  copy(BuildingAlarmAreaList.Strings[i],G_nNodeCodeLength + 1,2);
    stAlarmArea :=  copy(BuildingAlarmAreaList.Strings[i],G_nNodeCodeLength + 2 + 1,1);
    nNodeIndex := NODESTATELIST.IndexOf(stNodeNo);
    if nNodeIndex > -1 then
    begin
      if TNodeState(NodeStateList.Objects[nNodeIndex]).GetAlarmAreaAlarmEvent(stEcuID,stAlarmArea) = aeNormal then
      begin
        if stTempState = aeNothing then stTempState := aeNormal;
      end else if TNodeState(NodeStateList.Objects[nNodeIndex]).GetAlarmAreaAlarmEvent(stEcuID,stAlarmArea) = aeNormalEvent then
      begin
        if stTempState <> aeAlarmEvent then stTempState := aeNormalEvent;
      end else if TNodeState(NodeStateList.Objects[nNodeIndex]).GetAlarmAreaAlarmEvent(stEcuID,stAlarmArea) = aeAlarmEvent then
      begin
        stTempState := aeAlarmEvent;
      end;
    end;
    BuildingAlaramEvent := stTempState;
  end;
end;

procedure TBuildingState.BuildingAlarmAreaAdd(aNodeNo, aEcuID,
  aAlarmArea: string);
var
  stAlarmAreaCode : string;
  nIndex : integer;
begin
  stAlarmAreaCode := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aAlarmArea;
  nIndex := BuildingAlarmAreaList.IndexOf(stAlarmAreaCode);
  if nIndex < 0 then BuildingAlarmAreaList.Add(stAlarmAreaCode);
end;

procedure TBuildingState.BuildingDoorAdd(aNodeNo, aEcuID, aDoorNo: string);
var
  stDoorCode : string;
  nIndex : integer;
begin
  stDoorCode := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aDoorNo;
  nIndex := BuildingDoorList.IndexOf(stDoorCode);
  if nIndex < 0 then BuildingDoorList.Add(stDoorCode);
end;

constructor TBuildingState.Create(AOwner: TComponent);
begin
  inherited;
  BuildingDoorList := TStringList.Create;
  BuildingAlarmAreaList := TStringList.Create;
end;

destructor TBuildingState.Destroy;
begin
  BuildingDoorList.Free;
  BuildingAlarmAreaList.Free;
  inherited;
end;

procedure TBuildingState.SetBuildingAlaramEvent(const Value: TAlarmEventState);
begin
  if FBuildingAlaramEvent = Value then Exit;

  FBuildingAlaramEvent := Value;
  if Assigned(FOnBuildingAlarmEventState) then
  begin
    OnBuildingAlarmEventState(self,BuildingCode,Value);
  end;
end;

procedure TBuildingState.SetBuildingAlaramMode(const Value: TWatchMode);
begin
  FBuildingAlaramMode := Value;
end;

end.
