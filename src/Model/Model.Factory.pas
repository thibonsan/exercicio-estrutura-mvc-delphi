unit Model.Factory;

interface

uses
  Model.Interfaces,
  Model.Validacao.Interfaces, Model.Conexao.Interfaces,
  Model.Servico.Interfaces;

type
  TModelFactory = class(TInterfacedObject, iModelFactory)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelFactory;
      function Validations: iModelValidation;
      function Conexoes: iModelConexaoFactory;
      function Services: iModelService;
  end;

implementation

uses
  Model.Validacao, Model.Conexao.Factory, Model.Servico;

{ TModelFatory }

function TModelFactory.Conexoes: iModelConexaoFactory;
begin
  Result := TModelConexaoFactory.New;
end;

constructor TModelFactory.Create;
begin

end;

destructor TModelFactory.Destroy;
begin

  inherited;
end;

class function TModelFactory.New: iModelFactory;
begin
  Result := Self.Create;
end;

function TModelFactory.Services: iModelService;
begin
  Result := TModelService.New;
end;

function TModelFactory.Validations: iModelValidation;
begin
  Result := TModelValidation.New;
end;

end.
