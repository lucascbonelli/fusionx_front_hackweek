// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';

TextEditingController nomeController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController celularController = TextEditingController();
TextEditingController cnpjController = TextEditingController();
TextEditingController senhaController = TextEditingController();
TextEditingController confirmarSenhaController = TextEditingController();

bool obscureText = true; // Initialize the obscureText variable.

class PasswordVisibility {
  bool isVisible = false;
}

class Nome extends StatelessWidget {
  const Nome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        controller: nomeController,
        decoration: const InputDecoration(
          labelText: 'Nome',
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }
}

class Email extends StatefulWidget {
  const Email({Key? key}) : super(key: key);

  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final TextEditingController emailController = TextEditingController();
  bool isEmailValid = true; // Variável para rastrear a validade do e-mail

  // Função para validar o e-mail
  bool validateEmail(String email) {
    final emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            controller: emailController,
            onChanged: (value) {
              setState(() {
                isEmailValid = validateEmail(value);
              });
            },
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ),
        if (!isEmailValid) // Verifica se o e-mail não é válido
          const Text(
            'Por favor, insira um e-mail válido.',
            style: TextStyle(
              color: Colors.red, // Define a cor do texto em vermelho
            ),
          ),
      ],
    );
  }
}

class Celular extends StatefulWidget {
  const Celular({Key? key}) : super(key: key);

  @override
  _CelularState createState() => _CelularState();
}

class _CelularState extends State<Celular> {
  final TextEditingController celularController = TextEditingController();
  final RegExp dddRegExp = RegExp(r'^\d{0,2}$');
  String previousText = '';

  @override
  void initState() {
    super.initState();
    celularController.addListener(onTextChanged);
  }

  void onTextChanged() {
    final text = celularController.text;

    if (text.length == 2 && previousText.length == 1) {
      celularController.text = '${text} ';
      celularController.selection = TextSelection.fromPosition(
        TextPosition(offset: celularController.text.length),
      );
    } else if (text.length == 2 && !dddRegExp.hasMatch(text)) {
      // Caso o usuário tenha digitado algo não numérico como o segundo dígito
      celularController.text = previousText;
      celularController.selection = TextSelection.fromPosition(
        TextPosition(offset: celularController.text.length),
      );
    }

    previousText = celularController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextField(
        controller: celularController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          labelText: 'Celular (com DDD)',
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }

  @override
  void dispose() {
    celularController.dispose();
    super.dispose();
  }
}


class Cnpj extends StatelessWidget {
  const Cnpj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
    child: TextField(
    controller: cnpjController,
    decoration: const InputDecoration(
    labelText: 'CNPJ',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20))),
    ),
    ),
    );
  }
}

class Senha extends StatefulWidget {
  final PasswordVisibility passwordVisibility;

  const Senha({Key? key, required this.passwordVisibility}) : super(key: key);

  @override
  _SenhaState createState() => _SenhaState();
}

class _SenhaState extends State<Senha> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextField(
        controller: senhaController,
        obscureText: !widget.passwordVisibility.isVisible, // Aqui atualiza a visibilidade
        decoration: InputDecoration(
          labelText: 'Senha',
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.passwordVisibility.isVisible =
                !widget.passwordVisibility.isVisible; // Atualiza o estado
              });
            },
            child: Icon(
              widget.passwordVisibility.isVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmarSenha extends StatefulWidget {
  final PasswordVisibility passwordVisibility;

  const ConfirmarSenha({Key? key, required this.passwordVisibility})
      : super(key: key);

  @override
  _ConfirmarSenhaState createState() => _ConfirmarSenhaState();
}

class _ConfirmarSenhaState extends State<ConfirmarSenha> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextField(
        controller: confirmarSenhaController,
        obscureText: !widget.passwordVisibility.isVisible, // Aqui atualiza a visibilidade
        decoration: InputDecoration(
          labelText: 'Confirmar senha',
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.passwordVisibility.isVisible =
                !widget.passwordVisibility.isVisible; // Atualiza o estado
              });
            },
            child: Icon(
              widget.passwordVisibility.isVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
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
          if (senhaController.text == confirmarSenhaController.text) {
            // Cadastro realizado com sucesso
          } else {
            // Senhas não conferem
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Senhas não conferem'),
                  content: const Text(
                      'As senhas informadas não coincidem. Por favor, verifique e tente novamente.'),
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
        child: const Text('Cadastrar'), // Defina o texto do botão aqui
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 194, 245, 135),
          ),
        ),
      ),
    );
  }
}

