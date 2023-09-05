inherited frmRelCaixa: TfrmRelCaixa
  Caption = 'frmRelCaixa'
  ClientHeight = 442
  ClientWidth = 778
  TextHeight = 15
  inherited RLReport: TRLReport
    DataSource = DataSourceCaixa
    inherited rlbTitulo: TRLBand
      inherited rllblTitulo: TRLLabel
        Left = 286
        Width = 144
        Caption = 'Rela'#231#227'o Caixa'
        ExplicitLeft = 286
        ExplicitWidth = 144
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
      object rllblTipo: TRLLabel
        Left = 470
        Top = 1
        Width = 43
        Height = 22
        Align = faTopOnly
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblValor: TRLLabel
        Left = 606
        Top = 1
        Width = 49
        Height = 22
        Align = faTopOnly
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblData: TRLLabel
        Left = 286
        Top = 1
        Width = 44
        Height = 22
        Align = faTopOnly
        Caption = 'Data'
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
        DataSource = DataSourceCaixa
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
        DataSource = DataSourceCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtData: TRLDBText
        Left = 286
        Top = 0
        Width = 105
        Height = 18
        Align = faTopOnly
        DataField = 'data_cadastro'
        DataSource = DataSourceCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtTipo: TRLDBText
        Left = 470
        Top = 0
        Width = 30
        Height = 18
        Align = faTopOnly
        DataField = 'tipo'
        DataSource = DataSourceCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtValor: TRLDBText
        Left = 606
        Top = 0
        Width = 37
        Height = 18
        Align = faTopOnly
        DataField = 'valor'
        DataSource = DataSourceCaixa
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
      Top = 225
      ExplicitTop = 225
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
    object RLBand2: TRLBand
      Left = 39
      Top = 181
      Width = 716
      Height = 44
      BandType = btSummary
      object rllblVTotEnt: TRLLabel
        Left = 622
        Top = 1
        Width = 94
        Height = 19
        Align = faCenterRight
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllblVTotSai: TRLLabel
        Left = 624
        Top = 23
        Width = 92
        Height = 19
        Align = faCenterRight
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllblTotEnt: TRLLabel
        Left = 420
        Top = 0
        Width = 144
        Height = 19
        Align = faTopOnly
        Caption = 'Total de Entradas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllblTotSai: TRLLabel
        Left = 437
        Top = 25
        Width = 127
        Height = 19
        Align = faBottomOnly
        Caption = 'Total de Sa'#237'das:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object DataSourceCaixa: TDataSource
    Left = 480
    Top = 344
  end
end
