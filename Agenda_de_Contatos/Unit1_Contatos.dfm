object Form_contatos: TForm_contatos
  Left = 0
  Top = 0
  Caption = 'Gest'#227'o de Contatos'
  ClientHeight = 344
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
  object EditId: TEdit
    Left = 16
    Top = 55
    Width = 73
    Height = 31
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '1'
  end
  object EditNome: TEdit
    Left = 16
    Top = 119
    Width = 177
    Height = 31
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'Altair'
  end
  object EditTelefone: TEdit
    Left = 17
    Top = 259
    Width = 177
    Height = 31
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '516666666'
  end
  object EditEmail: TEdit
    Left = 16
    Top = 195
    Width = 177
    Height = 31
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'aaaaaaaa'
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
  end
end
