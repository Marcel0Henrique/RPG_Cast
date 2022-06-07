import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rpg_cast/keys.dart';
import 'package:rpg_cast/views/forgotPassword.dart';
import 'package:rpg_cast/views/login.dart';
import 'package:rpg_cast/views/register.dart';

//*Bibliotecas Back4App
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  //* Back4App
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = applicationId;
  final keyClientKey = clientKey;
  final keyParseServerUrl = "'https://parseapi.back4app.com'";

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(const MyApp());
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
