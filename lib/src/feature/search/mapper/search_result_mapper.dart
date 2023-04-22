import 'package:mywiki/src/feature/search/model/search_result.dart';
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
}
