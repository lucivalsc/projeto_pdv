unit untDM;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  untArquivo, Vcl.Menus, frxClass, frxDBSet;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    fdqProdutos: TFDQuery;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    fdqCliente: TFDQuery;
    fdqClientecd_cliente: TFDAutoIncField;
    fdqClientenm_cliente: TStringField;
    fdqClientecidade: TStringField;
    fdqClienteuf: TStringField;
    fdqProdutoscd_produto: TFDAutoIncField;
    fdqProdutosds_produto: TStringField;
    fdqProdutospreco_venda: TFloatField;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    fdqPedidos: TFDQuery;
    fdqPedidosid_pedido: TFDAutoIncField;
    fdqPedidosdt_emissao: TDateTimeField;
    fdqPedidosvl_total: TFloatField;
    fdqPedidoscd_cliente: TIntegerField;
    fdqPedidosnm_cliente: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  TArquivo.ConectarBanco(FDConnection1);
end;

end.

