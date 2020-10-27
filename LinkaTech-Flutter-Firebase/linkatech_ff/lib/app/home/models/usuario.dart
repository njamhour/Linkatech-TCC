import 'package:flutter/foundation.dart';

class Usuario {
  Usuario(
      {@required this.id,
      @required this.nome,
      @required this.idade,
      @required this.email,
      @required this.genero,
      @required this.numeracao,
      @required this.altura,
      @required this.peso,
      @required this.tipo});
  final String id;
  final String nome;
  final String email;
  final String genero;
  final String numeracao;
  final String idade;
  final String altura;
  final String peso;
  final String tipo;

  factory Usuario.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String nome = data['nome'];
    final String email = data['email'];
    final String genero = data['genero'];
    final String idade = data['idade'];
    final String numeracao = data['numeracao'];
    final String altura = data['altura'];
    final String peso = data['peso'];
    final String tipo = data['tipo'];
    return Usuario(
        id: documentId,
        nome: nome,
        email: email,
        genero: genero,
        numeracao: numeracao,
        idade: idade,
        altura: altura,
        peso: peso,
        tipo: tipo);
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'genero': genero,
      'numeracao': numeracao,
      'idade': idade,
      'altura': altura,
      'peso': peso,
      'tipo': tipo,
    };
  }
}
