object frmCadastroPai: TfrmCadastroPai
  Left = 0
  Top = 0
  Caption = 'fCadastroPai'
  ClientHeight = 349
  ClientWidth = 772
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 65
    Align = alTop
    Color = clMenu
    ParentBackground = False
    TabOrder = 0
    object BitBtnNovo: TBitBtn
      Left = 0
      Top = 10
      Width = 113
      Height = 49
      Caption = 'NOVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 0
      Images = ImageList1
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtnNovoClick
    end
    object BitBtnSalvar: TBitBtn
      Left = 136
      Top = 8
      Width = 113
      Height = 49
      Caption = 'SALVAR'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      Images = ImageList1
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtnSalvarClick
    end
    object BitBtnSair: TBitBtn
      Left = 659
      Top = 8
      Width = 113
      Height = 49
      Caption = 'SAIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtnSairClick
    end
    object BitBtnCancelar: TBitBtn
      Left = 264
      Top = 10
      Width = 113
      Height = 49
      Caption = 'CANCELAR'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Images = ImageList1
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtnCancelarClick
    end
  end
  object PanelCampos: TPanel
    Left = 0
    Top = 65
    Width = 772
    Height = 284
    Align = alClient
    Enabled = False
    TabOrder = 1
  end
  object DataSourceCadastro: TDataSource
    DataSet = FDQueryCadastro
    Left = 664
    Top = 160
  end
  object FDQueryCadastro: TFDQuery
    Connection = dmDados.FDConnection
    Transaction = FDTransactionCadastro
    Left = 664
    Top = 96
  end
  object FDUpdateSQLCadastro: TFDUpdateSQL
    Connection = dmDados.FDConnection
    Left = 664
    Top = 232
  end
  object FDTransactionCadastro: TFDTransaction
    Connection = dmDados.FDConnection
    Left = 664
    Top = 296
  end
  object ImageList1: TImageList
    Left = 368
    Top = 200
    Bitmap = {
      494C010103000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000058A4710058A4710058A4710058A4710058A4710058A471000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000056A26C0084D5B1005ED09D005ED09D0070C79C0053A06A000000
      000000000000000000000000000000000000000000003D3D3D0041414100A5A5
      A500ADADAD00A8A8A800A6A6A600A2A2A200A0A0A0009D9D9D009A9A9A009A9A
      9A00919191003D3D3D00353535000000000000000000000000003B46E200616B
      F9003842E000000000000000000000000000000000000000000000000000616B
      F900616BF9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000053A069008CD8B60062D19F0062D19F0073C89E00509E67000000
      00000000000000000000000000000000000000000000949494004B4B4B00128B
      F300128BF300128BF300128BF300128BF300128BF300128BF300128BF300128B
      F300128BF3007F7F7F005050500000000000000000003A44E1005660F1007E87
      FE00626CF90000000000000000000000000000000000000000003842E0007E87
      FE00737CFE003A44E10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D9A600097DDBE006CD3A5006CD3A5007ACBA2004A985E000000
      000000000000000000000000000000000000000000003E3E3E0041414100F0F0
      F00000000000FDFDFD00FAFAFA00F3F3F300F0F0F000EAEAEA00E7E7E700E7E7
      E700D5D5D50030303000212121000000000000000000464FE7005961F1006B74
      FE007882FE00616BF9003943E1000000000000000000616BF900828CFE006B74
      FE00626BF800464FE7003741DF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000049975C0099DEC00072D5A80072D5A8007FCBA50046955A000000
      000000000000000000000000000000000000000000004242420044444400EFEF
      EF000000000000000000FEFEFE00F8F8F800F5F5F500EFEFEF00ECECEC00ECEC
      EC00D9D9D900303030002121210000000000000000003741DF004851E800646C
      F9006A73FD007B85FE005D67F700000000003B46E2007B85FE00747DFE00646C
      F9005C64F3003741DF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000058A4710056A26C0053A069004D9A
      600049975C003E8E500098DEBF007ED8B0007ED8B0008ACFAB003E8E50004695
      5A004A985E00509E670053A06A0058A47100000000004C4C4C004B4B4B00EFEF
      EF0000000000000000000000000000000000FEFEFE00F8F8F800F5F5F500F5F5
      F500E2E2E2002F2F2F0021212100000000000000000000000000000000004750
      E7005860F100616AF700646DF9006770FB006770FB00616AF7005D65F4004750
      E7003741DF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000058A4710074CAA00072C89D0078CB
      A1007ECBA40088CFAA008ED0AD0085DAB40085DAB40077C9A00072C89D0078CB
      A1007ECBA40088CFAA008ED0AD0058A4710000000000515151004E4E4E00EFEF
      EF000000000000000000000000000000000000000000FDFDFD00FAFAFA00FBFB
      FB00E6E6E6002F2F2F0021212100000000000000000000000000000000003640
      DE00424AE300575FF0005A62F2005C64F3005C64F300575FF0004E55E9003640
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000058A4710093DDBC0093DDBC0093DD
      BC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DDBC0093DD
      BC0093DDBC0093DDBC0093DDBC0058A47100000000005B5B5B0055555500F0F0
      F000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F0002F2F2F0021212100000000000000000000000000000000000000
      000000000000575FF0005A62F2005C64F3005C64F300575FF0003640DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000058A4710099DFC00099DFC00099DF
      C00099DFC00099DFC00099DFC00099DFC00099DFC00099DFC00099DFC00099DF
      C00099DFC00099DFC00099DFC00058A47100000000006060600059595900E9E9
      E900FCFCFC00F4F4F400F4F4F400F5F5F500F5F5F500F5F5F500F5F5F5000000
      0000EAEAEA003131310022222200000000000000000000000000000000000000
      00003640DE00575FF0005A62F2005C64F3005C64F300575FF0004E55E9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000058A4710094DDBD0098DEBF0099DE
      C00097DDBE008CD8B60084D5B100A7E3C800A7E3C8007AD0A6009ADFC00099DE
      C00097DDBE008CD8B60084D5B10058A47100000000006B6B6B006A6A6A006262
      6200606060004E4E4E004A4A4A0045454500424242003D3D3D003A3A3A003737
      370037373700343434002D2D2D00000000000000000000000000000000004750
      E7005860F100616AF700646DF9006770FB006770FB00616AF7005D65F4004750
      E7003741DF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000058A4710053A06A00509E67004A98
      5E0046955A003E8E50008CD8B600ADE5CC00ADE5CC0080D1A9003E8E50004997
      5C004D9A600053A0690056A26C0058A4710000000000707070006A6A6A005E5E
      5E005A5A5A0060606000616161005959590055555500535353004F4F4F004242
      42003B3B3B0038383800333333000000000000000000000000003741DF005A62
      F200616AF7006D76FE00717BFE003B46E2006B74FE006D76FE00666FFA005A62
      F2004851E8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000049975C0097DDBE00B9E8D300B9E8D3008CD2AE0046955A000000
      0000000000000000000000000000000000000000000075757500414141003030
      3000202020000000000000000000ECECEC00EAEAEA00B1B1B100B3B3B300C7C7
      C7008D8D8D00404040003D3D3D000000000000000000464FE7005961F1006B74
      FE007882FE00616BF9003943E1000000000000000000616BF900828CFE006B74
      FE00626BF800464FE7003741DF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D9A600099DEC000BEE9D600BEE9D60091D3B1004A985E000000
      000000000000000000000000000000000000000000007A7A7A00444444003434
      340025252500F7F7F700FAFAFA00E3E3E300E6E6E6005D5D5D0070707000C3C3
      C30089898900444444004141410000000000000000004C54EA006169F600757F
      FE00848DFE003842E0000000000000000000000000003842E000636DFA00757F
      FE006972FC004C54EA003842E000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000053A0690098DEBF00C7EBDB00C7EBDB009BD4B500509E67000000
      0000000000000000000000000000000000000000000082828200484848003434
      340027272700F5F5F500FAFAFA00E2E2E200E6E6E6005151510067676700C2C2
      C2008C8C8C004C4C4C004A4A4A000000000000000000000000003B46E200616B
      F9003842E000000000000000000000000000000000000000000000000000616B
      F900616BF9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000056A26C0094DDBD00CAECDD00CAECDD009ED5B70053A06A000000
      0000000000000000000000000000000000000000000088888800454545002F2F
      2F00212121000000000000000000ECECEC00EAEAEA009B9B9B00A2A2A200C6C6
      C60093939300505050004E4E4E00000000000000000000000000000000003A44
      E200000000000000000000000000000000000000000000000000000000003A44
      E2003B46E2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000058A4710058A4710058A4710058A4710058A4710058A471000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F81FFFFFFFFF0000F81F8001C7E70000
      F81F800187C30000F81F880181810000F81F8C018103000000008F01E0070000
      00008F81E00F000000008FF1F81F000000008011F01F000000008001E0070000
      00008001C0070000F81F860181810000F81F800183810000F81F8001C7E70000
      F81F8601EFE70000F81FFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
