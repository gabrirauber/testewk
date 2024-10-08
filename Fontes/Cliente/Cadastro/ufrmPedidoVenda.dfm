inherited frmPedidoVenda: TfrmPedidoVenda
  Caption = 'Pedido de Venda'
  ClientHeight = 658
  ClientWidth = 981
  FormStyle = fsMDIChild
  Visible = True
  OnCreate = FormCreate
  ExplicitWidth = 993
  ExplicitHeight = 696
  TextHeight = 15
  inherited pnlPrincipal: TPanel
    Width = 981
    Height = 658
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 977
    ExplicitHeight = 657
    inherited pnlControle: TPanel
      Top = 600
      Width = 979
      TabOrder = 3
      ExplicitTop = 599
      ExplicitWidth = 975
      inherited btnCancelar: TButton
        Left = 733
        TabOrder = 3
        ExplicitLeft = 733
      end
      inherited btnSalvar: TButton
        Left = 598
        Caption = 'Gravar Pedido'
        TabOrder = 2
        ExplicitLeft = 598
      end
      object btnLocalizarPedido: TButton
        Left = 2
        Top = 16
        Width = 129
        Height = 25
        Caption = 'Localizar Pedido'
        TabOrder = 0
        OnClick = btnLocalizarPedidoClick
      end
      object btnExcluirPedido: TButton
        Left = 152
        Top = 16
        Width = 129
        Height = 25
        Caption = 'Excluir Pedido'
        TabOrder = 1
        OnClick = btnExcluirPedidoClick
      end
    end
    object pnlControleCliente: TPanel
      Left = 1
      Top = 1
      Width = 979
      Height = 72
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 975
      object Label1: TLabel
        Left = 17
        Top = 12
        Width = 40
        Height = 15
        Caption = 'Cliente:'
      end
      object Label2: TLabel
        Left = 544
        Top = 12
        Width = 40
        Height = 15
        Caption = 'Pedido:'
      end
      object Label3: TLabel
        Left = 733
        Top = 12
        Width = 89
        Height = 15
        Caption = 'Data de emiss'#227'o:'
      end
      object btnConsularCliente: TButton
        Left = 95
        Top = 32
        Width = 74
        Height = 25
        Caption = 'Consultar'
        ImageIndex = 0
        Images = ilLista
        TabOrder = 1
        OnClick = btnConsularClienteClick
      end
      object edtNomeCliente: TEdit
        Left = 175
        Top = 33
        Width = 242
        Height = 23
        Enabled = False
        TabOrder = 2
      end
      object edtDataEmissao: TMaskEdit
        Left = 733
        Top = 33
        Width = 120
        Height = 23
        Enabled = False
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
      end
      object edtNumeroPedido: TEdit
        Left = 544
        Top = 33
        Width = 145
        Height = 33
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtCliente: TSpinEdit
        Left = 17
        Top = 33
        Width = 72
        Height = 24
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnExit = edtClienteExit
        OnKeyDown = edtClienteKeyDown
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 73
      Width = 979
      Height = 449
      Align = alClient
      Caption = 'Produtos'
      TabOrder = 1
      ExplicitWidth = 975
      ExplicitHeight = 448
      object grdItens: TStringGrid
        Left = 2
        Top = 17
        Width = 975
        Height = 389
        Align = alClient
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
        OnKeyDown = grdItensKeyDown
        ExplicitWidth = 971
        ExplicitHeight = 388
      end
      object pnlControleProd: TPanel
        Left = 2
        Top = 406
        Width = 975
        Height = 41
        Align = alBottom
        Color = 6118749
        ParentBackground = False
        TabOrder = 1
        ExplicitTop = 405
        ExplicitWidth = 971
        object btnIncluirProd: TButton
          Left = 15
          Top = 6
          Width = 74
          Height = 25
          Caption = 'Incluir'
          ImageIndex = 1
          Images = ilLista
          TabOrder = 0
          OnClick = btnIncluirProdClick
        end
        object btnEditarProd: TButton
          Left = 95
          Top = 6
          Width = 74
          Height = 25
          Caption = 'Editar'
          ImageIndex = 2
          Images = ilLista
          TabOrder = 1
          OnClick = btnEditarProdClick
        end
        object btnExcluirProd: TButton
          Left = 175
          Top = 6
          Width = 74
          Height = 25
          Caption = 'Excluir'
          ImageIndex = 3
          Images = ilLista
          TabOrder = 2
          OnClick = btnExcluirProdClick
        end
      end
    end
    object pnlTotal: TPanel
      Left = 1
      Top = 522
      Width = 979
      Height = 78
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 521
      ExplicitWidth = 975
      object Label4: TLabel
        Left = 708
        Top = 12
        Width = 56
        Height = 15
        Caption = 'Valor total:'
      end
      object edtValorTotal: TEdit
        Left = 708
        Top = 33
        Width = 145
        Height = 33
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end
