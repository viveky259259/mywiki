import 'package:isar/isar.dart';
import 'package:mywiki/src/service/db/app_db.dart';

class MockAppDbImpl extends AppDb{
  @override
  Future<Isar> getAppDb() {
    // TODO: implement getAppDb
    throw UnimplementedError();
  }

  @override
  Future<void> initDb() {
    // TODO: implement initDb
    throw UnimplementedError();
  }
  
}