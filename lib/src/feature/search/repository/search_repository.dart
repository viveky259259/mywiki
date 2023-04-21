import 'package:mywiki/src/feature/search/mapper/search_result_mapper.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/service/api/api_service.dart';

class SearchRepository {
  SearchRepository(this.apiService);
  final ApiService apiService;
  Future<SearchResultDto?> getSearchResults(String searchText) {
    return apiService.getSearchResult(searchText);
  }
}
