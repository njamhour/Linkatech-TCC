import 'package:flutter/material.dart';
import 'package:linkatech_ff/app/home/cuppertino_home_scaffold.dart';
import 'package:linkatech_ff/app/home/piezos/piezo_grafico.dart';
//import 'package:linkatech_ff/app/home/piezos/piezo_linhas.dart';
import 'package:linkatech_ff/app/home/piezos/piezo_linhas_chart.dart';
import 'package:linkatech_ff/app/home/piezos/piezo_mapa_calor.dart';
import 'package:linkatech_ff/app/home/piezos/piezo_pie.dart';
import 'package:linkatech_ff/app/home/tab_items.dart';
import 'package:linkatech_ff/app/home/usuarios/users_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.home;

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.linhas: GlobalKey<NavigatorState>(),
    TabItem.pie: GlobalKey<NavigatorState>(),
    TabItem.grafico: GlobalKey<NavigatorState>(),
    TabItem.calor: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.home: (_) => UsersPage(),
      // TabItem.linhas: (_) => PiezoLinhasChart(), //JobsPage(),
      TabItem.linhas: (_) => PiezoLinhasChart(),
      TabItem.pie: (context) => PiezoPie(), //EntriesPage.create(context),
      TabItem.grafico: (_) => PiezoGrafico(), // JobsPage(),
      TabItem.calor: (_) => PiezoMapaCalor(), // AccountPage(),
    };
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilders: widgetBuilders,
        navigatorKeys: navigatorKeys,
        enabled: true,
      ),
    );
  }
}
