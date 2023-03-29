void main(List<String> args) {
  var pagamaneto = Pagamento();
  pagamaneto.pagar(TipoPagamento.CARTAO);
}

enum TipoPagamento {
  PIX(3, 'pix'),
  CARTAO(2, 'cartao'),
  BOLETO(1, 'boleto');

  final int id;
  final String value;
  const TipoPagamento(this.id, this.value);
}

class Pagamento {
  void pagar(TipoPagamento tipoPagamento) {
    if (tipoPagamento.value == 'pix') {
      print('pagamento com pix id:${tipoPagamento.id}');
    } else if (tipoPagamento.value == 'boleto') {
      print('pagamento por boleto id:${tipoPagamento.id}');
    } else if (tipoPagamento.value == 'cartao') {
      print('pagamento por cartao id:${tipoPagamento.id}');
    }
  }
}
