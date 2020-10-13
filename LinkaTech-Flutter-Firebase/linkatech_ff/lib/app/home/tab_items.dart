import 'package:flutter/material.dart';

enum TabItem { home, linhas, pie, grafico, calor }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});
  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.home: TabItemData(title: 'Home', icon: Icons.home),
    TabItem.linhas: TabItemData(title: 'Linhas', icon: Icons.insert_chart),
    TabItem.pie: TabItemData(title: 'Pie', icon: Icons.pie_chart),
    TabItem.grafico: TabItemData(title: 'Grafico', icon: Icons.show_chart),
    TabItem.calor: TabItemData(title: 'Calor', icon: Icons.blur_linear),
  };
}
