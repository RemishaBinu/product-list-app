import 'package:flutter/material.dart';
import 'package:listing_app/model/product_model.dart';
import 'package:listing_app/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  final ProductService productService;
  
  ProductProvider({required this.productService});

  getAll(){
    return products;
  }

  loadProducts() async {
    products = await productService.getAll();
    notifyListeners();
  }

  Future<bool> updateProduct(int id, String title, double price, String thumbnail, String description) async{
    bool isSuccess = await productService.update(id, title, price, thumbnail, description);
    if(isSuccess){
      loadProducts();
    }

    return isSuccess;
  }
}