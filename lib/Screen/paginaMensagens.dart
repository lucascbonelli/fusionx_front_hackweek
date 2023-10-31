import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottomNavigation.dart';

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
      body: MessageList(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }
}

class Message {
  final String text;
  final IconData icon; // Ícone da mensagem
  bool isDeleted;

  Message(this.text, this.icon, {this.isDeleted = false});
}

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message> messages = [
    Message('MENSAGEM 1', Icons.mail, isDeleted: false),
    Message('INSCRIÇÃO 2', Icons.event, isDeleted: false),
    Message('URGENTE 3', Icons.warning, isDeleted: false),
    Message('MENSAGEM 4', Icons.mail, isDeleted: false),
    Message('INSCRIÇÃO 5', Icons.event, isDeleted: false),
    Message('URGENTE 6', Icons.warning, isDeleted: false),
    Message('MENSAGEM 7', Icons.mail, isDeleted: false),
    Message('INSCRIÇÃO 8', Icons.event, isDeleted: false),
    Message('URGENTE 9', Icons.warning, isDeleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(messages[index].icon), // Ícone à esquerda
          title: Text(messages[index].text),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Raio para arredondar
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
