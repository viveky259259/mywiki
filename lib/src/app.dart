import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mywiki/src/common/constant/app_string.dart';
import 'package:mywiki/src/feature/search/bloc/search_bloc.dart';
import 'package:mywiki/src/feature/search/repository/search_repository.dart';
import 'package:mywiki/src/feature/search/view/search_page.dart';

class MyWikiApp extends StatelessWidget {
  const MyWikiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) =>
                  SearchBloc(KiwiContainer().resolve<SearchRepository>()))
        ],
        child: const SearchPage(),
      ),
    );
  }
}
