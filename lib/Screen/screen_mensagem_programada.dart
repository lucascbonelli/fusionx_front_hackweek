import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:teste/Screen/screen_escrever_mensagem.dart';
import 'package:teste/Screen/screen_grafico.dart';
import 'package:teste/Screen/telaInicial_empresa.dart';
import 'package:teste/widgets/app_bar.dart';
import '../core/message_data.dart';
import '../widgets/bottom.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
    final messageData = Provider.of<MessageData>(context);

    return Scaffold(
      appBar: const AppBarTop(hasMenu: true),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("lib/imagens/logo2.png"),
            ),
            ListTile(
              title: const Text("Página Inicial"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TelaInicialEmpresa(),
                  ),
                );
              },
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
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WriteMessageScreen()),
                );
              },
              child: const Text('Adicionar uma mensagem programada',style: TextStyle(fontSize: 16,)),
            ),
            const SizedBox(height: 50,),
            const Text(
              'Mensagens Programadas:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50,),
            Expanded(
              child: ListView.builder(
                itemCount: messageData.messages.length,
                itemBuilder: (context, index) {
                  final messageInfo = messageData.messages[index];
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                    ListTile(
                    leading: const Icon(Icons.edit),
                    title: Text(
                      messageInfo.titulo,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          messageInfo.message,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Data e Hora: ${messageInfo.selectedDate != null ? DateFormat('dd/MM/yyyy HH:mm').format(messageInfo.selectedDate!) : 'Data não selecionada'}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ]
                  ),
                  );
                },
              ),
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
