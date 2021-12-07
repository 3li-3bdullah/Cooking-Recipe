import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
      title: const Text('Cooking Recipe'),
    ),
    body: Container(
      margin: const EdgeInsets.symmetric(horizontal:20,vertical:20),
      child: Column(children:[
        TextField(decoration: InputDecoration(
          border : OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor: Colors.green.withOpacity(0.4),
        ),)
      ]),
    )
    );
  }
}
