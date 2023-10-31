
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/Screen/paginaMensagens.dart';
import 'package:teste/Screen/telaInfoUsuario.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottomNavigation.dart';

class TelaInicialUsuario extends StatefulWidget {
  @override
  State<TelaInicialUsuario> createState() => _TelaInicialUsuarioState();
}

class _TelaInicialUsuarioState extends State<TelaInicialUsuario> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaInicialUsuario()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PaginaMensagens(
          )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150), child: AppBarTop(hasMenu:false)),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("lib/imagens/logo2.png"),
            ),
            ListTile(
              title: const Text("Mensagem"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PaginaMensagens(
                      
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Dados"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserInfoScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}