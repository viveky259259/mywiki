import 'package:flutter/material.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/service/api/api_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiPage extends StatefulWidget {
  final SearchResultModel searchResultModel;

  const WikiPage(this.searchResultModel, {super.key});

  @override
  State<WikiPage> createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  late WebViewController controller;
  int loadingProgress = 0;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) => setState(() {
          loadingProgress = progress;
        }),
        onPageStarted: (_) => setState(() {
          loadingProgress = 0;
        }),
        onPageFinished: (_) => setState(() {
          loadingProgress = 100;
        }),
      ))
      ..loadRequest(Uri.parse(getUrl()));
  }

  String getUrl() {
    return '${ApiConstant.baseWikiPageUrl}${widget.searchResultModel.pageId}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.searchResultModel.title ?? ''),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (loadingProgress < 100)
            const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            )),
        ],
      ),
    );
  }
}
