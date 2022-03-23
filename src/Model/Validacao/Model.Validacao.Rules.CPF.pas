unit Model.Validacao.Rules.CPF;

interface

uses
  Model.Validacao.Interfaces;

type
  TModelValidationRulesCPF = class(TInterfacedObject, iModelValidationRules)
    private
      [weak]
      FParent : iModelValidation;
      FParams : iModelValidationRulesParams;
      procedure _OnExit ( Sender : TObject );
      procedure _OnChange ( Sender : TObject );
    public
      constructor Create(Parent : iModelValidation);
      destructor Destroy; override;
      class function New(Parent : iModelValidation) : iModelValidationRules;
      function Params : iModelValidationRulesParams;
      function &End : iModelValidation;
  end;

implementation

uses
  Model.Validacao.Rules.Params,
  Vcl.StdCtrls, System.SysUtils;

{ TValidationRulesCPF }

function TModelValidationRulesCPF.&End: iModelValidation;
begin
  Result := FParent;

  if FParams.Component is TEdit then
  begin
    TEdit(FParams.Component).OnExit := _OnExit;
    TEdit(FParams.Component).OnChange := _OnChange;
  end;
end;

constructor TModelValidationRulesCPF.Create(Parent : iModelValidation);
begin
  FParent := Parent;
end;

destructor TModelValidationRulesCPF.Destroy;
begin

  inherited;
end;

class function TModelValidationRulesCPF.New(Parent : iModelValidation) : iModelValidationRules;
begin
  Result := Self.Create(Parent);
end;

procedure TModelValidationRulesCPF._OnChange(Sender: TObject);
begin
    //Implementar a Validação aqui
end;

procedure TModelValidationRulesCPF._OnExit(Sender: TObject);
begin
    //Implementar a Validação aqui
end;

function TModelValidationRulesCPF.Params: iModelValidationRulesParams;
begin
  if not Assigned(FParams) then
    FParams := TModelValidationRulesParams.New(Self);

  Result := FParams;
end;

end.
