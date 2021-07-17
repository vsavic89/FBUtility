unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI, Vcl.Mask, JvExMask,
  JvToolEdit, JvBaseDlg, JvSelectDirectory, Vcl.ComCtrls,Winapi.ShellAPI;

type
  TfrmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    JvSelectDirectory1: TJvSelectDirectory;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    GroupBox1: TGroupBox;
    FDQuery1: TFDQuery;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    btnBackup: TButton;
    btnRestore: TButton;
    Memo2: TMemo;
    lblInfoBackupRestore: TLabel;
    FDTransaction1: TFDTransaction;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    Button6: TButton;
    Memo3: TMemo;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    Panel2: TPanel;
    PageControl2: TPageControl;
    SpeedButton3: TSpeedButton;
    pnlInfo: TPanel;
    GroupBox2: TGroupBox;
    btnSweepInterval: TButton;
    edtSweepInterval: TEdit;
    Label8: TLabel;
    Panel7: TPanel;
    Label1: TLabel;
    Button1: TButton;
    edtFBBin: TEdit;
    Label2: TLabel;
    edtDBPath: TJvFilenameEdit;
    Button2: TButton;
    Label3: TLabel;
    edtuser: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    edtServer: TEdit;
    edtPassword: TEdit;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    edtPort: TEdit;
    Button3: TButton;
    SpeedButton1: TSpeedButton;
    edtComputerName: TEdit;
    Label5: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure btnRestoreClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RUN(sender:TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnSweepIntervalClick(Sender: TObject);
  private
    { Private declarations }
    intBrTabova:Integer;
    blnAutoKonektovan:Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uFrameGridListaTabela;

function TekuciDir():string;
var strIPAdresaServera,s:string;
  i,indexKoseCrte:integer;
begin

  indexKoseCrte := 0;

  s:= Application.ExeName;

  for I := 1 to Length(s) do
  begin
    if s[i] = '\' then indexKoseCrte := i;
  end;

  s:= Copy(s, 1, indexKoseCrte);

  result := s;
end;
function ComputerName():String;
var
  ComputerName: Array [0 .. 256] of char;
  Size: DWORD;
begin
  Size := 256;
  GetComputerName(ComputerName, Size);
  Result := ComputerName;
end;
function ProcitajIP():string;
var intNavodnik1,intNavodnik2,i:integer;
    s,text:string;
    t:textfile;
    sl:TStringList;
    k:integer;
begin
  intNavodnik1 := 0;
  intNavodnik2 := 0;

  s:= TekuciDir();

  if FileExists(s + 'podesavanja/podesavanjaN.ini') then
  begin

      sl := TStringList.Create;
      sl.LoadFromFile(s+'podesavanja/podesavanjaN.ini');
      for k := 0 to sl.Count-1 do
      begin
        if Pos('IME_SERVERA', sl.Strings[k]) <> 0 then
        begin
          text := sl.Strings[k];

          Break;
        end;
      end;
      sl.Free;


      for i:=1 to Length(text) do
      begin
        if text[i] = '"' then
        begin
          if intNavodnik1 = 0 then intNavodnik1 := i else if intNavodnik2 = 0 then intNavodnik2 := i;
        end;
      end;

      text := copy(text, intNavodnik1, intNavodnik2);

      text := copy(text, 2, length(text)-2);
      if text <> 'localhost' then
      begin
        if ComputerName = text then
          text := 'localhost';
      end;
      result := text;
    end;
end;
function ProcitajPort():string;
var intNavodnik1,intNavodnik2,i:integer;
    s,text:string;
    t:textfile;
    sl:TStringList;
    strLinija:string;

    k:integer;
begin
  intNavodnik1 := 0;
  intNavodnik2 := 0;

  s:= TekuciDir();

  if FileExists(s + 'podesavanja/podesavanjaN.ini') then
  begin
      sl := TStringList.Create;
      sl.LoadFromFile(s+'podesavanja/podesavanjaN.ini');
      for k := 0 to sl.Count-1 do
      begin
        if Pos('PORT', sl.Strings[k]) <> 0 then
        begin
          strLinija := sl.Strings[k];

          Break;
        end;
      end;
      sl.Free;

      for i:=1 to Length(strLinija) do
      begin
        if strLinija[i] = '"' then
        begin
          if intNavodnik1 = 0 then intNavodnik1 := i else if intNavodnik2 = 0 then intNavodnik2 := i;
        end;
      end;

      strLinija := copy(strLinija, intNavodnik1, intNavodnik2);

      strLinija := copy(strLinija, 2, length(strLinija)-2);

      result := strLinija;
  end;
end;
function ProcitajPutanju():string;
var intNavodnik1,intNavodnik2,i:integer;
    s,text:string;
    t:textfile;
    sl:TStringList;
    strLinija:string;

    k:integer;
begin
  intNavodnik1 := 0;
  intNavodnik2 := 0;

  s:= TekuciDir();

  if FileExists(s + 'podesavanja/podesavanjaN.ini') then
  begin
      sl := TStringList.Create;
      sl.LoadFromFile(s+'podesavanja/podesavanjaN.ini');
      for k := 0 to sl.Count-1 do
      begin
        if Pos('PUTANJA', sl.Strings[k]) <> 0 then
        begin
          strLinija := sl.Strings[k];

          Break;
        end;
      end;
      sl.Free;

      for i:=1 to Length(strLinija) do
      begin
        if strLinija[i] = '"' then
        begin
          if intNavodnik1 = 0 then intNavodnik1 := i else if intNavodnik2 = 0 then intNavodnik2 := i;
        end;
      end;

      strLinija := copy(strLinija, intNavodnik1, intNavodnik2);

      strLinija := copy(strLinija, 2, length(strLinija)-2);

      result := strLinija;
  end;
end;
function GetDosOutput( CommandLine: string; Work: string = 'C:\'): string;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: string;
  Handle: Boolean;
begin
  Result := '';
  with SA do begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE);
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
    WorkDir := Work;
    Handle := CreateProcess(nil, PChar('cmd.exe /C ' + CommandLine),
                            nil, nil, True, 0, nil,
                            PChar(WorkDir), SI, PI);
    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            Buffer[BytesRead] := #0;
            Result := Result + Buffer;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, INFINITE);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;
