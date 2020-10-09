import 'dart:async';

import 'package:linkatech_ff/app/home/models/usuario.dart';
import 'package:linkatech_ff/services/api_path.dart';
import 'package:linkatech_ff/services/firestore_service.dart';
import 'package:meta/meta.dart';

abstract class Database {
  Future<void> deleteUser(Usuario usuario);
  Future<void> setUser(Usuario usuario);
  Stream<List<Usuario>> usersStream();
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  Future<void> setUser(Usuario usuario) async => await _service.setData(
        path: APIPath.usuario(uid, usuario.id),
        data: usuario.toMap(),
      );

  Future<void> deleteUser(Usuario usuario) async => await _service.deleteData(
        path: APIPath.usuario(uid, usuario.id),
      );

  Stream<List<Usuario>> usersStream() => _service.collectionsStream(
      path: APIPath.usuarios(uid),
      builder: (data, documentId) => Usuario.fromMap(data, documentId));
}
