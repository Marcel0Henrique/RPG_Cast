import 'package:flutter/material.dart';
import 'package:rpg_cast/views/login.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());

  //* Deixa o APP em tela cheia
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Login(),
    );
  }
}
