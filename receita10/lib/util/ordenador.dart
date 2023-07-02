class Ordenador {
  List ordenarItens(List itens, String propriedade, [bool sentido = true]) {
    List itensOrdenados = List.of(itens);
    bool trocouAuMenosUm;
    do {
      trocouAuMenosUm = false;

      for (int i = 0; i < itensOrdenados.length - 1; i++) {
        var atual = itensOrdenados[i];
        var prox = itensOrdenados[i + 1];

        if (sentido) {
          if (atual[propriedade].compareTo(prox[propriedade]) > 0) {
            var aux = itensOrdenados[i];
            itensOrdenados[i] = itensOrdenados[i + 1];
            itensOrdenados[i + 1] = aux;
            trocouAuMenosUm = true;
          }
        } else {
          if (prox[propriedade].compareTo(atual[propriedade]) > 0) {
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
