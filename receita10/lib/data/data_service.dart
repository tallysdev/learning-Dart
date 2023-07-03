import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../util/ordenador.dart';

enum TableStatus { idle, loading, ready, error }

enum ItemType {
  color,
  vehicle,
  cannabis,
  crypto_coin,
  dessert,
  none;

  String get asString => name;

  List<String> get columns => this == color
      ? ["Nome", "Hex_value", "Hsl_value"]
      : this == vehicle
          ? ["Make_and_model", "Color", "Mileage"]
          : this == cannabis
              ? ["Variedade", "canabinóide", "Uso medicinal"]
              : this == crypto_coin
                  ? ["Nome", "acrônimo", "Logo"]
                  : this == dessert
                      ? ["variedade", "cobertura", "sabor"]
                      : [];

  List<String> get properties => this == color
      ? ["color_name", "hex_value", "hsl_value"]
      : this == vehicle
          ? ["make_and_model", "color", "mileage"]
          : this == cannabis
              ? ["strain", "cannabinoid", "medical_use"]
              : this == crypto_coin
                  ? ["coin_name", "acronym", "logo"]
                  : this == dessert
                      ? ["variety", "topping", "flavor"]
                      : [];
}

class Ordenacao extends Decididor {
  final String propriedade;

  final bool crescente;

  Ordenacao(this.propriedade, [this.crescente = true]);

  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try {
      final ordemCorreta = crescente ? [atual, proximo] : [proximo, atual];

      return ordemCorreta[0][propriedade]
              .compareTo(ordemCorreta[1][propriedade]) >
          0;
    } catch (error) {
      return false;
    }
  }
}

class DataService {
  static const MAX_N_ITEMS = 15;

  static const MIN_N_ITEMS = 3;

  static const DEFAULT_N_ITEMS = 7;

  int _numberOfItems = DEFAULT_N_ITEMS;

  set numberOfItems(n) {
    _numberOfItems = n < 0
        ? MIN_N_ITEMS
        : n > MAX_N_ITEMS
            ? MAX_N_ITEMS
            : n;
  }

  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({
    'status': TableStatus.idle,
    'dataObjects': [],
    'itemType': ItemType.none
  });

  void carregar(index) {
    final params = [ItemType.color, ItemType.vehicle, ItemType.cannabis, ItemType.crypto_coin,ItemType.dessert ];

    carregarPorTipo(params[index]);
  }

  void ordenarEstadoAtual(final String propriedade) {
    List objetos = tableStateNotifier.value['dataObjects'] ?? [];

    if (objetos == []) return;

    Ordenador ord = Ordenador();

    Decididor d = Ordenacao(propriedade);

    var objetosOrdenados = ord.ordenarItens(objetos, d);

    emitirEstadoOrdenado(objetosOrdenados, propriedade);
  }

  Uri montarUri(ItemType type) {
    return Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/${type.asString}/random_${type.asString}',
        queryParameters: {'size': '$_numberOfItems'});
  }

  Future<List<dynamic>> acessarApi(Uri uri) async {
    var jsonString = await http.read(uri);

    var json = jsonDecode(jsonString);

    json = [...tableStateNotifier.value['dataObjects'], ...json];

    return json;
  }

  void emitirEstadoOrdenado(List objetosOrdenados, String propriedade) {
    var estado = Map<String, dynamic>.from(tableStateNotifier.value);
    estado['dataObjects'] = objetosOrdenados;
    estado['sortCriteria'] = propriedade;
    estado['ascending'] = true;
    tableStateNotifier.value = estado;
  }

  void emitirEstadoCarregando(ItemType type) {
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': [],
      'itemType': type
    };
  }

  void emitirEstadoPronto(ItemType type, var json) {
    tableStateNotifier.value = {
      'itemType': type,
      'status': TableStatus.ready,
      'dataObjects': json,
      'propertyNames': type.properties,
      'columnNames': type.columns
    };
  }

  bool temRequisicaoEmCurso() =>
      tableStateNotifier.value['status'] == TableStatus.loading;

  bool mudouTipoDeItemRequisitado(ItemType type) =>
      tableStateNotifier.value['itemType'] != type;

  void carregarPorTipo(ItemType type) async {
    if (temRequisicaoEmCurso()) return;

    if (mudouTipoDeItemRequisitado(type)) {
      emitirEstadoCarregando(type);
    }

    var uri = montarUri(type);
    var json = await acessarApi(uri); //, type);
    emitirEstadoPronto(type, json);
  }
}

final dataService = DataService();
