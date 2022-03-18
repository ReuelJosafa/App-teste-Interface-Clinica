import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/components/header_time_line_widget.dart';
import 'package:flutter_application_1/components/person_time_line_widget.dart';
import 'package:flutter_application_1/components/year_time_line_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../components/treatment_time_line_widget.dart';
import '../../models/treatment.dart';

class MeusTratamentosPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navdrawer;
  const MeusTratamentosPage(
      {Key? key, required this.pageAppBar, required this.navdrawer})
      : super(key: key);

  @override
  State<MeusTratamentosPage> createState() => _MeusTratamentosPageState();
}

class _MeusTratamentosPageState extends State<MeusTratamentosPage> {
  Widget _appointmentTypesWidget(
      {required String planoHeader,
      required Color color,
      required IconData iconHeader,
      required List<PersonTreatment> people,
      required List<String> yearsReference,
      required List<Treatment> treatments}) {
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
                      itemCount: yearsReference.length,
                      itemBuilder: (context, indexYear) {
                        return ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              YearTimeLineWidget(
                                  color: color,
                                  year: yearsReference[indexYear]),

                              // Este ListView.builder refere-se aos tratamentos neste ano.
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: treatments.length,
                                  itemBuilder: (context, indexTreatment) {
                                    return TreatmentTimeLineWidget(
                                        isLast: (yearsReference.length - 1 ==
                                                indexYear) &&
                                            (treatments.length - 1 ==
                                                indexTreatment),
                                        onTap: treatments[indexTreatment].onTap,
                                        color: color,
                                        day: treatments[indexTreatment].day,
                                        month: treatments[indexTreatment].month,
                                        treatmentTitle:
                                            treatments[indexTreatment]
                                                .treatmentTitle,
                                        valorSubT: treatments[indexTreatment]
                                            .valorSubT,
                                        parcelamentoSubT:
                                            treatments[indexTreatment]
                                                .parcelamentoSubT!,
                                        valorParceladoSubT:
                                            treatments[indexTreatment]
                                                .valorParceladoSubT!,
                                        dentist:
                                            treatments[indexTreatment].dentist,
                                        trailing: treatments[indexTreatment]
                                            .trailing);
                                  })
                            ]);
                      })
                ]);
          })
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.pageAppBar,
      drawer: widget.navdrawer,
      body: PageView(
        children: [
          _appointmentTypesWidget(
              planoHeader: "Planos em Andamento",
              color: Colors.blue,
              iconHeader: Icons.pending,
              people: [
                PersonTreatment(
                    name: "Silvano de Freitas Vaz Filhos",
                    category: "Responsável",
                    linkPicture: "Put link here"),
                PersonTreatment(name: "Joaquim Vaz", category: "Dependente")
              ],
              yearsReference: [
                "2021",
                "2022"
              ],
              treatments: [
                Treatment(
                    day: "21",
                    month: "AGO",
                    treatmentTitle: "Clareamento",
                    valorSubT: r"R$800",
                    dentist: "Thiago Henrique Gaspar",
                    trailing: const Icon(Icons.light_mode, size: 40))
              ])
        ],
      ),
    );
  }
}

 /* ListView(
        children: [
          const HeaderTimeLine(
              plano: "Planos em Andamento",
              color: Colors.blue,
              icon: Icons.pending),
          // _headerTimeline(plano: "Planos em andamento"),
          const PersonTimeLineWidget(
              color: Colors.blue,
              name: "Silvano de Freitas Vaz Filho",
              category: "Responsável",
              picture: AssetImage('images/silvao.jpg')),
          // _pessoaTimeline(),
          // _yearTimeLine(context),
          const YearTimeLineWidget(color: Colors.blue, year: "2021"),

          TreatmentTimeLineWidget(
              onTap: () {
                print("Tocou");
              },
              color: Colors.blue,
              day: "21",
              month: "AGO",
              treatmentTitle: "Clareamento",
              valorSubT: r"R$800",
              dentist: "Thiago Henrique Gaspar",
              trailing: const Icon(Icons.light_mode, size: 40)),

          TreatmentTimeLineWidget(
              onTap: () {
                print("Tocou");
              },
              color: Colors.blue,
              day: "21",
              month: "AGO",
              treatmentTitle: "Clareamento dental totalmente",
              valorSubT: r'R$790,00',
              parcelamentoSubT: "em 5x de",
              valorParceladoSubT: r'R$158,00',
              dentist: "Thiago Henrique Gaspar",
              trailing: const Icon(Icons.light_mode, size: 40)),

          /* _treatmentTimeLine(context,
              valorST: r'R$790,00',
              parcelamentoST: "em 5x de",
              valorParceladoST: r'R$158,00',
              title: "Clareamento dental totalmente"),
          _treatmentTimeLine(context, valorST: r'R$790,00'), */

          const YearTimeLineWidget(color: Colors.blue, year: "2020"),
          TreatmentTimeLineWidget(
              onTap: () {
                print("Tocou");
              },
              color: Colors.blue,
              day: "12",
              month: "DEZ",
              treatmentTitle: "ortodontia",
              valorSubT: r"R$2560",
              parcelamentoSubT: "em 10x de",
              valorParceladoSubT: r'R$256,00',
              dentist: "Luiz Antonio de Lima Bassi",
              trailing: const Icon(Icons.light_mode, size: 40)),

