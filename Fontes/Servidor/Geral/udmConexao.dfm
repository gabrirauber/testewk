object dmConexao: TdmConexao
  Height = 344
  Width = 537
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=Teste'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=PG')
    LoginPrompt = False
    BeforeConnect = fdConexaoBeforeConnect
    Left = 40
    Top = 32
  end
  object FDStanStorageBinLink: TFDStanStorageBinLink
    Left = 304
    Top = 80
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 392
    Top = 208
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 256
    Top = 160
  end
end
