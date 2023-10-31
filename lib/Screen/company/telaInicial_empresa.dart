// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:teste/Screen/company/screen_grafico.dart';
import 'package:teste/Screen/screen_mensagem_programada.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/botao_cadastrar_widget.dart';
import '../../widgets/bottom.dart';
import '../../widgets/cadastro_evento_widget.dart';

class TelaInicialEmpresa extends StatefulWidget {
  @override
  State<TelaInicialEmpresa> createState() => _TelaInicialEmpresaState();
}

class Evento {
  final String imageName;
  final String title;

  Evento(
    this.imageName,
    this.title
  );
}

class _TelaInicialEmpresaState extends State<TelaInicialEmpresa> {
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
    List<Evento> eventos = [
      Evento('lib/imagens/Events/Event1.jfif', 'IOT Tech Expo'),
      Evento('lib/imagens/Events/Event2.jfif', 'META V SUMMIT'),
      Evento('lib/imagens/Events/Event3.jfif', 'TAIWAN TECH SUMMIT'),
      Evento('lib/imagens/Events/Event4.jfif', 'OUTLOOK FOR TECH'),
    ];

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150), child: AppBarTop(hasMenu:true)),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              color: const Color.fromRGBO(0, 168, 231, 100),
              child: DrawerHeader(
                child: Image.asset("lib/imagens/logo_dark.png"),
              ),
            ),
            ListTile(
              title: const Text("Gráfico"),
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
            ListTile(
              title: const Text("Programar mensagem"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MessageScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(width: 20,),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: BotaoCadastrarEvento(),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: eventos.length,
              itemBuilder: (context, index) {
                return EventoCadastradoCard(imageName: eventos[index].imageName, eventTitle: eventos[index].title,);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}