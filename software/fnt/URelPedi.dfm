ÿ
 TFRMRELATORIO 0w  TPF0TfrmRelatoriofrmRelatorioLeft¤Top{BorderIconsbiSystemMenu
biMinimize BorderStylebsSingleCaptionRelatórios ModeloClientHeightXClientWidthfColor	clBtnFace
ParentFont	Menu	MainMenu1OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreate	OnDestroyFormDestroyOnShowFormShowPixelsPerInch`
TextHeight TPanelPLeftLeft TopWidth	Height)AlignalLeft
BevelOuterbvNoneParentColor	TabOrder   TPanelPanel5Left	TopWidthTHeight)AlignalClient
BevelOuterbvNoneParentColor	TabOrder 	TGroupBox	gbPeriodoLeft TopqWidthTHeightWAlignalTopCaption	 Período TabOrder  TLabel
LDtInicialLeftTop(Width5HeightCaptionData &Inicial  TLabelLDtFinalLeftà Top(Width0HeightCaptionData &Final  	TComboBox	cbPeriodoLeftTopWidth9HeightHintPeríodos de datas padrãoStylecsOwnerDrawFixedCtl3D
ItemHeightParentCtl3DParentShowHintShowHint	TabOrder OnChangecbPeriodoChangeItems.Strings	Dia atualDia anteriorSemana atualSemana anterior	Mês atualMês anterior	Ano atualAno anterior   TDateTimePickerdtpDataInicialLeftTop8WidthYHeightHint&Data inicial para geração do relatórioCalAlignmentdtaLeftDate ðßÜa@Time ðßÜa@
DateFormatdfShortDateMode
dmComboBoxKinddtkDate
ParseInputParentShowHintShowHint	TabOrder  TDateTimePickerdtpDataFinalLeftà Top8WidthYHeightHint$Data final para geração do relatórioCalAlignmentdtaLeftDate ðßÜa@Time ðßÜa@
DateFormatdfShortDateMode
dmComboBoxKinddtkDate
ParseInputParentShowHintShowHint	TabOrder   	TGroupBox	gbClienteLeft Topù WidthTHeight*AlignalTopCaption	 Cliente TabOrderVisible TEdit	edtCodigoLeftTopWidthiHeightHintCódigo do clienteCtl3D		MaxLengthParentCtl3DTabOrder    	TGroupBoxgbEntregadorLeft TopÈ WidthTHeight1AlignalTopCaption Entregador TabOrderVisible TDBLookupComboBoxdblcEntregadorLeftTopWidth HeightHintSeleção do entregadorKeyFieldCONTADOR	ListFieldNOME
ListSourcedsqEntregadorTabOrder    TPageControlpcRelatorioLeft Top WidthTHeightq
ActivePagetshGeralAlignalTopTabOrder 	TTabSheettshGeralCaption&Geral TListBoxlbxGeralLeft Top WidthLHeightUHintSeleção de relatórios geraisAlignalClientColorååå Ctl3DExtendedSelect
ItemHeightItems.StringsVendas no período por produtoVendas no período por grupo Pedidos no periodoClientes Ativos no periodoClientes Inativos no periodoHistórico do Cliente!Fechamento com forma de pagamento ParentCtl3DParentShowHintShowHint	TabOrder OnClicklbxGeralClickOnExitlbxGeralClick   	TTabSheettshTeleCaption&Tele
ImageIndex TListBoxlbxTeleLeft Top WidthLHeightUHint2Seleção de relatórios especiais para tele-entregasAlignalClientColorååå Ctl3DExtendedSelect
ItemHeightItems.Strings+Pedidos expedidos por entregador no período*Soma de comissão por entregador no períodoTotal de comissão no período ParentCtl3DParentShowHintShowHint	TabOrder OnClicklbxTeleClickOnExitlbxTeleClick   	TTabSheet
tshComandaCaption&Comanda
ImageIndex TListBox	lbComandaLeft Top WidthLHeightUHintKSeleção de relatórios especiais para estabelecimentos que utilizam comandasAlignalClientColorååå Ctl3DExtendedSelect
ItemHeightItems.StringsComandas no período ParentCtl3DParentShowHintShowHint	TabOrder OnClicklbComandaClickOnExitlbComandaClick     TPanelPTopLeft Top WidthfHeightAlignalTop
BevelOuterbvNoneParentColor	TabOrder TLabelLRelLeftTop WidthmHeightCaptionSelecione um Relatório   TPanelPanel1Left]TopWidth	Height)AlignalRight
BevelOuterbvNoneParentColor	TabOrder  TPanelPanel2Left Top:WidthfHeightAlignalBottom
BevelOuterbvNoneParentColor	TabOrder TBitBtnbtnImprimirLeftxTop WidthqHeightHint+Visualizar/Imprimir o relatório selecionadoCaptionImprimirTabOrder OnClickbtnImprimirClick
Glyph.Data
Ò  Î  BMÎ      6   (   $              Î  Î                                                                                                                                      ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿   ¿¿¿                                                             ¿¿¿             ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿ ÿÿ ÿÿ ÿÿ¿¿¿¿¿¿                             ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿   ¿¿¿                                                         ¿¿¿¿¿¿            ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿   ¿¿¿   ¿¿¿                                                  ¿¿¿   ¿¿¿                  ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ   ¿¿¿   ¿¿¿                         ÿÿÿ               ÿÿÿ                             ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ                               ÿÿÿ               ÿÿÿ                          ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ                                                                                                                                           	NumGlyphs   	TMainMenu	MainMenu1Top 	TMenuItemMIRelatorioCaption
&Relatório
GroupIndex 	TMenuItem
SMImprimirCaption	&ImprimirShortCutP@OnClickbtnImprimirClick  	TMenuItemSMN1Caption-
GroupIndex  	TMenuItemSMConfigurarImpressoraCaption&Configurar Impressora
GroupIndexOnClickSMConfigurarImpressoraClick   	TMenuItemFechar1CaptionFechar
GroupIndexVisible 	TMenuItemFechar2Caption&FecharShortCutOnClickFechar2Click    TQuery
qRelatorioDatabaseName
DBCommerceLeftTopY  TPrinterSetupDialogPSDTop8  TDataSourcedsqEntregadorDataSetFTabTele.qryEntregadorTopy   