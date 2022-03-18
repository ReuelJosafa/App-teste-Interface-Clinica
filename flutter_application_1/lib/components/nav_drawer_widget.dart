import 'package:flutter/material.dart';

import 'menus_title_lt_widget.dart';

class NavDrawer extends StatelessWidget {
  final ImageProvider<Object>? imagePersonHeader;
  final String namePersonHeader;
  //TODO: Observar a questão das cores randômicas, salvar uma cor para cada usuário no próprio smartphone.
  final Color? colorHeaderCA;
  final List<MenusTitleLTWidget>? menusTitleLT;
  const NavDrawer(
      {Key? key,
      this.imagePersonHeader,
      required this.namePersonHeader,
      this.colorHeaderCA = Colors.orange,
      this.menusTitleLT = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFE3E3E3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: colorHeaderCA,
                    backgroundImage: imagePersonHeader,
                    child: imagePersonHeader == null
                        ? Text(namePersonHeader.substring(0, 1).toUpperCase(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white))
                        : null,
                  ),
                ),
                Text(namePersonHeader, style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
          ...menusTitleLT!
        ],
      ),
    );
  }
}
