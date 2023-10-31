import 'package:flutter/material.dart';
import 'package:teste/Screen/user/telaSessao.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/carrossel_widget.dart';
import '../../widgets/bottomNavigation.dart';


class PaginaInicialUsuario extends StatefulWidget {
  const PaginaInicialUsuario({super.key});

  @override
  State<PaginaInicialUsuario> createState() => _PaginaInicialUsuarioState();
}

class _PaginaInicialUsuarioState extends State<PaginaInicialUsuario> {
  int _currentIndex = 0;

  final tabs = [
    const Center(child: Text("Página Inicial")),
    const Center(child: Text("Usuário")),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarTop(),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("lib/imagens/logo_light.png"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarrosselWidget(
              tapItem: (String imageName, String title) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TelaSessao(
                    imageName: imageName,
                    title: title,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }
}
