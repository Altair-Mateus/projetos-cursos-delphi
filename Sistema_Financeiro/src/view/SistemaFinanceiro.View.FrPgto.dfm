inherited frmFrPgto: TfrmFrPgto
  Caption = 'Cadastro de Formas de Pagamento'
  ClientWidth = 791
  ExplicitWidth = 803
  ExplicitHeight = 543
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    Width = 791
    ActiveCard = CardCadastro
    ExplicitWidth = 787
    ExplicitHeight = 504
    inherited CardCadastro: TCard
      Width = 789
      Height = 503
      ExplicitWidth = 789
      ExplicitHeight = 503
      inherited pnlBotoesCad: TPanel
        Top = 434
        Width = 789
        ExplicitTop = 434
        ExplicitWidth = 789
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
        end
      end
      inherited PanelCampos: TPanel
        Width = 789
        Height = 393
        ExplicitWidth = 789
        ExplicitHeight = 393
        object LabelNome: TLabel
          Left = 32
          Top = 40
          Width = 42
          Height = 19
          Caption = 'Nome'
        end
        object LabelStatus: TLabel
          Left = 400
          Top = 68
          Width = 43
          Height = 19
          Caption = 'Status'
        end
        object lblDesc: TLabel
          Left = 32
          Top = 112
          Width = 67
          Height = 19
          Caption = 'Descri'#231#227'o'
        end
        object Label5: TLabel
          Left = 80
          Top = 40
          Width = 10
          Height = 19
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 111
          Top = 112
          Width = 10
          Height = 19
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtNome: TEdit
          Left = 32
          Top = 65
          Width = 329
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 0
        end
        object ToggleStatus: TToggleSwitch
          Left = 464
          Top = 66
          Width = 105
          Height = 21
          Color = 9750962
          DisabledColor = 5737262
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          FrameColor = 5737262
          ParentFont = False
          State = tssOn
          StateCaptions.CaptionOn = 'Ativo'
          StateCaptions.CaptionOff = 'Inativo'
          TabOrder = 1
          TabStop = False
          ThumbColor = 5737262
        end
        object edtDesc: TEdit
          Left = 32
          Top = 137
          Width = 537
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 2
        end
        object gbMetodo: TGroupBox
          Left = 32
          Top = 197
          Width = 193
          Height = 180
          Caption = 'M'#233'todo de Pagamento'
          TabOrder = 3
          object rbDinheiro: TRadioButton
            Left = 16
            Top = 32
            Width = 113
            Height = 17
            Caption = 'Dinheiro'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rbCCred: TRadioButton
            Left = 16
            Top = 55
            Width = 137
            Height = 17
            Caption = 'Cart'#227'o Cr'#233'dito'
            TabOrder = 1
          end
          object rbPix: TRadioButton
            Left = 16
            Top = 103
            Width = 113
            Height = 17
            Caption = 'Pix'
            TabOrder = 2
          end
          object rbCDeb: TRadioButton
            Left = 16
            Top = 80
            Width = 137
            Height = 17
            Caption = 'Cart'#227'o D'#233'bito'
            TabOrder = 3
          end
          object rbDv: TRadioButton
            Left = 16
            Top = 149
            Width = 113
            Height = 17
            Caption = 'Diversos'
            TabOrder = 4
          end
          object rbCheque: TRadioButton
            Left = 16
            Top = 126
            Width = 113
            Height = 17
            Caption = 'Cheque'
            TabOrder = 5
          end
        end
      end
      inherited PanelTitulo: TPanel
        Width = 789
        ExplicitWidth = 789
        inherited lblTitulo: TLabel
          Width = 332
          Caption = 'Inserindo uma nova Forma de Pagamento'
          Color = 5934893
          ExplicitWidth = 332
        end
      end
    end
    inherited CardPesquisa: TCard
      Width = 789
      Height = 503
      ExplicitWidth = 785
      ExplicitHeight = 502
      inherited pnlPesquisa: TPanel
        Width = 789
        ExplicitWidth = 785
        object lblStatus: TLabel [1]
          Left = 278
          Top = 15
          Width = 93
          Height = 19
          Align = alCustom
          Caption = 'Status Forma'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object LBLmET: TLabel [2]
          Left = 414
          Top = 15
          Width = 158
          Height = 19
          Align = alCustom
          Caption = 'M'#233'todo de Pagamento'
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
          Width = 249
          OnChange = edtPesquisarChange
          ExplicitWidth = 249
        end
        inherited btnPesquisae: TButton
          Left = 665
          OnClick = btnPesquisaeClick
          ExplicitLeft = 661
        end
        object cbStatus: TComboBox
          Left = 278
          Top = 40
          Width = 120
          Height = 27
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'TODOS'
          OnClick = cbStatusClick
          Items.Strings = (
            'TODOS'
            'ATIVO'
            'INATIVO')
        end
        object cbMet: TComboBox
          Left = 414
          Top = 40
          Width = 158
          Height = 27
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 3
          Text = 'TODOS'
          OnClick = cbMetClick
          Items.Strings = (
            'TODOS'
            'DINHEIRO'
            'CART'#195'O CR'#201'DITO'
            'CART'#195'O D'#201'BITO'
            'PIX'
            'CHEQUE'
            'DIVERSOS')
        end
      end
      inherited pnlBotoes: TPanel
        Top = 434
        Width = 789
        ExplicitTop = 433
        ExplicitWidth = 785
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
        end
        inherited btnImprimir: TButton
          OnClick = btnImprimirClick
        end
        inherited btnSair: TButton
          Left = 665
          ExplicitLeft = 661
        end
      end
      inherited pnlGrid: TPanel
        Width = 789
        Height = 353
        ExplicitWidth = 785
        ExplicitHeight = 352
        inherited DBGrid1: TDBGrid
          Width = 787
          Height = 351
          DataSource = DataSourceFrPgto
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_FR'
              Title.Caption = 'Id'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_FR'
              Title.Caption = 'Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS'
              Title.Caption = 'Status'
              Width = 128
              Visible = True
            end>
        end
      end
    end
  end
  object DataSourceFrPgto: TDataSource
    DataSet = dmFrPgto.cdsFrPgto
    Left = 681
    Top = 266
  end
end
