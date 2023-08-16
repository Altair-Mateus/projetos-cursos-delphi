object dmCaixa: TdmCaixa
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
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderCaixa'
    Left = 496
    Top = 168
    object cdsCaixaid: TIntegerField
      FieldName = 'id'
    end
    object cdsCaixadata_cadastro: TDateField
      Alignment = taCenter
      FieldName = 'data_cadastro'
    end
    object cdsCaixavalor: TFMTBCDField
      FieldName = 'valor'
      DisplayFormat = 'R$ #,##0.00'
      Size = 18
    end
    object cdsCaixanumero_doc: TWideStringField
      FieldName = 'numero_doc'
    end
    object cdsCaixadescricao: TWideStringField
      FieldName = 'descricao'
      Size = 200
    end
    object cdsCaixatipo: TWideStringField
      Alignment = taCenter
      FieldName = 'tipo'
      Size = 1
    end
  end
end
