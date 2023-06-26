class Ordenador {
  List ordenarCervejasPorNomeCrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;

      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i + 1];

        if (atual["name"].compareTo(proximo["name"]) > 0) {
          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];

          cervejasOrdenadas[i + 1] = aux;

          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);

    return cervejasOrdenadas;
  }

  List ordenarCervejasPorNomeDecrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;

      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i + 1];

        if (atual["name"].compareTo(proximo["name"]) > 0) {
          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];

          cervejasOrdenadas[i + 1] = aux;

          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);

    return cervejasOrdenadas;
  }

  List ordenarCervejasPorEstiloCrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;

      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i + 1];

        if (atual["style"].compareTo(proximo["style"]) > 0) {
          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];

          cervejasOrdenadas[i + 1] = aux;

          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);

    return cervejasOrdenadas;
  }

  List ordenarCervejasPorEstiloDecrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;

      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i + 1];

        if (atual["style"].compareTo(proximo["style"]) > 0) {
          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];

          cervejasOrdenadas[i + 1] = aux;

          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);

    return cervejasOrdenadas;
  }
}
