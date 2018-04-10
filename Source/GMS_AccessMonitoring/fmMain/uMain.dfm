object fmLogin: TfmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 179
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = pm_Style
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 48
    Height = 21
    Caption = #50500#51060#46356
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 64
    Height = 21
    Caption = #48708#48128#48264#54840
  end
  object btn_Login: TSpeedButton
    Left = 88
    Top = 120
    Width = 105
    Height = 27
    Caption = #47196#44536#51064
    OnClick = btn_LoginClick
  end
  object btn_Cancel: TSpeedButton
    Left = 224
    Top = 120
    Width = 105
    Height = 27
    Caption = #52712#49548
    OnClick = btn_CancelClick
  end
  object ed_UserID: TEdit
    Left = 128
    Top = 29
    Width = 233
    Height = 29
    TabOrder = 0
    OnKeyPress = ed_UserIDKeyPress
  end
  object ed_UserPW: TEdit
    Left = 128
    Top = 69
    Width = 233
    Height = 29
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = ed_UserPWKeyPress
  end
  object ServerConnectTimer: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = ServerConnectTimerTimer
    Left = 16
    Top = 13
  end
  object pm_Style: TPopupMenu
    Left = 375
    Top = 16
    object MetropolisUIDark1: TMenuItem
      Caption = 'Metropolis UI Dark'
      OnClick = MetropolisUIDark1Click
    end
    object MetropolisUIBlack1: TMenuItem
      Caption = 'Metropolis UI Black'
      OnClick = MetropolisUIBlack1Click
    end
    object MetropolisUIBlue1: TMenuItem
      Caption = 'Metropolis UI Blue'
      OnClick = MetropolisUIBlue1Click
    end
    object MetropolisUIGreen1: TMenuItem
      Caption = 'Metropolis UI Green'
      OnClick = MetropolisUIGreen1Click
    end
  end
end
