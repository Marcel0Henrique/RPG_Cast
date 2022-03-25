import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //* Variavel para animação do botão carregando
  bool isLoading = false;
  bool isDone = false;
  double sizeWidth = 0.43;

  //* Variavel para mostrar a senha
  bool showPassword = true;

  //*Controladores do texto
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.center,
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
                                'Esqueci a senha',
                                style: TextStyle(
                                  fontFamily: 'Enchanted',
                                  fontSize: 40,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 253, 110, 0),
                                ),
                              ),
                            ),

                            //* Campo de Texto
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 15,
                              ),

                              //* Parametros do TextField
                              child: Text(
                                "Digite seu email para recuperar a senha, será enviando um link para realizar a troca da senha.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                                textAlign: TextAlign.justify,
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
                                      doUserResetPassword();
                                    },
                                  );
                                },
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.blue,
                                        backgroundColor: Colors.white,
                                      )
                                    : const Text(
                                        'Recuperar',
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
          ],
        ),
      ),
    );
  }

  //* Link enviado com sucesso
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
            "As instruções para realizar a troca da senha foram enviadas por email.",
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
          content: Text(errorMessage),
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

  //* Função para resetar a senha
  void doUserResetPassword() async {
    final ParseUser user = ParseUser(null, null, emailController.text.trim());
    final ParseResponse parseResponse = await user.requestPasswordReset();
    if (parseResponse.success) {
      showSuccess();
      emailController.clear();
    } else {
      showError(parseResponse.error!.message);
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
