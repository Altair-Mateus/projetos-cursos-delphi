inherited frmCadastroProdutos: TfrmCadastroProdutos
  Caption = 'Cadastro de Produtos'
  ClientHeight = 357
  ExplicitHeight = 396
  PixelsPerInch = 96
  TextHeight = 13
  object LabelCodigo: TLabel [0]
    Left = 19
    Top = 93
    Width = 41
    Height = 13
    Caption = 'CODIGO'
    FocusControl = DBEditCodigo
  end
  object LabelDescricao: TLabel [1]
    Left = 176
    Top = 96
    Width = 59
    Height = 13
    Caption = 'DESCRICAO'
    FocusControl = DBEditDescricao
  end
  object LabelReferencia: TLabel [2]
    Left = 19
    Top = 152
    Width = 63
    Height = 13
    Caption = 'REFERENCIA'
    FocusControl = DBEditreferencia
  end
  object LabelUnidade: TLabel [3]
    Left = 240
    Top = 152
    Width = 45
    Height = 13
    Caption = 'UNIDADE'
  end
  object LabelDataVenda: TLabel [4]
    Left = 320
    Top = 152
    Width = 66
    Height = 13
    Caption = 'DATA_VENDA'
    FocusControl = DBEditDataVenda
  end
  object LabelPrecoVenda: TLabel [5]
    Left = 472
    Top = 152
    Width = 73
    Height = 13
    Caption = 'PRECO_VENDA'
    FocusControl = DBEditPrecoVenda
  end
  object LabelSaldo: TLabel [6]
    Left = 19
    Top = 216
    Width = 33
    Height = 13
    Caption = 'SALDO'
    FocusControl = DBEditSaldo
  end
  object DBEditCodigo: TDBEdit [8]
    Left = 19
    Top = 112
    Width = 134
    Height = 21
    DataField = 'CODIGO'
    DataSource = DataSourceCadastro
    Enabled = False
    TabOrder = 1
  end
  object DBEditDescricao: TDBEdit [9]
    Left = 176
    Top = 112
    Width = 547
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = DataSourceCadastro
    TabOrder = 2
  end
  object DBEditreferencia: TDBEdit [10]
    Left = 19
    Top = 171
    Width = 199
    Height = 21
    DataField = 'REFERENCIA'
    DataSource = DataSourceCadastro
    TabOrder = 3
  end
  object DBEditDataVenda: TDBEdit [11]
    Left = 320
    Top = 168
    Width = 134
    Height = 21
    DataField = 'DATA_VENDA'
    DataSource = DataSourceCadastro
    Enabled = False
    TabOrder = 5
  end
  object DBEditPrecoVenda: TDBEdit [12]
    Left = 472
    Top = 168
    Width = 251
    Height = 21
    DataField = 'PRECO_VENDA'
    DataSource = DataSourceCadastro
    TabOrder = 6
  end
  object DBEditSaldo: TDBEdit [13]
    Left = 19
    Top = 232
    Width = 251
    Height = 21
    DataField = 'SALDO'
    DataSource = DataSourceCadastro
    TabOrder = 7
  end
  object DBComboBox1: TDBComboBox [14]
    Left = 240
    Top = 168
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
    TabOrder = 4
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
  object FDQueryProduto: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select max(codigo) from produtos')
    Left = 312
    Top = 272
    object FDQueryProdutoMAX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAX'
      Origin = '"MAX"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
