import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserInfoScreen(),
  ));
}

class UserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações Pessoais'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UserInfoWidget(),
      ),
    );
  }
}

class UserInfoWidget extends StatefulWidget {
  @override
  _UserInfoWidgetState createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  String name = 'John Doe';
  String email = 'johndoe@example.com';
  String phone = '+1 (123) 456-7890';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UserInfoField(label: 'Nome', value: name),
        UserInfoField(label: 'Email', value: email),
        UserInfoField(label: 'Telefone', value: phone),
        ElevatedButton(
          onPressed: () {
            // Implemente a ação para editar informações pessoais aqui
          },
          child: Text('Editar Informações'),
        ),
      ],
    );
  }
}

class UserInfoField extends StatelessWidget {
  final String label;
  final String value;

  UserInfoField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
