unit UJconzatti.Loja.CasoUso.Orcamento.Registrador;

interface

uses System.SysUtils,
     System.Generics.Collections,
     UJconzatti.Loja.CasoUso.HTTP.Adaptador,
     UJconzatti.Loja.Entidade.Orcamento;

type
   TCasoUsoOrcamentoRegistrador = class
   private
      FHTTPAdapatador : TCasoUsoHTTPAdaptador;
   public
      constructor Create(aHTTPAdapatador : TCasoUsoHTTPAdaptador);
      procedure Registrar(aOrcamento : TEntidadeOrcamento);
   end;

implementation

{ TCasoUsoOrcamentoRegistrador }

constructor TCasoUsoOrcamentoRegistrador.Create(
  aHTTPAdapatador: TCasoUsoHTTPAdaptador);
begin
   FHTTPAdapatador := aHTTPAdapatador;
end;

procedure TCasoUsoOrcamentoRegistrador.Registrar(
  aOrcamento: TEntidadeOrcamento);
var aMapDadoOrcamento : TDictionary<String,String>;
begin
   aMapDadoOrcamento := TDictionary<String,String>.Create;
   try
      aMapDadoOrcamento.Add('quantidade', aOrcamento.ObterQuantidadeItem.ToString);
      aMapDadoOrcamento.Add('valor', CurrToStr(aOrcamento.ObterValor));
      FHTTPAdapatador.Post('https:\\api.externa\v1\orcamento', aMapDadoOrcamento);
   finally
      aMapDadoOrcamento.Destroy;
   end;
end;

end.
