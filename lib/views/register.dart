import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //* Variaveis para erro

  String? userErro;
  String? emailErro;
  String? passwdErro;

  //* Variavel para animação do botão carregando
  bool isLoading = false;
  bool isDone = false;
  double sizeWidth = 0.43;

  //* Variavel para mostrar a senha
  bool showPassword = true;

  //*Controladores do texto
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwdController = TextEditingController();

  //* cor primaria e secundaria
  Color primaryColor = const Color.fromARGB(255, 255, 111, 0);
  Color secondColor = const Color.fromARGB(255, 37, 39, 73);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          reverse: true,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                                'Cadastro',
                                style: TextStyle(
                                  fontFamily: 'Enchanted',
                                  fontSize: 40,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
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
                                cursorColor: primaryColor,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: primaryColor,
                                ),

                                //* Decoração do TextField
                                decoration: InputDecoration(
                                  errorText: userErro,
                                  labelText: 'Usuário',
                                  prefixIcon: const Icon(
                                    Icons.person,
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

                            //* Campo de Email
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),

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
                                  errorText: emailErro,
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
                              padding: const EdgeInsets.symmetric(vertical: 10),

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
                                  errorText: passwdErro,
                                  prefixIcon: const Icon(
                                    Icons.password,
                                  ),
                                  labelText: 'Senha',
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width *
                                          sizeWidth,
                                      MediaQuery.of(context).size.height *
                                          0.08),
                                  primary:
                                      const Color.fromARGB(255, 238, 103, 0),
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      isLoading = true;
                                      sizeWidth = 0.2;
                                      doUserRegistration();
                                    },
                                  );
                                },
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.blue,
                                        backgroundColor: Colors.white,
                                      )
                                    : const Text(
                                        'Cadastrar',
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
                                          .pushReplacementNamed('/');
                                    },
                                    child: const Text(
                                      'Voltar',
                                    ),
                                  ),
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
          ].reversed.toList(),
        ),
      ),
    );
  }

  //* Cadastrado com sucesso
  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: secondColor,
          title: Text(
            "Successo",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Enchanted',
              fontSize: 40,
              color: primaryColor,
            ),
          ),
          content: const Text(
            "Usuário cadastrado com sucesso! verifique seu email antes de realizar o Login.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
              ),
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                stopAnimation();
              },
            ),
          ],
        );
      },
    );
  }

  //* Mostra o Erro
  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: secondColor,
          title: Text(
            "Error",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Enchanted',
              fontSize: 40,
              color: primaryColor,
            ),
          ),
          content: Text(
            errorMessage,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
              ),
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();

                stopAnimation();
              },
            ),
          ],
        );
      },
    );
  }

  //* Cadastra o usuario
  void doUserRegistration() async {
    //Sigup code here

    //? salva o usuario sem espaços
    final username = userController.text.trim();
    final email = emailController.text.trim();
    final password = passwdController.text.trim();

    if (username.isEmpty && email.isEmpty && password.isEmpty) {
      showError('Todos os campos estam vazios');
      userErro = '*Obrigatório';
      emailErro = '*Obrigatório';
      passwdErro = '*Obrigatório';
    } else if (username.isEmpty) {
      showError('Campo usuario está vazio');
      userErro = 'Obrigatorio';
    } else if (email.isEmpty) {
      showError('Campo Email está vazio');
      emailErro = 'Obrigatorio';
    } else if (password.isEmpty) {
      showError('Campo senha está vazio');
      passwdErro = 'Obrigatorio';
    } else {
      //* Retira o erro dos campos
      if (userErro != null || emailErro != null || passwdErro != null) {
        userErro = null;
        emailErro = null;
        passwdErro = null;
      }

      //* Cadastra o usuario no sistema
      final user = ParseUser.createUser(username, password, email);

      //? Espera a resposta do servidor se conseguiu cadastrar o usuario
      var response = await user.signUp();

      if (response.success) {
        showSuccess();
        userController.clear();
        emailController.clear();
        passwdController.clear();
      } else {
        showError(response.error!.message);
      }
    }
  }

  void stopAnimation() {
    //? variaveis para animação do botão
    setState(() {
      isLoading = false;
      sizeWidth = 0.43;
    });
  }
}
