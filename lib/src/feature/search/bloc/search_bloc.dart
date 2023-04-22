import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_event.dart';
import 'package:mywiki/src/feature/search/bloc/search_state.dart';
import 'package:mywiki/src/feature/search/mapper/search_result_mapper.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/feature/search/repository/search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchRepository) : super(InitialState()) {
    on<SearchUserInputEvent>(onSearchUserInputEvent);
    on<UserSelectSearchItemEvent>(onUserSelectSearchItemEvent);
  }

  final SearchRepository searchRepository;

  void onSearchUserInputEvent(SearchUserInputEvent event, emit) async {
    if (event.searchInput.isEmpty) {
      emit(InitialState());
      return;
    }
    emit(LoadingSearchResult());

    SearchResultDto? searchResponse =
        await searchRepository.getSearchResults(event.searchInput);
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
