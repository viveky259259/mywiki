import 'package:mywiki/src/feature/search/model/search_result.dart';

abstract class SearchState {}

class InitialState extends SearchState {}

class LoadingCachedResult extends SearchState {}

class LoadedCachedResult extends SearchState {
  List<SearchResultModels> results;
  LoadedCachedResult(this.results);
}

class LoadingSearchResult extends SearchState {}

class LoadedSearchResult extends SearchState {
  List<SearchResultModel> results;
  LoadedSearchResult(this.results);
}

class ErrorLoadingSearchResult extends SearchState {}

class LoadedPreviousSearchResult extends SearchState {
  SearchResultModels searchResults;
  LoadedPreviousSearchResult(this.searchResults);
}
