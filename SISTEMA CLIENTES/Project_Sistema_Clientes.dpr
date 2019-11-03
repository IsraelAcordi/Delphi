program Project_Sistema_Clientes;

uses
  Vcl.Forms,
  Unit_principal in 'fontes\Unit_principal.pas' {Form_principal},
  Unit_datamodulo in 'fontes\Unit_datamodulo.pas' {DataModule1: TDataModule},
  Unit_Clientes in 'fontes\Unit_Clientes.pas' {Form_clientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_principal, Form_principal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm_clientes, Form_clientes);
  Application.Run;
end.
