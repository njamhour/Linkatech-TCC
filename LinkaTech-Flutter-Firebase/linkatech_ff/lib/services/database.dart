import 'dart:async';
//import 'dart:math';

//import 'package:linkatech_ff/app/home/models/piezo.dart';
import 'package:linkatech_ff/app/home/models/usuario.dart';
import 'package:linkatech_ff/services/api_path.dart';
import 'package:linkatech_ff/services/firestore_service.dart';
import 'package:meta/meta.dart';

abstract class Database {
  Future<void> deleteUser(Usuario usuario);
  Future<void> setUser(Usuario usuario);
  Stream<List<Usuario>> usersStream();
  Stream<Usuario> userStream({@required String usuarioId});
  // Stream<Piezo> piezoStream({String usuarioId});
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();
//String teste() => Random.secure().toString();

//String documentIdFromCurrentDate() =>
class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}); //: assert(uid != null);
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

  Stream<Usuario> userStream({@required String usuarioId}) =>
      _service.documentStream(
          path: APIPath.usuario(uid, usuarioId),
          builder: (data, documentId) => Usuario.fromMap(data, documentId));
}
