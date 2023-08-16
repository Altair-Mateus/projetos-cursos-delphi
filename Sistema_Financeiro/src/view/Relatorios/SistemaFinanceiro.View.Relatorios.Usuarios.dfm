object frmRelUsuarios: TfrmRelUsuarios
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Usu'#225'rios'
  ClientHeight = 510
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 19
  object RLReportUsuarios: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DataSourceUsuarios
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReportUsuariosBeforePrint
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
        Left = 258
        Top = 0
        Width = 202
        Height = 24
        Align = faCenterTop
        Alignment = taCenter
        Caption = 'Rela'#231#227'o de Usu'#225'rios'
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
      object rllblNome: TRLLabel
        Left = 1
        Top = 0
        Width = 56
        Height = 22
        Align = faLeftTop
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblLogin: TRLLabel
        Left = 354
        Top = 0
        Width = 52
        Height = 22
        Align = faTopOnly
        Caption = 'Login'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblStatus: TRLLabel
        Left = 659
        Top = 0
        Width = 58
        Height = 22
        Align = faRightTop
        Alignment = taRightJustify
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
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
      object RLDBText1: TRLDBText
        Left = 1
        Top = 0
        Width = 43
        Height = 16
        Align = faLeftTop
        DataField = 'NOME'
        DataSource = DataSourceUsuarios
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 354
        Top = 0
        Width = 43
        Height = 16
        Align = faTopOnly
        DataField = 'LOGIN'
        DataSource = DataSourceUsuarios
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 663
        Top = 0
        Width = 54
        Height = 16
        Align = faRightTop
        Alignment = taRightJustify
        DataField = 'STATUS'
        DataSource = DataSourceUsuarios
        Text = ''
      end
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
        Left = 627
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
  object DataSourceUsuarios: TDataSource
    Left = 672
    Top = 296
  end
end
