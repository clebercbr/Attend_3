�
 TFRMPEDIDOEXPEDICAO 0  TPF0TfrmPedidoExpedicaofrmPedidoExpedicaoLeftTop� Width�Height�CaptionControle de expedi��oColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	FormStyle
fsMDIChildMenu	MainMenu1OldCreateOrder	PositionpoScreenCenterVisible	OnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelPLogoLeft Top Width9HeightaAlignalLeft
BevelOuterbvNoneParentColor	TabOrder  TPanelPanel9Left Top Width9HeightIAlignalTop
BevelOuterbvNoneParentColor	TabOrder  TLabelLabel12Left Top Width4HeightCaption&Entregador  TLabelLabel1LeftTopWidthnHeightCaptionLan�ar pelo N� Pedido:FocusControledtPesquisaPedido  TLabelLabel2Left� Top WidthMHeightCaption&Data da entrega  TDBLookupComboBoxlcbEntregadorLeftTop0Width� HeightHintSele��o de entregadorKeyFieldCONTADOR	ListFieldNOME
ListSourcedsqEntregadorTabOrder OnClicklcbEntregadorClick  TDateTimePickerdtpDataLeft� Top0WidthaHeightHintData da expedi��o do pedidoCalAlignmentdtaLeftDate      >�@Time      >�@
DateFormatdfShortDateMode
dmComboBoxKinddtkDate
ParseInputTabOrderOnChangelcbEntregadorClick  TEditedtPesquisaPedidoLeftxTop WidthiHeightHint9Lan�amento de pedidos expedidos ao entregador selecionadoTabOrder
OnKeyPressdblcEntregadorKeyPress   TPanelPanel1Left TopIWidth9HeightAlignalClient
BevelOuterbvNoneBorderWidthParentColor	TabOrder TDBGriddbgPedidoDoEntregadorLeftTopWidth/Height� HintAPedidos expedidos pelo entregador selecionado na data selecionadaAlignalClient
DataSourcedsqPedidoDoEntregadorOptionsdgTitlesdgIndicator
dgColLines
dgRowLinesdgTabsdgConfirmDelete 	PopupMenu
PopupMenu2TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameNUMEROPEDIDOTitle.CaptionPedidoWidth(Visible	 Expanded	FieldName
DATAPEDIDOTitle.CaptionPedidoWidthnVisible	 Expanded	FieldNameDATAENTREGATitle.CaptionEntregaWidthnVisible	 Expanded	FieldNameNOMECLIENTETitle.CaptionClienteWidth� Visible	    TPanelPanel7LeftTopWidth/HeightAlignalTop
BevelOuterbvNoneParentColor	TabOrder TLabelLPedidoExpedidoLeft Top Width� HeightCaption.Expedidos pelo entregador na data selecionada:     TPanelPCamposLeft9Top WidthDHeightaAlignalClient
BevelOuterbvNoneBorderWidthParentColor	TabOrder TPanelPanel4LeftTopWidth:HeightAlignalTop
BevelOuterbvNoneParentColor	TabOrder  TLabelLPedidoLeft Top WidthgHeightCaptionPedido &n�o expedido:   TDBGrid	dbgPedidoLeftTopWidth:HeightFHint$Grade de pedidos ainda n�o expedidosAlignalClient
DataSourcedsqPedidoNaoExpedidoOptionsdgTitlesdgIndicator
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgMultiSelect 	PopupMenu
PopupMenu1TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameNUMEROPEDIDOTitle.CaptionPedidoWidth(Visible	 Expanded	FieldName
DATAPEDIDOTitle.CaptionData do PedidoWidthnVisible	 Expanded	FieldNameNOMECLIENTETitle.CaptionClienteWidth� Visible	     	TMainMenu	MainMenu1 	TMenuItem
MExpedicaoCaption
&Expedi��o
GroupIndex 	TMenuItemsm1ComissaodoEntregadorCaptionComiss�o do Entregador
GroupIndexOnClicksm1ComissaodoEntregadorClick   	TMenuItemMOcultoCaptionOculto
GroupIndexVisible 	TMenuItemSMGradedepedidosCaptionGrade de pedidosShortCutv  	TMenuItemFechar1CaptionFecharShortCutOnClickFechar1Click    TQueryqryPedidoNaoExpedidoDatabaseName
DBCommerceSQL.StringsSELECT	PEDIDO.CONTADOR,	PEDIDO.NUMEROPEDIDO,	PEDIDO.DATAPEDIDO,	CLIENTE.NOME AS NOMECLIENTEFROM	PEDIDO,	CLIENTEWHERE	PEDIDO.IDENTREGADOR = -1AND$	CLIENTE.CONTADOR = PEDIDO.IDCLIENTEORDER BY	PEDIDO.NUMEROPEDIDO ASC,	PEDIDO.DATAPEDIDO DESC      Left�Top�   TDataSourcedsqPedidoNaoExpedidoDataSetqryPedidoNaoExpedidoLeft�Top�   TQueryqryEntregadorDatabaseName
DBCommerceSQL.StringsSELECT
	CONTADOR,	NOMEFROM	ENTREGADOR Left� Top  TDataSourcedsqEntregadorDataSetqryEntregadorLeft� Top  TQueryqryPedidoDoEntregadorDatabaseName
DBCommerceSQL.StringsSELECT	PEDIDO.CONTADOR,	PEDIDO.NUMEROPEDIDO,	PEDIDO.DATAPEDIDO,	CLIENTE.NOME AS NOMECLIENTEFROM	PEDIDO,	CLIENTEWHERE	PEDIDO.IDENTREGADOR = -1AND$	CLIENTE.CONTADOR = PEDIDO.IDCLIENTE    LeftXTop�   TDataSourcedsqPedidoDoEntregadorDataSetqryPedidoDoEntregadorLeftxTop�   
TPopupMenu
PopupMenu1Left�Top�  	TMenuItem	mitLancarCaptionLancarOnClickmitLancarClick   TQueryqryTemporariaDatabaseName
DBCommerceTop   
TPopupMenu
PopupMenu2Left� Top�  	TMenuItem	mitVoltarCaptionVoltarOnClickmitLancarClick    