import 'dart:convert';
import 'package:cooking_recipe/model/services/services.dart';
import 'package:http/http.dart' as http;
import 'package:cooking_recipe/model/product.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  RxList<Product> list = <Product>[].obs;
  RxBool isShow = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isShow(true);
      var fetch = await Services.getApiData();
      list.value = fetch;
    } finally {
      isShow(false);
    }
  }

  // static String url =
  //     'https://api.edamam.com/search?q=chicken&app_id=1bd5ac26&app_key=9cdd5f2c583a0ea0f1ad4a95773bc8f3&from=0&to=100&calories=591-722&health=alcohol-free';
  // static getApiData() async {
  //   isShow(true);
  //   var response = await http.get(Uri.parse(url));
  //   Map json = jsonDecode(response.body);
  //   json['hits'].forEach((e) {
  //     Product product = Product(
  //         url: e['recipe']['uri'],
  //         image: e['recipe']['image'],
  //         source: e['recipe']['source'],
  //         label: e['recipe']['label']);

  //   });
  // }
}
