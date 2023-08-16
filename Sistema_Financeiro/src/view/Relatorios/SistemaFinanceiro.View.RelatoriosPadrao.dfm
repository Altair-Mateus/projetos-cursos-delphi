object frmRelatorioPadrao: TfrmRelatorioPadrao
  Left = 0
  Top = 0
  Caption = 'RelPadrao'
  ClientHeight = 442
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport: TRLReport
    Left = -8
    Top = 0
    Width = 794
    Height = 1123
    DefaultFilter = RLPDFFilter1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    FooterMeasuring = fmAfterHeader
    BeforePrint = RLReportBeforePrint
    object rlbCab: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object rllblNomeEmp: TRLLabel
        Left = 1
        Top = 1
        Width = 199
        Height = 24
        Align = faLeftTop
        Caption = 'Sistema Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbTitulo: TRLBand
      Left = 38
      Top = 73
      Width = 718
      Height = 32
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object rllblTitulo: TRLLabel
        Left = 316
        Top = 0
        Width = 86
        Height = 24
        Align = faCenterTop
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object rlbNomeColunas: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 24
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
    end
    object rlbDados: TRLBand
      Left = 38
      Top = 129
      Width = 718
      Height = 20
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = False
    end
    object rlbRodape: TRLBand
      Left = 38
      Top = 149
      Width = 718
      Height = 38
      BandType = btColumnFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object rlsiData: TRLSystemInfo
        Left = 547
        Top = 21
        Width = 74
        Height = 16
        Align = faBottomOnly
        Alignment = taRightJustify
        Text = 'Data: '
      end
      object rlsiHora: TRLSystemInfo
        Left = 619
        Top = 21
        Width = 61
        Height = 16
        Align = faBottomOnly
        Info = itHour
        Text = ' '#224's '
      end
      object rlsiNumPag: TRLSystemInfo
        Left = 1
        Top = 1
        Width = 131
        Height = 16
        Align = faLeftTop
        Info = itPageNumber
        Text = 'P'#225'gina '
      end
      object rlsiLastPage: TRLSystemInfo
        Left = 132
        Top = 1
        Width = 130
        Height = 16
        Align = faLeftTop
        Info = itLastPageNumber
        Text = 'de '
      end
      object rllblNomeUser: TRLLabel
        Left = 1
        Top = 21
        Width = 85
        Height = 16
        Align = faLeftBottom
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#194#169' 1999-2' +
      '021 Fortes Inform'#195#161'tica'
    FileName = 'relatorio'
    DisplayName = 'Documento PDF'
    Left = 424
    Top = 328
  end
end
