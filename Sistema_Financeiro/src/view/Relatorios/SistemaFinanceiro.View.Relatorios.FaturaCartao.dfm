inherited frmRelFatCartao: TfrmRelFatCartao
  Caption = 'frmRelFatCartao'
  ExplicitWidth = 782
  ExplicitHeight = 478
  TextHeight = 15
  inherited RLReport: TRLReport
    DataSource = DataSourceFatCartao
    inherited rlbTitulo: TRLBand
      inherited rllblTitulo: TRLLabel
        Left = 213
        Width = 290
        Caption = 'Rela'#231#227'o de Faturas de Cart'#227'o'
        ExplicitLeft = 213
        ExplicitWidth = 290
      end
    end
    inherited rlbNomeColunas: TRLBand
      object rllblCod: TRLLabel
        Left = 0
        Top = 1
        Width = 41
        Height = 22
        Align = faLeftTop
        Caption = 'Cod'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblNome: TRLLabel
        Left = 96
        Top = 1
        Width = 56
        Height = 22
        Align = faTopOnly
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblStatus: TRLLabel
        Left = 480
        Top = 1
        Width = 58
        Height = 22
        Align = faTopOnly
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblDiaVcto: TRLLabel
        Left = 574
        Top = 1
        Width = 139
        Height = 22
        Align = faTopOnly
        Caption = 'Dia Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    inherited rlbDados: TRLBand
      object rldbtId: TRLDBText
        Left = 0
        Top = 0
        Width = 34
        Height = 18
        Align = faLeftTop
        DataField = 'id_ft'
        DataSource = DataSourceFatCartao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 104
        Top = 0
        Width = 43
        Height = 18
        Align = faTopOnly
        DataField = 'nome'
        DataSource = DataSourceFatCartao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 488
        Top = 0
        Width = 62
        Height = 18
        Align = faTopOnly
        DataField = 'status_ft'
        DataSource = DataSourceFatCartao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 619
        Top = 0
        Width = 63
        Height = 18
        Align = faTopOnly
        DataField = 'dia_vcto'
        DataSource = DataSourceFatCartao
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
      Top = 181
      ExplicitTop = 181
    end
    object RLBand1: TRLBand
      Left = 39
      Top = 150
      Width = 716
      Height = 31
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rllblContador: TRLLabel
        Left = 0
        Top = 6
        Width = 83
        Height = 19
        Align = faCenterLeft
        Caption = 'Contagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object DataSourceFatCartao: TDataSource
    Left = 496
    Top = 312
  end
end
