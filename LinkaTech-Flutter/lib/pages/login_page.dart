import 'package:flutter/material.dart';
import 'package:linka_tech/alert.dart';
import 'package:linka_tech/api_response.dart';
import 'package:linka_tech/http_api.dart';
// import 'package:linka_tech/reset_password.dart';
// import 'package:linka_tech/signup.dart';

import 'package:linka_tech/home_page.dart';

class LoginPage extends StatelessWidget {
  final _tedLogin = TextEditingController();
  final _tedSenha = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(
          title: Text("TITLE - FAZER LOGIN"),
        ), */
        body: Padding(
      padding: EdgeInsets.only(top: 60, left: 40, right: 40),
      child: _body(context),
    ));
  }

  String _validaLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }
    return null;
  }

  String _validaSenha(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  _body(BuildContext context) {
    return Form(
      child: ListView(
        children: <Widget>[
          SizedBox(
            width: 128,
            height: 128,
            child: Image.asset("images/logo.png"),
          ),
          SizedBox(
            height: 20,
          ),
          textFormFieldLogin(),
          textFormFieldSenha(),
          containerButton(context)
        ],
      ),
    );
  }

  textFormFieldLogin() {
    return TextFormField(
      controller: _tedLogin,
      validator: _validaLogin,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          labelText: "Login",
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          hintText: "Informe o login"),
    );
  }

  textFormFieldSenha() {
    return TextFormField(
        controller: _tedSenha,
        validator: _validaSenha,
        obscureText: true,
        keyboardType: TextInputType.text,
        // style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 20),
            hintText: "Informe a senha"));
  }

  Container containerButton(BuildContext context) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 40.0),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
      child: FlatButton(
        color: Colors.black,
        child: Text("Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            )),
        onPressed: () {
          _onClickLogin(context);
        },
      ),
    );
  }

  _onClickLogin(BuildContext context) async {
    final login = _tedLogin.text;
    final senha = _tedSenha.text;

    print("Login: $login, Senha: $senha");

    ApiResponse response = await LoginApi.login(login, senha);

    if (response.ok) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      alert(context, "Erro no login");
    }

    /*if (!_formKey.currentState.validate()) {
      return;
    } */

    /*if (login.isEmpty || senha.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Erro"),
              content: Text("Login e/ou Senha inválido(s)"),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        },
      );
    }*/
  }
}
