import 'package:cooking_recipe/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  RxString text = "chicken".obs;
  RxBool mode = true.obs;

  Future<Model> fetchData() async {
    final response = await http.get(Uri.parse(
        "https://api.edamam.com/search?q=chicken&app_id=91919746&app_key=1ffacc6123a4c1ab558945b4963d2dff&from=0&to=100&calories=591-722&health=alcohol-free"));
    return Model.fromJson(jsonDecode(response.body));
  }
}
