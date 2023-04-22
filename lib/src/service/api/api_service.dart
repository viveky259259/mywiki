import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/service/api/api_constants.dart';

class ApiService {
  Future<SearchResultDto?> getSearchResult(String searchText) async {
    SearchResultDto? searchResult;
    String url =
        ApiConstant.baseSearchUrl + searchText + ApiConstant.endSearchUrl;
    Uri searchUri = Uri.parse(url);
    dynamic result = await http.get(searchUri);
    if (result.body != null) {
      searchResult = SearchResultDto.fromJson(json.decode(result.body));
    }
    return searchResult;
  }
}
