inherited frmCaixa: TfrmCaixa
  Caption = 'Caixa'
  ClientHeight = 616
  ClientWidth = 1108
  WindowState = wsMaximized
  ExplicitWidth = 1120
  ExplicitHeight = 654
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    Width = 1108
    Height = 616
    ExplicitWidth = 1104
    ExplicitHeight = 615
    inherited CardCadastro: TCard
      Width = 1106
      Height = 614
      ExplicitWidth = 1106
      ExplicitHeight = 614
      inherited pnlBotoesCad: TPanel
        Top = 545
        Width = 1106
        ExplicitTop = 545
        ExplicitWidth = 1106
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
        end
      end
      inherited PanelCampos: TPanel
        Width = 1106
        Height = 504
        ExplicitWidth = 1106
        ExplicitHeight = 504
        object lblNDoc: TLabel
          Left = 40
          Top = 48
          Width = 105
          Height = 19
          Caption = 'N'#186' Documento'
        end
        object lblDesc: TLabel
          Left = 42
          Top = 136
          Width = 67
          Height = 19
          Caption = 'Descri'#231#227'o'
        end
        object lblValor: TLabel
          Left = 256
          Top = 48
          Width = 61
          Height = 19
          Caption = 'Valor R$'
        end
        object lblData: TLabel
          Left = 463
          Top = 48
          Width = 32
          Height = 19
          Caption = 'Data'
        end
        object lblReceita: TLabel
          Left = 40
          Top = 327
          Width = 254
          Height = 23
          Caption = 'Receita: Lucros, contas a receber.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5737262
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object lblDespesa: TLabel
          Left = 40
          Top = 356
          Width = 210
          Height = 23
          Caption = 'Despesa: Gastos em gerais.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5737262
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object edtNDoc: TEdit
          Left = 40
          Top = 73
          Width = 185
          Height = 27
          Color = clWhite
          MaxLength = 20
          TabOrder = 0
        end
        object edtValor: TEdit
          Left = 256
          Top = 73
          Width = 185
          Height = 27
          Color = clWhite
          MaxLength = 16
          TabOrder = 1
          OnExit = edtValorExit
        end
        object RadioGroup: TRadioGroup
          Left = 40
          Top = 256
          Width = 401
          Height = 57
          Caption = 'Tipo'
          Columns = 2
          Items.Strings = (
            'Receita'
            'Despesa')
          TabOrder = 4
        end
        object DateTimePicker: TDateTimePicker
          Left = 462
          Top = 73
          Width = 186
          Height = 27
          Date = 45099.000000000000000000
          Time = 0.866143263890990100
          TabOrder = 2
        end
        object memDesc: TMemo
          Left = 40
          Top = 161
          Width = 610
          Height = 64
          MaxLength = 200
          TabOrder = 3
        end
      end
      inherited PanelTitulo: TPanel
        Width = 1106
        ExplicitWidth = 1106
        inherited lblTitulo: TLabel
          Width = 325
          Caption = 'Inserindo um novo Lan'#231'amento no Caixa'
          ExplicitWidth = 325
        end
      end
    end
    inherited CardPesquisa: TCard
      Width = 1106
      Height = 614
      ExplicitWidth = 1102
      ExplicitHeight = 613
      inherited pnlPesquisa: TPanel
        Width = 1106
        Height = 145
        ExplicitWidth = 1102
        ExplicitHeight = 145
        object lblTipo: TLabel [1]
          Left = 353
          Top = 13
          Width = 122
          Height = 19
          Align = alCustom
          Caption = 'Tipo Lan'#231'amento'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object lblDataFinal: TLabel [2]
          Left = 176
          Top = 71
          Width = 70
          Height = 19
          Align = alCustom
          Caption = 'Data Final'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object lblDataInicial: TLabel [3]
          Left = 16
          Top = 71
          Width = 79
          Height = 19
          Align = alCustom
          Caption = 'Data Inicial'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        inherited edtPesquisar: TEdit
          Width = 297
          ExplicitWidth = 297
        end
        inherited btnPesquisae: TButton
          Left = 982
          Top = 30
          Height = 85
          Margins.Top = 30
          Margins.Bottom = 30
          OnClick = btnPesquisaeClick
          ExplicitLeft = 978
          ExplicitTop = 30
          ExplicitHeight = 85
        end
        object cbTipoLcto: TComboBox
          Left = 353
          Top = 38
          Width = 145
          Height = 27
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'TODOS'
          Items.Strings = (
            'TODOS'
            'RECEITA'
            'DESPESA')
        end
        object dateFinal: TDateTimePicker
          Left = 176
          Top = 96
          Width = 137
          Height = 27
          Date = 45146.000000000000000000
          Time = 0.872988819442980500
          ShowCheckbox = True
          TabOrder = 3
        end
        object dateInicial: TDateTimePicker
          Left = 16
          Top = 96
          Width = 137
          Height = 27
          Date = 45146.000000000000000000
          Time = 0.872988819442980500
          ShowCheckbox = True
          TabOrder = 4
        end
        object gbFiltros: TGroupBox
          Left = 567
          Top = 14
          Width = 210
          Height = 67
          Caption = 'Ordenar consulta por'
          Color = clWhite
          DefaultHeaderFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWhite
          HeaderFont.Height = -16
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 5
          object rbData: TRadioButton
            Left = 3
            Top = 33
            Width = 118
            Height = 17
            Caption = 'Data'
            Color = 5934893
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object rbValor: TRadioButton
            Left = 79
            Top = 31
            Width = 50
            Height = 17
            Caption = 'Valor'
            Color = 5934893
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object rbId: TRadioButton
            Left = 155
            Top = 31
            Width = 54
            Height = 17
            Caption = 'ID'
            Checked = True
            Color = 5934893
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
            TabStop = True
          end
        end
      end
      inherited pnlBotoes: TPanel
        Top = 545
        Width = 1106
        ExplicitTop = 544
        ExplicitWidth = 1102
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
        end
        inherited btnSair: TButton
          Left = 982
          ExplicitLeft = 978
        end
        object gbLegenda: TGroupBox
          AlignWithMargins = True
          Left = 848
          Top = 4
          Width = 128
          Height = 61
          Align = alRight
          Caption = 'Legendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          ExplicitLeft = 844
          object lblCorReceita: TLabel
            Left = 31
            Top = 16
            Width = 41
            Height = 13
            Caption = 'Receitas'
          end
          object lblCorDespesa: TLabel
            Left = 31
            Top = 36
            Width = 46
            Height = 13
            Caption = 'Despesas'
          end
          object pnlReceita: TPanel
            Left = 11
            Top = 17
            Width = 14
            Height = 14
            Color = clHotLight
            ParentBackground = False
            TabOrder = 0
          end
          object pnlVencida: TPanel
            Left = 11
            Top = 37
            Width = 14
            Height = 14
            Color = 5198079
            ParentBackground = False
            TabOrder = 1
          end
        end
      end
      inherited pnlGrid: TPanel
        Top = 145
        Width = 1106
        Height = 400
        ExplicitTop = 145
        ExplicitWidth = 1102
        ExplicitHeight = 399
        inherited DBGrid1: TDBGrid
          Width = 1104
          Height = 398
          DataSource = DataSourceCaixa
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Title.Caption = 'Id'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_cadastro'
              Title.Caption = 'Data'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numero_doc'
              Title.Caption = 'N'#186' Documento'
              Width = 134
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 477
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo'
              Title.Caption = 'Tipo'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor'
              Title.Caption = 'Valor R$'
              Width = 110
              Visible = True
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 752
    Top = 168
  end
  object DataSourceCaixa: TDataSource
    DataSet = dmCaixa.cdsCaixa
    Left = 744
    Top = 240
  end
end
