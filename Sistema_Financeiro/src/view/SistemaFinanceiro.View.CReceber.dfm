inherited frmContasReceber: TfrmContasReceber
  Caption = 'Contas a Receber'
  ExplicitWidth = 811
  ExplicitHeight = 547
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    inherited CardPesquisa: TCard
      Width = 797
      Height = 507
      inherited pnlPesquisa: TPanel
        Width = 797
      end
      inherited pnlBotoes: TPanel
        Top = 438
        Width = 797
      end
      inherited pnlGrid: TPanel
        Width = 797
        Height = 357
        inherited DBGrid1: TDBGrid
          Width = 795
          Height = 355
          DataSource = DataSourceCReceber
        end
      end
    end
  end
  object DataSourceCReceber: TDataSource
    DataSet = dmCReceber.cdsCReceber
    Left = 689
    Top = 330
  end
end
