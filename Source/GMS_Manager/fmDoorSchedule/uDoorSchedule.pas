﻿unit uDoorSchedule;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSubForm, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, CommandArray, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, AdvSmoothLabel, AdvSmoothPanel, W7Classes,
  W7Panels, AdvGlassButton,ADODB,ActiveX, frmshape, AdvCombo, Vcl.Mask, AdvSpin,
  AdvGroupBox, AdvOfficeButtons, AdvSmoothTileList, AdvSmoothButton,
  AdvSmoothListBox, AdvEdBtn, Vcl.ComCtrls, Vcl.ImgList, AdvToolBar,
  AdvToolBarStylers, AdvGlowButton, AdvOfficePager, AdvAppStyler,
  AdvOfficePagerStylers, Vcl.Imaging.pngimage, Vcl.ExtCtrls, AdvScrollBox;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmDoorSchedule = class(TfmASubForm)
    List: TAdvSmoothPanel;
    lb_SearchName: TAdvSmoothLabel;
    sg_List: TAdvStringGrid;
    Add: TAdvSmoothPanel;
    Update: TAdvSmoothPanel;
    lb_SearchBuilding: TAdvSmoothLabel;
    AdvSmoothButton6: TAdvSmoothButton;
    AdvSmoothButton7: TAdvSmoothButton;
    AdvSmoothButton8: TAdvSmoothButton;
    AdvSmoothButton9: TAdvSmoothButton;
    AdvSmoothPanel1: TAdvSmoothPanel;
    cmb_W1HH: TComboBox;
    cmb_W1MM: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cmb_AddW1Mode: TComboBox;
    AdvSmoothPanel2: TAdvSmoothPanel;
    Label3: TLabel;
    Label4: TLabel;
    cmb_W2HH: TComboBox;
    cmb_W2MM: TComboBox;
    cmb_AddW2Mode: TComboBox;
    AdvSmoothPanel3: TAdvSmoothPanel;
    Label5: TLabel;
    Label6: TLabel;
    cmb_W3HH: TComboBox;
    cmb_W3MM: TComboBox;
    cmb_AddW3Mode: TComboBox;
    AdvSmoothPanel4: TAdvSmoothPanel;
    Label7: TLabel;
    Label8: TLabel;
    cmb_W4HH: TComboBox;
    cmb_W4MM: TComboBox;
    cmb_AddW4Mode: TComboBox;
    AdvSmoothPanel5: TAdvSmoothPanel;
    Label9: TLabel;
    Label10: TLabel;
    ComboBox13: TComboBox;
    ComboBox14: TComboBox;
    cmb_AddW5Mode: TComboBox;
    AdvSmoothPanel6: TAdvSmoothPanel;
    Label11: TLabel;
    Label12: TLabel;
    cmb_S1HH: TComboBox;
    cmb_S1MM: TComboBox;
    cmb_AddS1Mode: TComboBox;
    AdvSmoothPanel7: TAdvSmoothPanel;
    Label13: TLabel;
    Label14: TLabel;
    cmb_S2HH: TComboBox;
    cmb_S2MM: TComboBox;
    cmb_AddS2Mode: TComboBox;
    AdvSmoothPanel8: TAdvSmoothPanel;
    Label15: TLabel;
    Label16: TLabel;
    cmb_S3HH: TComboBox;
    cmb_S3MM: TComboBox;
    cmb_AddS3Mode: TComboBox;
    AdvSmoothPanel9: TAdvSmoothPanel;
    Label17: TLabel;
    Label18: TLabel;
    cmb_S4HH: TComboBox;
    cmb_S4MM: TComboBox;
    cmb_AddS4Mode: TComboBox;
    AdvSmoothPanel10: TAdvSmoothPanel;
    Label19: TLabel;
    Label20: TLabel;
    ComboBox28: TComboBox;
    ComboBox29: TComboBox;
    cmb_AddS5Mode: TComboBox;
    AdvSmoothPanel11: TAdvSmoothPanel;
    Label21: TLabel;
    Label22: TLabel;
    cmb_N1HH: TComboBox;
    cmb_N1MM: TComboBox;
    cmb_AddN1Mode: TComboBox;
    AdvSmoothPanel12: TAdvSmoothPanel;
    Label23: TLabel;
    Label24: TLabel;
    cmb_N2HH: TComboBox;
    cmb_N2MM: TComboBox;
    cmb_AddN2Mode: TComboBox;
    AdvSmoothPanel13: TAdvSmoothPanel;
    Label25: TLabel;
    Label26: TLabel;
    cmb_N3HH: TComboBox;
    cmb_N3MM: TComboBox;
    cmb_AddN3Mode: TComboBox;
    AdvSmoothPanel14: TAdvSmoothPanel;
    Label27: TLabel;
    Label28: TLabel;
    cmb_N4HH: TComboBox;
    cmb_N4MM: TComboBox;
    cmb_AddN4Mode: TComboBox;
    AdvSmoothPanel15: TAdvSmoothPanel;
    Label29: TLabel;
    Label30: TLabel;
    ComboBox43: TComboBox;
    ComboBox44: TComboBox;
    cmb_AddN5Mode: TComboBox;
    AdvSmoothPanel16: TAdvSmoothPanel;
    Label31: TLabel;
    Label32: TLabel;
    cmb_H1HH: TComboBox;
    cmb_H1MM: TComboBox;
    cmb_AddH1Mode: TComboBox;
    AdvSmoothPanel17: TAdvSmoothPanel;
    Label33: TLabel;
    Label34: TLabel;
    cmb_H2HH: TComboBox;
    cmb_H2MM: TComboBox;
    cmb_AddH2Mode: TComboBox;
    AdvSmoothPanel18: TAdvSmoothPanel;
    Label35: TLabel;
    Label36: TLabel;
    cmb_H3HH: TComboBox;
    cmb_H3MM: TComboBox;
    cmb_AddH3Mode: TComboBox;
    AdvSmoothPanel19: TAdvSmoothPanel;
    Label37: TLabel;
    Label38: TLabel;
    cmb_H4HH: TComboBox;
    cmb_H4MM: TComboBox;
    cmb_AddH4Mode: TComboBox;
    AdvSmoothPanel20: TAdvSmoothPanel;
    Label39: TLabel;
    Label40: TLabel;
    ComboBox58: TComboBox;
    ComboBox59: TComboBox;
    cmb_AddH5Mode: TComboBox;
    btn_AddSave: TAdvGlassButton;
    btn_AddTimeInitialize: TAdvGlassButton;
    btn_AddAllManager: TAdvGlassButton;
    btn_AddAllOpenMode: TAdvGlassButton;
    btn_AddAllClose: TAdvGlassButton;
    AdvSmoothButton1: TAdvSmoothButton;
    AdvSmoothButton2: TAdvSmoothButton;
    AdvSmoothButton3: TAdvSmoothButton;
    AdvSmoothButton4: TAdvSmoothButton;
    AdvSmoothPanel21: TAdvSmoothPanel;
    Label41: TLabel;
    Label42: TLabel;
    cmb_UpdateW1HH: TComboBox;
    cmb_UpdateW1MM: TComboBox;
    cmb_UpdateW1MODE: TComboBox;
    AdvSmoothPanel22: TAdvSmoothPanel;
    Label43: TLabel;
    Label44: TLabel;
    cmb_UpdateS1HH: TComboBox;
    cmb_UpdateS1MM: TComboBox;
    cmb_UpdateS1MODE: TComboBox;
    AdvSmoothPanel23: TAdvSmoothPanel;
    Label45: TLabel;
    Label46: TLabel;
    cmb_UpdateN1HH: TComboBox;
    cmb_UpdateN1MM: TComboBox;
    cmb_UpdateN1MODE: TComboBox;
    AdvSmoothPanel24: TAdvSmoothPanel;
    Label47: TLabel;
    Label48: TLabel;
    cmb_UpdateH1HH: TComboBox;
    cmb_UpdateH1MM: TComboBox;
    cmb_UpdateH1MODE: TComboBox;
    AdvSmoothPanel25: TAdvSmoothPanel;
    Label49: TLabel;
    Label50: TLabel;
    cmb_UpdateH2HH: TComboBox;
    cmb_UpdateH2MM: TComboBox;
    cmb_UpdateH2MODE: TComboBox;
    AdvSmoothPanel26: TAdvSmoothPanel;
    Label51: TLabel;
    Label52: TLabel;
    cmb_UpdateN2HH: TComboBox;
    cmb_UpdateN2MM: TComboBox;
    cmb_UpdateN2MODE: TComboBox;
    AdvSmoothPanel27: TAdvSmoothPanel;
    Label53: TLabel;
    Label54: TLabel;
    cmb_UpdateS2HH: TComboBox;
    cmb_UpdateS2MM: TComboBox;
    cmb_UpdateS2MODE: TComboBox;
    AdvSmoothPanel28: TAdvSmoothPanel;
    Label55: TLabel;
    Label56: TLabel;
    cmb_UpdateW2HH: TComboBox;
    cmb_UpdateW2MM: TComboBox;
    cmb_UpdateW2MODE: TComboBox;
    AdvSmoothPanel29: TAdvSmoothPanel;
    Label57: TLabel;
    Label58: TLabel;
    cmb_UpdateW3HH: TComboBox;
    cmb_UpdateW3MM: TComboBox;
    cmb_UpdateW3MODE: TComboBox;
    AdvSmoothPanel30: TAdvSmoothPanel;
    Label59: TLabel;
    Label60: TLabel;
    cmb_UpdateS3HH: TComboBox;
    cmb_UpdateS3MM: TComboBox;
    cmb_UpdateS3MODE: TComboBox;
    AdvSmoothPanel31: TAdvSmoothPanel;
    Label61: TLabel;
    Label62: TLabel;
    cmb_UpdateN3HH: TComboBox;
    cmb_UpdateN3MM: TComboBox;
    cmb_UpdateN3MODE: TComboBox;
    AdvSmoothPanel32: TAdvSmoothPanel;
    Label63: TLabel;
    Label64: TLabel;
    cmb_UpdateH3HH: TComboBox;
    cmb_UpdateH3MM: TComboBox;
    cmb_UpdateH3MODE: TComboBox;
    AdvSmoothPanel33: TAdvSmoothPanel;
    Label65: TLabel;
    Label66: TLabel;
    cmb_UpdateH4HH: TComboBox;
    cmb_UpdateH4MM: TComboBox;
    cmb_UpdateH4MODE: TComboBox;
    AdvSmoothPanel34: TAdvSmoothPanel;
    Label67: TLabel;
    Label68: TLabel;
    cmb_UpdateH5HH: TComboBox;
    cmb_UpdateH5MM: TComboBox;
    cmb_UpdateH5MODE: TComboBox;
    AdvSmoothPanel35: TAdvSmoothPanel;
    Label69: TLabel;
    Label70: TLabel;
    cmb_UpdateN5HH: TComboBox;
    cmb_UpdateN5MM: TComboBox;
    cmb_UpdateN5MODE: TComboBox;
    AdvSmoothPanel36: TAdvSmoothPanel;
    Label71: TLabel;
    Label72: TLabel;
    cmb_UpdateN4HH: TComboBox;
    cmb_UpdateN4MM: TComboBox;
    cmb_UpdateN4MODE: TComboBox;
    AdvSmoothPanel37: TAdvSmoothPanel;
    Label73: TLabel;
    Label74: TLabel;
    cmb_UpdateS4HH: TComboBox;
    cmb_UpdateS4MM: TComboBox;
    cmb_UpdateS4MODE: TComboBox;
    AdvSmoothPanel38: TAdvSmoothPanel;
    Label75: TLabel;
    Label76: TLabel;
    cmb_UpdateS5HH: TComboBox;
    cmb_UpdateS5MM: TComboBox;
    cmb_UpdateS5MODE: TComboBox;
    AdvSmoothPanel39: TAdvSmoothPanel;
    Label77: TLabel;
    Label78: TLabel;
    cmb_UpdateW5HH: TComboBox;
    cmb_UpdateW5MM: TComboBox;
    cmb_UpdateW5MODE: TComboBox;
    AdvSmoothPanel40: TAdvSmoothPanel;
    Label79: TLabel;
    Label80: TLabel;
    cmb_UpdateW4HH: TComboBox;
    cmb_UpdateW4MM: TComboBox;
    cmb_UpdateW4MODE: TComboBox;
    btn_UpdateSave: TAdvGlassButton;
    AdvGlassButton2: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    btn_UpdateAllManager: TAdvGlassButton;
    btn_UpdateTimeInitialize: TAdvGlassButton;
    eb_BuildingName: TAdvEditBtn;
    tv_buildingCode: TTreeView;
    MenuImageList16: TImageList;
    ed_BuildingCode: TAdvEdit;
    ed_SearchName: TAdvEdit;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    ed_UpdateNodeNoCode: TAdvEdit;
    ed_UpdateEcuCode: TAdvEdit;
    ed_UpdateDoorCode: TAdvEdit;
    lb_List: TLabel;
    btn_Search: TAdvGlowButton;
    btn_Add: TAdvGlowButton;
    tv_buildingName: TTreeView;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    sb_DoorSchedule: TAdvScrollBox;
    at_Week: TAdvOfficeTabSet;
    AdvGroupBox1: TAdvGroupBox;
    btn_TimeInit1: TAdvGlassButton;
    btn_DoorManageMode1: TAdvGlassButton;
    btn_DoorOpenMode1: TAdvGlassButton;
    btn_DoorLockMode1: TAdvGlassButton;
    Gb_WeekGroup: TAdvGroupBox;
    lb_Section11: TLabel;
    lb_StartHH11: TLabel;
    lb_StartMM11: TLabel;
    lb_EndHH11: TLabel;
    lb_EndMM11: TLabel;
    Label87: TLabel;
    lb_Section12: TLabel;
    lb_StartHH12: TLabel;
    lb_StartMM12: TLabel;
    Label91: TLabel;
    lb_EndHH12: TLabel;
    lb_EndMM12: TLabel;
    lb_Section13: TLabel;
    lb_StartHH13: TLabel;
    lb_StartMM13: TLabel;
    Label97: TLabel;
    lb_EndHH13: TLabel;
    lb_EndMM13: TLabel;
    lb_Section14: TLabel;
    lb_StartHH14: TLabel;
    lb_StartMM14: TLabel;
    Label103: TLabel;
    lb_EndHH14: TLabel;
    lb_EndMM14: TLabel;
    lb_Section15: TLabel;
    lb_StartHH15: TLabel;
    lb_StartMM15: TLabel;
    Label109: TLabel;
    lb_EndHH15: TLabel;
    lb_EndMM15: TLabel;
    lb_Mode11: TLabel;
    lb_Mode12: TLabel;
    lb_Mode13: TLabel;
    lb_Mode14: TLabel;
    lb_Mode15: TLabel;
    cmb_StartHH11: TAdvComboBox;
    cmb_StartMM11: TAdvComboBox;
    cmb_EndHH11: TAdvComboBox;
    cmb_EndMM11: TAdvComboBox;
    cmb_StartHH12: TAdvComboBox;
    cmb_StartMM12: TAdvComboBox;
    cmb_EndHH12: TAdvComboBox;
    cmb_EndMM12: TAdvComboBox;
    cmb_StartHH13: TAdvComboBox;
    cmb_StartMM13: TAdvComboBox;
    cmb_EndHH13: TAdvComboBox;
    cmb_EndMM13: TAdvComboBox;
    cmb_StartHH14: TAdvComboBox;
    cmb_StartMM14: TAdvComboBox;
    cmb_EndHH14: TAdvComboBox;
    cmb_EndMM14: TAdvComboBox;
    cmb_StartHH15: TAdvComboBox;
    cmb_StartMM15: TAdvComboBox;
    cmb_EndHH15: TAdvComboBox;
    cmb_EndMM15: TAdvComboBox;
    cmb_Mode11: TAdvComboBox;
    cmb_Mode12: TAdvComboBox;
    cmb_Mode13: TAdvComboBox;
    cmb_Mode14: TAdvComboBox;
    cmb_Mode15: TAdvComboBox;
    gb_Linew1: TAdvGroupBox;
    gb_Linew2: TAdvGroupBox;
    gb_Linew3: TAdvGroupBox;
    gb_Linew4: TAdvGroupBox;
    AdvOfficeTabSetOfficeStyler2: TAdvOfficeTabSetOfficeStyler;
    BodyPanel: TAdvSmoothPanel;
    at_Saturday: TAdvOfficeTabSet;
    AdvGroupBox2: TAdvGroupBox;
    btn_TimeInit2: TAdvGlassButton;
    btn_DoorManageMode2: TAdvGlassButton;
    btn_DoorOpenMode2: TAdvGlassButton;
    btn_DoorLockMode2: TAdvGlassButton;
    gb_Saturday: TAdvGroupBox;
    lb_Section21: TLabel;
    lb_StartHH21: TLabel;
    lb_StartMM21: TLabel;
    lb_EndHH21: TLabel;
    lb_EndMM21: TLabel;
    Label122: TLabel;
    lb_Section22: TLabel;
    lb_StartHH22: TLabel;
    lb_StartMM22: TLabel;
    Label126: TLabel;
    lb_EndHH22: TLabel;
    lb_Section23: TLabel;
    lb_StartHH23: TLabel;
    lb_StartMM23: TLabel;
    Label132: TLabel;
    lb_EndHH23: TLabel;
    lb_EndMM23: TLabel;
    lb_Section24: TLabel;
    lb_StartHH24: TLabel;
    lb_StartMM24: TLabel;
    Label138: TLabel;
    lb_EndHH24: TLabel;
    lb_EndMM24: TLabel;
    lb_Section25: TLabel;
    lb_StartHH25: TLabel;
    lb_StartMM25: TLabel;
    Label144: TLabel;
    lb_EndHH25: TLabel;
    lb_EndMM25: TLabel;
    lb_Mode21: TLabel;
    lb_Mode22: TLabel;
    lb_Mode23: TLabel;
    lb_Mode24: TLabel;
    lb_Mode25: TLabel;
    cmb_StartHH21: TAdvComboBox;
    cmb_StartMM21: TAdvComboBox;
    cmb_EndHH21: TAdvComboBox;
    cmb_EndMM21: TAdvComboBox;
    cmb_StartHH22: TAdvComboBox;
    cmb_StartMM22: TAdvComboBox;
    cmb_EndHH22: TAdvComboBox;
    cmb_EndMM22: TAdvComboBox;
    cmb_StartHH23: TAdvComboBox;
    cmb_StartMM23: TAdvComboBox;
    cmb_EndHH23: TAdvComboBox;
    cmb_EndMM23: TAdvComboBox;
    cmb_StartHH24: TAdvComboBox;
    cmb_StartMM24: TAdvComboBox;
    cmb_EndHH24: TAdvComboBox;
    cmb_EndMM24: TAdvComboBox;
    cmb_StartHH25: TAdvComboBox;
    cmb_StartMM25: TAdvComboBox;
    cmb_EndHH25: TAdvComboBox;
    cmb_EndMM25: TAdvComboBox;
    cmb_Mode21: TAdvComboBox;
    cmb_Mode22: TAdvComboBox;
    cmb_Mode23: TAdvComboBox;
    cmb_Mode24: TAdvComboBox;
    cmb_Mode25: TAdvComboBox;
    AdvGroupBox4: TAdvGroupBox;
    AdvGroupBox5: TAdvGroupBox;
    AdvGroupBox6: TAdvGroupBox;
    AdvGroupBox7: TAdvGroupBox;
    at_Sunday: TAdvOfficeTabSet;
    AdvGroupBox8: TAdvGroupBox;
    btn_TimeInit3: TAdvGlassButton;
    btn_DoorManageMode3: TAdvGlassButton;
    btn_DoorOpenMode3: TAdvGlassButton;
    btn_DoorLockMode3: TAdvGlassButton;
    gb_sunday: TAdvGroupBox;
    lb_Section31: TLabel;
    lb_StartHH31: TLabel;
    lb_StartMM31: TLabel;
    lb_EndHH31: TLabel;
    lb_EndMM31: TLabel;
    Label157: TLabel;
    lb_Section32: TLabel;
    lb_StartHH32: TLabel;
    lb_StartMM32: TLabel;
    Label161: TLabel;
    lb_EndHH32: TLabel;
    lb_EndMM32: TLabel;
    lb_Section33: TLabel;
    lb_StartHH33: TLabel;
    lb_StartMM33: TLabel;
    Label167: TLabel;
    lb_EndHH33: TLabel;
    lb_EndMM33: TLabel;
    lb_Section34: TLabel;
    lb_StartHH34: TLabel;
    lb_StartMM34: TLabel;
    Label173: TLabel;
    lb_EndHH34: TLabel;
    lb_EndMM34: TLabel;
    lb_Section35: TLabel;
    lb_StartHH35: TLabel;
    lb_StartMM35: TLabel;
    Label179: TLabel;
    lb_EndHH35: TLabel;
    lb_EndMM35: TLabel;
    lb_Mode31: TLabel;
    lb_Mode32: TLabel;
    lb_Mode33: TLabel;
    lb_Mode34: TLabel;
    lb_Mode35: TLabel;
    cmb_StartHH31: TAdvComboBox;
    cmb_StartMM31: TAdvComboBox;
    cmb_EndHH31: TAdvComboBox;
    cmb_EndMM31: TAdvComboBox;
    cmb_StartHH32: TAdvComboBox;
    cmb_StartMM32: TAdvComboBox;
    cmb_EndHH32: TAdvComboBox;
    cmb_EndMM32: TAdvComboBox;
    cmb_StartHH33: TAdvComboBox;
    cmb_StartMM33: TAdvComboBox;
    cmb_EndHH33: TAdvComboBox;
    cmb_EndMM33: TAdvComboBox;
    cmb_StartHH34: TAdvComboBox;
    cmb_StartMM34: TAdvComboBox;
    cmb_EndHH34: TAdvComboBox;
    cmb_EndMM34: TAdvComboBox;
    cmb_StartHH35: TAdvComboBox;
    cmb_StartMM35: TAdvComboBox;
    cmb_EndHH35: TAdvComboBox;
    cmb_EndMM35: TAdvComboBox;
    cmb_Mode31: TAdvComboBox;
    cmb_Mode32: TAdvComboBox;
    cmb_Mode33: TAdvComboBox;
    cmb_Mode34: TAdvComboBox;
    cmb_Mode35: TAdvComboBox;
    AdvGroupBox10: TAdvGroupBox;
    AdvGroupBox11: TAdvGroupBox;
    AdvGroupBox12: TAdvGroupBox;
    AdvGroupBox13: TAdvGroupBox;
    at_Holiday: TAdvOfficeTabSet;
    AdvGroupBox14: TAdvGroupBox;
    btn_TimeInit4: TAdvGlassButton;
    btn_DoorManageMode4: TAdvGlassButton;
    btn_DoorOpenMode4: TAdvGlassButton;
    btn_DoorLockMode4: TAdvGlassButton;
    gb_holiday: TAdvGroupBox;
    lb_Section41: TLabel;
    lb_StartHH41: TLabel;
    lb_StartMM41: TLabel;
    lb_EndHH41: TLabel;
    lb_EndMM41: TLabel;
    Label192: TLabel;
    lb_Section42: TLabel;
    lb_StartHH42: TLabel;
    lb_StartMM42: TLabel;
    Label196: TLabel;
    lb_EndHH42: TLabel;
    lb_EndMM42: TLabel;
    lb_Section43: TLabel;
    lb_StartHH43: TLabel;
    lb_StartMM43: TLabel;
    Label202: TLabel;
    lb_EndHH43: TLabel;
    lb_EndMM43: TLabel;
    lb_Section44: TLabel;
    lb_StartHH44: TLabel;
    lb_StartMM44: TLabel;
    Label208: TLabel;
    lb_EndHH44: TLabel;
    lb_EndMM44: TLabel;
    lb_Section45: TLabel;
    lb_StartHH45: TLabel;
    lb_StartMM45: TLabel;
    Label214: TLabel;
    lb_EndHH45: TLabel;
    lb_EndMM45: TLabel;
    lb_Mode41: TLabel;
    lb_Mode42: TLabel;
    lb_Mode43: TLabel;
    lb_Mode44: TLabel;
    lb_Mode45: TLabel;
    cmb_StartHH41: TAdvComboBox;
    cmb_StartMM41: TAdvComboBox;
    cmb_EndHH41: TAdvComboBox;
    cmb_EndMM41: TAdvComboBox;
    cmb_StartHH42: TAdvComboBox;
    cmb_StartMM42: TAdvComboBox;
    cmb_EndHH42: TAdvComboBox;
    cmb_EndMM42: TAdvComboBox;
    cmb_StartHH43: TAdvComboBox;
    cmb_StartMM43: TAdvComboBox;
    cmb_EndHH43: TAdvComboBox;
    cmb_EndMM43: TAdvComboBox;
    cmb_StartHH44: TAdvComboBox;
    cmb_StartMM44: TAdvComboBox;
    cmb_EndHH44: TAdvComboBox;
    cmb_EndMM44: TAdvComboBox;
    cmb_StartHH45: TAdvComboBox;
    cmb_StartMM45: TAdvComboBox;
    cmb_EndHH45: TAdvComboBox;
    cmb_EndMM45: TAdvComboBox;
    cmb_Mode41: TAdvComboBox;
    cmb_Mode42: TAdvComboBox;
    cmb_Mode43: TAdvComboBox;
    cmb_Mode44: TAdvComboBox;
    cmb_Mode45: TAdvComboBox;
    AdvGroupBox16: TAdvGroupBox;
    AdvGroupBox17: TAdvGroupBox;
    AdvGroupBox18: TAdvGroupBox;
    AdvGroupBox19: TAdvGroupBox;
    pan_Schedule: TAdvSmoothPanel;
    lb_ScheuleWork: TLabel;
    btn_ScheduleSave: TAdvGlowButton;
    btn_ScheduleCancel: TAdvGlowButton;
    lb_EndMM22: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_AddSaveClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_ListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_ListDblClick(Sender: TObject);
    procedure ed_SearchNameChange(Sender: TObject);
    procedure btn_UpdateSaveClick(Sender: TObject);
    procedure ed_InsertNameKeyPress(Sender: TObject; var Key: Char);
    procedure ed_UpdateNameKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_SearchAreaChange(Sender: TObject);
    procedure cmb_AddW1ModeChange(Sender: TObject);
    procedure btn_AddTimeInitializeClick(Sender: TObject);
    procedure btn_AddAllManagerClick(Sender: TObject);
    procedure btn_UpdateTimeInitializeClick(Sender: TObject);
    procedure btn_UpdateAllManagerClick(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure sb_DoorScheduleResize(Sender: TObject);
    procedure sb_DoorScheduleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pan_ScheduleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pan_ScheduleResize(Sender: TObject);
    procedure btn_ScheduleCancelClick(Sender: TObject);
    procedure btn_TimeInit1Click(Sender: TObject);
    procedure cmb_EndHH11Change(Sender: TObject);
    procedure cmb_StartHH12Change(Sender: TObject);
    procedure cmb_EndHH12Change(Sender: TObject);
    procedure cmb_StartHH13Change(Sender: TObject);
    procedure cmb_EndHH13Change(Sender: TObject);
    procedure cmb_StartHH14Change(Sender: TObject);
    procedure cmb_EndHH14Change(Sender: TObject);
    procedure cmb_StartHH15Change(Sender: TObject);
    procedure cmb_EndMM11Change(Sender: TObject);
    procedure cmb_StartMM12Change(Sender: TObject);
    procedure cmb_EndMM12Change(Sender: TObject);
    procedure cmb_EndMM13Change(Sender: TObject);
    procedure cmb_EndMM14Change(Sender: TObject);
    procedure cmb_StartMM15Change(Sender: TObject);
    procedure cmb_StartMM14Change(Sender: TObject);
    procedure cmb_StartMM13Change(Sender: TObject);
    procedure cmb_EndHH21Change(Sender: TObject);
    procedure cmb_EndHH22Change(Sender: TObject);
    procedure cmb_EndHH23Change(Sender: TObject);
    procedure cmb_EndHH24Change(Sender: TObject);
    procedure cmb_StartHH25Change(Sender: TObject);
    procedure cmb_StartHH24Change(Sender: TObject);
    procedure cmb_StartHH23Change(Sender: TObject);
    procedure cmb_StartHH22Change(Sender: TObject);
    procedure cmb_EndMM21Change(Sender: TObject);
    procedure cmb_EndMM22Change(Sender: TObject);
    procedure cmb_EndMM23Change(Sender: TObject);
    procedure cmb_EndMM24Change(Sender: TObject);
    procedure cmb_StartMM25Change(Sender: TObject);
    procedure cmb_StartMM24Change(Sender: TObject);
    procedure cmb_StartMM23Change(Sender: TObject);
    procedure cmb_StartMM22Change(Sender: TObject);
    procedure cmb_EndHH31Change(Sender: TObject);
    procedure cmb_EndHH32Change(Sender: TObject);
    procedure cmb_EndHH33Change(Sender: TObject);
    procedure cmb_EndHH34Change(Sender: TObject);
    procedure cmb_StartHH35Change(Sender: TObject);
    procedure cmb_StartHH34Change(Sender: TObject);
    procedure cmb_StartHH33Change(Sender: TObject);
    procedure cmb_StartHH32Change(Sender: TObject);
    procedure cmb_EndMM31Change(Sender: TObject);
    procedure cmb_EndMM32Change(Sender: TObject);
    procedure cmb_EndMM33Change(Sender: TObject);
    procedure cmb_EndMM34Change(Sender: TObject);
    procedure cmb_StartMM35Change(Sender: TObject);
    procedure cmb_StartMM34Change(Sender: TObject);
    procedure cmb_StartMM33Change(Sender: TObject);
    procedure cmb_StartMM32Change(Sender: TObject);
    procedure cmb_EndHH41Change(Sender: TObject);
    procedure cmb_EndHH42Change(Sender: TObject);
    procedure cmb_EndHH43Change(Sender: TObject);
    procedure cmb_EndHH44Change(Sender: TObject);
    procedure cmb_StartHH45Change(Sender: TObject);
    procedure cmb_StartHH44Change(Sender: TObject);
    procedure cmb_StartHH43Change(Sender: TObject);
    procedure cmb_StartHH42Change(Sender: TObject);
    procedure cmb_EndMM41Change(Sender: TObject);
    procedure cmb_EndMM42Change(Sender: TObject);
    procedure cmb_EndMM43Change(Sender: TObject);
    procedure cmb_EndMM44Change(Sender: TObject);
    procedure cmb_StartMM45Change(Sender: TObject);
    procedure cmb_StartMM44Change(Sender: TObject);
    procedure cmb_StartMM43Change(Sender: TObject);
    procedure cmb_StartMM42Change(Sender: TObject);
    procedure btn_DoorManageMode1Click(Sender: TObject);
    procedure cmb_Mode11Change(Sender: TObject);
    procedure btn_ScheduleSaveClick(Sender: TObject);
  private
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    DeviceIDCodeList : TStringList;
    AreaCodeList : TStringList;
    SetBuildingCodeList : TStringList;
    SetFloorCodeList : TStringList;
    SetAreaCodeList : TStringList;
    UpdateBuildingCodeList : TStringList;
    UpdateFloorCodeList : TStringList;
    UpdateAreaCodeList : TStringList;
    L_nPageListMaxCount : integer;
    L_nCheckCount : integer;
    L_stButtonCloseCaption : string;
    L_stButtonPrevCaption : string;
    L_stDeleteCaption : string;
    L_stMenuID : string;
    L_stWorkType : string;
    { Private declarations }
    Function FormNameSetting:Boolean;
    procedure FontSetting;
    Function SearchList(aCurrentCode:string;aTopRow:integer = 0):Boolean;
    Function LoadUpdateSchedule(aNodeNo,aEcuID,aDoorNo:string):Boolean;
  private
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);

    Function CheckScheduleFormat(a1Time,a2Time,a3Time,a4Time,a5Time:string):Boolean;
    procedure ComboBoxIndexInitialize(aGroupNo:integer);
    procedure ComboBoxInitialize;
    procedure ComboBoxModeIndexInitialize(aGroupNo,aDoorMode:integer;aColor:TColor);
    procedure ComboBoxModeSetting(aGroupNo,aTimeNo:integer;aMode:string);
    procedure ComboBoxTimeSetting(aGroupNo,aTimeNo:integer;aTIME:string);
  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmDoorSchedule: TfmDoorSchedule;

