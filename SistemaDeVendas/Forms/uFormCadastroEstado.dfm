inherited FormCadastroEstado: TFormCadastroEstado
  Caption = 'Cadastro de Estados'
  ClientHeight = 273
  ClientWidth = 559
  Position = poScreenCenter
  ExplicitWidth = 565
  ExplicitHeight = 302
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 80
    Width = 57
    Height = 13
    Caption = 'ID_ESTADO'
    FocusControl = DBEditIdEstado
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 176
    Width = 29
    Height = 13
    Caption = 'NOME'
    FocusControl = DBEditNome
  end
  object Label3: TLabel [2]
    Left = 24
    Top = 128
    Width = 29
    Height = 13
    Caption = 'SIGLA'
    FocusControl = DBEditSigla
  end
  inherited PanelCabecalho: TPanel
    Width = 559
    ExplicitWidth = 559
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
      Left = 478
      ExplicitLeft = 478
    end
  end
  object DBEditIdEstado: TDBEdit [4]
    Left = 24
    Top = 96
    Width = 134
    Height = 21
    DataField = 'ID_ESTADO'
    DataSource = DataSourceCadastro
    TabOrder = 1
  end
  object DBEditNome: TDBEdit [5]
    Left = 24
    Top = 192
    Width = 260
    Height = 21
    DataField = 'NOME'
    DataSource = DataSourceCadastro
    TabOrder = 2
  end
  object DBEditSigla: TDBEdit [6]
    Left = 24
    Top = 144
    Width = 134
    Height = 21
    DataField = 'SIGLA'
    DataSource = DataSourceCadastro
    TabOrder = 3
  end
  inherited FDQueryCadastro: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_ESTADO_ID'
    UpdateOptions.AutoIncFields = 'ID_ESTADO'
    SQL.Strings = (
      'select * from estado;')
    Left = 336
    Top = 112
    object FDQueryCadastroID_ESTADO: TFDAutoIncField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object FDQueryCadastroNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object FDQueryCadastroSIGLA: TWideStringField
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      Size = 2
    end
  end
  inherited FDUpdateSQLCadastro: TFDUpdateSQL
    Left = 336
    Top = 160
  end
  inherited FDTransactionCadastro: TFDTransaction
    Left = 336
    Top = 208
  end
  inherited DataSourceCadastro: TDataSource
    Left = 336
    Top = 56
  end
end
