object frmMensagemLicenca: TfrmMensagemLicenca
  Left = 400
  Top = 307
  Width = 314
  Height = 133
  BorderIcons = [biSystemMenu]
  Caption = 'Mensagem Licen�a'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object memMensagem: TMemo
    Left = 8
    Top = 8
    Width = 289
    Height = 49
    Color = clBtnFace
    Ctl3D = False
    Lines.Strings = (
      'Seu aplicativo n�o est� registrado, � ilegal utiliz�-lo sem '
      'possuir uma licen�a. No menu "Ajuda" sub-menu "Licen�a" '
      'h� instru��es de como registrar sua c�pia.')
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
  end
  object btnRegistrarDepois: TBitBtn
    Left = 72
    Top = 72
    Width = 161
    Height = 25
    Caption = 'Registrar Depois'
    Enabled = False
    TabOrder = 1
    OnClick = btnRegistrarDepoisClick
  end
  object timLicenca: TTimer
    OnTimer = timLicencaTimer
    Left = 8
    Top = 64
  end
end
