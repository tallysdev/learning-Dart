class Ordenador {
  List ordenarItens(List itens, String propriedade, [bool sentido = true]) {
    List itensOrdenados = List.of(itens);
    bool trocouAuMenosUm;
    do {
      trocouAuMenosUm = false;
      if (!sentido) {
        // print(itensOrdenados.length);
        for (int i = 0; i < itensOrdenados.length - 1; i++) {
          var prox = itensOrdenados[i];
          var atual = itensOrdenados[i + 1];
          if (atual[propriedade].compareTo(prox[propriedade]) > 0) {
            var aux = itensOrdenados[i];
            itensOrdenados[i] = itensOrdenados[i + 1];
            itensOrdenados[i + 1] = aux;
            trocouAuMenosUm = true;
          }
        }
      } else {
        // print(itensOrdenados.length);
        for (int i = 0; i < itensOrdenados.length - 1; i++) {
          // print(i);
          var atual = itensOrdenados[i];
          var prox = itensOrdenados[i + 1];
          if (atual[propriedade].compareTo(prox[propriedade]) > 0) {
            var aux = itensOrdenados[i];
            itensOrdenados[i] = itensOrdenados[i + 1];
            itensOrdenados[i + 1] = aux;
            trocouAuMenosUm = true;
          }
        }
      }
    } while (trocouAuMenosUm);
    return itensOrdenados;
  }
}
