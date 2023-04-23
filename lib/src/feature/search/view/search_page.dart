import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywiki/src/common/constant/app_string.dart';
import 'package:mywiki/src/feature/search/bloc/search_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_event.dart';
import 'package:mywiki/src/feature/search/bloc/search_state.dart';
import 'package:mywiki/src/feature/search/view/widget/cached_result_loaded_widget.dart';
import 'package:mywiki/src/feature/search/view/widget/search_result_loaded_widget.dart';
import 'package:mywiki/src/feature/search/view/widget/search_text_field_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchBloc _searchBloc;

  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of(context)..add(InitialSearchPageLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
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
                    } else if (state is LoadingCachedResult ||
                        state is LoadingSearchResult) {
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
                      return CachedResultLoadedWidget(
                          state.results,
                          (selectedItem) => _searchBloc
                              .add(LoadPreviousSearchResult(selectedItem)));
                    } else if (state is LoadedPreviousSearchResult) {
                      // prevent ui changes while build is going on
                      SchedulerBinding.instance.addPostFrameCallback((_) =>
                          searchTextController.text =
                              state.searchResults.searchText);
                      return SearchResultLoaded(
                          state.searchResults.searchResults);
                    } else {
                      return const Text(
                        AppString.searchResultError,
                        textAlign: TextAlign.center,
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
