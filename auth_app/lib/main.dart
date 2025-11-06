import 'package:auth_app/screens/home.dart';
import 'package:auth_app/screens/login.dart';
import 'package:auth_app/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = FlutterSecureStorage();
  
  final accessToken = await storage.read(key: 'accessToken');
  final refreshToken = await storage.read(key: 'refreshToken');
  
  runApp(MyApp(accessToken: accessToken, refreshToken: refreshToken));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.accessToken, this.refreshToken});

  final String? accessToken;
  final String? refreshToken;
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(primaryColor: Colors.blue),
      initialRoute: '/',
      routes: {
         '/': (context) => accessToken != null
            ? Home(accessToken: accessToken!, refreshToken: refreshToken ?? '')
            : LoginPage(),
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        'home': (context) => Home(accessToken: accessToken ?? '', refreshToken: refreshToken ?? ''),
      },
    );
  }
}
