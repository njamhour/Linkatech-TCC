// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkatech_ff/app/home/models/usuario.dart';
import 'package:linkatech_ff/app/home/usuarios/edit_user_page.dart';
import 'package:linkatech_ff/app/home/usuarios/user_list_tile.dart';
import 'package:linkatech_ff/common_widgets/platform_alert_dialog.dart';
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

/*  Future<void> _createUser(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context);
      await database.setUser(User(nome: 'Alberto', sobrenome: 'Silva'));
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Falha',
        exception: e,
      ).show(context);
    }
  }
*/
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
        if (snapshot.hasData) {
          final users = snapshot.data;
          final children = users
              .map((usuario) => UserListTile(
                    user: usuario,
                    onTap: () => EditUserPage.show(context, usuario: usuario),
                  ))
              .toList();
          return ListView(children: children);
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erro não tratado ainda...'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
