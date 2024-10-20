object frmConnection: TfrmConnection
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=D:\Projetos\Delphi\GERADOR_ORCAMENTOS\DB\ORC_DB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 80
    Top = 24
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'D:\Projetos\Delphi\GERADOR_ORCAMENTOS\DB\fbclient.dll'
    Left = 80
    Top = 96
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 80
    Top = 168
  end
end
