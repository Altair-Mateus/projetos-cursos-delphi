object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 287
  Width = 449
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      
        'Database=D:\Projetos Desenvolvimento\Delphi\Cad_Clientes\Dados\D' +
        'BTEST.FDB')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 64
  end
  object FDQryLocCliente: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select ID_CLIENTE, NOME_CLIENTE, LIMITE_TOTAL'
      'from   CLIENTES where  upper(NOME_CLIENTE) '
      'like upper(:NOME_CLIENTE)')
    Left = 208
    Top = 128
    ParamData = <
      item
        Name = 'NOME_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end>
  end
  object FDQryCadCliente: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from   CLIENTES '
      'where  ID_CLIENTE = :ID_CLIENTE')
    Left = 344
    Top = 152
    ParamData = <
      item
        Name = 'ID_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
