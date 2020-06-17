import 'package:flutter/material.dart';
import 'package:tasks/model/usuario.dart';
import 'package:tasks/pages/home_page.dart';
import 'package:tasks/pages/login_page.dart';
import 'package:tasks/utils/nav.dart';
import 'package:tasks/utils/sql/db_helper.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future futureA = DatabaseHelper.getInstance().db;

    Future<Usuario> futureB = Usuario.get();

    Future.wait([futureA, futureB]).then((List values) {
      Usuario user = values[1];
      if (user != null) {
        push(context, HomePage(), replace: true);
      } else {
        push(context, LoginPage());
      }
    });

    _delay();
  }

  Future<void> _delay() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return LoginPage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF23acbc),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 50,
        ),
      ),
    );
  }
}
