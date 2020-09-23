// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkatech_ff/common_widgets/platform_alert_dialog.dart';
import 'package:linkatech_ff/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({
    @required this.auth,
    // @required this.onSignOut,
  });
  // final VoidCallback onSignOut;
  final AuthBase auth;

  Future<void> _signOutAnonimo() async {
    try {
      // await FirebaseAuth.instance.signOut();
      await auth.signOut();
      // onSignOut();
      // print('${authResult.user.uid}');
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
      _signOutAnonimo();
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
    );
  }
}
