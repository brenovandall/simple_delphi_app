program OrcamentosGenerator;

uses
  Vcl.Forms,
  frmLogin in 'APP\frmLogin.pas' {FormLogin},
  frmMain in 'APP\frmMain.pas' {FormMain},
  uSystemInfo in 'INFRASTRUCTURE\uSystemInfo.pas',
  uConnection in 'INFRASTRUCTURE\uConnection.pas' {frmConnection: TDataModule},
  Vcl.Dialogs,
  System.SysUtils {frmConnection: TDataModule},
  frmConsultaPessoaFisica in 'APP\frmConsultaPessoaFisica.pas' {FormConsultaPessoaFisica},
  uPessoaFisica in 'DOMAIN\uPessoaFisica.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  ReportMemoryLeaksOnShutdown := True;

  Application.CreateForm(TfrmConnection, frmConnection);
  if not frmConnection.FDConnection.Connected then
  begin
    ShowMessage
      ('N�o foi poss�vel conectar-se ao banco de dados, tente novamente mais tarde.');
    Application.Terminate;
  end;

  try
    try
      FormLogin := TFormLogin.Create(nil);
      FormLogin.ShowModal;

      Application.CreateForm(TFormMain, FormMain);
    finally
      FormLogin.Hide;
      FormLogin.Free;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro n�o esperado.')
    end;
  end;

  Application.Run;

end.
