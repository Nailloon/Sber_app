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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            leading: 
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                actions: [IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.exit_to_app),
                ),],
            floating: true,
            snap: true,
            pinned: true,
            flexibleSpace:  FlexibleSpaceBar(
                title: Text("Екатерина"),
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                expandedTitleScale: 1,
                background: Padding(padding: const EdgeInsets.only(bottom: 36, top:36), child: Image.asset("assets/images/ecat.png", alignment: Alignment.center,width: 50, height: 50,)),
              ),
            expandedHeight: 200.0,
            forceElevated: innerBoxIsScrolled,
          ),
        ),
      ];
    }, body: Builder(builder: (BuildContext context) {
      return CustomScrollView(
        // The "controller" and "primary" members should be left unset, so that
        // the NestedScrollView can control this inner scroll view.
        // If the "controller" property is set, then this scroll view will not
        // be associated with the NestedScrollView.
        slivers: <Widget>[
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverFixedExtentList(
            itemExtent: 48.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  ListTile(title: Text('Item $index')),
              childCount: 30,
            ),
          ),
        ],
      );
    })));
  }
}