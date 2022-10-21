inherited FormCadastroFornecedor: TFormCadastroFornecedor
  Caption = 'Cadastro de Fornecedor'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 72
    Width = 86
    Height = 13
    Caption = 'ID_FORNECEDOR'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 128
    Top = 72
    Width = 78
    Height = 13
    Caption = 'RAZAO_SOCIAL'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 400
    Top = 72
    Width = 50
    Height = 13
    Caption = 'FANTASIA'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 24
    Top = 120
    Width = 25
    Height = 13
    Caption = 'CNPJ'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [4]
    Left = 192
    Top = 120
    Width = 54
    Height = 13
    Caption = 'ENDERECO'
    FocusControl = DBEdit5
  end
  object Label6: TLabel [5]
    Left = 27
    Top = 168
    Width = 39
    Height = 13
    Caption = 'BAIRRO'
    FocusControl = DBEdit6
  end
  object Label7: TLabel [6]
    Left = 192
    Top = 168
    Width = 55
    Height = 13
    Caption = 'ID_CIDADE'
    FocusControl = DBEdit7
  end
  object Label8: TLabel [7]
    Left = 368
    Top = 168
    Width = 57
    Height = 13
    Caption = 'ID_ESTADO'
    FocusControl = DBEdit8
  end
  object Label9: TLabel [8]
    Left = 27
    Top = 224
    Width = 30
    Height = 13
    Caption = 'EMAIL'
    FocusControl = DBEdit9
  end
  object DBEdit1: TDBEdit [10]
    Left = 24
    Top = 88
    Width = 86
    Height = 21
    DataField = 'ID_FORNECEDOR'
    DataSource = DataSourceCadastro
    TabOrder = 1
  end
  object DBEdit2: TDBEdit [11]
    Left = 128
    Top = 88
    Width = 250
    Height = 21
    DataField = 'RAZAO_SOCIAL'
    DataSource = DataSourceCadastro
    TabOrder = 2
  end
  object DBEdit3: TDBEdit [12]
    Left = 400
    Top = 88
    Width = 200
    Height = 21
    DataField = 'FANTASIA'
    DataSource = DataSourceCadastro
    TabOrder = 3
  end
  object DBEdit4: TDBEdit [13]
    Left = 24
    Top = 136
    Width = 150
    Height = 21
    DataField = 'CNPJ'
    DataSource = DataSourceCadastro
    TabOrder = 4
  end
  object DBEdit5: TDBEdit [14]
    Left = 192
    Top = 136
    Width = 408
    Height = 21
    DataField = 'ENDERECO'
    DataSource = DataSourceCadastro
    TabOrder = 5
  end
  object DBEdit6: TDBEdit [15]
    Left = 27
    Top = 184
    Width = 150
    Height = 21
    DataField = 'BAIRRO'
    DataSource = DataSourceCadastro
    TabOrder = 6
  end
  object DBEdit7: TDBEdit [16]
    Left = 192
    Top = 184
    Width = 150
    Height = 21
    DataField = 'ID_CIDADE'
    DataSource = DataSourceCadastro
    TabOrder = 7
  end
  object DBEdit8: TDBEdit [17]
    Left = 368
    Top = 184
    Width = 134
    Height = 21
    DataField = 'ID_ESTADO'
    DataSource = DataSourceCadastro
    TabOrder = 8
  end
  object DBEdit9: TDBEdit [18]
    Left = 27
    Top = 240
    Width = 300
    Height = 21
    DataField = 'EMAIL'
    DataSource = DataSourceCadastro
    TabOrder = 9
  end
  inherited FDQueryCadastro: TFDQuery
    SQL.Strings = (
      'select * from fornecedor')
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
