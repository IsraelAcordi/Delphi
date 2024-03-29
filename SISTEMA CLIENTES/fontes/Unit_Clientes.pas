unit Unit_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TForm_clientes = class(TForm)
    PageControl1: TPageControl;
    Tab_cadastro: TTabSheet;
    Tab_consulta: TTabSheet;
    Label_id: TLabel;
    Label_cidade: TLabel;
    Label_bairro: TLabel;
    Label4: TLabel;
    Label_datadenascimento: TLabel;
    Label_cpf: TLabel;
    Label_rg: TLabel;
    Label_nome: TLabel;
    Label_telefone: TLabel;
    Label_celular: TLabel;
    Label_email: TLabel;
    Label_situacao: TLabel;
    Label_datadecadastro: TLabel;
    SpeedButton_adicionar: TSpeedButton;
    SpeedButton_editar: TSpeedButton;
    SpeedButton_salvar: TSpeedButton;
    SpeedButton_deletar: TSpeedButton;
    SpeedButton_cancelar: TSpeedButton;
    SpeedButton_fechar: TSpeedButton;
    SpeedButton_localizar: TSpeedButton;
    Label_cep: TLabel;
    Label_uf: TLabel;
    Edit_id: TDBEdit;
    Edit_nome: TDBEdit;
    Edit_bairro: TDBEdit;
    Edit_cpf: TDBEdit;
    Edit_rg: TDBEdit;
    Edit_datadenascimento: TDBEdit;
    Edit_endereco: TDBEdit;
    Edit_cidade: TDBEdit;
    Edit_datadecadastro: TDBEdit;
    Edit_email: TDBEdit;
    Edit_celular: TDBEdit;
    Edit_telefone: TDBEdit;
    Edit_cep: TDBEdit;
    ComboBox_situacao: TDBComboBox;
    ComboBox_uf: TDBComboBox;
    DBGrid1: TDBGrid;
    RadioGroup_Pesquisa: TRadioGroup;
    Label_pesquisarpor: TLabel;
    Edit_Pesquisa: TEdit;
    Button_pesquisar: TButton;
    Button_imprimir: TButton;
    Button_voltar: TButton;
    Label_formadepesquisa: TLabel;
    label_cont_clientes: TLabel;
    Button_exibir_todos_registros: TButton;
    procedure SpeedButton_adicionarClick(Sender: TObject);
    procedure SpeedButton_editarClick(Sender: TObject);
    procedure SpeedButton_salvarClick(Sender: TObject);
    procedure SpeedButton_deletarClick(Sender: TObject);
    procedure SpeedButton_cancelarClick(Sender: TObject);
    procedure SpeedButton_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton_localizarClick(Sender: TObject);
    procedure Button_voltarClick(Sender: TObject);
    procedure RadioGroup_PesquisaClick(Sender: TObject);
    procedure Button_pesquisarClick(Sender: TObject);
    procedure Button_exibir_todos_registrosClick(Sender: TObject);
  private
    { Private declarations }
    procedure configbotoes;
    procedure contadorderegistros;
  public
    { Public declarations }
  end;

var
  Form_clientes: TForm_clientes;

implementation

{$R *.dfm}

uses Unit_datamodulo;

procedure TForm_clientes.Button_exibir_todos_registrosClick(Sender: TObject);
  begin
    with datamodule1.Query_consulta_clientes do
    begin
      close;
      sql.Clear;
      sql.Add('select * from clientes');
      Open;

      contadorderegistros;

    end;
  end;

procedure TForm_clientes.Button_pesquisarClick(Sender: TObject);
begin
  edit_pesquisa.Text:=trim(edit_pesquisa.Text);
  if Edit_Pesquisa.Text='' then
    begin
      messagedlg('Campo de pesquisa vazio!',mtinformation,[mbok],0);
      edit_pesquisa.SetFocus;
    end;

  with datamodule1.Query_consulta_clientes do
    begin
      close;
      sql.Clear;
      sql.Add('select * from clientes');

      case radiogroup_pesquisa.itemindex of

      0:
        begin
          sql.Add('where cli_id = :pesquisa');
          parambyname('pesquisa').value:=Edit_Pesquisa.Text;
        end;

      1:
        begin
          sql.Add('where cli_nome like :pesquisa');
          parambyname('pesquisa').Value:= '%' + edit_pesquisa.Text + '%';
        end;

      2:
         begin
          sql.Add('where cli_rg = :pesquisa');
          parambyname('pesquisa').value:=Edit_Pesquisa.Text;
        end;

      3:
       begin
          sql.Add('where cli_cpf = :pesquisa');
          parambyname('pesquisa').value:=Edit_Pesquisa.Text;
        end;
      end;

      open;

      contadorderegistros;

      end;


    end;

procedure TForm_clientes.Button_voltarClick(Sender: TObject);
begin
  pagecontrol1.TabIndex:=0;
  tab_consulta.tabvisible:=false;
  tab_cadastro.tabvisible:=true;
end;

