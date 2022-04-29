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

const _mainMenu = "Menu Principal";
const _myAppointmentsMenu = "Meus Tratamentos";
const _myBillsMenu = "Minhas Contas";
const _myInvatationsMenu = "Minhas Indicações";
const _userSettingsMenu = "Preferências do Usuário";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MenuLTSelected _enumMenuLTSelected = MenuLTSelected.mainMenu;
  List<MenusTitleLTWidget> _menusTitleLT = [];

  Widget _navDrawe() {
    //TODO: Trocar váriaveis referente ao nome e foto (se houver).
    String namePerson = "Cesar Silva";
    return NavDrawer(
      namePersonHeader: namePerson,
      menusTitleLT:
          _menusTitleLT, /* imagePersonHeader: const AssetImage('images/silvao.jpg'), */
    );
  }

  PreferredSizeWidget _pageAppBar() {
    String firstLetterName = "c";
    Color colorPerson = Colors.orange;

    String titleAppBar() {
      switch (_enumMenuLTSelected) {
        case MenuLTSelected.mainMenu:
          return _mainMenu;
        case MenuLTSelected.myAppoitments:
          return _myAppointmentsMenu;
        case MenuLTSelected.myBills:
          return _myBillsMenu;
        case MenuLTSelected.myInvantations:
          return _myInvatationsMenu;
        case MenuLTSelected.userSettings:
          return _userSettingsMenu;
      }
    }

    return AppBar(
      title: Text(titleAppBar()),
      actions: [
        CircleAvatar(
            child: Text(firstLetterName.toUpperCase(),
                style: const TextStyle(fontSize: 24, color: Colors.white)),
            backgroundColor: colorPerson),
        const SizedBox(width: 16)
      ],
    );
  }

  Widget _pagesWidget() {
    switch (_enumMenuLTSelected) {
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

  bool _isMenuSelected(MenuLTSelected menu) => _enumMenuLTSelected == menu;

  void _onSelectMenu(MenuLTSelected menu) {
    setState(() {});
    _enumMenuLTSelected = menu;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Atentar-se à permissão de acesso ao menu e navegação da tela.
    _menusTitleLT = [
      MenusTitleLTWidget(hasPermission: true, title: "SERVIÇOS", menus: [
        MenuListTileWiget(
            hasPermission: true,
            icon: Icon(AppIcons.home),
            title: _mainMenu,
            isSelected: _isMenuSelected(MenuLTSelected.mainMenu),
            onTap: () => _onSelectMenu(MenuLTSelected.mainMenu)),
        MenuListTileWiget(
            hasPermission: true,
            icon: Icon(AppIcons.treatments),
            title: _myAppointmentsMenu,
            isSelected: _isMenuSelected(MenuLTSelected.myAppoitments),
            onTap: () => _onSelectMenu(MenuLTSelected.myAppoitments)),
        MenuListTileWiget(
            hasPermission: true,
            icon: const Icon(Icons.account_balance_wallet_outlined),
            title: _myBillsMenu,
            isSelected: _isMenuSelected(MenuLTSelected.myBills),
            onTap: () => _onSelectMenu(MenuLTSelected.myBills)),
        MenuListTileWiget(
            hasPermission: true,
            icon: const Icon(Icons.groups_sharp),
            title: _myInvatationsMenu,
            isSelected: _isMenuSelected(MenuLTSelected.myInvantations),
            onTap: () => _onSelectMenu(MenuLTSelected.myInvantations)),
      ]),
      MenusTitleLTWidget(hasPermission: true, title: 'CONFIGURAÇÕES', menus: [
        MenuListTileWiget(
            hasPermission: true,
            icon: const Icon(Icons.settings),
            title: _userSettingsMenu,
            isSelected: _isMenuSelected(MenuLTSelected.userSettings),
            onTap: () => _onSelectMenu(MenuLTSelected.userSettings)),
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
    return _pagesWidget();

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
