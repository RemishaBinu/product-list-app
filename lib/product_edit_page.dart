import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:listing_app/home_page.dart';
import 'package:listing_app/model/product_model.dart';
import 'package:listing_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductEditPage extends StatefulWidget {
  Product product;

  final TextEditingController title = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController thumbnail = TextEditingController();

  ProductEditPage({super.key, required this.product});
  @override
  State<StatefulWidget> createState() {
    return ProductEditPageState();
  }
}

class ProductEditPageState extends State<ProductEditPage> {
  @override
  void initState() {
    widget.title.text = widget.product.title;
    widget.price.text = '${widget.product.price}';
    widget.description.text = widget.product.description;
    widget.thumbnail.text = widget.product.thumbnail;
    super.initState();
  }
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
                'Product edit',
                style: TextStyle(
                    color: Color.fromARGB(255, 8, 70, 121), fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Products",
              style: TextStyle(fontSize: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: widget.title,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 174, 174, 174))),
                      hintText: 'Product title'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: widget.price,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 174, 174, 174))),
                      hintText: 'Price'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: widget.description,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 174, 174, 174))),
                      hintText: 'Description'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: widget.thumbnail,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 174, 174, 174))),
                      hintText: 'thumbnail'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          bool isSuccess = await Provider.of<ProductProvider>(
                                  context,
                                  listen: false)
                              .updateProduct(
                                  widget.product.id,
                                  widget.title.text,
                                  double.parse(widget.price.text),
                                  widget.thumbnail.text,
                                  widget.description.text);
                          String message = isSuccess
                              ? "Updated successfully"
                              : "Cannot update now, try again";
                          Fluttertoast.showToast(
                              msg: message,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              fontSize: 16.0);
                          if(isSuccess){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (ccontext) => HomePage()),
                            );
                          }
                        },
                        child: const Text('Save changes')),
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
