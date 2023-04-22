import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/feature/search/model/search_result_collection_item.dart';
import 'package:mywiki/src/feature/search/repository/search_repository.dart';
import 'package:mywiki/src/service/api/api_service_impl.dart';
import 'package:mywiki/src/service/db/app_db.dart';

class MockSearchRepositoryImpl implements SearchRepository {
  MockSearchRepositoryImpl(this.apiService, this.appDb);

  @override
  final ApiService apiService;
  @override
  final AppDb appDb;

  @override
  Future<List<SearchResultCollection>> getAllCached() {
    // TODO: implement getAllCached
    throw UnimplementedError();
  }

  @override
  Future<SearchResultDto?> getSearchResults(String searchText) async {
    return SearchResultDto(
        batchcomplete: true,
        continuePage: ContinuePage(sroffset: 1, continueString: ''),
        query: Query(searchinfo: Searchinfo(), searchResults: [
          SearchResult(
              ns: 1,
              pageid: 1,
              timestamp: 'test',
              title: 'test',
              terms: Terms(
                description: ['test'],
              ),
              thumbnail: Thumbnail(source: 'test', width: 10, height: 10)),
        ]));
  }

  @override
  Future<void> saveSearchResultCollection(
      SearchResultCollection searchResultCollection) {
    // TODO: implement saveSearchResultCollection
    throw UnimplementedError();
  }
}
