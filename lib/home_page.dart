import 'package:flutter/material.dart';
import 'package:listing_app/model/product_model.dart';
import 'package:listing_app/product_edit_page.dart';
import 'package:listing_app/product_list_item.dart';
import 'package:listing_app/providers/product_provider.dart';
import 'package:listing_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Home',
                style: TextStyle(
                    color: Color.fromARGB(255, 8, 70, 121), fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox( height: 10, ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text("Logout"),
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false)
                    .logout();
                },
              ),
            ),
            const SizedBox( height: 10, ),
            Consumer<ProductProvider>(
              builder: (consumerContext, productProvider, child) {
                List<Product> products = productProvider.getAll();
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (BuildContext ccontext, int index) {
                    Product product = products[index];
                    return ProductListItem(
                      product: product,
                      onSelect: (product) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductEditPage(
                                    product: product,
                                  )),
                        );
                      },
                    );
                  },
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
