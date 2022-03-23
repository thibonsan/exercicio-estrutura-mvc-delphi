unit Model.Validacao.Rules.CEP;

interface

uses
  Model.Validacao.Interfaces,
  Model.Validacao.Command;

type
  TModelValidationRulesCEP = class(TInterfacedObject, iModelValidationRules)
    private
      [weak]
      FParent : iModelValidation;
      FParams : iModelValidationRulesParams;
      procedure _OnExit ( Sender : TObject );
      procedure _OnChange ( Sender : TObject );
      function CepValido(aCep: string): Boolean;
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

{ TValidationRulesCEP }

function TModelValidationRulesCEP.&End: iModelValidation;
begin
  Result := FParent;

  TModelValidationCommand
    .New
      .AddChangeEvent(Params.Component, _OnChange)
      .AddExitEvent(Params.Component, _OnExit);
end;

function TModelValidationRulesCEP.CepValido(aCep: string): Boolean;
var
  integerCep: Integer;
begin
  Result := True;

  if aCep <> EmptyStr then
  begin
    Result := False;
    aCep := Trim(aCep);

    if TryStrToInt(aCep, integerCep) then
      Result := (aCep.Length = Params.MaxLength);
  end;
end;

constructor TModelValidationRulesCEP.Create(Parent : iModelValidation);
begin
  FParent := Parent;
end;

destructor TModelValidationRulesCEP.Destroy;
begin

  inherited;
end;

class function TModelValidationRulesCEP.New(Parent : iModelValidation) : iModelValidationRules;
begin
  Result := Self.Create(Parent);
end;

procedure TModelValidationRulesCEP._OnChange(Sender: TObject);
begin
  if Trim(TEdit(Sender).Text) <> '' then
  begin
    TLabel(Params.DisplayLabel).Visible := False;
    TEdit(Sender).Color := Params.ColorDefault;
  end;
end;

procedure TModelValidationRulesCEP._OnExit(Sender: TObject);
begin
  if not CepValido(TEdit(Sender).Text) then
  begin
    TEdit(Sender).Color := Params.ColorDanger;
    TEdit(Sender).SetFocus;
    TLabel(Params.DisplayLabel).Visible := True;

    if Trim(Params.DisplayMsg) = '' then
      TLabel(Params.DisplayLabel).Caption := TEdit(Sender).Name + ' não é um CEP válido'
    else
      TLabel(Params.DisplayLabel).Caption := Params.DisplayMsg;
  end;
end;

function TModelValidationRulesCEP.Params: iModelValidationRulesParams;
begin
  if not Assigned(FParams) then
    FParams := TModelValidationRulesParams.New(Self).MaxLength(8);

  Result := FParams;
end;

end.
