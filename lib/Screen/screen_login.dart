import 'package:flutter/material.dart';
import 'package:teste/Screen/user/paginaInicialUsuario.dart';
import 'package:teste/Screen/company/telaInicial_empresa.dart';
import '../widgets/login_widgets.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(),
            const TextoEntrar(),
            TextForm(
              emailController: emailController,
              passwordController: passwordController,
            ),
            Botoes(
              onEntrarPressed: () {
                // Faça a validação aqui
                const String userFixedEmail = 'raphael.teodoro@gmail.com';
                const String userFixedPassword = 'password';

                const String companyFixedEmail = 'claudia.cabral@gmail.com';
                const String companyFixedPassword = 'password';

                final String enteredEmail = emailController.text;
                final String enteredPassword = passwordController.text;

                if (enteredEmail == userFixedEmail && enteredPassword == userFixedPassword) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const PaginaInicialUsuario()));
                } else if (enteredEmail == companyFixedEmail && enteredPassword == companyFixedPassword) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TelaInicialEmpresa()));
                } else {
                  // Exibir uma mensagem de erro se não corresponderem a nenhum dos fixos.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Credenciais inválidas'),
                    ),
                  );
                }
              },
              onEsqueceuSenhaPressed: () {},
              onCadastrarPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

