import 'package:cooking_recipe/binding/my_binding.dart';
import 'package:cooking_recipe/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      theme: ThemeData.dark(),
      title: 'Cooking Recipe',
      home: Home(),
    );
  }
}
