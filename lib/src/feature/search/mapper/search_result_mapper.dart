import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';

class SearchResultMapper {
  static List<SearchResultModel>? getSearchResultModelsFromSearchResultDto(
      SearchResultDto dto) {
    List<SearchResultModel>? searchResultModels = dto.query?.searchResult
        ?.map((each) => SearchResultModel(
            pageId: each.pageid,
            size: each.size,
            snippet: each.snippet,
            title: each.title,
            wordCount: each.wordcount))
        .toList();

    return searchResultModels;
  }
}
