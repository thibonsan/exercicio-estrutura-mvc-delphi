unit Model.Validacao.Interfaces;

interface

uses
  System.Classes,
  Vcl.Graphics,
  System.SysUtils,
  System.Generics.Collections;

type
  iModelValidationRulesParams = interface;
  iModelValidationRules = interface;

  iModelValidation = interface
    ['{53120B74-C4DE-4AD8-8817-41A8D5C04D3B}']
    function NotNull : iModelValidationRules;
    function MaxLength : iModelValidationRules;
    function CEP : iModelValidationRules;
  end;

  iModelValidationRules = interface
    ['{F3074B37-80EC-4665-B8A7-4626D2119121}']
    function Params : iModelValidationRulesParams;
    function &End : iModelValidation;
  end;

  iModelValidationRulesParams = interface
    ['{BAAAEB94-735B-40D6-8DA9-4A7338576A7E}']
    function Component ( aValue : TComponent ) : iModelValidationRulesParams; overload;
    function Component : TComponent; overload;
    function ColorDanger ( aValue : TColor ) : iModelValidationRulesParams; overload;
    function ColorDanger : TColor; overload;
    function ColorDefault ( aValue : TColor ) : iModelValidationRulesParams; overload;
    function ColorDefault : TColor; overload;
    function DisplayLabel ( aValue : TComponent ) : iModelValidationRulesParams; overload;
    function DisplayLabel : TComponent; overload;
    function DisplayMsg ( aValue : String ) : iModelValidationRulesParams; overload;
    function DisplayMsg : String; overload;
    function MinLength ( aValue : Integer ) : iModelValidationRulesParams; overload;
    function MinLength : Integer; overload;
    function MaxLength ( aValue : Integer ) : iModelValidationRulesParams; overload;
    function MaxLength : Integer; overload;
    function &End : iModelValidationRules;
  end;


  iModelValidationCommand = interface
    ['{DDACFFEE-73BF-49F5-8165-98CC1B0B055D}']
    function AddChangeEvent ( aComponent : TComponent; aEvent : TProc<TObject> ) : iModelValidationCommand;
    function AddExitEvent ( aComponent : TComponent; aEvent : TProc<TObject> ) : iModelValidationCommand;
    function onChangeList : TDictionary<TObject, TList<TProc<TObject>>>;
    function onExitList : TDictionary<TObject, TList<TProc<TObject>>>;
  end;

implementation

end.
