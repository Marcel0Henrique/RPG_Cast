import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:rpg_cast/views/register.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // To enter FullScreenMode.EMERSIVE_STICKY,

  //* Variavel para mostrar a senha
  bool showPassword = true;

  //*Controladores do texto
  TextEditingController emailController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  bool isLoggedIn = false;

  //* cor primaria e secundaria
  Color primaryColor = const Color.fromARGB(255, 255, 111, 0);
  Color secondColor = const Color.fromARGB(255, 37, 39, 73);

  @override
  Widget build(BuildContext context) {
    final controllerUsername = TextEditingController();
    final controllerPassword = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          reverse: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: const AssetImage('assets/images/icon.png'),
                    height: MediaQuery.of(context).size.height * 0.22,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: secondColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(60),
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child: Center(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: Text(
                                  'RPG Cast',
                                  style: TextStyle(
                                    fontFamily: 'Enchanted',
                                    fontSize: 40,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 253, 110, 0),
                                  ),
                                ),
                              ),

                              //* Campo de Email
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),

                                //* Parametros do TextField
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  cursorColor: primaryColor,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: primaryColor,
                                  ),

                                  //* Decoração do TextField
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: const Icon(
                                      Icons.email,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //* Campo de senha
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),

                                //* Parametros do TextField
                                child: TextField(
                                  controller: passwdController,
                                  obscureText: showPassword,
                                  cursorColor: primaryColor,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: primaryColor,
                                  ),

                                  //* Decoração do TextField
                                  decoration: InputDecoration(
                                    labelText: 'Senha',
                                    prefixIcon: const Icon(
                                      Icons.password,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showPassword
                                              ? showPassword = false
                                              : showPassword = true;
                                        });
                                      },
                                      icon: Icon(showPassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //* Botão login
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 238, 103, 0),
                                  ),
                                  onPressed: isLoggedIn
                                      ? () => doUserLogin()
                                      : () => doUserLogout(),
                                  child: Text(
                                    isLoggedIn ? "Sair" : "Entrar",
                                    style: TextStyle(
                                      fontFamily: "Enchanted",
                                      fontSize: 35,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Row(
                                  children: [
                                    TextButton(
                                      style: const ButtonStyle(
                                        alignment: Alignment.centerLeft,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                '/forgotPassword');
                                      },
                                      child: const Text('Esqueci a senha'),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.23,
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(
                                        alignment: Alignment.centerRight,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed('/register');
                                      },
                                      child: const Text('Cadastrar'),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ].reversed.toList(),
        ),
      ),
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserLogin() async {
    final email = emailController.text.trim();
    final password = passwdController.text.trim();

    final user = ParseUser(null, password, email);

    var response = await user.login();

    if (response.success) {
      showSuccess("Usuario logado com sucesso");
      setState(() {
        isLoggedIn = true;
      });
    } else {
      showError(response.error!.message);
    }
  }

  void doUserLogout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();

    if (response.success) {
      showSuccess("Usuario deslogado com sucesso");
      setState(() {
        isLoggedIn = false;
      });
    } else {
      showError(response.error!.message);
    }
  }
}
