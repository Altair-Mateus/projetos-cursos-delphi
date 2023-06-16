object DataModuleUsuarios: TDataModuleUsuarios
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 350
  Width = 474
  object FDQueryUsuarios: TFDQuery
    Connection = DataModule1.FDConnection
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    SQL.Strings = (
      'select * from usuarios')
    Left = 40
    Top = 64
  end
  object ClientDataSetUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderUsuarios'
    Left = 328
    Top = 64
    object ClientDataSetUsuariosid: TIntegerField
      FieldName = 'id'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ClientDataSetUsuariosdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'DATA_CADASTRO'
    end
    object ClientDataSetUsuariosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'NOME'
      Size = 100
    end
    object ClientDataSetUsuarioslogin: TWideStringField
      FieldName = 'login'
      Origin = 'LOGIN'
    end
    object ClientDataSetUsuariossenha: TWideStringField
      FieldName = 'senha'
      Origin = 'SENHA'
      Size = 60
    end
    object ClientDataSetUsuariosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'STATUS'
      Size = 1
    end
    object ClientDataSetUsuariossenha_temp: TWideStringField
      FieldName = 'senha_temp'
      Origin = 'SENHA_TEMP'
      Size = 1
    end
  end
  object DataSetProviderUsuarios: TDataSetProvider
    DataSet = FDQueryUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 176
    Top = 64
  end
end
