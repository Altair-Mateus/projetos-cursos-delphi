object frmPesquisarPai: TfrmPesquisarPai
  Left = 0
  Top = 0
  Caption = 'fPesquisarPai'
  ClientHeight = 404
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 858
    Height = 121
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object LabelCodigo: TLabel
      Left = 24
      Top = 20
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object LabelNome: TLabel
      Left = 128
      Top = 20
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object LabelOrdena: TLabel
      Left = 24
      Top = 71
      Width = 114
      Height = 13
      Caption = 'Ordenar Resultado por:'
    end
    object EditCodigo: TEdit
      Left = 24
      Top = 39
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object ButtonPesquisa: TButton
      Left = 512
      Top = 19
      Width = 97
      Height = 41
      Caption = 'Pesquisar'
      ImageIndex = 4
      Images = ImageList1
      TabOrder = 1
    end
    object ButtonSair: TButton
      Left = 734
      Top = 19
      Width = 97
      Height = 41
      Caption = 'SAIR'
      TabOrder = 2
      OnClick = ButtonSairClick
    end
    object ButtonEditar: TButton
      Left = 512
      Top = 66
      Width = 97
      Height = 41
      Caption = 'Editar'
      ImageIndex = 1
      Images = ImageList1
      TabOrder = 3
      OnClick = ButtonEditarClick
    end
    object ButtonNovo: TButton
      Left = 623
      Top = 19
      Width = 97
      Height = 41
      Caption = 'Incluir'
      ImageIndex = 0
      Images = ImageList1
      TabOrder = 4
    end
    object RadioButtonCodigo: TRadioButton
      Left = 24
      Top = 96
      Width = 65
      Height = 17
      Caption = 'C'#243'digo'
      Checked = True
      TabOrder = 5
      TabStop = True
    end
    object RadioButtonNome: TRadioButton
      Left = 95
      Top = 96
      Width = 60
      Height = 17
      Caption = 'Nome'
      TabOrder = 6
    end
    object ButtonExcluir: TButton
      Left = 623
      Top = 66
      Width = 97
      Height = 41
      Caption = 'Excluir'
      ImageIndex = 2
      Images = ImageList1
      TabOrder = 7
      OnClick = ButtonExcluirClick
    end
  end
  object EditNome: TEdit
    Left = 128
    Top = 39
    Width = 361
    Height = 21
    TabOrder = 1
  end
  object DBGridResultadoPesquisa: TDBGrid
    Left = 0
    Top = 121
    Width = 858
    Height = 283
    Align = alClient
    Color = clBtnHighlight
    DataSource = DataSourcePesquisar
    DrawingStyle = gdsGradient
    GradientEndColor = 13602864
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSourcePesquisar: TDataSource
    DataSet = FDQueryPesquisar
    Left = 656
    Top = 216
  end
  object FDQueryPesquisar: TFDQuery
    Connection = dmDados.FDConnection
    Left = 656
    Top = 160
  end
  object FDTransactionPesquisar: TFDTransaction
    Connection = dmDados.FDConnection
    Left = 656
    Top = 280
  end
  object ImageList1: TImageList
    Left = 520
    Top = 264
    Bitmap = {
      494C010105000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCD2E200B9BDCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8D1E3005BD3F90077DBF400707B9B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8D2
      E5002963AC007EE3FA0045AFF100255099000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9D5E9005CD5
      FC007FE3FA00177FE4001F5EB600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9D6EA002971C1007EE3
      FA0044AFF1001F63BD00C9D6EA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFCFC006A63
      6C00483F480053495200453B4500A8A3A800F7F7F700B4C2D5002E79C8001780
      E4001F6CC8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEEEF006C646E00AD9D
      6F00FBDCAC00FFEECD00FFF5CC0060626300483C48009CA1B60091A9BC001F70
      D200C9DBF1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008D734F00EAB48600F6BD
      9100FFD8B600FFEED200FFF3D700FFFDE900FFFEF000463C4900CDC9CD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C6CB00DAA57400EDB48900F8BF
      9300FFDAB900FFEED500FFF4DA00FFFDEF00FFFEF7006B717500A5A1A7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000070647100DDA47900D39A6F00FFD0
      AC00FFDABC00FFEBD400FFEED700FFF7E100FFF8E100FFFAD7005D525F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007C6A7800DAA17600EFB68B00E5AC
      8100FDC49800FFEFE000FFECD500FFF2DA00FFF4DA00FFF2CF007D7179000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000082778800D0976C00F3BA8F00FFEE
      E200FFF9F500FFCBA300FFE6D100FFE5CB00FFE7CD00FFECC2006A5E6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A8A0AC00CB926700EBB28700FFEA
      DA00FFF1E700F1B88D00FFDBBF00FED3AE00FFD8B600D3C59400796F7C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009D7E5C00C0885C00EEB5
      8A00FBC29700EEB58A00D1986D00F1B88D00F4BE9100847A8900FCFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C929F00A0825F00CD94
      6900D69D7200DBA27700E3AA7F00DFAC7B00AB976F00E9E8EB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7AF
      BA009D91A000A1939D00968B9B00D7D3D8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000058A4710058A4710058A4710058A4710058A4710058A471000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E1DC
      EB00D5CCE200F9F8FB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000056A26C0084D5B1005ED09D005ED09D0070C79C0053A06A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8F8F800AAA8B200866A
      B300977BBF008164B100836DB4000000000000000000000000003B46E200616B
      F9003842E000000000000000000000000000000000000000000000000000616B
      F900616BF900000000000000000000000000000000003D3D3D0041414100A5A5
      A500ADADAD00A8A8A800A6A6A600A2A2A200A0A0A0009D9D9D009A9A9A009A9A
      9A00919191003D3D3D0035353500000000000000000000000000000000000000
      00000000000053A069008CD8B60062D19F0062D19F0073C89E00509E67000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDDDC00C3C3C3009290
      9400BAB1CA009277CC008067BE0000000000000000003A44E1005660F1007E87
      FE00626CF90000000000000000000000000000000000000000003842E0007E87
      FE00737CFE003A44E100000000000000000000000000949494004B4B4B00128B
      F300128BF300128BF300128BF300128BF300128BF300128BF300128BF300128B
      F300128BF3007F7F7F0050505000000000000000000000000000000000000000
      0000000000004D9A600097DDBE006CD3A5006CD3A5007ACBA2004A985E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9FDFF0083C8F400449EE30086ACCE00ABAB
      AF0091919400A8A6B1007D6FD9000000000000000000464FE7005961F1006B74
      FE007882FE00616BF9003943E1000000000000000000616BF900828CFE006B74
      FE00626BF800464FE7003741DF0000000000000000003E3E3E0041414100F0F0
      F00000000000FDFDFD00FAFAFA00F3F3F300F0F0F000EAEAEA00E7E7E700E7E7
      E700D5D5D5003030300021212100000000000000000000000000000000000000
      00000000000049975C0099DEC00072D5A80072D5A8007FCBA50046955A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008CCDF4002099EE002C9CFC003BA3FE00E4EA
      F400AEAEB1006F6F71005D5A8C0000000000000000003741DF004851E800646C
      F9006A73FD007B85FE005D67F700000000003B46E2007B85FE00747DFE00646C
      F9005C64F3003741DF000000000000000000000000004242420044444400EFEF
      EF000000000000000000FEFEFE00F8F8F800F5F5F500EFEFEF00ECECEC00ECEC
      EC00D9D9D90030303000212121000000000058A4710056A26C0053A069004D9A
      600049975C003E8E500098DEBF007ED8B0007ED8B0008ACFAB003E8E50004695
      5A004A985E00509E670053A06A0058A471000000000000000000000000000000
      000000000000000000008CCDF500289AF500319CFA0042A4FF004FAEFE006CC5
      F8006BA9C7002B2B2B005C5C5C00000000000000000000000000000000004750
      E7005860F100616AF700646DF9006770FB006770FB00616AF7005D65F4004750
      E7003741DF00000000000000000000000000000000004C4C4C004B4B4B00EFEF
      EF0000000000000000000000000000000000FEFEFE00F8F8F800F5F5F500F5F5
      F500E2E2E2002F2F2F00212121000000000058A4710074CAA00072C89D0078CB
      A1007ECBA40088CFAA008ED0AD0085DAB40085DAB40077C9A00072C89D0078CB
      A1007ECBA40088CFAA008ED0AD0058A471000000000000000000000000000000
      0000000000008ECEF4001E99EE00309CFA00389FFE004DADFF0059B8FA0071CC
      F6008DD5F40079797800FEFEFE00000000000000000000000000000000003640
      DE00424AE300575FF0005A62F2005C64F3005C64F300575FF0004E55E9003640
      DE000000000000000000000000000000000000000000515151004E4E4E00EFEF
      EF000000000000000000000000000000000000000000FDFDFD00FAFAFA00FBFB
      FB00E6E6E6002F2F2F00212121000000000058A4710093DDBC0093DDBC0093DD
      BC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DD
      BC0093DDBC0093DDBC0093DDBC0058A471000000000000000000000000000000
      000097D1F600269BF4002F9DFA0041A4FF004DACFF0063C0F7006FC9F5008FDB
      FE00B7E4FF000000000000000000000000000000000000000000000000000000
      000000000000575FF0005A62F2005C64F3005C64F300575FF0003640DE000000
      000000000000000000000000000000000000000000005B5B5B0055555500F0F0
      F000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F0002F2F2F00212121000000000058A4710099DFC00099DFC00099DF
      C00099DFC00099DFC00099DFC00099DFC00099DFC00099DFC00099DFC00099DF
      C00099DFC00099DFC00099DFC00058A471000000000000000000000000009ED5
      F6001F9BEE002E9DF800369FFD0049ABFF0055B4FC006BC8F6007CD3F700B1E2
      FF00000000000000000000000000000000000000000000000000000000000000
      00003640DE00575FF0005A62F2005C64F3005C64F300575FF0004E55E9000000
      000000000000000000000000000000000000000000006060600059595900E9E9
      E900FCFCFC00F4F4F400F4F4F400F5F5F500F5F5F500F5F5F500F5F5F5000000
      0000EAEAEA0031313100222222000000000058A4710094DDBD0098DEBF0099DE
      C00097DDBE008CD8B60084D5B100A7E3C800A7E3C8007AD0A6009ADFC00099DE
      C00097DDBE008CD8B60084D5B10058A471000000000000000000C2E6FA0030A3
      F3002498F6003CA1FF0046A8FF005EBBF90069C5F6008EDAFC00A8E0FF000000
      0000000000000000000000000000000000000000000000000000000000004750
      E7005860F100616AF700646DF9006770FB006770FB00616AF7005D65F4004750
      E7003741DF00000000000000000000000000000000006B6B6B006A6A6A006262
      6200606060004E4E4E004A4A4A0045454500424242003D3D3D003A3A3A003737
      370037373700343434002D2D2D000000000058A4710053A06A00509E67004A98
      5E0046955A003E8E50008CD8B600ADE5CC00ADE5CC0080D1A9003E8E50004997
      5C004D9A600053A0690056A26C0058A4710000000000D5F1FF00B0E5FF00A1DD
      FD0079C8FD0044A5FF0051B1FD0068C4F60079CFF500A6E0FF00F9FDFF000000
      00000000000000000000000000000000000000000000000000003741DF005A62
      F200616AF7006D76FE00717BFE003B46E2006B74FE006D76FE00666FFA005A62
      F2004851E80000000000000000000000000000000000707070006A6A6A005E5E
      5E005A5A5A0060606000616161005959590055555500535353004F4F4F004242
      42003B3B3B003838380033333300000000000000000000000000000000000000
      00000000000049975C0097DDBE00B9E8D300B9E8D3008CD2AE0046955A000000
      00000000000000000000000000000000000000000000B4E8FF00BCEDFF00D6F8
      FF00D8F8FF0098DAFE006EC8F7008DDBFC00A1DEFF0000000000000000000000
      00000000000000000000000000000000000000000000464FE7005961F1006B74
      FE007882FE00616BF9003943E1000000000000000000616BF900828CFE006B74
      FE00626BF800464FE7003741DF00000000000000000075757500414141003030
      3000202020000000000000000000ECECEC00EAEAEA00B1B1B100B3B3B300C7C7
      C7008D8D8D00404040003D3D3D00000000000000000000000000000000000000
      0000000000004D9A600099DEC000BEE9D600BEE9D60091D3B1004A985E000000
      00000000000000000000000000000000000000000000A6DBF200C0F5FF00C5F2
      FF00CAF4FF00BAEDFF0090DAFB009DDCFF00EDF9FF0000000000000000000000
      000000000000000000000000000000000000000000004C54EA006169F600757F
      FE00848DFE003842E0000000000000000000000000003842E000636DFA00757F
      FE006972FC004C54EA003842E00000000000000000007A7A7A00444444003434
      340025252500F7F7F700FAFAFA00E3E3E300E6E6E6005D5D5D0070707000C3C3
      C300898989004444440041414100000000000000000000000000000000000000
      00000000000053A0690098DEBF00C7EBDB00C7EBDB009BD4B500509E67000000
      00000000000000000000000000000000000000000000948B8700787A7A00B6F1
      FF00B3EEFF00B5EFFF00A7E2FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003B46E200616B
      F9003842E000000000000000000000000000000000000000000000000000616B
      F900616BF9000000000000000000000000000000000082828200484848003434
      340027272700F5F5F500FAFAFA00E2E2E200E6E6E6005151510067676700C2C2
      C2008C8C8C004C4C4C004A4A4A00000000000000000000000000000000000000
      00000000000056A26C0094DDBD00CAECDD00CAECDD009ED5B70053A06A000000
      00000000000000000000000000000000000000000000898887004B45440095D1
      E400A4EBFF0097E1FF00DBF3FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003A44
      E200000000000000000000000000000000000000000000000000000000003A44
      E2003B46E2000000000000000000000000000000000088888800454545002F2F
      2F00212121000000000000000000ECECEC00EAEAEA009B9B9B00A2A2A200C6C6
      C60093939300505050004E4E4E00000000000000000000000000000000000000
      00000000000058A4710058A4710058A4710058A4710058A4710058A471000000
      00000000000000000000000000000000000000000000FBFBFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFF9000000000000FFF0000000000000
      FFE0000000000000FFC1000000000000FF81000000000000C007000000000000
      8007000000000000801F000000000000001F000000000000001F000000000000
      001F000000000000001F000000000000001F000000000000801F000000000000
      803F000000000000E0FF000000000000F81FFFE3FFFFFFFFF81FFF81C7E78001
      F81FFF8187C38001F81FFE0181818801F81FFE0181038C010000FC01E0078F01
      0000F801E00F8F810000F007F81F8FF10000E00FF01F80110000C01FE0078001
      0000801FC0078001F81F807F81818601F81F807F83818001F81F81FFC7E78001
      F81F81FFEFE78601F81FBFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
