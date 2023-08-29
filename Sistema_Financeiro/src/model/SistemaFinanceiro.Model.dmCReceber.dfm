object dmCReceber: TdmCReceber
  Height = 480
  Width = 640
  object FDQueryCReceber: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT CR.*, CL.NOME FROM '
      'CONTAS_RECEBER CR LEFT JOIN '
      'CLIENTES CL ON '
      'CR.ID_CLIENTE = CL.ID_CLI;')
    Left = 128
    Top = 176
  end
  object cdsCReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderCReceber'
    Left = 472
    Top = 176
    object cdsCReceberID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCReceberNUMERO_DOCUMENTO: TWideStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
    end
    object cdsCReceberDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object cdsCReceberPARCELA: TIntegerField
      Alignment = taCenter
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      Required = True
    end
    object cdsCReceberVALOR_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PARCELA'
      Origin = 'VALOR_PARCELA'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCReceberVALOR_VENDA: TFMTBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCReceberVALOR_ABATIDO: TFMTBCDField
      FieldName = 'VALOR_ABATIDO'
      Origin = 'VALOR_ABATIDO'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCReceberDATA_CADASTRO: TDateField
      Alignment = taCenter
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object cdsCReceberDATA_VENCIMENTO: TDateField
      Alignment = taCenter
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
      Required = True
    end
    object cdsCReceberDATA_RECEBIMENTO: TDateField
      Alignment = taCenter
      FieldName = 'DATA_RECEBIMENTO'
      Origin = 'DATA_RECEBIMENTO'
    end
    object cdsCReceberSTATUS: TWideStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      OnGetText = cdsCReceberSTATUSGetText
      FixedChar = True
      Size = 1
    end
    object cdsCReceberDATA_VENDA: TDateField
      Alignment = taCenter
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
      Required = True
    end
    object cdsCReceberPARCIAL: TWideStringField
      FieldName = 'PARCIAL'
      Required = True
      Size = 1
    end
    object cdsCReceberCR_ORIGEM: TIntegerField
      FieldName = 'CR_ORIGEM'
    end
    object cdsCReceberID_CLIENTE: TIntegerField
      Alignment = taCenter
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object cdsCReceberNOME: TWideStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
  object DataSetProviderCReceber: TDataSetProvider
    DataSet = FDQueryCReceber
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 296
    Top = 176
  end
  object FDQueryCrDetalhe: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT * FROM CONTAS_RECEBER_DETALHE;')
    Left = 112
    Top = 288
    object FDQueryCrDetalheID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryCrDetalheID_CONTA_RECEBER: TIntegerField
      FieldName = 'ID_CONTA_RECEBER'
      Origin = 'ID_CONTA_RECEBER'
      Required = True
    end
    object FDQueryCrDetalheDETALHES: TWideStringField
      FieldName = 'DETALHES'
      Origin = 'DETALHES'
      Size = 200
    end
    object FDQueryCrDetalheVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object FDQueryCrDetalheDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object FDQueryCrDetalheUSUARIO: TWideStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 200
    end
    object FDQueryCrDetalheNOME: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'NOME'
      Size = 100
    end
    object FDQueryCrDetalheJUROS_BX: TIntegerField
      FieldName = 'JUROS_BX'
      Origin = 'JUROS_BX'
    end
    object FDQueryCrDetalheDESCONTO_BX: TFMTBCDField
      FieldName = 'DESCONTO_BX'
      Origin = 'DESCONTO_BX'
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object FDQueryPgtoCr: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT PG.*, FR.NOME_FR FROM PGTO_BX_CR PG '
      'LEFT JOIN FR_PGTO FR ON PG.ID_FR_PGTO = FR.ID_FR;')
    Left = 232
    Top = 288
    object FDQueryPgtoCrNR_FR: TIntegerField
      FieldName = 'NR_FR'
      Origin = 'NR_FR'
      Required = True
    end
    object FDQueryPgtoCrID_FR_PGTO: TIntegerField
      FieldName = 'ID_FR_PGTO'
      Origin = 'ID_FR_PGTO'
      Required = True
    end
    object FDQueryPgtoCrVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object FDQueryPgtoCrDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
      Required = True
    end
    object FDQueryPgtoCrID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPgtoCrID_CR: TIntegerField
      FieldName = 'ID_CR'
      Origin = 'ID_CR'
      Required = True
    end
    object FDQueryPgtoCrNOME: TWideStringField
      FieldName = 'NOME_FR'
      Size = 100
    end
  end
end
