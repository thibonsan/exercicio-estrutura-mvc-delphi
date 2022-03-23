unit Model.Conexao.Factory;

interface

uses
  Model.Conexao.Interfaces;

type
  TModelConexaoFactory = class(TInterfacedObject, iModelConexaoFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConexaoFactory;
    function RestRequest4Delphi: iModelConexao;
  end;

implementation

uses
  Model.Conexao.RestRequest4Delphi;

{ TModelConexaoFactory }

constructor TModelConexaoFactory.Create;
begin

end;

destructor TModelConexaoFactory.Destroy;
begin

  inherited;
end;

class function TModelConexaoFactory.New: iModelConexaoFactory;
begin
  Result := Self.Create;
end;

function TModelConexaoFactory.RestRequest4Delphi: iModelConexao;
begin
  Result := TModelConexaoRestRequest4Delphi.New;
end;

end.
