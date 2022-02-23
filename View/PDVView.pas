unit PDVView;

interface

uses
  System.UITypes,
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
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  untArquivo,
  ProdutoModel,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  ListaClienteView,
  untDM,
  Vcl.Imaging.pngimage,
  ListaProdutosView,
  Vcl.Menus,
  frxClass,
  frxDBSet,
  ListaPedidosView;

type
  TfrmPDV = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    edtCodigoProduto: TEdit;
    Panel6: TPanel;
    Label2: TLabel;
    Panel7: TPanel;
    edtQuantidade: TEdit;
    edtValorUnitario: TEdit;
    edtValorTotal: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    PanelIncluir: TPanel;
    Panel9: TPanel;
    Label5: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    lblSubTotal: TLabel;
    PanelPagamento: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    PanelPedido: TPanel;
    lblDescricaoProduto: TLabel;
    fdmListaProdutos: TFDMemTable;
    DataSource1: TDataSource;
    fdmListaProdutosQuantidade: TFloatField;
    fdmListaProdutosCodigo: TIntegerField;
    fdmListaProdutosDescricao: TStringField;
    fdmListaProdutosValorUnitario: TFloatField;
    fdmListaProdutosValorTotal: TFloatField;
    fdmListaProdutostotal: TAggregateField;
    Panel12: TPanel;
    lblCliente: TLabel;
    lblNomeCliente: TLabel;
    Panel13: TPanel;
    lblCodigoUsuario: TLabel;
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    ExportarparaExcel1: TMenuItem;
    Imprimirpedido1: TMenuItem;
    SaveDialog1: TSaveDialog;
    btnCarregarPedido: TPanel;
    fdmListaProdutosId_Pedido: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure edtCodigoProdutoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure PanelIncluirClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lblClienteClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure PanelPagamentoClick(Sender: TObject);
    procedure Imprimirpedido1Click(Sender: TObject);
    procedure ExportarparaExcel1Click(Sender: TObject);
    procedure btnCarregarPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CalcularTotal;
    procedure LimparCampos;
    procedure IncluirItem;
    procedure GravarPedido;
    procedure BotaoCarregarPedido;
    procedure CarregarPedido(Codigo: string);
  end;

var
  frmPDV: TfrmPDV;

implementation

{$R *.dfm}

{ TfrmPDV }

procedure TfrmPDV.BotaoCarregarPedido;
begin
  if lblCodigoUsuario.Caption = '' then
  begin
    btnCarregarPedido.Visible := True;
  end
  else
  begin
    btnCarregarPedido.Visible := False;
  end;
end;

procedure TfrmPDV.btnCarregarPedidoClick(Sender: TObject);
begin
  try
    if not Assigned(frmListaPedidos) then
    begin
      frmListaPedidos := TfrmListaPedidos.Create(Nil);
      frmListaPedidos.ShowModal;
    end;

    if frmListaPedidos.cdPedido <> '' then
    begin
      PanelPedido.Caption := 'Pedido: ' + frmListaPedidos.cdPedido;
      CarregarPedido(frmListaPedidos.cdPedido);
      BotaoCarregarPedido;
    end;
  finally
    begin
      frmListaPedidos.Free;
      frmListaPedidos := Nil;
    end;
  end;
end;

procedure TfrmPDV.CalcularTotal;
var
  Quantidade, ValorUnitario: Real;
begin
  Quantidade := StrToFloatDef(edtQuantidade.Text, 0);
  ValorUnitario := StrToFloatDef(edtValorUnitario.Text, 0);

  if (Quantidade >= 0) and (ValorUnitario >= 0) then
  begin
    edtValorTotal.Text := FloatToStr(ValorUnitario * Quantidade)
  end;

end;

procedure TfrmPDV.CarregarPedido(Codigo: string);
var
  Conexao: TFDConnection;
  fdQuery: TFDQuery;
