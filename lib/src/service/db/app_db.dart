import 'package:isar/isar.dart';

abstract class AppDb {
  Future<void> initDb();

  Future<Isar> getAppDb();
}
