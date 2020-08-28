import 'dart:async';

import 'package:flutter_rest_test/models/user.dart';
import 'package:flutter_rest_test/utils/network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  // ignore: non_constant_identifier_names
  static final BASE_URL = "http://192.168.100.12:8000";
  // ignore: non_constant_identifier_names
  static final LOGIN_URL = BASE_URL + "/api-token-auth/";
  // ignore: non_constant_identifier_names
  static final _API_KEY = "36320f2fd905f11876365d15f60163674341c248";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "token": _API_KEY,
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if (res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}
