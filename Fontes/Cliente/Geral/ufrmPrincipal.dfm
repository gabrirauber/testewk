object TfrmPrincipal: TTfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Cliente'
  ClientHeight = 553
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  WindowState = wsMaximized
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 304
    Top = 224
    object cadastro1: TMenuItem
      Caption = 'Cadastros'
      object Pedidos1: TMenuItem
        Caption = 'Cadastro de Pedidos'
        OnClick = Pedidos1Click
      end
    end
  end
end
