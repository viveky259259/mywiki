import 'package:isar/isar.dart';
import 'package:mywiki/src/feature/search/model/search_result_collection_item.dart';
import 'package:path_provider/path_provider.dart';

class AppDb {
  Isar? _isarDb;
  Future<void> initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    _isarDb =
        await Isar.open([SearchResultCollectionSchema], directory: dir.path);
  }

  Future<Isar> getAppDb() async {
    if (_isarDb != null) {
      return _isarDb!;
    }
    await initDb();
    return getAppDb();
  }
}
