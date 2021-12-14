import 'package:flutter/material.dart';
import 'package:tacaro/modules/home/home_page.dart';
import 'package:tacaro/modules/login/login_page.dart';
import 'package:tacaro/modules/create_account/create_account_page.dart';
import 'package:tacaro/modules/splash/splash_page.dart';
import 'package:tacaro/shared/models/user_model.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tá Caro?',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/home',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/create-account': (context) => CreateAccountPage(),
        '/home': (context) => HomePage()
        // '/home': (context) => HomePage(
        //       user: ModalRoute.of(context)!.settings.arguments as UserModel,
        //     ),
      },
    );
  }
}
