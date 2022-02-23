object frmPDV: TfrmPDV
  Left = 0
  Top = 0
  Caption = 'PDV Controle de Vendas'
  ClientHeight = 600
  ClientWidth = 1024
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 1024
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = 7820299
    ParentBackground = False
    TabOrder = 0
    object Panel8: TPanel
      AlignWithMargins = True
      Left = 836
      Top = 10
      Width = 142
      Height = 45
      Cursor = crHandPoint
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      BevelOuter = bvNone
      Caption = 'SAIR DO PDV'
      Color = 10119968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = Panel8Click
    end
    object Panel10: TPanel
      AlignWithMargins = True
      Left = 984
      Top = 10
      Width = 37
      Height = 45
      Cursor = crHandPoint
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      BevelOuter = bvNone
      Color = 10119968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object PanelPedido: TPanel
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 214
      Height = 45
      Cursor = crHandPoint
      Margins.Left = 10
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alLeft
      BevelOuter = bvNone
      Color = 10119968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 0
      ExplicitTop = 20
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 425
    Height = 491
    Align = alLeft
    BevelOuter = bvNone
    Color = 16512241
    ParentBackground = False
    TabOrder = 1
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 419
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 71
        Height = 25
        Align = alLeft
        Caption = 'C'#243'd. / Produto'
        Layout = tlCenter
        ExplicitHeight = 13
      end
    end
    object Panel6: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 88
      Width = 419
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 3
        Top = 8
        Width = 56
        Height = 13
        Caption = 'Quantidade'
        Layout = tlCenter
      end
      object Label3: TLabel
        Left = 127
        Top = 8
        Width = 63
        Height = 13
        Caption = 'Valor unit'#225'rio'
        Layout = tlCenter
      end
      object Label4: TLabel
        Left = 249
        Top = 8
        Width = 51
        Height = 13
        Caption = 'Valor Total'
        Layout = tlCenter
      end
    end
    object Panel7: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 119
      Width = 419
      Height = 58
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object edtQuantidade: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 2
        Width = 118
        Height = 48
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        Text = '1'
        OnChange = edtQuantidadeChange
        OnKeyUp = edtCodigoProdutoKeyUp
      end
      object edtValorUnitario: TEdit
        AlignWithMargins = True
        Left = 127
        Top = 2
        Width = 116
        Height = 48
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnKeyUp = edtCodigoProdutoKeyUp
      end
      object edtValorTotal: TEdit
        AlignWithMargins = True
        Left = 249
        Top = 2
        Width = 168
        Height = 48
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnKeyUp = edtCodigoProdutoKeyUp
      end
    end
    object PanelIncluir: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 183
      Width = 415
      Height = 41
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Right = 5
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Incluir (Enter)'
      Color = 13869628
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = PanelIncluirClick
    end
    object Panel12: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 230
      Width = 415
      Height = 44
      Margins.Left = 5
      Margins.Right = 5
      Align = alTop
      BevelOuter = bvNone
      Color = 16512241
      ParentBackground = False
      TabOrder = 4
      object lblCliente: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 3
        Width = 126
        Height = 38
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Right = 5
        Align = alLeft
        Caption = '+ Referenciar Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13869628
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        Layout = tlCenter
        OnClick = lblClienteClick
        ExplicitHeight = 16
      end
      object lblNomeCliente: TLabel
        AlignWithMargins = True
        Left = 198
        Top = 3
        Width = 212
        Height = 38
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Right = 5
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7820299
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Layout = tlCenter
        OnClick = lblClienteClick
        ExplicitLeft = 141
        ExplicitWidth = 5
        ExplicitHeight = 19
      end
      object lblCodigoUsuario: TLabel
        AlignWithMargins = True
        Left = 141
        Top = 3
        Width = 47
        Height = 38
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Right = 5
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7820299
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Layout = tlCenter
        OnClick = lblClienteClick
      end
    end
    object Panel13: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 34
      Width = 419
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      Color = 16512241
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      ExplicitLeft = 10
      ExplicitTop = 60
      ExplicitWidth = 412
      object Image1: TImage
        AlignWithMargins = True
        Left = 374
        Top = 3
        Width = 42
        Height = 42
        Cursor = crHandPoint
        Align = alRight
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000240000
          00240806000000E10098980000000467414D410000B18F0BFC61050000000662
          4B4744000000000000F943BB7F0000000970485973000000600000006000F06B
          42CF0000026B4944415478DAED974D48155114C78F699184105442D2875492AB
          A0454241A051515159448B20A14D442D0ADC688BC042F0AD8A944ADA4450618B
          6AD387181441117D2CC21609568B88BE894042C3BE7E877B0647D3F7DE7566DE
          33F0C08F39F7BE99FBFE73EF39E7CE2D90096605F9163029286941B36135CC83
          62F8082FE009FCC9A5A055D0046BA07094DFDF413B1C87EF490A9A0A6DB02FCB
          F1DEC20E789C8420157303D685FA7EC17DE8867E980B6BED1AD8006C85DB710B
          6A1F31331DD0006F46DC370576895BAE52EBFB0655D01B97208D9907A1F61168
          CE30D602B80B8BAC7D0B36C525A84B8696AAC366201B5B064FC52D77F0620FA3
          0AD2D4FE202E9B7EC262F97799D2D959D86BFE09A88F2A683B5C35FF1E54FB0C
          88D5C01DF39FC1F2A8820EC249F35BE190A7A059F0C57CBDCE892AA8115ACC4F
          C1614F41D3C59504B51FD68E24680F9C33FF02D4790A5A2243E9AEB1B730AA20
          AD1F8FCC7F2F6EDFFAED31E67E386DFE75D8125590F6E9165066EDDD7031CBF1
          8AE039545AFB009C892A484D0BE131F33FC10AC92EF535F61ACDFF0AE5D01787
          A019D0236EB9D45EC3367BFBB166462B7943A84FB3B5CD474C3A416A1A4B5A87
          822C1984F370C984E99BCF1757D1F5CF2B43CFBE84A5E2177B1905A9AD87CB30
          D363CC57E2AABB5AA7B8423B109720B50A7185726386FB34669AE094B8CF94C0
          BC44F97CC2AE849DE2B6068DAD12F82C6E7BB829AE660501AC3BFD86F1884AEA
          237F1A5C81CDA13EFD82D0C4E84FF76092A78E71894AFA18E42D2A17E7322F51
          B93A286A2DBB26C303FDA8B8ACCC8B20B5F04CE90CD5CA285997EBA3B4CE94EE
          752919A304FCF767FB494179B70927E82FDBD77625D1EF185300000025744558
          74646174653A63726561746500323032322D30322D32335431333A31383A3436
          2B30303A3030BE8AA4FA0000002574455874646174653A6D6F64696679003230
          32322D30322D32335431333A31383A34362B30303A3030CFD71C460000000049
          454E44AE426082}
        OnClick = Image1Click
        ExplicitLeft = 368
      end
      object edtCodigoProduto: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 365
        Height = 42
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        OnChange = edtCodigoProdutoChange
        OnKeyUp = edtCodigoProdutoKeyUp
        ExplicitTop = 0
        ExplicitWidth = 413
        ExplicitHeight = 48
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 556
    Width = 1024
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    Color = 16512241
    ParentBackground = False
    TabOrder = 2
    object PanelPagamento: TPanel
      AlignWithMargins = True
      Left = 836
      Top = 3
      Width = 185
      Height = 38
      Cursor = crHandPoint
      Align = alRight
      BevelOuter = bvNone
      Caption = 'GRAVAR PEDIDO'
      Color = 2412391
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = PanelPagamentoClick
    end
    object btnCarregarPedido: TPanel
      AlignWithMargins = True
      Left = 645
      Top = 3
      Width = 185
      Height = 38
      Cursor = crHandPoint
      Align = alRight
      BevelOuter = bvNone
      Caption = 'CARREGAR PEDIDO'
      Color = 13869628
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnCarregarPedidoClick
      ExplicitLeft = 836
    end
  end
  object Panel4: TPanel
    Left = 425
    Top = 65
    Width = 599
    Height = 491
    Align = alClient
    BevelOuter = bvNone
    Color = 16512241
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      599
      491)
    object Shape1: TShape
      AlignWithMargins = True
      Left = 3
      Top = 34
      Width = 593
      Height = 48
      Align = alTop
      Brush.Color = 16512241
      Pen.Color = clSilver
      Shape = stRoundRect
      ExplicitLeft = 0
      ExplicitTop = 31
      ExplicitWidth = 439
    end
    object Shape2: TShape
      AlignWithMargins = True
      Left = 3
      Top = 440
      Width = 593
      Height = 48
      Align = alBottom
      Brush.Color = 16512241
      Pen.Color = clSilver
      Shape = stRoundRect
      ExplicitLeft = 6
      ExplicitTop = 337
      ExplicitWidth = 433
    end
    object Label6: TLabel
      Left = 16
      Top = 451
      Width = 111
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'SUBTOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubTotal: TLabel
      Left = 540
      Top = 451
      Width = 46
      Height = 25
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricaoProduto: TLabel
      Left = 16
      Top = 43
      Width = 125
      Height = 25
      Caption = 'DESCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel9: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 593
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label5: TLabel
        Left = 0
        Top = 0
        Width = 83
        Height = 25
        Align = alLeft
        Caption = 'Lista de produtos'
        Layout = tlCenter
        ExplicitHeight = 13
      end
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 88
      Width = 589
      Height = 346
      Margins.Left = 5
      Margins.Right = 5
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyUp = DBGrid1KeyUp
      Columns = <
        item
          Expanded = False
          FieldName = 'Quantidade'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Codigo'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o do produto'
          Width = 244
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorUnitario'
          ReadOnly = True
          Title.Caption = 'Valor unit'#225'rio'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorTotal'
          ReadOnly = True
          Title.Caption = 'Valor total'
          Width = 75
          Visible = True
        end>
    end
  end
  object fdmListaProdutos: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Quantidade'
        DataType = ftFloat
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ValorUnitario'
        DataType = ftFloat
      end
      item
        Name = 'ValorTotal'
        DataType = ftFloat
      end
      item
        Name = 'Id_Pedido'
        DataType = ftInteger
      end>
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 504
    Top = 304
    object fdmListaProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object fdmListaProdutosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object fdmListaProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object fdmListaProdutosValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
    end
    object fdmListaProdutosValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
    object fdmListaProdutosId_Pedido: TIntegerField
      FieldName = 'Id_Pedido'
    end
    object fdmListaProdutostotal: TAggregateField
      FieldName = 'total'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(ValorTotal)'
    end
  end
  object DataSource1: TDataSource
    DataSet = fdmListaProdutos
    Left = 504
    Top = 360
  end
  object PopupMenu1: TPopupMenu
    Left = 505
    Top = 241
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
    Left = 504
    Top = 185
  end
end
