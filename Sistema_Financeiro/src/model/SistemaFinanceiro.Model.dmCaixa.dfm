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
    object cdsCaixaORIGEM: TWideStringField
      FieldName = 'ORIGEM'
      Required = True
      Size = 2
    end
    object cdsCaixaID_ORIGEM: TIntegerField
      FieldName = 'ID_ORIGEM'
    end
    object cdsCaixaID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
      Required = True
    end
    object cdsCaixaNUMERO_DOC: TWideStringField
      FieldName = 'NUMERO_DOC'
    end
    object cdsCaixaDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCaixaTIPO: TWideStringField
      Alignment = taCenter
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCaixaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsCaixaVALOR: TBCDField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
    end
  end
end
