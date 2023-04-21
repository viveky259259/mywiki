abstract class SearchEvent {}

class SearchUserInputEvent extends SearchEvent {
  final String searchInput;
  SearchUserInputEvent(this.searchInput);
}

class UserSelectSearchItemEvent extends SearchEvent {}
