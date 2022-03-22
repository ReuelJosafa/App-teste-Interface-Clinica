import 'package:flutter/material.dart';

class TreatmentButtonAction extends StatelessWidget {
  final Color backgroundColor;
  final GestureTapCallback? onPressed;
  final String titleButton;
  final Color fontColor;
  final FontWeight fontWeight;

  const TreatmentButtonAction(
      {Key? key,
      required this.backgroundColor,
      required this.onPressed,
      required this.titleButton,
      this.fontColor = Colors.white,
      this.fontWeight = FontWeight.w900})
      : super(key: key);

  const TreatmentButtonAction.noBrackgound(
      {Key? key,
      this.backgroundColor = Colors.transparent,
      required this.onPressed,
      required this.titleButton,
      required this.fontColor,
      this.fontWeight = FontWeight.w700})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            primary: Colors.black,
            backgroundColor: backgroundColor,
            textStyle: TextStyle(fontSize: 14, fontWeight: fontWeight)),
        onPressed: onPressed,
        child: Text(titleButton, style: TextStyle(color: fontColor)));
  }
}
