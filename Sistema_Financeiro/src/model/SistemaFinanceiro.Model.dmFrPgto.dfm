object dmFrPgto: TdmFrPgto
  Height = 480
  Width = 640
  object FDQueryFrPgto: TFDQuery
    Connection = DataModule1.FDConnection
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    SQL.Strings = (
      'SELECT * FROM FR_PGTO;')
    Left = 136
    Top = 184
  end
  object DataSetProviderFrPgto: TDataSetProvider
    DataSet = FDQueryFrPgto
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 280
    Top = 184
  end
  object cdsFrPgto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderFrPgto'
    Left = 416
    Top = 184
    object cdsFrPgtoID_FR: TIntegerField
      FieldName = 'ID_FR'
      Required = True
    end
    object cdsFrPgtoNOME_FR: TWideStringField
      FieldName = 'NOME_FR'
      Required = True
      Size = 50
    end
    object cdsFrPgtoDESC: TWideStringField
      FieldName = 'DESC'
      Size = 100
    end
    object cdsFrPgtoSTATUS: TWideStringField
      FieldName = 'STATUS'
      Required = True
      OnGetText = cdsFrPgtoSTATUSGetText
      Size = 1
    end
    object cdsFrPgtoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsFrPgtoDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
    end
    object cdsFrPgtoMETODO_PAG: TWideStringField
      FieldName = 'METODO_PAG'
      Required = True
      Size = 2
    end
  end
end
