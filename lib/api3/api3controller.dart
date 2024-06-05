import 'dart:convert';

import 'package:choison_shaju/api3/api3datamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api3 with ChangeNotifier {
  bool isLoading = false;
  List<Article>? api3articles = [];

  fetchapidata() async {
    isLoading = true;
    final uri = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-05-05&sortBy=publishedAt&apiKey=495c2b81698449fbb279dd821685a0e4");
    final response = await http.get(uri);
    if (response.statusCode == 200 && response.statusCode < 300) {
      var decodeddata = jsonDecode(response.body);
      var apiresponse = News.fromJson(decodeddata);
      api3articles = apiresponse.articles;
      return apiresponse;
    }
    isLoading = false;
  }
}
