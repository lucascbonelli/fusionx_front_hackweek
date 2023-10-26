// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 65,
        width: 65,
        child: Image.asset(
          'imagens/logo1.jfif',
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}

class TextoEntrar extends StatelessWidget {
  const TextoEntrar({super.key});

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

class textForm extends StatelessWidget {
  const textForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
        ),
        SizedBox(height: 90,
          child: Padding(
            padding: const EdgeInsets.all(15
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
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
  const Botoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
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