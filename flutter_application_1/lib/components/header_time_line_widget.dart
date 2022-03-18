import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HeaderTimeLine extends StatelessWidget {
  final String plano;
  final Color color;
  final IconData icon;
  const HeaderTimeLine(
      {Key? key, required this.plano, required this.color, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 68,
        child: TimelineTile(
            afterLineStyle: LineStyle(color: color),
            isFirst: true,
            endChild: Padding(
                padding: const EdgeInsets.only(left: 4, right: 16),
                child: Text(plano,
                    style: TextStyle(
                        fontSize: 16,
                        color: color,
                        fontWeight: FontWeight.w500))),
            indicatorStyle: IndicatorStyle(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                width: 48,
                iconStyle:
                    IconStyle(iconData: icon, color: color, fontSize: 58))));
  }
}
