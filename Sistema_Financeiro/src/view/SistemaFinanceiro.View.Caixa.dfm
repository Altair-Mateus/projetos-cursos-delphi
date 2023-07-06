inherited frmCaixa: TfrmCaixa
  Caption = 'Caixa'
  ClientHeight = 616
  ClientWidth = 1108
  WindowState = wsMaximized
  ExplicitTop = -98
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
      ExplicitWidth = 1102
      ExplicitHeight = 613
      inherited pnlBotoesCad: TPanel
        Top = 545
        Width = 1106
        ExplicitTop = 544
        ExplicitWidth = 1102
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
        end
      end
      inherited PanelCampos: TPanel
        Width = 1106
        Height = 504
        ExplicitWidth = 1102
        ExplicitHeight = 503
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
        ExplicitWidth = 1102
        inherited Labeltitulo: TLabel
          Width = 325
          Caption = 'Inserindo um novo Lan'#231'amento no Caixa'
          Color = 5934638
          ExplicitWidth = 325
        end
      end
    end
    inherited CardPesquisa: TCard
      Width = 1106
      Height = 614
      ExplicitWidth = 1106
      ExplicitHeight = 614
      inherited pnlPesquisa: TPanel
        Width = 1106
        ExplicitWidth = 1106
        object lblTipo: TLabel [1]
          Left = 392
          Top = 15
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
        inherited btnPesquisae: TButton
          Left = 982
          OnClick = btnPesquisaeClick
          ExplicitLeft = 982
        end
        object cbTipoLcto: TComboBox
          Left = 392
          Top = 40
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
      end
      inherited pnlBotoes: TPanel
        Top = 545
        Width = 1106
        ExplicitTop = 545
        ExplicitWidth = 1106
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
        end
        inherited btnSair: TButton
          Left = 985
          ExplicitLeft = 985
        end
      end
      inherited pnlGrid: TPanel
        Width = 1106
        Height = 464
        ExplicitWidth = 1106
        ExplicitHeight = 464
        inherited DBGrid1: TDBGrid
          Width = 1104
          Height = 462
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
    DataSet = DataModuleCaixa.ClientDataSetCaixa
    Left = 744
    Top = 240
  end
end
