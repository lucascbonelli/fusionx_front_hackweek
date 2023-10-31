import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teste/Screen/company/screen_formulario_cadastro_evento3.dart';
import 'package:teste/Screen/company/screen_grafico.dart';
import 'package:teste/Screen/company/telaInicial_empresa.dart';

import 'package:teste/widgets/app_bar.dart';
import 'package:teste/widgets/bottom.dart';

class FormularioCadastro2 extends StatefulWidget {
  const FormularioCadastro2({Key? key});

  @override
  _FormularioCadastro2State createState() => _FormularioCadastro2State();
}

class _FormularioCadastro2State extends State<FormularioCadastro2> {
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
  final List<String> items = [
    'Categoria',
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;
  XFile? _image;

  @override
  void initState() {
    super.initState();
    selectedValue = items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarTop(
          hasMenu: false,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("lib/imagens/logo_dark.png"),
            ),
            ListTile(
              title: const Text("Item 1"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(
                    20), // Ajuste o padding conforme necessário
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Nome do evento',
                      ),
                    ),
                    const SizedBox(
                        height: 20), // Adicione espaçamento entre os widgets
                    GestureDetector(
                      onTap: _getImage,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: _image != null
                              ? DecorationImage(
                                  image: FileImage(File(_image!.path)),
                                  fit: BoxFit.fill,
                                )
                              : null,
                        ),
                        child: _image == null
                            ? const Column(
                                children: [
                                  Text('Adicione um banner'),
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Icon(Icons.add)
                                ],
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: const Text(
                          'Selecione o item',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Colors.grey, // Altere a cor conforme necessário
                          ),
                        ),
                        items: items
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: 450,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const FormularioCadastro3(),
                                    ),
                                  );
                                },
                                child: const Text('Próxima etapa'),
                              ),
                            ),
                          ),
                        ],

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }

  Future _getImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }
}
