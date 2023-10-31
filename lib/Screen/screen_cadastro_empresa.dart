// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

import '../widgets/cadastro_widgets_empresa.dart';


class screen_cadastro_empresa extends StatefulWidget {
  const screen_cadastro_empresa({Key? key}) : super(key: key);

  @override
  State<screen_cadastro_empresa> createState() => screen_cadastroState();
}
class screen_cadastroState extends State<screen_cadastro_empresa> {
  TextEditingController NomeController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController CelularController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
  TextEditingController SenhaController = TextEditingController();
  TextEditingController ConfirmarSenhaController = TextEditingController();

  final PasswordVisibility passwordVisibility = PasswordVisibility();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Nome(),
                const Email(),
                const Celular(),
                const Cnpj(),
                Senha(passwordVisibility: passwordVisibility),
                ConfirmarSenha(passwordVisibility: passwordVisibility),
                ElevatedButton(
                  onPressed: () {
                    if (senhaController.text == confirmarSenhaController.text) {

                    } else {
                      // Senhas não conferem
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Senhas não conferem'),
                            content: const Text('As senhas informadas não coincidem. Por favor, verifique e tente novamente.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
