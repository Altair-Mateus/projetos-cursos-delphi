inherited frmFornecedores: TfrmFornecedores
  Caption = 'Cadastro de Fornecedores'
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
          Left = 552
          Top = 192
          Width = 19
          Height = 19
          Caption = 'N'#186
        end
        object lblBairro: TLabel
          Left = 640
          Top = 192
          Width = 42
          Height = 19
          Caption = 'Bairro'
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
        object lblCep: TLabel
          Left = 208
          Top = 264
          Width = 28
          Height = 19
          Caption = 'CEP'
        end
        object lblCidade: TLabel
          Left = 32
          Top = 264
          Width = 48
          Height = 19
          Caption = 'Cidade'
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
        object lblNomeFantasia: TLabel
          Left = 424
          Top = 48
          Width = 104
          Height = 19
          Caption = 'Nome Fantasia'
        end
        object edtNome: TEdit
          Left = 32
          Top = 73
          Width = 367
          Height = 27
          Color = clWhite
          MaxLength = 200
          TabOrder = 0
        end
        object gbTipoFornecedor: TGroupBox
          Left = 568
          Top = 120
          Width = 176
          Height = 52
          Caption = 'Tipo de Fornecedor'
          TabOrder = 5
          object rbFisica: TRadioButton
            Left = 8
            Top = 24
            Width = 73
            Height = 17
            Caption = 'F'#237'sica'
            TabOrder = 0
            OnClick = rbFisicaClick
          end
          object rbJuridica: TRadioButton
            Left = 88
            Top = 24
            Width = 113
            Height = 17
            Caption = 'Jur'#237'dica'
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = rbJuridicaClick
          end
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
        object edtCnpj: TMaskEdit
          Left = 208
          Top = 145
          Width = 152
          Height = 27
          ImeName = 'edtCnpj'
          TabOrder = 3
          Text = ''
        end
        object edtIe: TEdit
          Left = 384
          Top = 145
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 20
          TabOrder = 4
        end
        object edtEndereco: TEdit
          Left = 32
          Top = 217
          Width = 497
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 6
        end
        object edtNumLog: TEdit
          Left = 552
          Top = 217
          Width = 65
          Height = 27
          Color = clWhite
          MaxLength = 10
          TabOrder = 7
        end
        object edtBairro: TEdit
          Left = 640
          Top = 217
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 10
          TabOrder = 8
        end
        object cbUf: TComboBox
          Left = 384
          Top = 289
          Width = 65
          Height = 27
          Style = csDropDownList
          TabOrder = 11
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
          TabOrder = 12
        end
        object edtCep: TEdit
          Left = 208
          Top = 289
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 10
          TabOrder = 10
        end
        object edtCidade: TEdit
          Left = 32
          Top = 289
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 9
        end
        object edtCelular: TEdit
          Left = 32
          Top = 361
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 15
          TabOrder = 13
        end
        object edtTelefone: TEdit
          Left = 208
          Top = 361
          Width = 153
          Height = 27
          Color = clWhite
          MaxLength = 15
          TabOrder = 14
        end
        object edtEmail: TEdit
          Left = 384
          Top = 361
          Width = 409
          Height = 27
          Color = clWhite
          MaxLength = 100
          TabOrder = 15
        end
        object edtNomeFantasia: TEdit
          Left = 424
          Top = 73
          Width = 369
          Height = 27
          Color = clWhite
          MaxLength = 200
          TabOrder = 1
        end
      end
      inherited PanelTitulo: TPanel
        Width = 1341
        ExplicitWidth = 1341
        inherited lblTitulo: TLabel
          Width = 245
          Caption = 'Inserindo um novo Fornecedor'
          Color = 5934893
          ExplicitWidth = 245
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
          Left = 182
          Top = 40
          ExplicitLeft = 182
          ExplicitTop = 40
        end
        object imgFornecedor: TImage [1]
          Left = 44
          Top = 44
          Width = 80
          Height = 80
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000001000000
            010008060000005C72A8660000000473424954080808087C0864880000000970
            485973000007620000076201387A99DB0000001974455874536F667477617265
            007777772E696E6B73636170652E6F72679BEE3C1A00001F4A4944415478DAED
            9D07781CC5D9C7DFD93BE954AC62F5E22AB91B5C40B211C660E3A0662C9D1CE4
            463025B40408B64C0909F91049F84CD3C9011CF8803CD4003101C932B64C2704
            1C5C70C5E0022EB857C9B6ACAE9B6FF61C272E6AA7DBDDD9BBFBFF9EE7ACD5DD
            7AE77D57B7BF9DD99D99650400F05B98EC000000F2800000F063200000FC1853
            0AA0B0B038F06453B8DDC9F9E50A53E288F821E2F4656DF7E3EF7EF67271BDEC
            F800F0154C27806C7BE93846FC25B1D8A79570F78A7F6EAE2C9F5D293B4E007C
            015309203B7F5E1663CE0AB118D8CE6A2D4210539794CF794776BC00783BA611
            80DD5E1AD9407C8B588CEDC4EAC75840F3A0256FDFB75F76DC0078339D1640EE
            E4277B3BB992A1708AE79C07691F893252B4F5A77676F5DEFD133EC99D3AFA03
            F70BE2B59CB393A2C05D0AE39BAFBE386517638C6B9E0F005E408702C8B6974C
            60C4FE20163364077B2671899134F9A62BB4D8D40191DF67426A8B1425B86C52
            5A52ADECDC00308A36055058B8C052D3B4FB31B138477690AD111C6AA3EB6765
            6BBDD9138CB3979CE47CD23EAADF2ED93902A0376D0A2027DFF1ACF8F476D901
            B6852D38906E2CCAD16BF38DA251E0B0D942FF98353CE1A4EC5C01D08B560590
            935F3293187B457670EDA1B3004EC1680727659A3DADEF72D9F902A007E70960
            DC0DC541C1D5E15BC5620FD9C1B5872102384593D84B77E7A7A53E2B3B6700B4
            E63C01E41638F239A772D9817584810238CDC3F9E9A9C5B2F306404BCE13408E
            BDE429F1F65DB203EB08090220CEE8017B5AEAA3B27307402B5A13409978DB2E
            3BB08E90210001174CB78FEAF737D9F903A005E70920DBEE28176FE6CB0EAC23
            240940E584D242174FBA2475ABEC7D0080A79C7F0DC0EE98CF897E293BB08E90
            2800952FF2D2522E470F42E0EDB4268029E25B6DFA2AAE6401881DC766E6A5A7
            BC267B3F00E009E7DF062C9CDF2DB8A961A7588C921D5C7BC81680D875DBC26B
            760E1C3F7E7CB3EC7D01405769B523506E414911E7AC447670ED215F00AE9D37
            232F3DF54DD9FB0280AED2AA008A8B8B95E56BC3D5BE00936407D816661080E0
            C3FCF4D44CD94100D055DA1C0B9099F944A825D4F21A712A901D646B048704D2
            F5B3A50BA0C5CA951E1347F5C5BC04C02B697738B0AB26B02EE206E2FC613259
            D7E098B808BAE69671B2C3503B075D6B4F4B7D43761C0074854E4D08A20E0D3E
            DEB8FB5285B10CC679B2F8D2EB3021081F248EA6CB3BBB7ACAA0A40D993F1DF5
            2FF713E6899C689C580CD328EE17F2D3FADDAAF9FE00C0004C332558D6E4D244
            C5C9D5CE35A19D58BD41B1B0218BDF99BDAD2B65BDB77E67F79686E6F96271BA
            06A12FCB4F4F1D63E4BE02402B4C2300955C7BE9759CF82B1DC5C518BB7349D9
            ECF99E94B56001B7D8FA6EFB502C8EF730ECC342009D99C71000D3612A01A8E4
            E63B668826863AF436BC958F6B45957B5665D99C17B428AB6CE5D6710A299F7A
            B819675E5A8A15BD028137623A01A84C2878263AD0D974A338D8D549FF12C44B
            7D30C817015CF94B45C5AC035A95B368D5DE1027AFF378C69F8690FAB0294387
            D6C8DC67007405530AC04816AEFCC1E333B7C5668DBA7A58EF2AD9B900E02E10
            000400FC18080002007E0C040001003F06028000801F03014000C08F81002000
            E0C740001000F06320000800F83110000400FC18080002007E0C040001003F06
            028000801F03014000C08F81002000E0C740001000F06320000800F831100004
            00FC18080002007E0C040001003F06028000801F030118208005B30B835B58C3
            55ECD4330892458189623958EFDC86A40F88EB35B067B4DEE59885AFDEFF7A7B
            F5A1EA7ADD0B6254454EB64F2C7DAF286C716149F96AF1F7F4CA69E121001D05
            F0DAACC989564BF3FF304E33C5AF2146E7366CCC501A9C36C0E862A5F1C19B9F
            52D5C16A0925B39DE2F87FEC584DC28BB73DFF7C93ECFDE056E4B203908D5E02
            78AB68D22CB17BFF489D7BD4992E400086B38573BA767A69C52AD9FBA2B34000
            1A0B60C95D39B6E30181CF8933C20DB2738300A450271A03374D2BAD784B7620
            9D0102D050006243EC6F4579AF89B7AE959D970A04200DCE389F36B574D102D9
            81740404A0A100DE9A93FF6BE27CAEEC9C4E030148A546E1ECD229A50B37C80E
            A43D20008D0450FBEA9D914E27DB247E0D949DD3692000C9705A3EB5B422C3CC
            770820008D0450F3F29DCF8ADD3955763E670201C887315E30B56451B9EC38DA
            8C4F7600B2D142002D6B2A07366EFAE03BB1A8C8CEE74C200053F0E93447C595
            B283680B084003013456CE9DDD527DB054762EE7020198821627E309334A161D
            961D486B40001A08A0BEECA10A5E7F3C4F762EE702019803CE58E1F492857F97
            1D476B40001A08A0EEDDDFADA1869A91B273391708C01C304EF74C2DAD28911D
            47ABB1C90E40369AD400DEF9ED5EDE589B243B977381004C02A392692515F7C8
            0EA3F5D0FC1C8D04404200B253390F08C024707A7E5A69C56DB2C3680D080002
            F0192000F7810020009F0102701F080002F0192000F7810020009F0102701F08
            0002F0192000F7810020009F0102701F080002F0192000F7810020009F010270
            1F080002F0192000F7810020009F0102701F080002F0192000F7810020009F01
            02701F080002F0192000F7810020009F0102701F080002F0192000F781002000
            9F0102701F080002F0192000F7810020009F0102701F080002F0192000F78100
            20009F0102701F080002F0192000F7810020009F0102701F080002F0192000F7
            810020009F0102701F080002D09486BA46DABB7D1FF51DDC4B7D36B6A1654300
            EE030140009A7160F7215AFEFED754575347F13D626974761A05870619563E04
            E03E100004E031DCC9E9DB959B69E3F2EF889FB1376DC18134EA271753524A82
            21F94200EE030140001E71F2782D7DB574251DDE77B4CD75FA88E640DAF81164
            09B0E81A0B04E03E100004D065766CFA91BEFE742D3537B674B86E78541865E4
            A453644C846EF14000EE030140006ED3D4D8240EFC75B473D32EB7FE9FC562A1
            61970DA501C35374B9400801B80F040001B8C5D1FD55F42F51E5AF3976B2CBDB
            484E4DA451132EA2C0E0404D638300DC070280003A857A716FEBBA1F68DD3F37
            90D3E9F12EA3A0101B8DCE4CA384DE719AE50B01B80F0400017448ED893AFAEA
            FD557468CF616D0314CD00B539307CEC05A4288AC79B8300DC07028000DA65F7
            0F7B69E547ABA9B1BE49B738A3E2BB5346763A758B0CF5683B1080FB40001040
            ABB434B7D0FA2F37D296B53F1812AB35C04A232EBF80522FE8DBE56D4000EE03
            014000E771ECC871D785BE63878F1B1E73CFFEC9943E612405D802DCFEBF1080
            FB400010C07FE19CB6ACDB46EBBEF8869C2D4E6971878685D025D969149314ED
            D6FF8300DC0702F061010C1935902ECC18D2B91C6A1B68C5875FD3BE1D076487
            ED4251180DBD64B010D8C04E771958F2CA8774A2BA4676E8E7030198175F1640
            52DF041A9B97D1E17AEA41AF1EFCAA04CC469C3AA8282B8D42BAB53FA8A8B1A1
            91163EBF44935B949A030198175F16001367D1ACE95752444C78AB9FABD5FCF5
            5F7E439BD76EA3B346F1980CB5C3D0A80923293935A9CD75BEF9EA3BDAB87C93
            EC505B0702302FBE2C0095D0F050BA3C3FC3D517FF4CD40B7DEAD0DDAA43266C
            33B741EAB0BE3462CC85640D3C7B50D1F66F77D2CA8FD7B846259A1208C0BCF8
            BA0054D43EF8EAD5F5E8C428D19E667470CF21DAB5758F790F9876080AB6519F
            21BD28222A9C1AEA1B5DFD140EEF3D223BACF68100CC8B3F0800480602302F10
            00D01D08C0BC400040772000F3020100DD8100CC0B0400740702302F1000D01D
            08C0BC400040772000F3020100DD8100CC0B0400740702302F1000D01D08C0BC
            400040772000F3020100DD8100CC0B0400740702302F1000D01D08C0BC400040
            772000F3020100DD8100CC0B0400740702302F1000D01D08C0BC400040772000
            F3020100DD8100CC0B0400740702302F1000D01D08C0BC400040772000F30201
            00DD8100CC0B0400740702302F1000D01D08C0BC400040772000F3020100DD81
            00CC0B0400740702302F1000D01D08C0BC400040772000F3020100DD8100CC0B
            0400740702302F1080F9686A6EA186664EC18116B2287A7D4539D536B4B88E80
            10518EAE870204605E2000F350D7D8425BF65751F5C94652FF284C7C3BE32382
            A95F7C24593514C1816375F4C3C1E3D42844A3121860A1D4D8705759BA000198
            1708C01CD43636D1DA9D47C441E93CEFB3B0A0401ADE2B8AAC16C5E372761DA9
            711DFCAD911A174E3DA3BB699F1C04605E2000F9D43636D3DA1FC5C1DFD4D2E6
            3ADD6C0134BC7734057820815D47C5C17FE078BBEBF48D0DA3DE3161DA260801
            981708402E9D39F84FE389043A73F09F4673094000E6050290873B07FF69BA22
            01770EFED3682A0108C0BC400072500FFA553B0EB5DAE6EF88F0E0401A2124A0
            B08EBFBE7BAB4ED296FDC7BA14E38084084AEA1EEA79B21080798100E4F0CDEE
            A374F8447D97FF7F4A6C38F58A69FF825D8390CCF26D07C8E9BE635C28A29231
            3A259E6C0116CF928500CC0B04603C2DE288FC62CB01E2BCEBBB5E6D0AA4A5C4
            B6BBCEEEA327E9FB035D3BFB9F46935A0004605E2000E36910D5FE7F6DDDEFD1
            366C568532FA27B4BBCE8E432768C7E1131E95A3C9B50008C0BC400032E0F4A5
            A80134B574B16E2EE81E6AA3E1BDA2DB5DE7D0F13ADAB8A7CAA348872647516C
            7890A7E9420066050290837A6656CFD05DE5C29E5114DDADFD03D3299A182BB7
            1D74F530EC0AC181564AEF1BE7BA16E0111080798100E4A0B6FFBFDB7B8C0E1E
            776FBFA95FD814377AEC9D6C68A6F5BB8EB82E08BA837AE16F58CF680AB55935
            481602302D10805CAA6B1BC5ABC1D545B7C5D9F69F423D1B2745865074581085
            04BA7750B608D9A8CD8123350DAE9FED111B1E4CD1A141141711D4A9DB8C9D02
            02302F108039F8EAFB0354DFCE595A3D30872677F7A88CAA930DB4EEC723EDAE
            A35E5750AF2F680A04605E2000730001C8010280004C01042007BF15C0C48973
            BB3B6DA1A1D7DD396197D5AA902D38B0CBDB82003C070290838F0A80B39CFC92
            C1449621A4380772CE062A4403C5A9BE8FF830F4DFAFF30808B49235C0426111
            211419DDEDD42BAA1B45C58651447418B5754D0802F01C08400E3E2380893F2D
            4D71363B2F1347E918F16BAE78F5D072FBC1218194D43B96127A4651628F288A
            498CFCCF671080E7400072F06A015C95F7585280125028CEECD78B5F471A5976
            644C18F51B9C440387F7A2808F1E81003C04029083D709A0B8B85859B136FC1A
            B1788B38F0AF143F3D9F27CA0398681724061FA3FE61BBA84FE821D9BBC76B81
            00E4E03502B8F8D6FF0B883B50339D117B80331A243B9ED6E866ADA321117B68
            40F85EB2B0AEF773F747566C3B48B50DCD6D7E9E101142839222DDD8E2F91CAB
            6BA4353B0EB7BBCE457D625CF30D680A04D075D433FEF275613F27CE7E2B7EED
            2D3B9ECED0CD5A4FC3BAEF14B5827DB243F11ABEDD534507DBE9A5971A1F4E3D
            A33C9BB0531D7CB46CEB7E6A6B14B25A9B1BD33F5E93C947CF0202E81AB9F6D2
            119CF89FC56286EC58BA42B4AD8646C76CA6589B674352FD81E3EAD979E7E156
            0F4E75FAAF51A9711E4D087A9A2DFBAA696F75EBD76B922343A97F6284F6C941
            00EEF193C24723AC8D018F0823DF2E7EF5703A16B930F1D71F249A0523BBEFA0
            00A5D9F30DFA306A3F7D75FAAE338709AB0F071922DAFEEAD4E05AA0CE0EB479
            BFA86D1CABA3D3AE510F8278D1C418200E7ECDFAFF9F0904D07972F31C695C61
            6F89BD962A3B162D0915CD822BE2BF15B501F726A7F437D4813B27EA9A5CA3F7
            D4413FDD820374F992D637B7508D2847452D23C8AAE3790602E80C9C892AFFAF
            84951F17BF687C15C61C28E29B30326A3B0D8DDCE5AA19003F0102689F7185F3
            BB053535BC2E82C9971D8B11F40E3D4497C56E22ABD2B5892A80970101B44D56
            A1234A69A2F7C84B2FF4759518D1149890F80D05298DB243017A0301B44EEEE4
            277B73A7F2BE581C287B47C82022A096AE4A5CEFBA3E007C1808E07C2616940E
            7672FA48EC9D24D93B412621D606CA4C5CE79201F0512080B3C999FC540F7236
            7F415ED2B1476F5409E426AD414DC0578100FECB848267A20379E33FC5E260D9
            C99B89C8C05ACA4E5A4D36F415F03D20805364663E116A09B17C2C1647CB4EDC
            8CC4D98ED15549EBC9CA7077C0A780004E916D77BC2A0ABC4E76D266A66FE841
            BA3CFE5BD961006D797C9AA3E27ED941B4866102C82928B985387B5E76C2DEC0
            98D84DD42FCCB347670133C1674F732C9A273B8AD6304400130B9EB8C0C92DCB
            C56288EC84BD017528716EF26A8A0AAC911D0AD000C678C1D49245E5B2E36835
            36BD0B18774371504855F81AB38EE1372BEA45C1AB9357615E01EFA7B1B9A929
            F6674F579A721088EE02C8B5971473620FC94ED41B5147100E132FE0D5BC2FDA
            FFD9B283680B5D059095E7E8A730DA204AF1F0F1AAFE897AF6B7F75CE99A6908
            78274E4699334A2A3E941D475BE82A801CBB63319D9AA1177491E490A3F49384
            F5B2C3005D827D30CDB1304B7614ED46A8D786B3F34AF298C216CA4ED0179890
            B0817A841CF17C43C040F85185B3D1534A2BBE971D497BE826801C7BC90AB1F9
            74D9099E4970B08D1293A32921B13B85858590CD16E07ABFA1A1894E9CA8A5FD
            FBAA68DF9E235457D7203BD4B350A714CB4DFE5A7618A0F3B410E393A6952CAA
            941D4847E82280ECFC79598C3997CA4E4E2521318A46670CA6A117F4A61EBDE2
            4851DA4FD9E9E4B46BE741DAB87107AD58B689F6EF3F2A3B0517EA80A1C4E02A
            D961808E39C1897E36DD5151213B90CEA08B0072ED8ECFC54E182B2D2991D505
            17F6A5AC89E9D4AF7FB247DBDABA650F2D5DBC82366ED8212B1D1709C1D59495
            B8566A0CA07D38F11596163673CA9F2A36CB8EA5B3682E80EC82D20CC6F93259
            09F5E81943D3AF9B40A9FDB41D65AC8AE0ADD73FA13DBB0F7BBEB12E32316935
            C50499F276B2BFB346BCE64E7554FC9D9177CDF5A683004A5E609CDD6C7822E2
            B49F959B4E93EC1964D17A5EF77FD3D2E2A48AB265F441E5CA36E796D7934109
            B59491526D7CC1E03F30526A7950E84AA6588F5260C86E4BE290E54A42BF03B2
            E352B130AA6F26E7BE7517F7DB5ECC3AD7834C5301A8BDFE82ABC3D5A76178F6
            081737512FE6DDFC8B8974E1B0BE8694B77EED367AF1B9C5D4D868ECD0DD4091
            E7F5B3B2C8A2E70CB6C017D8274EC26F3729CAA33F4DEBD3EED3693415404E7E
            C954712A7ECBC84C434283E8AED976EA9B926864B1B4ED877DF4746919D5D51A
            7BC72073723AA50CF6EB499440E739499CDD9E3F2AE5F5B656D0560076C722F1
            E36AA3B20B08B0D2DDF74CF6F8425F57D9BE6D1FCD7BE21DD76D44A3E8DD3F81
            72A6603A05D07938E377DBD3FA3DD5DA679A09E0DFD57FF59E59B05189DDFACB
            ABE9A2B4FE4615D72A2B576CA6BF3CB7C4B0F2AC0116BAB128573403A43E1419
            78172DC202578A9AC0E7E77EA09900720A4AAF24CE3F362AA3711346D0B46BC7
            1B555CBBBCF1EAC7F4F967C675D7CDBB6E0C25F58A919D36F02E56AF494B493F
            F7E2A06602C8B63BFE2036F6A01199748F0EA3E23F5EFF9F9E7CB2512F063EFC
            E02B74E4B031B7E8D2C60EA4B4CB31BA1AB807E77C8C7D54BFB36ED16B29802F
            C5C62E352291DBEF9844232EEE6744519DE6EB555BE8853F2F36A4ACC45ED194
            7FDD65B253065E0623FE485E7ABF07CF7E4F030A0B8B036B9AC2D5E96B743F25
            F7E8194BBF2DFE19E9F110574F50FB053C52FC1AEDDEA57F4721C5A2D0CDF75D
            DD61B76600CEE1CDFCF4D41967BEA1C937E8D4433EB8213359DE745B2E8D1A6D
            CE07092DFFD777F4D20BC60C8198FE8B091411D54D76CAC09BE0F45EFEA8D449
            67BEA58900B2F31D05E28CFCAEDEF1ABA3F91E9F77ABEBF69F19696A6EA6FBEE
            7EDE90D184D985A3A8CF0063FB3E00AFE7395103F8C5996F68238002C7AF19A7
            B97A477FE9D8A134F3C64CBD8BF18897FFF23E7DF5A5FE95A14B260CA5119798
            EB3A0830398CDF909FD6EF95B3DED262BBB9F6D29738F11BF48EDFCCD5FFD32C
            5F269A012FEADF0C183CA2375D317184EC7481F750D7E26CEC3979F4E0B36696
            D1440039F612F18D67BA4F7D34B7E416EADEDDDCEDDEAA2327E8817B5FD4BD9C
            5EA971943BCDAF9EA80E3C81D1DCFCB4D4DF9CFFB60618710B30283890E6CDBF
            43CF223441BD1B30EB8EF9D450DFA86B39893DA3297F266E05824EB1362830F4
            B2ACE10927CFFD40A31A8043ED0677A19E19F4EA134FBFF99F199E6FC8001E79
            F8AFAE5985F424262E82AEB9659CEC5481D961B44E696C9E38E9D2817B5AFF58
            0372ED8E6DE2C4A7EB58DCC1437ABB06FE7803F39E7C87367DFBA3AE65844786
            D08C3BAE929D2A302F8DE2E09E6F0B0CFD5D6B67FED3685503504F77B17A66A3
            F6FC537B007A03CF3D53416B57FFA06B19365B40F34DF7E4AE939D2B300FE224
            5C2F7E88330F5B4616EBBBF917F5DADBD1FFD14A006A41BADE941E3622857EF9
            AB7C3D8BD08CF9F3CA69C3FAED3A97C2F65696CF96330E1AF80C5A09409D0471
            809E810E18D4838AEE2B3464A7784AC9630B68EBE63D9E6FA87D365796176144
            10F008AD04A04E5A7F919E81C6C777A787E7DE60C43EF198DFFDFA253A7450EF
            B9FBF8CACAF239A364E70ABC1BAD04F099F871859E81AA137D3EF5EC9DA69F0F
            AFA5B985EEBAFD69D7F30574E613510398203B5FE0DD68D50FA05C6C48F706BA
            7A1B50BD1D6866B66FDF4F8FFDE14DFD0B6254565956E41DB7458069D1A80650
            5A2AAAA4B3F40E76F294B194999DA6FF5EF180A54B5652F9DFBF30A2A8125103
            B84776BEC0BBD1A61F4081E376CEE959BD83ED3F3099E6DC3F45FFBDE2014FCE
            5D40DF6FD5FD02A03AB0E3D6CAB2392FC8CE177837DACC07905732DEA9B04F74
            0F5644FB87476FA298D808FDF74C1750A7047BF0FEBF18F2D010E654AE585231
            EB73CFB704FC194D049035B9345171F20E3B1D6852566E3A155C63CE3EF0EF2E
            F8277DB074952165B5B096F80FCAEED5B7BF31F079B49B15D880DE802AEAA0A0
            FF7DFCE7AE078298899A9A7A7AF0DE17A9DE9867041C10EDFF04D93903EF4733
            01E4DA4B1770E286F4D499907911154ED3F5AEA3DBBCF9FA27F48F4F0CEA99CB
            E9ADCA8545D365E70CBC1F0D6B0025BF109BFBB31141AB7D021EF8DD0CEAD14B
            F70A47A7F871C7017AF48F6F1A71EFFFDFB0DB2ACB673F2F3B6FE0FD68372D78
            DEBC814C716E322AF0B8F848FAED43D7922D28D0A8225B45ADF23FFAF01BB47F
            FF51C3CA743AA9FFFB1545DF4B4D1CF8045A3F1B501D03DBD3A8E0D3460DA49F
            DF96E37A34B80C38E7F4C2B38B69F5AAAD4616FBA368FFF7969230F039343D72
            B2EDA5258C789191095C79D5489A327D9C9145FE87BFBDF1297DFAD15A43CB64
            9C9E58B2B0E83E2909039F435301E4DA4B4770E26B8C4E62DC95C369EAB5E30D
            AB09A86DFDBFFDF553FAC7A7C60FC7E74E65F8D28A59C63D8810F8349A1F3139
            058E75C46998D1890C1F994AD7DF94A9FBEDC19327EBE9E517DFA70DEBB6199D
            A2CA5A51FD1F29A360E09B682E80EC02C7BDA29AFAB88C64A263C2E9FA1B3369
            C0607D2E43A8D37CBDFAD28774F488310F013D17C6F89C2565731C520A073E89
            F63580C2A762A9A9599D0E27545652E9970CA23C7B06C5C6456AB2BD8307AA69
            51D9325AB962B3AC94546A1A59609F8FCBEE3CE2F9A60038852E8D66A34607B6
            87DA57E0A2F40134F6F20B5D8388DCBD3EA05EE1DFBA69377DF1F9065AB5728B
            81F7F8DB80F1272BCBE6DC2B3708E06BE82200D7D88016BE4D6CDD14FD75A3A2
            C268F0D0DE3450340D9292A3293EB13B0558CF7EBE605353331DD85F457B761F
            A6CDDFEDA2EF36EEA4AAAA1AD9A19FA6A1D9D994F261C5FD868CB700FE836E97
            CD730B4A9F1367D1DB6427D816C121360AB29D7A9A797D7D93210FF4EC2A623F
            CE5FBA70CE9DB2E300BE876E02C8CC2FE96961EC3B92782DC047386169A6C1EF
            BD5764C02403C0DFD0F5C6794E7EC9FDA2F1FDA8EC24BD9C7B2ACB8B4A640701
            7C135D05306E5CB13538327C35E9FCD8309F85D1C683B1A123BF7EFE3643C618
            03FF43F7AE7359F98EB10AA37F1851968FC139B12B9796CFFE4C7620C07731E4
            A0CCB13B9E163F7011CB3DFE24AAFE526FA502DFC71801E43C65235BCB97E2A4
            76B1EC84BD8455D460BDACB2F257E6BD35017C02C3AAE539F6C75389ACEA1384
            CC39A3A779A8562CECE2C5EFCC9632D800F81786B6CB73F24BAF21C617185DAE
            17E1140DFF6B962E2C2A931D08F00F0C3F10730B4AEFE09C3F233B7133220EFE
            2271F097CA8E03F80F52CEC4B9F98EC73923F46B3F034E6CEED2F2D9BF911D07
            F02F2455C539CBB13B5E14C5DF247B079801F147787D49F9EC99AEF97E003010
            696DF1C2C205969AA6DDEA2CC2B7CADE093261C45EAEAD3E76CB679F1537CB8E
            05F81F922FC671966B773C24AABF0FC9DE115260ECB1CAB2590FE0CC0F64618A
            ABF1A239A07612FA937829B2633108CE18BF07B3FB00D99842002A59F9A53F51
            187F5D2CC6CB8E45670E8BDD3EB3B27C76A5EC4000308D005472263FD583399B
            DF10F5E1B1B263D105C63FB734B11918DA0BCC82A904A0A28E200C8A8CF83D23
            AEDE26B47ABC4173D02CA4F66858408FE2B7DF9ED2223B18004E633A019C263B
            6FDE30C69C7F16118E911D8B67B02F18E7BF5CB2B06883EC48003817D30AE014
            9CE5E43BAE23C69E10BFC4C98EC64D8E8A9DFBFB51238E3F5D5C5CEC941D0C00
            AD6172019CC26E2F8D6C20BA4B08E16EF16BB4EC783AE0B068EBCF6BB2363DF3
            D1DBBF3E263B1800DAC32B04709ACCCC2742AD21969B5DDD883925CB8EE71C0E
            32E2CFF286004765E5AFE43C39040037F12A019C469D5F80D99AAEE64C99499C
            E788B7022485D2C8892A4513E555566F598CF1FBC0DBF04A019CC9A4494FC634
            5B2CD345F3C02E6A05971AF02C823AF15A265EE58D2CF04D3CA90778335E2F80
            331977437150E8D1B00CA742E3456657106743C9F36B0647449B7EA390CB3F38
            299FD4471EFBEAB3978BEB65E70A8016F894005A6342C133D141CE86814E4519
            444EDE9B33D64DB4D5C58B75E7C45DCF2C10D5F81AB123AA39B11AC6790D296C
            A7E2746EAA576C9B718607BE8CCF0B0000D0361000007E0C0400801F030100E0
            C7FC3F8428E8D31A9CE41F0000000049454E44AE426082}
          Stretch = True
          Transparent = True
        end
        object lblFornecedores: TLabel [2]
          AlignWithMargins = True
          Left = 28
          Top = 15
          Width = 113
          Height = 23
          Margins.Top = 15
          Alignment = taCenter
          Caption = 'Fornecedores'
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
          Width = 116
          Height = 19
          Align = alCustom
          Caption = 'Tipo Fornecedor'
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
          Left = 182
          Top = 64
          Width = 297
          OnChange = edtPesquisarChange
          ExplicitLeft = 182
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
          OnClick = cbTipoClick
          Items.Strings = (
            'TODOS'
            'F'#205'SICA'
            'JUR'#205'DICA')
        end
        object gbFiltros: TGroupBox
          Left = 719
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
          DataSource = DataSourceFornecedor
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_FORNEC'
              Title.Caption = 'Id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZAO_SOCIAL'
              Title.Caption = 'Nome'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_FANTASIA'
              Title.Caption = 'Nome Fantasia'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CELULAR'
              Title.Caption = 'Celular'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Caption = 'Telefone'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNPJ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Title.Caption = 'E-mail'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDERECO'
              Title.Caption = 'Endere'#231'o'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_LOGRADOURO'
              Title.Caption = 'N'#186
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAIRRO'
              Title.Caption = 'Bairro'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADE'
              Title.Caption = 'Cidade'
              Width = 140
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
    Left = 832
    Top = 224
  end
  object DataSourceFornecedor: TDataSource
    DataSet = dmFornecedores.cdsFornecedores
    Left = 1201
    Top = 314
  end
end
