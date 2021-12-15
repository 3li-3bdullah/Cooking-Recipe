import 'package:cooking_recipe/model/product.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchPageViewModel extends GetxController {
  late String url;

  Future<Model> fetchData(String cSearch) async {
    url =
        "https://api.edamam.com/search?q=$cSearch&app_id=1bd5ac26&app_key=9cdd5f2c583a0ea0f1ad4a95773bc8f3&from=0&to=100&calories=591-722&health=alcohol-free";

     http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        Get.snackbar('Cooking Recipe', 'Have a beautiful day .');
      } catch (e) {
        Get.snackbar('Errors', e.toString());
      }
    }
    return Model.fromJson(jsonDecode(response.body));
  }
}
