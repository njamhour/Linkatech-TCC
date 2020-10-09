import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkatech_ff/app/home/models/usuario.dart';
import 'package:linkatech_ff/common_widgets/platform_alert_dialog.dart';
import 'package:linkatech_ff/common_widgets/platform_exception_alert_dialog.dart';
import 'package:linkatech_ff/services/database.dart';
import 'package:provider/provider.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({Key key, @required this.database, this.usuario})
      : super(key: key);
  final Database database;
  final Usuario usuario;

  static Future<void> show(BuildContext context, {Usuario usuario}) async {
    final database = Provider.of<Database>(context);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditUserPage(
          database: database,
          usuario: usuario,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final _formKey = GlobalKey<FormState>();
  String _nome;
  String _sobrenome;

  @override
  void initState() {
    super.initState();
    if (widget.usuario != null) {
      _nome = widget.usuario.nome;
      _sobrenome = widget.usuario.sobrenome;
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      try {
        final users = await widget.database.usersStream().first;
        final allUsers = users.map((user) => user.nome).toList();
        if (widget.usuario != null) {
          allUsers.remove(widget.usuario.nome);
        }
        if (allUsers.contains(_nome)) {
          PlatformAlertDialog(
            title: 'Usuario já existe',
            content: 'Escolha outro nome',
            defaultActionText: 'OK',
          ).show(context);
        } else {
          final id = widget.usuario?.id ?? documentIdFromCurrentDate();
          final user = Usuario(
            id: id,
            nome: _nome,
            sobrenome: _sobrenome,
          );
          await widget.database.setUser(user);
          Navigator.of(context).pop();
        }
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(
          title: 'Erro na operação',
          exception: e,
        ).show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.usuario == null ? 'Novo Usuario' : 'Editar Usuario'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Salvar',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: _submit,
          ),
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Nome do usuario'),
        initialValue: _nome,
        validator: (value) =>
            value.isNotEmpty ? null : 'Nome não pode estar vazio',
        onSaved: (value) => _nome = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Sobrenome'),
        initialValue: _sobrenome,
        validator: (value) =>
            value.isNotEmpty ? null : 'Sobrenome não pode estar vazio',
        onSaved: (value) => _sobrenome = value,
      )
    ];
  }
}
