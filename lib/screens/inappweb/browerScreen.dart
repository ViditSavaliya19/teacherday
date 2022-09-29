import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:teacherday/screens/inappweb/webProvider.dart';

class WebBrowserScreen extends StatefulWidget {
  const WebBrowserScreen({Key? key}) : super(key: key);

  @override
  State<WebBrowserScreen> createState() => _WebBrowserScreenState();
}

class _WebBrowserScreenState extends State<WebBrowserScreen> {
  TextEditingController txtSearch = TextEditingController();
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));
  InAppWebViewController? inAppWebViewController;

  WebProvider? webProviderTrue;
  WebProvider? webProviderFalse;


  @override
  Widget build(BuildContext context) {
    webProviderFalse = Provider.of<WebProvider>(context,listen: false);
    webProviderTrue = Provider.of<WebProvider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: txtSearch,
                    decoration: InputDecoration(hintText: "Search"),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 20,
                    )),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            LinearProgressIndicator(
              color: Colors.purple,
              value: webProviderTrue!.progressWeb.toDouble(),
              backgroundColor: Colors.purple.shade200,
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse(webProviderTrue!.url)),
                onLoadStart: (controller, uri) {
                  inAppWebViewController = controller;
                  webProviderFalse!.changeNewUrl(uri.toString());
                },
                onLoadStop: (controller, uri) {
                  inAppWebViewController = controller;
                  webProviderFalse!.changeNewUrl(uri.toString());
                },
                onLoadError: (controller, uri, code, message) {
                  inAppWebViewController = controller;
                  webProviderFalse!.changeNewUrl(uri.toString());

                },
                onProgressChanged: (controller, progress) {
                  webProviderFalse!.newProgress(progress);
                },

                androidOnPermissionRequest: (controller, _, resources) async {
                  return PermissionRequestResponse(
                      resources: resources,
                      action: PermissionRequestResponseAction.GRANT);
                },
                initialOptions:options,
              ),
            ),
          ],
        ),
      ),
    );
  }
}













