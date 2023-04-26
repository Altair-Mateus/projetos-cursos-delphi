object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 307
  Width = 444
  object FDConnection: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'Protocol=TCPIP')
    LoginPrompt = False
    Left = 24
    Top = 32
  end
end
