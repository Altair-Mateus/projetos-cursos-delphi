object dmUsuarios: TdmUsuarios
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
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    ObjectView = False
    Params = <>
    ProviderName = 'DataSetProviderUsuarios'
    Left = 304
    Top = 64
    object cdsUsuariosid: TIntegerField
      FieldName = 'id'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsUsuariosdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'DATA_CADASTRO'
    end
    object cdsUsuariosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'NOME'
      Size = 100
    end
    object cdsUsuarioslogin: TWideStringField
      FieldName = 'login'
      Origin = 'LOGIN'
    end
    object cdsUsuariossenha: TWideStringField
      FieldName = 'senha'
      Origin = 'SENHA'
      Size = 60
    end
    object cdsUsuariosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'STATUS'
      OnGetText = cdsUsuariosstatusGetText
      Size = 1
    end
    object cdsUsuariossenha_temp: TWideStringField
      FieldName = 'senha_temp'
      Origin = 'SENHA_TEMP'
      Size = 1
    end
    object cdsUsuariosUSER_ADMIN: TWideStringField
      FieldName = 'USER_ADMIN'
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
