import 'package:flutter/material.dart';
import 'package:teste/Screen/screen_grafico.dart';
import 'package:teste/Screen/company/telaInicial_empresa.dart';
import 'package:teste/widgets/app_bar.dart';
import '../widgets/bottom.dart';
import '../widgets/sessao_form_widgets.dart';

class SessionFormScreen extends StatefulWidget {
  const SessionFormScreen({super.key});

  @override
  _SessionFormScreenState createState() => _SessionFormScreenState();
}

class _SessionFormScreenState extends State<SessionFormScreen> {
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
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TextEditingController sessionNameController = TextEditingController();
  TextEditingController sessionContentController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const AppBarTop(hasMenu: true,),
    body: CustomScrollView(
    slivers: [
    SliverFillRemaining(
    hasScrollBody: false,
    child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
          children: [
            SessionNameField(controller: sessionNameController),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DateTimePicker(
                    label: 'Data',
                    value: selectedDate != null
                        ? '${selectedDate?.day}/${selectedDate?.month}/${selectedDate!.year}'
                        : null,
                    onPressed: () => _selectDate(context),
                  ),
                ),
                const SizedBox(width: 16), // Espaço entre os botões
                Expanded(
                  child: DateTimePicker(
                    label: 'Hora',
                    value: selectedTime != null ? '${selectedTime!.hour}:${selectedTime!.minute}' : null,
                    onPressed: () => _selectTime(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              child: Column(
                children: [
                SessionContentField(controller: sessionContentController
                ),
              ]
            ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaInicialEmpresa(),
                  ),
                );
              },
              child: const Text('Salvar'),
            )
          ],
        )
      ),
    ),
    ]
    ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
