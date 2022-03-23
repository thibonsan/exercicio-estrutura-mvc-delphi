unit Model.Validacao;

interface

uses
  Model.Validacao.Interfaces,
  System.Generics.Collections,
  Controller.Interfaces;

type
  TModelValidation = class(TInterfacedObject, iModelValidation)
    private
      FListRules : TList<iModelValidationRules>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelValidation;
      function NotNull : iModelValidationRules;
      function MaxLength : iModelValidationRules;
      function CEP : iModelValidationRules;
  end;

implementation

uses
  Model.Validacao.Rules.NotNull,
  Model.Validacao.Rules.MaxLength,
  Model.Validacao.Rules.CEP;

{ TValidation }

function TModelValidation.CEP: iModelValidationRules;
begin
  FListRules.Add(TModelValidationRulesCEP.New(Self));
  Result := FListRules.Last;
end;

constructor TModelValidation.Create;
begin
  FListRules := TList<iModelValidationRules>.Create;
end;

destructor TModelValidation.Destroy;
begin
  FListRules.Free;
  inherited;
end;

function TModelValidation.MaxLength: iModelValidationRules;
begin
  FListRules.Add(TModelValidationRulesMaxLength.New(Self));
  Result := FListRules.Last;
end;

class function TModelValidation.New: iModelValidation;
begin
  Result := Self.Create;
end;

function TModelValidation.NotNull: iModelValidationRules;
begin
  FListRules.Add(TModelValidationRulesNotNull.New(Self));
  Result := FListRules.Last;
end;

end.
