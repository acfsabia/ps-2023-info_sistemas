object frmCadastroCliente: TfrmCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 475
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcCliente: TPageControl
    Left = 0
    Top = 0
    Width = 762
    Height = 475
    ActivePage = tbsClienteCadastro
    Align = alClient
    TabOrder = 0
    object tbsClienteCadastro: TTabSheet
      Caption = 'Cadastro'
      object splEndereco: TSplitter
        Left = 0
        Top = 183
        Width = 754
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = -4
        ExplicitTop = 285
        ExplicitWidth = 750
      end
      object navCliente: TDBNavigator
        Left = 0
        Top = 0
        Width = 754
        Height = 25
        DataSource = dtsCliente
        Align = alTop
        TabOrder = 0
      end
      object pgcEndereco: TPageControl
        Left = 0
        Top = 186
        Width = 754
        Height = 261
        ActivePage = tbsEnderecoCadastro
        Align = alBottom
        TabOrder = 3
        object tbsEnderecoCadastro: TTabSheet
          Caption = 'Endere'#231'os do cliente'
          object navEndereco: TDBNavigator
            Left = 0
            Top = 0
            Width = 746
            Height = 25
            DataSource = dtsEndereco
            Align = alTop
            TabOrder = 0
          end
          object grdEndereco: TDBGrid
            Left = 0
            Top = 25
            Width = 746
            Height = 78
            Align = alClient
            DataSource = dtsEndereco
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'id_endereco'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'id_cliente'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'cep'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'logradouro'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'numero'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'complemento'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'bairro'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cidade'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'estado'
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pais'
                Width = 100
                Visible = True
              end>
          end
          object pnlEndereco: TPanel
            Left = 0
            Top = 103
            Width = 746
            Height = 130
            Align = alBottom
            TabOrder = 2
            object scbEndereco: TScrollBox
              Left = 1
              Top = 1
              Width = 744
              Height = 128
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
              object lblCep: TLabel
                Left = 2
                Top = 2
                Width = 130
                Height = 13
                AutoSize = False
                Caption = '&CEP'
                FocusControl = edtCep
              end
              object lblLogradouro: TLabel
                Left = 144
                Top = 2
                Width = 55
                Height = 13
                Caption = '&Logradouro'
                FocusControl = edtLogradouro
              end
              object lblNumero: TLabel
                Left = 603
                Top = 2
                Width = 37
                Height = 13
                Caption = 'N'#250'me&ro'
                FocusControl = edtNumero
              end
              object lblComplemento: TLabel
                Left = 2
                Top = 45
                Width = 65
                Height = 13
                Caption = 'Complement&o'
                FocusControl = edtComplemento
              end
              object lblBairro: TLabel
                Left = 387
                Top = 45
                Width = 28
                Height = 13
                Caption = '&Bairro'
                FocusControl = edtBairro
              end
              object lblCidade: TLabel
                Left = 2
                Top = 86
                Width = 33
                Height = 13
                Caption = 'Ci&dade'
                FocusControl = edtCidade
              end
              object lblEstado: TLabel
                Left = 296
                Top = 86
                Width = 33
                Height = 13
                Caption = 'E&stado'
                FocusControl = edtEstado
              end
              object lblPais: TLabel
                Left = 567
                Top = 86
                Width = 19
                Height = 13
                Caption = '&Pa'#237's'
                FocusControl = edtPais
              end
              object edtCep: TDBEdit
                Left = 2
                Top = 18
                Width = 105
                Height = 21
                Hint = 
                  'Informe um CEP brasileiro, para preenchimento autom'#225'tico do ende' +
                  're'#231'o.'
                DataField = 'cep'
                DataSource = dtsEndereco
                TabOrder = 0
                OnExit = edtCepExit
              end
              object edtLogradouro: TDBEdit
                Left = 144
                Top = 18
                Width = 443
                Height = 21
                DataField = 'logradouro'
                DataSource = dtsEndereco
                TabOrder = 2
              end
              object edtNumero: TDBEdit
                Left = 603
                Top = 18
                Width = 122
                Height = 21
                DataField = 'numero'
                DataSource = dtsEndereco
                TabOrder = 3
              end
              object edtComplemento: TDBEdit
                Left = 2
                Top = 61
                Width = 370
                Height = 21
                DataField = 'complemento'
                DataSource = dtsEndereco
                TabOrder = 4
              end
              object edtBairro: TDBEdit
                Left = 387
                Top = 61
                Width = 338
                Height = 21
                DataField = 'bairro'
                DataSource = dtsEndereco
                TabOrder = 5
              end
              object edtCidade: TDBEdit
                Left = 2
                Top = 102
                Width = 270
                Height = 21
                DataField = 'cidade'
                DataSource = dtsEndereco
                TabOrder = 6
              end
              object edtEstado: TDBEdit
                Left = 296
                Top = 102
                Width = 250
                Height = 21
                DataField = 'estado'
                DataSource = dtsEndereco
                TabOrder = 7
              end
              object edtPais: TDBEdit
                Left = 567
                Top = 102
                Width = 158
                Height = 21
                DataField = 'pais'
                DataSource = dtsEndereco
                TabOrder = 8
              end
              object btnAtualizarCep: TButton
                Left = 108
                Top = 18
                Width = 23
                Height = 22
                Hint = 'Atualiza o endere'#231'o a partir do CEP informado.'
                Caption = '...'
                TabOrder = 1
                OnClick = btnAtualizarCepClick
              end
            end
          end
        end
      end
      object grdCliente: TDBGrid
        Left = 0
        Top = 25
        Width = 754
        Height = 73
        Align = alClient
        DataSource = dtsCliente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id_cliente'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'cpf_cnpj'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'documento_rg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Width = 300
            Visible = True
          end>
      end
      object pnlCliente: TPanel
        Left = 0
        Top = 98
        Width = 754
        Height = 85
        Align = alBottom
        TabOrder = 2
        object scbCliente: TScrollBox
          Left = 1
          Top = 1
          Width = 752
          Height = 83
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object lblCpfCnpj: TLabel
            Left = 2
            Top = 0
            Width = 48
            Height = 13
            Caption = 'CPF/CNP&J'
            FocusControl = edtCpfCnpj
          end
          object lblDocumento: TLabel
            Left = 2
            Top = 43
            Width = 77
            Height = 13
            Caption = '&Identidade (RG)'
            FocusControl = edtDocumento
          end
          object lblNome: TLabel
            Left = 205
            Top = 0
            Width = 27
            Height = 13
            Caption = '&Nome'
            FocusControl = edtNome
          end
          object lblTelefone: TLabel
            Left = 205
            Top = 43
            Width = 42
            Height = 13
            Caption = 'Tele&fone'
            FocusControl = edtTelefone
          end
          object lblEMail: TLabel
            Left = 408
            Top = 43
            Width = 28
            Height = 13
            Caption = 'E-&mail'
            FocusControl = edtEMail
          end
          object edtCpfCnpj: TDBEdit
            Left = 2
            Top = 16
            Width = 186
            Height = 21
            DataField = 'cpf_cnpj'
            DataSource = dtsCliente
            TabOrder = 0
          end
          object edtDocumento: TDBEdit
            Left = 2
            Top = 59
            Width = 186
            Height = 21
            DataField = 'documento_rg'
            DataSource = dtsCliente
            TabOrder = 2
          end
          object edtNome: TDBEdit
            Left = 205
            Top = 16
            Width = 495
            Height = 21
            DataField = 'nome'
            DataSource = dtsCliente
            TabOrder = 1
          end
          object edtTelefone: TDBEdit
            Left = 205
            Top = 59
            Width = 186
            Height = 21
            DataField = 'telefone'
            DataSource = dtsCliente
            TabOrder = 3
          end
          object edtEMail: TDBEdit
            Left = 408
            Top = 59
            Width = 292
            Height = 21
            DataField = 'email'
            DataSource = dtsCliente
            TabOrder = 4
          end
          object pnlCtrlEmail: TPanel
            Left = 702
            Top = 0
            Width = 50
            Height = 83
            Hint = 'Enviar e-mail.'
            Align = alRight
            BevelOuter = bvNone
            Padding.Left = 10
            Padding.Top = 15
            Padding.Right = 10
            Padding.Bottom = 10
            TabOrder = 5
            object btnEnviarEmail: TButton
              Left = 10
              Top = 15
              Width = 30
              Height = 28
              Hint = 'Enviar e-mail.'
              Align = alTop
              Caption = '@'
              TabOrder = 0
              OnClick = btnEnviarEmailClick
              ExplicitTop = 19
            end
            object btnConfigEmail: TButton
              Left = 10
              Top = 43
              Width = 30
              Height = 22
              Hint = 'Configurar envio de e-mail...'
              Align = alTop
              Caption = '...'
              TabOrder = 1
              OnClick = btnConfigEmailClick
            end
          end
        end
      end
    end
  end
  object mtbCliente: TFDMemTable
    BeforePost = mtbClienteBeforePost
    AfterPost = mtbClienteAfterPost
    FieldDefs = <>
    IndexDefs = <>
    Indexes = <
      item
        Active = True
        Name = 'pk_cliente'
        Fields = 'id_cliente'
        Options = [soUnique, soPrimary]
      end>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 576
    Top = 16
    object mtbClienteid_cliente: TAutoIncField
      DisplayLabel = 'ID Cliente'
      FieldName = 'id_cliente'
      Required = True
      Visible = False
    end
    object mtbClientecpf_cnpj: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'cpf_cnpj'
      Size = 14
    end
    object mtbClientedocumento_rg: TStringField
      DisplayLabel = 'Identidade (RG)'
      DisplayWidth = 15
      FieldName = 'documento_rg'
    end
    object mtbClientenome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 100
      FieldName = 'nome'
      Required = True
      Size = 150
    end
    object mtbClientetelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
    end
    object mtbClienteemail: TStringField
      DisplayLabel = 'E-mail'
      DisplayWidth = 100
      FieldName = 'email'
      Size = 250
    end
  end
  object dtsCliente: TDataSource
    DataSet = mtbCliente
    Left = 640
    Top = 16
  end
  object mtbEndereco: TFDMemTable
    BeforeInsert = mtbEnderecoBeforeInsert
    BeforePost = mtbEnderecoBeforePost
    AfterPost = mtbEnderecoAfterPost
    AfterScroll = mtbEnderecoAfterScroll
    FieldDefs = <>
    IndexDefs = <>
    Indexes = <
      item
        Name = 'pk_endereco'
        Fields = 'id_endereco'
        Options = [soUnique, soPrimary]
      end
      item
        Active = True
        Name = 'un_endereco'
        Fields = 'id_cliente;id_endereco'
        Options = [soUnique]
      end>
    IndexFieldNames = 'id_cliente'
    MasterSource = dtsCliente
    MasterFields = 'id_cliente'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 576
    Top = 72
    object mtbEnderecoid_endereco: TAutoIncField
      DisplayLabel = 'ID Endere'#231'o'
      FieldName = 'id_endereco'
      Required = True
      Visible = False
    end
    object mtbEnderecoid_cliente: TIntegerField
      DisplayLabel = 'ID Cliente'
      FieldName = 'id_cliente'
      Required = True
      Visible = False
    end
    object mtbEnderecocep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 8
    end
    object mtbEnderecologradouro: TStringField
      DisplayLabel = 'Logradouro'
      DisplayWidth = 70
      FieldName = 'logradouro'
      Required = True
      Size = 100
    end
    object mtbEndereconumero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      Required = True
      Size = 10
    end
    object mtbEnderecocomplemento: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 35
      FieldName = 'complemento'
      Size = 70
    end
    object mtbEnderecobairro: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 40
      FieldName = 'bairro'
      Required = True
      Size = 70
    end
    object mtbEnderecocidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 40
      FieldName = 'cidade'
      Required = True
      Size = 70
    end
    object mtbEnderecoestado: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 30
      FieldName = 'estado'
      Required = True
      Size = 70
    end
    object mtbEnderecopais: TStringField
      DisplayLabel = 'Pa'#237's'
      DisplayWidth = 30
      FieldName = 'pais'
      Required = True
      Size = 150
    end
    object mtbEnderecoinfo_cep: TStringField
      FieldName = 'info_cep'
      Visible = False
      Size = 50
    end
  end
  object dtsEndereco: TDataSource
    DataSet = mtbEndereco
    Left = 640
    Top = 72
  end
end
