import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MeusTratamentosPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navdrawer;
  const MeusTratamentosPage(
      {Key? key, required this.pageAppBar, required this.navdrawer})
      : super(key: key);

  @override
  State<MeusTratamentosPage> createState() => _MeusTratamentosPageState();
}

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
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500))),
          indicatorStyle: IndicatorStyle(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 48,
              width: 48,
              iconStyle:
                  IconStyle(iconData: icon, color: color, fontSize: 58))));
}

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
}

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

class _MeusTratamentosPageState extends State<MeusTratamentosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.pageAppBar,
      drawer: widget.navdrawer,
      body: ListView(
        children: [
          _headerTimeline(plano: "Planos em andamento"),
          _pessoaTimeline(),
          _yearTimeLine(
            context,
          ),
          _treatmentTimeLine(context,
              valorST: r'R$790,00',
              parcelamentoST: "em 5x de",
              valorParceladoST: r'R$158,00',
              title: "Clareamento dental totalmente"),
          _treatmentTimeLine(context, valorST: r'R$790,00'),
          _yearTimeLine(context, year: "2020"),
          _treatmentTimeLine(context, valorST: r'R$790,00'),
          _treatmentTimeLine(context, valorST: r'R$790,00'),
          _pessoaTimeline(),
          _yearTimeLine(context),
          _treatmentTimeLine(context, valorST: r'R$790,00'),
          _treatmentTimeLine(context, valorST: r'R$790,00'),
          _treatmentTimeLine(context, valorST: r'R$790,00'),
          _treatmentTimeLine(context, valorST: r'R$790,00', isLast: true),
        ],
      ),
    );
  }
}
