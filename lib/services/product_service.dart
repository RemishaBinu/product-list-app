import 'dart:convert';

import 'package:http/http.dart';
import 'package:listing_app/model/product_model.dart';
import 'package:listing_app/services/base_service.dart';

class ProductService extends BaseService{

  Future<List<Product>> getAll() async {
    Uri uri = getApiUri('products');
    var headers = {
      'Content-Type': 'application/json'
    };
    Response response = await client.get(uri, headers: headers);

    if (!isSuccess(response)) {
      return [];
    }
    
    Map<String, dynamic> map = getMap(response);
    if(!map.containsKey("products")){
      return [];
    }

    return (map['products'] as List<dynamic>)
      .map((e) => Product.fromMap(e))
      .toList();
  }

  Future<bool> update(int id, String title, double price, String thumbnail, String description) async {
    Uri uri = getApiUri('products/$id');
    var headers = {
      'Content-Type': 'application/json'
    };
    Response response = await client.put(uri, headers: headers, body: jsonEncode({ 
      'title': title,
      'price': price,
      'thumbnail': thumbnail,
      'description': description,
    }));

    if (!isSuccess(response)) {
      return false;
    }

    return true;
  }

}