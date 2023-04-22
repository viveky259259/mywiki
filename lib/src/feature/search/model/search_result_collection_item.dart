import 'package:isar/isar.dart';

part 'search_result_collection_item.g.dart';

@collection
class SearchResultCollection {
  Id id = Isar.autoIncrement;
  final String searchText;
  List<SearchResultCollectionItem> searchResults;

  SearchResultCollection(this.searchText, this.searchResults);
}

@embedded
class SearchResultCollectionItem {
  final String? title;
  final int? pageId;
  final ThumbnailCollectionItem? thumbnail;
  final TermsCollectionItem? terms;

  SearchResultCollectionItem(
      {this.title, this.pageId, this.thumbnail, this.terms});
}

@embedded
class ThumbnailCollectionItem {
  final String? source;
  final int? width;
  final int? height;
  ThumbnailCollectionItem({this.source, this.height, this.width});
}

@embedded
class TermsCollectionItem {
  final List<String>? description;

  TermsCollectionItem({this.description});
}
