import 'dart:convert';
import 'package:choison_shaju/api2/api2datamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api2 with ChangeNotifier {
  bool isLoading = false;
  List<Article>? api2articles = [];
  fetchapidata() async {
    isLoading = true;
    final uri = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-05-05&sortBy=publishedAt&apiKey=495c2b81698449fbb279dd821685a0e4");
    final response = await http.get(uri);
    if (response.statusCode == 200 && response.statusCode < 300) {
      var decoddata = jsonDecode(response.body);
      var apiresponse = News.fromJson(decoddata);
      api2articles = apiresponse.articles;
      print("e");
      isLoading = false;
      return api2articles;
    }
    notifyListeners();
  }
}
