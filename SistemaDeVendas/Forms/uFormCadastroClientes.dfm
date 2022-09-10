inherited FormCadastroCliente: TFormCadastroCliente
  Caption = 'Cadastro de Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 64
    Width = 58
    Height = 13
    Caption = 'ID_CLIENTE'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 112
    Top = 67
    Width = 78
    Height = 13
    Caption = 'RAZAO_SOCIAL'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 328
    Top = 67
    Width = 50
    Height = 13
    Caption = 'FANTASIA'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 544
    Top = 67
    Width = 50
    Height = 13
    Caption = 'CPF_CNPJ'
    FocusControl = DBEdit4
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
    FocusControl = DBEdit5
  end
  object Label7: TLabel [6]
    Left = 464
    Top = 123
    Width = 30
    Height = 13
    Caption = 'EMAIL'
    FocusControl = DBEdit6
  end
  object Label8: TLabel [7]
    Left = 9
    Top = 176
    Width = 22
    Height = 13
    Caption = 'SITE'
    FocusControl = DBEdit7
  end
  object Label9: TLabel [8]
    Left = 224
    Top = 176
    Width = 54
    Height = 13
    Caption = 'ENDERECO'
    FocusControl = DBEdit8
  end
  object Label10: TLabel [9]
    Left = 497
    Top = 176
    Width = 75
    Height = 13
    Caption = 'COMPLEMENTO'
    FocusControl = DBEdit9
  end
  object Label11: TLabel [10]
    Left = 8
    Top = 232
    Width = 43
    Height = 13
    Caption = 'NUMERO'
    FocusControl = DBEdit10
  end
  object Label12: TLabel [11]
    Left = 112
    Top = 232
    Width = 39
    Height = 13
    Caption = 'BAIRRO'
    FocusControl = DBEdit11
  end
  object Label13: TLabel [12]
    Left = 375
    Top = 232
    Width = 12
    Height = 13
    Caption = 'IM'
    FocusControl = DBEdit12
  end
  object Label14: TLabel [13]
    Left = 547
    Top = 232
    Width = 10
    Height = 13
    Caption = 'IE'
    FocusControl = DBEdit13
  end
  object DBEdit1: TDBEdit [15]
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
  object DBEdit2: TDBEdit [16]
    Left = 112
    Top = 83
    Width = 200
    Height = 21
    DataField = 'RAZAO_SOCIAL'
    DataSource = DataSourceCadastro
    TabOrder = 2
  end
  object DBEdit3: TDBEdit [17]
    Left = 328
    Top = 83
    Width = 200
    Height = 21
    DataField = 'FANTASIA'
    DataSource = DataSourceCadastro
    TabOrder = 3
  end
  object DBEdit4: TDBEdit [18]
    Left = 544
    Top = 83
    Width = 153
    Height = 21
    DataField = 'CPF_CNPJ'
    DataSource = DataSourceCadastro
    TabOrder = 4
  end
  object DBComboBoxTipoFJ: TDBComboBox [19]
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
  object DBEdit5: TDBEdit [20]
    Left = 144
    Top = 139
    Width = 305
    Height = 21
    DataField = 'NOME'
    DataSource = DataSourceCadastro
    TabOrder = 6
  end
  object DBEdit6: TDBEdit [21]
    Left = 464
    Top = 139
    Width = 233
    Height = 21
    DataField = 'EMAIL'
    DataSource = DataSourceCadastro
    TabOrder = 7
  end
  object DBEdit7: TDBEdit [22]
    Left = 9
    Top = 192
    Width = 200
    Height = 21
    DataField = 'SITE'
    DataSource = DataSourceCadastro
    TabOrder = 8
  end
  object DBEdit8: TDBEdit [23]
    Left = 224
    Top = 192
    Width = 257
    Height = 21
    DataField = 'ENDERECO'
    DataSource = DataSourceCadastro
    TabOrder = 9
  end
  object DBEdit9: TDBEdit [24]
    Left = 497
    Top = 192
    Width = 200
    Height = 21
    DataField = 'COMPLEMENTO'
    DataSource = DataSourceCadastro
    TabOrder = 10
  end
  object DBEdit10: TDBEdit [25]
    Left = 8
    Top = 248
    Width = 89
    Height = 21
    DataField = 'NUMERO'
    DataSource = DataSourceCadastro
    TabOrder = 11
  end
  object DBEdit11: TDBEdit [26]
    Left = 112
    Top = 248
    Width = 249
    Height = 21
    DataField = 'BAIRRO'
    DataSource = DataSourceCadastro
    TabOrder = 12
  end
  object DBEdit12: TDBEdit [27]
    Left = 375
    Top = 248
    Width = 153
    Height = 21
    DataField = 'IM'
    DataSource = DataSourceCadastro
    TabOrder = 13
  end
  object DBEdit13: TDBEdit [28]
    Left = 544
    Top = 248
    Width = 153
    Height = 21
    DataField = 'IE'
    DataSource = DataSourceCadastro
    TabOrder = 14
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
  end
end
