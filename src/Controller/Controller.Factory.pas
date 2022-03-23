unit Controller.Factory;

interface

uses
  Controller.Interfaces;

type
  TControllerFactory = class(TInterfacedObject, iControllerFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerFactory;
    function Generic: iControllerGeneric;
  end;

implementation

uses
  Controller.Generic;

{ TControllerFactory }

constructor TControllerFactory.Create;
begin

end;

destructor TControllerFactory.Destroy;
begin

  inherited;
end;

function TControllerFactory.Generic: iControllerGeneric;
begin
  Result := TControllerGeneric.New;
end;

class function TControllerFactory.New: iControllerFactory;
begin
  Result := Self.Create;
end;

end.
