object DataModuleUsuarios: TDataModuleUsuarios
  OldCreateOrder = False
  Height = 350
  Width = 474
  object FDQueryUsuarios: TFDQuery
    Connection = DataModule1.FDConnection
    Left = 40
    Top = 64
  end
  object ClientDataSetUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderUsuarios'
    Left = 288
    Top = 64
    object ClientDataSetUsuariosid: TIntegerField
      FieldName = 'id'
    end
    object ClientDataSetUsuariosdata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object ClientDataSetUsuariosnome: TWideStringField
      FieldName = 'nome'
      Size = 100
    end
    object ClientDataSetUsuarioslogin: TWideStringField
      FieldName = 'login'
    end
    object ClientDataSetUsuariossenha: TWideStringField
      FieldName = 'senha'
    end
    object ClientDataSetUsuariosstatus: TWideStringField
      FieldName = 'status'
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
