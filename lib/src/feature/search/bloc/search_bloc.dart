import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywiki/src/feature/search/bloc/search_event.dart';
import 'package:mywiki/src/feature/search/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState()) {
    on<SearchUserInputEvent>(onSearchUserInputEvent);
    on<UserSelectSearchItemEvent>(onSearchUserInputEvent);
  }

  void onSearchUserInputEvent(event, emit) {}
  void onUserSelectSearchItemEvent(event, emit) {}
}
