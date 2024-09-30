inherited frmConsultaPedido: TfrmConsultaPedido
  Caption = 'Consulta de pedido'
  ClientHeight = 536
  OnCreate = FormCreate
  ExplicitWidth = 655
  TextHeight = 15
  inherited Panel1: TPanel
    Height = 536
    inherited grdConsulta: TStringGrid
      ExplicitTop = 57
      ExplicitHeight = 420
    end
    inherited Panel2: TPanel
      ExplicitWidth = 641
    end
  end
end
