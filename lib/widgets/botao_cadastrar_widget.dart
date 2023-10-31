import 'package:flutter/material.dart';
import 'package:teste/Screen/company/screen_formulario_cadastro_evento.dart';

class BotaoCadastrarEvento extends StatelessWidget {
  const BotaoCadastrarEvento({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormularioCadastro(),
            ),
          );
      },
      child: const Text("Cadastrar Evento"),
    );
  }
}
