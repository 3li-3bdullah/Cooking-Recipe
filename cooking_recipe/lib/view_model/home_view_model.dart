import 'package:cooking_recipe/model/product.dart';
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
  
  Future<Model> fetchData() async {
    final response = await http.get(Uri.parse("https://api.edamam.com/search?q=chicken&app_id=1bd5ac26&app_key=9cdd5f2c583a0ea0f1ad4a95773bc8f3&from=0&to=100&calories=591-722&health=alcohol-free"));

    if (response.statusCode == 200) {
      try {
        Get.snackbar('Cooking Recipes', 'Good luck and wish you enjoy with most beautiful cooking recipes.');
      } catch (e) {
        Get.snackbar('Errors', e.toString());
      }
    }
    return Model.fromJson(jsonDecode(response.body));
  }
}
