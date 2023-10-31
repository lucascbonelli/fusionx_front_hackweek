import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTabTapped;

  const CustomBottomNavigationBar({super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedFontSize: 16,
      unselectedFontSize: 14,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Início",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: "Gráfico",
        ),
      ],
      onTap: onTabTapped,
    );
  }
}