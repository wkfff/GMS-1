object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SK'#51613#54217' '#52852#46300#48320#54872#51089#50629
  ClientHeight = 475
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 354
    Width = 462
    Height = 121
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 112
    object TabSheet1: TTabSheet
      Caption = #52852#46300#48320#54872
      ExplicitLeft = 0
      ExplicitWidth = 440
      ExplicitHeight = 262
      object Label12: TLabel
        Left = 0
        Top = 55
        Width = 454
        Height = 13
        Align = alBottom
        ExplicitTop = 46
        ExplicitWidth = 3
      end
      object Label13: TLabel
        Left = 0
        Top = 18
        Width = 454
        Height = 20
        Align = alBottom
        Caption = 'TB_CARD Change'
        ExplicitTop = 3
      end
      object btn_CardChange: TButton
        Left = 0
        Top = 68
        Width = 454
        Height = 25
        Align = alBottom
        Caption = #52852#46300#48320#54872
        TabOrder = 0
        OnClick = btn_CardChangeClick
        ExplicitTop = 619
        ExplicitWidth = 1047
      end
      object ProgressBar1: TProgressBar
        Left = 0
        Top = 38
        Width = 454
        Height = 17
        Align = alBottom
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = 19
        ExplicitWidth = 448
      end
    end
    object TabSheet2: TTabSheet
      Caption = #49888#44508#52852#46300' '#52628#44032
      ImageIndex = 1
      ExplicitWidth = 440
      ExplicitHeight = 262
      object Label11: TLabel
        Left = 16
        Top = 17
        Width = 48
        Height = 13
        Caption = #54028#51068#49440#53469
      end
      object SpeedButton1: TSpeedButton
        Left = 383
        Top = 12
        Width = 23
        Height = 22
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
          078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
          BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
          CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
          39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
          D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
          DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
          1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
          DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
          EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
          77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
          18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
          8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
          9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
          9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
          85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
          FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
          540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
          00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
          18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
          85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = SpeedButton1Click
      end
      object Label14: TLabel
        Left = 0
        Top = 65
        Width = 454
        Height = 3
        Align = alBottom
        ExplicitTop = 46
      end
      object btn_CardUpload: TButton
        Left = 0
        Top = 68
        Width = 454
        Height = 25
        Align = alBottom
        Caption = #52852#46300#50629#47196#46300
        TabOrder = 0
        OnClick = btn_CardUploadClick
        ExplicitTop = 619
        ExplicitWidth = 1047
      end
      object ed_File: TEdit
        Left = 87
        Top = 13
        Width = 290
        Height = 21
        TabOrder = 1
      end
      object ProgressBar2: TProgressBar
        Left = 0
        Top = 48
        Width = 454
        Height = 17
        Align = alBottom
        TabOrder = 2
        ExplicitLeft = 3
        ExplicitTop = 19
        ExplicitWidth = 448
      end
    end
    object TabSheet3: TTabSheet
      Caption = #44592#51316' '#52852#46300' '#49325#51228
      ImageIndex = 2
      ExplicitHeight = 84
      object btn_CardDelete: TButton
        Left = 0
        Top = 68
        Width = 454
        Height = 25
        Align = alBottom
        Caption = #52852#46300#49325#51228
        TabOrder = 0
        OnClick = btn_CardDeleteClick
        ExplicitTop = 619
        ExplicitWidth = 1047
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 462
    Height = 177
    Align = alTop
    Caption = 'ACAM_DBServer'
    TabOrder = 1
    ExplicitWidth = 1047
    object Label1: TLabel
      Left = 40
      Top = 33
      Width = 45
      Height = 13
      Caption = 'Server IP'
    end
    object Label2: TLabel
      Left = 40
      Top = 60
      Width = 55
      Height = 13
      Caption = 'Server Port'
    end
    object Label3: TLabel
      Left = 40
      Top = 87
      Width = 33
      Height = 13
      Caption = 'UserID'
    end
    object Label4: TLabel
      Left = 40
      Top = 114
      Width = 38
      Height = 13
      Caption = 'UserPW'
    end
    object Label5: TLabel
      Left = 40
      Top = 141
      Width = 40
      Height = 13
      Caption = 'DBName'
    end
    object ed_serverIP: TEdit
      Left = 112
      Top = 29
      Width = 321
      Height = 21
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object ed_ServerPort: TEdit
      Left = 112
      Top = 56
      Width = 321
      Height = 21
      TabOrder = 1
      Text = '1433'
    end
    object ed_userid: TEdit
      Left = 112
      Top = 83
      Width = 321
      Height = 21
      TabOrder = 2
      Text = 'sa'
    end
    object ed_UserPw: TEdit
      Left = 112
      Top = 110
      Width = 321
      Height = 21
      TabOrder = 3
      Text = 'sapasswd'
    end
    object ed_DBName: TEdit
      Left = 112
      Top = 137
      Width = 321
      Height = 21
      TabOrder = 4
      Text = 'ACAM'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 177
    Width = 462
    Height = 177
    Align = alTop
    Caption = 'SKIOMS_DBServer'
    TabOrder = 2
    ExplicitTop = 8
    ExplicitWidth = 1047
    object Label6: TLabel
      Left = 40
      Top = 33
      Width = 45
      Height = 13
      Caption = 'Server IP'
    end
    object Label7: TLabel
      Left = 40
      Top = 60
      Width = 55
      Height = 13
      Caption = 'Server Port'
    end
    object Label8: TLabel
      Left = 40
      Top = 87
      Width = 33
      Height = 13
      Caption = 'UserID'
    end
    object Label9: TLabel
      Left = 40
      Top = 114
      Width = 38
      Height = 13
      Caption = 'UserPW'
    end
    object Label10: TLabel
      Left = 40
      Top = 141
      Width = 40
      Height = 13
      Caption = 'DBName'
    end
    object ed_SKserverIP: TEdit
      Left = 112
      Top = 29
      Width = 321
      Height = 21
      TabOrder = 0
      Text = '168.154.8.47'
    end
    object ed_SKServerPort: TEdit
      Left = 112
      Top = 56
      Width = 321
      Height = 21
      TabOrder = 1
      Text = '1433'
    end
    object ed_SKuserid: TEdit
      Left = 112
      Top = 83
      Width = 321
      Height = 21
      TabOrder = 2
      Text = 'infouser'
    end
    object ed_SKUserPw: TEdit
      Left = 112
      Top = 110
      Width = 321
      Height = 21
      TabOrder = 3
      Text = 'SK1234567'
    end
    object ed_SKDBName: TEdit
      Left = 112
      Top = 137
      Width = 321
      Height = 21
      TabOrder = 4
      Text = 'SKIOMS'
    end
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'DRIVER={XTG Systems InterBase6 ODBC driver};DB=127.0.0.1:BMOS;UI' +
      'D=SYSDBA;'
    Left = 32
    Top = 16
  end
  object ADOQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 32
    Top = 72
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'DRIVER={XTG Systems InterBase6 ODBC driver};DB=127.0.0.1:BMOS;UI' +
      'D=SYSDBA;'
    Left = 8
    Top = 192
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 8
    Top = 248
  end
  object OpenDialog1: TOpenDialog
    Left = 194
    Top = 144
  end
end
