import 'package:flutter/material.dart';

class LocalInfoWidget extends StatefulWidget {
  @override
  _LocalInfoWidgetState createState() => _LocalInfoWidgetState();
}

class _LocalInfoWidgetState extends State<LocalInfoWidget> {
  final List<String> estadosAbreviados = [
    'Selecione um Estado', 'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG',
    'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
  ];

  String? selectedState;

  @override
  void initState() {
    super.initState();
    selectedState = estadosAbreviados.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Informações do Local')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(decoration: InputDecoration(labelText: 'Nome do Local')),
          TextField(decoration: InputDecoration(labelText: 'Endereço')),
          _buildCepNumeroRow(),
          TextField(decoration: InputDecoration(labelText: 'Rua')),
          TextField(decoration: InputDecoration(labelText: 'Bairro')),
          TextField(decoration: InputDecoration(labelText: 'Complemento')),
          _buildCidadeEstadoRow(),
          Text('Estado Selecionado: ${selectedState ?? 'Nenhum estado selecionado'}'),
        ],
      ),
    );
  }

  Widget _buildCepNumeroRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(decoration: InputDecoration(labelText: 'CEP')),
        ),
        SizedBox(width: 16),
        Expanded(
          child: TextField(decoration: InputDecoration(labelText: 'Número')),
        ),
      ],
    );
  }

  Widget _buildCidadeEstadoRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(decoration: InputDecoration(labelText: 'Cidade')),
        ),
        SizedBox(width: 16),
        Expanded(
          child: _buildStateSelector(),
        ),
      ],
    );
  }

  Widget _buildStateSelector() {
    return DropdownButtonFormField<String>(
      value: selectedState,
      items: estadosAbreviados.map((estado) {
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
      decoration: InputDecoration(
        labelText: 'Selecione um Estado',
      ),
    );
  }
}
