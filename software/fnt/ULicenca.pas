//-----------------------------------------------------------------------------------------------
unit ULicenca;
//-----------------------------------------------------------------------------------------------
interface
//-----------------------------------------------------------------------------------------------
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Psock, NMsmtp, ComCtrls, NMMSG, Registry,
  UVerificaLicenca, UMensagemLicenca, Menus;
//-----------------------------------------------------------------------------------------------
type
	TfrmLicenca = class(TForm)
		NMSMTP1: TNMSMTP;
		pcEnviar: TPageControl;
		tsEnviar: TTabSheet;
		tsStatus: TTabSheet;
		rgOpcao: TRadioGroup;
		btEnviar: TBitBtn;
		tsIntrucoes: TTabSheet;
		mmInstrucoes: TMemo;
		mmStatus: TMemo;
		Mensagem: TTabSheet;
		mmMensagem: TMemo;
		Panel1: TPanel;
		gbChave: TGroupBox;
		meLicenca: TMaskEdit;
		btRegistrar: TBitBtn;
		Panel2: TPanel;
		gbProprietario: TGroupBox;
		labEmpresa: TLabel;
		labNomeProprietario: TLabel;
		labDDD: TLabel;
		labTelefones: TLabel;
		Label1: TLabel;
		labWebSite: TLabel;
		Label2: TLabel;
		Label3: TLabel;
		edtEmpresa: TEdit;
		edtNome: TEdit;
		edtDDD: TEdit;
		edtTelefone1: TEdit;
		edtTelefone2: TEdit;
		edtTelefone3: TEdit;
		edtEMail: TEdit;
		edtWebSite: TEdit;
		meCEP: TMaskEdit;
		edtNumero: TEdit;
    MainMenu1: TMainMenu;
    mitLicenca: TMenuItem;
    mitFechar: TMenuItem;
		procedure btEnviarClick(Sender: TObject);
		procedure FormShow(Sender: TObject);
		procedure NMSMTP1Status(Sender: TComponent; Status: String);
		procedure btRegistrarClick(Sender: TObject);
		procedure NMSMTP1Success(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
	 procedure FormDestroy(Sender: TObject);
    procedure mitFecharClick(Sender: TObject);
	private
		{ Private declarations }
		nomeSoftware : string;
	public
		{ Public declarations }
		//-- Verifica se a licen�a � v�lida
		function retornarRegistro(p_mostraMsgDemo: Bool): bool;
		procedure setarDadosEmpresa(p_EMail, p_WebSite, p_Fone, p_Smtp : string);
		procedure setNomeSoftware(p_nome: string);
		procedure mostrarMsgPedidoDeRegistro();
		procedure carregarCampos();
		procedure setarParametros(p_A,p_B,p_C,p_D,p_E,p_F,p_H,p_J,p_K,p_L,p_N,p_O:Integer);
	end;
//-----------------------------------------------------------------------------------------------
var	frmLicenca: TfrmLicenca;
		verifLicenca : VerificaLicenca;
		qtDias: integer;
		const qtDiasDEMO: integer = 45;
		emailEmpresa: string = ''; //-- Setado atrav�s da fun��o setarDadosEmpresa
		foneEmpresa: string = '';  //-- Setado atrav�s da fun��o setarDadosEmpresa
		websiteEmpresa: string = '';  //-- Setado atrav�s da fun��o setarDadosEmpresa
//-----------------------------------------------------------------------------------------------
implementation {$R *.DFM}
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.btEnviarClick(Sender: TObject);
var	recipientes: string;
		recipientesCC: string;
		MemStatus: TMemoryStatus;
		SysInfo: TSystemInfo;
		OVI: TOSVersionInfo; //-- stores the obtained extended information about the version of the operating system via GetVersionEx()
		CurVerKey : PChar; //-- To store the Windows Version from Registery
begin
//Informa��es a serem capturadas:
//- Porta em que esta configurado o programa (Automatiza)
//- Processador
//- qt memoria
//- Resolu��o
//- Onde esta o mouse
//- vers�o do windows
//- portas serias disponiveis

	pcEnviar.ActivePage := tsStatus;
	//-- Encreve no status
	mmStatus.Lines.Add('Compondo mensagem a ser enviada');

//	recipientes := '<'+NMSMTP1.UserId+'>, <'+emailEmpresa+'>';
	recipientes := '<'+NMSMTP1.UserId+'>';
	if (Length(edtEMail.Text) > 2) then recipientesCC := '<'+edtEMail.Text+'>' else recipientesCC := '';
	mmMensagem.Clear();
	mmMensagem.Lines.Add('-- DADOS DO PROPRIET�RIO DA LICEN�A --');
	mmMensagem.Lines.Add('Nome         : '+edtNome.Text);
	mmMensagem.Lines.Add('Empresa      : '+edtEmpresa.Text);
	mmMensagem.Lines.Add('CEP          : '+meCEP.Text);
	mmMensagem.Lines.Add('N�mero       : '+edtNumero.Text);
	mmMensagem.Lines.Add('DDD          : '+edtDDD.Text);
	mmMensagem.Lines.Add('Telefone1    : '+edtTelefone1.Text);
	mmMensagem.Lines.Add('Telefone2    : '+edtTelefone2.Text);
	mmMensagem.Lines.Add('Telefone3    : '+edtTelefone3.Text);
	mmMensagem.Lines.Add('e-mail       : '+edtEMail.Text);
	mmMensagem.Lines.Add('web-site     : '+edtWebSite.Text);
	mmMensagem.Lines.Add('Data         : '+DateTimeToStr(Now()));
	mmMensagem.Lines.Add('-- ASSUNTO --');
	mmMensagem.Lines.Add('Software     : '+nomeSoftware);
	mmMensagem.Lines.Add('Op��o        : '+rgOpcao.Items[rgOpcao.ItemIndex]);
	mmMensagem.Lines.Add('-- CARACTER�STICAS DO COMPUTADOR --');
	//-- Get type of processor
	GetSystemInfo(SysInfo);
	mmMensagem.Lines.Add('- Processador -');
	mmMensagem.Lines.Add(' Quantidade  : '+IntToStr(SysInfo.dwNumberOfProcessors));
	case SysInfo.dwProcessorType of
		386 : mmMensagem.Lines.Add(' Tipo        : '+'80386');
		486 : mmMensagem.Lines.Add(' Tipo        : '+'80486');
		586 : mmMensagem.Lines.Add(' Tipo        : '+'Pentium');
	else mmMensagem.Lines.Add(' Tipo        : '+Format('Unknown (%d)',[SysInfo.dwProcessorType]));
	end;
	//-- Get the Memory Status
	mmMensagem.Lines.Add('- Memoria RAM -');
	MemStatus.dwLength := SizeOf(MemStatus);
	GlobalMemoryStatus(MemStatus);
	mmMensagem.Lines.Add(' Virt. disp. : '+FormatFloat('#," MB"', MemStatus.dwAvailVirtual DIV 1048576));
	mmMensagem.Lines.Add(' Virt. total : '+FormatFloat('#," MB"', MemStatus.dwTotalVirtual DIV 1048576));
	mmMensagem.Lines.Add(' Fis. disp.  : '+FormatFloat('#," MB"', MemStatus.dwAvailPhys DIV 1048576));
	mmMensagem.Lines.Add(' Fis. total  : '+FormatFloat('#," MB"', MemStatus.dwTotalPhys DIV 1048576));
	mmMensagem.Lines.Add(' Em uso      : '+Format('%d%% Load', [MemStatus.dwMemoryLoad]));
	//-- Operation System Information
	mmMensagem.Lines.Add('- Sistema -');
	OVI.dwOSVersionInfoSize := SizeOf(OVI);
	GetVersionEx(OVI);
	case OVI.dwPlatformID of
		VER_PLATFORM_WIN32_WINDOWS : begin
			CurVerKey := '\SOFTWARE\Microsoft\Windows\CurrentVersion';
			mmMensagem.Lines.Add(' Plataforma  : '+'Windows 9x');
		end;
		VER_PLATFORM_WIN32_NT		: begin
			CurVerKey := '\SOFTWARE\Microsoft\Windows NT\CurrentVersion';
			mmMensagem.Lines.Add(' Plataforma  : '+'Windows NT');
		end;
	else
		CurVerKey := nil;
		mmMensagem.Lines.Add(' Plataforma  : '+'Desconhecida');
	end;
	mmMensagem.Lines.Add(' Ver. Windows: '+Format('Version %d.%.2d', [OVI.dwMajorVersion, OVI.dwMinorVersion]));
	//-- Using Registry to get information about FPU, Windows CD Serial Number,
	//-- User Name and Company Name
	with TRegistry.Create do begin
		try
			RootKey := HKEY_LOCAL_MACHINE;
			if OpenKey(CurVerKey, False) then begin
				mmMensagem.Lines.Add(' Usu�rio     : '+ReadString('RegisteredOwner'));
				mmMensagem.Lines.Add(' Empresa     : '+ReadString('RegisteredOrganization'));
				if OVI.dwPlatformID = VER_PLATFORM_WIN32_WINDOWS then	mmMensagem.Lines.Add(' Win. Serial  : '+'ID#: ' + ReadString('ProductID'));
			end;
		finally
			Free;
		end;
	end;

	//-- Encreve no status
	mmStatus.Lines.Add('Mensagem composta com sucesso!');

	//-- Encreve no status
	mmStatus.Lines.Add('Enviando Mensagem por e-mail!');
	//-- Envia e-mail
	try
		if (Length(edtNome.Text) > 2)and(Length(edtEmpresa.Text) > 2)and
			(Length(meCEP.Text) > 2)and(Length(edtNumero.Text) > 0)and
			(Length(edtDDD.Text) > 1)and(Length(edtTelefone1.Text) > 5) then begin
			NMSMTP1.Connect();
			if (NMSMTP1.Connected) then begin
				NMSMTP1.ClearParams := false;
				NMSMTP1.SubType     := mtPlain;
				NMSMTP1.EncodeType  := uuMime;
				NMSMTP1.PostMessage.FromAddress            := NMSMTP1.UserId;
				NMSMTP1.PostMessage.FromName               := NMSMTP1.UserId;
				NMSMTP1.PostMessage.ToAddress.Text         := recipientes;
				NMSMTP1.PostMessage.ToCarbonCopy.Text      := recipientesCC;
				NMSMTP1.PostMessage.ToBlindCarbonCopy.Text := '<clebercbr@gmail.com>';
				NMSMTP1.PostMessage.Body.Text              := mmMensagem.Text;
				NMSMTP1.PostMessage.Attachments.Text       := '';
				NMSMTP1.PostMessage.Subject                := 'Licenca '+nomeSoftware;
				NMSMTP1.PostMessage.LocalProgram           := nomeSoftware;
				NMSMTP1.PostMessage.Date                   := DateTimeToStr(Now());
				NMSMTP1.PostMessage.ReplyTo                := NMSMTP1.UserId;
				NMSMTP1.SendMail;
				NMSMTP1.Disconnect;
			end else begin
				MessageDlg('Ocorreu um erro ap�s a conex�o!', mtError, [mbOk], 0);
				//-- Encreve no status
				mmStatus.Lines.Add('Ocorreu um erro ap�s a conex�o!');
			end;
		end else begin
			MessageDlg('� necess�rio preencher os campos obrigat�rios (marcados com *).'+edtEMail.Text, mtInformation, [mbOk], 0);
			//-- Encreve no status
			mmStatus.Lines.Add('Algum(ns) campo(s) precisa(m) ser preencido(s)!');
		end;
	except
		if (NMSMTP1.Connected) then NMSMTP1.Disconnect();
		MessageDlg('Erro ao enviar e-mail!', mtError, [mbOk], 0);
		//-- Encreve no status
		mmStatus.Lines.Add('Erro ao enviar e-mail!');
	end;
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.FormShow(Sender: TObject);
begin
	edtNome.SetFocus;
	mmInstrucoes.Lines.Clear();
	mmInstrucoes.Lines.Add('DIGA N�O � PIRATARIA!');
	mmInstrucoes.Lines.Add('+ Cada licen�a deste software d� direito a uso irrestrito a 01 computador. Para utilizar em outros computadores � necess�rio adquirir outras licen�as;');
	mmInstrucoes.Lines.Add('+ A licen�a consiste em um c�digo �nico com o seguinte formato: xxxx-xxxx-xxxx-xxxx;');
	mmInstrucoes.Lines.Add('+ O cliente deve guardar este c�digo e pode utiliz�-lo se necessitar transferir o software para um outro computador, desinstalando o software do primeiro;');
	mmInstrucoes.Lines.Add('+ A Softiza respeita seus clientes, mesmo quando o programa n�o est� licenciado, por qualquer raz�o, TODAS as fun��es do programa continuam dispon�veis;');
	mmInstrucoes.Lines.Add('+ Utilize o tempo de DEMONSTRA��O para entrar em contato com a Softiza para licenci�-lo;');
	mmInstrucoes.Lines.Add('+ ATEN��O: N�o deixe ser enganado! A licen�a � um c�digo �nico, para ter acesso ao servi�o de suporte este c�digo ser� verificado em nosso registros. S� adquira licen�a de parceiros autorizados;');
	mmInstrucoes.Lines.Add('+ Para registrar:');
	mmInstrucoes.Lines.Add('+ Envie seus dados atrav�s do formul�rio de licen�a, para tal � necess�rio estar conectado � internet;');
	mmInstrucoes.Lines.Add('+ O registro pode ser feito:');
	mmInstrucoes.Lines.Add('  - Atrav�s desta janela de licen�a digitando os dados e clicando em ENVIAR (Verifique disponibilidade de acesso � internet);');
	mmInstrucoes.Lines.Add('  - Em contato atrav�s do site: '+websiteEmpresa+';');
	mmInstrucoes.Lines.Add('  - Atrav�s do e-mail: '+emailEmpresa+';');
	mmInstrucoes.Lines.Add('  - Por telefone: '+foneEmpresa+';');
	mmInstrucoes.Lines.Add('OBRIGADO POR UTILIZAR UM PRODUTO SOFTIZA!');
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.NMSMTP1Status(Sender: TComponent; Status: String);
begin
  mmStatus.Lines.Add(Status);
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.btRegistrarClick(Sender: TObject);
var	Reg          : TRegistry;
		tipoLicenca  : integer;
		licencaAtual : String;
begin
	try
		Reg          := TRegistry.Create;
		Reg.RootKey  := HKEY_LOCAL_MACHINE;

		// [LER EM UVERIFICALICENCA -> TIPOS DE LICEN�AS] //
		case verifLicenca.verificarLicenca(meLicenca.Text) of
			0: tipoLicenca := 0; //--DEMO
			1: tipoLicenca := 1; //--FREE
			2: tipoLicenca := 2; //--PERM
		else
			tipoLicenca := 255; //-- IRREGULAR
		end;

		Reg.OpenKey('\Software\OTSoft\'+nomeSoftware+'\Regist\', True);

		// Impede que seja registrado DEMO novamente
		if (tipoLicenca = 0) then begin
			licencaAtual    := Reg.ReadString('RegLicenca');
			if (verifLicenca.verificarLicenca(licencaAtual) = 0) then begin
				MessageDlg('N�o � permitida nova libera��o de licen�a DEMO!', mtError, [mbOk], 0);
				Exit;
			end;
		end;
		Reg.WriteInteger('RegTipo',tipoLicenca);
		Reg.WriteString('RegNome',edtNome.Text);
		Reg.WriteString('RegEmpresa',edtEmpresa.Text);
		Reg.WriteString('RegCEP',meCEP.Text);
		Reg.WriteString('RegNumero',edtNumero.Text);
		Reg.WriteString('RegDDD',edtDDD.Text);
		Reg.WriteString('RegNumero',edtNumero.Text);
		Reg.WriteString('RegTelefone1',edtTelefone1.Text);
		Reg.WriteString('RegTelefone2',edtTelefone2.Text);
		Reg.WriteString('RegTelefone3',edtTelefone3.Text);
		Reg.WriteString('RegEMail',edtEMail.Text);
		Reg.WriteString('RegWebSite',edtWebSite.Text);
		Reg.WriteString('RegLicenca',meLicenca.Text);
		Reg.WriteDate('RegData',Now());
		case Reg.ReadInteger('RegTipo') of
			0: MessageDlg('Registro realizado com sucesso! Sua licen�a �: DEMO', mtInformation, [mbOk], 0);
			1: MessageDlg('Registro realizado com sucesso! Sua licen�a �: FREEWARE', mtInformation, [mbOk], 0);
			2: MessageDlg('Registro realizado com sucesso! Sua licen�a �: PERMANENTE', mtInformation, [mbOk], 0);
			255: MessageDlg('ocorreu um erro ao registrar! Sua licen�a �: IRREGULAR', mtError, [mbOk], 0);
		else
			MessageDlg('N�o foi poss�vel determinar o tipo de registro', mtError, [mbOk], 0);
		end;
	except
		MessageDlg('Erro ao registrar', mtError, [mbOk], 0);
	end;
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.NMSMTP1Success(Sender: TObject);
begin
  MessageDlg('E-mail enviado, uma c�pia ser� enviada tamb�m ao e-mail: '+edtEMail.Text, mtInformation, [mbOk], 0);
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.FormCreate(Sender: TObject);
begin
	//-- Verifica licenca
	verifLicenca := VerificaLicenca.criarInstancia();

	pcEnviar.ActivePage := tsEnviar;
	rgOpcao.ItemIndex   := 0;
	nomeSoftware        := 'Tele_1_1';//-- Este atributo deve ser alterado apos a cria��o da classe
	carregarCampos();
end;
//-----------------------------------------------------------------------------------------------
//-- Verifica se a licen�a � v�lida
function TfrmLicenca.retornarRegistro(p_mostraMsgDemo: Bool): bool;
var	tipoLicenca  : Integer;
		Reg          : TRegistry;
begin
	try
		//-- Inicia com false
		result       := false;
		Reg          := TRegistry.Create;
		Reg.RootKey  := HKEY_LOCAL_MACHINE;

		// [LER EM UVERIFICALICENCA -> TIPOS DE LICEN�AS] //
		tipoLicenca  := verifLicenca.verificarLicenca(meLicenca.Text);
		if (tipoLicenca = 0) then begin //--DEMO
			if Reg.OpenKey('\Software\OTSoft\'+nomeSoftware+'\Regist\', True) then begin
				qtDias  := Trunc(Date()-Reg.ReadDate('RegData'));
				// No caso de licen�as DEMO verifica n�mero de dias
				// QtDias >= 0 pois caso contr�rio provavelmente houve erro no rel�gio
				if (qtDias <= qtDiasDEMO) and (qtDias >= 0) then begin
					if (p_mostraMsgDemo) then
						MessageDlg('Sua licen�a expira em '+FloatToStr(qtDiasDEMO-qtDias)+' dias.', mtinformation, [mbOk], 0);
					result := true;
				end else begin
					result := false;
				end;
			end;
		end else begin
			if (tipoLicenca = 1) then result := true; //--FREE
			if (tipoLicenca = 2) then result := true; //--PERM
		end;

	except
		MessageDlg('Erro ao registrar', mtError, [mbOk], 0);
		result       := false;
	end;
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  try
	 If Key = #13 Then Begin
		SelectNext(Sender as tWinControl, True, True );
		Key := #0;
	 end;
  except
	 MessageDlg('Erro ao focar pr�ximo campo!', mtError, [mbOk], 0);
  end;
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.setarDadosEmpresa(p_EMail, p_WebSite, p_Fone, p_Smtp : string);
begin
	emailEmpresa	:= p_EMail;
	NMSMTP1.Host	:= p_Smtp;
	foneEmpresa		:= p_Fone;
	websiteEmpresa := p_WebSite;

	NMSMTP1.UserId	:= emailEmpresa;
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.setNomeSoftware(p_nome: string);
begin
	nomeSoftware := p_nome;
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.mostrarMsgPedidoDeRegistro();
begin
	Application.CreateForm(TfrmMensagemLicenca, frmMensagemLicenca);
	frmMensagemLicenca.setarDiasSemRegistro(qtDias);
	frmMensagemLicenca.ShowModal();
//	MessageDlg('Seu aplicativo n�o est� registrado, � ilegal utiliz�-lo sem possuir uma licen�a. No menu "Ajuda" sub-menu "Licen�a" h� instru��es de como registrar sua c�pia.', mtInformation, [mbOk], 0);
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.carregarCampos();
var Reg          : TRegistry;
begin
  try
	 Reg          := TRegistry.Create;
	 Reg.RootKey  := HKEY_LOCAL_MACHINE;
	 if Reg.OpenKey('\Software\OTSoft\'+nomeSoftware+'\Regist\', True) then begin
		edtNome.Text      := Reg.ReadString('RegNome');
		edtEmpresa.Text   := Reg.ReadString('RegEmpresa');
		meCEP.Text        := Reg.ReadString('RegCEP');
		edtNumero.Text    := Reg.ReadString('RegNumero');
		edtDDD.Text       := Reg.ReadString('RegDDD');
		edtNumero.Text    := Reg.ReadString('RegNumero');
		edtTelefone1.Text := Reg.ReadString('RegTelefone1');
		edtTelefone2.Text := Reg.ReadString('RegTelefone2');
		edtTelefone3.Text := Reg.ReadString('RegTelefone3');
		edtEMail.Text     := Reg.ReadString('RegEMail');
		edtWebSite.Text   := Reg.ReadString('RegWebSite');
		meLicenca.Text    := Reg.ReadString('RegLicenca');
	 end;
  except
	 MessageDlg('Erro ao abrir registro', mtError, [mbOk], 0);
  end;
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.FormDestroy(Sender: TObject);
begin
	verifLicenca.Free();
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.setarParametros(p_A,p_B,p_C,p_D,p_E,p_F,p_H,p_J,p_K,p_L,p_N,p_O:Integer);
begin
	verifLicenca.setarParametros(p_A,p_B,p_C,p_D,p_E,p_F,p_H,p_J,p_K,p_L,p_N,p_O);
end;
//-----------------------------------------------------------------------------------------------
procedure TfrmLicenca.mitFecharClick(Sender: TObject);
begin
	Close();
end;

end.
//-----------------------------------------------------------------------------------------------
//   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM
//-----------------------------------------------------------------------------------------------
