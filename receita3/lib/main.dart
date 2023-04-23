import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: const NewAppBar(),
          body: DataBodyWidget(objects: const [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu"
          ]),
          bottomNavigationBar: NewNavBar(objects: const [
            Icon(Icons.air),
            Icon(Icons.water),
            Icon(Icons.fireplace)
          ]),
        ));
  }
}

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Cervejas"),
      actions: [
          PopupMenuButton(
          // add icon, by default "3 dot" icon
          // icon: Icon(Icons.book)
          itemBuilder: (context){
            return [
                  const PopupMenuItem<int>(
                      value: 0,
                      child: Icon(Icons.home),
                  ),

                  const PopupMenuItem<int>(
                      value: 1,
                      child: Icon(Icons.update),
                  ),

                  const PopupMenuItem<int>(
                      value: 2,
                      child: Icon(Icons.exit_to_app),
                  ),
              ];
          },
          onSelected:(value){
            if(value == 0){
                print("My account menu is selected.");
            }else if(value == 1){
                print("Settings menu is selected.");
            }else if(value == 2){
                print("Logout menu is selected.");
            }
          }
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NewNavBar extends StatelessWidget {
  List<Icon> objects;
  NewNavBar({this.objects = const []});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: objects
          .map((e) => BottomNavigationBarItem(icon: e, label: "Itens"))
          .toList(),
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  List<String> objects;

  DataBodyWidget({this.objects = const []});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: objects
            .map((obj) => Expanded(
                  child: Center(child: Text(obj)),
                ))
            .toList());
  }
}
