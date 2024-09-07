import 'package:cooking_recipe/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchPageViewModel extends GetxController {
  late String url;

  Future<Model> fetchData(String cSearch) async {
    url =
        "https://api.edamam.com/search?q=$cSearch&app_id=91919746&app_key=1ffacc6123a4c1ab558945b4963d2dff&from=0&to=100&calories=591-722&health=alcohol-free";

     http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
         Get.snackbar(
            'Cooking Recipes', 'Hey my friend, my favorite food is chicken. Did you know i am so excited to see your favorite food!',
            titleText: const Text(
              'Cooking Recipes',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),colorText: Colors.orange.shade400,
            messageText:Text('Hey my friend!, my favorite food is chicken. Did you know i am so excited to see your favorite food!'),
           icon: IconButton(
          onPressed: () {},
          icon: CircleAvatar(backgroundImage: AssetImage('assets/images/snakbar.jpg'),),
        ),duration: Duration(seconds: 3)
            );
      } catch (e) {
        Get.snackbar('Errors', e.toString());
      }
    }
    return Model.fromJson(jsonDecode(response.body));
  }
}
