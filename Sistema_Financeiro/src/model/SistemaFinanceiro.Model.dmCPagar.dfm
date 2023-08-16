object dmCPagar: TdmCPagar
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
  object cdsCPagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderCPagar'
    Left = 448
    Top = 200
    object cdsCPagarID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCPagarNUMERO_DOC: TWideStringField
      FieldName = 'NUMERO_DOC'
      Required = True
    end
    object cdsCPagarDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCPagarPARCELA: TIntegerField
      Alignment = taCenter
      FieldName = 'PARCELA'
      Required = True
    end
    object cdsCPagarVALOR_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PARCELA'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCPagarVALOR_COMPRA: TFMTBCDField
      FieldName = 'VALOR_COMPRA'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCPagarVALOR_ABATIDO: TFMTBCDField
      FieldName = 'VALOR_ABATIDO'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCPagarDATA_COMPRA: TDateField
      Alignment = taCenter
      FieldName = 'DATA_COMPRA'
      Required = True
    end
    object cdsCPagarDATA_CADASTRO: TDateField
      Alignment = taCenter
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsCPagarDATA_VENCIMENTO: TDateField
      Alignment = taCenter
      FieldName = 'DATA_VENCIMENTO'
      Required = True
    end
    object cdsCPagarDATA_PAGAMENTO: TDateField
      Alignment = taCenter
      FieldName = 'DATA_PAGAMENTO'
    end
    object cdsCPagarSTATUS: TWideStringField
      Alignment = taCenter
      FieldName = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object FDQueryCpDetalhes: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT * FROM CONTAS_PAGAR_DETALHE;')
    Left = 296
    Top = 288
    object FDQueryCpDetalhesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryCpDetalhesID_CONTA_PAGAR: TIntegerField
      FieldName = 'ID_CONTA_PAGAR'
      Origin = 'ID_CONTA_PAGAR'
      Required = True
    end
    object FDQueryCpDetalhesDETALHES: TWideStringField
      FieldName = 'DETALHES'
      Origin = 'DETALHES'
      Size = 200
    end
    object FDQueryCpDetalhesVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object FDQueryCpDetalhesDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object FDQueryCpDetalhesUSUARIO: TWideStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 200
    end
    object FDQueryCpDetalhesNOME: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'NOME'
      Size = 100
    end
  end
end
