import 'package:flutter/material.dart';
import 'package:rpg_cast/views/forgotPassword.dart';
import 'package:rpg_cast/views/login.dart';
import 'package:rpg_cast/views/register.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MyApp(),
  );

  //* Deixa o app em fullscreen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/register': (context) => Register(),
        '/forgotPassword': (context) => ForgotPassword(),
      },
    );
  }
}
