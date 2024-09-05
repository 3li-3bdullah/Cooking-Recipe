import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipe/model/product.dart';
import 'package:cooking_recipe/view/details_page.dart';
import 'package:cooking_recipe/view/search_page.dart';
import 'package:cooking_recipe/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: RichText(
              text: TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                    text: "Cooking",
                    style: TextStyle(
                        fontSize: 20,
                        color:
                            // controller.mode.value
                            //  ? Colors.white
                            Colors.black)),
                TextSpan(
                    text: "Recipes",
                    style:
                        TextStyle(fontSize: 18, color: Colors.orange.shade400)),
              ])),
          // actions: [
          //   Obx(
          //     () => IconButton(
          //         onPressed: () {
          //           Get.defaultDialog(
          //               title: "Change Mode",
          //               titleStyle: TextStyle(
          //                   color: Colors.orange.shade400,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 20),
          //               content: Row(
          //                 children: const [
          //                   CircleAvatar(
          //                     backgroundImage:
          //                         AssetImage('assets/images/which.jpg'),
          //                   ),
          //                   Expanded(
          //                       child: Text(
          //                     " Sir, what mode do you like:",
          //                     style: TextStyle(fontSize: 17),
          //                   ))
          //                 ],
          //               ),
          //               textConfirm: "Light",
          //               onConfirm: () {
          //                 Get.changeTheme(ThemeData.light());
          //                 controller.mode.value = false;
          //                 return Get.back();
          //               },
          //               textCancel: "Dark",
          //               onCancel: () {
          //                 Get.changeTheme(ThemeData.dark());
          //                 controller.mode.value = true;
          //                 return Get.back();
          //               },
          //               buttonColor: Colors.orange.shade400);
          //         },
          //         icon: Icon(
          //           controller.mode.value ? Icons.dark_mode : Icons.wb_sunny,
          //           color: Colors.orange.shade400,
          //         )),
          //   )
          // ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          GetBuilder<HomeViewModel>(
            // init:HomeViewModel(),
            builder: (controller) => Card(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/search.png'),
                    ),
                    title: SizedBox(
                      height: 50,
                      child: TextField(
                        onChanged: (value) {
                          controller.text.value = value.trim();
                        },
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {
                                  Get.to(
                                      () => SearchPage(
                                            search: controller.text.value,
                                          ),
                                      transition: Transition.zoom);
                                }),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            filled: true,
                            fillColor: Colors.grey.shade300),
                      ),
                    ),
                  )),
            ),
          ),
          FutureBuilder(
              future: controller.fetchData(),
              builder: (context, AsyncSnapshot<Model> snapshot) {
                Model? data = snapshot.data;
                if (snapshot.hasData) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: data.hits![i].image.toString(),
                                    placeholder: (context, url) {
                                      return Image.asset(
                                          "assets/images/logo.png");
                                    },
                                    errorWidget: (context, url, error) {
                                       return Image.asset(
                                          "assets/images/logo.png");
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
                                                    data.hits![i].source
                                                        .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        )
                                      ])
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return SizedBox(
                    height: Get.height * 0.7,
                    width: Get.width,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.orange.shade400,
                    )),
                  );
                }
              }),
        ])));
  }
}
