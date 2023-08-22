inherited frmRelCp: TfrmRelCp
  Caption = 'frmRelCp'
  ClientHeight = 442
  ClientWidth = 778
  TextHeight = 15
  inherited RLReport: TRLReport
    DataSource = DataSourceCp
    inherited rlbTitulo: TRLBand
      inherited rllblTitulo: TRLLabel
        Left = 239
        Width = 238
        Caption = 'Rela'#231#227'o Contas a Pagar'
        ExplicitLeft = 239
        ExplicitWidth = 238
      end
    end
    inherited rlbNomeColunas: TRLBand
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
      object rllblVencimento: TRLLabel
        Left = 276
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
      object rllblParcela: TRLLabel
        Left = 388
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
        Left = 474
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
      object rllblCodCli: TRLLabel
        Left = 206
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
      object rldbtId: TRLDBText
        Left = 0
        Top = 0
        Width = 17
        Height = 18
        Align = faLeftTop
        DataField = 'id'
        DataSource = DataSourceCp
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
        Width = 91
        Height = 18
        Align = faTopOnly
        DataField = 'numero_doc'
        DataSource = DataSourceCp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtDataVenc: TRLDBText
        Left = 268
        Top = 0
        Width = 128
        Height = 18
        Align = faTopOnly
        Alignment = taCenter
        DataField = 'data_Vencimento'
        DataSource = DataSourceCp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtParcela: TRLDBText
        Left = 388
        Top = 0
        Width = 56
        Height = 18
        Align = faTopOnly
        Alignment = taCenter
        DataField = 'parcela'
        DataSource = DataSourceCp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtStatus: TRLDBText
        Left = 474
        Top = 0
        Width = 45
        Height = 18
        Align = faTopOnly
        DataField = 'status'
        DataSource = DataSourceCp
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
        DataSource = DataSourceCp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbCodFornec: TRLDBText
        Left = 161
        Top = 0
        Width = 141
        Height = 18
        Align = faTopOnly
        Alignment = taCenter
        DataField = 'ID_FORNECEDOR'
        DataSource = DataSourceCp
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
  object DataSourceCp: TDataSource
    Left = 584
    Top = 344
  end
end
