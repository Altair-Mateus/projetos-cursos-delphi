object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 360
  Width = 610
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=D:\Projetos Desenvolvimento\Delphi\SistemaDeVendas\BD\D' +
        'ADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
end
