object DataModuleLookup: TDataModuleLookup
  OldCreateOrder = False
  Height = 345
  Width = 541
  object FDQueryEstados: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from estado;')
    Left = 88
    Top = 40
  end
  object DataSourceEstados: TDataSource
    DataSet = FDQueryEstados
    Left = 88
    Top = 104
  end
  object FDTransaction: TFDTransaction
    Connection = dmDados.FDConnection
    Left = 400
    Top = 160
  end
  object DataSourceCidade: TDataSource
    DataSet = FDQueryCidade
    Left = 216
    Top = 104
  end
  object FDQueryCidade: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from cidade;')
    Left = 216
    Top = 40
  end
end
