import 'package:flutter/material.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/view/widget/search_list_item.dart';
import 'package:mywiki/src/feature/wiki_page/view/wiki_page.dart';

class SearchResultLoaded extends StatelessWidget {
  const SearchResultLoaded(this.results, {super.key});
  final List<SearchResultModel> results;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: ListView.builder(
        itemBuilder: (context, index) {
          SearchResultModel searchResultModel = results[index];
          return SearchListItem(
            searchResultModel,
            () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => WikiPage(searchResultModel)));
            },
          );
        },
        itemCount: results.length,
      ),
    );
  }
}
