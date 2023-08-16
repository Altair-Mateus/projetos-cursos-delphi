inherited frmRelUsuarios: TfrmRelUsuarios
  Caption = 'frmRelUsuarios'
  TextHeight = 15
  inherited RLReport: TRLReport
    DataSource = DataSourceUsuarios
    Font.Height = -16
    inherited rlbTitulo: TRLBand
      inherited rllblTitulo: TRLLabel
        Left = 258
        Width = 202
        Caption = 'Rela'#231#227'o de Usu'#225'rios'
        ExplicitLeft = 258
        ExplicitWidth = 202
      end
    end
    inherited rlbNomeColunas: TRLBand
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
        Left = 595
        Top = 0
        Width = 58
        Height = 22
        Align = faTopOnly
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
    inherited rlbDados: TRLBand
      object rldbtNome: TRLDBText
        Left = 1
        Top = 0
        Width = 51
        Height = 18
        Align = faLeftTop
        DataField = 'NOME'
        DataSource = DataSourceUsuarios
        Text = ''
      end
      object rldbtLogin: TRLDBText
        Left = 354
        Top = 0
        Width = 51
        Height = 18
        Align = faTopOnly
        DataField = 'LOGIN'
        DataSource = DataSourceUsuarios
        Text = ''
      end
      object rldbtStatus: TRLDBText
        Left = 593
        Top = 0
        Width = 66
        Height = 18
        Align = faTopOnly
        Alignment = taJustify
        DataField = 'STATUS'
        DataSource = DataSourceUsuarios
        Text = ''
      end
    end
    inherited rlbRodape: TRLBand
      inherited rlsiData: TRLSystemInfo
        Left = 531
        Top = 19
        Width = 90
        Height = 18
        ExplicitLeft = 531
        ExplicitTop = 19
        ExplicitWidth = 90
        ExplicitHeight = 18
      end
      inherited rlsiHora: TRLSystemInfo
        Top = 19
        Width = 72
        Height = 18
        ExplicitTop = 19
        ExplicitWidth = 72
        ExplicitHeight = 18
      end
      inherited rlsiNumPag: TRLSystemInfo
        Width = 161
        Height = 18
        ExplicitWidth = 161
        ExplicitHeight = 18
      end
      inherited rlsiLastPage: TRLSystemInfo
        Left = 162
        Width = 159
        Height = 18
        ExplicitLeft = 162
        ExplicitWidth = 159
        ExplicitHeight = 18
      end
      inherited rllblNomeUser: TRLLabel
        Top = 19
        Width = 102
        Height = 18
        ExplicitTop = 19
        ExplicitWidth = 102
        ExplicitHeight = 18
      end
    end
  end
  object DataSourceUsuarios: TDataSource [1]
    Left = 672
    Top = 296
  end
end
