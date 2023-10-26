import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class FormularioCadastro extends StatefulWidget {
  const FormularioCadastro({super.key});

  @override
  State<FormularioCadastro> createState() => _FormularioCadastroState();
}

class _FormularioCadastroState extends State<FormularioCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
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

      ),
    );
  }
}
