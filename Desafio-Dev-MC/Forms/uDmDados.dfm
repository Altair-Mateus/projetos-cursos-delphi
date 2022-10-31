object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 382
  Width = 664
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=D:\Projetos Desenvolvimento\desafioDevMC\teste-de-conhe' +
        'cimento\BANCO\MC_TESTE.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=UTF8'
      'DriverID=FB')
    LoginPrompt = False
    Left = 320
    Top = 176
  end
end
