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
    object cdsCPagarVALOR_PARCELA: TBCDField
      FieldName = 'VALOR_PARCELA'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
    end
    object cdsCPagarVALOR_COMPRA: TBCDField
      FieldName = 'VALOR_COMPRA'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
    end
    object cdsCPagarVALOR_ABATIDO: TBCDField
      FieldName = 'VALOR_ABATIDO'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
    end
    object cdsCPagarFATURA_CART: TWideStringField
      FieldName = 'FATURA_CART'
      Required = True
      Size = 1
    end
    object cdsCPagarID_FATURA: TIntegerField
      FieldName = 'ID_FATURA'
    end
  end
  object FDQueryCpDetalhes: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT * FROM CONTAS_PAGAR_DETALHE;')
    Left = 144
    Top = 296
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
    object FDQueryCpDetalhesDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object FDQueryCpDetalhesNOME: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'NOME'
      Size = 100
    end
    object FDQueryCpDetalhesDESCONTO_BX: TBCDField
      FieldName = 'DESCONTO_BX'
      Origin = 'DESCONTO_BX'
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
    end
    object FDQueryCpDetalhesVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
    end
    object FDQueryCpDetalhesUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
    end
  end
  object FDQueryPgtoCp: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT PG.*, FR.NOME_FR FROM PGTO_BX_CP PG '
      'LEFT JOIN FR_PGTO FR ON PG.ID_FR_PGTO = FR.ID_FR;')
    Left = 280
    Top = 296
    object FDQueryPgtoCpID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPgtoCpID_CP: TIntegerField
      FieldName = 'ID_CP'
      Origin = 'ID_CP'
      Required = True
    end
    object FDQueryPgtoCpID_FR_PGTO: TIntegerField
      FieldName = 'ID_FR_PGTO'
      Origin = 'ID_FR_PGTO'
      Required = True
    end
    object FDQueryPgtoCpNR_FR: TIntegerField
      FieldName = 'NR_FR'
      Origin = 'NR_FR'
      Required = True
    end
    object FDQueryPgtoCpDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
      Required = True
    end
    object FDQueryPgtoCpNOME_FR: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_FR'
      Origin = 'NOME_FR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQueryPgtoCpVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
    end
  end
end
