unit UJconzatti.Loja.Entidade.Orcamento;

interface

uses
   System.SysUtils,
   System.Generics.Collections,
   UJconzatti.Loja.Entidade.Orcamento.Situacao,
   UJconzatti.Loja.Entidade.Orcamento.Item,
   UJconzatti.Loja.Entidade.Orcavel;

type
   TEntidadeOrcamento = class(TEntidadeOrcavel)
   private
      FValor: Currency;
      FSituacao : TEntidadeOrcamentoSituacao;
      FListaItem : TObjectList<TEntidadeOrcavel>;
      procedure DestruirSituacaoSeNecessario;
   public
      constructor Create;
      destructor Destroy; override;
      function ObterInformacao: String;
      procedure AplicarDescontoExtra;
      procedure AtualizarSituacao(aSitucao : TEntidadeOrcamentoSituacao);
      procedure Aprovar;
      procedure Reprovar;
      procedure Finalizar;
      function ObterQuantidadeItem: Integer;
      procedure AdicionarItem(aItem : TEntidadeOrcavel);
      function ObterValor: Currency; override;
   end;

implementation

uses
   UJconzatti.Loja.Entidade.Orcamento.Situacao.EmAnalise;

{ TEntidadeOrcamento }

constructor TEntidadeOrcamento.Create;
begin
   FValor := 0;
   FListaItem := TObjectList<TEntidadeOrcavel>.Create;
   FSituacao := TEntidadeOrcamentoSituacaoEmAnalise.Create(Self);
end;

destructor TEntidadeOrcamento.Destroy;
begin
   DestruirSituacaoSeNecessario;
   FListaItem.Destroy;
   inherited;
end;

function TEntidadeOrcamento.ObterInformacao: String;
begin
   Result := Format('%d itens com valor total de R$ %s [%s]',
                    [ObterQuantidadeItem,
                     FormatFloat('###,###,###,##0.00', FValor),
                     FSituacao.ObterDescricao])
end;

procedure TEntidadeOrcamento.AdicionarItem(aItem : TEntidadeOrcavel);
begin
   FValor := FValor + aItem.ObterValor;
   FListaItem.Add(aItem);
end;

function TEntidadeOrcamento.ObterQuantidadeItem: Integer;
begin
   Result := FListaItem.Count;
end;

function TEntidadeOrcamento.ObterValor: Currency;
begin
   Result := FValor;
end;

procedure TEntidadeOrcamento.AplicarDescontoExtra;
var VlDescontoExtra : Currency;
begin
   VlDescontoExtra := FSituacao.CalcularValorDescontoExtra;
   FValor := FValor - VlDescontoExtra;
end;

procedure TEntidadeOrcamento.Aprovar;
begin
   FSituacao.Aprovar;
end;

procedure TEntidadeOrcamento.Reprovar;
begin
   FSituacao.Reprovar;
end;

procedure TEntidadeOrcamento.Finalizar;
begin
   FSituacao.Finalizar;
end;

procedure TEntidadeOrcamento.AtualizarSituacao(aSitucao : TEntidadeOrcamentoSituacao);
begin
   DestruirSituacaoSeNecessario;
   FSituacao := aSitucao;
end;

procedure TEntidadeOrcamento.DestruirSituacaoSeNecessario;
begin
   if Assigned(FSituacao) then
      FSituacao.Destroy;
end;

end.
