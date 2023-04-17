object frmConfigEmailCadastro: TfrmConfigEmailCadastro
  Left = 0
  Top = 0
  Caption = 'frmConfigEmailCadastro'
  ClientHeight = 310
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object scbGeral: TScrollBox
    Left = 0
    Top = 0
    Width = 768
    Height = 310
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    ExplicitWidth = 758
    ExplicitHeight = 379
    object gbxCorpo: TGroupBox
      Left = 417
      Top = 0
      Width = 351
      Height = 310
      Align = alRight
      Caption = 'Corpo do e-mail'
      TabOrder = 1
      ExplicitHeight = 362
      object lblMensagem: TLabel
        Left = 2
        Top = 57
        Width = 347
        Height = 13
        Align = alTop
        Caption = 'Mensagem'
        FocusControl = memMensagem
        ExplicitLeft = 16
        ExplicitTop = 80
        ExplicitWidth = 51
      end
      object memMensagem: TMemo
        Left = 2
        Top = 70
        Width = 347
        Height = 238
        Align = alClient
        Lines.Strings = (
          'memMensagem')
        ScrollBars = ssBoth
        TabOrder = 1
        ExplicitHeight = 307
      end
      object pnlAssunto: TPanel
        Left = 2
        Top = 15
        Width = 347
        Height = 42
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object ledtAssunto: TLabeledEdit
          Left = 4
          Top = 17
          Width = 317
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = 'Assunto do e-mail'
          TabOrder = 0
        end
      end
    end
    object pnlCabecalho: TPanel
      Left = 0
      Top = 0
      Width = 411
      Height = 310
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitHeight = 362
      object ledtServidor: TLabeledEdit
        Left = 8
        Top = 17
        Width = 121
        Height = 21
        EditLabel.Width = 86
        EditLabel.Height = 13
        EditLabel.Caption = 'Servidor de e-mail'
        TabOrder = 0
      end
      object ledtPorta: TLabeledEdit
        Left = 152
        Top = 17
        Width = 49
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'Porta'
        TabOrder = 1
      end
      object gbxOrigem: TGroupBox
        Left = 8
        Top = 65
        Width = 393
        Height = 113
        Caption = 'Origem (remetente)'
        TabOrder = 2
        object ledtRemetenteEmail: TLabeledEdit
          Left = 11
          Top = 41
          Width = 222
          Height = 21
          EditLabel.Width = 96
          EditLabel.Height = 13
          EditLabel.Caption = 'E-mail do remetente'
          TabOrder = 0
        end
        object ledtRemetenteNome: TLabeledEdit
          Left = 11
          Top = 81
          Width = 371
          Height = 21
          EditLabel.Width = 95
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome do remetente'
          TabOrder = 1
        end
        object ledtRemetenteSenha: TLabeledEdit
          Left = 261
          Top = 41
          Width = 121
          Height = 21
          EditLabel.Width = 98
          EditLabel.Height = 13
          EditLabel.Caption = 'Senha do remetente'
          TabOrder = 2
        end
      end
      object gbxDestinatario: TGroupBox
        Left = 8
        Top = 193
        Width = 393
        Height = 113
        Caption = 'Destinat'#225'rio'
        TabOrder = 3
        object ledtDestinatarioEmail: TLabeledEdit
          Left = 11
          Top = 41
          Width = 371
          Height = 21
          EditLabel.Width = 96
          EditLabel.Height = 13
          EditLabel.Caption = 'E-mail do remetente'
          TabOrder = 0
        end
        object ledtDestinatarioNome: TLabeledEdit
          Left = 11
          Top = 81
          Width = 371
          Height = 21
          EditLabel.Width = 95
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome do remetente'
          TabOrder = 1
        end
      end
    end
  end
end
