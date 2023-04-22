import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_event.dart';
import 'package:mywiki/src/feature/search/bloc/search_state.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:mywiki/src/feature/search/view/widget/search_item_description.dart';
import 'package:mywiki/src/feature/search/view/widget/search_list_item.dart';
import 'package:mywiki/src/feature/search/view/widget/search_text_field.dart';
import 'package:mywiki/src/feature/wiki_page/view/wiki_page.dart';
import 'package:mywiki/src/service/api/api_constants.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  late SearchBloc _searchBloc;
  @override
  Widget build(BuildContext context) {
    _searchBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('My Wiki App'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 48,
            margin: EdgeInsets.symmetric(vertical: 16),
            padding: EdgeInsets.all(16),
            child: SearchTextField((searchText) =>
                _searchBloc.add(SearchUserInputEvent(searchText))),
          ),
          Flexible(
              child: BlocBuilder<SearchBloc, SearchState>(
                  bloc: _searchBloc,
                  builder: (context, state) {
                    if (state is InitialState) {
                      return Text("Search above");
                    } else if (state is LoadingCachedResult) {
                      return CircularProgressIndicator();
                    } else if (state is LoadingSearchResult) {
                      return CircularProgressIndicator();
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
                      return Text('something went wrong');
                    }
                  }))
        ],
      ),
    );
  }
}
