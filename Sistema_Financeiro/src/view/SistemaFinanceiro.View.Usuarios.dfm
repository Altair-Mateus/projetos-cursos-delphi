inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    inherited CardPesquisa: TCard
      inherited pnlPesquisa: TPanel
        inherited btnPesquisae: TButton
          OnClick = btnPesquisaeClick
        end
      end
      inherited pnlGrid: TPanel
        inherited DBGrid1: TDBGrid
          DataSource = DataSourceUsuarios
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 728
    Top = 96
  end
  object FDQueryUsuarios: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'select * from usuarios')
    Left = 728
    Top = 152
  end
  object DataSourceUsuarios: TDataSource
    DataSet = FDQueryUsuarios
    Left = 728
    Top = 208
  end
end
