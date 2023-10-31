import 'package:flutter/material.dart';
import 'package:teste/Screen/telaSessao.dart';
import '../widgets/app_bar.dart';
import '../widgets/carrossel_widget.dart';
import '../widgets/bottomNavigation.dart';


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
              child: Image.asset("lib/imagens/logo.jpg"),
            ),
          ],
       ),
       ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarrosselWidget(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TelaSessao()));
              },
              child: Text("INSCREVA-SE"),
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
