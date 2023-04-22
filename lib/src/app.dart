import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_bloc.dart';
import 'package:mywiki/src/feature/search/view/search_page.dart';

class MyWikiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Wiki',
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => SearchBloc())],
        child: SearchPage(),
      ),
    );
  }
}
