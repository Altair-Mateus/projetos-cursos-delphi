inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientWidth = 815
  ExplicitWidth = 827
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    Width = 815
    ExplicitWidth = 811
    ExplicitHeight = 508
    inherited CardCadastro: TCard
      Width = 813
      ExplicitWidth = 813
      ExplicitHeight = 507
      inherited pnlBotoesCad: TPanel
        Width = 813
        ExplicitTop = 438
        ExplicitWidth = 813
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
        end
      end
      inherited PanelCampos: TPanel
        Width = 813
        ExplicitWidth = 813
        ExplicitHeight = 397
        object LabelNome: TLabel
          Left = 32
          Top = 40
          Width = 42
          Height = 19
          Caption = 'Nome'
        end
        object LabelLogin: TLabel
          Left = 32
          Top = 112
          Width = 39
          Height = 19
          Caption = 'Login'
        end
        object LabelStatus: TLabel
          Left = 35
          Top = 190
          Width = 43
          Height = 19
          Caption = 'Status'
        end
        object lblAvisoSenha: TLabel
          Left = 16
          Top = 342
          Width = 574
          Height = 46
          Caption = 
            'ATEN'#199#195'O: Ao salvar o cadastro a senha gerada ser'#225' a tempor'#225'ria. ' +
            'Quando logar a primeira vez com seu usu'#225'rio voc'#234' poder'#225' alterar ' +
            'a mesma.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5737262
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object EditNome: TEdit
          Left = 32
          Top = 65
          Width = 449
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 0
        end
        object EditLogin: TEdit
          Left = 32
          Top = 137
          Width = 209
          Height = 27
          Color = clWhite
          MaxLength = 20
          TabOrder = 1
        end
        object ToggleSwitchStatus: TToggleSwitch
          Left = 107
          Top = 190
          Width = 105
          Height = 21
          Color = 9685681
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
          TabOrder = 2
          ThumbColor = 5737262
        end
      end
      inherited PanelTitulo: TPanel
        Width = 813
        ExplicitWidth = 813
        inherited Labeltitulo: TLabel
          Width = 211
          Caption = 'Inserindo um novo usu'#225'rio'
          Color = 5934638
          ExplicitWidth = 211
        end
      end
    end
    inherited CardPesquisa: TCard
      Width = 813
      ExplicitWidth = 809
      inherited pnlPesquisa: TPanel
        Width = 813
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ExplicitWidth = 809
        inherited btnPesquisae: TButton
          Left = 689
          OnClick = btnPesquisaeClick
          ExplicitLeft = 685
        end
      end
      inherited pnlBotoes: TPanel
        Width = 813
        ExplicitWidth = 809
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
        end
        inherited btnSair: TButton
          Left = 692
          ExplicitLeft = 688
        end
      end
      inherited pnlGrid: TPanel
        Width = 813
        ExplicitWidth = 809
        inherited DBGrid1: TDBGrid
          Width = 811
          Margins.Top = 0
          DataSource = DataSourceUsuarios
          PopupMenu = PopupMenu
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 301
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'login'
              Title.Caption = 'Login'
              Width = 151
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'Status'
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 728
    Top = 96
  end
  object DataSourceUsuarios: TDataSource
    DataSet = DataModuleUsuarios.ClientDataSetUsuarios
    Left = 728
    Top = 152
  end
  object PopupMenu: TPopupMenu
    Left = 728
    Top = 216
    object mnuLimpaSenha: TMenuItem
      Caption = 'Limpar Senha'
      OnClick = mnuLimpaSenhaClick
    end
  end
end
