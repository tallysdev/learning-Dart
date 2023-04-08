import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Center( child: Text("Cervejas"))),
        body: SingleChildScrollView(
                child: Center(
                    child: (DataTable(
          columns: const [
            DataColumn(label: Text("Nome")),
            DataColumn(label: Text("Estilo")),
            DataColumn(label: Text("IBU")),
            DataColumn(label: Text("Ano"))
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text("La Fin Du Monde")),
              DataCell(Text("Bock")),
              DataCell(Text("65")),
              DataCell(Text("1965"))
            ]),
            DataRow(cells: [
              DataCell(Text("Sapporo Premium")),
              DataCell(Text("Sour Ale")),
              DataCell(Text("54")),
              DataCell(Text("1954"))
            ]),
            DataRow(cells: [
              DataCell(Text("Duvel")),
              DataCell(Text("Pilsner")),
              DataCell(Text("82")),
              DataCell(Text("1982"))
            ]),
            DataRow(cells: [
              DataCell(Text("La Fin Du Monde")),
              DataCell(Text("Bock")),
              DataCell(Text("65")),
              DataCell(Text("1965"))
            ]),
            DataRow(cells: [
              DataCell(Text("Sapporo Premium")),
              DataCell(Text("Sour Ale")),
              DataCell(Text("54")),
              DataCell(Text("1954"))
            ]),
            DataRow(cells: [
              DataCell(Text("Duvel")),
              DataCell(Text("Pilsner")),
              DataCell(Text("82")),
              DataCell(Text("1982"))
            ]),
          ],
        )))),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined))
        ]),
      ));

  runApp(app);
}