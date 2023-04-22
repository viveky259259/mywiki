import 'package:mywiki/src/feature/search/model/search_result.dart';

abstract class SearchEvent {}

class InitialSearchPageLoadEvent extends SearchEvent {}

class SearchUserInputEvent extends SearchEvent {
  final String searchInput;
  SearchUserInputEvent(this.searchInput);
}

class LoadPreviousSearchResult extends SearchEvent {
  final SearchResultModels searchResults;
  LoadPreviousSearchResult(this.searchResults);
}
