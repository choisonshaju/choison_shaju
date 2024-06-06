import 'dart:convert';
import 'package:choison_shaju/Person/person_datamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Person with ChangeNotifier {
  bool isLoading = false;
  List<Datum>? personarticles = [];
  fetchapidata() async {
    isLoading = true;

    final uri = Uri.parse("https://reqres.in/api/users?20240605214943");
    final response = await http.get(uri);

    if (response.statusCode == 200 && response.statusCode < 300) {
      var decoddata = jsonDecode(response.body);
      var apiresponse = Names.fromJson(decoddata);
      personarticles = apiresponse.data;

      isLoading = false;
      return personarticles;
    }
    notifyListeners();
  }
}
