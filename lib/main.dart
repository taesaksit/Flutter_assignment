import 'dart:html';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import
import 'animate_list_view_page.dart';
import 'food_menu.dart';
import 'gallery_page.dart';

void main() {
  runApp(MyApp());
}

bool _visible = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xfff90202)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      case 2:
        page = AnimationPage();
      case 3:
        page = FormPage();
      case 4:
        page = ListViewPage();
      case 5:
        page = AnimatedListViewPage(); // New Animated ListView page
        break;
      case 6:
        page = MenuPage(); // New Menu page
        break;
      case 7:
        page = GalleryPage(); // New Gallery page
        break;

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('SAKSIT APP'),
        backgroundColor: Color(0xFF1877F2), // เปลี่ยนสีพื้นหลัง AppBar
        titleTextStyle: TextStyle(
          color: Colors.white, // เปลี่ยนสีฟอนต์ใน AppBar
          fontSize: 24, // ขนาดฟอนต์
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff1877F2),
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              setState(() {
                selectedIndex = 0;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () {
              setState(() {
                selectedIndex = 1;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.animation),
            title: Text('Animation'),
            onTap: () {
              setState(() {
                _visible = false;
                selectedIndex = 2;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
              leading: Icon(Icons.description),
              title: Text('Form'),
              onTap: () {
                setState(() {
                  _visible = false;
                  selectedIndex = 3;
                  Navigator.pop(context);
                });
              }),
          ListTile(
              leading: Icon(Icons.list),
              title: Text('ListView'),
              onTap: () {
                setState(() {
                  _visible = false;
                  selectedIndex = 4;
                  Navigator.pop(context);
                });
              }),
          ListTile(
            leading: Icon(Icons.line_style_outlined),
            title: Text('Animated ListView'),
            onTap: () {
              setState(() {
                selectedIndex = 5; // Add a new index for this page
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text('Menu'),
            onTap: () {
              setState(() {
                selectedIndex = 6; // Add a new index for MenuPage
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Gallery'),
            onTap: () {
              setState(() {
                selectedIndex = 7; // Add a new index for GalleryPage
                Navigator.pop(context);
              });
            },
          )
        ]),
      ),
      body: page,
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => {},
              child: Text('Click'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // background color
                foregroundColor: Colors.white, // text color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.grey, // shadow color
                elevation: 5, // elevation/shadow of the button
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _visible = true; // Start with _visible set to true

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      setState(() {
        _visible = false;
      });
    });

    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Animation Fade by Potae'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 1000),
          child: Container(
            width: 200,
            height: 200,
            color: Color(0xfffba656),
          ),
        ),
      ),
    );
    return scaffold;
  }
}

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listview page'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2022/10/23/13/43/canoe-7541311_1280.jpg'),
                ),
                title: Text('Page'),
                trailing: Icon(Icons.check)),
          );
        },
      ),
    );
  }
}
