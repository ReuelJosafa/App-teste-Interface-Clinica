import 'package:flutter/material.dart';

class PreferenciasUsuarioPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navDrawer;
  const PreferenciasUsuarioPage(
      {Key? key, required this.pageAppBar, required this.navDrawer})
      : super(key: key);

  @override
  State<PreferenciasUsuarioPage> createState() => MinhasIndicacoestate();
}

class MinhasIndicacoestate extends State<PreferenciasUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.pageAppBar,
      drawer: widget.navDrawer,
      body: const Center(child: Text("Preferencias do Usuário Page")),
    );
  }
}
