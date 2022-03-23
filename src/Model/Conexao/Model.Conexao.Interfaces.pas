unit Model.Conexao.Interfaces;

interface

type

  iModelConexao = interface
    ['{FB5F71A3-EA82-4A5E-BEE7-989C5B0AEFF3}']
    function BaseURL(aValue: string): iModelConexao;
    function Resource(aValue: string): iModelConexao;
    function AddUrlSegment(aSegment, aValue: string): iModelConexao;
    function Accept(aValue: string): iModelConexao;
    function Get: iModelConexao;
    function Response: string;
  end;

  iModelConexaoFactory = interface
    ['{7C10330C-2C6B-482F-B347-079870BAACAC}']
    function RestRequest4Delphi: iModelConexao;
  end;

implementation

end.
