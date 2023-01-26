unit UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Log;

interface

uses
   System.SysUtils,
   UJconzatti.Loja.CasoUso.Pedido.Executador.Acao,
   UJconzatti.Loja.Entidade.Pedido;

type
   TCasoUsoPedidoExecutadorAcaoLog = class(TCasoUsoPedidoExecutadorAcao)
   public
      procedure Executar(aPedido : TEntidadePedido); override;
   end;

implementation

{ TCasoUsoPedidoExecutadorAcaoLog }

procedure TCasoUsoPedidoExecutadorAcaoLog.Executar(
  aPedido: TEntidadePedido);
begin
   inherited;
   Writeln('Log de geração de pedido');
   Writeln(Format('Data\Hora: %s', [FormatDateTime('dd/mm/yyyy hh:nn:ss.zzz', Now)]));
   Writeln(Format('Pedido: %s', [aPedido.ObterInformacao]));
end;

end.
