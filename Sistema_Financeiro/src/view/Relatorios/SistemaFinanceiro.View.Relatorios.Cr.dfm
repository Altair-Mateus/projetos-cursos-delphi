inherited frmRelCr: TfrmRelCr
  Caption = 'frmRelCr'
  TextHeight = 15
  inherited RLReport: TRLReport
    DataSource = DataSourceCr
    FooterMeasuring = fmNone
    inherited rlbTitulo: TRLBand
      inherited rllblTitulo: TRLLabel
        Left = 228
        Width = 262
        Caption = 'Rela'#231#227'o Contas a Receber'
        ExplicitLeft = 228
        ExplicitWidth = 262
      end
    end
    inherited rlbNomeColunas: TRLBand
      object rllblVencimento: TRLLabel
        Left = 257
        Top = 0
        Width = 106
        Height = 22
        Align = faTopOnly
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblNDoc: TRLLabel
        Left = 87
        Top = 0
        Width = 128
        Height = 22
        Align = faTopOnly
        Caption = 'N'#186' Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblParcela: TRLLabel
        Left = 401
        Top = 0
        Width = 69
        Height = 22
        Align = faTopOnly
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblStatus: TRLLabel
        Left = 514
        Top = 0
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
      object rllblValorParcela: TRLLabel
        Left = 599
        Top = 0
        Width = 118
        Height = 22
        Align = faRightTop
        Caption = 'Valor Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblId: TRLLabel
        Left = 1
        Top = 0
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
    end
    inherited rlbDados: TRLBand
      object rldbtDataVenc: TRLDBText
        Left = 245
        Top = 0
        Width = 127
        Height = 18
        Align = faTopOnly
        Alignment = taCenter
        DataField = 'data_Vencimento'
        DataSource = DataSourceCr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtNDoc: TRLDBText
        Left = 84
        Top = 0
        Width = 142
        Height = 18
        Align = faTopOnly
        DataField = 'numero_documento'
        DataSource = DataSourceCr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtParcela: TRLDBText
        Left = 414
        Top = 0
        Width = 56
        Height = 18
        Align = faTopOnly
        Alignment = taCenter
        DataField = 'parcela'
        DataSource = DataSourceCr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtStatus: TRLDBText
        Left = 527
        Top = 0
        Width = 45
        Height = 14
        Align = faTopOnly
        Alignment = taCenter
        DataField = 'status'
        DataSource = DataSourceCr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtValorParc: TRLDBText
        Left = 619
        Top = 0
        Width = 98
        Height = 18
        Align = faRightTop
        Alignment = taCenter
        DataField = 'valor_parcela'
        DataSource = DataSourceCr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtId: TRLDBText
        Left = 1
        Top = 0
        Width = 17
        Height = 18
        Align = faLeftTop
        DataField = 'id'
        DataSource = DataSourceCr
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
      Top = 180
      ExplicitTop = 180
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 149
      Width = 718
      Height = 31
      BandType = btColumnFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object rllblTotal: TRLLabel
        Left = 676
        Top = 7
        Width = 41
        Height = 18
        Align = faCenterRight
        Alignment = taCenter
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblContador: TRLLabel
        Left = 1
        Top = 7
        Width = 77
        Height = 18
        Align = faCenterLeft
        Caption = 'Contagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object DataSourceCr: TDataSource
    Left = 640
    Top = 336
  end
end
