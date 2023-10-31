import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: PasswordRecoveryPage()));

class PasswordRecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Adicione a ação do botão de voltar aqui
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Adicione a ação do ícone de engrenagem aqui
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PasswordRecoveryForm(),
        ),
      ),
    );
  }
}

class PasswordRecoveryForm extends StatefulWidget {
  @override
  _PasswordRecoveryFormState createState() => _PasswordRecoveryFormState();
}

class _PasswordRecoveryFormState extends State<PasswordRecoveryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  bool _recoveryEmailSent = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 150.0),
          Padding(
            padding: const EdgeInsets.all(3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0), // Raio para arredondar
              child: SizedBox(
                height: 100,
                child: Image.asset("lib/imagens/logo.jpg"),
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'E-mail'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira seu e-mail';
              }
              return null;
            },
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _simulateEmailSending();
              }
            },
            child: Text('Recuperar Senha'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Raio para arredondar
              ),
            ),
          ),
          if (_recoveryEmailSent) _buildRecoveryConfirmation(),
        ],
      ),
    );
  }

  void _simulateEmailSending() {
    setState(() {
      _recoveryEmailSent = true;
    });
  }

  Widget _buildRecoveryConfirmation() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(
          'O email para a recuperação de senha foi enviado para o email: ${_emailController.text}.',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Voltar para a página inicial ou fazer outra ação apropriada.
            Navigator.of(context).pop();
          },
          child: Text('OK'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Raio para arredondar
            ),
          ),
        ),
      ],
    );
  }
}
