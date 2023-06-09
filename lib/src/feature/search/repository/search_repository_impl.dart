import 'package:mywiki/src/feature/search/model/search_item_db_helper.dart';
import 'package:mywiki/src/feature/search/model/search_result_collection_item.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/feature/search/repository/search_repository.dart';
import 'package:mywiki/src/service/api/api_service_impl.dart';
import 'package:mywiki/src/service/db/app_db.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(this.apiService, this.appDb);
  @override
  final ApiService apiService;
  @override
  final AppDb appDb;
  @override
  Future<SearchResultDto?> getSearchResults(String searchText) {
    return apiService.getSearchResult(searchText);
  }

  @override
  Future<List<SearchResultCollection>> getAllCached() async {
    return await SearchItemDbHelper(await appDb.getAppDb())
        .getAllSearchResult();
  }

  @override
  Future<void> saveSearchResultCollection(
      SearchResultCollection searchResultCollection) async {
    return await SearchItemDbHelper(await appDb.getAppDb())
        .insert(searchResultCollection);
  }
}
