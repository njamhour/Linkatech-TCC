// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkatech_ff/app/home/models/usuario.dart';
import 'package:linkatech_ff/app/home/usuarios/edit_user_page.dart';
import 'package:linkatech_ff/app/home/usuarios/list_items_builder.dart';
import 'package:linkatech_ff/app/home/usuarios/user_list_tile.dart';
import 'package:linkatech_ff/common_widgets/platform_alert_dialog.dart';
import 'package:linkatech_ff/common_widgets/platform_exception_alert_dialog.dart';
import 'package:linkatech_ff/services/auth.dart';
import 'package:linkatech_ff/services/database.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  Future<void> _signOutAnonimo(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Sair',
      content: 'Confirma logoff?',
      cancelActionText: 'Cancelar',
      defaultActionText: 'Sair',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOutAnonimo(context);
    }
  }

  Future<void> _delete(BuildContext context, Usuario usuario) async {
    try {
      final database = Provider.of<Database>(context);
      await database.deleteUser(usuario);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Erro',
        exception: e,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Sair',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => EditUserPage.show(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context);
    return StreamBuilder<List<Usuario>>(
      stream: database.usersStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<Usuario>(
          snapshot: snapshot,
          itemBuilder: (context, usuario) => Dismissible(
            key: Key('usuario-${usuario.id}'),
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) => _delete(context, usuario),
            child: UserListTile(
              usuario: usuario,
              onTap: () => EditUserPage.show(context, usuario: usuario),
            ),
          ),
        );
      },
    );
  }
}
