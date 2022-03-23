unit Controller.Generic;

interface

uses
  Controller.Interfaces,
  Model.Validacao.Interfaces,
  Model.Servico.Interfaces;

type
  TControllerGeneric = class(TInterfacedObject, iControllerGeneric)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerGeneric;
    function Validations: iModelValidation;
    function Services: iModelService;
  end;

implementation

uses
  Model.Factory;

var
  aValidations: iModelValidation;
  aServices: iModelService;

{ TControllerGeneric }

constructor TControllerGeneric.Create;
begin

end;

destructor TControllerGeneric.Destroy;
begin

  inherited;
end;

class function TControllerGeneric.New: iControllerGeneric;
begin
  Result := Self.Create;
end;

function TControllerGeneric.Services: iModelService;
begin
  if not Assigned(aServices) then
    aServices := TModelFactory.New.Services;

  Result := aServices;
end;

function TControllerGeneric.Validations: iModelValidation;
begin
  if not Assigned(aValidations) then
    aValidations := TModelFactory.New.Validations;

  Result := aValidations;
end;

end.
