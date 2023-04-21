import 'dart:convert';

import 'package:http/http.dart';
import 'package:listing_app/services/base_service.dart';

class UserService extends BaseService{

  Future<String?> login(String username, String password) async {
    Uri uri = getApiUri('auth/login');
    var headers = {
      'Content-Type': 'application/json'
    };
    Response response = await client.post(uri, headers: headers, body: jsonEncode({ 
      'username': username,
      'password': password,
    }));

    if (!isSuccess(response)) {
      return null;
    }
    
    Map<String, dynamic> map = getMap(response);
    if(!map.containsKey("token")){
      return null;
    }

    return map['token'];
  }
}