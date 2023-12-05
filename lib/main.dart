import 'package:flutter/material.dart';
import 'package:sber_app_filyakin/profileTabScreen.dart';
import 'package:sber_app_filyakin/sliverAppBarWithImage.dart';
import 'package:sber_app_filyakin/sliverAppBarDelegate.dart';
import 'package:sber_app_filyakin/utils/Strings.dart';

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
      supportedLocales: Strings.supportedLocales,
      locale: Strings.locale,
      localizationsDelegates: Strings.localizationDelegates,
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
    var tabs = ["Профиль", "Настройки"];
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView( 
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
           return <Widget>[
              CombinedSliverAppBar(tabs: tabs)
            ];
            },
            body: TabBarView(
            children: <Widget>[
              const ProfileTabScreen(),
              Container(),
            ],
        ),
      ),
    ),
    );
  }
}

class CombinedSliverAppBar extends StatelessWidget {
  final List<String> tabs;

  const CombinedSliverAppBar({Key? key, required this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        expandedHeight: 250.0,
        floating: false,
        pinned: true,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset("assets/icons/ic_24_cross.png"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/ic_24_arrow_right_square.png"),
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          title: Padding(
            padding: const EdgeInsets.only(bottom:45.0),
            child: Text(
              Strings.of(context).userName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          collapseMode: CollapseMode.pin,
          expandedTitleScale: 1.5,
          centerTitle: true,
          titlePadding: const EdgeInsets.only(),
          background: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Align(alignment: Alignment.topCenter,child: SizedBox(
                height: 110,
                width: 110,
                child: Image.asset(
                  'assets/images/ecat.png',
                ),
              ),),
            ) 
          ),
        ),
        bottom: SliverAppTabBar(tabs: tabs),
      ),
    );
  }
}