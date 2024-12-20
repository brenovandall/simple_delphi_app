unit frmConsultaPessoaFisica;

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
  Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uConnection, uPessoaFisica;

type
  TFormConsultaPessoaFisica = class(TForm)
    pnlMain: TPanel;
    pnlQuery: TPanel;
    lblBusca: TLabeledEdit;
    btnPesquisar: TSpeedButton;
    query: TPanel;
    queryPessoaFisicaGrid: TDBGrid;
    dsPessoaFisica: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaPessoaFisica: TFormConsultaPessoaFisica;
  PessoaFisica : TPessoaFisica;

implementation

{$R *.dfm}

procedure TFormConsultaPessoaFisica.btnPesquisarClick(Sender: TObject);
begin
  PessoaFisica.Consultar(lblBusca.Text);
end;

procedure TFormConsultaPessoaFisica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PessoaFisica.Destroy;
  FreeAndNil(Self);
end;

procedure TFormConsultaPessoaFisica.FormCreate(Sender: TObject);
begin
  PessoaFisica := TPessoaFisica.Create(frmConnection.FDConnection);
  dsPessoaFisica.DataSet := PessoaFisica.Query;
  PessoaFisica.Consultar('');
end;

procedure TFormConsultaPessoaFisica.FormShow(Sender: TObject);
begin
  lblBusca.SetFocus;
end;

end.
