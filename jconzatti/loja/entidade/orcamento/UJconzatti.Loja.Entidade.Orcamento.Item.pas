unit UJconzatti.Loja.Entidade.Orcamento.Item;

interface

uses UJconzatti.Loja.Entidade.Orcavel;

type
   TEntidadeOrcamentoItem = class(TEntidadeOrcavel)
   private
      FValor: Currency;
   public
      constructor Create(aValor : Currency);
      function ObterValor: Currency; override;
   end;

implementation

{ TEntidadeOrcamentoItem }

constructor TEntidadeOrcamentoItem.Create(aValor: Currency);
begin
   FValor := aValor;
end;

function TEntidadeOrcamentoItem.ObterValor: Currency;
begin
   Result := FValor;
end;

end.
