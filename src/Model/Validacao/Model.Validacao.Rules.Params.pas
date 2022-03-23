unit Model.Validacao.Rules.Params;

interface

uses
  Model.Validacao.Interfaces,
  System.Classes,
  Vcl.Graphics,
  Model.Validacao.Command;

type
  TModelValidationRulesParams = class(TInterfacedObject, iModelValidationRulesParams)
    private
      [weak]
      FParent : iModelValidationRules;
      FComponent : TComponent;
      FColorDanger : TColor;
      FColorDefault : TColor;
      FDisplayLabel : TComponent;
      FDisplayMsg : String;
      FMinLength : Integer;
      FMaxLength : Integer;
      procedure ListEventOnExit ( Sender : TObject);
      procedure ListEventOnChange ( Sender : TObject);
    public
      constructor Create(Parent : iModelValidationRules);
      destructor Destroy; override;
      class function New(Parent : iModelValidationRules) : iModelValidationRulesParams;
      function Component ( aValue : TComponent ) : iModelValidationRulesParams; overload;
      function Component : TComponent; overload;
      function ColorDanger ( aValue : TColor ) : iModelValidationRulesParams; overload;
      function ColorDanger : TColor; overload;
      function ColorDefault ( aValue : TColor ) : iModelValidationRulesParams; overload;
      function ColorDefault : TColor; overload;
      function DisplayLabel ( aValue : TComponent ) : iModelValidationRulesParams; overload;
      function DisplayLabel : TComponent; overload;
      function DisplayMsg ( aValue : String ) : iModelValidationRulesParams; overload;
      function DisplayMsg : String; overload;
      function MinLength ( aValue : Integer ) : iModelValidationRulesParams; overload;
      function MinLength : Integer; overload;
      function MaxLength ( aValue : Integer ) : iModelValidationRulesParams; overload;
      function MaxLength : Integer; overload;
      function &End : iModelValidationRules;
  end;

implementation

uses
  Vcl.StdCtrls,
  System.SysUtils,
  System.Generics.Collections;

{ TValidationRulesParams }

function TModelValidationRulesParams.ColorDanger: TColor;
begin
  Result := FColorDanger;
end;

function TModelValidationRulesParams.ColorDanger(
  aValue: TColor): iModelValidationRulesParams;
begin
  Result := Self;
  FColorDanger := aValue;
end;

function TModelValidationRulesParams.ColorDefault(
  aValue: TColor): iModelValidationRulesParams;
begin
  Result := Self;
  FColorDefault := aValue;
end;

function TModelValidationRulesParams.ColorDefault: TColor;
begin
  Result := FColorDefault;
end;

function TModelValidationRulesParams.Component: TComponent;
begin
  Result := FComponent;
end;

function TModelValidationRulesParams.Component(
  aValue: TComponent): iModelValidationRulesParams;
begin
  Result := Self;
  FComponent := aValue;

  if FComponent is TEdit then
  begin
    TEdit(FComponent).OnExit := ListEventOnExit;
    TEdit(FComponent).OnChange := ListEventOnChange;
  end;
end;

function TModelValidationRulesParams.&End: iModelValidationRules;
begin
  Result := FParent;
end;

procedure TModelValidationRulesParams.ListEventOnChange(Sender: TObject);
var
  aList : TList<TProc<TObject>>;
  aProc : TProc<TObject>;
begin
  if TModelValidationCommand.New.onChangeList.TryGetValue(Sender, aList) then
    for aProc in aList do
      aProc(Sender);
end;

procedure TModelValidationRulesParams.ListEventOnExit(Sender: TObject);
var
  aList : TList<TProc<TObject>>;
  aProc : TProc<TObject>;
begin
  if TModelValidationCommand.New.onExitList.TryGetValue(Sender, aList) then
    for aProc in aList do
      aProc(Sender);
end;

constructor TModelValidationRulesParams.Create(Parent : iModelValidationRules);
begin
  FParent := Parent;
  FColorDanger := clRed;
  FColorDefault := clWhite;
end;

destructor TModelValidationRulesParams.Destroy;
begin

  inherited;
end;

function TModelValidationRulesParams.DisplayLabel: TComponent;
begin
  Result := FDisplayLabel;
end;

function TModelValidationRulesParams.DisplayLabel(
  aValue: TComponent): iModelValidationRulesParams;
begin
  Result := Self;
  FDisplayLabel := aValue;
end;

function TModelValidationRulesParams.DisplayMsg(
  aValue: String): iModelValidationRulesParams;
begin
  Result := Self;
  FDisplayMsg := aValue;
end;

function TModelValidationRulesParams.DisplayMsg: String;
begin
  Result := FDisplayMsg;
end;

function TModelValidationRulesParams.MaxLength: Integer;
begin
  Result := FMaxLength;
end;

function TModelValidationRulesParams.MaxLength(
  aValue: Integer): iModelValidationRulesParams;
begin
  Result := Self;
  FMaxLength := aValue;
end;

function TModelValidationRulesParams.MinLength(
  aValue: Integer): iModelValidationRulesParams;
begin
  Result := Self;
  FMinLength := aValue;
end;

function TModelValidationRulesParams.MinLength: Integer;
begin
  Result := FMinLength;
end;

class function TModelValidationRulesParams.New(Parent : iModelValidationRules) : iModelValidationRulesParams;
begin
  Result := Self.Create(Parent);
end;

end.
