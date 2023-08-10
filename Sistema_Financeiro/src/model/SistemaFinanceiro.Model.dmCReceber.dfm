object dmCReceber: TdmCReceber
  Height = 480
  Width = 640
  object FDQueryCReceber: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT * FROM CONTAS_RECEBER;')
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
      FieldName = 'ID'
      Required = True
    end
    object cdsCReceberNUMERO_DOCUMENTO: TWideStringField
      FieldName = 'NUMERO_DOCUMENTO'
    end
    object cdsCReceberDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCReceberPARCELA: TIntegerField
      Alignment = taCenter
      FieldName = 'PARCELA'
      Required = True
    end
    object cdsCReceberVALOR_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PARCELA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCReceberVALOR_VENDA: TFMTBCDField
      FieldName = 'VALOR_VENDA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCReceberVALOR_ABATIDO: TFMTBCDField
      FieldName = 'VALOR_ABATIDO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCReceberDATA_CADASTRO: TDateField
      Alignment = taCenter
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsCReceberDATA_VENCIMENTO: TDateField
      Alignment = taCenter
      FieldName = 'DATA_VENCIMENTO'
      Required = True
    end
    object cdsCReceberDATA_RECEBIMENTO: TDateField
      Alignment = taCenter
      FieldName = 'DATA_RECEBIMENTO'
    end
    object cdsCReceberSTATUS: TWideStringField
      Alignment = taCenter
      FieldName = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCReceberDATA_VENDA: TDateField
      Alignment = taCenter
      FieldName = 'DATA_VENDA'
      Required = True
    end
  end
  object DataSetProviderCReceber: TDataSetProvider
    DataSet = FDQueryCReceber
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 296
    Top = 176
  end
end
