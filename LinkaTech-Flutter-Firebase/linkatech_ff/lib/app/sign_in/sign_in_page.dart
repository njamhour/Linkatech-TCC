// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkatech_ff/app/sign_in/email_sign_in_page.dart';
import 'package:linkatech_ff/app/sign_in/sign_in_manager.dart';
import 'package:linkatech_ff/app/sign_in/sign_in_button.dart';
import 'package:linkatech_ff/app/sign_in/social_sign_in_button.dart';
import 'package:linkatech_ff/common_widgets/platform_exception_alert_dialog.dart';
import 'package:linkatech_ff/services/auth.dart';
import 'package:provider/provider.dart';
// import 'package:linkatech_ff/common_widgets/custom_raised_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key key,
    @required this.manager,
    @required this.isLoading,
  }) : super(key: key);
  final SignInManager manager;
  final bool isLoading;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (context, manager, _) => SignInPage(
              manager: manager,
              isLoading: isLoading.value,
            ),
          ),
        ),
      ),
    );
  }

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(
      title: 'Erro de acesso',
      exception: exception,
    ).show(context);
  }

  /*Future<void> _signInAnonimo(BuildContext context) async {
    try {
      await manager.signInAnonimo();
    } on PlatformException catch (e) {
      _showSignInError(context, e);
    }
  }*/

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  /*Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await manager.signInWithFacebook();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }*/

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinkaTech'),
        elevation: 2.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey,
    );
  }

  //@override
  Widget _buildContent(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(height: 24.0),
            Text('Acesso:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                )),
            SizedBox(height: 24.0),
            SocialSignInButton(
              assetName: 'images/google-logo.png',
              text: 'Google',
              textColor: Colors.black87,
              color: Colors.grey[200],
              onPressed: isLoading ? null : () => _signInWithGoogle(context),
            ),
            SizedBox(height: 8.0),
            SignInButton(
              text: 'Email',
              textColor: Colors.white,
              color: Colors.blueGrey,
              onPressed: isLoading ? null : () => _signInWithEmail(context),
            ),
          ],
        ),
      ),
    );
  }
}
