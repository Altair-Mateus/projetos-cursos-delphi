inherited frmCaixa: TfrmCaixa
  Caption = 'Caixa'
  ClientHeight = 578
  WindowState = wsMaximized
  ExplicitTop = -39
  ExplicitHeight = 616
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    Height = 578
    ActiveCard = CardCadastro
    inherited CardCadastro: TCard
      Height = 576
      inherited pnlBotoesCad: TPanel
        Top = 507
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
        end
      end
      inherited PanelCampos: TPanel
        Height = 466
        object lblNDoc: TLabel
          Left = 40
          Top = 48
          Width = 105
          Height = 19
          Caption = 'N'#186' Documento'
        end
        object lblDesc: TLabel
          Left = 40
          Top = 128
          Width = 67
          Height = 19
          Caption = 'Descri'#231#227'o'
        end
        object lblValor: TLabel
          Left = 256
          Top = 48
          Width = 37
          Height = 19
          Caption = 'Valor'
        end
        object lblData: TLabel
          Left = 40
          Top = 204
          Width = 32
          Height = 19
          Caption = 'Data'
        end
        object lblReceita: TLabel
          Left = 40
          Top = 359
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
          Top = 388
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
        object edtDesc: TEdit
          Left = 40
          Top = 153
          Width = 401
          Height = 27
          Color = clWhite
          MaxLength = 200
          TabOrder = 2
        end
        object edtValor: TEdit
          Left = 256
          Top = 73
          Width = 185
          Height = 27
          Color = clWhite
          MaxLength = 18
          TabOrder = 1
        end
        object RadioGroup: TRadioGroup
          Left = 40
          Top = 288
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
          Left = 39
          Top = 229
          Width = 186
          Height = 27
          Date = 45099.000000000000000000
          Time = 0.866143263890990100
          TabOrder = 3
        end
      end
      inherited PanelTitulo: TPanel
        inherited Labeltitulo: TLabel
          Width = 325
          Caption = 'Inserindo um novo Lan'#231'amento no Caixa'
          Color = 5934638
          ExplicitWidth = 325
        end
      end
    end
    inherited CardPesquisa: TCard
      Height = 576
      inherited pnlPesquisa: TPanel
        inherited btnPesquisae: TButton
          OnClick = btnPesquisaeClick
        end
      end
      inherited pnlBotoes: TPanel
        Top = 507
      end
      inherited pnlGrid: TPanel
        Height = 426
        inherited DBGrid1: TDBGrid
          Height = 424
          DataSource = DataSourceCaixa
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Title.Caption = 'Id'
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
              Width = 317
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo'
              Title.Caption = 'Tipo'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor'
              Title.Caption = 'Valor'
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
