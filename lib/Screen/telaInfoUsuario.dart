import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserInfoScreen(),
  ));
}

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações Pessoais'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: UserInfoWidget(),
      ),
    );
  }
}

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({super.key});

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
          child: const Text('Editar Informações'),
        ),
      ],
    );
  }
}

class UserInfoField extends StatelessWidget {
  final String label;
  final String value;

  const UserInfoField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
