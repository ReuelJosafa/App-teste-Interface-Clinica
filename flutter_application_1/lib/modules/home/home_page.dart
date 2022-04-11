import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_icons.dart';

import '../../components/menu_list_tile_widget.dart';
import '../../components/menus_title_lt_widget.dart';
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
  List<MenusTitleLTWidget> _menusTitleLT = [];

  @override
  void initState() {
    super.initState();
  }

  Widget _navDrawe() {
    //TODO: Trocar váriaveis referente ao nome e foto (se houver).
    String namePerson = "Cesar Silva";
    return NavDrawer(
      namePersonHeader: namePerson,
      menusTitleLT:
          _menusTitleLT, /* imagePersonHeader: const AssetImage('images/silvao.jpg'), */
    );
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
    String firstLetterName = "c";
    Color colorPerson = Colors.orange;
    return AppBar(
      title: Text(_titleAppBar()),
      actions: [
        CircleAvatar(
            child: Text(
              firstLetterName.toUpperCase(),
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            backgroundColor: colorPerson),
        const SizedBox(width: 16)
      ],
    );
  }

  Widget _pageWidget() {
    switch (enumMenuLTSelected) {
      case MenuLTSelected.mainMenu:
        return MenuPrincipalPage(
            pageAppBar: _pageAppBar(), navDrawer: _navDrawe());
      case MenuLTSelected.myAppoitments:
        return MeusTratamentosPage(
            pageAppBar: _pageAppBar(), navDrawer: _navDrawe());
      case MenuLTSelected.myBills:
        return MinhasContasPage(
            pageAppBar: _pageAppBar(), navDrawer: _navDrawe());
      case MenuLTSelected.myInvantations:
        return MinhasIndicacoesPage(
            pageAppBar: _pageAppBar(), navDrawer: _navDrawe());
      case MenuLTSelected.userSettings:
        return PreferenciasUsuarioPage(
            pageAppBar: _pageAppBar(), navDrawer: _navDrawe());
    }
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Atentar-se à permissão de acesso ao menu e navegação da tela.
    _menusTitleLT = [
      MenusTitleLTWidget(hasPermission: true, title: "SERVIÇOS", menus: [
        MenuListTileWiget(
            hasPermission: true,
            icon: Icon(AppIcons.home),
            title: "Menu Principal",
            isSelected: enumMenuLTSelected.index == 0,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.mainMenu;
              // _pageController.jumpToPage(enumMenuLTSelected.index);
              Navigator.pop(context);
            }),
        MenuListTileWiget(
            hasPermission: true,
            icon: Icon(AppIcons.treatments),
            title: "Meus Tratamentos",
            isSelected: enumMenuLTSelected.index == 1,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.myAppoitments;
              // _pageController.jumpToPage(enumMenuLTSelected.index);
              Navigator.pop(context);
            }),
        MenuListTileWiget(
            hasPermission: true,
            icon: const Icon(Icons.account_balance_wallet_outlined),
            title: "Minhas Contas",
            isSelected: enumMenuLTSelected.index == 2,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.myBills;
              // _pageController.jumpToPage(enumMenuLTSelected.index);
              Navigator.pop(context);
            }),
        MenuListTileWiget(
            hasPermission: true,
            icon: const Icon(Icons.groups_sharp),
            title: "Minhas Indicações",
            isSelected: enumMenuLTSelected.index == 3,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.myInvantations;
              // _pageController.jumpToPage(enumMenuLTSelected.index);
              Navigator.pop(context);
            }),
      ]),
      MenusTitleLTWidget(hasPermission: true, title: 'CONFIGURAÇÕES', menus: [
        MenuListTileWiget(
            hasPermission: true,
            icon: const Icon(Icons.settings),
            title: "Preferências do Usuário",
            isSelected: enumMenuLTSelected.index == 4,
            onTap: () {
              setState(() {});
              enumMenuLTSelected = MenuLTSelected.userSettings;
              Navigator.pop(context);
            }),
      ]),
      MenusTitleLTWidget(hasPermission: true, title: 'PERFIL', menus: [
        MenuListTileWiget(
            hasPermission: true,
            icon: const Icon(Icons.power_settings_new),
            title: "Sair do Perfil",
            onTap: () {
              setState(() {});
              Navigator.pop(context);
            }),
      ])
    ];

    //TODO: Rever a questão da navegação para as próximas telas.
    return _pageWidget();

    /* PageView(
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
    ); */
  }
}

enum MenuLTSelected {
  mainMenu,
  myAppoitments,
  myBills,
  myInvantations,
  userSettings
}
