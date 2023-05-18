import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);

  void carregar(index) {
    var res = null;

    if (index == 1) {
      res = carregarCervejas();
    } else if (index == 2) {
      res = carregarNations();
    } else if (index == 0) {
      res = carregarCafes();
    }
  }

// https://random-data-api.com/api/beer/random_beer?size=5
  Future<void> carregarCervejas() async {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '5'});

    var jsonString = await http.read(beersUri);
    var beersJson = jsonDecode(jsonString);
    tableStateNotifier.value = beersJson;
  }

// https://random-data-api.com/api/coffee/random_coffee?size=5
  Future<void> carregarCafes() async {
    var coffesUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '5'});

    var jsonString = await http.read(coffesUri);
    var coffeesJson = jsonDecode(jsonString);
    tableStateNotifier.value = coffeesJson;
  }

// https://random-data-api.com/api/nation/random_nation?size=5
  Future<void> carregarNations() async {
    var nationsUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '5'});

    var jsonNString = await http.read(nationsUri);
    var nationsJson = jsonDecode(jsonNString);
    tableStateNotifier.value = nationsJson;
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
                return DataTableWidget(
                    jsonObjects: value,
                    propertyNames: const ["name", "style", "ibu"],
                    columnNames: const ["Nome", "Estilo", "IBU"]);
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  final _itemSelectedCallback;

  NewNavBar({super.key, itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(2);

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
              label: "Nações", icon: Icon(Icons.flag_outlined))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;

  const DataTableWidget(
      {super.key,
      this.jsonObjects = const [],
      this.columnNames = const ["Nome", "Estilo", "IBU"],
      this.propertyNames = const ["name", "style", "ibu"]});

  @override
  Widget build(BuildContext context) {
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