implementation
uses
  uCommonFunction,
  uComboBoxCodeLoad,
  uCommonVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBSelect,
  uDBUpdate,
  uDeviceVariable,
  uFormFunction,
  uFormVariable,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmDoorSchedule.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmDoorSchedule.btn_AddAllManagerClick(Sender: TObject);
begin
  inherited;
  cmb_AddW1Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddW2Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddW3Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddW4Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddW5Mode.ItemIndex := TAdvGlassButton(sender).Tag;

  cmb_AddS1Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddS2Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddS3Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddS4Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddS5Mode.ItemIndex := TAdvGlassButton(sender).Tag;

  cmb_AddN1Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddN2Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddN3Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddN4Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddN5Mode.ItemIndex := TAdvGlassButton(sender).Tag;

  cmb_AddH1Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddH2Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddH3Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddH4Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_AddH5Mode.ItemIndex := TAdvGlassButton(sender).Tag;

  cmb_AddW1Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddW2Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddW3Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddW4Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddW5Mode.Color := TAdvGlassButton(sender).BackColor;

  cmb_AddS1Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddS2Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddS3Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddS4Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddS5Mode.Color := TAdvGlassButton(sender).BackColor;

  cmb_AddN1Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddN2Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddN3Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddN4Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddN5Mode.Color := TAdvGlassButton(sender).BackColor;

  cmb_AddH1Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddH2Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddH3Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddH4Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_AddH5Mode.Color := TAdvGlassButton(sender).BackColor;

