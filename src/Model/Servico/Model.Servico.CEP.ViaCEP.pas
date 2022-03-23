unit Model.Servico.CEP.ViaCEP;

interface

uses
  Model.Servico.Interfaces, System.SysUtils, Model.Conexao.Interfaces;

type
  TModelServiceCEPViaCEP = class(TInterfacedObject, iModelServiceCEP)
  private
    [Weak]
    FParent: iModelService;
    FRestRequest4delphi: iModelConexao;
    FDisplayResult: TProc<string>;
  public
    constructor Create(aParent: iModelService);
    destructor Destroy; override;
    class function New(aParent: iModelService): iModelServiceCEP;
    function DisplayResult(aValue: TProc<string>): iModelServiceCEP;
    function Consultar(aValue: string): iModelServiceCEP;
    function &End : iModelService;
  end;

implementation

uses
  Model.Factory, REST.Types;

{ TModelServiceCEPViaCEP }

function TModelServiceCEPViaCEP.Consultar(aValue: string): iModelServiceCEP;
begin
  Result := Self;

  FRestRequest4delphi
    .BaseURL('https://viacep.com.br/ws')
    .Resource('/:cep/json')
    .AddUrlSegment('cep', aValue)
    .Accept(REST.Types.CONTENTTYPE_APPLICATION_JSON)
    .Get;

  if Assigned(FDisplayResult) then
    FDisplayResult(FRestRequest4delphi.Response);
end;

function TModelServiceCEPViaCEP.&End: iModelService;
begin
  Result := FParent;
end;

constructor TModelServiceCEPViaCEP.Create(aParent: iModelService);
begin
  FParent := aParent;
  FRestRequest4delphi := TModelFactory.New.Conexoes.RestRequest4Delphi;
end;

destructor TModelServiceCEPViaCEP.Destroy;
begin

  inherited;
end;

function TModelServiceCEPViaCEP.DisplayResult(
  aValue: TProc<string>): iModelServiceCEP;
begin
  Result := Self;
  FDisplayResult := aValue;
end;

class function TModelServiceCEPViaCEP.New(aParent: iModelService): iModelServiceCEP;
begin
  Result := Self.Create(aParent);
end;

end.
