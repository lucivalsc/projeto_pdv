object frmListaProdutos: TfrmListaProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lista de Produtos'
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
        FieldName = 'cd_produto'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_produto'
        Title.Caption = 'Descri'#231#227'o do Produto'
        Width = 349
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco_venda'
        Title.Caption = 'Valor'
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
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.fdqProdutos
    Left = 264
    Top = 184
  end
end
