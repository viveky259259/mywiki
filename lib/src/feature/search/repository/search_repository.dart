import 'package:mywiki/src/feature/search/model/search_item_db_helper.dart';
import 'package:mywiki/src/feature/search/model/search_result_collection_item.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/feature/search/view/widget/search_list_item.dart';
import 'package:mywiki/src/service/api/api_service.dart';
import 'package:mywiki/src/service/db/app_db.dart';

class SearchRepository {
  SearchRepository(this.apiService, this.appDb);
  final ApiService apiService;
  final AppDb appDb;
  Future<SearchResultDto?> getSearchResults(String searchText) {
    return apiService.getSearchResult(searchText);
  }

  Future<List<SearchResultCollection>> getAllCached() async {
    return await SearchItemDbHelper(await appDb.getAppDb())
        .getAllSearchResult();
  }

  Future<void> saveSearchResultCollection(
      SearchResultCollection searchResultCollection) async {
    return await SearchItemDbHelper(await appDb.getAppDb())
        .insert(searchResultCollection);
  }
}
