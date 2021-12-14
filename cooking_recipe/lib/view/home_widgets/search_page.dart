import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
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
                          Get.to(() => SearchPage());
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
                              Get.to(() => DetailsPage(url: controller.url));
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
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ])));
  }
}
