object dmPgtoBxCr: TdmPgtoBxCr
  Height = 480
  Width = 640
  object FDQueryPgtoBxCr: TFDQuery
    Connection = DataModule1.FDConnection
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    SQL.Strings = (
      'SELECT * FROM PGTO_BX_CR;')
    Left = 136
    Top = 184
  end
  object DataSetProviderPgtoBxCr: TDataSetProvider
    DataSet = FDQueryPgtoBxCr
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 280
    Top = 184
  end
  object cdsPgtoBxCr: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderPgtoBxCr'
    Left = 432
    Top = 184
    object cdsPgtoBxCrID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPgtoBxCrID_CR: TIntegerField
      FieldName = 'ID_CR'
      Origin = 'ID_CR'
      Required = True
    end
    object cdsPgtoBxCrID_FR_PGTO: TIntegerField
      FieldName = 'ID_FR_PGTO'
      Origin = 'ID_FR_PGTO'
      Required = True
    end
    object cdsPgtoBxCrNR_FR: TIntegerField
      FieldName = 'NR_FR'
      Origin = 'NR_FR'
      Required = True
    end
    object cdsPgtoBxCrDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
      Required = True
    end
    object cdsPgtoBxCrVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      Required = True
      Precision = 18
    end
  end
end
