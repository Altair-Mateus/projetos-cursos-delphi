inherited frmRelFornecedores: TfrmRelFornecedores
  Caption = 'frmRelFornecedores'
  ExplicitWidth = 786
  ExplicitHeight = 479
  TextHeight = 15
  inherited RLReport: TRLReport
    DataSource = DataSourceFornecedores
    inherited rlbTitulo: TRLBand
      inherited rllblTitulo: TRLLabel
        Left = 233
        Width = 250
        Caption = 'Rela'#231#227'o de Fornecedores'
        ExplicitLeft = 233
        ExplicitWidth = 250
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
        Left = 63
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
      object rllblTelefone: TRLLabel
        Left = 487
        Top = 1
        Width = 81
        Height = 22
        Align = faTopOnly
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllblCelular: TRLLabel
        Left = 599
        Top = 1
        Width = 64
        Height = 22
        Align = faTopOnly
        Caption = 'Celular'
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
        Width = 69
        Height = 18
        Align = faLeftTop
        DataField = 'id_fornec'
        DataSource = DataSourceFornecedores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtNome: TRLDBText
        Left = 66
        Top = 0
        Width = 93
        Height = 18
        Align = faTopOnly
        DataField = 'razao_social'
        DataSource = DataSourceFornecedores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtTelefone: TRLDBText
        Left = 495
        Top = 0
        Width = 59
        Height = 18
        Align = faTopOnly
        DataField = 'telefone'
        DataSource = DataSourceFornecedores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object rldbtCelular: TRLDBText
        Left = 604
        Top = 0
        Width = 53
        Height = 18
        Align = faTopOnly
        DataField = 'Celular'
        DataSource = DataSourceFornecedores
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
  object DataSourceFornecedores: TDataSource
    Left = 456
    Top = 344
  end
end
