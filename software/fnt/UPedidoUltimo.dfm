�
 TFRMPEDIDOULTIMO 0g  TPF0TfrmPedidoUltimofrmPedidoUltimoLeft� Top� BorderIconsbiSystemMenu BorderStylebsSingleClientHeight*ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelpanItensPedidoLeft Top1Width�Height� AlignalClient
BevelOuterbvNoneBorderWidthCtl3DParentColor	ParentCtl3DTabOrder  TDBGridDBGrid2LeftTopWidth�HeightzAlignalClientColor��� 
DataSource	dsItePedi
FixedColorclActiveCaptionFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWhiteTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style Columns	AlignmenttaCenterExpanded	FieldNamecodigoReadOnly	Title.AlignmenttaCenterTitle.CaptionC�digoWidth4Visible	 Expanded	FieldNamenomeTitle.CaptionNome do ProdutoWidth� Visible	 	AlignmenttaCenterExpanded	FieldName	qtProdutoTitle.AlignmenttaCenterTitle.CaptionQtWidthVisible	 Expanded	FieldNameqtPedacoTitle.Caption/Width	Visible	 Expanded	FieldNameiteTotalTitle.CaptionValor TotalWidth<Visible	 Expanded	FieldNameiteObsTitle.Caption
Observa��oWidth� Visible	     TPanel	panBotoesLeft Top	Width�Height!AlignalBottom
BevelOuterbvNoneParentColor	TabOrder TBitBtn	btnCopiarLeftHTop WidthiHeightHint=Copiar os produtos (Fazer um novo pedido com os mesmos itens)CaptionCopiar (Ctrl+U)TabOrder OnClickBtCopiarClick  TBitBtnbtnImprimirLeft� Top WidthiHeightHintRe-impress�o do cupomCaptionImprimir (Ctrl+P)TabOrderOnClickBtImprimirClick  TBitBtn
btnExcluirLeft(Top WidthiHeightHintExcluir o pedidoCaptionExcluir (Ctrl+Del)TabOrderOnClickBtExcluirClick   TPanelpanDadosPedidoLeft Top� Width�HeightTAlignalBottom
BevelOuterbvNoneParentColor	TabOrder TLabellabAtendenteLeftTop(Width1HeightCaption	Atendente  TLabellabAcrescimoLeft� Top(WidthHHeightCaptionAcr�sc./-Desc.  TLabellabTaxaDeEntregaLeftTop(Width6HeightCaptionTx. entrega  TLabel	labVlPagoLeftPTop(Width3HeightCaption
Valor pago  TLabel
labVlTotalLeft�Top(Width3HeightCaptionValor Total  TLabelLabHoraPrevisaoLeft�Top Width*HeightCaption	Hr. Prev.  TLabellabObsLeft� Top WidthnHeightCaptionObserva��o do cliente:  TLabellabFormaPagamentoLeftTop WidthtHeightCaptionForma e dias pagamento  TEditedtVendedorLeftTop8Width� HeightColor��� ReadOnly	TabOrder  TEditedtObsLeft� TopWidth� HeightColor��� ReadOnly	TabOrder  TEditedtDiasLeft� TopWidth)HeightColor��� ReadOnly	TabOrder  TEditedtFormaLeftTopWidthyHeightColor��� ReadOnly	TabOrder   TEditedtAcrescimoLeft� Top8WidthYHeightColor��� ReadOnly	TabOrder  TEditedtTaxaDeEntregaLeftTop8WidthAHeightColor��� ReadOnly	TabOrder  TEdit	edtVlPagoLeftPTop7WidthAHeightColor��� ReadOnly	TabOrder  TEdit
edtVlTotalLeft�Top7WidthAHeightColor��� ReadOnly	TabOrder  TDateTimePickeredtHoraPrevistaLeft�TopWidthIHeightCalAlignmentdtaLeftDate  8��B�@Time  8��B�@Color��� 
DateFormatdfShortDateMode
dmComboBoxEnabledKinddtkTime
ParseInputTabOrder   TPanel
panClienteLeft Top Width�Height1AlignalTop
BevelOuterbvNoneParentColor	TabOrder TLabellabNomeLeftXTop WidthHeightCaptionNome  TLabel	labCodigoLeftTop Width HeightCaptionCliente  TLabellabDataPedidoLeft@Top WidthlHeightCaptionData e Hora do pedido  TLabelLabel3LeftTop$WidthIHeightCaptionItens do pedido  TLabellabNumeroPedidoLeftTop Width3HeightCaption
N�  Pedido  TEditedtNomeLeftXTopWidth� HeightColor��� Ctl3D	ParentCtl3DReadOnly	TabOrder  TEditedtTelefoneLeftTopWidthIHeightColor��� Ctl3D	ParentCtl3DReadOnly	TabOrder   TDateTimePickeredtDataPedidoLeft@TopWidthYHeightCalAlignmentdtaLeftDate  8��B�@Time  8��B�@Color��� 
DateFormatdfShortDateMode
dmComboBoxEnabledKinddtkDate
ParseInputTabOrder  TDateTimePickeredtHoraPedidoLeft�TopWidthIHeightCalAlignmentdtaLeftDate  8��B�@Time  8��B�@Color��� 
DateFormatdfShortDateMode
dmComboBoxEnabledKinddtkTime
ParseInputTabOrder  TEditedtNumeroPedidoLeftTopWidth1HeightColor��� Ctl3D	ParentCtl3DReadOnly	TabOrder   TPrintDialogPDTop   	TMainMenu	MainMenu1LeftTop 	TMenuItemMUltimoPedidoCaption&�ltimo pedido 	TMenuItemSMCopiarPedidoCaption&Copiar PedidoShortCutU@OnClickBtCopiarClick  	TMenuItemSMImprimirPedidoCaption	&ImprimirShortCutP@OnClickBtImprimirClick  	TMenuItemSMPedidoAnteriorCaption	&AnteriorShortCut"@OnClickBtAnteriorClick  	TMenuItemSMProximoPedidoCaption&Pr�ximoShortCut!@OnClickBtProximoClick  	TMenuItemSMExcluirPedidoCaption&ExcluirShortCut.@OnClickBtExcluirClick   	TMenuItemMFecharCaption&FecharShortCuts@ 	TMenuItemFechar1Caption&FecharShortCutOnClickFechar1Click    TDataSource	dsItePediDataSet
qryItePediTop`  TQuery
qryItePediDatabaseName
DBCommerceTopA  TQueryqryTempDatabaseName
DBCommerceLeft(TopA   