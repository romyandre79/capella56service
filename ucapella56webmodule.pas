unit ucapella56webmodule;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, httpdefs, fpHTTP, fpWeb;

type

  { TCapella56WebModule }

  TCapella56WebModule = class(TFPWebModule)
    procedure HelloActionRequest(Sender: TObject; ARequest: TRequest;
      AResponse: TResponse; var Handled: Boolean);
    procedure LoginRequest(Sender: TObject; ARequest: TRequest;
      AResponse: TResponse; var Handled: Boolean);
  private

  public

  end;

var
  FCapella56WebModule: TCapella56WebModule;

implementation

{$R *.lfm}

{ TFPWebModule1 }

procedure TCapella56WebModule.HelloActionRequest(Sender: TObject; ARequest: TRequest;
  AResponse: TResponse; var Handled: Boolean);
begin
  AResponse.Content:= 'Capella 56 HTTP Service';
  Handled:= True;
end;

procedure TCapella56WebModule.LoginRequest(Sender: TObject; ARequest: TRequest;
  AResponse: TResponse; var Handled: Boolean);
begin
  AResponse.Content:= 'Login';
  Handled:= True;
end;

initialization
  RegisterHTTPModule('TCapella56WebModule', TCapella56WebModule);
end.

