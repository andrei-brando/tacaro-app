import 'package:flutter/material.dart';
import 'package:tacaro/modules/login/login_page.dart';
import 'package:tacaro/modules/create_account/create_account_page.dart';
import 'package:tacaro/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tá Caro?',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/login',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/create-account': (context) => CreateAccountPage(),
      },
    );
  }
}
