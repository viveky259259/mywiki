import 'package:isar/isar.dart';
import 'package:mywiki/src/feature/search/model/search_result_collection_item.dart';
import 'package:mywiki/src/service/db/app_db.dart';
import 'package:path_provider/path_provider.dart';

class AppDbImpl extends AppDb {
  Isar? _isarDb;

  @override
  Future<void> initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    _isarDb =
        await Isar.open([SearchResultCollectionSchema], directory: dir.path);
  }

  @override
  Future<Isar> getAppDb() async {
    if (_isarDb != null) {
      return _isarDb!;
    }
    await initDb();
    return getAppDb();
  }
}
