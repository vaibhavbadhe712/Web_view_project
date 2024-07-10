import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';  // ADD
import 'package:webview_in_flutter/src/menu.dart';
import 'package:webview_in_flutter/src/navigation_controller.dart';

import 'src/web_view_stack.dart';

//https://codelabs.developers.google.com/codelabs/flutter-webview#11 // this  project like though create 

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  // Add from here...
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }
  // ...to here.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
        // Add from here...
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller),               // ADD

        ],
        // ...to here.
      ),
      body: WebViewStack(controller: controller),       // MODIFY
    );
  }
}