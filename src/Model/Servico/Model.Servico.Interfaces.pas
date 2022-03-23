unit Model.Servico.Interfaces;

interface

uses
  System.SysUtils;

type
  iModelServiceCEP = interface;

  iModelService = interface
    ['{F0DD7903-D32B-4B9A-B0CE-A69804E80155}']
    function CEP: iModelServiceCEP;
  end;

  iModelServiceCEP = interface
    ['{6D345DBB-8A6F-4C89-9DCE-7C5749446B66}']
    function DisplayResult(aValue: TProc<string>): iModelServiceCEP;
    function Consultar(aValue: string): iModelServiceCEP;
    function &End : iModelService;
  end;

implementation

end.
