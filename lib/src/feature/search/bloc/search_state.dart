import 'package:mywiki/src/feature/search/model/search_result.dart';

abstract class SearchState {}

class InitialState extends SearchState {}

class LoadingCachedResult extends SearchState {}

class LoadingSearchResult extends SearchState {}

class LoadedSearchResult extends SearchState {
  List<SearchResult> results;
  LoadedSearchResult(this.results);
}
