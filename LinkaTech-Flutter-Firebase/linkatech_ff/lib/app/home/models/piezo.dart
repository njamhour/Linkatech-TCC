import 'package:flutter/foundation.dart';

class Piezo {
  Piezo({
    @required this.id,
    @required this.usuarioId,
    @required this.valor,
  });
  String id;
  String usuarioId;
  String valor;

  factory Piezo.fromMap(Map<dynamic, dynamic> value, String id) {
    return Piezo(
      id: id,
      usuarioId: value['usuarioId'],
      valor: value['valor'],
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'usuarioId': usuarioId,
      'valor': valor,
    };
  }
}
