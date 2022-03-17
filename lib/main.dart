import 'package:flutter/material.dart';

import 'package:rpg_cast/views/forgotPassword.dart';
import 'package:rpg_cast/views/login.dart';
import 'package:rpg_cast/views/register.dart';

//*Bibliotecas Back4App
import 'package:parse_server_sdk_flutter/generated/i18n.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'kY8RJOQcAocAgo1ks3x1LVhxVMtPpf0ylQ8LffG0';
  final keyClientKey = 'W6ml6V9daB19a0r642AD76LHoENdTKoaFvy3G7wA';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(MyApp());
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
