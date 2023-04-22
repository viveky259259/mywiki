import 'package:kiwi/kiwi.dart';
import 'package:mywiki/src/feature/search/repository/search_repository.dart';
import 'package:mywiki/src/service/api/api_service.dart';
import 'package:mywiki/src/service/db/app_db.dart';

class AppDependencyInjectionService {
  AppDependencyInjectionService._();

  static AppDependencyInjectionService getInstance() =>
      AppDependencyInjectionService._();

  void init() {
    KiwiContainer diContainer = KiwiContainer();
    AppDb appDb = AppDb();
    diContainer.registerSingleton((container) => appDb);
    diContainer.registerSingleton(
        (container) => SearchRepository(ApiService(), appDb));
  }
}
