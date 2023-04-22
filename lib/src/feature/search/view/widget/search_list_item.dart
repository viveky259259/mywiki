import 'package:flutter/material.dart';
import 'package:mywiki/src/common/constant/app_color.dart';
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
      image = Image.network(
        searchListItem.thumbnail!.source!,
        fit: BoxFit.contain,
      );
    } else {
      image = Image.asset(
        'assets/placeholder.png',
        fit: BoxFit.contain,
      );
    }
    return Card(
      color: AppColor.searchItemBg,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      margin: const EdgeInsets.all(16),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        onTap: () => onTap(),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                AppColor.searchItemBg,
                AppColor.searchItemContentBg
              ])),
          height: 148,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(searchListItem.title ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    SearchItemDescription(searchListItem.terms)
                  ],
                ),
              ),
              Expanded(child: image)
            ],
          ),
        ),
      ),
    );
  }
}
