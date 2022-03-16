import 'package:flutter/material.dart';

import '../../components/menu_list_tile.dart';
import '../../components/menus_title_lt.dart';
import '../../components/nav_drawer_widget.dart';
import '../menu_principal/menu_principal_page.dart';
import '../meus_tratamentos/meus_tratamentos_page.dart';
import '../minhas_contas/minhas_contas_page.dart';
import '../minhas_indicacoes/minhas_indicacoes_page.dart';
import '../preferencias_usuario/preferencias_usuario_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MenuLTSelected enumMenuLTSelected = MenuLTSelected.mainMenu;
  List<MenusTitleLT> menusTitleLT = [];
  // late BuildContext buildContext;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  Widget _navDrawe() {
    return NavDrawer(
        namePersonHeader: "Cesar Silva Peixoto", menusTitleLT: menusTitleLT);
  }

  String _titleAppBar() {
    switch (enumMenuLTSelected) {
      case MenuLTSelected.mainMenu:
        return "Menu Principal";
      case MenuLTSelected.myAppoitments:
        return "Meus Tratamentos";
      case MenuLTSelected.myBills:
        return "Minhas Contas";
      case MenuLTSelected.myInvantations:
        return "Minhas Indicações";
      case MenuLTSelected.userSettings:
        return "Preferências do Usuário";
    }
  }

  PreferredSizeWidget _pageAppBar() {
    return AppBar(
      title: Text(_titleAppBar()),
      actions: const [
        CircleAvatar(
          // radius: 15,
          child: Text(
            "C",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ),
        SizedBox(width: 16)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    menusTitleLT = [
      MenusTitleLT(title: "SERVIÇOS", menus: [
        MenuListTile(
            icon: const Icon(Icons.home),
            title: "Menu Principal",
            isSelected: enumMenuLTSelected.index == 0,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.mainMenu;
              _pageController.jumpToPage(enumMenuLTSelected.index);
              Navigator.pop(context);
            }),
        MenuListTile(
            icon: const Icon(Icons.paste),
            title: "Meus Tratamentos",
            isSelected: enumMenuLTSelected.index == 1,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.myAppoitments;
              _pageController.jumpToPage(enumMenuLTSelected.index);
              Navigator.pop(context);
            }),
        MenuListTile(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            title: "Minhas Contas",
            isSelected: enumMenuLTSelected.index == 2,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.myBills;
              _pageController.jumpToPage(enumMenuLTSelected.index);
              Navigator.pop(context);
            }),
        MenuListTile(
            icon: const Icon(Icons.groups_sharp),
            title: "Minhas Indicações",
            isSelected: enumMenuLTSelected.index == 3,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.myInvantations;
              _pageController.jumpToPage(enumMenuLTSelected.index);
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

    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        MenuPrincipalPage(pageAppBar: _pageAppBar(), navdrawer: _navDrawe()),
        MeusTratamentosPage(pageAppBar: _pageAppBar(), navdrawer: _navDrawe()),
        MinhasContasPage(pageAppBar: _pageAppBar(), navdrawer: _navDrawe()),
        MinhasIndicacoesPage(pageAppBar: _pageAppBar(), navdrawer: _navDrawe()),
        PreferenciasUsuarioPage(
            pageAppBar: _pageAppBar(), navdrawer: _navDrawe()),
      ],
    );
  }
}
