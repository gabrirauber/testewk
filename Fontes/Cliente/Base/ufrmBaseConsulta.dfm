inherited frmBaseConsulta: TfrmBaseConsulta
  Caption = 'Consulta'
  ClientHeight = 535
  ClientWidth = 643
  OnClose = FormClose
  ExplicitWidth = 655
  ExplicitHeight = 573
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 535
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 639
    ExplicitHeight = 534
    object pnlControle: TPanel
      Left = 1
      Top = 477
      Width = 641
      Height = 57
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 476
      ExplicitWidth = 637
      object btnCancelar: TButton
        Left = 293
        Top = 16
        Width = 129
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = btnCancelarClick
      end
      object btnSelecionar: TButton
        Left = 158
        Top = 16
        Width = 129
        Height = 25
        Caption = 'Selecionar'
        TabOrder = 0
        OnClick = btnSelecionarClick
      end
    end
    object grdConsulta: TStringGrid
      Left = 1
      Top = 57
      Width = 641
      Height = 420
      Align = alClient
      ColCount = 1
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 1
      OnKeyDown = grdConsultaKeyDown
      ExplicitWidth = 637
      ExplicitHeight = 419
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 641
      Height = 56
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 637
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
