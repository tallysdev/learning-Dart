import 'package:flutter/material.dart';

class NewNavBar extends StatelessWidget {
  NewNavBar();

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Cafés",
        icon: Icon(Icons.coffee_outlined),
      ),
      BottomNavigationBarItem(
          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))
    ]);
  }
}

class NewBody extends StatelessWidget {
  NewBody();

  @override
  Widget build(BuildContext context) {
    return Center(child:Column(children: const [
      Expanded(
        child: Text("La Fin Du Monde - Bock - 65 ibu"),
      ),
      Expanded(
        child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),
      ),
      Expanded(
        child: Text("Duvel - Pilsner - 82 ibu"),
      )
    ]));
  }
}

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
  NewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dicas"),
      centerTitle: true,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: NewAppBar(),
        body: NewBody(),
        bottomNavigationBar: NewNavBar(),
      ));

  runApp(app);
}
