import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom.dart';
import 'company/telaInicial_empresa.dart';

class ScreenGrafico extends StatefulWidget {
  final double peopleHasCame;
  final double peopleHasConfirmed;
  final double peopleHasConfirmedAndNotCame;

  late Map<String, double> pieChartMap;

  ScreenGrafico({
    super.key,
    required this.peopleHasCame,
    required this.peopleHasConfirmed,
    required this.peopleHasConfirmedAndNotCame,
  }) {
    pieChartMap = {
      "Pessoas que vieram": peopleHasCame,
      "Pessoas que confirmaram": peopleHasConfirmed,
      "Pessoas que confirmaram e não vieram": peopleHasConfirmedAndNotCame,
    };
  }

  @override
  State<ScreenGrafico> createState() => _ScreenGraficoState();
}

class _ScreenGraficoState extends State<ScreenGrafico> {
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
      appBar: const AppBarTop(
        hasMenu: false,
      ),
      body: PieChart(
        chartRadius: MediaQuery.of(context).size.width * 0.7,
        dataMap: widget.pieChartMap,
        legendOptions: const LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.bottom,
          showLegends: true,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
