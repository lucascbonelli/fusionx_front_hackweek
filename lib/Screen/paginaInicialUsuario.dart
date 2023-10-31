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
  bool _isDescriptionExpanded = false;

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
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TelaSessao()),
                      );
              },
              child: Text("INSCREVA-SE"),
              
            ),  
            SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isDescriptionExpanded = !_isDescriptionExpanded;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(3),
                child: Text(
                  _isDescriptionExpanded ? "Minimizar Descrição" : "Maximizar Descrição",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            if (_isDescriptionExpanded)
              Card(
                margin: EdgeInsets.all(8.0),
                elevation: 2,
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Descrição do Evento"),
                      trailing: IconButton(
                        icon: Icon(_isDescriptionExpanded ? Icons.remove : Icons.add),
                        onPressed: () {
                          setState(() {
                            _isDescriptionExpanded = !_isDescriptionExpanded;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Esse evento oferece a grande oportunidade......"),
                    ),
                  ],
                ),
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
