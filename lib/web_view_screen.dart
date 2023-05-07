import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'features/countries/presentation/components/app_bar.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(showThemeButton: false,),
      body: SizedBox(
        width: double.infinity,
        height: 1000, // Set a fixed height here
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}


// class WebViewScreen extends StatelessWidget {
//   WebViewScreen({Key? key, required this.url}) : super(key: key);
//
//   final String? url;
//   final controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setBackgroundColor(const Color(0x00000000))
//     ..setNavigationDelegate(
//       NavigationDelegate(
//         onProgress: (int progress) {
//           // Update loading bar.
//         },
//         onPageStarted: (String url) {},
//         onPageFinished: (String url) {},
//         onWebResourceError: (WebResourceError error) {},
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('https://www.youtube.com/')) {
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     )
//     ..loadRequest(Uri.parse(url!));
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: WebViewWidget(
//           controller: controller,
//         ),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         height: 400, // Set a fixed height here
//         child: WebViewWidget(
//           controller: controller,
//         ),
//       ),
//     );
//   }
// }
