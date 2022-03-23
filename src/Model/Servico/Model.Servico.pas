unit Model.Servico;

interface

uses
  Model.Servico.Interfaces;

type
  TModelService = class(TInterfacedObject, iModelService)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelService;
    function CEP: iModelServiceCEP;
  end;

implementation

uses
  Model.Servico.CEP.ViaCEP;

{ TModelService }

function TModelService.CEP: iModelServiceCEP;
begin
  Result := TModelServiceCEPViaCEP.New(Self);
end;

constructor TModelService.Create;
begin

end;

destructor TModelService.Destroy;
begin

  inherited;
end;

class function TModelService.New: iModelService;
begin
  Result := Self.Create;
end;

end.
