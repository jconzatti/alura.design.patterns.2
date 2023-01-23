unit UJconzatti.Loja.CasoUso.HTTP.RESTJSON;

interface

uses System.SysUtils,
     System.Generics.Collections,
     UJconzatti.Loja.CasoUso.HTTP.Adaptador;

type
   TCasoUsoHTTPRESTJSON = class(TCasoUsoHTTPAdaptador)
   public
      procedure Post(aURL : String; aMapDado : TDictionary<String, String>); override;
   end;

implementation

{ TCasoUsoHTTPAdaptador }

procedure TCasoUsoHTTPRESTJSON.Post(aURL: String;
  aMapDado: TDictionary<String, String>);
var aKey, aValue : String;
begin
   inherited;
   Writeln('Registrando Orçamento via REST JSON');
   Writeln(Format('URL: %s', [aURL]));
   Writeln('{');
   for aKey in aMapDado.Keys do
   begin
      aValue := aMapDado.Items[aKey];
      Writeln(Format('     "%s": "%s",', [aKey, aValue]));
   end;
   Writeln('}');
end;

end.
