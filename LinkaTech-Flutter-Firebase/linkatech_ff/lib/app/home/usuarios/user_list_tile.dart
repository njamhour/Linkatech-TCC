import 'package:flutter/material.dart';
import 'package:linkatech_ff/app/home/models/usuario.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({Key key, @required this.usuario, @required this.onTap})
      : super(key: key);
  final Usuario usuario;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(usuario.nome),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