end;

procedure TfmDoorSchedule.btn_AddClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
begin
  inherited;
  stMessage := dmFormMessage.GetMessage('NOTSELECTDATA');
  stMessage := stringReplace(stMessage,'$WORK',btn_Add.Caption,[rfReplaceAll]);
  if L_nCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  //List.Visible := False;
  //Add.Visible := True;
  //Add.Align := alClient;
  //Update.Visible := False;
  pan_Schedule.Visible := True;
  for i := 1 to 4 do
  begin
    ComboBoxIndexInitialize(i);
    ComboBoxModeIndexInitialize(i,0,btn_DoorManageMode1.ForeColor);
  end;
  L_stWorkType := 'ADD';
end;

procedure TfmDoorSchedule.btn_AddSaveClick(Sender: TObject);
var
  stMessage : string;
  stW1Time,stW2Time,stW3Time,stW4Time,stW5Time : string;
  stS1Time,stS2Time,stS3Time,stS4Time,stS5Time : string;
  stN1Time,stN2Time,stN3Time,stN4Time,stN5Time : string;
  stH1Time,stH2Time,stH3Time,stH4Time,stH5Time : string;
  i : integer;
  bChkState : Boolean;
  stNodeNo,stECUID,stDOORNO : string;
  stClientIP : string;
  stTime : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stW1Time := FillZeroStrNum(cmb_W1HH.Text,2) + FillZeroStrNum(cmb_W1MM.Text,2);
  stW2Time := FillZeroStrNum(cmb_W2HH.Text,2) + FillZeroStrNum(cmb_W2MM.Text,2);
  stW3Time := FillZeroStrNum(cmb_W3HH.Text,2) + FillZeroStrNum(cmb_W3MM.Text,2);
  stW4Time := FillZeroStrNum(cmb_W4HH.Text,2) + FillZeroStrNum(cmb_W4MM.Text,2);
  stW5Time := '2400';

  if Not CheckScheduleFormat(stW1Time,stW2Time,stW3Time,stW4Time,stW5Time) then
  begin
    stMessage := dmFormMessage.GetMessage('NAMEERROR');
    stMessage := stringReplace(stMessage,'$NAME',dmFormFunction.GetFormName('0','2','COMMONWEEKSCHEDULE'),[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  stS1Time := FillZeroStrNum(cmb_S1HH.Text,2) + FillZeroStrNum(cmb_S1MM.Text,2);
  stS2Time := FillZeroStrNum(cmb_S2HH.Text,2) + FillZeroStrNum(cmb_S2MM.Text,2);
  stS3Time := FillZeroStrNum(cmb_S3HH.Text,2) + FillZeroStrNum(cmb_S3MM.Text,2);
  stS4Time := FillZeroStrNum(cmb_S4HH.Text,2) + FillZeroStrNum(cmb_S4MM.Text,2);
  stS5Time := '2400';

  if Not CheckScheduleFormat(stS1Time,stS2Time,stS3Time,stS4Time,stS5Time) then
  begin
    stMessage := dmFormMessage.GetMessage('NAMEERROR');
    stMessage := stringReplace(stMessage,'$NAME',dmFormFunction.GetFormName('0','2','COMMONSATSCHEDULE'),[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  stN1Time := FillZeroStrNum(cmb_N1HH.Text,2) + FillZeroStrNum(cmb_N1MM.Text,2);
  stN2Time := FillZeroStrNum(cmb_N2HH.Text,2) + FillZeroStrNum(cmb_N2MM.Text,2);
  stN3Time := FillZeroStrNum(cmb_N3HH.Text,2) + FillZeroStrNum(cmb_N3MM.Text,2);
  stN4Time := FillZeroStrNum(cmb_N4HH.Text,2) + FillZeroStrNum(cmb_N4MM.Text,2);
  stN5Time := '2400';

  if Not CheckScheduleFormat(stN1Time,stN2Time,stN3Time,stN4Time,stN5Time) then
  begin
    stMessage := dmFormMessage.GetMessage('NAMEERROR');
    stMessage := stringReplace(stMessage,'$NAME',dmFormFunction.GetFormName('0','2','COMMONSUNSCHEDULE'),[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  stH1Time := FillZeroStrNum(cmb_H1HH.Text,2) + FillZeroStrNum(cmb_H1MM.Text,2);
  stH2Time := FillZeroStrNum(cmb_H2HH.Text,2) + FillZeroStrNum(cmb_H2MM.Text,2);
  stH3Time := FillZeroStrNum(cmb_H3HH.Text,2) + FillZeroStrNum(cmb_H3MM.Text,2);
  stH4Time := FillZeroStrNum(cmb_H4HH.Text,2) + FillZeroStrNum(cmb_H4MM.Text,2);
  stH5Time := '2400';

  if cmb_AddW1Mode.ItemIndex < 0 then cmb_AddW1Mode.ItemIndex := 0;
  if cmb_AddW2Mode.ItemIndex < 0 then cmb_AddW2Mode.ItemIndex := 0;
  if cmb_AddW3Mode.ItemIndex < 0 then cmb_AddW3Mode.ItemIndex := 0;
  if cmb_AddW4Mode.ItemIndex < 0 then cmb_AddW4Mode.ItemIndex := 0;
  if cmb_AddW5Mode.ItemIndex < 0 then cmb_AddW5Mode.ItemIndex := 0;

  if cmb_AddS1Mode.ItemIndex < 0 then cmb_AddS1Mode.ItemIndex := 0;
  if cmb_AddS2Mode.ItemIndex < 0 then cmb_AddS2Mode.ItemIndex := 0;
  if cmb_AddS3Mode.ItemIndex < 0 then cmb_AddS3Mode.ItemIndex := 0;
  if cmb_AddS4Mode.ItemIndex < 0 then cmb_AddS4Mode.ItemIndex := 0;
  if cmb_AddS5Mode.ItemIndex < 0 then cmb_AddS5Mode.ItemIndex := 0;

  if cmb_AddN1Mode.ItemIndex < 0 then cmb_AddN1Mode.ItemIndex := 0;
  if cmb_AddN2Mode.ItemIndex < 0 then cmb_AddN2Mode.ItemIndex := 0;
  if cmb_AddN3Mode.ItemIndex < 0 then cmb_AddN3Mode.ItemIndex := 0;
  if cmb_AddN4Mode.ItemIndex < 0 then cmb_AddN4Mode.ItemIndex := 0;
  if cmb_AddN5Mode.ItemIndex < 0 then cmb_AddN5Mode.ItemIndex := 0;

  if cmb_AddH1Mode.ItemIndex < 0 then cmb_AddH1Mode.ItemIndex := 0;
  if cmb_AddH2Mode.ItemIndex < 0 then cmb_AddH2Mode.ItemIndex := 0;
  if cmb_AddH3Mode.ItemIndex < 0 then cmb_AddH3Mode.ItemIndex := 0;
  if cmb_AddH4Mode.ItemIndex < 0 then cmb_AddH4Mode.ItemIndex := 0;
  if cmb_AddH5Mode.ItemIndex < 0 then cmb_AddH5Mode.ItemIndex := 0;

  if Not CheckScheduleFormat(stH1Time,stH2Time,stH3Time,stH4Time,stH5Time) then
  begin
    stMessage := dmFormMessage.GetMessage('NAMEERROR');
    stMessage := stringReplace(stMessage,'$NAME',dmFormFunction.GetFormName('0','2','COMMONHOLSCHEDULE'),[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;
  With sg_List do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bChkState);
      if bChkState then
      begin
        stNodeNo :=  cells[2,i];
        stECUID :=  cells[3,i];
        stDOORNO :=  cells[4,i];
        //평일
        if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(stNodeNo,stECUID,stDOORNO,'0') = 1 then
        begin
          stW5Time := '0000';
          dmDBUpdate.UpdateTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'0',stW1Time,stW2Time,stW3Time,stW4Time,stW5Time,
                                               inttostr(cmb_AddW1Mode.ItemIndex),inttostr(cmb_AddW2Mode.ItemIndex),inttostr(cmb_AddW3Mode.ItemIndex),
                                               inttostr(cmb_AddW4Mode.ItemIndex),inttostr(cmb_AddW5Mode.ItemIndex),'N');
        end else
        begin
          stW5Time := '0000';
          dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'0',stW1Time,stW2Time,stW3Time,stW4Time,stW5Time,
                                               inttostr(cmb_AddW1Mode.ItemIndex),inttostr(cmb_AddW2Mode.ItemIndex),inttostr(cmb_AddW3Mode.ItemIndex),
                                               inttostr(cmb_AddW4Mode.ItemIndex),inttostr(cmb_AddW5Mode.ItemIndex),'N');
        end;
        //토요일
        if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(stNodeNo,stECUID,stDOORNO,'1') = 1 then
        begin
          stS5Time := '0000';
          dmDBUpdate.UpdateTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'1',stS1Time,stS2Time,stS3Time,stS4Time,stS5Time,
                                               inttostr(cmb_AddS1Mode.ItemIndex),inttostr(cmb_AddS2Mode.ItemIndex),inttostr(cmb_AddS3Mode.ItemIndex),
                                               inttostr(cmb_AddS4Mode.ItemIndex),inttostr(cmb_AddS5Mode.ItemIndex),'N');
        end else
        begin
          stS5Time := '0000';
          dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'1',stS1Time,stS2Time,stS3Time,stS4Time,stS5Time,
                                               inttostr(cmb_AddS1Mode.ItemIndex),inttostr(cmb_AddS2Mode.ItemIndex),inttostr(cmb_AddS3Mode.ItemIndex),
                                               inttostr(cmb_AddS4Mode.ItemIndex),inttostr(cmb_AddS5Mode.ItemIndex),'N');
        end;
        //일요일
        if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(stNodeNo,stECUID,stDOORNO,'2') = 1 then
        begin
          stN5Time := '0000';
          dmDBUpdate.UpdateTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'2',stN1Time,stN2Time,stN3Time,stN4Time,stN5Time,
                                               inttostr(cmb_AddN1Mode.ItemIndex),inttostr(cmb_AddN2Mode.ItemIndex),inttostr(cmb_AddN3Mode.ItemIndex),
                                               inttostr(cmb_AddN4Mode.ItemIndex),inttostr(cmb_AddN5Mode.ItemIndex),'N');
        end else
        begin
          stN5Time := '0000';
          dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'2',stN1Time,stN2Time,stN3Time,stN4Time,stN5Time,
                                               inttostr(cmb_AddN1Mode.ItemIndex),inttostr(cmb_AddN2Mode.ItemIndex),inttostr(cmb_AddN3Mode.ItemIndex),
                                               inttostr(cmb_AddN4Mode.ItemIndex),inttostr(cmb_AddN5Mode.ItemIndex),'N');
        end;
        //공휴일
        if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(stNodeNo,stECUID,stDOORNO,'3') = 1 then
        begin
          stH5Time := '0000';
          dmDBUpdate.UpdateTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'3',stH1Time,stH2Time,stH3Time,stH4Time,stH5Time,
                                               inttostr(cmb_AddH1Mode.ItemIndex),inttostr(cmb_AddH2Mode.ItemIndex),inttostr(cmb_AddH3Mode.ItemIndex),
                                               inttostr(cmb_AddH4Mode.ItemIndex),inttostr(cmb_AddH5Mode.ItemIndex),'N');
        end else
        begin
          stH5Time := '0000';
          dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'3',stH1Time,stH2Time,stH3Time,stH4Time,stH5Time,
                                               inttostr(cmb_AddH1Mode.ItemIndex),inttostr(cmb_AddH2Mode.ItemIndex),inttostr(cmb_AddH3Mode.ItemIndex),
                                               inttostr(cmb_AddH4Mode.ItemIndex),inttostr(cmb_AddH5Mode.ItemIndex),'N');
        end;
        dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stDoorNo, con_ComLogTYPE_DOOR, L_stMenuID + '(' + Caption + '): Change');

      end;
    end;
  end;

  SearchList('');

  fmMain.FORMCHANGE(con_FormBMOSDOORSCHEDULEADMIN,'');

