unit Model.Validacao.Rules.CNPJ;

interface

uses
  Model.Validacao.Interfaces;

type
  TModelValidationRulesCNPJ = class(TInterfacedObject, iModelValidationRules)
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

{ TValidationRulesCNPJ }

function TModelValidationRulesCNPJ.&End: iModelValidation;
begin
  Result := FParent;

  if FParams.Component is TEdit then
  begin
    TEdit(FParams.Component).OnExit := _OnExit;
    TEdit(FParams.Component).OnChange := _OnChange;
  end;
end;

constructor TModelValidationRulesCNPJ.Create(Parent : iModelValidation);
begin
  FParent := Parent;
end;

destructor TModelValidationRulesCNPJ.Destroy;
begin

  inherited;
end;

class function TModelValidationRulesCNPJ.New(Parent : iModelValidation) : iModelValidationRules;
begin
  Result := Self.Create(Parent);
end;

procedure TModelValidationRulesCNPJ._OnChange(Sender: TObject);
begin
    //Implementar a Validação aqui
end;

procedure TModelValidationRulesCNPJ._OnExit(Sender: TObject);
begin
    //Implementar a Validação aqui
end;

function TModelValidationRulesCNPJ.Params: iModelValidationRulesParams;
begin
  if not Assigned(FParams) then
    FParams := TModelValidationRulesParams.New(Self);

  Result := FParams;
end;

end.
