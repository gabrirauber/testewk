inherited frmBaseConsulta: TfrmBaseConsulta
  Caption = 'Consulta'
  ClientHeight = 535
  ClientWidth = 643
  OnClose = FormClose
  ExplicitWidth = 659
  ExplicitHeight = 574
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 535
    Align = alClient
    TabOrder = 0
    object pnlControle: TPanel
      Left = 1
      Top = 478
      Width = 645
      Height = 57
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 477
      ExplicitWidth = 641
      object btnCancelar: TButton
        Left = 293
        Top = 16
        Width = 129
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = btnCancelarClick
      end
      object btnSelecionar: TButton
        Left = 158
        Top = 16
        Width = 129
        Height = 25
        Caption = 'Selecionar'
        TabOrder = 1
        OnClick = btnSelecionarClick
      end
    end
    object grdConsulta: TStringGrid
      Left = 1
      Top = 57
      Width = 645
      Height = 421
      Align = alClient
      ColCount = 1
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 1
      OnKeyDown = grdConsultaKeyDown
      ExplicitTop = 1
      ExplicitWidth = 641
      ExplicitHeight = 476
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 645
      Height = 56
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 7
        Top = 8
        Width = 27
        Height = 15
        Caption = 'Filtro'
      end
      object edtFiltro: TEdit
        Left = 7
        Top = 27
        Width = 402
        Height = 23
        TabOrder = 0
      end
      object btnConsularCliente: TButton
        Left = 415
        Top = 25
        Width = 74
        Height = 25
        Caption = 'Consultar'
        ImageIndex = 0
        TabOrder = 1
        OnClick = btnConsularClienteClick
      end
    end
  end
end
