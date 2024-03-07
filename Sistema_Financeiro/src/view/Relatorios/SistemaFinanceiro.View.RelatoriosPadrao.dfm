object frmRelatorioPadrao: TfrmRelatorioPadrao
  Left = 0
  Top = 0
  Caption = 'RelPadrao'
  ClientHeight = 441
  ClientWidth = 774
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
    Borders.Sides = sdAll
    DefaultFilter = RLPDFFilter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    FooterMeasuring = fmAfterHeader
    BeforePrint = RLReportBeforePrint
    object rlbCab: TRLBand
      Left = 39
      Top = 39
      Width = 716
      Height = 35
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rllblNomeEmp: TRLLabel
        Left = 0
        Top = 0
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
      Left = 39
      Top = 74
      Width = 716
      Height = 32
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rllblTitulo: TRLLabel
        Left = 315
        Top = 4
        Width = 86
        Height = 24
        Align = faCenter
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
      Left = 39
      Top = 106
      Width = 716
      Height = 24
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
    end
    object rlbDados: TRLBand
      Left = 39
      Top = 130
      Width = 716
      Height = 20
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = rlbDadosBeforePrint
    end
    object rlbRodape: TRLBand
      Left = 39
      Top = 150
      Width = 716
      Height = 38
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rlsiData: TRLSystemInfo
        Left = 518
        Top = 22
        Width = 103
        Height = 16
        Align = faBottomOnly
        Alignment = taRightJustify
        Text = 'Data: '
      end
      object rlsiHora: TRLSystemInfo
        Left = 619
        Top = 22
        Width = 76
        Height = 16
        Align = faBottomOnly
        Info = itHour
        Text = ' '#224's '
      end
      object rlsiNumPag: TRLSystemInfo
        Left = 0
        Top = 1
        Width = 55
        Height = 16
        Align = faLeftTop
        Info = itPageNumber
        Text = 'P'#225'gina '
      end
      object rlsiLastPage: TRLSystemInfo
        Left = 55
        Top = 1
        Width = 130
        Height = 16
        Align = faLeftTop
        Info = itLastPageNumber
        Text = 'de '
      end
      object rllblNomeUser: TRLLabel
        Left = 0
        Top = 22
        Width = 121
        Height = 16
        Align = faLeftBottom
      end
    end
  end
  object RLPDFFilter: TRLPDFFilter
    DocumentInfo.Author = 'Dev Altair Mateus T Alencastro'
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#194#169' 1999-2' +
      '021 Fortes Inform'#195#161'tica'
    FileName = 'relatorio'
    DisplayName = 'Documento PDF'
    ImageFormat = ifOriginal
    Left = 304
    Top = 336
  end
end
