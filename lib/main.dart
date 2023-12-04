import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sber_app_Filyakin',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.lightGreenAccent,),
        tabBarTheme: TabBarTheme(indicatorColor: Colors.lightGreenAccent,overlayColor: MaterialStateColor.resolveWith((states) => Colors.lightGreenAccent),),
        colorScheme: ColorScheme(brightness: Brightness.light, primary: Colors.black, onPrimary: Colors.grey, secondary: Colors.lightGreenAccent, onSecondary: Colors.lightGreenAccent, error: Colors.red, onError: Colors.redAccent, background: Colors.white, onBackground: Colors.black, surface: Colors.white, onSurface: Colors.black),
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
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  leading: 
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/icons/ic_24_cross.png"),
                ),
                actions: [IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/icons/ic_24_arrow_right_square.png"),
                ),],
                  flexibleSpace: FlexibleSpaceBar(
                      title: Text("Екатерина",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          )),
                      centerTitle: true,
                      titlePadding: EdgeInsets.only(bottom: 20),
                      background: Container(
                  padding:  EdgeInsets.only(top: 58),
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: Image.asset('assets/images/ecat.png',
                        width:110,
                        height:110,
                        )
                    )
                  )
                  )),
                ),
                SliverPersistentHeader(
                  //
                  delegate: _SliverAppBarDelegate(
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

  class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
    _SliverAppBarDelegate(this._tabBar);

    final TabBar _tabBar;

    @override
    double get minExtent => _tabBar.preferredSize.height;
    @override
    double get maxExtent => _tabBar.preferredSize.height;

    @override
    Widget build(
        BuildContext context, double shrinkOffset, bool overlapsContent) {
      return Container(
        child: _tabBar,
      );
    }

    @override
    bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
      return false;
    }
  }