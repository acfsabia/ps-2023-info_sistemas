unit uUtils;

interface

uses
  System.SysUtils, Data.DB, System.Variants, System.RegularExpressions;

const
  _CRLF: String = #13#10;
  _REGEX_CPF: String = '([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})';
  _REGEX_CNPJ: String = '([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})';
  _REGEX_TELEFONE: String =
    //'([(]?[0-9]{2}[)]?[ ]?[0-9]{4}[0-9]?[-]?[0-9]{4})' +
    '([0-9]{5}[-]?[0-9]{4})' +
    '|([0-9]{4}[-]?[0-9]{4})';
  _REGEX_EMAIL: String = '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]*[a-zA-Z0-9]+$';
  _REGEX_CEP: String = '([0-9]{5}[-]?[0-9]{3})';

type
  TFieldHelper = class helper for TField
  public
    function IsEmpty(): Boolean;
    function IfEmpty(const pValor: Variant): Variant;
end;


{Métodos avulsos - Iterface}

function ValorVazio(const pValor: Variant): Boolean;
function NuloSeVazio(pValor: Variant): Variant;
function ValidarCPF_CNPJ(const pDocumento: String): Boolean;
function ValidarTelefone(const pTelefone: String): Boolean;
function ValidarEmail(const pEmail: String): Boolean;
function ValidarCEP(const pCEP: String): Boolean;

implementation

{ TFieldHelper }

function TFieldHelper.IsEmpty(): Boolean;
begin
  Result := ValorVazio(Value);
end;

function TFieldHelper.IfEmpty(const pValor: Variant): Variant;
begin
  if IsEmpty() then
    Result := pValor
  else
    Result := Value;
end;


{Métodos avulsos - Implementation}

function ValorVazio(const pValor: Variant): Boolean;
begin
  Result := VarIsNull(pValor) or VarIsEmpty(pValor) or VarIsClear(pValor)
    or (VarIsNumeric(pValor) and (pValor = 0))
    or (VarIsType(pValor, varDate) and (pValor = 0))
    or (VarIsStr(pValor) and (pValor = ''));
end;

function NuloSeVazio(pValor: Variant): Variant;
begin
  if ValorVazio(pValor) then
    pValor := Null;
  Result := pValor;
end;

function ValidarCPF_CNPJ(const pDocumento: String): Boolean;
begin
  //Pendente: Criar algorítmo de validação de CPF/CNPJ.
  Result := ValorVazio(pDocumento)
    or TRegEx.IsMatch(pDocumento, _REGEX_CPF+'|'+_REGEX_CNPJ);
end;

function ValidarTelefone(const pTelefone: String): Boolean;
begin
  //Validação de telefones brasileiros
  Result := ValorVazio(pTelefone) or TRegEx.IsMatch(pTelefone, _REGEX_TELEFONE);
end;

function ValidarEmail(const pEmail: String): Boolean;
begin
  //Importante! A validação de e-mails não é 100% garantida.
  Result := ValorVazio(pEmail) or TRegEx.IsMatch(pEmail, _REGEX_EMAIL);
end;

function ValidarCEP(const pCEP: String): Boolean;
begin
  Result := ValorVazio(pCEP) or TRegEx.IsMatch(pCEP, _REGEX_CEP);
end;

end.
