object fmAttendUpdate: TfmAttendUpdate
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #49688#51221
  ClientHeight = 376
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object btn_Save: TAdvGlowButton
    Left = 135
    Top = 327
    Width = 70
    Height = 20
    Caption = #51200#51109
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btn_SaveClick
    Appearance.ColorChecked = 16111818
    Appearance.ColorCheckedTo = 16367008
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 16111818
    Appearance.ColorDownTo = 16367008
    Appearance.ColorHot = 16117985
    Appearance.ColorHotTo = 16372402
    Appearance.ColorMirrorHot = 16107693
    Appearance.ColorMirrorHotTo = 16775412
    Appearance.ColorMirrorDown = 16102556
    Appearance.ColorMirrorDownTo = 16768988
    Appearance.ColorMirrorChecked = 16102556
    Appearance.ColorMirrorCheckedTo = 16768988
    Appearance.ColorMirrorDisabled = 11974326
    Appearance.ColorMirrorDisabledTo = 15921906
  end
  object btn_Cancel: TAdvGlowButton
    Left = 211
    Top = 327
    Width = 70
    Height = 20
    Caption = #52712#49548
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn_CancelClick
    Appearance.ColorChecked = 16111818
    Appearance.ColorCheckedTo = 16367008
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 16111818
    Appearance.ColorDownTo = 16367008
    Appearance.ColorHot = 16117985
    Appearance.ColorHotTo = 16372402
    Appearance.ColorMirrorHot = 16107693
    Appearance.ColorMirrorHotTo = 16775412
    Appearance.ColorMirrorDown = 16102556
    Appearance.ColorMirrorDownTo = 16768988
    Appearance.ColorMirrorChecked = 16102556
    Appearance.ColorMirrorCheckedTo = 16768988
    Appearance.ColorMirrorDisabled = 11974326
    Appearance.ColorMirrorDisabledTo = 15921906
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 444
    Height = 313
    Align = alTop
    TabOrder = 2
    object lb_ss4: TLabel
      Left = 387
      Top = 282
      Width = 12
      Height = 15
      Caption = #52488
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_ss3: TLabel
      Left = 387
      Top = 255
      Width = 12
      Height = 15
      Caption = #52488
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_ss2: TLabel
      Left = 387
      Top = 227
      Width = 12
      Height = 15
      Caption = #52488
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_ss1: TLabel
      Left = 387
      Top = 199
      Width = 12
      Height = 15
      Caption = #52488
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_mm4: TLabel
      Left = 337
      Top = 283
      Width = 12
      Height = 15
      Caption = #48516
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_mm3: TLabel
      Left = 337
      Top = 255
      Width = 12
      Height = 15
      Caption = #48516
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_mm2: TLabel
      Left = 337
      Top = 227
      Width = 12
      Height = 15
      Caption = #48516
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_mm1: TLabel
      Left = 337
      Top = 199
      Width = 12
      Height = 15
      Caption = #48516
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_hh4: TLabel
      Left = 287
      Top = 283
      Width = 12
      Height = 15
      Caption = #49884
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_hh3: TLabel
      Left = 287
      Top = 255
      Width = 12
      Height = 15
      Caption = #49884
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_hh2: TLabel
      Left = 287
      Top = 227
      Width = 12
      Height = 15
      Caption = #49884
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_hh1: TLabel
      Left = 287
      Top = 199
      Width = 12
      Height = 15
      Caption = #49884
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_AtDate: TLabel
      Left = 16
      Top = 60
      Width = 52
      Height = 15
      Caption = 'lb_AtDate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_EMCODE: TLabel
      Left = 16
      Top = 87
      Width = 64
      Height = 15
      Caption = 'lb_EMCODE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_EMNAME: TLabel
      Left = 16
      Top = 115
      Width = 66
      Height = 15
      Caption = 'lb_EMNAME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_AWCODE: TLabel
      Left = 16
      Top = 142
      Width = 66
      Height = 15
      Caption = 'lb_AWCODE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_ATCODE: TLabel
      Left = 16
      Top = 170
      Width = 61
      Height = 15
      Caption = 'lb_ATCODE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_ATINTIME: TLabel
      Left = 16
      Top = 199
      Width = 67
      Height = 15
      Caption = 'lb_ATINTIME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_ATWORKOUTTIME: TLabel
      Left = 16
      Top = 227
      Width = 112
      Height = 15
      Caption = 'lb_ATWORKOUTTIME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_ATWORKINTIME: TLabel
      Left = 16
      Top = 255
      Width = 101
      Height = 15
      Caption = 'lb_ATWORKINTIME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_ATOUTTIME: TLabel
      Left = 16
      Top = 283
      Width = 78
      Height = 15
      Caption = 'lb_ATOUTTIME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object lb_list: TAdvSmoothLabel
      Left = 16
      Top = 9
      Width = 280
      Height = 41
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Text = #44592#44036#48324' '#44540#53468#48372#44256#49436
      Caption.Location = plCenterLeft
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -20
      Caption.Font.Name = #47569#51008' '#44256#46357
      Caption.Font.Style = []
      Caption.ColorStart = clHotLight
      Caption.ColorEnd = clHotLight
      CaptionShadow.Text = #44592#44036#48324' '#44540#53468#48372#44256#49436
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -27
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      Version = '1.6.0.2'
    end
    object ed_ATOutTimess: TEdit
      Left = 355
      Top = 279
      Width = 26
      Height = 23
      TabOrder = 0
    end
    object ed_ATInTimess: TEdit
      Left = 355
      Top = 195
      Width = 26
      Height = 23
      TabOrder = 1
    end
    object ed_ATWorkOutTimess: TEdit
      Left = 355
      Top = 223
      Width = 26
      Height = 23
      TabOrder = 2
    end
    object ed_ATWorkInTimess: TEdit
      Left = 355
      Top = 251
      Width = 26
      Height = 23
      TabOrder = 3
    end
    object ed_ATInTimemm: TEdit
      Left = 305
      Top = 195
      Width = 26
      Height = 23
      TabOrder = 4
    end
    object ed_ATWorkOutTimemm: TEdit
      Left = 305
      Top = 223
      Width = 26
      Height = 23
      TabOrder = 5
    end
    object ed_ATWorkInTimemm: TEdit
      Left = 305
      Top = 251
      Width = 26
      Height = 23
      TabOrder = 6
    end
    object ed_ATOutTimemm: TEdit
      Left = 305
      Top = 279
      Width = 26
      Height = 23
      TabOrder = 7
    end
    object ed_ATInTimehh: TEdit
      Left = 255
      Top = 195
      Width = 26
      Height = 23
      TabOrder = 8
    end
    object ed_ATWorkOutTimehh: TEdit
      Left = 255
      Top = 223
      Width = 26
      Height = 23
      TabOrder = 9
    end
    object ed_ATWorkInTimehh: TEdit
      Left = 255
      Top = 251
      Width = 26
      Height = 23
      TabOrder = 10
    end
    object ed_ATOutTimehh: TEdit
      Left = 255
      Top = 279
      Width = 26
      Height = 23
      TabOrder = 11
    end
    object ed_ATOutTimeYear: TEdit
      Left = 168
      Top = 279
      Width = 81
      Height = 23
      TabOrder = 12
    end
    object ed_ATWorkInTimeYear: TEdit
      Left = 168
      Top = 251
      Width = 81
      Height = 23
      TabOrder = 13
    end
    object ed_ATWorkOutTimeYear: TEdit
      Left = 168
      Top = 223
      Width = 81
      Height = 23
      TabOrder = 14
    end
    object ed_ATInTimeYear: TEdit
      Left = 168
      Top = 195
      Width = 81
      Height = 23
      TabOrder = 15
    end
    object cmb_AttendCode: TComboBox
      Left = 168
      Top = 167
      Width = 169
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ParentFont = False
      TabOrder = 16
    end
    object cmb_AttendWorkType: TComboBox
      Left = 168
      Top = 139
      Width = 169
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ParentFont = False
      TabOrder = 17
      OnChange = cmb_AttendWorkTypeChange
    end
    object ed_EMName: TEdit
      Left = 168
      Top = 111
      Width = 169
      Height = 23
      Enabled = False
      TabOrder = 18
      Text = 'ed_EMName'
    end
    object ed_EmCode: TEdit
      Left = 168
      Top = 83
      Width = 169
      Height = 23
      Enabled = False
      TabOrder = 19
      Text = 'ed_EmCode'
    end
    object dt_Indate: TDateTimePicker
      Left = 168
      Top = 56
      Width = 169
      Height = 23
      Date = 41463.586441724540000000
      Time = 41463.586441724540000000
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ParentFont = False
      TabOrder = 20
    end
  end
end
