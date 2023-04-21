import 'package:flutter/material.dart';
import 'package:mywiki/src/feature/search/view/search_page.dart';

class MyWikiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Wiki',
      home: SearchPage(),
    );
  }
}
