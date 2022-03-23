unit Model.Validacao.Rules.MaxLength;

interface

uses
  Model.Validacao.Interfaces, Model.Validacao.Command;

type
  TModelValidationRulesMaxLength = class(TInterfacedObject, iModelValidationRules)
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

{ TValidationRulesNotNull }

function TModelValidationRulesMaxLength.&End: iModelValidation;
begin
  Result := FParent;

//  if FParams.Component is TEdit then
//  begin
//    TEdit(FParams.Component).OnExit := _OnExit;
//    TEdit(FParams.Component).OnChange := _OnChange;
//  end;

  TModelValidationCommand
    .New
      .AddChangeEvent(FParams.Component, _OnChange)
      .AddExitEvent(FParams.Component, _OnExit);

end;

constructor TModelValidationRulesMaxLength.Create(Parent : iModelValidation);
begin
  FParent := Parent;
end;

destructor TModelValidationRulesMaxLength.Destroy;
begin

  inherited;
end;

class function TModelValidationRulesMaxLength.New(Parent : iModelValidation) : iModelValidationRules;
begin
  Result := Self.Create(Parent);
end;

procedure TModelValidationRulesMaxLength._OnChange(Sender: TObject);
begin
  if Length(Trim(TEdit(Sender).Text)) <= FParams.MaxLength then
  begin
    TLabel(FParams.DisplayLabel).Visible := False;
    TEdit(Sender).Color := FParams.ColorDefault;
  end;
end;

procedure TModelValidationRulesMaxLength._OnExit(Sender: TObject);
begin
  if Length(Trim(TEdit(Sender).Text)) > FParams.MaxLength then
  begin
    TEdit(Sender).Color := FParams.ColorDanger;
    TEdit(Sender).SetFocus;
    TLabel(FParams.DisplayLabel).Visible := True;

    if Trim(FParams.DisplayMsg) = '' then
      TLabel(FParams.DisplayLabel).Caption :=
        TEdit(Sender).Name + ' não pode ser maior do que ' + IntToStr(FParams.MaxLength) + ' Caracteres'
    else
      TLabel(FParams.DisplayLabel).Caption := FParams.DisplayMsg;
  end;
end;

function TModelValidationRulesMaxLength.Params: iModelValidationRulesParams;
begin
  if not Assigned(FParams) then
    FParams := TModelValidationRulesParams.New(Self);

  Result := FParams;
end;

end.

