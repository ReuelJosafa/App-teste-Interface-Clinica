import 'package:flutter/material.dart';

class PreferenciasUsuarioPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navdrawer;
  const PreferenciasUsuarioPage(
      {Key? key, required this.pageAppBar, required this.navdrawer})
      : super(key: key);

  @override
  State<PreferenciasUsuarioPage> createState() => MinhasIndicacoestate();
}

class MinhasIndicacoestate extends State<PreferenciasUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.pageAppBar,
      drawer: widget.navdrawer,
      body: Center(child: Text("Preferencias do Usuário Page")),
    );
  }
}
