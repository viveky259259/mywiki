import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_event.dart';
import 'package:mywiki/src/feature/search/bloc/search_state.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:html/parser.dart' as htmlParser;

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final SearchBloc _searchBloc = SearchBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SearchBloc, SearchState>(
          bloc: _searchBloc,
          builder: (context, state) {
            if (state is InitialState) {
              return ElevatedButton(
                  onPressed: () {
                    _searchBloc.add(SearchUserInputEvent('Vivek'));
                  },
                  child: Text('Search Vivek'));
            } else if (state is LoadingCachedResult) {
              return CircularProgressIndicator();
            } else if (state is LoadingSearchResult) {
              return CircularProgressIndicator();
            } else if (state is LoadedSearchResult) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  SearchResultModel searchResultModel = state.results[index];
                  return ListTile(
                    title: Text(searchResultModel?.title ?? ''),
                    subtitle: Text(htmlParser
                        .parse(searchResultModel?.snippet ?? '')
                        .toString()),
                  );
                },
                itemCount: state.results.length,
              );
            } else {
              return Text('something went wrong');
            }
          }),
    );
  }
}
