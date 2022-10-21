inherited FormCadastroFornecedor: TFormCadastroFornecedor
  Caption = ' '
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 72
    Width = 86
    Height = 13
    Caption = 'ID_FORNECEDOR'
    FocusControl = DBEditIdFornecedor
  end
  object Label2: TLabel [1]
    Left = 128
    Top = 72
    Width = 78
    Height = 13
    Caption = 'RAZAO_SOCIAL'
    FocusControl = DBEditRazaoSocial
  end
  object Label3: TLabel [2]
    Left = 400
    Top = 72
    Width = 50
    Height = 13
    Caption = 'FANTASIA'
    FocusControl = DBEditFantasia
  end
  object Label4: TLabel [3]
    Left = 24
    Top = 120
    Width = 25
    Height = 13
    Caption = 'CNPJ'
    FocusControl = DBEditCnpj
  end
  object Label5: TLabel [4]
    Left = 192
    Top = 120
    Width = 54
    Height = 13
    Caption = 'ENDERECO'
    FocusControl = DBEditEndereco
  end
  object Label6: TLabel [5]
    Left = 27
    Top = 168
    Width = 39
    Height = 13
    Caption = 'BAIRRO'
    FocusControl = DBEditBairro
  end
  object Label7: TLabel [6]
    Left = 192
    Top = 168
    Width = 38
    Height = 13
    Caption = 'CIDADE'
  end
  object Label8: TLabel [7]
    Left = 368
    Top = 168
    Width = 40
    Height = 13
    Caption = 'ESTADO'
  end
  object Label9: TLabel [8]
    Left = 27
    Top = 224
    Width = 30
    Height = 13
    Caption = 'EMAIL'
    FocusControl = DBEditEmail
  end
  object DBEditIdFornecedor: TDBEdit [10]
    Left = 24
    Top = 88
    Width = 86
    Height = 21
    DataField = 'ID_FORNECEDOR'
    DataSource = DataSourceCadastro
    TabOrder = 1
  end
  object DBEditRazaoSocial: TDBEdit [11]
    Left = 128
    Top = 88
    Width = 250
    Height = 21
    DataField = 'RAZAO_SOCIAL'
    DataSource = DataSourceCadastro
    TabOrder = 2
  end
  object DBEditFantasia: TDBEdit [12]
    Left = 400
    Top = 88
    Width = 200
    Height = 21
    DataField = 'FANTASIA'
    DataSource = DataSourceCadastro
    TabOrder = 3
  end
  object DBEditCnpj: TDBEdit [13]
    Left = 24
    Top = 136
    Width = 150
    Height = 21
    DataField = 'CNPJ'
    DataSource = DataSourceCadastro
    TabOrder = 4
  end
  object DBEditEndereco: TDBEdit [14]
    Left = 192
    Top = 136
    Width = 408
    Height = 21
    DataField = 'ENDERECO'
    DataSource = DataSourceCadastro
    TabOrder = 5
  end
  object DBEditBairro: TDBEdit [15]
    Left = 27
    Top = 184
    Width = 150
    Height = 21
    DataField = 'BAIRRO'
    DataSource = DataSourceCadastro
    TabOrder = 6
  end
  object DBEditEmail: TDBEdit [16]
    Left = 27
    Top = 240
    Width = 300
    Height = 21
    DataField = 'EMAIL'
    DataSource = DataSourceCadastro
    TabOrder = 7
  end
  object DBLookupComboBoxCidade: TDBLookupComboBox [17]
    Left = 192
    Top = 187
    Width = 145
    Height = 21
    DataField = 'ID_CIDADE'
    DataSource = DataSourceCadastro
    KeyField = 'NOME'
    ListSource = DataModuleLookup.DataSourceCidade
    TabOrder = 8
  end
  object DBLookupComboBoxEstado: TDBLookupComboBox [18]
    Left = 368
    Top = 187
    Width = 145
    Height = 21
    DataField = 'ID_ESTADO'
    DataSource = DataSourceCadastro
    KeyField = 'SIGLA'
    ListSource = DataModuleLookup.DataSourceEstados
    TabOrder = 9
  end
  inherited FDQueryCadastro: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_FORNECEDOR_ID'
    UpdateOptions.AutoIncFields = 'ID_FORNECEDOR'
    SQL.Strings = (
      'select * from fornecedor;')
    object FDQueryCadastroID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryCadastroRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 80
    end
    object FDQueryCadastroFANTASIA: TWideStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 80
    end
    object FDQueryCadastroCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object FDQueryCadastroENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 255
    end
    object FDQueryCadastroBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 50
    end
    object FDQueryCadastroID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
    end
    object FDQueryCadastroID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
    end
    object FDQueryCadastroEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 255
    end
  end
end
