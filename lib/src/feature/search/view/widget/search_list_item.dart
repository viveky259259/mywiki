import 'package:flutter/material.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/view/widget/search_item_description.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem(this.searchListItem, this.onTap, {super.key});
  final SearchResultModel searchListItem;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    Widget image;
    if (searchListItem.thumbnail?.source != null) {
      image = Image.network(searchListItem.thumbnail!.source!);
    } else {
      image = Image.asset('assets/placeholder.png');
    }
    return ListTile(
      leading: image,
      title: Text(searchListItem.title ?? ''),
      subtitle: SearchItemDescription(searchListItem.terms),
      onTap: () => onTap(),
    );
  }
}
