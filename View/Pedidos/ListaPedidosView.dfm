object frmListaPedidos: TfrmListaPedidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lista de Pedidos'
  ClientHeight = 374
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 539
    Height = 259
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = PanelOkClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_pedido'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_emissao'
        Title.Caption = 'Data Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_total'
        Title.Caption = 'Valor Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_cliente'
        Title.Caption = 'Cliente'
        Width = 196
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 545
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = 7820299
    ParentBackground = False
    TabOrder = 1
    object edtPesquisar: TEdit
      Left = 13
      Top = 17
      Width = 405
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Pesquisar'
    end
    object PanelPesquisar: TPanel
      AlignWithMargins = True
      Left = 429
      Top = 15
      Width = 110
      Height = 32
      Cursor = crHandPoint
      BevelOuter = bvNone
      Caption = 'Pesquisar'
      Color = 2412391
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = PanelPesquisarClick
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 333
    Width = 539
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    Color = 16512241
    ParentBackground = False
    TabOrder = 2
    object PanelOk: TPanel
      AlignWithMargins = True
      Left = 426
      Top = 3
      Width = 110
      Height = 32
      Cursor = crHandPoint
      Align = alRight
      BevelOuter = bvNone
      Caption = 'Ok'
      Color = 2412391
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = PanelOkClick
      ExplicitLeft = 418
      ExplicitTop = 0
    end
    object PanelCancelar: TPanel
      AlignWithMargins = True
      Left = 310
      Top = 3
      Width = 110
      Height = 32
      Cursor = crHandPoint
      Align = alRight
      BevelOuter = bvNone
      Caption = 'Cancelar'
      Color = 5723637
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = PanelCancelarClick
      ExplicitLeft = 142
      ExplicitTop = 0
    end
    object btnCancelarPedido: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 104
      Height = 32
      Cursor = crHandPoint
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Excluir'
      Color = 4227327
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = btnCancelarPedidoClick
      ExplicitLeft = 200
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.fdqPedidos
    Left = 264
    Top = 184
  end
  object PopupMenu1: TPopupMenu
    Left = 185
    Top = 185
    object ExportarparaExcel1: TMenuItem
      Caption = 'Exportar para Excel'
      OnClick = ExportarparaExcel1Click
    end
    object Imprimirpedido1: TMenuItem
      Caption = 'Imprimir pedido'
      OnClick = Imprimirpedido1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.csv'
    Left = 184
    Top = 129
  end
end
