import 'package:cooking_recipe/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<HomeViewModel> {
  Home({Key? key}) : super(key: key);
  HomeViewModel xcontroller = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Cooking Recipe'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: Colors.green.withOpacity(0.4),
              ),
            ),
            const SizedBox(height: 20),
            GetX<HomeViewModel>(
              builder: (controller) => GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: controller.list.length,
                  itemBuilder: (context, i) {
                    final lengthData = controller.list[i];
                    return Column(children: [Card(child: Image.network(lengthData.image.toString()))]);
                  }),
            )
          ]),
        ));
  }
}
