import 'package:flutter/material.dart';

class PersonTreatment {
  final String name;
  final String category;
  final String? linkPicture;
  PersonTreatment(
      {required this.name, required this.category, this.linkPicture});
}

class Treatment {
  final String day;
  final String month;
  final String treatmentTitle;
  final String valorSubT;
  //TODO: Conferir um valor nulável que pode receber um valor noconstrutor.
  final String? parcelamentoSubT;
  final String? valorParceladoSubT;
  final String dentist;
  final Widget trailing;
  final GestureTapCallback? onTap;

  Treatment(
      {required this.day,
      required this.month,
      required this.treatmentTitle,
      required this.valorSubT,
      this.parcelamentoSubT = '',
      this.valorParceladoSubT = '',
      required this.dentist,
      required this.trailing,
      this.onTap});
}
