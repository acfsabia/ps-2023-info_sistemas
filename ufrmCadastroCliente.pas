unit ufrmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.StrUtils, System.JSON, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.ComCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons;

type
  TfrmCadastroCliente = class(TForm)
    mtbCliente: TFDMemTable;
    mtbClienteid_cliente: TAutoIncField;
    mtbClientecpf_cnpj: TStringField;
    mtbClientedocumento_rg: TStringField;
    mtbClientenome: TStringField;
    mtbClientetelefone: TStringField;
    mtbClienteemail: TStringField;
    dtsCliente: TDataSource;
    mtbEndereco: TFDMemTable;
    mtbEnderecoid_endereco: TAutoIncField;
    dtsEndereco: TDataSource;
    mtbEnderecoid_cliente: TIntegerField;
    mtbEnderecocep: TStringField;
    mtbEnderecologradouro: TStringField;
    mtbEndereconumero: TStringField;
    mtbEnderecocomplemento: TStringField;
    mtbEnderecobairro: TStringField;
    mtbEnderecocidade: TStringField;
    mtbEnderecoestado: TStringField;
    mtbEnderecopais: TStringField;
    pgcCliente: TPageControl;
    tbsClienteCadastro: TTabSheet;
    navCliente: TDBNavigator;
    pgcEndereco: TPageControl;
    tbsEnderecoCadastro: TTabSheet;
    grdCliente: TDBGrid;
    pnlCliente: TPanel;
    navEndereco: TDBNavigator;
    grdEndereco: TDBGrid;
    pnlEndereco: TPanel;
    scbCliente: TScrollBox;
    scbEndereco: TScrollBox;
    lblCpfCnpj: TLabel;
    edtCpfCnpj: TDBEdit;
    lblDocumento: TLabel;
    edtDocumento: TDBEdit;
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    lblEMail: TLabel;
    edtEMail: TDBEdit;
    splEndereco: TSplitter;
    lblCep: TLabel;
    edtCep: TDBEdit;
    lblLogradouro: TLabel;
    edtLogradouro: TDBEdit;
    lblNumero: TLabel;
    edtNumero: TDBEdit;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lblCidade: TLabel;
    edtCidade: TDBEdit;
    lblEstado: TLabel;
    edtEstado: TDBEdit;
    lblPais: TLabel;
    edtPais: TDBEdit;
    btnAtualizarCep: TButton;
    mtbEnderecoinfo_cep: TStringField;
    pnlCtrlEmail: TPanel;
    btnEnviarEmail: TButton;
    btnConfigEmail: TButton;
    procedure FormCreate(Sender: TObject);
    procedure mtbClienteBeforePost(DataSet: TDataSet);
    procedure mtbClienteAfterPost(DataSet: TDataSet);
    procedure mtbEnderecoBeforeInsert(DataSet: TDataSet);
    procedure mtbEnderecoAfterPost(DataSet: TDataSet);
    procedure mtbEnderecoBeforePost(DataSet: TDataSet);
    procedure btnAtualizarCepClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCepExit(Sender: TObject);
    procedure mtbEnderecoAfterScroll(DataSet: TDataSet);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure btnConfigEmailClick(Sender: TObject);
  private
    { Private declarations }
    {function DefinirFocoCampo(pField: TField): Boolean;}
    procedure AtualizarInfoComplementarCep();
    procedure HabilitarCamposEndereco();
    procedure EnviarEmail();
    function ValidarCamposObrigatorios(pDataSet: TDataSet;
      const pExibirMsg: Boolean; var pMsgRetorno: String;
      var pFocoDefinido: Boolean): Boolean;
    function ValidarDadosCliente(): Boolean;
    function ValidarDadosEndereco(): Boolean;
    function AtualizarEnderecoCEP(Sender: TObject): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

uses uUtils, uViaCep, ufrmConfigEmailCadastro, uEmail, uEnvioEmail,
  uXMLGenerico;

procedure TfrmCadastroCliente.AtualizarInfoComplementarCep;
var
  sMsg: String;
begin
  sMsg := mtbEndereco.FieldByName('info_cep').AsString;
  if (sMsg <> EmptyStr) then
  begin
    sMsg := 'Informações complementares sobre o CEP:' + _CRLF + sMsg;
  end;
  edtNumero.Hint := sMsg;
  HabilitarCamposEndereco();
end;

procedure TfrmCadastroCliente.btnAtualizarCepClick(Sender: TObject);
begin
  AtualizarEnderecoCEP(Sender);
end;

procedure TfrmCadastroCliente.btnConfigEmailClick(Sender: TObject);
begin
  frmConfigEmailCadastro.ShowModal();
end;

