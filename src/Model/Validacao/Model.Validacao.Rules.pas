unit Model.Validacao.Rules;

interface

uses
  Model.Validacao.Interfaces;

type
  TModelValidationRules = class (TInterfacedObject, iModelValidationRules)
    protected
      [weak]
      FParent : iModelValidation;
      FParams : iModelValidationRulesParams;
    public
      constructor Create(Parent : iModelValidation);
      destructor Destroy; override;
      class function New (Parent : iModelValidation) : iModelValidationRules;
      function Params : iModelValidationRulesParams;
      function &End : iModelValidation; virtual;
  end;

implementation

uses
  Model.Validacao.Rules.Params;

{ TValidationRules }

function TModelValidationRules.&End: iModelValidation;
begin
  Result := FParent;
end;

constructor TModelValidationRules.Create(Parent: iModelValidation);
begin
  FParent := Parent;
end;

destructor TModelValidationRules.Destroy;
begin

  inherited;
end;

class function TModelValidationRules.New(Parent: iModelValidation): iModelValidationRules;
begin
  Result := Self.Create(Parent);
end;

function TModelValidationRules.Params: iModelValidationRulesParams;
begin
  if not Assigned(FParams) then
    FParams := TModelValidationRulesParams.New(Self);

  Result := FParams;
end;

end.
