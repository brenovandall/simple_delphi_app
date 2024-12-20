unit uPessoaFisica;

interface

uses
  FireDAC.Comp.Client;

type

  TPessoaFisica = class
  private
    FId: integer;
    FIdEmpresa: integer;
    FIdRevenda: integer;
    FRg: string;
    FDataNascimento: TDateTime;
    Fgenero: string;
    FCpf: string;
    FNomeCompleto: string;
    FCep: string;
    FNumero: integer;
    FEndereco: string;
    FTelefoneFixo: string;
    FEmail: string;
    FBairro: string;
    FUf: string;
    FMunicipio: string;
    FSituacao: integer;
    FComplemento: string;
    FObservacoes: string;
    FCelular: string;
    FConnection: TFDConnection;
    FQuery: TFDQuery;
    procedure SetId(const Value: integer);
    procedure SetIdEmpresa(const Value: integer);
    procedure SetIdRevenda(const Value: integer);
    procedure SetCpf(const Value: string);
    procedure SetDataNascimento(const Value: TDateTime);
    procedure Setgenero(const Value: string);
    procedure SetNomeCompleto(const Value: string);
    procedure SetRg(const Value: string);
    procedure SetCep(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetNumero(const Value: integer);
    procedure SetBairro(const Value: string);
    procedure SetCelular(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetMunicipio(const Value: string);
    procedure SetObservacoes(const Value: string);
    procedure SetSituacao(const Value: integer);
    procedure SetTelefoneFixo(const Value: string);
    procedure SetUf(const Value: string);
    procedure SetConnection(const Value: TFDConnection);
    procedure SetQuery(const Value: TFDQuery);
  protected
  public
    property Id: integer read FId write SetId;
    property IdEmpresa: integer read FIdEmpresa write SetIdEmpresa;
    property IdRevenda: integer read FIdRevenda write SetIdRevenda;
    property NomeCompleto: string read FNomeCompleto write SetNomeCompleto;
    property Cpf: string read FCpf write SetCpf;
    property Rg: string read FRg write SetRg;
    property DataNascimento: TDateTime read FDataNascimento
      write SetDataNascimento;
    property genero: string read Fgenero write Setgenero;
    property Cep: string read FCep write SetCep;
    property Endereco: string read FEndereco write SetEndereco;
    property Numero: integer read FNumero write SetNumero;
    property Bairro: string read FBairro write SetBairro;
    property Complemento: string read FComplemento write SetComplemento;
    property Municipio: string read FMunicipio write SetMunicipio;
    property Uf: string read FUf write SetUf;
    property TelefoneFixo: string read FTelefoneFixo write SetTelefoneFixo;
    property Celular: string read FCelular write SetCelular;
    property Email: string read FEmail write SetEmail;
    property Observacoes: string read FObservacoes write SetObservacoes;
    property Situacao: integer read FSituacao write SetSituacao;
    property Query: TFDQuery read FQuery write SetQuery;
    property Connection: TFDConnection read FConnection write SetConnection;

    constructor Create(pConnection: TFDConnection);
    destructor Destroy; override;

    function Consultar(searchstring: string): TFDQuery;
    function Inserir: String;
  end;

implementation

uses
  System.Classes, System.SysUtils;

{ TPessoaFisica }

function TPessoaFisica.Consultar(searchstring: string): TFDQuery;
begin
  try
    FQuery.Close;
    FQuery.SQL.Clear;

    FQuery.SQL.Add('SELECT');
    FQuery.SQL.Add('  ID,');
    FQuery.SQL.Add('  ID_EMPRESA AS EMPRESA,');
    FQuery.SQL.Add('  ID_REVENDA AS REVENDA,');
    FQuery.SQL.Add('  NOME_COMPLETO AS "NOME COMPLETO",');
    FQuery.SQL.Add('  CPF,');
    FQuery.SQL.Add('  RG,');
    FQuery.SQL.Add('  DATA_NASCIMENTO AS "DATA DE NASCIMENTO",');
    FQuery.SQL.Add('  GENERO,');
    FQuery.SQL.Add('  CEP,');
    FQuery.SQL.Add('  ENDERECO,');
    FQuery.SQL.Add('  NUMERO,');
    FQuery.SQL.Add('  BAIRRO,');
    FQuery.SQL.Add('  COMPLEMENTO,');
    FQuery.SQL.Add('  MUNICIPIO,');
    FQuery.SQL.Add('  UF,');
    FQuery.SQL.Add('  TELEFONE_FIXO AS "TELEFONE FIXO",');
    FQuery.SQL.Add('  CELULAR,');
    FQuery.SQL.Add('  EMAIL,');
    FQuery.SQL.Add('  OBSERVACOES,');
    FQuery.SQL.Add('  SITUACAO');
    FQuery.SQL.Add('FROM');
    FQuery.SQL.Add('  PESSOA_FISICA');
    if searchstring <> '' then
    begin
      FQuery.SQL.Add('WHERE NOME_COMPLETO LIKE :SearchString ');
      FQuery.ParamByName('SearchString').AsString := '%' + searchstring + '%';
    end;

    FQuery.Open;
  finally
    result := FQuery;
  end;
end;

constructor TPessoaFisica.Create(pConnection: TFDConnection);
begin
  FConnection := pConnection;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection;
end;

destructor TPessoaFisica.Destroy;
begin
  FQuery.Destroy;
  inherited;
end;

function TPessoaFisica.Inserir: String;
var
  command: TFDQuery;
begin
  command := TFDQuery.Create(nil);
  command.Connection := FConnection;
  command.Close;
  command.SQL.Clear;

  try
    try
      command.SQL.Add('INSERT INTO PESSOA_FISICA (');
      command.SQL.Add('ID_EMPRESA, ID_REVENDA, NOME_COMPLETO, CPF,');
      command.SQL.Add('RG, DATA_NASCIMENTO, GENERO, CEP, ENDERECO, NUMERO,');
      command.SQL.Add('BAIRRO, COMPLEMENTO, MUNICIPIO, UF, TELEFONE_FIXO,');
      command.SQL.Add('CELULAR, EMAIL, OBSERVACOES, SITUACAO) VALUES (');
      command.SQL.Add(':ID_EMPRESA, :ID_REVENDA, :NOME_COMPLETO, :CPF');
      command.SQL.Add
        (':RG, :DATA_NASCIMENTO, :GENERO, :CEP, :ENDERECO, :NUMERO');
      command.SQL.Add
        (':BAIRRO, :COMPLEMENTO, :MUNICIPIO, :UF, :TELEFONE_FIXO, :CELULAR');
      command.SQL.Add(':EMAIL, :OBSERVACOES, :SITUACAO');

      command.ParamByName('ID_EMPRESA').AsInteger := FIdEmpresa;
      command.ParamByName('ID_REVENDA').AsInteger := FIdRevenda;
      command.ParamByName('NOME_COMPLETO').AsString := FNomeCompleto;
      command.ParamByName('CPF').AsString := FCpf;
      command.ParamByName('RG').AsString := FRg;
      command.ParamByName('DATA_NASCIMENTO').AsDateTime := FDataNascimento;
      command.ParamByName('GENERO').AsString := Fgenero;
      command.ParamByName('CEP').AsString := FCep;
      command.ParamByName('ENDERECO').AsString := FEndereco;
      command.ParamByName('NUMERO').AsInteger := FNumero;
      command.ParamByName('BAIRRO').AsString := FBairro;
      command.ParamByName('COMPLEMENTO').AsString := FComplemento;
      command.ParamByName('MUNICIPIO').AsString := FMunicipio;
      command.ParamByName('UF').AsString := FUf;
      command.ParamByName('TELEFONE_FIXO').AsString := FTelefoneFixo;
      command.ParamByName('CELULAR').AsString := FCelular;
      command.ParamByName('EMAIL').AsString := FEmail;
      command.ParamByName('OBSERVACOES').AsString := FObservacoes;
      command.ParamByName('SITUACAO').AsInteger := FSituacao;

      command.ExecSQL;

      result := '';
    except
      on E: Exception do
      begin
        result := E.Message;
      end;
    end;
  finally
    command.Destroy;
  end;
end;

procedure TPessoaFisica.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TPessoaFisica.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TPessoaFisica.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TPessoaFisica.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TPessoaFisica.SetConnection(const Value: TFDConnection);
begin
  FConnection := Value;
end;

procedure TPessoaFisica.SetCpf(const Value: string);
begin
  FCpf := Value;
end;

procedure TPessoaFisica.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;

procedure TPessoaFisica.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TPessoaFisica.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TPessoaFisica.Setgenero(const Value: string);
begin
  Fgenero := Value;
end;

procedure TPessoaFisica.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TPessoaFisica.SetIdEmpresa(const Value: integer);
begin
  FIdEmpresa := Value;
end;

procedure TPessoaFisica.SetIdRevenda(const Value: integer);
begin
  FIdRevenda := Value;
end;

procedure TPessoaFisica.SetMunicipio(const Value: string);
begin
  FMunicipio := Value;
end;

procedure TPessoaFisica.SetNomeCompleto(const Value: string);
begin
  FNomeCompleto := Value;
end;

procedure TPessoaFisica.SetNumero(const Value: integer);
begin
  FNumero := Value;
end;

procedure TPessoaFisica.SetObservacoes(const Value: string);
begin
  FObservacoes := Value;
end;

procedure TPessoaFisica.SetQuery(const Value: TFDQuery);
begin
  FQuery := Value;
end;

procedure TPessoaFisica.SetRg(const Value: string);
begin
  FRg := Value;
end;

procedure TPessoaFisica.SetSituacao(const Value: integer);
begin
  FSituacao := Value;
end;

procedure TPessoaFisica.SetTelefoneFixo(const Value: string);
begin
  FTelefoneFixo := Value;
end;

procedure TPessoaFisica.SetUf(const Value: string);
begin
  FUf := Value;
end;

end.
