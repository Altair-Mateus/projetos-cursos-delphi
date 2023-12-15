inherited frmRelCr: TfrmRelCr
  Caption = 'frmRelCr'
  ExplicitWidth = 782
  ExplicitHeight = 478
  TextHeight = 15
  inherited RLReport: TRLReport
    Borders.Sides = sdCustom
    DataSource = DataSourceCr
    DefaultFilter = nil
    inherited rlbTitulo: TRLBand
      inherited rllblTitulo: TRLLabel
        Left = 227
        Width = 262
        Caption = 'Rela'#231#227'o Contas a Receber'
        ExplicitLeft = 227
        ExplicitWidth = 262
      end
    end
    inherited rlbNomeColunas: TRLBand
      object rllblVencimento: TRLLabel
        Left = 282
        Top = 1
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
        Left = 64
        Top = 1
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
        Left = 394
        Top = 1
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
        Left = 482
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
      object rllblValorParcela: TRLLabel
        Left = 583
        Top = 1
        Width = 118
        Height = 22
        Align = faTopOnly
        Caption = 'Valor Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblId: TRLLabel
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
      object rllblCodCliente: TRLLabel
        Left = 212
        Top = 1
        Width = 64
        Height = 22
        Align = faTopOnly
        Caption = 'Cliente'
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
        Left = 282
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
        Left = 64
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
        Left = 394
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
        Left = 482
        Top = 0
        Width = 45
        Height = 14
        Align = faTopOnly
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
        Left = 599
        Top = 0
        Width = 98
        Height = 18
        Align = faTopOnly
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
        Left = 0
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
      object rldbtCodCliente: TRLDBText
        Left = 212
        Top = 0
        Width = 72
        Height = 18
        Align = faTopOnly
        Alignment = taCenter
        DataField = 'id_cliente'
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
      Top = 181
      Borders.DrawBottom = True
      ExplicitTop = 181
      inherited rlsiData: TRLSystemInfo
        Top = 21
        ExplicitTop = 21
      end
      inherited rlsiHora: TRLSystemInfo
        Top = 21
        ExplicitTop = 21
      end
      inherited rllblNomeUser: TRLLabel
        Top = 21
        Width = 4
        ExplicitTop = 21
        ExplicitWidth = 4
      end
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
      object rllblTotal: TRLLabel
        Left = 598
        Top = 7
        Width = 44
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
  object DataSourceCr: TDataSource [1]
    Left = 640
    Top = 336
  end
end
