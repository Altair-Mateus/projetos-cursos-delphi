inherited frmCliente: TfrmCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 646
  ClientWidth = 1343
  WindowState = wsMaximized
  ExplicitTop = -135
  ExplicitWidth = 1355
  ExplicitHeight = 684
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    Width = 1343
    Height = 646
    ExplicitWidth = 1339
    ExplicitHeight = 645
    inherited CardCadastro: TCard
      Width = 1341
      Height = 644
      ExplicitWidth = 1341
      ExplicitHeight = 644
      inherited pnlBotoesCad: TPanel
        Top = 575
        Width = 1341
        ExplicitTop = 575
        ExplicitWidth = 1341
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
        end
      end
      inherited PanelCampos: TPanel
        Width = 1341
        Height = 534
        ExplicitWidth = 1341
        ExplicitHeight = 534
        object LabelNome: TLabel
          Left = 32
          Top = 48
          Width = 42
          Height = 19
          Caption = 'Nome'
        end
        object lblCpf: TLabel
          Left = 32
          Top = 120
          Width = 27
          Height = 19
          Caption = 'CPF'
        end
        object lblCnpj: TLabel
          Left = 208
          Top = 120
          Width = 37
          Height = 19
          Caption = 'CNPJ'
        end
        object lblIe: TLabel
          Left = 384
          Top = 120
          Width = 15
          Height = 19
          Caption = 'IE'
        end
        object lblEnderco: TLabel
          Left = 32
          Top = 192
          Width = 65
          Height = 19
          Caption = 'Endere'#231'o'
        end
        object lblNumLog: TLabel
          Left = 384
          Top = 192
          Width = 19
          Height = 19
          Caption = 'N'#186
        end
        object lblCidade: TLabel
          Left = 32
          Top = 264
          Width = 48
          Height = 19
          Caption = 'Cidade'
        end
        object lblCep: TLabel
          Left = 208
          Top = 264
          Width = 28
          Height = 19
          Caption = 'CEP'
        end
        object lblUf: TLabel
          Left = 384
          Top = 264
          Width = 19
          Height = 19
          Caption = 'UF'
        end
        object lblComplemento: TLabel
          Left = 472
          Top = 264
          Width = 99
          Height = 19
          Caption = 'Complemento'
        end
        object lblCelular: TLabel
          Left = 32
          Top = 336
          Width = 49
          Height = 19
          Caption = 'Celular'
        end
        object lblTelefone: TLabel
          Left = 208
          Top = 336
          Width = 61
          Height = 19
          Caption = 'Telefone'
        end
        object lblEmail: TLabel
          Left = 382
          Top = 336
          Width = 45
          Height = 19
          Caption = 'E-mail'
        end
        object lblBairro: TLabel
          Left = 472
          Top = 192
          Width = 42
          Height = 19
          Caption = 'Bairro'
        end
        object LabelStatus: TLabel
          Left = 560
          Top = 147
          Width = 43
          Height = 19
          Caption = 'Status'
        end
        object edtNome: TEdit
          Left = 32
          Top = 73
          Width = 449
          Height = 27
          Color = clWhite
          MaxLength = 200
          TabOrder = 0
        end
        object gbTipoCliente: TGroupBox
          Left = 512
          Top = 48
          Width = 177
          Height = 52
          Caption = 'Tipo de Cliente'
          TabOrder = 1
          object rbFisica: TRadioButton
            Left = 8
            Top = 24
            Width = 73
            Height = 17
            Caption = 'F'#237'sica'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rbFisicaClick
          end
          object rbJuridica: TRadioButton
            Left = 88
            Top = 24
            Width = 113
            Height = 17
            Caption = 'Jur'#237'dica'
            TabOrder = 1
            OnClick = rbJuridicaClick
          end
        end
        object edtEndereco: TEdit
          Left = 32
          Top = 217
          Width = 329
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 5
        end
        object edtNumLog: TEdit
          Left = 384
          Top = 217
          Width = 65
          Height = 27
          Color = clWhite
          MaxLength = 10
          TabOrder = 6
        end
        object edtCidade: TEdit
          Left = 32
          Top = 289
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 8
        end
        object edtCep: TEdit
          Left = 208
          Top = 289
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 10
          TabOrder = 9
        end
        object cbUf: TComboBox
          Left = 384
          Top = 289
          Width = 65
          Height = 27
          Style = csDropDownList
          TabOrder = 10
          Items.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
        end
        object edtComplemento: TEdit
          Left = 472
          Top = 289
          Width = 321
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 11
        end
        object edtCelular: TEdit
          Left = 32
          Top = 361
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 15
          TabOrder = 12
        end
        object edtTelefone: TEdit
          Left = 208
          Top = 361
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 15
          TabOrder = 13
        end
        object edtEmail: TEdit
          Left = 384
          Top = 361
          Width = 241
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 14
        end
        object edtBairro: TEdit
          Left = 472
          Top = 217
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 10
          TabOrder = 7
        end
        object edtCpf: TMaskEdit
          Left = 32
          Top = 145
          Width = 153
          Height = 27
          EditMask = '000.000.000-00;0;_'
          MaxLength = 14
          TabOrder = 2
          Text = ''
        end
        object edtIe: TEdit
          Left = 384
          Top = 145
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 10
          TabOrder = 4
        end
        object edtCnpj: TMaskEdit
          Left = 208
          Top = 145
          Width = 152
          Height = 27
          ImeName = 'edtCnpj'
          TabOrder = 3
          Text = ''
        end
        object ToggleStatus: TToggleSwitch
          Left = 624
          Top = 145
          Width = 105
          Height = 21
          Color = 9750962
          DisabledColor = 5737262
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          FrameColor = 5737262
          ParentFont = False
          State = tssOn
          StateCaptions.CaptionOn = 'Ativo'
          StateCaptions.CaptionOff = 'Inativo'
          TabOrder = 15
          ThumbColor = 5737262
        end
      end
      inherited PanelTitulo: TPanel
        Width = 1341
        ExplicitWidth = 1341
        inherited lblTitulo: TLabel
          Width = 210
          Caption = 'Inserindo um novo Cliente'
          Color = 5934893
          ExplicitWidth = 210
        end
      end
    end
    inherited CardPesquisa: TCard
      Width = 1341
      Height = 644
      ExplicitWidth = 1337
      ExplicitHeight = 643
      inherited pnlPesquisa: TPanel
        Width = 1341
        Height = 137
        ExplicitWidth = 1337
        ExplicitHeight = 137
        inherited lblPesquisar: TLabel
          Left = 176
          Top = 40
          ExplicitLeft = 176
          ExplicitTop = 40
        end
        object imgCliente: TImage [1]
          Left = 28
          Top = 44
          Width = 80
          Height = 80
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000800000
            00800806000000C33E61CB0000000473424954080808087C0864880000000970
            485973000003B1000003B101F583ED490000001974455874536F667477617265
            007777772E696E6B73636170652E6F72679BEE3C1A000014674944415478DAED
            9D095C1447BEC7ABBAE766184007040515351849BCEF232A269E49CCF1E24631
            7ECCFA4C361B21A782C9E6C0645FA2A831514C5E12D7F879268031BBD1D54413
            15911B0151D4E0090822F73DCCDD5DAF1A83AB30CC74CF0C3390EEDFE703D3F4
            5457FFEBDFDFAEBB0A0804F15AD0DD060872AF0400782E01009E4B0080E71200
            E0B90400782E01009E4B0080E71200E0B90400782E01009E4B0080E71200E0B9
            0400782E01009E4B0080E71200E0B90400782E01009E4B0080E71200E0B90400
            782E01009EEB0F07C0D288A8091081193861C108C20067C40911AAC0BF8A0041
            A6C56FDF98E7EE343A537F080096BCFEBA5C6492BC0A005A8DFF1CDA9DF74200
            5C83007E2DD5C8B7EFD913A37777DA1D55AF0760F99A758FD110C6E1C341AEBC
            2F06A1984028227EE7E69FDDED0347D4AB01088F58F72A02F0137C48B8C90484
            1DF8417C5C6C8CBB7D61AF7A2D004B23D7BD0311FCD0DD76308210FD2D7EC7E6
            8FDC6D875DB6BBDB007B842B7A8BB1E13F02F7BDF91D45E3E2E089EF766E3EEC
            6E43B8AAD701B02A2ACA53A70345B81056BBDB960EAA32D38A61FB3F8FD1B8DB
            102EEA75002C8B8CDE00107ACFDD76581276E67BB83ED0238A250E36F71EBDF8
            E28BE2168977153EF471B72D5DA8AE42ADF04F8E8931BBDB10B6EA55008447AE
            7D0421E298BBEDB0260488B0C4B88DC9EEB683AD7A1500CBD644C5628BD7B9DB
            0EEB421B13E236BFE56E2BD8AAB701B01F5BFC8CBBEDB0A1C484B8D865EE3682
            AD7A17009151A9388F9DE16E3B6C28050330CBDD46B055EF0220222A1F7F8C71
            B71D36948F0118E76E23D84A00C0F91200E82E0900385F020056042144738607
            9D5E3E61B8EAC3A3A7C5C5B54DC3585CC66F0098091900C1C910A06004812767
            831068C15615D13491B3EFF38D39777FE72A00E46251CBBCD081054F8D1EE627
            1191F731E71AB5869CC87D27C7510891362EEF04C0B32FAF9F88599AE4884F10
            80C50409B39C3D21C529002C59B28424FD87AC82084503E74EC8B88E0D8C0D51
            2B76C5C4C4D0DD0980975C523763D880CBF3470C22D54AF9687C4AD6314C7963
            6BFA5B0753279A2924B112551B008C4F44FE43560384A2F0B921CEB293999042
            00B011FBE41BC6278EC6E73000F88DEFFFFBC8DC246725B253A221CAA14CE6A7
            44223133DA6611000FA9A431C8DBA3C2565C5E0A99CE5B213378CBC4667F4F0F
            6A989F97DCC7431A4440A23F1B5B0C66F3A50D87B3C525F5CD5D819E6F369B1E
            C7B61EC0C713BACB275899661A3DBDFFF3CD958E44E21000E16BDE1C8420998A
            0F83BA31A1ED869662FA9BF1E18396BE9F3B6250D69FA7864EE96E3B18655EAF
            48DE71EAEC6C8B7622701E1BEB856D1DE80A9F9848F8D0FECF36953A10877D7A
            FCC5188552A24D07AEAC952370195B3CDCD2573D05006CE425ECD6FB5DE61300
            F2CC62D343FBB76DD3D973B1DD00844744BD8B29FFC085091500E8428ECC48B2
            0B80E591912A1AC9996CC7CB95091500E8528D720518B83B36B685EB857601B0
            6C4DF49F7061B7CFC589BC03C0AC6181B94F8E196AF6964B55ED691091849224
            60B7D74518D134AA3251747DBB558D7A43CBA1822271D2E5B2716E0280999DBA
            247147EC0F5CAFB30F80C8A8AFF1C358EDEA443200BCB368526D6840DFE92EBF
            370B5DBC5597F13F47B3FBB8050000BE4A8C8BFD0BD7EBEC032022EA28FE98EF
            EA44CE7F60D0899593431F76F57DB9E8F35305BFA65D2F9FE7F21B4370346147
            EC42EE97D9210C402EFE18EFEA346EFF53588E5A299BE8EAFB7251495DD3CF6F
            1FCC58E4865BE725C4C572EE77B0178033F863ACAB53B87BC5BCAB32F1EDAED9
            9EAA66BD31FDA5F813EE28A2EC1A83E816007C14B2EA1683C1DB469729676D7F
            7676AEDA43DE9DBD6B0EABB8AEE9D7BF1DCC706A112022A1D1532A6D6CD0EAFD
            AC04EB39006C7E7A667A804A31E497C2D2ABFB722F4F345294DC198EC04DBD5C
            DCD4EBD100EC3C55703AFD7AB953BAC5652252BB746248CE23C307859437698A
            A27F4CB396B3F40C005E983132392C247076FBDF08A1E6B246CDF99F2E144BB2
            8B2A4619295AEA88533E7C7C5AE6505FAFA98EC4D15DBA56DD98F9DEE14C876C
            1393847E6A70C0F94747061B03BD95232184AAF6EF922E959DDA9571A1ABE966
            EE05802408D3D6FF9A99E7E729B7D619633298CDD76F35B4D6DC6CD2500DAD7A
            12B7A145A88B155E344DC36385373AC5F7D883434E864F1A6E044C7F3B826500
            220F7CECEA72F71AFE29C63F81F8E74662EE25F9A1F325B330F0F704623AA808
            82409622808006DE32A9D9C7434605F97892015E0A5FA948C40C3289BBBA6955
            B3366BEDBF52C75334DD318C7B015048444DBB9E9BEBEC9E4143F8EE239D730C
            042E27EC8CBDD3D646679256E1A4FCC3C9F7B6A54D705CD8FA3B3E591375C952
            2F65FCAA8506FCE150AED751ABBF3DD6AC359A551D4EF31880BCE3A30024CF39
            F9DE36849E81E3E6FCF38E4F0400DC08C0C99322E0059BF091C2C9F7EF5A1004
            C3B16125777CC23700027D947EAFCC1E7DD34FE5E1474242C4C4451230D09909
            C542B8D2789D84504AD188AA6BD5D6E05AB67F514D93F66E00DA029E39E9CADE
            C9629CFDDF33CB87016088AF9762CDACD1557D3DE46AEC0B9242C8202189A1F6
            FAB92B615FDC64924C21DA5CDDACABFE2CF94C5079436B95CB00887EEFEFC73F
            7E62FA780881B73313C646B892D5FAC1E1ECFC98F7DF7AE89EF3679223F1EFED
            2E32230E031079F7890D1F7E9CF2EEA2C9D827D075B9D01D9FC086B70EA4E66D
            FAF0DDB95CAFB50B809A949F0EA8958A275C9DD07635EA0C277CA62F78E41E27
            9C3B158C5F8D22971880C042383EECE8DDA71AD28E26792BA461EEF249758BEE
            C77EB3163DCDF53ABB0030E79D48C7D9FE347725160174911837A7D3D4305C0C
            B8628CA216E8A503E1B469F7CCC0A1F34EFE8673C411EEF2092E16D24513E670
            5E36671700B569470EF655C816BB2BB11ABD29C973DABC4EA382282FE96900E1
            3FED899383D6E3EC7F53279BB27E3DE12111CF71974FEA34FA7FAB672EE49C2B
            DB0540CCDF3FFEF9FD455366E2430FD727151AB71CCB495A17BDAED3D027AE1F
            40703639A51B179016E3FAFC28F84058A76D60B66EDEFAD31B0F8FC7C59273C7
            3F584A137338336DC37B6FBB6C38F8CC703F1F8F571E1EA3F196C906EA4CE61A
            DC0CECAEECCFA03599AE292492008DDE50F6454A01CC2FAD91766C05B4EB765D
            009DC5472AAE37B2210A40340B8E9D936ED127B815306EA0AFFE2F334741A54C
            1AA8331A6F29C46266E4D2A94DC076E16660A15C2CF2C5F5A11B9F25E57B5EA9
            6ED0E25600E7115AA7F503ECFDF38272DC5C1BD00D09FD0DB77B43EF39D9A11F
            A0A3D099245C3C40660D81CC56FC2C85AB1DE825387ECE575DFAC4423FC0EE15
            737F938945A1B6A3E7269A4665CFED39DA71FADB59B702B0ED995959FD540AA7
            4FCAC464A7C41CCE9A79CF491B00B405C94F5A04689808EC588AD54126FCF023
            AC3DFC369F580020E6B129A9217E3E0F0127ABB2B935F38D1F523A0E3AB91480
            4E4BB45E98FEE0A9B0E1414EDF182121E74AC6A1F3D73BB638AEE0C40EB7752D
            3ABC6B25F0E9F70E902BD92CEAEC2C93BE02D4376C800BC3BF64E193CBF823E4
            EE738B470DCD583A21C4E9ADA5E3974A4FEDCEB8D8D1D7E7B04F38AFD1B07356
            705431BE72F0DDE706F7515DFFE8C9E94EDEA819D17F4D3859DFA43374DC1390
            E9F5F2B77975E2A7EFE1B7F77D0C401AF00F0A0112A9CD6BDA44991A4055F939
            D0D23405A7F363B8F4359BEB1F3000CCEE65F74CD850C9A5F5FFBB2CCC1BBBD9
            A91B5A46FF98565CD6D0127C6F624109CE1583B9C6C519802531311251ADB609
            58285FF73E3FFF0649104EDBB4596B325F58BDF798A5A560668D51E175E8AB18
            ADB5EB51E2B6BB672FD3402CCE034A1F03F0F4F2075279102088DB1534449B81
            415F0E34CDE5A0A581004603D3A52AF9DD43BBE0D2D75FB0769F156BD77A98F5
            04E3934E2B8777AD98775121261F70964F707BBF6C45E7F29F91DEAC5678ED8F
            893172898F3300CB22D7CD0208265BFA2E72D698E4A94303663B2BB107CF5D4F
            DD9777C562190A015C101FB7E9176BD7A3F86D4771406BE303DA360F20D075F7
            2D02BFC0F0D71758F5C9CBEB1600021EB1F4DDD2F121A98B470F755A3D20FD5A
            45F2CE94AED625C259F13B37A570898F33004BD7447F03217ADED277B829D8FC
            F5F2B9060881AFA3093551F48DFFFEF6D7002BF30A6DEEC685123E2DC4BF1D9D
            A35F0897BD6EB5261F1E1195880078D6D27762121A76AF9857E98C9C113745AA
            57EF3D2EC3CDEEAE9AB8DF609FACE2122727009E7B356A38450166DCBDCBB6ED
            CC6103725E9A396A02D7B83BC8FCD1D19C4B176ED53E682D0C4DD063F76DDF72
            C1A2B3984EA1C44F99D5C44A07EC60A4014B5F5331BB8558FA727944F4481A37
            3CF1A1A8AB0846F6F72D786BC184506B6158087D71AA2027D5FA7C43038DC851
            FB767E7C856DA4AC1F52DB86077EC129F80A9BB5DA95534293E7870E9A6D673A
            E9C4DC2B99FF2E286233C52BAF42AD9862696B56F4FDF650405117EDB3A18368
            34192E7FE374C7D3B363624401B5DA2CC062FC61F1A821E9B84530D5DE0AE1F1
            C2D2B4DD99176DF770229061AE2E9EB97FFF7E8A4DBCAC01085F13158DDFA98D
            6CC33F3D7658DA3363868D0710B29F114C51CDDF64175E3C76A98CF5C44AFC5E
            AE8FDF19DBA96F1E256CDB833F56B2BEB77525E06220DC519FCC1F1194B972D2
            88070049B2EFA54448F77DFEB5BC0367AF71E8DE86D109719B625985641328FC
            AFEB7D10894AB874AFFACB45373F19875B45FD069403AFBE1331085D938F9019
            D4576783DACA90B7CFD63697B41A5937277102B4129171C09E4F3F6D6C8BEACB
            2FC5C053F70126633DDB38586A13F06F7A0786DDCE6D9E7FED356FA359528ECB
            05D6E3FF833D24D73F1AD3D713A803AE823E7E93B14FBA2E1210A24153FD6950
            5516F8C6991A50A93373996CD324151907B7FBC486FF6C0BB7715FC61F3BB978
            6B5C1FE9B9B523FA8CFEFDCF32E0A12A024A6F3990C97C0041CA8099D201A3AE
            1E37BB8C40AB613A75FA3101775C6EC8CBACD5B31ED2254522B33AA87FF443E1
            CFE6E372FF4988D0E373F28FD0DE2D0D4EED9368F4F429491ABFB019D2309E22
            6076EADEF8D175372BB6D034CDBA5C9FAA96E5450EF7694F5B1550282FE366A9
            B4CD27A4480E684A0FF4FA06A0A9D781D6566C3F6A7BE89B0B1B0AF2EBF5A338
            190CE14B093B36D9ECC0620940F4BFB0314F71B9FFE3033C33960D5672EE053B
            50D692FA7DA9A6ADD9441084C953DDF7AAEFA0A02A75E000E0A9EEA390CAE572
            522A918B085289033095B34E239204A24A16641D54C98CBA3E5CEF6F493AA9A2
            FE97C98B5B684876ACC963E65003A2E926CA64D2188D069D596B30681A1BA986
            9A1A514D51A9BABEB27228A2A8B629DCCF0EF44C7D2248C9B9499870A339E3D0
            CD566EBE44E087849DB14B6C05639B03FC863F388DF6BD1CE2756A86AF8273D7
            706E8321F9802C4875FFB4C99442A51A09EC1CD02169FAFADCD387540A83C6A1
            26A956AAAC393EF1D1163329B277A72F7D6B734BC1E58C2CF2297D79CB781FF1
            6CAE11A456EB4E7D71B591AB2F2FE026E1485B81D80250066E2F8060ADED13FD
            B2D5127232976BF09B76266DD4C3EA1685CA291B2C41806A27166654045697D8
            74842595F9059FCFBD7F6A7F04615F67D8E3A96B29997EF67883C2A8E5346853
            6BA4B25FC9A9E6E44BB65DC36C0128C01FAC9D789F527C65C36835935DB21D0B
            D7160C1D57702D7044B76CF1A2D4B5E44EB894A9EED35C33984DF87A956F49EE
            F0A9751A8567B74C2FBBAFAC307364D11966E0866D0BC9F0FEF9DA1B579B4D21
            2CC33362353AC8AE1510B1EE3B0460B8AD70121218E68D26B2C215FD46620259
            95BFF8EDAAC76F7D7D8D773FFB46EC38484C192FF5AF29ABF3AFBBA9EAA3A90F
            901AF5CC5031348AA5CD75CA3E9595EAA0A65B7D83D426B1C4E648A3A3F26DA8
            BA3AA3E0785FFC00D8D55320A84FD0565CFCE51C9864A4D8BC58E8DB84B8CD2B
            6C47CB424B23A2C37176FA9D870C340DEE87CA4206A046B527A47C9408782911
            A95200A95206555271DB7FEF94810A650A28F29AC9226A5DCAE879D76ABD7DED
            CAA27BBBD48D558533CF9DC0D934B25DCF19D2940202348C4FF50613B8A1D1A3
            E6662D30346920D5A081A0BA0988AE5542EF924A10D8AA67F62984CB13E336C5
            DB8AD62A0008C702CADE9C47D3C44A08D1C310023F5B11FE2E1A94293340A997
            D5CE8B0B43C6665D0972CDCE5E3D55F7975EC80A2D3E67DD07839A5341600BD3
            33CAAA17113FB61A4483E30401F6C0819B7FB516B64B00D0CD7563008D98FFC9
            6BFFAADB16491A28EC3B1298884E4BC674328FD347263FD96DDBCBF6262DCCFE
            314FAED776AE6F88E946105A7701288D8E4C724D03041D01033FB1B876D22200
            A86CED7318A3AF8153E6D4C106D0283D074A3DFB6320DA2B31D489F18B6E3529
            7D5CB2AD5B4F9777735DE99CFCA3CC7C4AB26DBF2F95E9327EE32B818F9EE948
            73C6EA2B1D7ED2AB61D0964E45422700F0C30FC7367C0B9CBC9EED76E4A005D7
            FACA9B4CFE25273C562C703CC23F8E1E69FDBF232A51D51040A0FE4E98C76849
            CCCEE2CBE1C02D89779FBCE721E3873F0A3F24668FFE6E9DDB7E9E987DE62A31
            A9D7FC530557E83EEA74EE4894DCDDDBDF1800A426C2A06DE7DB4FDC01E07685
            6F6D363EECEE6DD84C87C5915A2392BB769BD91E2E29D0353C6ADEC1CC5D103B
            1C99756583A02D537185BE6D7EC37F00287B7321CE9E7FEEEE845240547450F4
            86D3FE81C21F494F98B69690901ADCFD7782F3DB5B07FF01A0742DB3A68EF3EA
            52AE3240E5D99FC8977BFA3F7E728B1EA5769E95A2D6EEF70D043FE00AE192DB
            8780C9FE630850A6A9052EF8A7CCCD489D715CBCCA6D2B8B7BB21E31FF235D05
            EA5CB1D9551D0852FA411843DF06A0646D3020804BD6D637C280942472059B5E
            42DE690EB537C51B55B8C6376634180ED97AE3360065519300A2B35D715F0180
            AEE55200009A04076ECDF91D80B5B3719DF0A42B6E2B00D0B55C0A000461B81E
            902C00D0832400C0730900F05C02003C970000CF2500C073B90F801BD10F0082
            7ADF15F7AD42C137D3454B9CBDA5EC1F42D3CDFB6FF683C5AEF10D4D6E808336
            5D74FE98BFA05E2501009E4B0080E71200E0B90400782E01009E4B0080E71200
            E0B90400782E01009E4B0080E71200E0B90400782E01009E4B0080E71200E0B9
            0400782E01009E4B0080E71200E0B90400782E01009E4B0080E71200E0B9FE1F
            429D24F9DFB397FC0000000049454E44AE426082}
          Stretch = True
          Transparent = True
        end
        object lblClientes: TLabel [2]
          AlignWithMargins = True
          Left = 28
          Top = 15
          Width = 64
          Height = 23
          Margins.Top = 15
          Alignment = taCenter
          Caption = 'Clientes'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object lblTipo: TLabel [3]
          Left = 509
          Top = 39
          Width = 85
          Height = 19
          Align = alCustom
          Caption = 'Tipo Cliente'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object lblStatus: TLabel [4]
          Left = 710
          Top = 39
          Width = 96
          Height = 19
          Align = alCustom
          Caption = 'Status Cliente'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        inherited edtPesquisar: TEdit
          Left = 176
          Top = 64
          Width = 297
          OnChange = edtPesquisarChange
          ExplicitLeft = 176
          ExplicitTop = 64
          ExplicitWidth = 297
        end
        inherited btnPesquisae: TButton
          Left = 1217
          Top = 30
          Height = 77
          Margins.Top = 30
          Margins.Bottom = 30
          OnClick = btnPesquisaeClick
          ExplicitLeft = 1213
          ExplicitTop = 30
          ExplicitHeight = 77
        end
        object cbTipo: TComboBox
          Left = 509
          Top = 64
          Width = 174
          Height = 27
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'TODOS'
          OnChange = cbTipoChange
          Items.Strings = (
            'TODOS'
            'F'#205'SICA'
            'JUR'#205'DICA')
        end
        object gbFiltros: TGroupBox
          Left = 903
          Top = 15
          Width = 236
          Height = 92
          Caption = 'Ordenar consulta por'
          Color = clWhite
          DefaultHeaderFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWhite
          HeaderFont.Height = -16
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 3
          object rbDataCad: TRadioButton
            Left = 3
            Top = 33
            Width = 118
            Height = 17
            Caption = 'Data Cadastro'
            Color = 5934893
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            OnClick = rbDataCadClick
          end
          object rbNome: TRadioButton
            Left = 127
            Top = 33
            Width = 118
            Height = 17
            Caption = 'Nome'
            Color = 5934893
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            OnClick = rbNomeClick
          end
          object rbId: TRadioButton
            Left = 3
            Top = 56
            Width = 118
            Height = 17
            Caption = 'ID'
            Checked = True
            Color = 5934893
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
            TabStop = True
            OnClick = rbIdClick
          end
        end
        object cbStatus: TComboBox
          Left = 710
          Top = 64
          Width = 155
          Height = 27
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 4
          Text = 'TODOS'
          OnClick = cbStatusClick
          Items.Strings = (
            'TODOS'
            'ATIVO'
            'INATIVO')
        end
      end
      inherited pnlBotoes: TPanel
        Top = 575
        Width = 1341
        ExplicitTop = 574
        ExplicitWidth = 1337
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
        end
        inherited btnImprimir: TButton
          OnClick = btnImprimirClick
        end
        inherited btnSair: TButton
          Left = 1217
          ExplicitLeft = 1213
        end
      end
      inherited pnlGrid: TPanel
        Top = 137
        Width = 1341
        Height = 438
        ExplicitTop = 137
        ExplicitWidth = 1337
        ExplicitHeight = 437
        inherited DBGrid1: TDBGrid
          Width = 1339
          Height = 436
          DataSource = DataSourceCliente
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_CLI'
              Title.Caption = 'Id'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 304
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CELULAR'
              Title.Caption = 'Celular'
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Caption = 'Telefone'
              Width = 147
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDERECO'
              Title.Caption = 'Endere'#231'o'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_LOGRADOURO'
              Title.Caption = 'N'#186
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAIRRO'
              Title.Caption = 'Bairro'
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADE'
              Title.Caption = 'Cidade'
              Width = 118
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEP'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Title.Caption = 'UF'
              Width = 50
              Visible = True
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 816
    Top = 248
  end
  object DataSourceCliente: TDataSource
    DataSet = dmClientes.cdsClientes
    Left = 689
    Top = 250
  end
end
