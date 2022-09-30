inherited FormCadastroCidade: TFormCadastroCidade
  Caption = 'Cadastro de Cidades'
  ClientHeight = 265
  ClientWidth = 576
  Position = poScreenCenter
  ExplicitWidth = 582
  ExplicitHeight = 294
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 80
    Width = 55
    Height = 13
    Caption = 'ID_CIDADE'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 136
    Width = 29
    Height = 13
    Caption = 'NOME'
    FocusControl = DBEdit2
  end
  inherited PanelCabecalho: TPanel
    Width = 576
    ExplicitWidth = 576
    inherited BitBtnSalvar: TBitBtn
      Left = 104
      ExplicitLeft = 104
    end
    inherited BitBtnCancelar: TBitBtn
      Left = 200
      ExplicitLeft = 200
    end
    inherited BitBtnExcluir: TBitBtn
      Left = 296
      ExplicitLeft = 296
    end
    inherited BitBtnSair: TBitBtn
      Left = 496
      ExplicitLeft = 496
    end
  end
  object DBEdit1: TDBEdit [3]
    Left = 24
    Top = 96
    Width = 134
    Height = 21
    DataField = 'ID_CIDADE'
    DataSource = DataSourceCadastro
    TabOrder = 1
  end
  object DBEdit2: TDBEdit [4]
    Left = 24
    Top = 152
    Width = 260
    Height = 21
    DataField = 'NOME'
    DataSource = DataSourceCadastro
    TabOrder = 2
  end
  inherited FDQueryCadastro: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_CIDADE_ID'
    UpdateOptions.AutoIncFields = 'ID_CIDADE'
    SQL.Strings = (
      'select * from cidade;')
    Left = 408
    Top = 112
    object FDQueryCadastroID_CIDADE: TFDAutoIncField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object FDQueryCadastroNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
  end
  inherited FDUpdateSQLCadastro: TFDUpdateSQL
    Left = 408
    Top = 160
  end
  inherited FDTransactionCadastro: TFDTransaction
    Left = 408
    Top = 208
  end
  inherited DataSourceCadastro: TDataSource
    Left = 408
    Top = 56
  end
end
