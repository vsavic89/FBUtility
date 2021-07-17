program FBUtility;

uses
  madExcept,
  madLinkDisAsm,
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {frmMain},
  uFrameGridListaTabela in 'frames\uFrameGridListaTabela.pas' {frameGridListaTabela: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
