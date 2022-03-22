import 'package:flutter/material.dart';

import 'treatment_button_action_widget.dart';

class MeusHorariosCard extends StatelessWidget {
  final ImageProvider<Object> circleImage;
  final String dataTimeTitle;
  final String dentistaName;
  final String appointmentDuration;
  final String appointmentDescription;
  final GestureTapCallback cancelOnPressed;
  final GestureTapCallback confirmOnPressed;
  final bool isConfirmed;
  const MeusHorariosCard(
      {Key? key,
      this.circleImage = const AssetImage('images/silvao.jpg'),
      required this.dataTimeTitle,
      required this.dentistaName,
      required this.appointmentDuration,
      required this.appointmentDescription,
      required this.cancelOnPressed,
      required this.confirmOnPressed,
      this.isConfirmed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 344,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                  leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      backgroundImage: circleImage),
                  title: Text(dataTimeTitle,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700)),
                  subtitle: Text(dentistaName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF666666))),
                  trailing: Text("Dur.\n$appointmentDuration",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6E798C),
                          fontWeight: FontWeight.w500))),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        appointmentDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ))),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: isConfirmed
                      ? const [
                          TreatmentButtonAction.noBrackgound(
                              onPressed: null,
                              titleButton: "FALTAM: 24 HORAS",
                              fontColor: Colors.black)
                        ]
                      : [
                          TreatmentButtonAction.noBrackgound(
                            fontColor: Colors.red,
                            onPressed: cancelOnPressed,
                            titleButton: 'CANCELAR',
                          ),
                          TreatmentButtonAction(
                            backgroundColor: Colors.green,
                            onPressed: confirmOnPressed,
                            titleButton: "CONFIRMAR",
                          ),
                        ],
                ),
              )
            ]),
      ),
    );
  }
}
