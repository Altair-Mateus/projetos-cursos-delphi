inherited FormCadastroCliente: TFormCadastroCliente
  Caption = 'Cadastro de Cliente'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 64
    Width = 58
    Height = 13
    Caption = 'ID_CLIENTE'
    FocusControl = DBEditCliente
  end
  object Label2: TLabel [1]
    Left = 112
    Top = 67
    Width = 78
    Height = 13
    Caption = 'RAZAO_SOCIAL'
    FocusControl = DBEditRazaoSocial
  end
  object Label3: TLabel [2]
    Left = 328
    Top = 67
    Width = 50
    Height = 13
    Caption = 'FANTASIA'
    FocusControl = DBEditFantasia
  end
  object Label4: TLabel [3]
    Left = 544
    Top = 67
    Width = 50
    Height = 13
    Caption = 'CPF_CNPJ'
    FocusControl = DBEditCnpj
  end
  object Label5: TLabel [4]
    Left = 8
    Top = 120
    Width = 41
    Height = 13
    Caption = 'TIPO_FJ'
  end
  object Label6: TLabel [5]
    Left = 144
    Top = 120
    Width = 29
    Height = 13
    Caption = 'NOME'
    FocusControl = DBEditNome
  end
  object Label7: TLabel [6]
    Left = 464
    Top = 123
    Width = 30
    Height = 13
    Caption = 'EMAIL'
    FocusControl = DBEditEmail
  end
  object Label8: TLabel [7]
    Left = 9
    Top = 176
    Width = 22
    Height = 13
    Caption = 'SITE'
    FocusControl = DBEditSite
  end
  object Label9: TLabel [8]
    Left = 224
    Top = 176
    Width = 54
    Height = 13
    Caption = 'ENDERECO'
    FocusControl = DBEditEndereco
  end
  object Label10: TLabel [9]
    Left = 497
    Top = 176
    Width = 75
    Height = 13
    Caption = 'COMPLEMENTO'
    FocusControl = DBEditComplemento
  end
  object Label11: TLabel [10]
    Left = 8
    Top = 232
    Width = 43
    Height = 13
    Caption = 'NUMERO'
    FocusControl = DBEditNumero
  end
  object Label12: TLabel [11]
    Left = 112
    Top = 232
    Width = 39
    Height = 13
    Caption = 'BAIRRO'
    FocusControl = DBEditBairro
  end
  object Label13: TLabel [12]
    Left = 375
    Top = 232
    Width = 12
    Height = 13
    Caption = 'IM'
    FocusControl = DBEditIm
  end
  object Label14: TLabel [13]
    Left = 547
    Top = 232
    Width = 10
    Height = 13
    Caption = 'IE'
    FocusControl = DBEditIe
  end
  object Label15: TLabel [14]
    Left = 8
    Top = 288
    Width = 38
    Height = 13
    Caption = 'CIDADE'
  end
  object Label16: TLabel [15]
    Left = 167
    Top = 288
    Width = 40
    Height = 13
    Caption = 'ESTADO'
  end
  object DBEditCliente: TDBEdit [17]
    Left = 8
    Top = 83
    Width = 89
    Height = 21
    DataField = 'ID_CLIENTE'
    DataSource = DataSourceCadastro
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
  end
  object DBEditRazaoSocial: TDBEdit [18]
    Left = 112
    Top = 83
    Width = 200
    Height = 21
    DataField = 'RAZAO_SOCIAL'
    DataSource = DataSourceCadastro
    TabOrder = 2
  end
  object DBEditFantasia: TDBEdit [19]
    Left = 328
    Top = 83
    Width = 200
    Height = 21
    DataField = 'FANTASIA'
    DataSource = DataSourceCadastro
    TabOrder = 3
  end
  object DBEditCnpj: TDBEdit [20]
    Left = 544
    Top = 83
    Width = 153
    Height = 21
    DataField = 'CPF_CNPJ'
    DataSource = DataSourceCadastro
    TabOrder = 4
  end
  object DBComboBoxTipoFJ: TDBComboBox [21]
    Left = 8
    Top = 139
    Width = 121
    Height = 21
    DataField = 'TIPO_FJ'
    DataSource = DataSourceCadastro
    Items.Strings = (
      'F'#205'SICA'
      'JUR'#205'DICA')
    TabOrder = 5
  end
  object DBEditNome: TDBEdit [22]
    Left = 144
    Top = 139
    Width = 305
    Height = 21
    DataField = 'NOME'
    DataSource = DataSourceCadastro
    TabOrder = 6
  end
  object DBEditEmail: TDBEdit [23]
    Left = 464
    Top = 139
    Width = 233
    Height = 21
    DataField = 'EMAIL'
    DataSource = DataSourceCadastro
    TabOrder = 7
  end
  object DBEditSite: TDBEdit [24]
    Left = 9
    Top = 192
    Width = 200
    Height = 21
    DataField = 'SITE'
    DataSource = DataSourceCadastro
    TabOrder = 8
  end
  object DBEditEndereco: TDBEdit [25]
    Left = 224
    Top = 192
    Width = 257
    Height = 21
    DataField = 'ENDERECO'
    DataSource = DataSourceCadastro
    TabOrder = 9
  end
  object DBEditComplemento: TDBEdit [26]
    Left = 497
    Top = 192
    Width = 200
    Height = 21
    DataField = 'COMPLEMENTO'
    DataSource = DataSourceCadastro
    TabOrder = 10
  end
  object DBEditNumero: TDBEdit [27]
    Left = 8
    Top = 248
    Width = 89
    Height = 21
    DataField = 'NUMERO'
    DataSource = DataSourceCadastro
    TabOrder = 11
  end
  object DBEditBairro: TDBEdit [28]
    Left = 112
    Top = 248
    Width = 249
    Height = 21
    DataField = 'BAIRRO'
    DataSource = DataSourceCadastro
    TabOrder = 12
  end
  object DBEditIm: TDBEdit [29]
    Left = 375
    Top = 248
    Width = 153
    Height = 21
    DataField = 'IM'
    DataSource = DataSourceCadastro
    TabOrder = 13
  end
  object DBEditIe: TDBEdit [30]
    Left = 544
    Top = 248
    Width = 153
    Height = 21
    DataField = 'IE'
    DataSource = DataSourceCadastro
    TabOrder = 14
  end
  object DBLookupComboBoxCidade: TDBLookupComboBox [31]
    Left = 8
    Top = 307
    Width = 145
    Height = 21
    DataField = 'ID_CIDADE'
    DataSource = DataSourceCadastro
    KeyField = 'ID_CIDADE'
    ListField = 'NOME'
    ListSource = DataModuleLookup.DataSourceCidade
    TabOrder = 15
  end
  object DBLookupComboBoxEstado: TDBLookupComboBox [32]
    Left = 167
    Top = 307
    Width = 74
    Height = 21
    DataField = 'ID_ESTADO'
    DataSource = DataSourceCadastro
    KeyField = 'ID_ESTADO'
    ListField = 'SIGLA'
    ListSource = DataModuleLookup.DataSourceEstados
    TabOrder = 16
  end
  inherited FDQueryCadastro: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_CLIENTE_ID'
    UpdateOptions.AutoIncFields = 'ID_CLIENTE'
    SQL.Strings = (
      'select * from cliente')
    object FDQueryCadastroID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryCadastroRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 100
    end
    object FDQueryCadastroFANTASIA: TWideStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 100
    end
    object FDQueryCadastroCPF_CNPJ: TWideStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
    end
    object FDQueryCadastroTIPO_FJ: TWideStringField
      FieldName = 'TIPO_FJ'
      Origin = 'TIPO_FJ'
      Size = 1
    end
    object FDQueryCadastroNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object FDQueryCadastroEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 255
    end
    object FDQueryCadastroSITE: TWideStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      Size = 255
    end
    object FDQueryCadastroENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 255
    end
    object FDQueryCadastroCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 40
    end
    object FDQueryCadastroNUMERO: TWideStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object FDQueryCadastroIE: TWideStringField
      FieldName = 'IE'
      Origin = 'IE'
      Size = 30
    end
    object FDQueryCadastroIM: TWideStringField
      FieldName = 'IM'
      Origin = 'IM'
      Size = 30
    end
    object FDQueryCadastroDT_EXCLUIDO: TDateField
      FieldName = 'DT_EXCLUIDO'
      Origin = 'DT_EXCLUIDO'
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
  end
end
