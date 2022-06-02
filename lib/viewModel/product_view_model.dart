import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mini_apps/common/enum_state.dart';
import 'package:mini_apps/models/product_model.dart';
import 'package:mini_apps/services/product_service.dart';
import 'package:mini_apps/viewModel/base_view_model.dart';

class ProductViewModel extends BaseViewModel {
  List<Product> _products = [];
  List<Product> get products => _products;
  set productsChange(List<Product> products) {
    _products = products;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoadingChange(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> getProduct({int limit = 10, int skip = 10}) async {
    try {
      if (_products.isEmpty) stateChange = RequestState.loading;
      if (_products.isNotEmpty) isLoadingChange = true;

      final data = await productService.getProduct(limit, skip);
      productsChange = data;
      stateChange = RequestState.loaded;

      if (_products.isNotEmpty) isLoadingChange = false;
    } catch (e) {
      if (kDebugMode) log("Error on getProduct() :: ${e.toString()}");
      errMsgChange = e.toString();
      stateChange = RequestState.error;
    }
  }
}
