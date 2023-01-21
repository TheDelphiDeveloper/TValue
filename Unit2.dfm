object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 389
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object BotaoTPerson: TButton
    Left = 622
    Top = 140
    Width = 75
    Height = 25
    Caption = 'TPerson'
    TabOrder = 0
    OnClick = BotaoTPersonClick
  end
  object memoDoTPerson: TMemo
    Left = 8
    Top = 8
    Width = 689
    Height = 121
    TabOrder = 1
  end
  object memoDoTPoint: TMemo
    Left = 8
    Top = 176
    Width = 689
    Height = 137
    TabOrder = 2
  end
  object BotaoTPoint: TButton
    Left = 622
    Top = 335
    Width = 75
    Height = 25
    Caption = 'TPoint'
    TabOrder = 3
    OnClick = BotaoTPointClick
  end
end
