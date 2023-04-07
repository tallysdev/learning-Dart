import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text("Cervejas")),
        body: DataTable(
          columns: const[
            DataColumn(label: Text("Nome")),
            DataColumn(label: Text("Estilo")),
            DataColumn(label: Text("IBU"))
          ],
          rows: const[
            DataRow(cells: [DataCell(Text("La Fin Du Monde")), DataCell(Text("Bock")), DataCell(Text("65"))]),
            DataRow(cells: [DataCell(Text("Sapporo Premium")), DataCell(Text("Sour Ale")), DataCell(Text("54"))]),
            DataRow(cells: [DataCell(Text("Duvel")), DataCell(Text("Pilsner")), DataCell(Text("82"))])
          ],
        ),
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

// Faça um novo aplicativo. Pode copiar e colar o app dessa receita para começar. Substitua title do AppBar por um texto com o string "Cervejas". Em seguida, substitua o body do Scaffold por uma tabela, essa tabela pode ser construída através do widget DataTable. Os cabeçalhos das colunas da tabela devem ter os rótulos "Nome", "Estilo" e "IBU".  Preencha a tabela com 3 linhas. A linha 1 deve ter os valores La Fin Du Monde, Bock e 65. A linha 2 deve ter os valores Sapporo Premium, Sour Ale e 54. E a linha 3 deve ter os valores Duvel, Pilsner e 82. 

// Tente acrescentar diversas outras linhas (invente os dados). O que acontece quando as informações não cabem mais na tela? Que tal fazer com que se possa deslizar pelos dados da tabela através do mouse ou de gesto com o dedo? É bem mais fácil do que parece e tem tudo a vem com a moral dessa receita. Ache uma caixa que saiba implementar essa funcionalidade (isso se chava scroll) e fabrique essa caixa colocando seu DataTable dentro dela. E só.