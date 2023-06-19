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

  void _recs(
      String choose, ItemType type, List propertyNames, List columnNames) {
    var chooseUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/$choose/random_$choose',
        queryParameters: {'size': '$_numberOfItems'});
    http.read(chooseUri).then((jsonString) {
      var chooseJson = jsonDecode(jsonString);
      if (tableStateNotifier.value['status'] != TableStatus.loading) {
        chooseJson = [
          ...tableStateNotifier.value['dataObjects'],
          ...chooseJson
        ];
      }
      tableStateNotifier.value = {
        'itemType': type,
        'status': TableStatus.ready,
        'dataObjects': chooseJson,
        'propertyNames': propertyNames,
        'columnNames': columnNames
      };
    });
  }

  void _caseLoading(ItemType type) {
    if (tableStateNotifier.value['itemType'] != type) {
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': type
      };
    }
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
    _caseLoading(ItemType.coffee);
    List<String> cof = ["blend_name", "origin", "variety"];
    List<String> fee = ["Nome", "Origem", "Tipo"];
    _recs("coffee", ItemType.coffee, cof, fee);
  }

  void carregarNacoes() {
    //ignorar solicitação se uma requisição já estiver em curso
    if (tableStateNotifier.value['status'] == TableStatus.loading) return;
    _caseLoading(ItemType.nation);
    List<String> cof = ["nationality", "capital", "language", "national_sport"];
    List<String> fee = ["Nome", "Capital", "Idioma", "Esporte"];
    _recs("nation", ItemType.nation, cof, fee);
  }

  void carregarCervejas() {
    //ignorar solicitação se uma requisição já estiver em curso
    if (tableStateNotifier.value['status'] == TableStatus.loading) return;
    _caseLoading(ItemType.beer);
    List<String> cof = ["name", "style", "ibu"];
    List<String> fee = ["Nome", "Estilo", "IBU"];
    _recs("beer", ItemType.beer, cof, fee);
  }
}

var dataService = DataService();

// codigo base proposto pelo professor fabricio na receita 9