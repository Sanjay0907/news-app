import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'apis_and_headers.dart';

class API {
  static Future getNews() async {
    try {
      var response = await http.get(productUrl, headers: {
        'Content-Type': 'application/json'
      }).timeout(const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException('Connection Timed out');
      });
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        log(decodedResponse.toString());
        List<dynamic> products = decodedResponse['articles'] as List<dynamic>;
        return products;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
