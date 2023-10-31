import 'package:flutter/material.dart';

class AppBarTop extends StatefulWidget implements PreferredSizeWidget {
  final bool hasMenu;
  const AppBarTop({super.key, this.hasMenu = true});

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
            icon: Icon(widget.hasMenu ? Icons.menu : Icons.arrow_back_ios),
            onPressed: () {
              widget.hasMenu
                  ? Scaffold.of(context).openDrawer()
                  : Navigator.of(context).pop();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: ClipOval(
              child: SizedBox(
                  height: 150, child: Image.asset("lib/imagens/logo_dark.png")),
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
