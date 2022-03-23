unit Model.Validacao.Command;

interface

uses
  Model.Validacao.Interfaces,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections;

type
  TModelValidationCommand = class(TInterfacedObject, iModelValidationCommand)
    private
      FOnChangeList : TDictionary<TObject, TList<TProc<TObject>>>;
      FOnExitList : TDictionary<TObject, TList<TProc<TObject>>>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelValidationCommand;
      function AddChangeEvent ( aComponent : TComponent; aEvent : TProc<TObject> ) : iModelValidationCommand;
      function AddExitEvent ( aComponent : TComponent; aEvent : TProc<TObject> ) : iModelValidationCommand;
      function onChangeList : TDictionary<TObject, TList<TProc<TObject>>>;
      function onExitList : TDictionary<TObject, TList<TProc<TObject>>>;
  end;

var
  vValidationCommand : iModelValidationCommand;

implementation

{ TValidationCommand }

function TModelValidationCommand.AddChangeEvent(aComponent: TComponent;
  aEvent: TProc<TObject>): iModelValidationCommand;
var
  aList : TList<TProc<TObject>>;
begin
  Result := Self;
  if not FOnChangeList.TryGetValue(TObject(aComponent), aList) then
  begin
    aList := TList<TProc<TObject>>.Create;
    FOnChangeList.Add(TObject(aComponent), aList);
  end;
  aList.Add(aEvent);
end;

function TModelValidationCommand.AddExitEvent(aComponent: TComponent;
  aEvent: TProc<TObject>): iModelValidationCommand;
var
  aList : TList<TProc<TObject>>;
begin
  Result := Self;
  if not FOnExitList.TryGetValue(TObject(aComponent), aList) then
  begin
    aList := TList<TProc<TObject>>.Create;
    FOnExitList.Add(TObject(aComponent), aList);
  end;
  aList.Add(aEvent);
end;

constructor TModelValidationCommand.Create;
begin
  FOnChangeList := TDictionary<TObject, TList<TProc<TObject>>>.Create;
  FOnExitList := TDictionary<TObject, TList<TProc<TObject>>>.Create;
end;

destructor TModelValidationCommand.Destroy;
var
  aList : TList<TProc<TObject>>;
begin
  for aList in FOnChangeList.Values do
    aList.Free;

  for aList in FOnExitList.Values do
    aList.Free;

  FOnChangeList.Free;
  FOnExitList.Free;
  inherited;
end;

class function TModelValidationCommand.New: iModelValidationCommand;
begin
  if not Assigned(vValidationCommand) then
    vValidationCommand := Self.Create;

  Result := vValidationCommand;
end;

function TModelValidationCommand.onChangeList: TDictionary<TObject, TList<TProc<TObject>>>;
begin
  Result := FOnChangeList;
end;

function TModelValidationCommand.onExitList: TDictionary<TObject, TList<TProc<TObject>>>;
begin
  Result := FOnExitList;
end;

end.
