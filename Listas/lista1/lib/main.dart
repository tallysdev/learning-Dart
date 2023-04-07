import 'package:flutter/material.dart';

void main(List<String> args) {
  MaterialApp app = MaterialApp(
    theme: ThemeData.dark(),
    home: Scaffold(
        appBar: AppBar(title: const Text("Meu app")),
        body: Center(
            child: Column(
          children: const [
            Text("Primeira Area",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto")),
            Text("Segunda Area",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto")),
            Text("Terceira Area",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"))
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