end;

procedure TfmDoorSchedule.btn_AddTimeInitializeClick(Sender: TObject);
begin
  inherited;
  cmb_W1HH.Text := '05';
  cmb_W1MM.Text := '00';
  cmb_W2HH.Text := '12';
  cmb_W2MM.Text := '00';
  cmb_W3HH.Text := '13';
  cmb_W3MM.Text := '00';
  cmb_W4HH.Text := '18';
  cmb_W4MM.Text := '00';

  cmb_S1HH.Text := '05';
  cmb_S1MM.Text := '00';
  cmb_S2HH.Text := '12';
  cmb_S2MM.Text := '00';
  cmb_S3HH.Text := '13';
  cmb_S3MM.Text := '00';
  cmb_S4HH.Text := '18';
  cmb_S4MM.Text := '00';

  cmb_N1HH.Text := '05';
  cmb_N1MM.Text := '00';
  cmb_N2HH.Text := '12';
  cmb_N2MM.Text := '00';
  cmb_N3HH.Text := '13';
  cmb_N3MM.Text := '00';
  cmb_N4HH.Text := '18';
  cmb_N4MM.Text := '00';

  cmb_H1HH.Text := '05';
  cmb_H1MM.Text := '00';
  cmb_H2HH.Text := '12';
  cmb_H2MM.Text := '00';
  cmb_H3HH.Text := '13';
  cmb_H3MM.Text := '00';
  cmb_H4HH.Text := '18';
  cmb_H4MM.Text := '00';

end;

procedure TfmDoorSchedule.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmDoorSchedule.btn_DoorManageMode1Click(Sender: TObject);
var
  nGroup : integer;
  nMode  : integer;
  stTemp : string;
begin
  inherited;
  stTemp := FillZeroNumber(TAdvGlassButton(Sender).Tag,2);
  nGroup := strtoint(stTemp[1]);
  nMode := strtoint(stTemp[2]);
  ComboBoxModeIndexInitialize(nGroup,nMode,TAdvGlassButton(Sender).ForeColor);
end;

procedure TfmDoorSchedule.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmDoorSchedule.btn_ScheduleCancelClick(Sender: TObject);
begin
  inherited;
  pan_Schedule.Visible := False;
end;

procedure TfmDoorSchedule.btn_ScheduleSaveClick(Sender: TObject);
var
  i,j,k : integer;
  stNo : string;
  oComboBox : TAdvComboBox;
  stTime1 : string;
  stTime2 : string;
  stTime3 : string;
  stTime4 : string;
  stTime5 : string;
  stMode1 : string;
  stMode2 : string;
  stMode3 : string;
  stMode4 : string;
  stMode5 : string;
  bChkState : Boolean;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stClientIP : string;
  stInsertTime : string;
