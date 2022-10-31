inherited frmItensVenda: TfrmItensVenda
  Caption = 'frmItensVenda'
  ClientHeight = 411
  ClientWidth = 847
  ExplicitWidth = 863
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 88
    Top = 112
    Width = 42
    Height = 13
    Caption = 'NRNOTA'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 88
    Top = 152
    Width = 45
    Height = 13
    Caption = 'EMISSAO'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 88
    Top = 192
    Width = 41
    Height = 13
    Caption = 'CLIENTE'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 88
    Top = 232
    Width = 63
    Height = 13
    Caption = 'TIPO_VENDA'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [4]
    Left = 88
    Top = 272
    Width = 72
    Height = 13
    Caption = 'VALOR_VENDA'
    FocusControl = DBEdit5
  end
  object Label6: TLabel [5]
    Left = 88
    Top = 312
    Width = 95
    Height = 13
    Caption = 'OPERACAO_VENDA'
    FocusControl = DBEdit6
  end
  inherited Panel1: TPanel
    Width = 847
    ExplicitWidth = 847
    inherited BitBtnNovo: TBitBtn
      Enabled = False
    end
    inherited BitBtnSalvar: TBitBtn
      Enabled = False
    end
    inherited BitBtnCancelar: TBitBtn
      Enabled = False
    end
  end
  object DBEdit1: TDBEdit [7]
    Left = 88
    Top = 128
    Width = 134
    Height = 21
    DataField = 'NRNOTA'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit [8]
    Left = 88
    Top = 168
    Width = 134
    Height = 21
    DataField = 'EMISSAO'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit [9]
    Left = 88
    Top = 208
    Width = 134
    Height = 21
    DataField = 'CLIENTE'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit4: TDBEdit [10]
    Left = 88
    Top = 248
    Width = 17
    Height = 21
    DataField = 'TIPO_VENDA'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit5: TDBEdit [11]
    Left = 88
    Top = 288
    Width = 251
    Height = 21
    DataField = 'VALOR_VENDA'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit6: TDBEdit [12]
    Left = 88
    Top = 328
    Width = 17
    Height = 21
    DataField = 'OPERACAO_VENDA'
    DataSource = DataSource1
    TabOrder = 6
  end
  inherited FDQueryCadastro: TFDQuery
    SQL.Strings = (
      'SELECT * FROM VENDA WHERE NRNOTA = :nrnota')
    ParamData = <
      item
        Name = 'NRNOTA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited ImageList1: TImageList
    Left = 496
    Top = 184
  end
  object FDQueryClientes: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from Cliente')
    Left = 496
    Top = 256
  end
  object FDQueryVenda: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from venda')
    Left = 272
    Top = 320
    object FDQueryVendaNRNOTA: TIntegerField
      FieldName = 'NRNOTA'
      Origin = 'NRNOTA'
      Required = True
    end
    object FDQueryVendaEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object FDQueryVendaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Required = True
    end
    object FDQueryVendaTIPO_VENDA: TWideStringField
      FieldName = 'TIPO_VENDA'
      Origin = 'TIPO_VENDA'
      FixedChar = True
      Size = 1
    end
    object FDQueryVendaVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      Precision = 18
    end
    object FDQueryVendaOPERACAO_VENDA: TWideStringField
      FieldName = 'OPERACAO_VENDA'
      Origin = 'OPERACAO_VENDA'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQueryVenda
    Left = 416
    Top = 208
  end
end
