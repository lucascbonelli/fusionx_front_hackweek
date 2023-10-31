import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';

class PaginaMensagens extends StatefulWidget {
  @override
  _PaginaMensagensState createState() => _PaginaMensagensState();
}

class _PaginaMensagensState extends State<PaginaMensagens> {

  void onTabTapped(int index) {
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
            Container(
              color: const Color.fromRGBO(0, 168, 231, 100),
              child: DrawerHeader(
                child: Image.asset("lib/imagens/logo_dark.png"),
              ),
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
  final String title;
  final String date;
  bool isDeleted;

  Message(this.title, this.date, {this.isDeleted = false});
}

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message> messages = [
    Message('Agradecemos pela sua inscrição!', '14:22 31/10/2023'),
    Message('Você sabe a localização do evento?', '14:22 31/10/2023'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(messages[index].title),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
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
