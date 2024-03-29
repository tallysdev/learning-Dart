import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

class DataService {
  final ValueNotifier<Map<String, dynamic>> tableStateNotifier =
      ValueNotifier({'status': TableStatus.idle, 'dataObjects': []});
  final ValueNotifier<List<String>> columnNamesNotifier = ValueNotifier([]);
  final ValueNotifier<List<String>> propertyNamesNotifier = ValueNotifier([]);

  void carregar(index) {
    final funcoes = [carregarCoffees, carregarBeers, carregarFoods,carregarCannabis];

    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': []
    };

    funcoes[index]();
  }

  void carregarCoffees() {
    var coffeesUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '5'});

    http.read(coffeesUri).then((jsonString) {
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
    }).catchError((err) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': []
      };
    });
  }

  Future<void> carregarFoods() async {
    var foodsUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/food/random_food',
        queryParameters: {'size': '5'});

    try {
      var jsonString = await http.read(foodsUri);
      var foodsJson = jsonDecode(jsonString);

      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': foodsJson
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
    } catch (e) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': []
      };
    }
  }

  Future<void> carregarCannabis() async {
    var cannabissUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/cannabis/random_cannabis',
        queryParameters: {'size': '5'});
    try {
      var jsonString = await http.read(cannabissUri);
      var cannabissJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': cannabissJson
      };
      columnNamesNotifier.value = ["Strain", "Cannabinoid", "Terpene"];
      propertyNamesNotifier.value = ["strain", "cannabinoid", "terpene"];
    } catch (e) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': []
      };
    }
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
    }).catchError((err) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': []
      };
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
            title: const Text("Quintana EGC"),
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                switch (value['status']) {
                  case TableStatus.idle:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                              "https://i0.wp.com/quintanagastronomia.com.br/wp-content/uploads/2018/06/ecogastronomia-logo-branco.png?fit=500%2C200&ssl=1"),
                          const SizedBox(height: 10),
                          const Text(
                              "Escolha uma opção do cardapio nos botoes abaixo")
                        ],
                      ),
                    );

                  case TableStatus.loading:
                    return const Center(child: CircularProgressIndicator());

                  case TableStatus.ready:
                    return DataTableWidget(jsonObjects: value['dataObjects']);

                  case TableStatus.error:
                    return const Center(
                        child: Text("Aconteceu um imprevisto, chame o DevOps"));
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
      type: BottomNavigationBarType.fixed,
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
              label: "Comidas", icon: Icon(Icons.flatware_rounded)),
          BottomNavigationBarItem(label: "Naturais...", icon: Icon(Icons.smoking_rooms_rounded))
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
