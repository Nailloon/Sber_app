import 'package:flutter/material.dart';
import 'package:sber_app_filyakin/sliverAppBarWithImage.dart';
import 'package:sber_app_filyakin/sliverAppBarDelegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sber_app_Filyakin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white54,
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.green,
          indicatorSize: TabBarIndicatorSize.tab,
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.green),
        ),
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.black,
            onPrimary: Colors.grey,
            secondary: Colors.lightGreenAccent,
            onSecondary: Colors.lightGreenAccent,
            error: Colors.red,
            onError: Colors.redAccent,
            background: Colors.white,
            onBackground: Colors.black,
            surface: Colors.white,
            onSurface: Colors.black),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = ["Профиль", "Настройки"];
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView( 
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
                const sliverAppBarWithImage(),
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: tabs.map((String name) => Tab(text: name)).toList(),
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: const Center(
              child: Text("Sample text"),
            ),
        ),
      ),
    );
  }
}
