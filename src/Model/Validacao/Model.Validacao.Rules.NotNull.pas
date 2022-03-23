unit Model.Validacao.Rules.NotNull;

interface

uses
  Model.Validacao.Interfaces, Model.Validacao.Command;

type
  TModelValidationRulesNotNull = class(TInterfacedObject, iModelValidationRules)
    private
      [weak]
      FParent : iModelValidation;
      FParams : iModelValidationRulesParams;
      procedure NotNullOnExit ( Sender : TObject );
      procedure NotNullOnChange ( Sender : TObject );
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

{ TValidationRulesNotNull }

function TModelValidationRulesNotNull.&End: iModelValidation;
begin
  Result := FParent;

  TModelValidationCommand
    .New
      .AddChangeEvent(Params.Component, NotNullOnChange)
      .AddExitEvent(Params.Component, NotNullOnExit)
end;

constructor TModelValidationRulesNotNull.Create(Parent : iModelValidation);
begin
  FParent := Parent;
end;

destructor TModelValidationRulesNotNull.Destroy;
begin

  inherited;
end;

class function TModelValidationRulesNotNull.New(Parent : iModelValidation) : iModelValidationRules;
begin
  Result := Self.Create(Parent);
end;

procedure TModelValidationRulesNotNull.NotNullOnChange(Sender: TObject);
begin
  if Trim(TEdit(Sender).Text) <> '' then
  begin
    TLabel(Params.DisplayLabel).Visible := False;
    TEdit(Sender).Color := Params.ColorDefault;
  end;
end;

procedure TModelValidationRulesNotNull.NotNullOnExit(Sender: TObject);
begin
  if Trim(TEdit(Sender).Text) = '' then
  begin
    TEdit(Sender).Color := Params.ColorDanger;
    TEdit(Sender).SetFocus;
    TLabel(Params.DisplayLabel).Visible := True;

    if Trim(Params.DisplayMsg) = '' then
      TLabel(Params.DisplayLabel).Caption := TEdit(Sender).Name + ' não pode ser vazio'
    else
      TLabel(Params.DisplayLabel).Caption := Params.DisplayMsg;
  end;
end;

function TModelValidationRulesNotNull.Params: iModelValidationRulesParams;
begin
  if not Assigned(FParams) then
    FParams := TModelValidationRulesParams.New(Self);

  Result := FParams;
end;

end.
