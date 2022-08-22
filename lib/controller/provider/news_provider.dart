import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../model/news_model.dart';
import '../services/api_controller.dart';

class NewsProvider extends ChangeNotifier {
  var isLoading = true;
  List<NewsModel> products = [];

  NewsProvider() {
    fetchData();
  }

  void fetchData() async {
    List<dynamic> _products = await API.getNews();
    List<NewsModel> temp = [];
    for (var product in _products) {
      NewsModel newProduct = NewsModel.fromJson(product);
      temp.add(newProduct);
    }

    products = temp;
    log(products.toString());
    isLoading = false;
    notifyListeners();
  }
}
