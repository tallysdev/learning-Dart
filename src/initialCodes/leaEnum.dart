void main(List<String> args) {
  var pagamaneto = Pagamento();
  pagamaneto.pagar(TipoPagamento.PIX);
}

enum TipoPagamento {
  PIX,
  CARTAO,
  BOLETO;
}

extension ExtensionTipoPagamento on TipoPagamento {
  String toValue() {
    Map map = {
      TipoPagamento.PIX: 'pix',
      TipoPagamento.CARTAO: 'cartao',
      TipoPagamento.BOLETO: 'boleto',
    };

    return map[this];
  }
}

class Pagamento {
  void pagar(TipoPagamento tipoPagamento) {
    if (tipoPagamento.toValue() == 'pix') {
      print('pagamento com pix');
    } else if (tipoPagamento.toValue() == 'boleto') {
      print('pagamento por boleto');
    } else if (tipoPagamento.toValue() == 'cartao') {
      print('pagamento por cartao');
    }
  }
}
