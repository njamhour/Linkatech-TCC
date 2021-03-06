/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkatech_ff/app/home/cuppertino_home_scaffold.dart';
import 'package:linkatech_ff/app/home/models/usuario.dart';
import 'package:linkatech_ff/services/database.dart';
import 'package:provider/provider.dart';

class PiezoEntriesPage extends StatelessWidget {
  const PiezoEntriesPage(
      {Key key, @required this.database, @required this.usuario})
      : super(key: key);
  final Database database;
  final Usuario usuario;

  static Future<void> show(BuildContext context, Usuario usuario) async {
    final Database database = Provider.of<Database>(context);
    await Navigator.of(context).push(CupertinoPageRoute(
      fullscreenDialog: false,
      builder: (context) =>
          PiezoEntriesPage(database: database, usuario: usuario),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Usuario>(
        stream: database.userStream(usuarioId: usuario.id),
        builder: (context, snapshot) {
          final usuario = snapshot.data;
          final usuarioNome = usuario?.nome ?? '';
          return Scaffold(
            appBar: AppBar(
              title: Text(usuarioNome),
            ),
            drawer: Drawer(
              child: CupertinoHomeScaffold(
              currentTab: _currentTab,
              onSelectTab: _select,
              widgetBuilders: widgetBuilders,
              navigatorKeys: navigatorKeys,
            ),
          );
        });
  }
}*/
