program capella56http;

{$mode objfpc}{$H+}

uses
  {$ifdef unix}cthreads,{$endif}
  cmem,
  fpwebfile,
  fphttpapp, ucapella56webmodule,inifiles;
var
  inifile: TIniFile;

{$R *.res}

begin
  inifile:= TInifile.create('capella56.ini');
  try
    Application.Scaled:=True;
    Application.LegacyRouting := true;
    Application.Title:='Capella 56 HTTP Service';
    Application.Port:=inifile.ReadInteger('MAIN','port',80);
    Application.Threaded:=inifile.ReadBool('MAIN','threaded',true);
    Application.QueueSize:=inifile.ReadInteger('MAIN','queuesize',5);
    Application.AcceptIdleTimeout:=inifile.ReadInteger('MAIN','acceptidletimeout',1000);
    Application.LookupHostNames:=inifile.ReadBool('MAIN','lookuphostname',false);
  finally
    inifile.Free;
  end;
  Application.Initialize;
  Application.Run;
end.

