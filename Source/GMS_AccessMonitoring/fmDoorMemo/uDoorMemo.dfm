object fmDoorMemo: TfmDoorMemo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #52636#51077#47928' '#47700#47784
  ClientHeight = 332
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 70
    Height = 17
    Caption = #47924#51064#44397#49324' '#47749
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 26
    Height = 17
    Caption = #47700#47784
  end
  object btn_Save: TSpeedButton
    Left = 112
    Top = 271
    Width = 137
    Height = 34
    Caption = #51200#51109
    OnClick = btn_SaveClick
  end
  object btn_Cancel: TSpeedButton
    Left = 264
    Top = 271
    Width = 137
    Height = 34
    Caption = #52712#49548
    OnClick = btn_CancelClick
  end
  object ed_DoorName: TEdit
    Left = 112
    Top = 21
    Width = 289
    Height = 25
    ReadOnly = True
    TabOrder = 0
  end
  object mem_doorMemo: TMemo
    Left = 112
    Top = 56
    Width = 289
    Height = 193
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
