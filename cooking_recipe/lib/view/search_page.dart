import 'package:cooking_recipe/model/product.dart';
import 'package:cooking_recipe/view/details_page.dart';
import 'package:cooking_recipe/view_model/search_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetWidget<SearchPageViewModel> {
  SearchPageViewModel scontroller = Get.put(SearchPageViewModel());

  String search;
  SearchPage({required this.search});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: RichText(
                text:  TextSpan(
                  style: const TextStyle(fontWeight:FontWeight.bold),
                  children: [
            const  TextSpan(
                  text: "Cooking",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              TextSpan(
                  text: "Recipes",
                  style: TextStyle(fontSize: 18, color: Colors.orange.shade400)),
            ]))),
        body: FutureBuilder(
            future: controller.fetchData(search),
            builder: (context, AsyncSnapshot<Model> snapshot) {
              Model? data = snapshot.data;
              if (snapshot.hasData) {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: data!.hits!.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Get.to(() =>
                              DetailsPage(url: data.hits![i].url.toString()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      data.hits![i].image.toString()),
                                  fit: BoxFit.fill)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  height: 40,
                                  color: Colors.black.withOpacity(0.5),
                                  child: Center(
                                    child: Text(
                                      data.hits![i].label.toString(),
                                    ),
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
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator(color:Colors.orange.shade400));
              }
            }));
  }
}