begin
  stClientIP:= GetLocalIPAddr;
  stInsertTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  for i := 1 to 4 do
  begin
    stTime1 := '';
    stTime2 := '';
    stTime3 := '';
    stTime4 := '';
    stTime5 := '';
    stMode1 := '0';
    stMode2 := '0';
    stMode3 := '0';
    stMode4 := '0';
    stMode5 := '0';
    for j := 1 to 5 do
    begin
      stNo := inttostr(i) + inttostr(j);
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_EndHH',strtoint(stNo))
      else if i = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_EndHH',strtoint(stNo))
      else if i = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_EndHH',strtoint(stNo))
      else if i = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_EndHH',strtoint(stNo));
      if oComboBox <> nil then
      begin
        if j = 1 then stTime1 := oComboBox.Text
        else if j = 2 then stTime2 := oComboBox.Text
        else if j = 3 then stTime3 := oComboBox.Text
        else if j = 4 then stTime4 := oComboBox.Text
        else if j = 5 then stTime5 := oComboBox.Text;
      end else
      begin
        if j = 1 then stTime1 := '00'
        else if j = 2 then stTime2 := '00'
        else if j = 3 then stTime3 := '00'
        else if j = 4 then stTime4 := '00'
        else if j = 5 then stTime5 := '00';
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_EndMM',strtoint(stNo))
      else if i = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_EndMM',strtoint(stNo))
      else if i = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_EndMM',strtoint(stNo))
      else if i = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_EndMM',strtoint(stNo));
      if oComboBox <> nil then
      begin
        if j = 1 then stTime1 := stTime1 + oComboBox.Text
        else if j = 2 then stTime2 := stTime2 + oComboBox.Text
        else if j = 3 then stTime3 := stTime3 + oComboBox.Text
        else if j = 4 then stTime4 := stTime4 + oComboBox.Text
        else if j = 5 then stTime5 := stTime5 + oComboBox.Text;
      end else
      begin
        if j = 1 then stTime1 := stTime1 + '00'
        else if j = 2 then stTime2 := stTime2 + '00'
        else if j = 3 then stTime3 := stTime3 + '00'
        else if j = 4 then stTime4 := stTime4 + '00'
        else if j = 5 then stTime5 := stTime5 + '00';
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_Mode',strtoint(stNo))
      else if i = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_Mode',strtoint(stNo))
      else if i = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_Mode',strtoint(stNo))
      else if i = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_Mode',strtoint(stNo));
      if oComboBox <> nil then
      begin
        if j = 1 then stMode1 := inttostr(oComboBox.ItemIndex)
        else if j = 2 then stMode2 := inttostr(oComboBox.ItemIndex)
        else if j = 3 then stMode3 := inttostr(oComboBox.ItemIndex)
        else if j = 4 then stMode4 := inttostr(oComboBox.ItemIndex)
        else if j = 5 then stMode5 := inttostr(oComboBox.ItemIndex);
      end;
    end;
    //여기서 데이터 입력
    if L_stWorkType = 'UPDATE' then
    begin
      stNodeNo :=  ed_UpdateNodeNoCode.Text;
      stECUID :=  ed_UpdateEcuCode.Text;
      stDOORNO :=  ed_UpdateDoorCode.Text;
      if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(stNodeNo,stECUID,stDOORNO,inttostr(i-1)) = 1 then
      begin
        dmDBUpdate.UpdateTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,inttostr(i-1),stTime1,stTime2,stTime3,stTime4,stTime5,
                                             stMode1,stMode2,stMode3,stMode4,stMode5,'N');
      end else
      begin
        dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,inttostr(i-1),stTime1,stTime2,stTime3,stTime4,stTime5,
                                             stMode1,stMode2,stMode3,stMode4,stMode5,'N');
      end;
      dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stInsertTime,1,8),copy(stInsertTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stDoorNo, con_ComLogTYPE_DOOR, L_stMenuID + '(' + Caption + '): Change');
    end else if L_stWorkType = 'ADD' then
    begin
      With sg_List do
      begin
        for k := 1 to RowCount - 1 do
        begin
          GetCheckBoxState(0,k, bChkState);
          if bChkState then
          begin
            stNodeNo :=  cells[2,k];
            stECUID :=  cells[3,k];
            stDOORNO :=  cells[4,k];
            if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(stNodeNo,stECUID,stDOORNO,inttostr(i-1)) = 1 then
            begin
              dmDBUpdate.UpdateTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,inttostr(i-1),stTime1,stTime2,stTime3,stTime4,stTime5,
                                                   stMode1,stMode2,stMode3,stMode4,stMode5,'N');
            end else
            begin
              dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,inttostr(i-1),stTime1,stTime2,stTime3,stTime4,stTime5,
                                                   stMode1,stMode2,stMode3,stMode4,stMode5,'N');
            end;
            dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stInsertTime,1,8),copy(stInsertTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stDoorNo, con_ComLogTYPE_DOOR, L_stMenuID + '(' + Caption + '): Change');

          end;
        end;
      end;
    end;
  end;
  SearchList('');

  fmMain.FORMCHANGE(con_FormBMOSDOORSCHEDULEADMIN,'');
  pan_Schedule.Visible := False;

end;

procedure TfmDoorSchedule.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmDoorSchedule.btn_TimeInit1Click(Sender: TObject);
begin
  inherited;
  ComboBoxIndexInitialize(TAdvGlassButton(Sender).tag);
end;

procedure TfmDoorSchedule.btn_UpdateAllManagerClick(Sender: TObject);
begin
  inherited;
  cmb_UpdateW1Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateW2Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateW3Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateW4Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateW5Mode.ItemIndex := TAdvGlassButton(sender).Tag;

  cmb_UpdateS1Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateS2Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateS3Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateS4Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateS5Mode.ItemIndex := TAdvGlassButton(sender).Tag;

  cmb_UpdateN1Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateN2Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateN3Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateN4Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateN5Mode.ItemIndex := TAdvGlassButton(sender).Tag;

  cmb_UpdateH1Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateH2Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateH3Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateH4Mode.ItemIndex := TAdvGlassButton(sender).Tag;
  cmb_UpdateH5Mode.ItemIndex := TAdvGlassButton(sender).Tag;

  cmb_UpdateW1Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateW2Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateW3Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateW4Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateW5Mode.Color := TAdvGlassButton(sender).BackColor;

  cmb_UpdateS1Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateS2Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateS3Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateS4Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateS5Mode.Color := TAdvGlassButton(sender).BackColor;

  cmb_UpdateN1Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateN2Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateN3Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateN4Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateN5Mode.Color := TAdvGlassButton(sender).BackColor;

  cmb_UpdateH1Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateH2Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateH3Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateH4Mode.Color := TAdvGlassButton(sender).BackColor;
  cmb_UpdateH5Mode.Color := TAdvGlassButton(sender).BackColor;

end;

