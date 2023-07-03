import 'package:flutter/material.dart';
import '../data/data_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text("Dicas"), actions: [
            PopupMenuButton(
              itemBuilder: (_) => [1, 2, 3, 4]
                  .map((num) => PopupMenuItem(
                        value: num,
                        child: Text("Carregar $num itens por vez"),
                      ))
                  .toList(),
            )
          ]),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                switch (value['status']) {
                  case TableStatus.idle:
                    return const Center(child: Text("Toque em algum botão"));

                  case TableStatus.loading:
                    return const Center(child: CircularProgressIndicator());

                  case TableStatus.ready:
                    return SingleChildScrollView(
                        child: DataTableWidget(
                            jsonObjects: value['dataObjects'],
                            propertyNames: value['propertyNames'],
                            columnNames: value['columnNames']));

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
  final _itemSelectedCallback;
  NewNavBar({itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}
  @override
  Widget build(BuildContext context) {
    var state = useState(1);
    return BottomNavigationBar(
        type: BottomNavigationBarType
          .fixed,
        onTap: (index) {
          state.value = index;

          _itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Cor",
            icon: Icon(Icons.color_lens_outlined),
          ),
          BottomNavigationBarItem(
              label: "Veículos", icon: Icon(Icons.car_repair)),
          BottomNavigationBarItem(
              label: "Cannabis", icon: Icon(Icons.energy_savings_leaf_outlined)),
              BottomNavigationBarItem(
              label: "Moeda Digital", icon: Icon(Icons.attach_money_outlined)),
              BottomNavigationBarItem(
              label: "Sobremesas", icon: Icon(Icons.fastfood_outlined))
        ]);
  }
  // crypto_coin,
  // dessert,
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;
  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const [],
      this.propertyNames = const []});
  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                onSort: (columnIndex, ascending) =>
                    dataService.ordenarEstadoAtual(propertyNames[columnIndex]),
                label: Expanded(
                    child: Text(name,
                        style: const TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text('${obj[propName]}')))
                    .toList()))
            .toList());
  }
}

// codigo base proposto pelo professor fabricio na receita 9