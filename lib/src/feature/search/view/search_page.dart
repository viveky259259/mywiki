import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywiki/src/common/constant/app_string.dart';
import 'package:mywiki/src/feature/search/bloc/search_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_event.dart';
import 'package:mywiki/src/feature/search/bloc/search_state.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/view/widget/search_list_item.dart';
import 'package:mywiki/src/feature/search/view/widget/search_text_field.dart';
import 'package:mywiki/src/feature/wiki_page/view/wiki_page.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  late SearchBloc _searchBloc;
  @override
  Widget build(BuildContext context) {
    _searchBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(AppString.appName),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 48,
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.all(16),
            child: SearchTextField((searchText) =>
                _searchBloc.add(SearchUserInputEvent(searchText))),
          ),
          Flexible(
              child: BlocBuilder<SearchBloc, SearchState>(
                  bloc: _searchBloc,
                  builder: (context, state) {
                    if (state is InitialState) {
                      return const Text(AppString.searchAboveText);
                    } else if (state is LoadingCachedResult) {
                      return const CircularProgressIndicator(
                        color: Colors.red,
                      );
                    } else if (state is LoadingSearchResult) {
                      return const CircularProgressIndicator(
                        color: Colors.red,
                      );
                    } else if (state is LoadedSearchResult) {
                      return Material(
                        color: Colors.black,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            SearchResultModel searchResultModel =
                                state.results[index];
                            return SearchListItem(
                              searchResultModel,
                              () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        WikiPage(searchResultModel)));
                              },
                            );
                          },
                          itemCount: state.results.length,
                        ),
                      );
                    } else {
                      return const Text(AppString.searchResultError);
                    }
                  }))
        ],
      ),
    );
  }
}