procedure TfmDoorSchedule.btn_UpdateSaveClick(Sender: TObject);
var
  stMessage : string;
  stW1Time,stW2Time,stW3Time,stW4Time,stW5Time : string;
  stS1Time,stS2Time,stS3Time,stS4Time,stS5Time : string;
  stN1Time,stN2Time,stN3Time,stN4Time,stN5Time : string;
  stH1Time,stH2Time,stH3Time,stH4Time,stH5Time : string;
  i : integer;
  bChkState : Boolean;
  stNodeNo,stECUID,stDOORNO : string;
  stClientIP : string;
  stTime : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);

  stW1Time := FillZeroStrNum(cmb_UpdateW1HH.Text,2) + FillZeroStrNum(cmb_UpdateW1MM.Text,2);
  stW2Time := FillZeroStrNum(cmb_UpdateW2HH.Text,2) + FillZeroStrNum(cmb_UpdateW2MM.Text,2);
  stW3Time := FillZeroStrNum(cmb_UpdateW3HH.Text,2) + FillZeroStrNum(cmb_UpdateW3MM.Text,2);
  stW4Time := FillZeroStrNum(cmb_UpdateW4HH.Text,2) + FillZeroStrNum(cmb_UpdateW4MM.Text,2);
  stW5Time := '2400';

  if Not CheckScheduleFormat(stW1Time,stW2Time,stW3Time,stW4Time,stW5Time) then
  begin
    stMessage := dmFormMessage.GetMessage('NAMEERROR');
    stMessage := stringReplace(stMessage,'$NAME',dmFormFunction.GetFormName('0','2','COMMONWEEKSCHEDULE'),[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  stS1Time := FillZeroStrNum(cmb_UpdateS1HH.Text,2) + FillZeroStrNum(cmb_UpdateS1MM.Text,2);
  stS2Time := FillZeroStrNum(cmb_UpdateS2HH.Text,2) + FillZeroStrNum(cmb_UpdateS2MM.Text,2);
  stS3Time := FillZeroStrNum(cmb_UpdateS3HH.Text,2) + FillZeroStrNum(cmb_UpdateS3MM.Text,2);
  stS4Time := FillZeroStrNum(cmb_UpdateS4HH.Text,2) + FillZeroStrNum(cmb_UpdateS4MM.Text,2);
  stS5Time := '2400';

  if Not CheckScheduleFormat(stS1Time,stS2Time,stS3Time,stS4Time,stS5Time) then
  begin
    stMessage := dmFormMessage.GetMessage('NAMEERROR');
    stMessage := stringReplace(stMessage,'$NAME',dmFormFunction.GetFormName('0','2','COMMONSATSCHEDULE'),[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  stN1Time := FillZeroStrNum(cmb_UpdateN1HH.Text,2) + FillZeroStrNum(cmb_UpdateN1MM.Text,2);
  stN2Time := FillZeroStrNum(cmb_UpdateN2HH.Text,2) + FillZeroStrNum(cmb_UpdateN2MM.Text,2);
  stN3Time := FillZeroStrNum(cmb_UpdateN3HH.Text,2) + FillZeroStrNum(cmb_UpdateN3MM.Text,2);
  stN4Time := FillZeroStrNum(cmb_UpdateN4HH.Text,2) + FillZeroStrNum(cmb_UpdateN4MM.Text,2);
  stN5Time := '2400';

  if Not CheckScheduleFormat(stN1Time,stN2Time,stN3Time,stN4Time,stN5Time) then
  begin
    stMessage := dmFormMessage.GetMessage('NAMEERROR');
    stMessage := stringReplace(stMessage,'$NAME',dmFormFunction.GetFormName('0','2','COMMONSUNSCHEDULE'),[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  stH1Time := FillZeroStrNum(cmb_UpdateH1HH.Text,2) + FillZeroStrNum(cmb_UpdateH1MM.Text,2);
  stH2Time := FillZeroStrNum(cmb_UpdateH2HH.Text,2) + FillZeroStrNum(cmb_UpdateH2MM.Text,2);
  stH3Time := FillZeroStrNum(cmb_UpdateH3HH.Text,2) + FillZeroStrNum(cmb_UpdateH3MM.Text,2);
  stH4Time := FillZeroStrNum(cmb_UpdateH4HH.Text,2) + FillZeroStrNum(cmb_UpdateH4MM.Text,2);
  stH5Time := '2400';

  if cmb_UpdateW1Mode.ItemIndex < 0 then cmb_UpdateW1Mode.ItemIndex := 0;
  if cmb_UpdateW2Mode.ItemIndex < 0 then cmb_UpdateW2Mode.ItemIndex := 0;
  if cmb_UpdateW3Mode.ItemIndex < 0 then cmb_UpdateW3Mode.ItemIndex := 0;
  if cmb_UpdateW4Mode.ItemIndex < 0 then cmb_UpdateW4Mode.ItemIndex := 0;
  if cmb_UpdateW5Mode.ItemIndex < 0 then cmb_UpdateW5Mode.ItemIndex := 0;

  if cmb_UpdateS1Mode.ItemIndex < 0 then cmb_UpdateS1Mode.ItemIndex := 0;
  if cmb_UpdateS2Mode.ItemIndex < 0 then cmb_UpdateS2Mode.ItemIndex := 0;
  if cmb_UpdateS3Mode.ItemIndex < 0 then cmb_UpdateS3Mode.ItemIndex := 0;
  if cmb_UpdateS4Mode.ItemIndex < 0 then cmb_UpdateS4Mode.ItemIndex := 0;
  if cmb_UpdateS5Mode.ItemIndex < 0 then cmb_UpdateS5Mode.ItemIndex := 0;

  if cmb_UpdateN1Mode.ItemIndex < 0 then cmb_UpdateN1Mode.ItemIndex := 0;
  if cmb_UpdateN2Mode.ItemIndex < 0 then cmb_UpdateN2Mode.ItemIndex := 0;
  if cmb_UpdateN3Mode.ItemIndex < 0 then cmb_UpdateN3Mode.ItemIndex := 0;
  if cmb_UpdateN4Mode.ItemIndex < 0 then cmb_UpdateN4Mode.ItemIndex := 0;
  if cmb_UpdateN5Mode.ItemIndex < 0 then cmb_UpdateN5Mode.ItemIndex := 0;

  if cmb_UpdateH1Mode.ItemIndex < 0 then cmb_UpdateH1Mode.ItemIndex := 0;
  if cmb_UpdateH2Mode.ItemIndex < 0 then cmb_UpdateH2Mode.ItemIndex := 0;
  if cmb_UpdateH3Mode.ItemIndex < 0 then cmb_UpdateH3Mode.ItemIndex := 0;
  if cmb_UpdateH4Mode.ItemIndex < 0 then cmb_UpdateH4Mode.ItemIndex := 0;
  if cmb_UpdateH5Mode.ItemIndex < 0 then cmb_UpdateH5Mode.ItemIndex := 0;

  if Not CheckScheduleFormat(stH1Time,stH2Time,stH3Time,stH4Time,stH5Time) then
  begin
    stMessage := dmFormMessage.GetMessage('NAMEERROR');
    stMessage := stringReplace(stMessage,'$NAME',dmFormFunction.GetFormName('0','2','COMMONHOLSCHEDULE'),[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Error',MB_OK);
    Exit;
  end;

  stNodeNo :=  ed_UpdateNodeNoCode.Text;
  stECUID :=  ed_UpdateEcuCode.Text;
  stDOORNO :=  ed_UpdateDoorCode.Text;
  //평일
  if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(stNodeNo,stECUID,stDOORNO,'0') = 1 then
  begin
    stW5Time := '0000';
    dmDBUpdate.UpdateTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'0',stW1Time,stW2Time,stW3Time,stW4Time,stW5Time,
                                         inttostr(cmb_UpdateW1Mode.ItemIndex),inttostr(cmb_UpdateW2Mode.ItemIndex),inttostr(cmb_UpdateW3Mode.ItemIndex),
                                         inttostr(cmb_UpdateW4Mode.ItemIndex),inttostr(cmb_UpdateW5Mode.ItemIndex),'N');
  end else
  begin
    stW5Time := '0000';
    dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'0',stW1Time,stW2Time,stW3Time,stW4Time,stW5Time,
                                         inttostr(cmb_UpdateW1Mode.ItemIndex),inttostr(cmb_UpdateW2Mode.ItemIndex),inttostr(cmb_UpdateW3Mode.ItemIndex),
                                         inttostr(cmb_UpdateW4Mode.ItemIndex),inttostr(cmb_UpdateW5Mode.ItemIndex),'N');
  end;
  //토요일
  if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(stNodeNo,stECUID,stDOORNO,'1') = 1 then
  begin
    stS5Time := '0000';
    dmDBUpdate.UpdateTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'1',stS1Time,stS2Time,stS3Time,stS4Time,stS5Time,
                                         inttostr(cmb_UpdateS1Mode.ItemIndex),inttostr(cmb_UpdateS2Mode.ItemIndex),inttostr(cmb_UpdateS3Mode.ItemIndex),
                                         inttostr(cmb_UpdateS4Mode.ItemIndex),inttostr(cmb_UpdateS5Mode.ItemIndex),'N');
  end else
  begin
    stS5Time := '0000';
    dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'1',stS1Time,stS2Time,stS3Time,stS4Time,stS5Time,
                                         inttostr(cmb_UpdateS1Mode.ItemIndex),inttostr(cmb_UpdateS2Mode.ItemIndex),inttostr(cmb_UpdateS3Mode.ItemIndex),
                                         inttostr(cmb_UpdateS4Mode.ItemIndex),inttostr(cmb_UpdateS5Mode.ItemIndex),'N');
  end;
  //일요일
  if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(stNodeNo,stECUID,stDOORNO,'2') = 1 then
  begin
    stN5Time := '0000';
    dmDBUpdate.UpdateTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'2',stN1Time,stN2Time,stN3Time,stN4Time,stN5Time,
                                         inttostr(cmb_UpdateN1Mode.ItemIndex),inttostr(cmb_UpdateN2Mode.ItemIndex),inttostr(cmb_UpdateN3Mode.ItemIndex),
                                         inttostr(cmb_UpdateN4Mode.ItemIndex),inttostr(cmb_UpdateN5Mode.ItemIndex),'N');
  end else
  begin
    stN5Time := '0000';
    dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'2',stN1Time,stN2Time,stN3Time,stN4Time,stN5Time,
                                         inttostr(cmb_UpdateN1Mode.ItemIndex),inttostr(cmb_UpdateN2Mode.ItemIndex),inttostr(cmb_UpdateN3Mode.ItemIndex),
                                         inttostr(cmb_UpdateN4Mode.ItemIndex),inttostr(cmb_UpdateN5Mode.ItemIndex),'N');
  end;
  //공휴일
  if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(stNodeNo,stECUID,stDOORNO,'3') = 1 then
  begin
    stH5Time := '0000';
    dmDBUpdate.UpdateTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'3',stH1Time,stH2Time,stH3Time,stH4Time,stH5Time,
                                         inttostr(cmb_UpdateH1Mode.ItemIndex),inttostr(cmb_UpdateH2Mode.ItemIndex),inttostr(cmb_UpdateH3Mode.ItemIndex),
                                         inttostr(cmb_UpdateH4Mode.ItemIndex),inttostr(cmb_UpdateH5Mode.ItemIndex),'N');
  end else
  begin
    stH5Time := '0000';
    dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(stNodeNo,stECUID,stDOORNO,'3',stH1Time,stH2Time,stH3Time,stH4Time,stH5Time,
                                         inttostr(cmb_UpdateH1Mode.ItemIndex),inttostr(cmb_UpdateH2Mode.ItemIndex),inttostr(cmb_UpdateH3Mode.ItemIndex),
                                         inttostr(cmb_UpdateH4Mode.ItemIndex),inttostr(cmb_UpdateH5Mode.ItemIndex),'N');
  end;
  dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', stDoorNo, con_ComLogTYPE_DOOR, L_stMenuID + '(' + Caption + '): Change');


  SearchList(stNodeNo + stEcuID + stDoorNo,sg_List.TopRow);

  fmMain.FORMCHANGE(con_FormBMOSDOORSCHEDULEADMIN,'');

end;

procedure TfmDoorSchedule.btn_UpdateTimeInitializeClick(Sender: TObject);
begin
  inherited;
  cmb_UpdateW1HH.Text := '05';
  cmb_UpdateW1MM.Text := '00';
  cmb_UpdateW2HH.Text := '12';
  cmb_UpdateW2MM.Text := '00';
  cmb_UpdateW3HH.Text := '13';
  cmb_UpdateW3MM.Text := '00';
  cmb_UpdateW4HH.Text := '18';
  cmb_UpdateW4MM.Text := '00';

  cmb_UpdateS1HH.Text := '05';
  cmb_UpdateS1MM.Text := '00';
  cmb_UpdateS2HH.Text := '12';
  cmb_UpdateS2MM.Text := '00';
  cmb_UpdateS3HH.Text := '13';
  cmb_UpdateS3MM.Text := '00';
  cmb_UpdateS4HH.Text := '18';
  cmb_UpdateS4MM.Text := '00';

  cmb_UpdateN1HH.Text := '05';
  cmb_UpdateN1MM.Text := '00';
  cmb_UpdateN2HH.Text := '12';
  cmb_UpdateN2MM.Text := '00';
  cmb_UpdateN3HH.Text := '13';
  cmb_UpdateN3MM.Text := '00';
  cmb_UpdateN4HH.Text := '18';
  cmb_UpdateN4MM.Text := '00';

  cmb_UpdateH1HH.Text := '05';
  cmb_UpdateH1MM.Text := '00';
  cmb_UpdateH2HH.Text := '12';
  cmb_UpdateH2MM.Text := '00';
  cmb_UpdateH3HH.Text := '13';
  cmb_UpdateH3MM.Text := '00';
  cmb_UpdateH4HH.Text := '18';
  cmb_UpdateH4MM.Text := '00';

end;

function TfmDoorSchedule.CheckScheduleFormat(a1Time, a2Time, a3Time, a4Time,
  a5Time: string): Boolean;
begin
  result := False;

  if Not isDigit(a1Time) then Exit;
  if Not isDigit(a2Time) then Exit;
  if Not isDigit(a3Time) then Exit;
  if Not isDigit(a4Time) then Exit;
  if Not isDigit(a5Time) then Exit;

  if strtoint(a1Time) >= strtoint(a2Time) then Exit;
  if strtoint(a2Time) >= strtoint(a3Time) then Exit;
  if strtoint(a3Time) >= strtoint(a4Time) then Exit;
  if strtoint(a4Time) >= strtoint(a5Time) then Exit;

  result := True;
end;

procedure TfmDoorSchedule.cmb_SearchAreaChange(Sender: TObject);
begin
  inherited;
  SearchList('');

end;

procedure TfmDoorSchedule.cmb_StartHH12Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH11.ItemIndex := cmb_StartHH12.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH13Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH12.ItemIndex := cmb_StartHH13.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH14Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH13.ItemIndex := cmb_StartHH14.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH15Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH14.ItemIndex := cmb_StartHH15.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH22Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH21.ItemIndex := cmb_StartHH22.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH23Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH22.ItemIndex := cmb_StartHH23.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH24Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH23.ItemIndex := cmb_StartHH24.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH25Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH24.ItemIndex := cmb_StartHH25.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH32Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH31.ItemIndex := cmb_StartHH32.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH33Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH32.ItemIndex := cmb_StartHH33.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH34Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH33.ItemIndex := cmb_StartHH34.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH35Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH34.ItemIndex := cmb_StartHH35.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH42Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH41.ItemIndex := cmb_StartHH42.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH43Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH42.ItemIndex := cmb_StartHH43.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH44Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH43.ItemIndex := cmb_StartHH44.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartHH45Change(Sender: TObject);
begin
  inherited;
  cmb_EndHH44.ItemIndex := cmb_StartHH45.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM12Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM11.ItemIndex := cmb_StartMM12.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM13Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM12.ItemIndex := cmb_StartMM13.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM14Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM13.ItemIndex := cmb_StartMM14.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM15Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM14.ItemIndex := cmb_StartMM15.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM22Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM21.ItemIndex := cmb_StartMM22.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM23Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM22.ItemIndex := cmb_StartMM23.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM24Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM23.ItemIndex := cmb_StartMM24.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM25Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM24.ItemIndex := cmb_StartMM25.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM32Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM31.ItemIndex := cmb_StartMM32.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM33Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM32.ItemIndex := cmb_StartMM33.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM34Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM33.ItemIndex := cmb_StartMM34.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM35Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM34.ItemIndex := cmb_StartMM35.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM42Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM41.ItemIndex := cmb_StartMM42.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM43Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM42.ItemIndex := cmb_StartMM43.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM44Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM43.ItemIndex := cmb_StartMM44.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_StartMM45Change(Sender: TObject);
begin
  inherited;
  cmb_EndMM44.ItemIndex := cmb_StartMM45.ItemIndex ;
end;

procedure TfmDoorSchedule.ComboBoxIndexInitialize(aGroupNo:integer);
var
  j,k : integer;
  stNo : string;
  oComboBox : TAdvComboBox;
begin
  for j := 1 to 5 do
  begin
    stNo := inttostr(aGroupNo) + inttostr(j);
    if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_StartHH',strtoint(stNo))
    else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_StartHH',strtoint(stNo))
    else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_StartHH',strtoint(stNo))
    else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_StartHH',strtoint(stNo));
    if oComboBox <> nil then
    begin
      if j = 1 then oComboBox.ItemIndex := 0
      else if j = 2 then oComboBox.ItemIndex := 5
      else if j = 3 then oComboBox.ItemIndex := 12
      else if j = 4 then oComboBox.ItemIndex := 13
      else if j = 5 then oComboBox.ItemIndex := 18;
    end;
    if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_StartMM',strtoint(stNo))
    else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_StartMM',strtoint(stNo))
    else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_StartMM',strtoint(stNo))
    else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_StartMM',strtoint(stNo));
    if oComboBox <> nil then
    begin
      oComboBox.ItemIndex := 0;
    end;
    if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_EndHH',strtoint(stNo))
    else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_EndHH',strtoint(stNo))
    else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_EndHH',strtoint(stNo))
    else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_EndHH',strtoint(stNo));
    if oComboBox <> nil then
    begin
      if j = 1 then oComboBox.ItemIndex := 5
      else if j = 2 then oComboBox.ItemIndex := 12
      else if j = 3 then oComboBox.ItemIndex := 13
      else if j = 4 then oComboBox.ItemIndex := 18
      else if j = 5 then oComboBox.ItemIndex := 24;
    end;
    if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_EndMM',strtoint(stNo))
    else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_EndMM',strtoint(stNo))
    else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_EndMM',strtoint(stNo))
    else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_EndMM',strtoint(stNo));
    if oComboBox <> nil then
    begin
      oComboBox.ItemIndex := 0;
    end;
(*    if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_Mode',strtoint(stNo))
    else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_Mode',strtoint(stNo))
    else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_Mode',strtoint(stNo))
    else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_Mode',strtoint(stNo));
    if oComboBox <> nil then
    begin
      oComboBox.ItemIndex := 0;
      oComboBox.Color := btn_DoorManageMode1.ForeColor;
    end; *)
  end;
end;

procedure TfmDoorSchedule.ComboBoxInitialize;
var
  i,j,k : integer;
  stNo : string;
  oComboBox : TAdvComboBox;
begin
  for i := 1 to 4 do
  begin
    for j := 1 to 5 do
    begin
      stNo := inttostr(i) + inttostr(j);
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_StartHH',strtoint(stNo))
      else if i = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_StartHH',strtoint(stNo))
      else if i = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_StartHH',strtoint(stNo))
      else if i = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_StartHH',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.Items.Clear;
        for k := 0 to 23 do oComboBox.Items.Add(FillZeroNumber(k,2));
        oComboBox.ItemIndex := 0;
        oComboBox.Style := csOwnerDrawFixed;
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_StartMM',strtoint(stNo))
      else if i = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_StartMM',strtoint(stNo))
      else if i = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_StartMM',strtoint(stNo))
      else if i = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_StartMM',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.Items.Clear;
        for k := 0 to 11 do oComboBox.Items.Add(FillZeroNumber(k * 5,2));
        oComboBox.ItemIndex := 0;
        oComboBox.Style := csOwnerDrawFixed;
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_EndHH',strtoint(stNo))
      else if i = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_EndHH',strtoint(stNo))
      else if i = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_EndHH',strtoint(stNo))
      else if i = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_EndHH',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.Items.Clear;
        for k := 0 to 24 do oComboBox.Items.Add(FillZeroNumber(k,2));
        oComboBox.ItemIndex := 0;
        oComboBox.Style := csOwnerDrawFixed;
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_EndMM',strtoint(stNo))
      else if i = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_EndMM',strtoint(stNo))
      else if i = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_EndMM',strtoint(stNo))
      else if i = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_EndMM',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.Items.Clear;
        for k := 0 to 11 do oComboBox.Items.Add(FillZeroNumber(k * 5,2));
        oComboBox.ItemIndex := 0;
        oComboBox.Style := csOwnerDrawFixed;
      end;

      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_Mode',strtoint(stNo))
      else if i = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_Mode',strtoint(stNo))
      else if i = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_Mode',strtoint(stNo))
      else if i = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_Mode',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.Items.Clear;
        oComboBox.Items.Add(dmFormFunction.GetFormName('0','2','COMMONCLOSEMODE'));
        oComboBox.Items.Add(dmFormFunction.GetFormName('0','2','COMMONOPENMODE'));
        oComboBox.Items.Add(dmFormFunction.GetFormName('0','2','COMMONLOCKMODE'));
        oComboBox.ItemIndex := 0;
        oComboBox.Style := csOwnerDrawFixed;
      end;

    end;
  end;
end;

procedure TfmDoorSchedule.ComboBoxModeIndexInitialize(aGroupNo,
  aDoorMode: integer;aColor:TColor);
var
  j,k : integer;
  stNo : string;
  oComboBox : TAdvComboBox;
begin
  for j := 1 to 5 do
  begin
    stNo := inttostr(aGroupNo) + inttostr(j);
    if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_Mode',strtoint(stNo))
    else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_Mode',strtoint(stNo))
    else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_Mode',strtoint(stNo))
    else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_Mode',strtoint(stNo));
    if oComboBox <> nil then
    begin
      oComboBox.ItemIndex := aDoorMode;
      oComboBox.Color := aColor;//btn_DoorManageMode1.ForeColor;
    end;
  end;
end;

procedure TfmDoorSchedule.ComboBoxModeSetting(aGroupNo, aTimeNo: integer;
  aMode: string);
var
  stNo : string;
  oComboBox : TAdvComboBox;
begin
  stNo := inttostr(aGroupNo) + inttostr(aTimeNo);
  if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_Mode',strtoint(stNo))
  else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_Mode',strtoint(stNo))
  else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_Mode',strtoint(stNo))
  else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_Mode',strtoint(stNo));
  if oComboBox <> nil then
  begin
    oComboBox.ItemIndex := strtoint(aMode);
    cmb_Mode11Change(oComboBox);
    //btn_DoorManageMode1.ForeColor;
  end;
end;

procedure TfmDoorSchedule.ComboBoxTimeSetting(aGroupNo,aTimeNo:integer;aTIME:string);
var
  stNo : string;
  oComboBox : TAdvComboBox;
  stHH : string;
  stMM : string;
  nTemp : integer;
  nIndex : integer;
begin
  stHH := copy(aTIME,1,2);
  stMM := copy(aTIME,3,2);
  if (strtoint(stMM) mod 5) <> 0 then
  begin
    nTemp := (strtoint(stMM) div 5);
    stMM := FillZeroNumber(nTemp,2);
  end;
  stNo := inttostr(aGroupNo) + inttostr(aTimeNo);
  if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_EndHH',strtoint(stNo))
  else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_EndHH',strtoint(stNo))
  else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_EndHH',strtoint(stNo))
  else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_EndHH',strtoint(stNo));
  if oComboBox <> nil then
  begin
    nIndex := oComboBox.Items.IndexOf(stHH);
    oComboBox.ItemIndex := nIndex;
  end;
  if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_EndMM',strtoint(stNo))
  else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_EndMM',strtoint(stNo))
  else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_EndMM',strtoint(stNo))
  else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_EndMM',strtoint(stNo));
  if oComboBox <> nil then
  begin
    nIndex := oComboBox.Items.IndexOf(stMM);
    oComboBox.ItemIndex := nIndex;
  end;
  stNo := inttostr(aGroupNo) + inttostr(aTimeNo + 1);
  if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_StartHH',strtoint(stNo))
  else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_StartHH',strtoint(stNo))
  else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_StartHH',strtoint(stNo))
  else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_StartHH',strtoint(stNo));
  if oComboBox <> nil then
  begin
    nIndex := oComboBox.Items.IndexOf(stHH);
    oComboBox.ItemIndex := nIndex;
  end;
  if aGroupNo = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_WeekGroup),'cmb_StartMM',strtoint(stNo))
  else if aGroupNo = 2 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_Saturday),'cmb_StartMM',strtoint(stNo))
  else if aGroupNo = 3 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_sunday),'cmb_StartMM',strtoint(stNo))
  else if aGroupNo = 4 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(gb_holiday),'cmb_StartMM',strtoint(stNo));
  if oComboBox <> nil then
  begin
    nIndex := oComboBox.Items.IndexOf(stMM);
    oComboBox.ItemIndex := nIndex;
  end;

