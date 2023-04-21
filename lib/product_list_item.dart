import 'package:flutter/material.dart';

import 'model/product_model.dart';

class ProductListItem extends StatelessWidget {
  Product product;
  Function(Product product) onSelect;
  ProductListItem({super.key, required this.product, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 158, 158, 158), width: 1))),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Image.network(product.thumbnail),
          ),
          const SizedBox(width: 10,),
          Expanded(
            flex: 1,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                product.title,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Text(
                '${product.price}',
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.left,
              )
            ]),
          ),
          InkWell(
            child: const Icon(Icons.edit),
            onTap: () {
              onSelect(product);
            },
          )
        ],
      ),
    );
  }
}
