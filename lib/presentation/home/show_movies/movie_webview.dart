import 'package:flutter/material.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MovieWebViewScreen extends StatefulWidget {
  final String url, name;

  MovieWebViewScreen({required this.url, required this.name});

  @override
  _MovieWebViewScreenState createState() => _MovieWebViewScreenState();
}

class _MovieWebViewScreenState extends State<MovieWebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: AppTextStyles.largeTitleWhite22,
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
