object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'FBUtility - TrendSoft'
  ClientHeight = 622
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 649
    Height = 622
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'fb settings'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 182
        Width = 641
        Height = 412
        Align = alClient
        Caption = 'query'
        TabOrder = 0
        Visible = False
        object SpeedButton3: TSpeedButton
          Left = 40
          Top = -3
          Width = 23
          Height = 22
          Caption = '+'
          OnClick = SpeedButton3Click
        end
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 637
          Height = 395
          Align = alClient
          TabOrder = 0
          object PageControl2: TPageControl
            Left = 1
            Top = 1
            Width = 635
            Height = 393
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 641
        Height = 130
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 54
          Height = 13
          Caption = 'FB bin path'
        end
        object Label2: TLabel
          Left = 8
          Top = 59
          Width = 70
          Height = 13
          Caption = 'database path'
        end
        object Label3: TLabel
          Left = 88
          Top = 109
          Width = 21
          Height = 13
          Caption = 'user'
        end
        object Label4: TLabel
          Left = 240
          Top = 109
          Width = 46
          Height = 13
          Caption = 'password'
        end
        object Label6: TLabel
          Left = 255
          Top = 80
          Width = 31
          Height = 13
          Caption = 'server'
        end
        object SpeedButton2: TSpeedButton
          Left = 419
          Top = 78
          Width = 23
          Height = 22
          Caption = 'X'
          OnClick = SpeedButton2Click
        end
        object Label7: TLabel
          Left = 448
          Top = 80
          Width = 20
          Height = 13
          Caption = 'port'
        end
        object SpeedButton1: TSpeedButton
          Left = 614
          Top = 105
          Width = 23
          Height = 22
          Caption = 'X'
          OnClick = SpeedButton1Click
        end
        object Label5: TLabel
          Left = 419
          Top = 109
          Width = 74
          Height = 13
          Caption = 'computer name'
        end
        object Button1: TButton
          Left = 102
          Top = 1
          Width = 75
          Height = 25
          Caption = '...'
          TabOrder = 0
          OnClick = Button1Click
        end
        object edtFBBin: TEdit
          Left = 8
          Top = 32
          Width = 405
          Height = 21
          TabOrder = 1
        end
        object edtDBPath: TJvFilenameEdit
          Left = 8
          Top = 77
          Width = 228
          Height = 21
          TabOrder = 2
          Text = ''
        end
        object Button2: TButton
          Left = 8
          Top = 102
          Width = 75
          Height = 25
          Caption = 'set password'
          TabOrder = 3
          OnClick = Button2Click
        end
        object edtuser: TEdit
          Left = 115
          Top = 106
          Width = 121
          Height = 21
          TabOrder = 4
          Text = 'sysdba'
        end
        object edtServer: TEdit
          Left = 292
          Top = 77
          Width = 121
          Height = 21
          TabOrder = 5
        end
        object edtPassword: TEdit
          Left = 292
          Top = 106
          Width = 121
          Height = 21
          PasswordChar = '*'
          TabOrder = 6
          Text = '4rZ~bW-6E=q(!%&'
        end
        object edtPort: TEdit
          Left = 474
          Top = 79
          Width = 71
          Height = 21
          Alignment = taRightJustify
          TabOrder = 7
          Text = '3050'
        end
        object Button3: TButton
          Left = 551
          Top = 75
          Width = 86
          Height = 25
          Caption = 'Connect'
          TabOrder = 8
          OnClick = Button3Click
        end
        object edtComputerName: TEdit
          Left = 499
          Top = 106
          Width = 110
          Height = 21
          TabOrder = 9
        end
      end
      object pnlInfo: TPanel
        Left = 0
        Top = 130
        Width = 641
        Height = 52
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object GroupBox2: TGroupBox
          Left = 6
          Top = 0
          Width = 195
          Height = 48
          Caption = 'sweep'
          TabOrder = 0
          object Label8: TLabel
            Left = 12
            Top = 26
            Width = 47
            Height = 14
            Caption = 'interval: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnSweepInterval: TButton
            Left = 125
            Top = 22
            Width = 62
            Height = 25
            Caption = 'OK'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnSweepIntervalClick
          end
          object edtSweepInterval: TEdit
            Left = 64
            Top = 24
            Width = 61
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '1000'
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'backup/restore'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 641
        Height = 41
        Align = alTop
        TabOrder = 0
        object lblInfoBackupRestore: TLabel
          Left = 169
          Top = 11
          Width = 5
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnBackup: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'backup'
          TabOrder = 0
          OnClick = btnBackupClick
        end
        object btnRestore: TButton
          Left = 88
          Top = 8
          Width = 75
          Height = 25
          Caption = 'restore'
          TabOrder = 1
          OnClick = btnRestoreClick
        end
      end
      object Memo2: TMemo
        Left = 0
        Top = 41
        Width = 641
        Height = 553
        Align = alClient
        TabOrder = 1
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'header info'
      ImageIndex = 2
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 641
        Height = 41
        Align = alTop
        TabOrder = 0
        object Button6: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Run'
          TabOrder = 0
          OnClick = Button6Click
        end
      end
      object Memo3: TMemo
        Left = 0
        Top = 41
        Width = 641
        Height = 553
        Align = alClient
        TabOrder = 1
      end
    end
  end
  object JvSelectDirectory1: TJvSelectDirectory
    ClassicDialog = False
    Left = 216
  end
  object FDConnection1: TFDConnection
    Left = 248
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrNone
    Left = 280
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 312
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    Left = 600
    Top = 184
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 344
  end
  object OpenDialog1: TOpenDialog
    Filter = 'fdb|*.fdb'
    Left = 480
    Top = 232
  end
  object OpenDialog2: TOpenDialog
    Filter = 'fbk|*.fbk'
    Left = 508
    Top = 232
  end
end
