import 'package:auth_app/screens/home.dart';
import 'package:auth_app/screens/login.dart';
import 'package:auth_app/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        'home': (context) => Home(accessToken: '', refreshToken: '',),
      },
    );
  }
}
