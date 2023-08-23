import 'dart:convert';

import 'package:ecommerce_project/features/auth/models/api_response.dart';
import 'package:ecommerce_project/features/auth/models/auth_model.dart';
import 'package:http/http.dart' as http;


class LoginService {

  Future<ApiResponse> loginUser(AuthModel authModel) async {

    Uri uri = Uri.parse("https://reqres.in/api/login");

    final res = await http.post(uri,body: {
      "email": authModel.email,
      "password": authModel.password
    });

    if(res.statusCode == 200) {
      return ApiResponse(status: res.statusCode, message: "Success", data: jsonDecode(res.body));
    } else {
      return ApiResponse(status: res.statusCode, message: "failed", data: res.body);
    }
  }

}