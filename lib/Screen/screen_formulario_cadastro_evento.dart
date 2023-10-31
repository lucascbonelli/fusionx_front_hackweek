import 'package:flutter/material.dart';
import 'package:teste/Screen/screen_grafico.dart';
import 'package:teste/Screen/telaInicial_empresa.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom.dart';
import '../widgets/formulario_cadastro_evento_widget.dart';

class FormularioCadastro extends StatefulWidget {
  const FormularioCadastro({super.key});

  @override
  State<FormularioCadastro> createState() => _FormularioCadastroState();
}

class _FormularioCadastroState extends State<FormularioCadastro> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaInicialEmpresa()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ScreenGrafico(
          peopleHasCame: 10,
          peopleHasConfirmed: 20,
          peopleHasConfirmedAndNotCame: 10,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarTop(hasMenu: false),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("lib/imagens/logo2.png"),
            ),
            ListTile(
              title: const Text("Grafico"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScreenGrafico(
                      peopleHasCame: 10,
                      peopleHasConfirmed: 20,
                      peopleHasConfirmedAndNotCame: 10,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const LocalInfoWidget(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
