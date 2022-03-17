import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //* Deixa o APP em tela cheia
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  
  //* Variavel para mostrar a senha
  bool showPassword = true;

  //*Controladores do texto
  TextEditingController userController = TextEditingController();
  TextEditingController passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
            flex: 3,
            child: Image(
              image: AssetImage('assets/images/icon.png'),
              //height: MediaQuery.of(context).size.height * 0.35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 37, 39, 73),
                borderRadius: BorderRadius.only(
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
                            fontFamily: 'Ancient',
                            fontSize: 40,
                            //fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 253, 110, 0),
                          ),
                        ),
                      ),

                      //* Campo de Usuario
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),

                        //* Parametros do TextField
                        child: TextField(
                          controller: userController,
                          textAlign: TextAlign.center,
                          cursorColor: const Color.fromARGB(255, 255, 111, 0),
                          style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 255, 111, 0),
                          ),

                          //* Decoração do TextField
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            enabledBorder: OutlineInputBorder(
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
                                color: Color.fromARGB(255, 255, 111, 0),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
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
                        padding: const EdgeInsets.symmetric(vertical: 10),

                        //* Parametros do TextField
                        child: TextField(
                          controller: passwdController,
                          textAlign: TextAlign.center,
                          obscureText: showPassword,
                          cursorColor: const Color.fromARGB(255, 255, 111, 0),
                          style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 255, 111, 0),
                          ),

                          //* Decoração do TextField
                          decoration: InputDecoration(
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
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 111, 0),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 238, 103, 0),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                userController.clear();
                                passwdController.clear();

                                //*Temporariamente mostra fora de serviço
                                showDialog(
                                  //? impede que apertando fora do Alert feche o alert
                                  barrierDismissible: false,

                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    actionsAlignment: MainAxisAlignment.center,
                                    title: Text(
                                      'Erro',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'Ancient',
                                        color: Colors.red[600],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: const Text(
                                      'Sistema fora de serviço',
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      TextButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color.fromARGB(
                                              255, 238, 103, 0),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },
                                        child: const Text(
                                          "OK",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontFamily: "Ancient",
                              fontSize: 30,
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
                              onPressed: () {},
                              child: const Text('Esqueci a senha'),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            TextButton(
                              style: const ButtonStyle(
                                alignment: Alignment.centerRight,
                              ),
                              onPressed: () {},
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
    );
  }
}
