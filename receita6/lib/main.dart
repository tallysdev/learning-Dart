import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);
  final ValueNotifier<List<String>> columnNamesNotifier = ValueNotifier([]);
  late final ValueNotifier<List<String>> propertyNamesNotifier =
      ValueNotifier([]);

  void carregar(index) {
    Map<int, Function> funcs = {
      0: carregarCafes,
      1: carregarCervejas,
      2: carregarNacoes
    };
    funcs[index]?.call();
  }

  void carregarCervejas() {
    propertyNamesNotifier.value = [
      "brand",
      "name",
      "style",
      "hop",
      "yeast",
      "malts",
      "ibu",
      "alcohol",
      "blg"
    ];
    columnNamesNotifier.value = [
      "Brand",
      "Name",
      "Style",
      "Hop",
      "Yeast",
      "Malts",
      "Ibu",
      "Alcohol",
      "Blg"
    ];
    tableStateNotifier.value = [
      {
        "brand": "Samuel Adams",
        "name": "Stone IPA",
        "style": "Vegetable Beer",
        "hop": "Summit",
        "yeast": "3763 - Roeselare Ale Blend",
        "malts": "Victory",
        "ibu": "80 IBU",
        "alcohol": "6.0%",
        "blg": "10.7°Blg"
      },
      {
        "brand": "Birra Moretti",
        "name": "Péché Mortel",
        "style": "Bock",
        "hop": "TriplePearl",
        "yeast": "1084 - Irish Ale",
        "malts": "Vienna",
        "ibu": "86 IBU",
        "alcohol": "5.1%",
        "blg": "15.4°Blg"
      },
      {
        "brand": "Kirin",
        "name": "La Fin Du Monde",
        "style": "Light Lager",
        "hop": "Horizon",
        "yeast": "1318 - London Ale III",
        "malts": "Black malt",
        "ibu": "51 IBU",
        "alcohol": "7.5%",
        "blg": "16.3°Blg"
      },
      {
        "brand": "Hoegaarden",
        "name": "Weihenstephaner Hefeweissbier",
        "style": "Light Lager",
        "hop": "Brewer’s Gold",
        "yeast": "3763 - Roeselare Ale Blend",
        "malts": "Caramel",
        "ibu": "18 IBU",
        "alcohol": "6.4%",
        "blg": "19.3°Blg"
      },
      {
        "brand": "Murphys",
        "name": "Orval Trappist Ale",
        "style": "European Amber Lager",
        "hop": "Tahoma",
        "yeast": "5335 - Lactobacillus",
        "malts": "Vienna",
        "ibu": "100 IBU",
        "alcohol": "3.1%",
        "blg": "11.6°Blg"
      }
    ];
  }

  void carregarCafes() {
    propertyNamesNotifier.value = [
      "blend_name",
      "origin",
      "variety",
      "notes",
      "intensifier"
    ];
    columnNamesNotifier.value = [
      "Blend_name",
      "Origin",
      "Variety",
      "Notes",
      "Intensifier"
    ];
    tableStateNotifier.value = [
      {
        "blend_name": "Chocolate Star",
        "origin": "Western Region, Bukova, Tanzania",
        "variety": "Bourbon",
        "notes": "juicy, big, honeysuckle, carbon, cherry",
        "intensifier": "rounded"
      },
      {
        "blend_name": "Brooklyn Select",
        "origin": "Kabirizi, Rwanda",
        "variety": "Pacamara",
        "notes": "juicy, velvety, medicinal, watermelon, magnolia",
        "intensifier": "lingering"
      },
      {
        "blend_name": "Street Star",
        "origin": "Alotepec-Metapán, El Salvador",
        "variety": "Villalobos",
        "notes": "structured, watery, tobacco, red currant, carmel",
        "intensifier": "bright"
      },
      {
        "blend_name": "Chocolate Coffee",
        "origin": "San Marcos, Guatemala",
        "variety": "Sarchimor",
        "notes": "mild, syrupy, apricot, blueberry, musty",
        "intensifier": "deep"
      },
      {
        "blend_name": "Cascara Nuts",
        "origin": "Lintong, Sumatra",
        "variety": "SL34",
        "notes": "mild, silky, bergamot, golden raisin, milk chocolate",
        "intensifier": "soft"
      }
    ];
  }

  void carregarNacoes() {
    propertyNamesNotifier.value = [
      "nationality",
      "language",
      "capital",
      "national_sport",
      "flag"
    ];
    columnNamesNotifier.value = [
      "Nationality",
      "Language",
      "Capital",
      "National_sport",
      "Flag"
    ];
    tableStateNotifier.value = [
      {
        "nationality": "Norwegians",
        "language": "Marathi",
        "capital": "Jerusalem",
        "national_sport": "baseball",
        "flag": "🇺🇿"
      },
      {
        "nationality": "Tanzanians",
        "language": "Dutch",
        "capital": "Jakarta",
        "national_sport": "bull fighting",
        "flag": "🇸🇻"
      },
      {
        "nationality": "Kazakhs",
        "language": "Hakka",
        "capital": "Vilnius",
        "national_sport": "bull fighting",
        "flag": "🇨🇺"
      },
      {
        "nationality": "Guatemalans",
        "language": "Romanian",
        "capital": "Muscat",
        "national_sport": "gymnastics",
        "flag": "🇵🇰"
      },
      {
        "nationality": "Arubans",
        "language": "Swedish",
        "capital": "Minsk",
        "national_sport": "dandi biyo",
        "flag": "🇹🇰"
      }
    ];
  }
}

final dataService = DataService();

void main() {
  MyApp app = MyApp();
  dataService.carregarCervejas();
  runApp(app);
}

class MyApp extends StatelessWidget {
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
                return DataTableWidget(jsonObjects: value);
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  var itemSelectedCallback;

  NewNavBar({this.itemSelectedCallback}) {
    itemSelectedCallback ??= (_) {};
  }

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;

          itemSelectedCallback(index);
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

  DataTableWidget({this.jsonObjects = const []});

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
