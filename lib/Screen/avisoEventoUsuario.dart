import 'package:flutter/material.dart';
import 'paginaInicialUsuario.dart';

void main() {
  runApp(const AvisoEventoUsuario());
}

class AvisoEventoUsuario extends StatelessWidget {
  const AvisoEventoUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AvisoExample(),
    );
  }
}

class AvisoExample extends StatefulWidget {
  const AvisoExample({Key? key}) : super(key: key);

  @override
  _AvisoExampleState createState() => _AvisoExampleState();
}

class _AvisoExampleState extends State<AvisoExample> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aviso do Evento'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('FALTAM 2 DIAS!'),
                  content: const Text('Faltam poucas horas para o nosso evento, confirme sua presença novamente:'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => PaginaInicialUsuario()),
                        );
                      },
                      child: const Text('Confirmar'),
                    ),
                  ],
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                child: const Text('AVISO!'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mensagens',
          ),
        ],
      ),
    );
  }
}