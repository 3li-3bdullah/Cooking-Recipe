import 'package:cooking_recipe/model/product.dart';
import 'package:cooking_recipe/view/details_page.dart';
import 'package:cooking_recipe/view/search_page.dart';
import 'package:cooking_recipe/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<HomeViewModel> {
  final hcontroller = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Cooking Recipe'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                onChanged: (value) {
                  controller.text = value;
                },
                decoration: InputDecoration(
                    hintText: "Search For Recipe",
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          Get.to(() => SearchPage(
                                search: controller.text,
                              ));
                        }),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: Colors.orange.shade300),
              )),
          FutureBuilder(
              future: controller.fetchData(),
              builder: (context, AsyncSnapshot<Model> snapshot) {
                Model? data = snapshot.data;
                if (snapshot.hasData) {
                  return SizedBox(
                    height: size.height,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: data!.hits!.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => DetailsPage(
                                  url: data.hits![i].url.toString()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          data.hits![i].image.toString()),
                                      fit: BoxFit.fill)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      height: 40,
                                      color: Colors.black.withOpacity(0.4),
                                      child: Center(
                                        child: Text(
                                            data.hits![i].label.toString(),
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      height: 40,
                                      color: Colors.black.withOpacity(0.5),
                                      child: Center(
                                        child: Text(
                                            "Source : " +
                                                data.hits![i].source.toString(),
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ),
                                    )
                                  ]),
                            ),
                          );
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ])));
  }
}
