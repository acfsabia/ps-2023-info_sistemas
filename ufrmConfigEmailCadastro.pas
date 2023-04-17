unit ufrmConfigEmailCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmConfigEmailCadastro = class(TForm)
    scbGeral: TScrollBox;
    gbxCorpo: TGroupBox;
    pnlCabecalho: TPanel;
    ledtServidor: TLabeledEdit;
    ledtPorta: TLabeledEdit;
    gbxOrigem: TGroupBox;
    ledtRemetenteEmail: TLabeledEdit;
    ledtRemetenteNome: TLabeledEdit;
    ledtRemetenteSenha: TLabeledEdit;
    gbxDestinatario: TGroupBox;
    ledtDestinatarioEmail: TLabeledEdit;
    ledtDestinatarioNome: TLabeledEdit;
    lblMensagem: TLabel;
    memMensagem: TMemo;
    pnlAssunto: TPanel;
    ledtAssunto: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigEmailCadastro: TfrmConfigEmailCadastro;

implementation

{$R *.dfm}

procedure TfrmConfigEmailCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caHide;
end;

procedure TfrmConfigEmailCadastro.FormCreate(Sender: TObject);
begin
  //
end;

end.
