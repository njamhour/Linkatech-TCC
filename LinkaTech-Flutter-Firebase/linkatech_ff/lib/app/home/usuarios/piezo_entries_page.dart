import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkatech_ff/app/home/models/usuario.dart';
import 'package:linkatech_ff/services/database.dart';
import 'package:provider/provider.dart';

import 'edit_user_page.dart';

class PiezoEntriesPage extends StatelessWidget {
  const PiezoEntriesPage(
      {Key key, @required this.database, @required this.usuario})
      : super(key: key);
  final Database database;
  final Usuario usuario;

  static Future<void> show(BuildContext context, Usuario usuario) async {
    final Database database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: false,
        builder: (context) =>
            PiezoEntriesPage(database: database, usuario: usuario),
      ),
    );
  }

  Widget build(BuildContext context) {
    return StreamBuilder<Usuario>(
        stream: database.userStream(usuarioId: usuario.id),
        builder: (context, snapshot) {
          final usuario = snapshot.data;
          final usuarioNome = usuario?.nome ?? '';
          return Scaffold(
            appBar: AppBar(
              elevation: 2.0,
              title: Text(usuarioNome),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white),
                  onPressed: () =>
                      EditUserPage(database: database, usuario: usuario),
                ),
              ],
            ),
            body: Center(
              child: ListView(
                children: <Widget>[
                  Text('Nome: ' + usuario.nome),
                  Text('Idade: ' + usuario.idade),
                  Text('Email: ' + usuario.email),
                  Text('Altura: ' + usuario.altura),
                  Text('Genero: ' + usuario.genero),
                  Text('Peso: ' + usuario.peso),
                  Text('Tipo:' + usuario.tipo),
                  Text('Numeração: ' + usuario.numeracao),
                ],
              ),
            ),
            //Center(child: Column(children: <Widget>[Text(usuario.altura)],),)
          );
        });
  }
}
