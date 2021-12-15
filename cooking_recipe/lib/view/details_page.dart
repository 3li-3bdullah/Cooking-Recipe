import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class DetailsPage extends StatelessWidget {
 
  String url;

     DetailsPage({required this.url});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ))
      
    );
  }
}