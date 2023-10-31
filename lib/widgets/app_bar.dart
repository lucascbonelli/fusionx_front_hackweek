import 'package:flutter/material.dart';

class AppBarTop extends StatefulWidget implements PreferredSizeWidget {
  const AppBarTop({super.key});

  @override
  State<AppBarTop> createState() => _AppBarTopState();

  @override
  Size get preferredSize => const Size.fromHeight(150);
}

class _AppBarTopState extends State<AppBarTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: ClipOval(
              child:  SizedBox(height:  100, child: Image.asset("lib/imagens/logo.jpg")),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
