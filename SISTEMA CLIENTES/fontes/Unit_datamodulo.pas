unit Unit_datamodulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    tb_clientes: TFDTable;
    DataSource1: TDataSource;
    tb_clientescli_id: TFDAutoIncField;
    tb_clientescli_nome: TStringField;
    tb_clientescli_endereco: TStringField;
    tb_clientescli_bairro: TStringField;
    tb_clientescli_cidade: TStringField;
    tb_clientescli_uf: TStringField;
    tb_clientescli_rg: TStringField;
    tb_clientescli_cpf: TStringField;
    tb_clientescli_telefone: TStringField;
    tb_clientescli_celular: TStringField;
    tb_clientescli_data_nasc: TDateField;
    tb_clientescli_data_cad: TDateField;
    tb_clientescli_situacao: TStringField;
    tb_clientescli_email: TStringField;
    tb_clientescli_cep: TStringField;
    DS_consulta_clientes: TDataSource;
    Query_consulta_clientes: TFDQuery;
    Query_imprimir_clientes: TFDQuery;
    Query_imprimir_clientescli_id: TFDAutoIncField;
    Query_imprimir_clientescli_nome: TStringField;
    Query_imprimir_clientescli_endereco: TStringField;
    Query_imprimir_clientescli_bairro: TStringField;
    Query_imprimir_clientescli_cidade: TStringField;
    Query_imprimir_clientescli_uf: TStringField;
    Query_imprimir_clientescli_cep: TStringField;
    Query_imprimir_clientescli_rg: TStringField;
    Query_imprimir_clientescli_cpf: TStringField;
    Query_imprimir_clientescli_telefone: TStringField;
    Query_imprimir_clientescli_celular: TStringField;
    Query_imprimir_clientescli_email: TStringField;
    Query_imprimir_clientescli_data_nasc: TDateField;
    Query_imprimir_clientescli_data_cad: TDateField;
    Query_imprimir_clientescli_situacao: TStringField;
    Query_consulta_clientescli_id: TFDAutoIncField;
    Query_consulta_clientescli_nome: TStringField;
    Query_consulta_clientescli_endereco: TStringField;
    Query_consulta_clientescli_bairro: TStringField;
    Query_consulta_clientescli_cidade: TStringField;
    Query_consulta_clientescli_uf: TStringField;
    Query_consulta_clientescli_cep: TStringField;
    Query_consulta_clientescli_rg: TStringField;
    Query_consulta_clientescli_cpf: TStringField;
    Query_consulta_clientescli_telefone: TStringField;
    Query_consulta_clientescli_celular: TStringField;
    Query_consulta_clientescli_email: TStringField;
    Query_consulta_clientescli_data_nasc: TDateField;
    Query_consulta_clientescli_data_cad: TDateField;
    Query_consulta_clientescli_situacao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  fdconnection1.params.database:='sistema';
  fdconnection1.Params.UserName:='root';
  fdconnection1.Params.Password:='';

  fdconnection1.connected:=true;

  FDPhysMySQLDriverLink1.vendorlib:= getcurrentdir + '\libmysql\libmysql.dll';

  tb_clientes.TableName:='clientes';
  tb_clientes.Active:= true;
end;

end.
