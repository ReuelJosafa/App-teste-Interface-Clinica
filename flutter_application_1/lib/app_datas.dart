import 'package:flutter/material.dart';

import 'models/treatment.dart';

class AppDatas {
  static List<TreatmentCard> get treatmentCards => [
        TreatmentCard(
            dateTime: DateTime(2021, 4, 21, 13, 30),
            dentist: "Thiago Henrique Gaspar",
            duration: const Duration(minutes: 30),
            description: "Breve descrição"),
            TreatmentCard(
            dateTime: DateTime(2021, 06, 06, 16),
            dentist: "Thiago Henrique Gaspar",
            duration: const Duration(minutes: 30),
            description: "Breve descrição"),
      ];

  //TODO: não esquecer que a lista real deverá ser ordenada pela data.
  static List<PersonTreatment> get peopleTreatments => [
        PersonTreatment(
            name: "Silvano de Freitas Vaz Filhos",
            category: "Responsável",
            linkPicture: "Put link here",
            treatments: [
              Treatment(
                  day: 21,
                  month: "AGO",
                  year: 2021,
                  treatmentTitle: "Clareamento",
                  valorSubT: r"R$800,00",
                  dentist: "Thiago Henrique Gaspar",
                  trailing: const Icon(Icons.light_mode, size: 40)),
              Treatment(
                  day: 03,
                  month: "DEZ",
                  year: 2021,
                  treatmentTitle: "Clareamento",
                  valorSubT: r"R$800,00",
                  dentist: "Thiago Henrique Gaspar",
                  trailing: const Icon(Icons.light_mode, size: 40)),
              Treatment(
                  day: 27,
                  month: "SET",
                  year: 2020,
                  treatmentTitle: "ORTODONTIA",
                  valorSubT: r"R$2560,00",
                  parcelamentoSubT: r' em 10x de ',
                  valorParceladoSubT: r'R$256,00',
                  dentist: "Thiago Henrique Gaspar",
                  trailing: const Icon(Icons.light_mode, size: 40)),
            ]),
        PersonTreatment(
            name: "Joaquim Vaz",
            category: "Dependente",
            treatments: [
              Treatment(
                  day: 13,
                  month: "JUL",
                  year: 2021,
                  treatmentTitle: "Clareamento",
                  valorSubT: r"R$800,00",
                  dentist: "Thiago Henrique Gaspar",
                  trailing: const Icon(Icons.light_mode, size: 40)),
              Treatment(
                  day: 12,
                  month: "AGO ",
                  year: 2021,
                  treatmentTitle: "Prevenção",
                  valorSubT: r"R$449,00",
                  dentist: "Thiago Henrique Gaspar",
                  trailing: const Icon(Icons.light_mode, size: 40)),
              Treatment(
                  day: 21,
                  month: "AGO",
                  year: 2021,
                  treatmentTitle: "Clareamento",
                  valorSubT: r"R$800,00",
                  dentist: "Thiago Henrique Gaspar",
                  trailing: const Icon(Icons.light_mode, size: 40)),
              Treatment(
                  day: 03,
                  month: "DEZ",
                  year: 2021,
                  treatmentTitle: "Clareamento",
                  valorSubT: r"R$800,00",
                  dentist: "Thiago Henrique Gaspar",
                  trailing: const Icon(Icons.light_mode, size: 40)),
              Treatment(
                  day: 27,
                  month: "SET",
                  year: 2020,
                  treatmentTitle: "ORTODONTIA",
                  valorSubT: r"R$2560,00",
                  parcelamentoSubT: r' em 10x de ',
                  valorParceladoSubT: r'R$256,00',
                  dentist: "Thiago Henrique Gaspar",
                  trailing: const Icon(Icons.light_mode, size: 40)),
              Treatment(
                  day: 27,
                  month: "SET",
                  year: 2019,
                  treatmentTitle: "ORTODONTIA",
                  valorSubT: r"R$2560,00",
                  parcelamentoSubT: r' em 10x de ',
                  valorParceladoSubT: r'R$256,00',
                  dentist: "Thiago Henrique Gaspar",
                  trailing: const Icon(Icons.light_mode, size: 40)),
            ])
      ];
}
