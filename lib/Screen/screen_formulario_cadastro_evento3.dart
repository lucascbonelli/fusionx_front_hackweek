import 'package:flutter/material.dart';
import 'package:html_editor_enhanced_fork/html_editor.dart';
import 'package:intl/intl.dart';
import 'package:teste/Screen/screen_grafico.dart';
import 'package:teste/Screen/telaInicial_empresa.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom.dart';
import 'sessao_forms_screen.dart';

class FormularioCadastro3 extends StatefulWidget {
  const FormularioCadastro3({Key? key}) : super(key: key);

  @override
  _FormularioCadastro3State createState() => _FormularioCadastro3State();
}

class _FormularioCadastro3State extends State<FormularioCadastro3> {
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
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  final htmlEditorController = HtmlEditorController();
  _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate1) {
      setState(() {
        selectedDate1 = picked;
      });
    }
  }

  _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != selectedDate2) {
      if (picked != null) {
        setState(() {
          selectedDate2 = picked;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarTop(hasMenu: false),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("lib/imagens/logo2.png"),
            ),
            ListTile(
              title: const Text("Pagina Inicial"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TelaInicialEmpresa(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Grafico"),
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
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text('Data de Início'),
                            Container(
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ElevatedButton(
                                onPressed: () => _selectDate1(context),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      DateFormat('dd/MM/yyyy').format(selectedDate1),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            const Text('Data de Término'),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ElevatedButton(
                                onPressed: () => _selectDate2(context),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      DateFormat('dd/MM/yyyy').format(selectedDate2),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Capacidade Máxima'),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Capacidade Máxima',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15), // Espaço entre os campos
                   Column(
                      children: [
                         Container(
                           height: 300,
                           child: HtmlEditor(
                              controller: htmlEditorController,
                              htmlToolbarOptions: const HtmlToolbarOptions(
                                toolbarPosition: ToolbarPosition.aboveEditor,
                                toolbarType: ToolbarType.nativeScrollable,
                              ),
                              htmlEditorOptions: const HtmlEditorOptions(
                                adjustHeightForKeyboard: true,
                                shouldEnsureVisible: true,
                                autoAdjustHeight: false,
                                hint: 'Descrição do evento',
                                androidUseHybridComposition: true,
                              ),
                            ),
                         ),
                      ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SessionFormScreen(),
                                ),
                              );
                            },
                            child: const Text('Proxima etapa'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
