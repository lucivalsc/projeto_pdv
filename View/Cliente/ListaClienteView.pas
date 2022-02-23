unit ListaClienteView;

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
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  untDM,
  Vcl.StdCtrls;

type
  TfrmListaCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PanelOk: TPanel;
    PanelCancelar: TPanel;
    DataSource1: TDataSource;
    edtPesquisar: TEdit;
    PanelPesquisar: TPanel;
    procedure PanelPesquisarClick(Sender: TObject);
    procedure PanelOkClick(Sender: TObject);
    procedure PanelCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    cdCliente: String;
    nmCliente: String;
  end;

var
  frmListaCliente: TfrmListaCliente;

implementation

uses
  ClienteModel;

{$R *.dfm}

procedure TfrmListaCliente.PanelCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListaCliente.PanelOkClick(Sender: TObject);
begin
  cdCliente:= DM.fdqClientecd_cliente.AsString;
  nmCliente:= DM.fdqClientenm_cliente.AsString;
  Close;
end;

procedure TfrmListaCliente.PanelPesquisarClick(Sender: TObject);
begin
  DM.fdqCliente.Close;
  DM.fdqCliente.ParamByName('NM_CLIENTE').AsString := '%' + edtPesquisar.Text + '%';
  DM.fdqCliente.Open();
end;

end.

