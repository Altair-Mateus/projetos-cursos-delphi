object frmListViewOO: TfrmListViewOO
  Left = 0
  Top = 0
  Caption = 'List View OO'
  ClientHeight = 281
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ListViewDados: TListView
    Left = 240
    Top = 0
    Width = 322
    Height = 281
    Align = alRight
    Columns = <
      item
        Caption = 'Nome'
        Width = 150
      end
      item
        Caption = 'E-mail'
        Width = 150
      end>
    TabOrder = 0
    ViewStyle = vsReport
    OnDeletion = ListViewDadosDeletion
    ExplicitLeft = 125
    ExplicitTop = -89
    ExplicitHeight = 290
  end
  object PanelCampos: TPanel
    Left = 0
    Top = 0
    Width = 241
    Height = 281
    Align = alLeft
    TabOrder = 1
    ExplicitTop = -89
    ExplicitHeight = 290
    object LabelNome: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object LabelEmail: TLabel
      Left = 8
      Top = 64
      Width = 32
      Height = 13
      Caption = 'E-mail:'
    end
    object EditNome: TEdit
      Left = 8
      Top = 27
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object EditEmail: TEdit
      Left = 8
      Top = 83
      Width = 217
      Height = 21
      TabOrder = 1
    end
    object ButtonAdicionar: TButton
      Left = 8
      Top = 136
      Width = 217
      Height = 35
      Caption = 'Adicionar'
      TabOrder = 2
      OnClick = ButtonAdicionarClick
    end
    object ButtonRemover: TButton
      Left = 8
      Top = 177
      Width = 217
      Height = 35
      Caption = 'Remover'
      TabOrder = 3
      OnClick = ButtonRemoverClick
    end
    object ButtonExibir: TButton
      Left = 8
      Top = 218
      Width = 217
      Height = 35
      Caption = 'Exibir'
      TabOrder = 4
      OnClick = ButtonExibirClick
    end
  end
end
