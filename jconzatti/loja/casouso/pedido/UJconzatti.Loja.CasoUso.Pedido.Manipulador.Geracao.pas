unit UJconzatti.Loja.CasoUso.Pedido.Manipulador.Geracao;

interface

uses
   System.SysUtils,
   System.Generics.Collections,
   UJconzatti.Loja.CasoUso.Pedido.Executador.Acao,
   UJconzatti.Loja.CasoUso.Pedido.Gerador,
   UJconzatti.Loja.Entidade.Pedido,
   UJconzatti.Loja.Entidade.Orcamento,
   UJconzatti.Loja.Entidade.Orcamento.Item;

type
   TCasoUsoPedidoManipuladorGeracao = class
   private
      FListaAcao : TObjectList<TCasoUsoPedidoExecutadorAcao>;
   public
      constructor Create;
      destructor Destroy; override;
      procedure AdicionarAcao(aAcao : TCasoUsoPedidoExecutadorAcao);
      procedure Gerar(aPedidoGerador : TCasoUsoPedidoGerador);
   end;

implementation


{ TCasoUsoPedidoManipuladorGeracao }

procedure TCasoUsoPedidoManipuladorGeracao.AdicionarAcao(
  aAcao: TCasoUsoPedidoExecutadorAcao);
begin
   FListaAcao.Add(aAcao);
end;

constructor TCasoUsoPedidoManipuladorGeracao.Create;
begin
   FListaAcao := TObjectList<TCasoUsoPedidoExecutadorAcao>.Create;
end;

destructor TCasoUsoPedidoManipuladorGeracao.Destroy;
begin
   FListaAcao.Destroy;
   inherited;
end;

procedure TCasoUsoPedidoManipuladorGeracao.Gerar(
  aPedidoGerador: TCasoUsoPedidoGerador);
var aOrcamento : TEntidadeOrcamento;
    aPedido : TEntidadePedido;
    aAcao: TCasoUsoPedidoExecutadorAcao;
    I : Integer;
    aValorItem : Currency;
begin
   aOrcamento := TEntidadeOrcamento.Create;
   try
      aValorItem := 0;
      if aPedidoGerador.QuantidadeItemOrcamento > 0 then
         aValorItem := aPedidoGerador.ValorOrcamento /
                       aPedidoGerador.QuantidadeItemOrcamento;

      for I := 1 to aPedidoGerador.QuantidadeItemOrcamento do
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(aValorItem));

      aPedido := TEntidadePedido.Create(aPedidoGerador.Cliente, Now, aOrcamento);
      try
         for aAcao in FListaAcao do
            aAcao.Executar(aPedido);
      finally
         aPedido.Destroy;
      end;
   finally
      aOrcamento.Destroy;
   end;
end;

end.
