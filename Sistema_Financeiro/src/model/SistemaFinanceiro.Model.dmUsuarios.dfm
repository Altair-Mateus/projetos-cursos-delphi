object DataModuleUsuarios: TDataModuleUsuarios
  OldCreateOrder = False
  Height = 350
  Width = 474
  object FDQueryUsuarios: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'select * from usuarios')
    Left = 40
    Top = 64
  end
  object ClientDataSetUsuarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderUsuarios'
    Left = 288
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
    end
    object ClientDataSetUsuariosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'STATUS'
      Size = 1
    end
  end
  object DataSetProviderUsuarios: TDataSetProvider
    DataSet = FDQueryUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 160
    Top = 64
  end
end
