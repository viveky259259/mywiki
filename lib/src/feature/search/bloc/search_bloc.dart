import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_event.dart';
import 'package:mywiki/src/feature/search/bloc/search_state.dart';
import 'package:mywiki/src/feature/search/mapper/search_result_mapper.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/model/search_result_collection_item.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';
import 'package:mywiki/src/feature/search/repository/search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchRepository) : super(InitialState()) {
    on<SearchUserInputEvent>(onSearchUserInputEvent);

    on<InitialSearchPageLoadEvent>(onInitialSearchPageLoadEvent);
    on<LoadPreviousSearchResult>(onLoadPreviousSearchResult);
  }

  final SearchRepository searchRepository;

  void onSearchUserInputEvent(SearchUserInputEvent event, emit) async {
    if (event.searchInput.isEmpty) {
      emit(InitialState());
      return;
    }
    emit(LoadingSearchResult());

    try {
      SearchResultDto? searchResponse =
          await searchRepository.getSearchResults(event.searchInput);
      if (searchResponse != null) {
        List<SearchResultModel>? results =
            SearchResultMapper.getSearchResultModelsFromSearchResultDto(
                searchResponse);
        if (results != null) {
          searchRepository.saveSearchResultCollection(
              SearchResultMapper.getSearchResultCollectionFromSearchResults(
                  event.searchInput, results));
          emit(LoadedSearchResult(results));
        }
      } else {
        emit(ErrorLoadingSearchResult());
      }
    } catch (e) {
      emit(ErrorLoadingSearchResult());
    }
  }

  void onInitialSearchPageLoadEvent(event, emit) async {
    emit(LoadingCachedResult());

    List<SearchResultCollection> cachedResults =
        await searchRepository.getAllCached();

    List<SearchResultModels> results =
        SearchResultMapper.getSearchResultsFromSearchResultCollections(
            cachedResults);

    emit(LoadedCachedResult(results));
  }

  void onLoadPreviousSearchResult(LoadPreviousSearchResult event, emit) {
    emit(LoadedPreviousSearchResult(event.searchResults));
  }
}
