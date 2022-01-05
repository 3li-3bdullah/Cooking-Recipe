import 'package:cooking_recipe/view_model/home_view_model.dart';
import 'package:get/get.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeViewModel());
  }
}
