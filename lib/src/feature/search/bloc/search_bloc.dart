import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_event.dart';
import 'package:mywiki/src/feature/search/bloc/search_state.dart';
import 'package:mywiki/src/feature/search/mapper/search_result_mapper.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/feature/search/repository/search_repository.dart';
import 'package:mywiki/src/service/api/api_service.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState()) {
    on<SearchUserInputEvent>(onSearchUserInputEvent);
    on<UserSelectSearchItemEvent>(onUserSelectSearchItemEvent);
  }

  SearchRepository _searchRepository = SearchRepository(ApiService());

  void onSearchUserInputEvent(SearchUserInputEvent event, emit) async {
    emit(LoadingSearchResult());

    SearchResultDto? searchResponse =
        await _searchRepository.getSearchResults(event.searchInput);
    if (searchResponse != null) {
      List<SearchResultModel>? results =
          SearchResultMapper.getSearchResultModelsFromSearchResultDto(
              searchResponse);
      if (results != null) {
        emit(LoadedSearchResult(results));
      }
    } else {
      emit(ErrorLoadingSearchResult());
    }
  }

  void onUserSelectSearchItemEvent(event, emit) {}
}
