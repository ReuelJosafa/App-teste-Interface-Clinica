import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../componets/menu_list_tile.dart';
import '../../componets/menus_title_lt.dart';
import '../../componets/nav_drawer_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  MenuLTSelected enumMenuLTSelected = MenuLTSelected.mainMenu;
  List<MenusTitleLT> menusTitleLT = [];
  late BuildContext buildContext;

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _sendWhatsappmassage();
  }

  void _sendWhatsappmassage() async {
    await Share.share(
      "Olá!\n *Reuel Josafá kulibaba* está te enviando um convite para conhecer a clínica Luiz Bassi e Marcia Moreira.!"
      " \nhttps://luizbassiemarciamoreira.com.br/ \nhttps://play.google.com/store/apps/details?id=com.figma.mirror",
      subject: "Utilize o app da clínica"
    );
  }

  @override
  Widget build(BuildContext context) {
    menusTitleLT = [
      MenusTitleLT(title: "SERVIÇOS", menus: [
        MenuListTile(
            icon: const Icon(Icons.home),
            title: "Menu Principal",
            isSelected: enumMenuLTSelected.index == 0 ? true : false,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.mainMenu;
              Navigator.pop(context);
            }),
        MenuListTile(
            icon: const Icon(Icons.paste),
            title: "Meus Tratamentos",
            isSelected: enumMenuLTSelected.index == 1,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.myAppoitments;
              Navigator.pop(context);
            }),
        MenuListTile(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            title: "Minhas Contas",
            isSelected: enumMenuLTSelected.index == 2,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.myBills;
              Navigator.pop(context);
            }),
        MenuListTile(
            icon: const Icon(Icons.groups_sharp),
            title: "Minhas Indicações",
            isSelected: enumMenuLTSelected.index == 3,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.myInvantations;
              Navigator.pop(context);
            }),
      ]),
      MenusTitleLT(title: 'CONFIGURAÇÕES', menus: [
        MenuListTile(
            icon: const Icon(Icons.settings),
            title: "Preferências do Usuário",
            isSelected: enumMenuLTSelected.index == 4,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.userSettings;
              Navigator.pop(context);
            }),
      ]),
      MenusTitleLT(title: 'PERFIL', menus: [
        MenuListTile(
            icon: const Icon(Icons.power_settings_new),
            title: "Sair do Perfil",
            onTap: () {
              setState(() {});
              Navigator.pop(context);
            }),
      ])
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      drawer: NavDrawer(
          namePersonHeader: "Cesar Silva Peixoto", menusTitleLT: menusTitleLT),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*   Widget gambiDrawerWdgt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SafeArea(
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            color: AppColors.cinzaHeaderDrawer,
            height: 146,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  // color: Colors.orange,
                ),
                const CircleAvatar(
                  radius: 30,
                  // backgroundColor: Colors.orange,
                  child: Text('C'),
                )
              ],
            ),
          ),
        ),
        /* Container(color: Colors.amber,
            height: 24,
             ), */
        Expanded(
            child: Container(
          color: Colors.green,
        )),
        Expanded(
            child: Container(
          color: Colors.blue,
        )),
        const SizedBox(),
        const Text("This is a Drawer")
      ],
    );
  } */
