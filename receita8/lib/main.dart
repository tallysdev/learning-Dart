import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

class DataService {
  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({'status': TableStatus.idle, 'dataObjects': []});
  final ValueNotifier<List<String>> columnNamesNotifier = ValueNotifier([]);
  final ValueNotifier<List<String>> propertyNamesNotifier = ValueNotifier([]);

  void carregar(index) {
    final funcoes = [carregarCoffees, carregarBeers, carregarFoods];

    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': []
    };

    funcoes[index]();
  }

  void carregarCoffees() {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '5'});

    http.read(beersUri).then((jsonString) {
      var beersJson = jsonDecode(jsonString);

      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': beersJson
      };
      propertyNamesNotifier.value = [
        "blend_name",
        "origin",
        "variety",
      ];
      columnNamesNotifier.value = [
        "Blend_name",
        "Origin",
        "Variety",
      ];
    });
  }

  void carregarFoods() {
    var foodsUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/food/random_food',
        queryParameters: {'size': '5'});

    http.read(foodsUri).then((jsonString) {
      var beersJson = jsonDecode(jsonString);

      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': beersJson,
      };
      propertyNamesNotifier.value = [
        "dish",
        "description",
        "ingredient",
      ];
      columnNamesNotifier.value = [
        "Dish",
        "Description",
        "Ingredient",
      ];
    });
  }

  void carregarBeers() {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '5'});

    http.read(beersUri).then((jsonString) {
      var beersJson = jsonDecode(jsonString);

      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': beersJson,
      };
      columnNamesNotifier.value = [
        "Brand",
        "Name",
        "Style",
      ];
      propertyNamesNotifier.value = [
        "brand",
        "name",
        "style",
      ];
    });
  }
}

final dataService = DataService();

void main() {
  MyApp app = const MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                switch (value['status']) {
                  case TableStatus.idle:
                    return const Text("Toque algum botão");

                  case TableStatus.loading:
                    return const Center(child: CircularProgressIndicator());

                  case TableStatus.ready:
                    return DataTableWidget(
                        jsonObjects: value['dataObjects']);

                  case TableStatus.error:
                    return const Text("Lascou");
                }

                return const Text("...");
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  // ignore: prefer_typing_uninitialized_variables
  final _itemSelectedCallback;

  const NewNavBar({super.key, itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int);

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;

          _itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Comidas", icon: Icon(Icons.fastfood_outlined))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  // final List<String> columnNames;

  // final List<String> propertyNames;

  const DataTableWidget({super.key, this.jsonObjects = const []});

  @override
  Widget build(BuildContext context) {
    final columnNames = dataService.columnNamesNotifier.value;
    final propertyNames = dataService.propertyNamesNotifier.value;
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: const TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}

// Esse codigo foi baseado na receita 8 do professor @Fabricio.
// https://sites.google.com/view/fabricio10/p%C3%A1gina-inicial/cursos/oo-dart/dartreceita8
