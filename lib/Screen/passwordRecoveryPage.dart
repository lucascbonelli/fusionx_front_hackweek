import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: PasswordRecoveryPage()));

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Adicione a ação do botão de voltar aqui
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Adicione a ação do ícone de engrenagem aqui
            },
          ),
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: PasswordRecoveryForm(),
        ),
      ),
    );
  }
}

class PasswordRecoveryForm extends StatefulWidget {
  const PasswordRecoveryForm({super.key});

  @override
  _PasswordRecoveryFormState createState() => _PasswordRecoveryFormState();
}

class _PasswordRecoveryFormState extends State<PasswordRecoveryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _recoveryEmailSent = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 150.0),
          Padding(
            padding: const EdgeInsets.all(3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0), // Raio para arredondar
              child: SizedBox(
                height: 100,
                child: Image.asset("lib/imagens/logo_dark.png"),
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'E-mail'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira seu e-mail';
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _simulateEmailSending();
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Raio para arredondar
              ),
            ),
            child: const Text('Recuperar Senha'),
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
        const SizedBox(height: 20.0),
        Text(
          'O email para a recuperação de senha foi enviado para o email: ${_emailController.text}.',
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Voltar para a página inicial ou fazer outra ação apropriada.
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Raio para arredondar
            ),
          ),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
