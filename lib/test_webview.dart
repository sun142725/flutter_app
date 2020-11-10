import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
class TestWebview extends StatefulWidget{
  _TestWebviewState createState () => new _TestWebviewState();
}
class _TestWebviewState extends State<TestWebview> {
  var filePath = "assets/file/reffer.html";
  WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
//    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WebView(
      initialUrl: "",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) {
      //页面加载的时候可以获取到controller可以用来reload等操作
        _webViewController = controller;
//        _loadHtmlFromAssets();
        controller.loadUrl("https://wx.tenpay.com/cgi-bin/mmpayweb-bin/checkmweb?prepay_id=wx09175921015845cb856baed1486e7e0000&package=4198195728&redirect_url=https://uat-h5patient.dr-elephant.net/myOrder/success_payment?doctorCode=15921589007&orderTypeCode=40&orderNumber=Z202011091759198397497&queueCode=TWZX20201109000000006", headers: {
          "Referer":"https://uat-h5patient.dr-elephant.net",
          "Cookie": 'name=home'
        });
      },
        navigationDelegate: (NavigationRequest request) async{
          var url = request.url;
          print('拦截URL = $url');
          if(url.startsWith("weixin://wap/pay?"))
          {
            await launch(url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
  );
  }
  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString(), headers: {
      "Referer":"https://uat-h5patient.dr-elephant.net",
      "referrer": "1234455",
      "Cookie": 'name=home'
    });
  }
}