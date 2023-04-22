import 'package:mywiki/src/feature/search/model/search_result_dto.dart';

abstract class ApiService {
  Future<SearchResultDto?> getSearchResult(String searchText);
}
