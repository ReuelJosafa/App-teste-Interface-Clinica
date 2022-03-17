import 'package:flutter/material.dart';

import 'menu_list_tile.dart';

class MenusTitleLT extends StatelessWidget {
  final bool hasPermission;
  final String title;
  final List<MenuListTile>? menus;
  const MenusTitleLT(
      {Key? key,
      this.hasPermission = false,
      required this.title,
      this.menus = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasPermission
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              ...menus!
            ],
          )
        : const SizedBox();
  }
}
