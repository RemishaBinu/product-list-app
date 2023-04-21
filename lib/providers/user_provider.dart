import 'package:flutter/material.dart';
import 'package:listing_app/services/user_service.dart';

class UserProvider extends ChangeNotifier {

  String? token;

  UserService userService;
  UserProvider({required this.userService});

  Future<bool> login(String username, String password) async {
    String? t = await userService.login(username, password);
    if(t == null){
      return false;
    }

    token = t;
    notifyListeners();
    return true;
  }

  logout(){
    token = null;
    notifyListeners();
  }

  getToken(){
    return token;
  }
}