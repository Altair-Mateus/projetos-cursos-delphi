object dmPgtoBxCp: TdmPgtoBxCp
  Height = 480
  Width = 640
  object FDQueryPgtoBxCp: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'SELECT * FROM PGTO_BX_CP;')
    Left = 152
    Top = 216
  end
  object DataSetProviderPgtoBxCp: TDataSetProvider
    DataSet = FDQueryPgtoBxCp
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 296
    Top = 216
  end
  object cdsPgtoBxCp: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderPgtoBxCp'
    Left = 432
    Top = 216
    object cdsPgtoBxCpID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPgtoBxCpID_CP: TIntegerField
      FieldName = 'ID_CP'
      Origin = 'ID_CP'
      Required = True
    end
    object cdsPgtoBxCpID_FR_PGTO: TIntegerField
      FieldName = 'ID_FR_PGTO'
      Origin = 'ID_FR_PGTO'
      Required = True
    end
    object cdsPgtoBxCpNR_FR: TIntegerField
      FieldName = 'NR_FR'
      Origin = 'NR_FR'
      Required = True
    end
    object cdsPgtoBxCpDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
      Required = True
    end
    object cdsPgtoBxCpVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      Required = True
      Precision = 18
    end
  end
end
