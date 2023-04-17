unit uViaCep;

interface

uses System.SysUtils, System.JSON, REST.Types, Rest.Client, Rest.Json;

type
  TViaCep = class
  private
    FCep: String;
    FLogradouro: String;
    //FNumero: String;
    FComplemento: String;
    FInfoComplementar: String;
    FBairro: String;
    FLocalidade: String;
    FUf: String;
    FPais: String;
    procedure SetCep(const Value: String);
    procedure SetLogradouro(const Value: String);
    //procedure SetNumero(const Value: String);
    procedure SetComplemento(const Value: String);
    //procedure SetInfoComplementar(const Value: String);
    procedure SetBairro(const Value: String);
    procedure SetLocalidade(const Value: String);
    procedure SetUF(const Value: String);
    procedure SetPais(const Value: String);
  public
    const URL_BASE_CEP = 'https://viacep.com.br/ws/';
    constructor Create;
    destructor Destroy; override;
    property Cep: String read FCep write SetCep;
    property Logradouro: String read FLogradouro write SetLogradouro;
    //property Numero: String read FNumero write SetNumero;
    property Complemento: String read FComplemento write SetComplemento;
    property InfoComplementar: String read FComplemento;
    property Bairro: String read FBairro write SetBairro;
    property Localidade: String read Flocalidade write SetLocalidade;
    property Uf: String read FUf write SetUF;
    property Pais: String read FPais write SetPais;
    function getCep(pCEP:String): TJSONObject;
    class function ValidarNumeroEndereco(const pNumero: String;
      const pInfoComplementar: String; var pMsgRetorno: String): Boolean;
  end;

implementation

{ TViaCep }

uses uUtils, System.StrUtils, System.RegularExpressions;

constructor TViaCep.Create;
begin
   FCep         := '';
   FLogradouro  := '';
   //FNumero    := '';
   FComplemento := '';
   FBairro      := '';
   FLocalidade  := '';
   FUf          := '';
   FPais        := '';
end;

destructor TViaCep.Destroy;
begin
  inherited;
end;

function TViaCep.getCep(pCEP: String): TJSONObject;
var
  rCliente: TRESTClient;
  rRequisicao: TRESTRequest;
  rResposta: TRESTResponse;
begin
  rCliente    := TRESTClient.Create(nil);
  rRequisicao := TRESTRequest.Create(nil);
  rResposta   := TRESTResponse.Create(nil);
  try
    rCliente.BaseURL           := URL_BASE_CEP;
    rRequisicao.Client         := rCliente;
    rRequisicao.Response       := rResposta;
    rRequisicao.Resource       := '{CEP}';
    rRequisicao.ResourceSuffix := 'json';
    rRequisicao.Method         := rmGet;
    rRequisicao.Params.AddUrlSegment('CEP', pCEP);
    rRequisicao.Execute;
    //Result := (TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(
    //  Utf8ToString(RawByteString(rResposta.JSONText))), 0) as TJSONObject);
    Result := (TJSONObject.ParseJSONValue(rResposta.JSONText) as TJSONObject);
  finally
    rRequisicao.Free;
    rResposta.Free;
    rCliente.Free;
  end;
end;

procedure TViaCep.SetCep(const Value: String);
var
  oEndereco: TViaCep;
begin
  FCep := Value;
  try
    if (ValidarCEP(Value)) then
      oEndereco := TJSON.JsonToObject<TViaCep>(getCep(FCep));
    if not Assigned(oEndereco) then
      raise Exception.Create('CEP inválido ou não encontrado.');
    //
    FLogradouro  := oEndereco.Logradouro;
    //Não é complemento do endereço, mas informação adicional do CEP.
    FComplemento := oEndereco.Complemento;
    FBairro      := oEndereco.Bairro;
    FLocalidade  := oEndereco.Localidade;
    FUf          := oEndereco.Uf;
    //A documentação não tem atributo para país, no entanto,
    //a pesquisa só ocorre com CEPs brasileiros.
    FPais        := 'Brasil';
  finally
    FreeAndNil(oEndereco);
  end;
end;

procedure TViaCep.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

//procedure TViaCep.SetNumero(const Value: String);
//begin
//  FNumero := Value;
//end;

procedure TViaCep.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TViaCep.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TViaCep.SetLocalidade(const Value: String);
begin
  Flocalidade := Value;
end;

procedure TViaCep.SetUF(const Value: String);
begin
  FUf := Value;
end;

class function TViaCep.ValidarNumeroEndereco(const pNumero: String;
  const pInfoComplementar: String; var pMsgRetorno: String): Boolean;
var
  sMsg, sNumero, sMenorNum, sMaiorNum: String;
  bNumeroValido: Boolean;
begin
  bNumeroValido := True;
  sNumero := TRegEx.Replace(pNumero, '[^0-9]', '');
  sMenorNum := '1';
  sMaiorNum := '';
  sMsg := '';
  //Exemplos de informações complementares [30130-00?]:
  //  - "até 653 - lado ímpar"
  //  - "até 654 - lado par"
  //  - "de 655 a 1535 - lado ímpar"
  //  - "de 656 a 1350 - lado par"
  //  - "de 3281 ao fim - lado ímpar"
  //  - "de 3202 ao fim - lado par"
  if (ContainsText(pInfoComplementar, 'lado ímpar')) then
  begin
    if (StrToInt64Def(sNumero, 0) = 0) or (StrToInt64Def(sNumero, 0) mod 2 <> 1) then
      sMsg := sMsg + _CRLF +
        '- O número deve ser ímpar.';
  end
  else if (ContainsText(pInfoComplementar, 'lado par')) then
  begin
    sMenorNum := '2';
    if (StrToInt64Def(sNumero, 0) = 0) or (StrToInt64Def(sNumero, 0) mod 2 <> 0) then
      sMsg := sMsg + _CRLF +
        '- O número deve ser par.';
  end;
  if (ContainsText(pInfoComplementar, 'de '))
    or (ContainsText(pInfoComplementar, 'até '))
    or (ContainsText(pInfoComplementar, 'a '))
    or (ContainsText(pInfoComplementar, 'ao fim ')) then
  begin
    //Recupera a faixa de valores
    if (StartsText('até', pInfoComplementar)) then
    begin
      sMaiorNum := SplitString(pInfoComplementar, ' ')[1];
    end;
    if (StartsText('de', pInfoComplementar)) then
    begin
      sMenorNum := SplitString(pInfoComplementar, ' ')[1];
      sMaiorNum := SplitString(pInfoComplementar, ' ')[3];
    end;
    if (ContainsText(sMaiorNum, 'fim')) then
      sMaiorNum := '';
    //Valida o número conforme faixa de valores
    if (StrToInt64Def(sMenorNum, 0) > StrToInt64Def(sNumero, 0)) then
      sMsg := sMsg + _CRLF +
        Format('- O número deve ser maior que [%s].', [sMenorNum]);
    if (StrToInt64Def(sMaiorNum, 0) > 0) and (StrToInt64Def(sMaiorNum, 0) < StrToInt64Def(sNumero, 0)) then
      sMsg := sMsg + _CRLF +
        Format('- O número deve ser menor que [%s].', [sMaiorNum]);
  end ;
  if (sMsg <> EmptyStr) then
  begin
    pMsgRetorno := pMsgRetorno + IfThen(pMsgRetorno = EmptyStr, '', _CRLF) +
      'O número está incoerente com o esperado para o CEP informado.' +
      sMsg;
    bNumeroValido := False;
  end;
  Result := bNumeroValido;
end;

procedure TViaCep.SetPais(const Value: String);
begin
  FPais := Value;
end;

end.
