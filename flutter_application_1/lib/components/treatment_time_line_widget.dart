import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../app_colors.dart';

class TreatmentTimeLineWidget extends StatelessWidget {
  final bool isLast;
  final Color color;
  final String day;
  final String month;
  final String treatmentTitle;
  final String valorSubT;
  final String parcelamentoSubT;
  final String valorParceladoSubT;
  final String dentist;
  final Widget trailing;
  final GestureTapCallback? onTap;
  const TreatmentTimeLineWidget(
      {Key? key,
      this.isLast = false,
      required this.color,
      required this.day,
      required this.month,
      required this.treatmentTitle,
      required this.valorSubT,
      this.parcelamentoSubT = "",
      this.valorParceladoSubT = "",
      required this.dentist,
      required this.trailing,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey[200],
      onTap: onTap,
      child: SizedBox(
          height: 100,
          child: TimelineTile(
              isLast: isLast,
              afterLineStyle: LineStyle(color: color),
              beforeLineStyle: LineStyle(color: color),
              endChild: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: RichText(
                              text: TextSpan(
                                  text: "$treatmentTitle\n".toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.grey[900], fontSize: 14),
                                children: [
                                  TextSpan(
                                      text: valorSubT,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: " $parcelamentoSubT "),
                                  TextSpan(
                                      text: '$valorParceladoSubT\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ]),
                            TextSpan(
                                text: dentist,
                                style: TextStyle(
                                    color: AppColors.greyFontColor,
                                    fontSize: 14))
                          ]))),
                      trailing
                    ],
                  )),
              indicatorStyle: IndicatorStyle(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 50,
                  width: 48,
                  indicator: Container(
                    alignment: Alignment.center,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Text(
                      "$day\n$month",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          color: AppColors.greyFontColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )))),
    );
  }
}
