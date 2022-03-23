program ExercicioEstruturaMVC;

uses
  Vcl.Forms,
  View.Principal in 'src\View\View.Principal.pas' {Form1},
  Model.Validacao.Interfaces in 'src\Model\Validacao\Model.Validacao.Interfaces.pas',
  Model.Validacao.Command in 'src\Model\Validacao\Model.Validacao.Command.pas',
  Model.Validacao in 'src\Model\Validacao\Model.Validacao.pas',
  Model.Validacao.Rules.CNPJ in 'src\Model\Validacao\Model.Validacao.Rules.CNPJ.pas',
  Model.Validacao.Rules.CPF in 'src\Model\Validacao\Model.Validacao.Rules.CPF.pas',
  Model.Validacao.Rules.MaxLength in 'src\Model\Validacao\Model.Validacao.Rules.MaxLength.pas',
  Model.Validacao.Rules.MinLength in 'src\Model\Validacao\Model.Validacao.Rules.MinLength.pas',
  Model.Validacao.Rules.NotNull in 'src\Model\Validacao\Model.Validacao.Rules.NotNull.pas',
  Model.Validacao.Rules.Params in 'src\Model\Validacao\Model.Validacao.Rules.Params.pas',
  Model.Validacao.Rules in 'src\Model\Validacao\Model.Validacao.Rules.pas',
  Model.Validacao.Rules.CEP in 'src\Model\Validacao\Model.Validacao.Rules.CEP.pas',
  Model.Interfaces in 'src\Model\Model.Interfaces.pas',
  Model.Factory in 'src\Model\Model.Factory.pas',
  Controller.Interfaces in 'src\Controller\Controller.Interfaces.pas',
  Controller.Generic in 'src\Controller\Controller.Generic.pas',
  Controller.Factory in 'src\Controller\Controller.Factory.pas',
  Model.Conexao.Interfaces in 'src\Model\Conexao\Model.Conexao.Interfaces.pas',
  Model.Conexao.RestRequest4Delphi in 'src\Model\Conexao\Model.Conexao.RestRequest4Delphi.pas',
  Model.Conexao.Factory in 'src\Model\Conexao\Model.Conexao.Factory.pas',
  Model.Servico.Interfaces in 'src\Model\Servico\Model.Servico.Interfaces.pas',
  Model.Servico.CEP.ViaCEP in 'src\Model\Servico\Model.Servico.CEP.ViaCEP.pas',
  Model.Servico in 'src\Model\Servico\Model.Servico.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
