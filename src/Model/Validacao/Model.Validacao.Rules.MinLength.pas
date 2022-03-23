unit Model.Validacao.Rules.MinLength;

interface

uses
  Model.Validacao.Rules,
  Model.Validacao.Interfaces;

type
  TModelValidationRulesMinLength = class(TModelValidationRules)
    private
      procedure NotNullOnExit ( Sender : TObject );
      procedure NotNullOnChange ( Sender : TObject );
    public
      function &End : iModelValidation; override;
  end;

implementation

uses
  Vcl.StdCtrls;

{ TValidationRulesMinLength }

function TModelValidationRulesMinLength.&End: iModelValidation;
begin

  if FParams.Component is TEdit then
  begin
    TEdit(FParams.Component).OnExit := NotNullOnExit;
    TEdit(FParams.Component).OnChange := NotNullOnChange;
  end;

  inherited;
end;

procedure TModelValidationRulesMinLength.NotNullOnChange(Sender: TObject);
begin
  //
end;

procedure TModelValidationRulesMinLength.NotNullOnExit(Sender: TObject);
begin
  //
end;

end.
