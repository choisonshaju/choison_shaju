import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:choison_shaju/news/newsdatamodel.dart';

class news with ChangeNotifier {
  bool isLoading = false;
  List<Article>? newsarticles = [];
  fetchapidata() async {
    isLoading = true;
    final uri = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-05-05&sortBy=publishedAt&apiKey=495c2b81698449fbb279dd821685a0e4");
    final response = await http.get(uri);
    if (response.statusCode == 200 && response.statusCode < 300) {
      var decoddata = jsonDecode(response.body);
      var apiresponse = News.fromJson(decoddata);
      newsarticles = apiresponse.articles;
      print("e");
      isLoading = false;
      return newsarticles;
    }
    notifyListeners();
  }
}
