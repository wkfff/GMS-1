object fmSHFingerDeviceReg: TfmSHFingerDeviceReg
  Left = 0
  Top = 0
  Caption = #51648#47928#47532#45908#51648#47928#46321#47197
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object btn_Apply: TSpeedButton
    Left = 104
    Top = 216
    Width = 209
    Height = 57
    Caption = #51201#50857
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    Visible = False
    OnClick = btn_ApplyClick
  end
  object SpeedButton2: TSpeedButton
    Left = 216
    Top = 216
    Width = 209
    Height = 57
    Caption = #52712#49548
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object pan_FingerUserID: TAdvSmoothPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 97
    Cursor = crDefault
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.3.0.3'
    Align = alTop
    TabOrder = 0
    object lb_fingeruserid: TAdvSmoothLabel
      Left = 0
      Top = 0
      Width = 635
      Height = 97
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -27
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.ColorStart = clBlack
      Caption.ColorEnd = clBlack
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -27
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      Version = '1.6.0.2'
      Align = alClient
      ExplicitHeight = 105
    end
  end
  object pan_Message: TAdvSmoothPanel
    Left = 0
    Top = 97
    Width = 635
    Height = 97
    Cursor = crDefault
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.3.0.3'
    Align = alTop
    TabOrder = 1
    object lb_Message: TAdvSmoothLabel
      Left = 0
      Top = 0
      Width = 635
      Height = 97
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Text = #51648#47928#51012' '#46321#47197#54616#45716' '#46041#50504' '#45824#44592' '#54616#50668' '#51452#49464#50836'...'
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -24
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.ColorStart = clBlack
      Caption.ColorEnd = clBlack
      CaptionShadow.Text = #51648#47928#51012' '#46321#47197#54616#45716' '#46041#50504' '#45824#44592' '#54616#50668' '#51452#49464#50836'...'
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -27
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      Version = '1.6.0.2'
      Align = alClient
      ExplicitHeight = 105
    end
  end
  object AdvFormStyler1: TAdvFormStyler
    MetroColor = clSkyBlue
    Style = tsOffice2013White
    Left = 592
    Top = 152
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 584
    Top = 232
  end
end