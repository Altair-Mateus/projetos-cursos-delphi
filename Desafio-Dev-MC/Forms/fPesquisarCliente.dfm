inherited frmPesquisarClientes: TfrmPesquisarClientes
  Caption = 'Pesquisar Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited ButtonPesquisa: TButton
      OnClick = ButtonPesquisaClick
    end
    inherited ButtonNovo: TButton
      OnClick = ButtonNovoClick
    end
    inherited RadioButtonNome: TRadioButton
      Caption = 'C'#243'digo'
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
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Title.Caption = 'Bairro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Caption = 'Cidade'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FONE'
        Title.Caption = 'Fone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR'
        Title.Caption = 'Celular'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Caption = 'E-mail'
        Visible = True
      end>
  end
  inherited FDQueryPesquisar: TFDQuery
    Transaction = FDTransactionPesquisar
    SQL.Strings = (
      'select * from cliente')
    object FDQueryPesquisarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPesquisarNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 35
    end
    object FDQueryPesquisarENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 35
    end
    object FDQueryPesquisarBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object FDQueryPesquisarCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object FDQueryPesquisarCEP: TWideStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object FDQueryPesquisarUF: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object FDQueryPesquisarFONE: TWideStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      Size = 15
    end
    object FDQueryPesquisarCELULAR: TWideStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object FDQueryPesquisarEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
  end
end
