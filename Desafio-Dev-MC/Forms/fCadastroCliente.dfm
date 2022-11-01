inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BitBtnSalvar: TBitBtn
      Enabled = False
    end
    inherited BitBtnCancelar: TBitBtn
      Left = 255
      Enabled = False
      ExplicitLeft = 255
    end
  end
  inherited PanelCampos: TPanel
    ExplicitLeft = 0
    ExplicitTop = 65
    ExplicitWidth = 772
    ExplicitHeight = 284
    object LabelBairro: TLabel
      Left = 500
      Top = 64
      Width = 39
      Height = 13
      Caption = 'BAIRRO'
      FocusControl = DBEditBairro
    end
    object LabelCelular: TLabel
      Left = 19
      Top = 168
      Width = 44
      Height = 13
      Caption = 'CELULAR'
      FocusControl = DBEditCelular
    end
    object LabelCep: TLabel
      Left = 243
      Top = 115
      Width = 19
      Height = 13
      Caption = 'CEP'
      FocusControl = DBEditCep
    end
    object LabelCidade: TLabel
      Left = 19
      Top = 112
      Width = 38
      Height = 13
      Caption = 'CIDADE'
      FocusControl = DBEditCidade
    end
    object LabelCodigo: TLabel
      Left = 16
      Top = 16
      Width = 41
      Height = 13
      Caption = 'CODIGO'
    end
    object LabelEmail: TLabel
      Left = 224
      Top = 168
      Width = 30
      Height = 13
      Caption = 'EMAIL'
      FocusControl = DBEditEmail
    end
    object LabelEndereco: TLabel
      Left = 16
      Top = 64
      Width = 54
      Height = 13
      Caption = 'ENDERECO'
      FocusControl = DBEditEndereco
    end
    object LabelFone: TLabel
      Left = 530
      Top = 115
      Width = 27
      Height = 13
      Caption = 'FONE'
      FocusControl = DBEditFone
    end
    object LabelNome: TLabel
      Left = 168
      Top = 16
      Width = 29
      Height = 13
      Caption = 'NOME'
      FocusControl = DBEditNome
    end
    object LabelUf: TLabel
      Left = 475
      Top = 115
      Width = 13
      Height = 13
      Caption = 'UF'
      FocusControl = DBEditUf
    end
    object DBEditBairro: TDBEdit
      Left = 500
      Top = 80
      Width = 229
      Height = 21
      DataField = 'BAIRRO'
      DataSource = DataSourceCadastro
      TabOrder = 0
    end
    object DBEditCelular: TDBEdit
      Left = 19
      Top = 184
      Width = 199
      Height = 21
      DataField = 'CELULAR'
      DataSource = DataSourceCadastro
      TabOrder = 1
    end
    object DBEditCep: TDBEdit
      Left = 243
      Top = 131
      Width = 214
      Height = 21
      DataField = 'CEP'
      DataSource = DataSourceCadastro
      TabOrder = 2
    end
    object DBEditCidade: TDBEdit
      Left = 16
      Top = 131
      Width = 210
      Height = 21
      DataField = 'CIDADE'
      DataSource = DataSourceCadastro
      TabOrder = 3
    end
    object DBEditCodigo: TDBEdit
      Left = 16
      Top = 35
      Width = 134
      Height = 21
      DataField = 'CODIGO'
      DataSource = DataSourceCadastro
      Enabled = False
      TabOrder = 4
    end
    object DBEditEmail: TDBEdit
      Left = 224
      Top = 184
      Width = 505
      Height = 21
      DataField = 'EMAIL'
      DataSource = DataSourceCadastro
      TabOrder = 5
    end
    object DBEditEndereco: TDBEdit
      Left = 16
      Top = 80
      Width = 459
      Height = 21
      DataField = 'ENDERECO'
      DataSource = DataSourceCadastro
      TabOrder = 6
    end
    object DBEditFone: TDBEdit
      Left = 530
      Top = 131
      Width = 199
      Height = 21
      DataField = 'FONE'
      DataSource = DataSourceCadastro
      TabOrder = 7
    end
    object DBEditNome: TDBEdit
      Left = 168
      Top = 32
      Width = 561
      Height = 21
      DataField = 'NOME'
      DataSource = DataSourceCadastro
      TabOrder = 8
    end
    object DBEditUf: TDBEdit
      Left = 475
      Top = 134
      Width = 30
      Height = 21
      DataField = 'UF'
      DataSource = DataSourceCadastro
      TabOrder = 9
    end
  end
  inherited DataSourceCadastro: TDataSource
    AutoEdit = False
  end
  inherited FDQueryCadastro: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint]
    UpdateOptions.FetchGeneratorsPoint = gpNone
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    object FDQueryCadastroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryCadastroNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 35
    end
    object FDQueryCadastroENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 35
    end
    object FDQueryCadastroBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object FDQueryCadastroCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object FDQueryCadastroCEP: TWideStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object FDQueryCadastroUF: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object FDQueryCadastroFONE: TWideStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      Size = 15
    end
    object FDQueryCadastroCELULAR: TWideStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object FDQueryCadastroEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
  end
  inherited ImageList1: TImageList
    Left = 472
    Top = 280
  end
end
