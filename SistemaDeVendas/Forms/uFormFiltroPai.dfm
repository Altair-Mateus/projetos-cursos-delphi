object FormFiltroPai: TFormFiltroPai
  Left = 0
  Top = 0
  Caption = 'FormFiltroPai'
  ClientHeight = 295
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 24
      Top = 39
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 344
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
  end
  object FDQueryFiltro: TFDQuery
    Left = 704
    Top = 208
  end
  object DataSourceFiltro: TDataSource
    Left = 704
    Top = 144
  end
end
