import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/model/search_result_collection_item.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';

class SearchResultMapper {
  static List<SearchResultModel>? getSearchResultModelsFromSearchResultDto(
      SearchResultDto dto) {
    List<SearchResultModel>? searchResultModels = dto.query?.searchResult
        ?.map((each) => SearchResultModel(
            pageId: each.pageid,
            title: each.title,
            terms: each.terms != null
                ? getTermsModelFromTermsDto(each.terms!)
                : null,
            thumbnail: each.thumbnail != null
                ? getThumbnailModelFromThumbnailDto(each.thumbnail!)
                : null))
        .toList();
    return searchResultModels;
  }

  static ThumbnailModel getThumbnailModelFromThumbnailDto(Thumbnail dto) {
    return ThumbnailModel(
        height: dto.height, source: dto.source, width: dto.width);
  }

  static TermsModel getTermsModelFromTermsDto(Terms terms) {
    return TermsModel(description: terms.description?.toList());
  }

  static List<SearchResultModels> getSearchResultsFromSearchResultCollections(
      List<SearchResultCollection> collections) {
    return collections
        .map((e) => SearchResultModels(
            e.searchText,
            getSearchResultModelsFromSearchResultCollectionItems(
                e.searchResults)))
        .toList();
  }

  static List<SearchResultModel>
      getSearchResultModelsFromSearchResultCollectionItems(
          List<SearchResultCollectionItem> items) {
    List<SearchResultModel>? searchResultModels = items
        .map((each) => SearchResultModel(
            pageId: each.pageId,
            title: each.title,
            terms: each.terms != null
                ? getTermsModelFromTermsCollectionItem(each.terms!)
                : null,
            thumbnail: each.thumbnail != null
                ? getThumbnailModelFromThumbnailCollectionItem(each.thumbnail!)
                : null))
        .toList();
    return searchResultModels;
  }

  static ThumbnailModel getThumbnailModelFromThumbnailCollectionItem(
      ThumbnailCollectionItem dto) {
    return ThumbnailModel(
        height: dto.height, source: dto.source, width: dto.width);
  }

  static TermsModel getTermsModelFromTermsCollectionItem(
      TermsCollectionItem terms) {
    return TermsModel(description: terms.description?.toList());
  }

  static SearchResultCollection getSearchResultCollectionFromSearchResults(
      String searchText, List<SearchResultModel> searchResults) {
    return SearchResultCollection(searchText,
        getSearchResultCollectionItemFromSearchResultItems(searchResults));
  }

  static List<SearchResultCollectionItem>
      getSearchResultCollectionItemFromSearchResultItems(
          List<SearchResultModel> searchResults) {
    return searchResults
        .map((e) => SearchResultCollectionItem(
            pageId: e.pageId,
            title: e.title,
            terms: e.terms == null
                ? null
                : getTermsCollectionItemFromTermsModel(e.terms!),
            thumbnail: e.thumbnail == null
                ? null
                : getThumbnailCollectionItemFromThumbnailModel(e.thumbnail!)))
        .toList();
  }

  static ThumbnailCollectionItem getThumbnailCollectionItemFromThumbnailModel(
      ThumbnailModel model) {
    return ThumbnailCollectionItem(
        height: model.height, source: model.source, width: model.width);
  }

  static TermsCollectionItem getTermsCollectionItemFromTermsModel(
      TermsModel terms) {
    return TermsCollectionItem(description: terms.description?.toList());
  }
}
