import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';

class PaginaMensagens extends StatefulWidget {
  @override
  _PaginaMensagensState createState() => _PaginaMensagensState();
}

class _PaginaMensagensState extends State<PaginaMensagens> {
  int _currentIndex = 0;

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
      body: MessageList(),
    );
  }
}

class Message {
  final String text;
  bool isDeleted;

  Message(this.text, {this.isDeleted = false});
}

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message> messages = [
    Message('MENSAGEM'),
    Message('INSCRIÇÃO!'),
    Message('FALTAM 2 DIAS!'),
    Message('MENSAGEM'),
    Message('INSCRIÇÃO!'),
    Message('CONFIRME NOVAMENTE SUA PRESENÇA'),
    Message('MENSAGEM'),
    Message('INSCRIÇÃO!'),
    Message('URGENTE'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(messages[index].text),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: IconButton(
              icon: Icon(
                messages[index].isDeleted ? Icons.restore : Icons.delete,
              ),
              onPressed: () {
                setState(() {
                  messages[index].isDeleted = !messages[index].isDeleted;
                });
              },
            ),
          ),
        );
      },
    );
  }
}