end;

procedure TfmDoorSchedule.cmb_AddW1ModeChange(Sender: TObject);
begin
  inherited;
  if TComboBox(Sender).ItemIndex = 0 then TComboBox(Sender).Color := clLime
  else if TComboBox(Sender).ItemIndex = 1 then TComboBox(Sender).Color := clGreen
  else if TComboBox(Sender).ItemIndex = 2 then TComboBox(Sender).Color := clRed;
end;

procedure TfmDoorSchedule.cmb_EndHH11Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH12.ItemIndex := cmb_EndHH11.ItemIndex;
end;

procedure TfmDoorSchedule.cmb_EndHH12Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH13.ItemIndex := cmb_EndHH12.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH13Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH14.ItemIndex := cmb_EndHH13.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH14Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH15.ItemIndex := cmb_EndHH14.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH21Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH22.ItemIndex := cmb_EndHH21.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH22Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH23.ItemIndex := cmb_EndHH22.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH23Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH24.ItemIndex := cmb_EndHH23.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH24Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH25.ItemIndex := cmb_EndHH24.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH31Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH32.ItemIndex := cmb_EndHH31.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH32Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH33.ItemIndex := cmb_EndHH32.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH33Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH34.ItemIndex := cmb_EndHH33.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH34Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH35.ItemIndex := cmb_EndHH34.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH41Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH42.ItemIndex := cmb_EndHH41.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH42Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH43.ItemIndex := cmb_EndHH42.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH43Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH44.ItemIndex := cmb_EndHH43.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndHH44Change(Sender: TObject);
begin
  inherited;
  cmb_StartHH45.ItemIndex := cmb_EndHH44.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM11Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM12.ItemIndex := cmb_EndMM11.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM12Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM13.ItemIndex := cmb_EndMM12.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM13Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM14.ItemIndex := cmb_EndMM13.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM14Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM15.ItemIndex := cmb_EndMM14.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM21Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM22.ItemIndex := cmb_EndMM21.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM22Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM23.ItemIndex := cmb_EndMM22.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM23Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM24.ItemIndex := cmb_EndMM23.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM24Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM25.ItemIndex := cmb_EndMM24.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM31Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM32.ItemIndex := cmb_EndMM31.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM32Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM33.ItemIndex := cmb_EndMM32.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM33Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM34.ItemIndex := cmb_EndMM33.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM34Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM35.ItemIndex := cmb_EndMM34.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM41Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM42.ItemIndex := cmb_EndMM41.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM42Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM43.ItemIndex := cmb_EndMM42.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM43Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM44.ItemIndex := cmb_EndMM43.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_EndMM44Change(Sender: TObject);
begin
  inherited;
  cmb_StartMM45.ItemIndex := cmb_EndMM44.ItemIndex ;
end;

procedure TfmDoorSchedule.cmb_Mode11Change(Sender: TObject);
begin
  inherited;
  if TAdvComboBox(Sender).ItemIndex = 0 then TAdvComboBox(Sender).Color := btn_DoorManageMode1.ForeColor
  else if TAdvComboBox(Sender).ItemIndex = 1 then TAdvComboBox(Sender).Color := btn_DoorOpenMode1.ForeColor
  else if TAdvComboBox(Sender).ItemIndex = 2 then TAdvComboBox(Sender).Color := btn_DoorLockMode1.ForeColor;
end;

procedure TfmDoorSchedule.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := List.Top + eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;
end;

procedure TfmDoorSchedule.ed_InsertNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    key := #0;
    btn_AddSaveClick(self);
  end;

end;

procedure TfmDoorSchedule.ed_SearchNameChange(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmDoorSchedule.ed_UpdateNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    key := #0;
    btn_UpdateSaveClick(self);
  end;

end;

procedure TfmDoorSchedule.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
  *)
end;

procedure TfmDoorSchedule.FormChangeEvent(aFormName: integer);
var
  stCode : string;
  stCode1 : string;
  nIndex : integer;
begin

end;

procedure TfmDoorSchedule.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fmMain.FORMENABLE(con_FormBMOSDOORSCHEDULEADMIN,'FALSE');

  BuildingCodeList.Free;
  FloorCodeList.Free;
  DeviceIDCodeList.Free;
  AreaCodeList.Free;
  SetBuildingCodeList.Free;
  SetFloorCodeList.Free;
  SetAreaCodeList.Free;
  UpdateBuildingCodeList.Free;
  UpdateFloorCodeList.Free;
  UpdateAreaCodeList.Free;

  Action := caFree;
end;

procedure TfmDoorSchedule.FormCreate(Sender: TObject);
begin
  inherited;
  L_nPageListMaxCount := 15;
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  DeviceIDCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  SetBuildingCodeList := TStringList.Create;
  SetFloorCodeList := TStringList.Create;
  SetAreaCodeList := TStringList.Create;
  UpdateBuildingCodeList := TStringList.Create;
  UpdateFloorCodeList := TStringList.Create;
  UpdateAreaCodeList := TStringList.Create;

  FontSetting;
end;

procedure TfmDoorSchedule.FormGradeRefresh;
begin
  btn_Add.Enabled := IsInsertGrade;
end;

