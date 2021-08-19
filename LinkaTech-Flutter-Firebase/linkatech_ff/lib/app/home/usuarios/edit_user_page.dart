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
  final List<String> _numeracao = [
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44"
  ];
  List<String> _tipo = [
    "Casual",
    "Profissional",
  ];
  List<String> _genero = [
    "Masculino",
    "Feminino",
    "Outros",
    "Prefiro não responder",
  ];
  String _nome;
  String _email;
  String _idade;
  String _altura;
  String _peso;
  var _generoVal;
  var _tipoVal;
  var _numeracaoVal;

  @override
  void initState() {
    super.initState();
    if (widget.usuario != null) {
      _nome = widget.usuario.nome;
      _email = widget.usuario.email;
      _generoVal = widget.usuario.genero;
      _idade = widget.usuario.idade;
      _numeracaoVal = widget.usuario.numeracao;
      _altura = widget.usuario.altura;
      _peso = widget.usuario.peso;
      _tipoVal = widget.usuario.tipo;
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
              email: _email,
              genero: _generoVal,
              idade: _idade,
              numeracao: _numeracaoVal,
              altura: _altura,
              peso: _peso,
              tipo: _tipoVal);
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
          TextButton(
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
        decoration: InputDecoration(labelText: 'Nome'),
        initialValue: _nome,
        validator: (value) =>
            value.isNotEmpty ? null : 'Nome não pode estar vazio',
        onSaved: (value) => _nome = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        initialValue: _email,
        validator: (value) =>
            value.isNotEmpty ? null : 'Email não pode estar vazio',
        onSaved: (value) => _email = value,
      ),
      DropdownButton<String>(
        hint: Text("Genêro"),
        value: _generoVal,
        isDense: true,
        onChanged: (newValue) {
          setState(() {
            _generoVal = newValue;
          });
          print(_generoVal);
        },
        items: _genero.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Idade'),
        initialValue: _idade,
        validator: (value) =>
            value.isNotEmpty ? null : 'Idade não pode estar vazio',
        onSaved: (value) => _idade = value,
      ),
      DropdownButton<String>(
        hint: Text("Numeração de calçado"),
        value: _numeracaoVal,
        isDense: true,
        onChanged: (newValue) {
          setState(() {
            _numeracaoVal = newValue;
          });
          print(_numeracaoVal);
        },
        items: _numeracao.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Altura'),
        initialValue: _altura,
        validator: (value) =>
            value.isNotEmpty ? null : 'Altura não pode estar vazio',
        onSaved: (value) => _altura = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Peso'),
        initialValue: _peso,
        validator: (value) =>
            value.isNotEmpty ? null : 'Peso não pode estar vazio',
        onSaved: (value) => _peso = value + ' KG',
      ),
      DropdownButton<String>(
        hint: Text("Casual ou Profissional?"),
        value: _tipoVal,
        isDense: true,
        onChanged: (newValue) {
          setState(() {
            _tipoVal = newValue;
          });
          print(_tipoVal);
        },
        items: _tipo.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ];
  }
}
