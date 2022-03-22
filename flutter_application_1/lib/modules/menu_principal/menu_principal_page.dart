import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/app_datas.dart';
import 'package:flutter_application_1/models/treatment.dart';

import '../../components/meus_horarios_card_widget.dart';
import '../../components/treatment_button_action_widget.dart';

class MenuPrincipalPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navDrawer;

  const MenuPrincipalPage(
      {Key? key, required this.pageAppBar, required this.navDrawer})
      : super(key: key);

  @override
  State<MenuPrincipalPage> createState() => _MenuPrincipalPageState();
}

class _MenuPrincipalPageState extends State<MenuPrincipalPage> {
  bool boolTeste = false;
  late List<TreatmentCard> _testCardTreatments;

  @override
  void initState() {
    _testCardTreatments = AppDatas.treatmentCards;
    super.initState();
  }

  Widget _titleListTile(IconData iconData, String title, {Widget? trailing}) {
    return ListTile(
        leading: Icon(iconData, color: Colors.black),
        title: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        trailing: trailing);
  }

  Widget _trailingButtonAgendamentos() {
    return TextButton(
        onPressed: () {
          // TODO: Abrir página de emergência. E não permitir a navegação quando já houver uma emergência registrada.
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    side: const BorderSide(color: Colors.red)))),
        child: const Text('EMERGÊNCIA',
            style: TextStyle(color: Colors.red, fontSize: 12)));
  }

  Widget _selectDentistLT() {
    //TODO: Atribuir valor variável ao nome do dentista selecionado.
    String nameDentist = "Thiago Henrique Gaspar";
    return ListTile(
        onTap: () {
          // TODO: Criar e abrir página de seleção do dentista.
        },
        leading: const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          // TODO: Colocar variável com imagem do dentista selecionado.
          /* backgroundImage: NetworkImage(
              "https://storage.builderall.com//franquias/2/887308/editor-html/4345839.jpg"), */
        ),
        title: Text(nameDentist,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        subtitle: const Text("Dentista selecionado(a)",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontSize: 12, color: Color(0xFF666666))),
        trailing: const Icon(Icons.arrow_forward_ios));
  }

  void _showAlertDialog(
      {required String title,
      required String treatmentInfo,
      required String alertMsg,
      required List<Widget> actions}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text(title),
              content: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(treatmentInfo),
                    Divider(),
                    Text(
                      alertMsg,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ]),
              actions: actions);
        });
  }

  void _cancelOnPressed(TreatmentCard treatmentCard) {
    //TODO: Fazer função para cancelamento de agendamento. Após abertura do AlertDialog.

    _showAlertDialog(
        title: "Cancelar agendamento?",
        treatmentInfo:
            "Data: ${treatmentCard.dateTime.day} ${treatmentCard.monthAsString} de ${treatmentCard.dateTime.year}.\n"
            "Horário/Dur: ${treatmentCard.dateTime.hour}h${treatmentCard.dateTime.minute} - ${treatmentCard.duration.inMinutes}min.\n"
            "Dent. ${treatmentCard.dentist}.",
        alertMsg: "Você tem certeza que deseja cancelar este agendamento?",
        actions: [
          TreatmentButtonAction.noBrackgound(
            onPressed: () {
              Navigator.pop(context);
            },
            titleButton: "NÃO",
            fontColor: AppColors.canceledAlertDialog,
          ),
          TreatmentButtonAction(
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.pop(context);
              },
              titleButton: "CANCELAR"),
        ]);
  }

  void _confirmOnPressed(TreatmentCard treatmentCard) {
    //TODO: Fazer função para confirmação de agendamento. Após abertura do AlertDialog.

    _showAlertDialog(
        title: "Confirmar agendamento?",
        treatmentInfo:
            "Data: ${treatmentCard.dateTime.day} ${treatmentCard.monthAsString} de ${treatmentCard.dateTime.year}.\n"
            "Horário/Dur: ${treatmentCard.dateTime.hour}h${treatmentCard.dateTime.minute} - ${treatmentCard.duration.inMinutes}min.\n"
            "Dent. ${treatmentCard.dentist}.",
        alertMsg:
            "Após confirmar o agendamento não será possível cancelá-lo pelo aplicativo.",
        actions: [
          TreatmentButtonAction.noBrackgound(
            onPressed: () {
              Navigator.pop(context);
            },
            titleButton: "NÃO",
            fontColor: AppColors.canceledAlertDialog,
          ),
          TreatmentButtonAction(
              backgroundColor: AppColors.done,
              onPressed: () {
                setState(() {
                  treatmentCard.isConfirmed = true;
                  // AppDatas.treatmentCards[index].isConfirmed = true;
                });
                Navigator.pop(context);
              },
              titleButton: "CONFIRMAR"),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.pageAppBar,
        drawer: widget.navDrawer,
        //TODO: Atentar-se para um futura mundação de Widget, por conta do overflow na Column.
        body: ListView(children: [
          _titleListTile(Icons.schedule_outlined, "Meus horários"),
          SizedBox(
              height: 190,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //TODO: Substituir por variável referente ao número de horários agendados.
                  itemCount: _testCardTreatments.length,
                  itemBuilder: (context, index) {
                    final TreatmentCard treatmentCard =
                        _testCardTreatments[index];
                    // TODO: Colocar variáveis referentes as informações do card do agendamento.
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 16 : 0),
                      child: MeusHorariosCard(
                        dataTimeTitle:
                            "${treatmentCard.dateTime.day} ${treatmentCard.monthAsString} - ${treatmentCard.dateTime.hour}h${treatmentCard.dateTime.minute}",
                        dentistaName: treatmentCard.dentist,
                        appointmentDuration:
                            "${treatmentCard.duration.inMinutes}min",
                        appointmentDescription: treatmentCard.description,
                        isConfirmed: treatmentCard.isConfirmed,
                        cancelOnPressed: () {
                          _cancelOnPressed(treatmentCard);
                        },
                        confirmOnPressed: () {
                          _confirmOnPressed(treatmentCard);
                        },
                      ),
                    );
                  })),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              thickness: 1.25,
            ),
          ),
          _titleListTile(Icons.calendar_month, "Agendamentos",
              trailing: _trailingButtonAgendamentos()),
          _selectDentistLT(),
        ]));
  }
}
