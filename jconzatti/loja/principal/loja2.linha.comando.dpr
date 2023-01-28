program loja2.linha.comando;

{.$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UJconzatti.Loja.CasoUso.Orcamento.Calculador.Imposto in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Calculador.Imposto.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Imposto.ICMS in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Imposto.ICMS.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Imposto.ISS in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Imposto.ISS.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Imposto in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Imposto.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Calculador.Desconto in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Calculador.Desconto.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Desconto.Quantidade in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Desconto.Quantidade.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Desconto.Valor in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Desconto.Valor.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Desconto in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Desconto.pas',
  UJconzatti.Loja.Entidade.Orcamento in '..\entidade\orcamento\UJconzatti.Loja.Entidade.Orcamento.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao.Abstrato in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.Abstrato.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao.Aprovado in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.Aprovado.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao.EmAnalise in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.EmAnalise.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao.Finalizado in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.Finalizado.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao.Reprovado in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.Reprovado.pas',
  UJconzatti.Loja.Entidade.Pedido in '..\entidade\pedido\UJconzatti.Loja.Entidade.Pedido.pas',
  UJconzatti.Loja.CasoUso.Pedido.Gerador in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Gerador.pas',
  UJconzatti.Loja.Repositorio.Pedido in '..\repositorio\pedido\UJconzatti.Loja.Repositorio.Pedido.pas',
  UJconzatti.Loja.CasoUso.Email.Enviador in '..\casouso\email\UJconzatti.Loja.CasoUso.Email.Enviador.pas',
  UJconzatti.Loja.CasoUso.Pedido.Manipulador.Geracao in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Manipulador.Geracao.pas',
  UJconzatti.Loja.CasoUso.Pedido.Executador.Acao in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.pas',
  UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Repositorio.Salvar in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Repositorio.Salvar.pas',
  UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Email.Enviar in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Email.Enviar.pas',
  UJconzatti.Loja.CasoUso.HTTP.Adaptador in '..\casouso\http\UJconzatti.Loja.CasoUso.HTTP.Adaptador.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Registrador in '..\casouso\orcamento\UJconzatti.Loja.CasoUso.Orcamento.Registrador.pas',
  UJconzatti.Loja.CasoUso.HTTP.RESTJSON in '..\casouso\http\UJconzatti.Loja.CasoUso.HTTP.RESTJSON.pas',
  UJconzatti.Loja.Entidade.Orcamento.Item in '..\entidade\orcamento\UJconzatti.Loja.Entidade.Orcamento.Item.pas',
  UJconzatti.Loja.Entidade.Orcavel in '..\entidade\orcamento\UJconzatti.Loja.Entidade.Orcavel.pas',
  UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Log in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Log.pas',
  UJconzatti.Loja.Entidade.Orcamento.Proxy in '..\entidade\orcamento\UJconzatti.Loja.Entidade.Orcamento.Proxy.pas';

var aOrcamento, aOrcamentoAntigo, aOrcamentoNovo : TEntidadeOrcamento;
    aOrcamentoProxy : TEntidadeOrcamentoProxy;
    aOrcamentoRegistrador : TCasoUsoOrcamentoRegistrador;
    aHTTPRESTJSON : TCasoUsoHTTPRESTJSON;
    aOrcamentoCalculadorImposto : TCasoUsoOrcamentoCalculadorImposto;
    aOrcamentoImpostoICMSComISS, aOrcamentoImpostoISS : TCasoUsoOrcamentoImposto;
    aValor : Currency;
    aMensagem, aCliente: String;
    aQtItem: Integer;
    aManipuladorGeracaoPedido : TCasoUsoPedidoManipuladorGeracao;
    aRepositorioPedido : TRepositorioPedido;
    aGeradorPedido : TCasoUsoPedidoGerador;
begin
   try
      //Design Pattern Adapter.
      //Neste projeto, o Adapter foi usado para adaptar a implementa��o HTTP REST JSON
      //atraves de um Adaptador abstrato para HTTP (TCasoUsoHTTPAdaptador)
      aOrcamento := TEntidadeOrcamento.Create;
      try
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(50));
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(50));
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(25));
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(25));
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(2.5));
         aHTTPRESTJSON := TCasoUsoHTTPRESTJSON.Create;
         try
            aOrcamentoRegistrador := TCasoUsoOrcamentoRegistrador.Create(aHTTPRESTJSON);
            try
               aOrcamentoRegistrador.Registrar(aOrcamento);
            finally
               aOrcamentoRegistrador.Destroy;
            end;
         finally
            aHTTPRESTJSON.Destroy;
         end;
      finally
         aOrcamento.Destroy;
      end;

      //Design Pattern Decorator.
      //Neste projeto, o Decorator foi usado para decorar a classe imposto
      //para ser poss�vel somar v�rios impostos de uma �nica vez, isto �,
      //agora os impostos podem ser combinados. Caso surja um novo imposto o
      //mesmo pode ser combinado sem alterar a classe Imposto.

      //O problema que o padr�o Decorator nos ajudou a resolver foi
      //flexibilizar, de maneira din�mica, o c�lculo de diferentes
      //impostos de um or�amento.

      //O padr�o Decorator permite adicionar novos comportamentos a um objeto,
      //tornando o c�digo bastante flex�vel e din�mico.
      Writeln;
      Writeln('Calculadora de Impostos do Or�amento (com Decorator)');
      aOrcamentoCalculadorImposto := TCasoUsoOrcamentoCalculadorImposto.Create;
      try
         aOrcamento := TEntidadeOrcamento.Create;
         try
            aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(100));
            aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(200));
            aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(300));
            aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(150));
            aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(250));
            Writeln('Or�amento: ' + aOrcamento.ObterInformacao);
            aOrcamentoImpostoISS := TCasoUsoOrcamentoImpostoISS.Create;
            try
               aOrcamentoImpostoICMSComISS := TCasoUsoOrcamentoImpostoICMS.Create(aOrcamentoImpostoISS);
               try
                  aValor    := aOrcamentoCalculadorImposto.Calcular(aOrcamento, aOrcamentoImpostoICMSComISS);
                  aMensagem := Format('ICMS + ISS: R$ %s', [FormatFloat('###,##0.00', aValor)]);
                  Writeln(aMensagem);
               finally
                  aOrcamentoImpostoICMSComISS.Destroy;
               end;
            finally
               aOrcamentoImpostoISS.Destroy
            end;
         finally
            aOrcamento.Destroy;
         end;
      finally
         aOrcamentoCalculadorImposto.Destroy;
      end;

      //Design Pattern Composite.
      //Neste projeto, o Composite foi usado para permitir adicionar or�amentos
      //atraves do m�todo para adicionar itens na entidade Or�amento.
      //Isto �, o Or�amento � uma composi��o de tudo o que for Or�avel,
      //tanto itens como o pr�prio or�amento.
      Writeln;
      Writeln('Composi��o de or�amentos');
      aOrcamentoAntigo := TEntidadeOrcamento.Create;
      aOrcamentoAntigo.AdicionarItem(TEntidadeOrcamentoItem.Create(10));
      aOrcamentoAntigo.AdicionarItem(TEntidadeOrcamentoItem.Create(90));
      aOrcamentoAntigo.AdicionarItem(TEntidadeOrcamentoItem.Create(100));
      aOrcamentoAntigo.Reprovar;
      Writeln('Or�amento antigo: ' + aOrcamentoAntigo.ObterInformacao);

      aOrcamentoNovo := TEntidadeOrcamento.Create;
      try
         aOrcamentoNovo.AdicionarItem(TEntidadeOrcamentoItem.Create(100));
         aOrcamentoNovo.AdicionarItem(TEntidadeOrcamentoItem.Create(200));
         aOrcamentoNovo.AdicionarItem(TEntidadeOrcamentoItem.Create(100));
         aOrcamentoNovo.AdicionarItem(TEntidadeOrcamentoItem.Create(25));
         aOrcamentoNovo.AdicionarItem(TEntidadeOrcamentoItem.Create(75));
         aOrcamentoNovo.AdicionarItem(aOrcamentoAntigo);
         Writeln('Or�amento novo: ' + aOrcamentoNovo.ObterInformacao);
      finally
         aOrcamentoNovo.Destroy;
      end;


      //Design Patterns Facade.
      //Neste projeto, o Facade foi usado na gera��o de pedidos atraves do
      //manipulador que fica encarregado de criar uma fachada que esconde
      //a complexidade da l�gica de gera��o de pedido
      Writeln;
      Writeln('Pedidos');
      Write('Nome do Cliente: ');
      Readln(aCliente);
      Write('Valor do Or�amento: ');
      Readln(aValor);
      Write('Quantidade de Itens do Or�amento: ');
      Readln(aQtItem);
      Writeln;
      aManipuladorGeracaoPedido := TCasoUsoPedidoManipuladorGeracao.Create;
      try
         aRepositorioPedido := TRepositorioPedido.Create;
         try
            aManipuladorGeracaoPedido.AdicionarAcao(TCasoUsoPedidoExecutadorAcaoRepositorioSalvar.Create(aRepositorioPedido));
            aManipuladorGeracaoPedido.AdicionarAcao(TCasoUsoPedidoExecutadorAcaoEmailEnviar.Create);
            aManipuladorGeracaoPedido.AdicionarAcao(TCasoUsoPedidoExecutadorAcaoLog.Create);
            aGeradorPedido := TCasoUsoPedidoGerador.Create(aCliente, aValor, aQtItem);
            try
               aManipuladorGeracaoPedido.Gerar(aGeradorPedido); //Facade aqui
            finally
               aGeradorPedido.Destroy;
            end;
         finally
            aRepositorioPedido.Destroy;
         end;
      finally
         aManipuladorGeracaoPedido.Destroy;
      end;

      //Design Pattern Proxy.
      //Neste projeto, o Proxy foi usado para criar um cache para obter valor
      //do Or�amento. Simulamos uma demora para obter valor do or�amento de 3
      //segundo. No mundo real isso poderia acontecer se a informa��o fosse
      //obtida de uma API externa. Abaixo, usamos o m�todo obter informa��o
      //atrav�s o proxy de or�amentos, assim o valor ser� chamado apenas
      //na primeira vez, depois ir� devolver o que est� na mem�ria.
      //Proxy pode ser usado sempre que pretende-se interceptar qualquer
      //chamada de m�todo de uma classe.
      Writeln;
      Writeln('Proxy para obter o valor do or�amentos');
      aOrcamento := TEntidadeOrcamento.Create;
      try
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(100));
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(200));
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(100));
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(25));
         aOrcamento.AdicionarItem(TEntidadeOrcamentoItem.Create(75));
         aOrcamentoProxy := TEntidadeOrcamentoProxy.Create(aOrcamento);
         try
            Writeln('Or�amento: ', aOrcamento.ObterInformacao);
            Writeln('1. Valor do Or�amento: R$ ', FormatFloat('###,###,###,##0.00', aOrcamentoProxy.ObterValor));
            Writeln('2. Valor do Or�amento: R$ ', FormatFloat('###,###,###,##0.00', aOrcamentoProxy.ObterValor));
            Writeln('3. Valor do Or�amento: R$ ', FormatFloat('###,###,###,##0.00', aOrcamentoProxy.ObterValor));
            Writeln('4. Valor do Or�amento: R$ ', FormatFloat('###,###,###,##0.00', aOrcamentoProxy.ObterValor));
            Writeln('5. Valor do Or�amento: R$ ', FormatFloat('###,###,###,##0.00', aOrcamentoProxy.ObterValor));
         finally
            aOrcamentoProxy.Destroy;
         end;
      finally
         aOrcamento.Destroy;
      end;
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end;

   Readln;
end.
