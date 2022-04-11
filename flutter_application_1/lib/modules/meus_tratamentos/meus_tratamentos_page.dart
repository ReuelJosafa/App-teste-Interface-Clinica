import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/app_datas.dart';
import 'package:flutter_application_1/app_icons.dart';

import '../../components/appointment_types_widget.dart';

class MeusTratamentosPage extends StatefulWidget {
  final PreferredSizeWidget pageAppBar;
  final Widget navDrawer;
  const MeusTratamentosPage(
      {Key? key, required this.pageAppBar, required this.navDrawer})
      : super(key: key);

  @override
  State<MeusTratamentosPage> createState() => _MeusTratamentosPageState();
}

class _MeusTratamentosPageState extends State<MeusTratamentosPage> {
  bool _isExpanded = false;
  SelectPlans selectPlans = SelectPlans.plansInProgress;
  UniqueKey keyExpansionTile = UniqueKey();
  final pageController = PageController();

  Widget _testeListagem(
      {String title = "Planos em Andamento",
      required Color color,
      IconData icon = Icons.pending}) {
    return Padding(
      padding: const EdgeInsets.only(top: 58),
      child: AppointmentTypesWidget(
        planoHeader: title,
        color: color,
        iconHeader: icon,
        people: AppDatas.peopleTreatments,
      ),
    );
  }

  Widget _filterListTile(
      {required Color color,
      required IconData leadingIcon,
      required String plano,
      required bool isSelected,
      required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      minVerticalPadding: 20,
      leading: Icon(leadingIcon, size: 58, color: color),
      title: Text(plano, style: TextStyle(fontSize: 16, color: color)),
      trailing:
          isSelected ? const Icon(Icons.check, color: Colors.black) : null,
    );
  }

  void _shrinkTile() {
    setState(() {
      _isExpanded = false;
      keyExpansionTile = UniqueKey();
    });
  }

  void changePlano(SelectPlans newPlan) {
    _shrinkTile();
    selectPlans = newPlan;
    pageController.jumpToPage(selectPlans.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.pageAppBar,
      drawer: widget.navDrawer,
      body: Stack(
        children: [
          //TODO: retornar um sizedBox para as páginas que não contiverem informação.
          //Construir uma função para cada tópico.
          PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _testeListagem(color: AppColors.futures),
              _testeListagem(
                  title: "Planos Orçados",
                  color: AppColors.budgeted,
                  icon: Icons.paid_rounded),
              _testeListagem(
                  title: "Planos Concluídos",
                  color: AppColors.done,
                  icon: Icons.check_circle_rounded),
              _testeListagem(
                  title: "Planos Cancelados",
                  color: AppColors.canceled,
                  icon: Icons.cancel_rounded),
            ],
          ),
          _isExpanded
              ? Container(color: const Color.fromARGB(113, 158, 158, 158))
              : const SizedBox(),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[500]!,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1)),
                ]),
            child: ExpansionTile(
              key: keyExpansionTile,
              onExpansionChanged: (value) {
                setState(() {
                  _isExpanded = value;
                });
              },
              initiallyExpanded: _isExpanded,
              childrenPadding: const EdgeInsets.symmetric(vertical: 8),
              iconColor: Colors.black,
              textColor: Colors.black,
              leading: Icon(AppIcons.timeLine, size: 32, color: Colors.black),
              title: const Text("Filtrar lista",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              //TODO: retornar um sizedBox para as páginas que não contiverem informação.
              children: [
                _filterListTile(
                    color: AppColors.futures,
                    leadingIcon: Icons.pending,
                    plano: "Planos em Andamento",
                    isSelected: selectPlans == SelectPlans.plansInProgress,
                    onTap: () {
                      changePlano(SelectPlans.plansInProgress);
                    }),
                _filterListTile(
                    color: AppColors.budgeted,
                    leadingIcon: Icons.paid_rounded,
                    plano: "Planos Orçados",
                    isSelected: selectPlans == SelectPlans.budgetedPlans,
                    onTap: () {
                      changePlano(SelectPlans.budgetedPlans);
                    }),
                _filterListTile(
                    color: AppColors.done,
                    leadingIcon: Icons.check_circle_rounded,
                    plano: "Planos Concluídos",
                    isSelected: selectPlans == SelectPlans.donePlans,
                    onTap: () {
                      changePlano(SelectPlans.donePlans);
                    }),
                _filterListTile(
                    color: AppColors.canceled,
                    leadingIcon: Icons.cancel_rounded,
                    plano: "Planos Cancelados",
                    isSelected: selectPlans == SelectPlans.canceledPlans,
                    onTap: () {
                      changePlano(SelectPlans.canceledPlans);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum SelectPlans { plansInProgress, budgetedPlans, donePlans, canceledPlans }
