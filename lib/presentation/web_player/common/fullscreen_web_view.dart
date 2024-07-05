
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullScreenWebView extends StatefulWidget {
  final String url;
  final VoidCallback onClose;

  const FullScreenWebView({
    Key? key,
    required this.url,
    required this.onClose,
  }) : super(key: key);

  @override
  _FullScreenWebViewState createState() => _FullScreenWebViewState();
}

class _FullScreenWebViewState extends State<FullScreenWebView> {
  WebViewController? _controller;
  bool isLoading = true;

  @override
  void initState() {

    // Map<String, dynamic> jsonMap = widget.sessionIdResponseModel.toJson();
    // String cookieValue = jsonEncode(jsonMap);

    // WebViewCookie cookie = WebViewCookie(name: "digitedUserLO", value: cookieValue, domain: "static.openlearning-test.digitedacademy.net");
    // WebViewCookieManager().setCookie(cookie).then((value) {
    //   _controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(const Color(0x00000000))
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {

    //       },
    //       onPageStarted: (String url) {
    //         setState(() {
    //           isLoading = true;
    //         });
    //       },
    //       onPageFinished: (String url) {
    //         setState(() {
    //           isLoading = false;
    //         });
    //         _controller!.runJavaScriptReturningResult(
    //           'document.cookie',
    //         ).then((cookies) {
    //           print("cookie: $cookies");
    //         });
            
    //       },
    //       onWebResourceError: (WebResourceError error) {

    //       },
    //       onNavigationRequest: (NavigationRequest request) {
    //         return NavigationDecision.navigate;
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse(widget.url));
    //   setState(() {
        
    //   });
    // });

    // Map<String, dynamic> jsonMap = widget.sessionIdResponseModel.toJson();
    // String cookieValue = jsonEncode(jsonMap);

    // Map<String, String> header = {'Cookie': 'digitedUserLO=$cookieValue'};
    // ,
    //   headers: header

    if (kDebugMode) print('opening webplayer url ${widget.url}');

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
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
            _controller!.runJavaScriptReturningResult(
              'document.cookie',
            ).then((cookies) {
              if (kDebugMode) print("cookie: $cookies");
            });
            
          },
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
  ]);
  }

  @override
  void dispose() async {
    super.dispose();
    _controller?.loadFlutterAsset("assets/webpage/empty.html");
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          if (_controller != null) WebViewWidget(controller: _controller!),
          if (isLoading)
            Center(child: CircularProgressIndicator(),),
        ],
    );
  }
}
