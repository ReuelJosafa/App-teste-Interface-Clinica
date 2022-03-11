import 'package:flutter/material.dart';

import 'menus_title_lt.dart';

class NavDrawer extends StatelessWidget {
  final Image? imagePersonHeader;
  final String namePersonHeader;
  final Color? colorHeaderCA;
  final List<MenusTitleLT>? menusTitleLT;
  const NavDrawer(
      {Key? key,
      this.imagePersonHeader,
      required this.namePersonHeader,
      this.colorHeaderCA = Colors.orange, this.menusTitleLT = const []})
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
                CircleAvatar(
                  radius: 30,
                  backgroundColor: colorHeaderCA,
                  child: imagePersonHeader ??
                      Text(namePersonHeader.substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white)),
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

enum MenuLTSelected {
  mainMenu,
  myAppoitments,
  myBills,
  myInvantations,
  userSettings
}
