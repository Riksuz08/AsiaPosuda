import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class Site extends StatefulWidget {
  const Site({super.key});

  @override
  State<Site> createState() => _SiteState();
}

class _SiteState extends State<Site> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: WebViewWidget(controller: controller),
      );

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://flutter.dev'));
}
