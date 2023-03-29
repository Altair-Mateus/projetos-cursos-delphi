object FormCalc: TFormCalc
  Left = 0
  Top = 0
  Caption = 'Calculadora de IMC'
  ClientHeight = 375
  ClientWidth = 681
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTitulo: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 89
    Align = alTop
    TabOrder = 0
    object LabelTitulo: TLabel
      Left = 56
      Top = 27
      Width = 565
      Height = 40
      Alignment = taCenter
      Caption = 'Calculadora - '#205'ndice de Massa Corporal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object PanelCalculadora: TPanel
    Left = 0
    Top = 89
    Width = 681
    Height = 286
    Align = alClient
    TabOrder = 1
    ExplicitTop = 95
    ExplicitHeight = 264
    object LabelAltura: TLabel
      Left = 40
      Top = 50
      Width = 80
      Height = 19
      Caption = 'Sua Altura:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelPeso: TLabel
      Left = 40
      Top = 99
      Width = 70
      Height = 19
      Caption = 'Seu Peso:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelSexo: TLabel
      Left = 40
      Top = 147
      Width = 40
      Height = 19
      Caption = 'Sexo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EditAltura: TEdit
      Left = 136
      Top = 40
      Width = 121
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object EditPeso: TEdit
      Left = 136
      Top = 91
      Width = 121
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object ComboBoxSexo: TComboBox
      Left = 136
      Top = 149
      Width = 97
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      Items.Strings = (
        'F'
        'M')
    end
    object ButtonCalc: TButton
      Left = 40
      Top = 200
      Width = 129
      Height = 57
      Caption = 'Calcular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = ButtonCalcClick
    end
    object ButtonTabIMC: TButton
      Left = 200
      Top = 200
      Width = 129
      Height = 57
      Caption = 'Ver Tabela IMC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = ButtonTabIMCClick
    end
  end
end