procedure TfrmCadastroCliente.btnEnviarEmailClick(Sender: TObject);
begin
  EnviarEmail();
end;

procedure TfrmCadastroCliente.edtCepExit(Sender: TObject);
begin
  if (mtbEndereco.FieldByName('cep').OldValue <> mtbEndereco.FieldByName('cep').NewValue)
    or (mtbEndereco.FieldByName('cep').IsEmpty) then
  begin
    AtualizarEnderecoCEP(Sender);
  end;
end;

procedure TfrmCadastroCliente.EnviarEmail;
var
  oEmail: TEmail;
begin
  //Pendente!
  Application.MessageBox(
    'Envio de e-mail não disponível ainda, infelizmente.',
    'Atenção!', MB_ICONWARNING + MB_OK);
  Exit;

  if mtbCliente.IsEmpty then
  begin
    Application.MessageBox('É necessário selecionar um cliente para envio de e-mail.',
      'Atenção!', MB_ICONWARNING + MB_OK);
    Exit;
  end;
  //if not MessageDlg('Enviar e-mail com os dados cadastrais do cliente?',
  //  mtConfirmation,[mbYes,mbNo],0) = mrYes then
  //   Exit;

  oEmail := TEmail.Create;
  try
    oEmail.Host          := frmConfigEmailCadastro.ledtServidor.Text;
    oEmail.Porta         := StrToIntDef(frmConfigEmailCadastro.ledtPorta.Text, 0);
    oEmail.UsuarioEmail  := frmConfigEmailCadastro.ledtRemetenteEmail.Text;
    oEmail.SenhaEmail    := frmConfigEmailCadastro.ledtRemetenteSenha.Text;
    oEmail.Remetente     := frmConfigEmailCadastro.ledtRemetenteEmail.Text;
    oEmail.NomeRemetente := frmConfigEmailCadastro.ledtRemetenteNome.Text;
    oEmail.Destinatarios.Add(frmConfigEmailCadastro.ledtDestinatarioEmail.Text);
    oEmail.Assunto       := frmConfigEmailCadastro.ledtAssunto.Text + ' Cliente: ' + mtbCliente.FieldByName('nome').AsString;
    oEmail.TipoConteudo  := 'text/plain; charset=iso-8859-1';
    oEmail.CorpoEmail.Add(//frmConfigEmailCadastro.memMensagem.Lines;
      'Dados do cliente: ' + mtbCliente.FieldByName('nome').AsString + ' no XML em anexo.');
    oEmail.CaminhosAnexos.Add(TXMLGenerico.GerarXMLDataSet(
     mtbCliente, mtbEndereco, 'Cliente', 'Endereços',
     ExtractFilePath(Application.ExeName) +
     '\Cliente_' + mtbCliente.FieldByName('nome').AsString + '.xml'));
    TEnvioEmail.EnviarEmail(oEmail);
  finally
    oEmail.Free;
  end;
end;

procedure TfrmCadastroCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mtbEndereco.Close();
  mtbCliente.Close();
  Action := TCloseAction.caFree;
end;

procedure TfrmCadastroCliente.FormCreate(Sender: TObject);
begin
  //Configurações de e-mail:
  //  - Permitir parametrizar dados gerais de e-mail;
  //    - Origem;
  //    - Destino, cópia, cópia oculta;
  //    - Assunto;
  //    - Corpo do e-mail;
  //  - Utilizar variáveis especiais, com campos do cadastro do
  //  cliente para que possam ser utilizados no corpo do e-mal,
  //  bem como nome no assunto e e-mail na cópia;

  //Pendente:
  //  - Validar DV de CPF/CNPJ;
  //  - Melhorar expressão regular para:
  //    - Telefone;
  //    - E-mail;
  //  - Definir tipo de endereço, permitindo a melhor classificação
  //  dos diversos endereços do cliente.
  mtbCliente.Open();
  mtbEndereco.Open();
end;

procedure TfrmCadastroCliente.HabilitarCamposEndereco;
begin
  edtLogradouro.Enabled := (edtCep.Tag = 0);
  edtBairro.Enabled := (edtCep.Tag = 0);
  edtCidade.Enabled := (edtCep.Tag = 0);
  edtEstado.Enabled := (edtCep.Tag = 0);
  edtPais.Enabled := (edtCep.Tag = 0);
end;

procedure TfrmCadastroCliente.mtbClienteAfterPost(DataSet: TDataSet);
begin
  //
end;

procedure TfrmCadastroCliente.mtbClienteBeforePost(DataSet: TDataSet);
begin
  if (not ValidarDadosCliente()) then
  begin
    Abort();
  end;
end;

procedure TfrmCadastroCliente.mtbEnderecoAfterPost(DataSet: TDataSet);
begin
  //
