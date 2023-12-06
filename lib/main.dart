import 'package:flutter/material.dart';
import 'package:sber_app_filyakin/screens/profileTabScreen.dart';
import 'package:sber_app_filyakin/widgets/sliverAppBarWithImage.dart';
import 'package:sber_app_filyakin/utils/Strings.dart';
import 'package:sber_app_filyakin/utils/TextThemes.dart';

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
        textTheme: sfProTextTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.green,
          indicatorSize: TabBarIndicatorSize.tab,
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.green),
        ),
        dividerTheme: const DividerThemeData(color: Colors.black, thickness: 2),
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.black,
            onPrimary: Colors.grey,
            secondary: Colors.green,
            onSecondary: Colors.green,
            error: Colors.red,
            onError: Colors.redAccent,
            background: Colors.white,
            onBackground: Colors.white,
            surface: Colors.black,
            onSurface: Colors.black),
        useMaterial3: true,
      ),
      home: const Home(),
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