begin
  try
    Conexao := TFDConnection.Create(Nil);
    TArquivo.ConectarBanco(Conexao);

    fdQuery := TFDQuery.Create(Nil);
    fdQuery.Connection := Conexao;

    try
      fdQuery.Close;
      fdQuery.SQL.Clear;
      fdQuery.SQL.Add(' SELECT ');
      fdQuery.SQL.Add(' PE.*, ');
      fdQuery.SQL.Add(' CLI.CD_CLIENTE, ');
      fdQuery.SQL.Add(' CLI.NM_CLIENTE, ');
      fdQuery.SQL.Add(' PR.DS_PRODUTO ');
      fdQuery.SQL.Add(' FROM PEDIDOS_ITENS PE ');
      fdQuery.SQL.Add(' LEFT JOIN PRODUTOS PR ON PR.CD_PRODUTO = PE.ID_PRODUTO ');
      fdQuery.SQL.Add(' LEFT JOIN PEDIDOS PED ON PED.ID_PEDIDO = PE.ID_PEDIDO ');
      fdQuery.SQL.Add(' LEFT JOIN CLIENTES CLI ON CLI.CD_CLIENTE = PED.CD_CLIENTE ');
      fdQuery.SQL.Add(' WHERE PE.ID_PEDIDO = :ID_PEDIDO ');
      fdQuery.ParamByName('ID_PEDIDO').AsString := Codigo;
      fdQuery.Open();

      if fdQuery.RecordCount > 0 then
      begin
        fdQuery.First;

        fdmListaProdutos.Close;
        fdmListaProdutos.CreateDataSet;

        lblCodigoUsuario.Caption := fdQuery.FieldByName('CD_CLIENTE').Value;
        lblNomeCliente.Caption := fdQuery.FieldByName('NM_CLIENTE').Value;
        while not fdQuery.Eof do
        begin
          fdmListaProdutos.Append;
          fdmListaProdutosQuantidade.Value := fdQuery.FieldByName('QT_ITENS').Value;
          fdmListaProdutosCodigo.Value := fdQuery.FieldByName('ID_PRODUTO').Value;
          fdmListaProdutosDescricao.AsString := fdQuery.FieldByName('DS_PRODUTO').AsString;
          fdmListaProdutosValorUnitario.Value := fdQuery.FieldByName('VL_UNITARIO').Value;
          fdmListaProdutosValorTotal.Value := fdQuery.FieldByName('VL_TOTAL').Value;
          fdmListaProdutosId_Pedido.Value := fdQuery.FieldByName('ID_PEDIDO').Value;
          fdmListaProdutos.Post;
          fdQuery.Next;
        end;
      end;
    finally
      FreeAndNil(fdQuery);
      FreeAndNil(Conexao);
    end;

  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmPDV.DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    edtCodigoProduto.Text := fdmListaProdutosCodigo.AsString;
    edtQuantidade.Text := fdmListaProdutosQuantidade.AsString;
    edtValorUnitario.Text := fdmListaProdutosValorUnitario.AsString;
    edtValorTotal.Text := fdmListaProdutosValorTotal.AsString;
    DataSource1.Edit;
  end;

  if Key = VK_DELETE then
  begin
    if MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    begin
      fdmListaProdutos.Delete;
      LimparCampos;
    end;
  end;
end;

procedure TfrmPDV.edtCodigoProdutoChange(Sender: TObject);
var
  Produto: TProduto;
begin
  try
    Produto := TProduto.Create;
    if Length(edtCodigoProduto.Text) > 4 then
    begin
      Produto.RetornarProduto(edtCodigoProduto.Text);
      lblDescricaoProduto.Caption := Produto.dsProduto;
      edtValorUnitario.Text := FloatToStr(Produto.precoVenda);
      CalcularTotal;
    end;

  finally
    FreeAndNil(Produto);
  end;
end;

procedure TfrmPDV.edtCodigoProdutoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    PanelIncluirClick(Sender);
end;

procedure TfrmPDV.edtQuantidadeChange(Sender: TObject);
begin
  CalcularTotal;
end;

procedure TfrmPDV.ExportarparaExcel1Click(Sender: TObject);
begin
  if fdmListaProdutos.IsEmpty then
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

procedure TfrmPDV.lblClienteClick(Sender: TObject);
begin

  try
    if not Assigned(frmListaCliente) then
    begin
      frmListaCliente := TfrmListaCliente.Create(Nil);
      frmListaCliente.ShowModal;
    end;
    lblCodigoUsuario.Caption := frmListaCliente.cdCliente;
    lblNomeCliente.Caption := frmListaCliente.nmCliente;
    BotaoCarregarPedido;

  finally
    begin
      frmListaCliente.Free;
      frmListaCliente := Nil;
    end;
  end;

