inherited frmFaturaCartao: TfrmFaturaCartao
  Caption = 'Cadastro de Faturas de Cart'#227'o'
  ClientHeight = 506
  ClientWidth = 787
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    Width = 787
    Height = 506
    inherited CardCadastro: TCard
      ExplicitWidth = 783
      ExplicitHeight = 505
      inherited pnlBotoesCad: TPanel
        ExplicitTop = 436
        ExplicitWidth = 783
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
        end
      end
      inherited PanelCampos: TPanel
        ExplicitWidth = 783
        ExplicitHeight = 395
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
        object lblObs: TLabel
          Left = 32
          Top = 104
          Width = 89
          Height = 19
          Caption = 'Observa'#231#245'es'
        end
        object lblDiaVcto: TLabel
          Left = 32
          Top = 173
          Width = 133
          Height = 19
          Caption = 'Dia de Vencimento'
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
          Left = 171
          Top = 173
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
        object edtObs: TEdit
          Left = 32
          Top = 129
          Width = 537
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 2
        end
        object edtDiaVcto: TEdit
          Left = 32
          Top = 198
          Width = 161
          Height = 27
          Color = clWhite
          MaxLength = 2
          NumbersOnly = True
          TabOrder = 3
        end
        object gbDadosCad: TGroupBox
          Left = 32
          Top = 248
          Width = 411
          Height = 105
          Caption = 'Informa'#231#245'es de Cadastro'
          Color = clWhite
          ParentBackground = False
          ParentColor = False
          TabOrder = 4
          object lblDt: TLabel
            Left = 16
            Top = 30
            Width = 121
            Height = 19
            Caption = 'Data de Cadastro'
          end
          object lblDtAlt: TLabel
            Left = 216
            Top = 30
            Width = 125
            Height = 19
            Caption = 'Data de Altera'#231#227'o'
          end
          object edtDtAlt: TEdit
            Left = 216
            Top = 55
            Width = 169
            Height = 27
            TabStop = False
            Color = 11660926
            ReadOnly = True
            TabOrder = 1
          end
          object edtDtCad: TEdit
            Left = 16
            Top = 55
            Width = 169
            Height = 27
            TabStop = False
            Color = 11660926
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      inherited PanelTitulo: TPanel
        ExplicitWidth = 783
        inherited lblTitulo: TLabel
          Width = 315
          Caption = 'Cadastrando uma nova Fatura de Cart'#227'o'
          Color = 5934893
          ExplicitWidth = 315
        end
      end
    end
    inherited CardPesquisa: TCard
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 787
      ExplicitHeight = 506
      inherited pnlPesquisa: TPanel
        ExplicitWidth = 787
        object lblStatus: TLabel [1]
          Left = 278
          Top = 15
          Width = 49
          Height = 19
          Align = alCustom
          Caption = 'Status:'
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
          Width = 234
          OnChange = edtPesquisarChange
          ExplicitWidth = 234
        end
        inherited btnPesquisae: TButton
          OnClick = btnPesquisaeClick
          ExplicitLeft = 663
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
      end
      inherited pnlBotoes: TPanel
        ExplicitTop = 437
        ExplicitWidth = 787
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
        end
        inherited btnImprimir: TButton
          OnClick = btnImprimirClick
        end
        inherited btnSair: TButton
          ExplicitLeft = 663
        end
      end
      inherited pnlGrid: TPanel
        ExplicitWidth = 787
        ExplicitHeight = 356
        inherited DBGrid1: TDBGrid
          DataSource = DataSourceFaturaCartao
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_FT'
              Title.Caption = 'Cod'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIA_VCTO'
              Title.Caption = 'Dia Vencimento'
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_FT'
              Title.Caption = 'Status'
              Visible = True
            end>
        end
      end
    end
  end
  object DataSourceFaturaCartao: TDataSource
    DataSet = dmFaturaCartao.cdsFaturaCartao
    Left = 665
    Top = 266
  end
end
