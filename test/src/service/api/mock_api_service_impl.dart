import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/service/api/api_service_impl.dart';

class MockApiServiceImpl implements ApiService {
  @override
  Future<SearchResultDto?> getSearchResult(String searchText) {
    // TODO: implement getSearchResult
    throw UnimplementedError();
  }
}
