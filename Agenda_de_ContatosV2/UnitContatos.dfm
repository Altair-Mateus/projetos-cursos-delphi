object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 398
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelId: TLabel
    Left = 16
    Top = 32
    Width = 15
    Height = 21
    Caption = 'Id'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  object LabelNome: TLabel
    Left = 112
    Top = 28
    Width = 45
    Height = 21
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  object LabelTelefone: TLabel
    Left = 16
    Top = 96
    Width = 63
    Height = 21
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  object LabelEmail: TLabel
    Left = 273
    Top = 96
    Width = 44
    Height = 21
    Caption = 'E-mail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  object LabelObservacoes: TLabel
    Left = 18
    Top = 168
    Width = 95
    Height = 21
    Caption = 'Observa'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  object Label_Status: TLabel
    Left = 170
    Top = 368
    Width = 55
    Height = 41
  end
  object Label_StatusConBd: TLabel
    Left = 18
    Top = 368
    Width = 146
    Height = 13
    Caption = 'Status da Conex'#227'o com o BD: '
  end
  object EditId: TEdit
    Left = 16
    Top = 55
    Width = 73
    Height = 27
    Color = clInactiveBorder
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object EditNome: TEdit
    Left = 112
    Top = 55
    Width = 521
    Height = 27
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object EditTelefone: TEdit
    Left = 18
    Top = 123
    Width = 224
    Height = 27
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EditEmail: TEdit
    Left = 273
    Top = 123
    Width = 225
    Height = 27
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object MemoObservacoes: TMemo
    Left = 18
    Top = 195
    Width = 320
    Height = 97
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Button_Novo: TButton
    Left = 137
    Top = 320
    Width = 105
    Height = 42
    Caption = 'NOVO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object Button_Salvar: TButton
    Left = 256
    Top = 320
    Width = 105
    Height = 42
    Caption = 'SALVAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Button1: TButton
    Left = 18
    Top = 320
    Width = 105
    Height = 42
    Caption = 'Verifica Conex'#227'o com o BD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    WordWrap = True
    OnClick = Button1Click
  end
  object Button_BuscaPrimeiroRegistro: TButton
    Left = 367
    Top = 320
    Width = 105
    Height = 42
    Caption = 'Busca 1'#186' Registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Button_BuscaPrimeiroRegistroClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\Projetos Desenvolvimento\Delphi\Agenda_de_ContatosV2' +
        '\Dados\AGENDACONTATOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Left = 608
    Top = 104
  end
  object FDTable_Contatos: TFDTable
    Connection = FDConnection1
    Left = 608
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = FDTable_Contatos
    Left = 608
    Top = 208
  end
  object FDTable_Contato: TFDTable
    Connection = FDConnection1
    Left = 472
    Top = 192
  end
end
