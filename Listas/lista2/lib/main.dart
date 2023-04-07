import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text("Cervejas")),
        body: SingleChildScrollView(
            child: Center(child:(DataTable(
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


// Tente acrescentar diversas outras linhas (invente os dados). O que acontece quando as informações não cabem mais na tela? Que tal fazer com que se possa deslizar pelos dados da tabela através do mouse ou de gesto com o dedo? É bem mais fácil do que parece e tem tudo a vem com a moral dessa receita. Ache uma caixa que saiba implementar essa funcionalidade (isso se chava scroll) e fabrique essa caixa colocando seu DataTable dentro dela. E só.