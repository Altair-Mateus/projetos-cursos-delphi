object dmFaturaCartao: TdmFaturaCartao
  Height = 480
  Width = 640
  object FDQueryFaturaCartao: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT * FROM FATURA_CARTAO;')
    Left = 96
    Top = 176
  end
  object cdsFaturaCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderFaturaCartao'
    Left = 400
    Top = 176
    object cdsFaturaCartaoID_FT: TIntegerField
      FieldName = 'ID_FT'
      Required = True
    end
    object cdsFaturaCartaoNOME: TWideStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object cdsFaturaCartaoOBSERVACAO: TWideStringField
      FieldName = 'OBSERVACAO'
      Size = 100
    end
    object cdsFaturaCartaoDIA_VCTO: TIntegerField
      FieldName = 'DIA_VCTO'
      Required = True
    end
    object cdsFaturaCartaoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsFaturaCartaoDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
    end
    object cdsFaturaCartaoSTATUS_FT: TWideStringField
      FieldName = 'STATUS_FT'
      Required = True
      Size = 1
    end
  end
  object DataSetProviderFaturaCartao: TDataSetProvider
    DataSet = FDQueryFaturaCartao
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 256
    Top = 176
  end
end
