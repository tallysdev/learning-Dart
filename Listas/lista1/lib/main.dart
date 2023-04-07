import 'package:flutter/material.dart';

void main(List<String> args) {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      fontFamily: 'Bebas Neue',
      colorScheme: const ColorScheme.dark(),
    ),
    home: Scaffold(
        appBar: AppBar(title: const Text("Meu app")),
        body: Center(
            child: Column(
          children: const [
            Text("Primeira Area"),
            Text("Segunda Area"),
            Text("Terceira Area")
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp), label: "Center"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp), label: "Left"),
          ],
        )),
  );
  runApp(app);
}
