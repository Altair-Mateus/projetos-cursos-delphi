object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Agenda de Contatos  - v2.0'
  ClientHeight = 521
  ClientWidth = 677
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelId: TLabel
    Left = 32
    Top = 133
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
    Left = 128
    Top = 129
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
    Left = 32
    Top = 197
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
    Left = 289
    Top = 197
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
    Left = 34
    Top = 269
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
    Left = 396
    Top = 497
    Width = 3
    Height = 13
  end
  object Label_StatusConBd: TLabel
    Left = 244
    Top = 497
    Width = 146
    Height = 13
    Caption = 'Status da Conex'#227'o com o BD: '
  end
  object LabelPesquisar: TLabel
    Left = 34
    Top = 25
    Width = 118
    Height = 21
    Caption = 'Pesquisar por ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton_Pesquisar: TSpeedButton
    Left = 256
    Top = 37
    Width = 126
    Height = 42
    Caption = 'PESQUISAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFF6F6F6
      999999F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFDFDFDF8B8B8B676767606165DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF8D8D8D676767CACACACDCDCD636568DFDFDFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF585858898989B6B6B6DEDEDED2D2
      D267696DDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF606367
      909090B6B6B6DEDEDED2D2D26B6E72DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFDFDFDF66686C909090B6B6B6DEDEDED3D3D3707377DFDFDFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6A6D71909090B6B6B6DEDEDED3
      D3D375787CE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6D71
      76909090B5B5B5DEDEDEC2C4C57E8590FFFFFFFFFFFFFFFFFFFFFFFFEAEAEAD4
      D4D4D2D2D2EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFDFDFDF72767B8E8E8EAAABAC94979AA8A9A9D1D1D1ECECEC8181
      814545453A3A3A3636363333333030303939397E7E7EF9F9F9FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF797A7A7F80819A9B9B767676
      5757574B4B4B57514A8A7054A87E52AC7C4CA675469B6E417D5E404039323535
      35D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7DCE3EC
      EDEE979797595959535353807260BF996CC29666BF9161BB8D5AB88854B2814E
      A977459D6C3E69523C303030D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF9E9E9E5D5D5D897C6BCBA87FCBA477C59C6CC39766C0
      9361BD8E5CBC8C58B88752AE7B499F6C3D69523C3D3D3DFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F736F69CCAF89D9BD9BCDA9
      7DC7A071C59B6AC29665C09361BD8F5CBB8B58B88753AD7A489D6C3E443D3692
      9292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF737373A89881
      DCC29FE2CEB3D0AF84CAA375C79F70C59B6AC19665BF9260BD8E5CBB8B58B684
      51A876447F6042494949FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9
      E9E9747474CDB490E4CFB4E6D4BCD4B58DCCA87ACAA374C79F6FC49A6AC29664
      BF915FBD8E5CBA8A56B2814F9B6D403A3A3AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFD0D0D0797979DAC099E8D6BEE8D8C1D9BD99D0AE81CCA779C9
      A374C79E6EC49969C19564C0915FBD8E5BB98955A573443E3E3EFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D67E7E7EDCC29CE9D9C0EBDCC6DFC8
      A9D3B489CEAB7FCBA778C9A273C69D6DC49969C19564BF915FBC8C59B2804F43
      4343FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF838383D4BD9B
      E7D6BCECDECAE7D5BDDBBF99D1B185CEAB7DCCA678C9A173C69D6DC39968C194
      62BD905DAE85574C4C4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF919191B9AA95E4CFAFECDDC8ECDDC8E3CEB1D7BB93D2B083CEAA7DCBA577
      C8A272C69D6DC39868C09463907659686868FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB9B9B995928DDAC5A2E7D4B8ECDEC8EADBC6E3CDAFD9
      BC96D2B186CEAB7FCAA578C8A171C69D6CBD956667615AB7B7B7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC959595AEA393DFC9A5E6D4
      B8EBDCC6EADBC6E5D1B6DCC3A0D5B78FCFAC81CAA677C7A0718B7A67737373FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6
      919191AFA494DBC4A2E3CEAEE7D5BAE7D6BDE5D2B7DFC9A9D7B993CAA87F9384
      726F6F6FF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFEAEAEA9A9A9A999590BBAC96D3BD9ADBC29BD9BE97CCB28F
      AE9C83837E78868686F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCC9C9C9C8D8D8D88
      8888868686858585959595CACACAFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    OnClick = SpeedButton_PesquisarClick
  end
  object EditId: TEdit
    Left = 32
    Top = 156
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
    Left = 128
    Top = 156
    Width = 514
    Height = 27
    Color = clInactiveBorder
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object EditTelefone: TEdit
    Left = 34
    Top = 224
    Width = 224
    Height = 27
    Color = clInactiveBorder
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EditEmail: TEdit
    Left = 289
    Top = 224
    Width = 353
    Height = 27
    Color = clInactiveBorder
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object MemoObservacoes: TMemo
    Left = 34
    Top = 296
    Width = 608
    Height = 97
    Color = clInactiveBorder
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Button_Novo: TButton
    Left = 71
    Top = 421
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
    OnClick = Button_NovoClick
  end
  object Button_Salvar: TButton
    Left = 183
    Top = 421
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
    OnClick = Button_SalvarClick
  end
  object Button_ContatoAnterior: TButton
    Left = 294
    Top = 469
    Width = 47
    Height = 26
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button_ContatoAnteriorClick
  end
  object Button_ProximoContato: TButton
    Left = 347
    Top = 469
    Width = 47
    Height = 26
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Button_ProximoContatoClick
  end
  object Button_Excluir: TButton
    Left = 405
    Top = 421
    Width = 105
    Height = 42
    Caption = 'EXCLUIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = Button_ExcluirClick
  end
  object Button_Editar: TButton
    Left = 294
    Top = 421
    Width = 105
    Height = 42
    Caption = 'EDITAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = Button_EditarClick
  end
  object Button_Cancelar: TButton
    Left = 516
    Top = 421
    Width = 105
    Height = 42
    Caption = 'CANCELAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = Button_CancelarClick
  end
  object EditPesquisa: TEdit
    Left = 34
    Top = 52
    Width = 199
    Height = 27
    Color = clMenuBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
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
    Left = 640
    Top = 88
  end
  object FDTable_Contatos: TFDTable
    BeforePost = FDTable_ContatosBeforePost
    Connection = FDConnection1
    Left = 640
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = FDTable_Contatos
    Left = 640
    Top = 192
  end
end
