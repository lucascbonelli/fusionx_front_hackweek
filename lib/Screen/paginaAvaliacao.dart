import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teste/Screen/paginaMensagens.dart';


import '../widgets/app_bar.dart';

void main() => runApp(MaterialApp(home: EventRatingPage()));

class EventRatingPage extends StatefulWidget {
  @override
  _EventRatingPageState createState() => _EventRatingPageState();
}

class _EventRatingPageState extends State<EventRatingPage> {
  double _userRating = 0;

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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Avalie o evento!',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              RatingBar.builder(
                initialRating: _userRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _userRating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showRatingConfirmation();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Raio para arredondar
                  ),
                ),
                child: const Text('Enviar Avaliação'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRatingConfirmation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Avaliação Enviada'),
          content: Text('Sua avaliação: $_userRating estrela(s)'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PaginaMensagens()));
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}