import 'package:isar/isar.dart';
import 'package:mywiki/src/feature/search/model/search_result_collection_item.dart';

class SearchItemDbHelper {
  SearchItemDbHelper(this.isarDb);
  final Isar isarDb;

  Future<void> insert(SearchResultCollection searchItem) {
    return isarDb.writeTxn(() async {
      await isarDb.searchResultCollections.put(searchItem);
    });
  }

  Future<void> clearAll() {
    return isarDb.writeTxn(() async {
      await isarDb.searchResultCollections.clear();
    });
  }

  Future<List<SearchResultCollection>> getAllSearchResult() async {
    List<SearchResultCollection> searchItems =
        await isarDb.searchResultCollections.where(sort: Sort.desc).findAll();

    return searchItems;
  }
}
