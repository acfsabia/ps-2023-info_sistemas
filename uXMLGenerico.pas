unit uXMLGenerico;

interface

uses
  System.SysUtils, Data.DB, XML.XMLDoc, XML.XMLIntf;

type
  TXMLGenerico = class
  public
    class function GerarXMLDataSet(pDSMestre, pDSDetalhe: TDataSet;
      const pNoMestre, pNoDetalhe, pNomeArquivo: String): String;
end;

implementation

{ TXMLGenerico }

class function TXMLGenerico.GerarXMLDataSet(pDSMestre, pDSDetalhe: TDataSet;
  const pNoMestre, pNoDetalhe, pNomeArquivo: String): String;
var
  DocXML: TXMLDocument;
  xndMestre, xndDetalhe: IXMLNode;
  oCampo: TField;
  i, regAtual, nCtd: Integer;
  sNomeCampo: String;
begin
  try
    DocXML := TXMLDocument.Create(nil);
    DocXML.Active := True;
    xndMestre := DocXML.AddChild(pNoMestre);
    for i := 0 to pDSMestre.FieldCount - 1 do
    begin
      oCampo := pDSMestre.Fields[i];
      sNomeCampo := oCampo.DisplayLabel;
      if (sNomeCampo = EmptyStr) then
        sNomeCampo := oCampo.FieldName;
      if (oCampo.Visible) then
        xndMestre.AddChild(sNomeCampo).Text := oCampo.AsString;
    end;
    try
      pDSDetalhe.DisableControls();
      regAtual := pDSDetalhe.RecNo;
      nCtd := 0;
      pDSDetalhe.First();
      while (not pDSDetalhe.Eof) do
      begin
        Inc(nCtd);
        xndDetalhe := xndMestre.AddChild(pNoDetalhe);
        xndDetalhe.Attributes['Seq'] := nCtd;
        for i := 0 to pDSDetalhe.FieldCount - 1 do
        begin
          oCampo := pDSDetalhe.Fields[i];
          sNomeCampo := oCampo.DisplayLabel;
          if (sNomeCampo = EmptyStr) then
            sNomeCampo := oCampo.FieldName;
          if (oCampo.Visible) then
            xndDetalhe.AddChild(sNomeCampo).Text := oCampo.AsString;
        end;
        pDSDetalhe.Next();
      end;
    finally
      if (regAtual > 0) and (regAtual <= pDSDetalhe.RecordCount) then
        pDSDetalhe.RecNo := regAtual;
      pDSDetalhe.EnableControls();
    end;
    oCampo := nil;
    DocXML.SaveToFile(pNomeArquivo);
  finally
    DocXML.Free();
  end;
  Result := pNomeArquivo;
end;

end.
