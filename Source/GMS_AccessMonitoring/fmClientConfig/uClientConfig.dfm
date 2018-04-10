inherited fmClientConfig: TfmClientConfig
  Left = 429
  Top = 345
  BorderIcons = [biSystemMenu]
  Caption = #54872#44221#49444#51221
  ClientHeight = 396
  ClientWidth = 533
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 549
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 15
  inherited ExcelEnImage: TImage
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  inherited ExcelDisImage: TImage
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  inherited Img_Stop: TImage
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  inherited img_Start: TImage
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  object MediaPlayer1: TMediaPlayer [4]
    Left = 45
    Top = 235
    Width = 316
    Height = 38
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    AutoEnable = False
    Visible = False
    TabOrder = 1
  end
  object PageControl1: TPageControl [5]
    Left = 0
    Top = 0
    Width = 533
    Height = 343
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabAccess
    Align = alTop
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    object AlarmTab: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #48169#48276#49444#51221
      ImageIndex = 1
      TabVisible = False
      object gb_AlarmConfig: TGroupBox
        Left = 0
        Top = 0
        Width = 525
        Height = 171
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Caption = #50508#46988#45936#51060#53552
        TabOrder = 0
        object lb_AlarmFile: TLabel
          Left = 30
          Top = 100
          Width = 48
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #50508#46988#54028#51068
        end
        object lb_AlarmCount: TLabel
          Left = 30
          Top = 133
          Width = 72
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #50508#46988#48156#49373#54943#49688
        end
        object lb_cnt: TLabel
          Left = 259
          Top = 133
          Width = 147
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54924'(0'#54924' '#51077#47141#49884' '#47924#51228#54620' '#48152#48373')'
        end
        object btn_Play: TSpeedButton
          Left = 389
          Top = 94
          Width = 29
          Height = 27
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9169FBF7F4FF
            FFFFFFFFFFFFFFFFFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCD883FCD8B57FCF8F6FFFFFFFFFFFFF9F4F2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0AF69ECB741CE
            8852F8F0EAFFFFFFFAF5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFDFAD6CF6D158EBB33BD08A48F3E2D7FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4B574F4D169F1
            C755F1C451D89546EDD3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE9BC7BF7DC7DF0C95FF5D469F7DA7DD38F50FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECC482F9E289F6
            DB7AF5DD90E2AB68FAF1E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFEFC985FCF1A3F7DF96E7B672FBF4EDFFFEFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D598FAECB6EA
            BB6DFDF8F3FFFFFFFDF8F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF2CC76F1CB82FEFCF9FFFFFFFFFFFFFDF9F3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D184FEFBF5FF
            FFFFFFFFFFFFFFFFFEFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btn_PlayClick
        end
        object chk_PTAlarm: TCheckBox
          Left = 30
          Top = 30
          Width = 191
          Height = 31
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #48169#48276' '#51060#49345#49884' '#50508#46988' '#48156#49373
          TabOrder = 0
        end
        object chk_PTMessage: TCheckBox
          Left = 250
          Top = 30
          Width = 191
          Height = 31
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51316' '#44048#51648#49884' '#47700#49884#51648#54364#49884
          TabOrder = 1
        end
        object ed_AlarmSoundCount: TEdit
          Left = 140
          Top = 128
          Width = 111
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ImeName = 'Microsoft IME 2003'
          TabOrder = 2
        end
        object cmb_AlarmFile: TAdvComboBox
          Left = 140
          Top = 95
          Width = 241
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Color = clWindow
          Version = '1.5.1.0'
          Visible = True
          Style = csOwnerDrawFixed
          EmptyTextStyle = []
          DropWidth = 0
          Enabled = True
          ImeName = 'Microsoft Office IME 2007'
          ItemIndex = -1
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          TabOrder = 3
        end
      end
    end
    object TabAccess: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #52636#51077#49444#51221
      ImageIndex = 3
      object gb_AccessEvent: TGroupBox
        Left = 0
        Top = 0
        Width = 525
        Height = 120
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Caption = #52636#51077#51060#48292#53944
        TabOrder = 0
        object lb_AccessAlarmFile: TLabel
          Left = 25
          Top = 61
          Width = 48
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #50508#46988#54028#51068
        end
        object lb_AccessAlarmCount: TLabel
          Left = 25
          Top = 94
          Width = 72
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #50508#46988#48156#49373#54943#49688
        end
        object lb_AccessAlarmCnt: TLabel
          Left = 254
          Top = 90
          Width = 147
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54924'(0'#54924' '#51077#47141#49884' '#47924#51228#54620' '#48152#48373')'
        end
        object btn_AccessAlarmPlay: TSpeedButton
          Left = 384
          Top = 55
          Width = 29
          Height = 27
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9169FBF7F4FF
            FFFFFFFFFFFFFFFFFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCD883FCD8B57FCF8F6FFFFFFFFFFFFF9F4F2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0AF69ECB741CE
            8852F8F0EAFFFFFFFAF5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFDFAD6CF6D158EBB33BD08A48F3E2D7FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4B574F4D169F1
            C755F1C451D89546EDD3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE9BC7BF7DC7DF0C95FF5D469F7DA7DD38F50FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECC482F9E289F6
            DB7AF5DD90E2AB68FAF1E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFEFC985FCF1A3F7DF96E7B672FBF4EDFFFEFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D598FAECB6EA
            BB6DFDF8F3FFFFFFFDF8F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF2CC76F1CB82FEFCF9FFFFFFFFFFFFFDF9F3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D184FEFBF5FF
            FFFFFFFFFFFFFFFFFEFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btn_AccessAlarmPlayClick
        end
        object ed_AccessSoundCount: TEdit
          Left = 135
          Top = 89
          Width = 111
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
        end
        object cmb_AccessAlarmFile: TAdvComboBox
          Left = 135
          Top = 56
          Width = 241
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Color = clWindow
          Version = '1.5.1.0'
          Visible = True
          Style = csOwnerDrawFixed
          EmptyTextStyle = []
          DropWidth = 0
          Enabled = True
          ImeName = 'Microsoft Office IME 2007'
          ItemIndex = -1
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          TabOrder = 1
        end
        object chk_AlarmUse: TAdvOfficeCheckBox
          Left = 25
          Top = 23
          Width = 120
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = #50508#46988#48156#49373
          ReturnIsTab = False
          Version = '1.3.7.0'
        end
        object chk_AccessMessage: TAdvOfficeCheckBox
          Left = 231
          Top = 23
          Width = 120
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 3
          Alignment = taLeftJustify
          Caption = #47700#49884#51648#51312#54924
          ReturnIsTab = False
          Version = '1.3.7.0'
        end
      end
      object chk_CardMode: TAdvOfficeCheckBox
        Left = 188
        Top = 128
        Width = 150
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Nega/Posi '#49324#50857
        ReturnIsTab = False
        Version = '1.3.7.0'
      end
      object chk_DoorStateUse: TAdvOfficeCheckBox
        Left = 12
        Top = 128
        Width = 150
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = #52636#51077#47928#53685#44228#49324#50857
        ReturnIsTab = False
        Version = '1.3.7.0'
      end
    end
    object MonitoringTab: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #47784#45768#53552#47553#49444#51221
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      TabVisible = False
      object gb_monitoring: TGroupBox
        Left = 0
        Top = 0
        Width = 525
        Height = 123
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Caption = #47784#45768#53552#47553#54872#44221#49444#51221
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lb_MonitoringStart: TLabel
          Left = 20
          Top = 30
          Width = 108
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #47196#44536#51064#49884#47784#45768#53552#49884#51089
        end
        object lb_MonitoringType: TLabel
          Left = 20
          Top = 59
          Width = 76
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #47784#45768#53552#47553' '#48169#48277
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
        end
        object lb_buildingDeep: TLabel
          Left = 20
          Top = 89
          Width = 48
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #50948#52824#45800#44228
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
        end
        object cmb_LoginStart: TComboBox
          Left = 180
          Top = 26
          Width = 271
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csOwnerDrawFixed
          ImeName = 'Microsoft IME 2003'
          ItemIndex = 0
          TabOrder = 0
          Text = #47784#45768#53552#47553#49884#51089
          Items.Strings = (
            #47784#45768#53552#47553#49884#51089
            #47784#45768#53552#47553#50504#54632)
        end
        object cmb_MonitorType: TComboBox
          Left = 180
          Top = 55
          Width = 271
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csOwnerDrawFixed
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ParentFont = False
          TabOrder = 1
          OnChange = cmb_MonitorTypeChange
          Items.Strings = (
            '0.'#48276#50857#47784#45768#53552#47553
            '1.'#47605#47784#45768#53552#47553)
        end
        object cmb_buildingStep: TComboBox
          Left = 180
          Top = 85
          Width = 271
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csOwnerDrawFixed
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ParentFont = False
          TabOrder = 2
          OnChange = cmb_MonitorTypeChange
          Items.Strings = (
            '1'#45800#44228
            '2'#45800#44228
            '3'#45800#44228)
        end
      end
      object chk_BuildingView: TAdvOfficeCheckBox
        Left = 20
        Top = 131
        Width = 150
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
        Alignment = taLeftJustify
        Caption = #48716#46377#54364#49884
        ReturnIsTab = False
        Version = '1.3.7.0'
      end
      object rg_MonitoringType: TAdvOfficeRadioGroup
        Left = 177
        Top = 131
        Width = 274
        Height = 54
        ImageIndex = 0
        Version = '1.3.7.0'
        Caption = #47784#45768#53552#47553#53440#51077
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        Columns = 3
        Items.Strings = (
          #48169#48276'+'#52636#51077
          #52636#51077#51204#50857
          #48169#48276#51204#50857)
        Ellipsis = False
      end
    end
    object tab_regPort: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #46321#47197#44592#54252#53944#49444#51221
      ImageIndex = 6
      TabVisible = False
      object lb_cardPort: TLabel
        Left = 10
        Top = 53
        Width = 60
        Height = 15
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #46321#47197#44592#54252#53944
      end
      object lb_RegCardType: TLabel
        Left = 10
        Top = 20
        Width = 60
        Height = 15
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #46321#47197#44592#53440#51077
      end
      object cmb_Comport: TComboBox
        Left = 170
        Top = 48
        Width = 161
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Style = csOwnerDrawFixed
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 0
      end
      object cmb_RegType: TComboBox
        Left = 170
        Top = 15
        Width = 161
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Style = csOwnerDrawFixed
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = 0
        TabOrder = 1
        Text = '0.RCU-100'
        OnChange = cmb_RegTypeChange
        Items.Strings = (
          '0.RCU-100'
          '1.Suprema Reader')
      end
      object ed_FingerIP: TEdit
        Left = 305
        Top = 48
        Width = 151
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 2
        Visible = False
      end
      object ed_FingerPort: TEdit
        Left = 170
        Top = 78
        Width = 151
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 3
        Text = '1471'
        Visible = False
      end
    end
    object TabSheet1: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #54868#47732
      ImageIndex = 4
      TabVisible = False
      object Label6: TLabel
        Left = 34
        Top = 43
        Width = 29
        Height = 15
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Style:'
      end
      object cmb_FormStyle: TComboBox
        Left = 86
        Top = 39
        Width = 182
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Style = csDropDownList
        ImeName = 'Microsoft IME 2010'
        TabOrder = 0
        Items.Strings = (
          'Office 2010 Blue'
          'Office 2010 Silver'
          'Office 2010 Black'
          'Office2013Gray'
          'Office2013LightGray'
          'Office2013White'
          'Metro Light'
          'Metro Dark')
      end
    end
    object Tab_Report: TTabSheet
      Caption = #48372#44256#49436
      ImageIndex = 5
      TabVisible = False
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 525
        Height = 66
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 20
          Top = 30
          Width = 48
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54268#49373#49457#49884
        end
        object cmb_ReportStart: TComboBox
          Left = 180
          Top = 26
          Width = 271
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csOwnerDrawFixed
          ImeName = 'Microsoft IME 2003'
          ItemIndex = 0
          TabOrder = 0
          Text = #48372#44256#49436' '#51312#54924
          Items.Strings = (
            #48372#44256#49436' '#51312#54924
            #48372#44256#49436' '#51312#54924' '#50504#54632'('#51312#54924#48260#53948#51004#47196#47564' '#51312#54924#46120')')
        end
      end
    end
  end
  object btn_Save: TAdvGlowButton [6]
    Left = 148
    Top = 350
    Width = 100
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #51200#51109
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
    TabOrder = 2
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
  object btn_Close: TAdvGlowButton [7]
    Left = 255
    Top = 350
    Width = 100
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #45803#44592
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btn_CloseClick
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
  object RzOpenDialog1: TOpenDialog
    Left = 36
    Top = 212
  end
  object fdmsADOQuery: TADOQuery
    Parameters = <>
    Left = 440
    Top = 112
  end
  object FindFile: TFindFile
    OnFileMatch = FindFileFileMatch
    Left = 105
    Top = 215
  end
  object AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler
    ButtonBorderColor = clNone
    GlowButtonAppearance.BorderColor = 13948116
    GlowButtonAppearance.BorderColorHot = 15381630
    GlowButtonAppearance.BorderColorDown = 15048022
    GlowButtonAppearance.BorderColorChecked = 16750899
    GlowButtonAppearance.BorderColorDisabled = 11316396
    GlowButtonAppearance.ColorTo = clNone
    GlowButtonAppearance.ColorChecked = 16750899
    GlowButtonAppearance.ColorCheckedTo = clNone
    GlowButtonAppearance.ColorDisabled = 15658734
    GlowButtonAppearance.ColorDisabledTo = clNone
    GlowButtonAppearance.ColorDown = 16573128
    GlowButtonAppearance.ColorDownTo = clNone
    GlowButtonAppearance.ColorHot = 16576740
    GlowButtonAppearance.ColorHotTo = clNone
    GlowButtonAppearance.ColorMirror = clWhite
    GlowButtonAppearance.ColorMirrorTo = clNone
    GlowButtonAppearance.ColorMirrorHot = 16576740
    GlowButtonAppearance.ColorMirrorHotTo = clNone
    GlowButtonAppearance.ColorMirrorDown = 16573128
    GlowButtonAppearance.ColorMirrorDownTo = clNone
    GlowButtonAppearance.ColorMirrorChecked = 16750899
    GlowButtonAppearance.ColorMirrorCheckedTo = clNone
    GlowButtonAppearance.ColorMirrorDisabled = 15658734
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    TabRounding = 0
    Style = tsOffice2013White
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = clNone
    TabAppearance.BorderColorSelected = 13948116
    TabAppearance.BorderColorSelectedHot = 13948116
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = 13948116
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = clWhite
    TabAppearance.ColorSelectedTo = clNone
    TabAppearance.ColorDisabled = 15658734
    TabAppearance.ColorDisabledTo = clNone
    TabAppearance.ColorHot = clWhite
    TabAppearance.ColorHotTo = clNone
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = clWhite
    TabAppearance.ColorMirrorHotTo = clNone
    TabAppearance.ColorMirrorSelected = clWhite
    TabAppearance.ColorMirrorSelectedTo = clNone
    TabAppearance.ColorMirrorDisabled = 15658734
    TabAppearance.ColorMirrorDisabledTo = clNone
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = clBlack
    TabAppearance.TextColorHot = clBlack
    TabAppearance.TextColorSelected = clBlack
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = clNone
    TabAppearance.HighLightColorSelected = clNone
    TabAppearance.HighLightColorHot = clNone
    TabAppearance.HighLightColorSelectedHot = clNone
    TabAppearance.HighLightColorDown = clNone
    TabAppearance.BackGround.Color = clWhite
    TabAppearance.BackGround.ColorTo = clNone
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 144
    Top = 184
  end
  object AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler
    AppColor.AppButtonColor = 13005312
    AppColor.AppButtonHoverColor = 16755772
    AppColor.TextColor = clWhite
    AppColor.HoverColor = 16246477
    AppColor.HoverTextColor = clBlack
    AppColor.HoverBorderColor = 15187578
    AppColor.SelectedColor = 15187578
    AppColor.SelectedTextColor = clBlack
    AppColor.SelectedBorderColor = 15187578
    Style = bsOffice2013White
    BackGroundDisplay = bdStretch
    BorderColor = clSilver
    BorderColorHot = 15590880
    ButtonAppearance.Color = clWhite
    ButtonAppearance.ColorTo = 15590880
    ButtonAppearance.ColorChecked = 7131391
    ButtonAppearance.ColorCheckedTo = 7131391
    ButtonAppearance.ColorDown = 7131391
    ButtonAppearance.ColorDownTo = 8122111
    ButtonAppearance.ColorHot = 9102333
    ButtonAppearance.ColorHotTo = 14285309
    ButtonAppearance.BorderDownColor = 3181250
    ButtonAppearance.BorderHotColor = 5819121
    ButtonAppearance.BorderCheckedColor = 3181250
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Segoe UI'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = 15921133
    CaptionAppearance.CaptionColorTo = 15921133
    CaptionAppearance.CaptionTextColor = 6774616
    CaptionAppearance.CaptionBorderColor = 15921133
    CaptionAppearance.CaptionColorHot = 16250355
    CaptionAppearance.CaptionColorHotTo = 16250355
    CaptionAppearance.CaptionTextColorHot = 6774616
    CaptionAppearance.CaptionBorderColorHot = 15921133
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Segoe UI'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = clWhite
    Color.ColorTo = clWhite
    Color.Direction = gdVertical
    Color.Mirror.Color = 16777214
    Color.Mirror.ColorTo = 16777214
    Color.Mirror.ColorMirror = 16777214
    Color.Mirror.ColorMirrorTo = 15921133
    ColorHot.Color = 16777214
    ColorHot.ColorTo = 16777214
    ColorHot.Direction = gdVertical
    ColorHot.Mirror.Color = 16777214
    ColorHot.Mirror.ColorTo = 16777214
    ColorHot.Mirror.ColorMirror = 16777214
    ColorHot.Mirror.ColorMirrorTo = 16250355
    CompactGlowButtonAppearance.BorderColor = 13815240
    CompactGlowButtonAppearance.BorderColorHot = 5819121
    CompactGlowButtonAppearance.BorderColorDown = 3181250
    CompactGlowButtonAppearance.BorderColorChecked = 3181250
    CompactGlowButtonAppearance.ColorTo = 15590880
    CompactGlowButtonAppearance.ColorChecked = 14285309
    CompactGlowButtonAppearance.ColorCheckedTo = 7131391
    CompactGlowButtonAppearance.ColorDisabled = clNone
    CompactGlowButtonAppearance.ColorDisabledTo = clNone
    CompactGlowButtonAppearance.ColorDown = 7131391
    CompactGlowButtonAppearance.ColorDownTo = 8122111
    CompactGlowButtonAppearance.ColorHot = 9102333
    CompactGlowButtonAppearance.ColorHotTo = 14285309
    CompactGlowButtonAppearance.ColorMirror = 15590880
    CompactGlowButtonAppearance.ColorMirrorTo = 15590880
    CompactGlowButtonAppearance.ColorMirrorHot = 14285309
    CompactGlowButtonAppearance.ColorMirrorHotTo = 9102333
    CompactGlowButtonAppearance.ColorMirrorDown = 8122111
    CompactGlowButtonAppearance.ColorMirrorDownTo = 7131391
    CompactGlowButtonAppearance.ColorMirrorChecked = 7131391
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 7131391
    CompactGlowButtonAppearance.ColorMirrorDisabled = clNone
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = clNone
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = clWhite
    DockColor.ColorTo = clWhite
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    FloatingWindowBorderColor = 13486790
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    GlowButtonAppearance.BorderColor = clWhite
    GlowButtonAppearance.BorderColorHot = 15187578
    GlowButtonAppearance.BorderColorDown = 15187578
    GlowButtonAppearance.BorderColorChecked = 15187578
    GlowButtonAppearance.ColorTo = clNone
    GlowButtonAppearance.ColorChecked = 15187578
    GlowButtonAppearance.ColorCheckedTo = clNone
    GlowButtonAppearance.ColorDisabled = clNone
    GlowButtonAppearance.ColorDisabledTo = clNone
    GlowButtonAppearance.ColorDown = 15187578
    GlowButtonAppearance.ColorDownTo = clNone
    GlowButtonAppearance.ColorHot = 16246477
    GlowButtonAppearance.ColorHotTo = clNone
    GlowButtonAppearance.ColorMirror = clNone
    GlowButtonAppearance.ColorMirrorTo = clNone
    GlowButtonAppearance.ColorMirrorHot = clNone
    GlowButtonAppearance.ColorMirrorHotTo = clNone
    GlowButtonAppearance.ColorMirrorDown = clNone
    GlowButtonAppearance.ColorMirrorDownTo = clNone
    GlowButtonAppearance.ColorMirrorChecked = clNone
    GlowButtonAppearance.ColorMirrorCheckedTo = clNone
    GlowButtonAppearance.ColorMirrorDisabled = clNone
    GlowButtonAppearance.ColorMirrorDisabledTo = clNone
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.Background = clInfoBk
    GroupAppearance.BorderColor = 1340927
    GroupAppearance.Color = 4636927
    GroupAppearance.ColorTo = 4636927
    GroupAppearance.ColorMirror = 4636927
    GroupAppearance.ColorMirrorTo = 4636927
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Segoe UI'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = clWhite
    GroupAppearance.CaptionAppearance.CaptionColor = 15921133
    GroupAppearance.CaptionAppearance.CaptionColorTo = 15921133
    GroupAppearance.CaptionAppearance.CaptionTextColor = 6774616
    GroupAppearance.CaptionAppearance.CaptionBorderColor = 15921133
    GroupAppearance.CaptionAppearance.CaptionColorHot = 16250355
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 16250355
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = 6774616
    GroupAppearance.CaptionAppearance.CaptionBorderColorHot = 15921133
    GroupAppearance.PageAppearance.BorderColor = 15921133
    GroupAppearance.PageAppearance.Color = 16777214
    GroupAppearance.PageAppearance.ColorTo = 16777214
    GroupAppearance.PageAppearance.ColorMirror = 16777214
    GroupAppearance.PageAppearance.ColorMirrorTo = 15921133
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.PageAppearance.ShadowColor = clGray
    GroupAppearance.PageAppearance.HighLightColor = clSilver
    GroupAppearance.TabAppearance.BorderColor = 13815240
    GroupAppearance.TabAppearance.BorderColorHot = 1340927
    GroupAppearance.TabAppearance.BorderColorSelected = 1340927
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 1340927
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = 14404026
    GroupAppearance.TabAppearance.Color = clWhite
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 16777214
    GroupAppearance.TabAppearance.ColorSelectedTo = 16777214
    GroupAppearance.TabAppearance.ColorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorDisabledTo = 15921906
    GroupAppearance.TabAppearance.ColorHot = 16777214
    GroupAppearance.TabAppearance.ColorHotTo = 16777214
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 16777214
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 16777214
    GroupAppearance.TabAppearance.ColorMirrorSelected = 16777214
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 16777214
    GroupAppearance.TabAppearance.ColorMirrorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = 15921906
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Segoe UI'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggVertical
    GroupAppearance.TabAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = 6381406
    GroupAppearance.TabAppearance.TextColorHot = 6774616
    GroupAppearance.TabAppearance.TextColorSelected = 6774616
    GroupAppearance.TabAppearance.TextColorDisabled = clGray
    GroupAppearance.TabAppearance.ShadowColor = 12565174
    GroupAppearance.TabAppearance.HighLightColor = 16775871
    GroupAppearance.TabAppearance.HighLightColorHot = 16777214
    GroupAppearance.TabAppearance.HighLightColorSelected = 13815240
    GroupAppearance.TabAppearance.HighLightColorSelectedHot = 15590880
    GroupAppearance.TabAppearance.HighLightColorDown = 16119026
    GroupAppearance.ToolBarAppearance.BorderColor = 15921133
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 16777214
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 15921133
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 16777214
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 16250355
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 15921133
    PageAppearance.Color = 16777214
    PageAppearance.ColorTo = 16777214
    PageAppearance.ColorMirror = 16777214
    PageAppearance.ColorMirrorTo = 15921133
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PageAppearance.ShadowColor = clGray
    PageAppearance.HighLightColor = clSilver
    PagerCaption.BorderColor = 13815240
    PagerCaption.Color = 13946827
    PagerCaption.ColorTo = 13946827
    PagerCaption.ColorMirror = 13946827
    PagerCaption.ColorMirrorTo = 13946827
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clGray
    PagerCaption.TextColorExtended = clBlue
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -13
    PagerCaption.Font.Name = 'Segoe UI'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 13815240
    QATAppearance.Color = clWhite
    QATAppearance.ColorTo = 15590880
    QATAppearance.FullSizeBorderColor = 13815240
    QATAppearance.FullSizeColor = clWhite
    QATAppearance.FullSizeColorTo = 15590880
    RightHandleColor = clSilver
    RightHandleColorTo = clSilver
    RightHandleColorHot = clGray
    RightHandleColorHotTo = clGray
    RightHandleColorDown = clGray
    RightHandleColorDownTo = clGray
    TabAppearance.BorderColor = 13815240
    TabAppearance.BorderColorHot = 12236209
    TabAppearance.BorderColorSelected = 12565174
    TabAppearance.BorderColorSelectedHot = 12236209
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = 14404026
    TabAppearance.Color = clWhite
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16777214
    TabAppearance.ColorSelectedTo = 16777214
    TabAppearance.ColorDisabled = 15921906
    TabAppearance.ColorDisabledTo = 15921906
    TabAppearance.ColorHot = 16777214
    TabAppearance.ColorHotTo = 16777214
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 16777214
    TabAppearance.ColorMirrorHotTo = 16777214
    TabAppearance.ColorMirrorSelected = 16777214
    TabAppearance.ColorMirrorSelectedTo = 16777214
    TabAppearance.ColorMirrorDisabled = 15921906
    TabAppearance.ColorMirrorDisabledTo = 15921906
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Segoe UI'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = 6381406
    TabAppearance.TextColorHot = 6774616
    TabAppearance.TextColorSelected = 6774616
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 12565174
    TabAppearance.HighLightColor = 16775871
    TabAppearance.HighLightColorHot = 16777214
    TabAppearance.HighLightColorSelected = 13815240
    TabAppearance.HighLightColorSelectedHot = 15590880
    TabAppearance.HighLightColorDown = 16119026
    TabAppearance.BackGround.Color = 16446701
    TabAppearance.BackGround.ColorTo = 16710906
    TabAppearance.BackGround.Direction = gdVertical
    Left = 108
    Top = 188
  end
  object AdvFormStyler1: TAdvFormStyler
    MetroColor = clSkyBlue
    Style = tsOffice2013White
    Left = 150
    Top = 232
  end
end
