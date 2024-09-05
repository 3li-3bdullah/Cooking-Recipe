import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipe/model/product.dart';
import 'package:cooking_recipe/view/details_page.dart';
import 'package:cooking_recipe/view_model/search_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
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
                text: TextSpan(
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    children: [
                  const TextSpan(
                      text: "Cooking",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  TextSpan(
                      text: "Recipes",
                      style: TextStyle(
                          fontSize: 18, color: Colors.orange.shade400)),
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
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: data.hits![i].image.toString(),
                              placeholder: (context, url) {
                                return Image.asset("assets/images/logo.png");
                              },
                              errorWidget: (context, url, error) {
                                return Image.asset("assets/images/logo.png");
                              },
                            ),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    height: 50,
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
                                ])
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                    child: CircularProgressIndicator(
                        color: Colors.orange.shade400));
              }
            }));
  }
}
