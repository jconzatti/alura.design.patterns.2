unit UJconzatti.Loja.CasoUso.Orcamento.Imposto.ICMS;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento,
   UJconzatti.Loja.CasoUso.Orcamento.Imposto;

type
   TCasoUsoOrcamentoImpostoICMS = class(TCasoUsoOrcamentoImposto)
   protected
      function RealizarCalculoImposto(aOrcamento : TEntidadeOrcamento): Currency; override;
   end;

implementation

{ TCasoUsoImpostoOrcamentoICMS }

function TCasoUsoOrcamentoImpostoICMS.RealizarCalculoImposto(aOrcamento: TEntidadeOrcamento): Currency;
begin
   Result := aOrcamento.ObterValor * 0.17;
end;

end.
