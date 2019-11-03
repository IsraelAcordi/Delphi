unit Unit_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls;

type
  TForm_principal = class(TForm)
    StatusBar_Formprincipal: TStatusBar;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Salvar1: TMenuItem;
    Abrir1: TMenuItem;
    Fechar1: TMenuItem;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Sair1: TMenuItem;
    PanelTop: TPanel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_principal: TForm_principal;

implementation

{$R *.dfm}

uses Unit_Clientes;

procedure TForm_principal.Clientes1Click(Sender: TObject);
begin
  form_clientes.showmodal;
end;

procedure TForm_principal.Timer1Timer(Sender: TObject);
begin
  StatusBar_formprincipal.Panels[3].Text:=formatdatetime('dddd, dd " de " mmmm " de " yyyy', NOW);
  StatusBar_formprincipal.Panels[4].Text:=formatdatetime('hh"h"mm"min."', NOW);
end;

end.
