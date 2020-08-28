import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:linka_tech/api_response.dart';
import 'package:linka_tech/usuario.dart';

class LoginApi {
  static Future<ApiResponse<Usuario>> login(
      String user, String password) async {
    try {
      var url = "http://192.168.100.12:8000/api-token-auth/";

      Map params = {'username': user, 'password': password};

      var body = json.encode(params);

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      print("${response.statusCode}");

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final usuario = Usuario.fromJson(mapResponse);
        return ApiResponse.ok(usuario);
      }

      return ApiResponse.error("Erro ao fazer o login");
    } catch (error, exception) {
      print("Erro:  $error > $exception");
      return ApiResponse.error("Erro de comunicação");
    }
  }
}
