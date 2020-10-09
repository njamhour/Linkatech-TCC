import 'package:flutter/foundation.dart';

class Usuario {
  Usuario({@required this.id, @required this.nome, @required this.sobrenome});
  final String id;
  final String nome;
  final String sobrenome;

  factory Usuario.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String nome = data['nome'];
    final String sobrenome = data['sobrenome'];
    return Usuario(
      id: documentId,
      nome: nome,
      sobrenome: sobrenome,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'sobrenome': sobrenome,
    };
  }
}
