object fmTelEventRegist: TfmTelEventRegist
  Left = 0
  Top = 0
  Caption = 'fmTelEventRegist'
  ClientHeight = 448
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 25
    Width = 64
    Height = 15
    Caption = #52636#51077#51088' '#51060#47492
  end
  object Label2: TLabel
    Left = 24
    Top = 52
    Width = 88
    Height = 15
    Caption = #52636#51077#51088' '#51204#54868#48264#54840
  end
  object Label3: TLabel
    Left = 24
    Top = 79
    Width = 64
    Height = 15
    Caption = #52636#51077#51088' '#49548#49549
  end
  object Label4: TLabel
    Left = 24
    Top = 102
    Width = 88
    Height = 15
    Caption = #52636#51077#51088' '#53945#51060#49324#54637
  end
  object btn_Save: TSpeedButton
    Left = 136
    Top = 392
    Width = 135
    Height = 33
    Caption = #51200#51109
    OnClick = btn_SaveClick
  end
  object btn_Cancel: TSpeedButton
    Left = 282
    Top = 392
    Width = 135
    Height = 33
    Caption = #52712#49548
    OnClick = btn_CancelClick
  end
  object Label6: TLabel
    Left = 24
    Top = 347
    Width = 48
    Height = 15
    Caption = #51077#47141#51088#47749
  end
  object ed_AccessName: TEdit
    Left = 136
    Top = 21
    Width = 281
    Height = 23
    TabOrder = 0
  end
  object ed_AccessTel: TEdit
    Left = 136
    Top = 48
    Width = 281
    Height = 23
    TabOrder = 1
  end
  object ed_CompanyName: TEdit
    Left = 136
    Top = 75
    Width = 281
    Height = 23
    TabOrder = 2
  end
  object mem_AcessMemo: TMemo
    Left = 136
    Top = 102
    Width = 281
    Height = 235
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object ed_InputName: TEdit
    Left = 136
    Top = 343
    Width = 281
    Height = 23
    TabOrder = 4
  end
end
