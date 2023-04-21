import 'package:flutter/material.dart';
import 'package:listing_app/home_page.dart';
import 'package:listing_app/providers/product_provider.dart';
import 'package:listing_app/providers/user_provider.dart';
import 'package:listing_app/services/product_service.dart';
import 'package:listing_app/services/user_service.dart';
import 'package:provider/provider.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider(userService: UserService())),
          ChangeNotifierProvider(create: (_) => ProductProvider(productService: ProductService())
            ..loadProducts()
          )
        ],
        child: Container(
          child: Consumer<UserProvider>(builder: (context, userProvider, child) {
            String? token = userProvider.getToken();
            return (token != null && token.isNotEmpty) ? const HomePage(): Login();
          },),
        ),
      ),
    );
  }
}
























































class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(),
    );
  }
}
