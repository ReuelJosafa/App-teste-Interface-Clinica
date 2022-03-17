import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class MinhasIndicacoesPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navdrawer;
  const MinhasIndicacoesPage(
      {Key? key, required this.pageAppBar, required this.navdrawer})
      : super(key: key);

  @override
  State<MinhasIndicacoesPage> createState() => MinhasIndicacoestate();
}

class MinhasIndicacoestate extends State<MinhasIndicacoesPage> {
  void _sendInvatationMassage() async {
    //TODO: Verificar mensagem genêrica para indicação pelo app.
    await Share.share(
        "Olá!\n *Reuel Josafá kulibaba* está te enviando um convite para conhecer a clínica Luiz Bassi e Marcia Moreira.!"
        " \nhttps://luizbassiemarciamoreira.com.br/ \nhttps://play.google.com/store/apps/details?id=com.figma.mirror",
        subject: "Utilize o app da clínica");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.pageAppBar,
      drawer: widget.navdrawer,
      body: Center(child: Text("Minhas Indicações Page")),
      floatingActionButton: FloatingActionButton(
          onPressed: _sendInvatationMassage,
          tooltip: 'Indicar',
          child: const Icon(Icons.person_add)),
    );
  }
}
