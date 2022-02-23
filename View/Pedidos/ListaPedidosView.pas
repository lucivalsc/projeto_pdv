unit ListaPedidosView;

interface

uses
  System.UITypes,
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
  untDM,
  Vcl.Menus,
  untArquivo;

type
  TfrmListaPedidos = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    edtPesquisar: TEdit;
    PanelPesquisar: TPanel;
    Panel2: TPanel;
    PanelOk: TPanel;
    PanelCancelar: TPanel;
    DataSource1: TDataSource;
    btnCancelarPedido: TPanel;
    PopupMenu1: TPopupMenu;
    ExportarparaExcel1: TMenuItem;
    Imprimirpedido1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure PanelPesquisarClick(Sender: TObject);
    procedure PanelCancelarClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure PanelOkClick(Sender: TObject);
    procedure ExportarparaExcel1Click(Sender: TObject);
    procedure Imprimirpedido1Click(Sender: TObject);
  private
    { Private declarations }
  public
    cdPedido: string;
  end;

var
  frmListaPedidos: TfrmListaPedidos;

implementation

{$R *.dfm}

procedure TfrmListaPedidos.btnCancelarPedidoClick(Sender: TObject);
begin
  if MessageDlg('Você tem certeza que deseja excluir o pedido?', mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    DM.FDConnection1.ExecSQL('DELETE FROM PEDIDOS_ITENS WHERE ID_PEDIDO = ' + DM.fdqPedidosid_pedido.AsString);
    DM.FDConnection1.ExecSQL('DELETE FROM PEDIDOS WHERE ID_PEDIDO = ' + DM.fdqPedidosid_pedido.AsString);
    PanelPesquisarClick(Sender);
  end;
end;

procedure TfrmListaPedidos.ExportarparaExcel1Click(Sender: TObject);
begin
  if DM.fdqPedidos.IsEmpty then
  begin
    ShowMessage('Não existe produtos para exportar.');
    Abort;
  end;

  try
    if SaveDialog1.Execute then
      if SaveDialog1.FileName <> '' then
      begin
        TArquivo.ExportarDBGrid(DBGrid1, SaveDialog1.FileName);
        ShowMessage('Exportado com sucesso.');
      end;
  except
    on E: Exception do
      ShowMessage(E.Message);

  end;
end;

procedure TfrmListaPedidos.Imprimirpedido1Click(Sender: TObject);
begin
  if DM.fdqPedidos.IsEmpty then
  begin
    ShowMessage('Não existe produtos para impressão.');
    Abort;
  end;
  DM.frxDBDataset1.DataSet := DM.fdqPedidos;
  DM.frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Resources\Relatorios\ListaPedidosFinalizados.fr3');
  DM.frxReport1.ShowReport();
end;

procedure TfrmListaPedidos.PanelCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListaPedidos.PanelOkClick(Sender: TObject);
begin
  cdPedido := DM.fdqPedidosid_pedido.AsString;
  Close;
end;

procedure TfrmListaPedidos.PanelPesquisarClick(Sender: TObject);
begin
  DM.fdqPedidos.Close;
  DM.fdqPedidos.ParamByName('ID_PEDIDO').AsString := '%' + edtPesquisar.Text + '%';
  DM.fdqPedidos.Open();
end;

end.

