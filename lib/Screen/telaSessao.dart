import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottomNavigation.dart';

class TelaSessao extends StatefulWidget {
  @override
  _TelaSessaoState createState() => _TelaSessaoState();
}

class _TelaSessaoState extends State<TelaSessao> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarTop(),
      ),
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
      body: Center(
        child: Column(

          children: <Widget>[
            SizedBox(height: 30),
            Container(
              width: 220,
              height: 220,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(0, 168, 231, 100),),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                
                children: <Widget>[
                  Text(
                    "13/11 | 8:00 - 12:00",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 168, 231, 100),),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Ação a ser executada quando o primeiro botão é pressionado
                    },
                    child: Text("08:00 - 09:00 Sessão 1"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Ação a ser executada quando o segundo botão é pressionado
                    },
                    child: Text("09:00 - 10:00 Sessão 2"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Ação a ser executada quando o terceiro botão é pressionado
                    },
                    child: Text("11:00 - 12:00 Sessão 3"),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: 220,
              height: 220,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(0, 168, 231, 100,)),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "13/11 | 22:00 - 01:00",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 168, 231, 100),),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Ação a ser executada quando o primeiro botão é pressionado
                    },
                    child: Text("22:00 - 23:00 Sessão 1"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Ação a ser executada quando o segundo botão é pressionado
                    },
                    child: Text("23:00 - 00:00 Sessão 2"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Ação a ser executada quando o terceiro botão é pressionado
                    },
                    child: Text("00:00 - 01:00 Sessão 3"),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {

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
