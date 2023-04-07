import 'package:flutter/material.dart';

void main(List<String> args) {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      fontFamily: 'Bebas Neue',
      colorScheme: const ColorScheme.dark(),
    ),
    home: Scaffold(
        appBar: AppBar(title: const Text("Meu app")),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
          children: const [
            SizedBox(
                width: 150,
                height: 150,
                child: FadeInImage(
                    placeholder: NetworkImage(
                        "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6086.png"),
                    image: NetworkImage(
                        "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6086.png"))),
            SizedBox(
                width: 125,
                height: 125,
                child: FadeInImage(
                    placeholder: NetworkImage(
                        "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6086.png"),
                    image: NetworkImage(
                        "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6086.png"))),
            SizedBox(
                width: 100,
                height: 100,
                child: FadeInImage(
                    placeholder: NetworkImage(
                        "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6086.png"),
                    image: NetworkImage(
                        "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6086.png"))),
          ],
        ))),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp), label: "Right"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp), label: "Center"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp), label: "Left"),
          ],
        )),
  );
  runApp(app);
}
