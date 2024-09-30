program Cliente;

uses
  Vcl.Forms,
  ufrmPrincipal in 'Geral\ufrmPrincipal.pas' {TfrmPrincipal},
  ufrmBase in 'Base\ufrmBase.pas' {frmBase},
  ufrmBaseCadastro in 'Base\ufrmBaseCadastro.pas' {frmBaseCadastro},
  uMethods in 'Geral\uMethods.pas',
  udmConexao in 'Geral\udmConexao.pas' {dmConexao: TDataModule},
  uArquivoIni in '..\Comum\uArquivoIni.pas',
  uClasses in '..\Comum\uClasses.pas',
  udmBase in 'Base\udmBase.pas' {dmBase: TDataModule},
  udmBaseCadastro in 'Base\udmBaseCadastro.pas' {dmBaseCadastro: TDataModule},
  ufrmPedidoVenda in 'Cadastro\ufrmPedidoVenda.pas' {frmPedidoVenda},
  uInterfaces in 'Base\uInterfaces.pas',
  ufrmBaseConsulta in 'Base\ufrmBaseConsulta.pas' {frmBaseConsulta},
  ufrmConsultaCliente in 'Consultas\ufrmConsultaCliente.pas' {frmConsultaCliente},
  udmPedidoVenda in 'Cadastro\udmPedidoVenda.pas' {dmPedidoVenda: TDataModule},
  ufrmInserirProduto in 'Geral\ufrmInserirProduto.pas' {frmInserirProduto},
  ufrmConsultaProduto in 'Consultas\ufrmConsultaProduto.pas' {frmConsultaProduto},
  ufrmConsultaPedido in 'Consultas\ufrmConsultaPedido.pas' {frmConsultaPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTfrmPrincipal, TfrmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmConsultaCliente, frmConsultaCliente);
  Application.CreateForm(TdmPedidoVenda, dmPedidoVenda);
  Application.CreateForm(TfrmInserirProduto, frmInserirProduto);
  Application.CreateForm(TfrmConsultaProduto, frmConsultaProduto);
  Application.CreateForm(TfrmConsultaPedido, frmConsultaPedido);
  Application.Run;
end.
