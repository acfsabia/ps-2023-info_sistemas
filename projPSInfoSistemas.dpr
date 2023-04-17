program projPSInfoSistemas;

uses
  Vcl.Forms,
  ufrmCadastroCliente in 'ufrmCadastroCliente.pas' {frmCadastroCliente},
  uUtils in 'uUtils.pas',
  uViaCep in 'uViaCep.pas',
  uXMLGenerico in 'uXMLGenerico.pas',
  ufrmConfigEmailCadastro in 'ufrmConfigEmailCadastro.pas' {frmConfigEmailCadastro},
  uEmail in 'uEmail.pas',
  uEnvioEmail in 'uEnvioEmail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Alessandro Fortunato - PS - Info Sistemas';
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.CreateForm(TfrmConfigEmailCadastro, frmConfigEmailCadastro);
  Application.Run;
end.
