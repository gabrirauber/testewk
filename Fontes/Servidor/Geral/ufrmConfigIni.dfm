object frmConfigIni: TfrmConfigIni
  Left = 0
  Top = 0
  Caption = 'frmConfigIni'
  ClientHeight = 392
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 351
    Width = 420
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 350
    ExplicitWidth = 416
    object Button2: TButton
      Left = 55
      Top = 6
      Width = 72
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 215
      Top = 6
      Width = 72
      Height = 25
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 351
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 416
    ExplicitHeight = 350
    object GroupBox2: TGroupBox
      Left = 1
      Top = 97
      Width = 418
      Height = 253
      Align = alClient
      Caption = 'Conex'#227'o banco de dados'
      TabOrder = 0
      ExplicitWidth = 414
      ExplicitHeight = 252
      object Label2: TLabel
        Left = 16
        Top = 132
        Width = 243
        Height = 15
        Caption = 'Pasta DLLs (Vazio assume pasta dll executavel)'
      end
      object Label3: TLabel
        Left = 16
        Top = 24
        Width = 46
        Height = 15
        Caption = 'Servidor:'
      end
      object Label4: TLabel
        Left = 174
        Top = 24
        Width = 43
        Height = 15
        Caption = 'Usu'#225'rio:'
      end
      object Label5: TLabel
        Left = 174
        Top = 80
        Width = 35
        Height = 15
        Caption = 'Senha:'
      end
      object Label6: TLabel
        Left = 16
        Top = 80
        Width = 31
        Height = 15
        Caption = 'Porta:'
      end
      object Label7: TLabel
        Left = 16
        Top = 182
        Width = 87
        Height = 15
        Caption = 'Banco de dados:'
      end
      object edtBancoDados: TEdit
        Left = 16
        Top = 203
        Width = 201
        Height = 23
        TabOrder = 0
        Text = 'testedelphi'
      end
      object edtServidor: TEdit
        Left = 16
        Top = 45
        Width = 121
        Height = 23
        TabOrder = 1
        Text = 'LocalHost'
      end
      object edtUsuario: TEdit
        Left = 174
        Top = 45
        Width = 121
        Height = 23
        TabOrder = 2
        Text = 'root'
      end
      object edtSenha: TEdit
        Left = 174
        Top = 101
        Width = 121
        Height = 23
        TabOrder = 3
        Text = 'testedelphi'
      end
      object edtPortaBD: TEdit
        Left = 16
        Top = 101
        Width = 121
        Height = 23
        TabOrder = 4
        Text = '3306'
      end
      object edtPastaDLL: TEdit
        Left = 16
        Top = 153
        Width = 201
        Height = 23
        TabOrder = 5
      end
      object Button1: TButton
        Left = 223
        Top = 152
        Width = 72
        Height = 25
        Caption = 'Selecionar'
        TabOrder = 6
        OnClick = Button1Click
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 418
      Height = 96
      Align = alTop
      Caption = 'Conex'#227'o Servidor'
      TabOrder = 1
      ExplicitWidth = 414
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 95
        Height = 15
        Caption = 'Porta de conex'#227'o:'
      end
      object edtPorta: TEdit
        Left = 16
        Top = 45
        Width = 121
        Height = 23
        TabOrder = 0
        Text = '8080'
      end
    end
  end
end