end;

procedure TfrmPDV.FormCreate(Sender: TObject);
begin
  LimparCampos;
  BotaoCarregarPedido;
  TArquivo.ArredondarCantos(PanelIncluir);
  TArquivo.ArredondarCantos(PanelPagamento);
end;

procedure TfrmPDV.GravarPedido;
var
  Conexao: TFDConnection;
  fdQuery: TFDQuery;
  Codigo: Integer;
begin
  try
    Conexao := TFDConnection.Create(Nil);
    TArquivo.ConectarBanco(Conexao);

    fdQuery := TFDQuery.Create(Nil);
    fdQuery.Connection := Conexao;

    try
      if fdmListaProdutosId_Pedido.AsString <> '' then
      begin
        Codigo := fdmListaProdutosId_Pedido.AsInteger;
        DM.FDConnection1.ExecSQL('DELETE FROM PEDIDOS_ITENS WHERE ID_PEDIDO = ' + IntToStr(Codigo));

        fdQuery.Close;
        fdQuery.SQL.Clear;
        fdQuery.SQL.Add(' UPDATE PEDIDOS SET ');
        fdQuery.SQL.Add(' VL_TOTAL = :VL_TOTAL, DT_EMISSAO = :DT_EMISSAO ');
        fdQuery.SQL.Add(' WHERE ID_PEDIDO = :ID_PEDIDO ');
        fdQuery.ParamByName('DT_EMISSAO').AsDateTime := Now;
        fdQuery.ParamByName('VL_TOTAL').AsFloat := StrToFloat(fdmListaProdutostotal.AsString);
        fdQuery.ParamByName('ID_PEDIDO').AsInteger := Codigo;
        fdQuery.ExecSQL;
      end
      else
      begin
        fdQuery.Close;
        fdQuery.SQL.Clear;
        fdQuery.SQL.Add(' INSERT INTO PEDIDOS  ');
        fdQuery.SQL.Add(' (DT_EMISSAO, VL_TOTAL, CD_CLIENTE) ');
        fdQuery.SQL.Add(' VALUES(:DT_EMISSAO, :VL_TOTAL, :CD_CLIENTE) ');
        fdQuery.ParamByName('DT_EMISSAO').AsDateTime := Now;
        fdQuery.ParamByName('VL_TOTAL').AsFloat := StrToFloat(fdmListaProdutostotal.AsString);
        fdQuery.ParamByName('CD_CLIENTE').AsInteger := StrToInt(lblCodigoUsuario.Caption);
        fdQuery.ExecSQL;

        fdQuery.Close;
        fdQuery.SQL.Clear;
        fdQuery.SQL.Add(' SELECT MAX(ID_PEDIDO) AS ID_PEDIDO FROM PEDIDOS ');
        fdQuery.Open();

        Codigo := StrToIntDef(fdQuery.FieldByName('ID_PEDIDO').AsString, 0);
      end;

      fdmListaProdutos.First;
      while not fdmListaProdutos.Eof do
      begin
        fdQuery.Close;
        fdQuery.SQL.Clear;
        fdQuery.SQL.Add(' INSERT INTO PEDIDOS_ITENS  ');
        fdQuery.SQL.Add(' (QT_ITENS, VL_UNITARIO, VL_TOTAL, ID_PEDIDO, ID_PRODUTO) ');
        fdQuery.SQL.Add(' VALUES(:QT_ITENS, :VL_UNITARIO, :VL_TOTAL, :ID_PEDIDO, :ID_PRODUTO) ');
        fdQuery.ParamByName('QT_ITENS').Value := fdmListaProdutosQuantidade.AsFloat;
        fdQuery.ParamByName('VL_UNITARIO').Value := fdmListaProdutosValorUnitario.AsFloat;
        fdQuery.ParamByName('VL_TOTAL').Value := fdmListaProdutosValorTotal.AsFloat;
        fdQuery.ParamByName('ID_PEDIDO').Value := Codigo;
        fdQuery.ParamByName('ID_PRODUTO').Value := fdmListaProdutosCodigo.AsInteger;
        fdQuery.ExecSQL;
        fdmListaProdutos.Next;
      end;
      fdmListaProdutos.Close;
      LimparCampos;
      lblNomeCliente.Caption := '';
      lblCodigoUsuario.Caption := '';
      PanelPedido.Caption := '';
      lblSubTotal.Caption := '0,00';
      BotaoCarregarPedido;
    finally
      FreeAndNil(fdQuery);
      FreeAndNil(Conexao);
    end;

  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmPDV.Image1Click(Sender: TObject);
