inherited FormFiltroCliente: TFormFiltroCliente
  Caption = 'Pesquisa de Clientes'
  ClientHeight = 387
  WindowState = wsMaximized
  ExplicitHeight = 426
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Left = 224
      Top = 14
      Width = 78
      Caption = 'Nome do Cliente'
      ExplicitLeft = 224
      ExplicitTop = 14
      ExplicitWidth = 78
    end
    object LabelFantasia: TLabel [1]
      Left = 224
      Top = 60
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
    end
    object LabelCnpj: TLabel [2]
      Left = 16
      Top = 60
      Width = 25
      Height = 13
      Caption = 'CNPJ'
    end
    object LabelCodigo: TLabel [3]
      Left = 16
      Top = 14
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    inherited EditFiltro: TEdit
      Left = 224
      Top = 33
      Width = 257
      ExplicitLeft = 224
      ExplicitTop = 33
      ExplicitWidth = 257
    end
    inherited ButtonPesquisa: TButton
      Left = 504
      Top = 13
      OnClick = Button1Click
      ExplicitLeft = 504
      ExplicitTop = 13
    end
    object EditFantasia: TEdit [6]
      Left = 224
      Top = 79
      Width = 257
      Height = 21
      TabOrder = 2
    end
    object EditCnpj: TEdit [7]
      Left = 16
      Top = 79
      Width = 193
      Height = 21
      TabOrder = 3
    end
    object EditCodigo: TEdit [8]
      Left = 16
      Top = 33
      Width = 193
      Height = 21
      TabOrder = 4
    end
    inherited ButtonSair: TButton
      Left = 616
      Top = 60
      TabOrder = 5
      ExplicitLeft = 616
      ExplicitTop = 60
    end
    inherited ButtonVisualizar: TButton
      Left = 616
      Top = 13
      TabOrder = 6
      OnClick = ButtonVisualizarClick
      ExplicitLeft = 616
      ExplicitTop = 13
    end
    inherited ButtonNovo: TButton
      Left = 504
      Top = 60
      TabOrder = 7
      OnClick = ButtonNovoClick
      ExplicitLeft = 504
      ExplicitTop = 60
    end
  end
  object DBGrid1: TDBGrid [1]
    Left = 0
    Top = 121
    Width = 758
    Height = 266
    Align = alClient
    DataSource = DataSourceFiltro
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CLIENTE'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZAO_SOCIAL'
        Title.Caption = 'Raz'#227'o Social'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FANTASIA'
        Title.Caption = 'Nome Fantasia'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF_CNPJ'
        Title.Caption = 'CPF/CNPJ'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_FJ'
        Title.Caption = 'Tipo Pessoa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Caption = 'E-mail'
        Width = 200
        Visible = True
      end>
  end
  inherited FDQueryFiltro: TFDQuery
    SQL.Strings = (
      'select * from cliente;')
    object FDQueryFiltroID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryFiltroRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 100
    end
    object FDQueryFiltroFANTASIA: TWideStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 100
    end
    object FDQueryFiltroCPF_CNPJ: TWideStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
    end
    object FDQueryFiltroTIPO_FJ: TWideStringField
      FieldName = 'TIPO_FJ'
      Origin = 'TIPO_FJ'
      Size = 1
    end
    object FDQueryFiltroNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object FDQueryFiltroEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 255
    end
    object FDQueryFiltroSITE: TWideStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      Size = 255
    end
    object FDQueryFiltroENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 255
    end
    object FDQueryFiltroCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 40
    end
    object FDQueryFiltroNUMERO: TWideStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object FDQueryFiltroBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 50
    end
    object FDQueryFiltroIE: TWideStringField
      FieldName = 'IE'
      Origin = 'IE'
      Size = 30
    end
    object FDQueryFiltroIM: TWideStringField
      FieldName = 'IM'
      Origin = 'IM'
      Size = 30
    end
    object FDQueryFiltroDT_EXCLUIDO: TDateField
      FieldName = 'DT_EXCLUIDO'
      Origin = 'DT_EXCLUIDO'
    end
    object FDQueryFiltroID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
    end
    object FDQueryFiltroID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
    end
  end
  inherited DataSourceFiltro: TDataSource
    AutoEdit = False
  end
end
