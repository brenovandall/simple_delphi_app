unit frmMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Imaging.jpeg,
  uSystemInfo;

type
  TFormMain = class(TForm)
    pnlPrincipal: TPanel;
    navBar: TMainMenu;
    Cadastro1: TMenuItem;
    Pessoafsica1: TMenuItem;
    Pessoajurdica1: TMenuItem;
    Pessoajurdica2: TMenuItem;
    Panel1: TPanel;
    lblUsuarioLogado: TLabel;
    lblEmpresaRevenda: TLabel;
    lblVersion: TLabel;
    Novooramento1: TMenuItem;
    Suporte1: TMenuItem;
    Usurios1: TMenuItem;
    Permisses1: TMenuItem;
    Nveldeusurio1: TMenuItem;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure Pessoafsica1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  frmConsultaPessoaFisica;

{$R *.dfm}

procedure TFormMain.FormShow(Sender: TObject);
var
  version: string;
begin
  version := '';
  Self.WindowState := TWindowState.wsMaximized;
  version := GetSystemInfoAsString;
  lblVersion.Caption := lblVersion.Caption + version;
end;

procedure TFormMain.Pessoafsica1Click(Sender: TObject);
begin
  FormConsultaPessoaFisica := TFormConsultaPessoaFisica.Create(Self);
  FormConsultaPessoaFisica.Parent := pnlPrincipal;

  FormConsultaPessoaFisica.Show;
end;

end.
