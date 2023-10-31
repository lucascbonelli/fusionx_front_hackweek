import 'package:flutter/material.dart';
import 'package:teste/Screen/alertDialogApp.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/bottomNavigation.dart';

class TelaSessao extends StatefulWidget {
  final String imageName;
  final String title;

  const TelaSessao({
    super.key,
    required this.imageName,
    required this.title,
  });

  @override
  _TelaSessaoState createState() => _TelaSessaoState();
}

class _TelaSessaoState extends State<TelaSessao> {
  int _currentIndex = 0;
  bool _isDescriptionExpanded = false;

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
        child: AppBarTop(hasMenu: false),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("lib/imagens/logo_dark.png"),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 350,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imageName),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 12),
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
                padding: const EdgeInsets.all(3),
                child: Text(
                  _isDescriptionExpanded ? "Minimizar Descrição" : "Maximizar Descrição",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            if (_isDescriptionExpanded)
              Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 2,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Descrição do Evento"),
                      trailing: IconButton(
                        icon: Icon(_isDescriptionExpanded ? Icons.remove : Icons.add),
                        onPressed: () {
                          setState(() {
                            _isDescriptionExpanded = !_isDescriptionExpanded;
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Esse evento oferece a grande oportunidade......"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 220,
                height: 220,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(0, 168, 231, 100),
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "13/11 | 8:00 - 12:00",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 168, 231, 100),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const DialogExample()),
                        );
                      },
                      child: const Text("08:00 - 09:00 Sessão 1"),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Ação a ser executada quando o segundo botão é pressionado
                      },
                      child: const Text("09:00 - 10:00 Sessão 2"),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const DialogExample()),
                        );
                      },
                      child: const Text("11:00 - 12:00 Sessão 3"),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: 220,
                height: 220,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(0, 168, 231, 100),
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "13/11 | 22:00 - 01:00",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 168, 231, 100),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const DialogExample()),
                        );
                      },
                      child: const Text("22:00 - 23:00 Sessão 1"),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const DialogExample()),
                        );
                      },
                      child: const Text("23:00 - 00:00 Sessão 2"),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const DialogExample()),
                        );
                      },
                      child: const Text("00:00 - 01:00 Sessão 3"),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }
}
