import 'package:flutter/foundation.dart';
import 'package:linkatech_ff/app/home/models/temp.dart';
import 'package:linkatech_ff/services/api_path.dart';
import 'package:linkatech_ff/services/firestore_service.dart';

abstract class Database {
  Future<void> createTemp(Temp temp);
  Stream<List<Temp>> tempsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  Future<void> createTemp(Temp temp) async => await _service.setData(
        path: APIPath.temp(uid, 'temporario_123'),
        data: temp.toMap(),
      );

  Stream<List<Temp>> tempsStream() => _service.collectionsStream(
      path: APIPath.temps(uid), builder: (data) => Temp.fromMap(data));
}
