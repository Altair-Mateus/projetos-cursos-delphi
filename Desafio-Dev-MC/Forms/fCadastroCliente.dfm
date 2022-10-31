inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  object LabelNome: TLabel [0]
    Left = 168
    Top = 80
    Width = 29
    Height = 13
    Caption = 'NOME'
    FocusControl = DBEditNome
  end
  object LabelCodigo: TLabel [1]
    Left = 16
    Top = 80
    Width = 41
    Height = 13
    Caption = 'CODIGO'
  end
  object LabelEndereco: TLabel [2]
    Left = 16
    Top = 128
    Width = 54
    Height = 13
    Caption = 'ENDERECO'
    FocusControl = DBEditEndereco
  end
  object LabelBairro: TLabel [3]
    Left = 500
    Top = 128
    Width = 39
    Height = 13
    Caption = 'BAIRRO'
    FocusControl = DBEditBairro
  end
  object LabelCidade: TLabel [4]
    Left = 19
    Top = 176
    Width = 38
    Height = 13
    Caption = 'CIDADE'
    FocusControl = DBEditCidade
  end
  object LabelCep: TLabel [5]
    Left = 243
    Top = 179
    Width = 19
    Height = 13
    Caption = 'CEP'
    FocusControl = DBEditCep
  end
  object LabelUf: TLabel [6]
    Left = 475
    Top = 179
    Width = 13
    Height = 13
    Caption = 'UF'
    FocusControl = DBEditUf
  end
  object LabelFone: TLabel [7]
    Left = 530
    Top = 179
    Width = 27
    Height = 13
    Caption = 'FONE'
    FocusControl = DBEditFone
  end
  object LabelCelular: TLabel [8]
    Left = 19
    Top = 232
    Width = 44
    Height = 13
    Caption = 'CELULAR'
    FocusControl = DBEditCelular
  end
  object LabelEmail: TLabel [9]
    Left = 224
    Top = 232
    Width = 30
    Height = 13
    Caption = 'EMAIL'
    FocusControl = DBEditEmail
  end
  object DBEditNome: TDBEdit [11]
    Left = 168
    Top = 96
    Width = 561
    Height = 21
    DataField = 'NOME'
    DataSource = DataSourceCadastro
    TabOrder = 2
  end
  object DBEditEndereco: TDBEdit [12]
    Left = 16
    Top = 144
    Width = 459
    Height = 21
    DataField = 'ENDERECO'
    DataSource = DataSourceCadastro
    TabOrder = 3
  end
  object DBEditBairro: TDBEdit [13]
    Left = 500
    Top = 144
    Width = 229
    Height = 21
    DataField = 'BAIRRO'
    DataSource = DataSourceCadastro
    TabOrder = 4
  end
  object DBEditCidade: TDBEdit [14]
    Left = 16
    Top = 195
    Width = 210
    Height = 21
    DataField = 'CIDADE'
    DataSource = DataSourceCadastro
    TabOrder = 5
  end
  object DBEditCep: TDBEdit [15]
    Left = 243
    Top = 195
    Width = 214
    Height = 21
    DataField = 'CEP'
    DataSource = DataSourceCadastro
    TabOrder = 6
  end
  object DBEditUf: TDBEdit [16]
    Left = 475
    Top = 198
    Width = 30
    Height = 21
    DataField = 'UF'
    DataSource = DataSourceCadastro
    TabOrder = 7
  end
  object DBEditFone: TDBEdit [17]
    Left = 530
    Top = 195
    Width = 199
    Height = 21
    DataField = 'FONE'
    DataSource = DataSourceCadastro
    TabOrder = 8
  end
  object DBEditCelular: TDBEdit [18]
    Left = 19
    Top = 248
    Width = 199
    Height = 21
    DataField = 'CELULAR'
    DataSource = DataSourceCadastro
    TabOrder = 9
  end
  object DBEditEmail: TDBEdit [19]
    Left = 224
    Top = 248
    Width = 505
    Height = 21
    DataField = 'EMAIL'
    DataSource = DataSourceCadastro
    TabOrder = 10
  end
  object DBEditCodigo: TDBEdit [20]
    Left = 16
    Top = 99
    Width = 134
    Height = 21
    DataField = 'CODIGO'
    DataSource = DataSourceCadastro
    Enabled = False
    TabOrder = 1
  end
  inherited FDQueryCadastro: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint]
    UpdateOptions.FetchGeneratorsPoint = gpNone
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    object FDQueryCadastroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryCadastroNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 35
    end
    object FDQueryCadastroENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 35
    end
    object FDQueryCadastroBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object FDQueryCadastroCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object FDQueryCadastroCEP: TWideStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object FDQueryCadastroUF: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object FDQueryCadastroFONE: TWideStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      Size = 15
    end
    object FDQueryCadastroCELULAR: TWideStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object FDQueryCadastroEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
  end
  object FDQueryCliente: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select max(codigo) from cliente')
    Left = 352
    Top = 296
    object FDQueryClienteMAX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAX'
      Origin = '"MAX"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
