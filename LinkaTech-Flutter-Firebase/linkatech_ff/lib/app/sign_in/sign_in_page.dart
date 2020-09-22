// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkatech_ff/app/sign_in/sign_in_button.dart';
import 'package:linkatech_ff/app/sign_in/social_sign_in_button.dart';
import 'package:linkatech_ff/services/auth.dart';
// import 'package:linkatech_ff/common_widgets/custom_raised_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  SignInPage({
    @required this.auth,
    // @required this.onSignIn,
  });
  // final Function(User) onSignIn;
  final AuthBase auth;

  Future<void> _signInAnonimo() async {
    try {
      await auth.signInAnonimo();
      // print('${authResult.user.uid}');
      // onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinkaTech'),
        elevation: 2.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      // color: Colors.yellow,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Acessar com:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Homologação',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _signInAnonimo,
          ),
        ],
      ),
    );
  }
}
