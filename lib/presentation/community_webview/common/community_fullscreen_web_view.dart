import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommunityFullScreenWebView extends StatefulWidget {
  final String url;
  final String communityUrl;
  final VoidCallback onClose;

  const CommunityFullScreenWebView({
    Key? key,
    required this.url,
    required this.communityUrl,
    required this.onClose,
  }) : super(key: key);

  @override
  _CommunityFullScreenWebViewState createState() => _CommunityFullScreenWebViewState();
}

class _CommunityFullScreenWebViewState extends State<CommunityFullScreenWebView> {
  WebViewController? _controller;
  bool isLoading = true;
  bool communityLoaded = false;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor( Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {

          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
            if (kDebugMode) print("CWeb onPageStarted: $url");
          },
          onPageFinished: (String url) {
            if (url.toLowerCase() == widget.communityUrl.toLowerCase()) {
              communityLoaded = true;
            }
            if (url.toLowerCase() == widget.url.toLowerCase()) {
              Future.delayed(const Duration(milliseconds: 2000), () {
                _controller!.loadRequest(Uri.parse(widget.communityUrl));
              });
            } else {
              setState(() {
                isLoading = false;
              });
              if (kDebugMode) print("CWeb onPageFinished: $url");
              // _controller!.runJavaScriptReturningResult(
              //   'document.cookie',
              // ).then((cookies) {
              //   print("cookie: $cookies");
              // });
            }
          },
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {
            if (kDebugMode) print("CWeb NavigationRequest: ${request.url}");
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange urlChange) {
            if (kDebugMode) print("CWeb onUrlChange: ${urlChange.url}");
            if (communityLoaded && (urlChange.url?.endsWith("/bookmarks") == true ||
              urlChange.url?.endsWith("/esplora") == true ||
              urlChange.url?.endsWith("/per-te") == true ||
              urlChange.url?.contains("/agenda") == true ||
              urlChange.url?.contains("/smart-learning") == true)) {
                context.pop();
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          if (_controller != null) WebViewWidget(controller: _controller!),
          if (isLoading)
            Center(child: CircularProgressIndicator(),),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            right: 24,
            child: SafeArea(
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  widget.onClose();
                  },
              ),
            ),
          ),
        ],
    );
  }
}
