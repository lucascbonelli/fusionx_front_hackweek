// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

TextEditingController nomeController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController celularController = TextEditingController();
TextEditingController cpfController = TextEditingController();
TextEditingController senhaController = TextEditingController();
TextEditingController confirmarSenhaController = TextEditingController();

bool obscureText = true; // Initialize the obscureText variable.

class Nome extends StatelessWidget {
  const Nome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: nomeController,
        decoration: InputDecoration(
          labelText: 'Nome',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class Email extends StatelessWidget {
  const Email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class Celular extends StatelessWidget {
  const Celular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: celularController,
        decoration: InputDecoration(
          labelText: 'Celular',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class Cpf extends StatelessWidget {
  const Cpf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: cpfController,
        decoration: InputDecoration(
          labelText: 'CPF',
          border: OutlineInputBorder(),
        ),
        ),
      );
    }
  }


class Senha extends StatefulWidget {
  const Senha({Key? key}) : super(key: key);

  @override
  _SenhaState createState() => _SenhaState();
}

class _SenhaState extends State<Senha> {
  bool obscureText = true; // Gerencie o estado de obscureText.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: senhaController,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: 'Senha',
          border: OutlineInputBorder(),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText; // Altera o estado.
              });
            },
            child: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ),
      ),
      );
    }
  }


class ConfirmarSenha extends StatefulWidget {
  const ConfirmarSenha({Key? key}) : super(key: key);

  @override
  _ConfirmarSenhaState createState() => _ConfirmarSenhaState();
}

class _ConfirmarSenhaState extends State<ConfirmarSenha> {
  bool obscureText = true; // Gerencie o estado de obscureText.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: confirmarSenhaController,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: 'Confirmar senha',
          border: OutlineInputBorder(),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText; // Altera o estado.
              });
            },
            child: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ),
      ),
      );
    }
  }



class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          // Validate the data and compare passwords
          if (senhaController.text == confirmarSenhaController.text) {
            // Registration successful
          } else {
            // Passwords don't match
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 194, 245, 135),
          ),
        ),
        child: Text('Cadastrar'),
      )
    );
    }
  }

