import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

enum ItemType { beer, coffee, nation, none }

class DataService {
  static const MAX_N_ITEMS = 15;

  static const MIN_N_ITEMS = 3;

  static const DEFAULT_N_ITEMS = 7;

  int _numberOfItems = DEFAULT_N_ITEMS;

  set numberOfItens(n) {
    _numberOfItems = n < 0
        ? MIN_N_ITEMS
        : n > MAX_N_ITEMS
            ? MAX_N_ITEMS
            : n;
  }

  get numberOfIntens {
    return _numberOfItems;
  }

  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({
    'status': TableStatus.idle,
    'dataObjects': [],
    'itemType': ItemType.none
  });

  void carregar(index) {
    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes];

    funcoes[index]();
  }

  void carregarCafes() {
    //ignorar solicitação se uma requisição já estiver em curso

    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    if (tableStateNotifier.value['itemType'] != ItemType.coffee) {
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': ItemType.coffee
      };
    }

    var coffeesUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '$_numberOfItems'});

    http.read(coffeesUri).then((jsonString) {
      var coffeesJson = jsonDecode(jsonString);

      //se já houver cafés no estado da tabela...

      if (tableStateNotifier.value['status'] != TableStatus.loading) {
        coffeesJson = [
          ...tableStateNotifier.value['dataObjects'],
          ...coffeesJson
        ];
      }

      tableStateNotifier.value = {
        'itemType': ItemType.coffee,
        'status': TableStatus.ready,
        'dataObjects': coffeesJson,
        'propertyNames': ["blend_name", "origin", "variety"],
        'columnNames': ["Nome", "Origem", "Tipo"]
      };
    });
  }

  void carregarNacoes() {
    //ignorar solicitação se uma requisição já estiver em curso

    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    if (tableStateNotifier.value['itemType'] != ItemType.nation) {
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': ItemType.nation
      };
    }

    var nationsUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '$_numberOfItems'});

    http.read(nationsUri).then((jsonString) {
      var nationsJson = jsonDecode(jsonString);

      //se já houver nações no estado da tabela...

      if (tableStateNotifier.value['status'] != TableStatus.loading) {
        nationsJson = [
          ...tableStateNotifier.value['dataObjects'],
          ...nationsJson
        ];
      }

      tableStateNotifier.value = {
        'itemType': ItemType.nation,
        'status': TableStatus.ready,
        'dataObjects': nationsJson,
        'propertyNames': [
          "nationality",
          "capital",
          "language",
          "national_sport"
        ],
        'columnNames': ["Nome", "Capital", "Idioma", "Esporte"]
      };
    });
  }

  void carregarCervejas() {
    //ignorar solicitação se uma requisição já estiver em curso

    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    //emitir estado loading se items em exibição não forem cervejas

    if (tableStateNotifier.value['itemType'] != ItemType.beer) {
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': ItemType.beer
      };
    }

    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '$_numberOfItems'});

    http.read(beersUri).then((jsonString) {
      var beersJson = jsonDecode(jsonString);

      //se já houver cervejas no estado da tabela...

      if (tableStateNotifier.value['status'] != TableStatus.loading) {
        beersJson = [...tableStateNotifier.value['dataObjects'], ...beersJson];
      }

      tableStateNotifier.value = {
        'itemType': ItemType.beer,
        'status': TableStatus.ready,
        'dataObjects': beersJson,
        'propertyNames': ["name", "style", "ibu"],
        'columnNames': ["Nome", "Estilo", "IBU"]
      };
    });
  }
}

var dataService = DataService();

// codigo base proposto pelo professor fabricio na receita 9