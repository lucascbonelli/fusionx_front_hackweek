// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:teste/Screen/screen_cadastro_usuario.dart';
import 'package:teste/Screen/screen_cadastro_empresa.dart';
import 'package:teste/Screen/screen_login.dart';
import 'package:teste/Screen/telaInicial_empresa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: telaInicial_empresa()
    );
  }
}