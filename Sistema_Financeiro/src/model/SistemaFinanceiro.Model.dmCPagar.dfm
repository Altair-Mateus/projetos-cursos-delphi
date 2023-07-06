object DataModuleCPagar: TDataModuleCPagar
  Height = 480
  Width = 640
  object FDQueryCPagar: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT * FROM CONTAS_PAGAR;')
    Left = 144
    Top = 200
  end
  object DataSetProviderCPagar: TDataSetProvider
    DataSet = FDQueryCPagar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 304
    Top = 200
  end
  object ClientDataSetCPagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderCPagar'
    Left = 464
    Top = 200
    object ClientDataSetCPagarID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ClientDataSetCPagarNUMERO_DOC: TWideStringField
      FieldName = 'NUMERO_DOC'
      Required = True
    end
    object ClientDataSetCPagarDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object ClientDataSetCPagarPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Required = True
    end
    object ClientDataSetCPagarVALOR_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PARCELA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object ClientDataSetCPagarVALOR_COMPRA: TFMTBCDField
      FieldName = 'VALOR_COMPRA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object ClientDataSetCPagarVALOR_ABATIDO: TFMTBCDField
      FieldName = 'VALOR_ABATIDO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object ClientDataSetCPagarDATA_COMPRA: TDateField
      FieldName = 'DATA_COMPRA'
      Required = True
    end
    object ClientDataSetCPagarDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object ClientDataSetCPagarDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Required = True
    end
    object ClientDataSetCPagarDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object ClientDataSetCPagarSTATUS: TWideStringField
      FieldName = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