end;

procedure TfrmCadastroCliente.mtbEnderecoAfterScroll(DataSet: TDataSet);
begin
  AtualizarInfoComplementarCep();
end;

procedure TfrmCadastroCliente.mtbEnderecoBeforeInsert(DataSet: TDataSet);
begin
  if (mtbCliente.RecNo <= 0) or (mtbCliente.State in dsEditModes) then
  begin
    Application.MessageBox(PChar(
      'É necessário selecionar um cliente para cadastrar endereço para o mesmo.' + _CRLF +
      'E o registro do cliente não pode estar em edição.'),
      'Atenção!', MB_ICONWARNING + MB_OK);
    Abort();
  end;
end;

procedure TfrmCadastroCliente.mtbEnderecoBeforePost(DataSet: TDataSet);
begin
  if (not ValidarDadosEndereco()) then
  begin
    Abort();
  end;
end;

function TfrmCadastroCliente.AtualizarEnderecoCEP(Sender: TObject): Boolean;
var
  bRetorno: Boolean;
  sPais, sCEP, sCaptionCEP: String;

  //Obtém dados de endereço, a partir do CEP, pelo ViaCEP.
  procedure ObterEnderecoViaCep(pCEP: String);
  var
    oViaCep : TViaCep;
  begin
    oViaCep := TViaCep.Create();
    try
      oViaCep.Cep := pCEP;
      //
      mtbEndereco.FieldByName('cep').AsString         := oViaCep.Cep;
      mtbEndereco.FieldByName('logradouro').AsString  := oViaCep.Logradouro;
      mtbEndereco.FieldByName('info_cep').AsString    := oViaCep.InfoComplementar;
      mtbEndereco.FieldByName('bairro').AsString      := oViaCep.Bairro;
      mtbEndereco.FieldByName('cidade').AsString      := oViaCep.Localidade;
      mtbEndereco.FieldByName('estado').AsString      := oViaCep.Uf;
      mtbEndereco.FieldByName('pais').AsString        := oViaCep.Pais;
    finally
      oViaCep.Free();
    end;
  end;

begin
  bRetorno := False;
  edtCep.Tag := 0;
  sCaptionCEP := lblCEP.Caption;
  sPais := mtbEndereco.FieldByName('pais').AsString;
  //sUF := mtbEndereco.FieldByName('estado').AsString;
  sCEP := mtbEndereco.FieldByName('cep').AsString;
  if (sCEP = EmptyStr) and (Sender <> nil) and (Sender.ClassType <> TDBEdit) then
  begin
    Application.MessageBox(
      'Informe um CEP válido para atualização automática do endereço.',
      'Informação!', MB_ICONINFORMATION + MB_OK);
  end
  else if (sCEP = EmptyStr) then
  begin
    //Ao limpar o campo de CEP, será permitido informar
    //todos os campos deo endereço livremente.
  end
  else if (not MatchText(sPais, ['', 'BRA', 'Brasil', 'Brazil'])) then
  begin
    Application.MessageBox(PChar(
      'A pesquisa de código de endereçamento postal só funciona para endereços brasileiros.' + _CRLF +
      'Limpe o campo referente ao país, ou defina-o como "Brasil", para pesquisar um CEP brasileiro.'),
      'Informação!', MB_ICONINFORMATION + MB_OK);
  end
  else if (not ValidarCEP(sCEP)) then
  begin
    Application.MessageBox(
      'CEP inválido para pesquisa.',
      'Informação!', MB_ICONINFORMATION + MB_OK);
  end
  else
  begin
    lblCEP.Caption := sCaptionCEP + ' [Pesquisando...]';
    Application.ProcessMessages();
    mtbEndereco.DisableControls();
    try
      ObterEnderecoViaCep(sCEP);
      mtbEndereco.FieldByName('complemento').Clear();
      mtbEndereco.FieldByName('numero').Clear();
      mtbEndereco.FieldByName('numero').FocusControl();
    finally
      lblCEP.Caption := sCaptionCEP;
      mtbEndereco.EnableControls();
    end;
    edtCep.Tag := 1;
    bRetorno := True;
  end;
  AtualizarInfoComplementarCep();
  Result := bRetorno;
end;

function TfrmCadastroCliente.ValidarCamposObrigatorios(pDataSet: TDataSet;
  const pExibirMsg: Boolean; var pMsgRetorno: String; var pFocoDefinido: Boolean):
  Boolean;
var
  i: Integer;
