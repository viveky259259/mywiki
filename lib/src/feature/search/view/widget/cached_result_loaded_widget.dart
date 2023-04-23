import 'package:flutter/material.dart';
import 'package:mywiki/src/common/constant/app_string.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';

class CachedResultLoadedWidget extends StatelessWidget {
  const CachedResultLoadedWidget(this.results, this.onItemTap, {super.key});
  final Function(SearchResultModels) onItemTap;
  final List<SearchResultModels> results;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            AppString.previousSearchText,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                      color: Colors.white54,
                    ),
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        onItemTap(results[index]);
                      },
                      textColor: Colors.white,
                      title: Text(results[index].searchText),
                      subtitle: Text(
                          '${results[index].searchResults.length} results'),
                    ),
                itemCount: results.length),
          )
        ],
      ),
    );
  }
}
