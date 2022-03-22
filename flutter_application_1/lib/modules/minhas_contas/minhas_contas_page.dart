import 'package:flutter/material.dart';

class MinhasContasPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navDrawer;
  const MinhasContasPage(
      {Key? key, required this.pageAppBar, required this.navDrawer})
      : super(key: key);

  @override
  State<MinhasContasPage> createState() => _MinhasContasPageState();
}

class _MinhasContasPageState extends State<MinhasContasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.pageAppBar,
      drawer: widget.navDrawer,
      body: Center(child: Text("Minhas Contas Page")),
    );
  }
}
