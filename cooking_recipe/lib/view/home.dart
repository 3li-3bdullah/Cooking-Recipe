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
          title: RichText(
              text: TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: [
                 TextSpan(
                    text: "Cooking",
                    style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: "Recipes",
                    style:
                        TextStyle(fontSize: 18, color: Colors.orange.shade400)),
              ])),
          actions: [
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Change Mode",
                      titleStyle: TextStyle(
                          color: Colors.orange.shade400,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                          content: Row(children: const  [
                             CircleAvatar(backgroundImage: AssetImage('assets/images/which.jpg'),),
                            Expanded(child: Text(' Sir, what mode do you like :' , style: TextStyle(fontSize: 17),))
                          ],),
                      textConfirm: "Light",
                      onConfirm: () {
                        Get.changeTheme(ThemeData.light());
                        Get.back();
                      },
                      textCancel: "Dark",
                      onCancel: () {
                        Get.changeTheme(ThemeData.dark());
                        Get.back();
                      },
                      buttonColor: Colors.orange.shade400);
                },
                icon: Icon(
                  Icons.wb_sunny,
                  color: Colors.orange.shade400,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          GetBuilder<HomeViewModel>(
            builder: (controller) => Card(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child:ListTile(
                        leading: CircleAvatar(backgroundImage: AssetImage('assets/images/search.png'),),
                        title:  TextField(
                              onChanged: (value) {
                                controller.text.value = value.trim();
                              },
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                                  
                                  suffixIcon: IconButton(
                                      icon: const Icon(Icons.search),
                                      onPressed: () {
                                        Get.to(() => SearchPage(
                                              search: controller.text.value,
                                            ));
                                      }),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                      focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),borderSide:const BorderSide(color: Colors.green)  
                                      ),
                                  filled: true,
                                  fillColor: Colors.orange.shade300),
                            ),
                      )
                  ),
            ),
          ),
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
