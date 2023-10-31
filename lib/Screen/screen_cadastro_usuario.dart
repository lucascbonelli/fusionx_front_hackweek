// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import '../widgets/cadastro_widgets_usuario.dart';

class screen_cadastro_usuario extends StatefulWidget {
  const screen_cadastro_usuario({super.key});

  @override
  State<screen_cadastro_usuario> createState() => screen_cadastroState();
}

class screen_cadastroState extends State<screen_cadastro_usuario> {
  TextEditingController NomeController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController CelularController = TextEditingController();
  TextEditingController CPFController = TextEditingController();
  TextEditingController SenhaController = TextEditingController();
  TextEditingController ConfirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Nome(),
            const Email(),
            const Celular(),
            const Cpf(),
            const Senha(),
            const ConfirmarSenha(),
            ElevatedButton(
              onPressed: () {
                // Validar os dados
                if (SenhaController.text == ConfirmarSenhaController.text) {
                  // Cadastro realizado com sucesso
                } else {
                  // Senhas não conferem
                }
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}