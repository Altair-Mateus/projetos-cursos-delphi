object FormFiltroPai: TFormFiltroPai
  Left = 0
  Top = 0
  Caption = 'FormFiltroPai'
  ClientHeight = 429
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 121
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object EditFiltro: TEdit
      Left = 24
      Top = 39
      Width = 465
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
      Caption = 'Visualizar'
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
  end
  object FDQueryFiltro: TFDQuery
    Connection = dmDados.FDConnection
    Transaction = FDTransactionFiltro
    Left = 704
    Top = 208
  end
  object DataSourceFiltro: TDataSource
    DataSet = FDQueryFiltro
    Left = 704
    Top = 144
  end
  object FDTransactionFiltro: TFDTransaction
    Connection = dmDados.FDConnection
    Left = 704
    Top = 264
  end
end
