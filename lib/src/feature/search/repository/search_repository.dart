import 'package:mywiki/src/feature/search/model/search_result_collection_item.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/service/api/api_service_impl.dart';
import 'package:mywiki/src/service/db/app_db.dart';

abstract class SearchRepository {
  SearchRepository(this.apiService, this.appDb);
  final ApiService apiService;
  final AppDb appDb;
  Future<SearchResultDto?> getSearchResults(String searchText);

  Future<List<SearchResultCollection>> getAllCached();

  Future<void> saveSearchResultCollection(
      SearchResultCollection searchResultCollection);
}
