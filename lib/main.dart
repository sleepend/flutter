import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Browser(url:"https://baidu.com",title: 'Flutter Demo Home Page'),
    );
    // return const Browser(url: "https://baidu.com",title: "",);
  }
}

class Browser extends StatefulWidget {
  const Browser({super.key,required this.url, required this.title}) ;//: super(key: key);

  final String url;
  final String title;

  @override
  State<StatefulWidget> createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: InAppWebView(
        key: webViewKey,
        initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
        initialOptions: options,
      ),
    );
  }
}
