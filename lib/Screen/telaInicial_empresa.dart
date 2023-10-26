// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/app_bar.dart';

class telaInicial_empresa extends StatefulWidget {
  @override
  State<telaInicial_empresa> createState() => _telaInicial_empresaState();
}

class _telaInicial_empresaState extends State<telaInicial_empresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150), child: AppBarTop()),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: [
              // carrossel aqui
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [ BoxShadow(
                       color: Color(0xFF000000),
                         offset: Offset.zero,
                         blurRadius: 5,
                         spreadRadius: 1
                  ),],
                  image: DecorationImage(
                    image: AssetImage("lib/imagens/TOP.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(
                        "lib/imagens/logo1.jfif"), // Substitua pelo caminho da imagem
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Implemente a ação do botão de cadastrar evento aqui
            },
            child: Text("Cadastrar Evento"),
          ),
          Flexible(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Container(
                        color: Colors.blue,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 12,),
                      Text('Titulo Evento'),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              );
            },
          )),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset(
                  "lib/imagens/logo.jpg"), // Substitua pelo caminho da sua imagem
            ),
            ListTile(
              title: Text("Item 1"),
              onTap: () {
                // Implemente a ação do item do menu aqui
              },
            ),
          ],
        ),
      ),
    );
  }
}
