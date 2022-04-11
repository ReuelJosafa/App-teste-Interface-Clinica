import 'package:flutter/material.dart';

class PersonTreatment {
  final String name;
  final String category;
  final String? linkPicture;
  final List<Treatment> treatments;
  PersonTreatment({
    required this.name,
    required this.category,
    this.linkPicture,
    required this.treatments,
  });

  Set<int> get yearsReference => treatments.map((e) => e.year).toSet();

  int lengthTreatmentsOf(int year) =>
      treatments.where((e) => e.year == year).length;

  int firstYearIndex(int year) => treatments.indexWhere((e) => e.year == year);

  // List<>
}

class Treatment {
  final int day;
  final String month;
  final int year;
  final String treatmentTitle;
  final String valorSubT;
  //TODO: Conferir um valor nulável que pode receber um valor no construtor.
  final String? parcelamentoSubT;
  final String? valorParceladoSubT;
  final String dentist;
  final Widget trailing;
  final GestureTapCallback? onTap;

  Treatment(
      {required this.day,
      required this.month,
      required this.year,
      required this.treatmentTitle,
      required this.valorSubT,
      this.parcelamentoSubT = '',
      this.valorParceladoSubT = '',
      required this.dentist,
      required this.trailing,
      this.onTap});
}

class TreatmentCard {
  final DateTime dateTime;
/*   final int day;
  final int month;
  final int year;
  final TimeOfDay time; */
  final String dentist;
  final Duration duration;
  final String description;
  bool isConfirmed;
  final bool isCanceled;

  TreatmentCard(
      {required this.dateTime,
/*       required this.day,
      required this.month,
      required this.year,
      required this.time, */
      required this.dentist,
      required this.duration,
      required this.description,
      this.isConfirmed = false,
      this.isCanceled = false});

  String get monthAsString {
    switch (dateTime.month) {
      case 1:
        return "JAN";
      case 2:
        return "FEV";
      case 3:
        return "MAR";
      case 4:
        return "ABR";
      case 5:
        return "MAI";
      case 6:
        return "JUN";
      case 7:
        return "JUL";
      case 8:
        return "AGO";
      case 9:
        return "SET";
      case 10:
        return "OUT";
      case 11:
        return "NOV";
      case 12:
        return "DEZ";
      default:
        return "";
    }
  }

  DateTime get howMuchTime {
    return DateTime.now();
  }
}
