import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rpg_cast/views/forgotPassword.dart';
import 'package:rpg_cast/views/login.dart';
import 'package:rpg_cast/views/register.dart';

//*Bibliotecas Back4App
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  //*Spash Screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //* Back4App
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = 'kY8RJOQcAocAgo1ks3x1LVhxVMtPpf0ylQ8LffG0';
  const keyClientKey = 'W6ml6V9daB19a0r642AD76LHoENdTKoaFvy3G7wA';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(const MyApp());

  // whenever your initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();
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
