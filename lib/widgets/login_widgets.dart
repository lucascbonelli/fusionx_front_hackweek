import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 65,
        width: 65,
        child: Image.asset(
          'lib/imagens/logo2.png',
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}

class TextoEntrar extends StatelessWidget {
  const TextoEntrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Text(
        'Entrar',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}

class TextForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const TextForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: widget.emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 90,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: widget.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                labelText: 'Password',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Botoes extends StatelessWidget {
  final VoidCallback onEntrarPressed;

  const Botoes({
    Key? key,
    required this.onEntrarPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onEntrarPressed,
          child: Text('Entrar'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Esqueceu sua senha?'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Cadastre-se'),
        ),
      ],
    );
  }
}
