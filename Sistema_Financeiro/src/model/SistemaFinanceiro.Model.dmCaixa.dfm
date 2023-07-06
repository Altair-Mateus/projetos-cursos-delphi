object DataModuleCaixa: TDataModuleCaixa
  Height = 480
  Width = 640
  object FDQueryCaixa: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'select * from caixa;')
    Left = 176
    Top = 168
  end
  object DataSetProviderCaixa: TDataSetProvider
    DataSet = FDQueryCaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 320
    Top = 168
  end
  object ClientDataSetCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderCaixa'
    Left = 496
    Top = 168
    object ClientDataSetCaixaid: TIntegerField
      FieldName = 'id'
    end
    object ClientDataSetCaixadata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object ClientDataSetCaixavalor: TFMTBCDField
      FieldName = 'valor'
      DisplayFormat = '#,##0.00'
      Size = 18
    end
    object ClientDataSetCaixanumero_doc: TWideStringField
      FieldName = 'numero_doc'
    end
    object ClientDataSetCaixadescricao: TWideStringField
      FieldName = 'descricao'
      Size = 200
    end
    object ClientDataSetCaixatipo: TWideStringField
      FieldName = 'tipo'
      Size = 1
    end
  end
end
