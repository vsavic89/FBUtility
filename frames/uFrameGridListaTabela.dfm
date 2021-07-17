object frameGridListaTabela: TframeGridListaTabela
  Left = 0
  Top = 0
  Width = 594
  Height = 244
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 244
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 272
    ExplicitTop = 80
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlGridTabele: TPanel
      Left = 1
      Top = 1
      Width = 592
      Height = 205
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 676
      ExplicitHeight = 302
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 590
        Height = 178
        Align = alClient
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 179
        Width = 590
        Height = 25
        DataSource = DataSource1
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 276
        ExplicitWidth = 674
      end
    end
    object pnlInfoSQL: TPanel
      Left = 1
      Top = 206
      Width = 592
      Height = 37
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitTop = 303
      ExplicitWidth = 676
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 416
    Top = 70
  end
  object FDQuery1: TFDQuery
    Connection = frmMain.FDConnection1
    Transaction = frmMain.FDTransaction1
    Left = 368
    Top = 72
  end
end
