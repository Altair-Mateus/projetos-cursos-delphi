inherited frmRelMensalCr: TfrmRelMensalCr
  Caption = 'frmRelatorioPadrao1'
  TextHeight = 15
  inherited RLReport: TRLReport
    DataSource = dsRelResumoMensal
    inherited rlbTitulo: TRLBand
      inherited rllblTitulo: TRLLabel
        Left = 191
        Width = 334
        Caption = 'Resumo Mensal Contas a Receber'
        ExplicitLeft = 191
        ExplicitWidth = 334
      end
    end
    inherited rlbNomeColunas: TRLBand
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
        Width = 101
        Height = 22
        Align = faTopOnly
        Caption = 'Qtd Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
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
    end
    inherited rlbDados: TRLBand
      Height = 30
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
      object rldbtQtd: TRLDBText
        Left = 202
        Top = 5
        Width = 38
        Height = 18
        Alignment = taCenter
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
      object rldbtValorTotal: TRLDBText
        Left = 368
        Top = 5
        Width = 134
        Height = 19
        DataField = 'TOTAL_MENSAL'
        DataSource = dsRelResumoMensal
        DisplayMask = 'R$ #,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
    end
    inherited rlbRodape: TRLBand
      Top = 191
      ExplicitTop = 191
    end
    object RLBand1: TRLBand
      Left = 39
      Top = 160
      Width = 716
      Height = 31
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rllblTotal: TRLLabel
        Left = 368
        Top = 4
        Width = 60
        Height = 19
        Alignment = taCenter
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllblQuantidade: TRLLabel
        Left = 83
        Top = 6
        Width = 92
        Height = 19
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited RLPDFFilter: TRLPDFFilter
    ImageFormat = ifJPeg
  end
  object dsRelResumoMensal: TDataSource
    Left = 408
    Top = 304
  end
end
