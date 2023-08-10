inherited frmContasPagar: TfrmContasPagar
  Caption = 'Contas a Pagar'
  ClientHeight = 655
  ClientWidth = 1041
  Position = poDesigned
  WindowState = wsMaximized
  ExplicitTop = -127
  ExplicitWidth = 1053
  ExplicitHeight = 693
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    Width = 1041
    Height = 655
    ExplicitWidth = 1037
    ExplicitHeight = 654
    inherited CardCadastro: TCard
      Width = 1039
      Height = 653
      ExplicitWidth = 1039
      ExplicitHeight = 653
      inherited pnlBotoesCad: TPanel
        Top = 584
        Width = 1039
        ExplicitTop = 584
        ExplicitWidth = 1039
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
        end
      end
      inherited PanelCampos: TPanel
        Width = 1039
        Height = 543
        ExplicitWidth = 1039
        ExplicitHeight = 543
        object lblDesc: TLabel
          Left = 44
          Top = 32
          Width = 67
          Height = 19
          Caption = 'Descri'#231#227'o'
        end
        object lblDataCompra: TLabel
          Left = 258
          Top = 159
          Width = 120
          Height = 19
          Caption = ' Data da Compra'
        end
        object lblValorCompra: TLabel
          Left = 42
          Top = 159
          Width = 144
          Height = 19
          Caption = 'Valor da Compra R$'
        end
        object lblParcelamento: TLabel
          Left = 42
          Top = 249
          Width = 95
          Height = 19
          Caption = 'Parcelamento'
        end
        object lblNDoc: TLabel
          Left = 496
          Top = 159
          Width = 105
          Height = 19
          Caption = 'N'#186' Documento'
        end
        object memDesc: TMemo
          Left = 42
          Top = 57
          Width = 639
          Height = 64
          MaxLength = 200
          TabOrder = 0
        end
        object dateCompra: TDateTimePicker
          Left = 265
          Top = 184
          Width = 186
          Height = 27
          Date = 45099.000000000000000000
          Time = 0.866143263890990100
          TabOrder = 2
        end
        object edtValorCompra: TEdit
          Left = 42
          Top = 184
          Width = 185
          Height = 27
          Color = clWhite
          MaxLength = 16
          TabOrder = 1
          OnExit = edtValorCompraExit
        end
        object toggleParcelamento: TToggleSwitch
          Left = 168
          Top = 249
          Width = 84
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
          StateCaptions.CaptionOn = 'Sim'
          StateCaptions.CaptionOff = 'N'#227'o'
          TabOrder = 4
          ThumbColor = 5737262
          OnClick = toggleParcelamentoClick
        end
        object CardPanelParcela: TCardPanel
          Left = 40
          Top = 296
          Width = 793
          Height = 249
          ActiveCard = cardParcelaUnica
          BevelOuter = bvNone
          Caption = 'CardPanel1'
          TabOrder = 5
          object cardParcelaUnica: TCard
            Left = 0
            Top = 0
            Width = 793
            Height = 249
            Caption = 'cardParcelaUnica'
            CardIndex = 0
            TabOrder = 0
            object lblParcela: TLabel
              Left = 0
              Top = 0
              Width = 50
              Height = 19
              Caption = 'Parcela'
            end
            object lblValorParcela: TLabel
              Left = 218
              Top = 0
              Width = 138
              Height = 19
              Caption = 'Valor da Parcela R$'
            end
            object lblVencimento: TLabel
              Left = 0
              Top = 69
              Width = 83
              Height = 19
              Caption = 'Vencimento'
            end
            object edtParcela: TEdit
              Left = 0
              Top = 25
              Width = 185
              Height = 27
              Color = clWhite
              Enabled = False
              MaxLength = 10
              TabOrder = 0
            end
            object edtValorParcela: TEdit
              Left = 218
              Top = 25
              Width = 185
              Height = 27
              Color = clWhite
              Enabled = False
              MaxLength = 16
              TabOrder = 1
              OnExit = edtValorParcelaExit
            end
            object dateVencimento: TDateTimePicker
              Left = 0
              Top = 94
              Width = 185
              Height = 27
              Date = 45099.000000000000000000
              Time = 0.866143263890990100
              TabOrder = 2
            end
          end
          object cardParcelamento: TCard
            Left = 0
            Top = 0
            Width = 793
            Height = 249
            Caption = 'cardParcelamento'
            CardIndex = 1
            TabOrder = 1
            object lblQtdParcelas: TLabel
              Left = 4
              Top = 7
              Width = 165
              Height = 19
              Caption = 'Quantidade de Parcelas'
            end
            object lblIntervaloDias: TLabel
              Left = 217
              Top = 7
              Width = 125
              Height = 19
              Caption = 'Intervalo em Dias'
            end
            object edtQtdParcelas: TEdit
              Left = 4
              Top = 32
              Width = 183
              Height = 27
              Color = clWhite
              MaxLength = 10
              TabOrder = 0
            end
            object edtIntervaloDias: TEdit
              Left = 217
              Top = 32
              Width = 185
              Height = 27
              Color = clWhite
              MaxLength = 10
              TabOrder = 1
            end
            object btnGerar: TButton
              Left = 491
              Top = 0
              Width = 100
              Height = 57
              Caption = 'Gerar'
              ImageIndex = 7
              Images = ImageList1
              TabOrder = 2
              OnClick = btnGerarClick
            end
            object btnLimpar: TButton
              Left = 608
              Top = 0
              Width = 100
              Height = 57
              Caption = 'Limpar'
              ImageIndex = 8
              Images = ImageList1
              TabOrder = 3
              OnClick = btnLimparClick
            end
            object DBGridParcelas: TDBGrid
              Left = 2
              Top = 96
              Width = 704
              Height = 129
              Color = clCream
              DataSource = dsParcelas
              FixedColor = clCream
              TabOrder = 4
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -16
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PARCELA'
                  Title.Caption = 'Parcela'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DOCUMENTO'
                  Title.Caption = 'Documento'
                  Width = 113
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VENCIMENTO'
                  Title.Caption = 'Vencimento'
                  Width = 132
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR'
                  Title.Caption = 'Valor R$'
                  Visible = True
                end>
            end
          end
        end
        object edtNDoc: TEdit
          Left = 496
          Top = 184
          Width = 185
          Height = 27
          Color = clWhite
          MaxLength = 20
          TabOrder = 3
        end
      end
      inherited PanelTitulo: TPanel
        Width = 1039
        ExplicitWidth = 1039
        inherited lblTitulo: TLabel
          Left = 23
          ExplicitLeft = 23
        end
      end
    end
    inherited CardPesquisa: TCard
      Width = 1039
      Height = 653
      ExplicitWidth = 1035
      ExplicitHeight = 652
      inherited pnlPesquisa: TPanel
        Width = 1039
        Height = 145
        ExplicitWidth = 1035
        ExplicitHeight = 145
        object lblStatus: TLabel [1]
          Left = 353
          Top = 13
          Width = 89
          Height = 19
          Align = alCustom
          Caption = 'Status Conta'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object lblData: TLabel [2]
          Left = 353
          Top = 71
          Width = 98
          Height = 19
          Align = alCustom
          Caption = 'Filtrar data de'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object lblDataFinal: TLabel [3]
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
        object lblDataInicial: TLabel [4]
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
          Left = 915
          Top = 30
          Height = 85
          Margins.Top = 30
          Margins.Bottom = 30
          OnClick = btnPesquisaeClick
          ExplicitLeft = 911
          ExplicitTop = 30
          ExplicitHeight = 85
        end
        object cbStatus: TComboBox
          Left = 353
          Top = 38
          Width = 173
          Height = 27
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'TODAS'
          Items.Strings = (
            'TODAS'
            'PAGA'
            'ABERTA'
            'CANCELADA')
        end
        object gbFiltros: TGroupBox
          Left = 567
          Top = 14
          Width = 236
          Height = 109
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
          TabOrder = 3
          object rbDataVenc: TRadioButton
            Left = 3
            Top = 33
            Width = 118
            Height = 17
            Caption = 'Data Vencimento'
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
          object rbValorParcela: TRadioButton
            Left = 127
            Top = 33
            Width = 118
            Height = 17
            Caption = 'Valor Parcela'
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
          object rbValorCompra: TRadioButton
            Left = 127
            Top = 61
            Width = 118
            Height = 17
            Caption = 'Valor Compra'
            Color = 5934893
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object rbDataCompra: TRadioButton
            Left = 3
            Top = 61
            Width = 118
            Height = 17
            Caption = 'Data Compra'
            Color = 5934893
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object rbId: TRadioButton
            Left = 3
            Top = 90
            Width = 118
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
            TabOrder = 4
            TabStop = True
          end
        end
        object cbData: TComboBox
          Left = 353
          Top = 96
          Width = 173
          Height = 27
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 4
          Text = 'DATA COMPRA'
          Items.Strings = (
            'DATA COMPRA'
            'DATA VENCIMENTO'
            'DATA PAGAMENTO'
            'DATA CADASTRO')
        end
        object dateFinal: TDateTimePicker
          Left = 176
          Top = 96
          Width = 137
          Height = 27
          Date = 45146.000000000000000000
          Time = 0.872988819442980500
          ShowCheckbox = True
          TabOrder = 5
        end
        object dateInicial: TDateTimePicker
          Left = 16
          Top = 96
          Width = 137
          Height = 27
          Date = 45146.000000000000000000
          Time = 0.872988819442980500
          ShowCheckbox = True
          TabOrder = 6
        end
      end
      inherited pnlBotoes: TPanel
        Top = 584
        Width = 1039
        ExplicitTop = 583
        ExplicitWidth = 1035
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
        end
        inherited btnSair: TButton
          Left = 915
          ExplicitLeft = 911
        end
        object gbLegenda: TGroupBox
          AlignWithMargins = True
          Left = 672
          Top = 4
          Width = 237
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
          ExplicitLeft = 668
          object lblPagas: TLabel
            Left = 31
            Top = 16
            Width = 56
            Height = 13
            Caption = 'Conta Paga'
          end
          object lblVencida: TLabel
            Left = 31
            Top = 36
            Width = 69
            Height = 13
            Caption = 'Conta Vencida'
          end
          object lblCancelada: TLabel
            Left = 143
            Top = 16
            Width = 82
            Height = 13
            Caption = 'Conta Cancelada'
          end
          object lblNormal: TLabel
            Left = 143
            Top = 36
            Width = 65
            Height = 13
            Caption = 'Conta Normal'
          end
          object pnlPagas: TPanel
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
            Color = clRed
            ParentBackground = False
            TabOrder = 1
          end
          object pnlNormal: TPanel
            Left = 123
            Top = 37
            Width = 14
            Height = 14
            Color = clBlack
            ParentBackground = False
            TabOrder = 2
          end
          object pnlCancelada: TPanel
            Left = 123
            Top = 17
            Width = 14
            Height = 14
            Color = 15109094
            ParentBackground = False
            TabOrder = 3
          end
        end
        object btnBaixarCP: TButton
          AlignWithMargins = True
          Left = 508
          Top = 6
          Width = 121
          Height = 57
          Margins.Top = 5
          Margins.Bottom = 5
          Align = alLeft
          Caption = 'Baixar '
          Enabled = False
          ImageIndex = 9
          Images = ImageList1
          TabOrder = 6
          WordWrap = True
          OnClick = btnBaixarCPClick
        end
      end
      inherited pnlGrid: TPanel
        Top = 145
        Width = 1039
        Height = 439
        ExplicitTop = 145
        ExplicitWidth = 1035
        ExplicitHeight = 438
        inherited DBGrid1: TDBGrid
          Width = 1037
          Height = 437
          Color = clWhite
          DataSource = DataSourceCPagar
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_DOC'
              Title.Caption = 'N'#186' Documento'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PARCELA'
              Title.Caption = 'Parcela'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS'
              Title.Caption = 'Status'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_VENCIMENTO'
              Title.Caption = ' Vencimento'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_PARCELA'
              Title.Caption = 'Valor Parcela R$'
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_COMPRA'
              Title.Caption = 'Valor Compra R$'
              Width = 142
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_COMPRA'
              Title.Caption = 'Data da Compra'
              Width = 134
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_PAGAMENTO'
              Title.Caption = 'Data de Pagamento'
              Width = 149
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_ABATIDO'
              Title.Caption = 'Valor Abatido'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_CADASTRO'
              Title.Caption = 'Data de Cadastro'
              Width = 139
              Visible = True
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 832
    Bitmap = {
      494C01010A001800040020002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1EFEDFFF1EF
      EDFFF1EFEDFFF1EFEDFFF1EFEDFFF1EFEDFFF1EFEDFFF1EFEDFFF1EFEDFFF1EF
      EDFFD0CECCED0000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000051E3FFFF51E3FFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F1EFEDFFF1EFEDFFF1EFEDFFF1EFEDFFF1EFEDFFF1EF
      EDFFF1EFEDFFF1EFEDFF00000000000000000000000000000000000000000000
      00000000000000000000413024FF000000000000000000000000413024FF0000
      00000000000000000000413024FF000000000000000000000000413024FF0000
      00000000000000000000413024FF000000000000000000000000413024FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000051E3FFFF51E3FFFF51E3FFFF0000000F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1EFEDFFF1EFEDFFF1EFEDFFF1EF
      EDFFF1EFEDFFF1EFEDFFF1EFEDFF000000000000000000000000000000000000
      00000000000000000000FCECDEFF413024FF00000000DDCDBFFFFCECDEFF4130
      24FF00000000756458FFFCECDEFF413024FF00000000423125FFFCECDEFF4130
      24FF00000000413024FFFCECDEFF413024FF00000000413024FF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000051E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1EFEDFFF1EFEDFFF1EFEDFFF1EF
      EDFFF1EFEDFFF1EFEDFFF1EFEDFF000000000000000000000000000000000000
      00000000000000000000FCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCEC
      DEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCEC
      DEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000051E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F1EFEDFFF1EFEDFFF1EF
      EDFFF1EFEDFFF1EFEDFFF1EFEDFF000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCECDEFFFCECDEFFFCEC
      DEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCEC
      DEFFFCECDEFFFCECDEFFDE6E18FFFCD9C0FFFCECDEFFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000051E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1EF
      EDFFF1EFEDFFF1EFEDFFF1EFEDFF000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCECDEFFFCEC
      DEFFFCECDEFF413024FFF27617FF413024FFFCE1CCFFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000266B78AF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1EF
      EDFFF1EFEDFFF1EFEDFFF1EFEDFF000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FF413024FF413024FF4130
      24FF413024FF413024FF413024FF413024FF413024FF413024FF413024FFFCEC
      DEFF4A392CFFF27617FFF27617FF413024FF413024FFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000051E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000091908FC600000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF1E9FFFCECDEFFFCECDEFFFCECDEFFFCEC
      DEFF413024FF413024FFF27617FFFCD9C0FFF27617FFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000051E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCECDEFFFCECDEFFFCEC
      DEFFF7E7D9FFFCECDEFFF27617FF413024FF563822FFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000051E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF4EDAF5FA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCECDEFFFCEC
      DEFFFCECDEFFD06919FFF27617FF413024FFFCECDEFFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000051E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCEC
      DEFF413024FF413024FFF27617FFFCD9C0FF413024FFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000051E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FF413024FF413024FFF27617FFFBD7BEFFF27617FFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000051E3FFFF51E3FFFF51E3FFFF35B2FFFF35B2FFFF51E3FFFF51E3FFFF51E3
      FFFF35B2FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF000000000000000000000000AAB0
      FFFFAAB0FFFFAAB0FFFF00000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFF27617FFF27617FFF27617FF413024FFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000966B
      5AE7B7836DFF51E3FFFF51E3FFFF35B2FFFF51E3FFFF51E3FFFF51E3FFFF35B2
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF00000000000000000000000000000000AAB0
      FFFF51E3FFFFAAB0FFFF00000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFF27617FFFBD8BFFFFCECDEFFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B783
      6DFFB7836DFFB7836DFFB7836DFF51E3FFFF51E3FFFF51E3FFFF35B2FFFF35B2
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF51E3FFFF00000000000000000000000000000000000000000000
      0000AAB0FFFFAAB0FFFF00000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FF413024FF413024FF4130
      24FF413024FF413024FF413024FF413024FF413024FF413024FF413024FF4130
      24FFFCF5F0FFFCF5F0FF413024FFFCECDEFFFCECDEFFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B783
      6DFFB7836DFFB7836DFFB7836DFFB7836DFFB7836DFF51E3FFFF35B2FFFF51E3
      FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF51E3FFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCECDEFFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B7836DFFB7836DFFB7836DFFB7836DFFB7836DFFB7836DFFB7846EFF51E3
      FFFF51E3FFFF35B2FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCECDEFFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B7836DFFB7836DFFB7836DFFB7836DFFB7836DFFB783
      6DFF39B9FFFF35B2FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF0000
      00000000000000000000AAB0FFFFAAB0FFFF2426377700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FF413024FF413024FF4130
      24FF413024FF413024FF413024FF413024FF413024FF413024FF413024FF4130
      24FF413024FF413024FF413024FFFCF5F0FFFCF5F0FFFCECDEFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B7836DFFB7836DFFB7836DFFB7836DFFB7836DFFB783
      6DFFB7836DFFB7836DFF51E3FFFF51E3FFFF51E3FFFF51E3FFFF000000000000
      00000000000000000000AAB0FFFFAAB0FFFFAAB0FFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5EFFF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B7836DFFB7836DFFB7836DFFB7836DFFB7836DFFB783
      6DFFB7836DFFB7836DFFB7836DFFB7836DFF51E3FFFF00000000000000000000
      000000000000AAB0FFFFAAB0FFFF51E3FFFFAAB0FFFF434565A1000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FFFCF5F0FF423125FF413024FF413024FF413024FF6F5A4BFFFCF5
      F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B7836DFFB7836DFFB7836DFFB7836DFFB7836DFF00000005B783
      6DFFB7836DFFB7836DFFB7836DFFB7836DFF0000000000000000000000000000
      00000000000000000000AAB0FFFFAAB0FFFFAAB0FFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FFFCF5F0FF545F19FF7DC900FF7DC900FF7DC900FF7DC900FF7DC900FF4130
      24FFFCD9C0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B7836DFFB7836DFFB7836DFFB7836DFFB7836DFF000000000000
      000000000000B7836DFFB7836DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5
      F0FF63960FFF7DE100FF7DE100FF7DE100FF7DE100FF7DC900FF7DC900FF7DC9
      00FF413024FFFCD9C0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B7836DFFB7836DFFB7836DFFB7836DFFB7836DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000636795C300000000000000000000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FF4130
      24FF7DE100FF7DE100FF413024FF413024FF7DE100FF7DE100FF7DCD00FF7DC9
      00FF7DC900FF705B4CFFFCE2CFFFFCF5F0FFFCF5F0FFFCF5F0FF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B7836DFFB7836DFFB7836DFFB7836DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AAB0
      FFFFAAB0FFFFAAB0FFFFAAB0FFFFAAB0FFFF0000000000000000000000000000
      00000000000000000000FCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FF463F
      21FF7DE100FF413024FFFCF5F0FFFCF5F0FFFCF5F0FF423323FF7DE100FF7DC9
      00FF7DC900FF413024FFFCD9C0FFFCF5F0FFFCF5F0FFFCF5F0FF423125FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B783
      6DFFB7836DFFB7836DFFB7836DFFB7836DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AAB0
      FFFFAAB0FFFFAAB0FFFFAAB0FFFFAAB0FFFF0000000000000000000000000000
      00000000000000000000E1D8D2FFFCF5F0FFFCF5F0FFFCF5F0FFFCF5F0FF7CDD
      00FF7DE100FFFCF5F0FFA5B17AFF659B0EFFDADDC1FFFCF5F0FF413024FF7DE1
      00FF7DC900FF413024FFFCD9C0FFFCF5F0FFFCF5F0FFFCF5F0FF413024FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7836DFFB783
      6DFFB7836DFFB7836DFFB7836DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AAB0FFFFAAB0
      FFFF51E3FFFF51E3FFFFAAB0FFFFAAB0FFFF0000000000000000000000000000
      000000000000000000003E2E23F9DED7D0FFFCF5F0FFFCF5F0FFFCF5F0FF5261
      1AFF7DE100FF413024FF7DE100FF7DE100FF7DE100FF413024FFFCF5F0FFFCF5
      F0FF7DE100FF413024FFFCD9C0FFFCF5F0FFFCF5F0FFBAB0A8FF0302023E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7836DFFB783
      6DFFB7836DFFB7836DFFB7836DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AAB0FFFFAAB0
      FFFFAAB0FFFF51E3FFFFAAB0FFFFAAB0FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004130
      24FF7DE100FF7DE100FF7DE100FF7DE100FF7DE100FF7DE100FF64970FFF4C4A
      25FF7DE100FF413024FE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7836DFFB7836DFFB783
      6DFFB7836DFFB7836DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AAB0
      FFFFAAB0FFFFAAB0FFFFAAB0FFFFAAB0FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007DE100FF7DE100FF7DE100FF7DE100FF7DE100FF7DE100FF7DE100FF7DE1
      00FF546818FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7836DFF00000000B783
      6DFFB7836DFF916756E300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AAB0FFFFAAB0FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000077DE100FF7DE100FF7DE100FF7DE100FF7DE100FF7DE100FF6392
      10FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009E705EEDB7836DFF000000000000
      0000B7836DFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000413024FF52611AFF7CDD00FF463E21FF413024FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7836DFFB7836DFFB783
      6DFF000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000B17F69FB0000
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
      000000000000000000000000000000000000000000000000000000000000EEA0
      0AFFEFA10AFFF1A309FFF2A409FFF3A508FFF4A608FFF5A707FFF6A807FFF7A9
      06FFEB9B06FFEE9F06FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000100
      0011DE8D3AEEDE8D3AEEDE8D3AEEF6EDD9FEF6EDD9FEF6EDD9FEF6EDD9FEF6ED
      D9FEF6EDD9FEF6EDD9FEF6EDD9FEF6EDD9FEF6EDD9FEF6EDD9FEF6EDD9FEF6ED
      D9FEF6EDD9FEF6EDD9FEF6EDD9FEF6EDD9FEF6EDD9FEF6EDD9FEDE8D3AEEDE8D
      3AEEDE8D3AEE0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000076C4FFFF76C4FFFF76C4FFFF76C4FFFF76C4
      FFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF76C4
      FFFF76C4FFFF76C4FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EB9D0CFFEC9E0CFFED9F
      0BFFEEA00AFFEFA10AFFF1A309FFF2A409FFF3A508FFF4A608FFF5A707FFE594
      08FFE89807FFEB9B06FFEE9F06FFF2A405FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF76C4
      FFFF76C4FFFF76C4FFFF5578FFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E89A0EFFE99B0DFFEA9C0DFFEB9D0CFFEC9E
      0CFFED9F0BFFEEA00AFFEFA10AFFF1A309FFF2A409FFF3A508FFDF8E09FFE291
      08FFE59408FFE89807FFEB9B06FFEE9F06FFF2A405FFF6A705FF000000000000
      00000000000000000000000000000000000000000000B3722ED6FFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF000000000000000000000000000000FF0000
      00FF0000000800000000000000FF000000FF000000FF000000FF000000FF0000
      00FF0000000000000000000000FF000000FF000000FFFBD000FF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFF7DC7FFFF76C4FFFF76C4FFFF76C4
      FFFF76C4FFFF76C4FFFF5578FFFF5578FFFF0000000400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E6980FFFE7990EFFE89A0EFFE99B0DFFEA9C0DFFEB9D
      0CFFEC9E0CFFED9F0BFFEEA00AFFEFA10AFFF1A309FFD9870AFFDB8A09FFDF8E
      09FFE29108FFE59408FFE89807FFEB9B06FFEE9F06FFF2A405FFF6A705FF0000
      00000000000000000000000000000000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      0000000000000000000000000000000000FFFBDB61FFFBDB61FFFBDB61FFFBDB
      61FFFBDB61FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD0
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AADAFFFFAADAFFFFAADAFFFF1098FFFF1098
      FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098
      FFFF76C4FFFF76C4FFFF5578FFFF5578FFFF5578FFFF00000009000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E39510FFE49610FFE6980FFFE7990EFFE89A0EFFE99B0DFFEA9C
      0DFFEB9D0CFFEC9E0CFFED9F0BFFEEA00AFFD3810BFFD6840AFFD9870AFFDB8A
      09FFDF8E09FFE29108FFE59408FFE89807FFEB9B06FFEE9F06FFF2A405FFF6A7
      05FF0000000000000000000000000000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FFF7F4E5FFEAE7D9FFEAE7
      D9FFEAE7D9FFEAE7D9FFEAE7D9FFEAE7D9FFEAE7D9FFEAE7D9FFEAE7D9FFEAE7
      D9FFEAE7D9FFEAE7D9FFEAE7D9FFF7F4E5FFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB00000000000000FF000000000000
      00CD000000FF000000FF000000FF000000FFFBDB61FFFBDB61FFFBDB61FFFBDB
      61FFFBDB61FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD0
      00FFFBD000FF000000FF00000085000000000000000000000000000000000000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000AADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E19311FFE29411FFE39510FFE49610FFE6980FFFE7990EFFE89A0EFFE99B
      0DFFEA9C0DFFEB9D0CFFEC9E0CFFCD7A0BFFD17D0BFFD3810BFFD6840AFFD987
      0AFFDB8A09FFDF8E09FFE29108FFE59408FFE89807FFEB9B06FFEE9F06FFF2A4
      05FFF6A705FF00000000000000000000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      0000000000000000000000000000000000FFFBDB61FFFBDB61FFFBDB61FFFBDB
      61FFFBDB61FFFBDB61FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD0
      00FF403500FF000000FF000000000000000000000000000000FF000000FF43C3
      FFFF43C3FFFF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000AADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFF000000000000
      000000000000000000000000000000000000000000000000000000000000DF91
      12FFE09212FFE19311FFE29411FFE39510FFE49610FFE6980FFFE7990EFFE89A
      0EFFE99B0DFFEA9C0DFFC8730CFFCA760CFFCD7A0BFFD17D0BFFD3810BFFD684
      0AFFD9870AFFDB8A09FFDF8E09FFE29108FFFFFFFFFFE89807FFEB9B06FFEE9F
      06FFF2A405FFF6A705FF000000000000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000FF0000
      00FF0000003500000000000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFFBD000FFFBD000FF0000
      00FF000000FF000000000000000000000000000000FF40BBF5FF76E1FFFF43C3
      FFFF43C3FFFF43C3FFFF43C3FFFF000000FF0000000000000000000000000000
      0000000000000000000000000000AADAFFFFAADAFFFFAADAFFFF1098FFFF1098
      FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098
      FFFF1098FFFF1098FFFF1098FFFF76C4FFFF76C4FFFF76C4FFFF000000000000
      000000000000000000000000000000000000000000000000000000000000DE90
      13FFDF9112FFE09212FFE19311FFE29411FFE39510FFE49610FFE6980FFFE799
      0EFFE89A0EFFC36E0DFFC5700CFFC8730CFFCA760CFFCD7A0BFFD17D0BFFD381
      0BFFD6840AFFD9870AFFDB8A09FFFFFFFFFFFFFFFFFFFFFFFFFFE89807FFEB9B
      06FFEE9F06FFF2A405FF000000000000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FFD3CFC2FF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFFEAE7D9FFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFFBD000FF000000FF0000
      000000000000000000000000000000000000000000FF76E1FFFF76E1FFFF0000
      00FF000000FF43C3FFFF43C3FFFF194A61FF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFF76C4FFFF76C4FFFF76C4FFFF76C4FFFFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FF000000000000000000000000DC8E14FFDD8F
      13FFDE9013FFDF9112FFE09212FFE19311FFE29411FFE39510FFE49610FFE698
      0FFFBF690DFFC26B0DFFC36E0DFFC5700CFFC8730CFFCA760CFFCD7A0BFFD17D
      0BFFD3810BFFD6840AFFFFFFFFFFFFFFFFFFFFFFFFFFE29108FFE59408FFE898
      07FFEB9B06FFEE9F06FFF2A405FF0000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000FF0000
      00FF000000FF000000FF00000000000000FF000000FF00000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      000000000000000000000000000000000000000000FF76E1FFFF000000FFFFFB
      F2FFFFFBF2FF000000FF43C3FFFF43C3FFFF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFF76C4FFFF76C4FFFF76C4FFFFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FF000000000000000000000000DB8D15FFDC8E
      14FFDD8F13FFDE9013FFDF9112FFE09212FFE19311FFE29411FFE39510FFBA63
      0DFFBC660DFFEED8C0FFFFFFFFFFFFFFFFFFC5700CFFC8730CFFCA760CFFCD7A
      0BFFD17D0BFFFFFFFFFFFFFFFFFFFFFFFFFFDB8A09FFDF8E09FFE29108FFE594
      08FFE89807FFEB9B06FFEE9F06FF0000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF33626FFFE3DFD7FF0000
      00FFFFFBF2FFFFFBF2FF000000FF43C3FFFF0000000000000000FF8823FFFF88
      23FFFF8823FFF06C00FFCE5D00FFAADAFFFFAADAFFFFAADAFFFF1098FFFF1098
      FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098FFFF1098
      FFFF1098FFFF1098FFFF1098FFFF7DC8FFFF76C4FFFF76C4FFFFCE5D00FFF06C
      00FFFF8823FFFF8823FFFF8823FF0000000000000000D88A16FFD98B15FFDB8D
      15FFDC8E14FFDD8F13FFDE9013FFDF9112FFE09212FFE19311FFB55E0EFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA76
      0CFFFFFFFFFFFFFFFFFFFFFFFFFFD6840AFFD9870AFFDB8A09FFDF8E09FFE291
      08FFE59408FFE89807FFEB9B06FFEE9F06FF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF2DE6
      A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6
      A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF000000FF76E1FFFF000000FF60B8
      D0FF000000FF000000FF000000FF43C3FFFF0000000000000000FF8823FFFF88
      23FFFF8823FFF06C00FFCE5D00FFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFF76C4FFFF76C4FFFFCE5D00FFF06C
      00FFFF8823FFFF8823FFFF8823FF0000000000000000D78916FFD88A16FFD98B
      15FFDB8D15FFDC8E14FFDD8F13FFDE9013FFDF9112FFD2D2D2FFD2D2D2FFD2D2
      D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD17D0BFFD3810BFFD6840AFFD9870AFFDB8A09FFDF8E
      09FFE29108FFE59408FFE89807FFF8AA05FF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      00000000000000000000000000FF000000FF0000000000000000000000FF2DE6
      A2FF2DE6A2FF2DE6A2FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF76E1FFFF76E1FFFF76E1
      FFFF76E1FFFF76E1FFFF43C3FFFF43C3FFFF0000000000000000FF8823FFFF88
      23FFFF8823FFF06C00FFCE5D00FFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFF76C4FFFF76C4FFFFCF5E00FFF06C
      00FFFF8823FFFF8823FFFF8823FF0000000000000000D68817FFD78916FFD88A
      16FFD98B15FFDB8D15FFDC8E14FFDD8F13FFF2E1C6FFD2D2D2FFD2D2D2FFD2D2
      D2FFB55E0EFFB7610EFFBA630DFFBC660DFFBF690DFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCA760CFFCD7A0BFFD17D0BFFD3810BFFD6840AFFD9870AFFDB8A
      09FFDF8E09FFE29108FFF6A807FFF7A906FF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      00000000000000000000000000FFFBD000FF000000FF00000000000000FF2DE6
      A2FF2DE6A2FF000000FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6
      A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF000000FF67C4DEFF76E1FFFF76E1
      FFFF76E1FFFF76E1FFFF43C3FFFF000000FF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFF06C00FFF06C00FFF06C00FFF06C00FFF06C00FFF06C
      00FFF06C00FFF06C00FFF06C00FFF06C00FFF06C00FFF06C00FFF06C00FFF06C
      00FFF06C00FFF06C00FFF06C00FFF06C00FFF06C00FFF06C00FFF06C00FFFF88
      23FFFF8823FFFF8823FFFF8823FF0000000000000000D58717FFD68817FFD789
      16FFD88A16FFD98B15FFDB8D15FFDC8E14FFD2D2D2FFD2D2D2FFD2D2D2FFB159
      0EFFB35C0DFFB55E0EFFB7610EFFBA630DFFBC660DFFBF690DFFC26B0DFFFFFF
      FFFFFFFFFFFFD79A4DFFCA760CFFCD7A0BFFD17D0BFFD3810BFFD6840AFFD987
      0AFFDB8A09FFF4A608FFF5A707FFF6A807FF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB000000A2000000FF000000FF0000
      00FF000000FF000000FF000000FFFBD000FFFBD000FF000000FF000000FF2DE6
      A2FF000000FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF0000
      00FF000000FF1E9A6CFF000000FF2AD999FF2DE6A2FF0D442FFF000000FF0000
      00FF000000FF000000FF000000FF26C78BFF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FF000000002D1C0576D48618FFD58717FFD688
      17FFD78916FFD88A16FFD98B15FFD2D2D2FFD2D2D2FFD2D2D2FFAE550DFFAF57
      0DFFB1590EFFB35C0DFFB55E0EFFB7610EFFBA630DFFBC660DFFBF690DFFFFFF
      FFFFFFFFFFFFFFFFFFFFC8730CFFCA760CFFCD7A0BFFD17D0BFFD3810BFFD684
      0AFFF2A409FFF3A508FFF4A608FFF5A707FF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB000000FFFBDB61FFFBDB61FFFBDB
      61FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FF000000FF0000
      00FF000000FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF000000FF1D98
      6AFF2DE6A2FF2DE6A2FF2DE6A2FF000000FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6
      A2FF2DE6A2FF2DE6A2FF000000FF26C78BFF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FF00000000D08219FED38519FFD48618FFD587
      17FFD68817FFD78916FFD88A16FFD2D2D2FFD2D2D2FFD2D2D2FFAC530EFFAE55
      0DFFAF570DFFB1590EFFB35C0DFFB55E0EFFB7610EFFBA630DFFBC660DFFBF69
      0DFFFFFFFFFFFFFFFFFFC5700CFFC8730CFFCA760CFFCD7A0BFFD17D0BFFEFA1
      0AFFF1A309FFF2A409FFF3A508FFF4A608FF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB000000FFFBDB61FFFBDB61FFFBDB
      61FFFBDB61FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD0
      00FF000000FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF000000FF2DE6
      A2FF2DE6A2FF2DE6A2FF2DE6A2FF000000FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6
      A2FF2DE6A2FF2DE6A2FF000000FF26C78BFF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FF000000003A240787D28419FFD38519FFD486
      18FFD58717FFD68817FFD78916FFD2D2D2FFD2D2D2FFA84F0DFFAA510DFFAC53
      0EFFAE550DFFAF570DFFB1590EFFB35C0DFFB55E0EFFB7610EFFBA630DFFBC66
      0DFFFFFFFFFFFFFFFFFFC36E0DFFC5700CFFC8730CFFCA760CFFED9F0BFFEEA0
      0AFFEFA10AFFF1A309FFF2A409FFF3A508FF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB000000FFFBDB61FFFBDB61FFFBDB
      61FFFBDB61FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FF000000FF0000
      00FF000000FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF000000FF2DE6
      A2FF2DE6A2FF2DE6A2FF2DE6A2FF000000FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6
      A2FF2DE6A2FF2DE6A2FF000000FF26C78BFF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FF0000000000000000D1831AFFD28419FFD385
      19FFD48618FFD58717FFD68817FFD2D2D2FFD2D2D2FFA64D0DFFA84F0DFFAA51
      0DFFAC530EFFAE550DFFAF570DFFB1590EFFB35C0DFFB55E0EFFB7610EFFBA63
      0DFFFFFFFFFFFFFFFFFFC26B0DFFC36E0DFFC5700CFFEB9D0CFFEC9E0CFFED9F
      0BFFEEA00AFFEFA10AFFF1A309FFF2A409FF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB000000E0000000FF000000FF0000
      0000000000FA000000FF000000FFFBD000FFFBD000FF000000FF000000FF2DE6
      A2FF000000FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF0000
      00FF000000FF2DE6A2FF000000FF0B3A28FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6
      A2FF2DE6A2FF2DE6A2FF000000FF26C78BFF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FF23AC5DFFFF8823FFFF8823FF231B
      EDFF231BEDFFFF8823FFFF8823FF0000000000000000CF811AFFD1831AFFD284
      19FFD38519FFD48618FFD58717FFD2D2D2FFD2D2D2FFD2D2D2FFA64D0DFFA84F
      0DFFAA510DFFAC530EFFAE550DFFAF570DFFB1590EFFB35C0DFFB55E0EFFB761
      0EFFFFFFFFFFFFFFFFFFBF690DFFC26B0DFFE99B0DFFEA9C0DFFEB9D0CFFEC9E
      0CFFED9F0BFFEEA00AFFEFA10AFFF1A309FF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      00000000000000000000000000FFFBD000FF000000FF00000000000000FF2DE6
      A2FF010705FF000000FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6
      A2FF2DE6A2FF0B3D2BFF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6
      A2FF000000FF000000FF26C78BFF26C78BFF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFF06C00FFF06C00FFF06C00FFF06C00FFF06C00FFF06C00FFF06C
      00FFFF8823FFFF8823FFFF8823FFFF8823FF23AC5DFFFF8823FFFF8823FF231B
      EDFF231BEDFFFF8823FFFF8823FF0000000000000000CE801BFFD0821AFFD183
      1AFFD28419FFD38519FFD48618FFD2D2D2FFD2D2D2FFD2D2D2FFA44B0DFFA64D
      0DFFA84F0DFFAA510DFFAC530EFFAE550DFFAF570DFFB1590EFFB35C0DFFD2D2
      D2FFFFFFFFFFFFFFFFFFBC660DFFE7990EFFE89A0EFFE99B0DFFEA9C0DFFEB9D
      0CFFEC9E0CFFED9F0BFFEEA00AFFEFA10AFF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      00000000000000000000000000FF000000FF0000000000000000000000FF2DE6
      A2FF2DE6A2FF2DE6A2FF000000FF082D1FFF082D1FFF082D1FFF082D1FFF082D
      1FFF082D1FFF082D1FFF082D1FFF082D1FFF082D1FFF082D1FFF082D1FFF082D
      1FFF000000FF2DE6A2FF26C78BFF26C78BFF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FF0000000000000000CD7E1BFFCE801BFFD082
      1AFFD1831AFFD28419FFD38519FFD48618FFD2D2D2FFD2D2D2FFD2D2D2FFA44B
      0DFFA64D0DFFA84F0DFFAA510DFFAC530EFFAE550DFFAF570DFFB1590EFFD2D2
      D2FFD2D2D2FFFFFFFFFFE49610FFE6980FFFE7990EFFE89A0EFFE99B0DFFEA9C
      0DFFEB9D0CFFEC9E0CFFED9F0BFFEEA00AFF00000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFFFA242FF322F2BFF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFFFFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB000000DC000000FF000000000000
      00FF000000FF0000008300000000000000000000000000000000000000FF2DE6
      A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6
      A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6A2FF2DE6
      A2FF2DE6A2FF2DE6A2FF26C78BFF26C78BFF0000000000000000FF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF8823FFFF88
      23FFFF8823FFFF8823FFFF8823FF000000000000000000000000CD7E1BFFCE80
      1BFFCF811AFFD1831AFFD28419FFD38519FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
      D2FFA44B0DFFA64D0DFFA84F0DFFAA510DFFAC530EFFAE550DFFD2D2D2FFD2D2
      D2FFD2D2D2FFE29411FFE39510FFE49610FFE6980FFFE7990EFFE89A0EFFE99B
      0DFFEA9C0DFFEB9D0CFFEC9E0CFF0000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF322F2BFF322F2BFF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F
      2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFF322F2BFFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF2DE6A2FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      000000000000F06C00FFF06C00FFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFF76C4FFFFF06C00FFF06C
      00FF000000000000000000000000000000000000000000000000CC7D1CFFCD7E
      1BFFCE801BFFD0821AFFD1831AFFD28419FFD38519FFD2D2D2FFD2D2D2FFD2D2
      D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
      D2FFE09212FFE19311FFE29411FFE39510FFE49610FFE6980FFFE7990EFFE89A
      0EFFE99B0DFFEA9C0DFFEB9D0CFF0000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF322F2BFF322F2BFFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FF322F2BFF322F2BFFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F06C00FFF06C00FFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFF76C4FFFFF06C00FFF06C
      00FF00000000000000000000000000000000000000000000000000000000CC7D
      1CFFCD7E1BFFCE801BFFD0821AFFD1831AFFD28419FFD38519FFD3D3D3FFD2D2
      D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFDE90
      13FFDF9112FFE09212FFE19311FFE29411FFE39510FFE49610FFE6980FFFE799
      0EFFE89A0EFFE99B0DFF000000000000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF322F2BFF322F2BFFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FF322F2BFF322F2BFFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFFBD000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F06C00FFF06C00FFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFF76C4FFFFF06C00FFF06C
      00FF00000000000000000000000000000000000000000000000000000000CC7D
      1CFFCC7D1CFFCD7E1BFFCE801BFFD0821AFFD1831AFFD28419FFD38519FFD486
      18FFF6E8D4FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFDB8D15FFDC8E14FFDD8F
      13FFDE9013FFDF9112FFE09212FFE19311FFE29411FFE39510FFE49610FFE698
      0FFFE7990EFFE89A0EFF000000000000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF322F2BFFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FF322F2BFF322F2BFFF7F4E5FFE4E1D3FF322F2BFFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000FF0000
      00FF0000009200000000000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFFBD000FFFBD000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F06C00FFF06C00FFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFF76C4FFFFF06C00FFF06C
      00FF000000000000000000000000000000000000000000000000000000000000
      0000CC7D1CFFCC7D1CFFCD7E1BFFCE801BFFD0821AFFD1831AFFD28419FFD385
      19FFD48618FFD58717FFD68817FFD78916FFD88A16FFD98B15FFDB8D15FFDC8E
      14FFDD8F13FFDE9013FFDF9112FFE09212FFE19311FFE29411FFE39510FFE496
      10FFE6980FFF00000000000000000000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF322F2BFFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FF322F2BFF322F2BFFF7F4E5FFE4E1D3FF322F2BFFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FFD88938EB0000000000000000000000000000
      0000000000000000000000000000000000FFFBDB61FFFBDB61FFFBDB61FFFBDB
      61FFFBDB61FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD0
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F06C00FFF06C00FFAADAFFFF1098FFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFF1098FFFFAADAFFFF76C4FFFFF06C00FFF06C
      00FF000000000000000000000000000000000000000000000000000000000000
      000000000000CC7D1CFFCC7D1CFFCD7E1BFFCE801BFFD0821AFFD1831AFFD284
      19FFD38519FFD48618FFD58717FFD68817FFD78916FFD88A16FFD98B15FFDB8D
      15FFDC8E14FFDD8F13FFDE9013FFDF9112FFE09212FFE19311FFE29411FFE395
      10FF0000000000000000000000000000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF322F2BFFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FF322F2BFF322F2BFFF7F4E5FFE4E1D3FF322F2BFFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF000000000000000C000000FF000000000000
      00FF000000FF000000FF000000FF000000FFFBDB61FFFBDB61FFFBDB61FFFBDB
      61FFFBDB61FFFBDB61FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD0
      00FFFBD000FF000000FF000000FD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AADAFFFF1098FFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFF1098FFFFAADAFFFF76C4FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC7D1CFFCC7D1CFFCD7E1BFFCE801BFFD0821AFFD183
      1AFFD28419FFD38519FFD48618FFD58717FFD68817FFD78916FFD88A16FFD98B
      15FFDB8D15FFDC8E14FFDD8F13FFDE9013FFDF9112FFE09212FFE19311FF0000
      00000000000000000000000000000000000000000000FFA242FFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF322F2BFFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FF322F2BFF322F2BFFF7F4E5FFE4E1D3FF322F2BFFFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF000000000000000000000000000000000000
      0000000000000000000000000000000000FFFBDB61FFFBDB61FFFBDB61FFFBDB
      61FFFBDB61FFFBDB61FFFBD000FFFBD000FFFBD000FFFBD000FFFBD000FFFBD0
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AADAFFFFAADAFFFF1098FFFF1098FFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFF1098FFFF1098FFFFAADAFFFF76C4FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CC7D1CFFCC7D1CFFCD7E1BFFCE801BFFD082
      1AFFD1831AFFD28419FFD38519FFD48618FFD58717FFD68817FFD78916FFD88A
      16FFD98B15FFDB8D15FFDC8E14FFDD8F13FFDE9013FFDF9112FF000000000000
      00000000000000000000000000000000000000000000FDA042FEFFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF322F2BFFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FF322F2BFF322F2BFFF7F4E5FFE4E1D3FF322F2BFFFFA242FFFFA2
      42FFFFA242FFFFA242FF00000000000000000000000000000000000000FF0000
      00FF000000C900000000000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFFBD000FF8D7400FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADA
      FFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFFAADAFFFF76C4FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC7D1CFFCD7E1BFFCE80
      1BFFD0821AFFD1831AFFD28419FFD38519FFD48618FFD58717FFD68817FFD789
      16FFD88A16FFD98B15FFDB8D15FFDC8E14FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFA242FFFFA2
      42FFFFA242FFFFA242FFFFA242FF322F2BFFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FF322F2BFF322F2BFFF7F4E5FFE4E1D3FF322F2BFFFFA242FFFFA2
      42FFFFA242FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CD7E
      1BFFCE801BFFCF811AFFD1831AFFD28419FFD38519FFD48618FFD58717FFD688
      17FFD78916FFD88A16FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFA2
      42FFFFA242FFFFA242FFFFA242FF322F2BFFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4E5FFF7F4
      E5FFF7F4E5FF322F2BFF322F2BFFF7F4E5FFE4E1D3FF322F2BFFFFA242FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF0000001A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003A240787D28419FF2D1C0576000000000000
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
      0000000000000000000000000000000000000000000000000000000000005FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000003B464FBF4D4F50FF4D4F50FF4D4F
      50FF67686AFF07090B3700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000E7000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      000000000000000000000000000000000000000000084D4F50FF4D4F50FF4D4F
      50FF9DCFF4FF9DCFF4FF9DCFF4FF9DCFF4FF9DCFF4FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E
      7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF0000
      00FF000000FF3442F4FF3442F4FF3442F4FF3442F4FF3442F4FF3442F4FF1D1D
      C8FF000000FF000000BC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF000000000000
      000000000000000000000000000000000000000000004D4F50FF4D4F50FF86BF
      EFFF9DCFF4FF9DCFF4FF9DCFF4FF9DCFF4FF9DCFF4FF9DCFF4FF9DCFF4FF40AE
      F9FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E
      7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF666257FF0000
      00FF3442F4FF3442F4FF3442F4FF000000FF000000FF000000FF3442F4FF3442
      F4FF1D1DC8FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF0000
      000000000000000000000000000000000000000000004D4F50FF86BFEFFF86BF
      EFFF86BFEFFF9DCFF4FF9DCFF4FF9DCFF4FF9DCFF4FF9DCFF4FF40AEF9FF40AE
      F9FF40AEF9FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      001C000000FF948E7EFF948E7EFF000000FF000000FF948E7EFF948E7EFF948E
      7EFF000000FF000000FF000000FF948E7EFF948E7EFF948E7EFF000000FF3442
      F4FF3442F4FF3442F4FF3442F4FF000000FF00DFFFFF000000FF3442F4FF3442
      F4FF3442F4FF1D1DC8FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF000000000000000000000000000000000000000086BFEFFF86BFEFFF86BF
      EFFF86BFEFFF9DCFF4FF9DCFF4FF9DCFF4FF9DCFF4FF40AEF9FF40AEF9FF40AE
      F9FF40AEF9FF40AEF9FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00C6000000FF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF000000FF000000FF3442
      F4FF3442F4FF3442F4FF3442F4FF030513FF000000FF242EACFF3442F4FF3442
      F4FF3442F4FF1D1DC8FF000000FF0000008B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF000000000000000000000000000000000000000086BFEFFF86BF
      EFFF86BFEFFF9DCFF4FF9DCFF4FF9DCFF4FF2088F9FF40AEF9FF40AEF9FF40AE
      F9FF40AEF9FF40AEF9FF40AEF9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF33312BFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF000000FF3442F4FF3442
      F4FF3442F4FF3442F4FF3442F4FF3442F4FF3442F4FF3442F4FF3442F4FF3442
      F4FF3442F4FF3442F4FF1D1DC8FF000000FF0000000000000000000000000000
      00000000000000000000000000000000000002010E3E231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF0000000000000000000000000000000086BFEFFF86BF
      EFFF86BFEFFF9DCFF4FF9DCFF4FF2088F9FF2088F9FF2088F9FF40AEF9FF40AE
      F9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF000000FF3442F4FF3442
      F4FF3442F4FF3442F4FF3442F4FF1E268EFF000000FF3442F4FF3442F4FF3442
      F4FF3442F4FF3442F4FF1D1DC8FF000000FF0000000000000000000000000000
      0000000000000000000000000000231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF1F18D2F0000000000000
      0000000000000000000000000000000000000000000000000000000000005FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF0000000000000000000000000000000086BFEFFF86BF
      EFFF86BFEFFF86BFEFFF2088F9FF2088F9FF2088F9FF2088F9FF2088F9FF40AE
      F9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF000000FF3442F4FF3442
      F4FF3442F4FF3442F4FF3442F4FF000000FF00DFFFFF000000FF3442F4FF3442
      F4FF3442F4FF3442F4FF1D1DC8FF000000FF0000000000000000000000000000
      0000000000000000000007053074231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF000000000000
      00000000000000000000000000000000000000000000000000005FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF71E565FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000000086BF
      EFFF86BFEFFF2471E5FF2471E5FF2088F9FF2088F9FF2088F9FF2088F9FF2088
      F9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF000000FF3442F4FF3442
      F4FF3442F4FF3442F4FF3442F4FF000000FF00DFFFFF000000FF3442F4FF3442
      F4FF3442F4FF3442F4FF1D1DC8FF000000FF0000000000000000000000000000
      00000000000000000000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF0000
      00000000000000000000000000000000000000000000000000005FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF72E567FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000000086BF
      EFFF2471E5FF2471E5FF2471E5FF2471E5FF2088F9FF2088F9FF2088F9FF2088
      F9FF2088F9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF000000FF000000FF3442
      F4FF3442F4FF3442F4FF000000FF00A2B9FF00DFFFFF000000FF0A0D33FF3442
      F4FF3442F4FF1D1DC8FF000000FF000000840000000000000000000000000000
      000000000000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF00000000000000000000000000000000000000005FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF72E567FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000002471
      E5FF2471E5FF2471E5FF2471E5FF2471E5FF2471E5FF2088F9FF2088F9FF2088
      F9FF2088F9FF2088F9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF40AE
      F9FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF3442
      F4FF3442F4FF3442F4FF000000FF00DFFFFF00DFFFFF004F5AFF000000FF3442
      F4FF3442F4FF1D1DC8FF000000FF000000000000000000000000000000000000
      000000000000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF00000000000000000000000000000000000000005FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF72E567FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      00002471E5FF2471E5FF2471E5FF2471E5FF2471E5FF2471E5FF2088F9FF2088
      F9FF2088F9FF2088F9FF2088F9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF40AE
      F9FF40AEF9FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF0000
      00FF3442F4FF3442F4FF3442F4FF000000FF000000FF000000FF3442F4FF3442
      F4FF1D1DC8FF000000FF00000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF000000000000000000000000000000005FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF72E567FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      0000000000002471E5FF2471E5FF2471E5FF2471E5FF2471E5FF2471E5FF2088
      F9FF2088F9FF2088F9FF2088F9FF2088F9FF40AEF9FF40AEF9FF40AEF9FF40AE
      F9FF40AEF9FF40AEF9FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF0000
      00FF000000FF3442F4FF3442F4FF3442F4FF3442F4FF3442F4FF3442F4FF1D1D
      C8FF000000FF0000009E00000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF0000000001010C3A231BEDFF231BEDFF231BEDFF000000020000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF000000000000000000000000000000005FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      000000000000000000002471E5FF2471E5FF2471E5FF2471E5FF2471E5FF2471
      E5FF2088F9FF2088F9FF2088F9FF2088F9FF2088F9FF40AEF9FF40AEF9FF40AE
      F9FF40AEF9FF40AEF9FF40AEF9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF8B7C
      5FFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF000000000000000005042363231BEDFF00000002000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF000000000000000000000000143112775FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      00000000000000000000000000002471E5FF2471E5FF2471E5FF2471E5FF2471
      E5FF2471E5FF2088F9FF2088F9FF2088F9FF2088F9FF2088F9FF40AEF9FF40AE
      F9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF8B7C
      5FFF000000FF948E7EFF5F5B53FF000000FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF0000000000000000000000010000000000000000231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF0000000000000000000000005FE153FE5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FFB2EAA8FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      0000000000000000000000000000000000002471E5FF2471E5FF2471E5FF2471
      E5FF2471E5FF2471E5FF2088F9FF2088F9FF2088F9FF2088F9FF2088F9FF40AE
      F9FF40AEF9FF40AEF9FF40AEF9FF40AEF9FFD6D6D4FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF8B7C
      5FFF000000FF948E7EFF5F5B53FF403D38FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF000000000000000000000000231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF0000000000000000000000001A3F17875FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      000000000000000000000000000000000000000000002471E5FF2471E5FF2471
      E5FF2471E5FF2471E5FF2471E5FF2088F9FF2088F9FF2088F9FF2088F9FF2088
      F9FF40AEF9FF40AEF9FF40AEF9FFD6D6D4FFD6D6D4FFD6D6D4FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF8B7C
      5FFF000000FF948E7EFF6B675DFF5F5B53FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF0000000000000000000000000000000000000629231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF000000000000000000000000000000005FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1C5FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000002471E5FF2471
      E5FF2471E5FF2471E5FF2471E5FF2471E5FF2088F9FF2088F9FF2088F9FF2088
      F9FF2088F9FF40AEF9FFD6D6D4FFD6D6D4FFD6D6D4FFD6D6D4FFA5A5A3E00000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF8B7C
      5FFF000000FF948E7EFF8F8A7AFF5F5B53FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF000000000000000000000000231BEDFF00000000000000000100
      072C231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF000000000000000000000000000000005FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF72E567FF72E567FF72E5
      67FF72E567FF83E677FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF72C1
      34FF72C134FF72C134FF72C134FF72C134FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002471
      E5FF2471E5FF2471E5FF2471E5FF2471E5FF2471E5FF2088F9FF2088F9FF2088
      F9FF2088F9FFD6D6D4FFD6D6D4FFD6D6D4FFD6D6D4FFA6A6A5E1E8E8E6FFE8E8
      E6FF000000000000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF8B7C
      5FFF000000FF948E7EFF948E7EFF5F5B53FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF0000000000000000231BEDFF231BEDFF231BEDFF000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF000000000000000000000000000000005FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF72E566FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002471E5FF2471E5FF2471E5FF2471E5FF2471E5FF2471E5FF2088F9FF2088
      F9FFD6D6D4FFD6D6D4FFD6D6D4FFD6D6D4FFA6A6A5E1E8E8E6FFE8E8E6FFE8E8
      E6FFE8E8E6FF0000000000000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF8B7C
      5FFF000000FF948E7EFF948E7EFF5F5B53FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF000000000000000000000000000000005FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF72E566FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002471E5FF2471E5FF2471E5FF2471E5FF2471E5FF2471E5FFD6D6
      D4FFD6D6D4FFD6D6D4FFD6D6D4FFA8A8A6E2E8E8E6FFE8E8E6FFE8E8E6FFE8E8
      E6FF3A3AF2FF3A3AF2FF00000000000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF000000FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF8B7C
      5FFF000000FF948E7EFF948E7EFF5F5B53FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF0000000000000000000000000000000000000000000000005FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF72E566FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002471E5FF2471E5FF2471E5FF2471E5FFC6C6C6FFC6C6
      C6FFD6D6D4FFD6D6D4FFA8A8A6E2E8E8E6FFE8E8E6FFE8E8E6FFE8E8E6FF3A3A
      F2FF3A3AF2FF3A3AF2FF3A3AF2FF000000000000000000000000000000000000
      00FF948E7EFF948E7EFF000000FF8B7C5FFF000000FF020201FF948E7EFF948E
      7EFF000000FF8B7C5FFF000000FF948E7EFF948E7EFF948E7EFF000000FF8B7C
      5FFF000000FF948E7EFF948E7EFF5F5B53FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF0000000000000000000000000000000000000000000000005FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF72E566FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002471E5FF2471E5FFC6C6C6FFC6C6C6FFC6C6
      C6FFC6C6C6FFAAAAA8E3E8E8E6FFE8E8E6FFE8E8E6FFE8E8E6FF3A3AF2FF3A3A
      F2FF3A3AF2FF3A3AF2FF3A3AF2FF3A3AF0FE0000000000000000000000000000
      00FF948E7EFF948E7EFF948E7EFF000000FF000000FF948E7EFF948E7EFF948E
      7EFF948E7EFF000000FF000000FF948E7EFF948E7EFF948E7EFF615D53FF0000
      00FF000000FF948E7EFF948E7EFF5F5B53FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF0000
      0000000000000000000000000000000000000000000000000000000000005FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C6FFC6C6C6FFC6C6C6FFC6C6
      C6FFC6C6C6FCDDDDDDFFE8E8E6FFE8E8E6FFE8E8E6FF3A3AF2FF3A3AF2FF3A3A
      F2FF3A3AF2FF3A3AF2FF3A3AF2FF3A3AF2FF0000000000000000000000000000
      00FF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E
      7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E
      7EFF948E7EFF948E7EFF948E7EFF5F5B53FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000231BE7FC231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF020211460000
      0000000000000000000000000000000000000000000000000000000000005FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C6FFC6C6C6FFC6C6
      C6FCDDDDDDFFDDDDDDFFDDDDDDFFE8E8E6FF3A3AF2FF3A3AF2FF3A3AF2FF3A3A
      F2FF3A3AF2FF3A3AF2FF3A3AF2FF3A3AF2FF0000000000000000000000000000
      00FF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E
      7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E7EFF948E
      7EFF948E7EFF948E7EFF948E7EFF5F5B53FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FFCCDCA9FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6FCDDDD
      DDFFDDDDDDFFDDDDDDFFDDDDDDFF2121C6FF3A3AF2FF3A3AF2FF3A3AF2FF3A3A
      F2FF3A3AF2FF3A3AF2FF3A3AF2FF3A3AF2FF00000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000221BE5FB231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF0706337700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB4
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DDDD
      DDFFDDDDDDFFDDDDDDFF2121C6FF2121C6FF2121C6FF3A3AF2FF3A3AF2FF3A3A
      F2FF3A3AF2FF3A3AF2FF3A3AF2FF3A3AF2FF00000000000000FF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF6F6F6FFF6F6F6FFF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF231BEDFF231BEDFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005FE353FF5FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DDDDDDFF2121C6FF2121C6FF2121C6FF2121C6FF2121C6FF3A3AF2FF3A3A
      F2FF3A3AF2FF3A3AF2FF3A3AF2FF3A3AF2FF00000000000000FF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF6F6F6FFF464646FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231BEDFF231B
      EDFF231BEDFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005FE353FF5FE353FF5FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF4AB400FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002121C6FF2121C6FF2121C6FF2121C6FF2121C6FF2121C6FF3737
      ECFF3A3AF2FF3A3AF2FF3A3AF2FF3A3AF2FF00000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005FE353FF5FE353FF5FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF4AB400FF4AB400FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002121C6FF2121C6FF2121C6FF2121C6FF2121C6FF2121
      C6FF2121C6FF2121C6FF2121C6FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF00000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005FE3
      53FF5FE353FF5FE353FF5FE353FF5FE353FF4AB400FF4AB400FF4AB400FF4AB4
      00FF4AB400FF4AB400FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000080826682121C6FF2121C6FF2121C6FF2121
      C6FF2121C6FF2121C6FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001A3F17874AB400FF29640EB6000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000C8000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      000000000000}
  end
  object DataSourceCPagar: TDataSource
    DataSet = dmCPagar.cdsCPagar
    Left = 832
    Top = 256
  end
  object cdsParcelas: TClientDataSet
    PersistDataPacket.Data = {
      7D0000009619E0BD0100000018000000040000000000030000007D0007504152
      43454C4104000100000000000556414C4F520800040000000100075355425459
      50450200490006004D6F6E6579000A56454E43494D454E544F04000600000000
      0009444F43554D454E544F01004A000000010005574944544802000200280000
      00}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'Parcela'
    Params = <>
    Left = 905
    Top = 378
    object cdsParcelasPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object cdsParcelasVALOR: TCurrencyField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object cdsParcelasVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsParcelasDOCUMENTO: TWideStringField
      FieldName = 'DOCUMENTO'
    end
  end
  object dsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 913
    Top = 450
  end
end
