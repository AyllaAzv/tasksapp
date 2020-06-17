import 'package:flutter/material.dart';
import 'package:tasks/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: Color.fromRGBO(35, 172, 188, .1),
    100: Color.fromRGBO(35, 172, 188, .2),
    200: Color.fromRGBO(35, 172, 188, .3),
    300: Color.fromRGBO(35, 172, 188, .4),
    400: Color.fromRGBO(35, 172, 188, .5),
    500: Color.fromRGBO(35, 172, 188, .6),
    600: Color.fromRGBO(35, 172, 188, .7),
    700: Color.fromRGBO(35, 172, 188, .8),
    800: Color.fromRGBO(35, 172, 188, .9),
    900: Color.fromRGBO(35, 172, 188, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TasksApp',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF23acbc, color),
      ),
      home: SplashPage(),
    );
  }
}
