import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class FullScreenWebView extends StatefulWidget {
  final String url;
  final VoidCallback onClose;

  const FullScreenWebView({
    super.key,
    required this.url,
    required this.onClose,
  });

  @override
  _FullScreenWebViewState createState() => _FullScreenWebViewState();
}

class _FullScreenWebViewState extends State<FullScreenWebView> {
  WebViewController? _controller;
  bool isLoading = true;

  int posX = 325;
  int posY = 300;
  bool topScrollBar = false;
  bool botttomScrollBar = false;

  handleKey(KeyEvent key, BuildContext context) {
    if (key is KeyDownEvent || key is KeyRepeatEvent) {
      moveInDirection(key);
    }
  }

  void moveInDirection(KeyEvent key) {
    double height = 1080;
    double width = 1920;

    switch (key.logicalKey.keyLabel) {
      case 'Arrow Up': //up
        setState(() {
          posY -= 5;
          if (posY < 0) {
            posY = 0;
          }
        });
        break;
      case 'Arrow Right': //right
        setState(() {
          posX += 5;
          if (posX > width) {
            posX = width.toInt();
          }
        });
        break;
      case 'Arrow Down': //down
        setState(() {
          posY += 5;
          if (posY > height) {
            posY = height.toInt();
          }
        });
        break;
      case 'Arrow Left': //left
        setState(() {
          posX -= 5;
          if (posX < 0) {
            posX = 0;
          }
        });
        break;
      case 'Enter': //OK
      case 'Select': //OK
        // WidgetsBinding.instance.handlePointerEvent(PointerDownEvent(
        //   pointer: 0,
        //   position: Offset(posX.toDouble(), posY.toDouble()),
        // ));
        // WidgetsBinding.instance.handlePointerEvent(PointerUpEvent(
        //   pointer: 0,
        //   position: Offset(posX.toDouble(), posY.toDouble()),
        // ));

        tap(posX.toDouble(), posY.toDouble());

        // _controller?.runJavaScript("""
        //     var cb = document.elementFromPoint($posX,$posY);
        //     cb.click();
        //     cb.focus();
        //     """);
        break;
    }

    // if (posY < 5) {
    //   setState(() {
    //     topScrollBar = true;
    //   });
    //   _controller?.scrollBy(0, -20);
    // } else if (posY > height - 5) {
    //   setState(() {
    //     botttomScrollBar = true;
    //   });
    //   _controller?.scrollBy(0, 20);
    // } else {
    //   setState(() {
    //     topScrollBar = false;
    //     botttomScrollBar = false;
    //   });
    // }
  }

  Future<void> tap(double x, double y) async {
    await Future.delayed(const Duration(milliseconds: 200));

    GestureBinding.instance.handlePointerEvent(
      PointerDownEvent(position: Offset(x, y)),
    );
    GestureBinding.instance.handlePointerEvent(
      PointerUpEvent(position: Offset(x, y)),
    );
  }

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

    super.initState();

    if (kDebugMode) print('opening webplayer url ${widget.url}');

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
            _controller!
                .runJavaScriptReturningResult('document.cookie')
                .then((cookies) {
              if (kDebugMode) print("cookie: $cookies");
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    if (_controller?.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (_controller?.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              if (_controller != null) ...[
                KeyboardListener(
                  focusNode: FocusNode(),
                  onKeyEvent: (key) => handleKey(key, context),
                  child: WebViewWidget(controller: _controller!),
                ),
              ],
              Positioned(
                left: posX.toDouble(),
                top: posY.toDouble(),
                child: SvgPicture.asset(
                  'assets/icons/hand-pointer.svg',
                  width: 32,
                  height: 32,
                ),
              ),
              if (isLoading) ...[
                const Center(child: CircularProgressIndicator()),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
