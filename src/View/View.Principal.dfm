object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CepLabel: TLabel
    Left = 16
    Top = 16
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object CepDisplayLabel: TLabel
    Left = 16
    Top = 50
    Width = 78
    Height = 13
    Caption = 'CepDisplayLabel'
  end
  object CepEdit: TEdit
    Left = 16
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object ConsultaCepButton: TButton
    Left = 152
    Top = 27
    Width = 97
    Height = 25
    Caption = 'Consultar CEP'
    TabOrder = 1
    OnClick = ConsultaCepButtonClick
  end
  object CepMemo: TMemo
    Left = 16
    Top = 69
    Width = 409
    Height = 116
    TabOrder = 2
  end
end
