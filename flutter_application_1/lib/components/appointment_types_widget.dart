import 'package:flutter/material.dart';

import '../models/treatment.dart';
import 'header_time_line_widget.dart';
import 'person_time_line_widget.dart';
import 'treatment_time_line_widget.dart';
import 'year_time_line_widget.dart';

class AppointmentTypesWidget extends StatelessWidget {
  final String planoHeader;
  final Color color;
  final IconData iconHeader;
  final List<PersonTreatment> people;
  const AppointmentTypesWidget(
      {Key? key,
      required this.planoHeader,
      required this.color,
      required this.iconHeader,
      required this.people})
      : super(key: key);

  Widget _tretmentsPerYear(int indexPerson, int yearReference, int yearIndex) {
    // Este ListView.builder refere-se aos tratamentos no ano de referência.
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: people[indexPerson].lengthTreatmentsYear(yearReference),
        itemBuilder: (context, indexTreatment) {
          //Como a partir do segundo ano este listView.builder começa a contar do zero fez-se necessário pegar o primeiro
          //index do ano de referência e somá-lo com o index dessa listagem de tratamentos.
          final treatmentIndex = yearIndex + indexTreatment;
          final Treatment treatment =
              people[indexPerson].treatments[treatmentIndex];
          return TreatmentTimeLineWidget(
              //Verifica se é a última pessoa e se é o último tratamento dessa pessoa.
              isLast: (people.length - 1 == indexPerson) &&
                  (people[indexPerson].treatments.length - 1 == treatmentIndex),
              onTap: treatment.onTap,
              color: color,
              day: treatment.day.toString(),
              month: treatment.month,
              treatmentTitle: treatment.treatmentTitle,
              valorSubT: treatment.valorSubT,
              parcelamentoSubT: treatment.parcelamentoSubT!,
              valorParceladoSubT: treatment.valorParceladoSubT!,
              dentist: treatment.dentist,
              trailing: treatment.trailing);
        });
  }

  @override
  Widget build(BuildContext context) {
    // Este ListView refere-se ao tipo de plano.
    return ListView(children: [
      HeaderTimeLine(plano: planoHeader, color: color, icon: iconHeader),

      // Este ListView.builder refere-se à quantidade de pessoas (responsável e dependentes).
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: people.length,
          itemBuilder: (context, indexPerson) {
            return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  //TODO: Observar a questão da imagem, se vai ser salvo no dispositivo.
                  PersonTimeLineWidget(
                      color: color,
                      name: people[indexPerson].name,
                      category: people[indexPerson].category,
                      picture: people[indexPerson].linkPicture != null
                          ? const AssetImage('images/silvao.jpg')
                          : null),

                  // Este ListView.builder refere-se à divisão por ano de referência.
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: people[indexPerson].yearsReference.length,
                      itemBuilder: (context, indexYear) {
                        final int yearReference = people[indexPerson]
                            .yearsReference
                            .elementAt(indexYear);
                        final int yearIndex =
                            people[indexPerson].firstYearIndex(yearReference);
                        return ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              YearTimeLineWidget(
                                  color: color, year: yearReference.toString()),
                              _tretmentsPerYear(
                                  indexPerson, yearReference, yearIndex)
                            ]);
                      })
                ]);
          })
    ]);
  }
}
