program PDV;

uses
  Vcl.Forms,
  PDVView in 'View\PDVView.pas' {frmPDV},
  untDM in 'Controller\untDM.pas' {DM: TDataModule},
  ClienteModel in 'Model\ClienteModel.pas',
  ProdutoModel in 'Model\ProdutoModel.pas',
  untArquivo in 'Controller\untArquivo.pas',
  ListaClienteView in 'View\Cliente\ListaClienteView.pas' {frmListaCliente},
  ListaProdutosView in 'View\Produtos\ListaProdutosView.pas' {frmListaProdutos},
  ListaPedidosView in 'View\Pedidos\ListaPedidosView.pas' {frmListaPedidos};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPDV, frmPDV);
  Application.Run;
end.

