import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:listing_app/home_page.dart';
import 'package:listing_app/providers/user_provider.dart';
import 'package:listing_app/services/user_service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: widget.usernameController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color.fromARGB(255, 174, 174, 174))),
                      hintText: 'User name'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: widget.passwordController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 174, 174, 174))),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      var username = widget.usernameController.text;
                      var password = widget.passwordController.text;
                      bool isLoggedIn = await Provider.of<UserProvider>(context, listen: false).login(username, password);
                      if(!isLoggedIn){
                        Fluttertoast.showToast(
                          msg: "Username or password is invalid",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                        );
                      }
                    },
                    child: const Text('Login'))
              ]),
        ),
      ),
    );
  }
}
