inherited frmPesquisarVenda: TfrmPesquisarVenda
  Caption = 'frmPesquisarVenda'
  ClientWidth = 1079
  ExplicitWidth = 1095
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1079
    ExplicitWidth = 1079
    inherited LabelNome: TLabel
      Width = 69
      Caption = 'C'#243'digo Cliente'
      ExplicitWidth = 69
    end
    object LabelPeriodoInicial: TLabel [3]
      Left = 240
      Top = 20
      Width = 66
      Height = 13
      Caption = 'Per'#237'odo Inicial'
    end
    object LabelPeriodoFinal: TLabel [4]
      Left = 352
      Top = 20
      Width = 61
      Height = 13
      Caption = 'Per'#237'odo Final'
    end
    inherited ButtonPesquisa: TButton
      OnClick = ButtonPesquisaClick
    end
    inherited RadioButtonNome: TRadioButton
      Width = 74
      Caption = 'Cod Cliente'
      ExplicitWidth = 74
    end
    object PanelTipoVenda: TPanel
      Left = 753
      Top = 17
      Width = 132
      Height = 98
      BorderStyle = bsSingle
      TabOrder = 7
      object LabelTiposVenda: TLabel
        Left = 8
        Top = 12
        Width = 85
        Height = 13
        Caption = 'Tipos de Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelVista: TLabel
        Left = 8
        Top = 35
        Width = 47
        Height = 13
        Caption = 'A: A Vista'
      end
      object LabelPrazo: TLabel
        Left = 8
        Top = 54
        Width = 50
        Height = 13
        Caption = 'P: A Prazo'
      end
    end
    object PanelOpVenda: TPanel
      Left = 907
      Top = 17
      Width = 137
      Height = 98
      BorderStyle = bsSingle
      TabOrder = 8
      object LabelOpVenda: TLabel
        Left = 8
        Top = 12
        Width = 115
        Height = 13
        Caption = 'Opera'#231#245'es de Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOrc: TLabel
        Left = 5
        Top = 35
        Width = 68
        Height = 13
        Caption = 'O: Or'#231'amento'
      end
      object LabelPreVenda: TLabel
        Left = 8
        Top = 54
        Width = 63
        Height = 13
        Caption = 'P: Pr'#233'-Venda'
      end
      object LabelVenda: TLabel
        Left = 8
        Top = 73
        Width = 43
        Height = 13
        Caption = 'V: Venda'
      end
    end
    object DateTimePickerInicial: TDateTimePicker
      Left = 240
      Top = 39
      Width = 97
      Height = 21
      Date = 44859.000000000000000000
      Time = 0.875328750000335300
      TabOrder = 9
    end
    object DateTimePickerFinal: TDateTimePicker
      Left = 352
      Top = 39
      Width = 97
      Height = 21
      Date = 44859.000000000000000000
      Time = 0.875328750000335300
      TabOrder = 10
    end
    object RadioButtonData: TRadioButton
      Left = 183
      Top = 98
      Width = 60
      Height = 17
      Caption = 'Data'
      TabOrder = 11
    end
  end
  inherited EditNome: TEdit
    Width = 89
    ExplicitWidth = 89
  end
  inherited DBGridResultadoPesquisa: TDBGrid
    Width = 1079
    Columns = <
      item
        Expanded = False
        FieldName = 'NRNOTA'
        Title.Caption = 'N'#186' Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Caption = 'Cod Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCliente'
        Title.Caption = 'Nome Cliente'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_VENDA'
        Title.Caption = 'Tipo Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_VENDA'
        Title.Caption = 'Valor Total R$'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPERACAO_VENDA'
        Title.Caption = 'Opera'#231#227'o Venda'
        Visible = True
      end>
  end
  inherited FDQueryPesquisar: TFDQuery
    SQL.Strings = (
      'select * from venda')
    object FDQueryPesquisarNRNOTA: TIntegerField
      FieldName = 'NRNOTA'
      Origin = 'NRNOTA'
      Required = True
    end
    object FDQueryPesquisarEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object FDQueryPesquisarCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Required = True
    end
    object FDQueryPesquisarTIPO_VENDA: TWideStringField
      FieldName = 'TIPO_VENDA'
      Origin = 'TIPO_VENDA'
      FixedChar = True
      Size = 1
    end
    object FDQueryPesquisarVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      Precision = 18
    end
    object FDQueryPesquisarOPERACAO_VENDA: TWideStringField
      FieldName = 'OPERACAO_VENDA'
      Origin = 'OPERACAO_VENDA'
      FixedChar = True
      Size = 1
    end
    object FDQueryPesquisarNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCliente'
      LookupDataSet = FDQueryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'CLIENTE'
      Size = 35
      Lookup = True
    end
  end
  object FDQueryClientes: TFDQuery
    Active = True
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from Cliente')
    Left = 352
    Top = 224
  end
end