procedure TForm_clientes.configbotoes;
begin
  speedbutton_adicionar.Enabled:=datamodule1.tb_clientes.state in [dsbrowse];
  speedbutton_editar.Enabled:=datamodule1.tb_clientes.state in [dsbrowse];
  speedbutton_deletar.Enabled:=datamodule1.tb_clientes.state in [dsbrowse];
  speedbutton_salvar.Enabled:=datamodule1.tb_clientes.state in [dsedit,dsinsert];
  speedbutton_cancelar.Enabled:=datamodule1.tb_clientes.state in [dsedit,dsinsert];
end;

procedure TForm_clientes.contadorderegistros;
begin
  if datamodule1.Query_consulta_clientes.recordcount = 0 then
        begin
          label_cont_clientes.caption:='Nenhum registro encontrado.';
          button_imprimir.Enabled:=false;
        end
      else
        if datamodule1.Query_consulta_clientes.recordcount = 1 then
          begin
            label_cont_clientes.Caption:=inttostr(datamodule1.Query_consulta_clientes.recordcount) + ' registro encontrado.';
            button_imprimir.Enabled:=true;
          end
      else
        begin
          label_cont_clientes.Caption:=inttostr(datamodule1.Query_consulta_clientes.recordcount) + ' registros encontrados.';
          button_imprimir.Enabled:=true;
        end;
end;

procedure TForm_clientes.FormCreate(Sender: TObject);
begin
  pagecontrol1.TabIndex:=0;
  tab_consulta.tabvisible:=false;
  speedbutton_salvar.Enabled:=false;
  SpeedButton_cancelar.Enabled:=false;
  button_imprimir.Enabled:=false;
  button_pesquisar.Enabled:=false;
  edit_pesquisa.visible:=false;
  label_formadepesquisa.visible:=false;
end;

procedure TForm_clientes.RadioGroup_PesquisaClick(Sender: TObject);
begin
  case radiogroup_pesquisa.itemindex of

  0:
    begin
      edit_pesquisa.visible:=true;
      edit_pesquisa.Clear;
      edit_pesquisa.SetFocus;
      label_formadepesquisa.visible:=true;
      label_formadepesquisa.Caption:='Informe o ID: ';
      button_pesquisar.Enabled:=true;
    end;

  1:
    begin
      edit_pesquisa.visible:=true;
      edit_pesquisa.Clear;
      edit_pesquisa.SetFocus;
      label_formadepesquisa.visible:=true;
      label_formadepesquisa.Caption:='Informe o Nome: ';
      button_pesquisar.Enabled:=true;
    end;

  2:
    begin
      edit_pesquisa.visible:=true;
      edit_pesquisa.Clear;
      edit_pesquisa.SetFocus;
      label_formadepesquisa.visible:=true;
      label_formadepesquisa.Caption:='Informe o RG: ';
      button_pesquisar.Enabled:=true;
    end;

  3:
    begin
      edit_pesquisa.visible:=true;
      edit_pesquisa.clear;
      edit_pesquisa.SetFocus;
      label_formadepesquisa.visible:=true;
      label_formadepesquisa.Caption:='Informe o CPF: ';
      button_pesquisar.Enabled:=true;
    end;

  4:
    begin
      edit_pesquisa.visible:=false;
      edit_pesquisa.Clear;
      label_formadepesquisa.visible:=true;
      label_formadepesquisa.Caption:='Informe a data de nascimento: ';
      button_pesquisar.Enabled:=true;
    end;
  end;
end;

procedure TForm_clientes.SpeedButton_adicionarClick(Sender: TObject);
begin
  DataModule1.tb_clientes.Active:=true;
  datamodule1.tb_clientes.insert;

  configbotoes;
  datamodule1.tb_clientescli_data_cad.Value:=date;
  edit_nome.SetFocus;

end;

procedure TForm_clientes.SpeedButton_cancelarClick(Sender: TObject);
begin
  datamodule1.tb_clientes.Cancel;
  configbotoes;
end;

procedure TForm_clientes.SpeedButton_deletarClick(Sender: TObject);
begin
  case messagedlg('Deseja excluir esse cadastro?',mtconfirmation,[mbyes,mbno],0) of
    idyes:
      begin
        DataModule1.tb_clientes.Delete;
        messagedlg('Cadastro exclu�do com sucesso!',mtinformation,[mbok],0);
      end;
    idno:
      begin
        exit;
      end;

  end;
end;

procedure TForm_clientes.SpeedButton_editarClick(Sender: TObject);
begin
  datamodule1.tb_clientes.edit;
  configbotoes;
end;

procedure TForm_clientes.SpeedButton_fecharClick(Sender: TObject);
begin
  if DataModule1.tb_clientes.State in [dsedit,dsinsert] then
    begin
      messagedlg('Cancele ou salve o cadastro para sair.',mtinformation,[mbok],0);
      exit
    end
  else
    close;
end;

procedure TForm_clientes.SpeedButton_localizarClick(Sender: TObject);
begin
  pagecontrol1.TabIndex:=1;
  tab_consulta.tabvisible:=true;
  tab_cadastro.tabvisible:=false;
end;

procedure TForm_clientes.SpeedButton_salvarClick(Sender: TObject);
begin
  datamodule1.tb_clientes.post;
  MessageDlg('Cadastro salvo com sucesso!',mtinformation,[mbok],0);
  configbotoes;
end;

end.
