import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:share_plus/share_plus.dart';

class MinhasIndicacoesPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navDrawer;
  const MinhasIndicacoesPage(
      {Key? key, required this.pageAppBar, required this.navDrawer})
      : super(key: key);

  @override
  State<MinhasIndicacoesPage> createState() => MinhasIndicacoestate();
}

class MinhasIndicacoestate extends State<MinhasIndicacoesPage> {
  String valorBonusAcumulado = r"R$ 126,40";
  
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
      drawer: widget.navDrawer,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.done,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            // padding: const EdgeInsets.all(16),
            height: 139,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "TOTAL DE BÔNUS ACUMULADO",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                valorBonusAcumulado,
                style: TextStyle(color: Colors.white, fontSize: 48),
              ),
            ]),
          ),
          const Center(child: Text("Minhas Indicações Page"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _sendInvatationMassage,
          tooltip: 'Indicar',
          child: const Icon(Icons.person_add)),
    );
  }
}
