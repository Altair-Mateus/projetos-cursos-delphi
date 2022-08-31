object formPrincipal: TformPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 429
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainMenuPrincipal
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mainMenuPrincipal: TMainMenu
    Left = 8
    Top = 8
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object menuCadastrosClientes: TMenuItem
        Caption = 'Clientes'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object menuCadastrosCategorias: TMenuItem
        Caption = 'Categorias'
      end
      object menuCadastrosProdutos: TMenuItem
        Caption = 'Produtos'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object menuCadastrosSair: TMenuItem
        Caption = 'SAIR'
        OnClick = menuCadastrosSairClick
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object menuMovimentacaoVendas: TMenuItem
        Caption = 'Vendas'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object menuRelatoriosClientes: TMenuItem
        Caption = 'Clientes'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object menuRelatoriosProdutos: TMenuItem
        Caption = 'Produto'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object menuRelatoriosVendasPorData: TMenuItem
        Caption = 'Vendas por Data'
      end
    end
  end
end
