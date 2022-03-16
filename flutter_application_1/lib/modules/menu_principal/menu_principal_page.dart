import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

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
  final _horizontalScrollController = ScrollController();

  void _sendWhatsappmassage() async {
    await Share.share(
        "Olá!\n *Reuel Josafá kulibaba* está te enviando um convite para conhecer a clínica Luiz Bassi e Marcia Moreira.!"
        " \nhttps://luizbassiemarciamoreira.com.br/ \nhttps://play.google.com/store/apps/details?id=com.figma.mirror",
        subject: "Utilize o app da clínica");
  }

  Widget _trailingButtonAgendamentos() {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    side: const BorderSide(color: Colors.red)))),
        child: const Text('EMERGÊNCIA',
            style: TextStyle(color: Colors.red, fontSize: 12)));
  }

  Widget _titleListTile(IconData iconData, String title, {Widget? trailing}) {
    return ListTile(
        leading: Icon(
          iconData,
          color: Colors.black
        ),
        title: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        trailing: trailing);
  }

  Widget _selectDentistLT() {
    return ListTile(
        onTap: () {},
        leading: const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(
              "https://storage.builderall.com//franquias/2/887308/editor-html/4345839.jpg"),
        ),
        title: const Text("Thiago Henrique Gaspar",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        subtitle: const Text(
          "Dentista selecionado(a)",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.pageAppBar,
        drawer: widget.navdrawer,
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              _titleListTile(Icons.schedule_outlined, "Meus horários"),
              SizedBox(
                  height: 190,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _horizontalScrollController,
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return MeusHorariosCard(index);
                      })),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(height: 1),
              ),
              _titleListTile(Icons.calendar_month, "Agendamentos",
                  trailing: _trailingButtonAgendamentos()),
              _selectDentistLT()
            ]),
        floatingActionButton: FloatingActionButton(
            onPressed: _sendWhatsappmassage,
            tooltip: 'Increment',
            child: const Icon(Icons.add)));
  }
}
