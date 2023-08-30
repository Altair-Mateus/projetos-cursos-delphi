object dmFornecedores: TdmFornecedores
  Height = 480
  Width = 640
  object FDQueryFornecedores: TFDQuery
    Connection = DataModule1.FDConnection
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    SQL.Strings = (
      'SELECT * FROM FORNECEDORES;')
    Left = 96
    Top = 144
  end
  object DataSetProviderFornecedores: TDataSetProvider
    DataSet = FDQueryFornecedores
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 256
    Top = 144
  end
  object cdsFornecedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderFornecedores'
    Left = 424
    Top = 144
    object cdsFornecedoresID: TIntegerField
      FieldName = 'ID_FORNEC'
      Required = True
    end
    object cdsFornecedoresRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Required = True
      Size = 200
    end
    object cdsFornecedoresTIPO: TWideStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object cdsFornecedoresNOME_FANTASIA: TWideStringField
      FieldName = 'NOME_FANTASIA'
      Size = 200
    end
    object cdsFornecedoresENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsFornecedoresN_LOGRADOURO: TWideStringField
      FieldName = 'N_LOGRADOURO'
      Size = 10
    end
    object cdsFornecedoresBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object cdsFornecedoresCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsFornecedoresESTADO: TWideStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsFornecedoresTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object cdsFornecedoresCELULAR: TWideStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object cdsFornecedoresEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsFornecedoresCPF: TWideStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cdsFornecedoresCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsFornecedoresCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object cdsFornecedoresDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsFornecedoresDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
    end
    object cdsFornecedoresCEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsFornecedoresIE: TWideStringField
      FieldName = 'IE'
    end
    object cdsFornecedoresSTATUS: TWideStringField
      FieldName = 'STATUS'
      Required = True
      Size = 1
    end
  end
end
