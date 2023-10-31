import 'package:flutter/material.dart';

import 'package:teste/Screen/company/screen_formulario_cadastro_evento2.dart';
import 'package:teste/core/constants/states_constants.dart';
import 'package:teste/core/model.dart';

class LocalInfoWidget extends StatefulWidget {
  const LocalInfoWidget({Key? key}) : super(key: key);

  @override
  _LocalInfoWidgetState createState() => _LocalInfoWidgetState();
}

class _LocalInfoWidgetState extends State<LocalInfoWidget> {
  String? selectedState;
  final TextEditingController nomeDoLocalController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController ruaController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController complementoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  final LocalModel localInfo = LocalModel(
    nomeDoLocal: '',
    endereco: '',
    cep: '',
    numero: '',
    rua: '',
    bairro: '',
    complemento: '',
    cidade: '',
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  TextField(
                      controller: nomeDoLocalController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelText: 'Nome do Local',
                      ),
                      onChanged: (value) {
                        setState(() {
                          localInfo.nomeDoLocal = value;
                        });
                      }),
                  _buildCepNumeroRow(cepController, numeroController),
                  TextField(
                    controller: ruaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: 'Rua',
                    ),
                    onChanged: (value) {
                      setState(() {
                        localInfo.rua = value;
                      });
                    },
                  ),
                  TextField(
                    controller: bairroController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: 'Bairro',
                    ),
                    onChanged: (value) {
                      setState(() {
                        localInfo.bairro = value;
                      });
                    },
                  ),
                  TextField(
                    controller: complementoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: 'Complemento',
                    ),
                    onChanged: (value) {
                      setState(() {
                        localInfo.complemento = value;
                      });
                    },
                  ),
                  _buildCidadeEstadoRow(),
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
                                  builder: (context) =>
                                      const FormularioCadastro2(),
                                ),
                              );
                            },
                            child: const Text('Próxima etapa'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCepNumeroRow(
    TextEditingController cepController,
    TextEditingController numeroController,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: 210,
          child: TextField(
            controller: cepController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              labelText: 'CEP',
            ),
            onChanged: (value) {
              setState(() {
                localInfo.cep = value;
              });
            },
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 125,
          child: TextField(
            controller: numeroController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              labelText: 'Número',
            ),
            onChanged: (value) {
              setState(() {
                localInfo.numero = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCidadeEstadoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: 180,
          child: TextField(
            controller: cidadeController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              labelText: 'Cidade',
            ),
            onChanged: (value) {
              setState(() {
                localInfo.cidade = value;
              });
            },
          ),
        ),
        _buildStateSelector(),
      ],
    );
  }

  Widget _buildStateSelector() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Center(
          child: DropdownButton<String>(
            underline: const SizedBox(),
            alignment: Alignment.centerLeft,
            value: selectedState,
            items: AppConstants.estadosAbreviados.map((estado) {
              return DropdownMenuItem<String>(
                value: estado,
                child: Text(estado),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedState = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
