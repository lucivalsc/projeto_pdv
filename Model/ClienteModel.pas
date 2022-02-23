unit ClienteModel;

interface

type
  TCliente = class
  private
    FcdCliente: Integer;
    FdsCidade: string;
    Fuf: string;
    FnmCliente: string;
    procedure SetcdCliente(const Value: Integer);
    procedure SetdsCidade(const Value: string);
    procedure SetnmCliente(const Value: string);
    procedure Setuf(const Value: string);
  public
    property cdCliente: Integer read FcdCliente write SetcdCliente;
    property nmCliente: string read FnmCliente write SetnmCliente;
    property dsCidade: string read FdsCidade write SetdsCidade;
    property uf: string read Fuf write Setuf;
  end;

implementation

{ TCliente }

procedure TCliente.SetcdCliente(const Value: Integer);
begin
  FcdCliente := Value;
end;

procedure TCliente.SetdsCidade(const Value: string);
begin
  FdsCidade := Value;
end;

procedure TCliente.SetnmCliente(const Value: string);
begin
  FnmCliente := Value;
end;

procedure TCliente.Setuf(const Value: string);
begin
  Fuf := Value;
end;

end.

