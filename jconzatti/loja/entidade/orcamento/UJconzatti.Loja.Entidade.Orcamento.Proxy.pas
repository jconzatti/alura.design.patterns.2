unit UJconzatti.Loja.Entidade.Orcamento.Proxy;

interface

uses
   System.SysUtils,
   UJconzatti.Loja.Entidade.Orcavel,
   UJconzatti.Loja.Entidade.Orcamento;

type
   TEntidadeOrcamentoProxy = class(TEntidadeOrcavel)
   private
      FValor: Currency;
      FOrcamento : TEntidadeOrcamento;
   public
      constructor Create(aOrcamento : TEntidadeOrcamento); reintroduce;
      function ObterValor: Currency; override;
   end;

implementation

{ TEntidadeOrcamento }

constructor TEntidadeOrcamentoProxy.Create(aOrcamento: TEntidadeOrcamento);
begin
   inherited Create;
   FValor     := 0;
   FOrcamento := aOrcamento;
end;

function TEntidadeOrcamentoProxy.ObterValor: Currency;
begin
   if FValor = 0 then
      FValor := FOrcamento.ObterValor;
   Result := FValor;
end;

end.