begin
  pFocoDefinido := False;
  for i := 0 to pDataSet.FieldCount -1 do
  begin
    if (pDataSet.Fields[i].Required) and (pDataSet.Fields[i].Visible)
      and (pDataSet.Fields[i].IsEmpty) then
    begin
      //pFocoDefinido := pFocoDefinido or DefinirFocoCampo(pDataSet.Fields[i]);
      if (not pFocoDefinido) then
      begin
        pDataSet.Fields[i].FocusControl();
        pFocoDefinido := True;
      end;
      pMsgRetorno := pMsgRetorno + _CRLF +
        '  - ' + pDataSet.Fields[i].DisplayLabel;
    end;
  end;
  if (pMsgRetorno <> EmptyStr) then
  begin
    pMsgRetorno := 'Campos obrigatórios não informados.' + pMsgRetorno;
    if (pExibirMsg) then
      Application.MessageBox(PChar(pMsgRetorno),
        'Atenção!', MB_ICONWARNING + MB_OK);
      //MessageDlg(pMsgRetorno, mtWarning, [mbOK], 0, mbOK);
  end;
  Result := pMsgRetorno = EmptyStr;
end;

function TfrmCadastroCliente.ValidarDadosCliente(): Boolean;
var
  bDadosValidos, bFocoDefinido: Boolean;
  sMsgRetorno: String;
begin
  bDadosValidos := False;
  bFocoDefinido := False;
  sMsgRetorno := '';
  //Valida campos obrigatórios.
  bDadosValidos := bDadosValidos
    or ValidarCamposObrigatorios(mtbCliente, False, sMsgRetorno, bFocoDefinido);
  {----------------------------------------------------------------------------}
  //Validação especial de campos específicos.
  {----------------------------------------------------------------------------}
  if (not ValidarCPF_CNPJ(mtbCliente.FieldByName('cpf_cnpj').AsString)) then
  begin
    //CPF/CNPJ - Validação impeditiva.
    bDadosValidos := False;
    if (not bFocoDefinido) then
    begin
      mtbCliente.FieldByName('cpf_cnpj').FocusControl();
      bFocoDefinido := True;
    end;
    sMsgRetorno := sMsgRetorno + _CRLF + _CRLF +
      'CPF/CNPJ inválido.';
  end;
  if (not ValidarTelefone(mtbCliente.FieldByName('telefone').AsString)) then
  begin
    //Telefone - Validação não será impeditiva.
    sMsgRetorno := sMsgRetorno + _CRLF + _CRLF +
      'Telefone parece inválido.';
  end;
  if (not ValidarEmail(mtbCliente.FieldByName('email').AsString)) then
  begin
    //E-mail - Validação não será impeditiva.
    sMsgRetorno := sMsgRetorno + _CRLF + _CRLF +
      'E-mail parece inválido.';
  end;
  //
  if (sMsgRetorno <> EmptyStr) then
    Application.MessageBox(PChar(sMsgRetorno),
      'Atenção!', MB_ICONWARNING + MB_OK);
  Result := bDadosValidos;
end;

function TfrmCadastroCliente.ValidarDadosEndereco: Boolean;
var
  bDadosValidos, bFocoDefinido: Boolean;
  sMsgRetorno: String;
  oViaCep : TViaCep;
begin
  bDadosValidos := False;
  bFocoDefinido := False;
  sMsgRetorno := '';
  //Valida campos obrigatórios.
  bDadosValidos := bDadosValidos
    or ValidarCamposObrigatorios(mtbEndereco, False, sMsgRetorno, bFocoDefinido);
  {----------------------------------------------------------------------------}
  //Validação especial de campos específicos.
  {----------------------------------------------------------------------------}
  if (not ValidarCEP(mtbEndereco.FieldByName('cep').AsString)) then
  begin
    //CEP - Validação impeditiva.
    bDadosValidos := False;
    if (not bFocoDefinido) then
    begin
      mtbEndereco.FieldByName('cep').FocusControl();
      bFocoDefinido := True;
    end;
    sMsgRetorno := sMsgRetorno + _CRLF + _CRLF +
      'CEP inválido.';
  end;
  if (bDadosValidos) then
  begin
    oViaCep := TViaCep.Create();
    try
      bDadosValidos := oViaCep.ValidarNumeroEndereco(
        mtbEndereco.FieldByName('numero').AsString,
        mtbEndereco.FieldByName('info_cep').AsString,
        sMsgRetorno);
    finally
      oViaCep.Free();
    end;
    if (not bDadosValidos) and (not bFocoDefinido) then
    begin
      mtbEndereco.FieldByName('numero').FocusControl();
      bFocoDefinido := True;
      //Não será impedidtivo
      bDadosValidos := True;
    end;
  end;
  //
  if (sMsgRetorno <> EmptyStr) then
    Application.MessageBox(PChar(sMsgRetorno),
      'Atenção!', MB_ICONWARNING + MB_OK);
  Result := bDadosValidos;
end;

end.
