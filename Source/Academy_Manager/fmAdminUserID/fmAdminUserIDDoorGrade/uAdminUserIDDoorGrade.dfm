inherited fmAdminUserIDDoorGrade: TfmAdminUserIDDoorGrade
  Left = 652
  Caption = #49884#49828#53596#49324#50857#51088' '#44428#54620#44288#47532
  ClientHeight = 765
  ClientWidth = 741
  Font.Height = -12
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 609
  ExplicitHeight = 650
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
  object tv_buildingName: TTreeView [4]
    Left = 61
    Top = 223
    Width = 215
    Height = 321
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DragMode = dmAutomatic
    Images = MenuImageList16
    Indent = 19
    TabOrder = 3
    Visible = False
    OnDblClick = tv_buildingNameDblClick
    Items.NodeData = {
      0302000000220000000200000002000000FFFFFFFFFFFFFFFF00000000000000
      0002000000010204C8B4CC240000000200000002000000FFFFFFFFFFFFFFFF00
      000000000000000200000001038CD6ACC03100240000000000000000000000FF
      FFFFFFFFFFFFFF0000000000000000000000000103C0C9ACC031002400000000
      00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000103C0C9AC
      C03200240000000200000002000000FFFFFFFFFFFFFFFF000000000000000000
      00000001038CD6ACC03200200000000200000002000000FFFFFFFFFFFFFFFF00
      000000000000000000000001013100}
  end
  object tv_buildingCode: TTreeView [5]
    Left = 94
    Top = 391
    Width = 151
    Height = 165
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Indent = 19
    TabOrder = 5
    Visible = False
    Items.NodeData = {
      0301000000220000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      0002000000010204C8B4CC240000000000000000000000FFFFFFFFFFFFFFFF00
      000000000000000200000001038CD6ACC03100240000000000000000000000FF
      FFFFFFFFFFFFFF0000000000000000000000000103C0C9ACC031002400000000
      00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000103C0C9AC
      C03200240000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
      00000001038CD6ACC03200}
  end
  object Panel31: TPanel [6]
    Left = 0
    Top = 41
    Width = 741
    Height = 70
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Color = clActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -17
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object lb_BuildingName: TAdvSmoothLabel
      Left = 10
      Top = 18
      Width = 141
      Height = 27
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Text = #50948#52824#47749
      Caption.Location = plCenterLeft
      Caption.Font.Charset = HANGEUL_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -12
      Caption.Font.Name = #44404#47548
      Caption.Font.Style = [fsBold]
      Caption.ColorStart = clBlue
      Caption.ColorEnd = clBlack
      CaptionShadow.Text = 'AdvSmoothLabel'
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -27
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      Version = '1.6.0.2'
    end
    object btn_Close: TSpeedButton
      Left = 625
      Top = 8
      Width = 101
      Height = 41
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #45803#44592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000730B0000730B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
        E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
        57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
        578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
        57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
        57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
        57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
        57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
        57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
        57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
        57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
        57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
        57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
        57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
        57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
        57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btn_CloseClick
    end
    object eb_BuildingName: TAdvEditBtn
      Left = 140
      Top = 18
      Width = 211
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      EmptyTextStyle = []
      Flat = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Font.Charset = DEFAULT_CHARSET
      Lookup.Font.Color = clWindowText
      Lookup.Font.Height = -11
      Lookup.Font.Name = 'Arial'
      Lookup.Font.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      ImeName = 'Microsoft Office IME 2007'
      ReadOnly = False
      TabOrder = 0
      Text = ''
      Visible = True
      Version = '1.3.5.0'
      ButtonStyle = bsButton
      ButtonWidth = 16
      Etched = False
      OnClickBtn = eb_BuildingNameClickBtn
    end
    object ed_BuildingCode: TEdit
      Left = 380
      Top = 19
      Width = 131
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Enabled = False
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
      Visible = False
    end
  end
  object Panel18: TPanel [7]
    Left = 0
    Top = 0
    Width = 741
    Height = 41
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Caption = #49884#49828#53596#49324#50857#51088' '#44428#54620#44288#47532'    '
    Color = 15387318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -20
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      741
      41)
    object Edit1: TEdit
      Left = 490
      Top = 9
      Width = 128
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Color = clBtnFace
      Enabled = False
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      Text = #49440#53469' '#50500#51060#46356
      Visible = False
    end
    object ed_userid: TEdit
      Left = 625
      Top = 9
      Width = 109
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      AutoSize = False
      Enabled = False
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
      Visible = False
    end
  end
  object StatusBar1: TStatusBar [8]
    Left = 0
    Top = 737
    Width = 741
    Height = 28
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <>
    ExplicitTop = 730
    ExplicitWidth = 593
  end
  object Panel3: TPanel [9]
    Left = 0
    Top = 111
    Width = 741
    Height = 626
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 619
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 739
      Height = 624
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = DoorTab
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 617
      object DoorTab: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #52636#51077#47928#51228#50612#44428#54620
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 291
          Height = 581
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          TabOrder = 0
          object sg_Door: TAdvStringGrid
            Left = 1
            Top = 43
            Width = 289
            Height = 537
            Cursor = crDefault
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            ColCount = 8
            DefaultColWidth = 150
            DefaultRowHeight = 21
            DrawingStyle = gdsClassic
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing, goRowSelect]
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            HoverRowCells = [hcNormal, hcSelected]
            OnCheckBoxClick = CheckBoxClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #52636#51077#47928' '#47749#52845
              #45432#46300#48264#54840
              'MCUID'
              'ECUID'
              'DOORNO')
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDownClear = '(All)'
            FilterEdit.TypeNames.Strings = (
              'Starts with'
              'Ends with'
              'Contains'
              'Not contains'
              'Equal'
              'Not equal'
              'Clear')
            FixedColWidth = 188
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            Multilinecells = True
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            ScrollSynch = True
            SearchFooter.FindNextCaption = 'Find next'
            SearchFooter.FindPrevCaption = 'Find previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurence'
            SearchFooter.HintFindPrev = 'Find previous occurence'
            SearchFooter.HintHighlight = 'Highlight occurences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SortSettings.DefaultFormat = ssAutomatic
            Version = '7.2.8.0'
            ColWidths = (
              188
              116
              4
              150
              150
              150
              150
              150)
          end
          object Panel29: TPanel
            Left = 1
            Top = 1
            Width = 289
            Height = 42
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #52636#51077#47928' '#47785#47197
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -17
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object Panel7: TPanel
          Left = 291
          Top = 0
          Width = 140
          Height = 581
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          TabOrder = 1
          object btn_DoorGradeInsert: TSpeedButton
            Left = 19
            Top = 206
            Width = 101
            Height = 42
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = #44428#54620#46321#47197
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btn_DepartGradeInsertClick
          end
          object btn_DoorGradeDelete: TSpeedButton
            Left = 19
            Top = 293
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = #44428#54620#49325#51228
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btn_DoorGradeDeleteClick
          end
          object Panel30: TPanel
            Left = 1
            Top = 1
            Width = 138
            Height = 42
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #44428#54620#44288#47532
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -17
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel8: TPanel
          Left = 431
          Top = 0
          Width = 298
          Height = 581
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 2
          object sg_GradeDoor: TAdvStringGrid
            Left = 1
            Top = 43
            Width = 295
            Height = 537
            Cursor = crDefault
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            ColCount = 8
            DefaultColWidth = 150
            DefaultRowHeight = 21
            DrawingStyle = gdsClassic
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing, goRowSelect]
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            HoverRowCells = [hcNormal, hcSelected]
            OnCheckBoxClick = CheckBoxClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #52636#51077#47928' '#47749#52845
              #45432#46300#48264#54840
              'MCUID'
              'ECUID'
              'DOORNO')
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDownClear = '(All)'
            FilterEdit.TypeNames.Strings = (
              'Starts with'
              'Ends with'
              'Contains'
              'Not contains'
              'Equal'
              'Not equal'
              'Clear')
            FixedColWidth = 201
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            ScrollSynch = True
            SearchFooter.FindNextCaption = 'Find next'
            SearchFooter.FindPrevCaption = 'Find previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurence'
            SearchFooter.HintFindPrev = 'Find previous occurence'
            SearchFooter.HintHighlight = 'Highlight occurences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SortSettings.DefaultFormat = ssAutomatic
            Version = '7.2.8.0'
            ColWidths = (
              201
              128
              3
              150
              150
              150
              150
              150)
          end
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 295
            Height = 42
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #52636#51077#47928#44288#47532#44428#54620
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -17
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object AlarmTab: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #44221#48708#44396#50669#51228#50612#44428#54620
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel9: TPanel
          Left = 291
          Top = 0
          Width = 140
          Height = 581
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          TabOrder = 0
          object btn_AlarmGradeInsert: TSpeedButton
            Left = 20
            Top = 206
            Width = 101
            Height = 42
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = #44428#54620#46321#47197
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btn_DepartGradeInsertClick
          end
          object btn_AlarmGradeDelete: TSpeedButton
            Left = 20
            Top = 293
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = #44428#54620#49325#51228
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btn_DoorGradeDeleteClick
          end
          object Panel33: TPanel
            Left = 1
            Top = 1
            Width = 138
            Height = 42
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #44428#54620#44288#47532
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -17
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 291
          Height = 581
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          TabOrder = 1
          object sg_Alarm: TAdvStringGrid
            Left = 1
            Top = 43
            Width = 289
            Height = 537
            Cursor = crDefault
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            ColCount = 4
            DefaultColWidth = 150
            DefaultRowHeight = 21
            DrawingStyle = gdsClassic
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing, goRowSelect]
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            HoverRowCells = [hcNormal, hcSelected]
            OnCheckBoxClick = CheckBoxClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #44221#48708#44396#50669' '#47749#52845
              #45432#46300#48264#54840
              'MCUID'
              'ECUID')
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDownClear = '(All)'
            FilterEdit.TypeNames.Strings = (
              'Starts with'
              'Ends with'
              'Contains'
              'Not contains'
              'Equal'
              'Not equal'
              'Clear')
            FixedColWidth = 194
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            Multilinecells = True
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            ScrollSynch = True
            SearchFooter.FindNextCaption = 'Find next'
            SearchFooter.FindPrevCaption = 'Find previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurence'
            SearchFooter.HintFindPrev = 'Find previous occurence'
            SearchFooter.HintHighlight = 'Highlight occurences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SortSettings.DefaultFormat = ssAutomatic
            Version = '7.2.8.0'
            ColWidths = (
              194
              116
              4
              150)
          end
          object Panel32: TPanel
            Left = 1
            Top = 1
            Width = 289
            Height = 42
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #44221#48708#44396#50669' '#47785#47197
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -17
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object Panel11: TPanel
          Left = 431
          Top = 0
          Width = 298
          Height = 581
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 2
          object sg_GradeAlarm: TAdvStringGrid
            Left = 1
            Top = 43
            Width = 295
            Height = 537
            Cursor = crDefault
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            ColCount = 4
            DefaultColWidth = 150
            DefaultRowHeight = 21
            DrawingStyle = gdsClassic
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing, goRowSelect]
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            HoverRowCells = [hcNormal, hcSelected]
            OnCheckBoxClick = CheckBoxClick
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ColumnHeaders.Strings = (
              #44221#48708#44396#50669' '#47749#52845
              #45432#46300#48264#54840
              'MCUID'
              'ECUID')
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDownClear = '(All)'
            FilterEdit.TypeNames.Strings = (
              'Starts with'
              'Ends with'
              'Contains'
              'Not contains'
              'Equal'
              'Not equal'
              'Clear')
            FixedColWidth = 207
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            ScrollSynch = True
            SearchFooter.FindNextCaption = 'Find next'
            SearchFooter.FindPrevCaption = 'Find previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurence'
            SearchFooter.HintFindPrev = 'Find previous occurence'
            SearchFooter.HintHighlight = 'Highlight occurences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SortSettings.DefaultFormat = ssAutomatic
            Version = '7.2.8.0'
            ColWidths = (
              207
              128
              3
              150)
          end
          object Panel34: TPanel
            Left = 1
            Top = 1
            Width = 295
            Height = 42
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #44221#48708#44396#50669#44288#47532#44428#54620
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -17
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
  end
  object MenuImageList16: TImageList
    BkColor = clWhite
    DrawingStyle = dsTransparent
    Left = 240
    Top = 184
    Bitmap = {
      494C010103009400C80110001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000707071E898989D7ACACACFFABAB
      ABFFACACACFFABACABFFABABACFFACABABFFACABABFFABABABFFABACABFFABAB
      ABFFACABABFFABABABFFA8A8A8FC4646467EFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFF00E9E8EA00C1C1C100C1C2C000E7E7E700FFFEFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A19B00997964008B4A
      23008B4A23008B4A23008B4A23008B4A23008B4A23008B4A23008B4A23008B4A
      23008E553300A4A19B00A4A19B00A4A19B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001414145EEFEFEFFFD5D6D6FFEBEB
      EBFFEAEAEBFFEBEAEAFFEAEAEAFFEBEBEBFFEAEBEBFFEAEAEBFFEBEAEAFFEBEB
      EAFFEAEBEBFFEAEAEAFFE1E1E1FFA6A6A6FAFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFF00E5DED500C26E0E00C16E1200D8C7B400FEFDFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A19B0099786300B581
      5400EFD09B00EFD09B00EFD09B00EFD09B00EFD09B00EFD09B00DCB684008B48
      20008B4821008E553300A4A19B00A4A19B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000015151561F8F8F8FFE5E5E6FFE3E4
      E5FFD4CBC1FFD4CCC2FFD7D3CDFFE7E7E8FFE7E6E6FFE5E5E6FFD4CBC1FFD4CC
      C2FFD8D8D7FFE8E7E7FFE7E7E7FFB0B0B0FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F9FFFA00EDE3D900C46F1300BB6F0B00CCB49C00FFFDFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A19B0099786300B885
      5800F6DAA400F6DAA400F6DAA400F6DAA400F6DAA400F6DAA400E2BE8B00995A
      3300D9AB8E008B4821008F563300A4A19B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000015151561F7F7F7FFE4E4E3FFD3C9
      BEFFC26D0AFFC26E0DFFC18136FFE5E5E5FFE4E4E4FFDCDDDFFFC26A05FFC26E
      0DFFC06F12FFE6E8EAFFE5E5E5FFAFAFAFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ECE3D600C36F0F00C36F1000CBB39B00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007879700081634B00B885
      5800F8E6C200D9C0AD00B6835600F7E2BA00E3D0C000AD774B00E2BE8B009B5D
      3600ECC3A900D8AB8E008A4B2400787970000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000015151561F6F5F5FFE0E0E1FFCFC4
      B7FFC26E0EFFC26F10FFC18037FFE2E2E2FFE0E0E0FFD8D9D9FFC26C09FFC26F
      10FFC07016FFE2E4E7FFE1E1E2FFAEAEAEFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EEE2D800C16F1000C36F1000CBB39B00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001E191C0045211A00B885
      5800D4AD7E00965A3700AD774B00DCB88800985D3A00A3693E00E2BE8B009B5D
      3600EEC6AC00E4BA9F0084451E001E191C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000014141461F4F4F4FFDDDCDDFFCDBF
      AFFFC26E0EFFC26F10FFC07E33FFDFE3E5FFDEE1E2FFD6D8D9FFC26C0AFFC26F
      10FFC06F12FFDFE1E4FFDDDDDDFFADADADFFFFFFFF00FFFFFF00FFFFFF00FDFF
      FF00FEFEFE00F5F4F600EEE2D600C26E0E00C36E1200C9B29C00EFF2F000FDFD
      FD00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00332B0300B885
      5800EECF9A00E1BD8A00E7C69200EFD19C00E1BD8A00E5C49000E2BE8B009B5D
      3600EEC6AC00E4BA9F0083441E00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000013131361F3F3F3FFD7D8D8FFC6A7
      83FFC26F10FFC26F10FFC26E0EFFC07218FFC07218FFC07013FFC26F10FFC26F
      10FFC16C0BFFD1D3D5FFDADADAFFADADADFFFFFFFF00FFFFFF00FFFFFF00FCFF
      FD00FAF8F800D4A87900F1E2D200BE6F0E00C1700F00CAB09200D0A37000F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00332B0300B885
      5800F8E4BF00DCC3AC00BD8D5F00F7E1B800E5D1BD00B5825500E2BE8B009B5D
      3600EEC6AC00E4BA9F0083441E00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000013131361F2F2F2FFC7B095FFC26E
      0EFFC26F10FFC26F10FFC26F10FFC26F10FFC26F10FFC26F10FFC26F10FFC26F
      10FFC26F10FFC06700FFD7DADFFFADADADFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFDFC00C06D1100C06E0F00C36F0F00C4701100C36F1000C46D0F00F9F9
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00332B0300B885
      5800D8B487009E664400AD774B00DFBD8E00A16A4A00A3693E00E2BE8B009B5D
      3600EEC6AC00E4BA9F0083441E00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000013131361F1F1F0FFD0D3D6FFBF7D
      30FFC26F10FFC26F10FFC26F10FFC26F10FFC26F10FFC26F10FFC26F10FFC26F
      10FFC26B06FFC7C1BCFFD2D2D2FFABABABFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C4925600C36E1200C36F0F00C36F0F00C36F1000C6915800FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00332B0300B885
      5800EAC99500D6AF7D00E0BD8A00ECCD9800D6AF7D00DDB98600E2BE8B009B5D
      3600EEC6AC00E4BA9F0083441E00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000013131361EFEFEFFFCCCCCDFFCCD1
      D5FFC07621FFC26F10FFC26F10FFC26F10FFC26F10FFC26F10FFC26F10FFC26B
      08FFC3BBB0FFCDCCCDFFCDCECEFFABABABFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00DDDBDB00C36F1000C66F1100C16F1000C2711000DADBD900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00332B0300995B
      3200AD774A00AD774A00AD774A00AD774A00AD774A00AD774A00A76E42009B5D
      3600EEC6AC00E4BA9F0083441E00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000013131361EEEDEDFFC9C8C9FFC9C9
      C9FFC8CDD2FFC07219FFC26F10FFC26F10FFC26F10FFC26F10FFC26C0AFFC1B1
      A0FFC9C9C9FFC9C8C9FFCAC9CAFFAAAAAAFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFE00E6ECE700C36E1200C46F1300BD6F0B00C26E0F00EFEBF100FFFF
      FE00FEFDFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00332B03009E5C
      1B00BA791500BA791500BA791500BA791500BA791500BA791500B17016009B5D
      3600EEC6AC00E4BA9F0083441E00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000012121261ECECECFFC4C5C5FFC5C6
      C5FFC5C4C5FFC4C9CFFFC16F12FFC26F10FFC26F10FFC26D0BFFBFAA91FFC6C6
      C6FFC6C5C5FFC6C5C5FFC7C7C6FFA9A9A9FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD00BD7C3200C56E1000C16E1300BD7B3400FDFEFC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00140708006931
      1C00B8781500D5950F00D5950F00D5950F00D5950F00D5950F00CF8F1000B777
      1F00B8826100E4BA9F0083441E00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000012121261EBEBEBFFC1C2C2FFC2C2
      C2FFC2C2C3FFC2C2C1FFC1C6CAFFC16C0AFFC26904FFBE9F7BFFC2C2C3FFC2C3
      C2FFC1C2C2FFC3C2C2FFC3C3C3FFA9A9A9FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD00CBCBCB00C46E1400C16F1000CFCCCE00FEFDFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001407
      080069301C00B9781500D5950F00D5950F00D5950F00D5950F00D5950F00CF8F
      1000B5751E00B077550083441E00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000012121261ECEBEBFF9E9E9EFFBFBE
      BEFFBEBFBEFFBEBEBEFFBEBEBEFFBFC3C7FFBFC3C9FFBFBFBFFFBEBFBEFFBEBF
      BFFFBFBFBEFFBDBCBDFFB2B1B2FFA7A7A7FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFF00EDE3D900C26E0E00C76D1400CAB29A00FBFEFC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001407080069311C00AC6A1800AC6A1800AC6A1800AC6A1800AC6A1800AC6A
      1800A866190083441E0037150000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D0D0D44D0D0D0FFEBEBEBFFEAEA
      EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
      EAFFEAEAEAFFEAEAEAFFE5E5E5FF797979D3FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFF00F2F4F400C26E0F00C16F1000EEF0F100FFFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001B0708004F2902004F2902004F2902004F2902004F2902004F29
      02004F29020031140300FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000040C0C0C411010105D1010
      105C1010105C1010105C1010105C1010105C1010105C1010105C1010105C1010
      105C1010105C1010105C101010580505051CFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00FFFFFE00FFFEFE00FEFDFF00FFFFFF00FCFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000800000000000000080000000
      00000000800000000000000080000000000000008000000000000000C0010000
      00000000C001000000000000C001000000000000C001000000000000C0010000
      00000000C001000000000000C001000000000000E001000000000000F0010000
      00000000F803000000000000FFFF000000000000000000000000000000000000
      000000000000}
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
    Style = bsOffice2010Silver
    BackGroundDisplay = bdStretch
    BorderColor = 13087391
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
    Color.ColorTo = 15590880
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
    DockColor.Color = 15590880
    DockColor.ColorTo = clWhite
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    FloatingWindowBorderColor = 13486790
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 13815240
    GlowButtonAppearance.BorderColorHot = 5819121
    GlowButtonAppearance.BorderColorDown = 3181250
    GlowButtonAppearance.BorderColorChecked = 3181250
    GlowButtonAppearance.ColorTo = 15590880
    GlowButtonAppearance.ColorChecked = 14285309
    GlowButtonAppearance.ColorCheckedTo = 7131391
    GlowButtonAppearance.ColorDisabled = clNone
    GlowButtonAppearance.ColorDisabledTo = clNone
    GlowButtonAppearance.ColorDown = 7131391
    GlowButtonAppearance.ColorDownTo = 8122111
    GlowButtonAppearance.ColorHot = 9102333
    GlowButtonAppearance.ColorHotTo = 14285309
    GlowButtonAppearance.ColorMirror = 15590880
    GlowButtonAppearance.ColorMirrorTo = 15590880
    GlowButtonAppearance.ColorMirrorHot = 14285309
    GlowButtonAppearance.ColorMirrorHotTo = 9102333
    GlowButtonAppearance.ColorMirrorDown = 8122111
    GlowButtonAppearance.ColorMirrorDownTo = 7131391
    GlowButtonAppearance.ColorMirrorChecked = 7131391
    GlowButtonAppearance.ColorMirrorCheckedTo = 7131391
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
    RightHandleColor = clWhite
    RightHandleColorTo = 15590880
    RightHandleColorHot = 14285309
    RightHandleColorHotTo = 9102333
    RightHandleColorDown = 8122111
    RightHandleColorDownTo = 7131391
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
    Left = 300
    Top = 4
  end
  object AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler
    ButtonBorderColor = clNone
    GlowButtonAppearance.BorderColor = 13087391
    GlowButtonAppearance.BorderColorHot = 5819121
    GlowButtonAppearance.BorderColorDown = 3181250
    GlowButtonAppearance.BorderColorChecked = 3181250
    GlowButtonAppearance.Color = 16643823
    GlowButtonAppearance.ColorTo = 15784647
    GlowButtonAppearance.ColorChecked = 14285309
    GlowButtonAppearance.ColorCheckedTo = 7131391
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7131391
    GlowButtonAppearance.ColorDownTo = 8122111
    GlowButtonAppearance.ColorHot = 9102333
    GlowButtonAppearance.ColorHotTo = 14285309
    GlowButtonAppearance.ColorMirror = 15784647
    GlowButtonAppearance.ColorMirrorTo = 15784647
    GlowButtonAppearance.ColorMirrorHot = 14285309
    GlowButtonAppearance.ColorMirrorHotTo = 9102333
    GlowButtonAppearance.ColorMirrorDown = 8122111
    GlowButtonAppearance.ColorMirrorDownTo = 7131391
    GlowButtonAppearance.ColorMirrorChecked = 7131391
    GlowButtonAppearance.ColorMirrorCheckedTo = 7131391
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    Style = tsOffice2010Blue
    TabAppearance.BorderColor = 13087391
    TabAppearance.BorderColorHot = 12236209
    TabAppearance.BorderColorSelected = 13087391
    TabAppearance.BorderColorSelectedHot = 13087391
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 15784647
    TabAppearance.ColorSelectedTo = 15784647
    TabAppearance.ColorDisabled = 15921906
    TabAppearance.ColorDisabledTo = 15921906
    TabAppearance.ColorHot = 15920100
    TabAppearance.ColorHotTo = 15920100
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 15920100
    TabAppearance.ColorMirrorHotTo = 15920100
    TabAppearance.ColorMirrorSelected = 15784647
    TabAppearance.ColorMirrorSelectedTo = 15784647
    TabAppearance.ColorMirrorDisabled = 15921906
    TabAppearance.ColorMirrorDisabledTo = 15921906
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
    TabAppearance.ShadowColor = 13087391
    TabAppearance.HighLightColorSelected = 13087391
    TabAppearance.HighLightColorHot = 16643823
    TabAppearance.HighLightColorSelectedHot = 15784647
    TabAppearance.HighLightColorDown = 16181209
    TabAppearance.BackGround.Color = 15784647
    TabAppearance.BackGround.ColorTo = 16643823
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 264
  end
end
