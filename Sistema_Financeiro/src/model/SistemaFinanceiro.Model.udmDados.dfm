object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 307
  Width = 444
  object FDConnection: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'Protocol=TCPIP'
      'DriverID=FB'
      
        'Database=D:\Projetos Desenvolvimento\Delphi\Sistema_Financeiro\d' +
        'ados\SISTEMAFINANCEIRO.FDB')
    LoginPrompt = False
    Left = 40
    Top = 32
  end
end
