object dmClientes: TdmClientes
  Height = 480
  Width = 640
  object FDQueryClientes: TFDQuery
    Connection = DataModule1.FDConnection
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    SQL.Strings = (
      'SELECT * FROM CLIENTES;')
    Left = 40
    Top = 64
  end
  object DataSetProviderClientes: TDataSetProvider
    DataSet = FDQueryClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 176
    Top = 64
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderClientes'
    Left = 328
    Top = 64
    object cdsClientesID: TIntegerField
      FieldName = 'ID_CLI'
      Required = True
    end
    object cdsClientesNOME: TWideStringField
      FieldName = 'NOME'
      Required = True
      Size = 200
    end
    object cdsClientesTIPO: TWideStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object cdsClientesCPF: TWideStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cdsClientesCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsClientesIE: TWideStringField
      FieldName = 'IE'
    end
    object cdsClientesENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsClientesN_LOGRADOURO: TWideStringField
      FieldName = 'N_LOGRADOURO'
      Size = 10
    end
    object cdsClientesBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object cdsClientesCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsClientesESTADO: TWideStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsClientesCEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsClientesCELULAR: TWideStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object cdsClientesTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object cdsClientesCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object cdsClientesEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsClientesDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsClientesDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
    end
    object cdsClientesSTATUS: TWideStringField
      FieldName = 'STATUS'
      Required = True
      Size = 1
    end
  end
end
