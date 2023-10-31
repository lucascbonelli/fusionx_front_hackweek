import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importe para manipulação de data e hora
import 'package:provider/provider.dart';
import 'package:teste/Screen/screen_grafico.dart';
import 'package:teste/Screen/telaInicial_empresa.dart';
import 'package:teste/widgets/app_bar.dart';
import '../core/message_data.dart';
import '../widgets/bottom.dart';

class WriteMessageScreen extends StatefulWidget {
  @override
  _WriteMessageScreenState createState() => _WriteMessageScreenState();
}

class _WriteMessageScreenState extends State<WriteMessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _tituloController = TextEditingController();
  DateTime selectedDate = DateTime.now(); // Variável para armazenar a data
  String selectedDropdownValue = 'Selecionar uma opção'; // Valor inicial do DropdownButton
  List<String> dropdownOptions = ['Selecionar uma opção','Pessoas que confirmaram', 'Pessoas que não confirmaram', 'Todos']; // Opções do DropdownButton

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
    return Scaffold(
      appBar: const AppBarTop(hasMenu: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _tituloController,
                decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),labelText: 'Título'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),labelText: 'Mensagem'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _selectDate(context); // Botão para selecionar a data
                    },
                    child: const Text('Selecionar Data'),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    'Data selecionada: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String?>(
                value: selectedDropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDropdownValue = newValue!;
                  });
                },
                items: dropdownOptions.map((String option) {
                  return DropdownMenuItem<String?>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  final message = _messageController.text;
                  final titulo = _tituloController.text;
                  final messageData = Provider.of<MessageData>(context, listen: false);
                  messageData.addMessage(
                    message,
                    titulo,
                    selectedDate, // Adicione a data e hora selecionadas
                    selectedDropdownValue,
                  );
                  Navigator.pop(context);
                },
                child: const Text('Confirmar'),
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
