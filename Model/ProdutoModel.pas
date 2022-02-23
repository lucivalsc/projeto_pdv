unit ProdutoModel;

interface

uses
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
  untArquivo,
  System.SysUtils,
  Vcl.Dialogs;

type
  TProduto = class
  private
    FdsProduto: string;
    FprecoVenda: Double;
    FcdProduto: Integer;
    procedure SetcdProduto(const Value: Integer);
    procedure SetdsProduto(const Value: string);
    procedure SetprecoVenda(const Value: Double);
  public
    property cdProduto: Integer read FcdProduto write SetcdProduto;
    property dsProduto: string read FdsProduto write SetdsProduto;
    property precoVenda: Double read FprecoVenda write SetprecoVenda;
    procedure RetornarProduto(Codigo: string);
  end;

implementation

{ TProduto }

procedure TProduto.RetornarProduto(Codigo: string);
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
      fdQuery.SQL.Add('SELECT * FROM PRODUTOS ');
      fdQuery.SQL.Add(' WHERE CD_PRODUTO = :CD_PRODUTO ');
      fdQuery.ParamByName('CD_PRODUTO').AsString := Codigo;
      fdQuery.Open();
      if fdQuery.RecordCount > 0 then
      begin
        FcdProduto := fdQuery.FieldByName('CD_PRODUTO').AsInteger;
        FdsProduto := fdQuery.FieldByName('DS_PRODUTO').AsString;
        FprecoVenda := fdQuery.FieldByName('PRECO_VENDA').AsFloat;
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

procedure TProduto.SetcdProduto(const Value: Integer);
begin
  FcdProduto := Value;
end;

procedure TProduto.SetdsProduto(const Value: string);
begin
  FdsProduto := Value;
end;

procedure TProduto.SetprecoVenda(const Value: Double);
begin
  FprecoVenda := Value;
end;

end.

