unit Model.Conexao.RestRequest4Delphi;

interface

uses
  RESTRequest4D,
  Model.Conexao.Interfaces;

type

  TModelConexaoRestRequest4Delphi = class(TInterfacedObject, iModelConexao)
  private
    FRequest: IRequest;
    FResponse: IResponse;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConexao;
    function BaseURL(aValue: string): iModelConexao;
    function Resource(aValue: string): iModelConexao;
    function AddUrlSegment(aSegment, aValue: string): iModelConexao;
    function Accept(aValue: string): iModelConexao;
    function Get: iModelConexao;
    function Response: string;
  end;

implementation

{ TModelConexaoRestRequest4Delphi }

function TModelConexaoRestRequest4Delphi.Accept(aValue: string): iModelConexao;
begin
  Result := Self;
  FRequest.Accept(aValue);
end;

function TModelConexaoRestRequest4Delphi.AddUrlSegment(aSegment,
  aValue: string): iModelConexao;
begin
  Result := Self;
  FRequest.AddUrlSegment(aSegment, aValue);
end;

function TModelConexaoRestRequest4Delphi.BaseURL(aValue: string): iModelConexao;
begin
  Result := Self;
  FRequest.BaseURL(aValue);
end;

constructor TModelConexaoRestRequest4Delphi.Create;
begin
  FRequest := TRequest.New;
end;

destructor TModelConexaoRestRequest4Delphi.Destroy;
begin

  inherited;
end;

function TModelConexaoRestRequest4Delphi.Get: iModelConexao;
begin
  Result := Self;
  FResponse := FRequest.Get;
end;

class function TModelConexaoRestRequest4Delphi.New: iModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoRestRequest4Delphi.Resource(aValue: string): iModelConexao;
begin
  Result := Self;
  FRequest.Resource(aValue);
end;

function TModelConexaoRestRequest4Delphi.Response: string;
begin
  Result := FResponse.Content;
end;

end.