procedure TfmDoorSchedule.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmDoorSchedule.FormNameSetting: Boolean;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORLIST');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stButtonPrevCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU004');
  btn_AddSave.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_UpdateSave.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  Add.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONADD');
  lb_SearchBuilding.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  lb_SearchName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  sg_List.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONDOORNAME');
  Update.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONUPDATE');
  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');
  lb_ScheuleWork.Caption := dmFormFunction.GetFormName('0','2','COMMONREGSCHEDULE');
  btn_ScheduleSave.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_ScheduleCancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  at_Week.AdvOfficeTabs[0].Caption := dmFormFunction.GetFormName('0','2','COMMONWEEKSCHEDULE');
  at_Saturday.AdvOfficeTabs[0].Caption := dmFormFunction.GetFormName('0','2','COMMONSATSCHEDULE');
  at_Sunday.AdvOfficeTabs[0].Caption := dmFormFunction.GetFormName('0','2','COMMONSUNSCHEDULE');
  at_Holiday.AdvOfficeTabs[0].Caption := dmFormFunction.GetFormName('0','2','COMMONHOLSCHEDULE');
  btn_TimeInit1.Caption := dmFormFunction.GetFormName('0','2','COMMONTIMEINIT');
  btn_TimeInit2.Caption := dmFormFunction.GetFormName('0','2','COMMONTIMEINIT');
  btn_TimeInit3.Caption := dmFormFunction.GetFormName('0','2','COMMONTIMEINIT');
  btn_TimeInit4.Caption := dmFormFunction.GetFormName('0','2','COMMONTIMEINIT');
  btn_DoorManageMode1.Caption := dmFormFunction.GetFormName('0','2','COMMONALLCLOSE');
  btn_DoorManageMode2.Caption := dmFormFunction.GetFormName('0','2','COMMONALLCLOSE');
  btn_DoorManageMode3.Caption := dmFormFunction.GetFormName('0','2','COMMONALLCLOSE');
  btn_DoorManageMode4.Caption := dmFormFunction.GetFormName('0','2','COMMONALLCLOSE');
  btn_DoorOpenMode1.Caption := dmFormFunction.GetFormName('0','2','COMMONALLOPEN');
  btn_DoorOpenMode2.Caption := dmFormFunction.GetFormName('0','2','COMMONALLOPEN');
  btn_DoorOpenMode3.Caption := dmFormFunction.GetFormName('0','2','COMMONALLOPEN');
  btn_DoorOpenMode4.Caption := dmFormFunction.GetFormName('0','2','COMMONALLOPEN');
  btn_DoorLockMode1.Caption := dmFormFunction.GetFormName('0','2','COMMONALLLOCK');
  btn_DoorLockMode2.Caption := dmFormFunction.GetFormName('0','2','COMMONALLLOCK');
  btn_DoorLockMode3.Caption := dmFormFunction.GetFormName('0','2','COMMONALLLOCK');
  btn_DoorLockMode4.Caption := dmFormFunction.GetFormName('0','2','COMMONALLLOCK');
  lb_Section11.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '1';
  lb_Section12.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '2';
  lb_Section13.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '3';
  lb_Section14.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '4';
  lb_Section15.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '5';
  lb_Section21.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '1';
  lb_Section22.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '2';
  lb_Section23.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '3';
  lb_Section24.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '4';
  lb_Section25.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '5';
  lb_Section31.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '1';
  lb_Section32.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '2';
  lb_Section33.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '3';
  lb_Section34.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '4';
  lb_Section35.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '5';
  lb_Section41.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '1';
  lb_Section42.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '2';
  lb_Section43.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '3';
  lb_Section44.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '4';
  lb_Section45.Caption := dmFormFunction.GetFormName('0','2','COMMONSECTION') + '5';
  lb_StartHH11.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH12.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH13.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH14.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH15.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH21.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH22.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH23.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH24.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH25.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH31.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH32.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH33.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH34.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH35.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH41.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH42.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH43.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH44.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH45.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartMM11.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM12.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM13.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM14.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM15.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM21.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM22.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM23.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM24.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM25.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM31.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM32.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM33.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM34.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM35.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM41.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM42.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM43.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM44.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM45.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndHH11.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH12.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH13.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH14.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH15.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH21.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH22.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH23.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH24.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH25.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH31.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH32.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH33.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH34.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH35.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH41.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH42.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH43.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH44.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH45.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndMM11.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM12.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM13.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM14.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM15.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM21.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM22.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM23.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM24.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM25.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM31.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM32.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM33.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM34.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM35.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM41.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM42.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM43.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM44.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM45.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_Mode11.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode12.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode13.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode14.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode15.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode21.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode22.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode23.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode24.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode25.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode31.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode32.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode33.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode34.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode35.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode41.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode42.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode43.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode44.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  lb_Mode45.Caption := dmFormFunction.GetFormName('0','2','COMMONDOORMODE');
  btn_Add.Caption := dmFormFunction.GetFormName('0','2','COMMONREGSCHEDULE');
end;

procedure TfmDoorSchedule.FormResize(Sender: TObject);
begin
  inherited;

  sg_list.Height := List.Height - sg_list.Top - 50;
  sg_list.Width := List.Width - (sg_list.Left * 2);
  sg_list.ColWidths[1] := sg_list.Width - sg_list.ColWidths[0];
  btn_Add.Top := sg_list.Top + sg_list.Height + 10;
  btn_Add.Left := sg_List.Left + sg_List.Width - btn_Add.Width;

  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

  pan_Schedule.Top := (List.Height div 2) - (pan_Schedule.Height div 2);
  pan_Schedule.left := (List.Width div 2) - (pan_Schedule.Width div 2);
  pan_ScheduleResize(pan_Schedule);
  sb_DoorScheduleResize(sb_DoorSchedule);
end;

procedure TfmDoorSchedule.FormShow(Sender: TObject);
var
  stNodeNo : string;
  stBuildingCode : string;
  stFloorCode : string;
  i : integer;
begin
  inherited;
  WindowState := wsMaximized;

  stNodeNo := '';

  FormNameSetting;

  fmMain.FORMENABLE(con_FormBMOSDOORSCHEDULEADMIN,'TRUE');

  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);
  SearchList('');

  List.Visible := True;
  Add.Visible := False;
  List.Align := alClient;
  Update.Visible := False;

  ComboBoxInitialize;
  for i := 1 to 4 do ComboBoxIndexInitialize(i);

  //List.Visible := False;
  //sb_DoorSchedule.Align := alClient;

end;

function TfmDoorSchedule.LoadUpdateSchedule(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  i : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
  nGroup : integer;
begin
  for i := 0 to 3 do
  begin
    if dmDBFunction.CheckTB_DOORSCHEDULE_DayCode(aNodeNo,aEcuID,aDoorNo,inttostr(i)) < 1 then
    begin
      dmDBInsert.InsertIntoTB_DOORSCHEDULE_All(aNodeNo,aEcuID,aDoorNo,inttostr(i),'0500','1200','1300','1800','0000','0','0','0','0','0','N');
    end;
  end;
  stSql := dmDBSelect.SelectTB_DOORSCHEDULE_DoorNo(aNodeNo,aEcuID,aDoorNo);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        nGroup := FindField('DS_DAYCODE').AsInteger + 1;
        ComboBoxTimeSetting(nGroup,1,FindField('DS_TIME1').AsString);
        ComboBoxTimeSetting(nGroup,2,FindField('DS_TIME2').AsString);
        ComboBoxTimeSetting(nGroup,3,FindField('DS_TIME3').AsString);
        ComboBoxTimeSetting(nGroup,4,FindField('DS_TIME4').AsString);
        ComboBoxModeSetting(nGroup,1,FindField('DS_TIMEMODE1').AsString);
        ComboBoxModeSetting(nGroup,2,FindField('DS_TIMEMODE2').AsString);
        ComboBoxModeSetting(nGroup,3,FindField('DS_TIMEMODE3').AsString);
        ComboBoxModeSetting(nGroup,4,FindField('DS_TIMEMODE4').AsString);
        ComboBoxModeSetting(nGroup,5,FindField('DS_TIMEMODE5').AsString);
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorSchedule.pan_ScheduleMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
  inherited;
  ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmDoorSchedule.pan_ScheduleResize(Sender: TObject);
begin
  inherited;
  lb_ScheuleWork.Left := 20;
  btn_ScheduleSave.Top := lb_ScheuleWork.Top + lb_ScheuleWork.Height + 20;
  btn_ScheduleCancel.Top := lb_ScheuleWork.Top + lb_ScheuleWork.Height + 20;
  btn_ScheduleSave.Left := lb_ScheuleWork.Left;
  btn_ScheduleCancel.Left := btn_ScheduleSave.Left + btn_ScheduleSave.Width + 10;
  sb_DoorSchedule.Height := pan_Schedule.Height - (btn_ScheduleSave.Top + btn_ScheduleSave.Height + 10);
end;

procedure TfmDoorSchedule.sb_DoorScheduleMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove = $F012;
begin
  inherited;
 ReleaseCapture;
 (sender as TWinControl).perform(WM_SysCommand, SC_DragMove,0);
end;

procedure TfmDoorSchedule.sb_DoorScheduleResize(Sender: TObject);
begin
  inherited;
  sb_DoorSchedule.VertScrollBar.Position := 0;
  at_Week.Left := 20;
  at_Week.Top := 10;
  at_Week.Width := sb_DoorSchedule.Width - (at_Week.Left * 2);
  Gb_WeekGroup.Left := at_Week.Left;
  Gb_WeekGroup.Top := at_Week.Top + at_Week.Height + 10;
  Gb_WeekGroup.Width := sb_DoorSchedule.Width - (Gb_WeekGroup.Left * 2);

  at_Saturday.Left := at_Week.Left;
  at_Saturday.Top := Gb_WeekGroup.Top + Gb_WeekGroup.Height + 20;
  at_Saturday.Width := sb_DoorSchedule.Width - (at_Saturday.Left * 2);
  gb_Saturday.Left := at_Week.Left;
  gb_Saturday.Top := at_Saturday.Top + at_Saturday.Height + 10;
  gb_Saturday.Width := sb_DoorSchedule.Width - (gb_Saturday.Left * 2);

  at_Sunday.Left := at_Week.Left;
  at_Sunday.Top := gb_Saturday.Top + gb_Saturday.Height + 20;
  at_Sunday.Width := sb_DoorSchedule.Width - (at_Sunday.Left * 2);
  gb_Sunday.Left := at_Week.Left;
  gb_Sunday.Top := at_Sunday.Top + at_Sunday.Height + 10;
  gb_Sunday.Width := sb_DoorSchedule.Width - (gb_Sunday.Left * 2);

  at_Holiday.Left := at_Week.Left;
  at_Holiday.Top := gb_Sunday.Top + gb_Sunday.Height + 20;
  at_Holiday.Width := sb_DoorSchedule.Width - (at_Holiday.Left * 2);
  gb_Holiday.Left := at_Week.Left;
  gb_Holiday.Top := at_Holiday.Top + at_Holiday.Height + 10;
  gb_Holiday.Width := sb_DoorSchedule.Width - (gb_Holiday.Left * 2);


end;

function TfmDoorSchedule.SearchList(aCurrentCode:string;aTopRow:integer = 0): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stBuildingCode : string;
begin
  if ed_BuildingCode.Text = '' then ed_BuildingCode.Text := '0';

  stBuildingCode := ed_BuildingCode.Text;

  GridInit(sg_List,2,2,true);
  stSql := dmDBSelect.SelectTB_DOOR_ScheduleDoorName(stBuildingCode,ed_SearchName.Text);
  L_nCheckCount := 0;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      with sg_List do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('DO_DOORNAME').AsString;
          cells[2,nRow] := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength);
          cells[3,nRow] := FindField('DE_ECUID').AsString;
          cells[4,nRow] := FindField('DO_DOORNO').AsString;
          if (FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('DO_DOORNO').AsString)  = aCurrentCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow = 0 then
        begin
          if Row > (L_nPageListMaxCount - 1) then TopRow := Row - L_nPageListMaxCount;
        end else
        begin
          TopRow := aTopRow;
        end;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure TfmDoorSchedule.sg_ListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nCheckCount := L_nCheckCount + 1
    else L_nCheckCount := L_nCheckCount - 1 ;
  end;
end;

procedure TfmDoorSchedule.sg_ListDblClick(Sender: TObject);
begin
  inherited;
  if Not IsUpdateGrade then Exit;

  with sg_List do
  begin
    ed_UpdateNodeNoCode.Text := cells[2,Row];
    ed_UpdateEcuCode.Text := cells[3,Row];
    ed_UpdateDoorCode.Text := cells[4,Row];
    LoadUpdateSchedule(ed_UpdateNodeNoCode.Text,ed_UpdateEcuCode.Text,ed_UpdateDoorCode.Text);
  end;

  pan_Schedule.Visible := True;
  L_stWorkType := 'UPDATE';

end;

procedure TfmDoorSchedule.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;
  SearchList('');
end;

initialization
  RegisterClass(TfmDoorSchedule);
Finalization
  UnRegisterClass(TfmDoorSchedule);

end.