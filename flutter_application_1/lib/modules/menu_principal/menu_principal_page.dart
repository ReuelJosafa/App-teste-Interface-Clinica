import 'package:flutter/material.dart';

import '../../components/meus_horarios_card_widget.dart';

class MenuPrincipalPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navdrawer;

  const MenuPrincipalPage(
      {Key? key, required this.pageAppBar, required this.navdrawer})
      : super(key: key);

  @override
  State<MenuPrincipalPage> createState() => _MenuPrincipalPageState();
}

class _MenuPrincipalPageState extends State<MenuPrincipalPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.pageAppBar,
        drawer: widget.navdrawer,
        //TODO: Atentar-se para um futura mundação de Widget, por conta do overflow na Column.
        body: ListView(children: [
          _titleListTile(Icons.schedule_outlined, "Meus horários"),
          SizedBox(
              height: 190,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //TODO: Substituir por variável referente ao número de horários agendados.
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // TODO: Colocar variáveis referentes as informações do card do agendamento.
                    return MeusHorariosCard(
                      index,
                      dataTimeTitle: "21 MAR - 15h30",
                      dentistaName: "Thiago Henrique Gaspar Dutra filho",
                      appointmentDuration: "30min",
                      appointmentDescription: index != 0
                          ? "Tratamento de canal e extração do dente 45, após extração do 21."
                          : "Breve descrição",
                      //TODO: Abrir alertDialog de confirmação para ambos.
                      cancelOnPressed: () {
                        //TODO: Fazer função para cancelamento de agendamento. Após abertura do AlertDialog.
                        
                        // print("Teste Cancelar");
                      },
                      confirmOnPressed: () {
                        //TODO: Fazer função para confirmação de agendamento. Após abertura do AlertDialog.
                        
                        // print("Teste Confirmar");
                      },
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
