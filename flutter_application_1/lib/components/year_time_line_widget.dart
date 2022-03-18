import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class YearTimeLineWidget extends StatelessWidget {
  final Color color;
  final String year;
  const YearTimeLineWidget({Key? key, required this.color, required this.year})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600);

    return SizedBox(
        height: 52,
        child: TimelineTile(
            afterLineStyle: LineStyle(color: color),
            beforeLineStyle: LineStyle(color: color),
            endChild: const Padding(
                padding: EdgeInsets.only(left: 4, right: 16),
                child: Text("Ano de Referência", style: textStyle)),
            indicatorStyle: IndicatorStyle(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                height: 24,
                width: 52,
                indicator: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Center(
                      child: Text(year, style: textStyle),
                    )))));
  }
}
