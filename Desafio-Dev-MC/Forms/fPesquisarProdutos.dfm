inherited frmPesquisarProdutos: TfrmPesquisarProdutos
  Caption = 'Pesquisar Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited ButtonPesquisa: TButton
      OnClick = ButtonPesquisaClick
    end
    inherited ButtonNovo: TButton
      OnClick = ButtonNovoClick
    end
  end
  inherited DBGridResultadoPesquisa: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Caption = 'Refer'#234'ncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE'
        Title.Caption = 'Un Medida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO'
        Title.Caption = 'Saldo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VENDA'
        Title.Caption = 'Data '#218'ltima Venda'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VENDA'
        Title.Caption = 'Pre'#231'o de Venda R$'
        Visible = True
      end>
  end
  inherited FDQueryPesquisar: TFDQuery
    Active = True
    SQL.Strings = (
      'select * from produtos;')
    object FDQueryPesquisarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPesquisarDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 35
    end
    object FDQueryPesquisarREFERENCIA: TWideStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 15
    end
    object FDQueryPesquisarUNIDADE: TWideStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object FDQueryPesquisarDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
    end
    object FDQueryPesquisarPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Precision = 18
    end
    object FDQueryPesquisarSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
    end
  end
end
