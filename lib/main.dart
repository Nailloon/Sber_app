import 'package:flutter/material.dart';
import 'package:sber_app_filyakin/screens/profileTabScreen.dart';
import 'package:sber_app_filyakin/utils/Theme.dart';
import 'package:sber_app_filyakin/widgets/sliverAppBarWithImage.dart';
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
      theme: themeData,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabs = [Strings.of(context).profile, Strings.of(context).settings];
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const sliverAppBarWithImage(),
              SliverAppBarTabBar(tabs: tabs)
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
