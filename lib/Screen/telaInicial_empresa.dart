// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:teste/widgets/botao_cadastrar_widget.dart';
import 'package:teste/widgets/cadastro_evento_widget.dart';
import 'package:teste/widgets/carrossel_widget.dart';

import '../widgets/app_bar.dart';

class telaInicial_empresa extends StatefulWidget {
  @override
  State<telaInicial_empresa> createState() => _telaInicial_empresaState();
}

class _telaInicial_empresaState extends State<telaInicial_empresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150), child: AppBarTop()),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("lib/imagens/logo.jpg"),
            ),
            ListTile(
              title: const Text("Item 1"),
              onTap: () {
                // Implemente a ação do item do menu aqui
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          CarrosselWidget(), // Usando o widget do carrossel
          BotaoCadastrarEvento(), // Usando o widget do botão "Cadastrar Evento"
          Flexible(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return EventoCadastradoCard(); // Usando o widget do item da lista
              },
            ),
          ),
        ],
      ),
      // ...
    );
  }
}