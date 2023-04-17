unit uEmail;

interface

uses System.Classes;

type
  TEmail = class
  private
    FCaminhosAnexos: TStringList;
    FTipoConteudo: string;
    FCorpoEmail: TStringList;
    FIdEmail: Integer;
    FDataHoraEnvio: TDateTime;
    FDataHoraInclusao: TDateTime;
    FDescErro: string;
    FDestinatarios: TStringList;
    FAssunto: string;
    FUsuarioEmail: string;
    FNomeRemetente: string;
    FRemetente: string;
    FSenhaEmail: string;
    FHost: string;
    FPorta: Integer;
    procedure setAssunto(const Value: string);
    procedure setCaminhosAnexos(const Value: TStringList);
    procedure setCorpoEmail(const Value: TStringList);
    procedure setDataHoraEnvio(const Value: TDateTime);
    procedure setDataHoraInclusao(const Value: TDateTime);
    procedure setDescErro(const Value: string);
    procedure setDestinatarios(const Value: TStringList);
    procedure setIdEmail(const Value: Integer);
    procedure setTipoConteudo(const Value: string);
    procedure SetHost(const Value: string);
    procedure SetNomeRemetente(const Value: string);
    procedure SetPorta(const Value: Integer);
    procedure SetRemetente(const Value: string);
    procedure SetSenhaEmail(const Value: string);
    procedure SetUsuarioEmail(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property IdEmail: Integer read FIdEmail write setIdEmail;
    property Destinatarios: TStringList read FDestinatarios
      write setDestinatarios;
    property Assunto: string read FAssunto write setAssunto;
    property CorpoEmail: TStringList read FCorpoEmail write setCorpoEmail;
    property TipoConteudo: string read FTipoConteudo write setTipoConteudo;
    property CaminhosAnexos: TStringList read FCaminhosAnexos
      write setCaminhosAnexos;
    property DataHoraInclusao: TDateTime read FDataHoraInclusao
      write setDataHoraInclusao;
    property DataHoraEnvio: TDateTime read FDataHoraEnvio
      write setDataHoraEnvio;
    property DescErro: string read FDescErro write setDescErro;
    property Porta: Integer read FPorta write SetPorta;
    property Host: string read FHost write SetHost;
    property UsuarioEmail: string read FUsuarioEmail write SetUsuarioEmail;
    property SenhaEmail: string read FSenhaEmail write SetSenhaEmail;
    property Remetente: string read FRemetente write SetRemetente;
    property NomeRemetente: string read FNomeRemetente write SetNomeRemetente;
  end;

implementation

{ TEmail }

constructor TEmail.Create;
begin
  FIdEmail := 0;
  FDestinatarios := TStringList.Create;
  FAssunto := '';
  FCorpoEmail := TStringList.Create;
  FTipoConteudo := '';
  FCaminhosAnexos := TStringList.Create;
  FDataHoraInclusao := 0;
  FDataHoraEnvio := 0;
  FDescErro := '';
  FPorta := 0;
  FHost := '';
  FUsuarioEmail := '';
  FSenhaEmail := '';
  FRemetente := '';
  FNomeRemetente := '';
end;

destructor TEmail.Destroy;
begin
  FDestinatarios.Free;
  FCorpoEmail.Free;
  FCaminhosAnexos.Free;
  inherited;
end;

procedure TEmail.setAssunto(const Value: string);
begin
  FAssunto := Value;
end;

procedure TEmail.setCaminhosAnexos(const Value: TStringList);
begin
  FCaminhosAnexos := Value;
end;

procedure TEmail.setCorpoEmail(const Value: TStringList);
begin
  FCorpoEmail := Value;
end;

procedure TEmail.setDataHoraEnvio(const Value: TDateTime);
begin
  FDataHoraEnvio := Value;
end;

procedure TEmail.setDataHoraInclusao(const Value: TDateTime);
begin
  FDataHoraInclusao := Value;
end;

procedure TEmail.setDescErro(const Value: string);
begin
  FDescErro := Value;
end;

procedure TEmail.setDestinatarios(const Value: TStringList);
begin
  FDestinatarios := Value;
end;

procedure TEmail.SetHost(const Value: string);
begin
  FHost := Value;
end;

procedure TEmail.setIdEmail(const Value: Integer);
begin
  FIdEmail := Value;
end;

procedure TEmail.SetNomeRemetente(const Value: string);
begin
  FNomeRemetente := Value;
end;

procedure TEmail.SetPorta(const Value: Integer);
begin
  FPorta := Value;
end;

procedure TEmail.SetRemetente(const Value: string);
begin
  FRemetente := Value;
end;

procedure TEmail.SetSenhaEmail(const Value: string);
begin
  FSenhaEmail := Value;
end;

procedure TEmail.setTipoConteudo(const Value: string);
begin
  FTipoConteudo := Value;
end;

procedure TEmail.SetUsuarioEmail(const Value: string);
begin
  FUsuarioEmail := Value;
end;

end.
