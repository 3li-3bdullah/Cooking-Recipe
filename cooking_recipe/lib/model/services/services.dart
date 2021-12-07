import 'package:cooking_recipe/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Services {
  final url =
      'https://api.edamam.com/search?q=chicken&app_id=1bd5ac26&app_key=9cdd5f2c583a0ea0f1ad4a95773bc8f3&from=0&to=3&calories=591-722&health=alcohol-free';
  getApiData() async {
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((e) {
      Product product = Product(
        url : e['recipe']['uri'],
        image: e['recipe']['image'],
        source: e['recipe']['source']
      );
    });
  }
}
