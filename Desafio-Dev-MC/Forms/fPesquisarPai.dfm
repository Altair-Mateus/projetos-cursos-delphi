object frmPesquisarPai: TfrmPesquisarPai
  Left = 0
  Top = 0
  Caption = 'fPesquisarPai'
  ClientHeight = 404
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 121
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object LabelCodigo: TLabel
      Left = 24
      Top = 20
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object LabelNome: TLabel
      Left = 128
      Top = 20
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object LabelOrdena: TLabel
      Left = 24
      Top = 71
      Width = 114
      Height = 13
      Caption = 'Ordenar Resultado por:'
    end
    object EditCodigo: TEdit
      Left = 24
      Top = 39
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object ButtonPesquisa: TButton
      Left = 512
      Top = 19
      Width = 97
      Height = 41
      Caption = 'Pesquisar'
      TabOrder = 1
    end
    object ButtonSair: TButton
      Left = 623
      Top = 66
      Width = 97
      Height = 41
      Caption = 'SAIR'
      TabOrder = 2
      OnClick = ButtonSairClick
    end
    object ButtonVisualizar: TButton
      Left = 623
      Top = 19
      Width = 97
      Height = 41
      Caption = 'Editar'
      TabOrder = 3
      OnClick = ButtonVisualizarClick
    end
    object ButtonNovo: TButton
      Left = 512
      Top = 66
      Width = 97
      Height = 41
      Caption = 'Novo'
      TabOrder = 4
    end
    object RadioButtonCodigo: TRadioButton
      Left = 24
      Top = 96
      Width = 65
      Height = 17
      Caption = 'C'#243'digo'
      Checked = True
      TabOrder = 5
      TabStop = True
    end
    object RadioButtonNome: TRadioButton
      Left = 95
      Top = 96
      Width = 60
      Height = 17
      Caption = 'Nome'
      TabOrder = 6
    end
  end
  object EditNome: TEdit
    Left = 128
    Top = 39
    Width = 361
    Height = 21
    TabOrder = 1
  end
  object DBGridResultadoPesquisa: TDBGrid
    Left = 0
    Top = 121
    Width = 759
    Height = 283
    Align = alClient
    Color = clBtnHighlight
    DataSource = DataSourcePesquisar
    DrawingStyle = gdsGradient
    GradientEndColor = 13602864
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSourcePesquisar: TDataSource
    DataSet = FDQueryPesquisar
    Left = 656
    Top = 216
  end
  object FDQueryPesquisar: TFDQuery
    Connection = dmDados.FDConnection
    Left = 656
    Top = 160
  end
  object FDTransactionPesquisar: TFDTransaction
    Connection = dmDados.FDConnection
    Left = 656
    Top = 280
  end
end
