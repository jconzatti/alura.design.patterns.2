unit UJconzatti.Loja.CasoUso.Orcamento.Imposto.ISS;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento,
   UJconzatti.Loja.CasoUso.Orcamento.Imposto;

type
   TCasoUsoOrcamentoImpostoISS = class(TCasoUsoOrcamentoImposto)
   protected
      function RealizarCalculoImposto(aOrcamento : TEntidadeOrcamento): Currency; override;
   end;

implementation

{ TCasoUsoImpostoOrcamentoISS }

function TCasoUsoOrcamentoImpostoISS.RealizarCalculoImposto(aOrcamento: TEntidadeOrcamento): Currency;
begin
   Result := aOrcamento.ObterValor * 0.05;
end;

end.