/*           _treatmentTimeLine(context, valorST: r'R$790,00'),
          _treatmentTimeLine(context, valorST: r'R$790,00'), */
          const PersonTimeLineWidget(
              color: Colors.blue,
              name: "Joaquim Vaz",
              category: "Dependente",
              backgroudColorCircleAv: Color(0xFFA0887E)),
          const YearTimeLineWidget(color: Colors.blue, year: "2021"),
          TreatmentTimeLineWidget(
            onTap: () {
              print("Tocou");
            },
            color: Colors.blue,
            day: "21",
            month: "AGO",
            treatmentTitle: "Clareamento dental totalmente",
            valorSubT: r'R$790,00',
            dentist: "Thiago Henrique Gaspar",
            trailing: const Icon(Icons.light_mode, size: 40),
            isLast: true,
          ),

/*           _treatmentTimeLine(context, valorST: r'R$790,00'),
          _treatmentTimeLine(context, valorST: r'R$790,00'),
          _treatmentTimeLine(context, valorST: r'R$790,00'),
          _treatmentTimeLine(context, valorST: r'R$790,00', isLast: true), */
        ], ),*/


/* 
Widget _headerTimeline(
    {Color color = Colors.blue,
    required String plano,
    IconData icon = Icons.pending}) {
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
} */

/* 
Widget _pessoaTimeline(
    {Color color = Colors.blue,
    String name = "Silvano de Freitas Vaz Filho Juco",
    String category = "Responsável",
    ImageProvider<Object> image = const AssetImage('images/silvao.jpg')}) {
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
                  backgroundColor: Colors.grey,
                  backgroundImage: image))));
}
 */
/* 
Widget _yearTimeLine(BuildContext context,
    {Color color = Colors.blue, String year = "2021"}) {
  const textStyle =
      TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600);
  return SizedBox(
      height: 52,
      child: TimelineTile(
          afterLineStyle: LineStyle(color: color),
          beforeLineStyle: LineStyle(color: color),
          endChild: const Padding(
              padding: EdgeInsets.only(left: 4, right: 16),
              child: Text("Ano de Referência", style: textStyle)),
          indicatorStyle: IndicatorStyle(
              // color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              height: 24,
              width: 52,
              indicator: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Center(
                  child: Text(
                    year,
                    style: textStyle,
                  ),
                ),
              ))));
} */

/* 
Widget _treatmentTimeLine(BuildContext context,
    {bool isLast = false,
    Color color = Colors.blue,
    String day = "21",
    String month = "AGO",
    String title = "Tratamento",
    required String valorST,
    String parcelamentoST = "",
    String valorParceladoST = '',
    String dentist = "Thiago Henrique Gaspar",
    Widget trailing = const Icon(Icons.light_mode, size: 40)}) {
  return SizedBox(
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
                              text: "$title\n".toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                        TextSpan(
                            style: TextStyle(
                                color: Colors.grey[900], fontSize: 14),
                            children: [
                              TextSpan(
                                  text: valorST,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: " $parcelamentoST "),
                              TextSpan(
                                  text: '$valorParceladoST\n',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ]),
                        TextSpan(
                            text: dentist,
                            style: TextStyle(
                                color: AppColors.greyFontColor, fontSize: 14))
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
              ))));
}
 */