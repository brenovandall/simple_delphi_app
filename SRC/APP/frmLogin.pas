unit frmLogin;

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
  Vcl.Skia,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.Imaging.pngimage,
  Vcl.Buttons;

type
  TFormLogin = class(TForm)
    lblEditUsuario: TLabeledEdit;
    lblEditSenha: TLabeledEdit;
    Panel1: TPanel;
    imagemLogo: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    btnEntrar: TSpeedButton;
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

procedure TFormLogin.btnEntrarClick(Sender: TObject);
begin
  Close;
end;

end.
