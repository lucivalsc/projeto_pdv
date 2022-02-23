unit untArquivo;

interface

uses
  Vcl.DBGrids,
  Winapi.Messages,
  IniFiles,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf,
  FireDAC.Comp.UI,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Phys.IBBase,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.ExtCtrls,
  System.Classes,
  Vcl.Forms,
  Winapi.Windows,
  System.SysUtils;

type
  TArquivo = class
  public
    class function LerIni(Chave1, Chave2: string; ValorPadrao: string = ''): string;
    class procedure ConectarBanco(Conexao: TFDConnection);
    class procedure AbrirForm(FormClass: TComponentClass; FormAtivo: TForm);
    class procedure ArredondarCantos(Panel: TPanel; sRadius: Integer = 15);
    class procedure ExportarDBGrid(DBGrid: TDBGrid; const Caminho: string);
  end;

implementation

{ TArquivoINI }

class procedure TArquivo.ExportarDBGrid(DBGrid: TDBGrid; const Caminho: string);
var
  I: Integer;
  Arquivo: TStringList;
  Linha: string;
begin
  try
    Arquivo := TStringList.Create;
    while not DBGrid.DataSource.DataSet.Eof do
    begin
      Linha := '';
      for I := 0 to DBGrid.Columns.Count - 1 do
      begin
        Linha := Linha + DBGrid.Columns[I].Field.AsString + ';';
      end;
      DBGrid.DataSource.DataSet.Next;
      Arquivo.Add(Linha);
    end;
    Arquivo.SaveToFile(Caminho + '.csv');
  finally
    FreeAndNil(Arquivo);
  end;
end;

class procedure TArquivo.AbrirForm(FormClass: TComponentClass; FormAtivo: TForm);
begin
  Application.CreateForm(FormClass, FormAtivo);
  FormAtivo.FormStyle := TFormStyle.fsNormal;
  FormAtivo.Visible := False;
  FormAtivo.Position := poMainFormCenter;
  FormAtivo.BorderIcons := [biSystemMenu, biMinimize];
  FormAtivo.BorderStyle := bsSingle;
  FormAtivo.ShowModal;
end;

class procedure TArquivo.ArredondarCantos(Panel: TPanel; sRadius: Integer);
var
  R: TRect;
  Rgn: HRGN;
begin
  with Panel do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, sRadius, sRadius);
    Perform(EM_GETRECT, 0, lParam(@R));
    InflateRect(R, -5, -5);
    Perform(EM_SETRECTNP, 0, lParam(@R));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;
end;

class procedure TArquivo.ConectarBanco(Conexao: TFDConnection);
begin
  try
    with Conexao do
    begin
      Connected := False;
      LoginPrompt := False;
      Params.Clear;
      Params.Values['DriverID'] := 'MySQL';
      Params.Values['Database'] := TArquivo.LerIni('FIREBIRD', 'Database');
      Params.Values['User_Name'] := TArquivo.LerIni('FIREBIRD', 'User_name');
      Params.Values['Password'] := TArquivo.LerIni('FIREBIRD', 'Password');
      Params.Values['Server'] := TArquivo.LerIni('FIREBIRD', 'Server');
      Params.Values['Port'] := TArquivo.LerIni('FIREBIRD', 'Port');
      Connected := True;

    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Ocorreu uma Falha na configuração no Banco de Dados! ' + E.Message);
      Conexao.Connected := False;
    end;
  end;
end;

class function TArquivo.LerIni(Chave1, Chave2, ValorPadrao: string): string;
var
  Arquivo: string;
  FileINI: TIniFile;
begin
{$IFDEF MSWINDOWS}
  Arquivo := ExtractFilePath(ParamStr(0)) + Copy(ExtractFileName(Application.ExeName), 1, Pos('.', ExtractFileName(Application.ExeName)) - 1) + '.ini';
  Result := ValorPadrao;
  try
    FileINI := TIniFile.Create(Arquivo);
    if FileExists(Arquivo) then
      Result := FileINI.ReadString(Chave1, Chave2, ValorPadrao);
  finally
    FreeAndNil(FileINI)
  end;
{$ENDIF }
end;

end.

