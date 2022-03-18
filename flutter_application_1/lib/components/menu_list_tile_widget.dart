import 'package:flutter/material.dart';

class MenuListTileWiget extends StatelessWidget {
  final bool hasPermission;

  final Icon? icon;
  final String title;
  final bool isSelected;
  final GestureTapCallback? onTap;
  const MenuListTileWiget(
      {Key? key,
      this.hasPermission = false,
      this.icon,
      required this.title,
      this.onTap,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasPermission
        ? Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ListTile(
              selected: isSelected,
              leading: icon,
              title: Text(title),
              selectedColor: Colors.black,
              selectedTileColor: const Color(0xFFB3E1E4),
              textColor: Colors.black87,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(32.0))),
              onTap: onTap,
            ),
          )
        : const SizedBox();
  }
}
