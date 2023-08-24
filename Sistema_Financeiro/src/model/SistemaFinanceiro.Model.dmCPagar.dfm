object dmCPagar: TdmCPagar
  Height = 480
  Width = 640
  object FDQueryCPagar: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT CP.*, F.RAZAO_SOCIAL FROM CONTAS_PAGAR CP'
      'LEFT JOIN FORNECEDORES F '
      'ON CP.ID_FORNECEDOR = F.ID_FORNEC;')
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
      Alignment = taLeftJustify
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
      FieldName = 'STATUS'
      Required = True
      OnGetText = cdsCPagarSTATUSGetText
      FixedChar = True
      Size = 1
    end
    object cdsCPagarPARCIAL: TWideStringField
      FieldName = 'PARCIAL'
      Required = True
      Size = 1
    end
    object cdsCPagarCP_ORIGEM: TIntegerField
      FieldName = 'CP_ORIGEM'
    end
    object cdsCPagarID_FORNECEDOR: TIntegerField
      Alignment = taCenter
      FieldName = 'ID_FORNECEDOR'
      Required = True
    end
    object cdsCPagarRAZAO_SOCIALFORNEC: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 200
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
    object FDQueryCpDetalhesDESCONTO_BX: TIntegerField
      FieldName = 'DESCONTO_BX'
      Origin = 'DESCONTO_BX'
      DisplayFormat = 'R$ #,##0.00'
    end
  end
end
