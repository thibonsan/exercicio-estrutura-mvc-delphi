unit Model.Interfaces;

interface

uses
  Model.Validacao.Interfaces,
  Model.Conexao.Interfaces, Model.Servico.Interfaces;

type
  iModelFactory = interface
    ['{22A8DC7B-EE4F-45C4-A31E-F39E7B2014B1}']
    function Validations: iModelValidation;
    function Conexoes: iModelConexaoFactory;
    function Services: iModelService;
  end;

implementation

end.
