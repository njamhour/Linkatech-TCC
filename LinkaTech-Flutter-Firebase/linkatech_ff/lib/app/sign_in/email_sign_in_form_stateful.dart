import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkatech_ff/app/sign_in/email_sign_in_model.dart';
import 'package:linkatech_ff/app/sign_in/validators.dart';
import 'package:linkatech_ff/common_widgets/form_submit_button.dart';
import 'package:linkatech_ff/common_widgets/platform_exception_alert_dialog.dart';
import 'package:linkatech_ff/services/auth.dart';
import 'package:provider/provider.dart';

class EmailSignInFormStateful extends StatefulWidget
    with EmailAndPasswordValidators {
  @override
  _EmailSignInFormStatefulState createState() =>
      _EmailSignInFormStatefulState();
}

class _EmailSignInFormStatefulState extends State<EmailSignInFormStateful> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  bool _submitted = false;
  bool _isLoading = false;

  @override
  void dispose() {
    // print('dispose executado');
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  // String email;

  Future<void> _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context);
      // await Future.delayed(Duration(seconds: 3)); // Debug LAG
      if (_formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await auth.createUserInWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      // print(e.toString());
      PlatformExceptionAlertDialog(
        title: 'Falha ao acessar',
        exception: e,
      ).show(context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    // print(email);
    // print(
    //    'email: ${_emailController.text}, password: ${_passwordController.text}')
  }

  void _emailEditingComplete() {
    //print('email completo');
    final newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(
        newFocus); // Passa para o outro campo com o "ok" do teclado
  }

  void _toggleFormType() {
    setState(() {
      _submitted = false;
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText =
        _formType == EmailSignInFormType.signIn ? 'Entrar' : 'Criar uma conta';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Precisa de uma conta? Registre-se'
        : 'Já tem uma conta? Acesse';

    // bool submitEnabled = _email.isNotEmpty && _password.isEmpty;
    // se os campos estão vazios, desabilita o submit

    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        !_isLoading;

    return [
      _buildEmailTextField(),
      SizedBox(height: 8.0),
      _buildPasswordTextField(),
      SizedBox(height: 8.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
      ),
      SizedBox(height: 8.0),
      FlatButton(
        child: Text(secondaryText),
        onPressed: !_isLoading ? _toggleFormType : null,
      )
    ];
  }

  TextField _buildPasswordTextField() {
    bool showErrorText =
        _submitted && widget.passwordValidator.isValid(_password);
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'Senha',
        enabled: _isLoading == false,
        errorText: showErrorText ? widget.invalidPasswordErrorText : null,
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      // Quando insere a senha, ele trava o submit
      onChanged: (_password) => _updateState(),
      onEditingComplete: _submit,
    );
  }

  TextField _buildEmailTextField() {
    bool showErrorText = _submitted && widget.emailValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'email@dominio.com',
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
        enabled: _isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      // Quando insere a senha, ele trava o submit
      onChanged: (_email) => _updateState(),
      onEditingComplete: _emailEditingComplete,
      // onChanged: (value) => email = value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }

  void _updateState() {
    setState(() {});
  }
}
