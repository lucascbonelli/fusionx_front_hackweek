// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:teste/widgets/login_widgets.dart';

class screen_login extends StatelessWidget {
  const screen_login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // Logo(),
            TextoEntrar(),
            textForm(),
            Botoes(),
          ],
        ),
      ),
    );
  }
}