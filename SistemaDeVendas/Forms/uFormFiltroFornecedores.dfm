inherited FormFiltroPai1: TFormFiltroPai1
  Caption = 'Pesquisa de Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Left = 224
      Top = 14
      Width = 60
      Caption = 'Raz'#227'o Social'
      ExplicitLeft = 224
      ExplicitTop = 14
      ExplicitWidth = 60
    end
    object LabelFantasia: TLabel [1]
      Left = 224
      Top = 60
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
    end
    object LabelCnpj: TLabel [2]
      Left = 16
      Top = 60
      Width = 25
      Height = 13
      Caption = 'CNPJ'
    end
    object LabelCodigo: TLabel [3]
      Left = 16
      Top = 14
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    inherited EditFiltro: TEdit
      Left = 224
      Top = 33
      Width = 265
      ExplicitLeft = 224
      ExplicitTop = 33
      ExplicitWidth = 265
    end
    inherited ButtonNovo: TButton
      OnClick = ButtonNovoClick
    end
    object EditFantasia: TEdit
      Left = 224
      Top = 79
      Width = 257
      Height = 21
      TabOrder = 5
    end
    object EditCnpj: TEdit
      Left = 16
      Top = 79
      Width = 193
      Height = 21
      TabOrder = 6
    end
    object EditCodigo: TEdit
      Left = 16
      Top = 33
      Width = 193
      Height = 21
      TabOrder = 7
    end
  end
  object DBGrid1: TDBGrid [1]
    Left = 0
    Top = 124
    Width = 758
    Height = 305
    Align = alBottom
    DataSource = DataSourceFiltro
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  inherited FDQueryFiltro: TFDQuery
    SQL.Strings = (
      'select * from fornecedor;')
  end
end
