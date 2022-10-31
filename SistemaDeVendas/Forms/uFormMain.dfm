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
    object Cadastros: TMenuItem
      Caption = 'Cadastros'
      object CadClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = CadClientesClick
      end
      object CadEstados: TMenuItem
        Caption = 'Estados'
        OnClick = CadEstadosClick
      end
      object CadCidades: TMenuItem
        Caption = 'Cidades'
        OnClick = CadCidadesClick
      end
      object Fornecedores1: TMenuItem
        Caption = 'Fornecedores'
        OnClick = Fornecedores1Click
      end
    end
    object Pesquisar: TMenuItem
      Caption = 'Pesquisar'
      object PesqClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = PesqClientesClick
      end
      object Fornecedores2: TMenuItem
        Caption = 'Fornecedores'
      end
    end
  end
end
