inherited frmRelMensalCp: TfrmRelMensalCp
  Caption = 'frmRelatorioPadrao1'
  ClientHeight = 441
  ClientWidth = 774
  TextHeight = 15
  inherited RLReport: TRLReport
    DataSource = dsRelResumoMensal
    inherited rlbTitulo: TRLBand
      inherited rllblTitulo: TRLLabel
        Left = 203
        Width = 310
        Caption = 'Resumo Mensal Contas a Pagar'
        ExplicitLeft = 203
        ExplicitWidth = 310
      end
    end
    inherited rlbNomeColunas: TRLBand
      object rllblValorTot: TRLLabel
        Left = 352
        Top = 1
        Width = 96
        Height = 22
        Align = faTopOnly
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblAnoMes: TRLLabel
        Left = 0
        Top = 1
        Width = 80
        Height = 22
        Align = faLeftTop
        Caption = 'M'#234's/Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblQtd: TRLLabel
        Left = 176
        Top = 1
        Width = 102
        Height = 22
        Align = faTopOnly
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    inherited rlbDados: TRLBand
      Height = 30
      Borders.DrawTop = True
      Borders.DrawBottom = True
      Borders.Style = bsDiagCross
      Borders.FixedBottom = True
      ExplicitHeight = 30
      object rldbtMesAno: TRLDBText
        Left = 3
        Top = 5
        Width = 82
        Height = 18
        DataField = 'ANO_MES'
        DataSource = dsRelResumoMensal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtValorTotal: TRLDBText
        Left = 352
        Top = 6
        Width = 129
        Height = 18
        DataField = 'TOTAL_MENSAL'
        DataSource = dsRelResumoMensal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtQtd: TRLDBText
        Left = 192
        Top = 5
        Width = 37
        Height = 18
        DataField = 'QTD'
        DataSource = dsRelResumoMensal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
    inherited rlbRodape: TRLBand
      Top = 160
      ExplicitTop = 160
    end
  end
  object dsRelResumoMensal: TDataSource
    Left = 408
    Top = 336
  end
end
