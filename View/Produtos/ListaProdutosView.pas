unit ListaProdutosView;

interface

uses
  FireDAC.Stan.Param,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  untDM;

type
  TfrmListaProdutos = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    edtPesquisar: TEdit;
    PanelPesquisar: TPanel;
    Panel2: TPanel;
    PanelOk: TPanel;
    PanelCancelar: TPanel;
    DataSource1: TDataSource;
    procedure PanelPesquisarClick(Sender: TObject);
    procedure PanelOkClick(Sender: TObject);
    procedure PanelCancelarClick(Sender: TObject);
  private
  public
    cdProduto: string;
    dsProduto: string;
    precoVenda: Double;
  end;

var
  frmListaProdutos: TfrmListaProdutos;

implementation

{$R *.dfm}

procedure TfrmListaProdutos.PanelCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListaProdutos.PanelOkClick(Sender: TObject);
begin
  cdProduto := DM.fdqProdutoscd_produto.AsString;
  dsProduto := DM.fdqProdutosds_produto.AsString;
  precoVenda := DM.fdqProdutospreco_venda.AsFloat;
  Close;
end;

procedure TfrmListaProdutos.PanelPesquisarClick(Sender: TObject);
begin
  DM.fdqProdutos.Close;
  DM.fdqProdutos.ParamByName('CD_PRODUTO').AsString := '%' + edtPesquisar.Text + '%';
  DM.fdqProdutos.Open();
end;

end.

