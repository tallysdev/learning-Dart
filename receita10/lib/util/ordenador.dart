class Ordenador {
  List ordenarItens(List itens, Decididor decididor, [bool sentido = true]) {
    List itensOrdenados = List.of(itens);
    bool trocouAuMenosUm;
    do {
      trocouAuMenosUm = false;
      for (int i = 0; i < itensOrdenados.length - 1; i++) {
        var atual = itensOrdenados[i];
        var prox = itensOrdenados[i + 1];
        if (decididor.precisaTrocarAtualPeloProximo(atual, prox)) {
          var aux = itensOrdenados[i];
          itensOrdenados[i] = itensOrdenados[i + 1];
          itensOrdenados[i + 1] = aux;
          trocouAuMenosUm = true;
        }
      }
    } while (trocouAuMenosUm);
    return itensOrdenados;
  }
}

abstract class Decididor {
  bool precisaTrocarAtualPeloProximo(dynamic atual, dynamic proximo);
}
