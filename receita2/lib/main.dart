import 'package:flutter/material.dart';

class NewNavBar extends StatelessWidget {
  final List<Icon> icons;
  final int selectedIndex;

  NewNavBar({required this.icons, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    assert(icons.length >= 2 && icons.length <= 5);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.amber,
      currentIndex: selectedIndex,
      onTap: (int index) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => MyApp(
              selectedIndex: index,
            ),
          ),
        );
      },
      items: List.generate(
        icons.length,
        (index) => BottomNavigationBarItem(
          icon: icons[index],
          label: '',
        ),
      ),
    );
  }
}

class NewBody extends StatelessWidget {
  NewBody();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: const [
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.selectedIndex});
  final int selectedIndex;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  Widget build(BuildContext context) {
    final List<Icon> icons = [
      const Icon(Icons.coffee_outlined),
      const Icon(Icons.local_drink_outlined),
      const Icon(Icons.flag_outlined),
      const Icon(Icons.fastfood_outlined),
    ];

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: NewAppBar(),
        body: NewBody(),
        bottomNavigationBar: NewNavBar(
          icons: icons,
          selectedIndex: _selectedIndex,
        ),
      ),
    );
  }
}

void main() {
  MyApp app = const MyApp(selectedIndex: 0);
  runApp(app);
}
