unit Controller.Interfaces;

interface

uses
  Model.Validacao.Interfaces, Model.Servico.Interfaces;

type
  iControllerGeneric = interface
    ['{852C2172-49A8-4A55-AA07-3893298F2032}']
    function Validations: iModelValidation;
    function Services: iModelService;
  end;

  iControllerFactory = interface
    ['{F0B0FE1F-1204-45AF-A545-D4D067658579}']
    function Generic: iControllerGeneric;
  end;

implementation

end.
