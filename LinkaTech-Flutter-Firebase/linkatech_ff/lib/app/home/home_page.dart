// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkatech_ff/app/home/models/temp.dart';
import 'package:linkatech_ff/common_widgets/platform_alert_dialog.dart';
import 'package:linkatech_ff/common_widgets/platform_exception_alert_dialog.dart';
import 'package:linkatech_ff/services/auth.dart';
import 'package:linkatech_ff/services/database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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

  Future<void> _createTemp(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context);
      await database.createTemp(Temp(nome: 'Alberto', sobrenome: 'Silva'));
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Falha',
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
        onPressed: () => _createTemp(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context);
    return StreamBuilder<List<Temp>>(
      stream: database.tempsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final temps = snapshot.data;
          final children = temps.map((temp) => Text(temp.nome)).toList();
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
