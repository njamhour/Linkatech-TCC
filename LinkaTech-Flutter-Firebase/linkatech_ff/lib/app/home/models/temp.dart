import 'package:flutter/foundation.dart';

class Temp {
  Temp({@required this.nome, @required this.sobrenome});
  final String nome;
  final String sobrenome;

  factory Temp.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String nome = data['nome'];
    final String sobrenome = data['sobrenome'];
    return Temp(nome: nome, sobrenome: sobrenome);
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'sobrenome': sobrenome,
    };
  }
}
