object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 249
  ClientWidth = 482
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
  object LabelFuncao: TLabel
    Left = 16
    Top = 72
    Width = 39
    Height = 13
    Caption = 'Fun'#231#227'o:'
  end
  object LabelNome: TLabel
    Left = 24
    Top = 29
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object LabelBonus: TLabel
    Left = 328
    Top = 72
    Width = 29
    Height = 13
    Caption = 'B'#244'nus'
  end
  object LabelSalario: TLabel
    Left = 203
    Top = 72
    Width = 36
    Height = 13
    Caption = 'Sal'#225'rio:'
  end
  object ComboBoxFuncao: TComboBox
    Left = 72
    Top = 69
    Width = 113
    Height = 21
    TabOrder = 0
    Items.Strings = (
      'Administrativo'
      'Vendedor'
      'Funcion'#225'rio')
  end
  object EditNome: TEdit
    Left = 72
    Top = 26
    Width = 377
    Height = 21
    TabOrder = 1
  end
  object EditBonus: TEdit
    Left = 370
    Top = 69
    Width = 79
    Height = 21
    TabOrder = 2
  end
  object EditSalario: TEdit
    Left = 245
    Top = 69
    Width = 68
    Height = 21
    TabOrder = 3
  end
  object ButtonSalvar: TButton
    Left = 151
    Top = 128
    Width = 88
    Height = 41
    Caption = 'Salvar'
    TabOrder = 4
  end
  object ButtonCalcSalario: TButton
    Left = 255
    Top = 128
    Width = 88
    Height = 41
    Caption = 'Calcular Sal'#225'rio'
    TabOrder = 5
    OnClick = ButtonCalcSalarioClick
  end
  object ButtonRetorna: TButton
    Left = 93
    Top = 128
    Width = 39
    Height = 41
    Caption = '<<'
    TabOrder = 6
  end
  object ButtonAvanca: TButton
    Left = 362
    Top = 128
    Width = 39
    Height = 41
    Caption = '>>'
    TabOrder = 7
  end
  object Memo1: TMemo
    Left = 24
    Top = 192
    Width = 425
    Height = 49
    TabOrder = 8
  end
end
