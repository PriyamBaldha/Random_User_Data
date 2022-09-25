import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserAPI {
  UserAPI._();

  static final UserAPI userAPI = UserAPI._();

  Future<User?> fetchUserAPI() async {
    String url = "https://randomuser.me/api/";

    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      User user = User.fromJSON(json: decodedData);
      return user;
    }
    return null;
  }
}
