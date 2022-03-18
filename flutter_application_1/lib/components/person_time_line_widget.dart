import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../app_colors.dart';

class PersonTimeLineWidget extends StatelessWidget {
  final Color color;
  final String name;
  final String category;
  final ImageProvider<Object>? picture;
  final Color backgroudColorCircleAv;
  const PersonTimeLineWidget(
      {Key? key,
      required this.color,
      required this.name,
      required this.category,
      this.picture,
      this.backgroudColorCircleAv = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 72,
        child: TimelineTile(
            afterLineStyle: LineStyle(color: color),
            beforeLineStyle: LineStyle(color: color),
            endChild: Padding(
                padding: const EdgeInsets.only(left: 4, right: 16),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFFAAAAAA),
                              fontWeight: FontWeight.bold)),
                      Text(category,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13, color: AppColors.greyFontColor)),
                    ])),
            indicatorStyle: IndicatorStyle(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                width: 48,
                indicator: CircleAvatar(
                    radius: 24,
                    backgroundColor: backgroudColorCircleAv,
                    child: picture == null
                        ? Text(name.substring(0, 1).toUpperCase(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white))
                        : null,
                    backgroundImage: picture))));
  }
}