procedure TfrmMain.Button1Click(Sender: TObject);
begin
 if JvSelectDirectory1.Execute() then
 begin
   edtFBBin.Text:=JvSelectDirectory1.Directory;
 end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var str:string;
    SI:TStartupInfo;
    PI:TProcessInformation;
begin
  ShellExecute(Handle, 'open', pchar(edtFBBin.Text+'\gsec.exe'),Pchar('-user sysdba -password "masterkey" -modify sysdba -pw "4rZ~bW-6E=q(!%&"'), pchar(edtFBBin.Text), SW_SHOWNORMAL);
end;
procedure TfrmMain.Button3Click(Sender: TObject);
var mm:TMemo;
    i:integer;
begin
  if FDConnection1.Connected=false then
  begin
    try
      with FDConnection1 do
      begin
        Connected := false;
        params.Clear;
        Params.Add('User_Name=sysdba');
        params.Add('Password=4rZ~bW-6E=q(!%&');
        params.Add('Database='+edtServer.Text+':'+edtDBPath.Text);
        Params.Add('Port='+edtPort.Text);
        params.Add('CharacterSet=utf8');
        params.Add('DriverID=FB');
        LoginPrompt := false;
        Connected := true;
       end;
       GroupBox1.Visible:=True;
       if blnAutoKonektovan=false then
       begin
         blnAutoKonektovan:=true;
         SpeedButton3.Click;
       end;
       button3.Caption:='Disconnect' ;
       for i := 0 to PageControl2.ActivePage.ControlCount-1 do
       begin
        if (PageControl2.ActivePage.Controls[i]) is tmemo then
        begin
          mm:= PageControl2.ActivePage.Controls[i] as TMemo;
        end;
       end;
       mm.SetFocus;
       mm.SelectAll;
    except on e:Exception do
    begin
       ShowMessage('Test FAIL!'+#13#10+e.Message);
       GroupBox1.Visible:=false;
    end;
    end;
  end else begin
    FDConnection1.Connected:=false;
    GroupBox1.Visible:=false;
    button3.Caption:='Connect';
  end;
end;

procedure TfrmMain.Button6Click(Sender: TObject);
var str:string;
begin
    memo3.Lines.Clear;
    Application.ProcessMessages;
    str:=GetDosOutput('gstat.exe -h -user sysdba -password "4rZ~bW-6E=q(!%&" ' + edtServer.Text+':'+ExtractFileDir(ParamStr(0))+'\baza.fdb',edtFBBin.Text);
    memo3.Lines.Add(str);
    SendMessage(Memo3.Handle, WM_VSCROLL, SB_BOTTOM, 0);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var strPutanjaFirebird:string;
begin
  intBrTabova:=0;
  strPutanjaFirebird := '';
   if FileExists('C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe') then
    strPutanjaFirebird := 'C:\Program Files\Firebird\Firebird_2_5'
  else
    if FileExists('C:\Program Files (x86)\Firebird\Firebird_2_5\bin\gbak.exe') then
      strPutanjaFirebird := 'C:\Program Files (x86)\Firebird\Firebird_2_5';
  if FileExists('C:\Program Files\Firebird\Firebird_3_0\gbak.exe') then
    strPutanjaFirebird := 'C:\Program Files\Firebird\Firebird_3_0'
  else
    if FileExists('C:\Program Files (x86)\Firebird\Firebird_3_0\gbak.exe') then
      strPutanjaFirebird := 'C:\Program Files (x86)\Firebird\Firebird_3_0';

  edtFBBin.Text:=strPutanjaFirebird;
  edtDBPath.Text:= ProcitajPutanju;
  edtServer.Text:=ProcitajIP;
  edtComputerName.Text:=ComputerName;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Button3.Click;
end;

procedure TfrmMain.RUN(sender: TObject);
var mm:TMemo;
    pnl: TPanel;
    i,j:integer;
    frameGridListaTabela: TframeGridListaTabela;
begin
  for i := 0 to PageControl2.ActivePage.ControlCount-1 do
  begin
    if (PageControl2.ActivePage.Controls[i]) is TPanel then
    begin
      pnl := PageControl2.ActivePage.Controls[i] as TPanel;
      for j := 0 to pnl.ControlCount-1 do
      begin
        if(pnl.Controls[j]) is TMemo then
          mm:= pnl.Controls[j] as TMemo;
      end;
    end;
    if (PageControl2.ActivePage.Controls[i]) is TframeGridListaTabela then
      frameGridListaTabela:= PageControl2.ActivePage.Controls[i] as TframeGridListaTabela;
  end;

  frameGridListaTabela.pnlInfoSQL.Caption := EmptyStr;

  with frameGridListaTabela.FDQuery1 do
  begin
    Close;
    SQL.Clear;
    sql.Add(mm.Lines.Text);
    if copy(mm.Lines.Text,1,6)='select' then
    begin
      try
       Open();
       FetchAll;
       frameGridListaTabela.pnlInfoSQL.Caption:='Rows selected: ' + inttostr(frameGridListaTabela.FDQuery1.RecordCount);
       mm.SetFocus;
       mm.SelectAll;
      except on e:Exception do
        begin
          ShowMessage(e.Message);
          mm.SetFocus;
          mm.SelectAll;
        end;
      end;
    end else begin
      Transaction.StartTransaction;
      try
        ExecSQL;
        frameGridListaTabela.pnlInfoSQL.Caption:='Rows affected: ' + inttostr(frameGridListaTabela.FDQuery1.RowsAffected);
        Transaction.Commit;
      except on e:Exception do
      begin
        Transaction.Rollback;
        ShowMessage(e.Message);
        mm.SetFocus;
        mm.SelectAll;
      end;
      end;
    end;
  end;
end;

procedure TfrmMain.btnBackupClick(Sender: TObject);
var str:string;
    sl:TStringList;
    strKopi:string;
begin
  if not DirectoryExists(ExtractFileDir(ParamStr(0))+'\backup') then
    CreateDir(ExtractFileDir(ParamStr(0))+'\backup');
  OpenDialog1.InitialDir:=ExtractFileDir(ParamStr(0));
  OpenDialog1.FileName:=ExtractFileDir(ParamStr(0))+'\baza.fdb';
  if OpenDialog1.Execute then
  begin

    btnBackup.Enabled:=False;
    btnRestore.Enabled:=false;
    lblInfoBackupRestore.Caption:='Radim backup...malo strpljenja...';
    memo2.Lines.Clear;
    memo2.Lines.Add('Pravim rezervnu kopiju...');
    strKopi:= ExtractFileDir(ParamStr(0))+'\backup\baza'+FormatDateTime('dd.mm.yyyy',now)+'.fdb';
    if FileExists(strKopi) then
      DeleteFile(strKopi);
    copyfile(pchar(ExtractFileDir(ParamStr(0))+'\baza.fdb'),PChar(strKopi),false);
    Application.ProcessMessages;

    memo2.Lines.Clear;
    memo2.lines.add('Zapoèinjem raspakivanje podataka...' + DateTimeToStr(date)+' ' + timetostr(time));
    memo2.Lines.Add('------------------------------------------------------');
    Application.ProcessMessages;
    str:=GetDosOutput('gbak.exe -v -b -user sysdba -password "4rZ~bW-6E=q(!%&" '+strKopi+' '+ExtractFileDir(ParamStr(0))+'\backup\'+FormatDateTime('dd.mm.yyyy',now)+'.fbk',edtFBBin.Text);
    memo2.Lines.Add(str);
    memo2.lines.add('Završeno raspakivanje podataka...' + DateTimeToStr(date)+' ' + timetostr(time));
    memo2.Lines.Add('------------------------------------------------------');
    SendMessage(Memo2.Handle, WM_VSCROLL, SB_BOTTOM, 0);
    sl:=TStringList.Create;
    sl.Add(Memo2.Lines.Text);
    sl.SaveToFile(ExtractFileDir(ParamStr(0))+'\backup\logB'+FormatDateTime('dd.mm.yyyy',now)+'.txt',TEncoding.UTF8);
    sl.Free;
    btnBackup.Enabled:=True;
    btnRestore.Enabled:=True;
    lblInfoBackupRestore.Caption:=EmptyStr;
    Application.ProcessMessages;
  end;
end;

procedure TfrmMain.btnRestoreClick(Sender: TObject);
var str:string;
    sl:TStringList;
begin
  if not DirectoryExists(ExtractFileDir(ParamStr(0))+'\backup') then
    CreateDir(ExtractFileDir(ParamStr(0))+'\backup');
  OpenDialog2.InitialDir:=ExtractFileDir(ParamStr(0))+'\backup';
  OpenDialog2.FileName:= ExtractFileDir(ParamStr(0))+'\backup\'+FormatDateTime('dd.mm.yyyy',date)+'.fbk';
  if OpenDialog2.Execute then
  begin
    btnBackup.Enabled:=false;
    btnRestore.Enabled:=false;
    lblInfoBackupRestore.Caption:='Radim restore...malo strpljenja...';
    Application.ProcessMessages;
    if not DirectoryExists(ExtractFileDir(ParamStr(0))+'\backup') then
      CreateDir(ExtractFileDir(ParamStr(0))+'\backup');
    if FileExists(ExtractFileDir(ParamStr(0))+'\bazaRESTORE.fdb') then
        DeleteFile(ExtractFileDir(ParamStr(0))+'\bazaRESTORE.fdb');
    memo2.Lines.Clear;
    memo2.lines.add('Zapoèinjem pakovanje podataka...' + DateTimeToStr(date)+' ' + timetostr(time));
    memo2.Lines.Add('------------------------------------------------------');
    Application.ProcessMessages;
    str:=GetDosOutput('gbak.exe -v -r -user sysdba -password "4rZ~bW-6E=q(!%&" '+OpenDialog2.FileName + ' ' + ExtractFileDir(ParamStr(0))+'\bazaRESTORE.fdb',edtFBBin.Text);
    memo2.Lines.Add(str);
    memo2.lines.add('Završeno pakovanje podataka...' + DateTimeToStr(date)+' ' + timetostr(time));
    memo2.Lines.Add('------------------------------------------------------');
    SendMessage(Memo2.Handle, WM_VSCROLL, SB_BOTTOM, 0);
    sl:=TStringList.Create;
    sl.Add(Memo2.Lines.Text);
    sl.SaveToFile(ExtractFileDir(ParamStr(0))+'\backup\logR'+FormatDateTime('dd.mm.yyyy',now)+'.txt',TEncoding.UTF8);
    sl.Free;
    if pos('gbak:finishing, closing, and going home',Memo2.Lines.Text)>0 then
    begin
      if FileExists(ExtractFileDir(ParamStr(0))+'\baza.fdb') then
        DeleteFile(ExtractFileDir(ParamStr(0))+'\baza.fdb');
      CopyFile(pchar(ExtractFileDir(ParamStr(0))+'\bazaRESTORE.fdb'),Pchar(ExtractFileDir(ParamStr(0))+'\baza.fdb'),False);
      if FileExists(ExtractFileDir(ParamStr(0))+'\bazaRESTORE.fdb') then
        DeleteFile(ExtractFileDir(ParamStr(0))+'\bazaRESTORE.fdb');
    end;
    btnRestore.Enabled:=true;
    btnBackup.Enabled:=True;
    lblInfoBackupRestore.Caption:=EmptyStr;
    Application.ProcessMessages;
  end;
end;

procedure TfrmMain.btnSweepIntervalClick(Sender: TObject);
var str:string;
begin
    str:=GetDosOutput('gfix.exe -h '+edtSweepInterval.Text+' -user sysdba -password "4rZ~bW-6E=q(!%&" ' + edtServer.Text+':'+ExtractFileDir(ParamStr(0))+'\baza.fdb',edtFBBin.Text);
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  edtComputerName.Text:=ComputerName;
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject);
begin
  edtServer.Text:=ProcitajIP;
end;

procedure TfrmMain.SpeedButton3Click(Sender: TObject);
var tabsheet:TTabSheet;
    mm:TMemo;
    btn:TButton;
    frameGridListaTabela: TframeGridListaTabela;
    pnl: TPanel;
begin
  intBrTabova:=intBrTabova+1;
  TabSheet := TTabSheet.Create(PageControl2);
  TabSheet.Caption := 'Query'+inttostr(intBrTabova);
  TabSheet.PageControl := PageControl2;
  TabSheet.Name:='Query'+inttostr(intBrTabova);

  pnl := TPanel.Create(tabsheet);
  pnl.Parent := tabsheet;
  pnl.Name := 'pnl'+inttostr(intBrTabova);
  pnl.Align := alTop;
  pnl.Height := 200;

  mm:=TMemo.Create(pnl);
  mm.Font.Size := 10;
  mm.Parent:=pnl;
  mm.Name:='mm'+inttostr(intBrTabova);
  mm.Lines.Clear;
  mm.Align:=alClient;
  mm.ScrollBars := ssHorizontal;

  btn:=TButton.Create(pnl);
  btn.Parent:=pnl;
  btn.OnClick:=RUN;
  btn.Name:='btn'+inttostr(intBrTabova);
  btn.Caption:='run';
  btn.Align:=alRight;

  frameGridListaTabela := TframeGridListaTabela.Create(tabsheet);
  frameGridListaTabela.parent := tabsheet;
  frameGridListaTabela.Name := 'frameGridListaTabela'+inttostr(intBrTabova);
  frameGridListaTabela.Align := alClient;
  frameGridListaTabela.Visible := True;

  PageControl2.ActivePageIndex:=PageControl2.PageCount-1;

end;

end.
