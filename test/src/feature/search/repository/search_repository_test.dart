import 'package:flutter_test/flutter_test.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/feature/search/repository/search_repository.dart';
import '../../../service/api/mock_api_service_impl.dart';
import '../../../service/db/mock_app_db_impl.dart';
import 'mock_search_repository_impl.dart';

void main() {
  group('Test search repository', () {
    test('call getSearchResults and compare its output, pass true ', () async {
      final SearchRepository testRepository =
          MockSearchRepositoryImpl(MockApiServiceImpl(), MockAppDbImpl());
      final actualSearchResult = await testRepository.getSearchResults('');

      final expectedSearchResutDto = SearchResultDto(
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

      expect(actualSearchResult, expectedSearchResutDto);
    });
  });
}
