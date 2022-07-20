import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserPage extends StatefulWidget {
  final String? title;
  final String? url;
  const BrowserPage({
    Key? key,
    this.title,
    this.url,
  }) : super(key: key);

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  String? _initUrl;
  String? _title;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    dynamic argument = Get.arguments;
    if (argument is Map<String, dynamic>) {
      _initUrl = argument['url'];
      _title = argument['title'];
    }
    _initUrl ??= widget.url;
    _title ??= widget.title;
  }

  @override
  Widget build(BuildContext context) {
    print("----$_initUrl");
    return Scaffold(
      appBar: AppBar(
        title: Text(_title ?? ""),
      ),
      body: WebView(
        initialUrl: _initUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webController) {},
        onProgress: (int progress) {
          print("----web progress :  $progress----");
        },
        onPageStarted: (String url) {
          print("----onPageStarted---$url");
        },
        onPageFinished: (String url) {
          print("----onPageEnd----$url");
        },
        gestureNavigationEnabled: true,
        onWebResourceError: (WebResourceError error) {
          print("${error.errorCode} ,${error.description}");
        },
      ),
    );
  }
}
