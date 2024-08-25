import 'package:flutter/material.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChannelWebViewScreen extends StatefulWidget {
  final String url, name;

  ChannelWebViewScreen({required this.url, required this.name});

  @override
  _ChannelWebViewScreenState createState() => _ChannelWebViewScreenState();
}

class _ChannelWebViewScreenState extends State<ChannelWebViewScreen> {
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
