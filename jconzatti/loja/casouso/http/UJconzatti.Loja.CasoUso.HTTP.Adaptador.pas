unit UJconzatti.Loja.CasoUso.HTTP.Adaptador;

interface

uses System.Generics.Collections;

type
   TCasoUsoHTTPAdaptador = class abstract
   public
      procedure Post(aURL : String; aMapDado : TDictionary<String, String>); virtual; abstract;
   end;

implementation

end.
