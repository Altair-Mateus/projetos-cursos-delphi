object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 417
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 704
    Top = 200
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Estados1: TMenuItem
        Caption = 'Estados'
        OnClick = Estados1Click
      end
      object Cidades1: TMenuItem
        Caption = 'Cidades'
        OnClick = Cidades1Click
      end
    end
  end
end
