import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mini_apps/common/const.dart';
import 'package:mini_apps/models/product_model.dart';

class ProductService {
  Future<List<Product>> getProduct(int limit, int skip) async {
    Response? response;
    try {
      response = await get(Uri.parse("$baseURL?limit=$limit&skip=$skip"))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode != 200) {
        return Future.error("Failed to fetch data product!");
      }

      return ProductResponse.fromJson(json.decode(response.body)).products;
    } catch (e) {
      if (kDebugMode) log("Error on getProduct() :: ${e.toString()}");
      return Future.error("error on getProduct() :: ${e.toString()}");
    }
  }
}

final ProductService productService = ProductService();