begin

  try
    if not Assigned(frmListaProdutos) then
    begin
      frmListaProdutos := TfrmListaProdutos.Create(Nil);
      frmListaProdutos.ShowModal;
    end;
    edtCodigoProduto.Text := frmListaProdutos.cdProduto;
    lblDescricaoProduto.Caption := frmListaProdutos.dsProduto;

  finally
    begin
      frmListaProdutos.Free;
      frmListaProdutos := Nil;
    end;
  end;

end;

procedure TfrmPDV.Imprimirpedido1Click(Sender: TObject);
begin
  if fdmListaProdutos.IsEmpty then
  begin
    ShowMessage('Não existe produtos para impressão.');
    Abort;
  end;
  DM.frxDBDataset1.DataSet := fdmListaProdutos;
  DM.frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Resources\Relatorios\ListaPedidos.fr3');
  DM.frxReport1.ShowReport();
end;

procedure TfrmPDV.IncluirItem;
begin
  if not fdmListaProdutos.Active then
  begin
    fdmListaProdutos.Close;
    fdmListaProdutos.CreateDataSet;
  end;

  if DataSource1.DataSet.State = dsEdit then
  begin
    fdmListaProdutos.Edit;
    fdmListaProdutosQuantidade.AsFloat := StrToFloat(edtQuantidade.Text);
    fdmListaProdutosCodigo.AsInteger := StrToInt(edtCodigoProduto.Text);
    fdmListaProdutosDescricao.AsString := lblDescricaoProduto.Caption;
    fdmListaProdutosValorUnitario.AsFloat := StrToFloat(edtValorUnitario.Text);
    fdmListaProdutosValorTotal.AsFloat := StrToFloat(edtValorTotal.Text);
    fdmListaProdutos.Post;
  end
  else
  begin
    fdmListaProdutos.Append;
    fdmListaProdutosQuantidade.AsFloat := StrToFloat(edtQuantidade.Text);
    fdmListaProdutosCodigo.AsInteger := StrToInt(edtCodigoProduto.Text);
    fdmListaProdutosDescricao.AsString := lblDescricaoProduto.Caption;
    fdmListaProdutosValorUnitario.AsFloat := StrToFloat(edtValorUnitario.Text);
    fdmListaProdutosValorTotal.AsFloat := StrToFloat(edtValorTotal.Text);
    fdmListaProdutos.Post;
  end;
  lblSubTotal.Caption := fdmListaProdutostotal.AsString;
  LimparCampos;
end;

procedure TfrmPDV.PanelIncluirClick(Sender: TObject);
begin
  if (edtCodigoProduto.Text = '') or (lblDescricaoProduto.Caption = '') then
  begin
    ShowMessage('Digite um produto válido.');
    Abort;
  end;

  IncluirItem;
end;

procedure TfrmPDV.PanelPagamentoClick(Sender: TObject);
begin
  if fdmListaProdutos.IsEmpty then
  begin
    ShowMessage('Insira produtos para poder continuar.');
    Abort;
  end;

  if lblCodigoUsuario.Caption = '' then
  begin
    ShowMessage('Cliente é um campo obrigatório.');
    Abort;
  end;
  GravarPedido;

end;

procedure TfrmPDV.LimparCampos;
begin
  edtCodigoProduto.Text := '';
  edtQuantidade.Text := '1';
  edtValorUnitario.Text := '0,00';
  edtValorTotal.Text := '0,00';
  lblDescricaoProduto.Caption := '';
  lblDescricaoProduto.Caption := '';
  DM.fdqCliente.Close;
end;

procedure TfrmPDV.Panel8Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.

