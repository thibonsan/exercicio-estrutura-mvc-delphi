unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Controller.Interfaces;

type
  TForm1 = class(TForm)
    CepEdit: TEdit;
    CepLabel: TLabel;
    CepDisplayLabel: TLabel;
    ConsultaCepButton: TButton;
    CepMemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure ConsultaCepButtonClick(Sender: TObject);
  private
    { Private declarations }
    FController: iControllerGeneric;
    procedure Dysplay(aValue: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Controller.Factory;

{$R *.dfm}

procedure TForm1.ConsultaCepButtonClick(Sender: TObject);
begin
  FController
    .Services
      .CEP
        .DisplayResult(Dysplay)
        .Consultar(CepEdit.Text)
      .&End;
end;

procedure TForm1.Dysplay(aValue: string);
begin
  CepMemo.Clear;
  CepMemo.Lines.Append(aValue);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  CepDisplayLabel.Caption := EmptyStr;
  FController := TControllerFactory.New.Generic;

  FController
    .Validations
      .NotNull
        .Params
          .Component(CepEdit)
          .DisplayLabel(CepDisplayLabel)
        .&End
      .&End
      .CEP
        .Params
          .Component(CepEdit)
          .DisplayLabel(CepDisplayLabel)
        .&End
      .&End;
end;

end.
