import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.pageAppBar,
      drawer: widget.navdrawer,
      body: Center(child: Text("Minhas Indicações Page")),
    );
  }
}
