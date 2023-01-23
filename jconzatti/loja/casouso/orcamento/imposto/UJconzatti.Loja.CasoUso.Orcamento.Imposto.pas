unit UJconzatti.Loja.CasoUso.Orcamento.Imposto;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento;

type
   TCasoUsoOrcamentoImposto = class abstract
   private
      FOutroImposto : TCasoUsoOrcamentoImposto;
   protected
      function RealizarCalculoImposto(aOrcamento : TEntidadeOrcamento): Currency; virtual; abstract;
   public
      constructor Create(const aOutroImposto : TCasoUsoOrcamentoImposto = nil); reintroduce;
      function Calcular(aOrcamento : TEntidadeOrcamento): Currency;
   end;

implementation

{ TCasoUsoOrcamentoImposto }

constructor TCasoUsoOrcamentoImposto.Create(const aOutroImposto : TCasoUsoOrcamentoImposto = nil);
begin
   FOutroImposto := aOutroImposto;
end;

function TCasoUsoOrcamentoImposto.Calcular(
  aOrcamento: TEntidadeOrcamento): Currency;
begin
   Result := RealizarCalculoImposto(aOrcamento);
   if Assigned(FOutroImposto) then
      Result := Result + FOutroImposto.RealizarCalculoImposto(aOrcamento);
end;

end.
