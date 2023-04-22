import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywiki/src/common/constant/app_string.dart';
import 'package:mywiki/src/feature/search/bloc/search_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_event.dart';
import 'package:mywiki/src/feature/search/bloc/search_state.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/view/widget/search_list_item.dart';
import 'package:mywiki/src/feature/search/view/widget/search_result_loaded_widget.dart';
import 'package:mywiki/src/feature/search/view/widget/search_text_field.dart';
import 'package:mywiki/src/feature/wiki_page/view/wiki_page.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  late SearchBloc _searchBloc;
  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _searchBloc = BlocProvider.of(context)..add(InitialSearchPageLoadEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(AppString.appName),
        actions: [
          IconButton(
              onPressed: () {
                _searchBloc.add(InitialSearchPageLoadEvent());
              },
              icon: const Icon(Icons.home_filled))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 48,
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.all(16),
            child: SearchTextField(
                (searchText) =>
                    _searchBloc.add(SearchUserInputEvent(searchText)),
                searchTextController),
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
                      return SearchResultLoaded(state.results);
                    } else if (state is LoadedCachedResult) {
                      SchedulerBinding.instance.addPostFrameCallback(
                          (_) => searchTextController.text = '');
                      if (state.results.isEmpty) {
                        return const Text(AppString.welcomeText);
                      }
                      return Material(
                        color: Colors.black,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              AppString.previousSearchText,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        color: Colors.white54,
                                      ),
                                  itemBuilder: (context, index) => ListTile(
                                        onTap: () {
                                          _searchBloc.add(
                                              LoadPreviousSearchResult(
                                                  state.results[index]));
                                        },
                                        textColor: Colors.white,
                                        title: Text(
                                            state.results[index].searchText),
                                        subtitle: Text(
                                            '${state.results[index].searchResults.length} results'),
                                      ),
                                  itemCount: state.results.length),
                            )
                          ],
                        ),
                      );
                    } else if (state is LoadedPreviousSearchResult) {
                      SchedulerBinding.instance.addPostFrameCallback((_) =>
                          searchTextController.text =
                              state.searchResults.searchText);
                      return SearchResultLoaded(
                          state.searchResults.searchResults);
                    } else {
                      return const Text(AppString.searchResultError);
                    }
                  }))
        ],
      ),
    );
  }
}
