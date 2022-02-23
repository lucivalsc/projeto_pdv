object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 343
  Width = 438
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=wk'
      'User_Name=root'
      'Password=912167'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 56
  end
  object fdqProdutos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produtos'
      'where cd_produto||ds_produto like :cd_produto')
    Left = 72
    Top = 120
    ParamData = <
      item
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object fdqProdutoscd_produto: TFDAutoIncField
      FieldName = 'cd_produto'
      Origin = 'cd_produto'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object fdqProdutosds_produto: TStringField
      FieldName = 'ds_produto'
      Origin = 'ds_produto'
      Required = True
      Size = 60
    end
    object fdqProdutospreco_venda: TFloatField
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Required = True
    end
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 192
    Top = 152
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 192
    Top = 216
  end
  object fdqCliente: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE NM_CLIENTE LIKE :NM_CLIENTE')
    Left = 72
    Top = 224
    ParamData = <
      item
        Name = 'NM_CLIENTE'
        ParamType = ptInput
        Value = Null
      end>
    object fdqClientecd_cliente: TFDAutoIncField
      FieldName = 'cd_cliente'
      Origin = 'cd_cliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqClientenm_cliente: TStringField
      FieldName = 'nm_cliente'
      Origin = 'nm_cliente'
      Required = True
      Size = 45
    end
    object fdqClientecidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 45
    end
    object fdqClienteuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 358
    Top = 159
  end
  object frxReport1: TfrxReport
    Version = '6.9.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44615.455518900500000000
    ReportOptions.LastChange = 44615.615028692130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 358
    Top = 96
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Width = 381.732530000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 480.000310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtde')
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            'Vlr Unit.')
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            'Vlr total')
          WordWrap = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'Codigo'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Codigo"]')
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Width = 381.732530000000000000
          Height = 18.897650000000000000
          DataField = 'Descricao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Descricao"]')
          WordWrap = False
        end
        object frxDBDataset1Quantidade: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 480.000310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Quantidade'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Quantidade"]')
          WordWrap = False
        end
        object frxDBDataset1ValorUnitario: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ValorUnitario'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ValorUnitario"]')
          WordWrap = False
        end
        object frxDBDataset1ValorTotal: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ValorTotal'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ValorTotal"]')
          WordWrap = False
        end
      end
    end
  end
  object fdqPedidos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select '#10
      'p.*,'#10'    '
      'c.nm_cliente'
      #10'from pedidos p'#10
      'left join clientes c on c.cd_cliente = p.cd_cliente'
      
        'where concat(id_pedido, c.nm_cliente, p.dt_emissao) like :id_ped' +
        'ido')
    Left = 72
    Top = 168
    ParamData = <
      item
        Name = 'ID_PEDIDO'
        ParamType = ptInput
        Value = Null
      end>
    object fdqPedidosid_pedido: TFDAutoIncField
      FieldName = 'id_pedido'
      Origin = 'id_pedido'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object fdqPedidosdt_emissao: TDateTimeField
      FieldName = 'dt_emissao'
      Origin = 'dt_emissao'
      Required = True
    end
    object fdqPedidosvl_total: TFloatField
      FieldName = 'vl_total'
      Origin = 'vl_total'
      Required = True
    end
    object fdqPedidoscd_cliente: TIntegerField
      FieldName = 'cd_cliente'
      Origin = 'cd_cliente'
      Required = True
    end
    object fdqPedidosnm_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nm_cliente'
      Origin = 'nm_cliente'
      ProviderFlags = []
      ReadOnly = True
      Size = 45
    end
  end
end
