inherited frmCadastroVenda: TfrmCadastroVenda
  Caption = 'Criar Vendas, Or'#231'amentos e Pr'#233'-Vendas'
  ClientHeight = 606
  ClientWidth = 1023
  WindowState = wsMaximized
  OnActivate = FormActivate
  ExplicitWidth = 1039
  ExplicitHeight = 645
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1023
    ExplicitWidth = 1023
    inherited BitBtnSalvar: TBitBtn
      Top = 10
      ExplicitTop = 10
    end
    inherited BitBtnSair: TBitBtn
      Left = 911
      ExplicitLeft = 911
    end
  end
  object PanelCabecalhoVenda: TPanel [1]
    Left = 0
    Top = 65
    Width = 1023
    Height = 126
    Align = alTop
    Color = clHighlight
    Enabled = False
    ParentBackground = False
    TabOrder = 4
    object LabelNrNota: TLabel
      Left = 16
      Top = 16
      Width = 74
      Height = 13
      Caption = 'N'#218'MERO NOTA'
      FocusControl = DBEditNrNota
    end
    object LabelEmissao: TLabel
      Left = 176
      Top = 16
      Width = 45
      Height = 13
      Caption = 'EMISS'#195'O'
    end
    object LabelCliente: TLabel
      Left = 336
      Top = 16
      Width = 103
      Height = 13
      Caption = 'C'#211'DIGO DO CLIENTE'
      FocusControl = DBEditCodCLiente
    end
    object LabelTipoVenda: TLabel
      Left = 183
      Top = 72
      Width = 76
      Height = 13
      Caption = 'TIPO DE VENDA'
    end
    object LabelOpVenda: TLabel
      Left = 16
      Top = 72
      Width = 108
      Height = 13
      Caption = 'OPERA'#199#195'O DE VENDA'
    end
    object LabelNomeCliente: TLabel
      Left = 465
      Top = 40
      Width = 85
      Height = 13
      Caption = 'LabelNomeCliente'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBEditNrNota: TDBEdit
      Left = 16
      Top = 35
      Width = 134
      Height = 21
      DataField = 'NRNOTA'
      DataSource = DataSourceCadastro
      Enabled = False
      TabOrder = 1
    end
    object DBEditCodCLiente: TDBEdit
      Left = 336
      Top = 35
      Width = 73
      Height = 21
      DataField = 'CLIENTE'
      DataSource = DataSourceCadastro
      TabOrder = 2
      OnExit = DBEditCodCLienteExit
    end
    object ButtonCliente: TButton
      Left = 415
      Top = 35
      Width = 34
      Height = 25
      ImageIndex = 3
      Images = ImageList1
      TabOrder = 0
      OnClick = ButtonClienteClick
    end
    object DBComboBoxTipoVenda: TDBComboBox
      Left = 183
      Top = 91
      Width = 145
      Height = 21
      Style = csDropDownList
      DataField = 'TIPO_VENDA'
      DataSource = DataSourceCadastro
      Items.Strings = (
        'A VISTA'
        'PRAZO')
      TabOrder = 4
    end
    object DBComboBoxOpVenda: TDBComboBox
      Left = 16
      Top = 91
      Width = 145
      Height = 21
      Style = csDropDownList
      DataField = 'OPERACAO_VENDA'
      DataSource = DataSourceCadastro
      Items.Strings = (
        'Or'#231'amento'
        'Pr'#233'-Venda'
        'Venda')
      TabOrder = 3
      OnExit = DBComboBoxOpVendaExit
    end
    object DBEditEmissao: TDBEdit
      Left = 176
      Top = 35
      Width = 134
      Height = 21
      DataField = 'EMISSAO'
      DataSource = DataSourceCadastro
      Enabled = False
      TabOrder = 5
    end
    object PanelOpVenda: TPanel
      Left = 728
      Top = 16
      Width = 281
      Height = 104
      Align = alCustom
      TabOrder = 6
      object LabelOp: TLabel
        Left = 8
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Opera'#231#245'es de Venda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelOrc: TLabel
        Left = 8
        Top = 35
        Width = 150
        Height = 13
        Caption = 'Or'#231'amento: N'#227'o baixa estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LabelPreVenda: TLabel
        Left = 8
        Top = 54
        Width = 125
        Height = 13
        Caption = 'Pr'#233'-venda: Baixa Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LabelVenda: TLabel
        Left = 8
        Top = 73
        Width = 219
        Height = 26
        Caption = 'Venda: Baixa Estoque e grava data da '#250'ltima venda no produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
  end
  object PanelProdutos: TPanel [2]
    Left = 0
    Top = 191
    Width = 1023
    Height = 72
    Align = alTop
    Color = clBtnHighlight
    Enabled = False
    ParentBackground = False
    TabOrder = 2
    object LabelProduto: TLabel
      Left = 96
      Top = 16
      Width = 60
      Height = 13
      Caption = 'Cod Produto'
    end
    object LabelQtde: TLabel
      Left = 392
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object LabelValorUnit: TLabel
      Left = 490
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object LabelValorTotalVenda: TLabel
      Left = 600
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Total Produto'
    end
    object LabelLcto: TLabel
      Left = 16
      Top = 16
      Width = 26
      Height = 13
      Caption = 'LCTO'
    end
    object LabelDescProd: TLabel
      Left = 225
      Top = 40
      Width = 70
      Height = 13
      Caption = 'LabelDescProd'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 704
      Top = 16
      Width = 84
      Height = 13
      Caption = 'Valor Total Venda'
      FocusControl = DBEditTotalVenda
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 927
      Top = 23
      Width = 206
      Height = 32
      Caption = 'Para Excluir um Item adicionado d'#234' um duplo clique sobre o mesmo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6248624
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object ButtonProduto: TButton
      Left = 175
      Top = 32
      Width = 34
      Height = 25
      ImageIndex = 3
      Images = ImageList1
      TabOrder = 7
      OnClick = ButtonProdutoClick
    end
    object ButtonAdicionar: TButton
      Left = 816
      Top = 16
      Width = 89
      Height = 41
      Caption = 'ADICIONAR'
      TabOrder = 6
      OnClick = ButtonAdicionarClick
    end
    object EditProduto: TEdit
      Left = 96
      Top = 35
      Width = 73
      Height = 21
      TabOrder = 0
      OnExit = EditProdutoExit
    end
    object EditQtd: TEdit
      Left = 392
      Top = 35
      Width = 74
      Height = 21
      TabOrder = 2
      OnExit = EditQtdExit
    end
    object EditValorUnit: TEdit
      Left = 490
      Top = 35
      Width = 87
      Height = 21
      TabOrder = 3
      OnExit = EditValorUnitExit
    end
    object EditValorTotal: TEdit
      Left = 600
      Top = 35
      Width = 81
      Height = 21
      TabOrder = 5
    end
    object EditLcto: TEdit
      Left = 16
      Top = 35
      Width = 57
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object DBEditTotalVenda: TDBEdit
      Left = 704
      Top = 35
      Width = 84
      Height = 21
      DataField = 'VALOR_VENDA'
      DataSource = DataSourceCadastro
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
  end
  object PanelItems: TPanel [3]
    Left = 0
    Top = 263
    Width = 1023
    Height = 343
    Align = alClient
    TabOrder = 3
    object DBGridItensVenda: TDBGrid
      Left = 1
      Top = 1
      Width = 1021
      Height = 341
      Align = alClient
      DataSource = DataSourceItemNota
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridItensVendaDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'LCTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Title.Caption = 'Cod Produto'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescProduto'
          Title.Caption = 'Descri'#231#227'o do Produto'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE'
          Title.Caption = 'Quantidade'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_UNIT'
          Title.Caption = 'Valor Unit'#225'rio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Caption = 'Total Produto'
          Visible = True
        end>
    end
  end
  inherited PanelCampos: TPanel
    Top = 263
    Width = 1023
    Height = 343
  end
  inherited DataSourceCadastro: TDataSource
    Left = 984
    Top = 304
  end
  inherited FDQueryCadastro: TFDQuery
    AfterOpen = FDQueryCadastroAfterOpen
    AfterScroll = FDQueryCadastroAfterScroll
    SQL.Strings = (
      'select * from venda;')
    Left = 984
    Top = 240
    object FDQueryCadastroNRNOTA: TIntegerField
      FieldName = 'NRNOTA'
      Origin = 'NRNOTA'
      Required = True
    end
    object FDQueryCadastroEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object FDQueryCadastroCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Required = True
    end
    object FDQueryCadastroTIPO_VENDA: TWideStringField
      FieldName = 'TIPO_VENDA'
      Origin = 'TIPO_VENDA'
      FixedChar = True
      Size = 1
    end
    object FDQueryCadastroVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      Precision = 18
    end
    object FDQueryCadastroOPERACAO_VENDA: TWideStringField
      FieldName = 'OPERACAO_VENDA'
      Origin = 'OPERACAO_VENDA'
      FixedChar = True
      Size = 1
    end
  end
  inherited FDUpdateSQLCadastro: TFDUpdateSQL
    Left = 984
    Top = 376
  end
  object FDQueryProduto: TFDQuery [8]
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from produtos;')
    Left = 56
    Top = 272
    object FDQueryProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryProdutoDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 35
    end
    object FDQueryProdutoREFERENCIA: TWideStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 15
    end
    object FDQueryProdutoUNIDADE: TWideStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object FDQueryProdutoDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
    end
    object FDQueryProdutoPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Precision = 18
    end
    object FDQueryProdutoSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
    end
  end
  object DataSourceItemNota: TDataSource [9]
    DataSet = FDQueryItemNota
    Left = 408
    Top = 304
  end
  object FDQueryItemNota: TFDQuery [10]
    AfterPost = FDQueryItemNotaAfterPost
    AfterCancel = FDQueryItemNotaAfterCancel
    AfterDelete = FDQueryItemNotaAfterDelete
    Connection = dmDados.FDConnection
    Transaction = FDTransactionItemNota
    SQL.Strings = (
      'select * from item_venda'
      'where nr_venda = :nr_venda'
      '')
    Left = 408
    Top = 368
    ParamData = <
      item
        Name = 'NR_VENDA'
        ParamType = ptInput
      end>
    object FDQueryItemNotaLCTO: TIntegerField
      FieldName = 'LCTO'
      Origin = 'LCTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryItemNotaNR_VENDA: TIntegerField
      FieldName = 'NR_VENDA'
      Origin = 'NR_VENDA'
    end
    object FDQueryItemNotaPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
    end
    object FDQueryItemNotaQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Precision = 18
    end
    object FDQueryItemNotaVALOR_UNIT: TBCDField
      FieldName = 'VALOR_UNIT'
      Origin = 'VALOR_UNIT'
      Precision = 18
    end
    object FDQueryItemNotaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
    end
    object FDQueryItemNotaDescProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'DescProduto'
      LookupDataSet = FDQueryProduto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO'
      Size = 35
      Lookup = True
    end
  end
  object FDTransactionItemNota: TFDTransaction [11]
    Connection = dmDados.FDConnection
    Left = 408
    Top = 425
  end
  object FDQueryCliente: TFDQuery [12]
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from cliente')
    Left = 56
    Top = 329
  end
  object FDQueryProduto1: TFDQuery [13]
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from produtos;')
    Left = 56
    Top = 385
  end
  object FDQueryItemVenda: TFDQuery [14]
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'SELECT max(lcto) FROM item_venda')
    Left = 56
    Top = 441
    object FDQueryItemVendaMAX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAX'
      Origin = '"MAX"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  inherited FDTransactionCadastro: TFDTransaction
    Left = 984
    Top = 440
  end
  inherited ImageList1: TImageList
    Left = 408
    Top = 264
    Bitmap = {
      494C010104000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000058A4710058A4710058A4710058A4710058A4710058A471000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCD2E200B9BDCF00000000000000000000000000000000000000
      00000000000056A26C0084D5B1005ED09D005ED09D0070C79C0053A06A000000
      000000000000000000000000000000000000000000003D3D3D0041414100A5A5
      A500ADADAD00A8A8A800A6A6A600A2A2A200A0A0A0009D9D9D009A9A9A009A9A
      9A00919191003D3D3D00353535000000000000000000000000003B46E200616B
      F9003842E000000000000000000000000000000000000000000000000000616B
      F900616BF9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8D1E3005BD3F90077DBF400707B9B000000000000000000000000000000
      00000000000053A069008CD8B60062D19F0062D19F0073C89E00509E67000000
      00000000000000000000000000000000000000000000949494004B4B4B00128B
      F300128BF300128BF300128BF300128BF300128BF300128BF300128BF300128B
      F300128BF3007F7F7F005050500000000000000000003A44E1005660F1007E87
      FE00626CF90000000000000000000000000000000000000000003842E0007E87
      FE00737CFE003A44E10000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8D2
      E5002963AC007EE3FA0045AFF100255099000000000000000000000000000000
      0000000000004D9A600097DDBE006CD3A5006CD3A5007ACBA2004A985E000000
      000000000000000000000000000000000000000000003E3E3E0041414100F0F0
      F00000000000FDFDFD00FAFAFA00F3F3F300F0F0F000EAEAEA00E7E7E700E7E7
      E700D5D5D50030303000212121000000000000000000464FE7005961F1006B74
      FE007882FE00616BF9003943E1000000000000000000616BF900828CFE006B74
      FE00626BF800464FE7003741DF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9D5E9005CD5
      FC007FE3FA00177FE4001F5EB600000000000000000000000000000000000000
      00000000000049975C0099DEC00072D5A80072D5A8007FCBA50046955A000000
      000000000000000000000000000000000000000000004242420044444400EFEF
      EF000000000000000000FEFEFE00F8F8F800F5F5F500EFEFEF00ECECEC00ECEC
      EC00D9D9D900303030002121210000000000000000003741DF004851E800646C
      F9006A73FD007B85FE005D67F700000000003B46E2007B85FE00747DFE00646C
      F9005C64F3003741DF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9D6EA002971C1007EE3
      FA0044AFF1001F63BD00C9D6EA000000000058A4710056A26C0053A069004D9A
      600049975C003E8E500098DEBF007ED8B0007ED8B0008ACFAB003E8E50004695
      5A004A985E00509E670053A06A0058A47100000000004C4C4C004B4B4B00EFEF
      EF0000000000000000000000000000000000FEFEFE00F8F8F800F5F5F500F5F5
      F500E2E2E2002F2F2F0021212100000000000000000000000000000000004750
      E7005860F100616AF700646DF9006770FB006770FB00616AF7005D65F4004750
      E7003741DF000000000000000000000000000000000000000000FDFCFC006A63
      6C00483F480053495200453B4500A8A3A800F7F7F700B4C2D5002E79C8001780
      E4001F6CC80000000000000000000000000058A4710074CAA00072C89D0078CB
      A1007ECBA40088CFAA008ED0AD0085DAB40085DAB40077C9A00072C89D0078CB
      A1007ECBA40088CFAA008ED0AD0058A4710000000000515151004E4E4E00EFEF
      EF000000000000000000000000000000000000000000FDFDFD00FAFAFA00FBFB
      FB00E6E6E6002F2F2F0021212100000000000000000000000000000000003640
      DE00424AE300575FF0005A62F2005C64F3005C64F300575FF0004E55E9003640
      DE000000000000000000000000000000000000000000EFEEEF006C646E00AD9D
      6F00FBDCAC00FFEECD00FFF5CC0060626300483C48009CA1B60091A9BC001F70
      D200C9DBF10000000000000000000000000058A4710093DDBC0093DDBC0093DD
      BC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DD
      BC0093DDBC0093DDBC0093DDBC0058A47100000000005B5B5B0055555500F0F0
      F000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F0002F2F2F0021212100000000000000000000000000000000000000
      000000000000575FF0005A62F2005C64F3005C64F300575FF0003640DE000000
      000000000000000000000000000000000000000000008D734F00EAB48600F6BD
      9100FFD8B600FFEED200FFF3D700FFFDE900FFFEF000463C4900CDC9CD000000
      00000000000000000000000000000000000058A4710099DFC00099DFC00099DF
      C00099DFC00099DFC00099DFC00099DFC00099DFC00099DFC00099DFC00099DF
      C00099DFC00099DFC00099DFC00058A47100000000006060600059595900E9E9
      E900FCFCFC00F4F4F400F4F4F400F5F5F500F5F5F500F5F5F500F5F5F5000000
      0000EAEAEA003131310022222200000000000000000000000000000000000000
      00003640DE00575FF0005A62F2005C64F3005C64F300575FF0004E55E9000000
      000000000000000000000000000000000000C9C6CB00DAA57400EDB48900F8BF
      9300FFDAB900FFEED500FFF4DA00FFFDEF00FFFEF7006B717500A5A1A7000000
      00000000000000000000000000000000000058A4710094DDBD0098DEBF0099DE
      C00097DDBE008CD8B60084D5B100A7E3C800A7E3C8007AD0A6009ADFC00099DE
      C00097DDBE008CD8B60084D5B10058A47100000000006B6B6B006A6A6A006262
      6200606060004E4E4E004A4A4A0045454500424242003D3D3D003A3A3A003737
      370037373700343434002D2D2D00000000000000000000000000000000004750
      E7005860F100616AF700646DF9006770FB006770FB00616AF7005D65F4004750
      E7003741DF0000000000000000000000000070647100DDA47900D39A6F00FFD0
      AC00FFDABC00FFEBD400FFEED700FFF7E100FFF8E100FFFAD7005D525F000000
      00000000000000000000000000000000000058A4710053A06A00509E67004A98
      5E0046955A003E8E50008CD8B600ADE5CC00ADE5CC0080D1A9003E8E50004997
      5C004D9A600053A0690056A26C0058A4710000000000707070006A6A6A005E5E
      5E005A5A5A0060606000616161005959590055555500535353004F4F4F004242
      42003B3B3B0038383800333333000000000000000000000000003741DF005A62
      F200616AF7006D76FE00717BFE003B46E2006B74FE006D76FE00666FFA005A62
      F2004851E8000000000000000000000000007C6A7800DAA17600EFB68B00E5AC
      8100FDC49800FFEFE000FFECD500FFF2DA00FFF4DA00FFF2CF007D7179000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000049975C0097DDBE00B9E8D300B9E8D3008CD2AE0046955A000000
      0000000000000000000000000000000000000000000075757500414141003030
      3000202020000000000000000000ECECEC00EAEAEA00B1B1B100B3B3B300C7C7
      C7008D8D8D00404040003D3D3D000000000000000000464FE7005961F1006B74
      FE007882FE00616BF9003943E1000000000000000000616BF900828CFE006B74
      FE00626BF800464FE7003741DF000000000082778800D0976C00F3BA8F00FFEE
      E200FFF9F500FFCBA300FFE6D100FFE5CB00FFE7CD00FFECC2006A5E6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D9A600099DEC000BEE9D600BEE9D60091D3B1004A985E000000
      000000000000000000000000000000000000000000007A7A7A00444444003434
      340025252500F7F7F700FAFAFA00E3E3E300E6E6E6005D5D5D0070707000C3C3
      C30089898900444444004141410000000000000000004C54EA006169F600757F
      FE00848DFE003842E0000000000000000000000000003842E000636DFA00757F
      FE006972FC004C54EA003842E00000000000A8A0AC00CB926700EBB28700FFEA
      DA00FFF1E700F1B88D00FFDBBF00FED3AE00FFD8B600D3C59400796F7C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000053A0690098DEBF00C7EBDB00C7EBDB009BD4B500509E67000000
      0000000000000000000000000000000000000000000082828200484848003434
      340027272700F5F5F500FAFAFA00E2E2E200E6E6E6005151510067676700C2C2
      C2008C8C8C004C4C4C004A4A4A000000000000000000000000003B46E200616B
      F9003842E000000000000000000000000000000000000000000000000000616B
      F900616BF900000000000000000000000000000000009D7E5C00C0885C00EEB5
      8A00FBC29700EEB58A00D1986D00F1B88D00F4BE9100847A8900FCFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000056A26C0094DDBD00CAECDD00CAECDD009ED5B70053A06A000000
      0000000000000000000000000000000000000000000088888800454545002F2F
      2F00212121000000000000000000ECECEC00EAEAEA009B9B9B00A2A2A200C6C6
      C60093939300505050004E4E4E00000000000000000000000000000000003A44
      E200000000000000000000000000000000000000000000000000000000003A44
      E2003B46E200000000000000000000000000000000009C929F00A0825F00CD94
      6900D69D7200DBA27700E3AA7F00DFAC7B00AB976F00E9E8EB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000058A4710058A4710058A4710058A4710058A4710058A471000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7AF
      BA009D91A000A1939D00968B9B00D7D3D8000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81FFFFFFFFFFFF9F81F8001C7E7FFF0
      F81F800187C3FFE0F81F88018181FFC1F81F8C018103FF8100008F01E007C007
      00008F81E00F800700008FF1F81F801F00008011F01F001F00008001E007001F
      00008001C007001FF81F86018181001FF81F80018381001FF81F8001C7E7801F
      F81F8601EFE7803FF81FFFFFFFFFE0FF00000000000000000000000000000000
      000000000000}
  end
  object FDQueryVenda: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from venda')
    Left = 56
    Top = 497
    object FDQueryVendaEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
  end
end
