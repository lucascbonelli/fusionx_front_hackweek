import 'package:flutter/material.dart';
import 'package:teste/Screen/paginaMensagens.dart';

void main() => runApp(const AlertDialogApp());

class AlertDialogApp extends StatelessWidget {
  const AlertDialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
    );
  }
}

class DialogExample extends StatefulWidget {
  const DialogExample({super.key});

  @override
  _DialogExampleState createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('INSCRIÇÃO'),
                content: const Text('SUA INSCRIÇÃO FOI FEITA COM SUCESSO!'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => PaginaMensagens()),
                      );
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Raio para arredondar
            child: Container(
              color: Colors.blue, // Cor de fundo do botão
              padding: EdgeInsets.all(16),
              child: const Text('MENSAGEM'),
            ),
          ),
        ),
        
      ],
    );
  }
}