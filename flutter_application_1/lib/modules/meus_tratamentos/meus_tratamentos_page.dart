import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MeusTratamentosPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navdrawer;
  const MeusTratamentosPage(
      {Key? key, required this.pageAppBar, required this.navdrawer})
      : super(key: key);

  @override
  State<MeusTratamentosPage> createState() => _MeusTratamentosPageState();
}

class _MeusTratamentosPageState extends State<MeusTratamentosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.pageAppBar,
      drawer: widget.navdrawer,
      body: Column(
        children: [
          TimelineTile(
            afterLineStyle: LineStyle(color: Colors.blue),
            // alignment: TimelineAlign.center,
            isFirst: true,
            endChild: const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Planos atuais"),
            ),
            indicatorStyle: IndicatorStyle(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 40,
                iconStyle: IconStyle(
              iconData: Icons.pending,
              color: Colors.blue,
              fontSize: 50
            )
                // iconStyle: Icon(Icons.pending, color: Colors.blue, size: 40)

                ),
          )
        ],
      ),
    );
  }
}
