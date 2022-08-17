object Form_contatos: TForm_contatos
  Left = 0
  Top = 0
  Caption = 'Gest'#227'o de Contatos'
  ClientHeight = 370
  ClientWidth = 632
  Color = clBtnHighlight
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
    Left = 16
    Top = 92
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
    Top = 168
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
    Left = 17
    Top = 232
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
  object LabelRegistros: TLabel
    Left = 288
    Top = 32
    Width = 138
    Height = 21
    Caption = 'Todos os Registros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  object LabelObservacoes: TLabel
    Left = 288
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
    Text = '1'
  end
  object EditNome: TEdit
    Left = 16
    Top = 119
    Width = 225
    Height = 27
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'Altair'
  end
  object EditTelefone: TEdit
    Left = 18
    Top = 195
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
    Text = '516666666'
  end
  object EditEmail: TEdit
    Left = 17
    Top = 259
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
    Text = 'aaaaaaab'
  end
  object DBNavigator1: TDBNavigator
    Left = 17
    Top = 311
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 4
    OnClick = DBNavigator1Click
  end
  object DBGrid1: TDBGrid
    Left = 288
    Top = 59
    Width = 320
    Height = 91
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object MemoObservacoes: TMemo
    Left = 288
    Top = 195
    Width = 320
    Height = 97
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Curte '
      'Tecnologia')
    ParentFont = False
    TabOrder = 6
  end
  object Button1: TButton
    Left = 520
    Top = 303
    Width = 88
    Height = 42
    Caption = 'SAIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\Projetos Desenvolvimento\Delphi\Agenda_de_Contatos\D' +
        'ados\AGENDACONTATOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 592
    Top = 24
  end
  object BindSourceCONTATOS: TBindSourceDB
    DataSet = FDTableCONTATOS
    ScopeMappings = <>
    Left = 584
    Top = 136
  end
  object FDTableCONTATOS: TFDTable
    Active = True
    IndexFieldNames = 'ID'
    Connection = FDConnection1
    TableName = 'CONTATOS'
    Left = 584
    Top = 80
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceCONTATOS
      FieldName = 'ID'
      Control = EditId
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceCONTATOS
      FieldName = 'NOME'
      Control = EditNome
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceCONTATOS
      FieldName = 'TELEFONE'
      Control = EditTelefone
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceCONTATOS
      FieldName = 'EMAIL'
      Control = EditEmail
      Track = True
    end
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceCONTATOS
      FieldName = 'OBSERVACOES'
      Control = MemoObservacoes
      Track = False
    end
  end
  object DataSource1: TDataSource
    DataSet = FDTableCONTATOS
    Left = 264
    Top = 312
  end
end
