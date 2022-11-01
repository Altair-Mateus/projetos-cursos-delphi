inherited frmCadastroProdutos: TfrmCadastroProdutos
  Caption = 'Cadastro de Produtos'
  ClientHeight = 357
  ExplicitHeight = 396
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelCampos: TPanel
    Height = 292
    ExplicitLeft = 0
    ExplicitTop = 65
    ExplicitWidth = 772
    ExplicitHeight = 292
    object LabelCodigo: TLabel
      Left = 19
      Top = 29
      Width = 41
      Height = 13
      Caption = 'C'#211'DIGO'
      FocusControl = DBEditCodigo
    end
    object LabelDataVenda: TLabel
      Left = 320
      Top = 88
      Width = 103
      Height = 13
      Caption = 'DATA '#218'LTIMA VENDA'
      FocusControl = DBEditDataVenda
    end
    object LabelDescricao: TLabel
      Left = 176
      Top = 32
      Width = 59
      Height = 13
      Caption = 'DESCRI'#199#195'O'
      FocusControl = DBEditDescricao
    end
    object LabelPrecoVenda: TLabel
      Left = 472
      Top = 88
      Width = 86
      Height = 13
      Caption = 'PRE'#199'O DE VENDA'
      FocusControl = DBEditPrecoVenda
    end
    object LabelReferencia: TLabel
      Left = 19
      Top = 88
      Width = 63
      Height = 13
      Caption = 'REFER'#202'NCIA'
      FocusControl = DBEditreferencia
    end
    object LabelSaldo: TLabel
      Left = 19
      Top = 152
      Width = 33
      Height = 13
      Caption = 'SALDO'
      FocusControl = DBEditSaldo
    end
    object LabelUnidade: TLabel
      Left = 240
      Top = 88
      Width = 45
      Height = 13
      Caption = 'UNIDADE'
    end
    object DBComboBoxUn: TDBComboBox
      Left = 240
      Top = 104
      Width = 65
      Height = 21
      Style = csDropDownList
      DataField = 'UNIDADE'
      DataSource = DataSourceCadastro
      Items.Strings = (
        'UN'
        'KG'
        'PC'
        'CX'
        'L'
        'M'
        'TON')
      TabOrder = 0
    end
    object DBEditCodigo: TDBEdit
      Left = 19
      Top = 48
      Width = 134
      Height = 21
      DataField = 'CODIGO'
      DataSource = DataSourceCadastro
      Enabled = False
      TabOrder = 1
    end
    object DBEditDataVenda: TDBEdit
      Left = 320
      Top = 104
      Width = 134
      Height = 21
      DataField = 'DATA_VENDA'
      DataSource = DataSourceCadastro
      Enabled = False
      TabOrder = 2
    end
    object DBEditDescricao: TDBEdit
      Left = 176
      Top = 48
      Width = 547
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = DataSourceCadastro
      TabOrder = 3
    end
    object DBEditPrecoVenda: TDBEdit
      Left = 472
      Top = 104
      Width = 251
      Height = 21
      DataField = 'PRECO_VENDA'
      DataSource = DataSourceCadastro
      TabOrder = 4
    end
    object DBEditreferencia: TDBEdit
      Left = 19
      Top = 107
      Width = 199
      Height = 21
      DataField = 'REFERENCIA'
      DataSource = DataSourceCadastro
      TabOrder = 5
    end
    object DBEditSaldo: TDBEdit
      Left = 19
      Top = 168
      Width = 110
      Height = 21
      DataField = 'SALDO'
      DataSource = DataSourceCadastro
      TabOrder = 6
    end
  end
  inherited FDQueryCadastro: TFDQuery
    SQL.Strings = (
      'select * from produtos;')
    object FDQueryCadastroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryCadastroDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 35
    end
    object FDQueryCadastroREFERENCIA: TWideStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 15
    end
    object FDQueryCadastroUNIDADE: TWideStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object FDQueryCadastroDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
    end
    object FDQueryCadastroPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Precision = 18
    end
    object FDQueryCadastroSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
    end
  end
end
