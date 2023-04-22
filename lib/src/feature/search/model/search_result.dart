class SearchResultModels {
  final String searchText;
  final List<SearchResultModel> searchResults;

  SearchResultModels(this.searchText, this.searchResults);
}

class SearchResultModel {
  final String? title;
  final int? pageId;
  final ThumbnailModel? thumbnail;
  final TermsModel? terms;
  SearchResultModel({this.title, this.pageId, this.thumbnail, this.terms});
}

class ThumbnailModel {
  final String? source;
  final int? width;
  final int? height;
  ThumbnailModel({this.source, this.height, this.width});
}

class TermsModel {
  final List<String>? description;

  TermsModel({this.description});
}
